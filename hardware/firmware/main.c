// ============================================================================
//  main.c — RFID Stick Firmware
//
//  Máquina de estados principal:
//
//    BOOT → WIFI_CONNECTING → MQTT_CONNECTING → MENU
//                                                  ↓ tag lida
//                                              RFID_EVENT → MENU
//
//  Pinout (compatível com bitdoglab_wifi + bitdoglab_rfid + bitdoglab_menu):
//    OLED I2C1 : SDA=GPIO14, SCL=GPIO15
//    RFID UART0: RX=GPIO17
//    Joystick  : VRx=GPIO26, VRy=GPIO27, BTN=GPIO22
//    Button A  : GPIO5
//    LED RGB   : R=GPIO13, G=GPIO11, B=GPIO12
//    Buzzer    : GPIO21
// ============================================================================

#include <stdio.h>
#include <string.h>
#include "pico/stdlib.h"
#include "hardware/pwm.h"
#include "hardware/clocks.h"

#include "config.h"
#include "app/app_state.h"
#include "drivers/rfid.h"
#include "drivers/wifi_driver.h"
#include "drivers/display.h"
#include "drivers/time_util.h"
#include "drivers/dht22.h"
#include "drivers/time_util.h"
#include "menu/menu.h"
#include "mqtt/mqtt_client.h"
#include "payload/payload.h"

// ── Estados da máquina principal ─────────────────────────────────────────────
typedef enum {
    STATE_WIFI_CONNECTING,
    STATE_MENU,
    STATE_RFID_EVENT,
    STATE_ERROR,
} SystemState;

// ── Hardware: LED RGB e Buzzer ────────────────────────────────────────────────

static void led_set(bool r, bool g, bool b) {
    gpio_put(LED_R_PIN, r);
    gpio_put(LED_G_PIN, g);
    gpio_put(LED_B_PIN, b);
}

static void buzzer_tone(uint freq_hz, uint ms) {
    if (freq_hz == 0) { gpio_put(BUZZER_PIN, 0); return; }
    uint32_t wrap  = clock_get_hz(clk_sys) / freq_hz - 1;
    uint     slice = pwm_gpio_to_slice_num(BUZZER_PIN);
    pwm_set_wrap(slice, wrap);
    pwm_set_chan_level(slice, pwm_gpio_to_channel(BUZZER_PIN), wrap / 2);
    pwm_set_enabled(slice, true);
    sleep_ms(ms);
    pwm_set_enabled(slice, false);
}

static void beep_ok(void) {
    buzzer_tone(880,  80);
    sleep_ms(40);
    buzzer_tone(1320, 80);
    sleep_ms(40);
    buzzer_tone(1760, 120);
}

static void beep_error(void) {
    buzzer_tone(330, 200);
    sleep_ms(80);
    buzzer_tone(220, 300);
}

static void hw_init(void) {
    gpio_init(LED_R_PIN); gpio_set_dir(LED_R_PIN, GPIO_OUT);
    gpio_init(LED_G_PIN); gpio_set_dir(LED_G_PIN, GPIO_OUT);
    gpio_init(LED_B_PIN); gpio_set_dir(LED_B_PIN, GPIO_OUT);
    led_set(false, false, false);

    gpio_set_function(BUZZER_PIN, GPIO_FUNC_PWM);
}

// ─────────────────────────────────────────────────────────────────────────────

int main(void) {
    stdio_init_all();
    sleep_ms(1500);  // aguarda USB enumerar
    printf("\n========== RFID Stick Boot ==========\n");

    hw_init();
    display_init();
    app_state_init();

    MenuState    menu;
    menu_init(&menu);
    rfid_init();
    dht22_init();

    RfidTag      tag;
    char         payload_buf[PAYLOAD_MAX_LEN];
    uint32_t     anim_last_ms     = 0;
    int          anim_dots        = 0;
    uint32_t     telemetry_last_ms = 0;
#define ANIM_INTERVAL_MS         600

    // ── Boot: mostra splash e inicia WiFi ANTES do loop ───────────────────────
    display_boot();
    led_set(false, false, true);
    sleep_ms(500);

    // Inicializa WiFi aqui — seguro pois cyw43_arch_poll() ainda não foi chamado
    wifi_driver_init();

    SystemState  state = STATE_WIFI_CONNECTING;
    anim_last_ms = to_ms_since_boot(get_absolute_time());

    while (true) {
        // Polling só após init (cyw43_arch_poll em chip não-init causa travamento)
        wifi_driver_poll();

        switch (state) {

        case STATE_WIFI_CONNECTING: {
            // Anima dots para mostrar que está vivo
            uint32_t now_ms = to_ms_since_boot(get_absolute_time());
            if (now_ms - anim_last_ms >= ANIM_INTERVAL_MS) {
                anim_dots = (anim_dots + 1) % 4;
                char dots[5] = "    ";
                for (int i = 0; i < anim_dots; i++) dots[i] = '.';
                char msg[22];
                snprintf(msg, sizeof(msg), "WiFi %s", dots);
                display_connecting(msg, WIFI_SSID);
                anim_last_ms = now_ms;
            }

            if (wifi_driver_status() == WIFI_CONNECTED) {
                printf("[Main] WiFi OK\n");
                time_util_sntp_start();
                led_set(false, true, false);
                beep_ok();
                menu.dirty = true;
                state = STATE_MENU;
                // MQTT será iniciado na primeira iteração do STATE_MENU
            } else if (wifi_driver_status() == WIFI_FAILED) {
                printf("[Main] WiFi falhou — operando offline\n");
                display_error("WiFi falhou! Sem rede.");
                beep_error();
                sleep_ms(2000);
                menu.dirty = true;
                state = STATE_MENU;
            }
            break;
        }

        // ── Menu + leitura RFID ───────────────────────────────────────────────
        case STATE_MENU:
            mqtt_client_poll();

            // Redesenha OLED apenas quando necessário
            if (menu.dirty) {
                if (menu.level == MENU_LEVEL_ACTIVE) {
                    display_active_config(&menu,
                                         wifi_driver_status(),
                                         mqtt_client_status());
                } else {
                    display_menu(&menu);
                    display_status_bar(wifi_driver_status(), mqtt_client_status());
                }
                menu.dirty = false;
            }

            // Navegação do menu
            if (menu_tick(&menu)) {
                // menu_tick já seta menu.dirty = true se mudou
                break;
            }

            // Telemetria periódica (apenas quando Eventos está ativo)
            if (g_app.has_telemetry) {
                uint32_t now_ms = to_ms_since_boot(get_absolute_time());
                if (now_ms - telemetry_last_ms >= TELEMETRY_INTERVAL_MS) {
                    Dht22Data dht;
                    if (dht22_read(&dht)) {
                        char tbuf[96];
                        char ts[32];
                        time_util_get_iso8601(ts, sizeof(ts));
                        snprintf(tbuf, sizeof(tbuf),
                            "{\"stick_id\":\"%s\",\"operator_id\":\"%s\","
                            "\"temperature_c\":%.1f,\"humidity_percent\":%.1f,"
                            "\"timestamp\":\"%s\"}",
                            g_app.stick_id, g_app.operator_id,
                            (double)dht.temperature, (double)dht.humidity, ts);
                        mqtt_send(TELEMETRY_TOPIC, tbuf);
                        printf("[Telemetry] %s\n", tbuf);
                    } else {
                        printf("[DHT22] Leitura falhou\n");
                    }
                    telemetry_last_ms = now_ms;
                }
            }

            // Leitura RFID (não-bloqueante)
            if (app_state_is_ready() && rfid_poll(&tag)) {
                state = STATE_RFID_EVENT;
            }
            break;

        // ── Processa evento RFID ──────────────────────────────────────────────
        case STATE_RFID_EVENT: {
            printf("[RFID] Tag: %s | Action: %s | Topic: %s\n",
                   tag.tag_hex,
                   g_app.mqtt_topic ? g_app.mqtt_topic : "N/A",
                   g_app.mqtt_topic ? g_app.mqtt_topic : "N/A");

            // Mostra feedback no OLED
            const char *alabel = g_app.mqtt_topic ?
                                 strrchr(g_app.mqtt_topic, '/') + 1 : "??";
            display_tag_ok(&tag, alabel);

            // LED laranja durante envio
            led_set(true, true, false);
            buzzer_tone(1100, 60);

            // Envia MQTT para todas as ações com tópico definido
            if (g_app.mqtt_topic) {
                int plen = payload_build(payload_buf, sizeof(payload_buf),
                                         tag.tag_hex, &g_app);
                if (plen > 0) {
                    printf("[Payload] %s\n", payload_buf);
                    bool sent = mqtt_send(g_app.mqtt_topic, payload_buf);
                    if (sent) {
                        led_set(false, true, false);  // verde = enviado
                        beep_ok();
                    } else {
                        led_set(true, false, false);  // vermelho = falha
                        beep_error();
                    }
                }
            }

            sleep_ms(2000);
            rfid_renew_debounce();   // evita re-leitura imediata ao voltar ao menu
            led_set(false, true, false);
            menu.dirty = true;
            state = STATE_MENU;
            break;
        }

        case STATE_ERROR:
            led_set(true, false, false);
            beep_error();
            sleep_ms(5000);
            state = STATE_MENU;
            break;
        }

        sleep_ms(10);
    }

    return 0;
}
