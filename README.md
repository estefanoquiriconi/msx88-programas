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

### Interrupciones por Hardware

Las interrupciones por hardware son generadas por dispositivos externos cuando necesitan atención de la CPU. En lugar de que la CPU verifique continuamente el estado de los dispositivos (lo que sería ineficiente), los dispositivos pueden enviar una señal a la CPU a través del **Controlador de Interrupciones Programable (PIC)**. El PIC gestiona las solicitudes de interrupción y le indica a la CPU qué manejador ejecutar para atender al dispositivo.

El PIC del simulador MSX88 tiene 4 líneas de interrupción (INT0 - INT3), que permiten conectar hasta 4 dispositivos distintos. Cada línea de interrupción está asociada a un identificador (ID) que permite que la CPU acceda al **vector de interrupciones** y ejecute el manejador correspondiente.

- **INT0**: Conecta la tecla **F10**, que puede ser utilizada para detectar pulsaciones y ejecutar un código específico.
- **INT1**: Está asociado al **Timer**, un dispositivo de E/S que permite realizar acciones a intervalos regulares.

#### Configuración del PIC

Para configurar el PIC y trabajar con interrupciones por hardware en el simulador MSX88, se siguen los siguientes pasos:

1. **Escribir un manejador de interrupción**, que es una subrutina que se ejecuta cuando se detecta la interrupción.
2. **Asociar el ID de interrupción** con la dirección de memoria donde está ubicado el manejador.
3. **Habilitar la línea de interrupción correspondiente** en el Registro de Máscara de Interrupciones (IMR).
4. Cuando se termine de atender la interrupción, se debe notificar al PIC mediante el registro **EOI (End of Interrupt)**.
