data segment
str db "madam$"
res db ?
data ends
code segment
assume cs: code,ds:data,es:data
start:mov ax,data
mov ds,ax
mov es,ax
cld
lea si,str
lea di,str
mov al,'$'
mov cx,0
 
l1:scasb
jz decr
inc cx
jmp l1
 
decr:
dec di
dec di
 
l3:cmpsb
jz l2
jnz last
l2:
dec di
dec di
loop l3
mov res,1
jmp final
 
last:
mov res,0
jmp final
 
final:
mov ah,4ch
int 21h
code ends
end start