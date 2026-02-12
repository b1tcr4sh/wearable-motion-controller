#include <stdio.h>
#include "esp_err.h"
#include "esp_log.h"
#include "esp_wifi_types_generic.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_wifi.h"
#include "mpu.c"

void app_main(void) {
    wifi_init_config_t config = WIFI_INIT_CONFIG_DEFAULT();

    wifi_config_t new_wifi_config = {
        .ap = {
            .ssid = "MyESP32Network",         // Network Name (Max 32 chars)
            .ssid_len = 0,                     // Length of SSID (0 = auto-calculate)
            .password = "password123",         // Password (8-63 chars for WPA2)
            .channel = 1,                      // WiFi Channel (1-13)
            .authmode = WIFI_AUTH_WPA2_PSK,    // Authentication Mode
            .ssid_hidden = 0,                  // Broadcast SSID (0=No, 1=Yes)
            .max_connection = 4,               // Max clients (1-10)
            .beacon_interval = 100,            // Beacon interval (ms, 100-60000)
            // .pairwise_cipher = WIFI_CIPHER_TYPE_CCMP, // Optional: Specific cipher for WPA2/WPA3
            // .pmf_cfg = { .required = false }, // Optional: Protected Management Frames
        },
    };

    esp_netif_t* ap_netif = esp_netif_create_default_wifi_ap();



    esp_err_t ret = esp_wifi_init(&config);
    if (ret != ESP_OK) {
        ESP_LOGE("APP", "FAILED TO INIT WIFI!!!");
        return;
    }

    esp_wifi_set_mode(WIFI_MODE_STA);

    esp_wifi_set_config(wifi_interface_t interface, wifi_config_t *conf)

    ret = esp_wifi_start();

    if (ret != ESP_OK) {
        ESP_LOGE("APP", "FAILED TO START WIFI STATION!!!");
        return;
    }



    while (1) {
        

        vTaskDelay(500 / portTICK_PERIOD_MS);
        printf("\n");
    }
}

