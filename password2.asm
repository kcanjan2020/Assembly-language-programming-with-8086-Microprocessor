;title 2011 Spring Q.N 3(a) Write an 8086 ALP which will input the user name from the keyboard. if user is "Pokhara University" 
;it will give the output "Valid User" else it will output "Invalid User"
   

;dosseg
.model small 
.stack 100h
.data                 
        uname db 'Pokhara University','$'
        msg1 db 'Enter User Name:','$'
        msg2 db 10,13,'Valid User','$'
        msg3 db 10,13,'Invalid User', '$'
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
            mov cx,18  ;length of password
            mov si,offset uname
            
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
             
             
             
             cmp bh,18
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
             
         
             
             
            
            
        