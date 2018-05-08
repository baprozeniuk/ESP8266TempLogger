EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:motors
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:ESP12-OSH
LIBS:ESP12-OSH-cache
LIBS:ESP12-OSH-rescue
LIBS:maxim
LIBS:sensors
LIBS:v0.1-cache
LIBS:ESP8266
LIBS:ds18b20board-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L HT7333 H1
U 1 1 5AD3D257
P 1750 3400
F 0 "H1" H 1950 3900 60  0000 C CNN
F 1 "HT7333" H 1850 3600 60  0000 C CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Wide" H 1750 3400 60  0001 C CNN
F 3 "" H 1750 3400 60  0001 C CNN
	1    1750 3400
	-1   0    0    1   
$EndComp
$Comp
L Conn_01x02 J1
U 1 1 5AD3D3A2
P 1650 4450
F 0 "J1" H 1650 4550 50  0000 C CNN
F 1 "BATT" H 1650 4250 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 1650 4450 50  0001 C CNN
F 3 "" H 1650 4450 50  0001 C CNN
	1    1650 4450
	0    1    1    0   
$EndComp
Text Label 2050 3450 0    60   ~ 0
VCC
Text Label 4000 2500 0    60   ~ 0
VCC
Text Label 6750 2900 0    60   ~ 0
GND
Text Label 4000 3000 0    60   ~ 0
VCC
Text Label 6750 3000 0    60   ~ 0
GND
$Comp
L R R1
U 1 1 5AD3EE3B
P 6750 2600
F 0 "R1" V 6830 2600 50  0000 C CNN
F 1 "4.7k" V 6750 2600 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 6680 2600 50  0001 C CNN
F 3 "" H 6750 2600 50  0001 C CNN
	1    6750 2600
	0    1    1    0   
$EndComp
Text Label 7550 2400 0    60   ~ 0
VCC
Text Label 7100 2600 0    60   ~ 0
GND
$Comp
L R R2
U 1 1 5AD3F42C
P 6950 1700
F 0 "R2" V 7030 1700 50  0000 C CNN
F 1 "4.7k" V 6950 1700 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 6880 1700 50  0001 C CNN
F 3 "" H 6950 1700 50  0001 C CNN
	1    6950 1700
	1    0    0    -1  
$EndComp
Text Label 6950 1450 0    60   ~ 0
VCC
$Comp
L Conn_01x02 J2
U 1 1 5AD3F795
P 6300 1350
F 0 "J2" H 6300 1450 50  0000 C CNN
F 1 "Conn_01x02" H 6300 1150 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 6300 1350 50  0001 C CNN
F 3 "" H 6300 1350 50  0001 C CNN
	1    6300 1350
	0    -1   -1   0   
$EndComp
$Comp
L Conn_01x03 J3
U 1 1 5AD3FB10
P 7900 1850
F 0 "J3" H 7900 2050 50  0000 C CNN
F 1 "CONN_DS18B20" H 7900 1650 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 7900 1850 50  0001 C CNN
F 3 "" H 7900 1850 50  0001 C CNN
	1    7900 1850
	1    0    0    -1  
$EndComp
Text Label 7550 1550 0    60   ~ 0
GND
Text Label 7550 2200 0    60   ~ 0
VCC
$Comp
L C C1
U 1 1 5AD400B9
P 1650 3300
F 0 "C1" H 1675 3400 50  0000 L CNN
F 1 "0.1uF" H 1675 3200 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D3.0mm_W1.6mm_P2.50mm" H 1688 3150 50  0001 C CNN
F 3 "" H 1650 3300 50  0001 C CNN
	1    1650 3300
	0    -1   -1   0   
$EndComp
$Comp
L C C2
U 1 1 5AD4019D
P 4300 3200
F 0 "C2" H 4325 3300 50  0000 L CNN
F 1 "100nF" H 4325 3100 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D3.0mm_W1.6mm_P2.50mm" H 4338 3050 50  0001 C CNN
F 3 "" H 4300 3200 50  0001 C CNN
	1    4300 3200
	1    0    0    -1  
$EndComp
Text Label 4300 3500 0    60   ~ 0
GND
Wire Wire Line
	4000 3000 4550 3000
Wire Wire Line
	4000 2300 4550 2300
Wire Wire Line
	4000 2600 4550 2600
Wire Wire Line
	4550 2500 4000 2500
Wire Wire Line
	6350 2900 6750 2900
Wire Wire Line
	6350 3000 6750 3000
Wire Wire Line
	6350 2600 6600 2600
Wire Wire Line
	6900 2600 7100 2600
Wire Wire Line
	6550 2600 6550 2250
Wire Wire Line
	6550 2250 6650 2250
Connection ~ 6550 2600
Wire Wire Line
	6350 2500 6450 2500
Wire Wire Line
	6450 2500 6450 1850
Wire Wire Line
	6450 1850 7700 1850
Wire Wire Line
	6950 1550 6950 1450
Wire Wire Line
	6350 2300 6350 1550
Wire Wire Line
	6350 1550 6300 1550
Wire Wire Line
	6350 2400 6400 2400
Wire Wire Line
	6400 2400 6400 1550
Wire Wire Line
	7700 1750 7550 1750
Wire Wire Line
	7550 1750 7550 1550
Wire Wire Line
	7700 1950 7550 1950
Wire Wire Line
	7550 1950 7550 2200
Wire Wire Line
	4300 3000 4300 3050
Connection ~ 4300 3000
Wire Wire Line
	4300 3350 4300 3500
$Comp
L SW_DIP_x01 SW1
U 1 1 5AD40799
P 6950 2250
F 0 "SW1" H 6950 2400 50  0000 C CNN
F 1 "SW_DIP_x01" H 6950 2100 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_DIP_x1_W7.62mm_Slide" H 6950 2250 50  0001 C CNN
F 3 "" H 6950 2250 50  0001 C CNN
	1    6950 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 2250 7250 2400
Wire Wire Line
	7250 2400 7550 2400
Wire Wire Line
	1650 4250 1650 3950
Wire Wire Line
	1400 4250 1550 4250
Wire Wire Line
	1400 3300 1400 4250
Wire Wire Line
	2050 3750 1900 3750
Wire Wire Line
	2050 3300 2050 3750
Wire Wire Line
	2050 3300 1800 3300
Wire Wire Line
	1500 3300 1400 3300
Connection ~ 1400 3750
Text Label 4000 2600 0    60   ~ 0
DS
Text Label 4000 2300 0    60   ~ 0
DS
Text Label 7100 1850 0    60   ~ 0
DS18B20
Text Label 6400 1700 0    60   ~ 0
RX
Text Label 6350 1800 0    60   ~ 0
TX
Text Label 1400 4050 0    60   ~ 0
GND
Text Label 1650 4200 0    60   ~ 0
VIN
Text Label 6450 2600 0    60   ~ 0
CONF
$Comp
L ESP-12E U1
U 1 1 5AD416EA
P 5450 2600
F 0 "U1" H 5450 2500 50  0000 C CNN
F 1 "ESP-12E" H 5450 2700 50  0000 C CNN
F 2 "RF_Modules:ESP-12E" H 5450 2600 50  0001 C CNN
F 3 "" H 5450 2600 50  0001 C CNN
	1    5450 2600
	1    0    0    -1  
$EndComp
$EndSCHEMATC
