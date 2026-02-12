#include "mpu.cpp"

MPU mpu;

void setup() {
  Serial.begin(115200);

  if (mpu.setup() == -1) {
    Serial.println("Could not connect to MPU6050!!!!");
  }

}

void loop() {
  MPU_READING accel = mpu.GetAccel();
  MPU_READING gyro = mpu.GetGyro();
}
