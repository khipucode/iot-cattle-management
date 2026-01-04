# Guia de Uso do Ambiente Docker

Este documento explica como subir o ambiente Docker com **MariaDB** e **Grafana** para o projeto de controle de bovinos.

---

## 🚀 Subir o ambiente

1. Certifique-se de ter Docker e Docker Compose instalados.
2. Clone este repositório:
   ```bash
   git clone https://github.com/khipucode/iot-cattle-management.git
   cd iot-cattle-management/Fazenda

Suba os containers:

docker compose up -d

Para parar os containers:

docker compose down

Acesso ao Banco de Dados (MariaDB)
Host: localhost

Porta: 3306

Database: bovinos

Usuário: fazendeiro

Senha: senhaFazenda

Entrar no banco via Docker CLIENTE

docker exec -it fazenda-db mariadb -u fazendeiro -p bovinos

Após rodar o comando, será solicitado a senha:senhaFazenda

Acesso ao Grafana
URL: http://localhost:3000

Login: acesso anônimo habilitado

Permissão: Editor (pode criar e editar dashboards)

Os dados do Grafana são persistidos em ./dados/grafana.


Observações
Os volumes de dados ficam em ./dados/mariadb e ./dados/grafana.

Esses diretórios não devem ser versionados (já estão no .gitignore).

Para alterar credenciais, edite o arquivo docker-compose.yml.


4. Salve e feche (`CTRL+O`, `ENTER`, `CTRL+X` no nano).

---

## 🛠️ Passo final – Commit e push

```bash
git add docs/guia_docker.md
git commit -m "Adiciona guia de uso do Docker Compose"
git push origin main

