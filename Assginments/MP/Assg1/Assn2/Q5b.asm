data segment
v db 'a','e','i','o','u'
str1 db 'aaaaappple'
len equ ($-str1)
count db 0
data ends
code segment
assume cs:code,ds:data,es:data
start:mov ax,data
mov ds,ax
mov es,ax
lea di,str1
mov cx,len
mov bl,05h
lea si,v

l1:
        mov al,[si]
        cmp [di],al
        jz cnt
        inc si
        dec bl
        cmp bl,00h
        jnz l1

l2:
        inc di
        mov bl,05h
        lea si,v
        dec cx
        cmp cx,00h
        jnz l1
        jz last

cnt:
        inc count
        jmp l2
last:
        mov ah,4ch
        int 21h
        code ends
        end start
        




