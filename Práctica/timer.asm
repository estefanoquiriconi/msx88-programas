;registros del PIC
IMR EQU 21h
EOI EQU 20h
INT1 EQU 25h

;registros del TIMER
CONT EQU 10h
COMP EQU 11h

;valores especiales
MASCARA_TIMER EQU 11111101b
VALOR_FIN_INTERRUPCION EQU 20h

;id de interrupcion y direccion asociada
ID_TIMER EQU 13

ORG 1000h
mensaje DB "Hola"

;Escribir la subrutina imprimir_hola
ORG 3000h
imprimir_hola: MOV BX,OFFSET mensaje
MOV AL, 4;cantidaddecaracteresdelmensaje
INT 7

;Volver a poner el CONT en 0,para que vuelvaa
;contar desde 0.Sino incluimos este codigo, no
;obtendremos una interrupcion cada COMP(10) segundos.
MOV AL, 0
OUT CONT, AL

;enviar el valor 20h al registro EOI paraindicarle al
;PIC que finalizó el manejo de la interrupción
MOV AL,VALOR_FIN_INTERRUPCION
OUT EOI, AL
IRET

;Poner la direccion de imprimir_hola en la posicion 13
;del vector de interrupciones (13*4 -> direccion 52, en decimal)
ORG 52
dw imprimir_hola ;no es necesario ponerle una etiqueta

;Programa principal
ORG 2000h
CLI ; Desactivar las interrupciones 
;Poner el ID 13 en el registro INT1
MOV AL,ID_TIMER
OUT INT1, AL

;Habilitar la interrupcion de INT1
MOV AL,MASCARA_TIMER
OUT IMR, AL

;Configurar el COMP del TIMER en 10 segundos
MOV AL, 10
OUT COMP, AL

;Poner el CONT en 0, para que comience a contar desde 0
MOV AL,0
OUT CONT, AL
STI; Habilitar las interrupciones

;loop infinito para que el programa siga
;ejecutandose, esperandolas interrupciones
loop_infinito: JMP loop_infinito
END