org 1000h
	letra DB ?
org 2000h
	mov bx, offset letra 
	int 6              
	hlt ;int 0                 
end
