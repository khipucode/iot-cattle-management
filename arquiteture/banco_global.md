# Banco de Dados – Descrição Funcional das Tabelas e Campos
## Plataforma Integrada de Monitoramento de Granja (RFID + Visão + Telemetria)

Este documento descreve **o papel de cada tabela**, **o significado de cada campo** e **como elas se relacionam** dentro da arquitetura do projeto.

---

## 1) Cadastro Central do Rebanho (Identidade Única do Boi)

### 1.1 `cattle`
**Função no projeto**  
Tabela mestre dos bois. Representa **a identidade única de cada animal** no sistema.  
Todos os eventos RFID, vacinações, pesagens e análises **se conectam a esta tabela** via `cattle_id`.

| Campo | Descrição |
|-----|-----------|
| `cattle_id` | Identificador interno único do boi (imutável, usado em todo o banco) |
| `ear_tag_code` | Código do brinco RFID atualmente ativo |
| `birth_date` | Data de nascimento do boi |
| `breed` | Raça do animal |
| `purchase_price` | Preço de compra (controle econômico) |
| `photo_url` | Foto do animal para identificação visual |
| `created_at` | Data de cadastro no sistema |
| `status` | Situação atual (`active`, `sold`, `dead`, `missing`) |
| `current_lot_id` | Lote atual do boi |
| `current_site_id` | Local atual conhecido (curral, pasto, etc.) |

**Relacionamentos**
- 1:N com `ear_tags`
- 1:N com `events_raw`
- 1:1 com `cattle_presence_state`

---

### 1.2 `ear_tags`
**Função no projeto**  
Histórico de brincos RFID. Permite **trocar o brinco físico** sem perder o histórico do boi.

| Campo | Descrição |
|-----|-----------|
| `tag_id` | Identificador do registro do brinco |
| `cattle_id` | Boi ao qual o brinco pertence |
| `ear_tag_code` | Código RFID físico |
| `valid_from` | Início da validade do brinco |
| `valid_to` | Fim da validade (NULL = ativo) |
| `note` | Observações sobre troca ou dano |

**Relacionamentos**
- N:1 com `cattle`
- Usado na ingestão de eventos RFID para resolver `cattle_id`

---

## 2) Estrutura Física da Granja

### 2.1 `sites`
**Função no projeto**  
Representa **unidades físicas principais** da granja (fazenda, curral, pasto).

| Campo | Descrição |
|-----|-----------|
| `site_id` | Identificador do local |
| `site_code` | Código único do local |
| `site_name` | Nome legível |
| `site_type` | Tipo do local (farm, corral, pasture, etc.) |

**Relacionamentos**
- 1:N com `locations`
- 1:N com `devices`
- 1:N com `events_raw`

---

### 2.2 `locations`
**Função no projeto**  
Define **pontos específicos** dentro de um site (bebedouro, portão, piquete).

| Campo | Descrição |
|-----|-----------|
| `location_id` | Identificador do ponto |
| `location_code` | Código único |
| `site_id` | Site ao qual pertence |
| `location_name` | Nome do ponto |
| `location_type` | Tipo (gate, water_point, paddock, scale) |

**Relacionamentos**
- N:1 com `sites`
- 1:N com `events_raw`

---

### 2.3 `lots`
**Função no projeto**  
Agrupamento lógico dos bois para manejo e logística.

| Campo | Descrição |
|-----|-----------|
| `lot_id` | Identificador do lote |
| `lot_code` | Código único |
| `lot_name` | Nome do lote |
| `site_id` | Local onde o lote existe |

**Relacionamentos**
- 1:N com `cattle`

---

## 3) Usuários e Dispositivos

### 3.1 `devices`
**Função no projeto**  
Cadastro de equipamentos que geram dados (vara RFID, Jetson, gateway).

| Campo | Descrição |
|-----|-----------|
| `device_id` | Identificador do dispositivo |
| `device_type` | Tipo (`rfid_stick`, `jetson`, `gateway`) |
| `site_id` | Local associado |
| `created_at` | Data de registro |
| `last_seen_at` | Última comunicação |

**Relacionamentos**
- 1:N com `events_raw`

---

### 3.2 `operators`
**Função no projeto**  
Pessoas que operam o sistema (vaqueiro, veterinário, admin).

| Campo | Descrição |
|-----|-----------|
| `operator_id` | Identificador do operador |
| `name` | Nome |
| `role` | Função (admin, vet, worker) |

**Relacionamentos**
- 1:N com `events_raw`

---

## 4) Camada Central de Eventos (Coração do Sistema)

### 4.1 `events_raw`
**Função no projeto**  
**Tabela mais importante do banco.**  
Armazena **todos os eventos** vindos da vara RFID, sensores, visão computacional e sistema.

| Campo | Descrição |
|-----|-----------|
| `event_id` | Identificador único do evento |
| `source` | Origem (`rfid`, `telemetry`, `vision`, `alert`) |
| `device_id` | Dispositivo que gerou o evento |
| `operator_id` | Operador (se aplicável) |
| `received_at` | Hora de ingestão no servidor |
| `event_time` | Hora real do evento |
| `action_type` | Tipo da ação (`water_drink`, `vaccination`, etc.) |
| `action_category` | Categoria (`passive`, `active`, `telemetry`, `vision`) |
| `site_id` | Local do evento |
| `location_id` | Ponto específico |
| `ear_tag_code` | Brinco lido (se houver) |
| `cattle_id` | Boi associado (resolvido no servidor) |
| `payload_json` | Dados completos do evento |
| `hash` | Hash para deduplicação |
| `ingest_status` | Status da ingestão (`ok`, `unknown_tag`, etc.) |

**Relacionamentos**
- N:1 com `cattle`
- Base para todas as análises e tabelas derivadas

---

## 5) Estado Atual do Rebanho (Presença)

### 5.1 `cattle_presence_state`
**Função no projeto**  
Guarda **o estado atual de cada boi**, calculado a partir dos eventos RFID.

| Campo | Descrição |
|-----|-----------|
| `cattle_id` | Boi |
| `current_site_id` | Local atual |
| `current_location_id` | Ponto específico |
| `presence_status` | `inside`, `outside`, `unknown` |
| `last_seen_at` | Última leitura |
| `last_event_id` | Evento que definiu o estado |

**Relacionamentos**
- 1:1 com `cattle`
- Atualizada por eventos `corral_gate`, `pasture_zone`

---

## 6) Saúde e Manejo Sanitário

### 6.1 `vaccinations`
**Função no projeto**  
Registro formal de vacinações para auditoria e controle sanitário.

| Campo | Descrição |
|-----|-----------|
| `vaccination_id` | Identificador |
| `event_id` | Evento que originou o registro |
| `cattle_id` | Boi vacinado |
| `vaccine_type` | Tipo de vacina |
| `dose_ml` | Dose aplicada |
| `batch_id` | Lote da vacina |
| `next_due_date` | Próxima aplicação |
| `applied_at` | Data da aplicação |

**Relacionamentos**
- 1:1 com `events_raw`
- N:1 com `cattle`

---

## 7) Telemetria Ambiental

### 7.1 `environment_samples`
**Função no projeto**  
Armazena dados ambientais enviados periodicamente pela vara ou sensores.

| Campo | Descrição |
|-----|-----------|
| `sample_id` | Identificador |
| `event_id` | Evento MQTT correspondente |
| `site_id` | Local monitorado |
| `location_id` | Ponto específico |
| `temperature_c` | Temperatura |
| `humidity_percent` | Umidade |
| `fire_detected` | Detecção de fogo |
| `gas_ppm` | Gás (opcional) |
| `battery_percent` | Bateria do dispositivo |
| `measured_at` | Momento da medição |

---

## 8) Visão Computacional (Nível de Rebanho)

### 8.1 `vision_site_summary`
**Função no projeto**  
Resumo de análises por câmera/site (não individual por boi).

| Campo | Descrição |
|-----|-----------|
| `vision_id` | Identificador |
| `event_id` | Evento MQTT |
| `site_id` | Local monitorado |
| `camera_id` | Câmera |
| `timestamp` | Momento da análise |
| `cattle_count` | Número de bois detectados |
| `anomaly_detected` | Anomalia detectada |
| `anomaly_classes` | Tipos de anomalia |
| `boundary_violation` | Violação de limite |
| `cattle_outside_count` | Bois fora da área |
| `activity_level` | Nível de atividade |
| `confidence_avg` | Confiança média |
| `frame_window_s` | Janela de agregação |
| `model_version` | Versão do modelo |

---

## 9) Alertas e Inteligência (Gateway Python)

### 9.1 `alerts`
**Função no projeto**  
Registro de alertas automáticos gerados por scripts Python ou regras do sistema.

| Campo | Descrição |
|-----|-----------|
| `alert_id` | Identificador |
| `created_at` | Data do alerta |
| `severity` | Gravidade |
| `alert_type` | Tipo |
| `site_id` | Local |
| `location_id` | Ponto |
| `cattle_id` | Boi (se aplicável) |
| `related_event_id` | Evento que originou |
| `message` | Mensagem humana |
| `details_json` | Detalhes técnicos |
| `status` | Estado (`open`, `ack`, `closed`) |

---

## Visão Geral de Integração
- **RFID Stick** → `events_raw` → estado do boi + histórico
- **Jetson (Visão)** → `vision_site_summary`
- **App/Web** → cadastro + dashboards
- **Gateway Python** → análise em tempo real + `alerts`
- **Tudo converge no `events_raw`**, que é o “log da verdade” do sistema
