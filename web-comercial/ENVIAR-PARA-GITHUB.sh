#!/bin/bash

# 🚀 Script Automático para Enviar para o GitHub
# Execute: bash ENVIAR-PARA-GITHUB.sh

clear

echo "╔═══════════════════════════════════════════════════════════════════╗"
echo "║                                                                   ║"
echo "║     🚀 ENVIAR ATUALIZAÇÕES PARA O GITHUB                         ║"
echo "║     iTrace - Agro Rastreamento                                   ║"
echo "║                                                                   ║"
echo "╚═══════════════════════════════════════════════════════════════════╝"
echo ""

# Verificar se está em um repositório Git
if [ ! -d ".git" ]; then
    echo "❌ ERRO: Este diretório não é um repositório Git!"
    echo ""
    echo "💡 Para inicializar:"
    echo "   git init"
    echo "   git remote add origin https://github.com/SEU_USUARIO/SEU_REPOSITORIO.git"
    echo ""
    exit 1
fi

echo "📂 Verificando arquivos modificados..."
echo ""

# Mostrar status
git status --short

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Verificar se há alterações
if [ -z "$(git status --porcelain)" ]; then
    echo "✅ Nenhuma alteração para enviar!"
    echo ""
    echo "🎉 Tudo já está atualizado no GitHub!"
    exit 0
fi

echo "📝 Resumo das alterações:"
echo ""
echo "   ✅ Video Section atualizado (Google Drive link)"
echo "   ✅ Guias de configuração criados"
echo "   ✅ Scripts de automação atualizados"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Perguntar ao usuário
read -p "🤔 Deseja continuar com o envio? (s/n): " resposta

if [[ ! $resposta =~ ^[SsYy]$ ]]; then
    echo ""
    echo "❌ Envio cancelado!"
    echo ""
    exit 0
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  ETAPA 1/3: Adicionando arquivos..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

git add .

if [ $? -eq 0 ]; then
    echo "✅ Arquivos adicionados com sucesso!"
else
    echo "❌ Erro ao adicionar arquivos!"
    exit 1
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  ETAPA 2/3: Criando commit..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Mensagem de commit automática com data
DATA=$(date '+%d/%m/%Y %H:%M')
MENSAGEM="🎥 Atualização: Vídeo via Google Drive + Guias de configuração - $DATA"

git commit -m "$MENSAGEM"

if [ $? -eq 0 ]; then
    echo "✅ Commit criado com sucesso!"
    echo "   📝 Mensagem: $MENSAGEM"
else
    echo "❌ Erro ao criar commit!"
    exit 1
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  ETAPA 3/3: Enviando para o GitHub..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Detectar branch atual
BRANCH=$(git branch --show-current)

if [ -z "$BRANCH" ]; then
    BRANCH="main"
fi

echo "📤 Enviando para branch: $BRANCH"
echo ""

git push origin $BRANCH

if [ $? -eq 0 ]; then
    echo ""
    echo "╔═══════════════════════════════════════════════════════════════════╗"
    echo "║                                                                   ║"
    echo "║     🎉 SUCESSO! Tudo enviado para o GitHub!                      ║"
    echo "║                                                                   ║"
    echo "╚═══════════════════════════════════════════════════════════════════╝"
    echo ""
    echo "✅ Arquivos enviados:"
    echo "   • src/app/components/video-section.tsx"
    echo "   • VIDEO-CONFIG.md"
    echo "   • TROCAR-VIDEO-RAPIDO.txt"
    echo "   • ENVIAR-PARA-GITHUB.sh"
    echo ""
    
    # Tentar pegar URL do repositório
    REPO_URL=$(git config --get remote.origin.url | sed 's/\.git$//')
    
    if [[ $REPO_URL == *"github.com"* ]]; then
        echo "🔗 Seu repositório:"
        echo "   $REPO_URL"
        echo ""
        echo "🌐 GitHub Pages (se ativado):"
        
        # Extrair usuário e repo
        USER_REPO=$(echo $REPO_URL | sed 's/.*github\.com[:/]\(.*\)/\1/')
        echo "   https://$(echo $USER_REPO | cut -d'/' -f1).github.io/$(echo $USER_REPO | cut -d'/' -f2)/"
        echo ""
    fi
    
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "💡 Próximos passos:"
    echo ""
    echo "   1. Acesse seu repositório no GitHub"
    echo "   2. Verifique se os arquivos foram enviados"
    echo "   3. Se usar GitHub Pages, aguarde 1-2 minutos para atualizar"
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    
else
    echo ""
    echo "❌ ERRO ao enviar para o GitHub!"
    echo ""
    echo "💡 Possíveis soluções:"
    echo ""
    echo "   1️⃣  Verificar conexão com internet"
    echo "   2️⃣  Verificar autenticação Git:"
    echo "       git config user.name"
    echo "       git config user.email"
    echo ""
    echo "   3️⃣  Fazer login novamente:"
    echo "       git config --global user.name \"Seu Nome\""
    echo "       git config --global user.email \"seu@email.com\""
    echo ""
    echo "   4️⃣  Verificar remote:"
    echo "       git remote -v"
    echo ""
    echo "   5️⃣  Tentar push manual:"
    echo "       git push origin $BRANCH"
    echo ""
    exit 1
fi
