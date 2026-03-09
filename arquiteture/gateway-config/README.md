# 🐄 IoT Cattle Management - Edge Gateway

Este repositório contém a infraestrutura em containers (Docker) para o gateway local do sistema de monitoramento de gado (projeto Brinco do Boi). O sistema foi desenhado para rodar em um Raspberry Pi OS na ponta da rede (Edge Computing), recebendo dados de microcontroladores (como ESP32) via MQTT, armazenando as leituras de forma persistente e fornecendo interfaces web para gestão e visualização de dados.

## 🏗️ Arquitetura do Sistema

O ambiente é orquestrado via **Docker Compose** e composto pelos seguintes serviços:

1. **Eclipse Mosquitto (Broker MQTT - Porta 1883):** Recebe as mensagens publicadas pelos nós sensores no campo (ex: leituras de tags RFID e temperatura).
2. **MariaDB (Banco de Dados - Interno):** Armazena o histórico de leituras, dados dos animais e eventos do sistema. Utiliza volumes persistentes para garantir a segurança dos dados.
3. **Aplicação Web Python/Flask (Porta 5000):** Interface do usuário e processamento de regras de negócio. Renderiza páginas HTML dinâmicas usando Jinja2.
4. **Grafana (Dashboards - Porta 3000):** Conectado diretamente ao MariaDB para visualização de dados em tempo real e análise histórica.
5. **Portainer CE (Gestão Docker - Porta 9000):** Interface gráfica para monitorar, reiniciar e gerenciar os containers do gateway.

---

## 📂 Estrutura de Diretórios

```text
iot-cattle-management/
├── docker-compose.yml       # Orquestrador de todos os containers
├── README.md                # Esta documentação
├── mosquitto/
│   └── mosquitto.conf       # Configuração do broker MQTT
└── webapp/
    ├── Dockerfile           # Instruções de construção da imagem Python
    ├── requirements.txt     # Dependências do Python (Flask, etc.)
    ├── main.py              # Código principal do servidor web (Flask)
    └── templates/           # Diretório de interfaces visuais
        └── index.html       # Página principal da aplicação
```

## ⚙️ Pré-requisitos e Instalação do Docker
Para rodar este ambiente em um Raspberry Pi OS recém-instalado, execute:

### 1. Instalar o Docker

```
curl -fsSL https://get.docker.com -o get-docker.sh 
sudo sh get-docker.sh
```
### 2. Adicionar o usuário atual ao grupo do Docker (evita o uso de sudo)

``` 
sudo usermod -aG docker $USER
```

### (Faça logout e login novamente para aplicar)

### 3. Instalar o plugin do Docker Compose

``` 
sudo apt-get install docker-compose-plugin
```



### 🚀 Como Iniciar o Sistema
- Navegue até a pasta raiz do projeto:

``` cd /caminho/para/iot-cattle-management ``` 

- Construa a imagem da aplicação web e suba todos os containers em segundo plano:
  
``` 
docker compose up -d --build
``` 

Nota: A flag ` --build `  garante que o Docker recompile a imagem do Flask caso haja mudanças no ` Dockerfile `   ou no ` requirements.txt`.

Para parar o sistema sem perder os dados:

``` 
docker compose down
``` 


## 📋 Tabela de Acesso aos Serviços


| Serviço | URL de Acesso | Credenciais Padrão |
| :--- | :--- | :--- |
| **App Web (Flask)** | [http://192.168.51.50:5000](http://192.168.51.50:5000) | N/A |
| **Grafana** | [http://192.168.51.50:3000](http://192.168.51.50:3000) | **User:** `admin` / **Pass:** `admin` |
| **Portainer** | [http://192.168.51.50:9000](http://192.168.51.50:9000) | Definida no primeiro acesso |
| **MQTT (ESP32)** | `tcp://192.168.51.50:1883` | Conexão anônima habilitada |

> ⚠️ **Aviso de Segurança:** Altere todas as senhas padrões antes de colocar o sistema em produção.


## 🚀 Acesso ao Sistema

Após rodar o comando `docker compose up --build`, os serviços estarão disponíveis nos seguintes endereços:

### 💻 Interface Web (Flask)
- **URL:** `http://192.168.51.50:5000`
- **Arquivo Principal:** `main.py`
- **Pastas de Estilo:** `templates/` (HTML) e `static/` (CSS)

### 📊 Monitoramento (Grafana)
- **URL:** `http://192.168.51.50:3000`
- **Usuário Padrão:** `admin`
- **Senha Padrão:** `admin`
- *Nota: O sistema solicitará a alteração da senha no primeiro login.*

### 🛠️ Comandos Úteis
- **Ver logs apenas da Web:** `docker compose logs -f flask-app`
- **Reiniciar e aplicar mudanças:** `docker compose up --build`
- **Parar tudo:** `docker compose down`


### 🔧 Configurações e Desenvolvimento Interno
Modo de Desenvolvimento Web (Hot-Reload)
A aplicação Flask está configurada com `debug=True` no `main.py`. Se o arquivo `docker-compose.yml` estiver mapeando o volume da pasta `./webapp:/app`, as alterações feitas nos arquivos `.py` ou `.html` refletirão instantaneamente no navegador, sem necessidade de reiniciar o container manualmente.

### Persistência de Dados
Os dados do banco de dados (MariaDB), painéis do Grafana e configurações do Portainer estão mapeados em Volumes Docker. Se os containers forem apagados, os dados permanecerão seguros no armazenamento local do Raspberry Pi.

