title WAp to add  two number which define in data segments
;dosseg
.model small
.stack 100h
.data
    num1 db 'Enter 1st Numner: $'
    num2 db 'Enter 2nd Number: $'
    result db 'Result=$' 
     
 .code 
 main proc
   mov ax,@data
   mov ds,ax
   
   mov ah,09h
   lea dx,num1
   int 21h 
   
   
   mov ah,01h
   int 21h
   mov bl,al
   sub bl,48  
            
    ;new line
   mov ah,02h
   mov dx,13
   int 21h
   mov dx,10
   int 21h      
   
   mov ah,09h
   lea dx,num2
   int 21h
   
   mov ah,01h
   int 21h  
   sub al,48 
   add al,bl
   
   
   ; display numbers
   
   
   mov ah,0
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
          
          
   ;new line
   mov ah,02h
   mov dx,13
   int 21h
   mov dx,10
   int 21h 
   
   mov ah,09h
   lea dx,result
   int 21h

   mov cx,bx 

   mov ah,02h
  loop2:
    pop dx
   int 21h
   loop loop2   
   
   
   mov ax,4c00h
   int 21h
   main endp
 end main