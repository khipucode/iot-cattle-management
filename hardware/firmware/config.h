// ============================================================================
//  config.h — Configurações globais do firmware RFID Stick
//  Ajuste WiFi, MQTT e pinos conforme seu ambiente.
// ============================================================================

#ifndef CONFIG_H
#define CONFIG_H

// ── WiFi ─────────────────────────────────────────────────────────────────────
#define WIFI_SSID           "Lapcom"
#define WIFI_PASSWORD       "12345678"
#define WIFI_TIMEOUT_MS     20000

// ── MQTT ─────────────────────────────────────────────────────────────────────
#define MQTT_BROKER_IP      "192.168.51.50"   // ← ajuste para o IP do broker
#define MQTT_BROKER_PORT    1883
#define MQTT_CLIENT_ID      "rfid_stick_001"
#define MQTT_KEEPALIVE_S    60

// ── SNTP ─────────────────────────────────────────────────────────────────────
#define SNTP_SERVER         "pool.ntp.org"

// ── I2C / OLED ───────────────────────────────────────────────────────────────
#define I2C_PORT            i2c1
#define I2C_SDA_PIN         14
#define I2C_SCL_PIN         15

// ── RFID (UART0) ─────────────────────────────────────────────────────────────
#define RFID_UART           uart0
#define RFID_BAUD           9600
#define RFID_RX_PIN         17
#define RFID_DEBOUNCE_MS    2000

// ── Joystick (ADC) ───────────────────────────────────────────────────────────
#define JOY_X_PIN           26      // ADC0
#define JOY_Y_PIN           27      // ADC1
#define JOY_BTN_PIN         22
#define BTN_A_PIN           5
#define JOY_CENTER          2048
#define JOY_DEADZONE        400
#define JOY_COOLDOWN_MS     220

// ── LED RGB ──────────────────────────────────────────────────────────────────
// NOTA: GPIO13 era LED_STATUS no bitdoglab_rfid; aqui é substituído pelo LED RGB.
#define LED_R_PIN           13
#define LED_G_PIN           11
#define LED_B_PIN           12

// ── Buzzer ───────────────────────────────────────────────────────────────────
#define BUZZER_PIN          21

// ── DHT22 (temperatura + umidade) ────────────────────────────────────────────
#define DHT22_PIN               4

// ── Telemetria ambiental periódica ───────────────────────────────────────────
#define TELEMETRY_TOPIC         "stick/telemetry/environment"
#define TELEMETRY_INTERVAL_MS   30000

#endif // CONFIG_H
