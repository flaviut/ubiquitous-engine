EESchema Schematic File Version 4
LIBS:solder-station-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 3
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 6700 700  0    50   ~ 0
43.5 gain
$Comp
L Connector_Generic:Conn_01x02 J6
U 1 1 5C652E07
P 5800 1050
F 0 "J6" H 5880 1042 50  0000 L CNN
F 1 "PWR1" H 5880 951 50  0000 L CNN
F 2 "" H 5800 1050 50  0001 C CNN
F 3 "~" H 5800 1050 50  0001 C CNN
	1    5800 1050
	1    0    0    -1  
$EndComp
$Comp
L Device:L_Core_Ferrite L4
U 1 1 5C65372F
P 4650 950
F 0 "L4" V 4472 950 50  0000 C CNN
F 1 "2.2u, 6A" V 4563 950 50  0000 C CNN
F 2 "" H 4650 950 50  0001 C CNN
F 3 "~" H 4650 950 50  0001 C CNN
	1    4650 950 
	0    1    1    0   
$EndComp
$Comp
L Device:C C28
U 1 1 5C6537CD
P 4900 1100
F 0 "C28" H 5015 1146 50  0000 L CNN
F 1 "4.7u" H 5015 1055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4938 950 50  0001 C CNN
F 3 "~" H 4900 1100 50  0001 C CNN
	1    4900 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 950  4900 950 
Text GLabel 5500 800  2    50   Output ~ 0
V_PWR1
$Comp
L Device:R R19
U 1 1 5C65435F
P 4150 950
F 0 "R19" V 3943 950 50  0000 C CNN
F 1 "15m, 1/2W" V 4034 950 50  0000 C CNN
F 2 "" V 4080 950 50  0001 C CNN
F 3 "~" H 4150 950 50  0001 C CNN
	1    4150 950 
	0    1    1    0   
$EndComp
Wire Wire Line
	4500 950  4300 950 
$Comp
L Device:C C30
U 1 1 5C6554DC
P 5750 2650
F 0 "C30" H 5865 2696 50  0000 L CNN
F 1 ".1u" H 5865 2605 50  0000 L CNN
F 2 "" H 5788 2500 50  0001 C CNN
F 3 "~" H 5750 2650 50  0001 C CNN
F 4 "35V" H 5750 2650 50  0001 C CNN "voltage"
	1    5750 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 2850 5750 2850
Wire Wire Line
	5750 2500 5750 2450
Wire Wire Line
	5750 2800 5750 2850
Wire Wire Line
	5100 2450 5750 2450
$Comp
L Device:CP C29
U 1 1 5C65757A
P 5300 1100
F 0 "C29" H 5418 1146 50  0000 L CNN
F 1 "47u" H 5418 1055 50  0000 L CNN
F 2 "" H 5338 950 50  0001 C CNN
F 3 "~" H 5300 1100 50  0001 C CNN
	1    5300 1100
	1    0    0    -1  
$EndComp
Connection ~ 4900 950 
Wire Wire Line
	5300 950  5600 950 
Connection ~ 5300 950 
Wire Wire Line
	4900 950  5300 950 
Wire Wire Line
	4900 950  4900 800 
Wire Wire Line
	4900 800  5500 800 
Connection ~ 5750 2850
Wire Wire Line
	5750 2850 6000 2850
Wire Wire Line
	6300 2650 6300 2850
Wire Wire Line
	6900 2850 6300 2850
Connection ~ 5750 2450
Wire Wire Line
	6300 2450 5750 2450
Wire Wire Line
	6900 2550 7100 2550
Connection ~ 6300 2850
$Comp
L Device:R R20
U 1 1 5C651B25
P 6150 2850
F 0 "R20" V 5943 2850 50  0000 C CNN
F 1 "12k" V 6034 2850 50  0000 C CNN
F 2 "" V 6080 2850 50  0001 C CNN
F 3 "~" H 6150 2850 50  0001 C CNN
	1    6150 2850
	0    1    1    0   
$EndComp
$Comp
L Device:R R21
U 1 1 5C651928
P 6900 2700
F 0 "R21" H 6830 2654 50  0000 R CNN
F 1 "510k" H 6830 2745 50  0000 R CNN
F 2 "" V 6830 2700 50  0001 C CNN
F 3 "~" H 6900 2700 50  0001 C CNN
	1    6900 2700
	-1   0    0    1   
$EndComp
Wire Wire Line
	4900 1250 5300 1250
Connection ~ 5300 1250
Wire Wire Line
	5300 1250 5600 1250
Wire Wire Line
	5600 1050 5600 950 
Wire Wire Line
	5600 1150 5600 1250
$Comp
L Amplifier_Operational:LM324 U10
U 1 1 5C659D9C
P 2500 1400
F 0 "U10" H 2500 1767 50  0000 C CNN
F 1 "LM324" H 2500 1676 50  0000 C CNN
F 2 "" H 2450 1500 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2902-n.pdf" H 2550 1600 50  0001 C CNN
	1    2500 1400
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM324 U10
U 2 1 5C659E04
P 2500 2100
F 0 "U10" H 2500 2467 50  0000 C CNN
F 1 "LM324" H 2500 2376 50  0000 C CNN
F 2 "" H 2450 2200 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2902-n.pdf" H 2550 2300 50  0001 C CNN
	2    2500 2100
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM324 U10
U 3 1 5C659ED1
P 2500 2700
F 0 "U10" H 2500 3067 50  0000 C CNN
F 1 "LM324" H 2500 2976 50  0000 C CNN
F 2 "" H 2450 2800 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2902-n.pdf" H 2550 2900 50  0001 C CNN
	3    2500 2700
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM324 U10
U 4 1 5C659F47
P 2500 3300
F 0 "U10" H 2500 3667 50  0000 C CNN
F 1 "LM324" H 2500 3576 50  0000 C CNN
F 2 "" H 2450 3400 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2902-n.pdf" H 2550 3500 50  0001 C CNN
	4    2500 3300
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM324 U10
U 5 1 5C659FB8
P 2400 4000
F 0 "U10" H 2358 4046 50  0000 L CNN
F 1 "LM324" H 2358 3955 50  0000 L CNN
F 2 "" H 2350 4100 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2902-n.pdf" H 2450 4200 50  0001 C CNN
	5    2400 4000
	1    0    0    -1  
$EndComp
$EndSCHEMATC
