[ORG 0x100]


jmp start 

Ar: dw 00h , 10h , 20h , 30h 

star:
	dec bx 
	mov [si] , byte'*'
	mov dx , si
	mov ah, 09h
	int 21h
	add si , 1
	cmp bx , 0
	jg star
	ret
space:
	mov [si] , byte' '
	mov dx , si
	mov ah , 09h
	int 21h
	add si , 1
	loop space
	add bl , 1
	ret

start:
	mov si , [Ar]
	mov cx , 4
	mov bx , 0
	call space 
	call star

	mov si , [Ar+2]
	mov cx , 3
	mov bx , 2
	call space 
	call star

	mov si , [Ar+4]
	mov cx , 2
	mov bx , 4
	call space 
	call star

	

	mov si , [Ar]
	add si , 8
	mov cx , 0
	mov bx , 4 
	call star

	mov si , [Ar+2]
	add si , 8
	mov cx , 1
	mov bx , 1
	call space 
	call star

	mov si , [Ar+4]
	add si , 8
	mov cx , 2
	mov bx , 0
	call space 
	call star
	
	mov	ax, 0x4c00		;terminate program
	int 	0x21