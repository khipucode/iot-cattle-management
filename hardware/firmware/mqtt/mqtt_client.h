// ============================================================================
//  mqtt/mqtt_client.h — Cliente MQTT via LwIP (modo polling, sem RTOS)
// ============================================================================

#ifndef MQTT_CLIENT_H
#define MQTT_CLIENT_H

#include <stdbool.h>

typedef enum {
    MQTT_IDLE,
    MQTT_CONNECTING,
    MQTT_CONNECTED,
    MQTT_DISCONNECTED,
    MQTT_ERROR,
} MqttStatus;

// Inicializa e inicia conexão ao broker (chamar após WiFi conectado).
void       mqtt_client_start(void);

// Deve ser chamado no loop principal.
void       mqtt_client_poll(void);

MqttStatus mqtt_client_status(void);

// Publica payload no tópico; retorna false se não conectado ou fila cheia.
bool       mqtt_send(const char *topic, const char *payload);

#endif // MQTT_CLIENT_H
