// ============================================================================
//  drivers/time_util.c — Timestamp ISO 8601 com sincronização SNTP
// ============================================================================

#include "time_util.h"
#include "config.h"
#include "pico/stdlib.h"
#include "lwip/apps/sntp.h"
#include <stdio.h>
#include <string.h>

static bool     s_synced      = false;
static uint32_t s_epoch_sec   = 0;   // tempo Unix no momento da sincronização
static uint32_t s_sync_boot_ms = 0;  // to_ms_since_boot no momento da sync

// Callback chamado pelo LwIP quando SNTP recebe resposta
void time_util_sntp_callback(uint32_t seconds) {
    s_epoch_sec    = seconds;
    s_sync_boot_ms = to_ms_since_boot(get_absolute_time());
    s_synced       = true;
    printf("[SNTP] Tempo sincronizado: %lu\n", (unsigned long)seconds);
}

void time_util_sntp_start(void) {
    sntp_setoperatingmode(SNTP_OPMODE_POLL);
    sntp_setservername(0, SNTP_SERVER);
    sntp_init();
    printf("[SNTP] Cliente iniciado (%s)\n", SNTP_SERVER);
}

bool time_util_is_synced(void) {
    return s_synced;
}

void time_util_get_iso8601(char *buf, int len) {
    uint32_t now_ms   = to_ms_since_boot(get_absolute_time());

    if (!s_synced) {
        // Fallback: segundos desde o boot (não é hora real)
        uint32_t secs = now_ms / 1000;
        snprintf(buf, len, "1970-01-01T00:%02lu:%02luZ",
                 (unsigned long)(secs / 60) % 60,
                 (unsigned long)(secs % 60));
        return;
    }

    // Calcula tempo atual baseado na referência SNTP
    uint32_t elapsed_sec = (now_ms - s_sync_boot_ms) / 1000;
    uint32_t t = s_epoch_sec + elapsed_sec;

    // Decompõe Unix timestamp em data/hora (sem suporte a fuso)
    uint32_t sec   =  t % 60; t /= 60;
    uint32_t min   =  t % 60; t /= 60;
    uint32_t hour  =  t % 24; t /= 24;

    // Algoritmo de data a partir de dias desde epoch (1970-01-01)
    uint32_t days  = t;
    uint32_t z     = days + 719468;
    uint32_t era   = z / 146097;
    uint32_t doe   = z - era * 146097;
    uint32_t yoe   = (doe - doe/1460 + doe/36524 - doe/146096) / 365;
    uint32_t y     = yoe + era * 400;
    uint32_t doy   = doe - (365*yoe + yoe/4 - yoe/100);
    uint32_t mp    = (5*doy + 2) / 153;
    uint32_t d     = doy - (153*mp + 2)/5 + 1;
    uint32_t m     = mp < 10 ? mp + 3 : mp - 9;
    y += (m <= 2);

    snprintf(buf, len, "%04lu-%02lu-%02luT%02lu:%02lu:%02luZ",
             (unsigned long)y, (unsigned long)m, (unsigned long)d,
             (unsigned long)hour, (unsigned long)min, (unsigned long)sec);
}
