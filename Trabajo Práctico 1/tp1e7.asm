;Ejercicio 7
ORG 1000H

msj DB "Ingresa la cantidad de filas: "
DB 0AH ; salto de línea
fmsj DB ?

msj2 DB "Ingresa la cantidad de columnas: "
DB 0AH
fmsj2 DB ?

msj3 DB "Ingresa un cáracter"
DB 0AH
fmsj3 DB ?

filas DB ?
columnas DB ?
caracter DB ?
salto DB 0AH


ORG 2000H

;Solita el ingreso de filas
MOV BX, OFFSET msj
MOV AL, OFFSET fmsj - OFFSET msj
INT 7
MOV BX, OFFSET filas
INT 6

;Solicita el ingreso de columnas
MOV BX, OFFSET msj2
MOV AL, OFFSET fmsj2 - OFFSET msj2
INT 7
MOV BX, OFFSET columnas
INT 6

;Solicita el ingreso del caracter
MOV BX, OFFSET msj3
MOV AL, OFFSET fmsj3 - OFFSET msj3
INT 7
MOV BX, OFFSET caracter
INT 6

;Pintar el rectángulo

MOV AL, 1
MOV DL, columnas
SUB DL, 30H
      
LOOP: CMP DL, 0
      JZ FIN
      MOV BX, OFFSET salto
      INT 7
      MOV CL, filas
      SUB CL, 30H
      MOV BX, OFFSET caracter
      LOOP2: INT 7
             DEC CL
             JZ DECCOL
      JMP LOOP2
      DECCOL: DEC DL
              JMP LOOP
FIN: INT 0
END
