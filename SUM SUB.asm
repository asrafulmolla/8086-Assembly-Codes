.MODEL SMALL
.STACK 100H
.DATA

.CODE 
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX 

    MOV AL, 220
    MOV BL, 31
    
    SUB AL, BL         ; AL = 22 + 31 = 53
    MOV AH, 0          ; Clear upper byte to make AX = 0053

    CALL OUT1          ; Call print procedure
    
    MOV AH, 4CH
    INT 21H
MAIN ENDP 

; OUT1: Print value in AX
OUT1 PROC
    PUSH AX
    PUSH CX
    PUSH DX

    XOR CX, CX         ; Clear digit counter

    MOV BX, 10         ; Divisor for decimal conversion

CONVERT:
    XOR DX, DX         ; Clear DX before DIV
    DIV BX             ; AX / 10 => Quotient in AX, Remainder in DX
    PUSH DX            ; Save remainder
    INC CX             ; Count digits
    CMP AX, 0
    JNE CONVERT        ; Repeat until AX == 0

PRINT_DIGITS:
    POP DX
    ADD DL, '0'        ; Convert to ASCII
    MOV AH, 2
    INT 21H
    LOOP PRINT_DIGITS

    POP DX
    POP CX
    POP AX
    RET
OUT1 ENDP

END MAIN
