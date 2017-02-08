data segment
arr db 4,1,-2,-3,-10,15
data ends
code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax
mov cx,5
up:lea si,arr
mov bl,cl
l1:mov al,[si]
cmp al,[si+1]
jg swap
l2:inc si
dec bl
jnz l1
loop up
jmp last
swap:
xchg al,[si+1]
mov [si],al
jmp l2
last:
mov ah,4ch
int 21h
code ends
end start