.MODEL SMALL
.STACK 100H
.DATA
    VAR1 DW ? 
    STR1 DB "VALID TRIANGLE $"
    STR2 DB "INVALID TRIANGLE $"
 
.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AX, 10     ; side a
    MOV BX, 30     ; side b
    MOV CX, 30     ; side c


    MOV VAR1, AX
    ADD VAR1, BX
    CMP VAR1, CX
    JLE INVALID    


    MOV VAR1, BX
    ADD VAR1, CX
    CMP VAR1, AX
    JLE INVALID


    MOV VAR1, CX
    ADD VAR1, AX
    CMP VAR1, BX
    JLE INVALID


    JMP VALID

VALID:
    MOV AH, 9
    LEA DX, STR1
    INT 21H
    JMP N        

INVALID:
    MOV AH, 9
    LEA DX, STR2
    INT 21H

N:
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
        
        
        
INVALID: MOV AH, 9
         LEA DX, STR2
         INT 21H
    
N:
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP
END MAIN