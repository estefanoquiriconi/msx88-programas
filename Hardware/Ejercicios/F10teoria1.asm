org 1000H 
pulsaciones db 0
org 3000h 
	contar_pulsaciones: 
     		inc pulsaciones
		mov al,20h 
		out 20h,al 
     iret
org 44 
     dw contar_pulsaciones
org 2000h 
	cli
	mov al,11 ;11 decimal (11 X 4 = 44)
	out 24h,al
     mov al,11111110B 
     out 21h,al 
     sti
loop_infinito: jmp loop_infinito
end