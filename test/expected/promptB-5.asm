L1: ; Arm: 9'27
  mov dx, [bp+2]
  mov bp, g1
  jmp [bp]

L2: ; Function: (inner,t3)
  call Bare_enter_check
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
  mov bp, bp
  mov dx, g3
  jmp [bp]

L3: ; Function: (outer,g1)
  call Bare_enter_check
  mov ax, dx
  call Bare_put_char
  mov si, Bare_unit
  mov ax, ` `
  call Bare_put_char
  mov di, Bare_unit
  push word dx
  push word L2
  mov [Temps+6], sp
  push word 4 ;; scanned
  mov bp, [Temps+6]
  mov dx, g4
  jmp [bp]

L4: ; Start
  call Bare_enter_check
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
