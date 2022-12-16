title Q.N 6(a) write a program in 8086 to find whether a number is positive or negative

;dosseg
.model small
.stack 64h
.data

num db 14
msg db 'The Sqaure of a Number is:','$'
.code
main proc
    mov ax,@data
    mov ds,ax 
    mov al,num 
    mov bl,num  
    mov dl,num
    mov cl,1
 l1:   
    
      cmp dl,cl
       je last
      add al,bl
     
       
      inc cx
      
      jmp l1 
             
        
        
   ; display numbers
                 
 
   last: mov ah,0
   mov dx,0
   mov cx,10
   mov bx,0 
   
loop1:
   div  cx
   add dx,30h
   push dx
   inc bx 
   mov dx,00
   cmp ax,00
   jnz loop1 
   
    mov cx,bx 

   mov ah,02h
  loop2:
    pop dx
   int 21h
   loop loop2   
   
          
   
        
  mov ax,4C00h
        int 21h                
      
      main endp 
end main