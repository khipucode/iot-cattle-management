// ============================================================================
//  drivers/display.c — UI para OLED SSD1306 128x64
//
//  Layout da tela principal (128x64):
//
//   y= 0  ┌─────────────────────────────┐
//          │ V001 | D001                 │  ← stick + operator (header)
//   y= 9  ├─────────────────────────────┤
//          │ > Categoria                 │  ← item anterior (se existe)
//   y=18  │ [ITEM SELECIONADO invertido] │  ← item atual (destaque)
//   y=27  │   próximo item              │  ← item seguinte (se existe)
//   y=36  ├─────────────────────────────┤
//          │ Acao: Vacinacao             │  ← ação ativa
//   y=54  ├─────────────────────────────┤
//          │ W:OK  M:OK                  │  ← status WiFi + MQTT
//   y=63  └─────────────────────────────┘
// ============================================================================

#include "display.h"
#include "app_state.h"
#include "lib/ssd1306.h"
#include "config.h"
#include "pico/stdlib.h"
#include <stdio.h>
#include <string.h>

static ssd1306_t s_oled;

// ── Inicialização ─────────────────────────────────────────────────────────────
void display_init(void) {
    ssd1306_init(&s_oled, I2C_PORT, I2C_SDA_PIN, I2C_SCL_PIN);
    ssd1306_clear(&s_oled);
    ssd1306_show(&s_oled);
}

// ── Splash de boot ────────────────────────────────────────────────────────────
void display_boot(void) {
    ssd1306_clear(&s_oled);
    ssd1306_text_2x(&s_oled, 10, 8,  "RFID",  1);
    ssd1306_text_2x(&s_oled, 10, 28, "Stick", 1);
    ssd1306_text   (&s_oled,  2, 50, "Conectando WiFi...", 1);
    ssd1306_show(&s_oled);
}

// ── Tela de conexão intermediária ─────────────────────────────────────────────
void display_connecting(const char *step, const char *subtitle) {
    ssd1306_clear(&s_oled);
    ssd1306_text_2x(&s_oled, 10, 8,  "RFID",  1);
    ssd1306_text_2x(&s_oled, 10, 28, "Stick", 1);
    char line[22];
    snprintf(line, sizeof(line), "Conectando %s", step);
    ssd1306_text(&s_oled, 2, 50, line, 1);
    if (subtitle && subtitle[0])
        ssd1306_text(&s_oled, 2, 58, subtitle, 1);
    ssd1306_show(&s_oled);
}

// ── Barra de status ───────────────────────────────────────────────────────────
static void draw_status_bar(WifiStatus wifi, MqttStatus mqtt) {
    ssd1306_hline(&s_oled, 0, 53, 128, 1);

    const char *ws = (wifi == WIFI_CONNECTED)    ? "OK"  : "---";
    const char *ms = (mqtt == MQTT_CONNECTED)     ? "OK"  :
                     (mqtt == MQTT_CONNECTING)    ? "..." : "ERR";

    char buf[22];
    snprintf(buf, sizeof(buf), "W:%-3s  M:%-3s", ws, ms);
    ssd1306_text(&s_oled, 2, 55, buf, 1);
}

void display_status_bar(WifiStatus wifi, MqttStatus mqtt) {
    // Apaga apenas a região da barra antes de redesenhar
    ssd1306_fill_rect(&s_oled, 0, 53, 128, 11, 0);
    draw_status_bar(wifi, mqtt);
    ssd1306_show(&s_oled);
}

// ── Menu principal ────────────────────────────────────────────────────────────
void display_menu(const MenuState *m) {
    ssd1306_clear(&s_oled);

    // ── Header: stick + operator ─────────────────────────────────────────────
    char hdr[22];
    const char *sid = (g_app.stick_id[0])    ? g_app.stick_id    : "----";
    const char *oid = (g_app.operator_id[0]) ? g_app.operator_id : "----";
    snprintf(hdr, sizeof(hdr), "%s | %s", sid, oid);
    ssd1306_text(&s_oled, 2, 0, hdr, 1);
    ssd1306_hline(&s_oled, 0, 9, 128, 1);

    // ── Itens do menu (janela de 3) ──────────────────────────────────────────
    const MenuCategory *cat = &g_menu_categories[m->cat_sel];
    int y_rows[3] = { 12, 21, 30 };

    if (m->level == MENU_LEVEL_CATEGORY) {
        // Mostra 3 categorias centradas na selecionada
        for (int slot = 0; slot < 3; slot++) {
            int idx = m->cat_sel - 1 + slot;
            if (idx < 0 || idx >= MENU_CAT_COUNT) continue;

            char line[22];
            snprintf(line, sizeof(line), "%d.%s",
                     idx + 1, g_menu_categories[idx].label);

            if (idx == m->cat_sel) {
                // Destaque invertido para item selecionado
                ssd1306_fill_rect(&s_oled, 0, y_rows[slot] - 1, 128, 9, 1);
                ssd1306_text(&s_oled, 2, y_rows[slot], line, 0);
            } else {
                ssd1306_text(&s_oled, 2, y_rows[slot], line, 1);
            }
        }
    } else {
        // MENU_LEVEL_OPTION: mostra opções da categoria
        char title[22];
        snprintf(title, sizeof(title), "[%s]", cat->label);
        ssd1306_text(&s_oled, 2, 12, title, 1);

        for (int slot = 0; slot < 2; slot++) {
            int idx = m->opt_sel - 0 + slot;  // slot 0 = atual, slot 1 = próximo
            if (idx >= cat->count) continue;

            if (slot == 0) {
                ssd1306_fill_rect(&s_oled, 0, 21, 128, 9, 1);
                ssd1306_text(&s_oled, 4, 22, cat->items[idx].label, 0);
            } else {
                ssd1306_text(&s_oled, 4, 31, cat->items[idx].label, 1);
            }
        }
        // Indicador de posição "2/4"
        char pos[8];
        snprintf(pos, sizeof(pos), "%d/%d", m->opt_sel + 1, cat->count);
        ssd1306_text(&s_oled, 100, 31, pos, 1);
    }

    // ── Linha de ação ativa ──────────────────────────────────────────────────
    ssd1306_hline(&s_oled, 0, 41, 128, 1);
    if (g_app.action_type != ACTION_NONE && g_app.mqtt_topic) {
        char act[22];
        // Pega o label curto da opção selecionada (já salvo em g_app implicitamente)
        // Mostra tópico truncado
        const char *t = g_app.mqtt_topic;
        // Exibe somente a última parte do tópico após a última '/'
        const char *last_slash = strrchr(t, '/');
        snprintf(act, sizeof(act), ">%s", last_slash ? last_slash + 1 : t);
        ssd1306_text(&s_oled, 2, 43, act, 1);
    } else {
        ssd1306_text(&s_oled, 2, 43, "Selecione acao", 1);
    }

    // ── Barra de status ──────────────────────────────────────────────────────
    // (será atualizada via display_status_bar)
    ssd1306_hline(&s_oled, 0, 53, 128, 1);
    ssd1306_text(&s_oled, 2, 55, "W:--- M:---", 1);

    ssd1306_show(&s_oled);
}

// ── Tela de configuração ativa (letras grandes) ───────────────────────────────
//
//   y= 0  V001 | D001               (header pequeno)
//   y= 9  ─────────────────────     (linha)
//   y=13  Eventos                   (categoria, pequeno)
//   y=26  AGUA                      (opção, 2x = 16px)
//   y=44  ─────────────────────     (linha)
//   y=46  joystick = menu           (dica, pequeno)
//   y=54  ─────────────────────     (linha)
//   y=56  W:OK  M:OK                (status)
//
void display_active_config(const MenuState *m, WifiStatus wifi, MqttStatus mqtt) {
    ssd1306_clear(&s_oled);

    // Header
    char hdr[22];
    const char *sid = (g_app.stick_id[0])    ? g_app.stick_id    : "----";
    const char *oid = (g_app.operator_id[0]) ? g_app.operator_id : "----";
    snprintf(hdr, sizeof(hdr), "%s | %s", sid, oid);
    ssd1306_text(&s_oled, 2, 0, hdr, 1);
    ssd1306_hline(&s_oled, 0, 9, 128, 1);

    // Categoria (pequeno)
    ssd1306_text(&s_oled, 2, 13, m->active_cat, 1);

    // Opção em letras grandes (2x)
    ssd1306_text_2x(&s_oled, 2, 26, m->active_opt, 1);

    // Separador + dica
    ssd1306_hline(&s_oled, 0, 44, 128, 1);
    ssd1306_text(&s_oled, 2, 46, "joystick = menu", 1);

    // Barra de status
    draw_status_bar(wifi, mqtt);

    ssd1306_show(&s_oled);
}

// ── Confirmação de tag lida ───────────────────────────────────────────────────
void display_tag_ok(const RfidTag *tag, const char *action_label) {
    ssd1306_clear(&s_oled);
    ssd1306_text   (&s_oled, 2,  2, "TAG LIDA!", 1);
    ssd1306_hline  (&s_oled, 0, 11, 128, 1);

    char line[22];
    snprintf(line, sizeof(line), "ID: %s", tag->tag_hex);
    ssd1306_text(&s_oled, 2, 14, line, 1);

    if (action_label) {
        ssd1306_text(&s_oled, 2, 26, action_label, 1);
    }

    ssd1306_text(&s_oled, 2, 40, "Enviando MQTT...", 1);
    ssd1306_show(&s_oled);
}

// ── Mensagem de erro ──────────────────────────────────────────────────────────
void display_error(const char *msg) {
    ssd1306_clear(&s_oled);
    ssd1306_text(&s_oled, 2, 2,  "ERRO:", 1);
    ssd1306_hline(&s_oled, 0, 11, 128, 1);
    // Quebra automaticamente a cada 21 chars
    int len = strlen(msg);
    for (int row = 0; row < 4 && row * 21 < len; row++) {
        char chunk[22] = {0};
        strncpy(chunk, msg + row * 21, 21);
        ssd1306_text(&s_oled, 2, 14 + row * 10, chunk, 1);
    }
    ssd1306_show(&s_oled);
}
