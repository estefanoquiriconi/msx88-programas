;a) Este programa imprime el mensaje "Trabajo comienza" cada 30 segundos.
EOI EQU 20H
IMR EQU 21H
INT1 EQU 25H
CONT EQU 10H
COMP EQU 11H
dir_RutImp EQU 8

ORG 1000H
Mje1 db "Trabajo comienza"
ORG 32
RutImp dw Impresion

ORG 3000H
Impresion: 
      MOV BX, OFFSET Mje1
      MOV AL, 16
      INT 7
      MOV AL, 0
      OUT CONT, AL
      MOV AL, 20H
      OUT EOI, AL
      IRET

ORG 2000H
CLI
MOV AL, 0FDH
OUT IMR, AL
MOV AL, dir_RutImp
OUT INT1, AL
MOV AL, 0
OUT CONT, AL
MOV AL, 30
OUT COMP, AL
STI

loop: jmp loop

END