# Pi Camera Stream — MediaMTX Setup

Configuração de streaming da Pi Camera Module via **MediaMTX** em uma Raspberry Pi com kernel `armv7l`.

---

## Hardware / Software

| Item | Detalhe |
|------|---------|
| Dispositivo | Raspberry Pi (armv7l, kernel 6.1.21-v7+) |
| IP | `192.168.51.59` |
| Usuário | `pifive` |
| Câmera | Pi Camera Module (interface CSI via `unicam`) |
| Servidor | MediaMTX v1.9.3 |

---

## O que foi instalado

| Componente | Localização |
|------------|-------------|
| Binário mediamtx | `/home/pifive/mediamtx` |
| Config mediamtx | `/home/pifive/mediamtx.yml` |
| Script de captura | `/home/pifive/start_cam.sh` |
| Serviço systemd | `/etc/systemd/system/mediamtx.service` |

---

## Como funciona

```
Pi Camera (CSI)
      │
 libcamera-vid   ← captura H264 nativo do sensor
      │ pipe
    ffmpeg        ← encaminha para RTSP local
      │
  MediaMTX        ← serve em múltiplos protocolos
      │
  ┌───┴──────────────────┐
  │                      │
RTSP :8554          WebRTC :8889
(VLC, YOLO, ffmpeg)  (navegador)
                     HLS :8888
```

---

## URLs de acesso

| Protocolo | URL | Uso |
|-----------|-----|-----|
| RTSP | `rtsp://192.168.51.59:8554/cam` | VLC, YOLO, OpenCV, ffmpeg |
| WebRTC | `http://192.168.51.59:8889/cam` | Navegador (baixa latência) |
| HLS | `http://192.168.51.59:8888/cam` | Navegador (alta compatibilidade, +latência) |

---

## Usar com YOLO (computador local)

### Ultralytics YOLOv8

```bash
pip install ultralytics
```

```python
from ultralytics import YOLO

model = YOLO('yolov8n.pt')
model.predict('rtsp://192.168.51.59:8554/cam', show=True, stream=True)
```

### OpenCV puro

```python
import cv2

cap = cv2.VideoCapture('rtsp://192.168.51.59:8554/cam')
cap.set(cv2.CAP_PROP_BUFFERSIZE, 1)  # reduz latência

while True:
    ret, frame = cap.read()
    if not ret:
        break
    cv2.imshow('Pi Camera', frame)
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

cap.release()
cv2.destroyAllWindows()
```

### OpenCV + YOLO manual

```python
import cv2
from ultralytics import YOLO

model = YOLO('yolov8n.pt')
cap = cv2.VideoCapture('rtsp://192.168.51.59:8554/cam')

while True:
    ret, frame = cap.read()
    if not ret:
        break
    results = model(frame)
    annotated = results[0].plot()
    cv2.imshow('YOLO - Pi Camera', annotated)
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

cap.release()
cv2.destroyAllWindows()
```

---

## Gerenciar o serviço

```bash
# Status
sudo systemctl status mediamtx

# Parar
sudo systemctl stop mediamtx

# Iniciar
sudo systemctl start mediamtx

# Reiniciar
sudo systemctl restart mediamtx

# Ver logs ao vivo
sudo journalctl -u mediamtx -f

# Desabilitar autostart
sudo systemctl disable mediamtx
```

---

## Arquivos de configuração

### `/home/pifive/mediamtx.yml`

```yaml
logLevel: info
logDestinations: [stdout]

api: yes
apiAddress: :9997

rtsp: yes
rtspAddress: :8554

webrtc: yes
webrtcAddress: :8889

hls: yes
hlsAddress: :8888
hlsSegmentCount: 3
hlsSegmentDuration: 1s

paths:
  cam:
    runOnInit: /home/pifive/start_cam.sh
    runOnInitRestart: yes
```

### `/home/pifive/start_cam.sh`

```bash
#!/bin/bash
libcamera-vid -t 0 --width 640 --height 480 --framerate 15 --inline -o - | \
  ffmpeg -f h264 -i pipe:0 -c:v copy -f rtsp rtsp://localhost:8554/cam
```

---

## Ajustar resolução / framerate

Editar `/home/pifive/start_cam.sh` e alterar os parâmetros do `libcamera-vid`:

```bash
# Exemplo: 1280x720 a 30fps
libcamera-vid -t 0 --width 1280 --height 720 --framerate 30 --inline -o - | \
  ffmpeg -f h264 -i pipe:0 -c:v copy -f rtsp rtsp://localhost:8554/cam
```

Depois reiniciar:
```bash
sudo systemctl restart mediamtx
```

---

## Reinstalar do zero

```bash
ssh pifive@192.168.51.59

# Baixar MediaMTX para armv7
wget https://github.com/bluenviron/mediamtx/releases/download/v1.9.3/mediamtx_v1.9.3_linux_armv7.tar.gz -O mediamtx.tar.gz
tar -xzf mediamtx.tar.gz

# Recriar config e script (ver seção acima)
# Recriar serviço systemd (ver seção abaixo)
```

### Serviço systemd (`/etc/systemd/system/mediamtx.service`)

```ini
[Unit]
Description=MediaMTX RTSP Server
After=network.target

[Service]
Type=simple
User=pifive
WorkingDirectory=/home/pifive
ExecStart=/home/pifive/mediamtx /home/pifive/mediamtx.yml
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
```

```bash
sudo systemctl daemon-reload
sudo systemctl enable mediamtx
sudo systemctl start mediamtx
```
