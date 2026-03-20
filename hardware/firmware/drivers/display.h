// ============================================================================
//  drivers/display.h — Funções de UI para OLED SSD1306 128x64
// ============================================================================

#ifndef DISPLAY_H
#define DISPLAY_H

#include "menu/menu.h"
#include "drivers/rfid.h"
#include "mqtt/mqtt_client.h"
#include "wifi_driver.h"

void display_init(void);

// Tela de boot com splash
void display_boot(void);

// Tela de conexão intermediária (WiFi OK, aguardando MQTT etc.)
// step: ex "MQTT...", subtitle: IP ou info extra
void display_connecting(const char *step, const char *subtitle);

// Menu principal — redesenha tela completa
void display_menu(const MenuState *m);

// Confirma leitura de tag (exibe por ~2 s)
void display_tag_ok(const RfidTag *tag, const char *action_label);

// Barra de status inferior (WiFi + MQTT)
void display_status_bar(WifiStatus wifi, MqttStatus mqtt);

// Tela ativa: mostra config selecionada em letras grandes (fica estática)
void display_active_config(const MenuState *m, WifiStatus wifi, MqttStatus mqtt);

// Mensagem de erro genérica
void display_error(const char *msg);

#endif // DISPLAY_H
