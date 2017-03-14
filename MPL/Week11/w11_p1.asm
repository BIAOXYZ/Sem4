data segment
base equ 0e0c0h
porta equ base+00h
portb equ base+01h
portc equ base+02h
cntrl equ base+03h
data ends

code segment
assume cs:code,ds:data,es:data
start:

mov ax,data
mov ds,ax
mov es,ax
mov al,80h
mov dx,cntrl
out dx,al
mov dx,portb

upp:
	mov al,0ffh
	out dx,al
up:
	dec al
	out dx,al
	CMP aL,00H
	jnz up
up1:
	out dx,al
	inc al
	cmp al,0ffh
	jnz up1
up2:
	dec al
	out dx,al
	cmp al,00h
	jnz up2
	
	mov ah,0bh
	int 21h
	or al,al
	jmp upp
	
	mov ah,4ch
	int 21h
	code ends
	end start


	