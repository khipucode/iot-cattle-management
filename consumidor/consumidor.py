import os
import json
import time
import threading
import paho.mqtt.client as mqtt
import mysql.connector
from flask import Flask

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
            print("Conectado ao MariaDB")
            return conn
        except Exception as e:
            print("Aguardando MariaDB...", e)
            time.sleep(2)

conn = connect_db()
cursor = conn.cursor()

def ensure_connection():
    global conn, cursor
    try:
        conn.ping(reconnect=True, attempts=3, delay=2)
    except:
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
        print(f"Recebido: {data}")

        # Conversão explícita
        event_time  = data.get("event_time") or time.strftime("%Y-%m-%d %H:%M:%S")
        cattle_id   = int(data.get("cattle_id")) if data.get("cattle_id") is not None else None
        device_id   = str(data.get("device_id")) if data.get("device_id") is not None else None
        operator_id = int(data.get("operator_id")) if data.get("operator_id") is not None else None
        site_id     = int(data.get("site_id")) if data.get("site_id") is not None else None
        location_id = int(data.get("location_id")) if data.get("location_id") is not None else None
        event_type  = str(data.get("event_type", "other"))

        # Inserir na tabela events_raw
        sql_event = """
            INSERT INTO events_raw (event_time, cattle_id, device_id, operator_id, site_id, location_id, event_type, event_data)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
        """
        valores_event = (
            event_time,
            cattle_id,
            device_id,
            operator_id,
            site_id,
            location_id,
            event_type,
            json.dumps(data)
        )
        ensure_connection()
        cursor.execute(sql_event, valores_event)
        print(f"✅ Evento inserido em events_raw: Boi {cattle_id} - {event_type}")

        # Inserir na tabela cattle_weights (novo schema)
        if "weight" in data:
            sql_weight = """
                INSERT INTO cattle_weights (cattle_id, weight_date, weight, location_id, notes)
                VALUES (%s, %s, %s, %s, %s)
            """
            valores_weight = (
                cattle_id,
                data.get("weight_date", event_time),
                float(data["weight"]),
                location_id,
                data.get("notes", "")
            )
            cursor.execute(sql_weight, valores_weight)
            print(f"✅ Peso inserido em cattle_weights: Boi {cattle_id} - {data['weight']}kg")

        # Inserir na tabela environment_samples (novo schema)
        if "temperature" in data or "humidity" in data:
            sql_env = """
                INSERT INTO environment_samples (site_id, location_id, sample_time, temperature, humidity, other_data)
                VALUES (%s, %s, %s, %s, %s, %s)
            """
            valores_env = (
                site_id,
                location_id,
                data.get("sample_time", event_time),
                float(data.get("temperature")) if data.get("temperature") is not None else None,
                float(data.get("humidity")) if data.get("humidity") is not None else None,
                json.dumps(data.get("other_data", {}))
            )
            cursor.execute(sql_env, valores_env)
            print(f"✅ Amostra ambiental inserida em environment_samples")

    except Exception as e:
        print(f"❌ Erro ao processar mensagem: {e}")
        print(f"Dados: {data if 'data' in locals() else 'n/a'}")

# Função principal do consumidor
def mqtt_loop():
    client = mqtt.Client()
    client.on_connect = on_connect
    client.on_message = on_message
    client.connect(MQTT_HOST, MQTT_PORT, 60)
    client.loop_forever()

# Flask app para healthcheck
app = Flask(__name__)

@app.route("/health")
def health():
    try:
        ensure_connection()
        return "ok", 200
    except Exception as e:
        return f"erro: {e}", 500

if __name__ == "__main__":
    t = threading.Thread(target=mqtt_loop, daemon=True)
    t.start()
    app.run(host="0.0.0.0", port=8000)

