#include <WiFi.h>
#include <NetworkClient.h>
#include <WiFiAP.h>
#include <Adafruit_MPU6050.h>
#include <Adafruit_Sensor.h>
#include <Wire.h>
#include "PD.h"

// Set these to your desired credentials.
const char *ssid = "espMPU";
const char *password = "12345678";
  // You can remove the password parameter if you want the AP to be open.
  // a valid password must have more than 7 characters

// Your computer is expected to be this address to receive data
const IPAddress destAddr(192, 168, 4, 2);
const unsigned int serverPort = 10000;
const unsigned int destPort = 12000;

WiFiUDP udp;
MicroOscUdp<1024> osc(&udp, destAddr, destPort);

Adafruit_MPU6050 mpu;


PD pd(&osc, serverPort, destPort);

void setup() {
  Serial.begin(115200);
  Serial.println();

  if (!mpu.begin()) {
    Serial.println("Failed to find MPU6050 chip");
    return;
  }
  Serial.println("MPU6050 Found!");

  setupMPU();

  Serial.println("Configuring access point...");
  bool ret = startAP();
  

  if (!ret) {
    log_e("Soft AP creation failed.");
    return;
  }

  // WiFi.onEvent(WiFiStationConnected, WIFI_EVENT_AP_STACONNECTED);  

  pd.Begin(&udp);
  Serial.println("Listening for OSC messages...");
  delay(5000);
}

void loop() {
  // pd.CheckForMessage(); // won't receive shit

  sensors_event_t accel, gyro, temp;
  mpu.getEvent(&accel, &gyro, &temp);

  float x = accel.acceleration.x / 16384.0;
  float y = accel.acceleration.y / 16384.0;
  float z = accel.acceleration.z / 16384.0;

  if (pd.SendGyroData(x, y, z)) {
    Serial.println("Sent gyro data");
  }

  x = gyro.gyro.x / 131.0;
  y = gyro.gyro.y / 131.0;
  z = gyro.gyro.z / 131.0;

  if (pd.SendAccelData(x, y, z)) {
    Serial.println("Sent accel data");
  }

  delay(100);
  
}

void setupMPU() {
  mpu.setAccelerometerRange(MPU6050_RANGE_2_G);
  Serial.print("Accelerometer range set to: ");
  switch (mpu.getAccelerometerRange()) {
  case MPU6050_RANGE_2_G:
    Serial.println("+-2G");
    break;
  case MPU6050_RANGE_4_G:
    Serial.println("+-4G");
    break;
  case MPU6050_RANGE_8_G:
    Serial.println("+-8G");
    break;
  case MPU6050_RANGE_16_G:
    Serial.println("+-16G");
    break;
  }
  mpu.setGyroRange(MPU6050_RANGE_250_DEG);
  Serial.print("Gyro range set to: ");
  switch (mpu.getGyroRange()) {
  case MPU6050_RANGE_250_DEG:
    Serial.println("+- 250 deg/s");
    break;
  case MPU6050_RANGE_500_DEG:
    Serial.println("+- 500 deg/s");
    break;
  case MPU6050_RANGE_1000_DEG:
    Serial.println("+- 1000 deg/s");
    break;
  case MPU6050_RANGE_2000_DEG:
    Serial.println("+- 2000 deg/s");
    break;
  }

  mpu.setFilterBandwidth(MPU6050_BAND_5_HZ);
  Serial.print("Filter bandwidth set to: ");
  switch (mpu.getFilterBandwidth()) {
  case MPU6050_BAND_260_HZ:
    Serial.println("260 Hz");
    break;
  case MPU6050_BAND_184_HZ:
    Serial.println("184 Hz");
    break;
  case MPU6050_BAND_94_HZ:
    Serial.println("94 Hz");
    break;
  case MPU6050_BAND_44_HZ:
    Serial.println("44 Hz");
    break;
  case MPU6050_BAND_21_HZ:
    Serial.println("21 Hz");
    break;
  case MPU6050_BAND_10_HZ:
    Serial.println("10 Hz");
    break;
  case MPU6050_BAND_5_HZ:
    Serial.println("5 Hz");
    break;
  }
}

bool startAP() {
  if (!WiFi.softAP(ssid, password)) {
    return false;
  }
  IPAddress myIP = WiFi.softAPIP();
  Serial.print("AP IP address: ");
  Serial.println(myIP);

  return true;
}

void WiFiStationConnected(WiFiEvent_t event, WiFiEventInfo_t info){
  Serial.println("Station connected");
}
