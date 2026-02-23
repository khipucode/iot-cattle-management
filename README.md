# 🐮 CPqD - Projeto Brinco do Boi

**Autores:** Leonid • Osny • Rayane  
**Instituição:** CPqD (2025–2026)  
**Categoria:** Pesquisa e Desenvolvimento / Automação Rural  

---

## 📘 Resumo Técnico

O **Projeto Brinco do Boi** propõe a criação de um **sistema de automação rural** para fazendas de gado de corte, utilizando a tecnologia **RFID** integrada a um **System-on-a-Chip (SoC)**.  
O objetivo é tornar o manejo do rebanho mais eficiente, seguro e inteligente — unindo **hardware embarcado** e **tecnologias web modernas**.  

---

## 🎯 Objetivos do Sistema

✅ **Registrar bovinos, rações e medicamentos**  
✅ **Emitir relatórios automatizados e detalhados**  
✅ **Controlar o estoque de insumos**  
✅ **Monitorar o histórico individual de cada animal**

---

## 🧠 Arquitetura do Projeto

O sistema combina **componentes de hardware** e **software** para criar uma solução completa:

- 🧩 **Hardware:** leitor RFID, SoC e sensores auxiliares.  
- 💻 **Software embarcado:** desenvolvido em **C**, responsável pela leitura e transmissão dos dados RFID.  
- 🌐 **Backend Web:** implementado com **Node.js + Express + PostgreSQL**, containerizado via **Docker**.  
- 🖥️ **Frontend:** interface web responsiva em **HTML5, CSS, Bootstrap e JavaScript/TypeScript**.  

---

### 🔹 Camadas do sistema

| Camada | Função | Tecnologias |
|:-------|:--------|:------------|
| **Dispositivo** | Leitura e envio de tags RFID | SoC + RC522 (C / SDK embarcado) |
| **Backend** | API REST e banco de dados | Node.js + Express + PostgreSQL |
| **Frontend** | Interface web responsiva | HTML5, CSS3, Bootstrap, JS/TS |
| **Infraestrutura** | Deploy e containerização | Docker + Docker Compose |

---

## 👩‍💻 Equipe

| Integrante | Função |
|-------------|--------|
| **Leonid** | Desenvolvimento de firmware e integração do SoC |
| **Osny** | Arquitetura do backend e banco de dados |
| **Rayane** | Documentação técnica e design da interface |

---

## 🧩 Tecnologias Utilizadas

| Categoria | Tecnologias |
|------------|-------------|
| 🐮 Identificação | RFID RC522 / Tags Mifare |
| ⚙️ Hardware | SoC (C) |
| 🌍 Backend | Node.js, Express |
| 🗄️ Banco de Dados | PostgreSQL |
| 🧰 Infraestrutura | Docker, Docker Compose |
| 🎨 Frontend | HTML5, CSS3, Bootstrap, JavaScript, TypeScript |

---

## 📂 Estrutura de Diretórios

```text
brinco-boi/
│
├── arquiteture
│   ├── computer-vision
│   └── handheld_select.md
├── consumidor
│   ├── consumidor.py
│   ├── Dockerfile
│   ├── logs
│   └── requirements.txt
├── dados
│   ├── grafana
│   ├── mariadb
│   └── mosquitto
├── docker-compose-fazenda.yml
├── docs
│   ├── arquitetura_sistema.md
│   ├── diagramas
│   ├── funcionamento_leitor.png
│   └── guia_docker.md
├── eventos
├── Fazenda
│   ├── dados
│   ├── eventos
│   └── grafana.ini
├── grafana
│   └── provisioning
├── grafana.ini
├── hardware
│   └── README.md
├── init-scripts
├── mosquitto
│   └── config
├── Pasta_Testes_Populate
│   ├── como_usar.txt
│   ├── Dockerfile
│   ├── logs
│   ├── populate_data.py
│   └── requirements.txt
├── README.md
├── teste_Pub_Sub_Mosquitto.txt
└── webapp
    └── backend
```

---

## 🚀 Guia de Execução com Docker Compose

### Subir o ambiente

1. Certifique-se de ter **Docker** e **Docker Compose** instalados.
2. Clone este repositório:
   ```bash
   git clone https://github.com/khipucode/iot-cattle-management.git
   cd iot-cattle-management/Fazenda
   ```
3. Suba os containers:
   ```bash
   docker compose -f docker-compose-fazenda.yml up -d --build
   ```
4. Para parar os containers:
   ```bash
   docker compose -f docker-compose-fazenda.yml down
   ```

---

## 🔑 Acesso ao Banco de Dados (MariaDB)

- **Host:** `localhost`  
- **Porta:** `3306`  
- **Database:** `bovinos`  
- **Usuário:** `fazendeiro`  
- **Senha:** `senhaFazenda`

### Entrar no banco via Docker CLI

```bash
docker exec -it fazenda-db mariadb -u fazendeiro -p bovinos
```

Após rodar o comando, será solicitado a senha:  
```
senhaFazenda
```

---

## 📊 Acesso ao Grafana

- **URL:** `http://localhost:3000`  
- **Login:** acesso anônimo habilitado  
- **Permissão:** Editor (pode criar e editar dashboards)

Os dados do Grafana são persistidos em `./dados/grafana`.

---

## 📌 Observações

- Os volumes de dados ficam em `./dados/mariadb` e `./dados/grafana`.  
- Esses diretórios **não devem ser versionados** (já estão no `.gitignore`).  
- Para alterar credenciais, edite o arquivo `docker-compose.yml`.  
- Em produção, recomenda-se desabilitar acesso anônimo no Grafana e usar senhas fortes.
