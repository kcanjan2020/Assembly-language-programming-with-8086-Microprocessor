
title program to count number of capital, small, numeric and special characters
.model small
.stack 100h
.data
maxlen db 60
actlen db ?
str db 60 dup('$')
str2 db 'Enter a string : ','$'             
str3 db 'The number of capital letters is : ','$'
str4 db 'The number of small letters is : ','$'
str5 db 'The number of numeric letters is : ','$'
str6 db 'The number of special letters is : ','$' 
str7 db 13,10,'$' 
count db 4 dup(?)
cap db 0
sml db 0
numb db 0
extra db 0 ; also counts space as a special character
.code
main proc
    
    mov ax,@data
    mov ds,ax
                ;clear screen
                mov ax,0600h
                mov bh,31h
                mov cx,0000h
                mov dx,184fh
                int 10h
                
                ;display enter a string
                            
                mov ah,09h
                lea dx,str2
                int 21h			
                
                ;keyboard string input
                
                mov ah,0ah
                lea dx,maxlen
                int 21h			
				
				;count
				
				lea si,str
				mov ch,0
				mov cl,actlen
		home:	mov al,[si]
				cmp al,'z'
				ja spcl
				cmp al,'a'
				jb check1
				inc sml
				jmp nxt
		check1: cmp al,'Z'
		        ja spcl
		        cmp al,'A'
		        jb check2
		        inc cap
		        jmp nxt
		check2: cmp al,39h
		        ja spcl
		        cmp al,30h
		        jb spcl
		        inc numb
				jmp nxt
		spcl:   inc extra
		nxt:    inc si		
				loop home 
				
				lea si,count
                mov al,cap
                mov [si],al
                inc si            
                mov al,sml
                                mov [si],al
                inc si            
                mov al,numb
                                mov [si],al
                inc si            
                mov al,extra
                                mov [si],al
                ;to point to capital letter count
                lea si,count
                
                 ;display number of capital letters is
                   
                 call nwln 
               
                mov ah,09h
                lea dx,str3
                int 21h	
                
                call numdisp         
                call nwln 
                
                inc si ; point to next count
                
                 ;display number of small letters is
                   
                mov ah,09h
                lea dx,str4
                int 21h	
                
                call numdisp         
                call nwln 
                
                inc si ; point to next count
                 
                 ;display number of numeral letters is
                   
                mov ah,09h
                lea dx,str5
                int 21h	
                
                call numdisp         
                call nwln 
                
                inc si ; point to next count
                 
                 ;display number of special letters is
                   
                mov ah,09h
                lea dx,str6
                int 21h	
                
                call numdisp         
                
                mov ah,4ch
		        int 21h

        main endp

        nwln proc 
                mov ah,09h
                lea dx,str7
                int 21h	
                ret
        nwln endp

        numdisp proc near
                mov ah,0
                mov al,[si]
                mov bx,0
                mov cx,10
        l1:     mov dx,0
                div cx
                add dx,30h  ;convert to ascii
                push dx
                inc bx
                cmp ax,0
                ja l1
    
                mov ah,02
                mov cx,bx
       popping: pop dx
                int 21h 
                loop popping
                ret
        numdisp endp

        end main

