;Leer una cadena de caracteres utilizando la interrupción INT 6:
;a) Utilizando una subrutina
ORG 1000H
cadena DB ?
fincadena DB ?

ORG 2000H

MOV BX, OFFSET cadena
XOR CL, CL
LOOP: INT 6
      CMP BYTE PTR [BX], 0AH ; 0AH -> enter
      JZ IMPRIMIR
      INC BX
      INC CL
      JMP LOOP
IMPRIMIR: MOV BX, OFFSET cadena
     MOV AL, CL
     INT 7
INT 0 
END
