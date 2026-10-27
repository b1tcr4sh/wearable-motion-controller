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
const char *ssid = "orbfi";
const char *password = "eightchars";

const int movementThreshold = 0.1;
const int movementDurationThreshold = 20;

const IPAddress destAddr(192, 168, 4, 2);
const unsigned int serverPort = 10000;
const unsigned int destPort = 12000;
  
bool accepting = false;

float vector_offset = 0;
float vector_velocity = 0;

bool sentData = false;

float prev_vector = 0;

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

  udp.begin(serverPort);
  Serial.println("Listening for OSC messages...");

  delay(5000);

}

void loop() {
  osc.onOscMessageReceived(OscMessageParser); // Checks for incoming OSC messages

  float accelx, accely, accelz, gyrox, gyroy, gyroz;
  
  sensors_event_t a, g, t;
  mpu.getEvent(&a, &g, &t);

  accelx = (a.acceleration.x); //- accelXOffset; // meters per second ^2 (meters per second per second)
  accely = (a.acceleration.y); //- accelYOffset;
  accelz = (a.acceleration.z); //- accelZOffset;

  gyrox = (g.gyro.x /* / 131.0 */); //- gyroXOffset; // radians per second ^2
  gyroy = (g.gyro.y /* / 131.0 */); //- gyroYOffset;
  gyroz = (g.gyro.z /* / 131.0 */); //- gyroZOffset;

  if (accepting) {
    SendData(accelx, accely, accelz, gyrox, gyroy, gyroz);

    Serial.print("AccelX:");
    Serial.print(a.acceleration.x);
    Serial.print(",");
    Serial.print("AccelY:");
    Serial.print(a.acceleration.y);
    Serial.print(",");
    Serial.print("AccelZ:");
    Serial.print(a.acceleration.z);
    Serial.print(", ");
    Serial.print("GyroX:");
    Serial.print(g.gyro.x);
    Serial.print(",");
    Serial.print("GyroY:");
    Serial.print(g.gyro.y);
    Serial.print(",");
    Serial.print("GyroZ:");
    Serial.print(g.gyro.z);
    Serial.println("");
  }

  delay(30);
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

    SetLed(index, r, g, b, brightness); 
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

  // receive blob at /led/set/state that contains some number of led states, each 3 bytes (R, G, B)
  if (mes.checkOscAddressAndTypeTags("/led/set/state", "b")) {
    const uint8_t* data; // pointer to the pointer of the first byte

    int len = mes.nextAsBlob(&data);

    Serial.printf("Got %d bytes of data on /led/set/state\n", len);

    if (data == NULL || len == 0) {
      Serial.println("There was an error receiving data on /led/set/state");
      return;
    }

    int led = 0;
    for (int i = 0; i < len - 2; i += 3) { // do for every led
      uint8_t r = *(data + i); // get first value in 3 byte chunk
      uint8_t g = *(data + i + 1); // 2nd
      uint8_t b = *(data + i + 2); // 3rd

      leds[led] = CRGB(r, g, b); // set LEDs buffer
      led++;
    }

    FastLED.show(); // then upate the strip
  }
}

void SetAll(int red, int green, int blue, int brightness) {
  for (int i = 0; i < NUM_LEDS; i++) {
    leds[i] = CRGB(red, green, blue);
  }
  FastLED.show();
}

void SetLed(int index, int red, int green, int blue, int brightness) {
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

void SendData(float accel_x, float accel_y, float accel_z, float gyro_x, float gyro_y, float gyro_z) { // send data as one blob
  float vector = CalculatePythagoreanVector(accel_x, accel_y, accel_z) - vector_offset;
  float vector_delta = vector - prev_vector;

  prev_vector = vector;
  vector_velocity = max(0, vector_velocity + vector * 30); // calc velocity from equation of motion using 30 ms time frame (that's our delay time so it'll be close enough). also we don't want negative velocity values

  osc.sendMessage("/imu/accel", "ffffff", (float) accel_x, (float) accel_y, (float) accel_z, (float) gyro_x, (float) gyro_y, (float) gyro_z); // send raw acceleration data on all 3 axes
  osc.sendMessage("/imu/accel/vector", "ff", (float) vector, (float) vector_delta); // send calculated vector
  osc.sendMessage("/imu/velocity/vector", "f", (float) vector_velocity);

}

float CalculatePythagoreanVector(float accel_x, float accel_y, float accel_z) {
  return sqrt(pow(accel_x, 2) + pow(accel_y, 2) + pow(accel_z, 2)); // sqrt(x^2 + y^2 + z^2) pythagorean theorem. Calculates a raw vector of acceleration
}

void Calibrate() { // remove gravity from vector measurement (idk how to do this for raw values yet)
  float vector_sum;

  Serial.println("Calibrating...");

  for (int i = 0; i < 200; i++) { // get and sum 200 sensor events
    sensors_event_t a, g, t;
    mpu.getEvent(&a, &g, &t);

    vector_sum += CalculatePythagoreanVector(a.acceleration.x, a.acceleration.y, a.acceleration.z);
    delay(5);
  }

  vector_offset = vector_sum / 200; // average these values to remove gravity
  vector_velocity = 0; // reset velocity to 0
  Serial.println("Done!");
}

void setupMPU() {
  // mpu.setHighPassFilter(MPU6050_HIGHPASS_0_63_HZ);
  // mpu.setMotionDetectionThreshold(movementThreshold);
  // mpu.setMotionDetectionDuration(movementDurationThreshold);
  // mpu.setInterruptPinLatch(true);	// Keep it latched.  Will turn off when reinitialized.
  // mpu.setInterruptPinPolarity(true);
  // mpu.setMotionInterrupt(true);

  mpu.setAccelerometerRange(MPU6050_RANGE_16_G);
  mpu.setGyroRange(MPU6050_RANGE_250_DEG);
  mpu.setFilterBandwidth(MPU6050_BAND_21_HZ);


  // mpu.setAccelerometerRange(MPU6050_RANGE_16_G);
  // Serial.print("Accelerometer range set to: ");
  // switch (mpu.getAccelerometerRange()) {
  // case MPU6050_RANGE_2_G:
  //   Serial.println("+-2G");
  //   break;
  // case MPU6050_RANGE_4_G:
  //   Serial.println("+-4G");
  //   break;
  // case MPU6050_RANGE_8_G:
  //   Serial.println("+-8G");
  //   break;
  // case MPU6050_RANGE_16_G:
  //   Serial.println("+-16G");
  //   break;
  // }
  // mpu.setGyroRange(MPU6050_RANGE_250_DEG);
  // Serial.print("Gyro range set to: ");
  // switch (mpu.getGyroRange()) {
  // case MPU6050_RANGE_250_DEG:
  //   Serial.println("+- 250 deg/s");
  //   break;
  // case MPU6050_RANGE_500_DEG:
  //   Serial.println("+- 500 deg/s");
  //   break;
  // case MPU6050_RANGE_1000_DEG:
  //   Serial.println("+- 1000 deg/s");
  //   break;
  // case MPU6050_RANGE_2000_DEG:
  //   Serial.println("+- 2000 deg/s");
  //   break;
  // }

  // mpu.setFilterBandwidth(MPU6050_BAND_21_HZ);
  // Serial.print("Filter bandwidth set to: ");
  // switch (mpu.getFilterBandwidth()) {
  // case MPU6050_BAND_260_HZ:
  //   Serial.println("260 Hz");
  //   break;
  // case MPU6050_BAND_184_HZ:
  //   Serial.println("184 Hz");
  //   break;
  // case MPU6050_BAND_94_HZ:
  //   Serial.println("94 Hz");
  //   break;
  // case MPU6050_BAND_44_HZ:
  //   Serial.println("44 Hz");
  //   break;
  // case MPU6050_BAND_21_HZ:
  //   Serial.println("21 Hz");
  //   break;
  // case MPU6050_BAND_10_HZ:
  //   Serial.println("10 Hz");
  //   break;
  // case MPU6050_BAND_5_HZ:
  //   Serial.println("5 Hz");
  //   break;
  // }
}