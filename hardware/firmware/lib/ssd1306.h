// ============================================================================
//  ssd1306.h — Driver SSD1306 OLED 128x64 via I2C para Pico SDK
//  Auto-contido: framebuffer + texto + formas básicas
// ============================================================================

#ifndef SSD1306_H
#define SSD1306_H

#include <string.h>
#include <stdlib.h>
#include "pico/stdlib.h"
#include "hardware/i2c.h"

// ============================================================================
//  Configurações do Display
// ============================================================================

#define SSD1306_WIDTH        128
#define SSD1306_HEIGHT       64
#define SSD1306_PAGES        (SSD1306_HEIGHT / 8)
#define SSD1306_BUF_SIZE     (SSD1306_WIDTH * SSD1306_PAGES)  // 1024 bytes
#define SSD1306_I2C_ADDR     0x3C

// ============================================================================
//  Comandos SSD1306
// ============================================================================

#define SSD1306_SET_CONTRAST         0x81
#define SSD1306_DISPLAY_ALL_ON_RESUME 0xA4
#define SSD1306_DISPLAY_ALL_ON       0xA5
#define SSD1306_NORMAL_DISPLAY       0xA6
#define SSD1306_INVERT_DISPLAY       0xA7
#define SSD1306_DISPLAY_OFF          0xAE
#define SSD1306_DISPLAY_ON           0xAF
#define SSD1306_SET_DISPLAY_OFFSET   0xD3
#define SSD1306_SET_COM_PINS         0xDA
#define SSD1306_SET_VCOM_DESELECT    0xDB
#define SSD1306_SET_DISPLAY_CLK_DIV  0xD5
#define SSD1306_SET_PRECHARGE        0xD9
#define SSD1306_SET_MUX_RATIO        0xA8
#define SSD1306_SET_LOW_COLUMN       0x00
#define SSD1306_SET_HIGH_COLUMN      0x10
#define SSD1306_SET_START_LINE       0x40
#define SSD1306_MEMORY_MODE          0x20
#define SSD1306_COLUMN_ADDR          0x21
#define SSD1306_PAGE_ADDR            0x22
#define SSD1306_COM_SCAN_INC         0xC0
#define SSD1306_COM_SCAN_DEC         0xC8
#define SSD1306_SEG_REMAP            0xA0
#define SSD1306_CHARGE_PUMP          0x8D

// ============================================================================
//  Estrutura do Display
// ============================================================================

typedef struct {
    i2c_inst_t *i2c;
    uint8_t     addr;
    uint8_t     buffer[SSD1306_BUF_SIZE];
} ssd1306_t;

// ============================================================================
//  Fonte 5x7 básica (ASCII 32-126)
//  Cada caractere = 5 bytes (colunas), cada byte = 7 bits (linhas)
// ============================================================================

static const uint8_t font5x7[] = {
    0x00,0x00,0x00,0x00,0x00, // (space)
    0x00,0x00,0x5F,0x00,0x00, // !
    0x00,0x07,0x00,0x07,0x00, // "
    0x14,0x7F,0x14,0x7F,0x14, // #
    0x24,0x2A,0x7F,0x2A,0x12, // $
    0x23,0x13,0x08,0x64,0x62, // %
    0x36,0x49,0x55,0x22,0x50, // &
    0x00,0x05,0x03,0x00,0x00, // '
    0x00,0x1C,0x22,0x41,0x00, // (
    0x00,0x41,0x22,0x1C,0x00, // )
    0x08,0x2A,0x1C,0x2A,0x08, // *
    0x08,0x08,0x3E,0x08,0x08, // +
    0x00,0x50,0x30,0x00,0x00, // ,
    0x08,0x08,0x08,0x08,0x08, // -
    0x00,0x60,0x60,0x00,0x00, // .
    0x20,0x10,0x08,0x04,0x02, // /
    0x3E,0x51,0x49,0x45,0x3E, // 0
    0x00,0x42,0x7F,0x40,0x00, // 1
    0x42,0x61,0x51,0x49,0x46, // 2
    0x21,0x41,0x45,0x4B,0x31, // 3
    0x18,0x14,0x12,0x7F,0x10, // 4
    0x27,0x45,0x45,0x45,0x39, // 5
    0x3C,0x4A,0x49,0x49,0x30, // 6
    0x01,0x71,0x09,0x05,0x03, // 7
    0x36,0x49,0x49,0x49,0x36, // 8
    0x06,0x49,0x49,0x29,0x1E, // 9
    0x00,0x36,0x36,0x00,0x00, // :
    0x00,0x56,0x36,0x00,0x00, // ;
    0x00,0x08,0x14,0x22,0x41, // <
    0x14,0x14,0x14,0x14,0x14, // =
    0x41,0x22,0x14,0x08,0x00, // >
    0x02,0x01,0x51,0x09,0x06, // ?
    0x32,0x49,0x79,0x41,0x3E, // @
    0x7E,0x11,0x11,0x11,0x7E, // A
    0x7F,0x49,0x49,0x49,0x36, // B
    0x3E,0x41,0x41,0x41,0x22, // C
    0x7F,0x41,0x41,0x22,0x1C, // D
    0x7F,0x49,0x49,0x49,0x41, // E
    0x7F,0x09,0x09,0x01,0x01, // F
    0x3E,0x41,0x41,0x51,0x32, // G
    0x7F,0x08,0x08,0x08,0x7F, // H
    0x00,0x41,0x7F,0x41,0x00, // I
    0x20,0x40,0x41,0x3F,0x01, // J
    0x7F,0x08,0x14,0x22,0x41, // K
    0x7F,0x40,0x40,0x40,0x40, // L
    0x7F,0x02,0x04,0x02,0x7F, // M
    0x7F,0x04,0x08,0x10,0x7F, // N
    0x3E,0x41,0x41,0x41,0x3E, // O
    0x7F,0x09,0x09,0x09,0x06, // P
    0x3E,0x41,0x51,0x21,0x5E, // Q
    0x7F,0x09,0x19,0x29,0x46, // R
    0x46,0x49,0x49,0x49,0x31, // S
    0x01,0x01,0x7F,0x01,0x01, // T
    0x3F,0x40,0x40,0x40,0x3F, // U
    0x1F,0x20,0x40,0x20,0x1F, // V
    0x7F,0x20,0x18,0x20,0x7F, // W
    0x63,0x14,0x08,0x14,0x63, // X
    0x03,0x04,0x78,0x04,0x03, // Y
    0x61,0x51,0x49,0x45,0x43, // Z
    0x00,0x00,0x7F,0x41,0x41, // [
    0x02,0x04,0x08,0x10,0x20, // backslash
    0x41,0x41,0x7F,0x00,0x00, // ]
    0x04,0x02,0x01,0x02,0x04, // ^
    0x40,0x40,0x40,0x40,0x40, // _
    0x00,0x01,0x02,0x04,0x00, // `
    0x20,0x54,0x54,0x54,0x78, // a
    0x7F,0x48,0x44,0x44,0x38, // b
    0x38,0x44,0x44,0x44,0x20, // c
    0x38,0x44,0x44,0x48,0x7F, // d
    0x38,0x54,0x54,0x54,0x18, // e
    0x08,0x7E,0x09,0x01,0x02, // f
    0x08,0x54,0x54,0x54,0x3C, // g
    0x7F,0x08,0x04,0x04,0x78, // h
    0x00,0x44,0x7D,0x40,0x00, // i
    0x20,0x40,0x44,0x3D,0x00, // j
    0x00,0x7F,0x10,0x28,0x44, // k
    0x00,0x41,0x7F,0x40,0x00, // l
    0x7C,0x04,0x18,0x04,0x78, // m
    0x7C,0x08,0x04,0x04,0x78, // n
    0x38,0x44,0x44,0x44,0x38, // o
    0x7C,0x14,0x14,0x14,0x08, // p
    0x08,0x14,0x14,0x18,0x7C, // q
    0x7C,0x08,0x04,0x04,0x08, // r
    0x48,0x54,0x54,0x54,0x20, // s
    0x04,0x3F,0x44,0x40,0x20, // t
    0x3C,0x40,0x40,0x20,0x7C, // u
    0x1C,0x20,0x40,0x20,0x1C, // v
    0x3C,0x40,0x30,0x40,0x3C, // w
    0x44,0x28,0x10,0x28,0x44, // x
    0x0C,0x50,0x50,0x50,0x3C, // y
    0x44,0x64,0x54,0x4C,0x44, // z
    0x00,0x08,0x36,0x41,0x00, // {
    0x00,0x00,0x7F,0x00,0x00, // |
    0x00,0x41,0x36,0x08,0x00, // }
    0x10,0x08,0x08,0x10,0x08, // ~
};

// ============================================================================
//  Funções de Comando I2C
// ============================================================================

static inline void ssd1306_write_cmd(ssd1306_t *disp, uint8_t cmd) {
    uint8_t buf[2] = {0x00, cmd};  // Co=0, D/C#=0 (comando)
    i2c_write_blocking(disp->i2c, disp->addr, buf, 2, false);
}

// ============================================================================
//  Inicialização do Display
// ============================================================================

static void ssd1306_init(ssd1306_t *disp, i2c_inst_t *i2c_port, uint sda_pin, uint scl_pin) {
    disp->i2c  = i2c_port;
    disp->addr = SSD1306_I2C_ADDR;

    // Inicializa I2C a 400kHz
    i2c_init(disp->i2c, 400 * 1000);
    gpio_set_function(sda_pin, GPIO_FUNC_I2C);
    gpio_set_function(scl_pin, GPIO_FUNC_I2C);
    gpio_pull_up(sda_pin);
    gpio_pull_up(scl_pin);

    sleep_ms(100); // Aguarda estabilizar

    // Sequência de inicialização SSD1306 128x64
    ssd1306_write_cmd(disp, SSD1306_DISPLAY_OFF);
    ssd1306_write_cmd(disp, SSD1306_SET_DISPLAY_CLK_DIV);
    ssd1306_write_cmd(disp, 0x80);
    ssd1306_write_cmd(disp, SSD1306_SET_MUX_RATIO);
    ssd1306_write_cmd(disp, 0x3F);  // 64 linhas - 1
    ssd1306_write_cmd(disp, SSD1306_SET_DISPLAY_OFFSET);
    ssd1306_write_cmd(disp, 0x00);
    ssd1306_write_cmd(disp, SSD1306_SET_START_LINE | 0x00);
    ssd1306_write_cmd(disp, SSD1306_CHARGE_PUMP);
    ssd1306_write_cmd(disp, 0x14);  // Habilita charge pump (VCC interno)
    ssd1306_write_cmd(disp, SSD1306_MEMORY_MODE);
    ssd1306_write_cmd(disp, 0x00);  // Modo endereçamento horizontal
    ssd1306_write_cmd(disp, SSD1306_SEG_REMAP | 0x01);   // Remapeia segmento
    ssd1306_write_cmd(disp, SSD1306_COM_SCAN_DEC);        // COM scan reverso
    ssd1306_write_cmd(disp, SSD1306_SET_COM_PINS);
    ssd1306_write_cmd(disp, 0x12);
    ssd1306_write_cmd(disp, SSD1306_SET_CONTRAST);
    ssd1306_write_cmd(disp, 0xCF);
    ssd1306_write_cmd(disp, SSD1306_SET_PRECHARGE);
    ssd1306_write_cmd(disp, 0xF1);
    ssd1306_write_cmd(disp, SSD1306_SET_VCOM_DESELECT);
    ssd1306_write_cmd(disp, 0x40);
    ssd1306_write_cmd(disp, SSD1306_DISPLAY_ALL_ON_RESUME);
    ssd1306_write_cmd(disp, SSD1306_NORMAL_DISPLAY);
    ssd1306_write_cmd(disp, SSD1306_DISPLAY_ON);

    // Limpa framebuffer
    memset(disp->buffer, 0, SSD1306_BUF_SIZE);
}

// ============================================================================
//  Atualiza o display com o conteúdo do framebuffer
// ============================================================================

static void ssd1306_show(ssd1306_t *disp) {
    ssd1306_write_cmd(disp, SSD1306_COLUMN_ADDR);
    ssd1306_write_cmd(disp, 0);
    ssd1306_write_cmd(disp, SSD1306_WIDTH - 1);
    ssd1306_write_cmd(disp, SSD1306_PAGE_ADDR);
    ssd1306_write_cmd(disp, 0);
    ssd1306_write_cmd(disp, SSD1306_PAGES - 1);

    // Envia framebuffer em blocos (I2C tem limite de payload)
    // Prefixo 0x40 = Co=0, D/C#=1 (dados)
    uint8_t buf[SSD1306_BUF_SIZE + 1];
    buf[0] = 0x40;
    memcpy(buf + 1, disp->buffer, SSD1306_BUF_SIZE);
    i2c_write_blocking(disp->i2c, disp->addr, buf, SSD1306_BUF_SIZE + 1, false);
}

// ============================================================================
//  Operações no Framebuffer
// ============================================================================

static inline void ssd1306_clear(ssd1306_t *disp) {
    memset(disp->buffer, 0, SSD1306_BUF_SIZE);
}

// Define um pixel (x, y). color: 1=aceso, 0=apagado
static inline void ssd1306_pixel(ssd1306_t *disp, int x, int y, uint8_t color) {
    if (x < 0 || x >= SSD1306_WIDTH || y < 0 || y >= SSD1306_HEIGHT) return;
    if (color)
        disp->buffer[x + (y / 8) * SSD1306_WIDTH] |=  (1 << (y & 7));
    else
        disp->buffer[x + (y / 8) * SSD1306_WIDTH] &= ~(1 << (y & 7));
}

// Desenha um caractere na posição (x, y)
static void ssd1306_char(ssd1306_t *disp, int x, int y, char c, uint8_t color) {
    if (c < 32 || c > 126) c = '?';
    int idx = (c - 32) * 5;
    for (int col = 0; col < 5; col++) {
        uint8_t line = font5x7[idx + col];
        for (int row = 0; row < 7; row++) {
            if (line & (1 << row)) {
                ssd1306_pixel(disp, x + col, y + row, color);
            }
        }
    }
}

// Desenha uma string na posição (x, y). Espaçamento = 6px por caractere.
static void ssd1306_text(ssd1306_t *disp, int x, int y, const char *str, uint8_t color) {
    while (*str) {
        ssd1306_char(disp, x, y, *str, color);
        x += 6;  // 5px caractere + 1px espaço
        str++;
    }
}

// Desenha uma string com escala 2x (caracteres maiores)
static void ssd1306_text_2x(ssd1306_t *disp, int x, int y, const char *str, uint8_t color) {
    while (*str) {
        if (*str < 32 || *str > 126) { str++; x += 12; continue; }
        int idx = (*str - 32) * 5;
        for (int col = 0; col < 5; col++) {
            uint8_t line = font5x7[idx + col];
            for (int row = 0; row < 7; row++) {
                if (line & (1 << row)) {
                    // Cada pixel vira um bloco 2x2
                    ssd1306_pixel(disp, x + col*2,     y + row*2,     color);
                    ssd1306_pixel(disp, x + col*2 + 1,  y + row*2,     color);
                    ssd1306_pixel(disp, x + col*2,     y + row*2 + 1, color);
                    ssd1306_pixel(disp, x + col*2 + 1,  y + row*2 + 1, color);
                }
            }
        }
        x += 12;  // 10px + 2px espaço
        str++;
    }
}

// Desenha um retângulo (apenas borda)
static void ssd1306_rect(ssd1306_t *disp, int x, int y, int w, int h, uint8_t color) {
    for (int i = 0; i < w; i++) {
        ssd1306_pixel(disp, x + i, y, color);
        ssd1306_pixel(disp, x + i, y + h - 1, color);
    }
    for (int i = 0; i < h; i++) {
        ssd1306_pixel(disp, x, y + i, color);
        ssd1306_pixel(disp, x + w - 1, y + i, color);
    }
}

// Desenha um retângulo preenchido
static void ssd1306_fill_rect(ssd1306_t *disp, int x, int y, int w, int h, uint8_t color) {
    for (int i = 0; i < w; i++) {
        for (int j = 0; j < h; j++) {
            ssd1306_pixel(disp, x + i, y + j, color);
        }
    }
}

// Desenha uma linha horizontal
static void ssd1306_hline(ssd1306_t *disp, int x, int y, int w, uint8_t color) {
    for (int i = 0; i < w; i++) {
        ssd1306_pixel(disp, x + i, y, color);
    }
}

// Inverte uma região retangular (para efeito de seleção)
static void ssd1306_invert_rect(ssd1306_t *disp, int x, int y, int w, int h) {
    for (int i = 0; i < w; i++) {
        for (int j = 0; j < h; j++) {
            int px = x + i;
            int py = y + j;
            if (px < 0 || px >= SSD1306_WIDTH || py < 0 || py >= SSD1306_HEIGHT) continue;
            disp->buffer[px + (py / 8) * SSD1306_WIDTH] ^= (1 << (py & 7));
        }
    }
}

#endif // SSD1306_H
