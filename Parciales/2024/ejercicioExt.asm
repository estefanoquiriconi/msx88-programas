;a) Este programa imprime el mensaje "Trabajo comienza" cada 30 segundos.
EOI EQU 20H
IMR EQU 21H
INT0 EQU 24H
INT1 EQU 25H
CONT EQU 10H
COMP EQU 11H

dir_RutImp EQU 8
dir_RutF10 EQU 10

ORG 1000H
Mje1 db "Trabajo comienza"; 16
Mje2 db "Trabajo terminado" ; 17

ORG 32
RutImp dw Impresion

ORG 40
RutF10 dw Terminar

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

ORG 4000H
Terminar:
      MOV BX, OFFSET Mje2
      MOV AL, 17
      INT 7
      MOV AL, 0FFH
      OUT IMR, AL
      MOV DL, 0AH
      MOV AL, 20H
      OUT EOI, AL
      IRET
      
ORG 2000H
CLI
MOV AL, 11111100b;
OUT IMR, AL

MOV AL, dir_RutImp
OUT INT1, AL

MOV AL, dir_RutF10
OUT INT0, Al

MOV AL, 0
OUT CONT, AL
MOV AL, 10
OUT COMP, AL
STI

loop: CMP DL, 0AH
      JNZ loop

INT 0

END