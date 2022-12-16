TITLE Q.N 6(a) write an 8086 ALP for MASM to display the text "POKHARA UNIVERSITY" in reverse order    
;dosseg
.model small
.stack 100
.data
    str db 'POKHARA UNIVERSITY'
    len db $-str
    message db 'The reverse order String is:$'
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
    
    ;set cursor position
    mov ah,02h
    mov bh,00h
    mov dh,8
    mov dl,15
    int 10h 
    
    
    
    ;convert to reverse order
    mov cl,len
    mov ch,0
    mov bl,len
    mov bh,0
    mov di,0
    dec bl
    
   up: mov dl,str[bx]
    mov str2[di],dl
    dec bl
    inc di
    loop up  
    
    
    ;display message 
    mov ah,09h
    lea dx,message
    int 21h
    
    ;display reverse string 
    mov ah,09h
    lea dx,str2
    int 21h
    
    mov ax,4c00h
    int 21h
    main endp
    end main
    
             
             
    
    
    
    
    
    
