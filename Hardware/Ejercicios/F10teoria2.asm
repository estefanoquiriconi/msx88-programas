EOI            EQU      20h
IMR            EQU      21h
IRR            EQU      22h
ISR            EQU      23h
INT0           EQU      24h
INT1           EQU      25h
INT2           EQU      26h
INT3           EQU      27h
N_F10          EQU      10
ORG 40
      DW        DIR_F10
ORG 3000h
DIR_F10:      		PUSH AX
                      INC DX
                      MOV AL, EOI
                      OUT EOI, AL
                      POP AX
                      IRET
ORG 2000
                       CLI
                       MOV AL, N_F10
                       OUT INT0, AL
                       MOV AL, 0FEh
                       OUT IMR, AL
                       STI
LOOP1:          	   MOV AX, DX
                        CMP AX, 10
                        JNZ   LOOP1
                        CLI
                        MOV AL, 0FFh
                        OUT   IMR, AL
                        MOV   AL, 0
                        OUT     INT0, AL
                        STI
                        HLT
end