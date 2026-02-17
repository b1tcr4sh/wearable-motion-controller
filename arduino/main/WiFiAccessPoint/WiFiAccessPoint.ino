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

  if (pd.SendGyroData(gyro.gyro.x, gyro.gyro.y, gyro.gyro.z)) {
    Serial.println("Sent gyro data");
  }
  if (pd.SendAccelData(accel.acceleration.x, accel.acceleration.y, accel.acceleration.z)) {
    Serial.println("Sent accel data");
  }

  delay(100);
  
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
