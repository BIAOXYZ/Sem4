data segment
mstr db "pineapple"
mlen equ ($-mstr)
sstr db "apple"
slen equ ($-sstr)
res db ?
data ends
 
code segment
assume cs:code,ds:data,es:data
start:mov ax,data
mov ds,ax
mov es,ax
lea si,mstr
lea di,sstr
mov ch,mlen
mov cl,slen
 
l2:
cmpsb
jz l1
dec ch
jnz l2
mov res,'N'
jmp last
l1:
mov bx,si
dec cl
dec ch
l4:
cmpsb
jnz l3
dec cl
jnz l4
mov res,'Y'
jmp last
l3:
mov si,bx
lea di,sstr
mov cl,slen
jmp l2
last:
mov ah,4ch
int 21h
code ends
end start