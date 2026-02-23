#!/usr/bin/env python3
"""
Gerador de dados atualizado para novas tabelas e tópicos MQTT
Compatível com events_raw, cattle_weights e environment_samples
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

# Host do Mosquitto (usar localhost porque a porta 1883 está exposta no host)
MQTT_HOST = 'localhost'
MQTT_PORT = 1883

# Tópicos usados pelo consumidor
MQTT_TOPICS = {
    "evento": "fazenda/sensores/evento",
    "peso": "fazenda/sensores/peso",
    "ambiente": "fazenda/sensores/ambiente"
}

def main():
    logger.info("🚀 Iniciando gerador de dados")
    logger.info(f"📡 Conectando ao MQTT: {MQTT_HOST}:{MQTT_PORT}")
    
    client = mqtt.Client(client_id="gerador_boi")
    
    try:
        client.connect(MQTT_HOST, MQTT_PORT, 60)
        logger.info("✅ Conectado ao MQTT com sucesso!")
    except Exception as e:
        logger.error(f"❌ Falha na conexão MQTT: {e}")
        return
    
    client.loop_start()
    
    contador = 0
    try:
        while True:
            # Decide aleatoriamente qual tipo de mensagem enviar
            tipo = random.choice(["evento", "peso", "ambiente"])
            
            if tipo == "evento":
                msg = {
                    "cattle_id": random.randint(1, 20),
                    "device_id": str(random.randint(1, 5)),   # dispositivo
                    "operator_id": random.randint(1, 3),     # operador
                    "site_id": 1,
                    "location_id": random.randint(1, 3),
                    "event_type": random.choice(["entrada_curral", "saida_curral", "vacinação"]),
                    "event_time": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
                    "obs": random.choice(["animal entrou", "animal saiu", "vacinação realizada"])
                }
            
            elif tipo == "peso":
                msg = {
                    "cattle_id": random.randint(1, 20),
                    "device_id": str(random.randint(1, 5)),
                    "operator_id": random.randint(1, 3),
                    "site_id": 1,
                    "location_id": 2,
                    "event_type": "pesagem",
                    "event_time": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
                    "peso_kg": round(random.uniform(200, 400), 1),
                    "obs": "Pesagem automática"
                }
            
            else:  # ambiente
                msg = {
                    "device_id": str(random.randint(1, 5)),
                    "operator_id": random.randint(1, 3),
                    "site_id": 1,
                    "location_id": 3,
                    "event_type": "amostra_ambiente",
                    "event_time": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
                    "temperatura": round(random.uniform(25, 32), 1),
                    "umidade": random.randint(50, 80),
                    "obs": "Coleta automática estação meteo"
                }
            
            # Publica no tópico correto
            client.publish(MQTT_TOPICS[tipo], json.dumps(msg), qos=1)
            contador += 1
            
            logger.info(f"📤 [{contador:04d}] Publicado em {tipo}: {msg}")
            
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

