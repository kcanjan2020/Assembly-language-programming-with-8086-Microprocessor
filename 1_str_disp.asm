title display your name with white background and 
        ;blue foreground at cursor location 8,5
;dosseg 
.model small
.stack 100h
.data
str db 'shailesh','$'
.code
main proc
    mov ax,@data
    mov ds,ax    
    
    
     ;setting the cursor at 8,15
        mov ah,02h
        mov bh,00h
        mov dh,8
        mov dl,5
        int 10h
        
    
    ;clear screen
        mov ah,06h
        mov al,00h
        mov bh,71h; white background and blue foreground
        mov cx,0000h
        mov dx,184fh
        int 10h   
        
    
     ;string display
        mov ah,09h
        lea dx,str
        int 21h
        
        mov ax,4c00h
        int 21h
        
        main endp
end main
       