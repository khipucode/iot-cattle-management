# 🚀 COMECE AQUI - iTrace Agro Rastreamento

> **Bem-vindo ao projeto iTrace!** Este é nosso guia de início rápido.

---

## 📌 O Que Fazer AGORA?

### Se você acabou de clonar o projeto:

```bash
# 1. Entre na pasta
cd itrace-agro

# 2. Abra o site no navegador
firefox index.html
```

**PRONTO! ✅** O site já funciona!

---

## 🎥 Adicionar o Vídeo (IMPORTANTE!)

O site precisa do vídeo `video-boi.mp4` na pasta `public/`.

### Passo a Passo:

```bash
# 1. Criar pasta public
mkdir public

# 2. Copiar o vídeo
cp "/home/rayane/Downloads/Video boi" public/video-boi.mp4

# 3. Verificar tamanho
bash VERIFICAR-TAMANHO-VIDEO.sh
```

---

## 📂 Arquivos Importantes

| Arquivo | Para Que Serve |
|---------|----------------|
| `index.html` | Página principal do site |
| `styles.css` | Todos os estilos visuais |
| `script.js` | Interações (abas, accordion, vídeo) |
| `public/video-boi.mp4` | Vídeo demonstrativo |

---

## 🛠️ Precisa Editar Algo?

### Mudar Texto:
- Edite `index.html`

### Mudar Cores:
- Edite `styles.css` (linha 8-24: variáveis de cor)

### Mudar Funcionalidades:
- Edite `script.js`

---

## 🌐 Testar Localmente

### Opção 1: Abrir Direto
```bash
firefox index.html
```

### Opção 2: Servidor Python
```bash
python3 -m http.server 8000
# Abra: http://localhost:8000
```

### Opção 3: Live Server (VS Code)
1. Instale extensão "Live Server"
2. Clique direito em `index.html`
3. Clique em "Open with Live Server"

---

## 📤 Atualizar no GitHub

### Método Automático (FÁCIL):

```bash
bash ATUALIZAR-AGORA.sh
```

Siga as instruções na tela!

### Método Manual:

```bash
git add .
git commit -m "Sua mensagem"
git push origin main
```

---

## 📚 Guias Disponíveis

Escolha o guia certo para você:

| Guia | Para Quem? |
|------|-----------|
| `PASSO-A-PASSO-VISUAL.md` | 👶 Iniciantes completos |
| `COMO-ATUALIZAR-NO-GITHUB.md` | 🎯 Guia detalhado Git |
| `INSTRUCOES-GIT.md` | 📖 Referência completa |
| `README.md` | 📋 Visão geral do projeto |

---

## ⚡ Atalhos Úteis

```bash
# Ver status do Git
git status

# Ver histórico de commits
git log --oneline

# Desfazer mudanças
git reset --hard

# Criar nova branch
git checkout -b minha-feature

# Voltar para main
git checkout main
```

---

## 🎯 Checklist de Início

Marque conforme for fazendo:

- [ ] ✅ Clonou o repositório
- [ ] ✅ Abriu `index.html` no navegador
- [ ] ✅ Criou pasta `public/`
- [ ] ✅ Copiou `video-boi.mp4`
- [ ] ✅ Verificou tamanho do vídeo
- [ ] ✅ Testou o site localmente
- [ ] ✅ Fez primeiro commit
- [ ] ✅ Fez primeiro push

---

## 🐛 Problemas Comuns

### Vídeo não aparece?

**Verifique:**
```bash
ls -lh public/video-boi.mp4
```

Se não aparecer:
```bash
mkdir public
cp "/caminho/do/video" public/video-boi.mp4
```

### Ícones não aparecem?

**Você precisa de internet!** Os ícones vêm do CDN Lucide.

Verifique no `index.html` linha 12:
```html
<script src="https://unpkg.com/lucide@latest"></script>
```

### Site não abre?

**Verifique o caminho:**
```bash
pwd
ls index.html
```

---

## 🎨 Personalização Rápida

### Mudar Cor Principal:

Edite `styles.css` linha 15:
```css
--green-500: #22c55e;  /* Mude para sua cor */
```

### Mudar Logo/Título:

Edite `index.html` linha 24-26:
```html
<span class="hero-title-main">iTrace</span>
<span class="hero-title-sub">Agro Rastreamento</span>
```

### Mudar Planos de Preço:

Edite `index.html` linha 300 (Pequeno Produtor), 315 (Médio), 334 (Grande)

---

## 🚀 Próximos Passos

1. ✅ Teste o site localmente
2. ✅ Adicione o vídeo
3. ✅ Personalize cores/textos
4. ✅ Faça commit das mudanças
5. ✅ Hospede no GitHub Pages (GRÁTIS!)

### Como Hospedar no GitHub Pages:

1. Vá no repositório no GitHub
2. **Settings** → **Pages**
3. Source: **main** branch
4. **Save**
5. Aguarde 5 minutos
6. Acesse: `https://seu-usuario.github.io/itrace-agro/`

---

## 🆘 Precisa de Ajuda?

### Leia os guias:
- `PASSO-A-PASSO-VISUAL.md` - Mais simples
- `COMO-ATUALIZAR-NO-GITHUB.md` - Mais completo

### Comandos úteis:
```bash
# Ajuda do Git
git help

# Status detalhado
git status -v

# Ver diferenças
git diff
```

---

## 📞 Informações do Projeto

- **Tecnologia:** HTML5 + CSS3 + JavaScript puro
- **Tamanho:** ~50KB (super leve!)
- **Compatibilidade:** Todos os navegadores modernos
- **Responsivo:** Desktop, Tablet, Mobile
- **SEO:** Otimizado para Google

---

## ✨ Recursos do Site

✅ Hero Section com gradiente verde  
✅ Seção About com passos explicativos  
✅ Vídeo demonstrativo interativo  
✅ 3 planos de preços  
✅ 6 formas de pagamento (abas)  
✅ FAQ com accordion  
✅ Footer completo  
✅ 100% responsivo  
✅ Animações suaves  

---

## 🎉 Tudo Pronto!

Agora você já sabe:

- ✅ Como abrir o site
- ✅ Como adicionar o vídeo
- ✅ Como editar
- ✅ Como testar
- ✅ Como atualizar no GitHub
- ✅ Como hospedar

**Boa sorte com seu projeto! 💚🐄**

---

**Dúvidas?** Consulte os outros guias na pasta raiz!

📚 `PASSO-A-PASSO-VISUAL.md`  
📚 `COMO-ATUALIZAR-NO-GITHUB.md`  
📚 `README.md`
