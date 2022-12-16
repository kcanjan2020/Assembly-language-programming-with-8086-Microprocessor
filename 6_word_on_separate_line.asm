title to display the words of a string on separate lines

;Dosseg  
.model small
.stack 100h

.data
para_list   label       type   
max_len     db          80
act_len     db          ?
kb_data     db          80 dup('$')
str db 13,10,'$'    ; line feed and carriage return. 13=0dh returns cursor to the left position of screen
                    ; and 10=0ah advances to next line. 13 and 10 are ascii values

.code

main proc 
mov ax, @data 
mov ds,ax 

;input string 
mov ah, 0Ah
lea dx, para_list
int 21h              

; clear screen{u can do it urself}
mov ah,06H
mov al , 00H
mov bh ,07H
mov cx,000H
mov dx ,184FH
INT 10H


lea si, kb_data 
mov ch,00h          ;
mov cl, act_len     ; cx=00actlen
 
; set cursor location
;mov dh, 00h    ;set row=00 i.e. first row
call curlocation 

nxtchar:
    mov al, [si] 
    cmp al, ' '
    je nxtrow 

; display char using char display function
    mov ah,02h 
    mov dl,al
    int 21h

nxtword:
inc si
loop nxtchar

mov ax, 4c00h
int 21h
main endp 

nxtrow:
;inc dh
call curlocation
jmp nxtword

curlocation: 
;mov ah, 02h
;mov bh, 00h 
;mov dl, 00h
;int 10h
lea dx,str
mov ah,09
int 21h
ret   

End main

