EOI EQU 20H
IMR EQU 21H
INT1 EQU 25H
CONT EQU 10H
COMP EQU 11H

dir_imprimir EQU 8

ORG 1000H
mensaje DB "parcial"
fin DB ?

ORG 32
dw imprimir

ORG 3000H
imprimir: mov bx, offset mensaje
          mov al, offset fin - offset mensaje
          int 7
          mov al, 20h
          OUT EOI, al
          iret
ORG 2000H
  cli
  mov al, 11111101b
  out IMR, al
  mov al, dir_imprimir
  OUT INT1, al
  mov al, 0
  out CONT, al
  mov al, 30
  out COMP, al
  sti
loop: jmp loop
END