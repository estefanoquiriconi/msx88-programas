PA EQU 30h
PB EQU 31h
CA EQU 32h
CB EQU 33H

ORG 1000H
msj DB "ARQUITECTURA"
fin DB ?

ORG 2000H
;Configurar PIO para impresora
MOV AL, 11111101b; FD 
OUT CA, AL

MOV AL, 0
OUT CB, AL

;strobe -> 0
IN AL, PA
AND AL, 11111101b
OUT PA, AL

MOV BX, OFFSET msj
MOV CL, OFFSET fin - OFFSET msj
;Comprobar que la impresora no esté ocupada
POLL: IN AL, PA
      AND AL, 1
      JNZ POLL
;Enviar caracter
MOV AL, [BX]
OUT PB, AL

;strobe -> 1
IN AL, PA
OR AL, 00000010b;
OUT PA, AL

;strobe -> 0
IN AL, PA
AND AL, 11111101b;
OUT PA,AL

INC BX
DEC CL
JNZ POLL

INT 0
END