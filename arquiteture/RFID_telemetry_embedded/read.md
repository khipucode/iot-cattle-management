# 📘 README — Pinagem Completa do Sistema Embarcado com ESP32 (ESP32-WROOM-32)

Este documento descreve a **distribuição completa de GPIOs** do sistema embarcado baseado em **ESP32 DevKit (ESP32-WROOM-32)**, substituindo a unidade central Pico W do diagrama original.

O objetivo é fornecer uma pinagem:

✅ Estável para WiFi ativo  
✅ Compatível com ADC do ESP32  
✅ Sem conflitos de boot  
✅ Organizada por barramentos (SPI / I2C / GPIO / ADC / PWM)

---

# 🧠 Arquitetura do Sistema

Dispositivos integrados:

- 📡 RFID RC522 (SPI)
- 🖥️ Display OLED SSD1306 (I2C)
- 🌡️ Sensor DHT22
- 🎮 Joystick Analógico (2 eixos + botão)
- 🔊 Buzzer
- 💡 LEDs de Status
- 🔘 Chave Liga/Desliga

Controlador central:

> **ESP32 DevKit — ESP32-WROOM-32**

---

# ⚠️ Boas Práticas do ESP32

## Pinos evitados
| GPIO | Motivo |
|------|--------|
| 6–11 | Flash interna |
| 12 | Problemas de boot voltage |
| 0,2,15 | Strapping pins (usar com cuidado) |

## ADC recomendado
Usar **ADC1 (GPIO32–39)** quando WiFi estiver ativo.

---

# 🔌 Pinagem Completa dos Dispositivos

---

## 📡 RFID — RC522 (SPI)

Interface: **VSPI**

| RC522 | GPIO ESP32 | Função |
|------|------------|--------|
| SDA (CS) | GPIO5 | Chip Select |
| SCK | GPIO18 | Clock SPI |
| MOSI | GPIO23 | Dados Master → Slave |
| MISO | GPIO19 | Dados Slave → Master |
| RST | GPIO32 | Reset do módulo |
| VCC | 3.3V | Alimentação |
| GND | GND | Terra |

✅ Usa barramento SPI padrão do ESP32.

---

## 🖥️ Display OLED — SSD1306 (I2C)

Interface: **I2C**

| OLED | GPIO ESP32 |
|------|------------|
| SDA | GPIO21 |
| SCL | GPIO22 |
| VCC | 3.3V |
| GND | GND |

✅ Pinagem I2C padrão oficial ESP32.

---

## 🌡️ Sensor DHT22

| DHT22 | GPIO ESP32 |
|-------|------------|
| DATA | GPIO27 |
| VCC | 3.3V |
| GND | GND |

📌 Usar resistor pull-up 10kΩ entre DATA e 3.3V.

---

## 🎮 Joystick Analógico (Atualizado)

Baseado no código de referência Arduino fornecido:


---

### Conversão correta para ESP32

| Joystick | GPIO ESP32 | Tipo |
|-----------|------------|------|
| VERT | GPIO34 | ADC1 (analógico) |
| HORZ | GPIO35 | ADC1 (analógico) |
| SEL | GPIO33 | Digital INPUT_PULLUP |
| VCC | 3.3V | Alimentação |
| GND | GND | Terra |

### Motivos técnicos

- GPIO34/35 → ADC1 (funciona com WiFi)
- Input-only → ideal para sensores analógicos
- GPIO33 → entrada digital estável

---

### ⚙ Ajuste necessário no código (ESP32)

ESP32 usa resolução 12 bits:


Threshold equivalente:

| Arduino UNO | ESP32 |
|-------------|-------|
| 300 | ~1200 |
| 700 | ~2800 |

---

## 🔊 Buzzer

| Buzzer | GPIO ESP32 |
|--------|------------|
| Signal | GPIO2 |
| VCC | 3.3V |
| GND | GND |

⚠ GPIO2 é strapping pin — garantir que não fique LOW no boot.

(Recomendação ultra-segura alternativa: GPIO25)

---

## 💡 LEDs de Status

| LED | GPIO |
|-----|------|
| LED1 | GPIO25 |
| LED2 | GPIO26 |

Usar resistor série 220Ω–1kΩ.

---

## 🔘 Chave Liga / Desliga

Duas opções:

### ✅ Recomendado
Chave conectada ao pino:


---

### Alternativa
Chave cortando alimentação VCC da placa.

---

# 📊 Tabela Consolidada Geral

| Dispositivo | Interface | GPIO |
|-------------|-----------|------|
| RC522 CS | SPI | 5 |
| RC522 SCK | SPI | 18 |
| RC522 MOSI | SPI | 23 |
| RC522 MISO | SPI | 19 |
| RC522 RST | GPIO | 32 |
| OLED SDA | I2C | 21 |
| OLED SCL | I2C | 22 |
| DHT22 DATA | GPIO | 27 |
| Joystick VERT | ADC1 | 34 |
| Joystick HORZ | ADC1 | 35 |
| Joystick SEL | Digital | 33 |
| Buzzer | PWM | 2 |
| LED Status 1 | Output | 25 |
| LED Status 2 | Output | 26 |
| Power Switch | EN | — |

---
