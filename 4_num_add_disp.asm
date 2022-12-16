title program to add three numbers and display the result in screen
;dosseg
.model small
.stack 100
.data
    st0 dw 30,20,50,60
    st1 dw ?
.code
    main proc
        mov ax,@data
        mov ds,ax
        lea si,st0
        mov ax,0
        mov cx,4
    sum:add ax,[si]
        inc si
        inc si
        loop sum
        mov bx,ax; store the sum in bx register   
        
        ;clear screen
        mov ax,0600h
        mov bh,31h
        mov cx,0000h
        mov dx,184fh
        int 10h   
        
        ;setting the cursor at 8,15
        mov ah,02h
        mov bh,00
        mov dh,8
        mov dl,15
        int 10h   
        
        ;display
        mov ax,bx;store the sum to be displayed in ax register
        mov bx,0
        mov cx,10
        
    l1:
        mov dx,0
        div cx
        add dx,30h  ;convert to ascii
        push dx
        inc bx
        cmp ax,0
        ja l1
    
        mov ah,02   ;char display function
        mov cx,bx
    
    popping:
    
        pop dx
        int 21h 
        loop popping
    
        mov ax,4c00h
        int 21h
    
    main endp 
    end main