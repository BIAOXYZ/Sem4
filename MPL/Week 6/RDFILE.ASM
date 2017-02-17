data segment
msg db 'File Contents',0dh,0ah,'$'
f1 db 'x:\file.txt',0
h1 dw ?
str1 db 'Error'
str db 15,?,15 dup(0)
data ends
code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax

mov ah,3dh
mov dx,offset f1
mov al,0
int 21h
jc err

mov h1,ax
mov bx,h1
mov ah,3fh
mov cx,8
mov dx,offset str
int 21h

mov ah,3eh
int 21h

mov ah,09h
mov dx,offset msg
int 21h

mov ah,09h
mov dx,offset str
mov bx,dx
add bx,8
mov byte ptr [bx],'$'
int 21h
jmp en

err:
mov ah,09h
mov dx,offset str1
int 21h

en:
mov ah,4ch
int 21h
code ends
end start
