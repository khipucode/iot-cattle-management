# 🚀 GUIA COMPLETO: ATUALIZAR SITE NO GITHUB

## 📋 RESUMO EXECUTIVO

Este guia te ensina PASSO A PASSO como:
1. ✅ Copiar o vídeo para o projeto
2. ✅ Atualizar tudo no GitHub
3. ✅ Hospedar o site gratuitamente

---

## 🎯 ANTES DE COMEÇAR

### **Pré-requisitos:**
- Git instalado (`sudo apt install git`)
- Conta no GitHub
- Terminal aberto

### **Estrutura do Projeto:**
```
itrace-site/
├── index.html       ← Página principal
├── styles.css       ← Estilos
├── script.js        ← JavaScript
└── public/
    └── video-boi.mp4  ← SEU VÍDEO AQUI!
```

---

## 📹 ETAPA 1: PREPARAR O VÍDEO

### **1.1 - Navegar até o projeto**

```bash
# Verificar onde você está
pwd

# Listar pastas
ls

# Ir para o projeto (AJUSTE O CAMINHO!)
cd ~/Documentos/itrace-site
# OU
cd ~/GitHub/itrace-site
# OU
cd /caminho/completo/do/projeto
```

### **1.2 - Verificar se está no lugar certo**

```bash
# Ver os arquivos
ls

# Deve aparecer: index.html, styles.css, script.js, public/
```

### **1.3 - Criar pasta public (se não existir)**

```bash
# Criar pasta
mkdir -p public

# Verificar
ls -la
```

### **1.4 - Copiar o vídeo**

```bash
# Copiar o vídeo (ATENÇÃO ÀS ASPAS por causa do espaço no nome!)
cp "/home/rayane/Downloads/Video boi" public/video-boi.mp4

# Verificar se copiou
ls -lh public/
```

**Resultado esperado:**
```
-rw-r--r-- 1 rayane rayane 85M Mar 12 10:30 video-boi.mp4
```

### **1.5 - Ver tamanho do vídeo**

```bash
du -h public/video-boi.mp4
```

**⚠️ IMPORTANTE:**
- Se mostrar **menos de 100M** → Pode subir direto no GitHub ✅
- Se mostrar **mais de 100M** → Precisa usar Git LFS ou hospedar externamente ⚠️

---

## 🔧 ETAPA 2: CONFIGURAR GIT (primeira vez)

Se você **NUNCA** configurou o Git, faça isso:

```bash
# Configurar nome
git config --global user.name "Seu Nome"

# Configurar email
git config --global user.email "seu-email@exemplo.com"

# Verificar
git config --global --list
```

---

## 📤 ETAPA 3: ENVIAR PARA O GITHUB

### **3.1 - Verificar status**

```bash
git status
```

**Você verá:**
```
On branch main
Untracked files:
  index.html
  styles.css
  script.js
  public/
  README.md
  ...
```

### **3.2 - Adicionar TODOS os arquivos**

```bash
# Adicionar tudo
git add .

# OU adicionar específicos
git add index.html styles.css script.js public/ README.md INSTRUCOES-GIT.md .gitignore
```

### **3.3 - Verificar o que será enviado**

```bash
git status
```

**Agora deve mostrar em verde:**
```
Changes to be committed:
  new file:   index.html
  new file:   styles.css
  new file:   script.js
  new file:   public/video-boi.mp4
  ...
```

### **3.4 - Fazer o commit**

```bash
git commit -m "Converter site para HTML/CSS/JS puro + adicionar vídeo demonstrativo"
```

### **3.5 - Enviar para o GitHub**

```bash
# Se a branch for 'main'
git push origin main

# OU se for 'master'
git push origin master
```

**⚠️ Se der erro "no upstream", faça:**
```bash
git push -u origin main
```

---

## ✅ ETAPA 4: VERIFICAR NO GITHUB

1. Abra seu navegador
2. Vá para: `https://github.com/seu-usuario/seu-repositorio`
3. Você deve ver todos os arquivos!
4. Clique em `public/` → Deve ter o `video-boi.mp4`

---

## 🌐 ETAPA 5: HOSPEDAR O SITE (GRÁTIS!)

### **Opção A: GitHub Pages**

```bash
# 1. No seu navegador, vá para o repositório
# 2. Settings (Configurações)
# 3. Pages (no menu lateral)
# 4. Source: Selecione "main" branch
# 5. Clique em "Save"
# 6. Aguarde 1-2 minutos
# 7. Seu site estará em: https://seu-usuario.github.io/seu-repositorio
```

### **Opção B: Netlify (Mais Fácil!)**

1. Acesse: https://app.netlify.com/
2. Clique em "Add new site" → "Import an existing project"
3. Escolha "GitHub"
4. Selecione seu repositório
5. Clique em "Deploy"
6. Pronto! URL automática em segundos

### **Opção C: Vercel**

```bash
# Instalar Vercel CLI
npm install -g vercel

# Fazer deploy
vercel

# Seguir as instruções na tela
```

---

## 🆘 RESOLVENDO PROBLEMAS COMUNS

### **Problema 1: Vídeo maior que 100MB**

**Erro:**
```
remote: error: File public/video-boi.mp4 is 150 MB; this exceeds GitHub's file size limit of 100 MB
```

**Solução A: Git LFS**

```bash
# Instalar Git LFS
sudo apt install git-lfs

# Inicializar
git lfs install

# Rastrear vídeos
git lfs track "*.mp4"

# Adicionar arquivo de configuração
git add .gitattributes

# Adicionar vídeo
git add public/video-boi.mp4

# Commit
git commit -m "Adicionar vídeo com Git LFS"

# Push
git push origin main
```

**Solução B: Hospedar vídeo externamente**

1. Fazer upload no YouTube (não listado)
2. Ou Google Drive (público)
3. Copiar URL
4. Editar `index.html` linha 336:

```html
<!-- ANTES: -->
<video ... src="./public/video-boi.mp4">

<!-- DEPOIS: -->
<video ... src="https://URL-DO-VIDEO-EXTERNO">
```

---

### **Problema 2: "fatal: not a git repository"**

**Solução:**

```bash
# Inicializar Git
git init

# Adicionar remote (SUBSTITUA pela URL do seu repositório!)
git remote add origin https://github.com/seu-usuario/seu-repositorio.git

# Verificar
git remote -v
```

---

### **Problema 3: "Permission denied (publickey)"**

**Solução:**

```bash
# Gerar chave SSH
ssh-keygen -t ed25519 -C "seu-email@exemplo.com"

# Copiar chave pública
cat ~/.ssh/id_ed25519.pub

# 1. Copie o conteúdo
# 2. Vá em GitHub → Settings → SSH and GPG keys
# 3. New SSH key
# 4. Cole a chave
# 5. Tente o push novamente
```

---

### **Problema 4: Conflito de merge**

```bash
# Puxar mudanças primeiro
git pull origin main

# Se der conflito, resolver manualmente
# Depois:
git add .
git commit -m "Resolver conflitos"
git push origin main
```

---

## 🔄 ATUALIZAÇÕES FUTURAS

### **Fazer mudanças no site:**

```bash
# 1. Editar os arquivos (index.html, styles.css, etc.)

# 2. Ver o que mudou
git status
git diff

# 3. Adicionar mudanças
git add .

# 4. Commit com mensagem descritiva
git commit -m "Atualizar seção de preços"

# 5. Enviar
git push origin main
```

---

## 📊 COMANDOS GIT ÚTEIS

```bash
# Ver histórico de commits
git log --oneline

# Ver mudanças não commitadas
git diff

# Desfazer mudanças em arquivo
git checkout -- arquivo.html

# Desfazer último commit (mantém arquivos)
git reset --soft HEAD~1

# Ver branches
git branch

# Criar nova branch
git checkout -b nova-funcionalidade

# Voltar para main
git checkout main

# Ver remotes
git remote -v

# Clonar repositório
git clone https://github.com/usuario/repo.git

# Puxar atualizações
git pull origin main

# Ver quem fez mudanças
git blame arquivo.html
```

---

## 🎯 CHECKLIST FINAL

Antes de fazer push, verifique:

- [ ] Vídeo está em `public/video-boi.mp4`
- [ ] Vídeo é menor que 100MB (ou configurou Git LFS)
- [ ] Testou localmente (abriu index.html no navegador)
- [ ] Fez `git add .`
- [ ] Fez `git commit -m "mensagem"`
- [ ] Fez `git push origin main`
- [ ] Verificou no GitHub que arquivos subiram

---

## 🏆 COMANDOS COMPLETOS (COPIAR E COLAR)

```bash
# ==========================================
# SCRIPT COMPLETO - COPIE TUDO DE UMA VEZ
# ==========================================

# 1. Ir para o projeto (AJUSTE O CAMINHO!)
cd ~/Documentos/itrace-site

# 2. Criar pasta public
mkdir -p public

# 3. Copiar vídeo
cp "/home/rayane/Downloads/Video boi" public/video-boi.mp4

# 4. Ver tamanho
du -h public/video-boi.mp4

# 5. Verificar status
git status

# 6. Adicionar tudo
git add .

# 7. Commit
git commit -m "Converter site para HTML/CSS/JS puro + vídeo demonstrativo"

# 8. Push
git push origin main

# 9. Verificar
git status

echo "✅ CONCLUÍDO! Verifique no GitHub!"
```

---

## 📞 PRECISA DE AJUDA?

Se encontrar algum erro:

1. **Copie a mensagem de erro completa**
2. **Cole no terminal:**
   ```bash
   git status
   ```
3. **Me envie:**
   - A mensagem de erro
   - O resultado do `git status`
   - O que você estava tentando fazer

---

## 🎓 APRENDER MAIS

- [Git - Documentação Oficial](https://git-scm.com/doc)
- [GitHub Guides](https://guides.github.com/)
- [Git LFS](https://git-lfs.github.com/)

---

**Última atualização:** 12/03/2026  
**Versão:** 1.0  
**Autor:** Assistente IA  

✨ **Boa sorte com o deploy!** ✨
