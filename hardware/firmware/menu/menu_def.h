// ============================================================================
//  menu/menu_def.h — Definição completa da árvore de menu do RFID Stick
//
//  Estrutura:
//    Nível 0 (categorias): ID Vara, Operador, Sanitário, Reprodução,
//                          Inventário, Eventos, Cadastro
//    Nível 1 (opções):     sub-itens de cada categoria
// ============================================================================

#ifndef MENU_DEF_H
#define MENU_DEF_H

#include "app_state.h"
#include <stddef.h>
#include <stdint.h>

// ── Tipo de item ──────────────────────────────────────────────────────────────
typedef enum {
    MENU_TYPE_CONFIG_STICK,     // configura g_app.stick_id
    MENU_TYPE_CONFIG_OPERATOR,  // configura g_app.operator_id
    MENU_TYPE_ACTION,           // configura action_type + mqtt_topic
} MenuItemType;

// ── Sub-opção (nível 1) ───────────────────────────────────────────────────────
typedef struct {
    const char   *label;        // texto exibido no OLED
    MenuItemType  type;
    ActionType    action;       // usado se type == MENU_TYPE_ACTION
    const char   *topic;        // mqtt_topic se type == MENU_TYPE_ACTION
    bool          confirmed;
    bool          telemetry;
} MenuItem;

// ── Categoria (nível 0) ───────────────────────────────────────────────────────
typedef struct {
    const char      *label;
    const MenuItem  *items;
    uint8_t          count;
} MenuCategory;

// ── Dados do menu ─────────────────────────────────────────────────────────────

static const MenuItem items_stick[] = {
    { "V001", MENU_TYPE_CONFIG_STICK, ACTION_NONE, NULL, false, false },
    { "V002", MENU_TYPE_CONFIG_STICK, ACTION_NONE, NULL, false, false },
    { "V003", MENU_TYPE_CONFIG_STICK, ACTION_NONE, NULL, false, false },
};

static const MenuItem items_operator[] = {
    { "D001", MENU_TYPE_CONFIG_OPERATOR, ACTION_NONE, NULL, false, false },
    { "D002", MENU_TYPE_CONFIG_OPERATOR, ACTION_NONE, NULL, false, false },
    { "D003", MENU_TYPE_CONFIG_OPERATOR, ACTION_NONE, NULL, false, false },
};

static const MenuItem items_health[] = {
    { "Vacinacao",
      MENU_TYPE_ACTION, ACTION_VACCINATION,
      "cattle/action/health/vaccination", true, false },
    { "Ctrl.Parasitas",
      MENU_TYPE_ACTION, ACTION_PARASITE_CONTROL,
      "cattle/action/health/parasite",    true, false },
};

static const MenuItem items_repro[] = {
    { "Cio",
      MENU_TYPE_ACTION, ACTION_HEAT_DETECTION,
      "cattle/action/repro/heat",         true, false },
    { "Inseminacao",
      MENU_TYPE_ACTION, ACTION_INSEMINATION,
      "cattle/action/repro/insemination", true, false },
    { "Prenhez",
      MENU_TYPE_ACTION, ACTION_PREGNANCY_CHECK,
      "cattle/action/repro/pregnancy",    true, false },
    { "Desmame",
      MENU_TYPE_ACTION, ACTION_WEANING,
      "cattle/action/repro/weaning",      true, false },
};

static const MenuItem items_inventory[] = {
    { "Atrib.Lote",
      MENU_TYPE_ACTION, ACTION_LOT_ASSIGNMENT,
      "cattle/action/inventory/lot",           true, false },
    { "Pesagem",
      MENU_TYPE_ACTION, ACTION_MANUAL_WEIGHT,
      "cattle/action/inventory/manual_weight", true, false },
    { "Descarte",
      MENU_TYPE_ACTION, ACTION_CULLING_FLAG,
      "cattle/action/inventory/culling",       true, false },
};

static const MenuItem items_events[] = {
    { "Agua",
      MENU_TYPE_ACTION, ACTION_WATER_DRINK,
      "cattle/event/water",            true, true },
    { "Porteira",
      MENU_TYPE_ACTION, ACTION_CORRAL_GATE,
      "cattle/event/corral",           true, true },
    { "Piquete",
      MENU_TYPE_ACTION, ACTION_PASTURE_ZONE,
      "cattle/event/pasture",          true, true },
    { "Pesagem",
      MENU_TYPE_ACTION, ACTION_AUTO_WEIGH,
      "cattle/event/weight",           true, true },
};

static const MenuItem items_registration[] = {
    { "Cadastro",
      MENU_TYPE_ACTION, ACTION_REGISTRATION,
      "cattle/action/registration",    false, false },
};

// ── Tabela de categorias ──────────────────────────────────────────────────────
static const MenuCategory g_menu_categories[] = {
    { "ID Vara",    items_stick,         3 },
    { "Operador",   items_operator,      3 },
    { "Sanitario",  items_health,        2 },
    { "Reproducao", items_repro,         4 },
    { "Inventario", items_inventory,     3 },
    { "Eventos",    items_events,        4 },
    { "Cadastro",   items_registration,  1 },
};

#define MENU_CAT_COUNT  7

#endif // MENU_DEF_H
