#include <WiFi.h>
#include <NetworkClient.h>
#include <WiFiAP.h>
#include <WiFiUdp.h>
#include <MicroOscUdp.h>
#include <Adafruit_MPU6050.h>
#include <Adafruit_Sensor.h>
#include <Wire.h>
#include <Arduino.h>
// #include <Adafruit_NeoPixel.h>
#include <FastLED.h>

#define LED_PIN     25           // Data pin number
#define NUM_LEDS    30          // Number of LEDs
#define LED_TYPE    WS2812B     // Your LED strip type
#define COLOR_ORDER GRB         // Color channel order

// Set these to your desired credentials.
  // You can remove the password parameter if you want the AP to be open.
  // a valid password must have more than 7 characters
const char *ssid = "espMPU";
const char *password = "eightchars";

const int movementThreshold = 0.1;
const int movementDurationThreshold = 20;

const IPAddress destAddr(192, 168, 4, 2);
const unsigned int serverPort = 10000;
const unsigned int destPort = 12000;
  
bool accepting = false;
float accelXOffset = 0;
float accelYOffset = 0;
float accelZOffset = 0;
float gyroXOffset = 0;
float gyroyOffset = 0;
float gyrozOffset = 0;

float accelx;
float accely;
float accelz;
float gyrox;
float gyroy;
float gyroz;

bool sentData = false;

WiFiUDP udp;
MicroOscUdp<1024> osc(&udp, destAddr, destPort);
Adafruit_MPU6050 mpu;

CRGB leds[NUM_LEDS];

void setup() {
  Serial.begin(115200);
  Serial.println();

  FastLED.addLeds<LED_TYPE, LED_PIN, COLOR_ORDER>(leds, NUM_LEDS);

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

  if(mpu.getMotionInterruptStatus()) {
    sensors_event_t accel, gyro, temp;
    mpu.getEvent(&accel, &gyro, &temp);

    accelx = ( accel.acceleration.x /*/ 16384.0 */) - accelXOffset;
    accely = ( accel.acceleration.y /* / 16384.0 */) - accelYOffset;
    accelz = ( accel.acceleration.z /* / 16384.0 */) - accelZOffset;

    gyrox = gyro.gyro.x / 131.0;
    gyroy = gyro.gyro.y / 131.0;
    gyroz = gyro.gyro.z / 131.0;

    if (SendData(accelx, accely, accelz, gyrox, gyroy, gyroz)) {
      sentData = true;
    }

    if (sentData) {
      Serial.printf("Sent gyro: %f, %f, %f; accel: %f, %f, %f\n", accel.acceleration.x, accel.acceleration.y, accel.acceleration.z, gyro.gyro.x, gyro.gyro.y, gyro.gyro.z);
    }

    sentData = false;
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
  if (mes.checkOscAddress("/imu/start")) {
    if (!accepting) 
      StartSending();
  }

  if (mes.checkOscAddress("/imu/stop")) {
    if (accepting) 
      StopSending();
  }

  if (mes.checkOscAddress("/imu/calibrate")) {
    Calibrate();
  }

  if (mes.checkOscAddressAndTypeTags("/led/set", "iiiii")) {
    Serial.println("changing leds...");

    int index = mes.nextAsInt();
    int r = mes.nextAsInt(); // 0 - 255
    int g = mes.nextAsInt(); // 0 - 255
    int b = mes.nextAsInt(); // 0 - 255
    int brightness = mes.nextAsInt(); // 0 - 100 ?

    SetLeds(index, r, g, b, brightness); 
  }

  if (mes.checkOscAddress("/led/off")) {
    Serial.println("blacking out strip...");
    Blackout();
  }

  if (mes.checkOscAddressAndTypeTags("/led/all", "iiii")) {
    int r = mes.nextAsInt(); // 0 - 255
    int g = mes.nextAsInt(); // 0 - 255
    int b = mes.nextAsInt(); // 0 - 255
    int brightness = mes.nextAsInt(); // 0 - 100 ?

    SetAll(r, g, b, brightness);
  }

  if (mes.checkOscAddressAndTypeTags("/led/set/state", "b")) {
    // blob of 90 bytes (30 sets of 3 each for RGB)
    

    for (int i = 0; i < 30; i++) {
      byte r = 
    }
  }
}

void SetAll(int red, int green, int blue, int brightness) {
  for (int i = 0; i < NUM_LEDS; i++) {
    leds[i] = CRGB(red, green, blue);
  }
  FastLED.show();
}

void SetLeds(int index, int red, int green, int blue, int brightness) {
  leds[index] = CRGB(red, green, blue);
  FastLED.show();
}

void Blackout() {
  for (int i = 0; i < NUM_LEDS; i++) {
      fill_solid(leds, NUM_LEDS, CRGB(0, 0, 0));
      FastLED.show();
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

  osc.sendFloat("/imu/gyro/x", x);
  osc.sendFloat("/imu/gyro/y", y);
  osc.sendFloat("/imu/gyro/z", z);

  return true;
}

bool SendAccelData(float x, float y, float z) {
  if (!accepting) {
    return false;
  }

  osc.sendFloat("/imu/accel/x", x);
  osc.sendFloat("/imu/accel/y", y);
  osc.sendFloat("/imu/accel/z", z);

  return true;
}

bool SendData(float accel_x, float accel_y, float accel_z, float gyro_x, float gyro_y, float gyro_z) { // send data as one blob
  if (!accepting) {
    return false;
  }

  osc.sendMessage("/imu/data", "ffffff", accel_x, accel_y, accel_z, gyro_x, gyro_y, gyro_z);

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

  xSum = 0;
  ySum = 0;
  zSum = 0;

  for (int i = 0; i < 200; i++) {
    sensors_event_t accel, gyro, temp;
    mpu.getEvent(&accel, &gyro, &temp);

    xSum += gyro.gyro.x
    ySum += gyro.gyro.y
    zSum += gyro.gyro.z;

    delay(5);
  }

  gyroXOffset = xSum / 200;
  gyroYOffset = ySum / 200;
  gyroZOffset = zSum / 200; 

  Serial.println("Done!");
}

void setupMPU() {
  // mpu.setHighPassFilter(MPU6050_HIGHPASS_0_63_HZ);
  mpu.setMotionDetectionThreshold(movementThreshold);
  mpu.setMotionDetectionDuration(movementDurationThreshold);
  mpu.setInterruptPinLatch(true);	// Keep it latched.  Will turn off when reinitialized.
  mpu.setInterruptPinPolarity(true);
  mpu.setMotionInterrupt(true);


  mpu.setAccelerometerRange(MPU6050_RANGE_16_G);
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

  mpu.setFilterBandwidth(MPU6050_BAND_21_HZ);
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