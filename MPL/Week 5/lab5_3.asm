data segment
str1 db "pine$"
n1 db 10 dup(0)
str2 db "apple"
len2 equ ($-str2)
data ends
code segment
assume cs:code,ds:data,es:data
start:
mov ax,data
mov ds,ax
mov es,ax
mov cx,len2
 
mov al,'$'
lea di,str1
lea si,str2
 
l1:scasb
jnz l1
 
dec di
 
l2:
movsb
loop l2
 
mov ah,4ch
int 21h
code ends
end start