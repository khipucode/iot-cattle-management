# ============================================================================
#  CMakeLists.txt — RFID Stick Firmware
#
#  Pré-requisitos:
#    export PICO_SDK_PATH=~/pico/pico-sdk
#
#  Para Pico W  : PICO_BOARD=pico_w   (padrão abaixo)
#  Para Pico 2 W: altere para pico2_w
# ============================================================================

cmake_minimum_required(VERSION 3.13)

set(PICO_BOARD pico_w)   # ← altere para pico2_w se usar Pico 2 W

include($ENV{PICO_SDK_PATH}/external/pico_sdk_import.cmake)

project(rfid_stick C CXX ASM)
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

pico_sdk_init()

# ── Fontes ────────────────────────────────────────────────────────────────────
add_executable(rfid_stick
    main.c
    app/app_state.c
    drivers/rfid.c
    drivers/dht22.c
    drivers/wifi_driver.c
    drivers/display.c
    drivers/time_util.c
    menu/menu.c
    mqtt/mqtt_client.c
    payload/payload.c
)

# ── Includes ──────────────────────────────────────────────────────────────────
target_include_directories(rfid_stick PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/app
    ${CMAKE_CURRENT_SOURCE_DIR}/drivers
    ${CMAKE_CURRENT_SOURCE_DIR}/menu
    ${CMAKE_CURRENT_SOURCE_DIR}/mqtt
    ${CMAKE_CURRENT_SOURCE_DIR}/payload
    ${CMAKE_CURRENT_SOURCE_DIR}/lib
)

# ── Bibliotecas ───────────────────────────────────────────────────────────────
target_link_libraries(rfid_stick
    pico_stdlib
    pico_cyw43_arch_lwip_poll   # WiFi + LwIP polling (sem RTOS)
    pico_lwip_sntp              # Cliente SNTP LwIP
    pico_lwip_mqtt              # Cliente MQTT LwIP
    hardware_uart               # RFID (UART0)
    hardware_i2c                # OLED SSD1306
    hardware_adc                # Joystick
    hardware_pwm                # Buzzer
    hardware_clocks             # Cálculo de frequência PWM
    hardware_gpio
)

# ── Saída ─────────────────────────────────────────────────────────────────────
pico_enable_stdio_usb(rfid_stick 1)
pico_enable_stdio_uart(rfid_stick 0)   # UART0 reservada para RFID
pico_add_extra_outputs(rfid_stick)     # gera .uf2, .bin, .map
