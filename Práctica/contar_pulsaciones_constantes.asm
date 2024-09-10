;Constantes
;Registro del PIC
EOI EQU 20H
IMR EQU 21H
INT0 EQU 24H

;Valores especiales
MASCARA_F10 EQU 11111110B
FIN_INT EQU 20H

;ID de la interrupción
ID_F10 EQU 11

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
  MOV AL, FIN_INT
  OUT EOI, AL
IRET


ORG 2000H
;Deshabilitar TODAS las interrupciones
CLI
  ;Poner el ID 11 en el registro INT0
  MOV AL, ID_F10
  OUT INT0, AL
  ;Habilitar las interrupciones de INT0
  MOV AL, MASCARA_F10
  OUT IMR, AL
;Habilitar TODAS las interrupciones que no están enmascaras por el IMR
STI

loop_infinito: jmp loop_infinito

INT 0
END