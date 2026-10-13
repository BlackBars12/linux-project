org 0x7c00
mov bp, 0x8000  ; указывем что стек начинается с области памяти 0x8000
mov sp, bp ; sp -- это текущее состояние стека, так как стек пустой просто скопируем туда значение bp
mov ah, 0x0e

mov bx, hello_str ; положим в регистр hello_str адрес строки 
call print

%include "print.s"  ; подключаем файл

print:
        pusha ; сохраняем все регистры в стек
.print_loop:
        cmp byte [bx], 0 ; тепепрь тут проверяем на равенство нулевому символу
        jz .done ; если равен то идем на метку .done
	cmp byte [bx], '\'
	jz .perenos
        mov ah, 0x0e ; иначе рисуем символ
        mov al, [bx]
        int 0x10
        inc bx
        jmp .print_loop ; безусловный переход, то есть идем в начало
.done:
        popa ; восстанавливаем все регистры из стека
        ret
.perenos:
	inc bx
    	cmp byte [bx], 'n'
    	jz .newline
     	mov ah, 0x0e
    	mov al, [bx]
    	int 0x10
    	inc bx
    	jmp .print_loop
.newline:
	inc bx
    	mov al, 10
    	int 0x10
    	mov al, 13
    	int 0x10
	jmp .print_loop

; использовать loop для зависание экрана не самый хороший способо
; так как оно нагружает процессор
;loop:
;        jmp loop
; поэтому заменим на
cli ; отключить обработку прерываний
hlt ; перевести процессор в спящий режим

hello_str:
        db 'If you gaze\nlong into abyss\nthe abyss will gaze\nback into you =O', 0 ; добавили нулевой символ в конец


times 510 - ($-$$) db 0

dw 0xaa55
