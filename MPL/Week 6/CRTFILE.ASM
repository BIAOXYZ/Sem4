data segment
f1 db 'x:\file.txt',0
h1 dw ?
str1 db "File created$"
str2 db "Error$"
str db "Akashraj$"
len equ ($-str)
data ends
code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax

mov dx,offset f1
mov ah,3ch
mov cx,00h
int 21h

jc err
mov h1,ax
mov dx,offset f1
mov ah,3dh
mov al,2
int 21h
jc err
mov h1,ax

mov dx,offset str
mov ah,40h
mov bx,h1
mov cx,len
dec cx
int 21h
jc err

mov ah,3eh
mov bx,h1
int 21h
jmp do

err:mov dx,offset str2
mov ah,09h
int 21h
jmp en

do:mov dx,offset str1
mov ah,09h
int 21h

en:mov ah,4ch
int 21h
code ends
end start
