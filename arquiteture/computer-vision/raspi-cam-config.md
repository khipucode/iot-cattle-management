# 📷 Raspberry Pi 3 — Guia RÁPIDO e COMPLETO para usar Câmera CSI como Câmera IP (Navegador)

Este guia é otimizado para você repetir rapidamente em **outro Raspberry Pi 3 com Raspberry Pi OS**.

Tempo médio: **10–15 minutos**

---

# 🎯 VISÃO GERAL (o que vamos fazer)

1. Conectar câmera CSI
2. Atualizar sistema
3. Testar câmera
4. Instalar mjpg-streamer
5. Criar stream contínuo
6. Acessar no navegador

---

# ✅ 1. Conectar a câmera corretamente

✔️ Raspberry DESLIGADO
✔️ Usar conector **CSI (perto do HDMI)**
✔️ Levantar a trava preta
✔️ Inserir o cabo flat até o fim

👉 Regra prática no Raspberry Pi 3:

> Parte metálica do cabo → lado do HDMI

✔️ Fechar a trava
✔️ Ligar o Raspberry

---

# ✅ 2. Entrar no Raspberry

Via terminal ou SSH.

Login padrão:

```
user: pi
senha: raspberry
```

(ou o usuário que você criou)

---

# ✅ 3. Atualizar o sistema (IMPORTANTE)

```bash
sudo apt update
sudo apt upgrade -y
sudo reboot
```

---

# ✅ 4. Testar rapidamente a câmera

### Listar câmera

```bash
libcamera-hello --list-cameras
```

Se aparecer algo como:

```
ov5647
imx219
```

👉 câmera OK

### Abrir preview contínuo

```bash
libcamera-hello -t 0
```

CTRL+C para sair.

### Testar foto

```bash
libcamera-still -o teste.jpg
ls -lh teste.jpg
```

Se criou arquivo → OK.

---

# ⚠️ Se aparecer erro "camera busy"

```bash
pkill -f libcamera
```

---

# ✅ 5. Instalar servidor de câmera IP

```bash
sudo apt install -y cmake git libjpeg-dev build-essential
git clone https://github.com/jacksonliam/mjpg-streamer.git
cd mjpg-streamer/mjpg-streamer-experimental
make
```

A compilação demora.

---

# ✅ 6. Preparar pasta de streaming

```bash
mkdir -p /tmp/stream
rm -f /tmp/stream/*
```

---

# ✅ 7. Iniciar câmera IP (COMANDO PRINCIPAL)

⚠️ ESTE É O COMANDO MAIS IMPORTANTE DO GUIA

```bash
cd ~/mjpg-streamer/mjpg-streamer-experimental
./mjpg_streamer -i "input_file.so -f /tmp/stream -n pic.jpg" -o "output_http.so -w ./www -p 8080" &
libcamera-still -t 0 --timelapse 1000 --nopreview --width 640 --height 480 -o /tmp/stream/pic.jpg
```

✔️ O terminal ficará rodando continuamente
✔️ Isso é normal

---

# ✅ 8. Descobrir IP do Raspberry

```bash
hostname -I
```

Exemplo:

```
192.168.51.59
```

---

# ✅ 9. Abrir a câmera no navegador

No celular / PC da mesma rede:

```
http://IP_DO_RASPBERRY:8080
```

Exemplo real:

```
http://192.168.51.59:8080
```

---

# ✅ 10. Testes rápidos se não abrir

### Ver porta aberta

```bash
ss -ltnp | grep 8080
```

### Ver imagens sendo geradas

```bash
ls -lh /tmp/stream
```

### Testar no próprio Raspberry

```
http://localhost:8080
```

---

# ⚠️ Problemas MUITO comuns no Raspberry Pi 3

✔️ Fonte fraca
✔️ Cabo flat invertido
✔️ Câmera mal encaixada
✔️ CPU sobrecarregada
✔️ Sistema antigo
✔️ Processo travando câmera

Liberar câmera:

```bash
pkill -f libcamera
```

---

# 🚀 Versão MAIS LEVE (recomendado para Pi 3)

Se travar use:

```bash
libcamera-still -t 0 --timelapse 1500 --nopreview --width 320 --height 240 -o /tmp/stream/pic.jpg
```

---

# ⭐ Para repetir rapidamente em outro Raspberry

Checklist rápido:

✔️ conectar câmera
✔️ atualizar sistema
✔️ testar `libcamera-hello`
✔️ instalar mjpg-streamer
✔️ criar `/tmp/stream`
✔️ rodar comando principal
✔️ descobrir IP
✔️ abrir no navegador

Tempo total: **≈ 10 minutos**

---

# 🎉 Resultado final

O Raspberry Pi funciona como:

✅ câmera IP
✅ acesso pelo navegador
✅ sem VLC
✅ sem software pesado
✅ ideal para segurança / monitoramento

