org 0x7c00

mov bp, 0x8000
mov sp, bp

mov bx, 0x9000
mov ah, 0x02
mov al, 2
mov cl, 2
mov ch, 0
mov dh, 0

int 0x13

jmp 0x9000 ; <<< добавим строчку, перейти на адрес 0x9000 и начать выполнять его код

times 510 - ($-$$) db 0

dw 0xaa55
