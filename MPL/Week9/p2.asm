data segment
base_address equ 0ef40h
porta equ base_address+00h
portb equ base_address+01h
portc equ base_address+02h
control equ base_address+03h
res db ?
data ends

code segment
assume cs:code,ds:data
start:
	mov ax,data 
	mov ds,ax 
	mov dx,control 
	mov al,90h     ; port A is input port
	out dx,al 
start1:
	mov ah,00h 
	mov cx,03h 
	mov bl,01h 
repeat:
	mov al,bl 
	mov dx,portc 
	out dx,al 
	mov dx,porta 
	in al,dx 
	cmp al,00h 
	jnz key 
	add ah,08h 
	rol bl,01h 
     loop repeat 
    jmp start1 
key:
	ror al,01h 
	jc store 
	inc ah 
	jmp key 
store:
	mov res,ah 
	mov dl,res 
     call disp 
	mov dl," " 
	mov ah,02h 
	int 21h 
	mov ah,res 
	cmp ah,10h 
	jc loop1 
	sub ah,10h 
	jmp loop2 
loop1: 
	cmp ah,08h 
	jc loop2 
	sub ah,08h 
loop2:
	inc ah 
	mov dl,ah 
	mov res,ah 
     call disp 
	mov dl, " " 
	mov ah,02h 
	int 21h 
	cmp bl,04h 
	jne down 
	dec bl 
down: 
	mov res,bl 
	mov dl,bl 
     call disp 
	jmp end1 
disp proc 
	mov cl,04h 
	and dl,0f0h 
	ror dl,cl 
	cmp dl,0ah 
	jc d11 
        add dl,07h 
    d11: 
	add dl,30h 
	mov ah,02h 
	int 21h 
	mov dl,res 
	and dl,0fh 
	cmp dl,0ah 
	jc d2 
	add dl,07h
     d2: 
	add dl,30h 
	mov ah,02h 
	int 21h 
     ret 
disp endp 
end1:
	mov ah,4ch 
	int 21h 
      code ends
    end start
