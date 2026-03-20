// ============================================================================
//  drivers/dht22.c — Driver DHT22 via 1-wire, sem RTOS
//
//  Protocolo:
//    1. Host: pull-down >1 ms, depois libera (high)
//    2. Sensor: pull-down ~80 µs, pull-up ~80 µs
//    3. 40 bits: cada bit começa com ~50 µs low;
//                high < 30 µs = bit 0, high > 50 µs = bit 1
//    4. 5 bytes: [RH_hi][RH_lo][T_hi][T_lo][checksum]
// ============================================================================

#include "dht22.h"
#include "config.h"
#include "pico/stdlib.h"
#include "hardware/gpio.h"
#include "hardware/sync.h"
#include <stdio.h>

#define TIMEOUT_US  100

// Aguarda o pino atingir `level`. Retorna duração em µs ou -1 em timeout.
static int wait_level(uint pin, bool level) {
    uint32_t start = time_us_32();
    while ((bool)gpio_get(pin) != level) {
        if ((uint32_t)(time_us_32() - start) > TIMEOUT_US)
            return -1;
    }
    return (int)(time_us_32() - start);
}

// ── API pública ───────────────────────────────────────────────────────────────

void dht22_init(void) {
    gpio_init(DHT22_PIN);
    gpio_set_dir(DHT22_PIN, GPIO_IN);
    gpio_pull_up(DHT22_PIN);
}

bool dht22_read(Dht22Data *out) {
    // ── Sinal de início: pull-down por 2 ms ──────────────────────────────────
    gpio_set_dir(DHT22_PIN, GPIO_OUT);
    gpio_put(DHT22_PIN, 0);
    sleep_ms(2);
    gpio_put(DHT22_PIN, 1);
    sleep_us(30);
    gpio_set_dir(DHT22_PIN, GPIO_IN);
    gpio_pull_up(DHT22_PIN);

    // ── Resposta do sensor ────────────────────────────────────────────────────
    // Desabilita IRQs durante a leitura para não perder os pulsos de ~26-70 µs
    uint32_t irq_state = save_and_disable_interrupts();

    if (wait_level(DHT22_PIN, 0) < 0) goto timeout;   // ~80 µs low
    if (wait_level(DHT22_PIN, 1) < 0) goto timeout;   // ~80 µs high
    if (wait_level(DHT22_PIN, 0) < 0) goto timeout;   // início do 1º bit

    // ── Leitura de 40 bits ────────────────────────────────────────────────────
    uint8_t data[5] = {0};
    for (int i = 0; i < 40; i++) {
        if (wait_level(DHT22_PIN, 1) < 0) goto timeout;  // wait high (início do bit)
        int t = wait_level(DHT22_PIN, 0);                 // mede duração do high
        if (t < 0) goto timeout;
        if (t > 40)   // ~26 µs = 0, ~70 µs = 1; threshold 40 µs
            data[i / 8] |= (1 << (7 - (i % 8)));
    }

    restore_interrupts(irq_state);

    // ── Checksum ──────────────────────────────────────────────────────────────
    uint8_t sum = data[0] + data[1] + data[2] + data[3];
    if (sum != data[4]) {
        printf("[DHT22] Checksum erro: calc=%02X recv=%02X\n", sum, data[4]);
        return false;
    }

    // ── Decodificação ─────────────────────────────────────────────────────────
    uint16_t rh_raw  = ((uint16_t)data[0] << 8) | data[1];
    uint16_t t_raw   = ((uint16_t)data[2] << 8) | data[3];

    out->humidity    = rh_raw / 10.0f;
    out->temperature = (t_raw & 0x8000) ? -(int16_t)(t_raw & 0x7FFF) / 10.0f
                                        :  t_raw / 10.0f;

    return true;

timeout:
    restore_interrupts(irq_state);
    printf("[DHT22] Timeout\n");
    return false;
}
