;title 2019 Q.N 5(b) write an 8086 ALP for MASM in DOS Mode to print each word of a string in different line
 
 ;dosseg
.model small 
.stack 100h
.data                 
   string db ' Everest Engineering College','$'     
.code 
        main proc
            mov ax,@data
            mov ds,ax 
            
            mov si,offset string 
        again:
            mov dl,[si]
            cmp dl,24h ;ASCII value of $ is 24H
            jz last ; when gets $sign program jumps to label last for termination
            cmp dl,20h ; ASCII value of space is 20H
            jz nextline ; when gets space in string jump to lable nextline
            mov ah,02h ; character outout function
            int 21h
            inc si 
            jmp again
            
  nextline: 
            inc si
            mov dl,0dh ; cariage return of effect of enter key press
            mov ah,02h
            int 21h
            
            mov dl,0ah ; start next line 
            mov ah,02h
            int 21h
            jmp again
            
            
            
            
            
          
                 
            
         last:  mov ax,4c00h
            int 21h          
            main endp
            end main
             
         
             
             
            
            
        