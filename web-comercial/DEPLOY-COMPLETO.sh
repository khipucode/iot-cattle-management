#!/bin/bash

# 🚀 Script de Deploy Completo - iTrace
# Execute: bash DEPLOY-COMPLETO.sh

clear

echo "╔═══════════════════════════════════════════════════════════════════╗"
echo "║                                                                   ║"
echo "║     🚀 DEPLOY COMPLETO - ITRACE AGRO RASTREAMENTO               ║"
echo "║                                                                   ║"
echo "╚═══════════════════════════════════════════════════════════════════╝"
echo ""

# Cores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Função para exibir menu
show_menu() {
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "  ESCOLHA UMA OPÇÃO:"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "  1️⃣  Deploy Rápido (automático)"
    echo "  2️⃣  Deploy Personalizado (escolher mensagem)"
    echo "  3️⃣  Ver status do repositório"
    echo "  4️⃣  Ver histórico de commits"
    echo "  5️⃣  Desfazer último commit (sem perder alterações)"
    echo "  6️⃣  Verificar configuração Git"
    echo "  7️⃣  Configurar GitHub Pages"
    echo "  0️⃣  Sair"
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
}

# Função para deploy rápido
deploy_rapido() {
    echo ""
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BLUE}  🚀 DEPLOY RÁPIDO${NC}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    
    # Adicionar todos os arquivos
    echo "📦 Adicionando arquivos..."
    git add .
    
    # Criar commit com data
    DATA=$(date '+%d/%m/%Y %H:%M')
    MENSAGEM="🚀 Deploy automático - $DATA"
    
    echo "💾 Criando commit..."
    git commit -m "$MENSAGEM"
    
    # Detectar branch
    BRANCH=$(git branch --show-current)
    if [ -z "$BRANCH" ]; then
        BRANCH="main"
    fi
    
    echo "📤 Enviando para GitHub (branch: $BRANCH)..."
    git push origin $BRANCH
    
    if [ $? -eq 0 ]; then
        echo ""
        echo -e "${GREEN}✅ DEPLOY CONCLUÍDO COM SUCESSO!${NC}"
        echo ""
    else
        echo ""
        echo -e "${RED}❌ Erro no deploy!${NC}"
        echo ""
    fi
}

# Função para deploy personalizado
deploy_personalizado() {
    echo ""
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BLUE}  ✏️  DEPLOY PERSONALIZADO${NC}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    
    # Mostrar alterações
    echo "📂 Arquivos modificados:"
    echo ""
    git status --short
    echo ""
    
    # Pedir mensagem personalizada
    echo "💬 Digite a mensagem do commit:"
    echo "   (Exemplos: 'Adicionar nova seção', 'Corrigir bug no formulário', etc.)"
    echo ""
    read -p "➤ " MENSAGEM_CUSTOM
    
    if [ -z "$MENSAGEM_CUSTOM" ]; then
        echo ""
        echo -e "${YELLOW}⚠️  Mensagem vazia! Usando mensagem padrão...${NC}"
        DATA=$(date '+%d/%m/%Y %H:%M')
        MENSAGEM_CUSTOM="📝 Atualização - $DATA"
    fi
    
    echo ""
    echo "📦 Adicionando arquivos..."
    git add .
    
    echo "💾 Criando commit com mensagem: '$MENSAGEM_CUSTOM'"
    git commit -m "$MENSAGEM_CUSTOM"
    
    BRANCH=$(git branch --show-current)
    if [ -z "$BRANCH" ]; then
        BRANCH="main"
    fi
    
    echo "📤 Enviando para GitHub..."
    git push origin $BRANCH
    
    if [ $? -eq 0 ]; then
        echo ""
        echo -e "${GREEN}✅ DEPLOY CONCLUÍDO COM SUCESSO!${NC}"
        echo ""
    else
        echo ""
        echo -e "${RED}❌ Erro no deploy!${NC}"
        echo ""
    fi
}

# Função para ver status
ver_status() {
    echo ""
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BLUE}  📊 STATUS DO REPOSITÓRIO${NC}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    
    git status
    
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
}

# Função para ver histórico
ver_historico() {
    echo ""
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BLUE}  📜 ÚLTIMOS 10 COMMITS${NC}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    
    git log --oneline --graph --decorate -10
    
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
}

# Função para desfazer último commit
desfazer_commit() {
    echo ""
    echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${YELLOW}  ⚠️  DESFAZER ÚLTIMO COMMIT${NC}"
    echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    
    echo "📜 Último commit:"
    git log -1 --oneline
    echo ""
    
    read -p "⚠️  Tem certeza que deseja desfazer? (s/n): " confirma
    
    if [[ $confirma =~ ^[SsYy]$ ]]; then
        git reset --soft HEAD~1
        echo ""
        echo -e "${GREEN}✅ Commit desfeito! (arquivos mantidos)${NC}"
        echo ""
    else
        echo ""
        echo "❌ Operação cancelada!"
        echo ""
    fi
}

# Função para verificar configuração
verificar_config() {
    echo ""
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BLUE}  ⚙️  CONFIGURAÇÃO GIT${NC}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    
    echo "👤 Nome: $(git config user.name)"
    echo "📧 Email: $(git config user.email)"
    echo ""
    echo "🔗 Repositório remoto:"
    git remote -v
    echo ""
    echo "🌿 Branch atual: $(git branch --show-current)"
    
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
}

# Função para configurar GitHub Pages
configurar_pages() {
    echo ""
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BLUE}  🌐 CONFIGURAR GITHUB PAGES${NC}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    
    echo "📋 INSTRUÇÕES PARA ATIVAR GITHUB PAGES:"
    echo ""
    echo "1. Acesse seu repositório no GitHub"
    echo "2. Vá em: Settings → Pages"
    echo "3. Em 'Source', selecione: 'Deploy from a branch'"
    echo "4. Em 'Branch', escolha: 'main' → pasta '/ (root)'"
    echo "5. Clique em 'Save'"
    echo ""
    echo "⏳ Aguarde 1-2 minutos para o site ficar online!"
    echo ""
    
    # Tentar detectar URL
    REPO_URL=$(git config --get remote.origin.url | sed 's/\.git$//')
    
    if [[ $REPO_URL == *"github.com"* ]]; then
        USER_REPO=$(echo $REPO_URL | sed 's/.*github\.com[:/]\(.*\)/\1/')
        PAGES_URL="https://$(echo $USER_REPO | cut -d'/' -f1).github.io/$(echo $USER_REPO | cut -d'/' -f2)/"
        
        echo "🔗 Seu site estará em:"
        echo "   $PAGES_URL"
        echo ""
    fi
    
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
}

# Verificar se é repositório Git
if [ ! -d ".git" ]; then
    echo -e "${RED}❌ ERRO: Este não é um repositório Git!${NC}"
    echo ""
    echo "💡 Para inicializar:"
    echo "   git init"
    echo "   git remote add origin https://github.com/SEU_USUARIO/SEU_REPO.git"
    echo ""
    exit 1
fi

# Loop do menu
while true; do
    show_menu
    read -p "➤ Digite sua escolha: " opcao
    
    case $opcao in
        1)
            deploy_rapido
            read -p "Pressione ENTER para continuar..."
            clear
            ;;
        2)
            deploy_personalizado
            read -p "Pressione ENTER para continuar..."
            clear
            ;;
        3)
            ver_status
            read -p "Pressione ENTER para continuar..."
            clear
            ;;
        4)
            ver_historico
            read -p "Pressione ENTER para continuar..."
            clear
            ;;
        5)
            desfazer_commit
            read -p "Pressione ENTER para continuar..."
            clear
            ;;
        6)
            verificar_config
            read -p "Pressione ENTER para continuar..."
            clear
            ;;
        7)
            configurar_pages
            read -p "Pressione ENTER para continuar..."
            clear
            ;;
        0)
            echo ""
            echo "👋 Até logo!"
            echo ""
            exit 0
            ;;
        *)
            echo ""
            echo -e "${RED}❌ Opção inválida!${NC}"
            echo ""
            sleep 2
            clear
            ;;
    esac
done
