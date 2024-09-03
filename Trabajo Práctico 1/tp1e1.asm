;1. Lectura de datos desde el teclado: Escribir un programa que permita el ingreso de un carácter por
;teclado, aplicando la interrupción por software INT 6.
;a) Con referencia a la interrupción INT 6, ¿qué se almacena en el registro BX?

ORG 1000H

num DB ?

ORG 3000H

ORG 2000H 
;a) En el registro BX se almacena la dirección de memoria donde queremos guardar el valor ingresado.
MOV BX, OFFSET num;
INT 6;

INT 0
END