// ============================================================================
//  app/app_state.h — Estado operacional global do dispositivo
// ============================================================================

#ifndef APP_STATE_H
#define APP_STATE_H

#include <stdbool.h>
#include <stdint.h>

// ── Tipos de ação zootécnica ──────────────────────────────────────────────────
typedef enum {
    ACTION_NONE = 0,
    // Sanitário
    ACTION_VACCINATION,
    ACTION_PARASITE_CONTROL,
    // Reprodução
    ACTION_HEAT_DETECTION,
    ACTION_INSEMINATION,
    ACTION_PREGNANCY_CHECK,
    ACTION_WEANING,
    // Inventário e Logística
    ACTION_LOT_ASSIGNMENT,
    ACTION_MANUAL_WEIGHT,
    ACTION_CULLING_FLAG,
    // Eventos
    ACTION_WATER_DRINK,
    ACTION_CORRAL_GATE,
    ACTION_PASTURE_ZONE,
    ACTION_AUTO_WEIGH,
    // Cadastro
    ACTION_REGISTRATION,
} ActionType;

// ── Estado da aplicação ───────────────────────────────────────────────────────
typedef struct {
    char        stick_id[8];        // Ex: "V001"
    char        operator_id[8];     // Ex: "D001"
    ActionType  action_type;
    const char *mqtt_topic;
    bool        has_confirmed;      // false apenas no modo Cadastro
    bool        has_telemetry;      // true em eventos (Água, Porteira, Piquete, Pesag.Auto)
} AppState;

extern AppState g_app;

void app_state_init(void);
void app_state_set_stick(const char *id);
void app_state_set_operator(const char *id);
void app_state_set_action(ActionType action, const char *topic,
                          bool confirmed, bool telemetry);
bool app_state_is_ready(void);  // true se stick + operator + action definidos

#endif // APP_STATE_H
