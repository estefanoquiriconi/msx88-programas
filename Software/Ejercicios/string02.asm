;Lectura de un string utilizando Int 6 en un loop. Imprimir el string.
org 1000h
	longitud db 10
	mensaje db ? 
org 3000h 
       leer_string: cmp al,0 
	jz fin
	push bx; 
 	push ax; 
       loop: Int 6 
	inc bx 
        dec al
	jnz loop
	pop ax 
	pop bx
       fin: ret
org 2000h
	mov bx, offset mensaje
	mov al, longitud
	call leer_string
	mov bx, offset mensaje
	mov al, longitud
	Int 7 
 	int 0 
 end
