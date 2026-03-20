// ============================================================================
//  payload/payload.c — Gerador de JSON para eventos RFID
//
//  Formatos gerados:
//
//  Modo normal (has_confirmed = true, has_telemetry = false):
//  {
//    "animal_tag": "0F7A3C2B",
//    "action_type": "vaccination",
//    "confirmed": true,
//    "metadata": {
//      "timestamp": "2026-03-20T15:30:00Z",
//      "stick_id": "V001",
//      "operator_id": "D001"
//    }
//  }
//
//  Modo Telemetria (has_telemetry = true):
//  {  ...mesmos campos... ,
//    "metadata": { ..., "temperature_c": 28.5, "humidity_percent": 72.0 }
//  }
//
//  Modo Cadastro (has_confirmed = false):
//  {
//    "animal_tag": "0F7A3C2B",
//    "action_type": "registration",
//    "metadata": { "timestamp": "...", "stick_id": "V001", "operator_id": "D001" }
//  }
// ============================================================================

#include "payload.h"
#include "drivers/time_util.h"
#include "pico/stdlib.h"
#include <stdio.h>
#include <string.h>

// ── Nomes de action_type em string ───────────────────────────────────────────
static const char *action_type_str(ActionType a) {
    switch (a) {
        case ACTION_VACCINATION:     return "vaccination";
        case ACTION_PARASITE_CONTROL:return "parasite_control";
        case ACTION_HEAT_DETECTION:  return "heat_detection";
        case ACTION_INSEMINATION:    return "insemination";
        case ACTION_PREGNANCY_CHECK: return "pregnancy_check";
        case ACTION_WEANING:         return "weaning";
        case ACTION_LOT_ASSIGNMENT:  return "lot_assignment";
        case ACTION_MANUAL_WEIGHT:   return "manual_weight";
        case ACTION_CULLING_FLAG:    return "culling_flag";
        case ACTION_WATER_DRINK:     return "water_drink";
        case ACTION_CORRAL_GATE:     return "corral_gate";
        case ACTION_PASTURE_ZONE:    return "pasture_zone";
        case ACTION_AUTO_WEIGH:      return "auto_weigh";
        case ACTION_REGISTRATION:    return "registration";
        default:                     return "unknown";
    }
}

// ─────────────────────────────────────────────────────────────────────────────

int payload_build(char *buf, int buf_len,
                  const char *animal_tag,
                  const AppState *app) {
    char ts[32];
    time_util_get_iso8601(ts, sizeof(ts));

    const char *action = action_type_str(app->action_type);
    int n = 0;

    n += snprintf(buf + n, buf_len - n,
        "{"
        "\"animal_tag\":\"%s\","
        "\"action_type\":\"%s\",",
        animal_tag, action);

    if (app->has_confirmed) {
        n += snprintf(buf + n, buf_len - n,
            "\"confirmed\":true,");
    }

    // ── metadata ─────────────────────────────────────────────────────────────
    n += snprintf(buf + n, buf_len - n,
        "\"metadata\":{"
        "\"timestamp\":\"%s\","
        "\"stick_id\":\"%s\","
        "\"operator_id\":\"%s\"",
        ts, app->stick_id, app->operator_id);



    n += snprintf(buf + n, buf_len - n, "}}");

    if (n >= buf_len) return -1;
    return n;
}
