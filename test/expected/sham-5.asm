L1: ; Function: (lam,t1)
  Bare_enter_check(0)
  mov bp, [bp+2]
  mov dx, dx
  jmp [bp]

L2: ; Function: (block,g1)
  Bare_enter_check(6)
  push word dx
  push word L1
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L3: ; Arm: 22'7
  mov dx, 1
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L4: ; Continuation
  Bare_enter_check(0)
  mov ax, 3
  sar ax, 1
  mov bx, dx
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L5: ; Function: (length,g2)
  Bare_enter_check(6)
  mov bx, dx
  cmp word [bx], 1
  jz L3
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word cx
  push word L4
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g2
  mov dx, [Temps+4]
  jmp [bp]

L6: ; Arm: 27'7
  mov dx, g4
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L7: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word [bp+4]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L8: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L7
  mov cx, sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L9: ; Continuation
  Bare_enter_check(10)
  push word dx
  push word [bp+6]
  push word cx
  push word L8
  mov cx, sp
  push word 8 ;; scanned
  mov dx, [bp+4]
  mov bp, g3
  jmp [bp]

L10: ; Function: (lam,t1)
  Bare_enter_check(10)
  mov bx, dx
  cmp word [bx], 1
  jz L6
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [bp+2]
  push word cx
  push word L9
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+2]
  jmp [bp]

L11: ; Function: (map,g3)
  Bare_enter_check(6)
  push word dx
  push word L10
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L12: ; Arm: 32'7
  mov dx, g6
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L13: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L14: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L13
  mov cx, sp
  push word 6 ;; scanned
  mov dx, [bp+4]
  mov bp, g5
  jmp [bp]

L15: ; Function: (lam,t1)
  Bare_enter_check(10)
  mov bx, dx
  cmp word [bx], 1
  jz L12
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [bp+2]
  push word cx
  push word L14
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+2]
  jmp [bp]

L16: ; Function: (iter,g5)
  Bare_enter_check(6)
  push word dx
  push word L15
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L17: ; Arm: 37'7
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L18: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L19: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L18
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L20: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L19
  mov cx, sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+6]
  jmp [bp]

L21: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word dx
  push word cx
  push word L20
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L22: ; Function: (lam,t1)
  Bare_enter_check(14)
  mov bx, dx
  cmp word [bx], 1
  jz L17
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L21
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+2]
  mov bp, g7
  jmp [bp]

L23: ; Function: (lam,t1)
  Bare_enter_check(8)
  push word dx
  push word [bp+2]
  push word L22
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L24: ; Function: (fold_left,g7)
  Bare_enter_check(6)
  push word dx
  push word L23
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L25: ; Arm: 42'7
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L26: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L27: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov bx, dx
  cmp word [bx], 1
  jz L25
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [bp+2]
  push word [Temps+2]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+4]
  push word cx
  push word L26
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g8
  mov dx, [Temps+6]
  jmp [bp]

L28: ; Function: (rev_onto,g8)
  Bare_enter_check(6)
  push word dx
  push word L27
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L29: ; Arm: 55'9
  mov dx, g9
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L30: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L31: ; Function: (lam,t1)
  Bare_enter_check(8)
  mov bx, dx
  cmp word [bx], 1
  jz L29
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [bp+2]
  mov bx, [Temps+2]
  mov si, [bp+4]
  sar si, 1
  call Bare_set_bytes
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, [bp+4]
  sar ax, 1
  mov bx, 3
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+8], ax
  push word [Temps+4]
  push word cx
  push word L30
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+8]
  jmp [bp]

L32: ; Function: (loop,t2)
  Bare_enter_check(10)
  push word bp
  push word dx
  push word [bp+2]
  push word L31
  mov [Temps+2], sp
  push word 8 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L33: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L34: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L33
  mov cx, sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L35: ; Continuation
  Bare_enter_check(600)
  mov ax, dx
  call Bare_make_bytes
  mov [Temps+2], ax
  push word [Temps+2]
  push word L32
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word [bp+4]
  push word cx
  push word L34
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [Temps+4]
  mov dx, 1
  jmp [bp]

L36: ; Function: (lam,g10)
  Bare_enter_check(8)
  push word dx
  push word cx
  push word L35
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g2
  mov dx, dx
  jmp [bp]

L37: ; Arm: 66'9
  mov dx, g11
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L38: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L39: ; Function: (lam,t1)
  Bare_enter_check(8)
  mov bx, dx
  cmp word [bx], 1
  jz L37
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [bp+2]
  mov bx, [Temps+2]
  mov si, [bp+4]
  sar si, 1
  call Bare_set_bytes
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, [bp+4]
  sar ax, 1
  mov bx, 3
  sar bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+8], ax
  push word [Temps+4]
  push word cx
  push word L38
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+8]
  jmp [bp]

L40: ; Function: (loop,t2)
  Bare_enter_check(10)
  push word bp
  push word dx
  push word [bp+2]
  push word L39
  mov [Temps+2], sp
  push word 8 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L41: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L42: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L41
  mov cx, sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L43: ; Continuation
  Bare_enter_check(600)
  mov ax, dx
  call Bare_make_bytes
  mov [Temps+2], ax
  push word [Temps+2]
  push word L40
  mov [Temps+4], sp
  push word 4 ;; scanned
  mov ax, dx
  sar ax, 1
  mov bx, 3
  sar bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  push word [Temps+2]
  push word [bp+4]
  push word cx
  push word L42
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [Temps+4]
  mov dx, [Temps+6]
  jmp [bp]

L44: ; Function: (lam,g12)
  Bare_enter_check(8)
  push word dx
  push word cx
  push word L43
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g2
  mov dx, dx
  jmp [bp]

L45: ; Arm: 74'13
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L46: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  sar ax, 1
  mov bx, 3
  sar bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L47: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L45
  mov ax, [bp+2]
  mov bx, dx
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+4], ax
  push word [bp+4]
  push word [Temps+4]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L46
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+6]
  jmp [bp]

L48: ; Function: (explode_loop,t1)
  Bare_enter_check(10)
  push word bp
  push word dx
  push word [bp+2]
  push word L47
  mov [Temps+2], sp
  push word 8 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L49: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  sar ax, 1
  mov bx, 3
  sar bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L50: ; Function: (lam,g14)
  Bare_enter_check(14)
  push word dx
  push word L48
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov bx, dx
  mov ax, [bx]
  mov [Temps+4], ax
  push word [Temps+4]
  push word cx
  push word L49
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [Temps+2]
  mov dx, g13
  jmp [bp]

L51: ; Arm: 82'19
  mov dx, g17
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L52: ; Arm: 84'15
  mov dx, g18
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L53: ; Arm: 87'31
  mov dx, g21
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L54: ; Continuation
  Bare_enter_check(0)
  mov bx, dx
  cmp word [bx], 3
  jz L53
  mov ax, [bp+4]
  sar ax, 1
  mov bx, 3
  sar bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov bp, [bp+6]
  mov dx, [Temps+2]
  jmp [bp]

L55: ; Arm: 8'9
  mov dx, g19
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L56: ; Function: (loop,t1)
  Bare_enter_check(10)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L52
  mov ax, [bp+2]
  mov bx, dx
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+4], ax
  mov ax, [bp+4]
  mov bx, dx
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+6], ax
  mov ax, [Temps+4]
  cmp word ax, [Temps+6]
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  push word bp
  push word dx
  push word cx
  push word L54
  mov cx, sp
  push word 8 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L55
  mov dx, g20
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L57: ; Continuation
  Bare_enter_check(8)
  mov bx, dx
  cmp word [bx], 3
  jz L51
  push word [bp+6]
  push word [bp+4]
  push word L56
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov ax, [bp+8]
  sar ax, 1
  mov bx, 3
  sar bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+4], ax
  mov bp, [Temps+2]
  mov dx, [Temps+4]
  jmp [bp]

L58: ; Arm: 8'9
  mov dx, g15
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L59: ; Function: (lam,t1)
  Bare_enter_check(12)
  mov bx, [bp+2]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, dx
  mov ax, [bx]
  mov [Temps+4], ax
  mov ax, [Temps+2]
  cmp word ax, [Temps+4]
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word [Temps+2]
  push word dx
  push word [bp+2]
  push word cx
  push word L57
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L58
  mov dx, g16
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L60: ; Function: (lam,g22)
  Bare_enter_check(6)
  push word dx
  push word L59
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L61: ; Arm: 112'7
  mov dx, g26
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L62: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, g25
  jmp [bp]

L63: ; Arm: 105'19
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov dx, [Temps+10]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L64: ; Arm: 106'22
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov dx, [Temps+12]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L65: ; Arm: 107'16
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+14], ax
  mov dx, [Temps+14]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L66: ; Function: (put_chars,g25)
  Bare_enter_check(8)
  mov bx, dx
  cmp word [bx], 1
  jz L61
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [Temps+2]
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  cmp word ax, 17
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  push word [Temps+4]
  push word cx
  push word L62
  mov cx, sp
  push word 6 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L63
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L64
  mov ax, 53
  cmp word ax, [Temps+6]
  call Bare_make_bool_from_n
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L65
  mov ax, `^`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+14], ax
  mov ax, 131
  sar ax, 1
  mov bx, [Temps+6]
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+16], ax
  mov ax, [Temps+16]
  sar ax, 1
  mov bx, 3
  sar bx, 1
  sub ax, bx
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
  mov dx, [Temps+22]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L67: ; Arm: 143'25
  call Bare_get_keyboard_last_scancode
  mov [Temps+6], ax
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L68: ; Function: (get_scan,g27)
  Bare_enter_check(0)
  hlt
  mov ax, Bare_unit
  mov [Temps+2], ax
  call Bare_is_keyboard_ready
  call Bare_make_bool_from_nz
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L67
  mov bp, g27
  mov dx, g31
  jmp [bp]

L69: ; Arm: 121'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L70: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  push word dx ;; save
  mov dx, 0
  Div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L71: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L69
  mov ax, dx
  sar ax, 1
  mov bx, 21
  sar bx, 1
  push word dx ;; save
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+4], dx
  pop word dx ;; restore
  mov ax, 97
  sar ax, 1
  mov bx, [Temps+4]
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L70
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g44
  mov dx, [Temps+10]
  jmp [bp]

L72: ; Function: (loop,g44)
  Bare_enter_check(6)
  push word dx
  push word L71
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L73: ; Arm: 121'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L74: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  push word dx ;; save
  mov dx, 0
  Div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L75: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L73
  mov ax, dx
  sar ax, 1
  mov bx, 21
  sar bx, 1
  push word dx ;; save
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+4], dx
  pop word dx ;; restore
  mov ax, 97
  sar ax, 1
  mov bx, [Temps+4]
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L74
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g47
  mov dx, [Temps+10]
  jmp [bp]

L76: ; Function: (loop,g47)
  Bare_enter_check(6)
  push word dx
  push word L75
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L77: ; Arm: 121'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L78: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  push word dx ;; save
  mov dx, 0
  Div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L79: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L77
  mov ax, dx
  sar ax, 1
  mov bx, 21
  sar bx, 1
  push word dx ;; save
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+4], dx
  pop word dx ;; restore
  mov ax, 97
  sar ax, 1
  mov bx, [Temps+4]
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L78
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g52
  mov dx, [Temps+10]
  jmp [bp]

L80: ; Function: (loop,g52)
  Bare_enter_check(6)
  push word dx
  push word L79
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L81: ; Arm: 121'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L82: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  push word dx ;; save
  mov dx, 0
  Div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L83: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L81
  mov ax, dx
  sar ax, 1
  mov bx, 21
  sar bx, 1
  push word dx ;; save
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+4], dx
  pop word dx ;; restore
  mov ax, 97
  sar ax, 1
  mov bx, [Temps+4]
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L82
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g55
  mov dx, [Temps+10]
  jmp [bp]

L84: ; Function: (loop,g55)
  Bare_enter_check(6)
  push word dx
  push word L83
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L85: ; Arm: 121'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L86: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  push word dx ;; save
  mov dx, 0
  Div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L87: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L85
  mov ax, dx
  sar ax, 1
  mov bx, 21
  sar bx, 1
  push word dx ;; save
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+4], dx
  pop word dx ;; restore
  mov ax, 97
  sar ax, 1
  mov bx, [Temps+4]
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L86
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g58
  mov dx, [Temps+10]
  jmp [bp]

L88: ; Function: (loop,g58)
  Bare_enter_check(6)
  push word dx
  push word L87
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L89: ; Arm: 121'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L90: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  push word dx ;; save
  mov dx, 0
  Div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L91: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L89
  mov ax, dx
  sar ax, 1
  mov bx, 21
  sar bx, 1
  push word dx ;; save
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+4], dx
  pop word dx ;; restore
  mov ax, 97
  sar ax, 1
  mov bx, [Temps+4]
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L90
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g61
  mov dx, [Temps+10]
  jmp [bp]

L92: ; Function: (loop,g61)
  Bare_enter_check(6)
  push word dx
  push word L91
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L93: ; Arm: 396'11
  mov dx, dx
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L94: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  sar ax, 1
  mov bx, dx
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L95: ; Continuation
  Bare_enter_check(8)
  mov ax, [bp+4]
  sar ax, 1
  mov bx, 5
  sar bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  push word dx
  push word cx
  push word L94
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g91
  mov dx, [Temps+2]
  jmp [bp]

L96: ; Function: (fib,g91)
  Bare_enter_check(8)
  mov ax, dx
  cmp word ax, 5
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L93
  mov ax, dx
  sar ax, 1
  mov bx, 3
  sar bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+4], ax
  push word dx
  push word cx
  push word L95
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g91
  mov dx, [Temps+4]
  jmp [bp]

L97: ; Function: (lam,g161)
  Bare_enter_check(0)
  mov bx, dx
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L98: ; Arm: 418'9
  push word [bp+2]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L99: ; Arm: 421'15
  mov dx, g226
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L100: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L101: ; Continuation
  Bare_enter_check(8)
  mov bx, dx
  cmp word [bx], 1
  jz L99
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, 21
  sar ax, 1
  mov bx, [bp+4]
  sar bx, 1
  mul bx
  shl ax, 1
  add ax, 1
  mov [Temps+4], ax
  mov ax, [Temps+4]
  sar ax, 1
  mov bx, [Temps+2]
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  push word [bp+6]
  push word cx
  push word L100
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g219
  mov dx, [Temps+6]
  jmp [bp]

L102: ; Arm: 413'27
  push word [bp+4]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L103: ; Continuation
  Bare_enter_check(6)
  mov bx, dx
  cmp word [bx], 3
  jz L102
  mov dx, g224
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L104: ; Arm: 8'9
  mov dx, g222
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L105: ; Arm: 413'12
  mov ax, 19
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+8]
  push word cx
  push word L103
  mov cx, sp
  push word 6 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L104
  mov dx, g223
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L106: ; Continuation
  Bare_enter_check(18)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L101
  mov cx, sp
  push word 8 ;; scanned
  mov bx, dx
  cmp word [bx], 3
  jz L105
  mov dx, g225
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L107: ; Arm: 8'9
  mov dx, g220
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L108: ; Function: (lam,t1)
  Bare_enter_check(12)
  mov bx, dx
  cmp word [bx], 1
  jz L98
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [Temps+2]
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  sar ax, 1
  mov bx, 97
  sar bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+8], ax
  mov ax, [Temps+8]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+10], ax
  push word [Temps+8]
  push word [Temps+4]
  push word [bp+2]
  push word cx
  push word L106
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L107
  mov dx, g221
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L109: ; Function: (loop,g219)
  Bare_enter_check(6)
  push word dx
  push word L108
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L110: ; Arm: 121'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L111: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  push word dx ;; save
  mov dx, 0
  Div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L112: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L110
  mov ax, dx
  sar ax, 1
  mov bx, 21
  sar bx, 1
  push word dx ;; save
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+4], dx
  pop word dx ;; restore
  mov ax, 97
  sar ax, 1
  mov bx, [Temps+4]
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L111
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g230
  mov dx, [Temps+10]
  jmp [bp]

L113: ; Function: (loop,g230)
  Bare_enter_check(6)
  push word dx
  push word L112
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L114: ; Arm: 121'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L115: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  push word dx ;; save
  mov dx, 0
  Div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L116: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L114
  mov ax, dx
  sar ax, 1
  mov bx, 21
  sar bx, 1
  push word dx ;; save
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+4], dx
  pop word dx ;; restore
  mov ax, 97
  sar ax, 1
  mov bx, [Temps+4]
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L115
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g233
  mov dx, [Temps+10]
  jmp [bp]

L117: ; Function: (loop,g233)
  Bare_enter_check(6)
  push word dx
  push word L116
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L118: ; Arm: 121'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L119: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  push word dx ;; save
  mov dx, 0
  Div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L120: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L118
  mov ax, dx
  sar ax, 1
  mov bx, 21
  sar bx, 1
  push word dx ;; save
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+4], dx
  pop word dx ;; restore
  mov ax, 97
  sar ax, 1
  mov bx, [Temps+4]
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L119
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g237
  mov dx, [Temps+10]
  jmp [bp]

L121: ; Function: (loop,g237)
  Bare_enter_check(6)
  push word dx
  push word L120
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L122: ; Arm: 121'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L123: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  push word dx ;; save
  mov dx, 0
  Div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L124: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L122
  mov ax, dx
  sar ax, 1
  mov bx, 21
  sar bx, 1
  push word dx ;; save
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+4], dx
  pop word dx ;; restore
  mov ax, 97
  sar ax, 1
  mov bx, [Temps+4]
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L123
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g240
  mov dx, [Temps+10]
  jmp [bp]

L125: ; Function: (loop,g240)
  Bare_enter_check(6)
  push word dx
  push word L124
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L126: ; Arm: 121'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L127: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  push word dx ;; save
  mov dx, 0
  Div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L128: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L126
  mov ax, dx
  sar ax, 1
  mov bx, 21
  sar bx, 1
  push word dx ;; save
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+4], dx
  pop word dx ;; restore
  mov ax, 97
  sar ax, 1
  mov bx, [Temps+4]
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L127
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g246
  mov dx, [Temps+10]
  jmp [bp]

L129: ; Function: (loop,g246)
  Bare_enter_check(6)
  push word dx
  push word L128
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L130: ; Arm: 121'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L131: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  push word dx ;; save
  mov dx, 0
  Div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L132: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L130
  mov ax, dx
  sar ax, 1
  mov bx, 21
  sar bx, 1
  push word dx ;; save
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+4], dx
  pop word dx ;; restore
  mov ax, 97
  sar ax, 1
  mov bx, [Temps+4]
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L131
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g249
  mov dx, [Temps+10]
  jmp [bp]

L133: ; Function: (loop,g249)
  Bare_enter_check(6)
  push word dx
  push word L132
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L134: ; Continuation
  Bare_enter_check(0)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L135: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, [Temps+2]
  jmp [bp]

L136: ; Arm: 124'11
  push word g247
  push word `0`
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  mov dx, [Temps+10]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L137: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L138: ; Arm: 128'2
  mov ax, 1
  sar ax, 1
  mov bx, [Temps+2]
  sar bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  push word cx
  push word L135
  mov cx, sp
  push word 4 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L136
  push word [Temps+6]
  push word cx
  push word L137
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g246
  mov dx, g248
  jmp [bp]

L139: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L140: ; Arm: 124'11
  push word g250
  push word `0`
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L141: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L142: ; Function: (lam,t1)
  Bare_enter_check(22)
  call Bare_free_words
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov ax, [Temps+2]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+4], ax
  push word [bp+2]
  push word cx
  push word L134
  mov cx, sp
  push word 6 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L138
  mov ax, [Temps+2]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word cx
  push word L139
  mov cx, sp
  push word 4 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L140
  push word [Temps+2]
  push word cx
  push word L141
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g249
  mov dx, g251
  jmp [bp]

L143: ; Function: (lam,g252)
  Bare_enter_check(6)
  push word dx
  push word L142
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L144: ; Arm: 96'7
  mov dx, g23
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L145: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L146: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L145
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L147: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L146
  mov cx, sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L148: ; Continuation
  Bare_enter_check(12)
  push word [bp+6]
  push word dx
  push word [bp+4]
  push word cx
  push word L147
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g8
  mov dx, g24
  jmp [bp]

L149: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L148
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L150: ; Continuation
  Bare_enter_check(10)
  push word dx
  push word [bp+4]
  push word cx
  push word L149
  mov cx, sp
  push word 8 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L151: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L150
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L152: ; Function: (concat,t1)
  Bare_enter_check(12)
  mov bx, dx
  cmp word [bx], 1
  jz L144
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+2]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L151
  mov cx, sp
  push word 10 ;; scanned
  mov bp, bp
  mov dx, [Temps+4]
  jmp [bp]

L153: ; Continuation
  Bare_enter_check(0)
  mov bp, dx
  mov dx, g37
  jmp [bp]

L154: ; Arm: 168'23
  push word cx
  push word L153
  mov cx, sp
  push word 4 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+10]
  jmp [bp]

L155: ; Continuation
  Bare_enter_check(0)
  mov bp, dx
  mov dx, g38
  jmp [bp]

L156: ; Arm: 169'26
  push word cx
  push word L155
  mov cx, sp
  push word 4 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+10]
  jmp [bp]

L157: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L158: ; Arm: 170'25
  push word [bp+12]
  push word cx
  push word L157
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+10]
  mov dx, g39
  jmp [bp]

L159: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L160: ; Arm: 171'28
  push word [bp+12]
  push word cx
  push word L159
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+10]
  mov dx, g40
  jmp [bp]

L161: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L162: ; Arm: 172'32
  push word [bp+12]
  push word cx
  push word L161
  mov cx, sp
  push word 6 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+10]
  jmp [bp]

L163: ; Arm: 173'24
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
  mov dx, `\x7f`
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L164: ; Arm: 174'26
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
  mov dx, ` `
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L165: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L166: ; Continuation
  Bare_enter_check(8)
  mov ax, `}`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  push word [bp+8]
  push word cx
  push word L165
  mov cx, sp
  push word 6 ;; scanned
  mov dx, [bp+4]
  mov bp, [bp+6]
  jmp [bp]

L167: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, [Temps+2]
  jmp [bp]

L168: ; Arm: 124'11
  push word g45
  push word `0`
  push word 3
  mov [Temps+14], sp
  push word 6 ;; scanned
  mov dx, [Temps+14]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L169: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L170: ; Arm: 128'2
  mov ax, 1
  sar ax, 1
  mov bx, [bp+14]
  sar bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+10], ax
  mov ax, [Temps+10]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+12], ax
  push word cx
  push word L167
  mov cx, sp
  push word 4 ;; scanned
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L168
  push word [Temps+10]
  push word cx
  push word L169
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g44
  mov dx, g46
  jmp [bp]

L171: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L172: ; Arm: 124'11
  push word g48
  push word `0`
  push word 3
  mov [Temps+12], sp
  push word 6 ;; scanned
  mov dx, [Temps+12]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L173: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L174: ; Arm: 177'27
  mov ax, `{`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, [bp+14]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+8], ax
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word cx
  push word L166
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L170
  mov ax, [bp+14]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  push word cx
  push word L171
  mov cx, sp
  push word 4 ;; scanned
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L172
  push word [bp+14]
  push word cx
  push word L173
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g47
  mov dx, g49
  jmp [bp]

L175: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L176: ; Continuation
  Bare_enter_check(8)
  mov ax, `}`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  push word [bp+8]
  push word cx
  push word L175
  mov cx, sp
  push word 6 ;; scanned
  mov dx, [bp+4]
  mov bp, [bp+6]
  jmp [bp]

L177: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, [Temps+2]
  jmp [bp]

L178: ; Arm: 124'11
  push word g53
  push word `0`
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  mov dx, [Temps+10]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L179: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L180: ; Arm: 128'2
  mov ax, 1
  sar ax, 1
  mov bx, [bp+14]
  sar bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  push word cx
  push word L177
  mov cx, sp
  push word 4 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L178
  push word [Temps+6]
  push word cx
  push word L179
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g52
  mov dx, g54
  jmp [bp]

L181: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L182: ; Arm: 124'11
  push word g56
  push word `0`
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L183: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L184: ; Arm: 178'32
  mov ax, `{`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, [bp+14]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+4], ax
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word cx
  push word L176
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L180
  mov ax, [bp+14]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word cx
  push word L181
  mov cx, sp
  push word 4 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L182
  push word [bp+14]
  push word cx
  push word L183
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g55
  mov dx, g57
  jmp [bp]

L185: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L186: ; Continuation
  Bare_enter_check(8)
  mov ax, `}`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  push word [bp+8]
  push word cx
  push word L185
  mov cx, sp
  push word 6 ;; scanned
  mov dx, [bp+4]
  mov bp, [bp+6]
  jmp [bp]

L187: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, [Temps+2]
  jmp [bp]

L188: ; Arm: 124'11
  push word g59
  push word `0`
  push word 3
  mov [Temps+14], sp
  push word 6 ;; scanned
  mov dx, [Temps+14]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L189: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L190: ; Arm: 128'2
  mov ax, 1
  sar ax, 1
  mov bx, [bp+14]
  sar bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+10], ax
  mov ax, [Temps+10]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+12], ax
  push word cx
  push word L187
  mov cx, sp
  push word 4 ;; scanned
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L188
  push word [Temps+10]
  push word cx
  push word L189
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g58
  mov dx, g60
  jmp [bp]

L191: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L192: ; Arm: 124'11
  push word g62
  push word `0`
  push word 3
  mov [Temps+12], sp
  push word 6 ;; scanned
  mov dx, [Temps+12]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L193: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L194: ; Arm: 181'22
  mov ax, `{`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, [bp+14]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+8], ax
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word cx
  push word L186
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L190
  mov ax, [bp+14]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  push word cx
  push word L191
  mov cx, sp
  push word 4 ;; scanned
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L192
  push word [bp+14]
  push word cx
  push word L193
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g61
  mov dx, g63
  jmp [bp]

L195: ; Arm: 184'24
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
  mov dx, [Temps+10]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L196: ; Continuation
  Bare_enter_check(26)
  mov bx, dx
  cmp word [bx], 3
  jz L184
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
  jz L194
  mov bx, [bp+12]
  cmp word [bx], 3
  jz L195
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
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L197: ; Arm: 8'9
  mov dx, g50
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L198: ; Continuation
  Bare_enter_check(26)
  mov bx, dx
  mov ax, [bx]
  mov [Temps+2], ax
  mov ax, [bp+14]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L174
  mov ax, [bp+14]
  cmp word ax, [Temps+2]
  call Bare_make_bool_from_n
  mov [Temps+6], ax
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L196
  mov cx, sp
  push word 18 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L197
  mov dx, g51
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L199: ; Arm: 175'44
  mov dx, g41
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L200: ; Arm: 175'72
  mov dx, g42
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L201: ; Continuation
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
  jz L154
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L156
  mov bx, [bp+16]
  cmp word [bx], 3
  jz L158
  mov bx, dx
  cmp word [bx], 3
  jz L160
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L162
  mov ax, [bp+14]
  cmp word ax, 29
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L163
  mov ax, [bp+14]
  cmp word ax, 115
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L164
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L198
  mov cx, sp
  push word 16 ;; scanned
  mov bx, [bp+12]
  cmp word [bx], 3
  jz L199
  mov bx, [bp+8]
  cmp word [bx], 3
  jz L200
  mov dx, g43
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L202: ; Arm: 162'38
  mov dx, g36
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L203: ; Continuation
  Bare_enter_check(20)
  mov ax, [bp+14]
  cmp word ax, 341
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L201
  mov cx, sp
  push word 18 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L202
  mov ax, [bp+14]
  cmp word ax, 365
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L204: ; Arm: 161'36
  mov dx, g35
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L205: ; Continuation
  Bare_enter_check(18)
  mov ax, dx
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
  push word L203
  mov cx, sp
  push word 16 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L204
  mov ax, [Temps+2]
  cmp word ax, 109
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L206: ; Function: (lam,t1)
  Bare_enter_check(16)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L205
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g27
  mov dx, g34
  jmp [bp]

L207: ; Function: (loop,t4)
  Bare_enter_check(12)
  push word bp
  push word dx
  push word [bp+4]
  push word [bp+2]
  push word L206
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L208: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word dx
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L209: ; Arm: 216'11
  push word [bp+6]
  push word cx
  push word L208
  mov cx, sp
  push word 6 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+2]
  jmp [bp]

L210: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L211: ; Continuation
  Bare_enter_check(16)
  push word [bp+6]
  push word dx
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word cx
  push word L210
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, [Temps+2]
  jmp [bp]

L212: ; Arm: 218'26
  push word [Temps+4]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L211
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+2]
  jmp [bp]

L213: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L214: ; Continuation
  Bare_enter_check(16)
  push word [bp+4]
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word cx
  push word L213
  mov cx, sp
  push word 6 ;; scanned
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L215: ; Function: (lam,t1)
  Bare_enter_check(12)
  mov bx, dx
  cmp word [bx], 1
  jz L209
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [Temps+2]
  cmp word ax, ` `
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L212
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+10]
  push word cx
  push word L214
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+6]
  mov bp, [bp+8]
  jmp [bp]

L216: ; Function: (lam,t1)
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L215
  mov [Temps+2], sp
  push word 12 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L217: ; Function: (have_letter,t1)
  Bare_enter_check(12)
  push word bp
  push word dx
  push word [bp+4]
  push word [bp+2]
  push word L216
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L218: ; Arm: 223'9
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L219: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L220: ; Arm: 225'24
  push word [Temps+4]
  push word cx
  push word L219
  mov cx, sp
  push word 6 ;; scanned
  mov dx, [bp+2]
  mov bp, [bp+4]
  jmp [bp]

L221: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L222: ; Continuation
  Bare_enter_check(16)
  push word g64
  push word [bp+4]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+6]
  push word cx
  push word L221
  mov cx, sp
  push word 6 ;; scanned
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L223: ; Function: (lam,t2)
  Bare_enter_check(10)
  mov bx, dx
  cmp word [bx], 1
  jz L218
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [Temps+2]
  cmp word ax, ` `
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L220
  push word [Temps+4]
  push word [Temps+2]
  push word cx
  push word L222
  mov cx, sp
  push word 8 ;; scanned
  mov dx, [bp+2]
  mov bp, [bp+6]
  jmp [bp]

L224: ; Function: (at_word_start,t5)
  Bare_enter_check(18)
  push word bp
  push word [bp+2]
  push word L217
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word bp
  push word dx
  push word L223
  mov [Temps+4], sp
  push word 8 ;; scanned
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L225: ; Arm: 197'22
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L226: ; Arm: 198'28
  mov ax, `^`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov ax, `D`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  push word [bp+6]
  push word `\x04`
  push word 3
  mov [Temps+14], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, [Temps+14]
  jmp [bp]

L227: ; Arm: 199'19
  mov dx, [bp+6]
  mov bp, [bp+8]
  jmp [bp]

L228: ; Arm: 202'17
  mov dx, [bp+6]
  mov bp, [bp+8]
  jmp [bp]

L229: ; Continuation
  Bare_enter_check(0)
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, ` `
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+4], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L230: ; Arm: 204'31
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, ` `
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+4], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L231: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L229
  mov cx, sp
  push word 8 ;; scanned
  mov bx, dx
  cmp word [bx], 3
  jz L230
  mov dx, g69
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L232: ; Arm: 8'9
  mov dx, g67
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L233: ; Arm: 200'21
  mov bx, [bp+6]
  cmp word [bx], 1
  jz L228
  mov ax, [bx+2]
  mov [Temps+12], ax
  mov ax, [bx+4]
  mov [Temps+14], ax
  mov ax, [Temps+12]
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+16], ax
  mov ax, 53
  cmp word ax, [Temps+16]
  call Bare_make_bool_from_n
  mov [Temps+18], ax
  push word [Temps+14]
  push word [bp+8]
  push word cx
  push word L231
  mov cx, sp
  push word 8 ;; scanned
  mov bx, [Temps+18]
  cmp word [bx], 3
  jz L232
  mov dx, g68
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L234: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+2]
  jmp [bp]

L235: ; Arm: 105'19
  mov ax, dx
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+16], ax
  mov dx, [Temps+16]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L236: ; Arm: 106'22
  mov ax, dx
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+18], ax
  mov dx, [Temps+18]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L237: ; Arm: 107'16
  mov ax, dx
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+20], ax
  mov dx, [Temps+20]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L238: ; Continuation
  Bare_enter_check(12)
  mov ax, dx
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov ax, dx
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L225
  mov ax, dx
  cmp word ax, `\x04`
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L226
  mov ax, 255
  cmp word ax, [Temps+2]
  call Bare_make_bool_from_n
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L227
  mov ax, [Temps+2]
  cmp word ax, 255
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L233
  mov ax, dx
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+12], ax
  mov ax, [Temps+12]
  cmp word ax, 17
  call Bare_make_bool_from_z
  mov [Temps+14], ax
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L234
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [Temps+14]
  cmp word [bx], 3
  jz L235
  mov ax, dx
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+16], ax
  mov bx, [Temps+16]
  cmp word [bx], 3
  jz L236
  mov ax, 53
  cmp word ax, [Temps+12]
  call Bare_make_bool_from_n
  mov [Temps+18], ax
  mov bx, [Temps+18]
  cmp word [bx], 3
  jz L237
  mov ax, `^`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+20], ax
  mov ax, 131
  sar ax, 1
  mov bx, [Temps+12]
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+22], ax
  mov ax, [Temps+22]
  sar ax, 1
  mov bx, 3
  sar bx, 1
  sub ax, bx
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
  mov dx, [Temps+28]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L239: ; Continuation
  Bare_enter_check(12)
  mov bx, [bp+6]
  mov ax, [bx]
  mov [Temps+2], ax
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L238
  mov cx, sp
  push word 10 ;; scanned
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L240: ; Function: (readloop,t1)
  Bare_enter_check(14)
  mov bx, [bp+4]
  mov ax, [bx]
  mov [Temps+2], ax
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L239
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+8]
  mov dx, [Temps+2]
  jmp [bp]

L241: ; Arm: 279'36
  mov dx, g71
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L242: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L243: ; Arm: 271'7
  mov dx, [bp+10]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L244: ; Arm: 242'9
  mov dx, g74
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L245: ; Arm: 246'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L246: ; Continuation
  Bare_enter_check(6)
  mov bx, dx
  cmp word [bx], 3
  jz L245
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L247: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L246
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L248: ; Function: (loop,t3)
  Bare_enter_check(14)
  mov bx, dx
  cmp word [bx], 1
  jz L244
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [Temps+8]
  push word [Temps+4]
  push word bp
  push word [bp+4]
  push word cx
  push word L247
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+6]
  jmp [bp]

L249: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L250: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L249
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L251: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L250
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L252: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L251
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L253: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L252
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L254: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L253
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+12]
  jmp [bp]

L255: ; Continuation
  Bare_enter_check(16)
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L254
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g8
  mov dx, g82
  jmp [bp]

L256: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L255
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L257: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L256
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L258: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L257
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, g81
  jmp [bp]

L259: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L258
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L260: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L259
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L261: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L260
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+12]
  jmp [bp]

L262: ; Continuation
  Bare_enter_check(16)
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L261
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g8
  mov dx, g80
  jmp [bp]

L263: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L262
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L264: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L263
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L265: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L264
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L266: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L265
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L267: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L266
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L268: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L267
  mov cx, sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+14]
  jmp [bp]

L269: ; Continuation
  Bare_enter_check(18)
  push word [bp+12]
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L268
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g8
  mov dx, g79
  jmp [bp]

L270: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L269
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L271: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L270
  mov cx, sp
  push word 14 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L272: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L271
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, g78
  jmp [bp]

L273: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L272
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L274: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L273
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L275: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L274
  mov cx, sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+14]
  jmp [bp]

L276: ; Continuation
  Bare_enter_check(18)
  push word [bp+12]
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L275
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g8
  mov dx, g77
  jmp [bp]

L277: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L276
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L278: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L277
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, g76
  jmp [bp]

L279: ; Arm: 263'9
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L278
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, g75
  jmp [bp]

L280: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L281: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L280
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L282: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L281
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L283: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L282
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L284: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L283
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L285: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L284
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+10]
  jmp [bp]

L286: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L285
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g8
  mov dx, g90
  jmp [bp]

L287: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L286
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L288: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L287
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L289: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L288
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, g89
  jmp [bp]

L290: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L289
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L291: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L290
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L292: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L291
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+10]
  jmp [bp]

L293: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L292
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g8
  mov dx, g88
  jmp [bp]

L294: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L293
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L295: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L294
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L296: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L295
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L297: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L296
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L298: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L297
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L299: ; Continuation
  Bare_enter_check(16)
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L298
  mov cx, sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+12]
  jmp [bp]

L300: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L299
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g8
  mov dx, g87
  jmp [bp]

L301: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L300
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L302: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L301
  mov cx, sp
  push word 14 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L303: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L302
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, g86
  jmp [bp]

L304: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L303
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L305: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L304
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L306: ; Continuation
  Bare_enter_check(16)
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L305
  mov cx, sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+12]
  jmp [bp]

L307: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L306
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g8
  mov dx, g85
  jmp [bp]

L308: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L307
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L309: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L308
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, g84
  jmp [bp]

L310: ; Arm: 266'14
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L309
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, g83
  jmp [bp]

L311: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L312: ; Continuation
  Bare_enter_check(14)
  mov bx, dx
  cmp word [bx], 1
  jz L279
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L310
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [bp+12]
  push word cx
  push word L311
  mov cx, sp
  push word 6 ;; scanned
  mov dx, [bp+8]
  mov bp, [Temps+6]
  jmp [bp]

L313: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L312
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L314: ; Continuation
  Bare_enter_check(34)
  push word [bp+12]
  push word cx
  push word L242
  mov cx, sp
  push word 6 ;; scanned
  mov bx, dx
  cmp word [bx], 1
  jz L243
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+2]
  push word [bp+8]
  push word L248
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L313
  mov cx, sp
  push word 16 ;; scanned
  mov bx, [bp+10]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L315: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L314
  mov cx, sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+14]
  jmp [bp]

L316: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L315
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g8
  mov dx, g73
  jmp [bp]

L317: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L316
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L318: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L317
  mov cx, sp
  push word 16 ;; scanned
  mov dx, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L319: ; Continuation
  Bare_enter_check(18)
  mov bx, dx
  cmp word [bx], 3
  jz L241
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L318
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+10]
  mov dx, g72
  jmp [bp]

L320: ; Continuation
  Bare_enter_check(20)
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L319
  mov cx, sp
  push word 18 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+16]
  jmp [bp]

L321: ; Continuation
  Bare_enter_check(22)
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L320
  mov cx, sp
  push word 20 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L322: ; Continuation
  Bare_enter_check(32)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+6]
  push word L240
  mov [Temps+2], sp
  push word 10 ;; scanned
  push word dx
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L321
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [Temps+2]
  mov dx, g70
  jmp [bp]

L323: ; Continuation
  Bare_enter_check(34)
  push word g66
  push word `\x04`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L322
  mov cx, sp
  push word 24 ;; scanned
  mov bp, [bp+4]
  mov dx, [Temps+2]
  jmp [bp]

L324: ; Continuation
  Bare_enter_check(26)
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L323
  mov cx, sp
  push word 24 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L325: ; Function: (mainloop,t6)
  Bare_enter_check(26)
  push word bp
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L324
  mov cx, sp
  push word 24 ;; scanned
  mov bp, [bp+6]
  mov dx, g65
  jmp [bp]

L326: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L327: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L326
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L328: ; Arm: 300'7
  push word [bp+8]
  push word cx
  push word L327
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g99
  jmp [bp]

L329: ; Arm: 242'9
  mov dx, g100
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L330: ; Arm: 246'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L331: ; Continuation
  Bare_enter_check(6)
  mov bx, dx
  cmp word [bx], 3
  jz L330
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L332: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L331
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L333: ; Function: (loop,t3)
  Bare_enter_check(14)
  mov bx, dx
  cmp word [bx], 1
  jz L329
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [Temps+8]
  push word [Temps+4]
  push word bp
  push word [bp+4]
  push word cx
  push word L332
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+6]
  jmp [bp]

L334: ; Arm: 242'9
  mov dx, g109
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L335: ; Arm: 246'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L336: ; Continuation
  Bare_enter_check(6)
  mov bx, dx
  cmp word [bx], 3
  jz L335
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L337: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L336
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L338: ; Function: (loop,t1)
  Bare_enter_check(14)
  mov bx, dx
  cmp word [bx], 1
  jz L334
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [Temps+8]
  push word [Temps+4]
  push word bp
  push word [bp+4]
  push word cx
  push word L337
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+6]
  jmp [bp]

L339: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L340: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L339
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L341: ; Arm: 293'11
  push word g113
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g110
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L340
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+4]
  jmp [bp]

L342: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L343: ; Arm: 296'16
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word cx
  push word L342
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, [Temps+4]
  jmp [bp]

L344: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L345: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L344
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L346: ; Continuation
  Bare_enter_check(24)
  mov bx, dx
  cmp word [bx], 1
  jz L341
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L343
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word g117
  push word [bp+8]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [Temps+8]
  push word g114
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L345
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+10]
  jmp [bp]

L347: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L346
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L348: ; Function: (lam,t1)
  Bare_enter_check(22)
  push word dx
  push word [bp+4]
  push word L338
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word dx
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L347
  mov cx, sp
  push word 12 ;; scanned
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L349: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L350: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L349
  mov cx, sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+6]
  jmp [bp]

L351: ; Continuation
  Bare_enter_check(22)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L348
  mov [Temps+2], sp
  push word 10 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word cx
  push word L350
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g5
  mov dx, [Temps+2]
  jmp [bp]

L352: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L353: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L352
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L354: ; Arm: 293'11
  push word g104
  push word [bp+12]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g101
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L353
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+8]
  mov dx, [Temps+4]
  jmp [bp]

L355: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L356: ; Arm: 296'16
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word cx
  push word L355
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, [Temps+4]
  jmp [bp]

L357: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L358: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L357
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L359: ; Continuation
  Bare_enter_check(40)
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L351
  mov cx, sp
  push word 14 ;; scanned
  mov bx, dx
  cmp word [bx], 1
  jz L354
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L356
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word g108
  push word [bp+12]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [Temps+8]
  push word g105
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L358
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+8]
  mov dx, [Temps+10]
  jmp [bp]

L360: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L359
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+16]
  mov dx, dx
  jmp [bp]

L361: ; Function: (lam,t1)
  Bare_enter_check(28)
  mov bx, dx
  cmp word [bx], 1
  jz L328
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+2]
  push word [bp+4]
  push word L333
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L360
  mov cx, sp
  push word 18 ;; scanned
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L362: ; Function: (lam,t1)
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L361
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L363: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L364: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L363
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L365: ; Arm: 337'7
  push word [bp+8]
  push word cx
  push word L364
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g120
  jmp [bp]

L366: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L367: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L366
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L368: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L367
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L369: ; Arm: 340'10
  push word g124
  push word [Temps+2]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word g121
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word [bp+2]
  push word cx
  push word L368
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+8]
  jmp [bp]

L370: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L371: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L370
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L372: ; Arm: 343'12
  mov ax, [bx+2]
  mov [Temps+10], ax
  mov ax, [bx+4]
  mov [Temps+12], ax
  push word [bp+8]
  push word cx
  push word L371
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g125
  jmp [bp]

L373: ; Arm: 242'9
  mov dx, g126
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L374: ; Arm: 246'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L375: ; Continuation
  Bare_enter_check(6)
  mov bx, dx
  cmp word [bx], 3
  jz L374
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L376: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L375
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L377: ; Function: (loop,t5)
  Bare_enter_check(14)
  mov bx, dx
  cmp word [bx], 1
  jz L373
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [Temps+8]
  push word [Temps+4]
  push word bp
  push word [bp+4]
  push word cx
  push word L376
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+6]
  jmp [bp]

L378: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L379: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L378
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L380: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L379
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L381: ; Arm: 346'15
  push word g130
  push word [bp+10]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g127
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L380
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+4]
  jmp [bp]

L382: ; Continuation
  Bare_enter_check(22)
  push word [bp+6]
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word dx
  push word [Temps+2]
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [Temps+4]
  push word 1
  mov [Temps+6], sp
  push word 4 ;; scanned
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L383: ; Continuation
  Bare_enter_check(26)
  mov bx, dx
  cmp word [bx], 1
  jz L381
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [bp+12]
  push word cx
  push word L382
  mov cx, sp
  push word 8 ;; scanned
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L384: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L383
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L385: ; Function: (lam,t1)
  Bare_enter_check(26)
  mov bx, dx
  cmp word [bx], 1
  jz L365
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 1
  jz L369
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L372
  push word [Temps+2]
  push word [bp+4]
  push word L377
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [Temps+10]
  push word [Temps+6]
  push word [Temps+2]
  push word [bp+8]
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L384
  mov cx, sp
  push word 16 ;; scanned
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+12], ax
  mov dx, [Temps+12]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L386: ; Function: (lam,t4)
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L385
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L387: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L388: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L387
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L389: ; Arm: 380'7
  push word [bp+18]
  push word cx
  push word L388
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, g133
  jmp [bp]

L390: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L391: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L390
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L392: ; Arm: 383'12
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [bp+18]
  push word cx
  push word L391
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, g134
  jmp [bp]

L393: ; Arm: 197'22
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L394: ; Arm: 198'28
  mov ax, `^`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov ax, `D`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  push word [bp+6]
  push word `\x04`
  push word 3
  mov [Temps+14], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, [Temps+14]
  jmp [bp]

L395: ; Arm: 199'19
  mov dx, [bp+6]
  mov bp, [bp+8]
  jmp [bp]

L396: ; Arm: 202'17
  mov dx, [bp+6]
  mov bp, [bp+8]
  jmp [bp]

L397: ; Continuation
  Bare_enter_check(0)
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, ` `
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+4], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L398: ; Arm: 204'31
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, ` `
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+4], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L399: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L397
  mov cx, sp
  push word 8 ;; scanned
  mov bx, dx
  cmp word [bx], 3
  jz L398
  mov dx, g139
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L400: ; Arm: 8'9
  mov dx, g137
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L401: ; Arm: 200'21
  mov bx, [bp+6]
  cmp word [bx], 1
  jz L396
  mov ax, [bx+2]
  mov [Temps+12], ax
  mov ax, [bx+4]
  mov [Temps+14], ax
  mov ax, [Temps+12]
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+16], ax
  mov ax, 53
  cmp word ax, [Temps+16]
  call Bare_make_bool_from_n
  mov [Temps+18], ax
  push word [Temps+14]
  push word [bp+8]
  push word cx
  push word L399
  mov cx, sp
  push word 8 ;; scanned
  mov bx, [Temps+18]
  cmp word [bx], 3
  jz L400
  mov dx, g138
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L402: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+2]
  jmp [bp]

L403: ; Arm: 105'19
  mov ax, dx
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+16], ax
  mov dx, [Temps+16]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L404: ; Arm: 106'22
  mov ax, dx
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+18], ax
  mov dx, [Temps+18]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L405: ; Arm: 107'16
  mov ax, dx
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+20], ax
  mov dx, [Temps+20]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L406: ; Continuation
  Bare_enter_check(12)
  mov ax, dx
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov ax, dx
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L393
  mov ax, dx
  cmp word ax, `\x04`
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L394
  mov ax, 255
  cmp word ax, [Temps+2]
  call Bare_make_bool_from_n
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L395
  mov ax, [Temps+2]
  cmp word ax, 255
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L401
  mov ax, dx
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+12], ax
  mov ax, [Temps+12]
  cmp word ax, 17
  call Bare_make_bool_from_z
  mov [Temps+14], ax
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L402
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [Temps+14]
  cmp word [bx], 3
  jz L403
  mov ax, dx
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+16], ax
  mov bx, [Temps+16]
  cmp word [bx], 3
  jz L404
  mov ax, 53
  cmp word ax, [Temps+12]
  call Bare_make_bool_from_n
  mov [Temps+18], ax
  mov bx, [Temps+18]
  cmp word [bx], 3
  jz L405
  mov ax, `^`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+20], ax
  mov ax, 131
  sar ax, 1
  mov bx, [Temps+12]
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+22], ax
  mov ax, [Temps+22]
  sar ax, 1
  mov bx, 3
  sar bx, 1
  sub ax, bx
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
  mov dx, [Temps+28]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L407: ; Continuation
  Bare_enter_check(12)
  mov bx, [bp+6]
  mov ax, [bx]
  mov [Temps+2], ax
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L406
  mov cx, sp
  push word 10 ;; scanned
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L408: ; Function: (readloop,t1)
  Bare_enter_check(14)
  mov bx, [bp+4]
  mov ax, [bx]
  mov [Temps+2], ax
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L407
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+8]
  mov dx, [Temps+2]
  jmp [bp]

L409: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L410: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L409
  mov cx, sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+6]
  jmp [bp]

L411: ; Arm: 389'44
  push word [bp+10]
  push word [bp+8]
  push word cx
  push word L410
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g8
  mov dx, g141
  jmp [bp]

L412: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word dx
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+2]
  jmp [bp]

L413: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L412
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L414: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L413
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L415: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L414
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+10]
  jmp [bp]

L416: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L415
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g8
  mov dx, g143
  jmp [bp]

L417: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L416
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L418: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L417
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, g142
  jmp [bp]

L419: ; Continuation
  Bare_enter_check(14)
  mov bx, dx
  cmp word [bx], 3
  jz L411
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L418
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L420: ; Continuation
  Bare_enter_check(18)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L419
  mov cx, sp
  push word 16 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+10]
  jmp [bp]

L421: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L420
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L422: ; Function: (loop,t1)
  Bare_enter_check(32)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+4]
  push word L408
  mov [Temps+2], sp
  push word 10 ;; scanned
  push word bp
  push word dx
  push word [bp+18]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L421
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [Temps+2]
  mov dx, g140
  jmp [bp]

L423: ; Continuation
  Bare_enter_check(28)
  push word [bp+6]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word [bp+4]
  push word 1
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word dx
  push word [Temps+4]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word 1
  mov [Temps+8], sp
  push word 4 ;; scanned
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L424: ; Continuation
  Bare_enter_check(10)
  push word dx
  push word [bp+6]
  push word cx
  push word L423
  mov cx, sp
  push word 8 ;; scanned
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L425: ; Continuation
  Bare_enter_check(32)
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L422
  mov [Temps+2], sp
  push word 20 ;; scanned
  push word [bp+22]
  push word [bp+20]
  push word cx
  push word L424
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [Temps+2]
  mov dx, g144
  jmp [bp]

L426: ; Continuation
  Bare_enter_check(34)
  push word g136
  push word `\x04`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L425
  mov cx, sp
  push word 24 ;; scanned
  mov bp, [bp+4]
  mov dx, [Temps+2]
  jmp [bp]

L427: ; Continuation
  Bare_enter_check(26)
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L426
  mov cx, sp
  push word 24 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L428: ; Function: (lam,t1)
  Bare_enter_check(26)
  mov bx, dx
  cmp word [bx], 1
  jz L389
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L392
  push word [Temps+2]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L427
  mov cx, sp
  push word 24 ;; scanned
  mov bp, [bp+6]
  mov dx, g135
  jmp [bp]

L429: ; Function: (lam,t7)
  Bare_enter_check(22)
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L428
  mov [Temps+2], sp
  push word 20 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L430: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L431: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L430
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L432: ; Arm: 375'7
  push word [bp+8]
  push word cx
  push word L431
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g147
  jmp [bp]

L433: ; Arm: 242'9
  mov dx, g148
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L434: ; Arm: 246'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L435: ; Continuation
  Bare_enter_check(6)
  mov bx, dx
  cmp word [bx], 3
  jz L434
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L436: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L435
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L437: ; Function: (loop,t1)
  Bare_enter_check(14)
  mov bx, dx
  cmp word [bx], 1
  jz L433
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [Temps+8]
  push word [Temps+4]
  push word bp
  push word [bp+4]
  push word cx
  push word L436
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+6]
  jmp [bp]

L438: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L439: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L438
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L440: ; Arm: 368'11
  push word g151
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L439
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+2]
  jmp [bp]

L441: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L442: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L441
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L443: ; Arm: 371'16
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word g154
  push word [bp+8]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L442
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+6]
  jmp [bp]

L444: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L445: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L444
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L446: ; Continuation
  Bare_enter_check(16)
  mov bx, dx
  cmp word [bx], 1
  jz L440
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L443
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word g157
  push word [bp+8]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L445
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+8]
  jmp [bp]

L447: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L446
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L448: ; Function: (lam,t3)
  Bare_enter_check(22)
  push word dx
  push word [bp+4]
  push word L437
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word dx
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L447
  mov cx, sp
  push word 12 ;; scanned
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L449: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L450: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L449
  mov cx, sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+6]
  jmp [bp]

L451: ; Function: (lam,t1)
  Bare_enter_check(22)
  mov bx, dx
  cmp word [bx], 1
  jz L432
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L448
  mov [Temps+6], sp
  push word 10 ;; scanned
  push word dx
  push word [bp+8]
  push word cx
  push word L450
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g5
  mov dx, [Temps+6]
  jmp [bp]

L452: ; Function: (lam,t10)
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L451
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L453: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L454: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L453
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L455: ; Arm: 285'9
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [bp+4]
  push word cx
  push word L454
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g160
  jmp [bp]

L456: ; Arm: 253'9
  mov dx, g162
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L457: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L458: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L457
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L459: ; Function: (loop,t1)
  Bare_enter_check(10)
  mov bx, dx
  cmp word [bx], 1
  jz L456
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, ` `
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  push word [Temps+4]
  push word bp
  push word cx
  push word L458
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+2]
  jmp [bp]

L460: ; Continuation
  Bare_enter_check(0)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L461: ; Arm: 257'9
  mov dx, g163
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L462: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L463: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L462
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L464: ; Continuation
  Bare_enter_check(24)
  push word [bp+4]
  push word L459
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+6]
  push word cx
  push word L460
  mov cx, sp
  push word 6 ;; scanned
  mov bx, dx
  cmp word [bx], 1
  jz L461
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [Temps+6]
  push word [Temps+2]
  push word cx
  push word L463
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, [Temps+4]
  jmp [bp]

L465: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L464
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L466: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L465
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [bp+6]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L467: ; Function: (lam,t1)
  Bare_enter_check(10)
  mov bx, dx
  cmp word [bx], 3
  jz L455
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L466
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g3
  mov dx, g161
  jmp [bp]

L468: ; Function: (lam,t13)
  Bare_enter_check(8)
  push word dx
  push word [bp+2]
  push word L467
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L469: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L470: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L469
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L471: ; Arm: 314'7
  push word [bp+8]
  push word cx
  push word L470
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g166
  jmp [bp]

L472: ; Arm: 242'9
  mov dx, g167
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L473: ; Arm: 246'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L474: ; Continuation
  Bare_enter_check(6)
  mov bx, dx
  cmp word [bx], 3
  jz L473
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L475: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L474
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L476: ; Function: (loop,t3)
  Bare_enter_check(14)
  mov bx, dx
  cmp word [bx], 1
  jz L472
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [Temps+8]
  push word [Temps+4]
  push word bp
  push word [bp+4]
  push word cx
  push word L475
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+6]
  jmp [bp]

L477: ; Arm: 242'9
  mov dx, g176
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L478: ; Arm: 246'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L479: ; Continuation
  Bare_enter_check(6)
  mov bx, dx
  cmp word [bx], 3
  jz L478
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L480: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L479
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L481: ; Function: (loop,t1)
  Bare_enter_check(14)
  mov bx, dx
  cmp word [bx], 1
  jz L477
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [Temps+8]
  push word [Temps+4]
  push word bp
  push word [bp+4]
  push word cx
  push word L480
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+6]
  jmp [bp]

L482: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L483: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L482
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L484: ; Arm: 307'11
  push word g180
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g177
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L483
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+4]
  jmp [bp]

L485: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L486: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L485
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L487: ; Arm: 310'16
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word g184
  push word [bp+8]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word g181
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L486
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+8]
  jmp [bp]

L488: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L489: ; Continuation
  Bare_enter_check(24)
  mov bx, dx
  cmp word [bx], 1
  jz L484
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L487
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word cx
  push word L488
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, [Temps+4]
  jmp [bp]

L490: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L489
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L491: ; Function: (lam,t1)
  Bare_enter_check(22)
  push word dx
  push word [bp+4]
  push word L481
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word dx
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L490
  mov cx, sp
  push word 12 ;; scanned
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L492: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L493: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L492
  mov cx, sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+6]
  jmp [bp]

L494: ; Continuation
  Bare_enter_check(22)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L491
  mov [Temps+2], sp
  push word 10 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word cx
  push word L493
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g5
  mov dx, [Temps+2]
  jmp [bp]

L495: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L496: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L495
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L497: ; Arm: 307'11
  push word g171
  push word [bp+12]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g168
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L496
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+8]
  mov dx, [Temps+4]
  jmp [bp]

L498: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L499: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L498
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L500: ; Arm: 310'16
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word g175
  push word [bp+12]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word g172
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L499
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+8]
  mov dx, [Temps+8]
  jmp [bp]

L501: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L502: ; Continuation
  Bare_enter_check(40)
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L494
  mov cx, sp
  push word 14 ;; scanned
  mov bx, dx
  cmp word [bx], 1
  jz L497
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L500
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word cx
  push word L501
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, [Temps+4]
  jmp [bp]

L503: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L502
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+16]
  mov dx, dx
  jmp [bp]

L504: ; Function: (lam,t1)
  Bare_enter_check(28)
  mov bx, dx
  cmp word [bx], 1
  jz L471
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+2]
  push word [bp+4]
  push word L476
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L503
  mov cx, sp
  push word 18 ;; scanned
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L505: ; Function: (lam,t16)
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L504
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L506: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L507: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L506
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L508: ; Arm: 352'7
  push word [bp+8]
  push word cx
  push word L507
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g187
  jmp [bp]

L509: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L510: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L509
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L511: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L510
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L512: ; Arm: 355'10
  push word g191
  push word [Temps+2]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word g188
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word [bp+2]
  push word cx
  push word L511
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+8]
  jmp [bp]

L513: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L514: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L513
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L515: ; Arm: 358'12
  mov ax, [bx+2]
  mov [Temps+10], ax
  mov ax, [bx+4]
  mov [Temps+12], ax
  push word [bp+8]
  push word cx
  push word L514
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g192
  jmp [bp]

L516: ; Arm: 242'9
  mov dx, g193
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L517: ; Arm: 246'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L518: ; Continuation
  Bare_enter_check(6)
  mov bx, dx
  cmp word [bx], 3
  jz L517
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L519: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L518
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L520: ; Function: (loop,t5)
  Bare_enter_check(14)
  mov bx, dx
  cmp word [bx], 1
  jz L516
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [Temps+8]
  push word [Temps+4]
  push word bp
  push word [bp+4]
  push word cx
  push word L519
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+6]
  jmp [bp]

L521: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L522: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L521
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L523: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L522
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L524: ; Arm: 361'15
  push word g197
  push word [bp+12]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g194
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+10]
  push word [bp+4]
  push word cx
  push word L523
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, [Temps+4]
  jmp [bp]

L525: ; Continuation
  Bare_enter_check(0)
  mov dx, g202
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L526: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L525
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L527: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L526
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L528: ; Arm: 320'9
  push word g201
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g198
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+2]
  push word cx
  push word L527
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+4]
  jmp [bp]

L529: ; Arm: 325'35
  mov dx, [bp+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L530: ; Continuation
  Bare_enter_check(16)
  push word [bp+6]
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word dx
  push word [Temps+2]
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L531: ; Continuation
  Bare_enter_check(10)
  mov bx, dx
  cmp word [bx], 3
  jz L529
  push word [bp+10]
  push word [bp+8]
  push word cx
  push word L530
  mov cx, sp
  push word 8 ;; scanned
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L532: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L531
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L533: ; Function: (loop,t2)
  Bare_enter_check(24)
  mov bx, dx
  cmp word [bx], 1
  jz L528
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [Temps+8]
  push word [Temps+6]
  push word [Temps+4]
  push word bp
  push word [bp+8]
  push word cx
  push word L532
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov dx, [Temps+6]
  jmp [bp]

L534: ; Continuation
  Bare_enter_check(22)
  push word [bp+6]
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word dx
  push word [Temps+2]
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [Temps+4]
  push word 1
  mov [Temps+6], sp
  push word 4 ;; scanned
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L535: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L534
  mov cx, sp
  push word 8 ;; scanned
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L536: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L535
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L537: ; Continuation
  Bare_enter_check(26)
  mov bx, dx
  cmp word [bx], 1
  jz L524
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L533
  mov [Temps+4], sp
  push word 10 ;; scanned
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+14]
  push word cx
  push word L536
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [bp+10]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L538: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L537
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+16]
  mov dx, dx
  jmp [bp]

L539: ; Function: (lam,t1)
  Bare_enter_check(28)
  mov bx, dx
  cmp word [bx], 1
  jz L508
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 1
  jz L512
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L515
  push word [Temps+2]
  push word [bp+4]
  push word L520
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [Temps+10]
  push word [Temps+6]
  push word [Temps+2]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L538
  mov cx, sp
  push word 18 ;; scanned
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+12], ax
  mov dx, [Temps+12]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L540: ; Function: (lam,t19)
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L539
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L541: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L542: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L541
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L543: ; Arm: 332'7
  push word [bp+8]
  push word cx
  push word L542
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g205
  jmp [bp]

L544: ; Continuation
  Bare_enter_check(0)
  mov dx, g210
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L545: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L544
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L546: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L545
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L547: ; Arm: 320'9
  push word g209
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g206
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+2]
  push word cx
  push word L546
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+4]
  jmp [bp]

L548: ; Arm: 325'35
  mov dx, [bp+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L549: ; Continuation
  Bare_enter_check(16)
  push word [bp+6]
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word dx
  push word [Temps+2]
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L550: ; Continuation
  Bare_enter_check(10)
  mov bx, dx
  cmp word [bx], 3
  jz L548
  push word [bp+10]
  push word [bp+8]
  push word cx
  push word L549
  mov cx, sp
  push word 8 ;; scanned
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L551: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L550
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L552: ; Function: (loop,t1)
  Bare_enter_check(24)
  mov bx, dx
  cmp word [bx], 1
  jz L547
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [Temps+8]
  push word [Temps+6]
  push word [Temps+4]
  push word bp
  push word [bp+8]
  push word cx
  push word L551
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov dx, [Temps+6]
  jmp [bp]

L553: ; Continuation
  Bare_enter_check(6)
  push word dx
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L554: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L553
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L555: ; Function: (lam,t1)
  Bare_enter_check(20)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L552
  mov [Temps+2], sp
  push word 10 ;; scanned
  push word [Temps+2]
  push word cx
  push word L554
  mov cx, sp
  push word 6 ;; scanned
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L556: ; Function: (lam,t3)
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L555
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L557: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L558: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L557
  mov cx, sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L559: ; Function: (lam,t1)
  Bare_enter_check(20)
  mov bx, dx
  cmp word [bx], 1
  jz L543
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L556
  mov [Temps+6], sp
  push word 8 ;; scanned
  push word dx
  push word [bp+8]
  push word cx
  push word L558
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g7
  mov dx, [Temps+6]
  jmp [bp]

L560: ; Function: (lam,t22)
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L559
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L561: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L562: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L561
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L563: ; Arm: 428'7
  push word [bp+4]
  push word cx
  push word L562
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g217
  jmp [bp]

L564: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L565: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L564
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L566: ; Arm: 431'12
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [bp+4]
  push word cx
  push word L565
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g218
  jmp [bp]

L567: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L568: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L567
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L569: ; Arm: 434'15
  push word [bp+6]
  push word cx
  push word L568
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, g227
  jmp [bp]

L570: ; Arm: 400'13
  mov dx, g228
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L571: ; Continuation
  Bare_enter_check(0)
  mov ax, `\n`
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
  mov dx, [Temps+4]
  jmp [bp]

L572: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, [Temps+2]
  jmp [bp]

L573: ; Arm: 124'11
  push word g238
  push word `0`
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L574: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L575: ; Arm: 128'2
  mov ax, 1
  sar ax, 1
  mov bx, [bp+8]
  sar bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+4], ax
  mov ax, [Temps+4]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word cx
  push word L572
  mov cx, sp
  push word 4 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L573
  push word [Temps+4]
  push word cx
  push word L574
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g237
  mov dx, g239
  jmp [bp]

L576: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L577: ; Arm: 124'11
  push word g241
  push word `0`
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L578: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L579: ; Continuation
  Bare_enter_check(24)
  mov ax, [bp+8]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L571
  mov cx, sp
  push word 8 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L575
  mov ax, [bp+8]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  push word cx
  push word L576
  mov cx, sp
  push word 4 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L577
  push word [bp+8]
  push word cx
  push word L578
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g240
  mov dx, g242
  jmp [bp]

L580: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L579
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L581: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L580
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, g236
  jmp [bp]

L582: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, [Temps+2]
  jmp [bp]

L583: ; Arm: 124'11
  push word g231
  push word `0`
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L584: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L585: ; Arm: 128'2
  mov ax, 1
  sar ax, 1
  mov bx, [bp+6]
  sar bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+4], ax
  mov ax, [Temps+4]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word cx
  push word L582
  mov cx, sp
  push word 4 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L583
  push word [Temps+4]
  push word cx
  push word L584
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g230
  mov dx, g232
  jmp [bp]

L586: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L587: ; Arm: 124'11
  push word g234
  push word `0`
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L588: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L589: ; Continuation
  Bare_enter_check(28)
  mov ax, [bp+6]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L581
  mov cx, sp
  push word 12 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L585
  mov ax, [bp+6]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  push word cx
  push word L586
  mov cx, sp
  push word 4 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L587
  push word [bp+6]
  push word cx
  push word L588
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g233
  mov dx, g235
  jmp [bp]

L590: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L589
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L591: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L590
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, g229
  jmp [bp]

L592: ; Function: (loop,t2)
  Bare_enter_check(12)
  mov ax, [bp+4]
  cmp word ax, dx
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L570
  push word bp
  push word dx
  push word [bp+2]
  push word cx
  push word L591
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g91
  mov dx, dx
  jmp [bp]

L593: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L594: ; Continuation
  Bare_enter_check(16)
  mov bx, dx
  cmp word [bx], 1
  jz L569
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [bp+4]
  push word L592
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+6]
  push word cx
  push word L593
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [Temps+4]
  mov dx, 1
  jmp [bp]

L595: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L594
  mov cx, sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L596: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L595
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g219
  mov dx, 1
  jmp [bp]

L597: ; Function: (lam,t1)
  Bare_enter_check(10)
  mov bx, dx
  cmp word [bx], 1
  jz L563
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L566
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L596
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+2]
  jmp [bp]

L598: ; Function: (lam,t25)
  Bare_enter_check(8)
  push word dx
  push word [bp+2]
  push word L597
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L599: ; Continuation
  Bare_enter_check(330)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L362
  mov [Temps+2], sp
  push word 8 ;; scanned
  push word [Temps+2]
  push word g98
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [Temps+4]
  push word g97
  push word 1
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L386
  mov [Temps+8], sp
  push word 8 ;; scanned
  push word [Temps+8]
  push word g119
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [Temps+10]
  push word g118
  push word 1
  mov [Temps+12], sp
  push word 6 ;; scanned
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L429
  mov [Temps+14], sp
  push word 18 ;; scanned
  push word [Temps+14]
  push word g132
  push word 3
  mov [Temps+16], sp
  push word 6 ;; scanned
  push word [Temps+16]
  push word g131
  push word 1
  mov [Temps+18], sp
  push word 6 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L452
  mov [Temps+20], sp
  push word 8 ;; scanned
  push word [Temps+20]
  push word g146
  push word 3
  mov [Temps+22], sp
  push word 6 ;; scanned
  push word [Temps+22]
  push word g145
  push word 1
  mov [Temps+24], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word L468
  mov [Temps+26], sp
  push word 4 ;; scanned
  push word [Temps+26]
  push word g159
  push word 3
  mov [Temps+28], sp
  push word 6 ;; scanned
  push word [Temps+28]
  push word g158
  push word 1
  mov [Temps+30], sp
  push word 6 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L505
  mov [Temps+32], sp
  push word 8 ;; scanned
  push word [Temps+32]
  push word g165
  push word 3
  mov [Temps+34], sp
  push word 6 ;; scanned
  push word [Temps+34]
  push word g164
  push word 1
  mov [Temps+36], sp
  push word 6 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L540
  mov [Temps+38], sp
  push word 8 ;; scanned
  push word [Temps+38]
  push word g186
  push word 3
  mov [Temps+40], sp
  push word 6 ;; scanned
  push word [Temps+40]
  push word g185
  push word 1
  mov [Temps+42], sp
  push word 6 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L560
  mov [Temps+44], sp
  push word 8 ;; scanned
  push word [Temps+44]
  push word g204
  push word 3
  mov [Temps+46], sp
  push word 6 ;; scanned
  push word [Temps+46]
  push word g203
  push word 1
  mov [Temps+48], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word L598
  mov [Temps+50], sp
  push word 4 ;; scanned
  push word [Temps+50]
  push word g216
  push word 3
  mov [Temps+52], sp
  push word 6 ;; scanned
  push word [Temps+52]
  push word g215
  push word 1
  mov [Temps+54], sp
  push word 6 ;; scanned
  push word g256
  push word [Temps+54]
  push word 3
  mov [Temps+56], sp
  push word 6 ;; scanned
  push word [Temps+56]
  push word g214
  push word 3
  mov [Temps+58], sp
  push word 6 ;; scanned
  push word [Temps+58]
  push word [Temps+48]
  push word 3
  mov [Temps+60], sp
  push word 6 ;; scanned
  push word [Temps+60]
  push word [Temps+42]
  push word 3
  mov [Temps+62], sp
  push word 6 ;; scanned
  push word [Temps+62]
  push word [Temps+36]
  push word 3
  mov [Temps+64], sp
  push word 6 ;; scanned
  push word [Temps+64]
  push word [Temps+30]
  push word 3
  mov [Temps+66], sp
  push word 6 ;; scanned
  push word [Temps+66]
  push word [Temps+24]
  push word 3
  mov [Temps+68], sp
  push word 6 ;; scanned
  push word [Temps+68]
  push word [Temps+18]
  push word 3
  mov [Temps+70], sp
  push word 6 ;; scanned
  push word [Temps+70]
  push word [Temps+12]
  push word 3
  mov [Temps+72], sp
  push word 6 ;; scanned
  push word [Temps+72]
  push word [Temps+6]
  push word 3
  mov [Temps+74], sp
  push word 6 ;; scanned
  push word [Temps+74]
  push word g96
  push word 3
  mov [Temps+76], sp
  push word 6 ;; scanned
  push word [Temps+76]
  push word 1
  mov [Temps+78], sp
  push word 4 ;; scanned
  mov bp, [bp+20]
  mov dx, [Temps+78]
  jmp [bp]

L600: ; Continuation
  Bare_enter_check(24)
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L599
  mov cx, sp
  push word 22 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L601: ; Continuation
  Bare_enter_check(74)
  push word [bp+8]
  push word [bp+4]
  push word L152
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word g32
  mov [Temps+4], sp
  push word 2 ;; scanned
  push word g33
  mov [Temps+6], sp
  push word 2 ;; scanned
  push word [Temps+6]
  push word [Temps+4]
  push word L207
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [bp+6]
  push word L224
  mov [Temps+10], sp
  push word 4 ;; scanned
  push word [Temps+10]
  push word [Temps+8]
  push word [Temps+6]
  push word [Temps+4]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L325
  mov [Temps+12], sp
  push word 18 ;; scanned
  push word [Temps+12]
  push word [Temps+8]
  push word [Temps+6]
  push word [Temps+4]
  push word [Temps+2]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L600
  mov cx, sp
  push word 22 ;; scanned
  mov bp, [bp+8]
  mov dx, g92
  jmp [bp]

L602: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L601
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g1
  mov dx, g22
  jmp [bp]

L603: ; Continuation
  Bare_enter_check(10)
  push word dx
  push word [bp+4]
  push word cx
  push word L602
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g1
  mov dx, g14
  jmp [bp]

L604: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word cx
  push word L603
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g1
  mov dx, g12
  jmp [bp]

L605: ; Start
  Bare_enter_check(6)
  push word cx
  push word L604
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g1
  mov dx, g10
  jmp [bp]

g1:
  dw L2
g2:
  dw L5
g3:
  dw L11
g4:
  dw 1
g5:
  dw L16
g6:
  dw 1
g7:
  dw L24
g8:
  dw L28
g9:
  dw 1
g10:
  dw L36
g11:
  dw 1
g12:
  dw L44
g13:
  dw 1
g14:
  dw L50
g15:
  dw 1
g16:
  dw 3
g17:
  dw 1
g18:
  dw 3
g19:
  dw 1
g20:
  dw 3
g21:
  dw 1
g22:
  dw L60
g23:
  dw 1
  db ``
g24:
  dw 1
g25:
  dw L66
g26:
  dw 1
g27:
  dw L68
g28:
  dw 1
g29:
  dw 1
g30:
  dw 1
g31:
  dw 1
g32:
  dw 1
g33:
  dw 1
g34:
  dw 1
g35:
  dw 3
g36:
  dw 3
g37:
  dw 3
g38:
  dw 1
g39:
  dw 3
g40:
  dw 1
g41:
  dw 103
  db `   @            QWERTYUIOP    ASDFGHJKL     ZXCVBNM`
g42:
  dw 109
  db `  !@#$%^&*()_+ \x09QWERTYUIOP{}\n ASDFGHJKL:"~ |ZXCVBNM<>?`
g43:
  dw 109
  db `  1234567890-= \x09qwertyuiop[]\n asdfghjkl;'\` \\zxcvbnm,./`
g44:
  dw L72
g45:
  dw 1
g46:
  dw 1
g47:
  dw L76
g48:
  dw 1
g49:
  dw 1
g50:
  dw 1
g51:
  dw 3
g52:
  dw L80
g53:
  dw 1
g54:
  dw 1
g55:
  dw L84
g56:
  dw 1
g57:
  dw 1
g58:
  dw L88
g59:
  dw 1
g60:
  dw 1
g61:
  dw L92
g62:
  dw 1
g63:
  dw 1
g64:
  dw 1
g65:
  dw 5
  db `% `
g66:
  dw 1
g67:
  dw 1
g68:
  dw 3
g69:
  dw 1
g70:
  dw 1
g71:
  dw 1
g72:
  dw 1
g73:
  dw 1
g74:
  dw 1
g75:
  dw 35
  db `command not found`
g76:
  dw 3
  db `\n`
g77:
  dw 1
g78:
  dw 5
  db `: `
g79:
  dw 1
g80:
  dw 1
g81:
  dw 13
  db `sham: `
g82:
  dw 1
g83:
  dw 35
  db `Permission denied`
g84:
  dw 3
  db `\n`
g85:
  dw 1
g86:
  dw 5
  db `: `
g87:
  dw 1
g88:
  dw 1
g89:
  dw 13
  db `sham: `
g90:
  dw 1
g91:
  dw L96
g92:
  dw 103
  db `Sham: In-memory file-system. Consider typing "ls".\n`
g93:
  dw 13
  db `readme`
g94:
  dw 165
  db `Welcome to sham; please try all the commands!\nCan you find the hidden Easter Egg?\n`
g95:
  dw 1, g94
g96:
  dw 1, g93, g95
g97:
  dw 7
  db `cat`
g98:
  dw 115
  db `cat - concatenate files and print on the standard output\n`
g99:
  dw 67
  db `cat: takes at least one argument\n`
g100:
  dw 1
g101:
  dw 11
  db `cat: `
g102:
  dw 59
  db ` : No such file or directory\n`
g103:
  dw 1
g104:
  dw 3, g102, g103
g105:
  dw 11
  db `cat: `
g106:
  dw 39
  db ` : Not a data file\n`
g107:
  dw 1
g108:
  dw 3, g106, g107
g109:
  dw 1
g110:
  dw 11
  db `cat: `
g111:
  dw 59
  db ` : No such file or directory\n`
g112:
  dw 1
g113:
  dw 3, g111, g112
g114:
  dw 11
  db `cat: `
g115:
  dw 39
  db ` : Not a data file\n`
g116:
  dw 1
g117:
  dw 3, g115, g116
g118:
  dw 5
  db `cp`
g119:
  dw 65
  db `cp - copy files and directories\n`
g120:
  dw 51
  db `cp: missing file operand\n`
g121:
  dw 89
  db `cp: missing destination file operand after '`
g122:
  dw 5
  db `'\n`
g123:
  dw 1
g124:
  dw 3, g122, g123
g125:
  dw 61
  db `cp: unexpected extra operands\n`
g126:
  dw 1
g127:
  dw 35
  db `cp: cannot stat '`
g128:
  dw 59
  db `': No such file or directory\n`
g129:
  dw 1
g130:
  dw 3, g128, g129
g131:
  dw 13
  db `create`
g132:
  dw 55
  db `create - create a new file\n`
g133:
  dw 53
  db `create: missing file name\n`
g134:
  dw 69
  db `create: unexpected extra operands\n`
g135:
  dw 69
  db `(to finish type ^D on a new line)\n`
g136:
  dw 1
g137:
  dw 1
g138:
  dw 3
g139:
  dw 1
g140:
  dw 1
g141:
  dw 1
g142:
  dw 3
  db `\n`
g143:
  dw 1
g144:
  dw 1
g145:
  dw 9
  db `file`
g146:
  dw 55
  db `file - determine file type\n`
g147:
  dw 69
  db `file: takes at least one argument\n`
g148:
  dw 1
g149:
  dw 59
  db ` : No such file or directory\n`
g150:
  dw 1
g151:
  dw 3, g149, g150
g152:
  dw 27
  db `: ASCII text\n`
g153:
  dw 1
g154:
  dw 3, g152, g153
g155:
  dw 27
  db `: executable\n`
g156:
  dw 1
g157:
  dw 3, g155, g156
g158:
  dw 5
  db `ls`
g159:
  dw 59
  db `ls - list directory contents\n`
g160:
  dw 47
  db `ls: takes no arguments\n`
g161:
  dw L97
g162:
  dw 1
g163:
  dw 1
g164:
  dw 7
  db `man`
g165:
  dw 103
  db `man - an interface to the system reference manuals\n`
g166:
  dw 61
  db `What manual page do you want?\n`
g167:
  dw 1
g168:
  dw 41
  db `No manual entry for `
g169:
  dw 3
  db `\n`
g170:
  dw 1
g171:
  dw 3, g169, g170
g172:
  dw 41
  db `No manual entry for `
g173:
  dw 3
  db `\n`
g174:
  dw 1
g175:
  dw 3, g173, g174
g176:
  dw 1
g177:
  dw 41
  db `No manual entry for `
g178:
  dw 3
  db `\n`
g179:
  dw 1
g180:
  dw 3, g178, g179
g181:
  dw 41
  db `No manual entry for `
g182:
  dw 3
  db `\n`
g183:
  dw 1
g184:
  dw 3, g182, g183
g185:
  dw 5
  db `mv`
g186:
  dw 51
  db `mv - move (rename) files\n`
g187:
  dw 51
  db `mv: missing file operand\n`
g188:
  dw 89
  db `mv: missing destination file operand after '`
g189:
  dw 5
  db `'\n`
g190:
  dw 1
g191:
  dw 3, g189, g190
g192:
  dw 61
  db `mv: unexpected extra operands\n`
g193:
  dw 1
g194:
  dw 35
  db `mv: cannot stat '`
g195:
  dw 59
  db `': No such file or directory\n`
g196:
  dw 1
g197:
  dw 3, g195, g196
g198:
  dw 39
  db `rm: cannot remove '`
g199:
  dw 59
  db `': No such file or directory\n`
g200:
  dw 1
g201:
  dw 3, g199, g200
g202:
  dw 1
g203:
  dw 5
  db `rm`
g204:
  dw 133
  db `rm - remove files or directories (directories not supported yet!)\n`
g205:
  dw 41
  db `rm: missing operand\n`
g206:
  dw 39
  db `rm: cannot remove '`
g207:
  dw 59
  db `': No such file or directory\n`
g208:
  dw 1
g209:
  dw 3, g207, g208
g210:
  dw 1
g211:
  dw 7
  db `cat`
g212:
  dw 439
  db `I have a little shadow that goes in and out with me,\nAnd what can be the use of him is more than I can see.\nHe is very, very like me from the heels up to the head;\nAnd I see him jump before me, when I jump into my bed.\n`
g213:
  dw 1, g212
g214:
  dw 1, g211, g213
g215:
  dw 7
  db `fib`
g216:
  dw 101
  db `fib - naive fib computation upto the given number\n`
g217:
  dw 45
  db `fib: missing argument\n`
g218:
  dw 69
  db `create: unexpected extra argument\n`
g219:
  dw L109
g220:
  dw 1
g221:
  dw 3
g222:
  dw 1
g223:
  dw 3
g224:
  dw 1
g225:
  dw 1
g226:
  dw 1
g227:
  dw 63
  db `fib: expected numeric argument\n`
g228:
  dw 1
g229:
  dw 9
  db `fib `
g230:
  dw L113
g231:
  dw 1
g232:
  dw 1
g233:
  dw L117
g234:
  dw 1
g235:
  dw 1
g236:
  dw 11
  db ` --> `
g237:
  dw L121
g238:
  dw 1
g239:
  dw 1
g240:
  dw L125
g241:
  dw 1
g242:
  dw 1
g243:
  dw 11
  db `space`
g244:
  dw 95
  db `space - where is the stack-pointer? (in words)\n`
g245:
  dw 1
g246:
  dw L129
g247:
  dw 1
g248:
  dw 1
g249:
  dw L133
g250:
  dw 1
g251:
  dw 1
g252:
  dw L143
g253:
  dw 3, g244, g252
g254:
  dw 1, g243, g253
g255:
  dw 1
g256:
  dw 3, g254, g255

bare_start: jmp L605
