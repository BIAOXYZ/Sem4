data segment
n db -4
flag db ?
data ends
code segment
assume cs:code,ds:data
start:mov ax,data
mov ds,ax
cmp n,0
jz zer
jl nev
mov flag,01h
jmp last
zer:mov flag,0fh
jmp last
nev:mov flag,0ffh
last:mov ah,4ch
int 21h
code ends
end start
