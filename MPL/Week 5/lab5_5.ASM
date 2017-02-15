data segment
str db 'abababba'
len1 equ ($-str)
str2 db 'bba'
len2 equ ($-str2)
index db ?
data ends
code segment
assume cs:code,ds:data,es:data
start:mov ax,data
mov ds,ax
mov es,ax
lea di,str
mov bl,len1
mov bh,len2
sub bl,bh
mov ch,0
mov cl,bl
inc cl
mov bx,di
cld
mov ah,0
jmp l1
l4:
dec cl
jz l5
l1:
lea si,str2
mov bl,ah
mov di,bx
mov al,0
inc ah

l2:
cmpsb
jnz l4
inc al
cmp al,len2
jnz l2
dec ah
mov index,ah
jmp l3
loopz l1
l5:
mov index,'n'
l3:
mov ah,4ch
int 21h
code ends
end start
