mov ah, 0x0e ; будет запрашивать вывод к консоль биоса
mov al, 'L' ; в регистр al положили символ для печати
int 0x10 ; вывзываем запрос на печать
mov al, 'o' ; ну и так на каждую букву
int 0x10
mov al, 'n'
int 0x10
mov al, 'g'
int 0x10

call newline

mov al, 'i'
int 0x10
mov al, 'n'
int 0x10
mov al, 't'
int 0x10
mov al, 'o'
int 0x10

call newline

mov al, 'a'
int 0x10
mov al, 'b'
int 0x10
mov al, 'y'
int 0x10
mov al, 's'
int 0x10
int 0x10

newline:
    mov al, 10
    int 0x10
    mov al, 13
    int 0x10
    ret

loop:
    jmp loop
times 510-($-$$) db 0
dw 0xaa55
