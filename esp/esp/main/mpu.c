#include "esp_err.h"
#include "mpu6050/include/mpu6050.h"
#include "mpu6050/mpu6050.c"

#define I2C_MASTER_SCL_IO 22        /*!< GPIO number for I2C master clock */
#define I2C_MASTER_SDA_IO 21        /*!< GPIO number for I2C master data */
#define I2C_MASTER_NUM I2C_NUM_0    /*!< I2C master port number */
#define I2C_MASTER_FREQ_HZ 100000   /*!< I2C master clock frequency */

struct mpu_data {
    float x;
    float y; 
    float z;
};

int init_mpu() {
    esp_err_t ret = mpu6050_init(I2C_MASTER_SCL_IO, I2C_MASTER_SDA_IO,I2C_MASTER_FREQ_HZ, I2C_MASTER_NUM);
    if (ret != ESP_OK) {
        ESP_LOGE("APP", "MPU6050 initialization failed!!");
        return 0;
    } 

    return 1;
}

struct mpu_data read_gyro() {
    float x, y, z; 
    struct mpu_data data;

    esp_err_t ret = mpu6050_read_gyro(&x, &y, &z);
    
    if (ret != ESP_OK) {
        ESP_LOGE("APP", "FAILED READ FROM MPU6050!!");

        data.x = 0;
        data.y = 0;
        data.z = 0;

        return data;
    }

    data.x = x;
    data.y = y;
    data.z = z;

    return data;
}

struct mpu_data read_accel() {
    float x, y, z; 
    struct mpu_data data;

    esp_err_t ret = mpu6050_read_accel(&x, &y, &z);
    
    if (ret != ESP_OK) {
        ESP_LOGE("APP", "FAILED READ FROM MPU6050!!");

        data.x = 0;
        data.y = 0;
        data.z = 0;

        return data;
    }

    data.x = x;
    data.y = y;
    data.z = z;

    return data;
}
