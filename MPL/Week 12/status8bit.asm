data segment 
base_address equ 0e0c0h
porta equ base_address+00h
portb equ base_address+01h
portc equ base_address+02h
ctrl equ base_address+03h
data ends
code segment
assume cs:code, ds: data
start: mov ax, data
mov ds, ax
mov dx, ctrl
mov al, 8ah
out dx, al

mov dx, portb
in al, dx

mov dx, porta
cmp al, 00h
jz l1
mov al, 0FFh
out dx, al

JMP last

l1: out dx, al

last: mov ah, 4ch
int 21h 
code ends
end start