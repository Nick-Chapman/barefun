L1: ; Arm: 11'25
  call Bare_get_keyboard_last_scancode
  mov [Temps+6], ax
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L2: ; Function: (get_scancode,g1)
  xchg si, di
  Bare_heap_check(0)
  hlt
  mov ax, Bare_unit
  mov [Temps+2], ax
  call Bare_is_keyboard_ready
  call Bare_make_bool_from_nz
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L1
  mov ax, g5
  mov [di], ax
  mov bp, g1
  jmp [bp]

L3: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [si]
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
  mov ax, g8
  mov [di], ax
  mov bp, g6
  jmp [bp]

L4: ; Function: (loop,g6)
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L3
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g7
  mov [di], ax
  mov bp, g1
  jmp [bp]

L5: ; Arm: 6'28
  mov ax, g10
  mov bx, [si]
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+4], ax
  mov ax, [Temps+4]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, [si]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+8], ax
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, g9
  jmp [bp]

L6: ; Function: (loop,g9)
  xchg si, di
  Bare_heap_check(0)
  mov ax, [si]
  cmp word ax, 85
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L5
  mov ax, g11
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L7: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  call Bare_init_interrupt_mode
  mov [Temps+2], ax
  mov ax, g13
  mov [di], ax
  mov bp, g6
  jmp [bp]

L8: ; Start
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L7
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, 1
  mov [di], ax
  mov bp, g9
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
  dw L6
g10:
  dw 85
  db `Press/release keys; see the scan codes...\n`
g11:
  dw 1
g12:
  dw 1
g13:
  dw 1

bare_start: jmp L8
