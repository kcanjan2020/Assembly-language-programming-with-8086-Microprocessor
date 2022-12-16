TITLE Q.N 5(b) Write an assembly language program in 8086 which reads a string from a keyboard and then display the string in reverse order    
;dosseg
.model small
.stack 100
.data
    paralst label byte
    maxlen db 50
    actlen db ?
    str db 50 dup('$')
    imessage db 'Plase enter String: $'
    omessage db 'The reverse order String is:$'
    str2 db 50 dup('$')   
    
    
.code
    main proc  
    mov ax,@data
    mov ds,ax   
    
    ;clear screen
    mov ah,06h
    mov al,00h
    mov bh,07h
    mov cx,0000h
    mov dx,184fh
    int 10h

   
    
   
    ;Ask input string
    mov ah,09h
    lea dx,imessage
    int 21h

    ; input string from Keyboard
    mov ah,0ah
    lea dx,maxlen
    int 21h

    
    
    
    ;convert to reverse order
    mov cl,actlen
    mov ch,0
    mov bl,actlen
    mov bh,0
    mov di,0
    dec bl
    
   up: mov dl,str[bx]
    mov str2[di],dl
    dec bl
    inc di
    loop up

     ; new line
     mov ah,02h
     mov dx,13
     int 21h
     mov dx,10
     int 21h
    
    ;display message 
    mov ah,09h
    lea dx,omessage
    int 21h
    
    ;display reverse string 
    mov ah,09h
    lea dx,str2
    int 21h
    
    mov ax,4c00h
    int 21h
    main endp
    end main
    
             
             
    
    
    
    
    
    
