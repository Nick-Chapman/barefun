L1: ; Arm: 6'25
  call Bare_get_keyboard_last_scancode
  mov [Temps+6], ax
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L2: ; Function: (get_scancode,g1)
  Bare_enter_check(0)
  hlt
  mov si, Bare_unit
  call Bare_is_keyboard_ready
  call Bare_make_bool_from_nz
  mov di, ax
  mov bx, di
  cmp word [bx], 3
  jz L1
  mov bp, g1
  mov dx, g5
  jmp [bp]

L3: ; Continuation
  Bare_enter_check(0)
  mov ax, dx
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov si, ax
  mov ax, si
  sar ax, 1
  mov bx, 21
  sar bx, 1
  push word dx ;; save
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov di, dx
  pop word dx ;; restore
  mov ax, si
  sar ax, 1
  mov bx, 21
  sar bx, 1
  push word dx ;; save
  mov dx, 0
  Div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  push word dx ;; save
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+8], dx
  pop word dx ;; restore
  mov ax, [Temps+6]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  push word dx ;; save
  mov dx, 0
  Div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov [Temps+10], ax
  mov ax, `{`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov ax, [Temps+10]
  sar ax, 1
  mov bx, 97
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
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
  sar ax, 1
  mov bx, 97
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+20], ax
  mov ax, [Temps+20]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+22], ax
  mov ax, [Temps+22]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+24], ax
  mov ax, di
  sar ax, 1
  mov bx, 97
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
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
  mov dx, g8
  jmp [bp]

L4: ; Function: (main,g6)
  Bare_enter_check(6)
  push word cx
  push word L3
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g1
  mov dx, g7
  jmp [bp]

L5: ; Start
  Bare_enter_check(0)
  mov bp, g6
  mov dx, g9
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
