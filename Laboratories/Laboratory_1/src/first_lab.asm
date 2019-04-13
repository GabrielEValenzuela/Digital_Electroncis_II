;*******************************************************************************
; TITLE : LABORATORY N�I - CALCULATOR
; PROFESSOR: MARTIN DEL BARCO			
; AUTHORs: BENSO JULIAN, VALENZUELA GABRIEL EMANUEL
; SUBJET: DIGITAL ELECTRONICS II
; INSTITUTE : FEFYN - UNC
; DATE: 04-13-2019
; VERSION: 1.0.2
; CHANGE VERSION 1.0.0 TO 1.0.2: SOLVE BUG WITH THE NEESTED LOOPS.
;
; RESUME:
; THIS ADDS TWO NUMBERS OF 4 BITS, USING PORTC, AND THE RESULT IT'S DISPLAY IN
; THE PORTD. IF THE RESULT IS GREATTER THAN 4 BITS, THE LED ON RD4 WILL SWITCH
; ON/OFF WITH A DELAY OF 1 SECOND. THE UNIQUE FORM TO COME BACK TO MAIN PROGRAM
; IT'S MAKING A RESET.
;*******************************************************************************			
#include "p16f887.inc"	;HEADER THAT CONTAINS ALL ADDRESS MEMORY DEFINED BY MI-
			;CROCHIP
    LIST P=16F887	;DEFINE THE MICROCONTROLLER TO BE USED.			
;*******************************************************************************
    ; __config 0x3FF1
 __CONFIG _CONFIG1, _FOSC_XT & _WDTE_OFF & _PWRTE_ON & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOREN_ON & _IESO_ON & _FCMEN_ON & _LVP_ON
; CONFIG2
; __config 0x3FFF
 __CONFIG _CONFIG2, _BOR4V_BOR40V & _WRT_OFF
;*****************************X*****************************
 ;INICIAR PROGRAMA
	    ORG 0X00
	    GOTO PROGRAMA
	    ORG 0X05
	    
;*****************************X*****************************
; AUXILIARES
AUX EQU 0x20
OUTPUT EQU 0x21
CONTADOR_1 EQU 0x22
CONTADOR_2 EQU 0x23
CONTADOR_3 EQU 0x24
CUENTA_0 SET D'167'
CUENTA_1 SET D'99'
CUENTA_2 SET D'19'
;CONFIGURACION DE PUERTOS (C y D); BANCOS (0,1,2,3)
 
PROGRAMA:
    BSF STATUS,RP0 ;BANCO 1 (para configurar TRISC)
    MOVLW b'11111111'
    MOVWF TRISC ; PTO_C input
    CLRF TRISD ;PTO_D output
    BCF STATUS,RP0 ; BANCO 0
AGAIN:
    CALL SUMA
    CLRW
TEST:
    BTFSS STATUS,C
    GOTO DISPLAY
    GOTO DUMMY
    GOTO TEST
DISPLAY:
    MOVLW H'0F'
    ANDWF OUTPUT
    MOVFW OUTPUT
    MOVWF PORTD
    GOTO AGAIN
	    
;*****************************X*****************************
; SUBRUTINA SUMA
SUMA:	ORG 0x20
	MOVF PORTC,W
	MOVWF AUX
	SWAPF AUX,F
	ADDWF AUX,W
	MOVWF OUTPUT
	RETURN

DELAY:
	ORG 0x30
	MOVLW CUENTA_0
	MOVWF CONTADOR_1
LAZ0	MOVLW CUENTA_1
	MOVWF CONTADOR_2
LAZ1	MOVLW CUENTA_2
	MOVWF CONTADOR_3
LAZ2	DECFSZ CONTADOR_3,F
	GOTO LAZ2
	DECFSZ CONTADOR_2,F
	GOTO LAZ1
	DECFSZ CONTADOR_1,F
	GOTO LAZ0
	RETURN
DUMMY:
	ORG 0x50
	MOVLW 0x10
	MOVWF PORTD
	BSF PORTD,RD4
	CALL DELAY
	BCF PORTD,RD4
	CALL DELAY
	GOTO DUMMY
	RETURN 
    END