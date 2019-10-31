EESchema Schematic File Version 4
LIBS:BrentsController-cache
EELAYER 30 0
EELAYER END
$Descr USLedger 17000 11000
encoding utf-8
Sheet 1 1
Title "WS2812 LED Strip Controller"
Date ""
Rev "1"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Module:Arduino_Nano_v3.x A1
U 1 1 5DB47F5F
P 8500 2950
F 0 "A1" H 8500 1861 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 8500 1770 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 8650 2000 50  0001 L CNN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 8500 1950 50  0001 C CNN
	1    8500 2950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5DB4B840
P 8100 7500
F 0 "R2" H 7950 7550 50  0000 L CNN
F 1 "10k" H 7900 7450 50  0000 L CNN
F 2 "" V 8030 7500 50  0001 C CNN
F 3 "~" H 8100 7500 50  0001 C CNN
	1    8100 7500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5DB4BFCD
P 7800 7250
F 0 "R1" V 7593 7250 50  0000 C CNN
F 1 "10k" V 7684 7250 50  0000 C CNN
F 2 "" V 7730 7250 50  0001 C CNN
F 3 "~" H 7800 7250 50  0001 C CNN
	1    7800 7250
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 5DB4CA4B
P 8300 7500
F 0 "R3" H 8370 7546 50  0000 L CNN
F 1 "10k" H 8370 7455 50  0000 L CNN
F 2 "" V 8230 7500 50  0001 C CNN
F 3 "~" H 8300 7500 50  0001 C CNN
	1    8300 7500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5DB4CE1C
P 8600 7250
F 0 "R4" V 8393 7250 50  0000 C CNN
F 1 "10k" V 8484 7250 50  0000 C CNN
F 2 "" V 8530 7250 50  0001 C CNN
F 3 "~" H 8600 7250 50  0001 C CNN
	1    8600 7250
	0    1    1    0   
$EndComp
Wire Wire Line
	8300 7250 8450 7250
Connection ~ 8300 7250
Wire Wire Line
	8300 7250 8300 7350
Wire Wire Line
	7950 7250 8100 7250
Wire Wire Line
	8100 7250 8100 7350
Connection ~ 8100 7250
Wire Wire Line
	8300 8100 8200 8100
Wire Wire Line
	8100 8100 8200 8100
Connection ~ 8200 8100
$Comp
L power:GNDD #PWR0101
U 1 1 5DB601E6
P 8200 8250
F 0 "#PWR0101" H 8200 8000 50  0001 C CNN
F 1 "GNDD" H 8204 8095 50  0000 C CNN
F 2 "" H 8200 8250 50  0001 C CNN
F 3 "" H 8200 8250 50  0001 C CNN
	1    8200 8250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 8100 8200 8250
$Comp
L Device:C C2
U 1 1 5DB64AAD
P 8300 7900
F 0 "C2" H 8415 7946 50  0000 L CNN
F 1 "10nF" H 8415 7855 50  0000 L CNN
F 2 "" H 8338 7750 50  0001 C CNN
F 3 "~" H 8300 7900 50  0001 C CNN
	1    8300 7900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5DB64E7A
P 8100 7900
F 0 "C1" H 7900 7950 50  0000 L CNN
F 1 "10nF" H 7800 7850 50  0000 L CNN
F 2 "" H 8138 7750 50  0001 C CNN
F 3 "~" H 8100 7900 50  0001 C CNN
	1    8100 7900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 8100 8200 6950
Wire Wire Line
	8750 7250 9000 7250
Wire Wire Line
	9000 7250 9000 6650
Wire Wire Line
	7350 7250 7350 6600
$Comp
L power:VCC #PWR0103
U 1 1 5DB6FFA1
P 7350 6600
F 0 "#PWR0103" H 7350 6450 50  0001 C CNN
F 1 "VCC" H 7367 6773 50  0000 C CNN
F 2 "" H 7350 6600 50  0001 C CNN
F 3 "" H 7350 6600 50  0001 C CNN
	1    7350 6600
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0104
U 1 1 5DB7CF2E
P 8100 5600
F 0 "#PWR0104" H 8100 5450 50  0001 C CNN
F 1 "VCC" H 8117 5773 50  0000 C CNN
F 2 "" H 8100 5600 50  0001 C CNN
F 3 "" H 8100 5600 50  0001 C CNN
	1    8100 5600
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR0105
U 1 1 5DB8BE39
P 9400 6450
F 0 "#PWR0105" H 9400 6200 50  0001 C CNN
F 1 "GNDD" H 9404 6295 50  0000 C CNN
F 2 "" H 9400 6450 50  0001 C CNN
F 3 "" H 9400 6450 50  0001 C CNN
	1    9400 6450
	1    0    0    -1  
$EndComp
Text Label 9850 6050 2    50   ~ 0
ENC_BTN
Text Label 7650 7700 0    50   ~ 0
ENC_A
Text Label 8750 7700 2    50   ~ 0
ENC_B
$Comp
L Connector:Conn_01x04_Male J2
U 1 1 5DBA1CCF
P 12750 4700
F 0 "J2" H 12722 4582 50  0000 R CNN
F 1 "Conn_01x04_Male" H 12722 4673 50  0000 R CNN
F 2 "" H 12750 4700 50  0001 C CNN
F 3 "~" H 12750 4700 50  0001 C CNN
	1    12750 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	12950 4800 13400 4800
$Comp
L power:GNDD #PWR0106
U 1 1 5DBAB2E7
P 13400 4900
F 0 "#PWR0106" H 13400 4650 50  0001 C CNN
F 1 "GNDD" H 13550 4850 50  0000 C CNN
F 2 "" H 13400 4900 50  0001 C CNN
F 3 "" H 13400 4900 50  0001 C CNN
	1    13400 4900
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0107
U 1 1 5DBAB7A4
P 13400 4800
F 0 "#PWR0107" H 13400 4650 50  0001 C CNN
F 1 "VCC" H 13500 4850 50  0000 C CNN
F 2 "" H 13400 4800 50  0001 C CNN
F 3 "" H 13400 4800 50  0001 C CNN
	1    13400 4800
	1    0    0    -1  
$EndComp
Text Label 14250 4650 2    50   ~ 0
I2C_SDA
Text Label 14250 4550 2    50   ~ 0
I2C_SCL
Text Label 9450 3350 2    50   ~ 0
I2C_SDA
Text Label 9450 3450 2    50   ~ 0
I2C_SCL
Text Label 7550 2750 0    50   ~ 0
ENC_BTN
Text Label 7550 2550 0    50   ~ 0
ENC_A
Text Label 7550 2650 0    50   ~ 0
ENC_B
Wire Wire Line
	8000 2950 7500 2950
$Comp
L Connector:Conn_01x03_Female J3
U 1 1 5DBCF107
P 13550 2300
F 0 "J3" H 13578 2326 50  0000 L CNN
F 1 "Conn_01x03_Female" H 13578 2235 50  0000 L CNN
F 2 "" H 13550 2300 50  0001 C CNN
F 3 "~" H 13550 2300 50  0001 C CNN
	1    13550 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	13350 2200 13100 2200
Wire Wire Line
	13100 2200 13100 1850
Wire Wire Line
	13350 2400 13100 2400
Wire Wire Line
	13100 2400 13100 2850
$Comp
L power:GNDD #PWR0108
U 1 1 5DBD2D45
P 13100 2850
F 0 "#PWR0108" H 13100 2600 50  0001 C CNN
F 1 "GNDD" H 13104 2695 50  0000 C CNN
F 2 "" H 13100 2850 50  0001 C CNN
F 3 "" H 13100 2850 50  0001 C CNN
	1    13100 2850
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0109
U 1 1 5DBD4FBA
P 13100 1850
F 0 "#PWR0109" H 13100 1700 50  0001 C CNN
F 1 "VCC" H 13117 2023 50  0000 C CNN
F 2 "" H 13100 1850 50  0001 C CNN
F 3 "" H 13100 1850 50  0001 C CNN
	1    13100 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	13350 2300 12750 2300
Text Label 12750 2300 0    50   ~ 0
LED_DATA
Text Label 7500 2950 0    50   ~ 0
LED_DATA
$Comp
L power:VCC #PWR0110
U 1 1 5DBD75C4
P 8400 1800
F 0 "#PWR0110" H 8400 1650 50  0001 C CNN
F 1 "VCC" H 8417 1973 50  0000 C CNN
F 2 "" H 8400 1800 50  0001 C CNN
F 3 "" H 8400 1800 50  0001 C CNN
	1    8400 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 3950 8500 4000
Wire Wire Line
	8500 4000 8600 4000
Wire Wire Line
	8950 4000 8950 4100
Wire Wire Line
	8600 3950 8600 4000
Connection ~ 8600 4000
Wire Wire Line
	8600 4000 8950 4000
Wire Wire Line
	8400 1800 8400 1950
$Comp
L Device:CP1 C4
U 1 1 5DBEAA6F
P 12650 2550
F 0 "C4" H 12765 2596 50  0000 L CNN
F 1 "CP1" H 12765 2505 50  0000 L CNN
F 2 "" H 12650 2550 50  0001 C CNN
F 3 "~" H 12650 2550 50  0001 C CNN
	1    12650 2550
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR0112
U 1 1 5DBEB7C4
P 12650 2800
F 0 "#PWR0112" H 12650 2550 50  0001 C CNN
F 1 "GNDD" H 12654 2645 50  0000 C CNN
F 2 "" H 12650 2800 50  0001 C CNN
F 3 "" H 12650 2800 50  0001 C CNN
	1    12650 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	12650 2700 12650 2800
$Comp
L power:VCC #PWR0113
U 1 1 5DBECD71
P 12650 2250
F 0 "#PWR0113" H 12650 2100 50  0001 C CNN
F 1 "VCC" H 12667 2423 50  0000 C CNN
F 2 "" H 12650 2250 50  0001 C CNN
F 3 "" H 12650 2250 50  0001 C CNN
	1    12650 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	12650 2250 12650 2400
$Comp
L Connector:Barrel_Jack_Switch J1
U 1 1 5DB79B6A
P 2150 2200
F 0 "J1" H 2207 2517 50  0000 C CNN
F 1 "Barrel_Jack_Switch" H 2207 2426 50  0000 C CNN
F 2 "" H 2200 2160 50  0001 C CNN
F 3 "~" H 2200 2160 50  0001 C CNN
	1    2150 2200
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0114
U 1 1 5DB7C6CE
P 2600 1900
F 0 "#PWR0114" H 2600 1750 50  0001 C CNN
F 1 "VCC" H 2617 2073 50  0000 C CNN
F 2 "" H 2600 1900 50  0001 C CNN
F 3 "" H 2600 1900 50  0001 C CNN
	1    2600 1900
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR0115
U 1 1 5DB7CD69
P 2600 2550
F 0 "#PWR0115" H 2600 2300 50  0001 C CNN
F 1 "GNDD" H 2604 2395 50  0000 C CNN
F 2 "" H 2600 2550 50  0001 C CNN
F 3 "" H 2600 2550 50  0001 C CNN
	1    2600 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 2300 2600 2550
Wire Wire Line
	2450 2300 2600 2300
Wire Wire Line
	2450 2100 2600 2100
Wire Wire Line
	2600 2100 2600 1900
NoConn ~ 2450 2200
NoConn ~ 8600 1950
NoConn ~ 8700 1950
NoConn ~ 8000 2350
NoConn ~ 8000 2450
NoConn ~ 9000 2450
NoConn ~ 9000 2350
NoConn ~ 9000 2750
$Comp
L Connector:TestPoint TP3
U 1 1 5DB8E3B5
P 5850 3300
F 0 "TP3" H 5908 3418 50  0000 L CNN
F 1 "TestPoint" H 5908 3327 50  0000 L CNN
F 2 "" H 6050 3300 50  0001 C CNN
F 3 "~" H 6050 3300 50  0001 C CNN
	1    5850 3300
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP4
U 1 1 5DB8EB13
P 6350 3300
F 0 "TP4" H 6408 3418 50  0000 L CNN
F 1 "TestPoint" H 6408 3327 50  0000 L CNN
F 2 "" H 6550 3300 50  0001 C CNN
F 3 "~" H 6550 3300 50  0001 C CNN
	1    6350 3300
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP5
U 1 1 5DB8ED2F
P 6900 3300
F 0 "TP5" H 6958 3418 50  0000 L CNN
F 1 "TestPoint" H 6958 3327 50  0000 L CNN
F 2 "" H 7100 3300 50  0001 C CNN
F 3 "~" H 7100 3300 50  0001 C CNN
	1    6900 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 3450 6900 3450
Wire Wire Line
	6900 3450 6900 3300
Wire Wire Line
	8000 3550 6350 3550
Wire Wire Line
	6350 3550 6350 3300
Wire Wire Line
	8000 3650 5850 3650
Wire Wire Line
	5850 3650 5850 3300
Text Label 5900 3650 0    50   ~ 0
TP_D13
Text Label 6450 3550 0    50   ~ 0
TP_D12
Text Label 7000 3450 0    50   ~ 0
TP_D11
Wire Wire Line
	8300 6350 8300 5700
Wire Wire Line
	8300 5700 9400 5700
$Comp
L Device:C C3
U 1 1 5DBAF7CB
P 9400 6250
F 0 "C3" H 9515 6296 50  0000 L CNN
F 1 "22nF" H 9515 6205 50  0000 L CNN
F 2 "" H 9438 6100 50  0001 C CNN
F 3 "~" H 9400 6250 50  0001 C CNN
	1    9400 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 6050 9400 6100
Wire Wire Line
	9400 6400 9400 6450
Wire Wire Line
	9400 6050 9850 6050
Wire Wire Line
	9400 6100 9150 6100
Connection ~ 9400 6100
$Comp
L Device:R R5
U 1 1 5DBB6C90
P 9150 6250
F 0 "R5" H 9220 6296 50  0000 L CNN
F 1 "10k" H 9220 6205 50  0000 L CNN
F 2 "" V 9080 6250 50  0001 C CNN
F 3 "~" H 9150 6250 50  0001 C CNN
	1    9150 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 6450 9400 6450
Connection ~ 9400 6450
Wire Wire Line
	9150 6400 9150 6450
Wire Wire Line
	8100 5600 8100 6350
Wire Wire Line
	9400 5700 9400 6050
Connection ~ 9400 6050
Wire Wire Line
	8000 2650 7550 2650
Wire Wire Line
	8000 2750 7550 2750
Wire Wire Line
	8000 2550 7550 2550
Text Notes 5600 5500 0    100  ~ 0
Rotary Encoder debouncing
Text Notes 11850 4250 0    100  ~ 0
Display I2C Port\n
Text Notes 11950 1650 0    100  ~ 0
LED Output
Text Notes 6200 1900 0    100  ~ 0
Arduino Nano Controller\n
Text Notes 1900 1450 0    100  ~ 0
Power In
Wire Wire Line
	8300 6950 8300 7250
$Comp
L Device:Rotary_Encoder_Switch SW1
U 1 1 5DB49311
P 8200 6650
F 0 "SW1" H 8200 7017 50  0000 C CNN
F 1 "Rotary_Encoder_Switch" H 8200 6926 50  0000 C CNN
F 2 "" H 8050 6810 50  0001 C CNN
F 3 "~" H 8200 6910 50  0001 C CNN
	1    8200 6650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8100 6950 8100 7250
Wire Wire Line
	8100 8100 8100 8050
Wire Wire Line
	8300 8100 8300 8050
Wire Wire Line
	8300 7650 8300 7700
Wire Wire Line
	8100 7650 8100 7700
Connection ~ 8300 7700
Wire Wire Line
	8300 7700 8300 7750
Connection ~ 8100 7700
Wire Wire Line
	8100 7700 8100 7750
Wire Wire Line
	7350 7250 7650 7250
$Comp
L Connector:TestPoint TP8
U 1 1 5DC14F4C
P 9400 5700
F 0 "TP8" H 9458 5818 50  0000 L CNN
F 1 "TestPoint" H 9458 5727 50  0000 L CNN
F 2 "" H 9600 5700 50  0001 C CNN
F 3 "~" H 9600 5700 50  0001 C CNN
	1    9400 5700
	1    0    0    -1  
$EndComp
Connection ~ 9400 5700
$Comp
L Connector:TestPoint TP7
U 1 1 5DC15A6E
P 8900 7700
F 0 "TP7" H 8958 7818 50  0000 L CNN
F 1 "TestPoint" H 8958 7727 50  0000 L CNN
F 2 "" H 9100 7700 50  0001 C CNN
F 3 "~" H 9100 7700 50  0001 C CNN
	1    8900 7700
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP6
U 1 1 5DC15D7C
P 7500 7700
F 0 "TP6" H 7300 7800 50  0000 L CNN
F 1 "TestPoint" H 7100 7700 50  0000 L CNN
F 2 "" H 7700 7700 50  0001 C CNN
F 3 "~" H 7700 7700 50  0001 C CNN
	1    7500 7700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 7700 8900 7700
Wire Wire Line
	7500 7700 8100 7700
Wire Wire Line
	12950 4900 13400 4900
Wire Wire Line
	13350 4700 13350 4650
Wire Wire Line
	13350 4650 13900 4650
Wire Wire Line
	12950 4700 13350 4700
Wire Wire Line
	13350 4600 13350 4550
Wire Wire Line
	13350 4550 13650 4550
Wire Wire Line
	12950 4600 13350 4600
$Comp
L power:VCC #PWR0116
U 1 1 5DC2DE58
P 13650 4100
F 0 "#PWR0116" H 13650 3950 50  0001 C CNN
F 1 "VCC" H 13667 4273 50  0000 C CNN
F 2 "" H 13650 4100 50  0001 C CNN
F 3 "" H 13650 4100 50  0001 C CNN
	1    13650 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5DC2E716
P 13650 4350
F 0 "R6" H 13450 4400 50  0000 L CNN
F 1 "4.7k" H 13400 4300 50  0000 L CNN
F 2 "" V 13580 4350 50  0001 C CNN
F 3 "~" H 13650 4350 50  0001 C CNN
	1    13650 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 5DC2EDD3
P 13900 4350
F 0 "R7" H 13970 4396 50  0000 L CNN
F 1 "4.7k" H 13970 4305 50  0000 L CNN
F 2 "" V 13830 4350 50  0001 C CNN
F 3 "~" H 13900 4350 50  0001 C CNN
	1    13900 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	13650 4100 13650 4200
Wire Wire Line
	13650 4200 13900 4200
Connection ~ 13650 4200
Wire Wire Line
	13650 4500 13650 4550
Connection ~ 13650 4550
Wire Wire Line
	13900 4500 13900 4650
Connection ~ 13900 4650
Wire Wire Line
	13650 4550 14250 4550
Wire Wire Line
	13900 4650 14250 4650
$Comp
L Connector:TestPoint TP1
U 1 1 5DC3A7DF
P 2850 2100
F 0 "TP1" H 2908 2218 50  0000 L CNN
F 1 "TestPoint" H 2908 2127 50  0000 L CNN
F 2 "" H 3050 2100 50  0001 C CNN
F 3 "~" H 3050 2100 50  0001 C CNN
	1    2850 2100
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP2
U 1 1 5DC3B274
P 2850 2300
F 0 "TP2" H 2792 2326 50  0000 R CNN
F 1 "TestPoint" H 2792 2417 50  0000 R CNN
F 2 "" H 3050 2300 50  0001 C CNN
F 3 "~" H 3050 2300 50  0001 C CNN
	1    2850 2300
	-1   0    0    1   
$EndComp
Wire Wire Line
	2600 2300 2850 2300
Connection ~ 2600 2300
Wire Wire Line
	2600 2100 2850 2100
Connection ~ 2600 2100
$Comp
L Connector:TestPoint TP10
U 1 1 5DC40D0A
P 9650 3450
F 0 "TP10" H 9592 3476 50  0000 R CNN
F 1 "TestPoint" H 9592 3567 50  0000 R CNN
F 2 "" H 9850 3450 50  0001 C CNN
F 3 "~" H 9850 3450 50  0001 C CNN
	1    9650 3450
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP9
U 1 1 5DC41642
P 9650 3350
F 0 "TP9" H 9708 3468 50  0000 L CNN
F 1 "TestPoint" H 9708 3377 50  0000 L CNN
F 2 "" H 9850 3350 50  0001 C CNN
F 3 "~" H 9850 3350 50  0001 C CNN
	1    9650 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 3350 9650 3350
Wire Wire Line
	9000 3450 9650 3450
NoConn ~ 9000 3650
NoConn ~ 9000 3550
NoConn ~ 9000 3250
NoConn ~ 9000 3150
NoConn ~ 9000 3050
NoConn ~ 9000 2950
NoConn ~ 8000 3350
NoConn ~ 8000 3250
NoConn ~ 8000 3150
NoConn ~ 8000 3050
NoConn ~ 8000 2850
$Comp
L power:VCC #PWR0102
U 1 1 5DC59F52
P 9000 6650
F 0 "#PWR0102" H 9000 6500 50  0001 C CNN
F 1 "VCC" H 9017 6823 50  0000 C CNN
F 2 "" H 9000 6650 50  0001 C CNN
F 3 "" H 9000 6650 50  0001 C CNN
	1    9000 6650
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR0111
U 1 1 5DC5C063
P 8950 4100
F 0 "#PWR0111" H 8950 3850 50  0001 C CNN
F 1 "GNDD" H 8954 3945 50  0000 C CNN
F 2 "" H 8950 4100 50  0001 C CNN
F 3 "" H 8950 4100 50  0001 C CNN
	1    8950 4100
	1    0    0    -1  
$EndComp
$EndSCHEMATC
