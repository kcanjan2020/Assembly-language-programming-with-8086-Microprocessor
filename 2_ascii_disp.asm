title display ascii characters
;dosseg 
.model small
.stack 100h
.data
asc db 00,'$'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    ;clear screen
        mov ah,06h
        mov al,00h
        mov bh,07h; Black background and White foreground
        mov cx,0000h
        mov dx,184fh
        int 10h   
        
     ;setting the cursor at 8,15
        mov ah,02h
        mov bh,00h
        mov dh,8
        mov dl,15
        int 10h
        
     ;ascii display
        mov cx,256
         lea dx,asc        
        mov ah,09h
       nxt: int 21h
        inc asc
        loop nxt
        
        mov ax,4c00h
        int 21h
        
        main endp
end main
       