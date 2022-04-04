#INCLUDE "P16F84A.INC"
COUNTER  EQU 0X22
COUNTER1 EQU 0X23
COUNTER2 EQU 0X24
BALANCE  EQU 0X25
OP_PRC   EQU 0X26 ; PRICE OF EVERY MODE
BUSY     EQU 0X27 ;MUST BECOME 0 TO BE FREE , 1 IS BUSY
ORG 0X00
GOTO MAIN 


MAIN
;INITIAL BALANCE 5 POINTS
MOVLW 0X05
MOVWF BALANCE

;INITIALY FREE
MOVLW 0X00
MOVWF BUSY

;PORTS CONFIGURATION
BSF STATUS,RP0
MOVLW 0X00
MOVWF TRISA
MOVLW B'00111111'
MOVWF TRISB
BCF STATUS,RP0
CLRF PORTB
CLRF PORTA



CHECK
BTFSC PORTB,0
GOTO MOOD1

BTFSC PORTB,1
GOTO MOOD2

BTFSC PORTB,2
GOTO MOOD3

BTFSC PORTB,3
GOTO MOOD4

BTFSC PORTB,4
GOTO ADD_BALANCE

BTFSC PORTB,5

GOTO SHOW_BALANCE

GOTO CHECK


MOOD1 ;EVERY STAGE HAS 4 SECs DELAY , WITH TOTAL DEL = 3*4 =12 SECs

BTFSC BUSY ,0
GOTO BLINKING
MOVLW D'5'
MOVWF OP_PRC ; MODE1 OPERATION PRICE IS 5 POINTS
CALL BAL_CHK
MOVLW 0X01
MOVWF BUSY

MOOD1_STAGE1 
          movlw 4
          movwf COUNTER
one_1    decf COUNTER,1
          bsf PORTA ,0
          bsf PORTA ,1
          bsf PORTA ,2
          call DELAY_0.5_Sconed
          bcf PORTA ,0
          bcf PORTA ,1
          bcf PORTA ,2
          call DELAY_0.5_Sconed  ; APPROXIMATE 0.5 SECs
          movf COUNTER ,1
          btfss STATUS ,Z
         goto one_1
;MOOD1_STAGE2
          ;movlw 4
         ; movwf COUNTER
;two_1    decf COUNTER,1
          ;bsf PORTA ,1
          ;call DELAY_0.5_Sconed
          ;bcf PORTA ,1
          ;call DELAY_0.5_Sconed  
         ; movf COUNTER,1
          ;btfss STATUS ,Z
          ;goto one_1 
;MOOD1_STAGE3
          ;movlw 4
         ; movwf COUNTER
;three_1    decf COUNTER,1
          ;bsf PORTA ,2
          ;call DELAY_0.5_Sconed
          ;bcf PORTA ,2
          ;call DELAY_0.5_Sconed  
          ;movf COUNTER ,1
         ; btfss STATUS ,Z
         ; goto one_1  
          CLRF  BUSY

GOTO CHECK
         

MOOD2 ;EVERY STAGE HAS 3 SECs DELAY , WITH TOTAL DEL = 3*3 = 9 SECs

BTFSC BUSY ,0
GOTO BLINKING
MOVLW D'4'      ;MODE2 OPERATION PRICE IS 4 POINTS
MOVWF OP_PRC
CALL BAL_CHK
MOVLW 0X01
MOVWF BUSY

MOOD2_STAGE1 
          movlw 3
          movwf COUNTER
one_2     decf COUNTER,1
          bsf PORTA ,0
          call DELAY_0.5_Sconed
          bcf PORTA ,0
          call DELAY_0.5_Sconed  
          movf COUNTER ,1
          btfss STATUS ,Z
          goto one_2 
MOOD2_STAGE2
          movlw 3
          movwf COUNTER
two_2     decf COUNTER,1
          bsf PORTA ,1
          call DELAY_0.5_Sconed
          bcf PORTA ,1
          call DELAY_0.5_Sconed  
          movf COUNTER ,1
          btfss STATUS ,Z
          goto two_2 
MOOD2_STAGE3
          movlw 3
          movwf COUNTER
three_2     decf COUNTER,1
          bsf PORTA ,2
          call DELAY_0.5_Sconed
          bcf PORTA ,2
          call DELAY_0.5_Sconed  
          movf COUNTER ,1
          btfss STATUS ,Z
          goto three_2 
          CLRF  BUSY
GOTO CHECK
         

MOOD3 ;EVERY STAGE HAS 2 SECs DELAY , WITH TOTAL DEL = 3*2 = 6 SECs


BTFSC BUSY ,0
GOTO BLINKING
MOVLW D'3'    ;MODE3 OPERATION PRICE IS 3 POINTS
MOVWF OP_PRC
CALL BAL_CHK
MOVLW 0X01
MOVWF BUSY
MOOD3_STAGE1
          movlw 2
          movwf COUNTER
one_3     decf COUNTER,1
          bsf PORTA ,0
          call DELAY_0.5_Sconed
          bcf PORTA ,0
          call DELAY_0.5_Sconed  
          movf COUNTER ,1
          btfss STATUS ,Z
          goto one_3
MOOD3_STAGE2
          movlw 2
          movwf COUNTER
two_3   decf COUNTER,1
          bsf PORTA ,1
          call DELAY_0.5_Sconed
          bcf PORTA ,1
          call DELAY_0.5_Sconed  
          movf COUNTER ,1
          btfss STATUS ,Z
          goto two_3 
MOOD3_STAGE3
          movlw 2
          movwf COUNTER
three_3     decf COUNTER,1
          bsf PORTA ,2
          call DELAY_0.5_Sconed
          bcf PORTA ,2
          call DELAY_0.5_Sconed  
          movf COUNTER ,1
          btfss STATUS ,Z
          goto three_3
          CLRF  BUSY
GOTO CHECK
         


MOOD4 ;EVERY STAGE HAS 1 SEC DELAY , WITH TOTAL DEL = 3*1 = 3 SECs
BTFSC BUSY ,0
GOTO BLINKING
MOVLW D'2'         ;MODE4 OPERATION PRICE IS 2 POINTS
MOVWF OP_PRC
CALL BAL_CHK
MOVLW 0X01
MOVWF BUSY

MOOD4_STAGE1
          movlw 1
          movwf COUNTER
one_4    decf COUNTER,1
          bsf PORTA ,0
          call DELAY_0.5_Sconed
          bcf PORTA ,0
          call DELAY_0.5_Sconed  
          movf COUNTER ,1
          btfss STATUS ,Z
          goto one_4 
MOOD4_STAGE2
          movlw 1
          movwf COUNTER
two_4      decf COUNTER,1
          bsf PORTA ,1
          call DELAY_0.5_Sconed
          bcf PORTA ,1
          call DELAY_0.5_Sconed  
          movf COUNTER ,1
          btfss STATUS ,Z
          goto two_4 
MOOD4_STAGE3
          movlw 1
          movwf COUNTER
three_4      decf COUNTER,1
          bsf PORTA ,2
          call DELAY_0.5_Sconed
          bcf PORTA ,2
          call DELAY_0.5_Sconed  
          movf COUNTER ,1
          btfss STATUS ,Z
          goto three_4 
          CLRF  BUSY
GOTO CHECK
         


ADD_BALANCE
BTFSC BUSY ,0
GOTO BLINKING
MOVLW 0X0A
ADDWF BALANCE,1

GOTO CHECK

SHOW_BALANCE
MOVLW 0X0F
SUBWF BALANCE,0
BTFSS STATUS,C 
GOTO LABEL1
BSF PORTA,3 ;IF MORE THAN 15 POINTS, BLINK '1111'
BSF PORTA,4
BSF PORTB,6
BSF PORTB,7
CALL DELAY_0.5_Sconed
CALL DELAY_0.5_Sconed
CALL DELAY_0.5_Sconed
CALL DELAY_0.5_Sconed
BCF PORTA,3
BCF PORTA,4
BCF PORTB,6
BCF PORTB,7
GOTO CHECK
LABEL1
BTFSC BALANCE,0
BSF PORTA,3
BTFSC BALANCE,1
BSF PORTA,4
BTFSC BALANCE,2
BSF PORTB,6
BTFSC BALANCE,3
BSF PORTB,7
CALL DELAY_0.5_Sconed
CALL DELAY_0.5_Sconed
CALL DELAY_0.5_Sconed
CALL DELAY_0.5_Sconed
CLRF PORTA
CLRF PORTB

GOTO CHECK

BAL_CHK
MOVF OP_PRC,0
SUBWF BALANCE,0
BTFSS STATUS,C
GOTO  BLINKING
MOVWF BALANCE

RETURN

BLINKING 
 
BSF PORTA,3
BSF PORTA,4
BSF PORTB,6
BSF PORTB,7
CALL DELAY_BLINKING
BCF PORTA,3
BCF PORTA,4
BCF PORTB,6
BCF PORTB,7
CALL DELAY_BLINKING
BSF PORTA,3
BSF PORTA,4
BSF PORTB,6
BSF PORTB,7
CALL DELAY_BLINKING
CLRF PORTA
CLRF PORTB


GOTO CHECK

DELAY_0.5_Sconed
movlw 0
movwf COUNTER1
movlw D'244'
movwf COUNTER2 
loop 
nop 
nop
nop
nop
nop
decfsz COUNTER1,1
goto loop
decfsz COUNTER2 ,1
goto loop 

return

DELAY_BLINKING

movlw D'244'
movwf COUNTER2 
AGAIN 
nop 
nop
nop
nop
nop
decfsz COUNTER2 ,1
goto AGAIN

return




END