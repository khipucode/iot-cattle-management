# 📘 README — Pinagem Completa do Sistema Embarcado com ESP32 (ESP32-WROOM-32)

Este documento descreve a **distribuição completa e atualizada de GPIOs** do sistema embarcado utilizando um **ESP32 DevKit (ESP32-WROOM-32)** como unidade central.

A arquitetura foi organizada considerando:

✅ Estabilidade elétrica  
✅ Compatibilidade com WiFi ativo  
✅ Uso correto do ADC do ESP32  
✅ Barramentos dedicados (SPI / I2C)  
✅ Boot seguro do microcontrolador  
✅ Facilidade futura para PCB

---

# 🧠 Arquitetura do Sistema

Dispositivos conectados:

- 📡 RFID **RC522** (SPI)
- 🖥️ Display OLED **SSD1306** (I2C)
- 🌡️ Sensor **DHT22**
- 🎮 Joystick Analógico (2 eixos + botão)
- 🔊 Buzzer
- 💡 LEDs de Status
- 🔘 Chave Liga/Desliga

Controlador principal:

> **ESP32 DevKit — ESP32-WROOM-32**

---

# ⚠️ Boas Práticas do ESP32

## Pinos que NÃO devem ser usados

| GPIO | Motivo |
|------|--------|
| 6–11 | Flash interna |
| 12 | Problemas de boot voltage |
| 0, 2, 15 | Strapping pins (usar com cuidado) |

---

## ADC recomendado

Quando WiFi estiver ativo:

✅ Usar apenas **ADC1 → GPIO32–39**

---

# 🔌 Pinagem Completa dos Dispositivos

---

# 📡 RFID — RC522 (SPI)

## Pinagem real do módulo

| RC522 | Descrição |
|------|-----------|
| 3.3V | Alimentação |
| RST | Reset |
| GND | Terra |
| IRQ | Interrupção (opcional) |
| MISO | SPI data out |
| MOSI | SPI data in |
| SCK | Clock SPI |
| SDA | Chip Select (CS) |

⚠️ **SDA ≠ I2C** (é CS do SPI).

---

## Conexão RC522 → ESP32 (VSPI Hardware)

| RC522 Pin | GPIO ESP32 | Função |
|-----------|------------|--------|
| 3.3V | 3.3V | Alimentação |
| GND | GND | Terra |
| SCK | **GPIO18** | Clock SPI |
| MOSI | **GPIO23** | Master Out |
| MISO | **GPIO19** | Master In |
| SDA (CS) | **GPIO5** | Chip Select |
| RST | **GPIO32** | Reset |
| IRQ | **GPIO33** (opcional) | Interrupção |

---

## Barramento SPI utilizado


---

# 🖥️ Display OLED — SSD1306 (I2C)

| OLED | GPIO ESP32 |
|------|------------|
| SDA | **GPIO21** |
| SCL | **GPIO22** |
| VCC | 3.3V |
| GND | GND |

✅ Pinagem padrão oficial ESP32.

---

# 🌡️ Sensor DHT22

| DHT22 | GPIO ESP32 |
|-------|------------|
| DATA | **GPIO27** |
| VCC | 3.3V |
| GND | GND |

📌 Usar resistor pull-up 10kΩ entre DATA e 3.3V.

---

# 🎮 Joystick Analógico (Atualizado)

Joystick possui:

| Pino | Função |
|------|--------|
| VCC | Alimentação |
| GND | Terra |
| VERT | Eixo vertical (analógico) |
| HORZ | Eixo horizontal (analógico) |
| SEL | Botão |

---

## Conexão Joystick → ESP32

| Joystick | GPIO ESP32 | Tipo |
|-----------|------------|------|
| VERT | **GPIO34** | ADC1 |
| HORZ | **GPIO35** | ADC1 |
| SEL | **GPIO33** | Digital INPUT_PULLUP |
| VCC | 3.3V | Alimentação |
| GND | GND | Terra |

---

## Ajuste necessário no código ESP32

ESP32 usa resolução 12 bits:


Equivalência:

| Arduino UNO | ESP32 |
|-------------|-------|
| 300 | ~1200 |
| 700 | ~2800 |

---

# 🔊 Buzzer

| Buzzer | GPIO ESP32 |
|--------|------------|
| Signal | **GPIO2** |
| VCC | 3.3V |
| GND | GND |

⚠ GPIO2 é strapping pin — não deve ficar LOW no boot.

Alternativa ultra segura: GPIO25.

---

# 💡 LEDs de Status

| LED | GPIO |
|-----|------|
| LED1 | **GPIO25** |
| LED2 | **GPIO26** |

Usar resistor série (220Ω–1kΩ).

---

# 🔘 Chave Liga / Desliga

## Opção recomendada
Conectar chave ao pino:


## Alternativa
Chave cortando alimentação VCC.

---

# 📊 Tabela Consolidada Geral

| Dispositivo | Interface | GPIO |
|-------------|-----------|------|
| RC522 SCK | SPI | 18 |
| RC522 MOSI | SPI | 23 |
| RC522 MISO | SPI | 19 |
| RC522 CS | SPI | 5 |
| RC522 RST | GPIO | 32 |
| RC522 IRQ | Interrupt | 33 (opcional) |
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

# 📌 Resumo Final dos Pinados

## SPI — RC522

---

# ✅ Características da Arquitetura

✔ SPI hardware otimizado  
✔ I2C independente  
✔ ADC funcional com WiFi  
✔ Boot seguro do ESP32  
✔ Organização pronta para PCB  
✔ Expansível para IoT/MQTT

---

