.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 'Enter first number: $'  ; Prompt for first number
    MSG2 DB 0DH, 0AH, 'Enter second number: $'  ; Prompt for second number
    MSG3 DB 0DH, 0AH, 'Sum: $'  ; Output message
    RESULT DB ?  ; Store result

.CODE
MAIN PROC
    ; Initialize Data Segment
    MOV AX, @DATA
    MOV DS, AX
    
    ; Display first prompt
    MOV DX, OFFSET MSG1
    MOV AH, 09H
    INT 21H
    
    ; Read first number
    MOV AH, 01H  ; DOS input function
    INT 21H      ; Read character into AL
    SUB AL, 30H  ; Convert ASCII to integer
    MOV BL, AL   ; Store first number in BL
    
    ; Display second prompt
    MOV DX, OFFSET MSG2
    MOV AH, 09H
    INT 21H
    
    ; Read second number
    MOV AH, 01H  ; DOS input function
    INT 21H      ; Read character into AL
    SUB AL, 30H  ; Convert ASCII to integer
    ADD AL, BL   ; Perform addition
    MOV AH, 0    ; Clear AH for division

    ; Display output message
    MOV DX, OFFSET MSG3
    MOV AH, 09H
    INT 21H
    
    ; Convert sum to ASCII and print
    MOV CX, 0    ; Clear CX for digit count
    MOV BX, 10   ; Divisor for extracting digits
    
CONVERT:
    MOV DX, 0    ; Clear DX before division
    DIV BX       ; AX / 10 -> Quotient in AL, remainder in DL
    PUSH DX      ; Push remainder (last digit) to stack
    INC CX       ; Increase digit count
    TEST AL, AL  ; Check if quotient is zero
    JNZ CONVERT  ; If not zero, continue extracting digits
    
PRINT_DIGITS:
    POP DX       ; Get next digit from stack
    ADD DL, 30H  ; Convert to ASCII
    MOV AH, 02H  ; DOS print function
    INT 21H      ; Print character
    LOOP PRINT_DIGITS  ; Print all digits

    ; Exit program
    MOV AH, 4CH  ; DOS terminate function
    INT 21H

MAIN ENDP
END MAIN
