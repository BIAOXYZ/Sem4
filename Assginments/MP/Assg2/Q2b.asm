data segment
str1 db 15,?,15 dup(0)
str2 db 15,?,15 dup(0)
gre db 'greater$'
lower db 'lesser$'
data ends
code segment
assume cs:code,ds:data,es:data
start:mov ax,data
mov ds,ax
mov es,ax
cld

mov dx,offset str1
mov ah,0ah
int 21h
mov cx,str1+1
lea si,str1+2

mov ah,02h
mov dl,0ah
int 21h

mov dx,offset str2
mov ah,0ah
int 21h
lea di,str2+2

l1:cmpsb
jg greater
jl less
loop l1

greater:
mov dx,offset gre
mov ah,09h
int 21h
jmp last

less:mov dx,offset lower
mov ah,09h
int 21h
jmp last

last:mov ah,4ch
int 21h
code ends
end start



