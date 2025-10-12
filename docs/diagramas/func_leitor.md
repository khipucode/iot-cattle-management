## 🧭 Visão geral do funcionamento do leitor (Figura 33)

O leitor RFID no SoC segue um fluxo simples e contínuo para identificar o brinco e comunicar-se com o sistema:

1. **🚀 Setup & Inicialização**
   - Configura **periféricos**.
   - Conecta à **rede Wi-Fi**.
   - Sobe o **servidor web/API** local.
   - Mostra **mensagens iniciais no LCD**.

2. **🔁 Loop principal**
   - Verifica **se há cartão/tag presente**.
   - **Se SIM:**
     - 📡 Lê a tag RFID.
     - 🧑‍🌾 Exibe mensagem ao usuário.
     - ⏳ Aguarda novo cartão **ou** **timeout**.
       - **Cartão lido:** retorna o **UID** e **converte para hexadecimal**.
       - **Timeout:** define **flags** e informa o **tempo esgotado**.
   - **Se NÃO:**
     - ⏱️ Verifica **timeout** e exibe mensagem de **timeout** (se aplicável).

3. **🌐 Comunicação**
   - Em cada ciclo, o leitor **responde a solicitações HTTP** (integração com o backend).

> Em resumo: o SoC inicializa, entra em loop, **detecta e lê a tag**, trata **timeouts** de forma amigável ao usuário e **exponde o UID** via HTTP para o restante do sistema. 🧩
