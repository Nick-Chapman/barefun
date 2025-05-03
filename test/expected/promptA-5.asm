L1: ; Arm: 10'29
  mov bp, g1
  mov dx, g4
  jmp [bp]

L2: ; Function: (inner,g2)
  Bare_enter_check(500)
  call Bare_get_char
  mov si, ax
  mov ax, si
  call Bare_put_char
  mov di, Bare_unit
  mov ax, si
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov bx, [Temps+6]
  cmp word [bx], 1
  jz L1
  mov bp, g2
  mov dx, g5
  jmp [bp]

L3: ; Function: (outer,g1)
  Bare_enter_check(500)
  mov ax, `%`
  call Bare_put_char
  mov si, Bare_unit
  mov ax, ` `
  call Bare_put_char
  mov di, Bare_unit
  mov bp, g2
  mov dx, g6
  jmp [bp]

L4: ; Start
  Bare_enter_check(500)
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
