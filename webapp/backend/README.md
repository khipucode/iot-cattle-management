# 🌐 Backend - API Brinco do Boi

API REST desenvolvida em **Node.js** e **Express**.  
Gerencia dados de bovinos, rações, medicamentos e histórico de aplicações.

## 🔧 Endpoints principais
| Método | Rota | Descrição |
|--------|------|------------|
| GET | `/bovinos` | Lista todos os bovinos cadastrados |
| POST | `/bovinos` | Cadastra novo bovino |
| GET | `/racoes` | Lista rações disponíveis |
| POST | `/medicamentos` | Cadastra medicamento |

## 🗄️ Banco de Dados
- PostgreSQL  
- Script de inicialização: `database/schema.sql`

## 🚀 Execução com Docker
```bash
docker-compose up --build
