[ORG 0x100]

jmp start    

num1: dw 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15
odd: dw 0, 0, 0, 0, 0, 0, 0, 0
avg_odd: dw 0

num2: dw 0, 1, 2, 3, 4, 5, 6, 7
fact: dw 0
max: dw 0

 
Find_odd:
       mov ax, [num1+si]
      mov dx, 0
      mov ax ,ax
      div bx
      cmp dx, 0
      je skip
      mov ax, [num1+si]
      mov [odd+di], ax
      add di, 2
  skip:
    add si,2
    loop Find_odd
  ret

sum:
      add ax, [bx]
      add bx, 2
      cmp cx, 0
      je f_avg
      loop sum
f_avg:
      mov bx, 8
      mov ax, ax
      div bx
      
ret

fmax: 
      mov ax, [bx]
      dec cx
  again1: add bx, 2
         cmp ax, [bx]
         jg next
         mov ax, [bx]
  next: loop again1
  ret

factor: 
      mov bx, 1 
 again2: mul bx
        add bx, 1
        cmp bx, [max]
        jne again2
        mov [fact], ax
 ret

start: 
  mov ax, 0
  mov si, 0
  mov di,0
  mov bx, 2
  mov cx,16
call Find_odd

mov ax, 0
mov bx, odd
mov cx, 8
call sum
mov [avg_odd] , ax

  mov ax , 0
  mov bx , odd
  mov bx, num2
  mov cx, 8
  mov ax, 0
call fmax
  mov [max], ax
call factor
         
      

end: mov ax,0x4c00
int  0x21