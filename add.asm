title WAP to add two number and display results
;dosseg
.model small
.stack 100h
.data



.code  
main proc
    mov ax,@data
    mov ds,ax
    mov al,21
    mov bl,30
    add al,bl
    
    
    ; display number
    
    mov ah,0
    mov dx,0
    mov cx,10
    mov bx,0
    
 loop1:   div cx
    add dx,30H
    push dx
    inc bx
    mov dx,0
    cmp ax,00
    ja loop1
    
    
    
    
    mov cx,bx 
    mov ah,02h
  loop2:pop dx
        int 21h
        loop loop2
        
        
        
        mov ax,4c00h
        int 21h
        main endp
        end main 
    
    
  