# 🎯 Atualizar iTrace no GitHub - PASSO A PASSO VISUAL

> **Guia ultra simplificado para iniciantes!** 🚀

---

## 🖥️ PASSO 1: Abrir Terminal

```
Pressione: Ctrl + Alt + T
```

**Você verá uma tela preta assim:**
```
rayane@computador:~$
```

---

## 📂 PASSO 2: Ir para a Pasta do Projeto

```bash
cd ~/caminho/do/projeto
```

**Exemplo real:**
```bash
cd ~/Documentos/itrace-agro
```

**Como saber o caminho?** 
- Abra a pasta do projeto no gerenciador de arquivos
- Clique com botão direito → "Abrir no Terminal"

---

## 🔍 PASSO 3: Confirmar que Está no Lugar Certo

```bash
ls
```

**Deve aparecer:**
```
index.html
styles.css
script.js
public/
README.md
```

✅ **Se aparecer `index.html` → está certo!**  
❌ **Se NÃO aparecer → volte ao PASSO 2**

---

## 📹 PASSO 4: Verificar o Vídeo (IMPORTANTE!)

```bash
bash VERIFICAR-TAMANHO-VIDEO.sh
```

**O que vai aparecer:**
```
✅ Vídeo encontrado!
📏 Tamanho: 85 MB

✅ Vídeo dentro do limite do GitHub!
```

### ⚠️ Se aparecer "MAIOR que 100 MB":

**NÃO CONTINUE!** Use uma destas soluções:

#### Opção 1: Comprimir (Recomendado)
```bash
sudo apt install ffmpeg
ffmpeg -i public/video-boi.mp4 -vcodec h264 -crf 28 public/video-temp.mp4
mv public/video-temp.mp4 public/video-boi.mp4
```

#### Opção 2: Git LFS
```bash
sudo apt install git-lfs
git lfs install
git lfs track "*.mp4"
git add .gitattributes
```

---

## 🚀 PASSO 5: Atualizar no GitHub (AUTOMÁTICO)

### Opção A: Script Automático (FÁCIL!)

```bash
bash ATUALIZAR-AGORA.sh
```

**O script vai perguntar:**
```
✅ Adicionar TODOS os arquivos? (s/n): 
```
Digite: `s` e pressione ENTER

```
💬 Escolha a mensagem do commit:
  1) Converter projeto para HTML/CSS/JS puro + adicionar vídeo
  2) Atualização completa do iTrace
  3) Adicionar vídeo demonstrativo
  4) Personalizada

Opção (1-4):
```
Digite: `1` e pressione ENTER

```
🚀 Enviar para o GitHub? (s/n):
```
Digite: `s` e pressione ENTER

**PRONTO! ✅**

---

### Opção B: Manual (Passo a Passo)

Se preferir fazer manualmente:

#### 5.1. Ver o que mudou
```bash
git status
```

#### 5.2. Adicionar tudo
```bash
git add .
```

#### 5.3. Fazer commit
```bash
git commit -m "Converter projeto para HTML/CSS/JS puro + adicionar vídeo"
```

#### 5.4. Enviar para GitHub
```bash
git push origin main
```

**Se der erro, tente:**
```bash
git push origin master
```

---

## ✅ PASSO 6: Verificar se Deu Certo

### No Terminal:

Se aparecer algo assim → **SUCESSO!** ✅
```
Enumerating objects: 15, done.
Counting objects: 100% (15/15), done.
Writing objects: 100% (9/9), 85.2 MB | 3.5 MB/s, done.
Total 9 (delta 4), reused 0 (delta 0)
To github.com:usuario/itrace-agro.git
   abc1234..def5678  main -> main
```

### No Navegador:

1. Abra: `https://github.com/SEU-USUARIO/SEU-REPOSITORIO`
2. Você deve ver os arquivos atualizados!
3. Clique em `public/` → deve aparecer `video-boi.mp4`

---

## 🎉 PRONTO!

Seu projeto está no GitHub! 🚀

---

## 🐛 Problemas Comuns

### Erro: "not a git repository"

**Problema:** Você não está na pasta certa!

**Solução:**
```bash
pwd
cd ~/caminho/correto/do/projeto
```

---

### Erro: "Please tell me who you are"

**Problema:** Git não sabe quem você é!

**Solução:**
```bash
git config --global user.name "Seu Nome"
git config --global user.email "seu@email.com"
```

---

### Erro: "failed to push"

**Problema:** Alguém fez mudanças antes de você!

**Solução:**
```bash
git pull origin main
git push origin main
```

---

### Erro: "Permission denied"

**Problema:** Sem permissão para acessar o GitHub!

**Solução:**
```bash
# Mudar para HTTPS
git remote set-url origin https://github.com/usuario/repositorio.git

# Fazer push novamente
git push origin main
```

---

## 📱 BÔNUS: Hospedar o Site de GRAÇA!

Seu site pode ficar online no GitHub Pages:

### Via Interface Web:

1. Vá no seu repositório no GitHub
2. Clique em **Settings**
3. No menu lateral, clique em **Pages**
4. Em "Source", selecione: **main**
5. Clique em **Save**

**Seu site estará em:**
```
https://seu-usuario.github.io/nome-repositorio/
```

Demora ~5 minutos para ficar pronto! ⏱️

---

## 🆘 Precisa de Ajuda?

### Ver histórico:
```bash
git log --oneline
```

### Desfazer último commit:
```bash
git reset --soft HEAD~1
```

### Ver diferenças:
```bash
git diff
```

---

## 📋 Resumo dos Comandos

```bash
# 1. Ir para o projeto
cd ~/Documentos/itrace-agro

# 2. Ver status
git status

# 3. Adicionar tudo
git add .

# 4. Commit
git commit -m "Sua mensagem aqui"

# 5. Push
git push origin main
```

---

## ⚡ Comando Único (Copie e Cole)

Se você já sabe o que está fazendo:

```bash
git add . && git commit -m "Atualização iTrace" && git push origin main
```

---

**Criado para facilitar sua vida! 💚🐄**

**Dúvidas?** Volte neste guia sempre que precisar! 📚
