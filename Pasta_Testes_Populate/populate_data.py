#!/usr/bin/env python3
import paho.mqtt.client as mqtt
import json
import random
import time
from datetime import datetime
from zoneinfo import ZoneInfo   # ← novo
import logging

# Configura logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

# Host do Mosquitto
MQTT_HOST = 'fazenda-mosquitto'
MQTT_PORT = 1883

# Tópicos usados pelo consumidor
MQTT_TOPICS = {
    "evento": "fazenda/sensores/evento",
    "peso": "fazenda/sensores/peso",
    "ambiente": "fazenda/sensores/ambiente"
}

# IDs válidos
CATTLE_IDS = list(range(1, 21))
DEVICE_IDS = ["1", "2", "3"]
OPERATOR_IDS = [1, 2, 3, 4]
SITE_IDS = [1, 2, 3]
LOCATION_IDS = [2, 3, 6]

# Timezone fixo
TZ = ZoneInfo("America/Sao_Paulo")

def main():
    logger.info("🚀 Iniciando gerador de dados")
    client = mqtt.Client(client_id="gerador_boi")
    client.connect(MQTT_HOST, MQTT_PORT, 60)
    client.loop_start()

    contador = 0
    try:
        while True:
            tipo = random.choice(["evento", "peso", "ambiente"])
            agora = datetime.now(TZ).strftime("%Y-%m-%d %H:%M:%S")

            if tipo == "evento":
                event_type = random.choice(["entrada_curral", "saida_curral", "vacinação"])
                # Mapeia obs correto para cada tipo
                obs_map = {
                    "entrada_curral": "animal entrou",
                    "saida_curral": "animal saiu",
                    "vacinação": "vacinação realizada"
                }
                msg = {
                    "cattle_id": random.choice(CATTLE_IDS),
                    "device_id": random.choice(DEVICE_IDS),
                    "operator_id": random.choice(OPERATOR_IDS),
                    "site_id": random.choice(SITE_IDS),
                    "location_id": random.choice(LOCATION_IDS),
                    "event_type": event_type,
                    "event_time": agora,
                    "other_data": {"obs": obs_map[event_type]}
                }

            elif tipo == "peso":
                msg = {
                    "cattle_id": random.choice(CATTLE_IDS),
                    "weight_date": agora,
                    "weight": round(random.uniform(200, 450), 1),
                    "location_id": random.choice(LOCATION_IDS),
                    "notes": random.choice(["Pesagem automática", "Pesagem manual", "Pesagem de rotina"])
                }

            else:  # ambiente
                msg = {
                    "site_id": random.choice(SITE_IDS),
                    "location_id": random.choice(LOCATION_IDS),
                    "sample_time": agora,
                    "temperature": round(random.uniform(25, 32), 1),
                    "humidity": random.randint(50, 80),
                    "other_data": {
                        "obs": random.choice([
                            "Coleta automática estação meteo",
                            "Sensor ambiente curral",
                            "Leitura diária"
                        ])
                    }
                }

            client.publish(MQTT_TOPICS[tipo], json.dumps(msg), qos=1)
            contador += 1
            logger.info(f"📤 [{contador:04d}] Publicado em {tipo}: {msg}")
            time.sleep(random.uniform(2, 8))

    except KeyboardInterrupt:
        logger.info("🛑 Parando gerador...")
    finally:
        client.loop_stop()
        client.disconnect()
        logger.info("✅ Gerador encerrado")

if __name__ == "__main__":
    main()

