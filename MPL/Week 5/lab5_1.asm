data segment
str1 db "abcdefghij$"
len dw ?
data ends
code segment
assume cs:code,ds:data,es:data
start:mov ax,data
mov ds,ax
mov es,ax
mov cx,0
cld
lea di,str1
mov al,'$'
l2:scasb
jz last
inc cx
jmp l2
last:
mov len,cx
mov ah,4ch
int 21h
code ends
end start