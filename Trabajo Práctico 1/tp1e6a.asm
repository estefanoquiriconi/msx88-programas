;Leer una cadena de caracteres utilizando la interrupción INT 6:
;a) Utilizando un ciclo en el programa principal.
ORG 1000H
cadena DB ?

ORG 2000H

MOV BX, OFFSET cadena
LOOP: INT 6
      CMP BYTE PTR [BX], 0AH ; 0AH -> enter
      JZ FIN
      INC BX
      JMP LOOP
FIN: INT 0 
END
