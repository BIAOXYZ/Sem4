data segment
arr db 2,3,5,7,8,9,?
num db 4,6
data ends
code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax
mov cx,6
mov bx,2
lea si,arr
lea di,num
mov dl,[di]
l2:
mov al,[si]
cmp al,[di]
jge l1
inc si
loop l2
mov [si],dl
jmp last
l1:
xchg dl,[si]
inc si
loop l1
mov [si],dl
inc di
lea si,arr
dec bx
jnz l2
last:
mov ah,4ch
int 21h
code ends
end start