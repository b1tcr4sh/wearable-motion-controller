#include <Adafruit_MPU6050.h>
#include <Adafruit_Sensor.h>
#include <Wire.h>

struct MPU_READING {
  float x;
  float y;
  float z;
};

class MPU {
  public: 

  int Setup();
  MPU_READING GetAccel();
  MPU_READING GetGyro();

  private:

  Adafruit_MPU6050 mpu;
};