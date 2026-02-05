# RFID Handheld Stick – System Operation & MQTT Data Flow

Este documento descreve **como o sistema funciona na prática**, como o operador **seleciona as opções (menu)** na vara RFID e como ocorre o **envio dos dados via MQTT**, sem entrar em implementação de código.

---

## 1. Visão Geral do Sistema

A **vara RFID** é um dispositivo portátil composto por:
- Leitor **RFID** (para leitura do brinco do gado)
- Interface de **menu** (tela + botões)
- **Botões físicos** (navegação / confirmação / envio)
- Sensores de **telemetria ambiental**
- Conectividade **Wi-Fi + MQTT**

Ela produz **dois grandes tipos de mensagens MQTT**:

1. **Eventos relacionados ao gado** (baseados na leitura RFID)
2. **Telemetria ambiental** (envio periódico, independente do RFID)

---

## 2. Conceito Central: `current_mode`

A vara sempre opera com um **modo ativo**, chamado:

- `current_mode`

Esse modo define:
- **Qual ação está sendo registrada**
- **Qual tópico MQTT será usado**
- **Se o envio é automático ou exige confirmação**

---

## 3. Interface de Seleção (Menu)

### Interface típica
- **Tela LCD/OLED** mostrando:
  - `current_mode`
  - Status de Wi-Fi / MQTT
  - Última leitura RFID
  - Status do envio (ENVIADO / ERRO)
- **Botões físicos**:
  - `BTN_NEXT` → percorre opções do menu
  - `BTN_OK` → confirma a opção selecionada
  - `BTN_SEND` (opcional) → confirma envio da ação
- **Feedback físico**:
  - Buzzer ou vibração (leitura ok / envio ok / erro)

---

## 4. Tipos de Fluxo de Operação

### 4.1 Eventos Passivos (Scan → Auto Send)

Usado quando **basta encostar a vara no brinco**.

#### Exemplo: Bebedouro
1. Operador seleciona no menu:
   - `current_mode = water_drink`
2. Aproxima a vara do brinco
3. A vara:
   - lê `cattle_tag_id`
   - gera `timestamp`
   - publica MQTT automaticamente

#### Características
- Não exige botão de confirmação
- Ideal para eventos frequentes
- Minimiza interação humana

#### Exemplos de eventos passivos
- `water_drink`
- `corral_gate`
- `pasture_zone`
- `auto_weigh`

---

### 4.2 Ações Ativas (Select → Confirm → Scan → Send)

Usado quando **o operador precisa garantir a ação correta**.

#### Exemplo: Vacinação
1. Operador seleciona:
   - `current_mode = vaccination`
2. Define parâmetros:
   - `vaccine_type = fmd`
   - `dose_ml` (opcional)
3. Pressiona `BTN_SEND` (ou entra em modo “aguardando leitura”)
4. Aproxima a vara do brinco
5. Evento é publicado via MQTT

#### Características
- Evita registros acidentais
- Permite inserir dados extras
- Recomendado para ações críticas

#### Exemplos de ações ativas
- `vaccination`
- `parasite_control`
- `treatment`
- `feeding`
- `pregnancy_check`
- `lot_assignment`
- `manual_weight`
- `culling_flag`

---

## 5. Envio de Dados via MQTT

### 5.1 Estrutura de Tópicos

#### Eventos Passivos
- `cattle/event/water`
- `cattle/event/corral`
- `cattle/event/pasture`
- `cattle/event/weight`

#### Ações Ativas
- `cattle/action/health/vaccination`
- `cattle/action/health/parasite`
- `cattle/action/nutrition/feeding`
- `cattle/action/inventory/lot`

#### Telemetria
- `stick/telemetry/environment`

#### Sistema
- `stick/system/battery`
- `stick/system/rfid`
- `stick/system/mode`

---

### 5.2 Envelope Padrão de Mensagem

Todo evento segue o mesmo padrão básico:

- `device_id`
- `operator_id`
- `cattle_tag_id` (quando aplicável)
- `action_type`
- `timestamp`
- `location_id` (opcional)
- `metadata` (dados específicos da ação)

Essa padronização facilita:
- Armazenamento no banco de dados
- Análise posterior
- Integração com dashboards (Grafana, BI)

---

## 6. Telemetria Ambiental

### Funcionamento
- Executa **em paralelo** às leituras RFID
- Usa um temporizador:
  - `sample_interval_s` (ex: 60s, 300s)

### Dados enviados
- `temperature_c`
- `humidity_percent`
- `fire_detected`
- `gas_ppm` (opcional)
- `battery_percent`
- `rssi_dbm` (opcional)

### Tópico
- `stick/telemetry/environment`

---

## 7. Regras Práticas Recomendadas

### 7.1 Anti-Duplicação
- Janela de bloqueio:
  - `duplicate_window_s`
- Evita múltiplos registros do mesmo brinco em poucos segundos

### 7.2 Confirmação Obrigatória
Ações que **devem exigir botão**:
- `vaccination`
- `treatment`
- `culling_flag`

### 7.3 Estados Claros na Tela
- `MODE: vaccination (fmd)`
- `WAITING RFID...`
- `SENT ✓`
- `MQTT OFFLINE (queued)`

### 7.4 Fila Local (opcional)
- Se MQTT/Wi-Fi cair:
  - Eventos ficam em buffer local
  - Envio automático quando a conexão voltar

---

## 8. Resumo Conceitual

- **Menu define o significado da leitura RFID**
- **RFID fornece a identidade do animal**
- **MQTT transporta eventos padronizados**
- **Telemetria roda continuamente**
- **Tudo converge para um banco central + dashboards**

Esse modelo permite escalar o sistema sem mudar o firmware da vara — apenas adicionando novos `action_type` e tópicos no servidor.
