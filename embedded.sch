EESchema Schematic File Version 4
EELAYER 29 0
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
L power:+5V #PWR?
U 1 1 5CC90617
P 5050 2500
F 0 "#PWR?" H 5050 2350 50  0001 C CNN
F 1 "+5V" H 5065 2673 50  0000 C CNN
F 2 "" H 5050 2500 50  0001 C CNN
F 3 "" H 5050 2500 50  0001 C CNN
	1    5050 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 2500 5050 2650
$Comp
L power:GND #PWR?
U 1 1 5CC90D92
P 5050 5850
F 0 "#PWR?" H 5050 5600 50  0001 C CNN
F 1 "GND" H 5055 5677 50  0000 C CNN
F 2 "" H 5050 5850 50  0001 C CNN
F 3 "" H 5050 5850 50  0001 C CNN
	1    5050 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 5650 5050 5850
$Comp
L Device:Buzzer BZ
U 1 1 5CC92276
P 6450 3050
F 0 "BZ" H 6602 3079 50  0000 L CNN
F 1 "Buzzer" H 6602 2988 50  0000 L CNN
F 2 "" V 6425 3150 50  0001 C CNN
F 3 "~" V 6425 3150 50  0001 C CNN
	1    6450 3050
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:LT1083-3.6 U
U 1 1 5CC94B4C
P 7250 3300
F 0 "U" H 7250 3542 50  0000 C CNN
F 1 "LT1083-3.6" H 7250 3451 50  0000 C CNN
F 2 "" H 7250 3550 50  0001 C CIN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/1083ffe.pdf" H 7250 3300 50  0001 C CNN
	1    7250 3300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5CC95310
P 7500 3800
F 0 "#PWR?" H 7500 3550 50  0001 C CNN
F 1 "GND" H 7505 3627 50  0000 C CNN
F 2 "" H 7500 3800 50  0001 C CNN
F 3 "" H 7500 3800 50  0001 C CNN
	1    7500 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal C
U 1 1 5CC979D5
P 6050 3550
F 0 "C" H 6050 3818 50  0000 C CNN
F 1 "Crystal" H 6050 3727 50  0000 C CNN
F 2 "" H 6050 3550 50  0001 C CNN
F 3 "~" H 6050 3550 50  0001 C CNN
	1    6050 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 3550 5900 3550
$Comp
L MCU_Microchip_ATmega:ATmega88PA-PU U?
U 1 1 5CC8F542
P 5050 4150
F 0 "U?" H 4407 4196 50  0000 R CNN
F 1 "ATmega88PA-PU" H 4407 4105 50  0000 R CNN
F 2 "Package_DIP:DIP-28_W7.62mm" H 5050 4150 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/ATmega48PA_88PA_168PA-Data-Sheet-40002011A.pdf" H 5050 4150 50  0001 C CNN
	1    5050 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 3650 5900 3650
Wire Wire Line
	5900 3650 5900 3750
Wire Wire Line
	5900 3750 6300 3750
Wire Wire Line
	6300 3750 6300 3550
Wire Wire Line
	6300 3550 6200 3550
Wire Wire Line
	5650 2950 6350 2950
$Comp
L power:GND #PWR?
U 1 1 5CC9E336
P 6350 3150
F 0 "#PWR?" H 6350 2900 50  0001 C CNN
F 1 "GND" H 6355 2977 50  0000 C CNN
F 2 "" H 6350 3150 50  0001 C CNN
F 3 "" H 6350 3150 50  0001 C CNN
	1    6350 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 4750 6000 4750
$Comp
L Device:R_Small_US R1
U 1 1 5CC9FA7F
P 6000 4850
F 0 "R1" H 6068 4896 50  0000 L CNN
F 1 "1k Ohm" H 6068 4805 50  0000 L CNN
F 2 "" H 6000 4850 50  0001 C CNN
F 3 "~" H 6000 4850 50  0001 C CNN
	1    6000 4850
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R2
U 1 1 5CC9FF29
P 6000 5150
F 0 "R2" H 6068 5196 50  0000 L CNN
F 1 "2k Ohm" H 6068 5105 50  0000 L CNN
F 2 "" H 6000 5150 50  0001 C CNN
F 3 "~" H 6000 5150 50  0001 C CNN
	1    6000 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 4950 6000 5000
Wire Wire Line
	6000 5000 7050 5000
Connection ~ 6000 5000
Wire Wire Line
	6000 5000 6000 5050
Wire Wire Line
	7050 5100 6650 5100
Wire Wire Line
	6650 5100 6650 4650
Wire Wire Line
	6650 4650 5650 4650
Wire Wire Line
	7050 5200 6800 5200
$Comp
L power:GND #PWR?
U 1 1 5CCA1C39
P 6800 5200
F 0 "#PWR?" H 6800 4950 50  0001 C CNN
F 1 "GND" H 6805 5027 50  0000 C CNN
F 2 "" H 6800 5200 50  0001 C CNN
F 3 "" H 6800 5200 50  0001 C CNN
	1    6800 5200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5CCA21D8
P 6900 5650
F 0 "#PWR?" H 6900 5500 50  0001 C CNN
F 1 "+5V" H 6915 5823 50  0000 C CNN
F 2 "" H 6900 5650 50  0001 C CNN
F 3 "" H 6900 5650 50  0001 C CNN
	1    6900 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 5650 7050 5650
Wire Wire Line
	7050 5650 7050 5300
Wire Wire Line
	6550 4500 6550 3850
Wire Wire Line
	6550 3850 5650 3850
Wire Wire Line
	5650 3950 6450 3950
Wire Wire Line
	6450 3950 6450 4400
$Comp
L Device:R_Small_US R?
U 1 1 5CCA5C8A
P 5950 4150
F 0 "R?" H 6018 4196 50  0000 L CNN
F 1 "1k Ohm" H 6018 4105 50  0000 L CNN
F 2 "" H 5950 4150 50  0001 C CNN
F 3 "~" H 5950 4150 50  0001 C CNN
	1    5950 4150
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R3
U 1 1 5CCA61A1
P 6850 4250
F 0 "R3" H 6918 4296 50  0000 L CNN
F 1 "10k Ohm" H 6918 4205 50  0000 L CNN
F 2 "" H 6850 4250 50  0001 C CNN
F 3 "~" H 6850 4250 50  0001 C CNN
	1    6850 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R4
U 1 1 5CCA6A55
P 7300 4250
F 0 "R4" H 7368 4296 50  0000 L CNN
F 1 "10k Ohm" H 7368 4205 50  0000 L CNN
F 2 "" H 7300 4250 50  0001 C CNN
F 3 "~" H 7300 4250 50  0001 C CNN
	1    7300 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 4400 7300 4400
Wire Wire Line
	7300 4350 7300 4400
Connection ~ 7300 4400
Wire Wire Line
	6850 4350 6850 4500
Connection ~ 6850 4500
Wire Wire Line
	6850 4500 6550 4500
Wire Wire Line
	7300 4400 7850 4400
Wire Wire Line
	6850 4500 7850 4500
Wire Wire Line
	7850 4200 7800 4200
Wire Wire Line
	7850 4100 7800 4100
Wire Wire Line
	7750 4300 7750 4600
Wire Wire Line
	7750 4300 7850 4300
$Comp
L power:GND #PWR?
U 1 1 5CCAF719
P 7750 4600
F 0 "#PWR?" H 7750 4350 50  0001 C CNN
F 1 "GND" H 7755 4427 50  0000 C CNN
F 2 "" H 7750 4600 50  0001 C CNN
F 3 "" H 7750 4600 50  0001 C CNN
	1    7750 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 3300 7650 3300
Wire Wire Line
	7650 3300 7650 3900
Wire Wire Line
	7650 4000 7850 4000
Wire Wire Line
	7650 3900 7850 3900
Connection ~ 7650 3900
Wire Wire Line
	7650 3900 7650 4000
Wire Wire Line
	7500 3800 7850 3800
$EndSCHEMATC
