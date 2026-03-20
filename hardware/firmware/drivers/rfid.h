// ============================================================================
//  drivers/rfid.h — Driver não-bloqueante para RDM6300 (125 kHz RFID)
//
//  Protocolo RDM6300: frame de 14 bytes @ 9600 8N1
//    [STX(0x02)] [10 bytes ASCII hex] [2 bytes checksum hex] [ETX(0x03)]
//
//  ATENÇÃO HARDWARE: O RDM6300 opera em 5 V.
//  Use divisor resistivo (1 kΩ + 2 kΩ) ou level-shifter no pino RX.
// ============================================================================

#ifndef RFID_H
#define RFID_H

#include <stdbool.h>
#include <stdint.h>

// ── Tag lida ──────────────────────────────────────────────────────────────────
typedef struct {
    uint32_t tag_id;        // ID de 32 bits (4 bytes de dados)
    uint8_t  version;       // byte de versão/fabricante
    char     tag_hex[9];    // ID em hex ASCII ("AABBCCDD\0")
} RfidTag;

void rfid_init(void);

// Não-bloqueante. Retorna true quando um frame válido e debounced for lido.
bool rfid_poll(RfidTag *out);

// Força aceitação da mesma tag novamente (útil após processar evento).
void rfid_reset_debounce(void);

// Renova o timer de debounce (impede re-leitura imediata ao voltar ao menu).
void rfid_renew_debounce(void);

#endif // RFID_H
