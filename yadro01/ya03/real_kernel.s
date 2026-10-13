mov bx, message
call print

cli
hlt

%include "print.s"

message:
        db "If you gaze\nlong into abyss\nthe abyss will gaze\nback into you =O\n", 0
