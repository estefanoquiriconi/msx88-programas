; Este programa solicita el ingreso de dos números, los suma, y muestra el resultado en la pantalla.
; Debido a que los números ingresados están en formato ASCII, el programa convierte los caracteres
; a sus valores numéricos reales antes de realizar la suma.

ORG 1000H

msj1 DB "Ingresa primer valor: "  ; Mensaje que pide el primer número.
finmsj1 DB ?                      ; Marca el final del mensaje.
msj2 DB "Ingresa segundo valor: " 
finmsj2 DB ?                      

num1 DB ?       ; Almacena el primer número ingresado.
num2 DB ?       ; Almacena el segundo número ingresado.
resultado DB ?  ; Almacena el resultado de la suma.

ORG 2000H ; Inicio del programa.

; Mostrar msj y leer primer número.
MOV BX, OFFSET msj1               ; Mueve la dirección de inicio del mensaje1 a BX.
MOV AL, OFFSET finmsj1 - OFFSET msj1 ; Calcula la longitud del mensaje.
INT 7                             ; Llama a la interrupción para mostrar el mensaje.
MOV BX, OFFSET num1               ; Mueve la dirección de `num1` a BX.
INT 6                             ; Llama a la interrupción para leer el primer número y almacenarlo en `num1`.

; Mostrar msj2 y leer segundo número.
MOV BX, OFFSET msj2               
MOV AL, OFFSET finmsj2 - OFFSET msj2 
INT 7                             
MOV BX, OFFSET num2               
INT 6                             

; Realizar la suma de los dos números.
MOV DL, num1                      ; Mueve el valor de `num1` a DL.
ADD DL, num2                      ; Suma `num2` a DL (ahora DL contiene la suma de `num1` y `num2`).
SUB DL, 30h                       ; Convierte el valor ASCII en un número real.

; Almacenar el resultado de la suma.
MOV BX, OFFSET resultado          ; Mueve la dirección de `resultado` a BX.
MOV [BX], DL                      ; Almacena el resultado de la suma en la dirección de `resultado`.

; Mostrar el resultado.
MOV AL, 1                         ; Configura AL para imprimir 1 caracter.
INT 7                             ; Llama a la interrupción para mostrar el resultado.


INT 0                             ; Interrupción para finalizar el programa.

END  ; Fin del programa.