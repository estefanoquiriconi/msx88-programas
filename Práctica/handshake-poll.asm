HAND_DATO EQU 40h
HAND_ESTADO EQU 41h

ORG 1000H
mensaje DB "HANDSHAKE"
finmsj DB ?

ORG 2000H
;Configurar el handshake para polling
IN AL, HAND_ESTADO; Leer estado actual
AND AL, 07Fh; 7F = 0111 1111
OUT HAND_ESTADO, AL; Estado = 0xxx xxxx

MOV BX, OFFSET mensaje
POLL: IN AL, HAND_ESTADO
      AND AL, 1; Check bit menos significativo (busy)
      JNZ POLL
    MOV AL, [BX]; Tomo el caracter
    OUT HAND_DATO, AL; Lo envío al registro de datos
    INC BX; Avanzo a la siguiente posición
    CMP BX, OFFSET finmsj; Check final
    JNZ POLL
INT 0
END
