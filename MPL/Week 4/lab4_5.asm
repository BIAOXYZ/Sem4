data segment
arr db 15,12,-4,-10,4
pos db 4
data ends
code segment
assume cs:code,ds:data
start: mov ax,data
mov ds,ax
lea si,arr
add si,pos
mov cl,3
down:mov bx,[si+1]
mov [si],bx
inc si
dec cl
jnz down
last:
mov ah,4ch
int 21h
code ends
end start