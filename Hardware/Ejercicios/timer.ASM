	IMR EQU 21h
 	EOI EQU 20h
 	INT1 EQU 25h
	CONT EQU 10h
	COMP EQU 11h
	MASCARA_TIMER EQU 11111101B
	VALOR_FIN_INTERRUPCION EQU 20h
	ID_TIMER EQU 13
org 1000H
	mensaje db "Hola"
org 3000h
	imprimir_hola:mov bx, offset mensaje
	mov al,4 
	int 7
	mov al,0
	out CONT,al
	mov al,VALOR_FIN_INTERRUPCION
	out EOI,al
	iret
org 52
	dw imprimir_hola
org 2000h
	cli
	mov al,ID_TIMER
	out INT1,al
	mov al,MASCARA_TIMER
	out IMR,al
	mov al, 10
	out COMP, al
	mov al,0
	out CONT,al
	sti
	loop_infinito: jmp loop_infinito
end
