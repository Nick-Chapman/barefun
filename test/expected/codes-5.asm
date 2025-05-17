L1: ; Arm: 6'25
  call Bare_get_keyboard_last_scancode
  mov [Temps+6], ax
  mov si, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L2: ; Function: (get_scancode,g1)
  Bare_enter_check(0)
  hlt
  mov ax, Bare_unit
  mov [Temps+2], ax
  call Bare_is_keyboard_ready
  call Bare_make_bool_from_nz
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L1
  mov bp, g1
  mov si, g5
  jmp [bp]

L3: ; Continuation
  Bare_enter_check(0)
  mov ax, si
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov ax, [Temps+2]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+4], dx
  mov ax, [Temps+2]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+8], dx
  mov ax, [Temps+6]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+10], ax
  mov ax, `{`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov ax, [Temps+10]
  mov bx, 97
  add ax, bx
  sub ax, 1
  mov [Temps+14], ax
  mov ax, [Temps+14]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+16], ax
  mov ax, [Temps+16]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+18], ax
  mov ax, [Temps+8]
  mov bx, 97
  add ax, bx
  sub ax, 1
  mov [Temps+20], ax
  mov ax, [Temps+20]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+22], ax
  mov ax, [Temps+22]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+24], ax
  mov ax, [Temps+4]
  mov bx, 97
  add ax, bx
  sub ax, 1
  mov [Temps+26], ax
  mov ax, [Temps+26]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+28], ax
  mov ax, [Temps+28]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+30], ax
  mov ax, `}`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+32], ax
  mov ax, ` `
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+34], ax
  mov bp, g6
  mov si, g8
  jmp [bp]

L4: ; Function: (main,g6)
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L3
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g1
  mov si, g7
  jmp [bp]

L5: ; Start
  Bare_enter_check(0)
  mov bp, g6
  mov si, g9
  jmp [bp]

g1:
  dw L2
g2:
  dw 1
g3:
  dw 1
g4:
  dw 1
g5:
  dw 1
g6:
  dw L4
g7:
  dw 1
g8:
  dw 1
g9:
  dw 1

bare_start: jmp L5
