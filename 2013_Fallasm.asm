;title 2013 fall Q.N 4(a) Write an 8086 ALP which will input the Students Registration number from the keyboard. if Registration number
; is valid  it will display the student name" else it will output "Not Enroll"
;dosseg
.model small 
.stack 100h
.data 
        password db '101','$'
        msg1 db 'Enter Your Registration No','$'
        sname db 10,13,'Anjan KC','$'
        msg3 db 10,13,'Not Enrolled', '$'
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
            mov cx,3  ;length of password
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
             
             
             
             cmp bh,3
             jne invalid 
             lea dx, sname
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
             
         
             
             
            
            
        