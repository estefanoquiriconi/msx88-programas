;Leer una cadena de caracteres utilizando la interrupción INT 6:
;b) Utilizando un a subrutina.
ORG 1000H
cadena DB ?

ORG 3000H
LEER: INT 6
      CMP BYTE PTR [BX], 0AH;
      JZ FIN
      INC BX
      JMP LEER
FIN: RET 

ORG 2000H
MOV BX, OFFSET cadena
CALL LEER
INT 0
END
