title to reverse the given string

;dosseg
.model small
.stack 100
.data
str db 'pokhara university'
len db $-str
str2 db 50 dup('$')

.code
main proc
mov ax,@data
mov ds,ax

      
;clear the screen
mov ah,06h
mov al,00h
mov bh,07h
mov cx,0
mov dx,184fh
int 10h

;setting the cursor
mov ah,02h
mov bh,00
mov dh,8
mov dl,15
int 10h

;reverse str and put in str2
mov cl,len
mov ch,0
mov di,0
mov bh,0
mov bl,len
dec bl ; 'pokh', len 4 bt str[0]=p......str[3]=h
again:
mov dl,str[bx]
mov str2[di],dl
dec bl
inc di
loop again

;Display
mov dx,offset str2
mov ah,09h
int 21h
mov ax,4c00h
int 21h
main endp
end main

