format binary
use16
org 0x07C00
mov ah, 0x02
mov al, 0x3F
mov cx, 0x00002
mov bx, 0x08000
push word 0
pop es
int 0x10
jnc jump
mov si, trc
mov ah, 0x0E
lodsb
cycle2:
int 0x10
lodsb
test al, al
jnz cycle2
halt:
sti
hlt
jmp halt
jump:
jmp 0x00000:0x08000
jmp halt
trc db "Error: disk not readable", 0x0D, 0x0A, 0x00
times 510-$+$$ db 0x00
sign dw 0x0AA55