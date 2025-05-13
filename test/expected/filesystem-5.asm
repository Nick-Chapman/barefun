L1: ; Function: (lam,t1)
  Bare_enter_check(0)
  mov bp, [bp+2]
  mov dx, dx
  jmp [bp]

L2: ; Function: (block,g1)
  Bare_enter_check(6)
  push word dx
  push word L1
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L3: ; Arm: 21'7
  mov dx, 1
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L4: ; Continuation
  Bare_enter_check(0)
  mov ax, 3
  shr ax, 1
  mov bx, dx
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L5: ; Function: (length,g2)
  Bare_enter_check(6)
  mov bx, dx
  cmp word [bx], 1
  jz L3
  mov si, [bx+2]
  mov di, [bx+4]
  push word cx
  push word L4
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g2
  mov dx, di
  jmp [bp]

L6: ; Arm: 25'12
  mov dx, [bp+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L7: ; Arm: 27'9
  mov dx, g6
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L8: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L9: ; Continuation
  Bare_enter_check(8)
  mov bx, dx
  cmp word [bx], 3
  jz L6
  mov bx, [bp+6]
  cmp word [bx], 1
  jz L7
  mov si, [bx+2]
  mov di, [bx+4]
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  push word di
  push word cx
  push word L8
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g3
  mov dx, [Temps+6]
  jmp [bp]

L10: ; Arm: 7'9
  mov dx, g4
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L11: ; Function: (lam,t1)
  Bare_enter_check(10)
  mov ax, 1
  cmp word ax, [bp+2]
  call Bare_make_bool_from_n
  mov si, ax
  push word dx
  push word [bp+2]
  push word cx
  push word L9
  mov cx, sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L10
  mov dx, g5
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L12: ; Function: (drop,g3)
  Bare_enter_check(6)
  push word dx
  push word L11
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L13: ; Arm: 32'7
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L14: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L15: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov bx, dx
  cmp word [bx], 1
  jz L13
  mov si, [bx+2]
  mov di, [bx+4]
  push word [bp+2]
  push word si
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word di
  push word cx
  push word L14
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g7
  mov dx, [Temps+6]
  jmp [bp]

L16: ; Function: (rev_onto,g7)
  Bare_enter_check(6)
  push word dx
  push word L15
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L17: ; Arm: 45'9
  mov dx, g8
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L18: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L19: ; Function: (lam,t1)
  Bare_enter_check(8)
  mov bx, dx
  cmp word [bx], 1
  jz L17
  mov si, [bx+2]
  mov di, [bx+4]
  mov ax, [bp+2]
  mov bx, si
  push word si ;; save
  mov si, [bp+4]
  shr si, 1
  call Bare_set_bytes
  pop word si ;; restore
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+8], ax
  push word di
  push word cx
  push word L18
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+8]
  jmp [bp]

L20: ; Function: (loop,t2)
  Bare_enter_check(10)
  push word bp
  push word dx
  push word [bp+2]
  push word L19
  mov si, sp
  push word 8 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L21: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L22: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L21
  mov cx, sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L23: ; Continuation
  Bare_enter_check(600)
  mov ax, dx
  call Bare_make_bytes
  mov si, ax
  push word si
  push word L20
  mov di, sp
  push word 4 ;; scanned
  push word si
  push word [bp+4]
  push word cx
  push word L22
  mov cx, sp
  push word 8 ;; scanned
  mov bp, di
  mov dx, 1
  jmp [bp]

L24: ; Function: (lam,g9)
  Bare_enter_check(8)
  push word dx
  push word cx
  push word L23
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g2
  mov dx, dx
  jmp [bp]

L25: ; Arm: 56'9
  mov dx, g10
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
  Bare_enter_check(8)
  mov bx, dx
  cmp word [bx], 1
  jz L25
  mov si, [bx+2]
  mov di, [bx+4]
  mov ax, [bp+2]
  mov bx, si
  push word si ;; save
  mov si, [bp+4]
  shr si, 1
  call Bare_set_bytes
  pop word si ;; restore
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+8], ax
  push word di
  push word cx
  push word L26
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+8]
  jmp [bp]

L28: ; Function: (loop,t2)
  Bare_enter_check(10)
  push word bp
  push word dx
  push word [bp+2]
  push word L27
  mov si, sp
  push word 8 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L29: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L30: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L29
  mov cx, sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L31: ; Continuation
  Bare_enter_check(600)
  mov ax, dx
  call Bare_make_bytes
  mov si, ax
  push word si
  push word L28
  mov di, sp
  push word 4 ;; scanned
  mov ax, dx
  shr ax, 1
  mov bx, 3
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  push word si
  push word [bp+4]
  push word cx
  push word L30
  mov cx, sp
  push word 8 ;; scanned
  mov bp, di
  mov dx, [Temps+6]
  jmp [bp]

L32: ; Function: (lam,g11)
  Bare_enter_check(8)
  push word dx
  push word cx
  push word L31
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g2
  mov dx, dx
  jmp [bp]

L33: ; Arm: 64'13
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L34: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L35: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L33
  mov ax, [bp+2]
  mov bx, dx
  shr bx, 1
  call Bare_get_bytes
  mov di, ax
  push word [bp+4]
  push word di
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L34
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+6]
  jmp [bp]

L36: ; Function: (explode_loop,t1)
  Bare_enter_check(10)
  push word bp
  push word dx
  push word [bp+2]
  push word L35
  mov si, sp
  push word 8 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L37: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L38: ; Function: (lam,g13)
  Bare_enter_check(14)
  push word dx
  push word L36
  mov si, sp
  push word 4 ;; scanned
  mov bx, dx
  mov di, [bx]
  push word di
  push word cx
  push word L37
  mov cx, sp
  push word 6 ;; scanned
  mov bp, si
  mov dx, g12
  jmp [bp]

L39: ; Arm: 72'19
  mov dx, g16
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L40: ; Arm: 74'15
  mov dx, g17
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L41: ; Arm: 77'31
  mov dx, g20
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L42: ; Continuation
  Bare_enter_check(0)
  mov bx, dx
  cmp word [bx], 3
  jz L41
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, [bp+6]
  mov dx, si
  jmp [bp]

L43: ; Arm: 7'9
  mov dx, g18
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L44: ; Function: (loop,t1)
  Bare_enter_check(10)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L40
  mov ax, [bp+2]
  mov bx, dx
  shr bx, 1
  call Bare_get_bytes
  mov di, ax
  mov ax, [bp+4]
  mov bx, dx
  shr bx, 1
  call Bare_get_bytes
  mov [Temps+6], ax
  mov ax, di
  cmp word ax, [Temps+6]
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  push word bp
  push word dx
  push word cx
  push word L42
  mov cx, sp
  push word 8 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L43
  mov dx, g19
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L45: ; Continuation
  Bare_enter_check(8)
  mov bx, dx
  cmp word [bx], 3
  jz L39
  push word [bp+6]
  push word [bp+4]
  push word L44
  mov si, sp
  push word 6 ;; scanned
  mov ax, [bp+8]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov di, ax
  mov bp, si
  mov dx, di
  jmp [bp]

L46: ; Arm: 7'9
  mov dx, g14
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L47: ; Function: (lam,t1)
  Bare_enter_check(12)
  mov bx, [bp+2]
  mov si, [bx]
  mov bx, dx
  mov di, [bx]
  mov ax, si
  cmp word ax, di
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word si
  push word dx
  push word [bp+2]
  push word cx
  push word L45
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L46
  mov dx, g15
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L48: ; Function: (lam,g21)
  Bare_enter_check(6)
  push word dx
  push word L47
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L49: ; Arm: 104'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L50: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L51: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L49
  mov ax, dx
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov di, dx
  pop word dx ;; restore
  mov ax, 97
  shr ax, 1
  mov bx, di
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  shr ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L50
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g26
  mov dx, [Temps+10]
  jmp [bp]

L52: ; Function: (loop,g26)
  Bare_enter_check(6)
  push word dx
  push word L51
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L53: ; Arm: 120'9
  push word [bp+2]
  push word 3
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L54: ; Arm: 123'15
  mov dx, g37
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L55: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L56: ; Continuation
  Bare_enter_check(8)
  mov bx, dx
  cmp word [bx], 1
  jz L54
  mov si, [bx+2]
  mov ax, 21
  shr ax, 1
  mov bx, [bp+4]
  shr bx, 1
  mul bx
  shl ax, 1
  add ax, 1
  mov di, ax
  mov ax, di
  shr ax, 1
  mov bx, si
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  push word [bp+6]
  push word cx
  push word L55
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g30
  mov dx, [Temps+6]
  jmp [bp]

L57: ; Arm: 115'27
  push word [bp+4]
  push word 3
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L58: ; Continuation
  Bare_enter_check(6)
  mov bx, dx
  cmp word [bx], 3
  jz L57
  mov dx, g35
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L59: ; Arm: 7'9
  mov dx, g33
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L60: ; Arm: 115'12
  mov ax, 19
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov si, ax
  push word [bp+8]
  push word cx
  push word L58
  mov cx, sp
  push word 6 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L59
  mov dx, g34
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L61: ; Continuation
  Bare_enter_check(18)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L56
  mov cx, sp
  push word 8 ;; scanned
  mov bx, dx
  cmp word [bx], 3
  jz L60
  mov dx, g36
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L62: ; Arm: 7'9
  mov dx, g31
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L63: ; Function: (lam,t1)
  Bare_enter_check(12)
  mov bx, dx
  cmp word [bx], 1
  jz L53
  mov si, [bx+2]
  mov di, [bx+4]
  mov ax, si
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  shr ax, 1
  mov bx, 97
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+8], ax
  mov ax, [Temps+8]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+10], ax
  push word [Temps+8]
  push word di
  push word [bp+2]
  push word cx
  push word L61
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L62
  mov dx, g32
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L64: ; Function: (loop,g30)
  Bare_enter_check(6)
  push word dx
  push word L63
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L65: ; Arm: 132'7
  mov dx, g39
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L66: ; Function: (put_chars,g38)
  Bare_enter_check(0)
  mov bx, dx
  cmp word [bx], 1
  jz L65
  mov si, [bx+2]
  mov di, [bx+4]
  mov ax, si
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov bp, g38
  mov dx, di
  jmp [bp]

L67: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L68: ; Arm: 422'9
  push word [bp+2]
  push word cx
  push word L67
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g7
  mov dx, g268
  jmp [bp]

L69: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L70: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov bx, dx
  cmp word [bx], 1
  jz L68
  mov si, [bx+2]
  mov di, [bx+4]
  mov bx, si
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+6]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word di
  push word cx
  push word L69
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g267
  mov dx, [Temps+10]
  jmp [bp]

L71: ; Function: (loop,g267)
  Bare_enter_check(6)
  push word dx
  push word L70
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L72: ; Arm: 88'9
  mov dx, [bp+8]
  mov bp, [bp+2]
  jmp [bp]

L73: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L74: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L73
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L75: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L74
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L76: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L75
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+10]
  jmp [bp]

L77: ; Continuation
  Bare_enter_check(14)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word dx
  push word cx
  push word L76
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g23
  jmp [bp]

L78: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L77
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L79: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L78
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L80: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L79
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+6]
  jmp [bp]

L81: ; Continuation
  Bare_enter_check(16)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word dx
  push word cx
  push word L80
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g7
  mov dx, g22
  jmp [bp]

L82: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L81
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+6]
  mov bp, g7
  jmp [bp]

L83: ; Function: (lam,t1)
  Bare_enter_check(14)
  mov bx, dx
  cmp word [bx], 1
  jz L72
  mov si, [bx+2]
  mov di, [bx+4]
  push word di
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L82
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, si
  jmp [bp]

L84: ; Function: (collect,t1)
  Bare_enter_check(14)
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L83
  mov si, sp
  push word 12 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L85: ; Arm: 93'7
  mov dx, g25
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L86: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L87: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L86
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L88: ; Continuation
  Bare_enter_check(10)
  mov bx, dx
  cmp word [bx], 1
  jz L85
  mov si, [bx+2]
  mov di, [bx+4]
  push word di
  push word [bp+6]
  push word cx
  push word L87
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, si
  jmp [bp]

L89: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L88
  mov cx, sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L90: ; Function: (lam,t2)
  Bare_enter_check(12)
  push word dx
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L89
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, g24
  jmp [bp]

L91: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word L84
  mov si, sp
  push word 8 ;; scanned
  push word si
  push word [bp+6]
  push word L90
  mov di, sp
  push word 6 ;; scanned
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L92: ; Function: (lam,t1)
  Bare_enter_check(10)
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L91
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L93: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L94: ; Arm: 107'11
  push word g27
  push word `0`
  push word 3
  mov di, sp
  push word 6 ;; scanned
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L95: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L96: ; Continuation
  Bare_enter_check(6)
  mov ax, 1
  shr ax, 1
  mov bx, [bp+4]
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  push word cx
  push word L95
  mov cx, sp
  push word 4 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L97: ; Arm: 108'13
  push word dx
  push word cx
  push word L96
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g26
  mov dx, g28
  jmp [bp]

L98: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L99: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  push word [bp+2]
  push word cx
  push word L93
  mov cx, sp
  push word 6 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L94
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov di, ax
  mov bx, di
  cmp word [bx], 3
  jz L97
  push word dx
  push word cx
  push word L98
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g26
  mov dx, g29
  jmp [bp]

L100: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L101: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word cx
  push word L100
  mov cx, sp
  push word 6 ;; scanned
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L102: ; Function: (lam,t1)
  Bare_enter_check(10)
  push word dx
  push word [bp+2]
  push word cx
  push word L101
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g30
  mov dx, 1
  jmp [bp]

L103: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word dx
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L104: ; Arm: 172'11
  push word [bp+6]
  push word cx
  push word L103
  mov cx, sp
  push word 6 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+2]
  jmp [bp]

L105: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L106: ; Continuation
  Bare_enter_check(16)
  push word [bp+6]
  push word dx
  push word 3
  mov si, sp
  push word 6 ;; scanned
  push word [bp+8]
  push word cx
  push word L105
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, si
  jmp [bp]

L107: ; Arm: 174'26
  push word di
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L106
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+2]
  jmp [bp]

L108: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L109: ; Continuation
  Bare_enter_check(16)
  push word [bp+4]
  push word [bp+6]
  push word 3
  mov si, sp
  push word 6 ;; scanned
  push word [bp+8]
  push word cx
  push word L108
  mov cx, sp
  push word 6 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L110: ; Function: (lam,t1)
  Bare_enter_check(12)
  mov bx, dx
  cmp word [bx], 1
  jz L104
  mov si, [bx+2]
  mov di, [bx+4]
  mov ax, si
  cmp word ax, ` `
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L107
  push word di
  push word si
  push word [bp+10]
  push word cx
  push word L109
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+6]
  mov bp, [bp+8]
  jmp [bp]

L111: ; Function: (lam,t1)
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L110
  mov si, sp
  push word 12 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L112: ; Function: (have_letter,t1)
  Bare_enter_check(12)
  push word bp
  push word dx
  push word [bp+4]
  push word [bp+2]
  push word L111
  mov si, sp
  push word 10 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L113: ; Arm: 179'9
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L114: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L115: ; Arm: 181'24
  push word di
  push word cx
  push word L114
  mov cx, sp
  push word 6 ;; scanned
  mov dx, [bp+2]
  mov bp, [bp+4]
  jmp [bp]

L116: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L117: ; Continuation
  Bare_enter_check(16)
  push word g40
  push word [bp+4]
  push word 3
  mov si, sp
  push word 6 ;; scanned
  push word [bp+6]
  push word cx
  push word L116
  mov cx, sp
  push word 6 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L118: ; Function: (lam,t2)
  Bare_enter_check(10)
  mov bx, dx
  cmp word [bx], 1
  jz L113
  mov si, [bx+2]
  mov di, [bx+4]
  mov ax, si
  cmp word ax, ` `
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L115
  push word di
  push word si
  push word cx
  push word L117
  mov cx, sp
  push word 8 ;; scanned
  mov dx, [bp+2]
  mov bp, [bp+6]
  jmp [bp]

L119: ; Function: (at_word_start,t1)
  Bare_enter_check(18)
  push word bp
  push word [bp+2]
  push word L112
  mov si, sp
  push word 6 ;; scanned
  push word si
  push word bp
  push word dx
  push word L118
  mov di, sp
  push word 8 ;; scanned
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L120: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov dx, dx
  jmp [bp]

L121: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L120
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L122: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L121
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L123: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L122
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L124: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L123
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L125: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L124
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g45
  jmp [bp]

L126: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L125
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L127: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L126
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L128: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L127
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g44
  jmp [bp]

L129: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L128
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L130: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L129
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L131: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L130
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+10]
  jmp [bp]

L132: ; Continuation
  Bare_enter_check(14)
  push word [bp+8]
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L131
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g43
  jmp [bp]

L133: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L132
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L134: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L133
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g42
  jmp [bp]

L135: ; Arm: 194'44
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L134
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L136: ; Function: (lam,t3)
  Bare_enter_check(10)
  mov bx, [bp+6]
  mov si, [bx]
  mov bx, si
  cmp word [bx], 3
  jz L135
  mov dx, g46
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L137: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, [bp+6]
  call Bare_load_sector
  mov si, Bare_unit
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L138: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L137
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L139: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L138
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L140: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L139
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L141: ; Continuation
  Bare_enter_check(16)
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L140
  mov cx, sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+12]
  jmp [bp]

L142: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L141
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g7
  mov dx, g48
  jmp [bp]

L143: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L142
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L144: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L143
  mov cx, sp
  push word 14 ;; scanned
  mov dx, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L145: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L144
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+6]
  mov dx, g47
  jmp [bp]

L146: ; Function: (lam,t1)
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L145
  mov cx, sp
  push word 14 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L147: ; Function: (lam,t1)
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L146
  mov si, sp
  push word 12 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L148: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, [bp+6]
  call Bare_store_sector
  mov si, Bare_unit
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L149: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L148
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L150: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L149
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L151: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L150
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L152: ; Continuation
  Bare_enter_check(16)
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L151
  mov cx, sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+12]
  jmp [bp]

L153: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L152
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g7
  mov dx, g50
  jmp [bp]

L154: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L153
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L155: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L154
  mov cx, sp
  push word 14 ;; scanned
  mov dx, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L156: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L155
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+6]
  mov dx, g49
  jmp [bp]

L157: ; Function: (lam,t1)
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L156
  mov cx, sp
  push word 14 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L158: ; Function: (lam,t1)
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L157
  mov si, sp
  push word 12 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L159: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov dx, dx
  jmp [bp]

L160: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L159
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L161: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L160
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L162: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L161
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L163: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L162
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L164: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L163
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g68
  jmp [bp]

L165: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L164
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L166: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L165
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L167: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L166
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g67
  jmp [bp]

L168: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L167
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L169: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L168
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L170: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L169
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L171: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L170
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g66
  jmp [bp]

L172: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L171
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L173: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L172
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g65
  jmp [bp]

L174: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L173
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, g64
  jmp [bp]

L175: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L174
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L176: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L175
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L177: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L176
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L178: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L177
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+10]
  jmp [bp]

L179: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L178
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g7
  mov dx, g63
  jmp [bp]

L180: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L179
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L181: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L180
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L182: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L181
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, g62
  jmp [bp]

L183: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L182
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L184: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L183
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L185: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L184
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+10]
  jmp [bp]

L186: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L185
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g7
  mov dx, g61
  jmp [bp]

L187: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L186
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L188: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L187
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L189: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L188
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L190: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L189
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L191: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L190
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L192: ; Continuation
  Bare_enter_check(16)
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L191
  mov cx, sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+12]
  jmp [bp]

L193: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L192
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g7
  mov dx, g60
  jmp [bp]

L194: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L193
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L195: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L194
  mov cx, sp
  push word 14 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L196: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L195
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, g59
  jmp [bp]

L197: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L196
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L198: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L197
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L199: ; Continuation
  Bare_enter_check(16)
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L198
  mov cx, sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+12]
  jmp [bp]

L200: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L199
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g7
  mov dx, g58
  jmp [bp]

L201: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L200
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L202: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L201
  mov cx, sp
  push word 14 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L203: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L202
  mov cx, sp
  push word 14 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L204: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L203
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L205: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L204
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L206: ; Continuation
  Bare_enter_check(18)
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L205
  mov cx, sp
  push word 16 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+14]
  jmp [bp]

L207: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L206
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g7
  mov dx, g57
  jmp [bp]

L208: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L207
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L209: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L208
  mov cx, sp
  push word 16 ;; scanned
  mov dx, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L210: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L209
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+6]
  mov dx, g56
  jmp [bp]

L211: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L210
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L212: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L211
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L213: ; Continuation
  Bare_enter_check(18)
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L212
  mov cx, sp
  push word 16 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+14]
  jmp [bp]

L214: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L213
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g7
  mov dx, g55
  jmp [bp]

L215: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L214
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L216: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L215
  mov cx, sp
  push word 16 ;; scanned
  mov dx, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L217: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L216
  mov cx, sp
  push word 16 ;; scanned
  mov dx, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L218: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L217
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L219: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L218
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+16]
  mov dx, dx
  jmp [bp]

L220: ; Continuation
  Bare_enter_check(20)
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L219
  mov cx, sp
  push word 18 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+16]
  jmp [bp]

L221: ; Continuation
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
  push word L220
  mov cx, sp
  push word 20 ;; scanned
  mov bp, g7
  mov dx, g54
  jmp [bp]

L222: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L221
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L223: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L222
  mov cx, sp
  push word 18 ;; scanned
  mov dx, [bp+16]
  mov bp, [bp+6]
  jmp [bp]

L224: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L223
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+6]
  mov dx, g53
  jmp [bp]

L225: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L224
  mov cx, sp
  push word 16 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+8]
  jmp [bp]

L226: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L225
  mov cx, sp
  push word 18 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+8]
  jmp [bp]

L227: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L226
  mov cx, sp
  push word 18 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+8]
  jmp [bp]

L228: ; Arm: 218'22
  push word [bp+22]
  push word [bp+16]
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L227
  mov cx, sp
  push word 18 ;; scanned
  mov dx, [bp+20]
  mov bp, [bp+8]
  jmp [bp]

L229: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov dx, dx
  jmp [bp]

L230: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L229
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L231: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L230
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L232: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L231
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L233: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L232
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L234: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L233
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g84
  jmp [bp]

L235: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L234
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L236: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L235
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L237: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L236
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g83
  jmp [bp]

L238: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L237
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L239: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L238
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L240: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L239
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L241: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L240
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g82
  jmp [bp]

L242: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L241
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L243: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L242
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g81
  jmp [bp]

L244: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L243
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, g80
  jmp [bp]

L245: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L244
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L246: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L245
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L247: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L246
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L248: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L247
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+10]
  jmp [bp]

L249: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L248
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g7
  mov dx, g79
  jmp [bp]

L250: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L249
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L251: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L250
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L252: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L251
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, g78
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
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L254: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L253
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L255: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L254
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+10]
  jmp [bp]

L256: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L255
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g7
  mov dx, g77
  jmp [bp]

L257: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L256
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, dx
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
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L259: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L258
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L260: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L259
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
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
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L262: ; Continuation
  Bare_enter_check(16)
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L261
  mov cx, sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+12]
  jmp [bp]

L263: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L262
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g7
  mov dx, g76
  jmp [bp]

L264: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L263
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L265: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L264
  mov cx, sp
  push word 14 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L266: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L265
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, g75
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
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L268: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L267
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L269: ; Continuation
  Bare_enter_check(16)
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L268
  mov cx, sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+12]
  jmp [bp]

L270: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L269
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g7
  mov dx, g74
  jmp [bp]

L271: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L270
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g7
  mov dx, dx
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
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L273: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L272
  mov cx, sp
  push word 14 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L274: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L273
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+4]
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
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L276: ; Continuation
  Bare_enter_check(18)
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L275
  mov cx, sp
  push word 16 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+14]
  jmp [bp]

L277: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L276
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g7
  mov dx, g73
  jmp [bp]

L278: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L277
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L279: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L278
  mov cx, sp
  push word 16 ;; scanned
  mov dx, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L280: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L279
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+6]
  mov dx, g72
  jmp [bp]

L281: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L280
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L282: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L281
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L283: ; Continuation
  Bare_enter_check(18)
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L282
  mov cx, sp
  push word 16 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+14]
  jmp [bp]

L284: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L283
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g7
  mov dx, g71
  jmp [bp]

L285: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L284
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L286: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L285
  mov cx, sp
  push word 16 ;; scanned
  mov dx, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L287: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L286
  mov cx, sp
  push word 16 ;; scanned
  mov dx, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L288: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L287
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L289: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L288
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+16]
  mov dx, dx
  jmp [bp]

L290: ; Continuation
  Bare_enter_check(20)
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L289
  mov cx, sp
  push word 18 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+16]
  jmp [bp]

L291: ; Continuation
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
  push word L290
  mov cx, sp
  push word 20 ;; scanned
  mov bp, g7
  mov dx, g70
  jmp [bp]

L292: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L291
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L293: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L292
  mov cx, sp
  push word 18 ;; scanned
  mov dx, [bp+16]
  mov bp, [bp+6]
  jmp [bp]

L294: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L293
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+6]
  mov dx, g69
  jmp [bp]

L295: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L294
  mov cx, sp
  push word 16 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+8]
  jmp [bp]

L296: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L295
  mov cx, sp
  push word 18 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+8]
  jmp [bp]

L297: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L296
  mov cx, sp
  push word 18 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+8]
  jmp [bp]

L298: ; Arm: 219'16
  push word [bp+22]
  push word [bp+16]
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L297
  mov cx, sp
  push word 18 ;; scanned
  mov dx, [bp+20]
  mov bp, [bp+8]
  jmp [bp]

L299: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov dx, dx
  jmp [bp]

L300: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L299
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L301: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L300
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L302: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L301
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L303: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L302
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L304: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L303
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g100
  jmp [bp]

L305: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L304
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L306: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L305
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L307: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L306
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g99
  jmp [bp]

L308: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L307
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L309: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L308
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L310: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L309
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L311: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L310
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g98
  jmp [bp]

L312: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L311
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L313: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L312
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g97
  jmp [bp]

L314: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L313
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, g96
  jmp [bp]

L315: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L314
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L316: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L315
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L317: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L316
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L318: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L317
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+10]
  jmp [bp]

L319: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L318
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g7
  mov dx, g95
  jmp [bp]

L320: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L319
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L321: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L320
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L322: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L321
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, g94
  jmp [bp]

L323: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L322
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L324: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L323
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L325: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L324
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+10]
  jmp [bp]

L326: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L325
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g7
  mov dx, g93
  jmp [bp]

L327: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L326
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L328: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L327
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L329: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L328
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L330: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L329
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L331: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L330
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L332: ; Continuation
  Bare_enter_check(16)
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L331
  mov cx, sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+12]
  jmp [bp]

L333: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L332
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g7
  mov dx, g92
  jmp [bp]

L334: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L333
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L335: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L334
  mov cx, sp
  push word 14 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L336: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L335
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, g91
  jmp [bp]

L337: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L336
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L338: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L337
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L339: ; Continuation
  Bare_enter_check(16)
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L338
  mov cx, sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+12]
  jmp [bp]

L340: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L339
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g7
  mov dx, g90
  jmp [bp]

L341: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L340
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L342: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L341
  mov cx, sp
  push word 14 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L343: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L342
  mov cx, sp
  push word 14 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L344: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L343
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L345: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L344
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L346: ; Continuation
  Bare_enter_check(18)
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L345
  mov cx, sp
  push word 16 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+14]
  jmp [bp]

L347: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L346
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g7
  mov dx, g89
  jmp [bp]

L348: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L347
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L349: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L348
  mov cx, sp
  push word 16 ;; scanned
  mov dx, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L350: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L349
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+6]
  mov dx, g88
  jmp [bp]

L351: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L350
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L352: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L351
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L353: ; Continuation
  Bare_enter_check(18)
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L352
  mov cx, sp
  push word 16 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+14]
  jmp [bp]

L354: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L353
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g7
  mov dx, g87
  jmp [bp]

L355: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L354
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L356: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L355
  mov cx, sp
  push word 16 ;; scanned
  mov dx, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L357: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L356
  mov cx, sp
  push word 16 ;; scanned
  mov dx, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L358: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L357
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L359: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L358
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+16]
  mov dx, dx
  jmp [bp]

L360: ; Continuation
  Bare_enter_check(20)
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L359
  mov cx, sp
  push word 18 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+16]
  jmp [bp]

L361: ; Continuation
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
  push word L360
  mov cx, sp
  push word 20 ;; scanned
  mov bp, g7
  mov dx, g86
  jmp [bp]

L362: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L361
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L363: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L362
  mov cx, sp
  push word 18 ;; scanned
  mov dx, [bp+16]
  mov bp, [bp+6]
  jmp [bp]

L364: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L363
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+6]
  mov dx, g85
  jmp [bp]

L365: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L364
  mov cx, sp
  push word 16 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+8]
  jmp [bp]

L366: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L365
  mov cx, sp
  push word 18 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+8]
  jmp [bp]

L367: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L366
  mov cx, sp
  push word 18 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+8]
  jmp [bp]

L368: ; Arm: 220'13
  push word [bp+22]
  push word [bp+16]
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L367
  mov cx, sp
  push word 18 ;; scanned
  mov dx, [bp+20]
  mov bp, [bp+8]
  jmp [bp]

L369: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov dx, dx
  jmp [bp]

L370: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L369
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L371: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L370
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L372: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L371
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L373: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L372
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L374: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L373
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g116
  jmp [bp]

L375: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L374
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L376: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L375
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L377: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L376
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g115
  jmp [bp]

L378: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L377
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L379: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L378
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L380: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L379
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L381: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L380
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g114
  jmp [bp]

L382: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L381
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L383: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L382
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g113
  jmp [bp]

L384: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L383
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, g112
  jmp [bp]

L385: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L384
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L386: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L385
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L387: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L386
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L388: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L387
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+10]
  jmp [bp]

L389: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L388
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g7
  mov dx, g111
  jmp [bp]

L390: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L389
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L391: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L390
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L392: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L391
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, g110
  jmp [bp]

L393: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L392
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L394: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L393
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L395: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L394
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+10]
  jmp [bp]

L396: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L395
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g7
  mov dx, g109
  jmp [bp]

L397: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L396
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L398: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L397
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L399: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L398
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L400: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L399
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L401: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L400
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L402: ; Continuation
  Bare_enter_check(16)
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L401
  mov cx, sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+12]
  jmp [bp]

L403: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L402
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g7
  mov dx, g108
  jmp [bp]

L404: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L403
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L405: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L404
  mov cx, sp
  push word 14 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L406: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L405
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, g107
  jmp [bp]

L407: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L406
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L408: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L407
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L409: ; Continuation
  Bare_enter_check(16)
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L408
  mov cx, sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+12]
  jmp [bp]

L410: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L409
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g7
  mov dx, g106
  jmp [bp]

L411: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L410
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L412: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L411
  mov cx, sp
  push word 14 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L413: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L412
  mov cx, sp
  push word 14 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L414: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L413
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L415: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L414
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L416: ; Continuation
  Bare_enter_check(18)
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L415
  mov cx, sp
  push word 16 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+14]
  jmp [bp]

L417: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L416
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g7
  mov dx, g105
  jmp [bp]

L418: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L417
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L419: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L418
  mov cx, sp
  push word 16 ;; scanned
  mov dx, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L420: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L419
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+6]
  mov dx, g104
  jmp [bp]

L421: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L420
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L422: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L421
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L423: ; Continuation
  Bare_enter_check(18)
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L422
  mov cx, sp
  push word 16 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+14]
  jmp [bp]

L424: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L423
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g7
  mov dx, g103
  jmp [bp]

L425: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L424
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L426: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L425
  mov cx, sp
  push word 16 ;; scanned
  mov dx, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L427: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L426
  mov cx, sp
  push word 16 ;; scanned
  mov dx, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L428: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L427
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L429: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L428
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+16]
  mov dx, dx
  jmp [bp]

L430: ; Continuation
  Bare_enter_check(20)
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L429
  mov cx, sp
  push word 18 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+16]
  jmp [bp]

L431: ; Continuation
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
  push word L430
  mov cx, sp
  push word 20 ;; scanned
  mov bp, g7
  mov dx, g102
  jmp [bp]

L432: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L431
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L433: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L432
  mov cx, sp
  push word 18 ;; scanned
  mov dx, [bp+16]
  mov bp, [bp+6]
  jmp [bp]

L434: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L433
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+6]
  mov dx, g101
  jmp [bp]

L435: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L434
  mov cx, sp
  push word 16 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+8]
  jmp [bp]

L436: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L435
  mov cx, sp
  push word 18 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+8]
  jmp [bp]

L437: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L436
  mov cx, sp
  push word 18 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+8]
  jmp [bp]

L438: ; Arm: 221'23
  push word [bp+22]
  push word [bp+16]
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L437
  mov cx, sp
  push word 18 ;; scanned
  mov dx, [bp+20]
  mov bp, [bp+8]
  jmp [bp]

L439: ; Arm: 223'16
  mov dx, g119
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L440: ; Continuation
  Bare_enter_check(0)
  mov bx, dx
  cmp word [bx], 3
  jz L439
  mov ax, [bp+8]
  mov bx, [bp+10]
  shr bx, 1
  call Bare_get_bytes
  mov si, ax
  mov ax, [bp+6]
  shr ax, 1
  mov bx, [bp+10]
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov di, ax
  mov ax, [bp+4]
  mov bx, si
  push word si ;; save
  mov si, di
  shr si, 1
  call Bare_set_bytes
  pop word si ;; restore
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, [bp+10]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+8], ax
  mov bp, [bp+12]
  mov dx, [Temps+8]
  jmp [bp]

L441: ; Arm: 7'9
  mov dx, g117
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L442: ; Function: (loop,t5)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, [bp+6]
  call Bare_make_bool_from_n
  mov si, ax
  push word bp
  push word dx
  push word [bp+8]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L440
  mov cx, sp
  push word 14 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L441
  mov dx, g118
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L443: ; Continuation
  Bare_enter_check(20)
  mov bx, dx
  cmp word [bx], 3
  jz L228
  mov ax, [bp+14]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L298
  mov ax, [bp+16]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov di, ax
  mov bx, di
  cmp word [bx], 3
  jz L368
  mov ax, [bp+14]
  shr ax, 1
  mov bx, [bp+16]
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [bp+20]
  cmp word ax, [Temps+6]
  call Bare_make_bool_from_n
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L438
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word L442
  mov [Temps+10], sp
  push word 10 ;; scanned
  mov bp, [Temps+10]
  mov dx, 1
  jmp [bp]

L444: ; Arm: 7'9
  mov dx, g51
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L445: ; Function: (lam,t1)
  Bare_enter_check(26)
  mov si, [bp+10]
  mov bx, si
  mov di, [bx]
  mov [Temps+6], dx
  mov bx, [Temps+6]
  mov ax, [bx]
  mov [Temps+8], ax
  mov ax, [Temps+8]
  cmp word ax, [bp+14]
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  push word [Temps+8]
  push word di
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L443
  mov cx, sp
  push word 24 ;; scanned
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L444
  mov dx, g52
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L446: ; Function: (lam,t1)
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L445
  mov si, sp
  push word 16 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L447: ; Function: (lam,t1)
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L446
  mov si, sp
  push word 14 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L448: ; Function: (lam,t1)
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L447
  mov si, sp
  push word 12 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L449: ; Arm: 237'16
  mov dx, g130
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L450: ; Continuation
  Bare_enter_check(0)
  mov bx, dx
  cmp word [bx], 3
  jz L449
  mov ax, [bp+6]
  shr ax, 1
  mov bx, [bp+10]
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  mov ax, [bp+4]
  mov bx, si
  shr bx, 1
  call Bare_get_bytes
  mov di, ax
  mov ax, [bp+8]
  mov bx, di
  push word si ;; save
  mov si, [bp+10]
  shr si, 1
  call Bare_set_bytes
  pop word si ;; restore
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, [bp+10]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+8], ax
  mov bp, [bp+12]
  mov dx, [Temps+8]
  jmp [bp]

L451: ; Arm: 7'9
  mov dx, g128
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L452: ; Function: (loop,t2)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, [bp+6]
  call Bare_make_bool_from_n
  mov si, ax
  push word bp
  push word dx
  push word [bp+8]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L450
  mov cx, sp
  push word 14 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L451
  mov dx, g129
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L453: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L454: ; Continuation
  Bare_enter_check(600)
  mov ax, [bp+8]
  call Bare_make_bytes
  mov si, ax
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L452
  mov di, sp
  push word 10 ;; scanned
  push word si
  push word cx
  push word L453
  mov cx, sp
  push word 6 ;; scanned
  mov bp, di
  mov dx, 1
  jmp [bp]

L455: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L454
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L456: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L455
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L457: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L456
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L458: ; Continuation
  Bare_enter_check(18)
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L457
  mov cx, sp
  push word 16 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+14]
  jmp [bp]

L459: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L458
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g7
  mov dx, g127
  jmp [bp]

L460: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L459
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L461: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L460
  mov cx, sp
  push word 16 ;; scanned
  mov dx, [bp+16]
  mov bp, [bp+6]
  jmp [bp]

L462: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L461
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+6]
  mov dx, g126
  jmp [bp]

L463: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L462
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L464: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L463
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+16]
  mov dx, dx
  jmp [bp]

L465: ; Continuation
  Bare_enter_check(20)
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L464
  mov cx, sp
  push word 18 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+16]
  jmp [bp]

L466: ; Continuation
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
  push word L465
  mov cx, sp
  push word 20 ;; scanned
  mov bp, g7
  mov dx, g125
  jmp [bp]

L467: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L466
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L468: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L467
  mov cx, sp
  push word 18 ;; scanned
  mov dx, [bp+16]
  mov bp, [bp+6]
  jmp [bp]

L469: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L468
  mov cx, sp
  push word 18 ;; scanned
  mov dx, [bp+16]
  mov bp, [bp+6]
  jmp [bp]

L470: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L469
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L471: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L470
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+18]
  mov dx, dx
  jmp [bp]

L472: ; Continuation
  Bare_enter_check(22)
  push word [bp+20]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L471
  mov cx, sp
  push word 20 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+18]
  jmp [bp]

L473: ; Continuation
  Bare_enter_check(24)
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L472
  mov cx, sp
  push word 22 ;; scanned
  mov bp, g7
  mov dx, g124
  jmp [bp]

L474: ; Continuation
  Bare_enter_check(22)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L473
  mov cx, sp
  push word 20 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L475: ; Continuation
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
  push word L474
  mov cx, sp
  push word 20 ;; scanned
  mov dx, [bp+18]
  mov bp, [bp+6]
  jmp [bp]

L476: ; Continuation
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
  push word L475
  mov cx, sp
  push word 20 ;; scanned
  mov bp, [bp+6]
  mov dx, g123
  jmp [bp]

L477: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L476
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L478: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L477
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+18]
  mov dx, dx
  jmp [bp]

L479: ; Continuation
  Bare_enter_check(22)
  push word [bp+20]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L478
  mov cx, sp
  push word 20 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+18]
  jmp [bp]

L480: ; Continuation
  Bare_enter_check(24)
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L479
  mov cx, sp
  push word 22 ;; scanned
  mov bp, g7
  mov dx, g122
  jmp [bp]

L481: ; Continuation
  Bare_enter_check(22)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L480
  mov cx, sp
  push word 20 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L482: ; Continuation
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
  push word L481
  mov cx, sp
  push word 20 ;; scanned
  mov dx, [bp+18]
  mov bp, [bp+6]
  jmp [bp]

L483: ; Continuation
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
  push word L482
  mov cx, sp
  push word 20 ;; scanned
  mov dx, [bp+18]
  mov bp, [bp+6]
  jmp [bp]

L484: ; Continuation
  Bare_enter_check(22)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L483
  mov cx, sp
  push word 20 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L485: ; Continuation
  Bare_enter_check(22)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L484
  mov cx, sp
  push word 20 ;; scanned
  mov bp, [bp+20]
  mov dx, dx
  jmp [bp]

L486: ; Continuation
  Bare_enter_check(24)
  push word [bp+22]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L485
  mov cx, sp
  push word 22 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+20]
  jmp [bp]

L487: ; Continuation
  Bare_enter_check(26)
  push word dx
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
  push word L486
  mov cx, sp
  push word 24 ;; scanned
  mov bp, g7
  mov dx, g121
  jmp [bp]

L488: ; Continuation
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
  push word L487
  mov cx, sp
  push word 22 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L489: ; Continuation
  Bare_enter_check(24)
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L488
  mov cx, sp
  push word 22 ;; scanned
  mov dx, [bp+20]
  mov bp, [bp+6]
  jmp [bp]

L490: ; Continuation
  Bare_enter_check(24)
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L489
  mov cx, sp
  push word 22 ;; scanned
  mov bp, [bp+6]
  mov dx, g120
  jmp [bp]

L491: ; Continuation
  Bare_enter_check(22)
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L490
  mov cx, sp
  push word 20 ;; scanned
  mov dx, [bp+16]
  mov bp, [bp+8]
  jmp [bp]

L492: ; Continuation
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
  push word L491
  mov cx, sp
  push word 20 ;; scanned
  mov dx, [bp+14]
  mov bp, [bp+8]
  jmp [bp]

L493: ; Function: (lam,t1)
  Bare_enter_check(20)
  mov bx, [bp+10]
  mov si, [bx]
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L492
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+6]
  mov dx, si
  jmp [bp]

L494: ; Function: (lam,t1)
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L493
  mov si, sp
  push word 14 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L495: ; Function: (lam,t1)
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L494
  mov si, sp
  push word 12 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L496: ; Continuation
  Bare_enter_check(0)
  mov dx, g140
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L497: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L496
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g38
  mov dx, dx
  jmp [bp]

L498: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L497
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L499: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L498
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L500: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L499
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L501: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L500
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L502: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L501
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g139
  jmp [bp]

L503: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L502
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L504: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L503
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L505: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L504
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g138
  jmp [bp]

L506: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L505
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L507: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L506
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L508: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L507
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L509: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L508
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g137
  jmp [bp]

L510: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L509
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L511: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L510
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g136
  jmp [bp]

L512: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L511
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L513: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L512
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L514: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L513
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L515: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L514
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L516: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L515
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g135
  jmp [bp]

L517: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L516
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L518: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L517
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L519: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L518
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g134
  jmp [bp]

L520: ; Arm: 253'27
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L519
  mov cx, sp
  push word 8 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+8]
  jmp [bp]

L521: ; Continuation
  Bare_enter_check(0)
  mov dx, g141
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L522: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L521
  mov cx, sp
  push word 4 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L523: ; Continuation
  Bare_enter_check(10)
  mov bx, dx
  cmp word [bx], 3
  jz L520
  push word [bp+14]
  push word cx
  push word L522
  mov cx, sp
  push word 6 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+10]
  jmp [bp]

L524: ; Arm: 250'40
  mov dx, g131
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L525: ; Arm: 7'9
  mov dx, g132
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L526: ; Function: (lam,t1)
  Bare_enter_check(18)
  mov ax, [bp+10]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov si, ax
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L523
  mov cx, sp
  push word 16 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L524
  mov ax, [bp+10]
  cmp word ax, 7
  call Bare_make_bool_from_n
  mov di, ax
  mov bx, di
  cmp word [bx], 3
  jz L525
  mov dx, g133
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L527: ; Function: (lam,t1)
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L526
  mov si, sp
  push word 12 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L528: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov dx, dx
  jmp [bp]

L529: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L528
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L530: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L529
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L531: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L530
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L532: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L531
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L533: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L532
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g150
  jmp [bp]

L534: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L533
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L535: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L534
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L536: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L535
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g149
  jmp [bp]

L537: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L536
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L538: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L537
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L539: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L538
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L540: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L539
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g148
  jmp [bp]

L541: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L540
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L542: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L541
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g147
  jmp [bp]

L543: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L542
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L544: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L543
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L545: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L544
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L546: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L545
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L547: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L546
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g146
  jmp [bp]

L548: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L547
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L549: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L548
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L550: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L549
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g145
  jmp [bp]

L551: ; Arm: 258'27
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L550
  mov cx, sp
  push word 8 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+8]
  jmp [bp]

L552: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L553: ; Continuation
  Bare_enter_check(10)
  mov bx, dx
  cmp word [bx], 3
  jz L551
  push word [bp+14]
  push word cx
  push word L552
  mov cx, sp
  push word 6 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+10]
  jmp [bp]

L554: ; Arm: 250'40
  mov dx, g142
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L555: ; Arm: 7'9
  mov dx, g143
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L556: ; Function: (lam,t1)
  Bare_enter_check(18)
  mov ax, [bp+10]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov si, ax
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L553
  mov cx, sp
  push word 16 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L554
  mov ax, [bp+10]
  cmp word ax, 7
  call Bare_make_bool_from_n
  mov di, ax
  mov bx, di
  cmp word [bx], 3
  jz L555
  mov dx, g144
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L557: ; Function: (lam,t1)
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L556
  mov si, sp
  push word 12 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L558: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov dx, dx
  jmp [bp]

L559: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L558
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L560: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L559
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L561: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L560
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L562: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L561
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L563: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L562
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g159
  jmp [bp]

L564: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L563
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L565: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L564
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L566: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L565
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g158
  jmp [bp]

L567: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L566
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L568: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L567
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L569: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L568
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L570: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L569
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g157
  jmp [bp]

L571: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L570
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L572: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L571
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g156
  jmp [bp]

L573: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L572
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L574: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L573
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L575: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L574
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L576: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L575
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L577: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L576
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g155
  jmp [bp]

L578: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L577
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L579: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L578
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L580: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L579
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g154
  jmp [bp]

L581: ; Arm: 264'27
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L580
  mov cx, sp
  push word 8 ;; scanned
  mov dx, [bp+16]
  mov bp, [bp+8]
  jmp [bp]

L582: ; Continuation
  Bare_enter_check(0)
  mov dx, g160
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L583: ; Continuation
  Bare_enter_check(6)
  mov si, [bp+4]
  push word cx
  push word L582
  mov cx, sp
  push word 4 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L584: ; Continuation
  Bare_enter_check(8)
  push word [bp+8]
  push word cx
  push word L583
  mov cx, sp
  push word 6 ;; scanned
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L585: ; Continuation
  Bare_enter_check(12)
  mov si, [bp+8]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L584
  mov cx, sp
  push word 10 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L586: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L585
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L587: ; Continuation
  Bare_enter_check(16)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L586
  mov cx, sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L588: ; Continuation
  Bare_enter_check(18)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L587
  mov cx, sp
  push word 16 ;; scanned
  mov dx, [bp+16]
  mov bp, [bp+6]
  jmp [bp]

L589: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L588
  mov cx, sp
  push word 18 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+16]
  jmp [bp]

L590: ; Continuation
  Bare_enter_check(600)
  mov bx, dx
  cmp word [bx], 3
  jz L581
  mov ax, 1025
  call Bare_make_bytes
  mov si, ax
  push word si
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word cx
  push word L589
  mov cx, sp
  push word 18 ;; scanned
  mov dx, [bp+16]
  mov bp, [bp+10]
  jmp [bp]

L591: ; Arm: 250'40
  mov dx, g151
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L592: ; Arm: 7'9
  mov dx, g152
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L593: ; Function: (lam,t1)
  Bare_enter_check(26)
  mov ax, [bp+14]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov si, ax
  push word dx
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
  push word L590
  mov cx, sp
  push word 24 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L591
  mov ax, [bp+14]
  cmp word ax, 7
  call Bare_make_bool_from_n
  mov di, ax
  mov bx, di
  cmp word [bx], 3
  jz L592
  mov dx, g153
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L594: ; Function: (lam,t1)
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
  push word L593
  mov si, sp
  push word 20 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L595: ; Function: (lam,t1)
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L594
  mov si, sp
  push word 18 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L596: ; Function: (lam,t1)
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L595
  mov si, sp
  push word 16 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L597: ; Continuation
  Bare_enter_check(0)
  mov dx, g170
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L598: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L597
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g38
  mov dx, dx
  jmp [bp]

L599: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L598
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L600: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L599
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L601: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L600
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L602: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L601
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L603: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L602
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g169
  jmp [bp]

L604: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L603
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L605: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L604
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L606: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L605
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g168
  jmp [bp]

L607: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L606
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L608: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L607
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L609: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L608
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L610: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L609
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g167
  jmp [bp]

L611: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L610
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L612: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L611
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g166
  jmp [bp]

L613: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L612
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L614: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L613
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L615: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L614
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L616: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L615
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L617: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L616
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g165
  jmp [bp]

L618: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L617
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L619: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L618
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L620: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L619
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g164
  jmp [bp]

L621: ; Arm: 324'23
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L620
  mov cx, sp
  push word 8 ;; scanned
  mov dx, [bp+16]
  mov bp, [bp+8]
  jmp [bp]

L622: ; Arm: 328'11
  mov dx, g181
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L623: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word 1
  mov si, sp
  push word 4 ;; scanned
  push word si
  push word 3
  mov di, sp
  push word 4 ;; scanned
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L624: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L623
  mov cx, sp
  push word 4 ;; scanned
  mov bp, dx
  mov dx, 129
  jmp [bp]

L625: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L624
  mov cx, sp
  push word 4 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L626: ; Continuation
  Bare_enter_check(8)
  mov bx, dx
  cmp word [bx], 1
  jz L622
  mov si, [bx+2]
  mov ax, [bp+6]
  shr ax, 1
  mov bx, 17
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov di, dx
  pop word dx ;; restore
  mov ax, 129
  shr ax, 1
  shr di, 1
  mul di
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  push word [Temps+6]
  push word cx
  push word L625
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, si
  jmp [bp]

L627: ; Arm: 275'12
  mov dx, g180
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L628: ; Continuation
  Bare_enter_check(16)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L626
  mov cx, sp
  push word 8 ;; scanned
  mov bx, dx
  cmp word [bx], 3
  jz L627
  mov si, [bp+8]
  push word si
  push word 3
  mov di, sp
  push word 4 ;; scanned
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L629: ; Arm: 7'9
  mov dx, g178
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L630: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L628
  mov cx, sp
  push word 10 ;; scanned
  mov bx, dx
  cmp word [bx], 3
  jz L629
  mov dx, g179
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L631: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L630
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L632: ; Continuation
  Bare_enter_check(600)
  mov ax, [bp+8]
  shr ax, 1
  mov bx, 17
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov si, ax
  mov ax, 1025
  call Bare_make_bytes
  mov di, ax
  push word di
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L631
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, si
  jmp [bp]

L633: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L632
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L634: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L633
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L635: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L634
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L636: ; Continuation
  Bare_enter_check(18)
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L635
  mov cx, sp
  push word 16 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+14]
  jmp [bp]

L637: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L636
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g7
  mov dx, g177
  jmp [bp]

L638: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L637
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L639: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L638
  mov cx, sp
  push word 16 ;; scanned
  mov dx, [bp+16]
  mov bp, [bp+6]
  jmp [bp]

L640: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L639
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+6]
  mov dx, g176
  jmp [bp]

L641: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L640
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L642: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L641
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+16]
  mov dx, dx
  jmp [bp]

L643: ; Continuation
  Bare_enter_check(20)
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L642
  mov cx, sp
  push word 18 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+16]
  jmp [bp]

L644: ; Continuation
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
  push word L643
  mov cx, sp
  push word 20 ;; scanned
  mov bp, g7
  mov dx, g175
  jmp [bp]

L645: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L644
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L646: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L645
  mov cx, sp
  push word 18 ;; scanned
  mov dx, [bp+16]
  mov bp, [bp+6]
  jmp [bp]

L647: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L646
  mov cx, sp
  push word 18 ;; scanned
  mov dx, [bp+16]
  mov bp, [bp+6]
  jmp [bp]

L648: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L647
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L649: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L648
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+18]
  mov dx, dx
  jmp [bp]

L650: ; Continuation
  Bare_enter_check(22)
  push word [bp+20]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L649
  mov cx, sp
  push word 20 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+18]
  jmp [bp]

L651: ; Continuation
  Bare_enter_check(24)
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L650
  mov cx, sp
  push word 22 ;; scanned
  mov bp, g7
  mov dx, g174
  jmp [bp]

L652: ; Continuation
  Bare_enter_check(22)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L651
  mov cx, sp
  push word 20 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L653: ; Continuation
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
  push word L652
  mov cx, sp
  push word 20 ;; scanned
  mov dx, [bp+18]
  mov bp, [bp+6]
  jmp [bp]

L654: ; Continuation
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
  push word L653
  mov cx, sp
  push word 20 ;; scanned
  mov bp, [bp+6]
  mov dx, g173
  jmp [bp]

L655: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L654
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L656: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L655
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+18]
  mov dx, dx
  jmp [bp]

L657: ; Continuation
  Bare_enter_check(22)
  push word [bp+20]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L656
  mov cx, sp
  push word 20 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+18]
  jmp [bp]

L658: ; Continuation
  Bare_enter_check(24)
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L657
  mov cx, sp
  push word 22 ;; scanned
  mov bp, g7
  mov dx, g172
  jmp [bp]

L659: ; Continuation
  Bare_enter_check(22)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L658
  mov cx, sp
  push word 20 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L660: ; Continuation
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
  push word L659
  mov cx, sp
  push word 20 ;; scanned
  mov bp, [bp+6]
  mov dx, g171
  jmp [bp]

L661: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L660
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L662: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L661
  mov cx, sp
  push word 18 ;; scanned
  mov dx, [bp+18]
  mov bp, [bp+8]
  jmp [bp]

L663: ; Continuation
  Bare_enter_check(22)
  mov bx, dx
  cmp word [bx], 3
  jz L621
  mov ax, [bp+16]
  shr ax, 1
  mov bx, 17
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov si, ax
  push word si
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L662
  mov cx, sp
  push word 20 ;; scanned
  mov dx, [bp+16]
  mov bp, [bp+8]
  jmp [bp]

L664: ; Arm: 319'33
  mov dx, g161
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L665: ; Arm: 7'9
  mov dx, g162
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L666: ; Function: (lam,t1)
  Bare_enter_check(20)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov si, ax
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L663
  mov cx, sp
  push word 18 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L664
  mov ax, dx
  cmp word ax, 49
  call Bare_make_bool_from_n
  mov di, ax
  mov bx, di
  cmp word [bx], 3
  jz L665
  mov dx, g163
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L667: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov dx, dx
  jmp [bp]

L668: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L667
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L669: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L668
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L670: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L669
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L671: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L670
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L672: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L671
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g190
  jmp [bp]

L673: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L672
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L674: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L673
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L675: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L674
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g189
  jmp [bp]

L676: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L675
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L677: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L676
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L678: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L677
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L679: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L678
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g188
  jmp [bp]

L680: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L679
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L681: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L680
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g187
  jmp [bp]

L682: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L681
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L683: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L682
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L684: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L683
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L685: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L684
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L686: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L685
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g186
  jmp [bp]

L687: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L686
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L688: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L687
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L689: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L688
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g185
  jmp [bp]

L690: ; Arm: 334'23
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L689
  mov cx, sp
  push word 8 ;; scanned
  mov dx, [bp+14]
  mov bp, [bp+8]
  jmp [bp]

L691: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L692: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word cx
  push word L691
  mov cx, sp
  push word 6 ;; scanned
  mov bx, [bp+4]
  mov si, [bx+2]
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L693: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L692
  mov cx, sp
  push word 6 ;; scanned
  mov bp, dx
  mov dx, 129
  jmp [bp]

L694: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L693
  mov cx, sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+6]
  jmp [bp]

L695: ; Continuation
  Bare_enter_check(10)
  mov ax, [bp+6]
  shr ax, 1
  mov bx, 17
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov si, dx
  pop word dx ;; restore
  mov ax, 129
  shr ax, 1
  shr si, 1
  mul si
  shl ax, 1
  add ax, 1
  mov di, ax
  push word di
  push word [bp+8]
  push word cx
  push word L694
  mov cx, sp
  push word 8 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+4]
  jmp [bp]

L696: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L695
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L697: ; Continuation
  Bare_enter_check(16)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L696
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L698: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L697
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+16]
  mov dx, dx
  jmp [bp]

L699: ; Continuation
  Bare_enter_check(20)
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L698
  mov cx, sp
  push word 18 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+16]
  jmp [bp]

L700: ; Continuation
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
  push word L699
  mov cx, sp
  push word 20 ;; scanned
  mov bp, g7
  mov dx, g197
  jmp [bp]

L701: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L700
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L702: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L701
  mov cx, sp
  push word 18 ;; scanned
  mov dx, [bp+18]
  mov bp, [bp+6]
  jmp [bp]

L703: ; Continuation
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
  push word L702
  mov cx, sp
  push word 20 ;; scanned
  mov bp, [bp+6]
  mov dx, g196
  jmp [bp]

L704: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L703
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L705: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L704
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+18]
  mov dx, dx
  jmp [bp]

L706: ; Continuation
  Bare_enter_check(22)
  push word [bp+20]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L705
  mov cx, sp
  push word 20 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+18]
  jmp [bp]

L707: ; Continuation
  Bare_enter_check(24)
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L706
  mov cx, sp
  push word 22 ;; scanned
  mov bp, g7
  mov dx, g195
  jmp [bp]

L708: ; Continuation
  Bare_enter_check(22)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L707
  mov cx, sp
  push word 20 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L709: ; Continuation
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
  push word L708
  mov cx, sp
  push word 20 ;; scanned
  mov dx, [bp+18]
  mov bp, [bp+6]
  jmp [bp]

L710: ; Continuation
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
  push word L709
  mov cx, sp
  push word 20 ;; scanned
  mov dx, [bp+18]
  mov bp, [bp+6]
  jmp [bp]

L711: ; Continuation
  Bare_enter_check(22)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L710
  mov cx, sp
  push word 20 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L712: ; Continuation
  Bare_enter_check(22)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L711
  mov cx, sp
  push word 20 ;; scanned
  mov bp, [bp+20]
  mov dx, dx
  jmp [bp]

L713: ; Continuation
  Bare_enter_check(24)
  push word [bp+22]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L712
  mov cx, sp
  push word 22 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+20]
  jmp [bp]

L714: ; Continuation
  Bare_enter_check(26)
  push word dx
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
  push word L713
  mov cx, sp
  push word 24 ;; scanned
  mov bp, g7
  mov dx, g194
  jmp [bp]

L715: ; Continuation
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
  push word L714
  mov cx, sp
  push word 22 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L716: ; Continuation
  Bare_enter_check(24)
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L715
  mov cx, sp
  push word 22 ;; scanned
  mov dx, [bp+20]
  mov bp, [bp+6]
  jmp [bp]

L717: ; Continuation
  Bare_enter_check(24)
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L716
  mov cx, sp
  push word 22 ;; scanned
  mov bp, [bp+6]
  mov dx, g193
  jmp [bp]

L718: ; Continuation
  Bare_enter_check(22)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L717
  mov cx, sp
  push word 20 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L719: ; Continuation
  Bare_enter_check(22)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L718
  mov cx, sp
  push word 20 ;; scanned
  mov bp, [bp+20]
  mov dx, dx
  jmp [bp]

L720: ; Continuation
  Bare_enter_check(24)
  push word [bp+22]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L719
  mov cx, sp
  push word 22 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+20]
  jmp [bp]

L721: ; Continuation
  Bare_enter_check(26)
  push word dx
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
  push word L720
  mov cx, sp
  push word 24 ;; scanned
  mov bp, g7
  mov dx, g192
  jmp [bp]

L722: ; Continuation
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
  push word L721
  mov cx, sp
  push word 22 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L723: ; Continuation
  Bare_enter_check(24)
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L722
  mov cx, sp
  push word 22 ;; scanned
  mov bp, [bp+6]
  mov dx, g191
  jmp [bp]

L724: ; Continuation
  Bare_enter_check(22)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L723
  mov cx, sp
  push word 20 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L725: ; Continuation
  Bare_enter_check(22)
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L724
  mov cx, sp
  push word 20 ;; scanned
  mov dx, [bp+18]
  mov bp, [bp+8]
  jmp [bp]

L726: ; Continuation
  Bare_enter_check(22)
  mov bx, dx
  cmp word [bx], 3
  jz L690
  mov ax, [bp+14]
  shr ax, 1
  mov bx, 17
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov si, ax
  push word si
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L725
  mov cx, sp
  push word 20 ;; scanned
  mov dx, [bp+14]
  mov bp, [bp+8]
  jmp [bp]

L727: ; Arm: 319'33
  mov dx, g182
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L728: ; Arm: 7'9
  mov dx, g183
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L729: ; Function: (lam,t1)
  Bare_enter_check(20)
  mov ax, [bp+12]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov si, ax
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L726
  mov cx, sp
  push word 18 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L727
  mov ax, [bp+12]
  cmp word ax, 49
  call Bare_make_bool_from_n
  mov di, ax
  mov bx, di
  cmp word [bx], 3
  jz L728
  mov dx, g184
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L730: ; Function: (lam,t1)
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L729
  mov si, sp
  push word 14 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L731: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov dx, dx
  jmp [bp]

L732: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L731
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L733: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L732
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L734: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L733
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L735: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L734
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L736: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L735
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g206
  jmp [bp]

L737: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L736
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L738: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L737
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L739: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L738
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g205
  jmp [bp]

L740: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L739
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L741: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L740
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L742: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L741
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L743: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L742
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g204
  jmp [bp]

L744: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L743
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L745: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L744
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g203
  jmp [bp]

L746: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L745
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L747: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L746
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L748: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L747
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L749: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L748
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L750: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L749
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g202
  jmp [bp]

L751: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L750
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L752: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L751
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L753: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L752
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g201
  jmp [bp]

L754: ; Arm: 342'23
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L753
  mov cx, sp
  push word 8 ;; scanned
  mov dx, [bp+16]
  mov bp, [bp+8]
  jmp [bp]

L755: ; Arm: 344'11
  mov dx, g207
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L756: ; Continuation
  Bare_enter_check(0)
  mov dx, g208
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L757: ; Continuation
  Bare_enter_check(12)
  mov si, [bp+4]
  push word si
  push word 1
  mov di, sp
  push word 4 ;; scanned
  push word cx
  push word L756
  mov cx, sp
  push word 4 ;; scanned
  mov bp, dx
  mov dx, di
  jmp [bp]

L758: ; Continuation
  Bare_enter_check(8)
  push word [bp+8]
  push word cx
  push word L757
  mov cx, sp
  push word 6 ;; scanned
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L759: ; Continuation
  Bare_enter_check(12)
  mov si, [bp+8]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L758
  mov cx, sp
  push word 10 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L760: ; Continuation
  Bare_enter_check(14)
  mov bx, [bp+8]
  mov si, [bx]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L759
  mov cx, sp
  push word 12 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L761: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L760
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L762: ; Continuation
  Bare_enter_check(16)
  mov si, dx
  push word si
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L761
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov dx, si
  jmp [bp]

L763: ; Continuation
  Bare_enter_check(16)
  mov bx, dx
  cmp word [bx], 1
  jz L755
  mov si, [bx+2]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L762
  mov cx, sp
  push word 14 ;; scanned
  mov bx, si
  mov di, [bx+2]
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L764: ; Continuation
  Bare_enter_check(16)
  mov bx, dx
  cmp word [bx], 3
  jz L754
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+10]
  push word cx
  push word L763
  mov cx, sp
  push word 14 ;; scanned
  mov dx, [bp+16]
  mov bp, [bp+12]
  jmp [bp]

L765: ; Arm: 319'33
  mov dx, g198
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L766: ; Arm: 7'9
  mov dx, g199
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L767: ; Function: (lam,t1)
  Bare_enter_check(24)
  mov ax, [bp+14]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov si, ax
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
  push word L764
  mov cx, sp
  push word 22 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L765
  mov ax, [bp+14]
  cmp word ax, 49
  call Bare_make_bool_from_n
  mov di, ax
  mov bx, di
  cmp word [bx], 3
  jz L766
  mov dx, g200
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L768: ; Function: (lam,t1)
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L767
  mov si, sp
  push word 18 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L769: ; Function: (lam,t1)
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L768
  mov si, sp
  push word 16 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L770: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov dx, dx
  jmp [bp]

L771: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L770
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L772: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L771
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L773: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L772
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L774: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L773
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L775: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L774
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g237
  jmp [bp]

L776: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L775
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L777: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L776
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L778: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L777
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g236
  jmp [bp]

L779: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L778
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L780: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L779
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L781: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L780
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L782: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L781
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g235
  jmp [bp]

L783: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L782
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L784: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L783
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g234
  jmp [bp]

L785: ; Arm: 384'19
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L784
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, g233
  jmp [bp]

L786: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov dx, dx
  jmp [bp]

L787: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L786
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L788: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L787
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L789: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L788
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L790: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L789
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L791: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L790
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g242
  jmp [bp]

L792: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L791
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L793: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L792
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L794: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L793
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g241
  jmp [bp]

L795: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L794
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L796: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L795
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L797: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L796
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L798: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L797
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g240
  jmp [bp]

L799: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L798
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L800: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L799
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g239
  jmp [bp]

L801: ; Arm: 387'21
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L800
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, g238
  jmp [bp]

L802: ; Arm: 388'24
  mov dx, g245
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L803: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov dx, dx
  jmp [bp]

L804: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L803
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L805: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L804
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L806: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L805
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L807: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L806
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L808: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L807
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g250
  jmp [bp]

L809: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L808
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L810: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L809
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L811: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L810
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g249
  jmp [bp]

L812: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L811
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L813: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L812
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L814: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L813
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L815: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L814
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g248
  jmp [bp]

L816: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L815
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L817: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L816
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g247
  jmp [bp]

L818: ; Arm: 390'19
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L817
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, g246
  jmp [bp]

L819: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L820: ; Continuation
  Bare_enter_check(16)
  push word 1
  push word [bp+6]
  push word 1
  mov si, sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L819
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, si
  jmp [bp]

L821: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L822: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L821
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g38
  mov dx, dx
  jmp [bp]

L823: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L822
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L824: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L823
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L825: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L824
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L826: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L825
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+10]
  jmp [bp]

L827: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L826
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g7
  mov dx, g266
  jmp [bp]

L828: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L827
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L829: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L828
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L830: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L829
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, g265
  jmp [bp]

L831: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L830
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L832: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L831
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L833: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L832
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+10]
  jmp [bp]

L834: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L833
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g7
  mov dx, g264
  jmp [bp]

L835: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L834
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L836: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L835
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, g263
  jmp [bp]

L837: ; Arm: 374'11
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L836
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g262
  jmp [bp]

L838: ; Continuation
  Bare_enter_check(22)
  mov ax, [bp+14]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov si, ax
  push word [bp+12]
  push word [bp+8]
  push word cx
  push word L820
  mov cx, sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L837
  mov bx, [bp+10]
  mov di, [bx+2]
  mov ax, [bx+4]
  mov [Temps+6], ax
  mov ax, [bx+6]
  mov [Temps+8], ax
  mov ax, [Temps+6]
  shr ax, 1
  mov bx, [bp+14]
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+10], ax
  mov ax, [Temps+8]
  shr ax, 1
  mov bx, [bp+14]
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+12], ax
  push word [Temps+12]
  push word [Temps+10]
  push word di
  push word 1
  mov [Temps+14], sp
  push word 8 ;; scanned
  mov dx, [Temps+14]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L839: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L838
  mov cx, sp
  push word 16 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+16]
  jmp [bp]

L840: ; Continuation
  Bare_enter_check(20)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L839
  mov cx, sp
  push word 18 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+12]
  jmp [bp]

L841: ; Continuation
  Bare_enter_check(22)
  push word dx
  push word [bp+20]
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L840
  mov cx, sp
  push word 20 ;; scanned
  mov dx, [bp+16]
  mov bp, [bp+8]
  jmp [bp]

L842: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L843: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L842
  mov cx, sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L844: ; Continuation
  Bare_enter_check(34)
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L841
  mov cx, sp
  push word 22 ;; scanned
  mov bx, dx
  mov si, [bx+2]
  mov di, [bx+4]
  mov ax, [bx+6]
  mov [Temps+6], ax
  push word [Temps+6]
  push word di
  push word cx
  push word L843
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, si
  jmp [bp]

L845: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L846: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L845
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g38
  mov dx, dx
  jmp [bp]

L847: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L846
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L848: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L847
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L849: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L848
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L850: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L849
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+10]
  jmp [bp]

L851: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L850
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g7
  mov dx, g261
  jmp [bp]

L852: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L851
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L853: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L852
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L854: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L853
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, g260
  jmp [bp]

L855: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L854
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L856: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L855
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L857: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L856
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+10]
  jmp [bp]

L858: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L857
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g7
  mov dx, g259
  jmp [bp]

L859: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L858
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L860: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L859
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, g258
  jmp [bp]

L861: ; Arm: 368'11
  push word [bp+14]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L860
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g257
  jmp [bp]

L862: ; Continuation
  Bare_enter_check(38)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov si, ax
  push word dx
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
  push word L844
  mov cx, sp
  push word 24 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L861
  mov bx, [bp+14]
  mov di, [bx+2]
  mov ax, [bx+4]
  mov [Temps+6], ax
  mov ax, [bx+6]
  mov [Temps+8], ax
  push word dx
  push word [Temps+6]
  push word di
  push word 1
  mov [Temps+10], sp
  push word 8 ;; scanned
  mov dx, [Temps+10]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L863: ; Arm: 98'23
  mov dx, [bp+24]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L864: ; Continuation
  Bare_enter_check(24)
  mov ax, [bp+24]
  cmp word ax, [bp+18]
  call Bare_make_bool_from_n
  mov si, ax
  push word [bp+22]
  push word [bp+20]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L862
  mov cx, sp
  push word 22 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L863
  mov dx, [bp+18]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L865: ; Arm: 190'46
  mov dx, g251
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L866: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov dx, dx
  jmp [bp]

L867: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L866
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L868: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L867
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L869: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L868
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L870: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L869
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L871: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L870
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g256
  jmp [bp]

L872: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L871
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L873: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L872
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L874: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L873
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g255
  jmp [bp]

L875: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L874
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L876: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L875
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L877: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L876
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L878: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L877
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g254
  jmp [bp]

L879: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L878
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L880: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L879
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g253
  jmp [bp]

L881: ; Continuation
  Bare_enter_check(38)
  mov bx, dx
  cmp word [bx], 3
  jz L802
  mov bx, [bp+16]
  cmp word [bx], 1
  jz L818
  mov si, [bx+2]
  mov di, [bx+4]
  mov ax, 129
  shr ax, 1
  mov bx, [bp+18]
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, 1
  cmp word ax, [Temps+6]
  call Bare_make_bool_from_n
  mov [Temps+8], ax
  push word [Temps+6]
  push word di
  push word si
  push word [bp+20]
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L864
  mov cx, sp
  push word 26 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L865
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L880
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, g252
  jmp [bp]

L882: ; Arm: 7'9
  mov dx, g243
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L883: ; Continuation
  Bare_enter_check(24)
  mov bx, dx
  cmp word [bx], 3
  jz L785
  mov bx, [bp+14]
  mov si, [bx+2]
  mov di, [bx+4]
  mov ax, [bx+6]
  mov [Temps+6], ax
  mov ax, [Temps+6]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L801
  mov ax, 1
  cmp word ax, [Temps+6]
  call Bare_make_bool_from_n
  mov [Temps+10], ax
  push word [Temps+6]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L881
  mov cx, sp
  push word 22 ;; scanned
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L882
  mov dx, g244
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L884: ; Arm: 7'9
  mov dx, g231
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L885: ; Continuation
  Bare_enter_check(22)
  mov bx, [bp+12]
  mov si, [bx+2]
  mov di, [bx+4]
  mov ax, di
  cmp word ax, 129
  call Bare_make_bool_from_n
  mov [Temps+6], ax
  push word di
  push word si
  push word [bp+16]
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L883
  mov cx, sp
  push word 20 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L884
  mov dx, g232
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L886: ; Continuation
  Bare_enter_check(20)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L885
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L887: ; Continuation
  Bare_enter_check(22)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L886
  mov cx, sp
  push word 20 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L888: ; Continuation
  Bare_enter_check(22)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L887
  mov cx, sp
  push word 20 ;; scanned
  mov bp, [bp+20]
  mov dx, dx
  jmp [bp]

L889: ; Continuation
  Bare_enter_check(24)
  push word [bp+22]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L888
  mov cx, sp
  push word 22 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+20]
  jmp [bp]

L890: ; Continuation
  Bare_enter_check(26)
  push word dx
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
  push word L889
  mov cx, sp
  push word 24 ;; scanned
  mov bp, g7
  mov dx, g230
  jmp [bp]

L891: ; Continuation
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
  push word L890
  mov cx, sp
  push word 22 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L892: ; Continuation
  Bare_enter_check(24)
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L891
  mov cx, sp
  push word 22 ;; scanned
  mov dx, [bp+20]
  mov bp, [bp+6]
  jmp [bp]

L893: ; Continuation
  Bare_enter_check(24)
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L892
  mov cx, sp
  push word 22 ;; scanned
  mov bp, [bp+6]
  mov dx, g229
  jmp [bp]

L894: ; Continuation
  Bare_enter_check(22)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L893
  mov cx, sp
  push word 20 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L895: ; Continuation
  Bare_enter_check(22)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L894
  mov cx, sp
  push word 20 ;; scanned
  mov bp, [bp+20]
  mov dx, dx
  jmp [bp]

L896: ; Continuation
  Bare_enter_check(24)
  push word [bp+22]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L895
  mov cx, sp
  push word 22 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+20]
  jmp [bp]

L897: ; Continuation
  Bare_enter_check(26)
  push word dx
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
  push word L896
  mov cx, sp
  push word 24 ;; scanned
  mov bp, g7
  mov dx, g228
  jmp [bp]

L898: ; Continuation
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
  push word L897
  mov cx, sp
  push word 22 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L899: ; Continuation
  Bare_enter_check(24)
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L898
  mov cx, sp
  push word 22 ;; scanned
  mov dx, [bp+20]
  mov bp, [bp+6]
  jmp [bp]

L900: ; Continuation
  Bare_enter_check(24)
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L899
  mov cx, sp
  push word 22 ;; scanned
  mov dx, [bp+20]
  mov bp, [bp+6]
  jmp [bp]

L901: ; Continuation
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
  push word L900
  mov cx, sp
  push word 22 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L902: ; Continuation
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
  push word L901
  mov cx, sp
  push word 22 ;; scanned
  mov bp, [bp+22]
  mov dx, dx
  jmp [bp]

L903: ; Continuation
  Bare_enter_check(26)
  push word [bp+24]
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
  push word L902
  mov cx, sp
  push word 24 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+22]
  jmp [bp]

L904: ; Continuation
  Bare_enter_check(28)
  push word dx
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
  push word L903
  mov cx, sp
  push word 26 ;; scanned
  mov bp, g7
  mov dx, g227
  jmp [bp]

L905: ; Continuation
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
  push word L904
  mov cx, sp
  push word 24 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L906: ; Continuation
  Bare_enter_check(26)
  push word dx
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
  push word L905
  mov cx, sp
  push word 24 ;; scanned
  mov dx, [bp+22]
  mov bp, [bp+6]
  jmp [bp]

L907: ; Continuation
  Bare_enter_check(26)
  push word dx
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
  push word L906
  mov cx, sp
  push word 24 ;; scanned
  mov bp, [bp+6]
  mov dx, g226
  jmp [bp]

L908: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L909: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L908
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L910: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L909
  mov cx, sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+6]
  jmp [bp]

L911: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L910
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, g225
  jmp [bp]

L912: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L911
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L913: ; Continuation
  Bare_enter_check(10)
  push word dx
  push word [bp+4]
  push word cx
  push word L912
  mov cx, sp
  push word 8 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L914: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L913
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g224
  jmp [bp]

L915: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L914
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L916: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L915
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L917: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L916
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L918: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L917
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g223
  jmp [bp]

L919: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L918
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L920: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L919
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L921: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L920
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L922: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L921
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L923: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L922
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L924: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L923
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+10]
  jmp [bp]

L925: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L924
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g7
  mov dx, g222
  jmp [bp]

L926: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L925
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L927: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L926
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L928: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L927
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, g221
  jmp [bp]

L929: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L928
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L930: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L929
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L931: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L930
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+10]
  jmp [bp]

L932: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L931
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g7
  mov dx, g220
  jmp [bp]

L933: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L932
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L934: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L933
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L935: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L934
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L936: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L935
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L937: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L936
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L938: ; Continuation
  Bare_enter_check(16)
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L937
  mov cx, sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+12]
  jmp [bp]

L939: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L938
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g7
  mov dx, g219
  jmp [bp]

L940: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L939
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L941: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L940
  mov cx, sp
  push word 14 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L942: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L941
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, g218
  jmp [bp]

L943: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L942
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L944: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L943
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L945: ; Continuation
  Bare_enter_check(16)
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L944
  mov cx, sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+12]
  jmp [bp]

L946: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L945
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g7
  mov dx, g217
  jmp [bp]

L947: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L946
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L948: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L947
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, g216
  jmp [bp]

L949: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L948
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L950: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+12]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L949
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+8]
  jmp [bp]

L951: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L950
  mov cx, sp
  push word 14 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+8]
  jmp [bp]

L952: ; Continuation
  Bare_enter_check(40)
  push word dx
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L907
  mov cx, sp
  push word 22 ;; scanned
  mov bx, [bp+20]
  mov si, [bx+2]
  mov di, [bx+4]
  mov ax, [bx+6]
  mov [Temps+6], ax
  mov bx, si
  mov ax, [bx]
  mov [Temps+8], ax
  push word [Temps+6]
  push word di
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L951
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+8]
  mov dx, [Temps+8]
  jmp [bp]

L953: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L954: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L953
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L955: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L954
  mov cx, sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+6]
  jmp [bp]

L956: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L955
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, g215
  jmp [bp]

L957: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L956
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L958: ; Continuation
  Bare_enter_check(10)
  push word dx
  push word [bp+4]
  push word cx
  push word L957
  mov cx, sp
  push word 8 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L959: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L958
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g214
  jmp [bp]

L960: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L959
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L961: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L960
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L962: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L961
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L963: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L962
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g213
  jmp [bp]

L964: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L963
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L965: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L964
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L966: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L965
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L967: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L966
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L968: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L967
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L969: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L968
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+10]
  jmp [bp]

L970: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L969
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g7
  mov dx, g212
  jmp [bp]

L971: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L970
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L972: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L971
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L973: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L972
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, g211
  jmp [bp]

L974: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L973
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L975: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L974
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L976: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L975
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+10]
  jmp [bp]

L977: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L976
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g7
  mov dx, g210
  jmp [bp]

L978: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L977
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L979: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L978
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, g209
  jmp [bp]

L980: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L979
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L981: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L980
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+8]
  jmp [bp]

L982: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L981
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L983: ; Function: (lam,t1)
  Bare_enter_check(38)
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
  push word L952
  mov cx, sp
  push word 22 ;; scanned
  mov bx, [bp+14]
  mov si, [bx+2]
  mov di, [bx+4]
  push word di
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L982
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g2
  mov dx, si
  jmp [bp]

L984: ; Function: (write_blocks,t1)
  Bare_enter_check(20)
  push word bp
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L983
  mov si, sp
  push word 18 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L985: ; Arm: 295'24
  mov dx, g271
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L986: ; Continuation
  Bare_enter_check(0)
  mov bx, dx
  cmp word [bx], 3
  jz L985
  mov ax, [bp+4]
  mov bx, `,`
  push word si ;; save
  mov si, [bp+6]
  shr si, 1
  call Bare_set_bytes
  pop word si ;; restore
  mov si, Bare_unit
  mov ax, [bp+6]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov di, ax
  mov bp, [bp+8]
  mov dx, di
  jmp [bp]

L987: ; Arm: 7'9
  mov dx, g269
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L988: ; Function: (loop,t3)
  Bare_enter_check(12)
  mov ax, dx
  cmp word ax, 1025
  call Bare_make_bool_from_n
  mov si, ax
  push word bp
  push word dx
  push word [bp+2]
  push word cx
  push word L986
  mov cx, sp
  push word 10 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L987
  mov dx, g270
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L989: ; Arm: 153'22
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov bp, [bp+2]
  mov dx, dx
  jmp [bp]

L990: ; Arm: 154'28
  mov ax, `\x04`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  push word dx
  push word `\x04`
  push word 3
  mov [Temps+14], sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+14]
  jmp [bp]

L991: ; Arm: 155'19
  mov bp, bp
  mov dx, dx
  jmp [bp]

L992: ; Arm: 158'17
  mov bp, bp
  mov dx, dx
  jmp [bp]

L993: ; Continuation
  Bare_enter_check(0)
  mov ax, `\x08`
  call Bare_put_char
  mov si, Bare_unit
  mov ax, ` `
  call Bare_put_char
  mov di, Bare_unit
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L994: ; Arm: 160'31
  mov ax, `\x08`
  call Bare_put_char
  mov si, Bare_unit
  mov ax, ` `
  call Bare_put_char
  mov di, Bare_unit
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L995: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L993
  mov cx, sp
  push word 8 ;; scanned
  mov bx, dx
  cmp word [bx], 3
  jz L994
  mov dx, g277
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L996: ; Arm: 7'9
  mov dx, g275
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L997: ; Arm: 156'21
  mov bx, dx
  cmp word [bx], 1
  jz L992
  mov ax, [bx+2]
  mov [Temps+14], ax
  mov ax, [bx+4]
  mov [Temps+16], ax
  mov ax, [Temps+14]
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+18], ax
  mov ax, 53
  cmp word ax, [Temps+18]
  call Bare_make_bool_from_n
  mov [Temps+20], ax
  push word [Temps+16]
  push word bp
  push word cx
  push word L995
  mov cx, sp
  push word 8 ;; scanned
  mov bx, [Temps+20]
  cmp word [bx], 3
  jz L996
  mov dx, g276
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L998: ; Function: (readloop,t1)
  Bare_enter_check(10)
  call Bare_get_char
  mov si, ax
  mov ax, si
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov di, ax
  mov ax, si
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L989
  mov ax, si
  cmp word ax, `\x04`
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L990
  mov ax, 255
  cmp word ax, di
  call Bare_make_bool_from_n
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L991
  mov ax, di
  cmp word ax, 255
  call Bare_make_bool_from_z
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L997
  mov ax, si
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+14], ax
  push word dx
  push word si
  push word 3
  mov [Temps+16], sp
  push word 6 ;; scanned
  mov bp, bp
  mov dx, [Temps+16]
  jmp [bp]

L999: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, [bp+6]
  mov dx, si
  jmp [bp]

L1000: ; Arm: 527'7
  mov dx, g281
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1001: ; Arm: 432'9
  mov dx, g282
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1002: ; Arm: 436'35
  push word [bp+8]
  push word 3
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1003: ; Continuation
  Bare_enter_check(6)
  mov bx, dx
  cmp word [bx], 3
  jz L1002
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L1004: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L1003
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L1005: ; Function: (loop,t3)
  Bare_enter_check(14)
  mov bx, dx
  cmp word [bx], 1
  jz L1001
  mov si, [bx+2]
  mov di, [bx+4]
  mov bx, si
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [Temps+8]
  push word di
  push word bp
  push word [bp+4]
  push word cx
  push word L1004
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+6]
  jmp [bp]

L1006: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov dx, dx
  jmp [bp]

L1007: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L1006
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1008: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L1007
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1009: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1008
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L1010: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1009
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L1011: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1010
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g288
  jmp [bp]

L1012: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1011
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L1013: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1012
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L1014: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1013
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g287
  jmp [bp]

L1015: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1014
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1016: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1015
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L1017: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1016
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L1018: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1017
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g286
  jmp [bp]

L1019: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1018
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L1020: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1019
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g285
  jmp [bp]

L1021: ; Arm: 447'15
  mov si, [bx+2]
  mov di, [bx+4]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L1020
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, g284
  jmp [bp]

L1022: ; Arm: 450'31
  mov dx, g291
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1023: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, [bp+6]
  mov dx, si
  jmp [bp]

L1024: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L1023
  mov cx, sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L1025: ; Continuation
  Bare_enter_check(12)
  mov bx, dx
  cmp word [bx], 3
  jz L1022
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L1024
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+4]
  jmp [bp]

L1026: ; Arm: 7'9
  mov dx, g289
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1027: ; Function: (loop,t1)
  Bare_enter_check(14)
  mov ax, dx
  cmp word ax, 7
  call Bare_make_bool_from_n
  mov si, ax
  push word bp
  push word dx
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L1025
  mov cx, sp
  push word 12 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L1026
  mov dx, g290
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1028: ; Function: (lam,t4)
  Bare_enter_check(10)
  mov bx, dx
  cmp word [bx], 3
  jz L1021
  push word [bp+8]
  push word [bp+6]
  push word L1027
  mov si, sp
  push word 6 ;; scanned
  mov bp, si
  mov dx, 1
  jmp [bp]

L1029: ; Continuation
  Bare_enter_check(0)
  mov bx, [bp+4]
  mov ax, [bp+6]
  mov [bx], ax
  mov si, Bare_unit
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1030: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov dx, dx
  jmp [bp]

L1031: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L1030
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1032: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L1031
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1033: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1032
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L1034: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1033
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L1035: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1034
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g298
  jmp [bp]

L1036: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1035
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L1037: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1036
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L1038: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1037
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g297
  jmp [bp]

L1039: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1038
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1040: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1039
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L1041: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1040
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L1042: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1041
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g296
  jmp [bp]

L1043: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1042
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L1044: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1043
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g295
  jmp [bp]

L1045: ; Arm: 460'15
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L1044
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, g294
  jmp [bp]

L1046: ; Arm: 463'31
  mov dx, g301
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1047: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, [bp+6]
  mov dx, si
  jmp [bp]

L1048: ; Arm: 304'9
  mov dx, g305
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1049: ; Arm: 283'16
  mov dx, g308
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1050: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, [bp+6]
  mov dx, si
  jmp [bp]

L1051: ; Arm: 287'23
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1052: ; Continuation
  Bare_enter_check(10)
  mov ax, dx
  call Bare_put_char
  mov si, Bare_unit
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 129
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov di, dx
  pop word dx ;; restore
  mov ax, di
  cmp word ax, 127
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1050
  mov cx, sp
  push word 8 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L1051
  mov dx, g310
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1053: ; Arm: 285'32
  mov dx, `$`
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1054: ; Arm: 285'64
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1055: ; Continuation
  Bare_enter_check(0)
  mov bx, dx
  cmp word [bx], 3
  jz L1054
  mov dx, `.`
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1056: ; Arm: 279'12
  mov dx, g309
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1057: ; Continuation
  Bare_enter_check(18)
  mov bx, dx
  cmp word [bx], 3
  jz L1049
  mov ax, [bp+4]
  mov bx, [bp+6]
  shr bx, 1
  call Bare_get_bytes
  mov si, ax
  mov ax, si
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov di, ax
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L1052
  mov cx, sp
  push word 8 ;; scanned
  mov bx, di
  cmp word [bx], 3
  jz L1053
  mov ax, si
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  cmp word ax, 65
  call Bare_make_bool_from_n
  mov [Temps+8], ax
  push word si
  push word cx
  push word L1055
  mov cx, sp
  push word 6 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L1056
  mov ax, [Temps+6]
  cmp word ax, 255
  call Bare_make_bool_from_n
  mov [Temps+10], ax
  mov dx, [Temps+10]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1058: ; Arm: 7'9
  mov dx, g306
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1059: ; Function: (loop,t2)
  Bare_enter_check(12)
  mov ax, dx
  cmp word ax, 1025
  call Bare_make_bool_from_n
  mov si, ax
  push word bp
  push word dx
  push word [bp+2]
  push word cx
  push word L1057
  mov cx, sp
  push word 10 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L1058
  mov dx, g307
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1060: ; Continuation
  Bare_enter_check(16)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1047
  mov cx, sp
  push word 8 ;; scanned
  mov bx, dx
  cmp word [bx], 1
  jz L1048
  mov si, [bx+2]
  push word si
  push word L1059
  mov di, sp
  push word 4 ;; scanned
  mov bp, di
  mov dx, 1
  jmp [bp]

L1061: ; Arm: 275'12
  mov dx, g304
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1062: ; Continuation
  Bare_enter_check(16)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1060
  mov cx, sp
  push word 8 ;; scanned
  mov bx, dx
  cmp word [bx], 3
  jz L1061
  mov si, [bp+8]
  push word si
  push word 3
  mov di, sp
  push word 4 ;; scanned
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1063: ; Arm: 7'9
  mov dx, g302
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1064: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1062
  mov cx, sp
  push word 10 ;; scanned
  mov bx, dx
  cmp word [bx], 3
  jz L1063
  mov dx, g303
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1065: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1064
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L1066: ; Continuation
  Bare_enter_check(600)
  mov bx, dx
  cmp word [bx], 3
  jz L1046
  mov ax, 1025
  call Bare_make_bytes
  mov si, ax
  push word si
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L1065
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L1067: ; Arm: 7'9
  mov dx, g299
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1068: ; Function: (loop,t3)
  Bare_enter_check(12)
  mov ax, dx
  cmp word ax, 7
  call Bare_make_bool_from_n
  mov si, ax
  push word bp
  push word dx
  push word [bp+2]
  push word cx
  push word L1066
  mov cx, sp
  push word 10 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L1067
  mov dx, g300
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1069: ; Function: (lam,t7)
  Bare_enter_check(20)
  mov bx, [bp+6]
  mov si, [bx]
  mov bx, [bp+6]
  mov ax, g293
  mov [bx], ax
  mov di, Bare_unit
  push word si
  push word [bp+6]
  push word cx
  push word L1029
  mov cx, sp
  push word 8 ;; scanned
  mov bx, dx
  cmp word [bx], 3
  jz L1045
  push word [bp+8]
  push word L1068
  mov [Temps+6], sp
  push word 4 ;; scanned
  mov bp, [Temps+6]
  mov dx, 1
  jmp [bp]

L1070: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov dx, dx
  jmp [bp]

L1071: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L1070
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1072: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L1071
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1073: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1072
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L1074: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1073
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L1075: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1074
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g316
  jmp [bp]

L1076: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1075
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L1077: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1076
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L1078: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1077
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g315
  jmp [bp]

L1079: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1078
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1080: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1079
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L1081: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1080
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L1082: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1081
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g314
  jmp [bp]

L1083: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1082
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L1084: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1083
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g313
  jmp [bp]

L1085: ; Arm: 492'11
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L1084
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, g312
  jmp [bp]

L1086: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov dx, dx
  jmp [bp]

L1087: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L1086
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1088: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L1087
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1089: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1088
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L1090: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1089
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L1091: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1090
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g321
  jmp [bp]

L1092: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1091
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L1093: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1092
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L1094: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1093
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g320
  jmp [bp]

L1095: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1094
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1096: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1095
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L1097: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1096
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L1098: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1097
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g319
  jmp [bp]

L1099: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1098
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L1100: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1099
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g318
  jmp [bp]

L1101: ; Arm: 495'16
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L1100
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, g317
  jmp [bp]

L1102: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov dx, dx
  jmp [bp]

L1103: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L1102
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1104: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L1103
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1105: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1104
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L1106: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1105
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L1107: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1106
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g326
  jmp [bp]

L1108: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1107
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L1109: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1108
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L1110: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1109
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g325
  jmp [bp]

L1111: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1110
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1112: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1111
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L1113: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1112
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L1114: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1113
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g324
  jmp [bp]

L1115: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1114
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L1116: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1115
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g323
  jmp [bp]

L1117: ; Arm: 498'19
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L1116
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, g322
  jmp [bp]

L1118: ; Arm: 153'22
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov bp, [bp+2]
  mov dx, dx
  jmp [bp]

L1119: ; Arm: 154'28
  mov ax, `\x04`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  push word dx
  push word `\x04`
  push word 3
  mov [Temps+14], sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+14]
  jmp [bp]

L1120: ; Arm: 155'19
  mov bp, bp
  mov dx, dx
  jmp [bp]

L1121: ; Arm: 158'17
  mov bp, bp
  mov dx, dx
  jmp [bp]

L1122: ; Continuation
  Bare_enter_check(0)
  mov ax, `\x08`
  call Bare_put_char
  mov si, Bare_unit
  mov ax, ` `
  call Bare_put_char
  mov di, Bare_unit
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L1123: ; Arm: 160'31
  mov ax, `\x08`
  call Bare_put_char
  mov si, Bare_unit
  mov ax, ` `
  call Bare_put_char
  mov di, Bare_unit
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1124: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1122
  mov cx, sp
  push word 8 ;; scanned
  mov bx, dx
  cmp word [bx], 3
  jz L1123
  mov dx, g330
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1125: ; Arm: 7'9
  mov dx, g328
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1126: ; Arm: 156'21
  mov bx, dx
  cmp word [bx], 1
  jz L1121
  mov ax, [bx+2]
  mov [Temps+14], ax
  mov ax, [bx+4]
  mov [Temps+16], ax
  mov ax, [Temps+14]
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+18], ax
  mov ax, 53
  cmp word ax, [Temps+18]
  call Bare_make_bool_from_n
  mov [Temps+20], ax
  push word [Temps+16]
  push word bp
  push word cx
  push word L1124
  mov cx, sp
  push word 8 ;; scanned
  mov bx, [Temps+20]
  cmp word [bx], 3
  jz L1125
  mov dx, g329
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1127: ; Function: (readloop,t1)
  Bare_enter_check(10)
  call Bare_get_char
  mov si, ax
  mov ax, si
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov di, ax
  mov ax, si
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L1118
  mov ax, si
  cmp word ax, `\x04`
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L1119
  mov ax, 255
  cmp word ax, di
  call Bare_make_bool_from_n
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L1120
  mov ax, di
  cmp word ax, 255
  call Bare_make_bool_from_z
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L1126
  mov ax, si
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+14], ax
  push word dx
  push word si
  push word 3
  mov [Temps+16], sp
  push word 6 ;; scanned
  mov bp, bp
  mov dx, [Temps+16]
  jmp [bp]

L1128: ; Arm: 463'31
  mov dx, g338
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1129: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, [bp+6]
  mov dx, si
  jmp [bp]

L1130: ; Arm: 304'9
  mov dx, g342
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1131: ; Arm: 283'16
  mov dx, g345
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1132: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, [bp+6]
  mov dx, si
  jmp [bp]

L1133: ; Arm: 287'23
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1134: ; Continuation
  Bare_enter_check(10)
  mov ax, dx
  call Bare_put_char
  mov si, Bare_unit
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 129
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov di, dx
  pop word dx ;; restore
  mov ax, di
  cmp word ax, 127
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1132
  mov cx, sp
  push word 8 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L1133
  mov dx, g347
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1135: ; Arm: 285'32
  mov dx, `$`
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1136: ; Arm: 285'64
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1137: ; Continuation
  Bare_enter_check(0)
  mov bx, dx
  cmp word [bx], 3
  jz L1136
  mov dx, `.`
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1138: ; Arm: 279'12
  mov dx, g346
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1139: ; Continuation
  Bare_enter_check(18)
  mov bx, dx
  cmp word [bx], 3
  jz L1131
  mov ax, [bp+4]
  mov bx, [bp+6]
  shr bx, 1
  call Bare_get_bytes
  mov si, ax
  mov ax, si
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov di, ax
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L1134
  mov cx, sp
  push word 8 ;; scanned
  mov bx, di
  cmp word [bx], 3
  jz L1135
  mov ax, si
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  cmp word ax, 65
  call Bare_make_bool_from_n
  mov [Temps+8], ax
  push word si
  push word cx
  push word L1137
  mov cx, sp
  push word 6 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L1138
  mov ax, [Temps+6]
  cmp word ax, 255
  call Bare_make_bool_from_n
  mov [Temps+10], ax
  mov dx, [Temps+10]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1140: ; Arm: 7'9
  mov dx, g343
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1141: ; Function: (loop,t2)
  Bare_enter_check(12)
  mov ax, dx
  cmp word ax, 1025
  call Bare_make_bool_from_n
  mov si, ax
  push word bp
  push word dx
  push word [bp+2]
  push word cx
  push word L1139
  mov cx, sp
  push word 10 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L1140
  mov dx, g344
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1142: ; Continuation
  Bare_enter_check(16)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1129
  mov cx, sp
  push word 8 ;; scanned
  mov bx, dx
  cmp word [bx], 1
  jz L1130
  mov si, [bx+2]
  push word si
  push word L1141
  mov di, sp
  push word 4 ;; scanned
  mov bp, di
  mov dx, 1
  jmp [bp]

L1143: ; Arm: 275'12
  mov dx, g341
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1144: ; Continuation
  Bare_enter_check(16)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1142
  mov cx, sp
  push word 8 ;; scanned
  mov bx, dx
  cmp word [bx], 3
  jz L1143
  mov si, [bp+8]
  push word si
  push word 3
  mov di, sp
  push word 4 ;; scanned
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1145: ; Arm: 7'9
  mov dx, g339
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1146: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1144
  mov cx, sp
  push word 10 ;; scanned
  mov bx, dx
  cmp word [bx], 3
  jz L1145
  mov dx, g340
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1147: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1146
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L1148: ; Continuation
  Bare_enter_check(600)
  mov bx, dx
  cmp word [bx], 3
  jz L1128
  mov ax, 1025
  call Bare_make_bytes
  mov si, ax
  push word si
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L1147
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L1149: ; Arm: 7'9
  mov dx, g336
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1150: ; Function: (loop,t3)
  Bare_enter_check(12)
  mov ax, dx
  cmp word ax, 7
  call Bare_make_bool_from_n
  mov si, ax
  push word bp
  push word dx
  push word [bp+2]
  push word cx
  push word L1148
  mov cx, sp
  push word 10 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L1149
  mov dx, g337
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1151: ; Arm: 508'25
  mov dx, g348
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1152: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L1153: ; Continuation
  Bare_enter_check(8)
  mov ax, [bp+6]
  shr ax, 1
  mov bx, 129
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov si, dx
  pop word dx ;; restore
  push word si
  push word cx
  push word L1152
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1154: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L1153
  mov cx, sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L1155: ; Continuation
  Bare_enter_check(12)
  mov bx, [bp+4]
  mov ax, [bp+16]
  mov [bx], ax
  mov si, Bare_unit
  mov bx, [bp+12]
  cmp word [bx], 3
  jz L1151
  mov bx, [bp+14]
  mov di, [bx]
  mov ax, [bp+10]
  shr ax, 1
  mov bx, di
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  shr ax, 1
  mov bx, 129
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov [Temps+8], ax
  push word [Temps+6]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L1154
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g3
  mov dx, [Temps+8]
  jmp [bp]

L1156: ; Continuation
  Bare_enter_check(26)
  mov bx, [bp+4]
  mov si, [bx]
  mov bx, [bp+4]
  mov ax, g335
  mov [bx], ax
  mov di, Bare_unit
  push word [bp+6]
  push word L1150
  mov [Temps+6], sp
  push word 4 ;; scanned
  push word si
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L1155
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [Temps+6]
  mov dx, 1
  jmp [bp]

L1157: ; Continuation
  Bare_enter_check(30)
  push word [bp+18]
  push word 1
  push word [bp+16]
  push word 1
  mov si, sp
  push word 8 ;; scanned
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1156
  mov cx, sp
  push word 18 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L1158: ; Continuation
  Bare_enter_check(30)
  push word [bp+14]
  push word [bp+10]
  push word 1
  mov si, sp
  push word 6 ;; scanned
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1157
  mov cx, sp
  push word 20 ;; scanned
  mov bp, [bp+8]
  mov dx, si
  jmp [bp]

L1159: ; Arm: 505'33
  mov ax, [bp+16]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1160: ; Continuation
  Bare_enter_check(22)
  push word dx
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1158
  mov cx, sp
  push word 20 ;; scanned
  mov bx, [bp+18]
  cmp word [bx], 3
  jz L1159
  mov ax, [bp+16]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1161: ; Arm: 504'36
  mov dx, [bp+20]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1162: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1163: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L1162
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L1164: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L1163
  mov cx, sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+6]
  jmp [bp]

L1165: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1164
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, g334
  jmp [bp]

L1166: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1165
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L1167: ; Continuation
  Bare_enter_check(10)
  push word dx
  push word [bp+4]
  push word cx
  push word L1166
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, g333
  jmp [bp]

L1168: ; Continuation
  Bare_enter_check(32)
  push word dx
  push word [bp+22]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word cx
  push word L1160
  mov cx, sp
  push word 20 ;; scanned
  mov bx, dx
  cmp word [bx], 3
  jz L1161
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1167
  mov cx, sp
  push word 8 ;; scanned
  mov dx, [bp+20]
  mov bp, [bp+6]
  jmp [bp]

L1169: ; Arm: 503'37
  mov dx, g332
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1170: ; Continuation
  Bare_enter_check(26)
  mov bx, dx
  mov si, [bx]
  mov ax, si
  cmp word ax, 3
  call Bare_make_bool_from_n
  mov di, ax
  push word si
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1168
  mov cx, sp
  push word 24 ;; scanned
  mov bx, di
  cmp word [bx], 3
  jz L1169
  mov ax, si
  shr ax, 1
  mov bx, 3
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, dx
  mov bx, [Temps+6]
  shr bx, 1
  call Bare_get_bytes
  mov [Temps+8], ax
  mov ax, [Temps+8]
  cmp word ax, `\x04`
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov dx, [Temps+10]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1171: ; Function: (lam,t1)
  Bare_enter_check(28)
  push word [bp+4]
  push word L1127
  mov si, sp
  push word 4 ;; scanned
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L1170
  mov cx, sp
  push word 20 ;; scanned
  mov bp, si
  mov dx, g331
  jmp [bp]

L1172: ; Function: (loop,t2)
  Bare_enter_check(20)
  push word bp
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L1171
  mov si, sp
  push word 18 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1173: ; Continuation
  Bare_enter_check(0)
  mov bp, dx
  mov dx, 1
  jmp [bp]

L1174: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L1173
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1175: ; Arm: 403'11
  push word g349
  push word 19
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [Temps+8]
  push word 17
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [Temps+10]
  push word 15
  push word 3
  mov [Temps+12], sp
  push word 6 ;; scanned
  push word [Temps+12]
  push word 13
  push word 3
  mov [Temps+14], sp
  push word 6 ;; scanned
  push word [Temps+14]
  push word 11
  push word 3
  mov [Temps+16], sp
  push word 6 ;; scanned
  mov dx, [Temps+16]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1176: ; Arm: 404'13
  push word g350
  push word 35
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [Temps+10]
  push word 33
  push word 3
  mov [Temps+12], sp
  push word 6 ;; scanned
  push word [Temps+12]
  push word 31
  push word 3
  mov [Temps+14], sp
  push word 6 ;; scanned
  push word [Temps+14]
  push word 29
  push word 3
  mov [Temps+16], sp
  push word 6 ;; scanned
  push word [Temps+16]
  push word 27
  push word 3
  mov [Temps+18], sp
  push word 6 ;; scanned
  push word [Temps+18]
  push word 25
  push word 3
  mov [Temps+20], sp
  push word 6 ;; scanned
  push word [Temps+20]
  push word 23
  push word 3
  mov [Temps+22], sp
  push word 6 ;; scanned
  mov dx, [Temps+22]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1177: ; Continuation
  Bare_enter_check(0)
  mov dx, g356
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1178: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L1177
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g38
  mov dx, dx
  jmp [bp]

L1179: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L1178
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1180: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L1179
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1181: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1180
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L1182: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1181
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L1183: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1182
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g355
  jmp [bp]

L1184: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1183
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L1185: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1184
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L1186: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1185
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g354
  jmp [bp]

L1187: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1186
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1188: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1187
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L1189: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1188
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L1190: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1189
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g353
  jmp [bp]

L1191: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1190
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L1192: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1191
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g352
  jmp [bp]

L1193: ; Continuation
  Bare_enter_check(80)
  mov bx, dx
  cmp word [bx], 1
  jz L1117
  mov si, [bx+2]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L1172
  mov di, sp
  push word 14 ;; scanned
  mov ax, si
  cmp word ax, 3
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word di
  push word cx
  push word L1174
  mov cx, sp
  push word 6 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L1175
  mov ax, si
  cmp word ax, 5
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L1176
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L1192
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, g351
  jmp [bp]

L1194: ; Function: (lam,t10)
  Bare_enter_check(18)
  mov bx, dx
  cmp word [bx], 1
  jz L1085
  mov si, [bx+2]
  mov di, [bx+4]
  mov bx, di
  cmp word [bx], 3
  jz L1101
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L1193
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+8]
  mov dx, si
  jmp [bp]

L1195: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov dx, dx
  jmp [bp]

L1196: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L1195
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1197: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L1196
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1198: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1197
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L1199: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1198
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L1200: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1199
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g363
  jmp [bp]

L1201: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1200
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L1202: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1201
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L1203: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1202
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g362
  jmp [bp]

L1204: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1203
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1205: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1204
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L1206: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1205
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L1207: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1206
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g361
  jmp [bp]

L1208: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1207
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L1209: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1208
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g360
  jmp [bp]

L1210: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1209
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L1211: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1210
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1212: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1211
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L1213: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1212
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L1214: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1213
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g359
  jmp [bp]

L1215: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1214
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L1216: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1215
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g358
  jmp [bp]

L1217: ; Arm: 530'12
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1216
  mov cx, sp
  push word 8 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L1218: ; Continuation
  Bare_enter_check(10)
  mov bx, dx
  cmp word [bx], 1
  jz L1217
  mov si, [bx+2]
  mov bx, si
  mov di, [bx+2]
  mov dx, [bp+10]
  mov bp, di
  jmp [bp]

L1219: ; Continuation
  Bare_enter_check(140)
  push word [bp+26]
  push word [bp+24]
  push word cx
  push word L999
  mov cx, sp
  push word 8 ;; scanned
  mov bx, dx
  cmp word [bx], 1
  jz L1000
  mov si, [bx+2]
  mov di, [bx+4]
  push word si
  push word [bp+10]
  push word L1005
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [bp+22]
  push word [bp+18]
  push word [bp+8]
  push word [bp+4]
  push word L1028
  mov [Temps+8], sp
  push word 10 ;; scanned
  push word [Temps+8]
  push word 1
  mov [Temps+10], sp
  push word 4 ;; scanned
  push word [Temps+10]
  push word g283
  push word 1
  mov [Temps+12], sp
  push word 6 ;; scanned
  push word [bp+16]
  push word [bp+14]
  push word [bp+8]
  push word [bp+4]
  push word L1069
  mov [Temps+14], sp
  push word 10 ;; scanned
  push word [Temps+14]
  push word 1
  mov [Temps+16], sp
  push word 4 ;; scanned
  push word [Temps+16]
  push word g292
  push word 1
  mov [Temps+18], sp
  push word 6 ;; scanned
  push word [bp+20]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L1194
  mov [Temps+20], sp
  push word 16 ;; scanned
  push word [Temps+20]
  push word 1
  mov [Temps+22], sp
  push word 4 ;; scanned
  push word [Temps+22]
  push word g311
  push word 1
  mov [Temps+24], sp
  push word 6 ;; scanned
  push word g357
  push word [Temps+24]
  push word 3
  mov [Temps+26], sp
  push word 6 ;; scanned
  push word [Temps+26]
  push word [Temps+18]
  push word 3
  mov [Temps+28], sp
  push word 6 ;; scanned
  push word [Temps+28]
  push word [Temps+12]
  push word 3
  mov [Temps+30], sp
  push word 6 ;; scanned
  push word di
  push word si
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L1218
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [Temps+6]
  mov dx, [Temps+30]
  jmp [bp]

L1220: ; Continuation
  Bare_enter_check(30)
  push word [bp+26]
  push word [bp+24]
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
  push word L1219
  mov cx, sp
  push word 28 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+28]
  jmp [bp]

L1221: ; Continuation
  Bare_enter_check(32)
  push word dx
  push word [bp+26]
  push word [bp+24]
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
  push word L1220
  mov cx, sp
  push word 30 ;; scanned
  mov bp, g7
  mov dx, g280
  jmp [bp]

L1222: ; Continuation
  Bare_enter_check(30)
  push word [bp+26]
  push word [bp+24]
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
  push word L1221
  mov cx, sp
  push word 28 ;; scanned
  mov bp, [bp+28]
  mov dx, dx
  jmp [bp]

L1223: ; Continuation
  Bare_enter_check(32)
  push word dx
  push word [bp+26]
  push word [bp+24]
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
  push word L1222
  mov cx, sp
  push word 30 ;; scanned
  mov dx, [bp+28]
  mov bp, [bp+8]
  jmp [bp]

L1224: ; Continuation
  Bare_enter_check(32)
  push word dx
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1223
  mov cx, sp
  push word 30 ;; scanned
  mov bp, [bp+14]
  mov dx, g279
  jmp [bp]

L1225: ; Continuation
  Bare_enter_check(38)
  push word [bp+6]
  push word L998
  mov si, sp
  push word 4 ;; scanned
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
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
  push word L1224
  mov cx, sp
  push word 30 ;; scanned
  mov bp, si
  mov dx, g278
  jmp [bp]

L1226: ; Continuation
  Bare_enter_check(32)
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
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
  push word L1225
  mov cx, sp
  push word 30 ;; scanned
  mov bp, g38
  mov dx, dx
  jmp [bp]

L1227: ; Continuation
  Bare_enter_check(32)
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
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
  push word L1226
  mov cx, sp
  push word 30 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L1228: ; Continuation
  Bare_enter_check(32)
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
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
  push word L1227
  mov cx, sp
  push word 30 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1229: ; Continuation
  Bare_enter_check(32)
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
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
  push word L1228
  mov cx, sp
  push word 30 ;; scanned
  mov bp, [bp+30]
  mov dx, dx
  jmp [bp]

L1230: ; Continuation
  Bare_enter_check(34)
  push word [bp+32]
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
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
  push word L1229
  mov cx, sp
  push word 32 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+30]
  jmp [bp]

L1231: ; Continuation
  Bare_enter_check(36)
  push word dx
  push word [bp+30]
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
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
  push word L1230
  mov cx, sp
  push word 34 ;; scanned
  mov bp, g7
  mov dx, g273
  jmp [bp]

L1232: ; Continuation
  Bare_enter_check(34)
  push word [bp+30]
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
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
  push word L1231
  mov cx, sp
  push word 32 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L1233: ; Continuation
  Bare_enter_check(34)
  push word dx
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
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
  push word L1232
  mov cx, sp
  push word 32 ;; scanned
  mov bp, [bp+8]
  mov dx, g272
  jmp [bp]

L1234: ; Continuation
  Bare_enter_check(32)
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
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
  push word L1233
  mov cx, sp
  push word 30 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L1235: ; Function: (repl,t2)
  Bare_enter_check(32)
  push word bp
  push word dx
  push word [bp+24]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L1234
  mov cx, sp
  push word 30 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L1236: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov dx, dx
  jmp [bp]

L1237: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L1236
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1238: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L1237
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1239: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1238
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L1240: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1239
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L1241: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1240
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g370
  jmp [bp]

L1242: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1241
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L1243: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1242
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L1244: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1243
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g369
  jmp [bp]

L1245: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1244
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1246: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1245
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L1247: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1246
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L1248: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1247
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g368
  jmp [bp]

L1249: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1248
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L1250: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1249
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g367
  jmp [bp]

L1251: ; Arm: 447'15
  mov si, [bx+2]
  mov di, [bx+4]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L1250
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, g366
  jmp [bp]

L1252: ; Arm: 450'31
  mov dx, g373
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1253: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, [bp+6]
  mov dx, si
  jmp [bp]

L1254: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L1253
  mov cx, sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L1255: ; Continuation
  Bare_enter_check(12)
  mov bx, dx
  cmp word [bx], 3
  jz L1252
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L1254
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+4]
  jmp [bp]

L1256: ; Arm: 7'9
  mov dx, g371
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1257: ; Function: (loop,t1)
  Bare_enter_check(14)
  mov ax, dx
  cmp word ax, 7
  call Bare_make_bool_from_n
  mov si, ax
  push word bp
  push word dx
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L1255
  mov cx, sp
  push word 12 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L1256
  mov dx, g372
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1258: ; Function: (lam,t1)
  Bare_enter_check(10)
  mov bx, dx
  cmp word [bx], 3
  jz L1251
  push word [bp+8]
  push word [bp+6]
  push word L1257
  mov si, sp
  push word 6 ;; scanned
  mov bp, si
  mov dx, 1
  jmp [bp]

L1259: ; Continuation
  Bare_enter_check(0)
  mov bx, [bp+4]
  mov ax, [bp+6]
  mov [bx], ax
  mov si, Bare_unit
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1260: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov dx, dx
  jmp [bp]

L1261: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L1260
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1262: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L1261
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1263: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1262
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L1264: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1263
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L1265: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1264
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g380
  jmp [bp]

L1266: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1265
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L1267: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1266
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L1268: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1267
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g379
  jmp [bp]

L1269: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1268
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1270: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1269
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L1271: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1270
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L1272: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1271
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g378
  jmp [bp]

L1273: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1272
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L1274: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1273
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g377
  jmp [bp]

L1275: ; Arm: 460'15
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L1274
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, g376
  jmp [bp]

L1276: ; Arm: 463'31
  mov dx, g383
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1277: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, [bp+6]
  mov dx, si
  jmp [bp]

L1278: ; Arm: 304'9
  mov dx, g387
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1279: ; Arm: 283'16
  mov dx, g390
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1280: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, [bp+6]
  mov dx, si
  jmp [bp]

L1281: ; Arm: 287'23
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1282: ; Continuation
  Bare_enter_check(10)
  mov ax, dx
  call Bare_put_char
  mov si, Bare_unit
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 129
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov di, dx
  pop word dx ;; restore
  mov ax, di
  cmp word ax, 127
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1280
  mov cx, sp
  push word 8 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L1281
  mov dx, g392
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1283: ; Arm: 285'32
  mov dx, `$`
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1284: ; Arm: 285'64
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1285: ; Continuation
  Bare_enter_check(0)
  mov bx, dx
  cmp word [bx], 3
  jz L1284
  mov dx, `.`
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1286: ; Arm: 279'12
  mov dx, g391
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1287: ; Continuation
  Bare_enter_check(18)
  mov bx, dx
  cmp word [bx], 3
  jz L1279
  mov ax, [bp+4]
  mov bx, [bp+6]
  shr bx, 1
  call Bare_get_bytes
  mov si, ax
  mov ax, si
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov di, ax
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L1282
  mov cx, sp
  push word 8 ;; scanned
  mov bx, di
  cmp word [bx], 3
  jz L1283
  mov ax, si
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  cmp word ax, 65
  call Bare_make_bool_from_n
  mov [Temps+8], ax
  push word si
  push word cx
  push word L1285
  mov cx, sp
  push word 6 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L1286
  mov ax, [Temps+6]
  cmp word ax, 255
  call Bare_make_bool_from_n
  mov [Temps+10], ax
  mov dx, [Temps+10]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1288: ; Arm: 7'9
  mov dx, g388
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1289: ; Function: (loop,t2)
  Bare_enter_check(12)
  mov ax, dx
  cmp word ax, 1025
  call Bare_make_bool_from_n
  mov si, ax
  push word bp
  push word dx
  push word [bp+2]
  push word cx
  push word L1287
  mov cx, sp
  push word 10 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L1288
  mov dx, g389
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1290: ; Continuation
  Bare_enter_check(16)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1277
  mov cx, sp
  push word 8 ;; scanned
  mov bx, dx
  cmp word [bx], 1
  jz L1278
  mov si, [bx+2]
  push word si
  push word L1289
  mov di, sp
  push word 4 ;; scanned
  mov bp, di
  mov dx, 1
  jmp [bp]

L1291: ; Arm: 275'12
  mov dx, g386
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1292: ; Continuation
  Bare_enter_check(16)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1290
  mov cx, sp
  push word 8 ;; scanned
  mov bx, dx
  cmp word [bx], 3
  jz L1291
  mov si, [bp+8]
  push word si
  push word 3
  mov di, sp
  push word 4 ;; scanned
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1293: ; Arm: 7'9
  mov dx, g384
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1294: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1292
  mov cx, sp
  push word 10 ;; scanned
  mov bx, dx
  cmp word [bx], 3
  jz L1293
  mov dx, g385
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1295: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1294
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L1296: ; Continuation
  Bare_enter_check(600)
  mov bx, dx
  cmp word [bx], 3
  jz L1276
  mov ax, 1025
  call Bare_make_bytes
  mov si, ax
  push word si
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L1295
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L1297: ; Arm: 7'9
  mov dx, g381
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1298: ; Function: (loop,t3)
  Bare_enter_check(12)
  mov ax, dx
  cmp word ax, 7
  call Bare_make_bool_from_n
  mov si, ax
  push word bp
  push word dx
  push word [bp+2]
  push word cx
  push word L1296
  mov cx, sp
  push word 10 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L1297
  mov dx, g382
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1299: ; Function: (lam,t4)
  Bare_enter_check(20)
  mov bx, [bp+6]
  mov si, [bx]
  mov bx, [bp+6]
  mov ax, g375
  mov [bx], ax
  mov di, Bare_unit
  push word si
  push word [bp+6]
  push word cx
  push word L1259
  mov cx, sp
  push word 8 ;; scanned
  mov bx, dx
  cmp word [bx], 3
  jz L1275
  push word [bp+8]
  push word L1298
  mov [Temps+6], sp
  push word 4 ;; scanned
  mov bp, [Temps+6]
  mov dx, 1
  jmp [bp]

L1300: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov dx, dx
  jmp [bp]

L1301: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L1300
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1302: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L1301
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1303: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1302
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L1304: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1303
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L1305: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1304
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g398
  jmp [bp]

L1306: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1305
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L1307: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1306
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L1308: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1307
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g397
  jmp [bp]

L1309: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1308
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1310: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1309
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L1311: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1310
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L1312: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1311
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g396
  jmp [bp]

L1313: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1312
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L1314: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1313
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g395
  jmp [bp]

L1315: ; Arm: 492'11
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L1314
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, g394
  jmp [bp]

L1316: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov dx, dx
  jmp [bp]

L1317: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L1316
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1318: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L1317
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1319: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1318
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L1320: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1319
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L1321: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1320
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g403
  jmp [bp]

L1322: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1321
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L1323: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1322
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L1324: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1323
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g402
  jmp [bp]

L1325: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1324
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1326: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1325
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L1327: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1326
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L1328: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1327
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g401
  jmp [bp]

L1329: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1328
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L1330: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1329
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g400
  jmp [bp]

L1331: ; Arm: 495'16
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L1330
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, g399
  jmp [bp]

L1332: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov dx, dx
  jmp [bp]

L1333: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L1332
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1334: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L1333
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1335: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1334
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L1336: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1335
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L1337: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1336
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g408
  jmp [bp]

L1338: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1337
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L1339: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1338
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L1340: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1339
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g407
  jmp [bp]

L1341: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1340
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1342: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1341
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L1343: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1342
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L1344: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1343
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g406
  jmp [bp]

L1345: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1344
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L1346: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1345
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g405
  jmp [bp]

L1347: ; Arm: 498'19
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L1346
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, g404
  jmp [bp]

L1348: ; Arm: 153'22
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov bp, [bp+2]
  mov dx, dx
  jmp [bp]

L1349: ; Arm: 154'28
  mov ax, `\x04`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  push word dx
  push word `\x04`
  push word 3
  mov [Temps+14], sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+14]
  jmp [bp]

L1350: ; Arm: 155'19
  mov bp, bp
  mov dx, dx
  jmp [bp]

L1351: ; Arm: 158'17
  mov bp, bp
  mov dx, dx
  jmp [bp]

L1352: ; Continuation
  Bare_enter_check(0)
  mov ax, `\x08`
  call Bare_put_char
  mov si, Bare_unit
  mov ax, ` `
  call Bare_put_char
  mov di, Bare_unit
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L1353: ; Arm: 160'31
  mov ax, `\x08`
  call Bare_put_char
  mov si, Bare_unit
  mov ax, ` `
  call Bare_put_char
  mov di, Bare_unit
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1354: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1352
  mov cx, sp
  push word 8 ;; scanned
  mov bx, dx
  cmp word [bx], 3
  jz L1353
  mov dx, g412
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1355: ; Arm: 7'9
  mov dx, g410
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1356: ; Arm: 156'21
  mov bx, dx
  cmp word [bx], 1
  jz L1351
  mov ax, [bx+2]
  mov [Temps+14], ax
  mov ax, [bx+4]
  mov [Temps+16], ax
  mov ax, [Temps+14]
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+18], ax
  mov ax, 53
  cmp word ax, [Temps+18]
  call Bare_make_bool_from_n
  mov [Temps+20], ax
  push word [Temps+16]
  push word bp
  push word cx
  push word L1354
  mov cx, sp
  push word 8 ;; scanned
  mov bx, [Temps+20]
  cmp word [bx], 3
  jz L1355
  mov dx, g411
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1357: ; Function: (readloop,t1)
  Bare_enter_check(10)
  call Bare_get_char
  mov si, ax
  mov ax, si
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov di, ax
  mov ax, si
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L1348
  mov ax, si
  cmp word ax, `\x04`
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L1349
  mov ax, 255
  cmp word ax, di
  call Bare_make_bool_from_n
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L1350
  mov ax, di
  cmp word ax, 255
  call Bare_make_bool_from_z
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L1356
  mov ax, si
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+14], ax
  push word dx
  push word si
  push word 3
  mov [Temps+16], sp
  push word 6 ;; scanned
  mov bp, bp
  mov dx, [Temps+16]
  jmp [bp]

L1358: ; Arm: 463'31
  mov dx, g420
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1359: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, [bp+6]
  mov dx, si
  jmp [bp]

L1360: ; Arm: 304'9
  mov dx, g424
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1361: ; Arm: 283'16
  mov dx, g427
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1362: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, [bp+6]
  mov dx, si
  jmp [bp]

L1363: ; Arm: 287'23
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1364: ; Continuation
  Bare_enter_check(10)
  mov ax, dx
  call Bare_put_char
  mov si, Bare_unit
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 129
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov di, dx
  pop word dx ;; restore
  mov ax, di
  cmp word ax, 127
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1362
  mov cx, sp
  push word 8 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L1363
  mov dx, g429
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1365: ; Arm: 285'32
  mov dx, `$`
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1366: ; Arm: 285'64
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1367: ; Continuation
  Bare_enter_check(0)
  mov bx, dx
  cmp word [bx], 3
  jz L1366
  mov dx, `.`
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1368: ; Arm: 279'12
  mov dx, g428
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1369: ; Continuation
  Bare_enter_check(18)
  mov bx, dx
  cmp word [bx], 3
  jz L1361
  mov ax, [bp+4]
  mov bx, [bp+6]
  shr bx, 1
  call Bare_get_bytes
  mov si, ax
  mov ax, si
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov di, ax
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L1364
  mov cx, sp
  push word 8 ;; scanned
  mov bx, di
  cmp word [bx], 3
  jz L1365
  mov ax, si
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  cmp word ax, 65
  call Bare_make_bool_from_n
  mov [Temps+8], ax
  push word si
  push word cx
  push word L1367
  mov cx, sp
  push word 6 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L1368
  mov ax, [Temps+6]
  cmp word ax, 255
  call Bare_make_bool_from_n
  mov [Temps+10], ax
  mov dx, [Temps+10]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1370: ; Arm: 7'9
  mov dx, g425
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1371: ; Function: (loop,t2)
  Bare_enter_check(12)
  mov ax, dx
  cmp word ax, 1025
  call Bare_make_bool_from_n
  mov si, ax
  push word bp
  push word dx
  push word [bp+2]
  push word cx
  push word L1369
  mov cx, sp
  push word 10 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L1370
  mov dx, g426
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1372: ; Continuation
  Bare_enter_check(16)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1359
  mov cx, sp
  push word 8 ;; scanned
  mov bx, dx
  cmp word [bx], 1
  jz L1360
  mov si, [bx+2]
  push word si
  push word L1371
  mov di, sp
  push word 4 ;; scanned
  mov bp, di
  mov dx, 1
  jmp [bp]

L1373: ; Arm: 275'12
  mov dx, g423
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1374: ; Continuation
  Bare_enter_check(16)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1372
  mov cx, sp
  push word 8 ;; scanned
  mov bx, dx
  cmp word [bx], 3
  jz L1373
  mov si, [bp+8]
  push word si
  push word 3
  mov di, sp
  push word 4 ;; scanned
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1375: ; Arm: 7'9
  mov dx, g421
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1376: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1374
  mov cx, sp
  push word 10 ;; scanned
  mov bx, dx
  cmp word [bx], 3
  jz L1375
  mov dx, g422
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1377: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1376
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L1378: ; Continuation
  Bare_enter_check(600)
  mov bx, dx
  cmp word [bx], 3
  jz L1358
  mov ax, 1025
  call Bare_make_bytes
  mov si, ax
  push word si
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L1377
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L1379: ; Arm: 7'9
  mov dx, g418
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1380: ; Function: (loop,t3)
  Bare_enter_check(12)
  mov ax, dx
  cmp word ax, 7
  call Bare_make_bool_from_n
  mov si, ax
  push word bp
  push word dx
  push word [bp+2]
  push word cx
  push word L1378
  mov cx, sp
  push word 10 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L1379
  mov dx, g419
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1381: ; Arm: 508'25
  mov dx, g430
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1382: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L1383: ; Continuation
  Bare_enter_check(8)
  mov ax, [bp+6]
  shr ax, 1
  mov bx, 129
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov si, dx
  pop word dx ;; restore
  push word si
  push word cx
  push word L1382
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1384: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L1383
  mov cx, sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L1385: ; Continuation
  Bare_enter_check(12)
  mov bx, [bp+4]
  mov ax, [bp+16]
  mov [bx], ax
  mov si, Bare_unit
  mov bx, [bp+12]
  cmp word [bx], 3
  jz L1381
  mov bx, [bp+14]
  mov di, [bx]
  mov ax, [bp+10]
  shr ax, 1
  mov bx, di
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  shr ax, 1
  mov bx, 129
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov [Temps+8], ax
  push word [Temps+6]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L1384
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g3
  mov dx, [Temps+8]
  jmp [bp]

L1386: ; Continuation
  Bare_enter_check(26)
  mov bx, [bp+4]
  mov si, [bx]
  mov bx, [bp+4]
  mov ax, g417
  mov [bx], ax
  mov di, Bare_unit
  push word [bp+6]
  push word L1380
  mov [Temps+6], sp
  push word 4 ;; scanned
  push word si
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L1385
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [Temps+6]
  mov dx, 1
  jmp [bp]

L1387: ; Continuation
  Bare_enter_check(30)
  push word [bp+18]
  push word 1
  push word [bp+16]
  push word 1
  mov si, sp
  push word 8 ;; scanned
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1386
  mov cx, sp
  push word 18 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L1388: ; Continuation
  Bare_enter_check(30)
  push word [bp+14]
  push word [bp+10]
  push word 1
  mov si, sp
  push word 6 ;; scanned
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1387
  mov cx, sp
  push word 20 ;; scanned
  mov bp, [bp+8]
  mov dx, si
  jmp [bp]

L1389: ; Arm: 505'33
  mov ax, [bp+16]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1390: ; Continuation
  Bare_enter_check(22)
  push word dx
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1388
  mov cx, sp
  push word 20 ;; scanned
  mov bx, [bp+18]
  cmp word [bx], 3
  jz L1389
  mov ax, [bp+16]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1391: ; Arm: 504'36
  mov dx, [bp+20]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1392: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1393: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L1392
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L1394: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L1393
  mov cx, sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+6]
  jmp [bp]

L1395: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1394
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, g416
  jmp [bp]

L1396: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1395
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L1397: ; Continuation
  Bare_enter_check(10)
  push word dx
  push word [bp+4]
  push word cx
  push word L1396
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, g415
  jmp [bp]

L1398: ; Continuation
  Bare_enter_check(32)
  push word dx
  push word [bp+22]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word cx
  push word L1390
  mov cx, sp
  push word 20 ;; scanned
  mov bx, dx
  cmp word [bx], 3
  jz L1391
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1397
  mov cx, sp
  push word 8 ;; scanned
  mov dx, [bp+20]
  mov bp, [bp+6]
  jmp [bp]

L1399: ; Arm: 503'37
  mov dx, g414
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1400: ; Continuation
  Bare_enter_check(26)
  mov bx, dx
  mov si, [bx]
  mov ax, si
  cmp word ax, 3
  call Bare_make_bool_from_n
  mov di, ax
  push word si
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1398
  mov cx, sp
  push word 24 ;; scanned
  mov bx, di
  cmp word [bx], 3
  jz L1399
  mov ax, si
  shr ax, 1
  mov bx, 3
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, dx
  mov bx, [Temps+6]
  shr bx, 1
  call Bare_get_bytes
  mov [Temps+8], ax
  mov ax, [Temps+8]
  cmp word ax, `\x04`
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov dx, [Temps+10]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1401: ; Function: (lam,t1)
  Bare_enter_check(28)
  push word [bp+4]
  push word L1357
  mov si, sp
  push word 4 ;; scanned
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L1400
  mov cx, sp
  push word 20 ;; scanned
  mov bp, si
  mov dx, g413
  jmp [bp]

L1402: ; Function: (loop,t2)
  Bare_enter_check(20)
  push word bp
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L1401
  mov si, sp
  push word 18 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1403: ; Continuation
  Bare_enter_check(0)
  mov bp, dx
  mov dx, 1
  jmp [bp]

L1404: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L1403
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1405: ; Arm: 403'11
  push word g431
  push word 19
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [Temps+8]
  push word 17
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [Temps+10]
  push word 15
  push word 3
  mov [Temps+12], sp
  push word 6 ;; scanned
  push word [Temps+12]
  push word 13
  push word 3
  mov [Temps+14], sp
  push word 6 ;; scanned
  push word [Temps+14]
  push word 11
  push word 3
  mov [Temps+16], sp
  push word 6 ;; scanned
  mov dx, [Temps+16]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1406: ; Arm: 404'13
  push word g432
  push word 35
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [Temps+10]
  push word 33
  push word 3
  mov [Temps+12], sp
  push word 6 ;; scanned
  push word [Temps+12]
  push word 31
  push word 3
  mov [Temps+14], sp
  push word 6 ;; scanned
  push word [Temps+14]
  push word 29
  push word 3
  mov [Temps+16], sp
  push word 6 ;; scanned
  push word [Temps+16]
  push word 27
  push word 3
  mov [Temps+18], sp
  push word 6 ;; scanned
  push word [Temps+18]
  push word 25
  push word 3
  mov [Temps+20], sp
  push word 6 ;; scanned
  push word [Temps+20]
  push word 23
  push word 3
  mov [Temps+22], sp
  push word 6 ;; scanned
  mov dx, [Temps+22]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1407: ; Continuation
  Bare_enter_check(0)
  mov dx, g438
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1408: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L1407
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g38
  mov dx, dx
  jmp [bp]

L1409: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L1408
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1410: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L1409
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1411: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1410
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L1412: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1411
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L1413: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1412
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g437
  jmp [bp]

L1414: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1413
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L1415: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1414
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L1416: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1415
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g436
  jmp [bp]

L1417: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1416
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1418: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1417
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L1419: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1418
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L1420: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1419
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, g435
  jmp [bp]

L1421: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1420
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L1422: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1421
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g434
  jmp [bp]

L1423: ; Continuation
  Bare_enter_check(80)
  mov bx, dx
  cmp word [bx], 1
  jz L1347
  mov si, [bx+2]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L1402
  mov di, sp
  push word 14 ;; scanned
  mov ax, si
  cmp word ax, 3
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word di
  push word cx
  push word L1404
  mov cx, sp
  push word 6 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L1405
  mov ax, si
  cmp word ax, 5
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L1406
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L1422
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, g433
  jmp [bp]

L1424: ; Function: (lam,t7)
  Bare_enter_check(18)
  mov bx, dx
  cmp word [bx], 1
  jz L1315
  mov si, [bx+2]
  mov di, [bx+4]
  mov bx, di
  cmp word [bx], 3
  jz L1331
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L1423
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+8]
  mov dx, si
  jmp [bp]

L1425: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov dx, 3
  jmp [bp]

L1426: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L1425
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g38
  mov dx, dx
  jmp [bp]

L1427: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L1426
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1428: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L1427
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1429: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1428
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L1430: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1429
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+10]
  jmp [bp]

L1431: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1430
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g7
  mov dx, g444
  jmp [bp]

L1432: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1431
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L1433: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1432
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L1434: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1433
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, g443
  jmp [bp]

L1435: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1434
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1436: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1435
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L1437: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1436
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+10]
  jmp [bp]

L1438: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1437
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g7
  mov dx, g442
  jmp [bp]

L1439: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1438
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L1440: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1439
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, g441
  jmp [bp]

L1441: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1440
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L1442: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1441
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+10]
  jmp [bp]

L1443: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1442
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+8]
  mov dx, g440
  jmp [bp]

L1444: ; Continuation
  Bare_enter_check(122)
  push word [bp+22]
  push word [bp+18]
  push word [bp+8]
  push word [bp+4]
  push word L1258
  mov si, sp
  push word 10 ;; scanned
  push word si
  push word 1
  mov di, sp
  push word 4 ;; scanned
  push word di
  push word g365
  push word 1
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [bp+16]
  push word [bp+14]
  push word [bp+8]
  push word [bp+4]
  push word L1299
  mov [Temps+8], sp
  push word 10 ;; scanned
  push word [Temps+8]
  push word 1
  mov [Temps+10], sp
  push word 4 ;; scanned
  push word [Temps+10]
  push word g374
  push word 1
  mov [Temps+12], sp
  push word 6 ;; scanned
  push word [bp+20]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L1424
  mov [Temps+14], sp
  push word 16 ;; scanned
  push word [Temps+14]
  push word 1
  mov [Temps+16], sp
  push word 4 ;; scanned
  push word [Temps+16]
  push word g393
  push word 1
  mov [Temps+18], sp
  push word 6 ;; scanned
  push word g439
  push word [Temps+18]
  push word 3
  mov [Temps+20], sp
  push word 6 ;; scanned
  push word [Temps+20]
  push word [Temps+12]
  push word 3
  mov [Temps+22], sp
  push word 6 ;; scanned
  push word [Temps+22]
  push word [Temps+6]
  push word 3
  mov [Temps+24], sp
  push word 6 ;; scanned
  push word [bp+24]
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L1443
  mov cx, sp
  push word 12 ;; scanned
  mov bp, dx
  mov dx, [Temps+24]
  jmp [bp]

L1445: ; Continuation
  Bare_enter_check(56)
  mov si, [bp+28]
  push word si
  push word [bp+26]
  push word [bp+24]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L1235
  mov di, sp
  push word 26 ;; scanned
  push word di
  push word si
  push word [bp+26]
  push word [bp+24]
  push word [bp+22]
  push word [bp+20]
  push word [bp+16]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1444
  mov cx, sp
  push word 26 ;; scanned
  mov bp, g267
  mov dx, g364
  jmp [bp]

L1446: ; Continuation
  Bare_enter_check(616)
  push word dx
  push word [bp+24]
  push word [bp+22]
  push word [bp+14]
  push word [bp+8]
  push word [bp+4]
  push word L984
  mov si, sp
  push word 14 ;; scanned
  mov ax, 1025
  call Bare_make_bytes
  mov di, ax
  push word di
  push word L988
  mov [Temps+6], sp
  push word 4 ;; scanned
  push word di
  push word si
  push word [bp+28]
  push word [bp+26]
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
  push word L1445
  mov cx, sp
  push word 30 ;; scanned
  mov bp, [Temps+6]
  mov dx, 1
  jmp [bp]

L1447: ; Continuation
  Bare_enter_check(48)
  push word dx
  push word [bp+32]
  push word [bp+24]
  push word [bp+14]
  push word [bp+8]
  push word [bp+4]
  push word L769
  mov si, sp
  push word 14 ;; scanned
  push word [bp+30]
  push word [bp+28]
  push word [bp+26]
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
  push word L1446
  mov cx, sp
  push word 30 ;; scanned
  mov bp, g1
  mov dx, si
  jmp [bp]

L1448: ; Continuation
  Bare_enter_check(50)
  push word [bp+32]
  push word [bp+22]
  push word [bp+14]
  push word [bp+8]
  push word [bp+4]
  push word L730
  mov si, sp
  push word 12 ;; scanned
  push word dx
  push word [bp+30]
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
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
  push word L1447
  mov cx, sp
  push word 34 ;; scanned
  mov bp, g1
  mov dx, si
  jmp [bp]

L1449: ; Continuation
  Bare_enter_check(52)
  push word [bp+28]
  push word [bp+26]
  push word [bp+22]
  push word [bp+14]
  push word [bp+8]
  push word [bp+4]
  push word L666
  mov si, sp
  push word 14 ;; scanned
  push word dx
  push word [bp+30]
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
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
  push word L1448
  mov cx, sp
  push word 34 ;; scanned
  mov bp, g1
  mov dx, si
  jmp [bp]

L1450: ; Continuation
  Bare_enter_check(50)
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
  push word [bp+14]
  push word [bp+8]
  push word [bp+4]
  push word L596
  mov si, sp
  push word 14 ;; scanned
  push word dx
  push word [bp+32]
  push word [bp+30]
  push word [bp+28]
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
  push word L1449
  mov cx, sp
  push word 32 ;; scanned
  mov bp, g1
  mov dx, si
  jmp [bp]

L1451: ; Continuation
  Bare_enter_check(48)
  push word [bp+26]
  push word [bp+14]
  push word [bp+8]
  push word [bp+4]
  push word L557
  mov si, sp
  push word 10 ;; scanned
  push word dx
  push word [bp+30]
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
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
  push word L1450
  mov cx, sp
  push word 34 ;; scanned
  mov bp, g1
  mov dx, si
  jmp [bp]

L1452: ; Continuation
  Bare_enter_check(46)
  push word [bp+24]
  push word [bp+14]
  push word [bp+8]
  push word [bp+4]
  push word L527
  mov si, sp
  push word 10 ;; scanned
  push word dx
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
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
  push word L1451
  mov cx, sp
  push word 32 ;; scanned
  mov bp, g1
  mov dx, si
  jmp [bp]

L1453: ; Continuation
  Bare_enter_check(44)
  push word [bp+22]
  push word [bp+14]
  push word [bp+8]
  push word [bp+4]
  push word L495
  mov si, sp
  push word 10 ;; scanned
  push word dx
  push word [bp+26]
  push word [bp+24]
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
  push word L1452
  mov cx, sp
  push word 30 ;; scanned
  mov bp, g1
  mov dx, si
  jmp [bp]

L1454: ; Continuation
  Bare_enter_check(42)
  push word [bp+22]
  push word [bp+14]
  push word [bp+8]
  push word [bp+4]
  push word L448
  mov si, sp
  push word 10 ;; scanned
  push word dx
  push word [bp+24]
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
  push word L1453
  mov cx, sp
  push word 28 ;; scanned
  mov bp, g1
  mov dx, si
  jmp [bp]

L1455: ; Continuation
  Bare_enter_check(40)
  push word [bp+22]
  push word [bp+14]
  push word [bp+8]
  push word [bp+4]
  push word L158
  mov si, sp
  push word 10 ;; scanned
  push word dx
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
  push word L1454
  mov cx, sp
  push word 26 ;; scanned
  mov bp, g1
  mov dx, si
  jmp [bp]

L1456: ; Continuation
  Bare_enter_check(38)
  push word dx
  push word [bp+14]
  push word [bp+8]
  push word [bp+4]
  push word L147
  mov si, sp
  push word 10 ;; scanned
  push word dx
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
  push word L1455
  mov cx, sp
  push word 24 ;; scanned
  mov bp, g1
  mov dx, si
  jmp [bp]

L1457: ; Continuation
  Bare_enter_check(44)
  push word [bp+6]
  push word L119
  mov si, sp
  push word 4 ;; scanned
  push word g41
  mov di, sp
  push word 2 ;; scanned
  push word di
  push word [bp+8]
  push word [bp+4]
  push word L136
  mov [Temps+6], sp
  push word 8 ;; scanned
  push word di
  push word si
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1456
  mov cx, sp
  push word 22 ;; scanned
  mov bp, g1
  mov dx, [Temps+6]
  jmp [bp]

L1458: ; Continuation
  Bare_enter_check(24)
  push word [bp+8]
  push word L102
  mov si, sp
  push word 4 ;; scanned
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1457
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g1
  mov dx, si
  jmp [bp]

L1459: ; Continuation
  Bare_enter_check(22)
  push word [bp+4]
  push word L99
  mov si, sp
  push word 4 ;; scanned
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1458
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g1
  mov dx, si
  jmp [bp]

L1460: ; Continuation
  Bare_enter_check(22)
  push word [bp+8]
  push word [bp+4]
  push word L92
  mov si, sp
  push word 6 ;; scanned
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1459
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g1
  mov dx, si
  jmp [bp]

L1461: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1460
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g1
  mov dx, g21
  jmp [bp]

L1462: ; Continuation
  Bare_enter_check(10)
  push word dx
  push word [bp+4]
  push word cx
  push word L1461
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g1
  mov dx, g13
  jmp [bp]

L1463: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word cx
  push word L1462
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g1
  mov dx, g11
  jmp [bp]

L1464: ; Start
  Bare_enter_check(6)
  push word cx
  push word L1463
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g1
  mov dx, g9
  jmp [bp]

g1:
  dw L2
g2:
  dw L5
g3:
  dw L12
g4:
  dw 1
g5:
  dw 3
g6:
  dw 1
g7:
  dw L16
g8:
  dw 1
g9:
  dw L24
g10:
  dw 1
g11:
  dw L32
g12:
  dw 1
g13:
  dw L38
g14:
  dw 1
g15:
  dw 3
g16:
  dw 1
g17:
  dw 3
g18:
  dw 1
g19:
  dw 3
g20:
  dw 1
g21:
  dw L48
g22:
  dw 1
g23:
  dw 1
g24:
  dw 1
g25:
  dw 1
  db ``
g26:
  dw L52
g27:
  dw 1
g28:
  dw 1
g29:
  dw 1
g30:
  dw L64
g31:
  dw 1
g32:
  dw 3
g33:
  dw 1
g34:
  dw 3
g35:
  dw 1
g36:
  dw 1
g37:
  dw 1
g38:
  dw L66
g39:
  dw 1
g40:
  dw 1
g41:
  dw 1
g42:
  dw 3
  db `\n`
g43:
  dw 1
g44:
  dw 15
  db `trace: `
g45:
  dw 1
g46:
  dw 1
g47:
  dw 39
  db `(SLOW) load_sector `
g48:
  dw 1
g49:
  dw 41
  db `(SLOW) store_sector `
g50:
  dw 1
g51:
  dw 1
g52:
  dw 3
g53:
  dw 21
  db `, #source=`
g54:
  dw 1
g55:
  dw 1
g56:
  dw 13
  db `, len=`
g57:
  dw 1
g58:
  dw 1
g59:
  dw 19
  db `, offset=`
g60:
  dw 1
g61:
  dw 1
g62:
  dw 51
  db `set_slice_bytes: #target=`
g63:
  dw 1
g64:
  dw 31
  db `set_slice_bytes`
g65:
  dw 3
  db `\n`
g66:
  dw 1
g67:
  dw 15
  db `Error: `
g68:
  dw 1
g69:
  dw 21
  db `, #source=`
g70:
  dw 1
g71:
  dw 1
g72:
  dw 13
  db `, len=`
g73:
  dw 1
g74:
  dw 1
g75:
  dw 19
  db `, offset=`
g76:
  dw 1
g77:
  dw 1
g78:
  dw 51
  db `set_slice_bytes: #target=`
g79:
  dw 1
g80:
  dw 31
  db `set_slice_bytes`
g81:
  dw 3
  db `\n`
g82:
  dw 1
g83:
  dw 15
  db `Error: `
g84:
  dw 1
g85:
  dw 21
  db `, #source=`
g86:
  dw 1
g87:
  dw 1
g88:
  dw 13
  db `, len=`
g89:
  dw 1
g90:
  dw 1
g91:
  dw 19
  db `, offset=`
g92:
  dw 1
g93:
  dw 1
g94:
  dw 51
  db `set_slice_bytes: #target=`
g95:
  dw 1
g96:
  dw 31
  db `set_slice_bytes`
g97:
  dw 3
  db `\n`
g98:
  dw 1
g99:
  dw 15
  db `Error: `
g100:
  dw 1
g101:
  dw 21
  db `, #source=`
g102:
  dw 1
g103:
  dw 1
g104:
  dw 13
  db `, len=`
g105:
  dw 1
g106:
  dw 1
g107:
  dw 19
  db `, offset=`
g108:
  dw 1
g109:
  dw 1
g110:
  dw 51
  db `set_slice_bytes: #target=`
g111:
  dw 1
g112:
  dw 31
  db `set_slice_bytes`
g113:
  dw 3
  db `\n`
g114:
  dw 1
g115:
  dw 15
  db `Error: `
g116:
  dw 1
g117:
  dw 1
g118:
  dw 3
g119:
  dw 1
g120:
  dw 13
  db `, len=`
g121:
  dw 1
g122:
  dw 1
g123:
  dw 19
  db `, offset=`
g124:
  dw 1
g125:
  dw 1
g126:
  dw 51
  db `get_slice_bytes: #source=`
g127:
  dw 1
g128:
  dw 1
g129:
  dw 3
g130:
  dw 1
g131:
  dw 3
g132:
  dw 1
g133:
  dw 3
g134:
  dw 25
  db `load_sector `
g135:
  dw 1
g136:
  dw 3
  db `\n`
g137:
  dw 1
g138:
  dw 15
  db `Error: `
g139:
  dw 1
g140:
  dw 1
g141:
  dw 3
g142:
  dw 3
g143:
  dw 1
g144:
  dw 3
g145:
  dw 27
  db `store_sector `
g146:
  dw 1
g147:
  dw 3
  db `\n`
g148:
  dw 1
g149:
  dw 15
  db `Error: `
g150:
  dw 1
g151:
  dw 3
g152:
  dw 1
g153:
  dw 3
g154:
  dw 29
  db `update_sector `
g155:
  dw 1
g156:
  dw 3
  db `\n`
g157:
  dw 1
g158:
  dw 15
  db `Error: `
g159:
  dw 1
g160:
  dw 1
g161:
  dw 3
g162:
  dw 1
g163:
  dw 3
g164:
  dw 23
  db `read_block `
g165:
  dw 1
g166:
  dw 3
  db `\n`
g167:
  dw 1
g168:
  dw 15
  db `Error: `
g169:
  dw 1
g170:
  dw 1
g171:
  dw 3
  db `]`
g172:
  dw 1
g173:
  dw 3
  db `[`
g174:
  dw 1
g175:
  dw 1
g176:
  dw 23
  db `read_block `
g177:
  dw 1
g178:
  dw 1
g179:
  dw 3
g180:
  dw 1
g181:
  dw 1
g182:
  dw 3
g183:
  dw 1
g184:
  dw 3
g185:
  dw 25
  db `store_block `
g186:
  dw 1
g187:
  dw 3
  db `\n`
g188:
  dw 1
g189:
  dw 15
  db `Error: `
g190:
  dw 1
g191:
  dw 3
  db `]`
g192:
  dw 1
g193:
  dw 3
  db `[`
g194:
  dw 1
g195:
  dw 1
g196:
  dw 25
  db `store_block `
g197:
  dw 1
g198:
  dw 3
g199:
  dw 1
g200:
  dw 3
g201:
  dw 27
  db `update_block `
g202:
  dw 1
g203:
  dw 3
  db `\n`
g204:
  dw 1
g205:
  dw 15
  db `Error: `
g206:
  dw 1
g207:
  dw 1
g208:
  dw 1
g209:
  dw 3
  db `]`
g210:
  dw 1
g211:
  dw 19
  db `, offset=`
g212:
  dw 1
g213:
  dw 1
g214:
  dw 33
  db `[target:#blocks=`
g215:
  dw 1
g216:
  dw 3
  db `]`
g217:
  dw 1
g218:
  dw 13
  db `, len=`
g219:
  dw 1
g220:
  dw 1
g221:
  dw 19
  db `, offset=`
g222:
  dw 1
g223:
  dw 1
g224:
  dw 27
  db `[source:#str=`
g225:
  dw 1
g226:
  dw 9
  db ` <- `
g227:
  dw 1
g228:
  dw 1
g229:
  dw 29
  db `write_blocks: `
g230:
  dw 1
g231:
  dw 1
g232:
  dw 3
g233:
  dw 43
  db `write_blocks:toff>=64`
g234:
  dw 3
  db `\n`
g235:
  dw 1
g236:
  dw 15
  db `Error: `
g237:
  dw 1
g238:
  dw 37
  db `write_blocks:len<0`
g239:
  dw 3
  db `\n`
g240:
  dw 1
g241:
  dw 15
  db `Error: `
g242:
  dw 1
g243:
  dw 1
g244:
  dw 3
g245:
  dw 1
g246:
  dw 63
  db `write_blocks: not enough blocks`
g247:
  dw 3
  db `\n`
g248:
  dw 1
g249:
  dw 15
  db `Error: `
g250:
  dw 1
g251:
  dw 1
g252:
  dw 27
  db `assert failed`
g253:
  dw 3
  db `\n`
g254:
  dw 1
g255:
  dw 15
  db `Error: `
g256:
  dw 1
g257:
  dw 25
  db `trunc_source`
g258:
  dw 3
  db `\n`
g259:
  dw 1
g260:
  dw 15
  db `Error: `
g261:
  dw 1
g262:
  dw 23
  db `seek_source`
g263:
  dw 3
  db `\n`
g264:
  dw 1
g265:
  dw 15
  db `Error: `
g266:
  dw 1
g267:
  dw L71
g268:
  dw 1
g269:
  dw 1
g270:
  dw 3
g271:
  dw 1
g272:
  dw 5
  db `> `
g273:
  dw 1
g274:
  dw 1
g275:
  dw 1
g276:
  dw 3
g277:
  dw 1
g278:
  dw 1
g279:
  dw 1
g280:
  dw 1
g281:
  dw 1
g282:
  dw 1
g283:
  dw 9
  db `wipe`
g284:
  dw 51
  db `wipe_everything: bad args`
g285:
  dw 3
  db `\n`
g286:
  dw 1
g287:
  dw 15
  db `Error: `
g288:
  dw 1
g289:
  dw 1
g290:
  dw 3
g291:
  dw 1
g292:
  dw 9
  db `dump`
g293:
  dw 1
g294:
  dw 51
  db `dump_everything: bad args`
g295:
  dw 3
  db `\n`
g296:
  dw 1
g297:
  dw 15
  db `Error: `
g298:
  dw 1
g299:
  dw 1
g300:
  dw 3
g301:
  dw 1
g302:
  dw 1
g303:
  dw 3
g304:
  dw 1
g305:
  dw 1
g306:
  dw 1
g307:
  dw 3
g308:
  dw 1
g309:
  dw 1
g310:
  dw 1
g311:
  dw 13
  db `create`
g312:
  dw 45
  db `create_inode: bad args`
g313:
  dw 3
  db `\n`
g314:
  dw 1
g315:
  dw 15
  db `Error: `
g316:
  dw 1
g317:
  dw 45
  db `create_inode: bad args`
g318:
  dw 3
  db `\n`
g319:
  dw 1
g320:
  dw 15
  db `Error: `
g321:
  dw 1
g322:
  dw 45
  db `create_inode: bad args`
g323:
  dw 3
  db `\n`
g324:
  dw 1
g325:
  dw 15
  db `Error: `
g326:
  dw 1
g327:
  dw 1
g328:
  dw 1
g329:
  dw 3
g330:
  dw 1
g331:
  dw 1
g332:
  dw 1
g333:
  dw 3
  db `\n`
g334:
  dw 1
g335:
  dw 1
g336:
  dw 1
g337:
  dw 3
g338:
  dw 1
g339:
  dw 1
g340:
  dw 3
g341:
  dw 1
g342:
  dw 1
g343:
  dw 1
g344:
  dw 3
g345:
  dw 1
g346:
  dw 1
g347:
  dw 1
g348:
  dw 1
g349:
  dw 1
g350:
  dw 1
g351:
  dw 45
  db `block_indexes_of_inode`
g352:
  dw 3
  db `\n`
g353:
  dw 1
g354:
  dw 15
  db `Error: `
g355:
  dw 1
g356:
  dw 1
g357:
  dw 1
g358:
  dw 41
  db ` : command not found`
g359:
  dw 1
g360:
  dw 3
  db `\n`
g361:
  dw 1
g362:
  dw 15
  db `Error: `
g363:
  dw 1
g364:
  dw 1
g365:
  dw 9
  db `wipe`
g366:
  dw 51
  db `wipe_everything: bad args`
g367:
  dw 3
  db `\n`
g368:
  dw 1
g369:
  dw 15
  db `Error: `
g370:
  dw 1
g371:
  dw 1
g372:
  dw 3
g373:
  dw 1
g374:
  dw 9
  db `dump`
g375:
  dw 1
g376:
  dw 51
  db `dump_everything: bad args`
g377:
  dw 3
  db `\n`
g378:
  dw 1
g379:
  dw 15
  db `Error: `
g380:
  dw 1
g381:
  dw 1
g382:
  dw 3
g383:
  dw 1
g384:
  dw 1
g385:
  dw 3
g386:
  dw 1
g387:
  dw 1
g388:
  dw 1
g389:
  dw 3
g390:
  dw 1
g391:
  dw 1
g392:
  dw 1
g393:
  dw 13
  db `create`
g394:
  dw 45
  db `create_inode: bad args`
g395:
  dw 3
  db `\n`
g396:
  dw 1
g397:
  dw 15
  db `Error: `
g398:
  dw 1
g399:
  dw 45
  db `create_inode: bad args`
g400:
  dw 3
  db `\n`
g401:
  dw 1
g402:
  dw 15
  db `Error: `
g403:
  dw 1
g404:
  dw 45
  db `create_inode: bad args`
g405:
  dw 3
  db `\n`
g406:
  dw 1
g407:
  dw 15
  db `Error: `
g408:
  dw 1
g409:
  dw 1
g410:
  dw 1
g411:
  dw 3
g412:
  dw 1
g413:
  dw 1
g414:
  dw 1
g415:
  dw 3
  db `\n`
g416:
  dw 1
g417:
  dw 1
g418:
  dw 1
g419:
  dw 3
g420:
  dw 1
g421:
  dw 1
g422:
  dw 3
g423:
  dw 1
g424:
  dw 1
g425:
  dw 1
g426:
  dw 3
g427:
  dw 1
g428:
  dw 1
g429:
  dw 1
g430:
  dw 1
g431:
  dw 1
g432:
  dw 1
g433:
  dw 45
  db `block_indexes_of_inode`
g434:
  dw 3
  db `\n`
g435:
  dw 1
g436:
  dw 15
  db `Error: `
g437:
  dw 1
g438:
  dw 1
g439:
  dw 1
g440:
  dw 3
  db ` `
g441:
  dw 5
  db `]\n`
g442:
  dw 1
g443:
  dw 67
  db `Filesystem test shell [commands: `
g444:
  dw 1

bare_start: jmp L1464
