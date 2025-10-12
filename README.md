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
├── 📘 docs/
│   ├── resumo_projeto.md
│   ├── arquitetura_sistema.md
│   └── diagramas/
│
├── ⚙️ hardware/
│   ├── esquemas/
│   └── firmware/
│       ├── src/
│       ├── CMakeLists.txt
│       └── README.md
│
├── 🌐 webapp/
│   ├── frontend/
│   ├── backend/
│   └── docker-compose.yml
│
├── 🗄️ database/
│   ├── schema.sql
│   └── seeds.sql
│
└── 🧪 tests/
    ├── hardware_tests/
    └── web_tests/


