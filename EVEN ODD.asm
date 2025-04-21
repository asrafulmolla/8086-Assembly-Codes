.MODEL SMALL
.STACK 100H
.DATA

    STR1 DB 'AH IS EVEN$'
    STR2 DB "AH IS ODD$"
 
 .CODE
 MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX
    
    
    MOV AH, 33

    
    TEST AH,1
    JNZ  ELSE
    
    
IF:    MOV AH, 9
       LEA DX, STR1
       INT 21H
       JMP N
    
    
ELSE:    MOV AH, 9
         LEA DX, STR2
         INT 21H
         
N:   
        MOV AH, 4CH
        INT 21H
    
MAIN ENDP
END MAIN    