;Lectura e impresión de un string utilizando Int 6 en un ciclo
ORG 1000h
	cadena DB ?
ORG 2000h
	MOV BX, OFFSET cadena
	XOR CL, CL             ;entradas iguales, da 0
Loop1:     INT 6
	CMP BYTE PTR [BX], 0AH ;termina con enter
	JZ Fin
	INC BX
	INC CL
	JMP Loop1
Fin:          MOV AL, CL
	MOV BX, OFFSET cadena
	INT 7
	HLT
END