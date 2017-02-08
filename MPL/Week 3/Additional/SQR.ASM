data segment
n db 80
flag db 0fh
data ends
code segment
assume cs:code,ds:data
start:mov ax,data
mov ds,ax
mov cl,0h
up:inc cl
mov al,cl
mul cl
mov ch,al
cmp n,ch
jz sqr
jc last
jmp up
sqr:mov flag,1h
last:mov ah,4ch
int 21h
code ends
end start
