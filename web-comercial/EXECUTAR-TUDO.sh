#!/bin/bash

# 🎯 Script Mestre - Executa todas as verificações e atualizações
# Execute: bash EXECUTAR-TUDO.sh

clear

echo "╔═══════════════════════════════════════════════════════════════════╗"
echo "║                                                                   ║"
echo "║     🐄 iTrace - Script Mestre de Verificação e Atualização      ║"
echo "║                                                                   ║"
echo "╚═══════════════════════════════════════════════════════════════════╝"
echo ""

# Cores
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Função de verificação
check() {
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✅ OK${NC}"
    else
        echo -e "${RED}❌ ERRO${NC}"
        return 1
    fi
}

# 1. Verificar se está em um repositório Git
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "1️⃣  Verificando Repositório Git..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo -e "${GREEN}✅ Repositório Git encontrado!${NC}"
else
    echo -e "${RED}❌ Esta pasta não é um repositório Git!${NC}"
    echo ""
    echo "💡 Execute primeiro: git init"
    exit 1
fi
echo ""

# 2. Verificar arquivos principais
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "2️⃣  Verificando Arquivos Principais..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

arquivos=("index.html" "styles.css" "script.js")
todos_ok=true

for arquivo in "${arquivos[@]}"; do
    echo -n "   $arquivo ... "
    if [ -f "$arquivo" ]; then
        echo -e "${GREEN}✅${NC}"
    else
        echo -e "${RED}❌ NÃO ENCONTRADO${NC}"
        todos_ok=false
    fi
done

if [ "$todos_ok" = false ]; then
    echo ""
    echo -e "${RED}⚠️  Alguns arquivos estão faltando!${NC}"
    exit 1
fi
echo ""

# 3. Verificar pasta public e vídeo
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "3️⃣  Verificando Vídeo..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

if [ ! -d "public" ]; then
    echo -e "${YELLOW}⚠️  Pasta 'public/' não existe!${NC}"
    echo ""
    read -p "Criar pasta public agora? (s/n): " criar
    if [[ "$criar" =~ ^[Ss]$ ]]; then
        mkdir public
        echo -e "${GREEN}✅ Pasta criada!${NC}"
    fi
    echo ""
fi

if [ -f "public/video-boi.mp4" ]; then
    echo -e "${GREEN}✅ Vídeo encontrado!${NC}"
    
    # Verificar tamanho
    tamanho=$(stat -f%z "public/video-boi.mp4" 2>/dev/null || stat -c%s "public/video-boi.mp4" 2>/dev/null)
    tamanho_mb=$(echo "scale=2; $tamanho / 1048576" | bc 2>/dev/null || echo "?")
    
    echo "   📏 Tamanho: ${tamanho_mb} MB"
    
    if [ "$tamanho_mb" != "?" ]; then
        if (( $(echo "$tamanho_mb > 100" | bc -l) )); then
            echo -e "${RED}⚠️  ATENÇÃO: Vídeo maior que 100 MB!${NC}"
            echo "   GitHub não aceita arquivos >100MB"
            echo ""
            echo "   Soluções:"
            echo "   1. bash VERIFICAR-TAMANHO-VIDEO.sh"
            echo "   2. Comprimir o vídeo"
            echo "   3. Usar Git LFS"
            echo ""
        else
            echo -e "${GREEN}✅ Tamanho OK para GitHub!${NC}"
        fi
    fi
else
    echo -e "${YELLOW}⚠️  Vídeo não encontrado em public/video-boi.mp4${NC}"
    echo ""
    echo "💡 Para adicionar o vídeo:"
    echo "   mkdir public"
    echo "   cp \"/home/rayane/Downloads/Video boi\" public/video-boi.mp4"
fi
echo ""

# 4. Verificar configuração Git
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "4️⃣  Verificando Configuração Git..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

user_name=$(git config user.name)
user_email=$(git config user.email)

if [ -z "$user_name" ] || [ -z "$user_email" ]; then
    echo -e "${YELLOW}⚠️  Git não configurado!${NC}"
    echo ""
    read -p "Configurar agora? (s/n): " config
    if [[ "$config" =~ ^[Ss]$ ]]; then
        read -p "Digite seu nome: " nome
        read -p "Digite seu email: " email
        git config --global user.name "$nome"
        git config --global user.email "$email"
        echo -e "${GREEN}✅ Configurado!${NC}"
    fi
else
    echo -e "${GREEN}✅ Git configurado${NC}"
    echo "   👤 Nome: $user_name"
    echo "   📧 Email: $user_email"
fi
echo ""

# 5. Ver status do Git
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "5️⃣  Status do Repositório..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

git status --short
echo ""

# 6. Perguntar se quer atualizar no GitHub
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "6️⃣  Atualizar no GitHub?"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

read -p "Deseja fazer commit e push agora? (s/n): " atualizar

if [[ "$atualizar" =~ ^[Ss]$ ]]; then
    echo ""
    echo "🚀 Executando ATUALIZAR-AGORA.sh..."
    echo ""
    
    if [ -f "ATUALIZAR-AGORA.sh" ]; then
        bash ATUALIZAR-AGORA.sh
    else
        echo -e "${YELLOW}Script ATUALIZAR-AGORA.sh não encontrado!${NC}"
        echo "Executando manualmente..."
        echo ""
        
        git add .
        git commit -m "Atualização do iTrace - Site institucional"
        
        branch=$(git branch --show-current)
        git push origin $branch
    fi
else
    echo ""
    echo "⏸️  OK! Não vou fazer push agora."
    echo ""
    echo "💡 Para atualizar depois, execute:"
    echo "   bash ATUALIZAR-AGORA.sh"
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ VERIFICAÇÃO COMPLETA!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "📚 Próximos passos:"
echo "   1. Teste o site: firefox index.html"
echo "   2. Adicione o vídeo (se ainda não fez)"
echo "   3. Execute: bash ATUALIZAR-AGORA.sh"
echo "   4. Configure GitHub Pages (grátis!)"
echo ""
echo "🆘 Precisa de ajuda?"
echo "   - Leia: 🚀-COMECE-AQUI.md"
echo "   - Consulte: PASSO-A-PASSO-VISUAL.md"
echo "   - Use: COLA-GIT.md"
echo ""
echo "╔═══════════════════════════════════════════════════════════════════╗"
echo "║     💚 Projeto iTrace - Pronto para o Agronegócio!              ║"
echo "╚═══════════════════════════════════════════════════════════════════╝"
