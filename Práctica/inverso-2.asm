EOI EQU 20h
IMR EQU 21h
INT2 EQU 26h
H_MASK EQU 11111011b
H_DATO EQU 40h
H_ESTADO EQU 41h
ID_HAND EQU 10

ORG 40
DW IMPRIMIR

ORG 1000h
MENSAJE DB "HOLA"
FINMSJ DB ?

ORG 3000h
IMPRIMIR: 
     CMP CL, 0
     JZ INVERSO
     MOV AL, [BX]
     OUT H_DATO, AL
     INC BX
     DEC CL
     JMP RETURN
INVERSO: 
     DEC BX
     MOV AL, [BX]
     OUT H_DATO, AL
     DEC DL
     CMP DL, 0
     JNZ RETURN
     MOV AL, 0FFH; Enmascaro las interrupciones
     OUT IMR, AL
RETURN:
     MOV AL, EOI
     OUT EOI, AL
     IRET
     
ORG 2000h
MOV BX, OFFSET MENSAJE
MOV CL, OFFSET FINMSJ - OFFSET MENSAJE
MOV DL, CL

CLI                    
MOV AL, H_MASK
OUT IMR, AL            

MOV AL, ID_HAND        
OUT INT2, AL

IN AL, H_ESTADO
OR AL, 10000000b 
OUT H_ESTADO, AL
STI

LOOP: JMP LOOP
  
INT 0
END