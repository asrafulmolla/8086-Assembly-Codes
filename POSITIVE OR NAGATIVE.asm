.MODEL SMALL
.STACK 100H
.DATA 
    STR1 DB "AH IS POSITIVE$"
    STR2 DB "AH IN NAGATIVE$"
    
.CODE

MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX
    
    
    MOV AH, -19
    
    CMP AH, 0
    JS   ELSE
    
IF: MOV AH, 9
    LEA DX, STR1
    INT 21H
    JMP N
    
ELSE: MOV AH, 9
      LEA DX, STR2
      INT 21H
      
N:
    MOV AH, 4CH
    INT 21H