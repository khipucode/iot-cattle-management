
# 🐄 Sistema de Contagem de Gado com YOLO na Raspberry Pi 3

Este projeto implementa um sistema de visão computacional em uma Raspberry Pi 3 para detectar e contar gado em tempo real usando uma câmera CSI (OV5647) e o modelo YOLOv4-tiny.

O sistema permite visualizar os resultados remotamente dentro da rede LAN através de um servidor web simples.

---

## 🚀 Funcionalidades

- 📷 Captura de vídeo usando câmera CSI (OV5647)
- 🧠 Detecção de animais com YOLOv4-tiny (OpenCV DNN)
- 🐄 Contagem de gado em tempo real
- 🌐 Visualização via navegador (LAN)
- ⚡ Sistema leve otimizado para Raspberry Pi 3
- 🔄 Atualização contínua da imagem (`last_frame.jpg`)

---

## 🧱 Arquitetura do Sistema

Camera (Raspberry Pi)
        ↓
Picamera2
        ↓
YOLOv4-tiny (OpenCV DNN)
        ↓
Processamento (contagem)
        ↓
last_frame.jpg
        ↓
Servidor HTTP (LAN)
        ↓
Navegador (PC / celular)

---

## 📁 Estrutura do Projeto

/home/pifive/yolo/

- yolov4-tiny.cfg
- yolov4-tiny.weights
- coco.names

- count_cattle_simple.py
- detect_livestock_debug.py

- last_frame.jpg
- test.jpg

---

## ⚙️ Instalação

### 1. Atualizar sistema

sudo apt update
sudo apt upgrade -y

### 2. Instalar dependências

sudo apt install -y python3-opencv python3-picamera2 python3-numpy

---

## ▶️ Como Usar

### 🔴 IMPORTANTE: liberar a câmera

Antes de rodar o YOLO, pare o sistema de câmera IP:

sudo systemctl stop mediamtx.service
pkill -f libcamera
sleep 2

---

### 🧠 Executar detecção

cd /home/pifive/yolo

Modo simples (contagem):
python3 count_cattle_simple.py

Modo debug:
python3 detect_livestock_debug.py

---

### 🌐 Visualizar na rede (LAN)

cd /home/pifive/yolo
python3 -m http.server 8080

No navegador:

http://IP_DA_RASPBERRY:8080

---

## 📊 Saída do Sistema

- Imagem atualizada:
last_frame.jpg

- Console:
Cows detected: X

- Visual:
- Caixas nos animais
- Número total detectado

---

## ⚠️ Limitações Atuais

O sistema está funcionando, porém há um problema de classificação:

👉 As vacas estão sendo reconhecidas como:
- horse (cavalo)
- sheep (ovelha)

Isso acontece porque o modelo YOLOv4-tiny foi treinado com o dataset COCO (genérico), e não com imagens específicas do seu ambiente.

---

## 🧠 Diagnóstico

O sistema está correto em:

- Captura de imagem ✅
- Inferência YOLO ✅
- Processamento ✅
- Visualização na rede ✅

O problema está na precisão do modelo para o cenário real.

---

## 🔧 Possíveis Melhorias

### 1. Ajuste de parâmetros

- Reduzir CONF_THRES
- Aumentar INPUT_SIZE

### 2. Treinar modelo próprio (RECOMENDADO)

- Coletar imagens reais do seu gado
- Anotar apenas "cow"
- Treinar YOLO customizado
- Exportar modelo para Raspberry

### 3. Usar modelo mais avançado

- YOLOv5 / YOLOv8
- Inferência fora da Pi (Jetson, PC, servidor)

---

## 🚀 Próximos Passos

- 📡 Integração com MQTT
- 📊 Dashboard (Grafana)
- 🎯 Tracking de animais
- 📈 Contagem por área (curral)
- 🤖 Análise de comportamento

---

## 🧪 Debug

Rodar:

python3 detect_livestock_debug.py

Mostra:

- Classe detectada
- Confiança
- Contagem por tipo

---

## 👨‍💻 Autor

Projeto desenvolvido para aplicações de IoT + Visão Computacional para monitoramento de gado.

---

## 📌 Observações

- Raspberry Pi 3: ~1–3 FPS
- Usar modelos leves (Tiny)
- Para produção: usar hardware acelerado (Jetson, Coral)

---

## 📄 Licença

Uso acadêmico / experimental
