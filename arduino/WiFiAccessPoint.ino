#include <WiFi.h>
#include <NetworkClient.h>
#include <WiFiAP.h>
#include <WiFiUdp.h>
#include <MicroOscUdp.h>
#include <Adafruit_MPU6050.h>
#include <Adafruit_Sensor.h>
#include <Wire.h>

// Set these to your desired credentials.
  // You can remove the password parameter if you want the AP to be open.
  // a valid password must have more than 7 characters
const char *ssid = "espMPU";
const char *password = "12345678";

const IPAddress destAddr(192, 168, 4, 2);
const unsigned int serverPort = 10000;
const unsigned int destPort = 12000;
  
bool accepting = false;
float accelXOffset = 0;
float accelYOffset = 0;
float accelZOffset = 0;

WiFiUDP udp;
MicroOscUdp<1024> osc(&udp, destAddr, destPort);
Adafruit_MPU6050 mpu;

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

  udp.begin(serverPort);
  Serial.println("Listening for OSC messages...");
  delay(5000);
}

void loop() {
  osc.onOscMessageReceived(OscMessageParser); // Checks for incoming OSC messages

  sensors_event_t accel, gyro, temp;
  mpu.getEvent(&accel, &gyro, &temp);

  float x = ( accel.acceleration.x / 16384.0 ) - accelXOffset;
  float y = ( accel.acceleration.y / 16384.0 ) - accelYOffset;
  float z = ( accel.acceleration.z / 16384.0 ) - accelZOffset;

  if (SendGyroData(x, y, z)) {
    Serial.println("Sent gyro data");
  }

  x = gyro.gyro.x / 131.0;
  y = gyro.gyro.y / 131.0;
  z = gyro.gyro.z / 131.0;

  if (SendAccelData(x, y, z)) {
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

void OscMessageParser(MicroOscMessage& mes) { //FUNCTION THAT WILL BE CALLED WHEN AN OSC MESSAGE IS RECEIVED:
  if (mes.checkOscAddress("/esp/start")) {
    if (!accepting) 
      StartSending();
  }

  if (mes.checkOscAddress("/esp/stop")) {
    if (accepting) 
      StopSending();
  }

  if (mes.checkOscAddress("/esp/calibrate")) {
    Calibrate();
  }

}

void StartSending() {  
  Serial.println("_____Sending data naow....______");
  accepting = true;
}

void StopSending() {
  Serial.println("_____Stop data send_____");
  accepting = false;
}

bool SendGyroData(float x, float y, float z) {
  if (!accepting) {
    return false;
  }

  osc.sendFloat("/esp/gyro/x", x);
  osc.sendFloat("/esp/gyro/y", y);
  osc.sendFloat("/esp/gyro/z", z);

  return true;
}

bool SendAccelData(float x, float y, float z) {
  if (!accepting) {
    return false;
  }

  osc.sendFloat("/esp/accel/x", x);
  osc.sendFloat("/esp/accel/y", y);
  osc.sendFloat("/esp/accel/z", z);

  return true;
}

void Calibrate() {
  float xSum = 0, ySum = 0, zSum = 0;

  Serial.println("Calibrating...");

  for (int i = 0; i < 200; i++) {
    sensors_event_t accel, gyro, temp;
    mpu.getEvent(&accel, &gyro, &temp);

    xSum += accel.acceleration.x;
    ySum += accel.acceleration.y;
    zSum += accel.acceleration.z;

    delay(5);
  }

  accelXOffset = xSum / 200;
  accelYOffset = ySum / 200;
  accelZOffset = zSum / 200;

  Serial.println("Done!");
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