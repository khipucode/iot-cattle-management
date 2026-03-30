// ============================================================================
//  mqtt/mqtt_client.c — Cliente MQTT mínimo via TCP raw (LwIP)
//  QoS 0, apenas PUBLISH. Sem dependência de lwip/apps/mqtt.h.
// ============================================================================

#include "mqtt_client.h"
#include "config.h"
#include "payload/payload.h"
#include "pico/stdlib.h"
#include "lwip/tcp.h"
#include "lwip/ip_addr.h"
#include <string.h>
#include <stdio.h>

static MqttStatus    s_status        = MQTT_IDLE;
static struct tcp_pcb *s_pcb         = NULL;
static uint32_t      s_retry_ms      = 0;
static uint32_t      s_last_send_ms  = 0;
static uint32_t      s_connect_ms    = 0;   // momento em que entrou em CONNECTING

#define RECONNECT_INTERVAL_MS  8000
#define CONNECT_TIMEOUT_MS     10000
#define PING_INTERVAL_MS       ((MQTT_KEEPALIVE_S * 1000) / 2)

// ── Codificador de comprimento variável MQTT ──────────────────────────────────
static int encode_remaining(uint8_t *buf, uint32_t len) {
    int i = 0;
    do {
        uint8_t b = len & 0x7F;
        len >>= 7;
        if (len > 0) b |= 0x80;
        buf[i++] = b;
    } while (len > 0 && i < 4);
    return i;
}

// ── Monta pacote CONNECT ──────────────────────────────────────────────────────
static int build_connect(uint8_t *buf, int buf_len) {
    const char *cid     = MQTT_CLIENT_ID;
    int         cid_len = strlen(cid);
    uint32_t    rem     = 10 + 2 + cid_len;   // var-header + clientid

    int pos = 0;
    buf[pos++] = 0x10;                          // CONNECT
    pos += encode_remaining(buf + pos, rem);

    // Protocol name "MQTT" (3.1.1)
    buf[pos++] = 0x00; buf[pos++] = 0x04;
    buf[pos++] = 'M'; buf[pos++] = 'Q';
    buf[pos++] = 'T'; buf[pos++] = 'T';

    buf[pos++] = 0x04;                          // version 4
    buf[pos++] = 0x02;                          // flags: clean session
    buf[pos++] = (MQTT_KEEPALIVE_S >> 8) & 0xFF;
    buf[pos++] =  MQTT_KEEPALIVE_S       & 0xFF;

    buf[pos++] = (cid_len >> 8) & 0xFF;
    buf[pos++] =  cid_len       & 0xFF;
    memcpy(buf + pos, cid, cid_len);
    pos += cid_len;

    return pos;
}

// ── Monta pacote PUBLISH QoS 0 ────────────────────────────────────────────────
static int build_publish(uint8_t *buf, int buf_len,
                         const char *topic, const char *payload) {
    int      tlen = strlen(topic);
    int      plen = strlen(payload);
    uint32_t rem  = 2 + tlen + plen;

    if ((int)rem + 5 > buf_len) return -1;

    int pos = 0;
    buf[pos++] = 0x30;                          // PUBLISH, QoS 0
    pos += encode_remaining(buf + pos, rem);

    buf[pos++] = (tlen >> 8) & 0xFF;
    buf[pos++] =  tlen       & 0xFF;
    memcpy(buf + pos, topic, tlen);
    pos += tlen;

    memcpy(buf + pos, payload, plen);
    pos += plen;

    return pos;
}

// ── Callbacks TCP ─────────────────────────────────────────────────────────────

static err_t on_recv(void *arg, struct tcp_pcb *tpcb,
                     struct pbuf *p, err_t err) {
    if (!p) {
        printf("[MQTT] Conexao encerrada pelo broker\n");
        s_status = MQTT_DISCONNECTED;
        s_retry_ms = to_ms_since_boot(get_absolute_time());
        s_pcb = NULL;
        return ERR_OK;
    }

    uint8_t *d = (uint8_t *)p->payload;

    // CONNACK: 0x20 0x02 0x00 0x00  (return code 0 = aceito)
    if (p->len >= 4 && d[0] == 0x20 && d[1] == 0x02 && d[3] == 0x00) {
        s_status       = MQTT_CONNECTED;
        s_last_send_ms = to_ms_since_boot(get_absolute_time());
        printf("[MQTT] CONNACK OK — broker conectado\n");
    } else if (p->len >= 4 && d[0] == 0x20 && d[3] != 0x00) {
        printf("[MQTT] CONNACK recusado: codigo %d\n", d[3]);
        s_status   = MQTT_ERROR;
        s_retry_ms = to_ms_since_boot(get_absolute_time());
    }
    // PINGRESP: 0xD0
    // Ignoramos silenciosamente

    tcp_recved(tpcb, p->tot_len);
    pbuf_free(p);
    return ERR_OK;
}

static err_t on_connected(void *arg, struct tcp_pcb *tpcb, err_t err) {
    if (err != ERR_OK) {
        printf("[MQTT] TCP connect falhou: %d\n", err);
        s_status = MQTT_DISCONNECTED;
        s_retry_ms = to_ms_since_boot(get_absolute_time());
        s_pcb = NULL;
        return err;
    }

    printf("[MQTT] TCP OK, enviando CONNECT...\n");
    uint8_t pkt[128];
    int len = build_connect(pkt, sizeof(pkt));

    err_t e = tcp_write(tpcb, pkt, len, TCP_WRITE_FLAG_COPY);
    if (e == ERR_OK) tcp_output(tpcb);
    return ERR_OK;
}

static void on_error(void *arg, err_t err) {
    printf("[MQTT] Erro TCP: %d\n", err);
    s_status = MQTT_DISCONNECTED;
    s_retry_ms = to_ms_since_boot(get_absolute_time());
    s_pcb = NULL;
}

// ── Conexão ───────────────────────────────────────────────────────────────────

static void do_connect(void) {
    if (s_pcb) {
        tcp_abort(s_pcb);
        s_pcb = NULL;
    }

    ip_addr_t ip;
    if (!ip4addr_aton(MQTT_BROKER_IP, &ip)) {
        printf("[MQTT] IP invalido: %s\n", MQTT_BROKER_IP);
        s_status = MQTT_ERROR;
        return;
    }

    s_pcb = tcp_new_ip_type(IPADDR_TYPE_V4);
    if (!s_pcb) {
        printf("[MQTT] tcp_new falhou\n");
        s_status = MQTT_ERROR;
        return;
    }

    tcp_recv(s_pcb, on_recv);
    tcp_err (s_pcb, on_error);

    s_status     = MQTT_CONNECTING;
    s_connect_ms = to_ms_since_boot(get_absolute_time());
    printf("[MQTT] Conectando a %s:%d\n", MQTT_BROKER_IP, MQTT_BROKER_PORT);

    err_t err = tcp_connect(s_pcb, &ip, MQTT_BROKER_PORT, on_connected);
    if (err != ERR_OK) {
        printf("[MQTT] tcp_connect erro: %d\n", err);
        s_status = MQTT_DISCONNECTED;
        s_retry_ms = to_ms_since_boot(get_absolute_time());
        s_pcb = NULL;
    }
}

// ── API pública ───────────────────────────────────────────────────────────────

void mqtt_client_start(void) {
    // Apenas reseta o timer para que mqtt_client_poll() conecte na próxima iteração
    s_status   = MQTT_IDLE;
    s_retry_ms = 0;
}

void mqtt_client_poll(void) {
    uint32_t now = to_ms_since_boot(get_absolute_time());

    switch (s_status) {

    case MQTT_IDLE:
    case MQTT_DISCONNECTED:
        if (now - s_retry_ms >= RECONNECT_INTERVAL_MS) {
            printf("[MQTT] Conectando...\n");
            do_connect();
        }
        break;

    case MQTT_CONNECTING:
        // Aborta se o broker não responder dentro do timeout
        if (now - s_connect_ms >= CONNECT_TIMEOUT_MS) {
            printf("[MQTT] Timeout de conexao — retentando\n");
            if (s_pcb) { tcp_abort(s_pcb); s_pcb = NULL; }
            s_status   = MQTT_DISCONNECTED;
            s_retry_ms = now;
        }
        break;

    case MQTT_ERROR:
        // Aguarda o intervalo antes de retentar
        if (now - s_retry_ms >= RECONNECT_INTERVAL_MS) {
            printf("[MQTT] Retentando apos erro...\n");
            s_status = MQTT_DISCONNECTED;
        }
        break;

    case MQTT_CONNECTED:
        if (now - s_last_send_ms >= PING_INTERVAL_MS) {
            uint8_t ping[2] = { 0xC0, 0x00 };
            err_t err = tcp_write(s_pcb, ping, sizeof(ping), TCP_WRITE_FLAG_COPY);
            if (err == ERR_OK) {
                tcp_output(s_pcb);
                s_last_send_ms = now;
                printf("[MQTT] PINGREQ enviado\n");
            } else {
                printf("[MQTT] PINGREQ falhou: %d\n", err);
                s_status   = MQTT_DISCONNECTED;
                s_retry_ms = now;
                s_pcb      = NULL;
            }
        }
        break;
    }
}

MqttStatus mqtt_client_status(void) {
    return s_status;
}

bool mqtt_send(const char *topic, const char *payload) {
    if (s_status != MQTT_CONNECTED || !s_pcb) {
        printf("[MQTT] Publish ignorado: nao conectado\n");
        return false;
    }

    static uint8_t pkt[PAYLOAD_MAX_LEN + 64];
    int len = build_publish(pkt, sizeof(pkt), topic, payload);
    if (len <= 0) {
        printf("[MQTT] Payload muito grande\n");
        return false;
    }

    err_t err = tcp_write(s_pcb, pkt, len, TCP_WRITE_FLAG_COPY);
    if (err != ERR_OK) {
        printf("[MQTT] tcp_write erro: %d\n", err);
        s_status = MQTT_DISCONNECTED;
        s_retry_ms = to_ms_since_boot(get_absolute_time());
        return false;
    }
    tcp_output(s_pcb);
    s_last_send_ms = to_ms_since_boot(get_absolute_time());
    printf("[MQTT] Publicado em '%s' (%d bytes)\n", topic, len);
    return true;
}
