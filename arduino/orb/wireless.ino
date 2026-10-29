
const IPAddress destAddr(192, 168, 4, 2);
const unsigned int serverPort = 10000;
const unsigned int destPort = 12000;

WiFiUDP udp;
MicroOscUdp<1024> osc(&udp, destAddr, destPort);

bool accepting = false;

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

void SendDmpData(float x, float y, float z, float yaw, float pitch, float roll, float totalAccel, float vel) {
  if (accepting) {
    osc.sendMessage("/imu/accel", "ffffff", (float) x, (float) y, (float) z, (float) yaw, (float) pitch, (float) roll); // send raw acceleration data on all 3 axes
    osc.sendMessage("/imu/accel/vector", "ff", (float) totalAccel, (float) 0); // send calculated vector
    osc.sendMessage("/imu/velocity/vector", "f", (float) vel);
  }
}

void RegisterEventHandler() {
  osc.onOscMessageReceived(OscMessageParser); // Checks for incoming OSC messages
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