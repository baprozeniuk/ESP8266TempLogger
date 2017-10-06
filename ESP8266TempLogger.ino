#include <DNSServer.h>
#include <ESP8266WebServer.h>
#include <ESP8266WiFi.h>
#include <WiFiManager.h>
#include <OneWire.h>
#include <DallasTemperature.h>
#include <EEPROM.h>

#define ONE_WIRE_BUS 5 // Data wire is plugged into pin D1 (NodeMCU) on the ESP8266 12-E - GPIO 5
#define TRIGGER_PIN 4 // Reset button on D2 / GPIO 4

char* computer_ip;
int computer_port;
byte mac[6];
OneWire oneWire(ONE_WIRE_BUS); // Start a OneWire Bus
DallasTemperature DS18B20(&oneWire); // Pass our oneWire reference to Dallas Temperature. 
float tempC; //we should be able to pass this around as a reference rather than using a global. 
WiFiUDP UDP; //UDP Socket Instance
unsigned long _connectTimeout = 30000; //time out for wifi connection 1000 * seconds
uint32_t sleeptime = 5e6; //how long to sleep for in mirosecods (seconds e6)

void getTemperature();

void setup() {
  WiFi.macAddress(mac);  // get mac address for use as a serial number
  pinMode(D0,WAKEUP_PULLUP);//D0 / GPIO16 is connected to reset for deep sleep wakeup call.
  pinMode(TRIGGER_PIN, INPUT);
  //Serial.begin(74880); //enable serial output for debugging. Using this bitrate allows the bootloader messages to be readable

  WiFiManager wifiManager;
  WiFiManagerParameter server_ip("server", "server", "server", 40); 
  WiFiManagerParameter server_port("port", "port", "30", 40);
  wifiManager.addParameter(&server_ip);
  wifiManager.addParameter(&server_port);

  if ( digitalRead(TRIGGER_PIN) == HIGH ) { //enter config mode if the reset button is pushed
      wifiManager.startConfigPortal("ESP8266");
    }
  else{  
//    wifiManager.autoConnect("ESP8266"); //connect to saved wifi network, if connection fails enter config mode. This should probably be changed to sleep if connection fails.
      WiFi.mode(WIFI_STA);
      if (WiFi.SSID()) {
      ETS_UART_INTR_DISABLE(); //Pulled these 3 lines from WiFManager library: trying to fix connection in progress hanging
      wifi_station_disconnect();
      ETS_UART_INTR_ENABLE();

      WiFi.begin();
      int connRes = waitForConnectResult();
      if(connRes != WL_CONNECTED){
        ESP.deepSleep(sleeptime);
      }
     }
     else {
       wifiManager.startConfigPortal("ESP8266"); //no saved settings found, reverting to config mode
      }
  }
  computer_ip = (char*)server_ip.getValue();
  computer_port = atoi(server_port.getValue());
//  computer_ip = "10.9.9.240"; //hardcode values for testing
//  computer_port = 8030;
  int i; 
  byte* p = (byte*) &computer_port;
  EEPROM.begin(256); //write up to 256 bytes (half of the eeprom)
  if (strcmp(computer_ip,"server") && strlen(computer_ip) < 251){ //write our new values to the eeprom, if they're not too long. We need 5 bytes for the null termination and 4 byte integer
    for (i = 0; i < ((strlen(computer_ip)+1)); i++){ //write hostname byte at a time
      EEPROM.write(i,computer_ip[i]);
    }
    for (int j = 0;j<=3;j++){ //write port number byte at a time, continue from the end of the previous string
    EEPROM.write((i+j), *(p+j));
    }  
    EEPROM.commit(); //write our data from memory to EEPROM. It will stay in RAM, but its no big deal. We don't use much RAM anyway.
  }
  else{
    char currentchar;
    i=0;
    while(currentchar != NULL) //read target host byte at a time, end when we encounter null termination
    {
      currentchar = EEPROM.read(i); 
      computer_ip[i] = currentchar;
      i++;
    }
    for (int j=0;j<=3;j++){  //read port number byte at a time
      *(p+j)  = EEPROM.read(i+j);
    }     
  }
  delay(10); //not sure why we're delaying here. Need to test removing this.
  DS18B20.begin(); //start the sensor 
}

void loop() {
  getTemperature();
  UDP.beginPacket(computer_ip,computer_port);//start a new UDP packet
  for(int i = 0;i <= 5 ;i++){ //write the mac address byte at a time
    UDP.write(mac[i]);
  }
  uint16_t s = 0;
  byte *p = (byte*)&s;
  UDP.write(p[0]); //write sensor ID. Hardcoded to 0000 for now. Needs to be written byte at a time.
  UDP.write(p[1]);
  p = (byte*) &tempC; //write the temperature value byte at a time
  for (int i = 3;i >= 0;i--){
    UDP.write(p[i]);
  }
  UDP.endPacket();//send the packet
  delay(100); //delay long enough to send the packet before going to sleep. Test reducing this value, we may be able to reduce power consumption
  ESP.deepSleep(sleeptime); //go to sleep for a minute *set to 5s for testing change to 60e6 for 1 minute*
}

void getTemperature() {
  int i=0;
  do {
    DS18B20.requestTemperatures(); 
    tempC = DS18B20.getTempCByIndex(0);
    delay(100); //test reducing this value, we may be able to reduce power consumption
    if (i > 100){
      break;
    }
    i++;
  } while (tempC == 85.0 || tempC == (-127.0));
}



uint8_t waitForConnectResult() { //waits for wifi connection result. Pulled from WifiManager library.
  if (_connectTimeout == 0) {
    return WiFi.waitForConnectResult();
  } else {
    unsigned long start = millis();
    boolean keepConnecting = true;
    uint8_t status;
    while (keepConnecting) {
      status = WiFi.status();
      if (millis() > start + _connectTimeout) {
        keepConnecting = false;
      }
      if (status == WL_CONNECTED || status == WL_CONNECT_FAILED) {
        keepConnecting = false;
      }
      delay(100);
    }
    return status;
  }
}
