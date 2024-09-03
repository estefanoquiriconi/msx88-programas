; Leer e imprimir caracteres, reemplazando los dígitos por “#” hasta que se lea el carácter “z”.

ORG 1000H

caracter DB ?   ; Espacio para almacenar un carácter ingresado.
hash DB "#"     ; Carácter '#' que reemplazará los dígitos.
zeta DB "z"     ; Carácter 'z', que indica el final.

ORG 2000H

LOOP:
      MOV BX, OFFSET caracter   ; Mover la dirección de la variable `caracter` a BX.
      INT 6                     ; Leer un carácter del teclado y almacenarlo en `caracter`.
      MOV DL, zeta              ; Mover el valor de `zeta` a DL.
      CMP DL, [BX]              ; Comparar el valor de `zeta` con el carácter ingresado.
      JZ FIN                    ; Si el carácter es 'z', salta a la etiqueta `FIN` para terminar el programa.

      ; Verificar si el carácter ingresado es un dígito (0-9).
      CMP caracter, 48          ; Comparar `caracter` con 48 ('0' en ASCII).
      JS IMPRIMIR               ; Si el valor es menor que 48, no es un dígito, saltar a `IMPRIMIR`.

      MOV AH, 57                ; Mover 57 ('9' en ASCII) a AH. CMP no soporta que su primer operando sea inmediato.
      CMP AH, caracter          ; Comparar AH (57) con `caracter`.
      JS IMPRIMIR               ; Si `caracter` es mayor a 57, no es un dígito, saltar a `IMPRIMIR`.

      ; Si el carácter es un dígito, se reemplaza por '#'.
      MOV caracter, 35          ; Mover el valor ASCII de '#' (35) a `caracter`.

IMPRIMIR:
          ; Configurar para imprimir el carácter. Registros -> BX y AL
          ; En BX ya se encuentra la dirección de memoria de `caracter`.
          MOV AL, 1             ; Mover a AL la cantidad de caracteres que se quieren imprimir.
          INT 7                 ; Llamar a la interrupción para imprimir el carácter.
          JMP LOOP              ; Volver al inicio del ciclo para leer otro carácter.

FIN: INT 0                     ; Terminar el programa.
END