TITLE greatest number in a series
  .model small
  .stack 100h
  .data

  num db 4

  .code
  main proc
  mov ax, @data
  mov ds, ax
  
  
   mov si,offset num
    mov al,1
    mov bl,num
    back: mul bl
    dec bl
    jnz back

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
  