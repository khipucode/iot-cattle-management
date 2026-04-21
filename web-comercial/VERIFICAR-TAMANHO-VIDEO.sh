#!/bin/bash

# 📹 Script para Verificar Tamanho do Vídeo
# Execute: bash VERIFICAR-TAMANHO-VIDEO.sh

echo "╔═══════════════════════════════════════════════════════╗"
echo "║     📹 Verificar Tamanho do Vídeo                   ║"
echo "╚═══════════════════════════════════════════════════════╝"
echo ""

# Verificar se o vídeo existe
if [ ! -f "https://drive.google.com/file/d/1oYHFi0IOXJJYyM9Q4WYgTeD8HTmJU56n/view?usp=drive_link" ]; then
    echo "❌ Vídeo não encontrado em: public/video-boi.mp4"
    echo ""
    echo "💡 Verifique se você criou a pasta public e copiou o vídeo:"
    echo "   mkdir public"
    echo "   cp \"/home/rayane/Downloads/Video boi\" public/video-boi.mp4"
    exit 1
fi

echo "✅ Vídeo encontrado!"
echo ""

# Pegar tamanho em bytes
tamanho_bytes=$(stat -f%z "public/video-boi.mp4" 2>/dev/null || stat -c%s "public/video-boi.mp4" 2>/dev/null)

# Pegar tamanho em formato legível
tamanho_humano=$(du -h "public/video-boi.mp4" | cut -f1)

# Calcular em MB
tamanho_mb=$(echo "scale=2; $tamanho_bytes / 1048576" | bc)

echo "📊 Informações do Vídeo:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📁 Arquivo: public/video-boi.mp4"
echo "📏 Tamanho: $tamanho_humano ($tamanho_mb MB)"
echo ""

# Verificar se passa do limite do GitHub
limite_mb=100

if (( $(echo "$tamanho_mb > $limite_mb" | bc -l) )); then
    echo "⚠️  ATENÇÃO: Vídeo MAIOR que 100 MB!"
    echo ""
    echo "❌ O GitHub NÃO aceita arquivos maiores que 100 MB!"
    echo ""
    echo "🔧 SOLUÇÕES:"
    echo ""
    echo "1️⃣  Usar Git LFS (Large File Storage):"
    echo "   sudo apt install git-lfs"
    echo "   git lfs install"
    echo "   git lfs track \"*.mp4\""
    echo "   git add .gitattributes"
    echo "   git add public/video-boi.mp4"
    echo "   git commit -m \"Adicionar vídeo com Git LFS\""
    echo "   git push origin main"
    echo ""
    echo "2️⃣  Comprimir o vídeo:"
    echo "   sudo apt install ffmpeg"
    echo "   ffmpeg -i public/video-boi.mp4 -vcodec h264 -crf 28 public/video-comprimido.mp4"
    echo "   mv public/video-comprimido.mp4 public/video-boi.mp4"
    echo ""
    echo "3️⃣  Hospedar em outro lugar:"
    echo "   - YouTube (não listado)"
    echo "   - Google Drive"
    echo "   - Vimeo"
    echo ""
else
    echo "✅ Vídeo dentro do limite do GitHub!"
    echo ""
    echo "🎉 Você pode fazer upload normalmente!"
    echo ""
    echo "📤 Para enviar para o GitHub:"
    echo "   git add public/video-boi.mp4"
    echo "   git commit -m \"Adicionar vídeo demonstrativo\""
    echo "   git push origin main"
    echo ""
fi

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Informações adicionais
if command -v ffprobe &> /dev/null; then
    echo "🎬 Detalhes Técnicos:"
    ffprobe -v quiet -print_format json -show_format -show_streams "public/video-boi.mp4" | grep -E "duration|width|height|codec_name" | head -6
    echo ""
fi
