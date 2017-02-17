data segment
str1 db 'Enter string:$'
msg1 db 0dh,0ah,'No of words are:',0dh,0ah,'$'
str11 db 15,?,15 dup(0)
count db 1
data ends
code segment
assume cs:code,ds:data,es:data
start: mov ax,data
mov ds,ax
mov es,ax
mov ah,09h
mov dx,offset str1
int 21h
mov dx,offset str11
mov ah,0ah
int 21h
mov al,' '
mov cl,str11+1
lea si,str11+2
back:cmp [si],al
je space
inc si
dec cl
jnz back
jmp last
space:inc si
dec cl
cmp [si],al
jz space
inc count
jmp back
last:lea dx,msg1
mov ah,09
int 21h
mov dl,count
add dl,30h
mov ah,02
int 21h
mov ah,4ch
int 21h
code ends
end start
