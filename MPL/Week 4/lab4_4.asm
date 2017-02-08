data segment
arr db 15,12,-3,10,7,?
ele db 13
pos db 3
data ends
code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax
lea si,arr
add si,pos
mov cl,3
mov al,ele
swap:
xchg al,[si]
inc si
dec cl
jnz swap
last:
mov ah,4ch
int 21h
code ends
end start