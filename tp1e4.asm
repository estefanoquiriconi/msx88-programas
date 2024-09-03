;4. Redactar un programa que solicite el ingreso de dos números y efectúe la suma mostrando el
;resultado en la pantalla de comandos. Como el código de los caracteres ingresados no coincide con
;el número que representa, realice una conversión al código ascii hexadecimal antes de imprimir el
;resultado de la suma.

ORG 1000H

msj1 DB "Ingresa primer valor: "
finmsj1 DB ?
msj2 DB "Ingresa segundo valor: "
finmsj2 DB ?

num1 DB ?
num2 DB ?

ORG 3000H

ORG 2000H 

MOV BX, OFFSET msj1;
MOV AL, OFFSET finmsj1 - OFFSET msj1;
INT 7
MOV BX, OFFSET num1;
INT 6

MOV BX, OFFSET msj2;
MOV AL, OFFSET finmsj2 - OFFSET msj2;
INT 7
MOV BX, OFFSET num2;
INT 6

INT 7;

INT 0
END