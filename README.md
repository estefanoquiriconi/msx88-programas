# Interrupciones en el Simulador MSX88

Este repositorio contiene ejemplos de programas que utilizan interrupciones por software y hardware en el simulador MSX88.

## Contenidos

- **Introducción**
  - Las interrupciones son un mecanismo que permite pausar brevemente la ejecución de un programa para ejecutar una subrutina especial, y luego continuar con la ejecución del programa original.
  - Existen dos tipos principales de interrupciones:
    - **Interrupciones por software**: Utilizadas para realizar llamadas al sistema operativo. Son iniciadas por el programa mediante la instrucción `int N` y permiten ejecutar subrutinas del sistema operativo.
    - **Interrupciones por hardware**: Utilizadas para interactuar con dispositivos de entrada/salida (como teclado, impresora, etc.). Son generadas por los dispositivos y requieren que el programador implemente los manejadores de interrupciones.

- **Interrupciones por software**
  - El simulador MSX88 implementa cuatro interrupciones por software:
    1. `int 0`: Termina el programa.
    2. `int 3`: Establece un punto de parada (breakpoint).
    3. `int 6`: Lee un carácter del teclado.
    4. `int 7`: Escribe un string en pantalla.
  - Ejemplo de uso:
    ```assembly
    org 1000H
    letra db ?
    
    org 2000h
    mov bx,offset letra
    int 6    ; Lee un carácter y lo guarda en 'letra'
    int 0    ; Termina el programa
    end
    ```

- **Interrupciones por hardware**
  - Las interrupciones por hardware permiten que los dispositivos notifiquen a la CPU cuando necesitan atención. El Controlador de Interrupciones Programable (PIC) es el dispositivo encargado de gestionar estas interrupciones.
  - Para trabajar con interrupciones por hardware en el MSX88, es necesario configurar el PIC y escribir los manejadores de interrupciones.

- **Esquema para programar con interrupciones**
  1. Escribir el manejador de interrupción.
  2. Configurar el PIC para asociar el manejador con la interrupción correspondiente.
  3. Habilitar las interrupciones en la CPU.
