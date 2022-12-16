title WAp to add  two number which define in data segments
;dosseg
.model small
.stack 100h
.data
    num1 db 30
    num2 db 50
    
 .code 
 main proc
   mov ax,@data
   mov ds,ax
   
   
   mov al,num1
   mov bl,num2
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