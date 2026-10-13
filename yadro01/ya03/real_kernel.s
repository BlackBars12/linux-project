mov bx, message
call message

cli
hlt

%include "print.s"

message:
        db "I'm real boot loader", 0
