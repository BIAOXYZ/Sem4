data segment
ba equ 0e0c0h
porta equ ba+00h
portb equ ba+01h
portc equ ba+02h
cw equ ba+03h
mode equ 80h
phasea equ 0eh
phaseb equ 0dh
phasec equ 0bh
phased equ 07h 
data ends

code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax
mov dx,cw
mov al,mode
out dx,al

up:
mov al,phasea
mov dx,portc
out dx,al
call dly

mov al,phaseb
mov dx,portc
out dx,al
call dly

mov al,phasec
mov dx,portc
out dx,al
call dly

mov al,phased
mov dx,portc
out dx,al
call dly

mov ah,0bh
int 21h
or al,al
jz up

mov ah,4ch
int 21h

dly proc near
mov cx,03fh
abvc:
push cx
call help
pop cx
loop abvc
ret
dly endp

help proc near
mov cx,0ffffh
dly1:loop dly1
ret
help endp

code ends
end start