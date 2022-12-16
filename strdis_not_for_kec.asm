title to display engineering college, pokhara university nepal

;dosseg
.model small
.stack 100
.data
str db 'Engineering College','$'
str2 db 'Pokhara University, Nepal','$'

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

;Display first line
lea dx,str
mov ah,09h
int 21h
         
;mov ah,02h         
;mov dx,13
;int 21h
;mov dx,10 
;int 21h

;setting the cursor
mov ah,02h
mov bh,00
mov dh,9
mov dl,15
int 10h

;Display  second line
lea dx,str2
mov ah,09h
int 21h

mov ax,4c00h
int 21h
main endp
end main
