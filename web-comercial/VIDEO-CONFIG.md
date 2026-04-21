# 🎥 CONFIGURAÇÃO DO VÍDEO - iTrace

## ✅ **SUPER FÁCIL - Apenas Cole o Link!**

---

## 📋 **LINK ATUAL DO VÍDEO:**

```
https://drive.google.com/file/d/1L17LVbdrO1DaJzcIYkGgSn4Tx5pG-ywa/view?usp=drive_link
```

---

## 🔄 **COMO TROCAR O VÍDEO:**

### **OPÇÃO 1: Google Drive (RECOMENDADO)** ⭐

1. **Faça upload do vídeo no Google Drive**
2. **Clique com botão direito** → "Compartilhar"
3. **Altere para:** "Qualquer pessoa com o link pode visualizar"
4. **Copie o link** (será algo como):
   ```
   https://drive.google.com/file/d/1L17LVbdrO1DaJzcIYkGgSn4Tx5pG-ywa/view?usp=drive_link
   ```

5. **Converta para formato embed:**
   - Pegue apenas o ID: `ABC123XYZ`
   - Use o formato: `https://drive.google.com/file/d/ABC123XYZ/preview`

6. **Substitua nos arquivos:**

   **No HTML (`/index.html` linha 237):**
   ```html
   <iframe src="SEU_LINK_AQUI/preview" ...>
   ```

   **No React (`/src/app/components/video-section.tsx` linha 9):**
   ```javascript
   const VIDEO_URL = "SEU_LINK_AQUI/preview";
   ```

---

### **OPÇÃO 2: YouTube**

1. Faça upload no YouTube (pode ser vídeo não listado)
2. Clique em "Compartilhar" → "Incorporar"
3. Copie o link que aparece no `src=""`:
   ```
   https://www.youtube.com/embed/ABC123
   ```
4. Use esse link nos arquivos

---

### **OPÇÃO 3: Vimeo**

1. Faça upload no Vimeo
2. Vá em "Configurações" → "Privacidade"
3. Copie o link de incorporação:
   ```
   https://player.vimeo.com/video/123456789
   ```
4. Use esse link nos arquivos

---

## 🎯 **EXEMPLO PRÁTICO:**

### Seu link do Google Drive:
```
https://drive.google.com/file/d/1oYHFi0IOXJJYyM9Q4WYgTeD8HTmJU56n/view?usp=drive_link
```

### Conversão para embed:
1. ID do vídeo: `1oYHFi0IOXJJYyM9Q4WYgTeD8HTmJU56n`
2. Link correto: `https://drive.google.com/file/d/1oYHFi0IOXJJYyM9Q4WYgTeD8HTmJU56n/preview`

### ✅ **JÁ ESTÁ CONFIGURADO!** O vídeo está funcionando!

---

## 📍 **ONDE ALTERAR:**

### **HTML Puro:**
📄 Arquivo: `/index.html`  
📍 Linha: `237`  
🔍 Procure por: `<iframe id="mainVideo"`

### **React/TypeScript:**
📄 Arquivo: `/src/app/components/video-section.tsx`  
📍 Linha: `9`  
🔍 Procure por: `const VIDEO_URL =`

---

## ⚡ **DICA PRO:**

Para trocar o vídeo em **TODOS OS LUGARES** de uma vez, use este comando no terminal:

```bash
# Substitua OLD_ID pelo ID antigo e NEW_ID pelo novo
sed -i 's/1oYHFi0IOXJJYyM9Q4WYgTeD8HTmJU56n/SEU_NOVO_ID/g' index.html
sed -i 's/1oYHFi0IOXJJYyM9Q4WYgTeD8HTmJU56n/SEU_NOVO_ID/g' src/app/components/video-section.tsx
```

---

## 🚀 **BENEFÍCIOS DE USAR LINK:**

✅ **Sem limite de tamanho** (GitHub aceita só até 100MB)  
✅ **Mais rápido** (não precisa fazer upload no repositório)  
✅ **Fácil de trocar** (só muda o link)  
✅ **Funciona em qualquer lugar** (site, GitHub Pages, Netlify, etc.)  
✅ **Streaming otimizado** (carrega mais rápido)  

---

## 🆘 **PROBLEMAS COMUNS:**

### ❌ Vídeo não aparece:
- Verifique se o link está público/compartilhado
- Use `/preview` no final (não `/view`)
- Teste o link abrindo no navegador

### ❌ "Erro de incorporação":
- No Google Drive: ative "Qualquer pessoa com o link"
- No YouTube: verifique se permite incorporação
- No Vimeo: ative "Incorporação pública"

---

## 💡 **LINK ATUAL FUNCIONANDO:**

```
https://drive.google.com/file/d/1oYHFi0IOXJJYyM9Q4WYgTeD8HTmJU56n/preview
```

**✅ Está tudo configurado e pronto para usar!**

---

**📞 Dúvidas?** Só seguir este guia passo a passo! 🚀
