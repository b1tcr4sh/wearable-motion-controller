#include "PD.h"

PD::PD(MicroOscUdp<1024>* _osc, unsigned int _receivePort, unsigned int _sendPort) {
  osc = _osc;
  
  receivePort = _receivePort;
  sendPort = sendPort;
}

void PD::Begin(WiFiUDP* _udp) {
  udp = _udp;

   udp->begin(receivePort); // start udp
}

// FUNCTION THAT WILL BE CALLED WHEN AN OSC MESSAGE IS RECEIVED:
// void PD::OscMessageParser(MicroOscMessage& mes) {
//    // DO MESSAGE ADDRESS CHECKING AND ARGUMENT GETTING HERE
//   if (mes.checkOscAddress("/esp/start")) {
//     if (!accepting) 
//       IPAddress addr(192, 168, 1, 1); // temp till I can figure out how to get sender ip from message

//       StartSending(addr);
//   }

//   if (mes.checkOscAddress("/esp/stop")) {
//     if (accepting) 
//       StopSending();
//   }

// }

bool PD::SendGyroData(float x, float y, float z) {
  if (!accepting) {
    return false;
  }

  osc->sendFloat("/esp/gyro/x", x);
  osc->sendFloat("/esp/gyro/y", y);
  osc->sendFloat("/esp/gyro/z", z);

  return true;
}

bool PD::SendAccelData(float x, float y, float z) {
  if (!accepting) {
    return false;
  }

  osc->sendFloat("/esp/accel/x", x);
  osc->sendFloat("/esp/accel/y", y);
  osc->sendFloat("/esp/accel/z", z);

  return true;
}