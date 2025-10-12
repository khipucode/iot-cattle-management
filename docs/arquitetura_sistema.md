# 🧩 Arquitetura do Sistema

O sistema é composto por três camadas principais:

1. **Hardware embarcado:**  
   - Módulo **RFID RC522** conectado a um **SoC**.  
   - Leitura de tags Mifare e envio de dados via Wi-Fi.

2. **Backend Web:**  
   - API REST construída em **Node.js + Express**.  
   - Banco de dados **PostgreSQL**.  
   - Executado via **Docker Compose**.

3. **Frontend Web:**  
   - Interface em **HTML5 + CSS + Bootstrap + JS/TS**.  
   - Exibe informações do rebanho, relatórios e históricos.


<img src="docs/funcionamento_leitor.png" alt="Fluxograma do Leitor" width="720">
