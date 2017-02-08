data segment
arr db 3,4,1,8,4,?,?
n db 5
e db 10,9
noe dw 2
pos db 5,4
data ends
code segment
assume cs:code,ds:data
start:mov ax,data
mov ds,ax
mov cx,noe
mov dh,n
lea di,e
lea si,pos
mov ah,0
l1:
mov dl,[si]
mov al,[si]
mov bx,ax
mov al,[di]
jmp l2
l3:
inc dl
l2:
xchg [bx],al
inc bx
cmp dl,dh
jnz l3
inc di
inc dh
inc si
loop l1
mov ah,4ch
int 21h
code ends
end start
