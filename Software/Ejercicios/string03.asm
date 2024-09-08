;Leer e imprimir caracteres, reemplazando los dígitos por "#" hasta leer el carácter "z" 
ORG 1000H 
	c_leer db ? 
	c_mostrar db ? 
	zeta db "z"       ; se define la variable con el código  de la "z" 
	numeral db "#"     ;se define una variable con el código del "#" 
ORG 2000H 
	mov al,1
 loop:               mov bx,offset c_leer 
	int 6 
	mov ah,zeta
	cmp c_leer,ah ;si es z, termina
	jz fin
	mov cl,c_leer 
	mov c_mostrar,cl
	cmp c_leer, 48 ; cero en decimal ó 30h
	js imprimir    ; cheque que este entre 0 y 9 para imprimir
	mov ah, 57     ; nueve en decimal ó 39h
	cmp ah,c_leer 
	js imprimir
	mov ah,numeral 
	mov c_mostrar,ah 
imprimir:         mov bx,offset c_mostrar 
	 int 7 
 	jmp loop 
 fin: int 0 
 end