# ⚙️ Hardware - Brinco do Boi

## Conexão BitdogLab - RFID and DHT22

<img width="1189" height="697" alt="image" src="https://github.com/user-attachments/assets/1e16fa35-1cb0-47d1-9e08-1c7d8d2fde24" />


# Documentação Técnica — RFID Stick para Raspberry Pi Pico W

> Firmware embarcado para leitura de tags RFID 125 kHz com publicação de eventos via MQTT,
> desenvolvido para gestão de gado em ambiente de pecuária de precisão.

---

## Índice

1. [Visão Geral do Sistema](#1-visão-geral-do-sistema)
2. [Hardware e Pinagem](#2-hardware-e-pinagem)
3. [Arquitectura do Software](#3-arquitectura-do-software)
4. [Camada de Drivers](#4-camada-de-drivers)
5. [Subsistema de Rede](#5-subsistema-de-rede)
6. [Sistema de Menu](#6-sistema-de-menu)
7. [Payload JSON e Publicação MQTT](#7-payload-json-e-publicação-mqtt)
8. [Sistema de Build](#8-sistema-de-build)
9. [Configuração Central](#9-configuração-central)
10. [Fluxos de Dados](#10-fluxos-de-dados)
11. [Gestão de Erros e Recuperação](#11-gestão-de-erros-e-recuperação)
12. [Análise de Memória](#12-análise-de-memória)
13. [Ferramentas e Bibliotecas Utilizadas](#13-ferramentas-e-bibliotecas-utilizadas)
14. [Questões Prováveis da Banca](#14-questões-prováveis-da-banca)

---

## 1. Visão Geral do Sistema

O **RFID Stick** é um dispositivo IoT embarcado que lê tags RFID de 125 kHz e publica eventos de gestão de gado num broker MQTT através de WiFi. O operador navega num menu hierárquico (via joystick) para seleccionar o tipo de acção veterinária/operacional e, ao aproximar uma tag RFID do leitor, o evento é automaticamente codificado em JSON com timestamp ISO 8601 e enviado para o broker.

```
┌──────────────────────────────────────────────────────────────────┐
│                        RFID STICK                                │
│                                                                  │
│  [Tag RFID] ──UART──► [RDM6300] ──► [RP2040] ──WiFi──► [Broker] │
│  [Joystick] ──ADC───────────────────►[RP2040]                    │
│  [Botões]   ──GPIO──────────────────►[RP2040]                    │
│  [DHT22]    ──1-Wire────────────────►[RP2040]                    │
│                             │                                    │
│                          [SSD1306]  [LED RGB]  [Buzzer]          │
└──────────────────────────────────────────────────────────────────┘
```

**Características principais:**

| Característica | Detalhe |
|---|---|
| MCU | RP2040 @ 133 MHz (Raspberry Pi Pico W) |
| RAM total | 264 KB (estimativa de uso: ~20 KB) |
| Flash total | 2 MB (~600 KB disponíveis após SDK) |
| WiFi | CYW43439 — WPA2, modo Station |
| Protocolo IoT | MQTT 3.1.1, QoS 0 |
| RFID | 125 kHz, leitor RDM6300 |
| Interface | OLED SSD1306 128×64, joystick analógico |
| Telemetria ambiental | DHT22 (temperatura e humidade) |
| Frequência do ciclo principal | ~10 ms (sem RTOS, polling puro) |

---

## 2. Hardware e Pinagem

### Microcontrolador

O **RP2040** é um microcontrolador dual-core ARM Cortex-M0+ fabricado pela Raspberry Pi Foundation. No Pico W, é acompanhado do chip WiFi/BT **CYW43439** da Infineon, ligado via interface SPI interna.

### Periféricos e Pinagem

| Componente | Protocolo | GPIO | Configuração |
|---|---|---|---|
| Leitor RFID (RDM6300) | UART0 RX | GPIO 17 | 9600 baud, 8N1, FIFO activo |
| Display OLED (SSD1306) | I2C1 | SDA=14, SCL=15 | 400 kHz, endereço 0x3C |
| Joystick eixo X | ADC0 | GPIO 26 | Deadzone: ±400 counts |
| Joystick eixo Y | ADC1 | GPIO 27 | Deadzone: ±400 counts |
| Botão do joystick | GPIO | GPIO 22 | Digital, activo em LOW |
| Botão A | GPIO | GPIO 5 | Digital, activo em LOW |
| LED vermelho | GPIO | GPIO 13 | Saída digital, activo HIGH |
| LED verde | GPIO | GPIO 11 | Saída digital, activo HIGH |
| LED azul | GPIO | GPIO 12 | Saída digital, activo HIGH |
| Buzzer | PWM | GPIO 21 | Frequência variável (330–1760 Hz) |
| Sensor DHT22 | 1-Wire | GPIO 4 | Pull-up interno |

### Notas de Nível Lógico

O RDM6300 opera a 5 V TTL. Como o RP2040 é tolerante apenas a 3,3 V nas suas GPIOs, é necessário um **divisor de tensão ou level shifter** na linha RX (GPIO 17), caso o módulo RDM6300 envie sinais a 5 V.

---

## 3. Arquitectura do Software

### Estrutura de Directórios

```
rfid_stick/
├── CMakeLists.txt          # Sistema de build (CMake)
├── config.h                # Configurações centrais (WiFi, MQTT, pinos)
├── lwipopts.h              # Configuração da stack TCP/IP LwIP
├── main.c                  # Ponto de entrada + máquina de estados principal
├── app/
│   ├── app_state.h/.c      # Estado global da aplicação
├── drivers/
│   ├── rfid.h/.c           # Driver do leitor RDM6300 (UART)
│   ├── wifi_driver.h/.c    # Driver WiFi (CYW43, polling assíncrono)
│   ├── display.h/.c        # Renderização UI no SSD1306
│   ├── dht22.h/.c          # Driver do sensor DHT22 (1-Wire)
│   └── time_util.h/.c      # Cliente SNTP + geração de timestamps ISO 8601
├── mqtt/
│   └── mqtt_client.h/.c    # Implementação MQTT 3.1.1 customizada (TCP raw)
├── payload/
│   └── payload.h/.c        # Construtor de payload JSON
├── menu/
│   ├── menu.h              # Definição da máquina de estados do menu
│   ├── menu.c              # Lógica de navegação (joystick + botões)
│   └── menu_def.h          # Árvore completa do menu (7 categorias, 24 itens)
└── lib/
    └── ssd1306.h           # Biblioteca do display OLED (auto-contida)
```

### Máquina de Estados Principal (`main.c`)

O firmware opera sem sistema operativo (bare-metal). O `main()` corre um **super-loop** com ciclo de ~10 ms onde todas as operações são não-bloqueantes.

```
                    ┌─────────────────────┐
                    │ STATE_WIFI_CONNECTING│◄─── boot
                    │                     │
                    │ Anima dots OLED     │
                    │ Polling WiFi 600ms  │
                    └────────┬────────────┘
               sucesso ou    │    timeout (20s)
               falha         ▼
                    ┌─────────────────────┐
              ┌────►│    STATE_MENU       │◄────┐
              │     │                     │     │
              │     │ Menu navegação      │     │
              │     │ Polling RFID        │     │
              │     │ Polling MQTT        │     │
              │     │ Telemetria 30s      │     │
              │     └────────┬────────────┘     │
              │              │ tag lida          │
              │              ▼                  │
              │     ┌─────────────────────┐     │
              │     │  STATE_RFID_EVENT   │─────┘
              │     │                     │  após 2s
              │     │ Valida config       │
              │     │ Constrói JSON       │
              │     │ Publica MQTT        │
              │     │ Feedback LED/buzzer │
              └─────┘                     │
                    └─────────────────────┘
```

**Estados:**

| Estado | Descrição |
|---|---|
| `STATE_WIFI_CONNECTING` | Tenta ligação WiFi de forma assíncrona; exibe animação no OLED |
| `STATE_MENU` | Estado principal de operação; polling contínuo de RFID, MQTT e input |
| `STATE_RFID_EVENT` | Processa uma leitura RFID válida: constrói payload, publica MQTT, dá feedback |

### Padrão de Design: Polling Não-Bloqueante

Não existe RTOS nem interrupções para a lógica de aplicação. Cada componente expõe uma função `_poll()` que é chamada a cada iteração do super-loop:

- `wifi_driver_poll()` — verifica estado da ligação WiFi
- `mqtt_client_poll()` — gere reconexão e keep-alive MQTT
- `rfid_poll()` — lê bytes UART disponíveis (non-blocking)
- `menu_tick()` — lê joystick/botões e actualiza estado do menu

---

## 4. Camada de Drivers

### 4.1 Driver RFID — `drivers/rfid.c`

**Dispositivo:** RDM6300 — leitor de cartões RFID EM4100/EM4102 a 125 kHz.

**Protocolo de Comunicação (UART):**

O RDM6300 envia tramas de 14 bytes via UART a 9600 baud, 8N1:

```
Trama (14 bytes):
  [STX] [D0D0] [D1D1] [D2D2] [D3D3] [D4D4] [C0C0] [ETX]
    1B     2B     2B     2B     2B     2B     2B     1B

  STX  = 0x02
  ETX  = 0x03
  DxDx = byte x do ID codificado como 2 caracteres ASCII hex
  C0C0 = XOR de D0..D4 codificado como 2 chars ASCII hex

Exemplo:
  0x02 | "00" "C0" "8E" "9F" "38" | "C5" | 0x03
  Data: [0x00, 0xC0, 0x8E, 0x9F, 0x38]
  Checksum: 0x00 ^ 0xC0 ^ 0x8E ^ 0x9F ^ 0x38 = 0xC5 ✓
```

**Extracção do ID:**
- `version` = `data[0]` (byte do fabricante)
- `tag_id` (32 bits) = `(data[1]<<24) | (data[2]<<16) | (data[3]<<8) | data[4]`

**Máquina de estados interna do receptor:**

```
RX_WAIT_STX ──(0x02 recebido)──► RX_COLLECT ──(14 bytes)──► parse_frame()
     ▲                                                              │
     └──────────────────── (STX não encontrado) ───────────────────┘
```

**Anti-debouce:** Ignora a mesma tag durante `RFID_DEBOUNCE_MS` (2000 ms por defeito), comparando `tag_id` e timestamp de última leitura.

---

### 4.2 Driver WiFi — `drivers/wifi_driver.c`

**Chip:** CYW43439 (integrado no Pico W), controlado pela biblioteca `pico_cyw43_arch`.

**Fluxo de ligação:**

```
cyw43_arch_init()
      │
cyw43_arch_enable_sta_mode()
      │
cyw43_arch_wifi_connect_async(SSID, PASS, WPA2_AES_PSK)
      │
 loop de polling ──► cyw43_tcpip_link_status()
      │                   ├── CYW43_LINK_UP    → WIFI_CONNECTED
      │                   ├── CYW43_LINK_FAIL  → WIFI_FAILED
      │                   ├── CYW43_LINK_NONET → WIFI_FAILED
      │                   └── CYW43_LINK_BADAUTH → WIFI_FAILED
      └── timeout > 20s   → WIFI_FAILED (modo offline)
```

**Estados exportados (`WifiStatus`):** `WIFI_IDLE`, `WIFI_CONNECTING`, `WIFI_CONNECTED`, `WIFI_FAILED`.

---

### 4.3 Driver do Display — `drivers/display.c` + `lib/ssd1306.h`

**Dispositivo:** SSD1306 — display OLED monocromático 128×64 píxeis.

**Comunicação:** I2C1 a 400 kHz, endereço 0x3C.

**Framebuffer:** Array de 1024 bytes (`128 × 64 / 8`). Toda a renderização ocorre no buffer RAM; `ssd1306_show()` transfere o framebuffer completo via I2C num único bloco.

**Primitivas disponíveis (ssd1306.h):**

| Função | Descrição |
|---|---|
| `ssd1306_pixel(x, y, on)` | Acende/apaga um pixel |
| `ssd1306_char(x, y, c, scale)` | Renderiza um caractere (fonte 5×7) |
| `ssd1306_text(x, y, str, scale)` | Renderiza uma string |
| `ssd1306_rect(x, y, w, h, on)` | Rectângulo vazio |
| `ssd1306_fill_rect(x, y, w, h, on)` | Rectângulo preenchido |
| `ssd1306_invert_rect(x, y, w, h)` | Inverte píxeis (efeito seleccionado) |
| `ssd1306_hline(x, y, w, on)` | Linha horizontal |
| `ssd1306_show()` | Envia framebuffer ao display |
| `ssd1306_clear()` | Limpa framebuffer |

**Layouts de ecrã definidos em `display.c`:**

- **Boot:** logótipo + "Conectando WiFi..."
- **Menu principal:** cabeçalho (stick/operador), 3 itens visíveis (scroll), item activo invertido, barra de estado (WiFi + MQTT)
- **Modo activo:** mostra a acção seleccionada em fonte 2×
- **Confirmação de tag:** exibe ID hexadecimal da tag + acção + "Enviando MQTT..."

---

### 4.4 Driver DHT22 — `drivers/dht22.c`

**Dispositivo:** DHT22 (AM2302) — sensor de temperatura e humidade relativa, protocolo 1-Wire proprietário.

**Protocolo de comunicação:**

```
Fase de início (host):
  1. GPIO como saída, pull LOW por 2 ms
  2. Libertar linha (HIGH), esperar 30 µs
  3. GPIO como entrada com pull-up

Resposta do sensor:
  1. LOW por ~80 µs
  2. HIGH por ~80 µs
  3. 40 bits de dados:
     Cada bit: LOW ~50 µs → HIGH
       se HIGH < 30 µs → bit '0'
       se HIGH > 50 µs → bit '1'

Estrutura dos 40 bits (5 bytes):
  [RH_high][RH_low][T_high][T_low][checksum]

  Humidade    = (RH_high<<8 | RH_low) / 10.0  [%RH]
  Temperatura = (T_high<<8  | T_low)  / 10.0  [°C]
  Validação   : checksum == (RH_h + RH_l + T_h + T_l) & 0xFF
```

**Notas de implementação:**
- IRQs globais desactivados durante a leitura (~5 ms) para não perturbar os timings de bit.
- Timeout de 100 µs em qualquer `wait_level()` para evitar bloqueio permanente em caso de falha do sensor.

---

### 4.5 Utilitário de Tempo — `drivers/time_util.c`

**Objetivo:** Fornecer timestamps ISO 8601 (`"2026-04-25T14:30:00Z"`) para os payloads MQTT.

**Mecanismo:**

```
SNTP recebe resposta
      │
time_util_sntp_callback(uint32_t seconds)
      │
Armazena: s_epoch_sec   = seconds (Unix epoch)
          s_sync_boot_ms = time_us_64() / 1000 (boot time do RP2040 no momento da sync)

Geração de timestamp:
  now_ms = time_us_64() / 1000
  current_epoch = s_epoch_sec + (now_ms - s_sync_boot_ms) / 1000
  → decomposição em data/hora com algoritmo baseado em eras (Zeller variant)
```

**Fallback:** Se SNTP não sincronizou, retorna `"1970-01-01T00:MM:SSZ"` (segundos desde o boot).

**Intervalo de re-sincronização SNTP:** 1 hora (3 600 000 ms).

---

## 5. Subsistema de Rede

### 5.1 Stack TCP/IP — LwIP

**LwIP** (Lightweight IP) é uma stack TCP/IP open-source optimizada para sistemas embarcados com poucos recursos. No Pico SDK é fornecida como biblioteca `pico_cyw43_arch_lwip_poll`.

**Modo de operação:** `NO_SYS=1` — sem sistema operativo, sem threads. Toda a stack avança por chamadas explícitas a `cyw43_arch_poll()` no super-loop.

**Configuração relevante em `lwipopts.h`:**

| Parâmetro | Valor | Significado |
|---|---|---|
| `NO_SYS` | 1 | Sem RTOS |
| `LWIP_SOCKET` | 0 | API raw apenas (sem sockets BSD) |
| `MEM_SIZE` | 8000 | Heap LwIP: 8 KB |
| `TCP_MSS` | 1460 | Tamanho máximo de segmento TCP |
| `TCP_WND` | 11680 | Janela TCP (8 × MSS) |
| `PBUF_POOL_SIZE` | 24 | Buffers de pacotes |
| `MEMP_NUM_TCP_SEG` | 32 | Segmentos TCP na pool |
| `LWIP_DHCP` | 1 | DHCP activado |
| `LWIP_DNS` | 1 | Resolução DNS (para SNTP) |
| `LWIP_TCP_KEEPALIVE` | 1 | Keep-alive TCP |

**Protocolos activos:** IPv4, TCP, UDP, ICMP, ARP, DHCP, DNS, SNTP.

---

### 5.2 Cliente MQTT Customizado — `mqtt/mqtt_client.c`

O firmware implementa o seu **próprio cliente MQTT 3.1.1** usando a API TCP raw do LwIP (`tcp_pcb`, `tcp_connect`, `tcp_write`, `tcp_output`), em vez de usar a biblioteca `lwip/apps/mqtt.h` incluída no SDK.

**Razão:** Controlo total sobre o comportamento de reconexão, buffers e tratamento de erros.

**Formato dos pacotes MQTT:**

**CONNECT:**
```
Byte 0:   0x10  (tipo CONNECT)
Byte 1:   remaining_length (variável)
Bytes 2-9: cabeçalho variável (protocolo "MQTT" v4, flags, keep-alive=60s)
Payload:  [len_MSB][len_LSB] "rfid_stick_001"
```

**PUBLISH (QoS 0):**
```
Byte 0:   0x30  (tipo PUBLISH, QoS 0, no retain)
Byte 1:   remaining_length
Bytes …:  [topic_len_MSB][topic_len_LSB] <tópico>
Bytes …:  <payload JSON>
```

**PINGREQ / PINGRESP:**
```
PINGREQ:  [0xC0][0x00]
PINGRESP: [0xD0][0x00]
```

**Codificação de comprimento variável (Remaining Length):**
```
Cada byte: [bit7=mais bytes | bits[6:0]=dados]
Suporta até 256 MB de payload (4 bytes max)
```

**Máquina de estados do cliente MQTT:**

```
MQTT_IDLE / MQTT_DISCONNECTED
    │   (a cada 8 segundos)
    ▼
do_connect() → cria tcp_pcb, regista callbacks, tcp_connect()
    │
MQTT_CONNECTING
    │   (callback on_connected — TCP estabelecido)
    ▼
Envia pacote CONNECT
    │   (recebe CONNACK com código 0)
    ▼
MQTT_CONNECTED ──► PINGREQ a cada 30 s
    │
    │ mqtt_send(topic, payload)
    ▼
build_publish() → tcp_write() → tcp_output()

Erros → MQTT_DISCONNECTED → retry em 8 s
```

---

## 6. Sistema de Menu

### 6.1 Hierarquia do Menu (`menu_def.h`)

O menu tem 3 níveis e está completamente definido em arrays estáticos em `menu_def.h`.

```
NÍVEL 0: CATEGORIAS (7)
│
├── ID Vara       → [V001, V002, V003]
├── Operador      → [D001, D002, D003]
├── Sanitário     → [Vacinação, Ctrl. Parasitas]
├── Reprodução    → [Cio, Inseminação, Prenhez, Desmame]
├── Inventário    → [Atrib. Lote, Pesagem manual, Descarte]
├── Eventos       → [Água★, Porteira★, Piquete★, Pesagem★]
└── Cadastro      → [Cadastro]

★ = inclui telemetria DHT22 no payload
```

**Total: 7 categorias, 24 itens de acção.**

Cada item de menu define:
- Label de display
- `ActionType` associado
- Tópico MQTT (ex.: `"cattle/action/health/vaccination"`)
- Flag `has_confirmed` (falso apenas em registo)
- Flag `has_telemetry` (activa leitura DHT22)

### 6.2 Navegação (`menu.c`)

**Níveis de menu (`MenuLevel`):**

| Nível | Estado | Comportamento |
|---|---|---|
| `MENU_LEVEL_CATEGORY` | A seleccionar categoria | UP/DOWN circular, BTN entra na categoria |
| `MENU_LEVEL_OPTION` | A seleccionar item | UP/DOWN circular, LEFT cancela, BTN confirma |
| `MENU_LEVEL_ACTIVE` | Confirmado | Exibe selecção em grande; qualquer input volta ao início |

**Mapeamento do joystick:**

| Leitura ADC (eixo Y) | Direcção |
|---|---|
| < 2048 − 400 = 1648 | UP |
| > 2048 + 400 = 2448 | DOWN |
| Zona central | Neutro |

- Cooldown de 220 ms entre inputs para evitar navegação acelerada involuntária.
- Botão detectado por detecção de **flanco descendente** (edge-triggered).

### 6.3 Estado Global da Aplicação (`app/app_state.h`)

```c
typedef struct {
    char        stick_id[8];      // ex.: "V001"
    char        operator_id[8];   // ex.: "D001"
    ActionType  action_type;      // enum com 14 valores
    const char *mqtt_topic;       // ponteiro para string do tópico
    bool        has_confirmed;    // false apenas em modo registo
    bool        has_telemetry;    // true para eventos com DHT22
} AppState;
```

**`ActionType` (14 valores):**

```
ACTION_VACCINATION        ACTION_PARASITE_CONTROL
ACTION_HEAT_DETECTION     ACTION_INSEMINATION
ACTION_PREGNANCY_CHECK    ACTION_WEANING
ACTION_LOT_ASSIGNMENT     ACTION_MANUAL_WEIGHT
ACTION_CULLING_FLAG       ACTION_WATER_DRINK
ACTION_CORRAL_GATE        ACTION_PASTURE_ZONE
ACTION_AUTO_WEIGH         ACTION_REGISTRATION
```

---

## 7. Payload JSON e Publicação MQTT

### 7.1 Construtor de Payload (`payload/payload.c`)

Usa `snprintf` para construir o JSON directamente num buffer de tamanho fixo (`PAYLOAD_MAX_LEN` = 512 bytes).

**Payload padrão (acção confirmada):**
```json
{
  "animal_tag": "0F7A3C2B",
  "action_type": "vaccination",
  "confirmed": true,
  "metadata": {
    "timestamp": "2026-04-25T14:30:00Z",
    "stick_id": "V001",
    "operator_id": "D001"
  }
}
```

**Payload com telemetria (eventos com DHT22):**
```json
{
  "animal_tag": "0F7A3C2B",
  "action_type": "water_drink",
  "confirmed": true,
  "metadata": {
    "timestamp": "2026-04-25T14:30:00Z",
    "stick_id": "V001",
    "operator_id": "D001",
    "temperature_c": 28.5,
    "humidity_percent": 72.0
  }
}
```

**Payload de registo (`has_confirmed = false`):**
```json
{
  "animal_tag": "0F7A3C2B",
  "action_type": "registration",
  "metadata": {
    "timestamp": "2026-04-25T14:30:00Z",
    "stick_id": "V001",
    "operator_id": "D001"
  }
}
```

### 7.2 Tópicos MQTT

Os tópicos seguem a convenção hierárquica `cattle/<domínio>/<subdomain>/<action>`:

```
cattle/action/health/vaccination
cattle/action/health/parasite
cattle/action/repro/heat
cattle/action/repro/insemination
cattle/action/repro/pregnancy
cattle/action/repro/weaning
cattle/action/inventory/lot
cattle/action/inventory/weight
cattle/action/inventory/culling
cattle/event/water
cattle/event/gate
cattle/event/pasture
cattle/event/autoweigh
cattle/action/registration
```

---

## 8. Sistema de Build

### 8.1 CMake (`CMakeLists.txt`)

**Requisitos:** CMake ≥ 3.13, Pico SDK (variável de ambiente `PICO_SDK_PATH`).

**Ficheiros fonte compilados (10 unidades de compilação):**

```cmake
main.c
app/app_state.c
drivers/rfid.c
drivers/dht22.c
drivers/wifi_driver.c
drivers/display.c
drivers/time_util.c
menu/menu.c
mqtt/mqtt_client.c
payload/payload.c
```

**Bibliotecas linkadas:**

| Biblioteca | Fornecida por | Função |
|---|---|---|
| `pico_stdlib` | Pico SDK | stdlib, timers, GPIO básico |
| `pico_cyw43_arch_lwip_poll` | Pico SDK | WiFi CYW43 + LwIP em modo polling |
| `pico_lwip_sntp` | Pico SDK / LwIP | Cliente SNTP |
| `hardware_uart` | Pico SDK | UART0 para RDM6300 |
| `hardware_i2c` | Pico SDK | I2C1 para SSD1306 |
| `hardware_adc` | Pico SDK | ADC para joystick |
| `hardware_pwm` | Pico SDK | PWM para buzzer |
| `hardware_clocks` | Pico SDK | Cálculo de frequência PWM |
| `hardware_gpio` | Pico SDK | LED, botões, DHT22 |

**Artefactos de build gerados:**

| Ficheiro | Uso |
|---|---|
| `rfid_stick.uf2` | Drag-and-drop para o Pico em modo bootloader |
| `rfid_stick.elf` | Debug com GDB/OpenOCD |
| `rfid_stick.bin` | Flash via SWD |
| `rfid_stick.map` | Mapa de símbolos para análise de memória |

### 8.2 Processo de Build

```bash
export PICO_SDK_PATH=~/pico/pico-sdk
cd /home/leaonid/pico/rfid_stick
mkdir -p build && cd build
cmake ..
make -j4
# Resultado: build/rfid_stick.uf2
```

**Deploy:** Manter o botão BOOTSEL no Pico pressionado ao ligar → aparece como disco USB → copiar o `.uf2` → reinicia automaticamente.

---

## 9. Configuração Central

Todas as constantes de configuração estão centralizadas em `config.h`, evitando *magic numbers* dispersos pelo código.

```c
// Rede
#define WIFI_SSID           "PatioEmbarcados"
#define WIFI_PASSWORD       "embarcados"
#define WIFI_TIMEOUT_MS     20000
#define MQTT_BROKER_IP      "192.168.51.50"
#define MQTT_BROKER_PORT    1883
#define MQTT_CLIENT_ID      "rfid_stick_001"
#define MQTT_KEEPALIVE_S    60

// Pinos
#define RFID_RX_PIN         17
#define I2C_SDA_PIN         14
#define I2C_SCL_PIN         15
#define JOY_X_PIN           26
#define JOY_Y_PIN           27
#define JOY_BTN_PIN         22
#define BTN_A_PIN           5
#define LED_R_PIN           13
#define LED_G_PIN           11
#define LED_B_PIN           12
#define BUZZER_PIN          21
#define DHT22_PIN           4

// Temporização
#define RFID_DEBOUNCE_MS    2000
#define JOY_DEADZONE        400
#define JOY_COOLDOWN_MS     220
#define TELEMETRY_INTERVAL_MS 30000
```

---

## 10. Fluxos de Dados

### Leitura de Tag RFID → Publicação MQTT

```
Operador aproxima tag do RDM6300
         │
         ▼
rfid_poll() — lê bytes UART disponíveis (non-blocking)
         │ STX detectado → acumula 14 bytes
         ▼
parse_frame() — valida checksum XOR, decodifica hex
         │ frame válida
         ▼
Verifica debounce (2000 ms desde última leitura da mesma tag)
         │ passou
         ▼
main() entra em STATE_RFID_EVENT
         ├─ display_tag_confirm() — mostra ID + acção no OLED
         ├─ led_set(1,0.5,0) — LED laranja (a enviar)
         ├─ beep_ok() — 3 notas (880→1320→1760 Hz)
         ├─ dht22_read() — se has_telemetry == true
         ├─ payload_build() — constrói JSON (snprintf)
         ├─ mqtt_send(topic, json) — tcp_write() + tcp_output()
         │       ├─ sucesso: led verde
         │       └─ falha: led vermelho + beep_error()
         ├─ Espera 2 s (display de confirmação)
         ├─ rfid_renew_debounce() — previne re-leitura imediata
         └─ STATE_MENU
```

### Ligação WiFi + SNTP

```
boot
  │
wifi_driver_init() — cyw43_arch_wifi_connect_async()
  │
loop (600 ms)
  │
wifi_driver_poll()
  ├─ CYW43_LINK_UP → WIFI_CONNECTED
  │       └─ time_util_sntp_start() — inicia polling SNTP
  │               └─ LwIP envia pedido UDP ao pool.ntp.org
  │                       └─ resposta → time_util_sntp_callback(epoch)
  └─ timeout/erro → WIFI_FAILED (modo offline)
```

### Reconexão MQTT

```
mqtt_client_poll() chamado a cada ciclo (~10 ms)
  │
  ├─ MQTT_DISCONNECTED + timer ≥ 8 s
  │       └─ do_connect() → tcp_connect(broker_ip, 1883)
  │
  ├─ MQTT_CONNECTING + on_connected()
  │       └─ tcp_write(CONNECT packet)
  │
  ├─ MQTT_CONNECTED + timer ≥ 30 s
  │       └─ tcp_write(PINGREQ)
  │
  └─ Qualquer tcp_error() → MQTT_DISCONNECTED → retry em 8 s
```

---

## 11. Gestão de Erros e Recuperação

| Componente | Tipo de Falha | Comportamento |
|---|---|---|
| WiFi | Timeout 20 s | Entra em modo offline; menu funciona sem envio |
| WiFi | Autenticação inválida | Log USB; modo offline |
| MQTT | TCP recusado | Retry automático em 8 s |
| MQTT | CONNACK ≠ 0 | Log; retry em 8 s |
| MQTT | Broker desligado | Reconexão automática via state machine |
| MQTT | Publish falha | Retorna `false`; próxima tag tentará novamente |
| RFID | Checksum inválido | Trama descartada silenciosamente |
| RFID | Debounce violado | Leitura ignorada |
| DHT22 | Timeout de bit | `dht22_read()` retorna `false`; telemetria omitida |
| DHT22 | Checksum inválido | Log; valor anterior não actualizado |
| SNTP | Sem resposta | Timestamp fallback (relativo ao boot) |
| Display | Falha I2C | Operação best-effort; sem crash |

---

## 12. Análise de Memória

### RAM (264 KB disponíveis no RP2040)

| Região | Tamanho estimado |
|---|---|
| Heap LwIP (`MEM_SIZE`) | 8 KB |
| Framebuffer SSD1306 | 1 KB |
| Buffers MQTT (pacotes TCP) | ~1 KB |
| Stack principal | ~8 KB |
| Estado global (`AppState`, `MenuState`, etc.) | < 500 B |
| **Total estimado em uso** | **~19 KB** |
| **RAM disponível** | **~245 KB** |

### Flash (2 MB disponíveis)

| Região | Tamanho estimado |
|---|---|
| Pico SDK (stdlib + WiFi + LwIP) | ~512 KB |
| Código da aplicação | ~100 KB |
| **Flash disponível** | **~1,4 MB** |

---

## 13. Ferramentas e Bibliotecas Utilizadas

### Linguagem e Standard

| Item | Detalhe |
|---|---|
| Linguagem | C11 (ISO/IEC 9899:2011) |
| Compilador | `arm-none-eabi-gcc` (toolchain GNU ARM) |
| Standard C++ | C++17 (compatibilidade com SDK) |

### Raspberry Pi Pico SDK

A **Pico SDK** é o framework oficial da Raspberry Pi Foundation para desenvolvimento no RP2040. Fornece:

- Abstracção de hardware (GPIO, UART, I2C, ADC, PWM, timers)
- Drivers para o chip WiFi CYW43
- Integração com LwIP
- Sistema de build baseado em CMake
- Ferramenta de geração de UF2 para deploy

### LwIP (Lightweight IP)

Stack TCP/IP open-source originalmente desenvolvida por Adam Dunkels no SICS (Swedish Institute of Computer Science). Usada em centenas de produtos embarcados. Neste projeto opera em modo `NO_SYS` (sem RTOS) com API TCP raw.

### CMake

Sistema de build multi-plataforma (versão ≥ 3.13). O Pico SDK requer CMake para gerir as dependências e toolchain ARM.

### MQTT 3.1.1

Protocolo de mensagens publish/subscribe baseado em TCP, desenhado para dispositivos IoT com largura de banda limitada. Características usadas neste projeto:

- QoS 0 (fire and forget — sem confirmação de entrega)
- Keep-alive via PINGREQ/PINGRESP
- Clean session (sem estado persistente no broker)

### SNTP (Simple Network Time Protocol)

Versão simplificada do NTP, usada para sincronização de tempo via UDP. Fornecida pela biblioteca `pico_lwip_sntp` (integrada no LwIP).

### SSD1306

Driver para display OLED com controlador SSD1306 da Solomon Systech. A biblioteca `ssd1306.h` é auto-contida (single-header), sem dependências externas.

### RDM6300

Módulo leitor RFID de 125 kHz compatível com cartões EM4100/EM4102. Comunica por UART a 9600 baud com protocolo de trama proprietário.

### DHT22 (AM2302)

Sensor combinado de temperatura e humidade com protocolo 1-Wire proprietário. Requer gestão precisa de timings (leitura feita com IRQs desactivados).

### Ferramentas de Desenvolvimento

| Ferramenta | Uso |
|---|---|
| `arm-none-eabi-gcc` | Compilador cruzado para ARM Cortex-M0+ |
| `cmake` + `make` | Sistema de build |
| `picotool` | Inspeção e flash de binários Pico |
| `minicom` / `screen` | Monitor série USB para debug |
| `mosquitto_sub` | Verificação de mensagens MQTT no broker |
| OpenOCD + GDB | Debug via SWD (opcional) |

---

## 14. Questões Prováveis da Banca

### Arquitectura e Design

**Q1.** Por que optou por uma arquitectura bare-metal com polling em vez de usar um RTOS como o FreeRTOS?

> *Resposta esperada:* O sistema tem um único fluxo de controlo sem paralelismo real. O RTOS adicionaria overhead de contexto, complexidade de sincronização (mutexes/semáforos) e consumo de RAM adicional. O polling com ciclo de 10 ms é suficiente para as latências exigidas — o evento mais crítico (leitura RFID) tolera latências de dezenas de milissegundos. Além disso, o LwIP em modo `NO_SYS` (sem RTOS) é a configuração standard para o Pico W.

**Q2.** Explique a máquina de estados principal do firmware e como os estados transitam entre si.

> *Veja a secção 3.*

**Q3.** Como é garantida a não-preempção entre a leitura do DHT22 e outras operações do sistema?

> *Resposta esperada:* A leitura DHT22 desactiva as IRQs globais (~5 ms) para não perturbar os timings de bit. Este é um bloqueio intencional e controlado. Como o super-loop tem ciclo de ~10 ms, uma pausa de 5 ms é aceitável — não existem operações de tempo crítico que não possam tolerar 5 ms de atraso.

---

### Protocolo RFID

**Q4.** Descreva o formato de trama do RDM6300 e como é validada a integridade dos dados.

> *Veja a secção 4.1 — formato de 14 bytes com checksum XOR.*

**Q5.** O que é o anti-debounce no contexto do leitor RFID e por que é necessário?

> *Resposta esperada:* O RDM6300 transmite continuamente tramas enquanto uma tag está no campo electromagnético (~10 tramas/segundo). Sem debounce, o mesmo animal geraria dezenas de eventos por segundo. O firmware ignora a mesma `tag_id` durante 2000 ms após a primeira leitura válida.

**Q6.** Por que é necessário um level shifter entre o RDM6300 e o RP2040?

> *Resposta esperada:* O RDM6300 opera a 5 V e os seus pinos de saída UART enviam sinais a 5 V TTL. O RP2040 é tolerante apenas a 3,3 V nas GPIOs — aplicar 5 V nos pinos pode danicar permanentemente o chip. O level shifter (ou divisor resistivo) converte os 5 V para 3,3 V.

---

### Redes e MQTT

**Q7.** Por que implementou um cliente MQTT customizado em vez de usar a biblioteca `lwip/apps/mqtt.h` incluída no SDK?

> *Resposta esperada:* Controlo total sobre o comportamento de reconexão, gerência de erros e timings. A biblioteca oficial do LwIP usa callbacks assíncronos que podem ser complexos de depurar. A implementação customizada é mais simples, direccionada exactamente para QoS 0, e torna o comportamento de reconexão com backoff de 8 s completamente transparente e controlável.

**Q8.** Explique o que é QoS 0 no MQTT e quais as implicações para a confiabilidade do sistema.

> *Resposta esperada:* QoS 0 (at most once) significa que a mensagem é enviada uma única vez sem confirmação de recepção. O broker não envia PUBACK. Se a rede falhar no momento do envio, o evento é perdido. Para QoS 1 (at least once), o protocolo exigiria armazenar a mensagem localmente até receber o PUBACK, o que implicaria persistência em flash — não implementada neste firmware.

**Q9.** Como o firmware mantém a ligação MQTT activa ao longo do tempo?

> *Resposta esperada:* O protocolo MQTT 3.1.1 define um mecanismo de keep-alive: o cliente deve enviar PINGREQ dentro do intervalo `keep-alive` (60 s neste caso). O firmware envia PINGREQ a cada 30 s (metade do intervalo, como margem de segurança). Se o broker não receber nenhum pacote dentro de 1,5× o keep-alive, encerra a conexão.

**Q10.** Como funciona a sincronização de tempo via SNTP e como é mantida a precisão ao longo do tempo sem re-sincronizações frequentes?

> *Veja a secção 4.5 — armazenamento do epoch + offset do boot clock do RP2040.*

---

### Hardware e Periféricos

**Q11.** Explique o protocolo 1-Wire do DHT22 e por que são desactivadas as interrupções durante a leitura.

> *Veja a secção 4.4.*

**Q12.** Como é gerada uma tonalidade de frequência específica no buzzer com o RP2040?

> *Resposta esperada:* O RP2040 tem periférico PWM em todos os GPIO. Configura-se o divisor de clock (`hardware_clocks` fornece a frequência do sistema) e o wrap (top) do contador para que a frequência de saída do PWM corresponda à frequência desejada. Duty cycle fixado em 50% para tom puro. A função `buzzer_tone(freq_hz, ms)` calcula `wrap = sys_clock / freq_hz` e usa `sleep_ms(ms)` para a duração.

**Q13.** Qual a diferença de comunicação entre o I2C usado para o display e a UART usada para o RFID?

> *Resposta esperada:* I2C é um barramento síncrono multi-device com 2 fios (SDA, SCL) e endereçamento — o master inicia todas as transacções. UART é assíncrona, full-duplex, ponto-a-ponto, sem clock partilhado — a sincronização é feita por bits de start/stop e baud rate concordado. O SSD1306 usa I2C porque é um periférico de escrita frequente num barramento partilhado; o RDM6300 usa UART porque envia dados continuamente sem necessitar de polling.

---

### Software e Algoritmos

**Q14.** Como é construído o payload JSON sem usar uma biblioteca externa de serialização JSON?

> *Resposta esperada:* Usa `snprintf` com format strings para construir o JSON directamente num buffer de tamanho fixo (512 bytes). É suficiente para payloads de estrutura fixa e conhecida, sem necessidade de alocação dinâmica ou biblioteca como cJSON. A função retorna -1 se o buffer for insuficiente.

**Q15.** Explique o algoritmo de decomposição de data a partir de Unix epoch usado em `time_util.c`.

> *Resposta esperada:* Usa uma variante do algoritmo de eras de Zeller (era-based date decomposition). Em vez de loops iterativos (lentos), calcula directamente o ano, mês e dia usando divisão inteira com ciclos de 400 anos (146 097 dias), 100 anos e 4 anos. É O(1) em tempo e não requer tabelas de consulta.

**Q16.** Como é garantido que o display OLED não é redesenhado desnecessariamente a cada ciclo do super-loop?

> *Resposta esperada:* O sistema usa um **dirty flag** — o display só é redesenhado (`ssd1306_show()`) quando o estado do menu muda (detectado pelo retorno `true` de `menu_tick()`). Redesenhar a cada 10 ms enviaria 100 transferências I2C de 1024 bytes por segundo desnecessariamente.

**Q17.** Como é feita a navegação circular no menu (sem `if` para wrap-around)?

> *Resposta esperada:* `(current ± 1 + N) % N` — a adição de N antes do módulo garante que o resultado é sempre positivo, permitindo wrap-around em ambas as direcções sem condicionais.

---

### Sistema e Build

**Q18.** O que é um ficheiro `.uf2` e como é que o Pico o processa?

> *Resposta esperada:* UF2 (USB Flashing Format) é um formato de ficheiro binário criado pela Microsoft/Adafruit para facilitar o flash de microcontroladores via USB mass storage. Cada bloco UF2 tem 512 bytes com um cabeçalho que identifica o endereço de flash destino. Quando o Pico está em modo bootloader (BOOTSEL pressionado), apresenta-se como disco USB; ao copiar o `.uf2`, o bootloader RP2040 processa cada bloco e escreve os dados no flash interno.

**Q19.** Para que serve o ficheiro `lwipopts.h` e como afecta o comportamento da stack de rede?

> *Veja a secção 5.1.*

**Q20.** Como seria adicionado suporte para um segundo leitor RFID ao firmware?

> *Resposta esperada:* O RP2040 tem 2 UARTs. Seria necessário: (1) instanciar um segundo `rfid_driver` apontando para `uart1` num GPIO diferente; (2) chamar `rfid_poll()` para ambas as instâncias no super-loop; (3) o payload e o fluxo de evento já suportam qualquer `tag_hex` — bastaria identificar de qual leitor veio a leitura. Alternativamente, poderíamos usar PIO (Programmable I/O) para adicionar mais UARTs de software.

---

### Questões de Contexto e Aplicação

**Q21.** Que tipo de tags RFID são compatíveis com o sistema e quais são as suas características?

> *Resposta esperada:* Tags EM4100/EM4102 de 125 kHz — são tags passivas (sem bateria) que operam por indução electromagnética. Têm um ID de 40 bits (5 bytes) pré-programado de fábrica, imutável. O alcance típico com o RDM6300 é de 3–8 cm. São amplamente usadas em identificação animal (brincos RFID, bolus ruminais).

**Q22.** Quais são as limitações actuais do sistema e como poderiam ser mitigadas?

> *Resposta esperada:*
> - **Sem buffering offline:** Se o WiFi/MQTT falhar, os eventos são perdidos. Mitigação: armazenar eventos na flash do Pico (2 MB disponíveis) e re-enviar quando a ligação for restaurada.
> - **QoS 0:** Sem garantia de entrega. Mitigação: implementar QoS 1 com armazenamento local de mensagens não confirmadas.
> - **Menu fixo em código:** Não é reconfiguável remotamente. Mitigação: armazenar configuração em flash ou receber via MQTT.
> - **Sem OTA (Over-the-Air updates):** Requer acesso físico para actualizar firmware. Mitigação: implementar bootloader secundário com suporte a download MQTT/HTTP.
> - **MQTT_CLIENT_ID fixo:** Múltiplas unidades com o mesmo ID causam conflito no broker. Mitigação: usar endereço MAC como sufixo do ID.

**Q23.** Como é que o broker MQTT sabe de que animal e de que acção se trata, dado que as tags RFID apenas fornecem um número?

> *Resposta esperada:* O broker recebe o `animal_tag` (ID hexadecimal da tag), o `action_type` (seleccionado pelo operador no menu), o `stick_id` e o `operator_id`. A associação entre o ID da tag e o animal concreto (nome, espécie, historial) é feita por uma base de dados backend que consome as mensagens MQTT — o firmware é apenas o gateway de captura no campo.

---

*Documento gerado para suporte à arguição de banca — RFID Stick / Raspberry Pi Pico W*
