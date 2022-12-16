TITLE WAP to input a string from keyboard and convert it to Uppercase and display in clear screen with blue on red
;DOSSEG 
.MODEL SMALL
.STACK 
.DATA
   ;Variables Defines
   paralst label byte
   maxlen db 50
   actlen db ?
   str1 db 50 dup ('$')
   ustr db 50 dup ('$')
   msg1 db 'Enter String You Wanted to Convert Uppeecase : $'
   msg2 db 'Your Uppper Case String is : $'  
    
    
.code
    main proc
    ; data segment initilized
    mov ax,@data
    mov ds,ax
    
    ;clear screen
    mov ah,06h
    mov al,00h
    mov bh,41h
    mov cx,0000h
    mov dx,184fh
    int 10h
    
    ; cursor set
    mov ah,02h
    mov bh,00h
    mov dh,8
    mov dl,1 
    int 10h
    
    ; display msg to input
     mov ah,09h
     lea dx,msg1
     int 21h 
     
 
     
     ;input string from keyboard
     mov ah,0ah
     lea dx,paralst
     int 21h
     
     
     ; convert Upper case
     
     mov cx,50
     lea si, str1
     lea di, ustr
     
up: mov al,[si]
     cmp al, 'a'
     jb down
     cmp al, 'z'
     ja down
     sub al,20H
     
 down: mov [di],al
       inc si
       inc di
       loop up 
       
           
  ; newline 
     mov ah,02h
     mov dx,13
     int 21h
     mov dx,10
     int 21h	    
       
       
    ;display msg2
    lea dx,msg2
    mov ah,09h
    int 21h
    
    ; display UPPRERCASE STRING
    mov ah,09h
    lea dx,ustr
    int 21h
    
    ;terminate
    mov ax,4c00h
    int 21h
    main endp
    end main
    
    
   
                                                                                                                     
                                                                                                                      