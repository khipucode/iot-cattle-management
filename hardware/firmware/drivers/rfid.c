// ============================================================================
//  drivers/rfid.c — Driver não-bloqueante para RDM6300
// ============================================================================

#include "rfid.h"
#include "config.h"
#include "pico/stdlib.h"
#include "hardware/uart.h"
#include "hardware/gpio.h"
#include <string.h>
#include <stdio.h>

#define FRAME_LEN       14
#define STX             0x02
#define ETX             0x03

// ── Máquina de estados do receptor ───────────────────────────────────────────
typedef enum { RX_WAIT_STX, RX_COLLECT } RxState;

static RxState  s_rx_state   = RX_WAIT_STX;
static uint8_t  s_buf[FRAME_LEN];
static int      s_buf_idx    = 0;

// ── Debounce ──────────────────────────────────────────────────────────────────
static uint32_t s_last_id    = 0xFFFFFFFF;
static uint32_t s_last_ms    = 0;

// ── Helpers ───────────────────────────────────────────────────────────────────
static uint8_t hex_byte(uint8_t hi, uint8_t lo) {
    auto uint8_t nibble(uint8_t c) {
        if (c >= '0' && c <= '9') return c - '0';
        if (c >= 'A' && c <= 'F') return c - 'A' + 10;
        if (c >= 'a' && c <= 'f') return c - 'a' + 10;
        return 0xFF;
    }
    uint8_t h = nibble(hi);
    uint8_t l = nibble(lo);
    if (h == 0xFF || l == 0xFF) return 0xFF;
    return (h << 4) | l;
}

static bool parse_frame(const uint8_t *buf, RfidTag *out) {
    if (buf[0] != STX || buf[FRAME_LEN - 1] != ETX) return false;

    uint8_t data[5];
    for (int i = 0; i < 5; i++) {
        uint8_t b = hex_byte(buf[1 + i * 2], buf[2 + i * 2]);
        if (b == 0xFF) return false;
        data[i] = b;
    }

    uint8_t chk_calc = 0;
    for (int i = 0; i < 5; i++) chk_calc ^= data[i];

    uint8_t chk_recv = hex_byte(buf[11], buf[12]);
    if (chk_recv == 0xFF || chk_calc != chk_recv) return false;

    out->version = data[0];
    out->tag_id  = ((uint32_t)data[1] << 24) |
                   ((uint32_t)data[2] << 16) |
                   ((uint32_t)data[3] <<  8) |
                    (uint32_t)data[4];
    snprintf(out->tag_hex, sizeof(out->tag_hex), "%02X%02X%02X%02X",
             data[1], data[2], data[3], data[4]);
    return true;
}

// ─────────────────────────────────────────────────────────────────────────────

void rfid_init(void) {
    uart_init(RFID_UART, RFID_BAUD);
    gpio_set_function(RFID_RX_PIN, GPIO_FUNC_UART);
    uart_set_format(RFID_UART, 8, 1, UART_PARITY_NONE);
    uart_set_fifo_enabled(RFID_UART, true);

    s_rx_state = RX_WAIT_STX;
    s_buf_idx  = 0;
}

bool rfid_poll(RfidTag *out) {
    while (uart_is_readable(RFID_UART)) {
        uint8_t b = uart_getc(RFID_UART);

        if (s_rx_state == RX_WAIT_STX) {
            if (b == STX) {
                s_buf[0]   = STX;
                s_buf_idx  = 1;
                s_rx_state = RX_COLLECT;
            }
            // descarta bytes até encontrar STX
        } else {
            if (s_buf_idx < FRAME_LEN) {
                s_buf[s_buf_idx++] = b;
            }
            if (s_buf_idx == FRAME_LEN) {
                s_rx_state = RX_WAIT_STX;
                s_buf_idx  = 0;

                RfidTag tag;
                if (!parse_frame(s_buf, &tag)) return false;

                // Debounce: ignora mesma tag dentro do intervalo
                uint32_t now = to_ms_since_boot(get_absolute_time());
                if (tag.tag_id == s_last_id &&
                    (now - s_last_ms) < RFID_DEBOUNCE_MS) {
                    return false;
                }
                s_last_id  = tag.tag_id;
                s_last_ms  = now;

                *out = tag;
                return true;
            }
        }
    }
    return false;
}

// Reinicia o debounce do zero (aceita qualquer tag logo em seguida)
void rfid_reset_debounce(void) {
    s_last_id = 0xFFFFFFFF;
    s_last_ms = 0;
}

// Renova o timer de debounce para o momento atual (impede re-leitura imediata)
void rfid_renew_debounce(void) {
    s_last_ms = to_ms_since_boot(get_absolute_time());
}
