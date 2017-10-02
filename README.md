# ESP8266 Temperature Logger
Designed and tested on a Lolin NodeMCU V3. Sends temperature over UDP from a DS18B20 connected to an ESP8266 microcontroller.

# Data Format
Temperature is sent in a single UDP packet with a payload of 12 bytes to a configurable host and port. 
First 6 bytes contain the MAC address of the ESP8266 as a unique identifier
Second 2 bytes contain a 16 bit unsigned integer to identify the sensor. Multiple Sensors are not yet supported, so this value is always 0x0000
Final 4 bytes contain a 32 bit floating point value from the sensor in Celsius 

# Configuration
The WiFi network configured in the ESP8266 EEPROM will be used by default. If you have previously programmed the microcontroller, the reset config switch should be activated on first boot. If you have previously programmed a WiFi network and do not reset the controller the host and port will be improperly configured ad the program is likely to crash, or send no data.

The configuration mode is triggered either by closing the reset circuit, or if a wifi connection fails. 

Once in configuration mode, a WiFi network named "ESP8266" will be created. This network will direct you to a captive portal at 192.168.4.1. Enter your WiFi network configuration, server name and port. Make sure that the reset circuit is open before saving otherwise it will re-enter configuration mode upon reboot. 

# Consuming Data
An example Python script is included. 

Executing the script will listen on port 8030 for data from any sensor. When a packet is recieved it is decoded and output to the terminal as well as to a file named temperature.log. 

Another example server is located at https://github.com/andrewmacheret/temperature-sensor-server

# Build Dependencies 
 * WiFi Manager: https://github.com/tzapu/WiFiManager
 * OneWire: https://www.pjrc.com/teensy/td_libs_OneWire.html
 * ESP8266 Libraries from: https://github.com/esp8266/Arduino
 * Maxim/Dallas Temperature Library: https://github.com/milesburton/Arduino-Temperature-Control-Library

# Parts Required
 * ESP8266 (ESP12E or ESP12F should work)
 * DS18B20 1-Wire temperature Sensor
 * 2x 4.7kΩ resistors
 * 1 switch of some type. Needs to be able to be closed for 1 durration of the program
 
 # Wiring Diagram
![schematic](/Wiring.png "Wiring Diagram")
