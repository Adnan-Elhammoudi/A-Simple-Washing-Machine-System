#INCLUDE "P16F84A.INC"


ORG 0X00
GOTO MAIN 
MAIN

;PORTS CONFIGRATION 
BSF STATUS,RP0
MOVLW 0X3F
MOVWF TRISA
MOVLW 0X01
MOVWF TRISB
BCF STATUS,RP0
CLRF PORTB
CLRF PORTA

;CHECKIN ANY REQUEST
CHECK

BTFSC PORTA,0
GOTO  MODE1
BTFSC PORTA,1
GOTO  MODE2
BTFSC PORTA,2
GOTO  MODE3
BTFSC PORTA,3
GOTO  MODE4
BTFSC PORTA,4
GOTO  ADD_BALANCE
BTFSC PORTB,0
GOTO  SHOW_BALANCE
GOTO CHECK



MODE1
BSF PORTB,2
GOTO MAIN


MODE2
BSF PORTB,3
GOTO MAIN


MODE3
BSF PORTB,4
GOTO MAIN


MODE4
BSF PORTB,5
GOTO MAIN


ADD_BALANCE
BSF PORTB,6
GOTO MAIN

SHOW_BALANCE
BSF PORTB,7
GOTO MAIN

END