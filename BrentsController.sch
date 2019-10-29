EESchema Schematic File Version 4
LIBS:BrentsController-cache
EELAYER 30 0
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
L MCU_Module:Arduino_Nano_v3.x A?
U 1 1 5DB47F5F
P 3750 3700
F 0 "A?" H 3750 2611 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 3750 2520 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 3900 2750 50  0001 L CNN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 3750 2700 50  0001 C CNN
	1    3750 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:Rotary_Encoder_Switch SW?
U 1 1 5DB49311
P 8750 3450
F 0 "SW?" H 8750 3817 50  0000 C CNN
F 1 "Rotary_Encoder_Switch" H 8750 3726 50  0000 C CNN
F 2 "" H 8600 3610 50  0001 C CNN
F 3 "~" H 8750 3710 50  0001 C CNN
	1    8750 3450
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5DB4B840
P 8650 4300
F 0 "R?" H 8500 4350 50  0000 L CNN
F 1 "10k" H 8500 4250 50  0000 L CNN
F 2 "" V 8580 4300 50  0001 C CNN
F 3 "~" H 8650 4300 50  0001 C CNN
	1    8650 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5DB4BFCD
P 8350 4050
F 0 "R?" V 8143 4050 50  0000 C CNN
F 1 "10k" V 8234 4050 50  0000 C CNN
F 2 "" V 8280 4050 50  0001 C CNN
F 3 "~" H 8350 4050 50  0001 C CNN
	1    8350 4050
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5DB4CA4B
P 8850 4300
F 0 "R?" H 8920 4346 50  0000 L CNN
F 1 "10k" H 8920 4255 50  0000 L CNN
F 2 "" V 8780 4300 50  0001 C CNN
F 3 "~" H 8850 4300 50  0001 C CNN
	1    8850 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5DB4CE1C
P 9150 4050
F 0 "R?" V 8943 4050 50  0000 C CNN
F 1 "10k" V 9034 4050 50  0000 C CNN
F 2 "" V 9080 4050 50  0001 C CNN
F 3 "~" H 9150 4050 50  0001 C CNN
	1    9150 4050
	0    1    1    0   
$EndComp
Wire Wire Line
	8850 3750 8850 3800
Wire Wire Line
	8850 4050 9000 4050
Connection ~ 8850 4050
Wire Wire Line
	8850 4050 8850 4150
Wire Wire Line
	8500 4050 8650 4050
Wire Wire Line
	8650 4050 8650 4150
Wire Wire Line
	8650 4050 8650 3800
Connection ~ 8650 4050
Wire Wire Line
	8850 4900 8750 4900
Wire Wire Line
	8650 4900 8750 4900
Connection ~ 8750 4900
$Comp
L power:GNDD #PWR?
U 1 1 5DB601E6
P 8750 5050
F 0 "#PWR?" H 8750 4800 50  0001 C CNN
F 1 "GNDD" H 8754 4895 50  0000 C CNN
F 2 "" H 8750 5050 50  0001 C CNN
F 3 "" H 8750 5050 50  0001 C CNN
	1    8750 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 4900 8750 5050
$Comp
L Device:C C?
U 1 1 5DB64AAD
P 8850 4600
F 0 "C?" H 8965 4646 50  0000 L CNN
F 1 "10nF" H 8965 4555 50  0000 L CNN
F 2 "" H 8888 4450 50  0001 C CNN
F 3 "~" H 8850 4600 50  0001 C CNN
	1    8850 4600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5DB64E7A
P 8650 4600
F 0 "C?" H 8450 4650 50  0000 L CNN
F 1 "10nF" H 8500 4550 50  0000 L CNN
F 2 "" H 8688 4450 50  0001 C CNN
F 3 "~" H 8650 4600 50  0001 C CNN
	1    8650 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 4750 8650 4900
Wire Wire Line
	8850 4750 8850 4900
Wire Wire Line
	8750 4900 8750 3750
Wire Wire Line
	9300 4050 9550 4050
Wire Wire Line
	9550 4050 9550 3450
$Comp
L power:VCC #PWR?
U 1 1 5DB6E3C9
P 9550 3450
F 0 "#PWR?" H 9550 3300 50  0001 C CNN
F 1 "VCC" H 9567 3623 50  0000 C CNN
F 2 "" H 9550 3450 50  0001 C CNN
F 3 "" H 9550 3450 50  0001 C CNN
	1    9550 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 4050 7450 3400
Wire Wire Line
	7450 4050 8200 4050
$Comp
L power:VCC #PWR?
U 1 1 5DB6FFA1
P 7450 3400
F 0 "#PWR?" H 7450 3250 50  0001 C CNN
F 1 "VCC" H 7467 3573 50  0000 C CNN
F 2 "" H 7450 3400 50  0001 C CNN
F 3 "" H 7450 3400 50  0001 C CNN
	1    7450 3400
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DB7CF2E
P 8650 2400
F 0 "#PWR?" H 8650 2250 50  0001 C CNN
F 1 "VCC" H 8667 2573 50  0000 C CNN
F 2 "" H 8650 2400 50  0001 C CNN
F 3 "" H 8650 2400 50  0001 C CNN
	1    8650 2400
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DB8BE39
P 9950 3250
F 0 "#PWR?" H 9950 3000 50  0001 C CNN
F 1 "GNDD" H 9954 3095 50  0000 C CNN
F 2 "" H 9950 3250 50  0001 C CNN
F 3 "" H 9950 3250 50  0001 C CNN
	1    9950 3250
	1    0    0    -1  
$EndComp
Text Label 10400 2850 2    50   ~ 0
ENC_BTN
Wire Wire Line
	8850 3800 9300 3800
Connection ~ 8850 3800
Wire Wire Line
	8850 3800 8850 4050
Wire Wire Line
	8650 3800 8250 3800
Connection ~ 8650 3800
Wire Wire Line
	8650 3800 8650 3750
Text Label 8250 3800 0    50   ~ 0
ENC_A
Text Label 9300 3800 2    50   ~ 0
ENC_B
$Comp
L Connector:Conn_01x04_Male J?
U 1 1 5DBA1CCF
P 5800 1800
F 0 "J?" H 5772 1682 50  0000 R CNN
F 1 "Conn_01x04_Male" H 5772 1773 50  0000 R CNN
F 2 "" H 5800 1800 50  0001 C CNN
F 3 "~" H 5800 1800 50  0001 C CNN
	1    5800 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 2000 6250 2000
Wire Wire Line
	6250 2000 6250 2350
Wire Wire Line
	6000 1900 6450 1900
Wire Wire Line
	6450 1900 6450 1350
Wire Wire Line
	6000 1800 6350 1800
Wire Wire Line
	6000 1700 6350 1700
$Comp
L power:GNDD #PWR?
U 1 1 5DBAB2E7
P 6250 2350
F 0 "#PWR?" H 6250 2100 50  0001 C CNN
F 1 "GNDD" H 6254 2195 50  0000 C CNN
F 2 "" H 6250 2350 50  0001 C CNN
F 3 "" H 6250 2350 50  0001 C CNN
	1    6250 2350
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DBAB7A4
P 6450 1350
F 0 "#PWR?" H 6450 1200 50  0001 C CNN
F 1 "VCC" H 6467 1523 50  0000 C CNN
F 2 "" H 6450 1350 50  0001 C CNN
F 3 "" H 6450 1350 50  0001 C CNN
	1    6450 1350
	1    0    0    -1  
$EndComp
Text Label 6350 1800 2    50   ~ 0
I2C_SDA
Text Label 6350 1700 2    50   ~ 0
I2C_SCL
Wire Wire Line
	4250 4100 4700 4100
Wire Wire Line
	4250 4200 4700 4200
Text Label 4700 4100 2    50   ~ 0
I2C_SDA
Text Label 4700 4200 2    50   ~ 0
I2C_SCL
Text Label 2800 3500 0    50   ~ 0
ENC_BTN
Text Label 2800 3300 0    50   ~ 0
ENC_A
Text Label 2800 3400 0    50   ~ 0
ENC_B
Wire Wire Line
	3250 3700 2750 3700
$Comp
L Connector:Conn_01x03_Female J?
U 1 1 5DBCF107
P 6100 3250
F 0 "J?" H 6128 3276 50  0000 L CNN
F 1 "Conn_01x03_Female" H 6128 3185 50  0000 L CNN
F 2 "" H 6100 3250 50  0001 C CNN
F 3 "~" H 6100 3250 50  0001 C CNN
	1    6100 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 3150 5650 3150
Wire Wire Line
	5650 3150 5650 2800
Wire Wire Line
	5900 3350 5650 3350
Wire Wire Line
	5650 3350 5650 3800
$Comp
L power:GNDD #PWR?
U 1 1 5DBD2D45
P 5650 3800
F 0 "#PWR?" H 5650 3550 50  0001 C CNN
F 1 "GNDD" H 5654 3645 50  0000 C CNN
F 2 "" H 5650 3800 50  0001 C CNN
F 3 "" H 5650 3800 50  0001 C CNN
	1    5650 3800
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DBD4FBA
P 5650 2800
F 0 "#PWR?" H 5650 2650 50  0001 C CNN
F 1 "VCC" H 5667 2973 50  0000 C CNN
F 2 "" H 5650 2800 50  0001 C CNN
F 3 "" H 5650 2800 50  0001 C CNN
	1    5650 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 3250 5300 3250
Text Label 5300 3250 0    50   ~ 0
LED_DATA
Text Label 2750 3700 0    50   ~ 0
LED_DATA
$Comp
L power:VCC #PWR?
U 1 1 5DBD75C4
P 3650 2550
F 0 "#PWR?" H 3650 2400 50  0001 C CNN
F 1 "VCC" H 3667 2723 50  0000 C CNN
F 2 "" H 3650 2550 50  0001 C CNN
F 3 "" H 3650 2550 50  0001 C CNN
	1    3650 2550
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DBD948C
P 4200 4850
F 0 "#PWR?" H 4200 4600 50  0001 C CNN
F 1 "GNDD" H 4204 4695 50  0000 C CNN
F 2 "" H 4200 4850 50  0001 C CNN
F 3 "" H 4200 4850 50  0001 C CNN
	1    4200 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 4700 3750 4750
Wire Wire Line
	3750 4750 3850 4750
Wire Wire Line
	4200 4750 4200 4850
Wire Wire Line
	3850 4700 3850 4750
Connection ~ 3850 4750
Wire Wire Line
	3850 4750 4200 4750
Wire Wire Line
	3650 2550 3650 2700
$Comp
L Device:CP1 C?
U 1 1 5DBEAA6F
P 5000 3250
F 0 "C?" H 5115 3296 50  0000 L CNN
F 1 "CP1" H 5115 3205 50  0000 L CNN
F 2 "" H 5000 3250 50  0001 C CNN
F 3 "~" H 5000 3250 50  0001 C CNN
	1    5000 3250
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DBEB7C4
P 5000 3500
F 0 "#PWR?" H 5000 3250 50  0001 C CNN
F 1 "GNDD" H 5004 3345 50  0000 C CNN
F 2 "" H 5000 3500 50  0001 C CNN
F 3 "" H 5000 3500 50  0001 C CNN
	1    5000 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 3400 5000 3500
$Comp
L power:VCC #PWR?
U 1 1 5DBECD71
P 5000 2950
F 0 "#PWR?" H 5000 2800 50  0001 C CNN
F 1 "VCC" H 5017 3123 50  0000 C CNN
F 2 "" H 5000 2950 50  0001 C CNN
F 3 "" H 5000 2950 50  0001 C CNN
	1    5000 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 2950 5000 3100
$Comp
L Connector:Barrel_Jack_Switch J?
U 1 1 5DB79B6A
P 1850 2400
F 0 "J?" H 1907 2717 50  0000 C CNN
F 1 "Barrel_Jack_Switch" H 1907 2626 50  0000 C CNN
F 2 "" H 1900 2360 50  0001 C CNN
F 3 "~" H 1900 2360 50  0001 C CNN
	1    1850 2400
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DB7C6CE
P 2300 2100
F 0 "#PWR?" H 2300 1950 50  0001 C CNN
F 1 "VCC" H 2317 2273 50  0000 C CNN
F 2 "" H 2300 2100 50  0001 C CNN
F 3 "" H 2300 2100 50  0001 C CNN
	1    2300 2100
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DB7CD69
P 2300 2750
F 0 "#PWR?" H 2300 2500 50  0001 C CNN
F 1 "GNDD" H 2304 2595 50  0000 C CNN
F 2 "" H 2300 2750 50  0001 C CNN
F 3 "" H 2300 2750 50  0001 C CNN
	1    2300 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 2500 2300 2750
Wire Wire Line
	2150 2500 2300 2500
Wire Wire Line
	2150 2300 2300 2300
Wire Wire Line
	2300 2300 2300 2100
NoConn ~ 2150 2400
NoConn ~ 3850 2700
NoConn ~ 3950 2700
NoConn ~ 3250 3100
NoConn ~ 3250 3200
NoConn ~ 4250 3200
NoConn ~ 4250 3100
NoConn ~ 4250 3500
$Comp
L Connector:TestPoint TP?
U 1 1 5DB8E3B5
P 1100 4050
F 0 "TP?" H 1158 4168 50  0000 L CNN
F 1 "TestPoint" H 1158 4077 50  0000 L CNN
F 2 "" H 1300 4050 50  0001 C CNN
F 3 "~" H 1300 4050 50  0001 C CNN
	1    1100 4050
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5DB8EB13
P 1600 4050
F 0 "TP?" H 1658 4168 50  0000 L CNN
F 1 "TestPoint" H 1658 4077 50  0000 L CNN
F 2 "" H 1800 4050 50  0001 C CNN
F 3 "~" H 1800 4050 50  0001 C CNN
	1    1600 4050
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5DB8ED2F
P 2150 4050
F 0 "TP?" H 2208 4168 50  0000 L CNN
F 1 "TestPoint" H 2208 4077 50  0000 L CNN
F 2 "" H 2350 4050 50  0001 C CNN
F 3 "~" H 2350 4050 50  0001 C CNN
	1    2150 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 4200 2150 4200
Wire Wire Line
	2150 4200 2150 4050
Wire Wire Line
	3250 4300 1600 4300
Wire Wire Line
	1600 4300 1600 4050
Wire Wire Line
	3250 4400 1100 4400
Wire Wire Line
	1100 4400 1100 4050
Text Label 1150 4400 0    50   ~ 0
TP_D13
Text Label 1700 4300 0    50   ~ 0
TP_D12
Text Label 2250 4200 0    50   ~ 0
TP_D11
Wire Wire Line
	8850 3150 8850 2500
Wire Wire Line
	8850 2500 9950 2500
$Comp
L Device:C C?
U 1 1 5DBAF7CB
P 9950 3050
F 0 "C?" H 10065 3096 50  0000 L CNN
F 1 "22nF" H 10065 3005 50  0000 L CNN
F 2 "" H 9988 2900 50  0001 C CNN
F 3 "~" H 9950 3050 50  0001 C CNN
	1    9950 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	9950 2850 9950 2900
Wire Wire Line
	9950 3200 9950 3250
Wire Wire Line
	9950 2850 10400 2850
Wire Wire Line
	9950 2900 9700 2900
Connection ~ 9950 2900
$Comp
L Device:R R?
U 1 1 5DBB6C90
P 9700 3050
F 0 "R?" H 9770 3096 50  0000 L CNN
F 1 "10k" H 9770 3005 50  0000 L CNN
F 2 "" V 9630 3050 50  0001 C CNN
F 3 "~" H 9700 3050 50  0001 C CNN
	1    9700 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 3250 9950 3250
Connection ~ 9950 3250
Wire Wire Line
	9700 3200 9700 3250
Wire Wire Line
	8650 2400 8650 3150
Wire Wire Line
	9950 2500 9950 2850
Connection ~ 9950 2850
Wire Wire Line
	3250 3400 2800 3400
Wire Wire Line
	3250 3500 2800 3500
Wire Wire Line
	3250 3300 2800 3300
$EndSCHEMATC
