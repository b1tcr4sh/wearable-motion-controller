Adafruit_MPU6050 mpu;

float vector_offset = 0;
float vector_velocity = 0;

float prev_vector = 0;


void GetImuData(float &accelx, float &accely, float &accelz, float &gyrox, float &gyroy, float &gyroz, float &vector, float &vector_delta, float &vector_velocity) {  
  sensors_event_t a, g, t;
  mpu.getEvent(&a, &g, &t);

  accelx = (a.acceleration.x); //- accelXOffset; // meters per second ^2 (meters per second per second)
  accely = (a.acceleration.y); //- accelYOffset;
  accelz = (a.acceleration.z); //- accelZOffset;

  gyrox = (g.gyro.x /* / 131.0 */); //- gyroXOffset; // radians per second ^2
  gyroy = (g.gyro.y /* / 131.0 */); //- gyroYOffset;
  gyroz = (g.gyro.z /* / 131.0 */); //- gyroZOffset;

  vector = CalculatePythagoreanVector(accelx, accely, accelz) - vector_offset;
  vector_delta = vector - prev_vector;

  prev_vector = vector;
  vector_velocity = max(0, vector_velocity + vector * 30); // calc velocity from equation of motion using 30 ms time frame (that's our delay time so it'll be close enough). also we don't want negative velocity values
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

void SetupMPU() {
   if (!mpu.begin()) {
    Serial.println("Failed to find MPU6050 chip");
    return;
  }
  Serial.println("MPU6050 Found!");


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