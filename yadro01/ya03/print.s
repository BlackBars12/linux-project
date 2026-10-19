print:
    pusha

.print_loop:
    cmp byte [bx], 0
    jz .done

    cmp byte [bx], 92
    jz .perenos

    mov ah, 0x0e
    mov al, [bx]
    int 0x10
    inc bx
    jmp .print_loop

.perenos:
    inc bx
    cmp byte [bx], 'n'
    jz .newline

    mov al, 92
    mov ah, 0x0e
    int 0x10
    jmp .print_loop

.newline:
    inc bx
    mov ah, 0x0e
    mov al, 13
    int 0x10
    mov al, 10
    int 0x10
    jmp .print_loop

.done:
    popa
    ret
