// ============================================================================
//  drivers/dht22.h — Driver DHT22 (temperatura + umidade) via 1-wire
// ============================================================================

#ifndef DHT22_H
#define DHT22_H

#include <stdbool.h>

typedef struct {
    float temperature;   // °C
    float humidity;      // %RH
} Dht22Data;

// Configura o pino como entrada com pull-up.
void dht22_init(void);

// Lê temperatura e umidade. Bloqueia ~5ms.
// Retorna true em sucesso, false em timeout ou checksum inválido.
bool dht22_read(Dht22Data *out);

#endif // DHT22_H
