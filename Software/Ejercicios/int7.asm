org 1000H
	mensaje db "Hola"
org 2000h
	mov bx,offset mensaje
	mov al,4 
	int 7
	int 0
end
