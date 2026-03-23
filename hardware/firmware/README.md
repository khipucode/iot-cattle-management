# RFID Stick — Firmware

Firmware para **Raspberry Pi Pico W** que realiza leitura de tags RFID e publica eventos via MQTT sobre Wi-Fi. Parte do projeto **Brinco do Boi (CPqD)**.

---

## Sumário

- [Visão geral](#visão-geral)
- [Hardware](#hardware)
- [Arquitetura do software](#arquitetura-do-software)
- [Árvore de menu e tópicos MQTT](#árvore-de-menu-e-tópicos-mqtt)
- [Formato dos payloads](#formato-dos-payloads)
- [Configuração](#configuração)
- [Build e gravação](#build-e-gravação)
- [Monitoramento com Mosquitto](#monitoramento-com-mosquitto)

---

## Visão geral

O RFID Stick é um dispositivo portátil operado por um peão de campo. Ele conecta ao Wi-Fi da fazenda, exibe um menu navegável em display OLED, lê tags RFID de brincos bovinos e publica eventos JSON no broker MQTT local. Quando a categoria **Eventos** está ativa, também envia telemetria ambiental (temperatura e umidade) periodicamente.

---

## Hardware

### Componentes

| Componente | Modelo |
|---|---|
| Microcontrolador | Raspberry Pi Pico W (RP2040 + CYW43439) |
| Display | OLED SSD1306 128×64 (I2C) |
| Leitor RFID | RDM6300 125 kHz (UART) |
| Sensor ambiental | DHT22 (temperatura + umidade) |
| Interface | Joystick analógico + 2 botões |
| Feedback | LED RGB + Buzzer |

### Pinout

| Função | GPIO |
|---|---|
| OLED SDA (I2C1) | 14 |
| OLED SCL (I2C1) | 15 |
| RFID RX (UART0) | 17 |
| DHT22 DATA | 4 |
| Joystick VRx (ADC0) | 26 |
| Joystick VRy (ADC1) | 27 |
| Joystick BTN | 22 |
| Botão A | 5 |
| LED Vermelho | 13 |
| LED Verde | 11 |
| LED Azul | 12 |
| Buzzer (PWM) | 21 |

> **DHT22:** conectar resistor pull-up de 10 kΩ entre DATA e 3,3 V.

---

## Arquitetura do software

### Máquina de estados principal

```
BOOT → WIFI_CONNECTING → STATE_MENU ↔ STATE_RFID_EVENT
                              ↓
                    (loop: telemetria, MQTT poll, menu)
```

| Estado | Descrição |
|---|---|
| `WIFI_CONNECTING` | Conecta ao AP, exibe animação no OLED |
| `STATE_MENU` | Navegação, MQTT poll, leitura RFID, telemetria periódica |
| `STATE_RFID_EVENT` | Processa tag lida: monta payload e publica MQTT |
| `STATE_ERROR` | LED vermelho, aguarda e retorna ao menu |

### Estrutura de módulos

```
firmware/
├── main.c                  # Loop principal, máquina de estados
├── config.h                # Configurações (Wi-Fi, MQTT, pinos)
├── app/
│   ├── app_state.h/c       # Estado global (stick_id, operator_id, ação ativa)
├── drivers/
│   ├── rfid.h/c            # Driver RDM6300 via UART (não-bloqueante)
│   ├── display.h/c         # UI OLED SSD1306
│   ├── dht22.h/c           # Sensor DHT22 via 1-wire
│   ├── wifi_driver.h/c     # Conexão Wi-Fi (CYW43)
│   └── time_util.h/c       # SNTP + timestamp ISO 8601
├── menu/
│   ├── menu.h/c            # Navegação por joystick
│   └── menu_def.h          # Árvore completa de categorias e ações
├── mqtt/
│   └── mqtt_client.h/c     # Cliente MQTT via LwIP TCP raw (QoS 0)
├── payload/
│   └── payload.h/c         # Gerador de JSON para eventos RFID
└── lib/
    └── ssd1306.*           # Driver low-level do display
```

### MQTT Client

Implementação própria sobre LwIP TCP raw (sem `lwip/apps/mqtt.h`), modo polling sem RTOS:

- Reconexão automática a cada 8 s em caso de desconexão
- Timeout de 10 s para tentativa de conexão travada
- PINGREQ enviado a cada 30 s (metade do keepalive de 60 s) para manter a sessão ativa

---

## Árvore de menu e tópicos MQTT

```
RFID Stick
│
├── 1 · ID Vara         → configura stick_id (V001/V002/V003)
├── 2 · Operador        → configura operator_id (D001/D002/D003)
│
├── 3 · Sanitário
│     ├── Vacinacao       → cattle/action/health/vaccination
│     └── Ctrl.Parasitas  → cattle/action/health/parasite
│
├── 4 · Reproducao
│     ├── Cio             → cattle/action/repro/heat
│     ├── Inseminacao     → cattle/action/repro/insemination
│     ├── Prenhez         → cattle/action/repro/pregnancy
│     └── Desmame         → cattle/action/repro/weaning
│
├── 5 · Inventario
│     ├── Atrib.Lote      → cattle/action/inventory/lot
│     ├── Pesagem         → cattle/action/inventory/manual_weight
│     └── Descarte        → cattle/action/inventory/culling
│
├── 6 · Eventos           ★ ativa telemetria periódica (DHT22 a cada 30 s)
│     ├── Agua            → cattle/event/water
│     ├── Porteira        → cattle/event/corral
│     ├── Piquete         → cattle/event/pasture
│     └── Pesagem         → cattle/event/weight
│
└── 7 · Cadastro          → cattle/action/registration
```

> **Telemetria ambiental** (apenas quando Eventos está ativo):
> Tópico: `stick/telemetry/environment` — publicado a cada 30 s.

---

## Formato dos payloads

### Evento RFID (todas as categorias exceto Cadastro)

```json
{
  "animal_tag": "0F7A3C2B",
  "action_type": "vaccination",
  "confirmed": true,
  "metadata": {
    "timestamp": "2026-03-20T15:30:00Z",
    "stick_id": "V001",
    "operator_id": "D001"
  }
}
```

### Cadastro (`confirmed` ausente)

```json
{
  "animal_tag": "0F7A3C2B",
  "action_type": "registration",
  "metadata": {
    "timestamp": "2026-03-20T15:30:00Z",
    "stick_id": "V001",
    "operator_id": "D001"
  }
}
```

### Telemetria ambiental (`stick/telemetry/environment`)

```json
{
  "stick_id": "V001",
  "operator_id": "D001",
  "temperature_c": 28.5,
  "humidity_percent": 72.0,
  "timestamp": "2026-03-20T15:30:00Z"
}
```

---

## Configuração

Edite `config.h` antes de compilar:

```c
// Wi-Fi
#define WIFI_SSID           "NomeDaRede"
#define WIFI_PASSWORD       "senha"

// MQTT
#define MQTT_BROKER_IP      "192.168.X.X"   // IP fixo do broker na rede local
#define MQTT_BROKER_PORT    1883
#define MQTT_CLIENT_ID      "rfid_stick_001"
#define MQTT_KEEPALIVE_S    60

// Telemetria
#define TELEMETRY_TOPIC         "stick/telemetry/environment"
#define TELEMETRY_INTERVAL_MS   30000        // 30 segundos

// DHT22
#define DHT22_PIN           4
```

---

## Build e gravação

### Pré-requisitos

```bash
sudo apt install cmake gcc-arm-none-eabi libnewlib-arm-none-eabi build-essential
git clone https://github.com/raspberrypi/pico-sdk ~/pico/pico-sdk
cd ~/pico/pico-sdk && git submodule update --init
export PICO_SDK_PATH=~/pico/pico-sdk
```

### Compilar

```bash
cd hardware/firmware
mkdir build && cd build
cmake .. -DPICO_BOARD=pico_w
make -j$(nproc)
```

O arquivo `rfid_stick.uf2` será gerado em `build/`.

### Gravar no Pico W

1. Segure o botão **BOOTSEL** no Pico W
2. Conecte o cabo USB — o dispositivo aparece como drive `RPI-RP2`
3. Copie o `.uf2`:
   ```bash
   cp build/rfid_stick.uf2 /media/$USER/RPI-RP2/
   ```
   O Pico reinicia automaticamente.

### Monitorar via serial (USB)

```bash
# Linux
minicom -b 115200 -D /dev/ttyACM0

# ou
screen /dev/ttyACM0 115200
```

---

## Monitoramento com Mosquitto

### Instalar cliente

```bash
sudo apt install mosquitto-clients
```

### Assinar todos os tópicos do sistema

```bash
mosquitto_sub -h 192.168.51.50 -p 1883 -t "cattle/#" -t "stick/#" -v
```

### Assinar por categoria

```bash
# Todos os eventos de saúde
mosquitto_sub -h 192.168.51.50 -p 1883 -t "cattle/action/health/#" -v

# Todos os eventos de reprodução
mosquitto_sub -h 192.168.51.50 -p 1883 -t "cattle/action/repro/#" -v

# Inventário e logística
mosquitto_sub -h 192.168.51.50 -p 1883 -t "cattle/action/inventory/#" -v

# Eventos de campo (agua, porteira, piquete, pesagem)
mosquitto_sub -h 192.168.51.50 -p 1883 -t "cattle/event/#" -v

# Cadastro de animais
mosquitto_sub -h 192.168.51.50 -p 1883 -t "cattle/action/registration" -v

# Telemetria ambiental
mosquitto_sub -h 192.168.51.50 -p 1883 -t "stick/telemetry/environment" -v
```

### Simular publicação de evento (teste sem o Pico)

```bash
# Vacinação
mosquitto_pub -h 192.168.51.50 -p 1883 \
  -t "cattle/action/health/vaccination" \
  -m '{"animal_tag":"0F7A3C2B","action_type":"vaccination","confirmed":true,"metadata":{"timestamp":"2026-03-20T15:30:00Z","stick_id":"V001","operator_id":"D001"}}'

# Evento de água
mosquitto_pub -h 192.168.51.50 -p 1883 \
  -t "cattle/event/water" \
  -m '{"animal_tag":"0F7A3C2B","action_type":"water_drink","confirmed":true,"metadata":{"timestamp":"2026-03-20T15:30:00Z","stick_id":"V001","operator_id":"D001"}}'

# Telemetria ambiental
mosquitto_pub -h 192.168.51.50 -p 1883 \
  -t "stick/telemetry/environment" \
  -m '{"stick_id":"V001","operator_id":"D001","temperature_c":28.5,"humidity_percent":72.0,"timestamp":"2026-03-20T15:30:00Z"}'
```

### Verificar broker (conexão e versão)


# Monitorar todas as mensagens MQTT no Mosquitto (Docker)

Para escutar todas as mensagens que chegam ao broker MQTT rodando em um container Docker, execute:

```bash
docker exec -it fazenda-mosquitto mosquitto_sub -h localhost -p 1883 -t "#"
```

> **Importante:** `fazenda-mosquitto` é o **nome do container Docker** onde o broker Mosquitto está rodando.
> Esse nome pode mudar dependendo da configuração do projeto ou do Docker Compose.
> Para descobrir o nome correto no seu ambiente, use:

```bash
docker ps
```

O comando acima executa o cliente `mosquitto_sub` dentro do container, conecta ao broker local (`localhost:1883`) e assina o tópico global `#`, exibindo em tempo real todas as mensagens publicadas.


```bash
mosquitto_sub -h 192.168.51.50 -p 1883 -t '$SYS/broker/version' -C 1
```
