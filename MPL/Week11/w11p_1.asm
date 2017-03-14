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
	mov al,00h
	mov bl,00h
	

up:
	out dx,al
	inc bl
	CMP BL,0FFH
	jnz up
	mov bl,00h
up1:
	mov al,0ffh
	out dx,al
	inc bl
	cmp bl,0ffh
	jnz up1
	
	mov ah,0bh
	int 21h
	or al,al
	jmp upp
	
	mov ah,4ch
	int 21h
	code ends
	end start


	