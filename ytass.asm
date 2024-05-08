.model small
.stack 100h
.data
head db 10,"==============================="
  db 10,"=                             ="
  db 10,"=         PATTERN MENU        ="
  db 10,"=                             ="
  db 10,"===============================",10,"$"
menu db "==============================="
  db 10,"=                              ="
  db 10,"=  a. *           b.     *     ="
  db 10,"=     **                **     ="
  db 10,"=     ***              ***     ="
  db 10,"=     ****            ****     ="
  db 10,"=     *****          *****     ="
  db 10,"=                              ="
  db 10,"===============================",10,"$"
a db 10,"==========="
  db 10,"=         ="
  db 10,"=  *      ="
  db 10,"=  **     ="
  db 10,"=  ***    ="
  db 10,"=  ****   ="
  db 10,"=  *****  ="
  db 10,"=         ="
  db 10,"===========",10,"$"
b db 10,"==========="
  db 10,"=         ="
  db 10,"=      *  ="
  db 10,"=     **  ="
  db 10,"=    ***  ="
  db 10,"=   ****  ="
  db 10,"=  *****  ="
  db 10,"=         ="
  db 10,"===========",10,"$"  
chooice db 10,"Choose YOUR PATTERN ===>:$"
try db 10,"IF YOU WANT TO TRY AGAIN PRESS (Y/y) OTHER WAIS PRESS ANY KEY",10,"===>:$"
.code
start:
mov ax, @data
mov ds, ax

mov ah, 09
lea dx, head
int 21h

mov ah, 09
lea dx, menu
int 21h

mov ah, 09
lea dx, chooice
int 21h

mov ah, 01
int 21h

cmp al,'a'
je printa
cmp al,'A'
je printa

cmp al,'b'
je printb
cmp al,'B'
je printb

jmp tryagain

printa:
mov ah, 09
lea dx, a
int 21h
jmp tryagain

printb:
mov ah, 09
lea dx, b
int 21h
jmp tryagain

tryagain:
mov ah, 09
lea dx, try
int 21h

mov ah, 01
int 21h

cmp al,'y'
je start
cmp al,'Y'
je start

exit:
mov ah,4ch
int 21h
end start