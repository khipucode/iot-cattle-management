# ⚙️ Hardware - Brinco do Boi

## 🔌 Componentes principais
- SoC (System-on-a-Chip) com Wi-Fi integrado  
- Leitor RFID RC522 (13,56 MHz)  
- Tags Mifare (brincos RFID)  
- Fonte 3,3V  
- Jumpers e conectores SPI  

## 📡 Conexões
| RC522 | SoC |
|--------|------|
| VCC | 3V3 |
| RST | GPIO 4 |
| GND | GND |
| MISO | GPIO 19 |
| MOSI | GPIO 23 |
| SCK | GPIO 18 |
| SDA | GPIO 5 |

## 💾 Firmware
Código-fonte em C disponível em `hardware/firmware/src/`.

O firmware realiza a leitura da tag e envia o UID via HTTP/MQTT para a API do sistema.
