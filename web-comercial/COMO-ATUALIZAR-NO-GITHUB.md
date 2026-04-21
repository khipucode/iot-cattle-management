# 🚀 Como Atualizar o iTrace no GitHub - Guia Completo

## 📋 Índice
1. [Verificar Status](#1-verificar-status)
2. [Adicionar Arquivos](#2-adicionar-arquivos)
3. [Fazer Commit](#3-fazer-commit)
4. [Enviar para GitHub](#4-enviar-para-github)
5. [Verificar Online](#5-verificar-online)
6. [Comandos Rápidos](#6-comandos-rápidos)

---

## ✅ Pré-requisitos

Antes de começar, certifique-se que:
- ✓ Você está na pasta do projeto
- ✓ A pasta `public/` existe e contém `video-boi.mp4`
- ✓ Você já tem o repositório conectado ao GitHub

---

## 1️⃣ Verificar Status

Abra o terminal (`Ctrl + Alt + T`) e vá para a pasta do projeto:

```bash
# Navegue até o projeto
cd ~/caminho/do/seu/projeto

# Verifique onde você está
pwd

# Veja o status do Git
git status
```

**Você verá algo como:**
```
On branch main
Changes not staged for commit:
  modified:   index.html
  modified:   styles.css
  modified:   script.js
  
Untracked files:
  public/
  COMO-ATUALIZAR-NO-GITHUB.md
  INSTRUCOES-GIT.md
```

---

## 2️⃣ Adicionar Arquivos

### Opção A: Adicionar TUDO de uma vez (Recomendado)

```bash
git add .
```

### Opção B: Adicionar arquivos específicos

```bash
# Adicionar apenas os arquivos principais
git add index.html styles.css script.js

# Adicionar a pasta do vídeo
git add public/

# Adicionar os guias
git add *.md *.sh *.txt
```

### Verificar o que foi adicionado:

```bash
git status
```

Agora deve aparecer:
```
Changes to be committed:
  modified:   index.html
  modified:   styles.css
  new file:   public/video-boi.mp4
  ...
```

---

## 3️⃣ Fazer Commit

```bash
git commit -m "Converter projeto para HTML/CSS/JS puro + adicionar vídeo demonstrativo"
```

**Mensagens alternativas:**
```bash
# Se for só o vídeo
git commit -m "Adicionar vídeo demonstrativo de bovinos"

# Se for atualização completa
git commit -m "Atualização completa: HTML puro + vídeo + documentação"
```

---

## 4️⃣ Enviar para GitHub (Push)

### Se sua branch é `main`:

```bash
git push origin main
```

### Se sua branch é `master`:

```bash
git push origin master
```

### Não sabe qual é sua branch?

```bash
git branch
```

A branch atual aparece com asterisco: `* main`

---

## 5️⃣ Verificar Online

1. Abra o navegador
2. Acesse: `https://github.com/seu-usuario/seu-repositorio`
3. Verifique se os arquivos apareceram
4. Navegue até `public/video-boi.mp4` para confirmar

---

## 6️⃣ Comandos Rápidos

### 🎯 Atualizar TUDO (copie e cole):

```bash
# 1. Ver status
git status

# 2. Adicionar tudo
git add .

# 3. Commit
git commit -m "Atualização completa do iTrace"

# 4. Push (ajuste 'main' se necessário)
git push origin main

# 5. Verificar
git status
```

### 🔥 Um único comando (perigoso - use com cuidado):

```bash
git add . && git commit -m "Atualização iTrace" && git push origin main
```

---

## ⚠️ ATENÇÃO: Vídeo Grande!

### Se o vídeo for MAIOR que 100MB:

O Git vai dar erro! Soluções:

#### Solução 1: Ver tamanho do vídeo

```bash
du -h public/video-boi.mp4
```

Se for **menor que 100MB** → pode fazer push normalmente!  
Se for **maior que 100MB** → use Git LFS ⬇️

#### Solução 2: Usar Git LFS (Large File Storage)

```bash
# Instalar Git LFS
sudo apt install git-lfs

# Inicializar
git lfs install

# Rastrear vídeos MP4
git lfs track "*.mp4"

# Adicionar .gitattributes
git add .gitattributes

# Agora adicione o vídeo normalmente
git add public/video-boi.mp4
git commit -m "Adicionar vídeo com Git LFS"
git push origin main
```

#### Solução 3: Comprimir o vídeo

```bash
# Instalar ffmpeg
sudo apt install ffmpeg

# Comprimir vídeo (mantém boa qualidade)
ffmpeg -i public/video-boi.mp4 -vcodec h264 -acodec mp2 -crf 28 public/video-boi-comprimido.mp4

# Renomear
mv public/video-boi-comprimido.mp4 public/video-boi.mp4
```

---

## 🐛 Problemas Comuns

### Erro: "fatal: not a git repository"

**Solução:** Você não está na pasta certa!

```bash
# Encontre a pasta do projeto
find ~ -name "index.html" -type f 2>/dev/null | grep itrace

# Vá para lá
cd /caminho/encontrado
```

### Erro: "Please tell me who you are"

**Solução:** Configure o Git!

```bash
git config --global user.name "Seu Nome"
git config --global user.email "seu@email.com"
```

### Erro: "rejected - non-fast-forward"

**Solução:** Alguém fez mudanças antes de você!

```bash
# Puxar atualizações primeiro
git pull origin main

# Depois fazer push
git push origin main
```

### Erro: "Permission denied (publickey)"

**Solução:** Configure SSH ou use HTTPS!

```bash
# Ver URL atual
git remote -v

# Se estiver usando SSH mas não configurou, mude para HTTPS
git remote set-url origin https://github.com/usuario/repositorio.git
```

---

## 📊 Verificar Histórico

```bash
# Ver últimos commits
git log --oneline

# Ver mudanças detalhadas
git log -p -2

# Ver árvore de commits (bonito!)
git log --graph --oneline --all
```

---

## 🔄 Desfazer Mudanças (Emergência!)

### Desfazer último commit (sem perder arquivos):

```bash
git reset --soft HEAD~1
```

### Desfazer mudanças não commitadas:

```bash
# Voltar um arquivo específico
git checkout -- arquivo.html

# Voltar TUDO (cuidado!)
git reset --hard
```

---

## 🎯 Fluxo de Trabalho Ideal

```
1. Fazer mudanças nos arquivos
   ↓
2. git status (ver o que mudou)
   ↓
3. git add . (adicionar tudo)
   ↓
4. git commit -m "Descrição clara"
   ↓
5. git push origin main
   ↓
6. Verificar no GitHub ✅
```

---

## 📱 Hospedar o Site (Bônus)

### GitHub Pages (100% Grátis!)

```bash
# Ir para o repositório no GitHub
# Settings → Pages → Source: main → Save

# Seu site estará em:
# https://seu-usuario.github.io/nome-repositorio/
```

---

## 🆘 Precisa de Ajuda?

```bash
# Ver ajuda do Git
git help

# Ajuda de comando específico
git help commit
git help push
```

---

## ✅ Checklist Final

Antes de fazer push, verifique:

- [ ] Todos os arquivos estão corretos
- [ ] O vídeo está em `public/video-boi.mp4`
- [ ] `git status` não mostra erros
- [ ] A mensagem do commit é clara
- [ ] Você está na branch correta (`main` ou `master`)

---

## 🎉 Pronto!

Agora seu site iTrace está:
- ✅ Versionado no Git
- ✅ Hospedado no GitHub
- ✅ Pronto para ser compartilhado
- ✅ Fácil de atualizar sempre que precisar!

**Dúvidas?** Volte neste guia sempre que precisar! 📚

---

**Criado para o projeto iTrace - Agro Rastreamento** 🐄💚
