#include <WiFiUdp.h>
#include <MicroOscUdp.h>

class PD { // abstraction for PD patch
  public:
    PD(MicroOscUdp<1024>* _osc, unsigned int _receivePort, unsigned int _sendPort);
    void Begin(WiFiUDP* _udp);
    bool SendGyroData(float x, float y, float z); // if accepting, send gyro data to senderAddr, sendPort
    bool SendAccelData(float x, float y, float z); // if accepting, send accel data to senderAddr, sendPort

    // void CheckForMessage() {  // must be called in loop()
    //     osc->onOscMessageReceived([](MicroOscMessage& mes) {
    //       // DO MESSAGE ADDRESS CHECKING AND ARGUMENT GETTING HERE
    //       if (mes.checkOscAddress("/esp/start")) {
    //         if (!accepting) 
    //           IPAddress addr(192, 168, 1, 1); // temp till I can figure out how to get sender ip from message

    //           thisPD->StartSending(addr);
    //       }

    //       if (mes.checkOscAddress("/esp/stop")) {
    //         if (accepting) 
    //           thisPD->StopSending();
    //       }
    //     }
    //   );
    // }

  private:
    void OscMessageParser(MicroOscMessage& receivedOscMessage);

    void StartSending(IPAddress addr) {
      senderAddr = addr; // get ip of sender and save in senderAddr
      
      osc->setDestination(addr, sendPort);

      Serial.println("_____Sending data naow....______");
      accepting = true;
    }

    void StopSending() {
      Serial.println("_____Stop data send_____");

      accepting = false;
    }

    bool accepting = false;
    IPAddress senderAddr; // array of bytes for sender's address.
    unsigned int receivePort;
    unsigned int sendPort;

    MicroOscUdp<1024>* osc = nullptr;
    WiFiUDP* udp = nullptr;
};