data segment
str db 'Enter string:$'
msg db 0dh,0ah,'Reversed String:',0dh,0ah,'$'
str1 db 15,?,15 dup(0)
data ends
code segment
assume cs:code,ds:data,es:data
start:mov ax,data
mov ds,ax
mov es,ax
mov ah,09h
mov dx,offset str
int 21h
mov dx,offset str1
mov ah,0ah
int 21h
mov cl,str1+1
lea si,str1+2
mov ch,0

upper:
mov al,'A'
cmp [si],al
jb exit
mov al,'Z'
cmp [si],al
ja lower
add byte ptr [si],32
inc si
loop upper
jmp en

lower:
mov al,'a'
cmp [si],al
jb exit
mov al,'z'
cmp [si],al
ja exit
sub byte ptr [si],32
exit:
inc si
loop upper
jmp en

en:
mov ah,'$'
mov [si],ah
mov ah,09h
mov dx,offset msg
int 21h
mov ah,09h
mov dx,offset str1
add dx,2
int 21h

mov ah,4ch
int 21h
code ends
end start
