#include <WiFi.h>
#include <NetworkClient.h>
#include <WiFiAP.h>
#include <WiFiUdp.h>
#include <MicroOscUdp.h>
#include <Adafruit_MPU6050.h>
#include <Adafruit_Sensor.h>
#include "I2Cdev.h"
#include "MPU6050_6Axis_MotionApps20.h"
#include <Wire.h>
#include <Arduino.h>
#include <FastLED.h>

// Set these to your desired credentials.
  // You can remove the password parameter if you want the AP to be open.
  // a valid password must have more than 7 characters
const char *ssid = "orbfi";
const char *password = "eightchars";  

void setup() {
  Serial.begin(115200);
  Serial.println();

  SetupLED();
  // SetupMPU();
  SetupMPU_DMP();
  SetupWIFI();

  delay(5000);

}

void loop() {
  RegisterEventHandler();

  // float accelx, accely, accelz, gyrox, gyroy, gyroz, vector, vector_delta, vector_velocity;
  // GetRawImuData(accelx, accely, accelz, gyrox, gyroy, gyroz, vector, vector_delta, vector_velocity); // get data from imu

  // SendRawImuData(accelx, accely, accelz, gyrox, gyroy, gyroz, vector, vector_delta, vector_velocity); // attempt to send imu data over osc


  float x, y, z, yaw, pitch, roll;
  GetYawPitchRoll(yaw, pitch, roll);
  GetRealAccel(x, y, z);
  float totalAccel = CalculatePythagoreanVector(x, y, z);
  float vel = GetVelocity(totalAccel);
  SendDmpData(x, y, z, yaw, pitch, roll, totalAccel, vel);

  delay(30);
}

