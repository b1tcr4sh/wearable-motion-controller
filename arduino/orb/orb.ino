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
  SetupMPU();
  SetupWIFI();

  delay(5000);

}

void loop() {
  RegisterEventHandler();

  float accelx, accely, accelz, gyrox, gyroy, gyroz, vector, vector_delta, vector_velocity;
  GetImuData(accelx, accely, accelz, gyrox, gyroy, gyroz, vector, vector_delta, vector_velocity); // get data from imu

  SendImuData(accelx, accely, accelz, gyrox, gyroy, gyroz, vector, vector_delta, vector_velocity); // attempt to send imu data over osc

  delay(30);
}

