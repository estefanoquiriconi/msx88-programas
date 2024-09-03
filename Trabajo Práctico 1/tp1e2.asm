;Escritura de datos en la pantalla: implementar un programa que muestre en la pantalla de comandos
;(editor) el mensaje “Arquitectura del Computador – 2024 - UNSE” previamente almacenado en
;memoria de datos, aplicando la interrupción por software INT 7.
;a) Con referencia a la interrupción INT 7, ¿qué se almacena en los registros BX y AL?

ORG 1000H

mensaje DB "Arquitectura del Computador - 2024 - UNSE";
finmsj DB ?

ORG 3000H

ORG 2000H 
;a) En el registro BX se almacena la dirección de memoria del inicio de la cadena que queremos imprimir.
; En AL se almacena la cantidad de caracteres a imprimir.
MOV BX, OFFSET mensaje;
MOV AL, OFFSET finmsj - OFFSET mensaje;

INT 7;

INT 0
END