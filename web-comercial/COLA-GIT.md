# 📝 Cola de Comandos Git - iTrace

> **Copie e cole quando precisar!** 🚀

---

## 🎯 Comandos Mais Usados

### ✅ Atualizar no GitHub (completo)

```bash
git add .
git commit -m "Atualização do site"
git push origin main
```

### ✅ Ver o que mudou

```bash
git status
```

### ✅ Ver histórico

```bash
git log --oneline
```

### ✅ Desfazer último commit (sem perder arquivos)

```bash
git reset --soft HEAD~1
```

---

## 📤 Push (Enviar para GitHub)

### Push normal

```bash
git push origin main
```

### Push forçado (CUIDADO!)

```bash
git push -f origin main
```

### Push primeira vez

```bash
git push -u origin main
```

---

## 📥 Pull (Baixar do GitHub)

### Pull normal

```bash
git pull origin main
```

### Pull forçado (substituir local)

```bash
git fetch --all
git reset --hard origin/main
```

---

## 📝 Commit

### Commit simples

```bash
git commit -m "Sua mensagem"
```

### Commit com descrição

```bash
git commit -m "Título" -m "Descrição detalhada aqui"
```

### Alterar último commit

```bash
git commit --amend -m "Nova mensagem"
```

---

## ➕ Add (Adicionar Arquivos)

### Adicionar tudo

```bash
git add .
```

### Adicionar arquivo específico

```bash
git add index.html
```

### Adicionar pasta

```bash
git add public/
```

### Adicionar vários arquivos

```bash
git add index.html styles.css script.js
```

---

## 🔍 Status e Diff

### Ver status

```bash
git status
```

### Ver status curto

```bash
git status -s
```

### Ver diferenças

```bash
git diff
```

### Ver diferenças de arquivo específico

```bash
git diff index.html
```

---

## 🌿 Branches

### Ver branches

```bash
git branch
```

### Criar branch

```bash
git branch nova-feature
```

### Mudar de branch

```bash
git checkout main
```

### Criar e mudar de branch

```bash
git checkout -b nova-feature
```

### Deletar branch

```bash
git branch -d nome-branch
```

---

## 🔄 Desfazer Mudanças

### Desfazer arquivo específico (não commitado)

```bash
git checkout -- index.html
```

### Desfazer tudo (não commitado)

```bash
git reset --hard
```

### Voltar 1 commit (mantém arquivos)

```bash
git reset --soft HEAD~1
```

### Voltar 1 commit (apaga arquivos)

```bash
git reset --hard HEAD~1
```

### Voltar para commit específico

```bash
git reset --hard abc1234
```

---

## 📊 Histórico

### Ver histórico simples

```bash
git log --oneline
```

### Ver histórico completo

```bash
git log
```

### Ver histórico gráfico

```bash
git log --graph --oneline --all
```

### Ver últimos 5 commits

```bash
git log -5
```

---

## 🔧 Configuração

### Configurar nome

```bash
git config --global user.name "Seu Nome"
```

### Configurar email

```bash
git config --global user.email "seu@email.com"
```

### Ver configurações

```bash
git config --list
```

---

## 🌐 Remote (GitHub)

### Ver remote

```bash
git remote -v
```

### Adicionar remote

```bash
git remote add origin https://github.com/usuario/repo.git
```

### Mudar remote

```bash
git remote set-url origin https://github.com/usuario/novo-repo.git
```

### Remover remote

```bash
git remote remove origin
```

---

## 🏷️ Tags

### Criar tag

```bash
git tag v1.0.0
```

### Ver tags

```bash
git tag
```

### Enviar tag

```bash
git push origin v1.0.0
```

### Enviar todas tags

```bash
git push --tags
```

---

## 🔥 Git LFS (Arquivos Grandes)

### Instalar LFS

```bash
git lfs install
```

### Rastrear arquivos grandes

```bash
git lfs track "*.mp4"
```

### Ver arquivos rastreados

```bash
git lfs ls-files
```

---

## 🆘 Emergências

### ERRO: "Please tell me who you are"

```bash
git config --global user.name "Seu Nome"
git config --global user.email "seu@email.com"
```

### ERRO: "Permission denied"

```bash
git remote set-url origin https://github.com/usuario/repo.git
```

### ERRO: "rejected - non-fast-forward"

```bash
git pull origin main
git push origin main
```

### ERRO: "not a git repository"

```bash
cd /caminho/correto/do/projeto
```

---

## 🎯 Fluxo Completo

### Primeira vez (iniciar repositório)

```bash
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/usuario/repo.git
git push -u origin main
```

### Trabalho diário

```bash
# 1. Fazer mudanças nos arquivos
# 2. Ver o que mudou
git status

# 3. Adicionar
git add .

# 4. Commit
git commit -m "Descrição das mudanças"

# 5. Push
git push origin main
```

---

## 📋 Comandos iTrace Específicos

### Verificar vídeo

```bash
bash VERIFICAR-TAMANHO-VIDEO.sh
```

### Atualizar automático

```bash
bash ATUALIZAR-AGORA.sh
```

### Testar localmente

```bash
python3 -m http.server 8000
```

---

## 🚀 Um Comando Só (Perigoso!)

### Adicionar, commitar e fazer push de uma vez

```bash
git add . && git commit -m "Update" && git push origin main
```

**⚠️ CUIDADO:** Use só se tiver certeza do que está fazendo!

---

## 📝 Mensagens de Commit Boas

```bash
# ✅ BOM
git commit -m "Adicionar seção de vídeo demonstrativo"
git commit -m "Corrigir responsividade no mobile"
git commit -m "Atualizar preços dos planos"

# ❌ RUIM
git commit -m "update"
git commit -m "fix"
git commit -m "asdf"
```

---

## 🔍 Comandos de Investigação

### Ver quem mudou cada linha

```bash
git blame index.html
```

### Ver diferença entre branches

```bash
git diff main..feature
```

### Procurar no histórico

```bash
git log --grep="palavra"
```

---

## 💾 Stash (Guardar Mudanças)

### Guardar mudanças temporariamente

```bash
git stash
```

### Ver stashes

```bash
git stash list
```

### Recuperar último stash

```bash
git stash pop
```

### Aplicar stash específico

```bash
git stash apply stash@{0}
```

---

## 🎨 Aliases Úteis

Adicione no `.gitconfig`:

```bash
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.unstage 'reset HEAD --'
```

Depois use:
```bash
git st  # = git status
git co main  # = git checkout main
git ci -m "msg"  # = git commit -m "msg"
```

---

## 📱 GitHub Pages

### Publicar site

1. Push para GitHub
2. Settings → Pages
3. Source: main branch
4. Save

**URL:** `https://usuario.github.io/repo/`

---

## 🔐 Ignorar Arquivos

Crie arquivo `.gitignore`:

```
node_modules/
.env
*.log
.DS_Store
video-boi-backup.mp4
```

---

## ✅ Checklist Antes de Push

- [ ] `git status` → está tudo certo?
- [ ] `git diff` → mudanças corretas?
- [ ] Testou localmente?
- [ ] Mensagem de commit clara?
- [ ] Branch correta?

---

## 🎉 Pronto!

Agora você tem todos os comandos Git essenciais na ponta dos dedos!

**Dica:** Adicione esta página aos favoritos! ⭐

---

**Cola criada para o projeto iTrace** 🐄💚

*Última atualização: 12/03/2026*
