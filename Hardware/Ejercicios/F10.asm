	PIC EQU 20H 
	EOI EQU 20H 
	N_F10 EQU 10 
ORG 40 
	IP_F10 DW RUT_F10 
ORG 2000H 
	CLI 
	MOV AL,0FEH 
	OUT PIC+1,AL 
	MOV AL,N_F10 
	OUT PIC+4,AL 
	MOV DX,0 
	STI 
   	LAZO: JMP LAZO 
ORG 3000H 
	RUT_F10: PUSH AX 
	INC DX 
	MOV AL,EOI 
	OUT EOI,AL 
	POP AX 
	IRET 
END
