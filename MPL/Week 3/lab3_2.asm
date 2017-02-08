data segment
n1 db 24
n2 db 09
gcd db ?
lcm db ?
data ends
code segment
assume cs:code,ds:data
start:mov ax,data
mov ds,ax
mov al,n1
mov bl,n2
comp:
cmp al,bl
jz l1
jc l2
sub al,bl
jmp comp
l2:sub bl,al
jmp comp
l1:mov gcd,al
mov al,n1
mul n2
div gcd
mov lcm,al
mov ah,4ch
int 21h
code ends
end start