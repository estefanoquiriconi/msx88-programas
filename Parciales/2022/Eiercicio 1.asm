ORG 1000H

msj DB "Ingrese la base del tríangulo"
DB 0AH
fmsj DB ?
msj2 DB "Ingrese el caracter para formar el tríangulo"
DB 0AH
fmsj2 DB ?
base DB ?
valor DB ?
salto DB 0AH

ORG 3000H
IMPRIMIR: MOV AL, 1
          MOV DL, 1
          MOV CL, 1
          LOOP: INT 7
                DEC CL
                CMP CL, 0
          JNZ LOOP
          INC DL
          CMP base, DL
          JS FIN
          MOV CL, DL
          PUSH BX
          MOV BX, OFFSET salto
          INT 7
          POP BX
          JMP LOOP
FIN: RET

ORG 2000H
MOV BX, OFFSET msj
MOV AL, OFFSET fmsj - OFFSET msj
INT 7

MOV BX, OFFSET base
INT 6
SUB base, 30H

MOV BX, OFFSET msj2
MOV AL, OFFSET fmsj2 - OFFSET msj2
INT 7
MOV BX, OFFSET valor
INT 6

CALL IMPRIMIR

INT 0
END

