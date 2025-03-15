.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN PROC
    MOV AX, 10     ; Load 10 into AX
    MOV BX, 20     ; Load 20 into BX
    ADD AX, BX     ; AX = AX + BX (AX = 10 + 20 = 30)
    SUB AX, BX     ; AX = AX - BX (AX = 30 - 20 = 10)
    INC AX         ; AX = AX + 1 (AX = 11)
    DEC AX         ; AX = AX - 1 (AX = 10)


MAIN ENDP
END MAIN
