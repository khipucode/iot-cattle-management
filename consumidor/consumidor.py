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
        print(f"Recebido: {data}")  # Debug

        # Tenta diferentes formatos de campos
        # Formato 1: campos novos do gerador
        bovino_id = data.get("bovino_id") or data.get("id")
        tipo_evento = data.get("tipo_evento") or data.get("evento")
        
        # Formato 2: campo antigo (se ainda usar)
        if not bovino_id or not tipo_evento:
            print("Mensagem inválida - campos obrigatórios faltando:", data)
            return

        # Cria observação a partir dos campos extras
        obs_parts = []
        if data.get("local"):
            obs_parts.append(f"Local: {data['local']}")
        if data.get("temperatura"):
            obs_parts.append(f"Temp: {data['temperatura']}°C")
        if data.get("peso_kg"):
            obs_parts.append(f"Peso: {data['peso_kg']}kg")
        
        obs = data.get("obs", ", ".join(obs_parts)) if obs_parts else "sem observação"

        # Usa data_evento do JSON ou NOW() se não tiver
        data_evento = data.get("data_evento")
        
        sql = """
            INSERT INTO eventos (bovino_id, tipo_evento, data_evento, observacao, payload_json)
            VALUES (%s, %s, %s, %s, %s)
        """
        
        if data_evento:
            valores = (bovino_id, tipo_evento, data_evento, obs, json.dumps(data))
        else:
            valores = (bovino_id, tipo_evento, "NOW()", obs, json.dumps(data))
        
        ensure_connection()
        cursor.execute(sql, valores)
        print(f"✅ Evento inserido: Boi {bovino_id} - {tipo_evento}")

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
    # roda o loop MQTT em thread separada
    t = threading.Thread(target=mqtt_loop, daemon=True)
    t.start()

    # inicia servidor Flask para healthcheck
    app.run(host="0.0.0.0", port=8000)

