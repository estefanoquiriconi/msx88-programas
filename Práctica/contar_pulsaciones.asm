;Datos
ORG 1000H
pulsaciones DB 0

;Dir. de la subrutina en el vector de interrupciones
;44 porque el ID es 11 -> 11 * 4 = 44
ORG 44
DW contar_pulsaciones

; Subrutina
ORG 3000H
contar_pulsaciones: 
  INC pulsaciones
  ;Poner 20H en EOI, le avisa al PIC que la interrupción ha sido atentida.
  MOV AL, 20H
  OUT 20H, AL
IRET


ORG 2000H
;Deshabilitar TODAS las interrupciones
CLI
  ;Poner el ID 11 en el registro INT0
  MOV AL, 11
  OUT 24H, AL
  ;Habilitar las interrupciones de INT0
  MOV AL, 11111110B
  OUT 21H, AL
;Habilitar TODAS las interrupciones que no están enmascaras por el IMR
STI

loop_infinito: jmp loop_infinito

INT 0
END