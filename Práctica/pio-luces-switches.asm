PA EQU 30h; Llaves 
PB EQU 31h; Luces
CA EQU 32h; Conf. los bits de PA como entrada o salida.
CB EQU 33h; Conf. los bit de PB como entrada o salida.

ORG 2000h
; Configurar PA(entrada) y PB (salida)


MOV AL, 11111111b
OUT CA, AL ; CA = FF

MOV AL, 00000000b
OUT CB, AL; CB = 00

loop: 
;Leemos el estado de las llaves
IN AL, PA

;Mandar la info de las llaves a las luces
OUT PB, AL

JMP loop

INT 0
END
