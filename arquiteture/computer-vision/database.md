# 🐄 Subsistema de Visão Computacional – Plataforma de Monitoramento de Gado

## 📦 Resumo das Variáveis – Subsistema de Visão Computacional (MQTT / Banco de Dados)

| Variável | Tipo sugerido (MariaDB) | Obrigatória | Descrição |
|----------|--------------------------|-------------|-----------|
| `site_id` | VARCHAR(64) | ✅ | Identificador único do local monitorado (curral, pasto, fazenda, etc.) |
| `site_name` | VARCHAR(128) | ✅ | Nome legível do local |
| `camera_id` | VARCHAR(64) | ❌ | Identificador da câmera IP |
| `timestamp` | DATETIME | ✅ | Data e hora da medição (UTC, ISO 8601) |
| `cattle_count` | INT | ✅ | Quantidade de bois detectados na ROI |
| `anomaly_detected` | BOOLEAN | ✅ | Indica se foi detectada alguma anomalia (pessoa, veículo, etc.) |
| `anomaly_classes` | VARCHAR(255) | ❌ | Classes detectadas como anomalia (ex: `person,vehicle`) |
| `boundary_violation` | BOOLEAN | ✅ | Indica se houve violação de limite geográfico |
| `cattle_outside_count` | INT | ❌ | Quantidade de bois fora da área permitida |
| `activity_level` | ENUM('low','normal','high') | ❌ | Nível de atividade/movimentação do rebanho |
| `confidence_avg` | FLOAT | ❌ | Confiança média das detecções |
| `frame_window_s` | INT | ❌ | Janela de agregação das medições (em segundos) |
| `model_version` | VARCHAR(64) | ❌ | Versão do modelo de visão computacional utilizado |

---


## 🎯 Objetivo

Projetar e implementar um **subsistema de visão computacional** capaz de extrair métricas e eventos visuais de ambientes pecuários (pasto, curral, área de alimentação) e enviá-los em **quase tempo real** para uma plataforma IoT central utilizando **MQTT**, onde os dados serão armazenados em **MariaDB** e visualizados em **Grafana**.

---

## 🧱 Visão Geral da Arquitetura

- 📷 **Câmera IP (RTSP/ONVIF)** – fornece o fluxo de vídeo ao vivo  
- 🧠 **NVIDIA Jetson (Edge AI)** – executa detecção e análises em tempo real

## Software no Gateway
- 📡 **Broker MQTT (Mosquitto)** – transporte das mensagens  
- 🗄️ **MariaDB** – persistência dos dados  
- 📊 **Grafana** – dashboards e alertas

---

## ⚙️ Funcionalidades do Subsistema

### 1️⃣ Contagem de bois (baseada em ROI)

- Contar os bois dentro de uma **Região de Interesse (ROI)** previamente definida.
- Útil para monitorar tamanho do rebanho, comportamento alimentar e ocupação de áreas.

**Saída:**  
`cattle_count` (inteiro)

---

### 2️⃣ Detecção de anomalias / intrusão

Detectar objetos inesperados no cenário, como:

- 👤 Pessoas  
- 🚗 Veículos  
- 🐕 Outros animais  
- ⚙️ Classes configuráveis

**Saída:**  
`anomaly_detected` (booleano)  
Opcional: `anomaly_classes` (lista/string)

---

### 3️⃣ Violação de limites (geofence)

Detectar se bois ultrapassam limites espaciais pré-definidos:

- Saída do pasto  
- Entrada em áreas restritas  
- Cruzamento de linhas de segurança

**Saída:**  
`boundary_violation` (booleano)  
Opcional: `cattle_outside_count` (inteiro)

---

### 4️⃣ Análise de padrão de movimento (opcional – futuro)

Detecção de atividade anormal do rebanho:

- 🟢 Baixa movimentação  
- 🟡 Normal  
- 🔴 Agitação excessiva ou corrida

**Saída opcional:**  
`activity_level` (`low | normal | high`)

---

## 🧠 Estratégia de Computação em Borda (Edge Computing)

Todo o processamento é realizado **localmente no Jetson**, incluindo:

- Detecção de objetos com YOLO  
- Filtragem espacial (ROI e limites)  
- Lógica de eventos (anomalia e violação)  
- Agregação temporal (ex.: a cada 5 segundos)

### Benefícios:

- ✅ Baixa latência  
- ✅ Menor uso de banda  
- ✅ Operação offline  
- ✅ Alta escalabilidade

> Recomenda-se utilizar **um único serviço/script unificado** para detecção, análise e publicação via MQTT.

---

## 📦 Modelo de Dados (Payload MQTT em JSON)

Todas as métricas são enviadas em **uma única mensagem** para **um único tópico**.

### Campos obrigatórios

- `site_id` – identificador único do local  
- `site_name` – nome do local  
- `cattle_count` – número de bois detectados  
- `anomaly_detected` – verdadeiro/falso  
- `boundary_violation` – verdadeiro/falso  
- `timestamp` – data e hora em formato ISO 8601 (UTC)

### Metadados recomendados

- `camera_id`  
- `frame_window_s` – janela de agregação  
- `model_version`  
- `confidence_avg`

---

## 📡 Comunicação MQTT

### Tópico


## 🧠 Observações de Projeto

- Todas as variáveis são enviadas dentro de **um único JSON** no tópico:



