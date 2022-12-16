title ALP that asks user to input password and compares the entered password and displays "Welcome to Everest Engineering College" 
;otherwise display invalid User   

;dosseg
.model small 
.stack 100h
.data 
        password db 'eemc','$'
        msg1 db 'Enter Your Password','$'
        msg2 db 10,13,'Welcome to Everest Engineering College','$'
        msg3 db 10,13,'Invalid Password', '$'
        val db ?
  
.code 
        main proc
            mov ax,@data
            mov ds,ax
            
            ;display msg1
            mov ah,09h
            mov dx,offset msg1
            int 21h
            
            
            ;input from keyboard
            mov bh,0   ;to count no of character matched
            mov cx,4  ;length of password
            mov si,offset password
            
           up: 
            mov ah,08h
            int 21h  
            mov val,al
            mov ah,02h
            mov dl,'*'
            int 21h
            
            mov bl,[si]
            cmp val,bl 
            jne skip
            inc bh
            
       skip: inc si
             loop up 
             
             
             
             cmp bh,4
             jne invalid 
             lea dx, msg2
             mov ah,09h
             int 21h
             jmp last
             
      invalid:
            mov ah,09h
            lea dx,msg3
            int 21h
            
      last: mov ax,4c00h
            int 21h
            main endp
            end main
             
         
             
             
            
            
        