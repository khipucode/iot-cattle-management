# 2) DB — Rascunho focado em Administração (Admin Console)

Esta parte do banco de dados é responsável **exclusivamente pela administração do sistema**:  
cadastro de bois, usuários, permissões, topologia da granja e dispositivos.  
Ela **não depende da vara RFID**, mas é a base que permite que os eventos RFID façam sentido.

---

## 2.1 Autenticação, Usuários e Permissões (RBAC)

### `users`
**Função**  
Representa as pessoas que acessam o sistema (admin, veterinário, operador, visualizador).

| Campo | Descrição |
|-----|-----------|
| `user_id` | Identificador único do usuário |
| `email` | Login do usuário (único) |
| `password_hash` | Senha criptografada |
| `full_name` | Nome completo |
| `status` | Estado da conta (`active`, `disabled`) |
| `created_at` | Data de criação |
| `last_login_at` | Último login |

---

### `roles`
**Função**  
Define funções genéricas do sistema (ex: admin, vet, worker).

| Campo | Descrição |
|-----|-----------|
| `role_id` | Identificador do papel |
| `role_name` | Nome do papel (único) |

---

### `permissions`
**Função**  
Lista de permissões atômicas do sistema.

| Campo | Descrição |
|-----|-----------|
| `permission_id` | Identificador |
| `permission_key` | Chave lógica (ex: `cattle_write`) |
| `description` | O que a permissão permite |

---

### `user_roles`
**Função**  
Relaciona usuários com seus papéis (N:N).

| Campo | Descrição |
|-----|-----------|
| `user_id` | Usuário |
| `role_id` | Papel atribuído |

---

### `role_permissions`
**Função**  
Relaciona papéis com permissões (N:N).

| Campo | Descrição |
|-----|-----------|
| `role_id` | Papel |
| `permission_id` | Permissão |

---

### `audit_logs`
**Função**  
Rastreabilidade administrativa (quem fez o quê no sistema).

| Campo | Descrição |
|-----|-----------|
| `audit_id` | Identificador |
| `user_id` | Usuário que realizou a ação |
| `action` | Ação executada (ex: `CREATE_CATTLE`) |
| `entity_type` | Tipo de entidade afetada |
| `entity_id` | ID do registro afetado |
| `timestamp` | Quando ocorreu |
| `details_json` | Detalhes adicionais |

---

## 2.2 Cadastro do Rebanho (Master Data)

### `cattle`
**Função**  
Identidade única de cada boi no sistema.  
Todos os eventos RFID e análises **se conectam a esta tabela**.

| Campo | Descrição |
|-----|-----------|
| `cattle_id` | ID interno imutável do boi |
| `ear_tag_code` | Brinco RFID ativo |
| `birth_date` | Data de nascimento |
| `breed` | Raça |
| `initial_weight_kg` | Peso inicial (opcional) |
| `purchase_price` | Preço de compra |
| `photo_url` | Foto |
| `status` | Estado (`active`, `sold`, `dead`, `missing`) |
| `current_site_id` | Local atual |
| `current_lot_id` | Lote atual |
| `created_at` | Data de cadastro |

---

### `ear_tags`
**Função**  
Histórico de brincos RFID por boi (permite troca de brinco sem perder histórico).

| Campo | Descrição |
|-----|-----------|
| `tag_id` | Identificador |
| `cattle_id` | Boi associado |
| `ear_tag_code` | Código RFID |
| `valid_from` | Início da validade |
| `valid_to` | Fim da validade |
| `note` | Observação |

---

## 2.3 Topologia da Granja

### `sites`
**Função**  
Representa grandes áreas da granja (fazenda, curral, pasto).

| Campo | Descrição |
|-----|-----------|
| `site_id` | Identificador |
| `site_code` | Código único |
| `site_name` | Nome |
| `site_type` | Tipo do local |

---

### `locations`
**Função**  
Pontos específicos dentro de um site (portão, bebedouro, balança).

| Campo | Descrição |
|-----|-----------|
| `location_id` | Identificador |
| `location_code` | Código único |
| `site_id` | Site ao qual pertence |
| `location_name` | Nome |
| `location_type` | Tipo do ponto |

---

### `lots`
**Função**  
Agrupamentos de bois para manejo.

| Campo | Descrição |
|-----|-----------|
| `lot_id` | Identificador |
| `lot_code` | Código |
| `lot_name` | Nome |
| `site_id` | Local |

---

## 2.4 Dispositivos

### `devices`
**Função**  
Cadastro de dispositivos que enviam dados ao sistema.

| Campo | Descrição |
|-----|-----------|
| `device_id` | Identificador lógico |
| `device_type` | Tipo (`rfid_stick`, `jetson`, `gateway`) |
| `site_id` | Local associado |
| `created_at` | Data de cadastro |
| `last_seen_at` | Última comunicação |
| `status` | Estado do dispositivo |

---

# 3) Rascunho do Sistema de Software (Admin Console)

Esta seção descreve **como o software se organiza**, sem entrar em código.

---

## 3.1 Componentes Principais

### Frontend (Web/App)
- Cadastro de bois
- Gerenciamento de usuários
- Configuração da granja
- Visualização básica de eventos e alertas

### Backend (API)
- Autenticação e autorização (RBAC)
- CRUD de master data
- Consulta de eventos
- Integração com o banco

### Banco de Dados
- Armazena master data, permissões e estado atual
- Event store funciona em paralelo

### Serviços de Integração
- Ingestão MQTT → DB
- Scripts Python para análise e alertas

---

## 3.2 Fluxos Funcionais Principais

### Cadastro de boi
1. Admin cria registro em `cattle`
2. Sistema cria registro inicial em `ear_tags`
3. Eventos RFID passam a ser associados automaticamente

---

### Troca de brinco
1. Brinco antigo recebe `valid_to`
2. Novo brinco é criado em `ear_tags`
3. `cattle.ear_tag_code` é atualizado

---

### Gerenciamento de usuários
1. Admin cria usuário
2. Atribui papéis (`user_roles`)
3. Permissões são herdadas dos papéis

---

### Monitoramento administrativo
- Lista de dispositivos offline
- Eventos com `unknown_tag`
- Auditoria de ações administrativas

---

## 3.3 Rascunho de API (Admin)

### Autenticação
- `POST /auth/login`
- `POST /auth/logout`

### Usuários
- `GET /users`
- `POST /users`
- `PATCH /users/{id}`
- `POST /users/{id}/roles`

### Bois
- `GET /cattle`
- `POST /cattle`
- `PATCH /cattle/{id}`
- `POST /cattle/{id}/tags`

### Topologia
- `GET /sites`
- `POST /sites`
- `GET /locations`
- `POST /locations`

### Dispositivos
- `GET /devices`
- `POST /devices`
- `PATCH /devices/{id}`

---

## 3.4 Boas Práticas para Evolução
- Começar simples (CRUD + RBAC básico)
- Manter `cattle_id` imutável
- Separar claramente **Admin** de **Ingestão de Eventos**
- Usar logs e auditoria desde o início
- Pensar no Admin como “fonte da verdade” do sistema

---

Esse módulo Admin é o **alicerce do projeto**: sem ele, os eventos RFID e a visão computacional não conseguem se integrar de forma confiável.
