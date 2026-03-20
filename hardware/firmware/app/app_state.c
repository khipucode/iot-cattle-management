// ============================================================================
//  app/app_state.c
// ============================================================================

#include "app_state.h"
#include <string.h>

AppState g_app;

void app_state_init(void) {
    memset(&g_app, 0, sizeof(g_app));
    g_app.action_type   = ACTION_NONE;
    g_app.mqtt_topic    = NULL;
    g_app.has_confirmed = false;
    g_app.has_telemetry = false;
}

void app_state_set_stick(const char *id) {
    strncpy(g_app.stick_id, id, sizeof(g_app.stick_id) - 1);
}

void app_state_set_operator(const char *id) {
    strncpy(g_app.operator_id, id, sizeof(g_app.operator_id) - 1);
}

void app_state_set_action(ActionType action, const char *topic,
                          bool confirmed, bool telemetry) {
    g_app.action_type   = action;
    g_app.mqtt_topic    = topic;
    g_app.has_confirmed = confirmed;
    g_app.has_telemetry = telemetry;
}

bool app_state_is_ready(void) {
    return (g_app.stick_id[0] != '\0') &&
           (g_app.operator_id[0] != '\0') &&
           (g_app.action_type != ACTION_NONE);
}
