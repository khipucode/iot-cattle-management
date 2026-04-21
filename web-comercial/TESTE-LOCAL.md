# 🧪 COMO TESTAR O SITE LOCALMENTE

Antes de enviar para o GitHub, teste o site no seu computador!

---

## 🚀 MÉTODO 1: Abrir Direto no Navegador (Mais Simples!)

### **Passo 1: Ir até a pasta do projeto**

```bash
cd ~/Documentos/itrace-site
# OU o caminho onde está seu projeto
```

### **Passo 2: Abrir no navegador**

```bash
# Firefox
firefox index.html

# Google Chrome
google-chrome index.html

# Chromium
chromium-browser index.html
```

**✅ Pronto! O site vai abrir!**

---

## 🌐 MÉTODO 2: Servidor Local com Python (Recomendado!)

### **Por que usar servidor local?**
- ✅ Vídeos funcionam melhor
- ✅ Simula hospedagem real
- ✅ Testa links relativos

### **Passo 1: Ir até a pasta do projeto**

```bash
cd ~/Documentos/itrace-site
```

### **Passo 2: Iniciar servidor**

```bash
# Python 3 (mais comum)
python3 -m http.server 8000

# OU Python 2 (se não tiver Python 3)
python -m SimpleHTTPServer 8000
```

### **Passo 3: Abrir no navegador**

```
http://localhost:8000
```

**Para parar o servidor:** `Ctrl + C`

---

## 📦 MÉTODO 3: Servidor Local com Node.js

### **Passo 1: Instalar http-server (só uma vez)**

```bash
npm install -g http-server
```

### **Passo 2: Ir até a pasta do projeto**

```bash
cd ~/Documentos/itrace-site
```

### **Passo 3: Iniciar servidor**

```bash
http-server
```

### **Passo 4: Abrir no navegador**

```
http://localhost:8080
```

---

## 🔍 O QUE TESTAR?

### **Checklist de Testes:**

#### ✅ **1. Hero Section**
- [ ] Imagem de fundo carrega
- [ ] Título "iTrace" aparece com animação
- [ ] Botão "Ver Planos e Preços" funciona
- [ ] Cards de features aparecem

#### ✅ **2. About Section**
- [ ] 4 passos "Como Funciona" aparecem
- [ ] Cards de benefícios estão visíveis
- [ ] 3 cards de tecnologia (RFID, IA, Mobile) aparecem

#### ✅ **3. Video Section**
- [ ] Placeholder do vídeo aparece
- [ ] Botão de play está visível
- [ ] Ao clicar, vídeo começa a tocar
- [ ] Timeline do vídeo aparece embaixo
- [ ] Estatísticas aparecem (500 fazendas, etc.)

#### ✅ **4. Pricing Section**
- [ ] 3 cards de planos aparecem
- [ ] "Médio Produtor" tem badge "Mais Popular"
- [ ] Botões levam para seção de pagamento
- [ ] Lista de features está legível

#### ✅ **5. Payment Section**
- [ ] 6 abas aparecem (Cartão, PIX, Boleto, etc.)
- [ ] Ao clicar nas abas, conteúdo muda
- [ ] Formulários aparecem corretamente
- [ ] Botões de pagamento funcionam (mostram alert)
- [ ] QR Code placeholder aparece na aba PIX

#### ✅ **6. Support Section**
- [ ] 3 cards de contato aparecem (Telefone, WhatsApp, Email)
- [ ] FAQ (accordion) está visível
- [ ] Ao clicar em pergunta, resposta abre
- [ ] Ao clicar novamente, resposta fecha

#### ✅ **7. Footer**
- [ ] Logo iTrace aparece
- [ ] 4 colunas de links estão organizadas
- [ ] Copyright e links aparecem

#### ✅ **8. Geral**
- [ ] Scroll suave funciona
- [ ] Todos os ícones (Lucide) aparecem
- [ ] Site é responsivo (teste redimensionando janela)
- [ ] Cores verdes do agronegócio estão aplicadas

---

## 📱 TESTAR RESPONSIVIDADE

### **No navegador:**

1. Pressione `F12` (DevTools)
2. Clique no ícone de celular/tablet
3. Teste diferentes tamanhos:
   - iPhone SE (375px)
   - iPad (768px)
   - Desktop (1920px)

### **Ou redimensione a janela manualmente**

---

## 🐛 PROBLEMAS COMUNS

### **❌ Vídeo não carrega**

**Causa:** Vídeo não está em `public/video-boi.mp4`

**Solução:**
```bash
ls -la public/
# Se não aparecer video-boi.mp4, copie:
cp "/home/rayane/Downloads/Video boi" public/video-boi.mp4
```

---

### **❌ Ícones não aparecem**

**Causa:** Lucide Icons precisa de internet (CDN)

**Solução:**
- Certifique-se de estar conectado à internet
- OU baixe Lucide localmente (avançado)

---

### **❌ Abas de pagamento não funcionam**

**Causa:** JavaScript não carregou

**Solução:**
```bash
# Verifique se script.js existe
ls -la script.js

# Abra o console do navegador (F12)
# Veja se há erros em vermelho
```

---

### **❌ Estilos não aparecem (site sem cores)**

**Causa:** CSS não carregou

**Solução:**
```bash
# Verifique se styles.css existe
ls -la styles.css

# Certifique-se que está usando servidor local
# Não apenas abrindo o arquivo direto
```

---

## 🔧 CONSOLE DO NAVEGADOR

### **Como abrir:**
- **Chrome/Firefox:** `F12` ou `Ctrl+Shift+I`
- **Mac:** `Cmd+Option+I`

### **O que verificar:**

```javascript
// Console → Veja se há erros (vermelho)

// Deve aparecer algo como:
// "Lucide icons created"

// Se aparecer erros, copie e me envie!
```

---

## 📸 TIRAR SCREENSHOTS

### **Útil para documentação:**

```bash
# Firefox
firefox --screenshot site.png http://localhost:8000

# Chrome (via extensão)
# Ou use: Ctrl+Shift+P → "Capture full size screenshot"
```

---

## ✅ TUDO FUNCIONANDO?

Se todos os testes passaram:

### **Próximo passo:**

```bash
# 1. Parar o servidor (Ctrl+C)

# 2. Enviar para GitHub
git add .
git commit -m "Site testado e aprovado localmente"
git push origin main
```

---

## 🎓 DICAS PRO

### **1. Live Reload (atualiza automaticamente)**

```bash
# Instalar live-server
npm install -g live-server

# Rodar
live-server

# Agora edite os arquivos e o navegador atualiza sozinho!
```

### **2. Testar performance**

1. Abra DevTools (`F12`)
2. Aba "Lighthouse"
3. Clique "Analyze page load"
4. Veja score de Performance, SEO, etc.

### **3. Testar em múltiplos navegadores**

```bash
# Firefox
firefox index.html

# Chrome
google-chrome index.html

# Edge (se tiver)
microsoft-edge index.html
```

---

## 📋 CHECKLIST FINAL ANTES DO DEPLOY

- [ ] Testei em servidor local (não direto no navegador)
- [ ] Vídeo carrega e toca
- [ ] Todas as abas de pagamento funcionam
- [ ] FAQ abre e fecha
- [ ] Scroll suave funciona
- [ ] Responsivo em mobile/tablet/desktop
- [ ] Não há erros no console
- [ ] Todos os ícones aparecem
- [ ] Cores estão corretas (verde do agronegócio)

**✅ Tudo OK? Pode fazer deploy!**

---

## 🚀 COMANDOS RÁPIDOS

```bash
# Teste Rápido
cd ~/Documentos/itrace-site
python3 -m http.server 8000
# Abrir: http://localhost:8000

# Ver logs de erro (se algo não funcionar)
# F12 → Console (no navegador)

# Parar servidor
# Ctrl + C
```

---

**Última atualização:** 12/03/2026  
**Versão:** 1.0  

🎯 **Bons testes!** 🎯
