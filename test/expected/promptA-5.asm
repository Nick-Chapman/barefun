L1: ; Arm: 10'29
  mov bp, g1
  mov dx, g4
  mov ax, [bp]
  jmp ax

L2: ; Function: g2
  call Bare_get_char
  mov [2], ax
  mov ax, [2]
  call Bare_put_char
  mov [4], ax
  mov ax, [2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [6], ax
  mov bx, [6]
  cmp word [bx], 1
  jz L1
  mov bp, g2
  mov dx, g5
  mov ax, [bp]
  jmp ax

L3: ; Function: g1
  mov ax, '%'
  call Bare_put_char
  mov [2], ax
  mov ax, ' '
  call Bare_put_char
  mov [4], ax
  mov bp, g2
  mov dx, g6
  mov ax, [bp]
  jmp ax

L4: ; Start
  mov bp, g1
  mov dx, g7
  mov ax, [bp]
  jmp ax

g1: dw L3
g2: dw L2
g3: dw 0
g4: dw 0
g5: dw 0
g6: dw 0
g7: dw 0

bare_start: jmp L4
