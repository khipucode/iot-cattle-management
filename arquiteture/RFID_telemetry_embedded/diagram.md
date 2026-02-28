# 📌 Atualização da Pinagem — ESP32 DevKit (ESP32-WROOM-32)

Sistema embarcado com os seguintes dispositivos:

- RC522 (RFID HF 13.56 MHz – SPI)
- Display OLED SSD1306 (I2C)
- DHT22
- Buzzer
- Joystick 4 direções
- LEDs de status
- Chave liga/desliga

Configuração pensada para:
✔ evitar conflitos de boot  
✔ manter estabilidade elétrica  
✔ manter SPI organizado  
✔ compatível com WiFi ativo  

---

# 🔷 1) Pinagem Atualizada por Dispositivo

## 📡 RC522 (SPI – Melhor Opção de GPIO)

Interface: **VSPI**

| Sinal RC522 | GPIO ESP32 | Observação |
|-------------|------------|------------|
| SDA (SS/CS) | **GPIO 5** | CS dedicado |
| SCK         | **GPIO 18** | Clock SPI |
| MOSI        | **GPIO 23** | Master Out |
| MISO        | **GPIO 19** | Master In |
| RST         | **GPIO 32** | Reset do módulo |
| IRQ (opcional) | Não usado | Pode usar GPIO33 se necessário |

📌 Motivo da escolha:
- 18/19/23 são pinos padrão do VSPI
- GPIO5 é tradicionalmente usado como CS
- GPIO32 é estável para controle

---

## 🖥️ Display OLED SSD1306 (I2C)

| Sinal | GPIO ESP32 |
|-------|------------|
| SDA   | **GPIO 21** |
| SCL   | **GPIO 22** |

📌 Padrão oficial do ESP32 para I2C.

---

## 🌡️ DHT22

| Sinal | GPIO ESP32 |
|-------|------------|
| DATA  | **GPIO 27** |

📌 Recomendado resistor pull-up de 10k para 3.3V.

---

## 🔊 Buzzer

| Sinal | GPIO ESP32 |
|-------|------------|
| PWM   | **GPIO 2** |

📌 Atenção:
GPIO2 é pino de boot (strapping).
Funciona bem se:
- Não estiver forçando LOW durante boot.
- Buzzer não puxar corrente excessiva.
Se quiser ultra-seguro → alternativa: GPIO25.

---

## 🎮 Joystick (4 Direções)

| Direção | GPIO ESP32 |
|----------|------------|
| UP       | GPIO 34 |
| DOWN     | GPIO 35 |
| LEFT     | GPIO 36 |
| RIGHT    | GPIO 39 |

📌 Observações:
- GPIO34–39 são somente entrada (perfeitos para botões)
- Não possuem pull-up interno confiável → usar resistor externo

---

## 💡 LEDs de Status

| LED | GPIO ESP32 |
|-----|------------|
| LED1 | GPIO 25 |
| LED2 | GPIO 26 |

---

## 🔘 Chave Liga/Desliga

Opção recomendada:

- Chave conectada ao pino **EN** do ESP32  
ou  
- Chave cortando alimentação VCC da placa

---

# 🔷 2) Tabela Consolidada Geral

| Dispositivo | Interface | GPIO |
|-------------|-----------|------|
| RC522 CS | SPI | 5 |
| RC522 SCK | SPI | 18 |
| RC522 MOSI | SPI | 23 |
| RC522 MISO | SPI | 19 |
| RC522 RST | GPIO | 32 |
| OLED SDA | I2C | 21 |
| OLED SCL | I2C | 22 |
| DHT22 | GPIO | 27 |
| Buzzer | PWM | 2 |
| Joystick UP | Input | 34 |
| Joystick DOWN | Input | 35 |
| Joystick LEFT | Input | 36 |
| Joystick RIGHT | Input | 39 |
| LED Status 1 | Output | 25 |
| LED Status 2 | Output | 26 |
| Chave ON/OFF | EN ou VCC | — |

---

# 🔷 3) Resumo Final de Todos os Pinados

✔ SPI (RC522): 5, 18, 19, 23, 32  
✔ I2C (OLED): 21, 22  
✔ DHT22: 27  
✔ Buzzer PWM: 2  
✔ LEDs: 25, 26  
✔ Joystick: 34, 35, 36, 39  
✔ Power: EN  

---
