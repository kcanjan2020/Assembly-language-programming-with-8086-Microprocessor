title program to input a string from keyboard and display
        ;at the centre of the screen with whitte on blue  
        
        
        ;1. string input
        ;2. Display string
        ;3. white on blue===clear screen
        ;4. cursor set
        ;squencing==> 1, 3, 4 ,2
        

;dosseg
.model small
.stack 64h

.data
paralst label   byte
maxlen  db      50
actlen  db      ?
kbdata  db     50 dup('$')

.code
main proc
    ;data segment initialize
    mov ax,@data
    mov ds,ax

    ;keyboard input
    mov ah,0ah
    lea dx,paralst
    int 21h

    ;clear screen
    mov ah,06
    mov al,00
    mov bh,17h  ;white on blue
    mov cx,0000h
    mov dx,184fh
    int 10h

    ;set cursor

    ;calculation al=40-actlen/2
    mov al,actlen
    mov ah,00       ; to make ax=00actlen
    mov bl,02h
    div bl
    mov bl,al
    mov al,28h      ;28h=40decimal=centre half of the screen
    sub al,bl       ;al=40-actlen/2

    ;setting
    mov ah,02
    mov bh,00
    mov dh,12
    mov dl,al
    int 10h

    ;display
    mov ah,09h
    lea dx,kbdata
    int 21h

    mov ax,4c00h
    int 21h
main endp
end main

