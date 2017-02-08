data segment
arr db 5,3,7,1,4,9,2
n db 7
pos db 6,2,3
noe dw 3
data ends
code segment
assume cs:code,ds:data
start:mov ax,data
mov ds,ax
mov cx,noe
lea si,arr
lea di,pos
mov ah,n
mov bh,0
jmp l1
l4:
dec cl
l3:
dec ah
l1:
mov al,[di]
inc al
mov bl,[di]
mov byte ptr [bx],0
inc di
cmp ah,al
jz l4 
l2:
mov dl,[bx+1]
xchg [bx],dl
inc bx
inc al
cmp ah,al
jnz l2
mov byte ptr [bx],0
loop l3
mov ah,4ch
int 21h
code ends
end start
