
ORG 1000H

msj DB "Ingresa un numero: "
finmsj DB ?
num DB ?

ORG 3000H

ORG 2000H 

MOV BX, OFFSET msj;
MOV AL, OFFSET finmsj - OFFSET msj;
INT 7;
MOV BX, OFFSET num;
INT 6;
MOV AL, 1;
INT 7;

INT 0
END