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



## 🔴 IMPORTANTE: liberar la cámara

Antes de ejecutar YOLO, detener el sistema de cámara IP:
```
sudo systemctl stop mediamtx.service
pkill -f libcamera
sleep 2
```
🧠 Ejecutar detección
```
cd /home/pifive/yolo
python3 count_cattle_simple.py
```
o modo debug:
```
python3 detect_livestock_debug.py
```
## 🌐 Visualizar en red LAN

Iniciar servidor web:
```
cd /home/pifive/yolo
python3 -m http.server 8080
```
Desde el navegador:

http://192.168.51.59:8080
