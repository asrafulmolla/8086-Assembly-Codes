.MODEL SMALL
.STACK 100H
.DATA
.CODE

MAIN PROC

    MOV AX, @DATA
    MOV DS, AX

    MOV CL, 1
    MOV AL, 0

LOOP_SUM:
    ADD AL, CL
    INC CL
    CMP CL, 10
    JNE LOOP_SUM

    ADD AL, 30H
    MOV DL, AL
    MOV AH, 2
    INT 21H

    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN