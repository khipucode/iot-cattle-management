// ============================================================================
//  menu/menu.c — Lógica de navegação de menu com joystick e botões
// ============================================================================

#include "menu.h"
#include "app_state.h"
#include "config.h"
#include "pico/stdlib.h"
#include "hardware/adc.h"
#include <string.h>

// ── Estado interno dos botões (detecção de borda) ─────────────────────────────
static bool s_btn_last_joy  = false;
static bool s_btn_last_a    = false;
static uint32_t s_nav_last_ms = 0;

// ── Direções do joystick ──────────────────────────────────────────────────────
typedef enum { DIR_NONE, DIR_UP, DIR_DOWN, DIR_LEFT } Direction;

// ── Leitura do joystick (com deadzone e cooldown) ─────────────────────────────
static Direction joy_read(void) {
    uint32_t now = to_ms_since_boot(get_absolute_time());
    if (now - s_nav_last_ms < JOY_COOLDOWN_MS) return DIR_NONE;

    adc_select_input(1);                    // VRy → ADC1
    uint16_t vy = adc_read();

    if (vy < (JOY_CENTER - JOY_DEADZONE)) {
        s_nav_last_ms = now;
        return DIR_UP;
    }
    if (vy > (JOY_CENTER + JOY_DEADZONE)) {
        s_nav_last_ms = now;
        return DIR_DOWN;
    }

    adc_select_input(0);                    // VRx → ADC0
    uint16_t vx = adc_read();

    if (vx < (JOY_CENTER - JOY_DEADZONE)) {
        s_nav_last_ms = now;
        return DIR_LEFT;
    }

    return DIR_NONE;
}

// ── Detecção de borda de botão ────────────────────────────────────────────────
static bool btn_pressed(void) {
    bool joy_now = !gpio_get(JOY_BTN_PIN);
    bool a_now   = !gpio_get(BTN_A_PIN);

    bool pressed = false;
    if (joy_now && !s_btn_last_joy) pressed = true;
    if (a_now   && !s_btn_last_a)   pressed = true;

    s_btn_last_joy = joy_now;
    s_btn_last_a   = a_now;
    return pressed;
}

// ─────────────────────────────────────────────────────────────────────────────

void menu_init(MenuState *m) {
    m->level        = MENU_LEVEL_CATEGORY;
    m->cat_sel      = 0;
    m->opt_sel      = 0;
    m->dirty        = true;
    m->active_cat[0] = '\0';
    m->active_opt[0] = '\0';

    // ADC para joystick
    adc_init();
    adc_gpio_init(JOY_X_PIN);
    adc_gpio_init(JOY_Y_PIN);

    // Botões com pull-up
    gpio_init(JOY_BTN_PIN);
    gpio_set_dir(JOY_BTN_PIN, GPIO_IN);
    gpio_pull_up(JOY_BTN_PIN);

    gpio_init(BTN_A_PIN);
    gpio_set_dir(BTN_A_PIN, GPIO_IN);
    gpio_pull_up(BTN_A_PIN);
}

bool menu_tick(MenuState *m) {
    Direction  dir     = joy_read();
    bool       pressed = btn_pressed();
    bool       changed = false;

    const MenuCategory *cat = &g_menu_categories[m->cat_sel];

    if (m->level == MENU_LEVEL_ACTIVE) {
        // Qualquer input sai da tela ativa e volta ao menu
        if (dir != DIR_NONE || pressed) {
            m->level = MENU_LEVEL_CATEGORY;
            changed  = true;
        }
    } else if (m->level == MENU_LEVEL_CATEGORY) {
        if (dir == DIR_UP) {
            m->cat_sel = (m->cat_sel - 1 + MENU_CAT_COUNT) % MENU_CAT_COUNT;
            m->opt_sel = 0;
            changed = true;
        } else if (dir == DIR_DOWN) {
            m->cat_sel = (m->cat_sel + 1) % MENU_CAT_COUNT;
            m->opt_sel = 0;
            changed = true;
        } else if (pressed) {
            cat = &g_menu_categories[m->cat_sel];
            if (cat->count == 1) {
                m->opt_sel = 0;
                menu_apply(m);
                strncpy(m->active_cat, cat->label,           sizeof(m->active_cat) - 1);
                strncpy(m->active_opt, cat->items[0].label,  sizeof(m->active_opt) - 1);
                m->active_cat[sizeof(m->active_cat) - 1] = '\0';
                m->active_opt[sizeof(m->active_opt) - 1] = '\0';
                m->level = MENU_LEVEL_ACTIVE;
            } else {
                m->level   = MENU_LEVEL_OPTION;
                m->opt_sel = 0;
            }
            changed = true;
        }
    } else {  // MENU_LEVEL_OPTION
        if (dir == DIR_UP) {
            m->opt_sel = (m->opt_sel - 1 + cat->count) % cat->count;
            changed = true;
        } else if (dir == DIR_DOWN) {
            m->opt_sel = (m->opt_sel + 1) % cat->count;
            changed = true;
        } else if (dir == DIR_LEFT) {
            // Volta sem confirmar
            m->level = MENU_LEVEL_CATEGORY;
            changed  = true;
        } else if (pressed) {
            // Confirma seleção e vai para tela ativa
            menu_apply(m);
            strncpy(m->active_cat, cat->label,                sizeof(m->active_cat) - 1);
            strncpy(m->active_opt, cat->items[m->opt_sel].label, sizeof(m->active_opt) - 1);
            m->active_cat[sizeof(m->active_cat) - 1] = '\0';
            m->active_opt[sizeof(m->active_opt) - 1] = '\0';
            m->level = MENU_LEVEL_ACTIVE;
            changed  = true;
        }
    }

    if (changed) m->dirty = true;
    return changed;
}

void menu_apply(const MenuState *m) {
    const MenuCategory *cat  = &g_menu_categories[m->cat_sel];
    const MenuItem     *item = &cat->items[m->opt_sel];

    switch (item->type) {
        case MENU_TYPE_CONFIG_STICK:
            app_state_set_stick(item->label);
            break;
        case MENU_TYPE_CONFIG_OPERATOR:
            app_state_set_operator(item->label);
            break;
        case MENU_TYPE_ACTION:
            app_state_set_action(item->action, item->topic,
                                 item->confirmed, item->telemetry);
            break;
    }
}

const char *menu_cat_label(const MenuState *m) {
    return g_menu_categories[m->cat_sel].label;
}

const char *menu_opt_label(const MenuState *m) {
    const MenuCategory *cat = &g_menu_categories[m->cat_sel];
    return cat->items[m->opt_sel].label;
}
