#include <DNSServer.h>
#include <ESP8266WebServer.h>
#include <ESP8266WiFi.h>
#include <WiFiManager.h>
#include <OneWire.h>
#include <DallasTemperature.h>
#include <EEPROM.h>

char* computer_ip;
int computer_port;
byte mac[6];

// Data wire is plugged into pin D1 on the ESP8266 12-E - GPIO 5
#define ONE_WIRE_BUS 5
// Reset button on D2 / GPIO 4
#define TRIGGER_PIN 4
// Setup a oneWire instance to communicate with any OneWire devices (not just Maxim/Dallas temperature ICs)
OneWire oneWire(ONE_WIRE_BUS);

// Pass our oneWire reference to Dallas Temperature. 
DallasTemperature DS18B20(&oneWire);

//float tempF;
float tempC;
//char temperatureCString[6];
//boolean wifiConnected = false; // from an older version
WiFiUDP UDP;

void getTemperature();

void setup() {

  WiFi.macAddress(mac);  // get mac address for use as a serial number
  pinMode(TRIGGER_PIN, INPUT);
//  Serial.begin(74880);
//  Serial.print("\n");
//  Serial.println("Starting wifi config");
  WiFiManager wifiManager;
  
  WiFiManagerParameter server_ip("server", "server", "server", 40);
  WiFiManagerParameter server_port("port", "port", "30", 40);
  wifiManager.addParameter(&server_ip);
  wifiManager.addParameter(&server_port);

  if ( digitalRead(TRIGGER_PIN) == HIGH ) {
//    Serial.println("Reset Trigger detected, entering config mode");
      wifiManager.startConfigPortal("ESP8266");
//      Serial.println("connected...yeey :)");
    }
  else{  
    wifiManager.autoConnect("ESP8266"); //connect to saved wifi network, if connection fails enter config mode. This should probably be changed to sleep if connection fails.
  }
  computer_ip = (char*)server_ip.getValue();
  computer_port = atoi(server_port.getValue());
//  computer_ip = "10.9.9.240";
//  computer_port = 8030;
  int i;
  byte* p = (byte*) &computer_port;
  EEPROM.begin(256); //write up to 256 bytes (half of the eeprom)
  if (strcmp(computer_ip,"server") && strlen(computer_ip) < 251){ //write our new values to the eeprom, if they're not too long. We need 5 bytes for the null termination and 4 byte integer
//    Serial.println("Writing New Data to EEPROM");
    for (i = 0; i < ((strlen(computer_ip)+1)); i++){ //write hostname byte at a time
      EEPROM.write(i,computer_ip[i]);
//      Serial.println("Writing byte containing");
//      Serial.println(computer_ip[i]);
    }
    for (int j = 0;j<=3;j++){ //write port number byte at a time
    EEPROM.write((i+j), *(p+j));
//      Serial.print("Writing byte containing:");
//      Serial.println(*(p+j));
    }  
    EEPROM.commit();
  }
  else{
//    Serial.println("Reading data from EEPROM");
    char currentchar;
    i=0;
    while(currentchar != NULL) //read target host byte at a time, end when we encounter null termination
    {
      currentchar = EEPROM.read(i);
  //    Serial.println("Reading byte containing");
  //    Serial.println(currentchar);   
      computer_ip[i] = currentchar;
      i++;
    }
    for (int j=0;j<=3;j++){  //read port number byte at a time
    *(p+j)        = EEPROM.read(i+j);
    //Serial.print("Reading byte containing");
    //Serial.println(*(p+j));
    }     

  }
//  Serial.print("Target Host:");
//  Serial.println(computer_ip);
//  Serial.print("Target Port:");
//  Serial.println(computer_port);
  delay(10);
  DS18B20.begin();
  pinMode(D0,WAKEUP_PULLUP);//D0 / GPIO16 is connected to reset for deep sleep wakeup call.
}

void loop() {
  getTemperature();
  UDP.beginPacket(computer_ip,computer_port);
  for(int i = 0;i <= 5 ;i++){ //write the mac address byte at a time
    UDP.write(mac[i]);
  }
  UDP.write(0x01); //sensor ID number  
  byte *p = (byte*) &tempC; //write the temperature value byte at a time
  for (int i = 3;i >= 0;i--){
    UDP.write(p[i]);
  }
  UDP.endPacket();//send the packet
  delay(100); //delay long enough to send the packet before going to sleep
  ESP.deepSleep(5e6); //go to sleep
}

void getTemperature() {
  do {
//    Serial.println("Requesting Temp");
    DS18B20.requestTemperatures(); 
    tempC = DS18B20.getTempCByIndex(0);
    delay(100);
  } while (tempC == 85.0 || tempC == (-127.0));
}
