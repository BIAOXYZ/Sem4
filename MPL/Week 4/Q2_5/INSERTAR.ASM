data segment
arr db 1,2,3,6,7,8,9,?,?,?
n db 7
e db 10,5,4
noe dw 3
data ends
code segment
assume cs:code,ds:data
start:mov ax,data
mov ds,ax
mov cx,noe
mov bl,n
lea di,e
l1:
mov bh,0
lea si,arr
mov ah,[di]
l2:
mov al,[si]
cmp al,ah
jnc l4
inc bh
inc si
cmp bh,bl
jnz l2
l4:
inc bl
l3:
xchg ah,[si]
inc si
inc bh
cmp bh,bl
jnz l3
inc di
loop l1
mov ah,4ch
int 21h
code ends
end start
