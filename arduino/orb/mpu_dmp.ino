// adapted from https://github.com/ElectronicCats/mpu6050/tree/master/examples/MPU6050_DMP6
// and https://github.com/ElectronicCats/mpu6050/tree/master/examples/IMU_Zero

MPU6050 mpu_dmp; 

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
  mpu_dmp.setXGyroOffset(0);
  mpu_dmp.setYGyroOffset(0);
  mpu_dmp.setZGyroOffset(0);
  mpu_dmp.setXAccelOffset(0);
  mpu_dmp.setYAccelOffset(0);
  mpu_dmp.setZAccelOffset(0);

  /* Making sure it worked (returns 0 if so) */ 
  if (devStatus == 0) {
    mpu_dmp.CalibrateAccel(6);  // Calibration Time: generate offsets and calibrate our MPU6050
    mpu_dmp.CalibrateGyro(6);
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

void GetYawPitchRoll(float &yaw, float &pitch, float &roll) {
  mpu_dmp.dmpGetQuaternion(&q, FIFOBuffer);
  mpu_dmp.dmpGetGravity(&gravity, &q);
  mpu_dmp.dmpGetYawPitchRoll(ypr, &q, &gravity);

  yaw = ypr[0] * 180/M_PI;
  pitch = ypr[1] * 180/M_PI;
  roll = ypr[2] * 180/M_PI;
}

void GetRealAccel(float &x, float &y, float &z) {
  mpu_dmp.dmpGetQuaternion(&q, FIFOBuffer);
  mpu_dmp.dmpGetAccel(&aa, FIFOBuffer);
  mpu_dmp.dmpGetGravity(&gravity, &q);
  mpu_dmp.dmpGetLinearAccel(&aaReal, &aa, &gravity);

  x = aaReal.x;
  y = aaReal.y;
  z = aaReal.z;
}

