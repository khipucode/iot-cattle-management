# 🐄 Sistema de Contagem de Gado com YOLO na Raspberry Pi 3

Projeto de visão computacional para detecção e contagem de gado usando YOLOv4-tiny.

## Uso rápido

1. Parar câmera IP:
sudo systemctl stop mediamtx.service
pkill -f libcamera

2. Rodar YOLO:
python3 count_cattle_simple.py

3. Visualizar:
python3 -m http.server 8080
http://IP_DA_RASPBERRY:8080
