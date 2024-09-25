;Lectura e impresi�n de un string utilizando Int 6 en un ciclo
ORG 1000h
	cadena DB ?
ORG 2000h
	MOV BX, OFFSET cadena
	MOV AL, 0             ;entradas iguales, da 0
loop: INT 6
	CMP BYTE PTR [BX], 0AH ;termina con enter
	JZ Fin
	INC BX
	INC AL
	JMP loop
Fin:
	MOV BX, OFFSET cadena
	INT 7
	HLT
END