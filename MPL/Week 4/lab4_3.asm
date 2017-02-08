data segment
arr db 2,3,4,5,6
num db 5
data ends
code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax
mov cx,5
lea si,arr
mov dl,num
l2:
mov al,[si]
cmp al,num
jz l1
inc si
loop l2
jmp last
l1:
mov bx,[si+1]
mov [si],bx
inc si
loop l1
mov byte ptr [si-1],00
last:
mov ah,4ch
int 21h
code ends
end start