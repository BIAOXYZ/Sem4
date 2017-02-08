data segment
n1 dw 024H
n2 dw ?
data ends
code segment
assume cs:code,ds:data
start: mov ax,data
mov ds,ax
mov ax,n1
mov bl,02H
div bl
cmp ah,00H
JZ eve
mov n2,0FH
eve:mov n2,01H
mov ah,4ch
int 21h
code ends
end start