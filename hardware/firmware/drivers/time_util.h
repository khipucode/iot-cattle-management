// ============================================================================
//  drivers/time_util.h — Timestamp ISO 8601 com SNTP
// ============================================================================

#ifndef TIME_UTIL_H
#define TIME_UTIL_H

#include <stdbool.h>
#include <stdint.h>

// Chamado automaticamente pelo LwIP SNTP (definido em lwipopts.h).
void time_util_sntp_callback(uint32_t seconds);

// Inicia cliente SNTP (chamar após WiFi conectado).
void time_util_sntp_start(void);

// Retorna true se o tempo já foi sincronizado via SNTP.
bool time_util_is_synced(void);

// Preenche buf com timestamp no formato "2026-03-20T15:30:00Z".
// Se ainda não sincronizado, usa tempo relativo ao boot.
void time_util_get_iso8601(char *buf, int len);

#endif // TIME_UTIL_H
