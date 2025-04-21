.MODEL SMALL
.STACK 100H
.DATA


MAIN PROC 
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AL, 5
    MOV BL, 2

    XOR AL, BL
    XOR BL, AL
    XOR AL, BL
    
    ADD AL, 30H
    ADD BL, 30H
    
    MOV AH, 2
    MOV DL, AL
    INT 21H
    
    MOV AH, 2
    MOV DL, ' '
    INT 21H
    
    MOV AH, 2
    MOV DL, BL
    INT 21H
    
    
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP
END MAIN