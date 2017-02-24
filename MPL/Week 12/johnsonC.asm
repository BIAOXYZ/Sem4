data segment 
base_address equ 0e0c0h
porta equ base_address+00h
portb equ base_address+01h
portc equ base_address+02h
ctrl equ base_address+03h
data ends

code segment
assume cs:code, ds:data
start: mov ax, data
mov ds, ax
mov dx, ctrl
mov al, 8ah
out dx, al

mov al, 00h
mov dx, porta

l1: out dx, al
ROR al, 1
XOR al, 80h

MOV CX, 0FFFFh
l2: MOV BX, 0FFFh
l3: DEC BX
JNZ l3
LOOP l2

JMP l1

mov ah, 4ch
int 21h
code ends
end start