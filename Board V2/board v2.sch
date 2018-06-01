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
LIBS:battery_management
LIBS:ESP8266-12E_ESP-12E
LIBS:v0.1-cache
LIBS:ht7333-a
LIBS:TPS63001
LIBS:board v2-cache
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
L BQ297xy U4
U 1 1 5B10D3A7
P 5450 4550
F 0 "U4" H 5200 4800 50  0000 C CNN
F 1 "BQ297xy" H 5650 4300 50  0000 C CNN
F 2 "Housings_SON:WSON6_1.5x1.5mm_Pitch0.5mm" H 5450 4900 50  0001 C CNN
F 3 "" H 5200 4750 50  0001 C CNN
	1    5450 4550
	1    0    0    -1  
$EndComp
$Comp
L BQ24075 U1
U 1 1 5B10D465
P 3000 4450
F 0 "U1" H 2800 5075 50  0000 R CNN
F 1 "BQ24075" H 2800 5000 50  0000 R CNN
F 2 "" H 3250 3900 50  0001 L CNN
F 3 "" H 3200 4650 50  0001 C CNN
	1    3000 4450
	1    0    0    -1  
$EndComp
$Comp
L ESP8266-12E/ESP-12E U2
U 1 1 5B10D6C2
P 3300 1900
F 0 "U2" H 2799 2622 50  0000 L BNN
F 1 "ESP8266-12E/ESP-12E" H 2799 978 50  0000 L BNN
F 2 "XCVR_ESP8266-12E/ESP-12E" H 3300 1900 50  0001 L BNN
F 3 "None" H 3300 1900 50  0001 L BNN
F 4 "" H 3300 1900 50  0001 L BNN "Field4"
F 5 "None" H 3300 1900 50  0001 L BNN "Field5"
F 6 "" H 3300 1900 50  0001 L BNN "Field6"
F 7 "Unavailable" H 3300 1900 50  0001 L BNN "Field7"
F 8 "ESP8266-12E/ESP-12E" H 3300 1900 50  0001 L BNN "Field8"
	1    3300 1900
	1    0    0    -1  
$EndComp
$Comp
L Audio-Jack-3 J2
U 1 1 5B10DC66
P 6900 1000
F 0 "J2" H 6850 1175 50  0000 C CNN
F 1 "T1" H 7000 930 50  0000 C CNN
F 2 "" H 7150 1100 50  0001 C CNN
F 3 "" H 7150 1100 50  0001 C CNN
	1    6900 1000
	-1   0    0    1   
$EndComp
$Comp
L Conn_01x02 UART1
U 1 1 5B10DD3F
P 5300 1050
F 0 "UART1" H 5300 1150 50  0000 C CNN
F 1 "Conn_01x02" H 5300 850 50  0000 C CNN
F 2 "" H 5300 1050 50  0001 C CNN
F 3 "" H 5300 1050 50  0001 C CNN
	1    5300 1050
	1    0    0    -1  
$EndComp
$Comp
L TPS63001 U3
U 1 1 5B10E49F
P 4700 3300
F 0 "U3" H 4200 3600 50  0000 L BNN
F 1 "TPS63001" H 4198 2899 50  0000 L BNN
F 2 "TPS63001" H 4700 3300 50  0001 L BNN
F 3 "None" H 4700 3300 50  0001 L BNN
F 4 "Texas Instruments" H 4700 3300 50  0001 L BNN "Field4"
F 5 "VFDFN-10 Texas Instruments" H 4700 3300 50  0001 L BNN "Field5"
F 6 "96% Buck-Boost Converter with 1.7A Current Switches 3.3V fixed Output voltage in 3x3 QFN" H 4700 3300 50  0001 L BNN "Field6"
F 7 "Unavailable" H 4700 3300 50  0001 L BNN "Field7"
F 8 "TPS63001" H 4700 3300 50  0001 L BNN "Field8"
	1    4700 3300
	1    0    0    -1  
$EndComp
$Comp
L R R9
U 1 1 5B10E847
P 4700 2300
F 0 "R9" V 4780 2300 50  0000 C CNN
F 1 "10kΩ" V 4700 2300 50  0000 C CNN
F 2 "" V 4630 2300 50  0001 C CNN
F 3 "" H 4700 2300 50  0001 C CNN
	1    4700 2300
	0    1    1    0   
$EndComp
$Comp
L R R3
U 1 1 5B10E8EC
P 2250 1400
F 0 "R3" V 2330 1400 50  0000 C CNN
F 1 "10kΩ" V 2250 1400 50  0000 C CNN
F 2 "" V 2180 1400 50  0001 C CNN
F 3 "" H 2250 1400 50  0001 C CNN
	1    2250 1400
	0    1    1    0   
$EndComp
$Comp
L SW_DIP_x01 SW1
U 1 1 5B10E96D
P 1300 2200
F 0 "SW1" H 1300 2350 50  0000 C CNN
F 1 "SW_DIP_x01" H 1300 2050 50  0000 C CNN
F 2 "" H 1300 2200 50  0001 C CNN
F 3 "" H 1300 2200 50  0001 C CNN
	1    1300 2200
	1    0    0    -1  
$EndComp
Text Label 4400 1300 0    60   ~ 0
VCC
Text Label 2300 1300 0    60   ~ 0
DeepSleep
Text Label 4050 2400 0    60   ~ 0
Deepsleep
Text Label 2100 1200 0    60   ~ 0
VCC
Text Label 4050 2600 0    60   ~ 0
GND
Text Label 4850 1050 0    60   ~ 0
TX
Text Label 4850 1150 0    60   ~ 0
RX
Text Label 4400 1600 0    60   ~ 0
TX
Text Label 2400 1500 0    60   ~ 0
RX
Text Label 5100 2300 0    60   ~ 0
GND
$Comp
L R R2
U 1 1 5B10F89D
P 1900 1950
F 0 "R2" V 1980 1950 50  0000 C CNN
F 1 "10kΩ" V 1900 1950 50  0000 C CNN
F 2 "" V 1830 1950 50  0001 C CNN
F 3 "" H 1900 1950 50  0001 C CNN
	1    1900 1950
	1    0    0    -1  
$EndComp
Text Label 1900 1700 0    60   ~ 0
VCC
$Comp
L SW_Push SW2
U 1 1 5B10FADC
P 1900 2450
F 0 "SW2" H 1950 2550 50  0000 L CNN
F 1 "Flash" H 1900 2390 50  0000 C CNN
F 2 "" H 1900 2650 50  0001 C CNN
F 3 "" H 1900 2650 50  0001 C CNN
	1    1900 2450
	0    -1   -1   0   
$EndComp
Text Label 1900 2800 0    60   ~ 0
GND
$Comp
L R R4
U 1 1 5B10FF02
P 2300 2200
F 0 "R4" V 2380 2200 50  0000 C CNN
F 1 "R" V 2300 2200 50  0000 C CNN
F 2 "" V 2230 2200 50  0001 C CNN
F 3 "" H 2300 2200 50  0001 C CNN
	1    2300 2200
	0    1    1    0   
$EndComp
Text Label 2000 2200 0    60   ~ 0
VCC
$Comp
L C C4
U 1 1 5B110143
P 4100 1150
F 0 "C4" H 4125 1250 50  0000 L CNN
F 1 "C" H 4125 1050 50  0000 L CNN
F 2 "" H 4138 1000 50  0001 C CNN
F 3 "" H 4100 1150 50  0001 C CNN
	1    4100 1150
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 5B11060C
P 1650 1950
F 0 "R1" V 1730 1950 50  0000 C CNN
F 1 "10kΩ" V 1650 1950 50  0000 C CNN
F 2 "" V 1580 1950 50  0001 C CNN
F 3 "" H 1650 1950 50  0001 C CNN
	1    1650 1950
	1    0    0    -1  
$EndComp
Text Label 1650 1700 0    60   ~ 0
GND
Text Label 850  2200 0    60   ~ 0
VCC
Text Label 2250 2400 0    60   ~ 0
OneWire
Text Label 7250 900  0    60   ~ 0
GND
Text Label 6500 1000 0    60   ~ 0
VCC
Text Label 6700 1300 0    60   ~ 0
OneWire
$Comp
L Audio-Jack-3 J3
U 1 1 5B111939
P 6900 1500
F 0 "J3" H 6850 1675 50  0000 C CNN
F 1 "T1" H 7000 1430 50  0000 C CNN
F 2 "" H 7150 1600 50  0001 C CNN
F 3 "" H 7150 1600 50  0001 C CNN
	1    6900 1500
	-1   0    0    1   
$EndComp
Text Label 7250 1400 0    60   ~ 0
GND
Text Label 6500 1500 0    60   ~ 0
VCC
Text Label 6700 1800 0    60   ~ 0
OneWire
$Comp
L Audio-Jack-3 J4
U 1 1 5B111A35
P 6900 2000
F 0 "J4" H 6850 2175 50  0000 C CNN
F 1 "T1" H 7000 1930 50  0000 C CNN
F 2 "" H 7150 2100 50  0001 C CNN
F 3 "" H 7150 2100 50  0001 C CNN
	1    6900 2000
	-1   0    0    1   
$EndComp
Text Label 7250 1900 0    60   ~ 0
GND
Text Label 6500 2000 0    60   ~ 0
VCC
Text Label 6700 2300 0    60   ~ 0
OneWire
$Comp
L Audio-Jack-3 J5
U 1 1 5B111A41
P 6900 2500
F 0 "J5" H 6850 2675 50  0000 C CNN
F 1 "T1" H 7000 2430 50  0000 C CNN
F 2 "" H 7150 2600 50  0001 C CNN
F 3 "" H 7150 2600 50  0001 C CNN
	1    6900 2500
	-1   0    0    1   
$EndComp
Text Label 7250 2400 0    60   ~ 0
GND
Text Label 6500 2500 0    60   ~ 0
VCC
Text Label 6700 2800 0    60   ~ 0
OneWire
$Comp
L Audio-Jack-3 J6
U 1 1 5B111C22
P 6900 3000
F 0 "J6" H 6850 3175 50  0000 C CNN
F 1 "T1" H 7000 2930 50  0000 C CNN
F 2 "" H 7150 3100 50  0001 C CNN
F 3 "" H 7150 3100 50  0001 C CNN
	1    6900 3000
	-1   0    0    1   
$EndComp
Text Label 7250 2900 0    60   ~ 0
GND
Text Label 6500 3000 0    60   ~ 0
VCC
Text Label 6700 3300 0    60   ~ 0
OneWire
$Comp
L Audio-Jack-3 J7
U 1 1 5B111C2E
P 6900 3500
F 0 "J7" H 6850 3675 50  0000 C CNN
F 1 "T1" H 7000 3430 50  0000 C CNN
F 2 "" H 7150 3600 50  0001 C CNN
F 3 "" H 7150 3600 50  0001 C CNN
	1    6900 3500
	-1   0    0    1   
$EndComp
Text Label 7250 3400 0    60   ~ 0
GND
Text Label 6500 3500 0    60   ~ 0
VCC
$Comp
L USB_OTG J1
U 1 1 5B112210
P 1600 4300
F 0 "J1" H 1400 4750 50  0000 L CNN
F 1 "USB_OTG" H 1400 4650 50  0000 L CNN
F 2 "" H 1750 4250 50  0001 C CNN
F 3 "" H 1750 4250 50  0001 C CNN
	1    1600 4300
	1    0    0    -1  
$EndComp
$Comp
L C_Small C1
U 1 1 5B112913
P 2050 4500
F 0 "C1" H 2060 4570 50  0000 L CNN
F 1 "4.7uf" H 2060 4420 50  0000 L CNN
F 2 "" H 2050 4500 50  0001 C CNN
F 3 "" H 2050 4500 50  0001 C CNN
	1    2050 4500
	1    0    0    -1  
$EndComp
Text Label 1700 4750 0    60   ~ 0
BGND
$Comp
L C_Small C3
U 1 1 5B112FDD
P 3800 4850
F 0 "C3" H 3810 4920 50  0000 L CNN
F 1 "4.7uf" H 3810 4770 50  0000 L CNN
F 2 "" H 3800 4850 50  0001 C CNN
F 3 "" H 3800 4850 50  0001 C CNN
	1    3800 4850
	1    0    0    -1  
$EndComp
$Comp
L R_Small R5
U 1 1 5B11353B
P 3100 5500
F 0 "R5" H 3130 5520 50  0000 L CNN
F 1 "1.18kΩ" H 3130 5460 50  0000 L CNN
F 2 "" H 3100 5500 50  0001 C CNN
F 3 "" H 3100 5500 50  0001 C CNN
	1    3100 5500
	1    0    0    -1  
$EndComp
$Comp
L R_Small R6
U 1 1 5B113773
P 3450 5600
F 0 "R6" H 3480 5620 50  0000 L CNN
F 1 "1.13kΩ" H 3480 5560 50  0000 L CNN
F 2 "" H 3450 5600 50  0001 C CNN
F 3 "" H 3450 5600 50  0001 C CNN
	1    3450 5600
	1    0    0    -1  
$EndComp
Text Label 3100 5750 0    60   ~ 0
BGND
Text Label 3450 5850 0    60   ~ 0
BGND
$Comp
L +BATT #PWR1
U 1 1 5B1153C6
P 4050 4450
F 0 "#PWR1" H 4050 4300 50  0001 C CNN
F 1 "+BATT" H 4050 4590 50  0000 C CNN
F 2 "" H 4050 4450 50  0001 C CNN
F 3 "" H 4050 4450 50  0001 C CNN
	1    4050 4450
	1    0    0    -1  
$EndComp
$Comp
L -BATT #PWR2
U 1 1 5B11540A
P 4050 4750
F 0 "#PWR2" H 4050 4600 50  0001 C CNN
F 1 "-BATT" H 4050 4890 50  0000 C CNN
F 2 "" H 4050 4750 50  0001 C CNN
F 3 "" H 4050 4750 50  0001 C CNN
	1    4050 4750
	1    0    0    -1  
$EndComp
Text Label 5600 3200 0    60   ~ 0
GND
$Comp
L L 2.2uH1
U 1 1 5B116365
P 3300 3300
F 0 "2.2uH1" V 3250 3300 50  0000 C CNN
F 1 "L" V 3375 3300 50  0000 C CNN
F 2 "" H 3300 3300 50  0001 C CNN
F 3 "" H 3300 3300 50  0001 C CNN
	1    3300 3300
	1    0    0    -1  
$EndComp
Text Label 4000 2900 0    60   ~ 0
VCC
$Comp
L R_Small R8
U 1 1 5B1172FA
P 4550 4450
F 0 "R8" H 4580 4470 50  0000 L CNN
F 1 "330Ω" H 4580 4410 50  0000 L CNN
F 2 "" H 4550 4450 50  0001 C CNN
F 3 "" H 4550 4450 50  0001 C CNN
	1    4550 4450
	1    0    0    -1  
$EndComp
$Comp
L C_Small C6
U 1 1 5B117452
P 4550 4850
F 0 "C6" H 4560 4920 50  0000 L CNN
F 1 "0.1uF" H 4560 4770 50  0000 L CNN
F 2 "" H 4550 4850 50  0001 C CNN
F 3 "" H 4550 4850 50  0001 C CNN
	1    4550 4850
	1    0    0    -1  
$EndComp
$Comp
L R_Small R10
U 1 1 5B117C13
P 5450 4150
F 0 "R10" H 5480 4170 50  0000 L CNN
F 1 "2.2kΩ" H 5480 4110 50  0000 L CNN
F 2 "" H 5450 4150 50  0001 C CNN
F 3 "" H 5450 4150 50  0001 C CNN
	1    5450 4150
	0    1    1    0   
$EndComp
$Comp
L BF245A Q1
U 1 1 5B118039
P 5950 5200
F 0 "Q1" H 6150 5275 50  0000 L CNN
F 1 "BF245A" H 6150 5200 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Molded_Narrow" H 6150 5125 50  0001 L CIN
F 3 "" H 5950 5150 50  0001 L CNN
	1    5950 5200
	0    1    1    0   
$EndComp
$Comp
L BF245A Q2
U 1 1 5B1181F7
P 6600 5200
F 0 "Q2" H 6800 5275 50  0000 L CNN
F 1 "BF245A" H 6800 5200 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Molded_Narrow" H 6800 5125 50  0001 L CIN
F 3 "" H 6600 5150 50  0001 L CNN
	1    6600 5200
	0    -1   1    0   
$EndComp
$Comp
L R_Small R12
U 1 1 5B1187D9
P 6350 4300
F 0 "R12" H 6380 4320 50  0000 L CNN
F 1 "5.1MΩ" H 6380 4260 50  0000 L CNN
F 2 "" H 6350 4300 50  0001 C CNN
F 3 "" H 6350 4300 50  0001 C CNN
	1    6350 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 2400 4350 2400
Wire Wire Line
	2600 1300 2300 1300
Wire Wire Line
	4000 1300 4400 1300
Wire Wire Line
	2600 1400 2400 1400
Wire Wire Line
	2100 1400 2100 1200
Wire Wire Line
	4000 2600 4450 2600
Wire Wire Line
	5100 1050 4850 1050
Wire Wire Line
	5100 1150 4850 1150
Wire Wire Line
	4000 1600 4400 1600
Wire Wire Line
	2600 1500 2400 1500
Wire Wire Line
	3950 2300 4550 2300
Wire Wire Line
	4850 2300 5100 2300
Wire Wire Line
	2600 2100 1900 2100
Wire Wire Line
	1900 1800 1900 1700
Wire Wire Line
	1900 2100 1900 2250
Wire Wire Line
	1900 2650 1900 2800
Wire Wire Line
	2600 2200 2450 2200
Wire Wire Line
	2000 2200 2150 2200
Wire Wire Line
	4100 1000 4100 900 
Wire Wire Line
	1950 2300 2600 2300
Wire Wire Line
	1950 2200 1950 2300
Wire Wire Line
	1600 2200 1950 2200
Wire Wire Line
	1000 2200 850  2200
Wire Wire Line
	1650 2200 1650 2100
Connection ~ 1650 2200
Wire Wire Line
	1650 1800 1650 1700
Wire Wire Line
	2600 2400 2250 2400
Wire Wire Line
	7100 900  7250 900 
Wire Wire Line
	6700 1000 6500 1000
Wire Wire Line
	6700 1100 6700 1300
Wire Wire Line
	7100 1400 7250 1400
Wire Wire Line
	6700 1500 6500 1500
Wire Wire Line
	6700 1600 6700 1800
Wire Wire Line
	7100 1900 7250 1900
Wire Wire Line
	6700 2000 6500 2000
Wire Wire Line
	6700 2100 6700 2300
Wire Wire Line
	7100 2400 7250 2400
Wire Wire Line
	6700 2500 6500 2500
Wire Wire Line
	6700 2600 6700 2800
Wire Wire Line
	7100 2900 7250 2900
Wire Wire Line
	6700 3000 6500 3000
Wire Wire Line
	6700 3100 6700 3300
Wire Wire Line
	7100 3400 7250 3400
Wire Wire Line
	6700 3500 6500 3500
Wire Wire Line
	6700 3600 6700 3800
Wire Wire Line
	1600 4750 2400 4750
Wire Wire Line
	1600 4750 1600 4700
Wire Wire Line
	1900 4150 2400 4150
Wire Wire Line
	1900 4150 1900 4100
Wire Wire Line
	2050 4150 2050 4400
Connection ~ 2050 4150
Wire Wire Line
	2050 4600 2050 5200
Connection ~ 2050 4750
Wire Wire Line
	3600 4450 4350 4450
Wire Wire Line
	3600 4450 3600 4550
Wire Wire Line
	4050 4750 4050 5300
Wire Wire Line
	2050 5200 4050 5200
Wire Wire Line
	3800 4450 3800 4750
Connection ~ 3800 4450
Wire Wire Line
	3800 4950 3800 5200
Connection ~ 3800 5200
Wire Wire Line
	3100 5050 3100 5400
Wire Wire Line
	3200 5050 3200 5300
Wire Wire Line
	3200 5300 3450 5300
Wire Wire Line
	3450 5300 3450 5500
Wire Wire Line
	3100 5600 3100 5750
Wire Wire Line
	3450 5700 3450 5850
Connection ~ 4050 4450
Connection ~ 4050 4850
Wire Wire Line
	5400 3200 5600 3200
Wire Wire Line
	3300 3150 4000 3200
Wire Wire Line
	4000 3100 4000 2900
Wire Wire Line
	4000 3400 3300 3450
Wire Wire Line
	5050 4650 4550 4650
Wire Wire Line
	4550 4550 4550 4750
Wire Wire Line
	4350 4450 4350 4350
Wire Wire Line
	4350 4350 4550 4350
Connection ~ 4550 4650
Wire Wire Line
	4050 4950 5450 4950
Connection ~ 4050 4950
Wire Wire Line
	5450 4950 5450 4850
Connection ~ 4550 4950
Wire Wire Line
	5050 4450 5050 4150
Wire Wire Line
	5050 4150 5350 4150
Wire Wire Line
	6400 5300 6150 5300
Wire Wire Line
	4050 5300 5750 5300
Connection ~ 4050 5200
Wire Wire Line
	5850 4650 5950 4650
Wire Wire Line
	5950 4650 5950 5000
Wire Wire Line
	5850 4450 6600 4450
Wire Wire Line
	6600 4450 6600 5000
Wire Wire Line
	5550 4150 6800 4150
Wire Wire Line
	6800 4150 6800 5300
Wire Wire Line
	6350 4150 6350 4200
Connection ~ 6350 4150
Wire Wire Line
	6350 4400 6350 4450
Connection ~ 6350 4450
Wire Wire Line
	5950 4950 5600 4950
Wire Wire Line
	5600 4950 5600 5000
Connection ~ 5950 4950
$Comp
L R_Small R11
U 1 1 5B118EFE
P 5600 5100
F 0 "R11" H 5630 5120 50  0000 L CNN
F 1 "5.1MΩ" H 5630 5060 50  0000 L CNN
F 2 "" H 5600 5100 50  0001 C CNN
F 3 "" H 5600 5100 50  0001 C CNN
	1    5600 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 5200 5600 5300
Connection ~ 5600 5300
Wire Wire Line
	3800 3100 4000 3100
Wire Wire Line
	3800 2950 3800 3100
$Comp
L C_Small C2
U 1 1 5B119641
P 3600 2950
F 0 "C2" H 3610 3020 50  0000 L CNN
F 1 "10uf" H 3610 2870 50  0000 L CNN
F 2 "" H 3600 2950 50  0001 C CNN
F 3 "" H 3600 2950 50  0001 C CNN
	1    3600 2950
	0    1    1    0   
$EndComp
Wire Wire Line
	3800 2950 3700 2950
Wire Wire Line
	3500 2950 3400 2950
Text Label 3400 2950 0    60   ~ 0
GND
Wire Wire Line
	4000 2900 5400 2900
Wire Wire Line
	5400 2900 5400 3100
Wire Wire Line
	5500 3300 5500 3900
Wire Wire Line
	4000 3300 3750 3300
Text Label 3750 3300 0    60   ~ 0
PGND
Wire Wire Line
	4000 3500 4000 4450
Connection ~ 4000 4450
Wire Wire Line
	5500 3900 4200 3900
Wire Wire Line
	4200 3900 4200 4050
$Comp
L R_Small R7
U 1 1 5B11B01D
P 4200 4150
F 0 "R7" H 4230 4170 50  0000 L CNN
F 1 "100Ω" H 4230 4110 50  0000 L CNN
F 2 "" H 4200 4150 50  0001 C CNN
F 3 "" H 4200 4150 50  0001 C CNN
	1    4200 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 4250 4200 4450
Connection ~ 4200 4450
Wire Wire Line
	5500 3300 5400 3300
Wire Wire Line
	5500 3500 5400 3500
Connection ~ 5500 3500
Wire Wire Line
	5500 3400 5650 3400
Connection ~ 5500 3400
$Comp
L C_Small C7
U 1 1 5B11D269
P 5750 3400
F 0 "C7" H 5760 3470 50  0000 L CNN
F 1 "0.1uF" V 5650 3400 50  0000 L CNN
F 2 "" H 5750 3400 50  0001 C CNN
F 3 "" H 5750 3400 50  0001 C CNN
	1    5750 3400
	0    1    1    0   
$EndComp
Wire Wire Line
	5850 3400 6000 3400
Text Label 6000 3400 0    60   ~ 0
PGND
Wire Wire Line
	4300 2750 4300 2900
Wire Wire Line
	4300 2750 4400 2750
Connection ~ 4300 2900
$Comp
L C_Small C5
U 1 1 5B11DC8A
P 4500 2750
F 0 "C5" H 4510 2820 50  0000 L CNN
F 1 "10uF" V 4400 2750 50  0000 L CNN
F 2 "" H 4500 2750 50  0001 C CNN
F 3 "" H 4500 2750 50  0001 C CNN
	1    4500 2750
	0    1    1    0   
$EndComp
Wire Wire Line
	4600 2750 4750 2750
Text Label 4750 2750 0    60   ~ 0
PGND
$EndSCHEMATC
