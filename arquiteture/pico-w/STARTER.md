# BitDogLab Joystick LED – Guia Completo (Raspberry Pi Pico W)

Este documento descreve **todo o processo funcional testado**, desde a instalação das ferramentas até a gravação do programa no **Raspberry Pi Pico W / BitDogLab**, usando **C + Pico SDK**.

---

# 🎯 Objetivo do Projeto

Implementar um programa em C para:

* Ler o **joystick analógico**
* Acender um **LED em uma matriz WS2812 5x5**
* Iniciar o LED **no centro**
* Permitir movimento com o joystick
* Impedir que o LED saia do quadrado

---

# 🧰 Instalação das Ferramentas (Ubuntu)

## Atualizar sistema

```bash
sudo apt update
```

## Instalar ferramentas de compilação embarcada

```bash
sudo apt install -y cmake \
gcc-arm-none-eabi \
libnewlib-arm-none-eabi \
libstdc++-arm-none-eabi-newlib \
git \
build-essential
```

### 📌 Objetivo de cada pacote

| Pacote            | Função                                 |
| ----------------- | -------------------------------------- |
| cmake             | gerar sistema de build                 |
| gcc-arm-none-eabi | compilador ARM para microcontroladores |
| newlib            | biblioteca padrão C embarcada          |
| git               | baixar Pico SDK                        |
| build-essential   | ferramentas de compilação              |

---

# 📦 Instalar Pico SDK

Criar pasta de trabalho:

```bash
mkdir -p ~/pico
cd ~/pico
```

Clonar SDK:

```bash
git clone https://github.com/raspberrypi/pico-sdk.git
```

Inicializar submódulos:

```bash
cd pico-sdk
git submodule update --init
cd ..
```

Definir variável:

```bash
export PICO_SDK_PATH=$HOME/pico/pico-sdk
```

Tornar permanente:

```bash
echo 'export PICO_SDK_PATH=$HOME/pico/pico-sdk' >> ~/.bashrc
source ~/.bashrc
```

---

# 📁 Estrutura do Projeto

Criar pasta do projeto:

```bash
mkdir -p ~/pico/bitdoglab_joystick
cd ~/pico/bitdoglab_joystick
```

Arquivos:

```
bitdoglab_joystick/
│
├── main.c
├── ws2812.pio
├── pico_sdk_import.cmake
├── CMakeLists.txt
└── build/
```

---

# 📄 Copiar arquivo do SDK

```bash
cp $PICO_SDK_PATH/external/pico_sdk_import.cmake .
```

---

# 📄 CMakeLists.txt

```cmake
cmake_minimum_required(VERSION 3.13)

include(pico_sdk_import.cmake)

project(bitdoglab_joystick_led C CXX ASM)
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

pico_sdk_init()

add_executable(bitdoglab_joystick_led
    main.c
    ws2812.pio
)

pico_generate_pio_header(bitdoglab_joystick_led ${CMAKE_CURRENT_LIST_DIR}/ws2812.pio)

target_link_libraries(bitdoglab_joystick_led
    pico_stdlib
    hardware_adc
    hardware_pio
)

pico_add_extra_outputs(bitdoglab_joystick_led)
```

---

# 📄 ws2812.pio

```pio
.program ws2812
.side_set 1

.define public T1 2
.define public T2 5
.define public T3 3

.wrap_target
bitloop:
    out x, 1 side 0 [T3 - 1]
    jmp !x do_zero side 1 [T1 - 1]
do_one:
    jmp bitloop side 1 [T2 - 1]
do_zero:
    nop side 0 [T2 - 1]
.wrap
```

---

# 📄 main.c

```c
#include <stdio.h>
#include "pico/stdlib.h"
#include "hardware/adc.h"
#include "hardware/pio.h"
#include "hardware/clocks.h"
#include "ws2812.pio.h"

#define WS2812_PIN 7
#define JOY_X_PIN 26
#define JOY_Y_PIN 27

#define MATRIX_W 5
#define MATRIX_H 5
#define NUM_LEDS 25

#define DEADZONE 400

static int pos_x = 2;
static int pos_y = 2;

static inline void ws2812_program_init(PIO pio, uint sm, uint offset, uint pin, float freq, bool rgbw){
    pio_gpio_init(pio,pin);
    pio_sm_set_consecutive_pindirs(pio,sm,pin,1,true);

    pio_sm_config c = ws2812_program_get_default_config(offset);
    sm_config_set_sideset_pins(&c,pin);
    sm_config_set_out_shift(&c,false,true,24);
    sm_config_set_fifo_join(&c,PIO_FIFO_JOIN_TX);

    int cycles = ws2812_T1 + ws2812_T2 + ws2812_T3;
    float div = clock_get_hz(clk_sys)/(freq*cycles);
    sm_config_set_clkdiv(&c,div);

    pio_sm_init(pio,sm,offset,&c);
    pio_sm_set_enabled(pio,sm,true);
}

uint32_t color(uint8_t r,uint8_t g,uint8_t b){
    return (g<<16)|(r<<8)|b;
}

int xy_to_index(int x,int y){
    if(y%2==0) return y*MATRIX_W+x;
    else return y*MATRIX_W+(MATRIX_W-1-x);
}

void draw(PIO pio,uint sm){
    for(int y=0;y<MATRIX_H;y++){
        for(int x=0;x<MATRIX_W;x++){
            if(x==pos_x && y==pos_y)
                pio_sm_put_blocking(pio,sm,color(40,0,0)<<8);
            else
                pio_sm_put_blocking(pio,sm,0);
        }
    }
}

int main(){
    stdio_init_all();

    adc_init();
    adc_gpio_init(JOY_X_PIN);
    adc_gpio_init(JOY_Y_PIN);

    PIO pio=pio0;
    int sm=0;
    uint offset=pio_add_program(pio,&ws2812_program);
    ws2812_program_init(pio,sm,offset,WS2812_PIN,800000,false);

    while(1){
        adc_select_input(0);
        int x=adc_read();

        adc_select_input(1);
        int y=adc_read();

        if(x>2048+DEADZONE) pos_x++;
        if(x<2048-DEADZONE) pos_x--;

        if(y>2048+DEADZONE) pos_y--;
        if(y<2048-DEADZONE) pos_y++;

        if(pos_x<0)pos_x=0;
        if(pos_x>4)pos_x=4;
        if(pos_y<0)pos_y=0;
        if(pos_y>4)pos_y=4;

        draw(pio,sm);
        sleep_ms(120);
    }
}
```

---

# ⚙️ Compilação

```bash
cd ~/pico/bitdoglab_joystick
rm -rf build
mkdir build
cd build

cmake ..
make -j4
```

Arquivos gerados:

```
bitdoglab_joystick_led.uf2
bitdoglab_joystick_led.elf
bitdoglab_joystick_led.bin
```

---

# 🚀 Gravar no Pico W

## Entrar em modo BOOTSEL

1. Desconectar USB
2. Segurar botão BOOTSEL
3. Conectar USB
4. Soltar botão

Verificar:

```bash
ls /media/$USER
```

Deve aparecer:

```
RPI-RP2
```

## Copiar firmware

```bash
cp bitdoglab_joystick_led.uf2 /media/$USER/RPI-RP2/
```

Após copiar:

* Pico reinicia automaticamente
* Programa começa a rodar

---

# ✅ Resultado Esperado

* LED inicia no centro da matriz
* Movimento com joystick
* LED não sai do quadrado

---

# 🧠 Conceitos aprendidos

* Toolchain ARM embarcada
* Pico SDK
* CMake build system
* Programação PIO
* ADC leitura analógica
* Firmware UF2
* Bootloader USB

---

# 📌 Próximos passos sugeridos

* movimento suave
* jogo snake
* usar Wi-Fi
* usar buzzer
* usar display OLED

---

**Projeto funcional validado em hardware real.**
