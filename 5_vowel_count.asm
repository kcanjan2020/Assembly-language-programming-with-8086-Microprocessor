title to count the no. of vowels and display whether the count is even or odd
;dosseg
.model small
.stack 64h
.data
str db 'hello therei','$'
vcont db ?
o db 'odd','$'
e db 'even','$'
.code
main proc
    mov ax,@data
    mov ds,ax
    mov si,offset str
    mov cx,12
    ;mov ch,0
    mov bx, 0

l1:    mov al,[si]
    cmp al,'a'
    jb check
    cmp al,'z'
    ja check
    sub al,20h   ;convert to capital letter
    
check:    cmp al,'A'
    jnz lbl1
    inc bl  
    jmp loop1
    
lbl1:   cmp al,'E'
        jnz lbl2
        inc bl
        jmp loop1
        
lbl2:   cmp al,'I'
        jnz lbl3
        inc bl
        jmp loop1
        
lbl3:   cmp al,'O'
        jnz lbl4
        inc bl
        jmp loop1
        
lbl4:   cmp al,'U'
        jnz loop1
        inc bl
loop1: inc si 
       loop l1  
       
       mov vcont,bl
       rcr bl,01    ;move d0 to carry to check odd/even
       
       mov ah,09
       jnc evel
       lea dx,o
       int 21h
       jmp last
       ;
 evel: lea dx,e
        int 21h
        
 last: mov ax,4C00h
        int 21h             
      
      main endp 
end main