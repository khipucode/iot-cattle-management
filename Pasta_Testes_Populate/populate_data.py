#!/usr/bin/env python3
"""
Gerador de dados FINAL - Usa IP fixo do Mosquitto
"""
import paho.mqtt.client as mqtt
import json
import random
import time
from datetime import datetime
import logging

# Configura logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

# IP DO MOSQUITTO (do comando docker inspect)
MQTT_HOST = '172.19.0.3'  # ← IP FIXO do container mosquitto
MQTT_PORT = 1883
MQTT_TOPIC = 'fazenda/sensores/evento'

def main():
    logger.info(f"🚀 Iniciando gerador de dados")
    logger.info(f"📡 Conectando ao MQTT: {MQTT_HOST}:{MQTT_PORT}")
    
    # Cria cliente MQTT
    client = mqtt.Client(client_id="gerador_boi", callback_api_version=mqtt.CallbackAPIVersion.VERSION2)
    
    try:
        client.connect(MQTT_HOST, MQTT_PORT, 60)
        logger.info("✅ Conectado ao MQTT com sucesso!")
    except Exception as e:
        logger.error(f"❌ Falha na conexão MQTT: {e}")
        return
    
    client.loop_start()
    
    # Eventos baseados no seu projeto
    eventos = [
        "bebeu agua", "foi ao pasto", "alimentou-se", 
        "entrou na ordenha", "saiu da ordenha", "pesagem",
        "vacinação", "detectado em cio", "temperatura alta"
    ]
    
    locais = ["bebedouro_norte", "cocho_principal", "sala_ordenha", "pastagem", "curral"]
    
    contador = 0
    try:
        while True:
            # Gera evento realista
            evento = {
                "bovino_id": random.randint(1, 20),
                "brinco": f"BR{random.randint(10000, 19999):05d}",
                "tipo_evento": random.choice(eventos),
                "data_evento": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
                "local": random.choice(locais),
                "temperatura": round(random.uniform(38.0, 39.5), 1) if random.random() > 0.7 else None,
                "peso_kg": round(random.uniform(200, 400), 1) if random.random() > 0.8 else None
            }
            
            # Publica no MQTT
            client.publish(MQTT_TOPIC, json.dumps(evento), qos=1)
            contador += 1
            
            logger.info(f"📤 [{contador:04d}] Boi {evento['bovino_id']} ({evento['brinco']}) - {evento['tipo_evento']} em {evento['local']}")
            
            # Intervalo aleatório entre 2-8 segundos
            time.sleep(random.uniform(2, 8))
            
    except KeyboardInterrupt:
        logger.info("🛑 Parando gerador...")
    except Exception as e:
        logger.error(f"💥 Erro: {e}")
    finally:
        client.loop_stop()
        client.disconnect()
        logger.info("✅ Gerador encerrado")

if __name__ == "__main__":
    main()
