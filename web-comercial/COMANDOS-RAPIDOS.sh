#!/bin/bash

# ========================================
# 🚀 SCRIPT DE DEPLOY RÁPIDO - iTRACE
# ========================================
# 
# Como usar:
# 1. Torne executável: chmod +x COMANDOS-RAPIDOS.sh
# 2. Execute: ./COMANDOS-RAPIDOS.sh
#
# ========================================

echo "🐄 iTrace - Deploy Automático"
echo "================================"
echo ""

# Cores
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# 1. Verificar se está no diretório certo
echo -e "${YELLOW}📁 Verificando diretório...${NC}"
if [ ! -f "index.html" ]; then
    echo -e "${RED}❌ Erro: index.html não encontrado!${NC}"
    echo "Execute este script na raiz do projeto."
    exit 1
fi
echo -e "${GREEN}✓ Diretório correto!${NC}"
echo ""

# 2. Criar pasta public se não existir
echo -e "${YELLOW}📂 Criando pasta public...${NC}"
mkdir -p public
echo -e "${GREEN}✓ Pasta public OK!${NC}"
echo ""

# 3. Verificar se o vídeo existe
echo -e "${YELLOW}🎥 Verificando vídeo...${NC}"
VIDEO_SOURCE="/home/rayane/Downloads/Video boi"
VIDEO_DEST="public/video-boi.mp4"

if [ -f "$VIDEO_SOURCE" ]; then
    echo "Vídeo encontrado! Copiando..."
    cp "$VIDEO_SOURCE" "$VIDEO_DEST"
    
    # Ver tamanho
    SIZE=$(du -h "$VIDEO_DEST" | cut -f1)
    echo -e "${GREEN}✓ Vídeo copiado! Tamanho: $SIZE${NC}"
    
    # Avisar se for maior que 100M
    SIZE_MB=$(du -m "$VIDEO_DEST" | cut -f1)
    if [ $SIZE_MB -gt 100 ]; then
        echo -e "${RED}⚠️  ATENÇÃO: Vídeo > 100MB!${NC}"
        echo "GitHub não aceita arquivos > 100MB."
        echo "Considere usar Git LFS ou hospedar externamente."
        echo ""
        read -p "Continuar mesmo assim? (s/N) " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Ss]$ ]]; then
            exit 1
        fi
    fi
elif [ -f "$VIDEO_DEST" ]; then
    echo -e "${GREEN}✓ Vídeo já existe em public/!${NC}"
else
    echo -e "${YELLOW}⚠️  Vídeo não encontrado em: $VIDEO_SOURCE${NC}"
    echo "Você precisará copiar manualmente."
    echo ""
    read -p "Continuar sem o vídeo? (s/N) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Ss]$ ]]; then
        exit 1
    fi
fi
echo ""

# 4. Git status
echo -e "${YELLOW}📊 Status do Git:${NC}"
git status --short
echo ""

# 5. Adicionar arquivos
echo -e "${YELLOW}➕ Adicionando arquivos ao Git...${NC}"
git add .
echo -e "${GREEN}✓ Arquivos adicionados!${NC}"
echo ""

# 6. Commit
echo -e "${YELLOW}💾 Fazendo commit...${NC}"
read -p "Mensagem do commit (Enter para padrão): " COMMIT_MSG
if [ -z "$COMMIT_MSG" ]; then
    COMMIT_MSG="Atualização do site iTrace - $(date +'%d/%m/%Y %H:%M')"
fi
git commit -m "$COMMIT_MSG"
echo -e "${GREEN}✓ Commit realizado!${NC}"
echo ""

# 7. Push
echo -e "${YELLOW}🚀 Enviando para GitHub...${NC}"
BRANCH=$(git branch --show-current)
echo "Branch atual: $BRANCH"
echo ""

git push origin $BRANCH

if [ $? -eq 0 ]; then
    echo ""
    echo -e "${GREEN}✅ SUCESSO! Site atualizado no GitHub!${NC}"
    echo ""
    echo "================================"
    echo "📍 Próximos passos:"
    echo "================================"
    echo "1. Acesse seu repositório no GitHub"
    echo "2. Verifique se os arquivos foram enviados"
    echo "3. Configure GitHub Pages (Settings → Pages)"
    echo "4. Ou use Netlify/Vercel para deploy"
    echo ""
    echo "🌐 Seu site estará disponível em breve!"
    echo ""
else
    echo ""
    echo -e "${RED}❌ Erro ao enviar para GitHub!${NC}"
    echo "Verifique sua conexão e credenciais."
    echo ""
    exit 1
fi

# 8. Informações finais
echo "================================"
echo "📋 Resumo:"
echo "================================"
echo "✓ Vídeo: $([ -f "$VIDEO_DEST" ] && echo "OK" || echo "Não encontrado")"
echo "✓ Commit: $COMMIT_MSG"
echo "✓ Branch: $BRANCH"
echo "✓ Status: Enviado com sucesso!"
echo ""
echo "🎉 Deploy concluído!"
echo ""
