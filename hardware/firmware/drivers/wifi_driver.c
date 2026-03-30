// ============================================================================
//  drivers/wifi_driver.c — Baseado em bitdoglab_wifi_v2 (funcional)
//  Usa cyw43_arch_wifi_connect_async + polling de status
// ============================================================================

#include "wifi_driver.h"
#include "config.h"
#include "pico/stdlib.h"
#include "pico/cyw43_arch.h"
#include <stdio.h>

static WifiStatus s_status   = WIFI_DISCONNECTED;
static uint32_t   s_start_ms = 0;

void wifi_driver_init(void) {
    printf("[WiFi] Inicializando...\n");

    if (cyw43_arch_init()) {
        printf("[WiFi] ERRO: cyw43_arch_init falhou\n");
        s_status = WIFI_FAILED;
        return;
    }

    cyw43_arch_enable_sta_mode();

    // Inicia conexão de forma assíncrona (igual ao bitdoglab_wifi_v2)
    cyw43_arch_wifi_connect_async(WIFI_SSID, WIFI_PASSWORD,
                                  CYW43_AUTH_WPA2_AES_PSK);

    s_status   = WIFI_CONNECTING;
    s_start_ms = to_ms_since_boot(get_absolute_time());
    printf("[WiFi] Conectando a '%s'...\n", WIFI_SSID);
}

WifiStatus wifi_driver_status(void) {
    return s_status;
}

void wifi_driver_poll(void) {
    cyw43_arch_poll();

    if (s_status != WIFI_CONNECTING) return;

    int link = cyw43_tcpip_link_status(&cyw43_state, CYW43_ITF_STA);

    if (link == CYW43_LINK_UP) {
        s_status = WIFI_CONNECTED;
        cyw43_arch_gpio_put(CYW43_WL_GPIO_LED_PIN, 1);
        printf("[WiFi] Conectado! Status: UP\n");
        return;
    }

    if (link == CYW43_LINK_FAIL ||
        link == CYW43_LINK_BADAUTH ||
        link == CYW43_LINK_NONET) {
        s_status = WIFI_FAILED;
        printf("[WiFi] Falha: link=%d\n", link);
        return;
    }

    uint32_t elapsed = to_ms_since_boot(get_absolute_time()) - s_start_ms;
    if (elapsed > WIFI_TIMEOUT_MS) {
        s_status = WIFI_FAILED;
        printf("[WiFi] Timeout apos %lu ms\n", (unsigned long)elapsed);
    }
}

bool wifi_get_ip_str(char *buf, int len) {
    if (s_status != WIFI_CONNECTED) return false;
    uint8_t *ip = (uint8_t *)&cyw43_state.netif[0].ip_addr.addr;
    snprintf(buf, len, "%d.%d.%d.%d", ip[0], ip[1], ip[2], ip[3]);
    return true;
}
