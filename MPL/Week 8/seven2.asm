data segment
ba equ 0e0c0h
control equ ba+03
porta equ ba+00

portb equ ba+01

portc equ ba+02


fire db 7dh,6dh,66h,4fh,5bh,06h
blank db 0,0,0,0,0,0

help db 0,7dh,77h,1eh,3ch,6dh
data ends

code segment
assume cs:code,ds:data
start:mov ax,data
mov ds,ax

mov al,80h
mov dx,control
out dx,al

displ:mov di,1000
dispfire:mov si,offset fire
call display
call delay
dec di
jnz dispfire
mov di,1000

dispb:mov si,offset blank
call display
call display

dec di
jnz dispb

mov di,1000
disph:mov si,offset help
call display
call delay
dec di
jnz disph
call delay
mov ah,0bh
int 21h
or al,al
jz displ

mov dx,portc
mov al,06h
out dx,al


mov ah,4ch
int 21h

display proc near
mov dx,portc
mov al,06h
out dx,al
mov bl,00
disp2:mov al,bl
mov dx,portc
out dx,al

mov dx,porta
lodsb
out dx,al
call delay
inc bl
cmp bl,05
jle disp2
ret
display endp

delay proc near
mov cx,0ffffh
l1:dec cx
jnz l1
ret
delay endp
code ends
end start
