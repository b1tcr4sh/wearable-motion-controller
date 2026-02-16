#include <WiFi.h>
#include <NetworkClient.h>
#include <WiFiAP.h>
#include "PD.h"

// Set these to your desired credentials.
const char *ssid = "espMPU";
const char *password = "12345678";
  // You can remove the password parameter if you want the AP to be open.
  // a valid password must have more than 7 characters

// Your computer is expected to be this address to receive data
const IPAddress destAddr(192, 168, 1, 1);

const unsigned int serverPort = 10000;
const unsigned int destPort = 12000;

WiFiUDP udp;
MicroOscUdp<1024> osc(&udp, destAddr, destPort);

PD pd(&osc, serverPort, destPort);

void setup() {
  Serial.begin(115200);
  Serial.println();

  Serial.println("Configuring access point...");
  bool ret = startAP();
  

  if (!ret) {
    log_e("Soft AP creation failed.");
    return;
  }

  pd.Begin(&udp);
  Serial.println("Listening for OSC messages...");
  delay(5000);
}

void loop() {
  // pd.CheckForMessage(); // won't receive shit

  if (pd.SendGyroData(0, 0, 0)) {
    Serial.println("Sent gyro data");
  }
  if (pd.SendAccelData(0, 0, 0)) {
    Serial.println("Sent accel data");
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
