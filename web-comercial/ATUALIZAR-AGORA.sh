#!/bin/bash

# 🚀 Script Automático para Atualizar o iTrace no GitHub
# Execute: bash ATUALIZAR-AGORA.sh

echo "╔═══════════════════════════════════════════════════════╗"
echo "║     🐄 iTrace - Atualizar no GitHub                 ║"
echo "╚═══════════════════════════════════════════════════════╝"
echo ""

# 1. Verificar se está em um repositório Git
echo "📋 Verificando repositório Git..."
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "❌ ERRO: Esta pasta não é um repositório Git!"
    echo "💡 Execute primeiro: git init"
    exit 1
fi

# 2. Ver status
echo ""
echo "📊 Status atual do repositório:"
git status --short
echo ""

# 3. Perguntar ao usuário
read -p "✅ Adicionar TODOS os arquivos? (s/n): " resposta
if [[ ! "$resposta" =~ ^[Ss]$ ]]; then
    echo "❌ Operação cancelada!"
    exit 0
fi

# 4. Adicionar arquivos
echo ""
echo "➕ Adicionando arquivos..."
git add .

# 5. Mostrar o que foi adicionado
echo ""
echo "📦 Arquivos que serão enviados:"
git status --short
echo ""

# 6. Perguntar mensagem do commit
echo "💬 Escolha a mensagem do commit:"
echo "  1) Converter projeto para HTML/CSS/JS puro + adicionar vídeo"
echo "  2) Atualização completa do iTrace"
echo "  3) Adicionar vídeo demonstrativo"
echo "  4) Personalizada"
echo ""
read -p "Opção (1-4): " opcao

case $opcao in
    1)
        mensagem="Converter projeto para HTML/CSS/JS puro + adicionar vídeo demonstrativo"
        ;;
    2)
        mensagem="Atualização completa do iTrace - Site institucional"
        ;;
    3)
        mensagem="Adicionar vídeo demonstrativo de bovinos"
        ;;
    4)
        read -p "Digite sua mensagem: " mensagem
        ;;
    *)
        mensagem="Atualização do iTrace"
        ;;
esac

# 7. Fazer commit
echo ""
echo "💾 Fazendo commit..."
git commit -m "$mensagem"

if [ $? -ne 0 ]; then
    echo "❌ Erro ao fazer commit!"
    echo "💡 Verifique se há arquivos para commitar"
    exit 1
fi

# 8. Detectar branch
branch=$(git branch --show-current)
echo ""
echo "🌿 Branch atual: $branch"

# 9. Perguntar antes de fazer push
echo ""
read -p "🚀 Enviar para o GitHub? (s/n): " enviar
if [[ ! "$enviar" =~ ^[Ss]$ ]]; then
    echo "⏸️  Commit feito, mas não enviado!"
    echo "💡 Para enviar depois: git push origin $branch"
    exit 0
fi

# 10. Fazer push
echo ""
echo "📤 Enviando para GitHub..."
git push origin $branch

if [ $? -eq 0 ]; then
    echo ""
    echo "╔═══════════════════════════════════════════════════════╗"
    echo "║     ✅ SUCESSO! Projeto atualizado no GitHub!       ║"
    echo "╚═══════════════════════════════════════════════════════╝"
    echo ""
    echo "🌐 Acesse seu repositório no GitHub para verificar!"
    echo ""
else
    echo ""
    echo "❌ Erro ao enviar para o GitHub!"
    echo ""
    echo "💡 Possíveis soluções:"
    echo "   1. Verifique sua conexão com internet"
    echo "   2. Configure suas credenciais: git config --global user.email \"seu@email.com\""
    echo "   3. Verifique se o remote está configurado: git remote -v"
    echo ""
    exit 1
fi
