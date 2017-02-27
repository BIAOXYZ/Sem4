data segment
str1 db 'ABS'
len1 equ ($-str1)
str2 db 'ABC'
len2 equ ($-str2)
res db 0h
data ends
code segment
assume cs:code,ds:data,es:data
start:mov ax,data
mov ds,ax
mov es,ax
mov cx,len1
cld
lea si,str1
lea di,str2

l1:cmpsb
jg greater
jl less
loop l1

greater:mov res,01h
jmp last

less:mov res,0fh
jmp last

last:mov ah,4ch
int 21h
code ends
end start



