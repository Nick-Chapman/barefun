L1: ; Arm: 32'25
  call Bare_get_keyboard_last_scancode
  mov [Temps+6], ax
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L2: ; Function: (get_scancode,g1)[arg0]
  xchg si, di
  Bare_arg_check(1)
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
  mov ax, 1
  jmp [bp]

L3: ; Arm: 6'28
  mov ax, g22
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
  mov bp, g21
  mov ax, 1
  jmp [bp]

L4: ; Function: (loop,g21)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  cmp word ax, 75
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L3
  mov ax, g23
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L5: ; Arm: 57'23
  mov ax, [bp+8]
  mov [di], ax
  mov ax, g11
  mov [di+2], ax
  mov bp, [bp+10]
  mov ax, 2
  jmp [bp]

L6: ; Arm: 58'26
  mov ax, [bp+8]
  mov [di], ax
  mov ax, g12
  mov [di+2], ax
  mov bp, [bp+10]
  mov ax, 2
  jmp [bp]

L7: ; Arm: 59'25
  mov ax, g13
  mov [di], ax
  mov ax, [bp+12]
  mov [di+2], ax
  mov bp, [bp+10]
  mov ax, 2
  jmp [bp]

L8: ; Arm: 60'28
  mov ax, g14
  mov [di], ax
  mov ax, [bp+12]
  mov [di+2], ax
  mov bp, [bp+10]
  mov ax, 2
  jmp [bp]

L9: ; Arm: 61'32
  mov ax, [bp+8]
  mov [di], ax
  mov ax, [bp+12]
  mov [di+2], ax
  mov bp, [bp+10]
  mov ax, 2
  jmp [bp]

L10: ; Arm: 62'24
  mov bx, [bp+4]
  mov ax, [bp+8]
  mov [bx], ax
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov bx, [bp+6]
  mov ax, [bp+12]
  mov [bx], ax
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov ax, `\x7f`
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L11: ; Arm: 63'26
  mov bx, [bp+4]
  mov ax, [bp+8]
  mov [bx], ax
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov bx, [bp+6]
  mov ax, [bp+12]
  mov [bx], ax
  mov ax, Bare_unit
  mov [Temps+14], ax
  mov ax, ` `
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L12: ; Arm: 66'27
  mov ax, [bp+14]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+6], dx
  mov ax, [bp+14]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+8], ax
  mov ax, [Temps+8]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+10], dx
  mov ax, [Temps+8]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+12], ax
  mov ax, `{`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+14], ax
  mov ax, [Temps+12]
  mov bx, 97
  add ax, bx
  sub ax, 1
  mov [Temps+16], ax
  mov ax, [Temps+16]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+18], ax
  mov ax, [Temps+18]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+20], ax
  mov ax, [Temps+10]
  mov bx, 97
  add ax, bx
  sub ax, 1
  mov [Temps+22], ax
  mov ax, [Temps+22]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+24], ax
  mov ax, [Temps+24]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+26], ax
  mov ax, [Temps+6]
  mov bx, 97
  add ax, bx
  sub ax, 1
  mov [Temps+28], ax
  mov ax, [Temps+28]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+30], ax
  mov ax, [Temps+30]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+32], ax
  mov ax, `}`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+34], ax
  mov ax, [bp+8]
  mov [di], ax
  mov ax, [bp+12]
  mov [di+2], ax
  mov bp, [bp+10]
  mov ax, 2
  jmp [bp]

L13: ; Arm: 67'32
  mov ax, [bp+14]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+2], dx
  mov ax, [bp+14]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+4], ax
  mov ax, [Temps+4]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+6], dx
  mov ax, [Temps+4]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+8], ax
  mov ax, `{`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov ax, [Temps+8]
  mov bx, 97
  add ax, bx
  sub ax, 1
  mov [Temps+12], ax
  mov ax, [Temps+12]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+14], ax
  mov ax, [Temps+14]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+16], ax
  mov ax, [Temps+6]
  mov bx, 97
  add ax, bx
  sub ax, 1
  mov [Temps+18], ax
  mov ax, [Temps+18]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+20], ax
  mov ax, [Temps+20]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+22], ax
  mov ax, [Temps+2]
  mov bx, 97
  add ax, bx
  sub ax, 1
  mov [Temps+24], ax
  mov ax, [Temps+24]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+26], ax
  mov ax, [Temps+26]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+28], ax
  mov ax, `}`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+30], ax
  mov ax, [bp+8]
  mov [di], ax
  mov ax, [bp+12]
  mov [di+2], ax
  mov bp, [bp+10]
  mov ax, 2
  jmp [bp]

L14: ; Arm: 70'22
  mov ax, [bp+14]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+6], dx
  mov ax, [bp+14]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+8], ax
  mov ax, [Temps+8]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+10], dx
  mov ax, [Temps+8]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+12], ax
  mov ax, `{`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+14], ax
  mov ax, [Temps+12]
  mov bx, 97
  add ax, bx
  sub ax, 1
  mov [Temps+16], ax
  mov ax, [Temps+16]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+18], ax
  mov ax, [Temps+18]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+20], ax
  mov ax, [Temps+10]
  mov bx, 97
  add ax, bx
  sub ax, 1
  mov [Temps+22], ax
  mov ax, [Temps+22]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+24], ax
  mov ax, [Temps+24]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+26], ax
  mov ax, [Temps+6]
  mov bx, 97
  add ax, bx
  sub ax, 1
  mov [Temps+28], ax
  mov ax, [Temps+28]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+30], ax
  mov ax, [Temps+30]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+32], ax
  mov ax, `}`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+34], ax
  mov ax, [bp+8]
  mov [di], ax
  mov ax, [bp+12]
  mov [di+2], ax
  mov bp, [bp+10]
  mov ax, 2
  jmp [bp]

L15: ; Arm: 73'24
  mov ax, [Temps+2]
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  mov bx, 129
  sub ax, bx
  add ax, 1
  mov [Temps+8], ax
  mov ax, [Temps+8]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+10], ax
  mov bx, [bp+4]
  mov ax, [bp+8]
  mov [bx], ax
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov bx, [bp+6]
  mov ax, [bp+12]
  mov [bx], ax
  mov ax, Bare_unit
  mov [Temps+14], ax
  mov ax, [Temps+10]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L16: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov bx, [si]
  cmp word [bx], 3
  jz L13
  mov ax, [bp+16]
  mov bx, [bp+14]
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+2], ax
  mov ax, [Temps+2]
  cmp word ax, ` `
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L14
  mov bx, [bp+12]
  cmp word [bx], 3
  jz L15
  mov bx, [bp+4]
  mov ax, [bp+8]
  mov [bx], ax
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov bx, [bp+6]
  mov ax, [bp+12]
  mov [bx], ax
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L17: ; Arm: 11'9
  mov ax, g18
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L18: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(20)
  mov bx, [si]
  mov ax, [bx]
  mov [Temps+2], ax
  mov ax, [bp+14]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L12
  mov ax, [bp+14]
  cmp word ax, [Temps+2]
  call Bare_make_bool_from_n
  mov [Temps+6], ax
  push word [si]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L16
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L17
  mov ax, g19
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L19: ; Arm: 64'44
  mov ax, g15
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L20: ; Arm: 64'72
  mov ax, g16
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L21: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(18)
  mov ax, 257
  cmp word ax, [bp+14]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov ax, [bp+14]
  cmp word ax, 59
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  mov ax, [bp+14]
  cmp word ax, 315
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L5
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L6
  mov bx, [bp+16]
  cmp word [bx], 3
  jz L7
  mov bx, [si]
  cmp word [bx], 3
  jz L8
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L9
  mov ax, [bp+14]
  cmp word ax, 29
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L10
  mov ax, [bp+14]
  cmp word ax, 115
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L11
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L18
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bx, [bp+12]
  cmp word [bx], 3
  jz L19
  mov bx, [bp+8]
  cmp word [bx], 3
  jz L20
  mov ax, g17
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L22: ; Arm: 51'35
  mov ax, g10
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L23: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(20)
  mov ax, [bp+14]
  cmp word ax, 341
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  push word [si]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L21
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L22
  mov ax, [bp+14]
  cmp word ax, 365
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L24: ; Arm: 50'33
  mov ax, g9
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L25: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(18)
  mov ax, [si]
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov ax, [Temps+2]
  cmp word ax, 85
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  push word [Temps+2]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L23
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L24
  mov ax, [Temps+2]
  cmp word ax, 109
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L26: ; Function: (loop,t3)
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(16)
  push word [si+2]
  push word bp
  push word [si]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L25
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov ax, g8
  mov [di], ax
  mov bp, g1
  mov ax, 1
  jmp [bp]

L27: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, g20
  mov [di], ax
  mov bp, [bp+4]
  mov ax, 1
  jmp [bp]

L28: ; Function: (loop,t4)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  mov bx, [bp+4]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [bp+2]
  mov ax, [bx]
  mov [Temps+4], ax
  push word bp
  push word [CurrentCont]
  push word L27
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov bp, [bp+6]
  mov ax, 2
  jmp [bp]

L29: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  call Bare_init_interrupt_mode
  mov [Temps+2], ax
  mov ax, g25
  mov [di], ax
  mov bp, [bp+4]
  mov ax, 1
  jmp [bp]

L30: ; Start
  xchg si, di
  Bare_arg_check(0)
  Bare_heap_check(34)
  push word g6
  mov [Temps+2], sp
  push word 2 ;; scanned
  push word g7
  mov [Temps+4], sp
  push word 2 ;; scanned
  push word [Temps+4]
  push word [Temps+2]
  push word L26
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word [Temps+4]
  push word [Temps+2]
  push word L28
  mov [Temps+8], sp
  push word 8 ;; scanned
  push word [Temps+8]
  push word [CurrentCont]
  push word L29
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, 1
  mov [di], ax
  mov bp, g21
  mov ax, 1
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
  dw 1
g7:
  dw 1
g8:
  dw 1
g9:
  dw 3
g10:
  dw 3
g11:
  dw 3
g12:
  dw 1
g13:
  dw 3
g14:
  dw 1
g15:
  dw 103
  db `   @            QWERTYUIOP    ASDFGHJKL     ZXCVBNM`
g16:
  dw 109
  db `  !@#$%^&*()_+ \x09QWERTYUIOP{}\n ASDFGHJKL:"~ |ZXCVBNM<>?`
g17:
  dw 109
  db `  1234567890-= \x09qwertyuiop[]\n asdfghjkl;'\` \\zxcvbnm,./`
g18:
  dw 1
g19:
  dw 3
g20:
  dw 1
g21:
  dw L4
g22:
  dw 75
  db `See scan codes converted to ASCII...\n`
g23:
  dw 1
g24:
  dw 1
g25:
  dw 1

bare_start: jmp L30
