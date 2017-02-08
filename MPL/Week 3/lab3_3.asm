data segment
fib db 0,1,8 dup(0)
data ends
code segment
assume cs:code,ds:data
start:mov ax,data
mov ds,ax
lea si,fib
mov cl,8
lob:
mov ax,[si]
add ax,[si+1]
mov [si+2],ax
inc si
dec cl
cmp cl,00h
jz op
jmp lob
op:
mov ah,4ch
int 21h
code ends
end start