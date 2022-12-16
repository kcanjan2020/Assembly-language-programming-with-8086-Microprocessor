title program to count number of vowels in user entered string 
;1896$=1 8 9 6 =31H 38H 39H 36H $
.model small
.stack 64
.data
    maxchar db 30
    actchar db ?
    str     db 30 dup ('$')
    message db "Please enter a string: ",'$'
    vowel   db "AEIOUaeiou",'$'
    outmsg  db "Number of Vowels present are: $"
    newline db 0dh,0ah,"$"
.code
main proc
	mov ax, @data	;Data segment initialization
	mov ds, ax

	mov ah,06h		;clearing screen
	mov al,00h
	mov bh,70h
	mov cx,0000h
	mov dx,184fh
	int 10h

	mov ah,09h		;ask for the string to input
	mov dx,offset message
	int 21h

	mov ah,0ah		; enter the string
	mov dx, offset maxchar
	int 21h

        mov cl,actchar
	mov ch,00h
	lea di,str
	mov bl,00
up:	lea si,vowel
	mov bh,10
	mov al,[di]
l1:	mov ah,[si]
	cmp al,ah
	je down
	inc si
	dec bh
	jnz l1
	jmp m2
down:	inc bl
m2:	inc di
	loop up
          
          ;number display
          
	mov al,bl
	mov ah,00h
	mov dx,0000h
	mov cx,10
	mov bx,00h
l2:	div cx
	add dx,30h
	push dx
	inc bx
	mov dx,0000h
	cmp ax,00
	ja l2
	
	;optional
	mov ah,09h
	mov dx,offset newline
	int 21h
    ;optional
	mov ah,09h
	mov dx,offset outmsg
	int 21h

	mov cx,bx
	mov ah,02h
l3:	pop dx
	int 21h
	loop l3

        mov ax,4c00h
	int 21h
main endp
	end main

