data segment
f1 db 'x:\file.txt',0
h1 dw ?
str1 db 0dh,0ah,'Error$'
str db 15,?,15 dup(0)
str2 db 'Enter String: $'
data ends

code segment
assume cs:code,ds:data,es:data
start:
mov ax,data
mov ds,ax
mov es,ax

mov ah,3dh
mov dx,offset f1
mov al,2
int 21h
jc err
mov h1,ax

mov ah,09h
mov dx,offset str2
int 21h

mov ah,0ah
mov dx,offset str
int 21h

mov bx,offset str
mov ax,[bx+1]
add bx,ax
add bx,2
mov byte ptr [bx],'$'


mov dx,0
mov ah,42h
mov bx,h1
mov cx,0
mov al,2
int 21h

mov ah,40h
mov bx,offset str+1
mov cx,[bx]
mov ch,0
mov bx,h1
mov dx,offset str+2
int 21h
jmp en

err:
mov dx,offset str1
mov ah,09h
int 21h

en:
mov ah,4ch
int 21h
code ends
end start
