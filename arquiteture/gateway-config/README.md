# IoT Cattle Management — Documentação do Sistema

Sistema de gerenciamento de gado baseado em IoT, rodando em um Raspberry Pi via Docker.
Coleta dados de sensores/leitores RFID via MQTT, persiste em MariaDB e exibe em Grafana.
A webapp Flask serve uma interface em tempo real via WebSocket (Socket.IO).

---

## Índice

1. [Visão Geral da Arquitetura](#1-visão-geral-da-arquitetura)
2. [Containers Docker](#2-containers-docker)
3. [Rede Docker](#3-rede-docker)
4. [Árvore de Arquivos](#4-árvore-de-arquivos)
5. [Banco de Dados](#5-banco-de-dados)
6. [Tópicos MQTT](#6-tópicos-mqtt)
7. [Serviços e Portas](#7-serviços-e-portas)
8. [Dependências por Serviço](#8-dependências-por-serviço)
9. [Como Operar](#9-como-operar)
10. [Credenciais](#10-credenciais)
11. [Problemas Conhecidos e Correções Aplicadas](#11-problemas-conhecidos-e-correções-aplicadas)

---

## 1. Visão Geral da Arquitetura

```
  [Dispositivos IoT / RFID / Sensores]
           |  publica MQTT
           v
  ┌─────────────────────┐
  │  Mosquitto (MQTT)   │  :1883 (TCP)  :9001 (WebSocket)
  └─────────┬───────────┘
            │ subscreve tópico fazenda/sensores/#
            │                          │ subscreve cattle/action/registration
            v                          v
  ┌──────────────────┐       ┌──────────────────────┐
  │    Consumidor    │       │   Flask Webapp        │
  │  (Python/MQTT)   │       │  (Flask + Socket.IO)  │
  └────────┬─────────┘       └──────────┬────────────┘
           │ INSERT                      │ emit WebSocket
           v                             v
  ┌──────────────────┐        [Browser do operador]
  │   MariaDB        │         (atualização em tempo real
  │   (bovinos DB)   │          de leitura de tag RFID)
  └────────┬─────────┘
           │ consulta SQL
           v
  ┌──────────────────┐
  │    Grafana       │  :3000
  └──────────────────┘
           |
  ┌──────────────────┐
  │    Portainer     │  :9000  (gerenciamento Docker via UI)
  └──────────────────┘
```

**Fluxo principal:**
1. Dispositivo IoT publica mensagem JSON no broker Mosquitto
2. `consumidor` recebe, valida e insere nas tabelas `events_raw`, `cattle_weights` e/ou `environment_samples`
3. Grafana consulta MariaDB e exibe dashboards em tempo real
4. Quando um leitor RFID publica em `cattle/action/registration`, a webapp Flask recebe via MQTT e faz push via WebSocket para o browser do operador

---

## 2. Containers Docker

Todos os containers em produção estão na rede `fazenda-net`.
O docker-compose principal é: `docker-compose-fazenda.yml`

### `fazenda-mosquitto` — Broker MQTT
| Campo | Valor |
|---|---|
| Imagem | `eclipse-mosquitto` (latest) |
| Restart | `unless-stopped` |
| Portas | `1883` (MQTT TCP), `9001` (MQTT WebSocket) |
| Config | `./dados/mosquitto/config/mosquitto.conf` |
| Dados persistidos | `./dados/mosquitto/data/`, `./dados/mosquitto/log/` |
| Autenticação | Anônima permitida (`allow_anonymous true`) |
| Healthcheck | `nc -z localhost 1883` |

### `fazenda-db` — Banco de Dados
| Campo | Valor |
|---|---|
| Imagem | `mariadb:10.11` |
| Restart | `unless-stopped` |
| Porta | `3306` |
| Database | `bovinos` |
| Usuário app | `fazendeiro` / `senhaFazenda` |
| Root password | `senhaForte` |
| Init scripts | `./init-scripts/01_structure.sql`, `02_data.sql` |
| Dados persistidos | `./dados/mariadb/` |
| Healthcheck | `mysqladmin ping` |

### `fazenda-grafana` — Dashboards
| Campo | Valor |
|---|---|
| Imagem | `grafana/grafana:12.1.0` |
| Restart | `unless-stopped` |
| Porta | `3000` |
| Auth | Anônima habilitada, role `Editor` |
| Datasource provisionado | MariaDB `fazenda-db:3306` banco `bovinos` |
| Dashboards | `./grafana/provisioning/dashboards/` |
| Dados persistidos | `./dados/grafana/` |
| Healthcheck | `curl http://localhost:3000/login` |
| Depende de | `fazenda-db` (healthy) |

### `fazenda-consumidor` — Consumidor MQTT → DB
| Campo | Valor |
|---|---|
| Imagem | Build local `./consumidor/Dockerfile` |
| Restart | Desabilitado (comentado no compose) |
| Porta interna | `8000` (healthcheck endpoint `/health`) |
| Tópico MQTT | `fazenda/sensores/#` |
| Base Python | `python:3.11-slim` |
| Dependências | `paho-mqtt==1.6.1`, `mysql-connector-python==9.0.0`, `flask` |
| Depende de | `fazenda-db` (healthy) + `fazenda-mosquitto` (healthy) |
| Logs | `./consumidor/logs/` |
| Status atual | **Exited** — restart desabilitado, iniciar manualmente quando necessário |

### `cattle_webapp` — Interface Web em Tempo Real
| Campo | Valor |
|---|---|
| Imagem | Build local `./webapp/Dockerfile` |
| Porta | `5000` |
| Tópico MQTT ouvido | `cattle/action/registration` |
| Base Python | `python:3.9-slim` |
| Dependências | `Flask==3.0.0`, `flask-socketio==5.3.6`, `paho-mqtt==2.1.0` |
| Volume | `./webapp:/app` (bind mount) |
| Rede | `fazenda-net` |
| Status atual | **Rodando** |
| Criação | Manual (`docker run`) — não está no docker-compose |

> **Atenção:** `cattle_webapp` não faz parte do `docker-compose-fazenda.yml`.
> Foi criado manualmente. Ao recriar, usar o comando da seção [Como Operar](#9-como-operar).

### `cattle_portainer` — Gerenciamento Docker UI
| Campo | Valor |
|---|---|
| Imagem | `portainer/portainer-ce:latest` |
| Porta | `9000` (HTTP), `9443` (HTTPS), `8000` (agent) |
| Restart | `unless-stopped` |
| Criação | Manual — não está no docker-compose |

### `fazenda-gerador` — Gerador de Dados de Teste
| Campo | Valor |
|---|---|
| Imagem | Build local `./Pasta_Testes_Populate/Dockerfile` |
| Restart | `"no"` — roda uma vez e para |
| Tópicos publicados | `fazenda/sensores/evento`, `fazenda/sensores/peso`, `fazenda/sensores/ambiente` |
| Base Python | `python:3.11-slim` |
| Status atual | **Exited** — ferramenta de teste, não produção |

---

## 3. Rede Docker

**Nome da rede:** `fazenda-net` (bridge)

| Container | IP na rede interna |
|---|---|
| `fazenda-mosquitto` | `172.20.0.2` |
| `fazenda-db` | `172.20.0.3` |
| `cattle_webapp` | `172.20.0.4` |
| `fazenda-grafana` | atribuído dinamicamente |
| `fazenda-consumidor` | atribuído quando rodando |

Os containers se comunicam pelo **nome do container** (DNS interno Docker):
- `fazenda-mosquitto` resolve para o broker
- `fazenda-db` resolve para o MariaDB
- `fazenda-grafana` se conecta ao datasource via `fazenda-db:3306`

---

## 4. Árvore de Arquivos

```
/home/admin/iot-cattle-management/
│
├── docker-compose-fazenda.yml        # Compose principal (mosquitto, db, grafana, consumidor, gerador)
│
├── webapp/                           # Flask + Socket.IO (cattle_webapp)
│   ├── Dockerfile
│   ├── main.py                       # App principal: Flask + MQTT + WebSocket
│   ├── main_bk.py                    # Backup da versão anterior
│   ├── requirements.txt              # Flask, flask-socketio, paho-mqtt
│   ├── templates/
│   │   ├── index_new.html            # Frontend ativo (rota /)
│   │   └── index_bkp.html            # Backup do frontend
│   └── backend/                      # (pasta auxiliar)
│
├── consumidor/                       # Consumidor MQTT → MariaDB (fazenda-consumidor)
│   ├── Dockerfile
│   ├── consumidor.py                 # Script principal
│   ├── consumidor_cópia.py           # Backup
│   ├── requirements.txt              # paho-mqtt, mysql-connector-python, flask
│   └── logs/                         # Logs em tempo de execução
│
├── Pasta_Testes_Populate/            # Gerador de dados de teste (fazenda-gerador)
│   ├── Dockerfile
│   ├── populate_data.py              # Publica dados aleatórios no MQTT
│   └── requirements.txt              # paho-mqtt
│
├── grafana/
│   └── provisioning/
│       ├── datasources/
│       │   └── mariadb.yaml          # Datasource automático: MariaDB bovinos
│       └── dashboards/
│           └── default.yaml          # Provider de dashboards (path /etc/grafana/provisioning/dashboards)
│
├── dados/                            # Volumes persistidos (não versionados)
│   ├── mosquitto/
│   │   ├── config/
│   │   │   └── mosquitto.conf        # Config do broker
│   │   ├── data/
│   │   │   └── mosquitto.db          # Persistência de mensagens
│   │   └── log/
│   │       └── mosquitto.log
│   ├── mariadb/                      # Dados do banco (gerenciado pelo container)
│   └── grafana/                      # Dashboards, plugins, configurações salvas
│
├── init-scripts/                     # Executados na criação do container MariaDB
│   ├── 01_structure.sql              # DDL: criação de todas as tabelas
│   └── 02_data.sql                   # DML: dados iniciais (gado, operadores, etc.)
│
├── arquiteture/                      # Documentação de arquitetura (diagramas, PlantUML)
│   ├── readme.md
│   ├── db_global_architecture.md
│   ├── er_diagram_db_global.puml
│   ├── computer-vision/
│   │   └── database.md
│   ├── RFID_telemetry_embedded/
│   │   ├── description.md
│   │   └── select_tree_diagram.txt
│   └── software/
│       ├── readme.md
│       └── basic_diagram.md
│
├── docs/                             # Documentação operacional
│   ├── arquitetura_sistema.md
│   ├── guia_docker.md
│   └── diagramas/
│       └── func_leitor.md
│
├── bovinos.sql                       # Dump completo do banco (backup)
├── bovinos_structure.sql             # Apenas estrutura
├── bovinos_data.sql                  # Apenas dados
└── events_raw/                       # (pasta auxiliar de eventos brutos)
```

---

## 5. Banco de Dados

**Database:** `bovinos`  
**Engine:** MariaDB 10.11

### Tabelas

| Tabela | Descrição |
|---|---|
| `cattle` | Cadastro do gado (ear_tag, raça, status, lote) |
| `cattle_births` | Registro de nascimentos (mãe, cria, data, local) |
| `cattle_breeding` | Reprodução (fêmea, macho, método, resultado) |
| `cattle_deaths` | Mortes (causa, data, operador) |
| `cattle_feeding` | Alimentação (tipo, quantidade, data) |
| `cattle_health` | Saúde (diagnóstico, tratamento, veterinário) |
| `cattle_milking` | Ordenha (quantidade de leite, data) |
| `cattle_missing` | Animais extraviados |
| `cattle_movements` | Movimentações entre lotes/locais |
| `cattle_photos` | Fotos dos animais |
| `cattle_weights` | Pesagens (peso, data, local) |
| `devices` | Dispositivos IoT registrados |
| `environment_samples` | Amostras ambientais (temperatura, umidade) |
| `events_raw` | Todos os eventos brutos recebidos via MQTT |
| `alerts` | Alertas gerados (saúde, dispositivo, ambiente, segurança) |
| `lots` | Lotes de gado |
| `locations` | Localizações dentro dos sites |
| `operators` | Operadores/usuários do sistema |
| `sites` | Fazendas/propriedades |

### Diagrama de dependências (chaves estrangeiras principais)

```
sites ──────────────┐
locations ──────────┤──► events_raw
operators ──────────┤──► cattle_weights
cattle ─────────────┤──► environment_samples
devices ────────────┤──► alerts
lots ───────────────┘
        │
        ▼
     cattle
    (ear_tag_code UNIQUE)
```

---

## 6. Tópicos MQTT

| Tópico | Publisher | Subscriber | Descrição |
|---|---|---|---|
| `fazenda/sensores/#` | dispositivos IoT / gerador | `fazenda-consumidor` | Todos os eventos de sensores |
| `fazenda/sensores/evento` | gerador de testes | consumidor | Eventos de entrada/saída/vacinação |
| `fazenda/sensores/peso` | gerador de testes | consumidor | Pesagens de animais |
| `fazenda/sensores/ambiente` | gerador de testes | consumidor | Temperatura e umidade |
| `cattle/action/registration` | leitor RFID | `cattle_webapp` (Flask) | Leitura de tag de identificação |

### Formato dos payloads (JSON)

**Evento (`fazenda/sensores/evento`):**
```json
{
  "cattle_id": 5,
  "device_id": "2",
  "operator_id": 1,
  "site_id": 2,
  "location_id": 3,
  "event_type": "entrada_curral",
  "event_time": "2025-03-30 14:00:00",
  "other_data": {"obs": "animal entrou"}
}
```

**Peso (`fazenda/sensores/peso`):**
```json
{
  "cattle_id": 5,
  "weight_date": "2025-03-30 14:00:00",
  "weight": 320.5,
  "location_id": 3,
  "notes": "Pesagem automática"
}
```

**Ambiente (`fazenda/sensores/ambiente`):**
```json
{
  "site_id": 1,
  "location_id": 2,
  "sample_time": "2025-03-30 14:00:00",
  "temperature": 28.4,
  "humidity": 65,
  "other_data": {"obs": "Coleta automática"}
}
```

**Registro RFID (`cattle/action/registration`):**
```json
{
  "animal_tag": "BR001234"
}
```

---

## 7. Serviços e Portas

| Porta | Protocolo | Serviço | Acesso externo |
|---|---|---|---|
| `1883` | TCP | MQTT (Mosquitto) | Sim — dispositivos IoT |
| `9001` | WebSocket | MQTT over WS (Mosquitto) | Sim — clientes browser |
| `3000` | HTTP | Grafana | Sim — `http://192.168.51.50:3000` |
| `3306` | TCP | MariaDB | Sim (exposto, recomendável fechar firewall) |
| `5000` | HTTP | Flask Webapp | Sim — `http://192.168.51.50:5000` |
| `9000` | HTTP | Portainer UI | Sim — `http://192.168.51.50:9000` |

---

## 8. Dependências por Serviço

### webapp (`cattle_webapp`) — `webapp/requirements.txt`
```
Flask==3.0.0
flask-socketio==5.3.6
paho-mqtt==2.1.0
```

### consumidor (`fazenda-consumidor`) — `consumidor/requirements.txt`
```
paho-mqtt==1.6.1
mysql-connector-python==9.0.0
flask
```

### gerador de dados (`fazenda-gerador`) — `Pasta_Testes_Populate/requirements.txt`
```
paho-mqtt>=1.6.1
```

---

## 9. Como Operar

### Iniciar todos os serviços do compose
```bash
cd /home/admin/iot-cattle-management
docker compose -f docker-compose-fazenda.yml up -d
```

### Parar todos os serviços do compose
```bash
docker compose -f docker-compose-fazenda.yml down
```

### Ver status de todos os containers
```bash
docker ps -a
```

### Ver logs de um container
```bash
docker logs fazenda-consumidor --tail 50 -f
docker logs cattle_webapp --tail 50 -f
docker logs fazenda-mosquitto --tail 50
```

### Recriar o container cattle_webapp (Flask)
> Necessário após mudanças em `main.py` ou `requirements.txt`

```bash
# Reconstruir imagem
cd /home/admin/iot-cattle-management/webapp
sudo docker build -t iot-cattle-management-flask-app .

# Recriar container
docker rm -f cattle_webapp
docker run -d \
  --name cattle_webapp \
  --network fazenda-net \
  -p 5000:5000 \
  -v /home/admin/iot-cattle-management/webapp:/app \
  iot-cattle-management-flask-app
```

### Iniciar o consumidor manualmente
```bash
docker start fazenda-consumidor
# ou recriar com compose:
docker compose -f docker-compose-fazenda.yml up -d consumidor
```

### Rodar o gerador de dados de teste
```bash
docker compose -f docker-compose-fazenda.yml run --rm gerador-dados
# ou diretamente:
docker start fazenda-gerador
```

### Reconstruir imagem do consumidor
```bash
cd /home/admin/iot-cattle-management
docker compose -f docker-compose-fazenda.yml build consumidor
docker compose -f docker-compose-fazenda.yml up -d consumidor
```

### Acessar o banco de dados
```bash
# Via container
docker exec -it fazenda-db mariadb -u fazendeiro -psenhaFazenda bovinos

# Consultas úteis
SELECT cattle_id, ear_tag_code, status FROM cattle;
SELECT * FROM events_raw ORDER BY id DESC LIMIT 20;
SELECT * FROM cattle_weights ORDER BY weight_date DESC LIMIT 20;
```

### Publicar mensagem MQTT de teste manual
```bash
docker exec -it fazenda-mosquitto mosquitto_pub \
  -h localhost -p 1883 \
  -t "fazenda/sensores/evento" \
  -m '{"cattle_id":1,"device_id":"1","operator_id":1,"site_id":1,"location_id":2,"event_type":"entrada_curral","event_time":"2025-01-01 12:00:00"}'
```

### Resetar o banco de dados (cuidado — apaga tudo)
```bash
docker compose -f docker-compose-fazenda.yml down
sudo rm -rf dados/mariadb/*
docker compose -f docker-compose-fazenda.yml up -d mariadb
# Os scripts em init-scripts/ rodam automaticamente na criação
```

### Atualizar código da webapp sem rebuild
Como o volume `./webapp:/app` está montado, basta editar o arquivo e reiniciar:
```bash
# Edita o arquivo
sudo nano /home/admin/iot-cattle-management/webapp/main.py
# Reinicia o container
docker restart cattle_webapp
```

---

## 10. Credenciais

| Serviço | Usuário | Senha |
|---|---|---|
| SSH Raspberry Pi | `admin` | `1234` |
| MariaDB (app) | `fazendeiro` | `senhaFazenda` |
| MariaDB (root) | `root` | `senhaForte` |
| Mosquitto | — | sem autenticação (`allow_anonymous true`) |
| Grafana | — | acesso anônimo habilitado (role Editor) |
| Portainer | — | configurado na primeira vez via UI |

---

## 11. Problemas Conhecidos e Correções Aplicadas

### [Corrigido 2026-03-30] Flask não iniciava — volume errado
**Causa:** `cattle_webapp` montava a raiz do projeto (`/home/admin/iot-cattle-management`) em `/app`,
mas o `main.py` está em `webapp/`. O Python não encontrava `/app/main.py`.  
**Correção:** volume alterado para `./webapp:/app`.

### [Corrigido 2026-03-30] Dependências ausentes no requirements.txt
**Causa:** `requirements.txt` só tinha `Flask==3.0.0`. `flask-socketio` e `paho-mqtt` não estavam listados.  
**Correção:** adicionados `flask-socketio==5.3.6` e `paho-mqtt==2.1.0`. Imagem reconstruída.

### [Corrigido 2026-03-30] RuntimeError do Werkzeug em modo debug
**Causa:** `flask-socketio>=5.3` bloqueia `socketio.run()` com `debug=True` sem flag explícita.  
**Correção:** adicionado `allow_unsafe_werkzeug=True` na chamada `socketio.run(...)` em `main.py`.

### [Conhecido] `fazenda-consumidor` com restart desabilitado
O consumidor tem `restart: unless-stopped` comentado no compose. Ao reiniciar o Pi, ele não sobe automaticamente.  
**Para corrigir permanentemente:** descomentar `restart: unless-stopped` no `docker-compose-fazenda.yml` na seção `consumidor`.

### [Conhecido] `cattle_webapp` fora do docker-compose
O container Flask foi criado manualmente e não está no `docker-compose-fazenda.yml`.
Ao fazer `docker compose down`, ele não é afetado, mas também não sobe com `docker compose up`.  
**Para corrigir:** adicionar serviço `webapp` no compose com as configurações corretas.

### [Conhecido] MariaDB exposto na porta 3306
A porta 3306 está acessível na rede local sem autenticação extra.
Recomendado fechar com firewall se o ambiente não for confiável:
```bash
sudo ufw deny 3306
```
