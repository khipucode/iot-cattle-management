// ============================================================================
//  payload/payload.h — Gerador de mensagens JSON para MQTT
// ============================================================================

#ifndef PAYLOAD_H
#define PAYLOAD_H

#include "app_state.h"

#define PAYLOAD_MAX_LEN  512

// Gera o payload JSON para um evento de leitura RFID.
// Retorna o número de bytes escritos (sem o '\0'), ou -1 se buf muito pequeno.
int payload_build(char *buf, int buf_len,
                  const char *animal_tag,
                  const AppState *app);

#endif // PAYLOAD_H
