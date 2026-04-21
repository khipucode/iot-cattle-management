# 🚀 SCRIPTS DE AUTOMAÇÃO - iTrace

Conjunto completo de scripts para facilitar o deploy e gerenciamento do projeto.

---

## 📋 **LISTA DE SCRIPTS DISPONÍVEIS:**

### ⚡ **Scripts de Deploy:**

| Script | Descrição | Quando usar |
|--------|-----------|-------------|
| `ENVIAR-PARA-GITHUB.sh` | Deploy rápido e simples | Quando quiser enviar rapidamente |
| `DEPLOY-COMPLETO.sh` | Menu interativo completo | Quando precisar de mais opções |

### 🎥 **Scripts de Vídeo:**

| Script | Descrição | Quando usar |
|--------|-----------|-------------|
| `VERIFICAR-TAMANHO-VIDEO.sh` | Verifica tamanho do vídeo | Antes de fazer upload |

### 📚 **Guias de Configuração:**

| Arquivo | Descrição |
|---------|-----------|
| `VIDEO-CONFIG.md` | Guia completo para configurar vídeo |
| `TROCAR-VIDEO-RAPIDO.txt` | Resumo visual de 3 passos |

---

## 🚀 **1. ENVIAR-PARA-GITHUB.sh**

### 📖 **O que faz:**
- ✅ Adiciona todos os arquivos modificados
- ✅ Cria commit automaticamente
- ✅ Envia para o GitHub
- ✅ Mostra link do repositório
- ✅ Mostra link do GitHub Pages

### 💻 **Como usar:**

```bash
bash ENVIAR-PARA-GITHUB.sh
```

### 📸 **Exemplo de saída:**

```
╔═══════════════════════════════════════════════════════════════════╗
║     🚀 ENVIAR ATUALIZAÇÕES PARA O GITHUB                         ║
╚═══════════════════════════════════════════════════════════════════╝

📂 Verificando arquivos modificados...

M  src/app/components/video-section.tsx
A  VIDEO-CONFIG.md
A  TROCAR-VIDEO-RAPIDO.txt

🤔 Deseja continuar com o envio? (s/n): s

✅ Commit criado com sucesso!
✅ Arquivos enviados para o GitHub!

🔗 Seu repositório:
   https://github.com/seu-usuario/itrace

🌐 GitHub Pages:
   https://seu-usuario.github.io/itrace/
```

---

## 🎯 **2. DEPLOY-COMPLETO.sh**

### 📖 **O que faz:**

Menu interativo com 7 opções:

1. **Deploy Rápido** - Envia tudo automaticamente
2. **Deploy Personalizado** - Você escolhe a mensagem do commit
3. **Ver Status** - Mostra arquivos modificados
4. **Ver Histórico** - Últimos 10 commits
5. **Desfazer Commit** - Remove último commit (mantém alterações)
6. **Verificar Configuração** - Info do Git
7. **Configurar GitHub Pages** - Instruções passo a passo

### 💻 **Como usar:**

```bash
bash DEPLOY-COMPLETO.sh
```

### 📸 **Exemplo do menu:**

```
╔═══════════════════════════════════════════════════════════════════╗
║     🚀 DEPLOY COMPLETO - ITRACE AGRO RASTREAMENTO               ║
╚═══════════════════════════════════════════════════════════════════╝

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  ESCOLHA UMA OPÇÃO:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  1️⃣  Deploy Rápido (automático)
  2️⃣  Deploy Personalizado (escolher mensagem)
  3️⃣  Ver status do repositório
  4️⃣  Ver histórico de commits
  5️⃣  Desfazer último commit (sem perder alterações)
  6️⃣  Verificar configuração Git
  7️⃣  Configurar GitHub Pages
  0️⃣  Sair

➤ Digite sua escolha:
```

---

## 🎥 **3. VERIFICAR-TAMANHO-VIDEO.sh**

### 📖 **O que faz:**
- Verifica se o vídeo existe
- Mostra tamanho em MB
- Informa se passa de 100 MB (limite GitHub)
- Sugere soluções (Git LFS, compressão, hospedagem externa)

### 💻 **Como usar:**

```bash
bash VERIFICAR-TAMANHO-VIDEO.sh
```

---

## 📋 **FLUXO DE TRABALHO RECOMENDADO:**

### **Cenário 1: Deploy Normal (90% dos casos)**

```bash
# Fazer alterações no código...

# Enviar para GitHub
bash ENVIAR-PARA-GITHUB.sh
```

### **Cenário 2: Deploy com Mensagem Personalizada**

```bash
# Fazer alterações importantes...

# Usar menu completo
bash DEPLOY-COMPLETO.sh

# Escolher opção 2 (Deploy Personalizado)
# Digitar mensagem descritiva
```

### **Cenário 3: Verificar Antes de Enviar**

```bash
# Fazer alterações...

# Ver o que mudou
bash DEPLOY-COMPLETO.sh
# Escolher opção 3 (Ver status)

# Se estiver tudo OK, fazer deploy
# Escolher opção 1 (Deploy Rápido)
```

---

## ⚠️ **SOLUÇÃO DE PROBLEMAS:**

### **Erro: "Este não é um repositório Git"**

```bash
# Inicializar repositório
git init

# Adicionar remote
git remote add origin https://github.com/SEU_USUARIO/SEU_REPO.git

# Fazer primeiro commit
git add .
git commit -m "🎉 Commit inicial"
git push -u origin main
```

### **Erro: "Permissão negada"**

```bash
# Verificar se está logado
git config user.name
git config user.email

# Se vazio, configurar:
git config --global user.name "Seu Nome"
git config --global user.email "seu@email.com"
```

### **Erro: "Failed to push"**

```bash
# Puxar alterações do GitHub antes
git pull origin main

# Depois enviar
git push origin main
```

---

## 🎯 **DICAS PRO:**

### **1. Tornar scripts executáveis:**

```bash
chmod +x *.sh
```

Depois pode executar sem `bash`:

```bash
./ENVIAR-PARA-GITHUB.sh
./DEPLOY-COMPLETO.sh
```

### **2. Criar alias para facilitar:**

Adicione no `~/.bashrc` ou `~/.zshrc`:

```bash
alias deploy="bash ENVIAR-PARA-GITHUB.sh"
alias deploymenu="bash DEPLOY-COMPLETO.sh"
```

Depois é só digitar:

```bash
deploy          # Deploy rápido
deploymenu      # Menu completo
```

### **3. Commit e Push em um comando:**

```bash
# Atalho super rápido
git add . && git commit -m "🚀 Update" && git push
```

---

## 📊 **RESUMO VISUAL:**

```
┌─────────────────────────────────────────────────────────────┐
│                                                             │
│  🎯 QUAL SCRIPT USAR?                                       │
│                                                             │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ⚡ Envio rápido?                                           │
│     → bash ENVIAR-PARA-GITHUB.sh                           │
│                                                             │
│  🎛️  Preciso de mais opções?                               │
│     → bash DEPLOY-COMPLETO.sh                              │
│                                                             │
│  🎥 Vou adicionar vídeo?                                    │
│     → bash VERIFICAR-TAMANHO-VIDEO.sh                      │
│                                                             │
│  📖 Como configurar vídeo?                                  │
│     → Ler VIDEO-CONFIG.md                                  │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## 🆘 **SUPORTE:**

Se tiver problemas:

1. ✅ Leia as mensagens de erro com atenção
2. ✅ Use a opção 6 do DEPLOY-COMPLETO.sh para verificar configuração
3. ✅ Consulte a seção "Solução de Problemas" acima
4. ✅ Verifique conexão com internet

---

## 📝 **CHANGELOG:**

### **Versão 1.0 (13/03/2026)**
- ✅ Script de envio rápido criado
- ✅ Menu completo de deploy criado
- ✅ Guias de configuração de vídeo
- ✅ Documentação completa

---

**🚀 Pronto para o deploy! Boa sorte com o iTrace!** 🐄💚
