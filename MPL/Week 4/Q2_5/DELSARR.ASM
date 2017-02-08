data segment
arr db 1,2,3,4,5,6,7,8,9,10
n db 10
e db 10,5,3
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
jz l4
inc bh
inc si
cmp bh,bl
jnz l2
l4:
dec bl
l3:
cmp bh,bl
jz l5
mov dl,[si+1]
mov [si],dl
inc si
inc bh
cmp bh,bl
jnz l3
l5:
mov dl,0
mov [si],dl
inc di
loop l1
mov ah,4ch
int 21h
code ends
end start
