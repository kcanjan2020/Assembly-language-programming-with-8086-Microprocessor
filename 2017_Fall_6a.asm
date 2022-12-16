title to count the no. of vowels and display whether the count is even or odd
;dosseg
.model small
.stack 64h
.data

num db -7
o db 'Negative','$'
e db 'positive','$'
.code
main proc
    mov ax,@data
    mov ds,ax 
    mov al,num
    
    
    
    
       
       rcl al,01    ;move d8 to carry to check positive/negative
       
       mov ah,09
       jnc Positive
       lea dx,o
       int 21h
       jmp last
       ;
 Positive: lea dx,e
        int 21h
        
 last: mov ax,4C00h
        int 21h             
      
      main endp 
end main