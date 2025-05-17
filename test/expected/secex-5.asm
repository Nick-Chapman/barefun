L1: ; Function: (lam,t1)
  Bare_enter_check(0)
  mov bp, [bp+2]
  mov si, si
  jmp [bp]

L2: ; Function: (block,g1)
  Bare_enter_check(6)
  push word si
  push word L1
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L3: ; Arm: 30'25
  call Bare_get_keyboard_last_scancode
  mov [Temps+6], ax
  mov si, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L4: ; Function: (get_scan,g2)
  Bare_enter_check(0)
  hlt
  mov ax, Bare_unit
  mov [Temps+2], ax
  call Bare_is_keyboard_ready
  call Bare_make_bool_from_nz
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L3
  mov bp, g2
  mov si, g6
  jmp [bp]

L5: ; Arm: 116'16
  mov si, g23
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L6: ; Continuation
  Bare_enter_check(0)
  mov bx, si
  cmp word [bx], 3
  jz L5
  mov ax, [bp+6]
  mov bx, [bp+8]
  mov dx, [bp+4]
  sar bx, 1
  call Bare_set_bytes
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, [bp+8]
  sar ax, 1
  mov bx, 3
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+4], ax
  mov bp, [bp+10]
  mov si, [Temps+4]
  jmp [bp]

L7: ; Arm: 8'9
  mov si, g21
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L8: ; Function: (loop,t2)
  Bare_enter_check(14)
  mov ax, si
  cmp word ax, 1025
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word si
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L6
  mov cx, sp
  push word 12 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L7
  mov si, g22
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L9: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L10: ; Function: (lam,g24)
  Bare_enter_check(600)
  mov ax, 1025
  call Bare_make_bytes
  mov [Temps+2], ax
  push word [Temps+2]
  push word si
  push word L8
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word cx
  push word L9
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [Temps+4]
  mov si, 1
  jmp [bp]

L11: ; Arm: 81'14
  mov si, g35
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L12: ; Continuation
  Bare_enter_check(0)
  mov bx, si
  cmp word [bx], 3
  jz L11
  mov ax, g36
  mov bx, [bp+4]
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+2], ax
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+4], ax
  mov ax, [bp+4]
  sar ax, 1
  mov bx, 3
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov bp, g32
  mov si, [Temps+6]
  jmp [bp]

L13: ; Arm: 8'9
  mov si, g33
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L14: ; Function: (loop,g32)
  Bare_enter_check(8)
  mov ax, si
  cmp word ax, 37
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word si
  push word cx
  push word L12
  mov cx, sp
  push word 6 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L13
  mov si, g34
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L15: ; Arm: 81'14
  mov si, g41
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L16: ; Continuation
  Bare_enter_check(0)
  mov bx, si
  cmp word [bx], 3
  jz L15
  mov ax, g42
  mov bx, [bp+4]
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+2], ax
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+4], ax
  mov ax, [bp+4]
  sar ax, 1
  mov bx, 3
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov bp, g38
  mov si, [Temps+6]
  jmp [bp]

L17: ; Arm: 8'9
  mov si, g39
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L18: ; Function: (loop,g38)
  Bare_enter_check(8)
  mov ax, si
  cmp word ax, 57
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word si
  push word cx
  push word L16
  mov cx, sp
  push word 6 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L17
  mov si, g40
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L19: ; Continuation
  Bare_enter_check(0)
  mov bp, si
  mov si, g12
  jmp [bp]

L20: ; Arm: 55'23
  push word cx
  push word L19
  mov cx, sp
  push word 4 ;; scanned
  mov si, [bp+8]
  mov bp, [bp+10]
  jmp [bp]

L21: ; Continuation
  Bare_enter_check(0)
  mov bp, si
  mov si, g13
  jmp [bp]

L22: ; Arm: 56'26
  push word cx
  push word L21
  mov cx, sp
  push word 4 ;; scanned
  mov si, [bp+8]
  mov bp, [bp+10]
  jmp [bp]

L23: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L24: ; Arm: 57'25
  push word [bp+12]
  push word cx
  push word L23
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+10]
  mov si, g14
  jmp [bp]

L25: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L26: ; Arm: 58'28
  push word [bp+12]
  push word cx
  push word L25
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+10]
  mov si, g15
  jmp [bp]

L27: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L28: ; Arm: 59'32
  push word [bp+12]
  push word cx
  push word L27
  mov cx, sp
  push word 6 ;; scanned
  mov si, [bp+8]
  mov bp, [bp+10]
  jmp [bp]

L29: ; Arm: 60'24
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
  mov si, `\x7f`
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L30: ; Arm: 61'26
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
  mov si, ` `
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L31: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L32: ; Arm: 64'27
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
  sar ax, 1
  mov bx, 97
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
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
  sar ax, 1
  mov bx, 97
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
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
  sar ax, 1
  mov bx, 97
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
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
  push word [bp+12]
  push word cx
  push word L31
  mov cx, sp
  push word 6 ;; scanned
  mov si, [bp+8]
  mov bp, [bp+10]
  jmp [bp]

L33: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L34: ; Arm: 65'32
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
  sar ax, 1
  mov bx, 97
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
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
  sar ax, 1
  mov bx, 97
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
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
  sar ax, 1
  mov bx, 97
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
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
  push word [bp+12]
  push word cx
  push word L33
  mov cx, sp
  push word 6 ;; scanned
  mov si, [bp+8]
  mov bp, [bp+10]
  jmp [bp]

L35: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L36: ; Arm: 68'22
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
  sar ax, 1
  mov bx, 97
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
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
  sar ax, 1
  mov bx, 97
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
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
  sar ax, 1
  mov bx, 97
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
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
  push word [bp+12]
  push word cx
  push word L35
  mov cx, sp
  push word 6 ;; scanned
  mov si, [bp+8]
  mov bp, [bp+10]
  jmp [bp]

L37: ; Arm: 71'24
  mov ax, [Temps+2]
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  sar ax, 1
  mov bx, 129
  sar bx, 1
  sub ax, bx
  shl ax, 1
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
  mov si, [Temps+10]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L38: ; Continuation
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 3
  jz L34
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
  jz L36
  mov bx, [bp+12]
  cmp word [bx], 3
  jz L37
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
  mov si, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L39: ; Arm: 8'9
  mov si, g19
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L40: ; Continuation
  Bare_enter_check(20)
  mov bx, si
  mov ax, [bx]
  mov [Temps+2], ax
  mov ax, [bp+14]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L32
  mov ax, [bp+14]
  cmp word ax, [Temps+2]
  call Bare_make_bool_from_n
  mov [Temps+6], ax
  push word si
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L38
  mov cx, sp
  push word 18 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L39
  mov si, g20
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L41: ; Arm: 62'44
  mov si, g16
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L42: ; Arm: 62'72
  mov si, g17
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L43: ; Continuation
  Bare_enter_check(18)
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
  jz L20
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L22
  mov bx, [bp+16]
  cmp word [bx], 3
  jz L24
  mov bx, si
  cmp word [bx], 3
  jz L26
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L28
  mov ax, [bp+14]
  cmp word ax, 29
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L29
  mov ax, [bp+14]
  cmp word ax, 115
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L30
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L40
  mov cx, sp
  push word 16 ;; scanned
  mov bx, [bp+12]
  cmp word [bx], 3
  jz L41
  mov bx, [bp+8]
  cmp word [bx], 3
  jz L42
  mov si, g18
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L44: ; Arm: 49'38
  mov si, g11
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L45: ; Continuation
  Bare_enter_check(20)
  mov ax, [bp+14]
  cmp word ax, 341
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  push word si
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L43
  mov cx, sp
  push word 18 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L44
  mov ax, [bp+14]
  cmp word ax, 365
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  mov si, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L46: ; Arm: 48'36
  mov si, g10
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L47: ; Continuation
  Bare_enter_check(18)
  mov ax, si
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
  push word cx
  push word L45
  mov cx, sp
  push word 16 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L46
  mov ax, [Temps+2]
  cmp word ax, 109
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov si, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L48: ; Function: (lam,t1)
  Bare_enter_check(16)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L47
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g2
  mov si, g9
  jmp [bp]

L49: ; Function: (loop,t3)
  Bare_enter_check(12)
  push word bp
  push word si
  push word [bp+4]
  push word [bp+2]
  push word L48
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov si, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L50: ; Arm: 106'16
  mov si, g28
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L51: ; Continuation
  Bare_enter_check(0)
  mov ax, si
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, [bp+4]
  sar ax, 1
  mov bx, 3
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+4], ax
  mov bp, [bp+6]
  mov si, [Temps+4]
  jmp [bp]

L52: ; Arm: 108'32
  mov si, [bp+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L53: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L51
  mov cx, sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L52
  mov si, `.`
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L54: ; Arm: 101'12
  mov si, g29
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L55: ; Continuation
  Bare_enter_check(12)
  mov bx, si
  cmp word [bx], 3
  jz L50
  mov ax, [bp+4]
  mov bx, [bp+6]
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+2], ax
  mov ax, [Temps+2]
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+4], ax
  mov ax, [Temps+4]
  cmp word ax, 65
  call Bare_make_bool_from_n
  mov [Temps+6], ax
  push word [Temps+2]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L53
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L54
  mov ax, [Temps+4]
  cmp word ax, 255
  call Bare_make_bool_from_n
  mov [Temps+8], ax
  mov si, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L56: ; Arm: 8'9
  mov si, g26
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L57: ; Continuation
  Bare_enter_check(12)
  mov ax, [bp+6]
  cmp word ax, 1025
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L55
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L56
  mov si, g27
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L58: ; Arm: 105'19
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov si, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L59: ; Function: (loop,t8)
  Bare_enter_check(12)
  mov ax, si
  sar ax, 1
  mov bx, 129
  sar bx, 1
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+2], dx
  mov ax, [Temps+2]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  push word bp
  push word si
  push word [bp+2]
  push word cx
  push word L57
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L58
  mov si, g25
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L60: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, g30
  jmp [bp]

L61: ; Continuation
  Bare_enter_check(600)
  mov ax, si
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, si
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+4], ax
  mov ax, [Temps+4]
  sar ax, 1
  mov bx, 97
  sar bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov ax, 1025
  call Bare_make_bytes
  mov [Temps+10], ax
  mov ax, [Temps+6]
  sar ax, 1
  mov bx, [Temps+10]
  call Bare_load_sector
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov ax, [Temps+10]
  mov [Temps+14], ax
  push word [Temps+14]
  push word L59
  mov [Temps+16], sp
  push word 4 ;; scanned
  push word [bp+4]
  push word cx
  push word L60
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [Temps+16]
  mov si, 1
  jmp [bp]

L62: ; Continuation
  Bare_enter_check(8)
  mov bx, [bp+4]
  mov ax, [bx]
  mov [Temps+2], ax
  push word [bp+6]
  push word cx
  push word L61
  mov cx, sp
  push word 6 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L63: ; Arm: 143'19
  mov bx, [bp+4]
  mov ax, [bx]
  mov [Temps+6], ax
  push word [bp+12]
  push word [bp+6]
  push word cx
  push word L62
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, [Temps+6]
  jmp [bp]

L64: ; Continuation
  Bare_enter_check(0)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, [bp+6]
  sar ax, 1
  mov bx, si
  call Bare_store_sector
  mov ax, Bare_unit
  mov [Temps+4], ax
  mov bp, [bp+4]
  mov si, g31
  jmp [bp]

L65: ; Continuation
  Bare_enter_check(10)
  mov ax, si
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L64
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L66: ; Continuation
  Bare_enter_check(12)
  mov bx, [bp+4]
  mov ax, [bx]
  mov [Temps+2], ax
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L65
  mov cx, sp
  push word 10 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L67: ; Continuation
  Bare_enter_check(14)
  mov ax, si
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, si
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+4], ax
  mov ax, [Temps+4]
  sar ax, 1
  mov bx, 97
  sar bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov bx, [bp+4]
  mov ax, [bx]
  mov [Temps+8], ax
  push word [Temps+6]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word cx
  push word L66
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+8]
  mov si, [Temps+8]
  jmp [bp]

L68: ; Continuation
  Bare_enter_check(16)
  mov bx, [bp+6]
  mov ax, [bx]
  mov [Temps+2], ax
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L67
  mov cx, sp
  push word 14 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L69: ; Arm: 144'21
  mov bx, [bp+4]
  mov ax, [bx]
  mov [Temps+8], ax
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L68
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+8]
  mov si, [Temps+8]
  jmp [bp]

L70: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, g37
  jmp [bp]

L71: ; Continuation
  Bare_enter_check(16)
  mov ax, si
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, si
  cmp word ax, `r`
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L63
  mov ax, si
  cmp word ax, `w`
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L69
  push word [bp+12]
  push word cx
  push word L70
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g32
  mov si, 1
  jmp [bp]

L72: ; Continuation
  Bare_enter_check(16)
  mov bx, [bp+6]
  mov ax, [bx]
  mov [Temps+2], ax
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L71
  mov cx, sp
  push word 14 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L73: ; Function: (xloop,t1)
  Bare_enter_check(16)
  mov ax, `>`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov bx, [bp+2]
  mov ax, [bx]
  mov [Temps+4], ax
  push word bp
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L72
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+4]
  jmp [bp]

L74: ; Arm: 106'16
  mov si, g46
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L75: ; Continuation
  Bare_enter_check(0)
  mov ax, si
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, [bp+4]
  sar ax, 1
  mov bx, 3
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+4], ax
  mov bp, [bp+6]
  mov si, [Temps+4]
  jmp [bp]

L76: ; Arm: 108'32
  mov si, [bp+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L77: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L75
  mov cx, sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L76
  mov si, `.`
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L78: ; Arm: 101'12
  mov si, g47
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L79: ; Continuation
  Bare_enter_check(12)
  mov bx, si
  cmp word [bx], 3
  jz L74
  mov ax, [bp+4]
  mov bx, [bp+6]
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+2], ax
  mov ax, [Temps+2]
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+4], ax
  mov ax, [Temps+4]
  cmp word ax, 65
  call Bare_make_bool_from_n
  mov [Temps+6], ax
  push word [Temps+2]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L77
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L78
  mov ax, [Temps+4]
  cmp word ax, 255
  call Bare_make_bool_from_n
  mov [Temps+8], ax
  mov si, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L80: ; Arm: 8'9
  mov si, g44
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L81: ; Continuation
  Bare_enter_check(12)
  mov ax, [bp+6]
  cmp word ax, 1025
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L79
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L80
  mov si, g45
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L82: ; Arm: 105'19
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov si, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L83: ; Function: (loop,t4)
  Bare_enter_check(12)
  mov ax, si
  sar ax, 1
  mov bx, 129
  sar bx, 1
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+2], dx
  mov ax, [Temps+2]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  push word bp
  push word si
  push word [bp+2]
  push word cx
  push word L81
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L82
  mov si, g43
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L84: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, g48
  jmp [bp]

L85: ; Continuation
  Bare_enter_check(600)
  mov ax, 1025
  call Bare_make_bytes
  mov [Temps+2], ax
  mov ax, 5
  sar ax, 1
  mov bx, [Temps+2]
  call Bare_load_sector
  mov ax, Bare_unit
  mov [Temps+4], ax
  mov ax, [Temps+2]
  mov [Temps+6], ax
  push word [Temps+6]
  push word L83
  mov [Temps+8], sp
  push word 4 ;; scanned
  push word [bp+4]
  push word cx
  push word L84
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [Temps+8]
  mov si, 1
  jmp [bp]

L86: ; Continuation
  Bare_enter_check(20)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L73
  mov [Temps+2], sp
  push word 10 ;; scanned
  push word [Temps+2]
  push word cx
  push word L85
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g38
  mov si, 1
  jmp [bp]

L87: ; Start
  Bare_enter_check(28)
  push word g7
  mov [Temps+2], sp
  push word 2 ;; scanned
  push word g8
  mov [Temps+4], sp
  push word 2 ;; scanned
  push word [Temps+4]
  push word [Temps+2]
  push word L49
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word [Temps+4]
  push word [Temps+2]
  push word cx
  push word L86
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g1
  mov si, g24
  jmp [bp]

g1:
  dw L2
g2:
  dw L4
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
  dw 1
g10:
  dw 3
g11:
  dw 3
g12:
  dw 3
g13:
  dw 1
g14:
  dw 3
g15:
  dw 1
g16:
  dw 103
  db `   @            QWERTYUIOP    ASDFGHJKL     ZXCVBNM`
g17:
  dw 109
  db `  !@#$%^&*()_+ \x09QWERTYUIOP{}\n ASDFGHJKL:"~ |ZXCVBNM<>?`
g18:
  dw 109
  db `  1234567890-= \x09qwertyuiop[]\n asdfghjkl;'\` \\zxcvbnm,./`
g19:
  dw 1
g20:
  dw 3
g21:
  dw 1
g22:
  dw 3
g23:
  dw 1
g24:
  dw L10
g25:
  dw 1
g26:
  dw 1
g27:
  dw 3
g28:
  dw 1
g29:
  dw 1
g30:
  dw 1
g31:
  dw 1
g32:
  dw L14
g33:
  dw 1
g34:
  dw 3
g35:
  dw 1
g36:
  dw 37
  db `: unknown command\n`
g37:
  dw 1
g38:
  dw L18
g39:
  dw 1
g40:
  dw 3
g41:
  dw 1
g42:
  dw 57
  db `type r<num> or w<num><char>\n`
g43:
  dw 1
g44:
  dw 1
g45:
  dw 3
g46:
  dw 1
g47:
  dw 1
g48:
  dw 1

bare_start: jmp L87
