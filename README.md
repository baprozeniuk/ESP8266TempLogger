# ESP8266TempLogger
Designed and tested on a Lolin NodeMCU V3

# Data Format
Temperature is sent in a single UDP packet to a configurable host and port.
First 6 bytes contain the MAC address of the ESP8266 as a unique identifier
Seconds 2 bytes contain a 16bit unsigned integer to identify the sensor. Multiple Sensors are not yet supported, so this value is always 0x0000
Final 4 bytes contain a 32 bit floating point value from the sensor in Celsius 

# Configuration
The WiFi network configured in the ESP8266 EEPROM will be used by default. If you have previously programmed the microcontroller, the reset config switch should be activated on first boot. If you use an existing configured WiFi network without entering config mode the server and port will be set to random values (most likely null) from whatever is in your EEPROM.

The configuration mode is triggered either by closing the reset circuit, or if a wifi connection fails. 

Once in configuration mode, a WiFi network named "ESP8266" will be created. This network will direct you to a captive portal at 192.168.4.1. Enter your WiFi network configuration, server name and port. Make sure that the reset circuit is open before saving otherwise it will re-enter configuration mode upon reboot. 

# Parts required:
 * ESP8266 (ESP12E or ESP12F should work)
 * DS18B20 1-Wire temperature Sensor
 * 2x 4.7kΩ resistors
 * 1 switch of some type. Needs to be able to be closed for 1 durration of the program
 
 # Wiring Diagram
![schematic](/Wiring.png "Wiring Diagram")
