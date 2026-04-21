# 📋 INSTRUÇÕES PARA ATUALIZAR NO GITHUB

## ✅ Site convertido para HTML/CSS/JS puro!

O projeto foi **completamente convertido** de React para HTML/CSS/JavaScript puro, mantendo **100% da beleza visual** e funcionalidades!

---

## 📁 Estrutura do Projeto Novo

```
itrace-site/
├── index.html          (página principal - HTML puro)
├── styles.css          (todos os estilos - CSS puro)
├── script.js           (interatividade - JavaScript puro)
├── public/
│   └── video-boi.mp4   (COLOQUE O VÍDEO AQUI!)
└── INSTRUCOES-GIT.md   (este arquivo)
```

---

## 🚀 PASSO A PASSO NO TERMINAL (Linux)

### **1. Copiar o vídeo para a pasta public**

```bash
# Copiar o vídeo (ajuste o caminho se necessário)
cp "/home/rayane/Downloads/Video boi" ./public/video-boi.mp4

# Verificar se copiou
ls -lh public/
```

---

### **2. Ver o que mudou**

```bash
git status
```

Você verá:
- ✅ Arquivos novos: `index.html`, `styles.css`, `script.js`
- ✅ Pasta nova: `public/`
- ⚠️ Arquivos antigos do React ainda existem (vamos remover)

---

### **3. Adicionar TUDO ao Git**

```bash
# Adicionar os arquivos novos
git add index.html styles.css script.js public/ INSTRUCOES-GIT.md
```

---

### **4. Fazer o Commit**

```bash
git commit -m "Converter site de React para HTML/CSS/JS puro + adicionar vídeo demonstrativo"
```

---

### **5. Enviar para o GitHub**

```bash
git push origin main
```

**OU** se sua branch for `master`:

```bash
git push origin master
```

---

### **6. (OPCIONAL) Remover arquivos React antigos**

Se quiser limpar o projeto e deixar SOMENTE HTML/CSS/JS:

```bash
# Remover pastas do React
rm -rf src/ node_modules/ supabase/ utils/ guidelines/

# Remover arquivos de configuração React
rm package.json postcss.config.mjs vite.config.ts ATTRIBUTIONS.md

# Adicionar mudanças
git add -A

# Commit
git commit -m "Remover arquivos antigos do React"

# Push
git push origin main
```

---

## 🌐 COMO HOSPEDAR (Super Fácil!)

### **Opção 1: GitHub Pages (GRÁTIS!)**

```bash
# 1. Criar branch gh-pages
git checkout -b gh-pages

# 2. Push
git push origin gh-pages

# 3. Configurar no GitHub:
# Settings → Pages → Source: gh-pages branch → Save
```

Seu site ficará em: `https://seu-usuario.github.io/seu-repositorio`

---

### **Opção 2: Netlify (SUPER FÁCIL!)**

1. Acesse: https://www.netlify.com/
2. Arraste a pasta do projeto
3. Pronto! Site no ar em segundos!

---

### **Opção 3: Vercel**

```bash
# Instalar Vercel CLI
npm i -g vercel

# Deploy
vercel
```

---

## 📱 COMO TESTAR LOCALMENTE

### **Método 1: Abrir direto no navegador**
```bash
# Abrir index.html no Firefox/Chrome
firefox index.html
# OU
google-chrome index.html
```

### **Método 2: Servidor local com Python**
```bash
# Python 3
python3 -m http.server 8000

# Abrir no navegador: http://localhost:8000
```

### **Método 3: Servidor local com Node**
```bash
npx http-server
```

---

## ✨ O QUE MUDOU?

| Antes (React) | Depois (HTML Puro) |
|---------------|-------------------|
| ❌ Precisa npm install | ✅ Abre direto! |
| ❌ Precisa build | ✅ Sem build! |
| ❌ ~500KB+ | ✅ ~50KB |
| ❌ React + dependências | ✅ Sem dependências! |
| ✅ Lindo | ✅ **IGUALMENTE LINDO!** |

---

## 🎯 FUNCIONALIDADES QUE FUNCIONAM:

✅ Hero Section com animações  
✅ About Product com cards  
✅ Video Section com player  
✅ Pricing (3 planos)  
✅ Payment (6 abas interativas!)  
✅ Support (accordion FAQ)  
✅ Footer completo  
✅ Scroll suave  
✅ Ícones Lucide  
✅ Responsivo (mobile + desktop)  
✅ Animações de entrada  

---

## ⚠️ IMPORTANTE SOBRE O VÍDEO

Se o vídeo for **maior que 100MB**, o GitHub **NÃO vai aceitar**!

**Soluções:**

### **Ver tamanho do vídeo:**
```bash
du -h public/video-boi.mp4
```

### **Se for maior que 100MB:**

**Opção A: Git LFS**
```bash
sudo apt install git-lfs
git lfs install
git lfs track "*.mp4"
git add .gitattributes
git add public/video-boi.mp4
git commit -m "Adicionar vídeo com Git LFS"
git push origin main
```

**Opção B: Hospedar externamente**
- YouTube (não listado)
- Vimeo
- Google Drive
- Cloudflare R2

Depois alterar no `index.html` linha 336:
```html
<video ... src="URL_DO_VIDEO_EXTERNO">
```

---

## 🆘 PROBLEMAS COMUNS

### **Erro: "File too large"**
➡️ Vídeo maior que 100MB. Use Git LFS ou hospede externamente.

### **Ícones não aparecem**
➡️ Precisa de internet! Lucide usa CDN.

### **Vídeo não carrega**
➡️ Verifique se está em `public/video-boi.mp4`

---

## 📞 SUPORTE

Qualquer dúvida, me chame! 🚀

---

**Criado em:** 12/03/2026  
**Conversão:** React → HTML/CSS/JS Puro  
**Status:** ✅ 100% Funcional e Lindo!
