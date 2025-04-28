L1: ; Arm: 10'29
  mov bp, g1
  mov dx, g4
  jmp [bp]

L2: ; Function: g2
  call Bare_get_char
  mov [Temps+2], ax
  mov ax, [Temps+2]
  call Bare_put_char
  mov [Temps+4], ax
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov bx, [Temps+6]
  cmp word [bx], 1
  jz L1
  mov bp, g2
  mov dx, g5
  jmp [bp]

L3: ; Function: g1
  mov ax, `%`
  call Bare_put_char
  mov [Temps+2], ax
  mov ax, ` `
  call Bare_put_char
  mov [Temps+4], ax
  mov bp, g2
  mov dx, g6
  jmp [bp]

L4: ; Start
  mov bp, g1
  mov dx, g7
  jmp [bp]

g1:
  dw L3
g2:
  dw L2
g3:
  dw 0
g4:
  dw 0
g5:
  dw 0
g6:
  dw 0
g7:
  dw 0

bare_start: jmp L4
