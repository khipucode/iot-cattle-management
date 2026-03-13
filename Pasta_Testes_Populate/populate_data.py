#!/usr/bin/env python3
"""
Gerador de dados compatível com os schemas novos:
- events_raw
- cattle_weights
- environment_samples
Usa IDs reais de cattle, devices, operators, sites e locations
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

# Host do Mosquitto
MQTT_HOST = 'fazenda-mosquitto'   # nome do serviço definido no docker-compose
MQTT_PORT = 1883

# Tópicos usados pelo consumidor
MQTT_TOPICS = {
    "evento": "fazenda/sensores/evento",
    "peso": "fazenda/sensores/peso",
    "ambiente": "fazenda/sensores/ambiente"
}

# IDs válidos do banco
CATTLE_IDS = list(range(1, 21))  # 1 a 20
DEVICE_IDS = ["1", "2", "3"]     # conforme tabela devices
OPERATOR_IDS = [1, 2, 3, 4]      # conforme tabela operators
SITE_IDS = [1, 2, 3]             # conforme tabela sites
LOCATION_IDS = [2, 3, 6]         # conforme tabela locations

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
                    "cattle_id": random.choice(CATTLE_IDS),
                    "device_id": random.choice(DEVICE_IDS),
                    "operator_id": random.choice(OPERATOR_IDS),
                    "site_id": random.choice(SITE_IDS),
                    "location_id": random.choice(LOCATION_IDS),
                    "event_type": random.choice(["entrada_curral", "saida_curral", "vacinação"]),
                    "event_time": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
                    "other_data": {
                        "obs": random.choice(["animal entrou", "animal saiu", "vacinação realizada"])
                    }
                }
            
            elif tipo == "peso":
                msg = {
                    "cattle_id": random.choice(CATTLE_IDS),
                    "weight_date": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
                    "weight": round(random.uniform(200, 450), 1),
                    "location_id": random.choice(LOCATION_IDS),
                    "notes": random.choice(["Pesagem automática", "Pesagem manual", "Pesagem de rotina"])
                }
            
            else:  # ambiente
                msg = {
                    "site_id": random.choice(SITE_IDS),
                    "location_id": random.choice(LOCATION_IDS),
                    "sample_time": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
                    "temperature": round(random.uniform(25, 32), 1),
                    "humidity": random.randint(50, 80),
                    "other_data": {
                        "obs": random.choice(["Coleta automática estação meteo", "Sensor ambiente curral", "Leitura diária"])
                    }
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

