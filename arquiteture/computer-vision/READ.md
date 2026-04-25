# Explicação: `cattle_line_crossing_ipcam.py`

## Visão Geral

Script de **contagem de gado por cruzamento de linha virtual**, que:
1. Lê um vídeo (arquivo local, câmera IP ou webcam)
2. Detecta e rastreia bovinos quadro a quadro com YOLO
3. Detecta quando um animal cruza uma linha virtual configurável
4. Envia contagens em tempo real via porta serial para um microcontrolador (ex: Raspberry Pi Pico)
5. Exibe um HUD visual na tela com as métricas

---

## Ferramentas e Frameworks

| Ferramenta | Versão/Modelo | Por que é usada |
|---|---|---|
| **Ultralytics YOLO** | `yolo11n.pt` (YOLOv11 nano) | Detecção de objetos + rastreamento de IDs |
| **OpenCV (`cv2`)** | — | Captura de vídeo, renderização do HUD, exibição da janela |
| **pyserial** | — | Comunicação serial com microcontrolador externo |
| **Python stdlib** (`os`, `time`) | — | Caminhos de arquivo e delay de inicialização serial |

---

## Dataset / Modelo

- **Modelo:** `yolo11n.pt` — versão *nano* (mais leve e rápida) do YOLO v11 da Ultralytics
- **Dataset de treino do modelo:** **COCO** (Common Objects in Context) — 80 classes
- **Classe usada:** `COW_CLASS_ID = 19` → corresponde à classe `"cow"` no dataset COCO
- O modelo **não foi retreinado** para gado especificamente; usa o peso pré-treinado no COCO, que já inclui bovinos

---

## Fluxo de Código

```
Início
  │
  ├─ Carrega modelo YOLO (yolo11n.pt)
  │
  ├─ Abre fonte de vídeo (arquivo .mp4 / RTSP / HTTP / webcam)
  │    └─ Define resolução de captura (640×480 por padrão)
  │
  ├─ Calcula linha virtual (posição + inclinação configuráveis)
  │
  ├─ Abre porta serial (ou entra em modo simulação se indisponível)
  │
  └─ Loop principal (frame a frame)
        │
        ├─ cap.grab() + cap.retrieve()   ← descarta frames velhos, pega o mais recente
        │
        ├─ model.track(frame, classes=[19], persist=True)
        │    └─ Detecta bovinos e mantém IDs consistentes entre frames
        │
        ├─ Para cada boi detectado:
        │    ├─ Calcula centro do bounding box
        │    ├─ Determina lado da linha (produto vetorial)
        │    ├─ Compara com lado anterior → detecta cruzamento (mudança de sinal)
        │    └─ Desenha box, ID e ponto central na tela
        │
        ├─ Envia via serial (apenas quando valor muda):
        │    ├─ COUNT:<n>   → número de animais no frame
        │    └─ CROSS:<n>   → total acumulado de cruzamentos
        │
        └─ Renderiza HUD: Total | Lado A | Lado B | Cruzamentos
              └─ 'q' para sair
  │
  └─ Fim: envia FINAL_CROSS:<n>, fecha serial e janela
```

---

## Detalhes de Cada Componente

### 1. YOLO — Detecção e Rastreamento

```python
results = model.track(frame, classes=[COW_CLASS_ID], persist=True, verbose=False)
```

- `model.track()` combina detecção + rastreamento em uma chamada
- `persist=True` mantém o estado do rastreador entre frames (IDs estáveis)
- `classes=[19]` filtra apenas a classe *cow*, ignorando todo o resto
- Cada bounding box retorna `box.id` — um ID único e persistente por animal

**Por que YOLO e não outra solução?**  
YOLOv11 nano tem ótima relação velocidade/precisão para rodar em CPU ou GPU modesta. O método `.track()` embutido (baseado em ByteTrack/BoT-SORT) evita implementar um tracker separado.

---

### 2. Linha Virtual — Detecção de Cruzamento

```python
def lado_da_linha(px, py, x1, y1, x2, y2):
    return (x2 - x1) * (py - y1) - (y2 - y1) * (px - x1)
```

- Implementa o **produto vetorial 2D** entre o vetor da linha e o vetor até o ponto
- Retorna positivo (Lado A) ou negativo (Lado B)
- Um cruzamento é detectado quando o produto entre o lado atual e o anterior é **negativo** (`lado_ant * lado_atual < 0`), ou seja, o sinal trocou

**Parâmetros configuráveis:**
| Parâmetro | Padrão | Efeito |
|---|---|---|
| `LINE_POS_X` | `0.65` | Posição horizontal da linha (65% da largura) |
| `LINE_TILT_PX` | `45` | Inclinação em pixels (topo deslocado em relação ao fundo) |

---

### 3. OpenCV — Captura e Visualização

```python
cap = cv2.VideoCapture(VIDEO_SOURCE, cv2.CAP_FFMPEG)
cap.set(cv2.CAP_PROP_BUFFERSIZE, 1)
```

- `CAP_FFMPEG` habilita decodificação via FFmpeg, necessária para streams RTSP/HTTP
- `BUFFERSIZE = 1` minimiza latência — descarta frames antigos acumulados
- `cap.grab()` + `cap.retrieve()` é o padrão para pular frames e pegar sempre o mais recente
- `cv2.rectangle`, `cv2.putText`, `cv2.line` montam o HUD sobre o frame

**Fontes de vídeo suportadas (configurável via `VIDEO_SOURCE`):**
```python
VIDEO_SOURCE = "/caminho/arquivo.mp4"          # arquivo local
VIDEO_SOURCE = "rtsp://192.168.51.59:8554/cam" # câmera IP via RTSP
VIDEO_SOURCE = "http://192.168.5.105:81/stream"# câmera IP via HTTP
VIDEO_SOURCE = 0                                # webcam local
```

---

### 4. pyserial — Comunicação com Microcontrolador

```python
ser = serial.Serial(port, baud, timeout=1)
ser.write((payload + "\n").encode("utf-8"))
```

- Conecta a um microcontrolador (ex: Raspberry Pi Pico) via USB/serial
- Envia strings de texto terminadas em `\n`
- Protocolo simples:
  - `COUNT:<n>` — quantos animais estão visíveis no frame atual
  - `CROSS:<n>` — total acumulado de cruzamentos desde o início
  - `FINAL_CROSS:<n>` — enviado uma vez ao encerrar
- Se a porta não estiver disponível, entra automaticamente em **modo simulação** (imprime no terminal)

**Por que serial e não rede?**  
Comunicação serial USB é simples, confiável e de baixa latência para microcontroladores como o Pico, sem necessidade de configurar rede ou protocolos mais complexos.

---

### 5. Otimizações de Desempenho

| Técnica | Onde | Efeito |
|---|---|---|
| Resolução reduzida (640×480) | `CAPTURE_WIDTH/HEIGHT` | Menos pixels = YOLO mais rápido |
| Buffer de 1 frame | `CAP_PROP_BUFFERSIZE` | Sem acúmulo de frames atrasados |
| `cap.grab()` antes de `retrieve()` | Loop principal | Descarta frames velhos, latência mínima |
| `verbose=False` no YOLO | `model.track()` | Sem logs por frame no terminal |
| RTSP forçado a TCP | `OPENCV_FFMPEG_CAPTURE_OPTIONS` | Evita perda de pacotes UDP |
| Serial só quando valor muda | `last_sent_count/cross` | Evita flood na serial |

---

## Diagrama de Componentes

```
┌─────────────────┐     frames      ┌──────────────┐
│  Fonte de Vídeo │ ──────────────► │   OpenCV     │
│ (MP4/RTSP/HTTP/ │                 │   (captura)  │
│   webcam)       │                 └──────┬───────┘
└─────────────────┘                        │ frame
                                           ▼
                                   ┌──────────────┐
                                   │  YOLO v11n   │
                                   │  .track()    │
                                   │  class=cow   │
                                   └──────┬───────┘
                                          │ boxes + IDs
                                          ▼
                                   ┌──────────────┐
                                   │   Lógica de  │
                                   │   Cruzamento │
                                   │ (prod. vet.) │
                                   └──┬───────┬───┘
                                      │       │
                          métricas    │       │  frame anotado
                                      ▼       ▼
                              ┌──────────┐ ┌──────────────┐
                              │ pyserial │ │   OpenCV     │
                              │ →Pico    │ │   (janela)   │
                              └──────────┘ └──────────────┘
```

---

## Configurações Principais (resumo)

```python
MODEL_PATH     = "../yolo11n.pt"          # modelo YOLO
COW_CLASS_ID   = 19                       # classe "cow" no COCO
VIDEO_SOURCE   = "arquivo.mp4"            # fonte de vídeo
CAPTURE_WIDTH  = 640                      # resolução de captura
CAPTURE_HEIGHT = 480
LINE_POS_X     = 0.65                     # posição horizontal da linha (0–1)
LINE_TILT_PX   = 45                       # inclinação da linha em pixels
SERIAL_PORT    = "/dev/ttyACM0"           # porta do microcontrolador
BAUD_RATE      = 115200                   # velocidade serial
SHOW_WINDOW    = True                     # exibir janela de visualização
