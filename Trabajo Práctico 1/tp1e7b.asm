;Ejercicio 7
ORG 1000H

msj DB "Ingresa la cantidad de filas: "
DB 0AH ; salto de línea
fmsj DB ?

msj2 DB "Ingresa la cantidad de columnas: "
DB 0AH
fmsj2 DB ?

msj3 DB "Ingresa un cáracter: "
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
SUB filas, 30H

;Solicita el ingreso de columnas
MOV BX, OFFSET msj2
MOV AL, OFFSET fmsj2 - OFFSET msj2
INT 7
MOV BX, OFFSET columnas
INT 6
SUB columnas, 30H

;Solicita el ingreso del caracter
MOV BX, OFFSET msj3
MOV AL, OFFSET fmsj3 - OFFSET msj3
INT 7
MOV BX, OFFSET caracter
INT 6

;Pintar el rectángulo
MOV AL, 1
FOR: 
  MOV BX, OFFSET caracter
  MOV DL, columnas
    FOR2: 
      INT 7
      DEC DL
    JNZ FOR2
  MOV BX, OFFSET salto
  INT 7
  DEC filas
  CMP filas, 0
JNZ FOR
INT 0
END
