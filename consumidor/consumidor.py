import os
import json
import time
import paho.mqtt.client as mqtt
import mysql.connector

# Configurações do banco
DB_HOST = os.getenv("DB_HOST", "fazenda-db")
DB_USER = os.getenv("DB_USER", "fazendeiro")
DB_PASS = os.getenv("DB_PASSWORD", "senhaFazenda")
DB_NAME = os.getenv("DB_NAME", "bovinos")

# Configurações do broker MQTT
MQTT_HOST = os.getenv("MQTT_HOST", "fazenda-mosquitto")
MQTT_PORT = int(os.getenv("MQTT_PORT", "1883"))
MQTT_TOPIC = os.getenv("MQTT_TOPIC", "fazenda/sensores/#")

# Conexão com o banco
def connect_db():
    while True:
        try:
            conn = mysql.connector.connect(
                host=DB_HOST,
                user=DB_USER,
                password=DB_PASS,
                database=DB_NAME
            )
            conn.autocommit = True
            return conn
        except Exception as e:
            print("Aguardando MariaDB...", e)
            time.sleep(2)

conn = connect_db()
cursor = conn.cursor()

# Callback quando conecta ao broker
def on_connect(client, userdata, flags, rc):
    print("Conectado ao broker MQTT com código:", rc)
    client.subscribe(MQTT_TOPIC)
    print("Assinado tópico:", MQTT_TOPIC)

# Callback quando recebe mensagem
def on_message(client, userdata, msg):
    payload_str = msg.payload.decode("utf-8", errors="ignore")
    try:
        data = json.loads(payload_str)

        # garante valor padrão para observação
        obs = data.get("obs", "sem observação")

        sql = """
            INSERT INTO eventos (bovino_id, tipo_evento, data_evento, observacao, payload_json)
            VALUES (%s, %s, NOW(), %s, %s)
        """
        valores = (
            data.get("id"),       # id do bovino
            data.get("evento"),   # tipo de evento
            obs,                  # observação (ou "sem observação")
            json.dumps(data)      # payload bruto
        )

        cursor.execute(sql, valores)
        print("Evento inserido:", valores)

    except Exception as e:
        print("Erro ao processar mensagem:", e)

# Função principal
def main():
    client = mqtt.Client()
    client.on_connect = on_connect
    client.on_message = on_message
    client.connect(MQTT_HOST, MQTT_PORT, 60)
    client.loop_forever()

if __name__ == "__main__":
    main()

