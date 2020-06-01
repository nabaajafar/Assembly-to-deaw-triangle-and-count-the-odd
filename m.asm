
    [ORG 0x100]
                                        
    jmp start 
                                      
     star1: db '  .    ..... '
    star2:db   ' ...    ... '
  star3: db    '.....    .  '
     
    
                                  
     start :
     mov bx ,star1
     mov si,0
     
print:cmp byte[bx+si],46
 jne skip

sub byte[bx+si],4

skip:
inc si
loop print


                                     
    mov ax,0x4c00
    int 21h