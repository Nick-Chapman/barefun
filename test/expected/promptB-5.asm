L1: ; Arm: 9'27
  mov dx, [bp+2]
  mov bp, g1
  jmp [bp]

L2: ; Function: t3
  call Bare_get_char
  mov [Temps+2], ax
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov bx, [Temps+6]
  cmp word [bx], 1
  jz L1
  mov bp, bp
  mov dx, g3
  jmp [bp]

L3: ; Function: g1
  mov ax, dx
  call Bare_put_char
  mov ax, ` `
  call Bare_put_char
  push word dx
  push word L2
  mov [Temps+6], sp
  push word 4 ;; scanned
  mov bp, [Temps+6]
  mov dx, g4
  jmp [bp]

L4: ; Start
  mov bp, g1
  mov dx, `%`
  jmp [bp]

g1:
  dw L3
g2:
  dw 0
g3:
  dw 0
g4:
  dw 0

bare_start: jmp L4
