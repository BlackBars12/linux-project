print:
    pusha               ; сохраняем регистры

.print_loop:
	cmp byte [bx],0
	jz.done
	cmp byte [bx],'\'
	jz,perenos
	mov ah, 0x0e        ; функция BIOS: вывести символ
	mov al, [bx]
	int 0x10
	inc bx              ; переходим к следующему символу
	jmp .print_loop

.done:
	popa                ; восстанавливаем регистры
	ret                 ; возвращаемся к вызвавшему коду
.perenos:
	inc bx
	cmp byte [bx], 'n'
	jz.newline
	mov ah, 0x0e        ; функция BIOS: вывести символ
	mov al, [bx]
	int 0x10
	inc bx              ; переходим к следующему символу
	jmp .print_loop
.newline:
	inc bx
	mov al, 10
	int 0x10
	mov al, 13
	int 0x10
	jmp.print_loop
