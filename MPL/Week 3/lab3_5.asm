data segment
asc db 31h,32h,33h,34h
bcd db ?,?
data ends
code segment
assume cs:code,ds:data
start:mov ax,data
mov ds,ax
lea si,asc
mov al,[si]
sub al,30h
mov cl,4
shl al,cl
mov bl,[si+1]
and bl,0FH
add al,bl
mov bcd,al
 
mov al,[si+2]
and al,0fh
shl al,cl
inc si
mov bl,[si+2]
and bl,0fh
add al,bl
mov bcd+1,al
mov ah,4ch
int 21h
code ends
end start