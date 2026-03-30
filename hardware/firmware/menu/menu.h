// ============================================================================
//  menu/menu.h — Navegação de menu de 2 níveis com joystick
// ============================================================================

#ifndef MENU_H
#define MENU_H

#include <stdbool.h>
#include "menu_def.h"

// ── Nível de navegação ────────────────────────────────────────────────────────
typedef enum {
    MENU_LEVEL_CATEGORY,    // navegando entre as 7 categorias
    MENU_LEVEL_OPTION,      // navegando nas opções de uma categoria
    MENU_LEVEL_ACTIVE,      // tela estática mostrando a config ativa (letras grandes)
} MenuLevel;

// ── Estado do menu ────────────────────────────────────────────────────────────
typedef struct {
    MenuLevel level;
    int       cat_sel;          // índice da categoria atual  (0..MENU_CAT_COUNT-1)
    int       opt_sel;          // índice da opção atual      (0..cat.count-1)
    bool      dirty;            // true = OLED precisa redesenhar
    char      active_cat[12];   // categoria confirmada (para tela ativa)
    char      active_opt[12];   // opção confirmada     (para tela ativa)
} MenuState;

void        menu_init(MenuState *m);

// Lê joystick; retorna true se o estado mudou (chamar redraw do OLED).
// Navegação:
//   Nível CATEGORY: UP/DOWN move entre categorias; botão entra no sub-menu.
//   Nível OPTION:   UP/DOWN move entre opções; botão confirma; LEFT cancela.
bool        menu_tick(MenuState *m);

// Aplica a seleção atual ao g_app (chama app_state_set_*).
void        menu_apply(const MenuState *m);

// Texto curto da categoria/opção selecionada (para exibição no OLED).
const char *menu_cat_label(const MenuState *m);
const char *menu_opt_label(const MenuState *m);

#endif // MENU_H
