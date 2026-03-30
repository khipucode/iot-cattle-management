// ============================================================================
//  drivers/wifi_driver.h — Gerenciamento de conexão WiFi (CYW43, polling)
// ============================================================================

#ifndef WIFI_DRIVER_H
#define WIFI_DRIVER_H

#include <stdbool.h>

typedef enum {
    WIFI_DISCONNECTED,
    WIFI_CONNECTING,
    WIFI_CONNECTED,
    WIFI_FAILED,
} WifiStatus;

// Inicializa o chip CYW43 e inicia tentativa de conexão.
void       wifi_driver_init(void);

// Retorna estado atual da conexão.
WifiStatus wifi_driver_status(void);

// Deve ser chamado no loop principal (processa eventos LwIP).
void       wifi_driver_poll(void);

// Copia string "a.b.c.d" no buffer se conectado; retorna false se sem IP.
bool       wifi_get_ip_str(char *buf, int len);

#endif // WIFI_DRIVER_H
