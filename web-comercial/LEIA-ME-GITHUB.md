# 🐄 iTrace - Como Atualizar no GitHub

> **Guia rápido para enviar o projeto para o GitHub!**

---

## 🚀 MÉTODO RÁPIDO (3 Comandos)

Abra o terminal na pasta do projeto e execute:

```bash
git add .
git commit -m "Projeto iTrace convertido para HTML/CSS/JS puro"
git push origin main
```

**PRONTO! ✅** Seu projeto está no GitHub!

---

## 🎬 MÉTODO AUTOMÁTICO (1 Comando)

Ainda mais fácil:

```bash
bash ATUALIZAR-AGORA.sh
```

O script fará tudo para você com menus interativos!

---

## 📹 ANTES DE FAZER PUSH: Verificar Vídeo

⚠️ **IMPORTANTE:** Se o vídeo for maior que 100MB, o GitHub vai **rejeitar**!

### Verificar tamanho:

```bash
bash VERIFICAR-TAMANHO-VIDEO.sh
```

### Se for MAIOR que 100MB:

#### Opção 1: Comprimir
```bash
sudo apt install ffmpeg
ffmpeg -i public/video-boi.mp4 -vcodec h264 -crf 28 public/temp.mp4
mv public/temp.mp4 public/video-boi.mp4
```

#### Opção 2: Git LFS
```bash
sudo apt install git-lfs
git lfs install
git lfs track "*.mp4"
git add .gitattributes
```

---

## 🔧 Configuração Inicial (Primeira vez)

Se for seu primeiro commit:

```bash
# 1. Configure seu nome e email
git config --global user.name "Seu Nome"
git config --global user.email "seu@email.com"

# 2. Inicialize o repositório (se ainda não tiver)
git init

# 3. Adicione o remote (substitua pela URL do seu repo)
git remote add origin https://github.com/usuario/itrace-agro.git

# 4. Faça o primeiro commit
git add .
git commit -m "Initial commit - Site iTrace"

# 5. Push
git push -u origin main
```

---

## ✅ Verificar se Deu Certo

1. Abra o navegador
2. Vá em: `https://github.com/seu-usuario/seu-repositorio`
3. Verifique se os arquivos apareceram
4. Verifique se `public/video-boi.mp4` está lá

---

## 🌐 Hospedar no GitHub Pages (GRÁTIS!)

Depois de fazer push:

1. No GitHub, vá em **Settings**
2. Clique em **Pages** (menu lateral)
3. Em "Source", selecione: **main** branch
4. Clique em **Save**
5. Aguarde 5 minutos
6. Seu site estará em: `https://usuario.github.io/repositorio/`

---

## 🐛 Problemas Comuns

### "Please tell me who you are"
```bash
git config --global user.name "Seu Nome"
git config --global user.email "seu@email.com"
```

### "Permission denied (publickey)"
```bash
git remote set-url origin https://github.com/usuario/repo.git
```

### "rejected - non-fast-forward"
```bash
git pull origin main
git push origin main
```

### "File exceeds GitHub's file size limit"
```bash
bash VERIFICAR-TAMANHO-VIDEO.sh
# Siga as instruções para comprimir ou usar Git LFS
```

---

## 📚 Mais Ajuda?

- 📖 Leia: `PASSO-A-PASSO-VISUAL.md`
- 📖 Consulte: `COMO-ATUALIZAR-NO-GITHUB.md`
- 📖 Use: `COLA-GIT.md` (comandos prontos)

---

**Criado para facilitar sua vida! 💚🐄**
