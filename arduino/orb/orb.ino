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

#define LED_PIN     25           // Data pin number
#define NUM_LEDS    30          // Number of LEDs
#define LED_TYPE    WS2812B     // Your LED strip type
#define COLOR_ORDER GRB         // Color channel order

CRGB leds[NUM_LEDS];

// Set these to your desired credentials.
  // You can remove the password parameter if you want the AP to be open.
  // a valid password must have more than 7 characters
const char *ssid = "orbfi";
const char *password = "eightchars";

const IPAddress destAddr(192, 168, 4, 2);
const unsigned int serverPort = 10000;
const unsigned int destPort = 12000;

WiFiUDP udp;
MicroOscUdp<1024> osc(&udp, destAddr, destPort);

MPU6050 mpu_dmp; 
int const INTERRUPT_PIN = 2;  // Define the interruption #0 pin

float velocity_vec = 0;

/*---MPU6050 Control/Status Variables---*/
bool DMPReady = false;  // Set true if DMP init was successful
uint8_t MPUIntStatus;   // Holds actual interrupt status byte from MPU
uint8_t devStatus;      // Return status after each device operation (0 = success, !0 = error)
uint16_t packetSize;    // Expected DMP packet size (default is 42 bytes)
uint8_t FIFOBuffer[64]; // FIFO storage buffer

/*---Orientation/Motion Variables---*/ 
Quaternion q;           // [w, x, y, z]         Quaternion container
VectorInt16 aa;         // [x, y, z]            Accel sensor measurements
VectorInt16 gy;         // [x, y, z]            Gyro sensor measurements
VectorInt16 aaReal;     // [x, y, z]            Gravity-free accel sensor measurements
VectorInt16 aaWorld;    // [x, y, z]            World-frame accel sensor measurements
VectorFloat gravity;    // [x, y, z]            Gravity vector
float euler[3];         // [psi, theta, phi]    Euler angle container
float ypr[3];           // [yaw, pitch, roll]   Yaw/Pitch/Roll container and gravity vector

/*------Interrupt detection routine------*/
volatile bool MPUInterrupt = false;     // Indicates whether MPU6050 interrupt pin has gone high
void DMPDataReady() {
  MPUInterrupt = true;
}

/*--------------------calibration values--------------------*/
const int usDelay = 3150; // Delay in ms to hold the sampling at 200Hz
const int NFast = 1000; // Number of quick readings for averaging, the higher the better
const int NSlow = 10000; // Number of slow readings for averaging, the higher the better
const int LinesBetweenHeaders = 5;

const int iAx = 0;
const int iAy = 1;
const int iAz = 2;
const int iGx = 3;
const int iGy = 4;
const int iGz = 5;

int LowValue[6];
int HighValue[6];
int Smoothed[6];
int LowOffset[6];
int HighOffset[6];
int Target[6];
int LinesOut;
int N;
int i;


bool accepting = false;

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
  osc.onOscMessageReceived(OscMessageParser); // Checks for incoming OSC messages

  // float accelx, accely, accelz, gyrox, gyroy, gyroz, vector, vector_delta, vector_velocity;
  // GetRawImuData(accelx, accely, accelz, gyrox, gyroy, gyroz, vector, vector_delta, vector_velocity); // get data from imu

  // SendRawImuData(accelx, accely, accelz, gyrox, gyroy, gyroz, vector, vector_delta, vector_velocity); // attempt to send imu data over osc


  float x, y, z, yaw, pitch, roll, totalAccel;
  if (accepting) {
    GetYawPitchRoll(x, y, z, yaw, pitch, roll);
    totalAccel = CalculatePythagoreanVector(x, y, z);
  }
  // float vel = GetVelocity(totalAccel);
  SendDmpData(x, y, z, yaw, pitch, roll, totalAccel);

  delay(40);
}

void SetupLED() {
  FastLED.addLeds<LED_TYPE, LED_PIN, COLOR_ORDER>(leds, NUM_LEDS);
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

void SetState(const uint8_t* data, int len) {
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

void SetupWIFI() {
  Serial.println("Configuring access point...");
  bool ret = startAP();

  if (!ret) {
    log_e("Soft AP creation failed.");
    return;
  }

  udp.begin(serverPort);
  Serial.println("Listening for OSC messages...");
}

void OscMessageParser(MicroOscMessage& mes) { //FUNCTION THAT WILL BE CALLED WHEN AN OSC MESSAGE IS RECEIVED:
  if (mes.checkOscAddress("/imu/start")) {
    StartSending();
  }

  if (mes.checkOscAddress("/imu/stop")) {
    StopSending();
  }

  if (mes.checkOscAddress("/imu/calibrate")) {
    CalibrateAxes();
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

    SetState(data, len);
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

void SendRawImuData(float accel_x, float accel_y, float accel_z, float gyro_x, float gyro_y, float gyro_z, float vector, float vector_delta, float vector_velocity) { // send data as one blob

  if (accepting) {
    osc.sendMessage("/imu/accel", "ffffff", (float) accel_x, (float) accel_y, (float) accel_z, (float) gyro_x, (float) gyro_y, (float) gyro_z); // send raw acceleration data on all 3 axes
    osc.sendMessage("/imu/accel/vector", "ff", (float) vector, (float) vector_delta); // send calculated vector
    osc.sendMessage("/imu/velocity/vector", "f", (float) vector_velocity);
  }
}

void SendDmpData(float x, float y, float z, float yaw, float pitch, float roll, float totalAccel) {
  if (accepting) {
    osc.sendMessage("/imu/accel", "ffffff", (float) x, (float) y, (float) z, (float) yaw, (float) pitch, (float) roll); // send raw acceleration data on all 3 axes
    osc.sendMessage("/imu/accel/vector", "ff", (float) totalAccel, (float) 0); // send calculated vector
    // osc.sendMessage("/imu/velocity/vector", "f", (float) vel);
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

bool SetupMPU_DMP() {
  #if I2CDEV_IMPLEMENTATION == I2CDEV_ARDUINO_WIRE
    Wire.begin();
    Wire.setClock(400000); // 400kHz I2C clock. Comment on this line if having compilation difficulties
  #elif I2CDEV_IMPLEMENTATION == I2CDEV_BUILTIN_FASTWIRE
    Fastwire::setup(400, true);
  #endif

  /*Initialize device*/
  Serial.println(F("Initializing I2C devices..."));
  mpu_dmp.initialize();
  pinMode(INTERRUPT_PIN, INPUT);

  /*Verify connection*/
  Serial.println(F("Testing MPU6050 connection..."));
  if(mpu_dmp.testConnection() == false){
    Serial.println("MPU6050 connection failed");
    while(true);
  }
  else {
    Serial.println("MPU6050 connection successful");
  }

  /* Initializate and configure the DMP*/
  Serial.println(F("Initializing DMP..."));
  devStatus = mpu_dmp.dmpInitialize();

  /* Supply your gyro offsets here, scaled for min sensitivity */
  mpu_dmp.setXGyroOffset(66);
  mpu_dmp.setYGyroOffset(-598);
  mpu_dmp.setZGyroOffset(4966);
  mpu_dmp.setXAccelOffset(130);
  mpu_dmp.setYAccelOffset(-54);
  mpu_dmp.setZAccelOffset(74);

  /* Making sure it worked (returns 0 if so) */ 
  if (devStatus == 0) {
    // mpu_dmp.CalibrateAccel(6);  // Calibration Time: generate offsets and calibrate our MPU6050
    // mpu_dmp.CalibrateGyro(6);
    Serial.println("These are the Active offsets: ");
    mpu_dmp.PrintActiveOffsets();
    Serial.println(F("Enabling DMP..."));   //Turning ON DMP
    mpu_dmp.setDMPEnabled(true);

    /*Enable Arduino interrupt detection*/
    Serial.print(F("Enabling interrupt detection (Arduino external interrupt "));
    Serial.print(digitalPinToInterrupt(INTERRUPT_PIN));
    Serial.println(F(")..."));
    attachInterrupt(digitalPinToInterrupt(INTERRUPT_PIN), DMPDataReady, RISING);
    MPUIntStatus = mpu_dmp.getIntStatus();

    /* Set the DMP Ready flag so the main loop() function knows it is okay to use it */
    Serial.println(F("DMP ready! Waiting for first interrupt..."));
    DMPReady = true;
    packetSize = mpu_dmp.dmpGetFIFOPacketSize(); //Get expected DMP packet size for later comparison
    return DMPReady;
  } 
  else {
    Serial.print(F("DMP Initialization failed (code ")); //Print the error code
    Serial.print(devStatus);
    Serial.println(F(")"));
    // 1 = initial memory load failed
    // 2 = DMP configuration updates failed
    return DMPReady;
  }
}

void GetYawPitchRoll(float &x, float &y, float &z, float &yaw, float &pitch, float &roll) {
  if (mpu_dmp.dmpGetCurrentFIFOPacket(FIFOBuffer) && DMPReady) {
    mpu_dmp.dmpGetQuaternion(&q, FIFOBuffer);
    mpu_dmp.dmpGetGravity(&gravity, &q);
    mpu_dmp.dmpGetYawPitchRoll(ypr, &q, &gravity);
    mpu_dmp.dmpGetAccel(&aa, FIFOBuffer);
    mpu_dmp.dmpGetLinearAccel(&aaReal, &aa, &gravity);
  
    yaw = ypr[0] * 180/M_PI;
    pitch = ypr[1] * 180/M_PI;
    roll = ypr[2] * 180/M_PI;

    x = aaReal.x;
    y = aaReal.y;
    z = aaReal.z;

    Serial.print("ypr\t");
    Serial.print(ypr[0] * 180/M_PI);
    Serial.print("\t");
    Serial.print(ypr[1] * 180/M_PI);
    Serial.print("\t");
    Serial.println(ypr[2] * 180/M_PI);

    Serial.print("areal\t");
    Serial.print(aaReal.x);
    Serial.print("\t");
    Serial.print(aaReal.y);
    Serial.print("\t");
    Serial.println(aaReal.z);
  }
}

float GetVelocity(float vec) {
  if (DMPReady) {
    velocity_vec = max(0, velocity_vec + vec * 30);
  }
}

float CalculatePythagoreanVector(float accel_x, float accel_y, float accel_z) {
  return sqrt(pow(accel_x, 2) + pow(accel_y, 2) + pow(accel_z, 2)); // sqrt(x^2 + y^2 + z^2) pythagorean theorem. Calculates a raw vector of acceleration
}

void CalibrateAxes() {
  
  Serial.println("\nPID tuning Each Dot = 100 readings");
  /*
  PID tuning (actually PI) works like this: changing the offset in the MPU6050 gives instant results, 
  allowing us to use the Proportional and Integral parts of the PID to find the ideal offsets. 
  The Integral uses the error from the set point (which is zero) and adds a fraction of this error to 
  the integral value. Each reading reduces the error towards the desired offset. The greater 
  the error, the more we adjust the integral value. 
  
  The Proportional part helps by filtering out noise from the integral calculation. The Derivative part is 
  not used due to noise and the sensor being stationary. With the noise removed, the integral value stabilizes 
  after about 600 readings. At the end of each set of 100 readings, the integral value is used for the actual 
  offsets, and the last proportional reading is ignored because it reacts to any noise.
  */
  Serial.println("\nXAccel\t\tYAccel\t\tZAccel\t\tXGyro\t\tYGyro\t\tZGyro");
  mpu_dmp.CalibrateAccel(6);
  mpu_dmp.CalibrateGyro(6);
  Serial.println("\n600 Readings");
  mpu_dmp.PrintActiveOffsets();
  mpu_dmp.CalibrateAccel(1);
  mpu_dmp.CalibrateGyro(1);
  Serial.println("700 Total Readings");
  mpu_dmp.PrintActiveOffsets();
  mpu_dmp.CalibrateAccel(1);
  mpu_dmp.CalibrateGyro(1);
  Serial.println("800 Total Readings");
  mpu_dmp.PrintActiveOffsets();
  mpu_dmp.CalibrateAccel(1);
  mpu_dmp.CalibrateGyro(1);
  Serial.println("900 Total Readings");
  mpu_dmp.PrintActiveOffsets();
  mpu_dmp.CalibrateAccel(1);
  mpu_dmp.CalibrateGyro(1);
  Serial.println("1000 Total Readings");
  mpu_dmp.PrintActiveOffsets();
  Serial.println("\nAny of the above offsets will work nicely \n\nProving the PID with other method:");

  for (i = iAx; i <= iGz; i++) { 
    Target[i] = 0; // Fix for ZAccel 
    HighOffset[i] = 0;
    LowOffset[i] = 0;
  } 
  Target[iAz] = 16384; // Set the taget for Z axes
  SetAveraging(NFast); // Fast averaging
  PullBracketsOut();
  PullBracketsIn();
  Serial.println("-------------- DONE --------------");
}

void SetAveraging(int NewN) {
  N = NewN;
  Serial.print("\nAveraging ");
  Serial.print(N);
  Serial.println(" readings each time");
}

void PullBracketsOut() {
  boolean Done = false;
  int NextLowOffset[6];
  int NextHighOffset[6];

  Serial.println("Expanding:");
  ForceHeader();

  while (!Done) {
    Done = true;
    SetOffsets(LowOffset); //Set low offsets
    GetSmoothed();
    for (i = 0; i <= 5; i++) { // Get low values
      LowValue[i] = Smoothed[i];
      if (LowValue[i] >= Target[i]) {
        Done = false;
        NextLowOffset[i] = LowOffset[i] - 1000;
      } 
      else {
        NextLowOffset[i] = LowOffset[i];
      }
    }
    SetOffsets(HighOffset);
    GetSmoothed();
    for (i = 0; i <= 5; i++) { // Get high values
      HighValue[i] = Smoothed[i];
      if (HighValue[i] <= Target[i]) {
        Done = false;
        NextHighOffset[i] = HighOffset[i] + 1000;
      } 
      else {
        NextHighOffset[i] = HighOffset[i];
      }
    } 
    ShowProgress();
    for (int i = 0; i <= 5; i++) {
      LowOffset[i] = NextLowOffset[i]; 
      HighOffset[i] = NextHighOffset[i];
    }
  }
}

void PullBracketsIn() {
  boolean AllBracketsNarrow;
  boolean StillWorking;
  int NewOffset[6];

  Serial.println("\nClosing in:");
  AllBracketsNarrow = false;
  ForceHeader();
  StillWorking = true;
  while (StillWorking) {
    StillWorking = false;
    if (AllBracketsNarrow && (N == NFast)) {
      SetAveraging(NSlow);
    } 
    else {
      AllBracketsNarrow = true;
    }
    for (int i = 0; i <= 5; i++) {
      if (HighOffset[i] <= (LowOffset[i] + 1)) {
        NewOffset[i] = LowOffset[i];
      } 
      else { // Binary search
        StillWorking = true;
        NewOffset[i] = (LowOffset[i] + HighOffset[i]) / 2;
        if (HighOffset[i] > (LowOffset[i] + 10)) {
          AllBracketsNarrow = false;
        }
      } 
    }
    SetOffsets(NewOffset);
    GetSmoothed();
    for (i = 0; i <= 5; i++) { // Closing in
      if (Smoothed[i] > Target[i]) { // Use lower half
        HighOffset[i] = NewOffset[i];
        HighValue[i] = Smoothed[i];
      } 
      else { // Use upper half
        LowOffset[i] = NewOffset[i];
        LowValue[i] = Smoothed[i];
      } 
    }
    ShowProgress();
  } 
} 

void ForceHeader() {
  LinesOut = 99;
}

/*Function to smooth the read values*/
void GetSmoothed() {
  int16_t RawValue[6];
  long Sums[6];
  for (i = 0; i <= 5; i++) {
    Sums[i] = 0;
  }
  
/* Get Sums*/
  for (i = 1; i <= N; i++) { 
    mpu_dmp.getMotion6( & RawValue[iAx], & RawValue[iAy], & RawValue[iAz], & RawValue[iGx], & RawValue[iGy], & RawValue[iGz]);
    delayMicroseconds(usDelay);
    for (int j = 0; j <= 5; j++){
      Sums[j] = Sums[j] + RawValue[j];
    }
  } 
  for (i = 0; i <= 5; i++) {
    Smoothed[i] = (Sums[i] + N / 2) / N;
  }
} 

/*Function for configure the oba=tained offsets*/
void SetOffsets(int TheOffsets[6]) {
  mpu_dmp.setXAccelOffset(TheOffsets[iAx]);
  mpu_dmp.setYAccelOffset(TheOffsets[iAy]);
  mpu_dmp.setZAccelOffset(TheOffsets[iAz]);
  mpu_dmp.setXGyroOffset(TheOffsets[iGx]);
  mpu_dmp.setYGyroOffset(TheOffsets[iGy]);
  mpu_dmp.setZGyroOffset(TheOffsets[iGz]);
}

/*Print the progress of the reading averages, add formatting for better visualization*/
void ShowProgress() {
 /*Header*/
  if (LinesOut >= LinesBetweenHeaders) { 
    Serial.println("\t\tXAccel\t\t\tYAccel\t\t\t\tZAccel\t\t\tXGyro\t\t\tYGyro\t\t\tZGyro");
    LinesOut = 0;
  } 
  Serial.print(' ');
  for (i = 0; i <= 5; i++) {
    Serial.print('[');
    Serial.print(LowOffset[i]),
    Serial.print(',');
    Serial.print(HighOffset[i]);
    Serial.print("] --> [");
    Serial.print(LowValue[i]);
    Serial.print(',');
    Serial.print(HighValue[i]);
    if (i == 5) {
      Serial.println("]");
    } 
    else {
      Serial.print("]\t");
    }
  }
  LinesOut++;
} 
