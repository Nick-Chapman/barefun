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

L3: ; Arm: 22'7
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
  mov si, sp
  push word 6 ;; scanned
  mov dx, si
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
  mov si, [bx+2]
  mov di, [bx+4]
  push word di
  push word [bp+2]
  push word cx
  push word L9
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+2]
  mov dx, si
  jmp [bp]

L11: ; Function: (map,g3)
  Bare_enter_check(6)
  push word dx
  push word L10
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
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
  mov si, [bx+2]
  mov di, [bx+4]
  push word di
  push word [bp+2]
  push word cx
  push word L14
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+2]
  mov dx, si
  jmp [bp]

L16: ; Function: (iter,g5)
  Bare_enter_check(6)
  push word dx
  push word L15
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
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
  mov si, [bx+2]
  mov di, [bx+4]
  push word di
  push word si
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
  mov si, sp
  push word 6 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L24: ; Function: (fold_left,g7)
  Bare_enter_check(6)
  push word dx
  push word L23
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
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
  mov si, [bx+2]
  mov di, [bx+4]
  push word [bp+2]
  push word si
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word di
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
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
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
  mov si, sp
  push word 8 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L33: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov dx, si
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
  Bare_enter_check(100)
  mov ax, dx
  call Bare_make_bytes
  mov si, ax
  push word si
  push word L32
  mov di, sp
  push word 4 ;; scanned
  push word si
  push word [bp+4]
  push word cx
  push word L34
  mov cx, sp
  push word 8 ;; scanned
  mov bp, di
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
  mov si, sp
  push word 8 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L41: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov dx, si
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
  Bare_enter_check(100)
  mov ax, dx
  call Bare_make_bytes
  mov si, ax
  push word si
  push word L40
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
  push word L42
  mov cx, sp
  push word 8 ;; scanned
  mov bp, di
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

L47: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L45
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
  mov si, sp
  push word 8 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L49: ; Continuation
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

L50: ; Function: (lam,g14)
  Bare_enter_check(14)
  push word dx
  push word L48
  mov si, sp
  push word 4 ;; scanned
  mov bx, dx
  mov di, [bx]
  push word di
  push word cx
  push word L49
  mov cx, sp
  push word 6 ;; scanned
  mov bp, si
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
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L52
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

L58: ; Arm: 8'9
  mov dx, g15
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L59: ; Function: (lam,t1)
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
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
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
  mov ax, si
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov dx, [Temps+10]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L64: ; Arm: 106'22
  mov ax, si
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov dx, [Temps+12]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L65: ; Arm: 107'16
  mov ax, si
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
  mov si, [bx+2]
  mov di, [bx+4]
  mov ax, si
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  cmp word ax, 17
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  push word di
  push word cx
  push word L62
  mov cx, sp
  push word 6 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L63
  mov ax, si
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
  shr ax, 1
  mov bx, [Temps+6]
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+16], ax
  mov ax, [Temps+16]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+18], ax
  mov ax, [Temps+18]
  shr ax, 1
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

L67: ; Arm: 121'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L68: ; Continuation
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

L69: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L67
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
  push word L68
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g30
  mov dx, [Temps+10]
  jmp [bp]

L70: ; Function: (loop,g30)
  Bare_enter_check(6)
  push word dx
  push word L69
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L71: ; Arm: 121'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L72: ; Continuation
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

L73: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L71
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
  push word L72
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g33
  mov dx, [Temps+10]
  jmp [bp]

L74: ; Function: (loop,g33)
  Bare_enter_check(6)
  push word dx
  push word L73
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L75: ; Arm: 346'11
  mov dx, dx
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L76: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
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

L77: ; Continuation
  Bare_enter_check(8)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 5
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  push word dx
  push word cx
  push word L76
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g64
  mov dx, si
  jmp [bp]

L78: ; Function: (fib,g64)
  Bare_enter_check(8)
  mov ax, dx
  cmp word ax, 5
  call Bare_make_bool_from_n
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L75
  mov ax, dx
  shr ax, 1
  mov bx, 3
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov di, ax
  push word dx
  push word cx
  push word L77
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g64
  mov dx, di
  jmp [bp]

L79: ; Function: (lam,g135)
  Bare_enter_check(0)
  mov bx, dx
  mov si, [bx+2]
  mov di, [bx+4]
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L80: ; Arm: 368'9
  push word [bp+2]
  push word 3
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L81: ; Arm: 371'15
  mov dx, g200
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L82: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L83: ; Continuation
  Bare_enter_check(8)
  mov bx, dx
  cmp word [bx], 1
  jz L81
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
  push word L82
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g193
  mov dx, [Temps+6]
  jmp [bp]

L84: ; Arm: 363'27
  push word [bp+4]
  push word 3
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L85: ; Continuation
  Bare_enter_check(6)
  mov bx, dx
  cmp word [bx], 3
  jz L84
  mov dx, g198
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L86: ; Arm: 8'9
  mov dx, g196
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L87: ; Arm: 363'12
  mov ax, 19
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov si, ax
  push word [bp+8]
  push word cx
  push word L85
  mov cx, sp
  push word 6 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L86
  mov dx, g197
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L88: ; Continuation
  Bare_enter_check(18)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L83
  mov cx, sp
  push word 8 ;; scanned
  mov bx, dx
  cmp word [bx], 3
  jz L87
  mov dx, g199
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L89: ; Arm: 8'9
  mov dx, g194
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L90: ; Function: (lam,t1)
  Bare_enter_check(12)
  mov bx, dx
  cmp word [bx], 1
  jz L80
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
  push word L88
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L89
  mov dx, g195
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L91: ; Function: (loop,g193)
  Bare_enter_check(6)
  push word dx
  push word L90
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L92: ; Arm: 121'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L93: ; Continuation
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

L94: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L92
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
  push word L93
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g204
  mov dx, [Temps+10]
  jmp [bp]

L95: ; Function: (loop,g204)
  Bare_enter_check(6)
  push word dx
  push word L94
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L96: ; Arm: 121'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L97: ; Continuation
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

L98: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L96
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
  push word L97
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g207
  mov dx, [Temps+10]
  jmp [bp]

L99: ; Function: (loop,g207)
  Bare_enter_check(6)
  push word dx
  push word L98
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L100: ; Arm: 121'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L101: ; Continuation
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

L102: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L100
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
  push word L101
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g211
  mov dx, [Temps+10]
  jmp [bp]

L103: ; Function: (loop,g211)
  Bare_enter_check(6)
  push word dx
  push word L102
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L104: ; Arm: 121'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L105: ; Continuation
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

L106: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L104
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
  push word L105
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g214
  mov dx, [Temps+10]
  jmp [bp]

L107: ; Function: (loop,g214)
  Bare_enter_check(6)
  push word dx
  push word L106
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L108: ; Arm: 121'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L109: ; Continuation
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

L110: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L108
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
  push word L109
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g220
  mov dx, [Temps+10]
  jmp [bp]

L111: ; Function: (loop,g220)
  Bare_enter_check(6)
  push word dx
  push word L110
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L112: ; Arm: 121'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L113: ; Continuation
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

L114: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L112
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
  push word L113
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g223
  mov dx, [Temps+10]
  jmp [bp]

L115: ; Function: (loop,g223)
  Bare_enter_check(6)
  push word dx
  push word L114
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L116: ; Continuation
  Bare_enter_check(0)
  mov ax, `\n`
  call Bare_put_char
  mov si, Bare_unit
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L117: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, si
  jmp [bp]

L118: ; Arm: 124'11
  push word g221
  push word `0`
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  mov dx, [Temps+10]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L119: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L120: ; Arm: 128'2
  mov ax, 1
  shr ax, 1
  mov bx, si
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  push word cx
  push word L117
  mov cx, sp
  push word 4 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L118
  push word [Temps+6]
  push word cx
  push word L119
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g220
  mov dx, g222
  jmp [bp]

L121: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L122: ; Arm: 124'11
  push word g224
  push word `0`
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L123: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L124: ; Function: (lam,t1)
  Bare_enter_check(22)
  mov ax, g219
  call Bare_free_words
  shl ax, 1
  add ax, 1
  mov si, ax
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov di, ax
  push word [bp+2]
  push word cx
  push word L116
  mov cx, sp
  push word 6 ;; scanned
  mov bx, di
  cmp word [bx], 3
  jz L120
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word cx
  push word L121
  mov cx, sp
  push word 4 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L122
  push word si
  push word cx
  push word L123
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g223
  mov dx, g225
  jmp [bp]

L125: ; Function: (lam,g226)
  Bare_enter_check(6)
  push word dx
  push word L124
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L126: ; Arm: 96'7
  mov dx, g23
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L127: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L128: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L127
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L129: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L128
  mov cx, sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L130: ; Continuation
  Bare_enter_check(12)
  push word [bp+6]
  push word dx
  push word [bp+4]
  push word cx
  push word L129
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g8
  mov dx, g24
  jmp [bp]

L131: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L130
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L132: ; Continuation
  Bare_enter_check(10)
  push word dx
  push word [bp+4]
  push word cx
  push word L131
  mov cx, sp
  push word 8 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L133: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L132
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L134: ; Function: (concat,t1)
  Bare_enter_check(12)
  mov bx, dx
  cmp word [bx], 1
  jz L126
  mov si, [bx+2]
  mov di, [bx+4]
  push word si
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L133
  mov cx, sp
  push word 10 ;; scanned
  mov bp, bp
  mov dx, di
  jmp [bp]

L135: ; Continuation
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

L136: ; Arm: 166'11
  push word [bp+6]
  push word cx
  push word L135
  mov cx, sp
  push word 6 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+2]
  jmp [bp]

L137: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L138: ; Continuation
  Bare_enter_check(16)
  push word [bp+6]
  push word dx
  push word 3
  mov si, sp
  push word 6 ;; scanned
  push word [bp+8]
  push word cx
  push word L137
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, si
  jmp [bp]

L139: ; Arm: 168'26
  push word di
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L138
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+2]
  jmp [bp]

L140: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L141: ; Continuation
  Bare_enter_check(16)
  push word [bp+4]
  push word [bp+6]
  push word 3
  mov si, sp
  push word 6 ;; scanned
  push word [bp+8]
  push word cx
  push word L140
  mov cx, sp
  push word 6 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L142: ; Function: (lam,t1)
  Bare_enter_check(12)
  mov bx, dx
  cmp word [bx], 1
  jz L136
  mov si, [bx+2]
  mov di, [bx+4]
  mov ax, si
  cmp word ax, ` `
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L139
  push word di
  push word si
  push word [bp+10]
  push word cx
  push word L141
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+6]
  mov bp, [bp+8]
  jmp [bp]

L143: ; Function: (lam,t1)
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L142
  mov si, sp
  push word 12 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L144: ; Function: (have_letter,t1)
  Bare_enter_check(12)
  push word bp
  push word dx
  push word [bp+4]
  push word [bp+2]
  push word L143
  mov si, sp
  push word 10 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L145: ; Arm: 173'9
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L146: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L147: ; Arm: 175'24
  push word di
  push word cx
  push word L146
  mov cx, sp
  push word 6 ;; scanned
  mov dx, [bp+2]
  mov bp, [bp+4]
  jmp [bp]

L148: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L149: ; Continuation
  Bare_enter_check(16)
  push word g27
  push word [bp+4]
  push word 3
  mov si, sp
  push word 6 ;; scanned
  push word [bp+6]
  push word cx
  push word L148
  mov cx, sp
  push word 6 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L150: ; Function: (lam,t2)
  Bare_enter_check(10)
  mov bx, dx
  cmp word [bx], 1
  jz L145
  mov si, [bx+2]
  mov di, [bx+4]
  mov ax, si
  cmp word ax, ` `
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L147
  push word di
  push word si
  push word cx
  push word L149
  mov cx, sp
  push word 8 ;; scanned
  mov dx, [bp+2]
  mov bp, [bp+6]
  jmp [bp]

L151: ; Function: (at_word_start,t2)
  Bare_enter_check(18)
  push word bp
  push word [bp+2]
  push word L144
  mov si, sp
  push word 6 ;; scanned
  push word si
  push word bp
  push word dx
  push word L150
  mov di, sp
  push word 8 ;; scanned
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L152: ; Arm: 147'22
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov bp, [bp+2]
  mov dx, dx
  jmp [bp]

L153: ; Arm: 148'28
  mov ax, `^`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov ax, `D`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+14], ax
  push word dx
  push word `\x04`
  push word 3
  mov [Temps+16], sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+16]
  jmp [bp]

L154: ; Arm: 149'19
  mov bp, bp
  mov dx, dx
  jmp [bp]

L155: ; Arm: 152'17
  mov bp, bp
  mov dx, dx
  jmp [bp]

L156: ; Continuation
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

L157: ; Arm: 154'31
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

L158: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L156
  mov cx, sp
  push word 8 ;; scanned
  mov bx, dx
  cmp word [bx], 3
  jz L157
  mov dx, g42
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L159: ; Arm: 8'9
  mov dx, g40
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L160: ; Arm: 150'21
  mov bx, dx
  cmp word [bx], 1
  jz L155
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
  push word L158
  mov cx, sp
  push word 8 ;; scanned
  mov bx, [Temps+20]
  cmp word [bx], 3
  jz L159
  mov dx, g41
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L161: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [bp+8]
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, si
  jmp [bp]

L162: ; Arm: 105'19
  mov ax, si
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+18], ax
  mov dx, [Temps+18]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L163: ; Arm: 106'22
  mov ax, si
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+20], ax
  mov dx, [Temps+20]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L164: ; Arm: 107'16
  mov ax, si
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+22], ax
  mov dx, [Temps+22]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L165: ; Function: (readloop,t1)
  Bare_enter_check(12)
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
  jz L152
  mov ax, si
  cmp word ax, `\x04`
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L153
  mov ax, 255
  cmp word ax, di
  call Bare_make_bool_from_n
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L154
  mov ax, di
  cmp word ax, 255
  call Bare_make_bool_from_z
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L160
  mov ax, si
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+14], ax
  mov ax, [Temps+14]
  cmp word ax, 17
  call Bare_make_bool_from_z
  mov [Temps+16], ax
  push word si
  push word bp
  push word dx
  push word cx
  push word L161
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [Temps+16]
  cmp word [bx], 3
  jz L162
  mov ax, si
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+18], ax
  mov bx, [Temps+18]
  cmp word [bx], 3
  jz L163
  mov ax, 53
  cmp word ax, [Temps+14]
  call Bare_make_bool_from_n
  mov [Temps+20], ax
  mov bx, [Temps+20]
  cmp word [bx], 3
  jz L164
  mov ax, `^`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+22], ax
  mov ax, 131
  shr ax, 1
  mov bx, [Temps+14]
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+24], ax
  mov ax, [Temps+24]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+26], ax
  mov ax, [Temps+26]
  shr ax, 1
  call Bare_num_to_char
  mov [Temps+28], ax
  mov ax, [Temps+28]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+30], ax
  mov dx, [Temps+30]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L166: ; Arm: 229'36
  mov dx, g44
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L167: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L168: ; Arm: 221'7
  mov dx, [bp+10]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L169: ; Arm: 192'9
  mov dx, g47
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L170: ; Arm: 196'35
  push word [bp+8]
  push word 3
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L171: ; Continuation
  Bare_enter_check(6)
  mov bx, dx
  cmp word [bx], 3
  jz L170
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L172: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L171
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L173: ; Function: (loop,t3)
  Bare_enter_check(14)
  mov bx, dx
  cmp word [bx], 1
  jz L169
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
  push word L172
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+6]
  jmp [bp]

L174: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L175: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L174
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L176: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L175
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L177: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L176
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L178: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L177
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L179: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L178
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+12]
  jmp [bp]

L180: ; Continuation
  Bare_enter_check(16)
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L179
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g8
  mov dx, g55
  jmp [bp]

L181: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L180
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g8
  mov dx, dx
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
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L183: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L182
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, g54
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
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L185: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L184
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L186: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L185
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+12]
  jmp [bp]

L187: ; Continuation
  Bare_enter_check(16)
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L186
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g8
  mov dx, g53
  jmp [bp]

L188: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L187
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g8
  mov dx, dx
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
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L189
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
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
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L192: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L191
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L193: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L192
  mov cx, sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+14]
  jmp [bp]

L194: ; Continuation
  Bare_enter_check(18)
  push word [bp+12]
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L193
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g8
  mov dx, g52
  jmp [bp]

L195: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L194
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g8
  mov dx, dx
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
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L197: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L196
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, g51
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
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L199: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L198
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L200: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L199
  mov cx, sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+14]
  jmp [bp]

L201: ; Continuation
  Bare_enter_check(18)
  push word [bp+12]
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L200
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g8
  mov dx, g50
  jmp [bp]

L202: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L201
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g8
  mov dx, dx
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
  mov bp, [bp+6]
  mov dx, g49
  jmp [bp]

L204: ; Arm: 213'9
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L203
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, g48
  jmp [bp]

L205: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L206: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L205
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L207: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L206
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L208: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L207
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L209: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L208
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L210: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L209
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+12]
  jmp [bp]

L211: ; Continuation
  Bare_enter_check(16)
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L210
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g8
  mov dx, g63
  jmp [bp]

L212: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L211
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L213: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L212
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L214: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L213
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, g62
  jmp [bp]

L215: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L214
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L216: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L215
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L217: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L216
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+12]
  jmp [bp]

L218: ; Continuation
  Bare_enter_check(16)
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L217
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g8
  mov dx, g61
  jmp [bp]

L219: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L218
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L220: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L219
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L221: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L220
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L222: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L221
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L223: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L222
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L224: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L223
  mov cx, sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+14]
  jmp [bp]

L225: ; Continuation
  Bare_enter_check(18)
  push word [bp+12]
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L224
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g8
  mov dx, g60
  jmp [bp]

L226: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L225
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L227: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L226
  mov cx, sp
  push word 14 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L228: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L227
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, g59
  jmp [bp]

L229: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L228
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L230: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L229
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L231: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L230
  mov cx, sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+14]
  jmp [bp]

L232: ; Continuation
  Bare_enter_check(18)
  push word [bp+12]
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L231
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g8
  mov dx, g58
  jmp [bp]

L233: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L232
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L234: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L233
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, g57
  jmp [bp]

L235: ; Arm: 216'14
  mov di, [bx+2]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L234
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, g56
  jmp [bp]

L236: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L237: ; Continuation
  Bare_enter_check(14)
  mov bx, dx
  cmp word [bx], 1
  jz L204
  mov si, [bx+2]
  mov bx, si
  cmp word [bx], 1
  jz L235
  mov di, [bx+2]
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [bp+12]
  push word cx
  push word L236
  mov cx, sp
  push word 6 ;; scanned
  mov dx, [bp+8]
  mov bp, [Temps+6]
  jmp [bp]

L238: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L237
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L239: ; Continuation
  Bare_enter_check(34)
  push word [bp+12]
  push word cx
  push word L167
  mov cx, sp
  push word 6 ;; scanned
  mov bx, dx
  cmp word [bx], 1
  jz L168
  mov si, [bx+2]
  mov di, [bx+4]
  push word si
  push word [bp+8]
  push word L173
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word di
  push word si
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L238
  mov cx, sp
  push word 16 ;; scanned
  mov bx, [bp+10]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L240: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L239
  mov cx, sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+14]
  jmp [bp]

L241: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L240
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g8
  mov dx, g46
  jmp [bp]

L242: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L241
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L243: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L242
  mov cx, sp
  push word 16 ;; scanned
  mov dx, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L244: ; Continuation
  Bare_enter_check(18)
  mov bx, dx
  cmp word [bx], 3
  jz L166
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L243
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+10]
  mov dx, g45
  jmp [bp]

L245: ; Continuation
  Bare_enter_check(20)
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L244
  mov cx, sp
  push word 18 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+16]
  jmp [bp]

L246: ; Continuation
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
  push word L245
  mov cx, sp
  push word 20 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L247: ; Continuation
  Bare_enter_check(26)
  push word [bp+6]
  push word L165
  mov si, sp
  push word 4 ;; scanned
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L246
  mov cx, sp
  push word 18 ;; scanned
  mov bp, si
  mov dx, g43
  jmp [bp]

L248: ; Continuation
  Bare_enter_check(28)
  push word g38
  push word `\x04`
  push word 3
  mov si, sp
  push word 6 ;; scanned
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L247
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+4]
  mov dx, si
  jmp [bp]

L249: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L248
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L250: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L249
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+8]
  mov dx, g37
  jmp [bp]

L251: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L250
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L252: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L251
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+8]
  mov dx, g36
  jmp [bp]

L253: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, si
  jmp [bp]

L254: ; Arm: 124'11
  push word g31
  push word `0`
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  mov dx, [Temps+10]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L255: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L256: ; Arm: 128'2
  mov ax, 1
  shr ax, 1
  mov bx, si
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  push word cx
  push word L253
  mov cx, sp
  push word 4 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L254
  push word [Temps+6]
  push word cx
  push word L255
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g30
  mov dx, g32
  jmp [bp]

L257: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L258: ; Arm: 124'11
  push word g34
  push word `0`
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L259: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L260: ; Continuation
  Bare_enter_check(34)
  mov ax, g29
  call Bare_free_words
  shl ax, 1
  add ax, 1
  mov si, ax
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov di, ax
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L252
  mov cx, sp
  push word 18 ;; scanned
  mov bx, di
  cmp word [bx], 3
  jz L256
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word cx
  push word L257
  mov cx, sp
  push word 4 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L258
  push word si
  push word cx
  push word L259
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g33
  mov dx, g35
  jmp [bp]

L261: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L260
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L262: ; Function: (mainloop,t3)
  Bare_enter_check(20)
  push word bp
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L261
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+6]
  mov dx, g28
  jmp [bp]

L263: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L264: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L263
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L265: ; Arm: 250'7
  push word [bp+8]
  push word cx
  push word L264
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g72
  jmp [bp]

L266: ; Arm: 192'9
  mov dx, g73
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L267: ; Arm: 196'35
  push word [bp+8]
  push word 3
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L268: ; Continuation
  Bare_enter_check(6)
  mov bx, dx
  cmp word [bx], 3
  jz L267
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L269: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L268
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L270: ; Function: (loop,t3)
  Bare_enter_check(14)
  mov bx, dx
  cmp word [bx], 1
  jz L266
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
  push word L269
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+6]
  jmp [bp]

L271: ; Arm: 192'9
  mov dx, g82
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L272: ; Arm: 196'35
  push word [bp+8]
  push word 3
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L273: ; Continuation
  Bare_enter_check(6)
  mov bx, dx
  cmp word [bx], 3
  jz L272
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L274: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L273
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L275: ; Function: (loop,t1)
  Bare_enter_check(14)
  mov bx, dx
  cmp word [bx], 1
  jz L271
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
  push word L274
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+6]
  jmp [bp]

L276: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L277: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L276
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L278: ; Arm: 243'11
  push word g86
  push word [bp+8]
  push word 3
  mov si, sp
  push word 6 ;; scanned
  push word si
  push word g83
  push word 3
  mov di, sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L277
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, di
  jmp [bp]

L279: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L280: ; Arm: 246'16
  mov di, [bx+2]
  push word cx
  push word L279
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, di
  jmp [bp]

L281: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L282: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L281
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L283: ; Continuation
  Bare_enter_check(24)
  mov bx, dx
  cmp word [bx], 1
  jz L278
  mov si, [bx+2]
  mov bx, si
  cmp word [bx], 1
  jz L280
  mov di, [bx+2]
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word g90
  push word [bp+8]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [Temps+8]
  push word g87
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L282
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+10]
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

L285: ; Function: (lam,t1)
  Bare_enter_check(22)
  push word dx
  push word [bp+4]
  push word L275
  mov si, sp
  push word 6 ;; scanned
  push word si
  push word dx
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L284
  mov cx, sp
  push word 12 ;; scanned
  mov bx, [bp+8]
  mov di, [bx+2]
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L286: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L287: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L286
  mov cx, sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+6]
  jmp [bp]

L288: ; Continuation
  Bare_enter_check(22)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L285
  mov si, sp
  push word 10 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word cx
  push word L287
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g5
  mov dx, si
  jmp [bp]

L289: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L290: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L289
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L291: ; Arm: 243'11
  push word g77
  push word [bp+12]
  push word 3
  mov si, sp
  push word 6 ;; scanned
  push word si
  push word g74
  push word 3
  mov di, sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L290
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+8]
  mov dx, di
  jmp [bp]

L292: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L293: ; Arm: 246'16
  mov di, [bx+2]
  push word cx
  push word L292
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, di
  jmp [bp]

L294: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L295: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L294
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L296: ; Continuation
  Bare_enter_check(40)
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L288
  mov cx, sp
  push word 14 ;; scanned
  mov bx, dx
  cmp word [bx], 1
  jz L291
  mov si, [bx+2]
  mov bx, si
  cmp word [bx], 1
  jz L293
  mov di, [bx+2]
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word g81
  push word [bp+12]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [Temps+8]
  push word g78
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L295
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+8]
  mov dx, [Temps+10]
  jmp [bp]

L297: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L296
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+16]
  mov dx, dx
  jmp [bp]

L298: ; Function: (lam,t1)
  Bare_enter_check(28)
  mov bx, dx
  cmp word [bx], 1
  jz L265
  mov si, [bx+2]
  mov di, [bx+4]
  push word si
  push word [bp+4]
  push word L270
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word di
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L297
  mov cx, sp
  push word 18 ;; scanned
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L299: ; Function: (lam,t1)
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L298
  mov si, sp
  push word 10 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L300: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L301: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L300
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L302: ; Arm: 287'7
  push word [bp+8]
  push word cx
  push word L301
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g93
  jmp [bp]

L303: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L304: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L303
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L305: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L304
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L306: ; Arm: 290'10
  push word g97
  push word si
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word g94
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word [bp+2]
  push word cx
  push word L305
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+8]
  jmp [bp]

L307: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L308: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L307
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L309: ; Arm: 293'12
  mov ax, [bx+2]
  mov [Temps+10], ax
  mov ax, [bx+4]
  mov [Temps+12], ax
  push word [bp+8]
  push word cx
  push word L308
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g98
  jmp [bp]

L310: ; Arm: 192'9
  mov dx, g99
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L311: ; Arm: 196'35
  push word [bp+8]
  push word 3
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L312: ; Continuation
  Bare_enter_check(6)
  mov bx, dx
  cmp word [bx], 3
  jz L311
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L313: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L312
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L314: ; Function: (loop,t5)
  Bare_enter_check(14)
  mov bx, dx
  cmp word [bx], 1
  jz L310
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
  push word L313
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+6]
  jmp [bp]

L315: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L316: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L315
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L317: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L316
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L318: ; Arm: 296'15
  push word g103
  push word [bp+10]
  push word 3
  mov si, sp
  push word 6 ;; scanned
  push word si
  push word g100
  push word 3
  mov di, sp
  push word 6 ;; scanned
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L317
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, di
  jmp [bp]

L319: ; Continuation
  Bare_enter_check(22)
  push word [bp+6]
  push word [bp+4]
  push word 1
  mov si, sp
  push word 6 ;; scanned
  push word dx
  push word si
  push word 3
  mov di, sp
  push word 6 ;; scanned
  push word di
  push word 1
  mov [Temps+6], sp
  push word 4 ;; scanned
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L320: ; Continuation
  Bare_enter_check(26)
  mov bx, dx
  cmp word [bx], 1
  jz L318
  mov si, [bx+2]
  push word si
  push word [bp+12]
  push word cx
  push word L319
  mov cx, sp
  push word 8 ;; scanned
  mov bx, [bp+8]
  mov di, [bx+2]
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L321: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L320
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L322: ; Function: (lam,t1)
  Bare_enter_check(26)
  mov bx, dx
  cmp word [bx], 1
  jz L302
  mov si, [bx+2]
  mov di, [bx+4]
  mov bx, di
  cmp word [bx], 1
  jz L306
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L309
  push word si
  push word [bp+4]
  push word L314
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [Temps+10]
  push word [Temps+6]
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L321
  mov cx, sp
  push word 16 ;; scanned
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+12], ax
  mov dx, [Temps+12]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L323: ; Function: (lam,t4)
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L322
  mov si, sp
  push word 10 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L324: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L325: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L324
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L326: ; Arm: 330'7
  push word [bp+12]
  push word cx
  push word L325
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, g106
  jmp [bp]

L327: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L328: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L327
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L329: ; Arm: 333'12
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [bp+12]
  push word cx
  push word L328
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, g107
  jmp [bp]

L330: ; Arm: 147'22
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov bp, [bp+2]
  mov dx, dx
  jmp [bp]

L331: ; Arm: 148'28
  mov ax, `^`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov ax, `D`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+14], ax
  push word dx
  push word `\x04`
  push word 3
  mov [Temps+16], sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+16]
  jmp [bp]

L332: ; Arm: 149'19
  mov bp, bp
  mov dx, dx
  jmp [bp]

L333: ; Arm: 152'17
  mov bp, bp
  mov dx, dx
  jmp [bp]

L334: ; Continuation
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

L335: ; Arm: 154'31
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

L336: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L334
  mov cx, sp
  push word 8 ;; scanned
  mov bx, dx
  cmp word [bx], 3
  jz L335
  mov dx, g113
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L337: ; Arm: 8'9
  mov dx, g111
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L338: ; Arm: 150'21
  mov bx, dx
  cmp word [bx], 1
  jz L333
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
  push word L336
  mov cx, sp
  push word 8 ;; scanned
  mov bx, [Temps+20]
  cmp word [bx], 3
  jz L337
  mov dx, g112
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L339: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [bp+8]
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, si
  jmp [bp]

L340: ; Arm: 105'19
  mov ax, si
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+18], ax
  mov dx, [Temps+18]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L341: ; Arm: 106'22
  mov ax, si
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+20], ax
  mov dx, [Temps+20]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L342: ; Arm: 107'16
  mov ax, si
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+22], ax
  mov dx, [Temps+22]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L343: ; Function: (readloop,t1)
  Bare_enter_check(12)
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
  jz L330
  mov ax, si
  cmp word ax, `\x04`
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L331
  mov ax, 255
  cmp word ax, di
  call Bare_make_bool_from_n
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L332
  mov ax, di
  cmp word ax, 255
  call Bare_make_bool_from_z
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L338
  mov ax, si
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+14], ax
  mov ax, [Temps+14]
  cmp word ax, 17
  call Bare_make_bool_from_z
  mov [Temps+16], ax
  push word si
  push word bp
  push word dx
  push word cx
  push word L339
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [Temps+16]
  cmp word [bx], 3
  jz L340
  mov ax, si
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+18], ax
  mov bx, [Temps+18]
  cmp word [bx], 3
  jz L341
  mov ax, 53
  cmp word ax, [Temps+14]
  call Bare_make_bool_from_n
  mov [Temps+20], ax
  mov bx, [Temps+20]
  cmp word [bx], 3
  jz L342
  mov ax, `^`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+22], ax
  mov ax, 131
  shr ax, 1
  mov bx, [Temps+14]
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+24], ax
  mov ax, [Temps+24]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+26], ax
  mov ax, [Temps+26]
  shr ax, 1
  call Bare_num_to_char
  mov [Temps+28], ax
  mov ax, [Temps+28]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+30], ax
  mov dx, [Temps+30]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L344: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L345: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L344
  mov cx, sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+6]
  jmp [bp]

L346: ; Arm: 339'44
  push word [bp+10]
  push word [bp+8]
  push word cx
  push word L345
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g8
  mov dx, g115
  jmp [bp]

L347: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word dx
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, si
  jmp [bp]

L348: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L347
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L349: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L348
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L350: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L349
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+10]
  jmp [bp]

L351: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L350
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g8
  mov dx, g117
  jmp [bp]

L352: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L351
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L353: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L352
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, g116
  jmp [bp]

L354: ; Continuation
  Bare_enter_check(14)
  mov bx, dx
  cmp word [bx], 3
  jz L346
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L353
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L355: ; Continuation
  Bare_enter_check(18)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L354
  mov cx, sp
  push word 16 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+10]
  jmp [bp]

L356: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L355
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L357: ; Function: (loop,t1)
  Bare_enter_check(26)
  push word [bp+4]
  push word L343
  mov si, sp
  push word 4 ;; scanned
  push word bp
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L356
  mov cx, sp
  push word 18 ;; scanned
  mov bp, si
  mov dx, g114
  jmp [bp]

L358: ; Continuation
  Bare_enter_check(28)
  push word [bp+6]
  push word 1
  mov si, sp
  push word 4 ;; scanned
  push word si
  push word [bp+4]
  push word 1
  mov di, sp
  push word 6 ;; scanned
  push word dx
  push word di
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

L359: ; Continuation
  Bare_enter_check(10)
  push word dx
  push word [bp+6]
  push word cx
  push word L358
  mov cx, sp
  push word 8 ;; scanned
  mov bx, [bp+4]
  mov si, [bx+2]
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L360: ; Continuation
  Bare_enter_check(26)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L357
  mov si, sp
  push word 14 ;; scanned
  push word [bp+16]
  push word [bp+14]
  push word cx
  push word L359
  mov cx, sp
  push word 8 ;; scanned
  mov bp, si
  mov dx, g118
  jmp [bp]

L361: ; Continuation
  Bare_enter_check(28)
  push word g109
  push word `\x04`
  push word 3
  mov si, sp
  push word 6 ;; scanned
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
  push word 18 ;; scanned
  mov bp, [bp+4]
  mov dx, si
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
  mov bp, g25
  mov dx, dx
  jmp [bp]

L363: ; Function: (lam,t1)
  Bare_enter_check(20)
  mov bx, dx
  cmp word [bx], 1
  jz L326
  mov si, [bx+2]
  mov di, [bx+4]
  mov bx, di
  cmp word [bx], 3
  jz L329
  push word si
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L362
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+6]
  mov dx, g108
  jmp [bp]

L364: ; Function: (lam,t7)
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L363
  mov si, sp
  push word 14 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L365: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L366: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L365
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L367: ; Arm: 325'7
  push word [bp+8]
  push word cx
  push word L366
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g121
  jmp [bp]

L368: ; Arm: 192'9
  mov dx, g122
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L369: ; Arm: 196'35
  push word [bp+8]
  push word 3
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L370: ; Continuation
  Bare_enter_check(6)
  mov bx, dx
  cmp word [bx], 3
  jz L369
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L371: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L370
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L372: ; Function: (loop,t1)
  Bare_enter_check(14)
  mov bx, dx
  cmp word [bx], 1
  jz L368
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
  push word L371
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+6]
  jmp [bp]

L373: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L374: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L373
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L375: ; Arm: 318'11
  push word g125
  push word [bp+8]
  push word 3
  mov si, sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L374
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, si
  jmp [bp]

L376: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L377: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L376
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L378: ; Arm: 321'16
  mov di, [bx+2]
  push word g128
  push word [bp+8]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L377
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+6]
  jmp [bp]

L379: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L380: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L379
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L381: ; Continuation
  Bare_enter_check(16)
  mov bx, dx
  cmp word [bx], 1
  jz L375
  mov si, [bx+2]
  mov bx, si
  cmp word [bx], 1
  jz L378
  mov di, [bx+2]
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word g131
  push word [bp+8]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L380
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+8]
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
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L383: ; Function: (lam,t3)
  Bare_enter_check(22)
  push word dx
  push word [bp+4]
  push word L372
  mov si, sp
  push word 6 ;; scanned
  push word si
  push word dx
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L382
  mov cx, sp
  push word 12 ;; scanned
  mov bx, [bp+8]
  mov di, [bx+2]
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L384: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L385: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L384
  mov cx, sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+6]
  jmp [bp]

L386: ; Function: (lam,t1)
  Bare_enter_check(22)
  mov bx, dx
  cmp word [bx], 1
  jz L367
  mov si, [bx+2]
  mov di, [bx+4]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L383
  mov [Temps+6], sp
  push word 10 ;; scanned
  push word dx
  push word [bp+8]
  push word cx
  push word L385
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g5
  mov dx, [Temps+6]
  jmp [bp]

L387: ; Function: (lam,t10)
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L386
  mov si, sp
  push word 10 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L388: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L389: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L388
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L390: ; Arm: 235'9
  mov si, [bx+2]
  mov di, [bx+4]
  push word [bp+4]
  push word cx
  push word L389
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g134
  jmp [bp]

L391: ; Arm: 203'9
  mov dx, g136
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L392: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L393: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L392
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L394: ; Function: (loop,t1)
  Bare_enter_check(10)
  mov bx, dx
  cmp word [bx], 1
  jz L391
  mov si, [bx+2]
  mov di, [bx+4]
  mov ax, ` `
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  push word di
  push word bp
  push word cx
  push word L393
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+2]
  mov dx, si
  jmp [bp]

L395: ; Continuation
  Bare_enter_check(0)
  mov ax, `\n`
  call Bare_put_char
  mov si, Bare_unit
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L396: ; Arm: 207'9
  mov dx, g137
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L397: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L398: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L397
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L399: ; Continuation
  Bare_enter_check(24)
  push word [bp+4]
  push word L394
  mov si, sp
  push word 4 ;; scanned
  push word [bp+6]
  push word cx
  push word L395
  mov cx, sp
  push word 6 ;; scanned
  mov bx, dx
  cmp word [bx], 1
  jz L396
  mov di, [bx+2]
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [Temps+6]
  push word si
  push word cx
  push word L398
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, di
  jmp [bp]

L400: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L399
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L401: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L400
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [bp+6]
  mov si, [bx+2]
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L402: ; Function: (lam,t1)
  Bare_enter_check(10)
  mov bx, dx
  cmp word [bx], 3
  jz L390
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L401
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g3
  mov dx, g135
  jmp [bp]

L403: ; Function: (lam,t13)
  Bare_enter_check(8)
  push word dx
  push word [bp+2]
  push word L402
  mov si, sp
  push word 6 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L404: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L405: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L404
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L406: ; Arm: 264'7
  push word [bp+8]
  push word cx
  push word L405
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g140
  jmp [bp]

L407: ; Arm: 192'9
  mov dx, g141
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L408: ; Arm: 196'35
  push word [bp+8]
  push word 3
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L409: ; Continuation
  Bare_enter_check(6)
  mov bx, dx
  cmp word [bx], 3
  jz L408
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L410: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L409
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L411: ; Function: (loop,t3)
  Bare_enter_check(14)
  mov bx, dx
  cmp word [bx], 1
  jz L407
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
  push word L410
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+6]
  jmp [bp]

L412: ; Arm: 192'9
  mov dx, g150
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L413: ; Arm: 196'35
  push word [bp+8]
  push word 3
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L414: ; Continuation
  Bare_enter_check(6)
  mov bx, dx
  cmp word [bx], 3
  jz L413
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L415: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L414
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L416: ; Function: (loop,t1)
  Bare_enter_check(14)
  mov bx, dx
  cmp word [bx], 1
  jz L412
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
  push word L415
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+6]
  jmp [bp]

L417: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L418: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L417
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L419: ; Arm: 257'11
  push word g154
  push word [bp+8]
  push word 3
  mov si, sp
  push word 6 ;; scanned
  push word si
  push word g151
  push word 3
  mov di, sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L418
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, di
  jmp [bp]

L420: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L421: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L420
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L422: ; Arm: 260'16
  mov di, [bx+2]
  push word g158
  push word [bp+8]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word g155
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L421
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+8]
  jmp [bp]

L423: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L424: ; Continuation
  Bare_enter_check(24)
  mov bx, dx
  cmp word [bx], 1
  jz L419
  mov si, [bx+2]
  mov bx, si
  cmp word [bx], 1
  jz L422
  mov di, [bx+2]
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word cx
  push word L423
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, di
  jmp [bp]

L425: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L424
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L426: ; Function: (lam,t1)
  Bare_enter_check(22)
  push word dx
  push word [bp+4]
  push word L416
  mov si, sp
  push word 6 ;; scanned
  push word si
  push word dx
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L425
  mov cx, sp
  push word 12 ;; scanned
  mov bx, [bp+8]
  mov di, [bx+2]
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L427: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L428: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L427
  mov cx, sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+6]
  jmp [bp]

L429: ; Continuation
  Bare_enter_check(22)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L426
  mov si, sp
  push word 10 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word cx
  push word L428
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g5
  mov dx, si
  jmp [bp]

L430: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L431: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L430
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L432: ; Arm: 257'11
  push word g145
  push word [bp+12]
  push word 3
  mov si, sp
  push word 6 ;; scanned
  push word si
  push word g142
  push word 3
  mov di, sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L431
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+8]
  mov dx, di
  jmp [bp]

L433: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L434: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L433
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L435: ; Arm: 260'16
  mov di, [bx+2]
  push word g149
  push word [bp+12]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word g146
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L434
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+8]
  mov dx, [Temps+8]
  jmp [bp]

L436: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L437: ; Continuation
  Bare_enter_check(40)
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L429
  mov cx, sp
  push word 14 ;; scanned
  mov bx, dx
  cmp word [bx], 1
  jz L432
  mov si, [bx+2]
  mov bx, si
  cmp word [bx], 1
  jz L435
  mov di, [bx+2]
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word cx
  push word L436
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, di
  jmp [bp]

L438: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L437
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+16]
  mov dx, dx
  jmp [bp]

L439: ; Function: (lam,t1)
  Bare_enter_check(28)
  mov bx, dx
  cmp word [bx], 1
  jz L406
  mov si, [bx+2]
  mov di, [bx+4]
  push word si
  push word [bp+4]
  push word L411
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word di
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L438
  mov cx, sp
  push word 18 ;; scanned
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L440: ; Function: (lam,t16)
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L439
  mov si, sp
  push word 10 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L441: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L442: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L441
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L443: ; Arm: 302'7
  push word [bp+8]
  push word cx
  push word L442
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g161
  jmp [bp]

L444: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L445: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L444
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L446: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L445
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L447: ; Arm: 305'10
  push word g165
  push word si
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word g162
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word [bp+2]
  push word cx
  push word L446
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+8]
  jmp [bp]

L448: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L449: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L448
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L450: ; Arm: 308'12
  mov ax, [bx+2]
  mov [Temps+10], ax
  mov ax, [bx+4]
  mov [Temps+12], ax
  push word [bp+8]
  push word cx
  push word L449
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g166
  jmp [bp]

L451: ; Arm: 192'9
  mov dx, g167
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L452: ; Arm: 196'35
  push word [bp+8]
  push word 3
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L453: ; Continuation
  Bare_enter_check(6)
  mov bx, dx
  cmp word [bx], 3
  jz L452
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L454: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L453
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L455: ; Function: (loop,t5)
  Bare_enter_check(14)
  mov bx, dx
  cmp word [bx], 1
  jz L451
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
  push word L454
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+6]
  jmp [bp]

L456: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L457: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L456
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L458: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L457
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L459: ; Arm: 311'15
  push word g171
  push word [bp+12]
  push word 3
  mov si, sp
  push word 6 ;; scanned
  push word si
  push word g168
  push word 3
  mov di, sp
  push word 6 ;; scanned
  push word [bp+10]
  push word [bp+4]
  push word cx
  push word L458
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, di
  jmp [bp]

L460: ; Continuation
  Bare_enter_check(0)
  mov dx, g176
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L461: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L460
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L462: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L461
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L463: ; Arm: 270'9
  push word g175
  push word [bp+8]
  push word 3
  mov si, sp
  push word 6 ;; scanned
  push word si
  push word g172
  push word 3
  mov di, sp
  push word 6 ;; scanned
  push word [bp+2]
  push word cx
  push word L462
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, di
  jmp [bp]

L464: ; Arm: 275'35
  mov dx, [bp+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L465: ; Continuation
  Bare_enter_check(16)
  push word [bp+6]
  push word [bp+4]
  push word 1
  mov si, sp
  push word 6 ;; scanned
  push word dx
  push word si
  push word 3
  mov di, sp
  push word 6 ;; scanned
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L466: ; Continuation
  Bare_enter_check(10)
  mov bx, dx
  cmp word [bx], 3
  jz L464
  push word [bp+10]
  push word [bp+8]
  push word cx
  push word L465
  mov cx, sp
  push word 8 ;; scanned
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L467: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L466
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L468: ; Function: (loop,t2)
  Bare_enter_check(24)
  mov bx, dx
  cmp word [bx], 1
  jz L463
  mov si, [bx+2]
  mov di, [bx+4]
  mov bx, si
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [Temps+8]
  push word [Temps+6]
  push word di
  push word bp
  push word [bp+8]
  push word cx
  push word L467
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov dx, [Temps+6]
  jmp [bp]

L469: ; Continuation
  Bare_enter_check(22)
  push word [bp+6]
  push word [bp+4]
  push word 1
  mov si, sp
  push word 6 ;; scanned
  push word dx
  push word si
  push word 3
  mov di, sp
  push word 6 ;; scanned
  push word di
  push word 1
  mov [Temps+6], sp
  push word 4 ;; scanned
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L470: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word 1
  mov si, sp
  push word 4 ;; scanned
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L469
  mov cx, sp
  push word 8 ;; scanned
  mov bx, si
  mov di, [bx+2]
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L471: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L470
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L472: ; Continuation
  Bare_enter_check(26)
  mov bx, dx
  cmp word [bx], 1
  jz L459
  mov si, [bx+2]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L468
  mov di, sp
  push word 10 ;; scanned
  push word di
  push word si
  push word [bp+14]
  push word cx
  push word L471
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [bp+10]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L473: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L472
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+16]
  mov dx, dx
  jmp [bp]

L474: ; Function: (lam,t1)
  Bare_enter_check(28)
  mov bx, dx
  cmp word [bx], 1
  jz L443
  mov si, [bx+2]
  mov di, [bx+4]
  mov bx, di
  cmp word [bx], 1
  jz L447
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L450
  push word si
  push word [bp+4]
  push word L455
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [Temps+10]
  push word [Temps+6]
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L473
  mov cx, sp
  push word 18 ;; scanned
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+12], ax
  mov dx, [Temps+12]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L475: ; Function: (lam,t19)
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L474
  mov si, sp
  push word 10 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L476: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L477: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L476
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L478: ; Arm: 282'7
  push word [bp+8]
  push word cx
  push word L477
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g179
  jmp [bp]

L479: ; Continuation
  Bare_enter_check(0)
  mov dx, g184
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L480: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L479
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L481: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L480
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L482: ; Arm: 270'9
  push word g183
  push word [bp+8]
  push word 3
  mov si, sp
  push word 6 ;; scanned
  push word si
  push word g180
  push word 3
  mov di, sp
  push word 6 ;; scanned
  push word [bp+2]
  push word cx
  push word L481
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, di
  jmp [bp]

L483: ; Arm: 275'35
  mov dx, [bp+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L484: ; Continuation
  Bare_enter_check(16)
  push word [bp+6]
  push word [bp+4]
  push word 1
  mov si, sp
  push word 6 ;; scanned
  push word dx
  push word si
  push word 3
  mov di, sp
  push word 6 ;; scanned
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L485: ; Continuation
  Bare_enter_check(10)
  mov bx, dx
  cmp word [bx], 3
  jz L483
  push word [bp+10]
  push word [bp+8]
  push word cx
  push word L484
  mov cx, sp
  push word 8 ;; scanned
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L486: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L485
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L487: ; Function: (loop,t1)
  Bare_enter_check(24)
  mov bx, dx
  cmp word [bx], 1
  jz L482
  mov si, [bx+2]
  mov di, [bx+4]
  mov bx, si
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [Temps+8]
  push word [Temps+6]
  push word di
  push word bp
  push word [bp+8]
  push word cx
  push word L486
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov dx, [Temps+6]
  jmp [bp]

L488: ; Continuation
  Bare_enter_check(6)
  push word dx
  push word 1
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L489: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L488
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L490: ; Function: (lam,t1)
  Bare_enter_check(20)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L487
  mov si, sp
  push word 10 ;; scanned
  push word si
  push word cx
  push word L489
  mov cx, sp
  push word 6 ;; scanned
  mov bx, [bp+8]
  mov di, [bx+2]
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L491: ; Function: (lam,t3)
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L490
  mov si, sp
  push word 10 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L492: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L493: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L492
  mov cx, sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L494: ; Function: (lam,t1)
  Bare_enter_check(20)
  mov bx, dx
  cmp word [bx], 1
  jz L478
  mov si, [bx+2]
  mov di, [bx+4]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L491
  mov [Temps+6], sp
  push word 8 ;; scanned
  push word dx
  push word [bp+8]
  push word cx
  push word L493
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g7
  mov dx, [Temps+6]
  jmp [bp]

L495: ; Function: (lam,t22)
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L494
  mov si, sp
  push word 10 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L496: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L497: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L496
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L498: ; Arm: 378'7
  push word [bp+4]
  push word cx
  push word L497
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g191
  jmp [bp]

L499: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L500: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L499
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L501: ; Arm: 381'12
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [bp+4]
  push word cx
  push word L500
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g192
  jmp [bp]

L502: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L503: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L502
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L504: ; Arm: 384'15
  push word [bp+6]
  push word cx
  push word L503
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, g201
  jmp [bp]

L505: ; Arm: 350'13
  mov dx, g202
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L506: ; Continuation
  Bare_enter_check(0)
  mov ax, `\n`
  call Bare_put_char
  mov si, Bare_unit
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov di, ax
  mov bp, [bp+6]
  mov dx, di
  jmp [bp]

L507: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, si
  jmp [bp]

L508: ; Arm: 124'11
  push word g212
  push word `0`
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L509: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L510: ; Arm: 128'2
  mov ax, 1
  shr ax, 1
  mov bx, [bp+8]
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov di, ax
  mov ax, di
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word cx
  push word L507
  mov cx, sp
  push word 4 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L508
  push word di
  push word cx
  push word L509
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g211
  mov dx, g213
  jmp [bp]

L511: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L512: ; Arm: 124'11
  push word g215
  push word `0`
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L513: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L514: ; Continuation
  Bare_enter_check(24)
  mov ax, [bp+8]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov si, ax
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L506
  mov cx, sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L510
  mov ax, [bp+8]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov di, ax
  push word cx
  push word L511
  mov cx, sp
  push word 4 ;; scanned
  mov bx, di
  cmp word [bx], 3
  jz L512
  push word [bp+8]
  push word cx
  push word L513
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g214
  mov dx, g216
  jmp [bp]

L515: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L514
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L516: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L515
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, g210
  jmp [bp]

L517: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, si
  jmp [bp]

L518: ; Arm: 124'11
  push word g205
  push word `0`
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L519: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L520: ; Arm: 128'2
  mov ax, 1
  shr ax, 1
  mov bx, [bp+6]
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov di, ax
  mov ax, di
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word cx
  push word L517
  mov cx, sp
  push word 4 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L518
  push word di
  push word cx
  push word L519
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g204
  mov dx, g206
  jmp [bp]

L521: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L522: ; Arm: 124'11
  push word g208
  push word `0`
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L523: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L524: ; Continuation
  Bare_enter_check(28)
  mov ax, [bp+6]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov si, ax
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L516
  mov cx, sp
  push word 12 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L520
  mov ax, [bp+6]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov di, ax
  push word cx
  push word L521
  mov cx, sp
  push word 4 ;; scanned
  mov bx, di
  cmp word [bx], 3
  jz L522
  push word [bp+6]
  push word cx
  push word L523
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g207
  mov dx, g209
  jmp [bp]

L525: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L524
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L526: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L525
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, g203
  jmp [bp]

L527: ; Function: (loop,t2)
  Bare_enter_check(12)
  mov ax, [bp+4]
  cmp word ax, dx
  call Bare_make_bool_from_n
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L505
  push word bp
  push word dx
  push word [bp+2]
  push word cx
  push word L526
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g64
  mov dx, dx
  jmp [bp]

L528: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L529: ; Continuation
  Bare_enter_check(16)
  mov bx, dx
  cmp word [bx], 1
  jz L504
  mov si, [bx+2]
  push word si
  push word [bp+4]
  push word L527
  mov di, sp
  push word 6 ;; scanned
  push word [bp+6]
  push word cx
  push word L528
  mov cx, sp
  push word 6 ;; scanned
  mov bp, di
  mov dx, 1
  jmp [bp]

L530: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L529
  mov cx, sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L531: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L530
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g193
  mov dx, 1
  jmp [bp]

L532: ; Function: (lam,t1)
  Bare_enter_check(10)
  mov bx, dx
  cmp word [bx], 1
  jz L498
  mov si, [bx+2]
  mov di, [bx+4]
  mov bx, di
  cmp word [bx], 3
  jz L501
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L531
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+2]
  mov dx, si
  jmp [bp]

L533: ; Function: (lam,t25)
  Bare_enter_check(8)
  push word dx
  push word [bp+2]
  push word L532
  mov si, sp
  push word 6 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L534: ; Continuation
  Bare_enter_check(324)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L299
  mov si, sp
  push word 8 ;; scanned
  push word si
  push word g71
  push word 3
  mov di, sp
  push word 6 ;; scanned
  push word di
  push word g70
  push word 1
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L323
  mov [Temps+8], sp
  push word 8 ;; scanned
  push word [Temps+8]
  push word g92
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [Temps+10]
  push word g91
  push word 1
  mov [Temps+12], sp
  push word 6 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L364
  mov [Temps+14], sp
  push word 12 ;; scanned
  push word [Temps+14]
  push word g105
  push word 3
  mov [Temps+16], sp
  push word 6 ;; scanned
  push word [Temps+16]
  push word g104
  push word 1
  mov [Temps+18], sp
  push word 6 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L387
  mov [Temps+20], sp
  push word 8 ;; scanned
  push word [Temps+20]
  push word g120
  push word 3
  mov [Temps+22], sp
  push word 6 ;; scanned
  push word [Temps+22]
  push word g119
  push word 1
  mov [Temps+24], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word L403
  mov [Temps+26], sp
  push word 4 ;; scanned
  push word [Temps+26]
  push word g133
  push word 3
  mov [Temps+28], sp
  push word 6 ;; scanned
  push word [Temps+28]
  push word g132
  push word 1
  mov [Temps+30], sp
  push word 6 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L440
  mov [Temps+32], sp
  push word 8 ;; scanned
  push word [Temps+32]
  push word g139
  push word 3
  mov [Temps+34], sp
  push word 6 ;; scanned
  push word [Temps+34]
  push word g138
  push word 1
  mov [Temps+36], sp
  push word 6 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L475
  mov [Temps+38], sp
  push word 8 ;; scanned
  push word [Temps+38]
  push word g160
  push word 3
  mov [Temps+40], sp
  push word 6 ;; scanned
  push word [Temps+40]
  push word g159
  push word 1
  mov [Temps+42], sp
  push word 6 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L495
  mov [Temps+44], sp
  push word 8 ;; scanned
  push word [Temps+44]
  push word g178
  push word 3
  mov [Temps+46], sp
  push word 6 ;; scanned
  push word [Temps+46]
  push word g177
  push word 1
  mov [Temps+48], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word L533
  mov [Temps+50], sp
  push word 4 ;; scanned
  push word [Temps+50]
  push word g190
  push word 3
  mov [Temps+52], sp
  push word 6 ;; scanned
  push word [Temps+52]
  push word g189
  push word 1
  mov [Temps+54], sp
  push word 6 ;; scanned
  push word g230
  push word [Temps+54]
  push word 3
  mov [Temps+56], sp
  push word 6 ;; scanned
  push word [Temps+56]
  push word g188
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
  push word g69
  push word 3
  mov [Temps+76], sp
  push word 6 ;; scanned
  push word [Temps+76]
  push word 1
  mov [Temps+78], sp
  push word 4 ;; scanned
  mov bp, [bp+14]
  mov dx, [Temps+78]
  jmp [bp]

L535: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L534
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L536: ; Continuation
  Bare_enter_check(46)
  push word [bp+8]
  push word [bp+4]
  push word L134
  mov si, sp
  push word 6 ;; scanned
  push word [bp+6]
  push word L151
  mov di, sp
  push word 4 ;; scanned
  push word di
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L262
  mov [Temps+6], sp
  push word 12 ;; scanned
  push word [Temps+6]
  push word si
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L535
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+8]
  mov dx, g65
  jmp [bp]

L537: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L536
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g1
  mov dx, g22
  jmp [bp]

L538: ; Continuation
  Bare_enter_check(10)
  push word dx
  push word [bp+4]
  push word cx
  push word L537
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g1
  mov dx, g14
  jmp [bp]

L539: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word cx
  push word L538
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g1
  mov dx, g12
  jmp [bp]

L540: ; Start
  Bare_enter_check(6)
  push word cx
  push word L539
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
  dw 1
g28:
  dw 3
  db `{`
g29:
  dw 1
g30:
  dw L70
g31:
  dw 1
g32:
  dw 1
g33:
  dw L74
g34:
  dw 1
g35:
  dw 1
g36:
  dw 3
  db `}`
g37:
  dw 5
  db `% `
g38:
  dw 1
g39:
  dw 1
g40:
  dw 1
g41:
  dw 3
g42:
  dw 1
g43:
  dw 1
g44:
  dw 1
g45:
  dw 1
g46:
  dw 1
g47:
  dw 1
g48:
  dw 35
  db `command not found`
g49:
  dw 3
  db `\n`
g50:
  dw 1
g51:
  dw 5
  db `: `
g52:
  dw 1
g53:
  dw 1
g54:
  dw 13
  db `sham: `
g55:
  dw 1
g56:
  dw 35
  db `Permission denied`
g57:
  dw 3
  db `\n`
g58:
  dw 1
g59:
  dw 5
  db `: `
g60:
  dw 1
g61:
  dw 1
g62:
  dw 13
  db `sham: `
g63:
  dw 1
g64:
  dw L78
g65:
  dw 103
  db `Sham: In-memory file-system. Consider typing "ls".\n`
g66:
  dw 13
  db `readme`
g67:
  dw 165
  db `Welcome to sham; please try all the commands!\nCan you find the hidden Easter Egg?\n`
g68:
  dw 1, g67
g69:
  dw 1, g66, g68
g70:
  dw 7
  db `cat`
g71:
  dw 115
  db `cat - concatenate files and print on the standard output\n`
g72:
  dw 67
  db `cat: takes at least one argument\n`
g73:
  dw 1
g74:
  dw 11
  db `cat: `
g75:
  dw 59
  db ` : No such file or directory\n`
g76:
  dw 1
g77:
  dw 3, g75, g76
g78:
  dw 11
  db `cat: `
g79:
  dw 39
  db ` : Not a data file\n`
g80:
  dw 1
g81:
  dw 3, g79, g80
g82:
  dw 1
g83:
  dw 11
  db `cat: `
g84:
  dw 59
  db ` : No such file or directory\n`
g85:
  dw 1
g86:
  dw 3, g84, g85
g87:
  dw 11
  db `cat: `
g88:
  dw 39
  db ` : Not a data file\n`
g89:
  dw 1
g90:
  dw 3, g88, g89
g91:
  dw 5
  db `cp`
g92:
  dw 65
  db `cp - copy files and directories\n`
g93:
  dw 51
  db `cp: missing file operand\n`
g94:
  dw 89
  db `cp: missing destination file operand after '`
g95:
  dw 5
  db `'\n`
g96:
  dw 1
g97:
  dw 3, g95, g96
g98:
  dw 61
  db `cp: unexpected extra operands\n`
g99:
  dw 1
g100:
  dw 35
  db `cp: cannot stat '`
g101:
  dw 59
  db `': No such file or directory\n`
g102:
  dw 1
g103:
  dw 3, g101, g102
g104:
  dw 13
  db `create`
g105:
  dw 55
  db `create - create a new file\n`
g106:
  dw 53
  db `create: missing file name\n`
g107:
  dw 69
  db `create: unexpected extra operands\n`
g108:
  dw 69
  db `(to finish type ^D on a new line)\n`
g109:
  dw 1
g110:
  dw 1
g111:
  dw 1
g112:
  dw 3
g113:
  dw 1
g114:
  dw 1
g115:
  dw 1
g116:
  dw 3
  db `\n`
g117:
  dw 1
g118:
  dw 1
g119:
  dw 9
  db `file`
g120:
  dw 55
  db `file - determine file type\n`
g121:
  dw 69
  db `file: takes at least one argument\n`
g122:
  dw 1
g123:
  dw 59
  db ` : No such file or directory\n`
g124:
  dw 1
g125:
  dw 3, g123, g124
g126:
  dw 27
  db `: ASCII text\n`
g127:
  dw 1
g128:
  dw 3, g126, g127
g129:
  dw 27
  db `: executable\n`
g130:
  dw 1
g131:
  dw 3, g129, g130
g132:
  dw 5
  db `ls`
g133:
  dw 59
  db `ls - list directory contents\n`
g134:
  dw 47
  db `ls: takes no arguments\n`
g135:
  dw L79
g136:
  dw 1
g137:
  dw 1
g138:
  dw 7
  db `man`
g139:
  dw 103
  db `man - an interface to the system reference manuals\n`
g140:
  dw 61
  db `What manual page do you want?\n`
g141:
  dw 1
g142:
  dw 41
  db `No manual entry for `
g143:
  dw 3
  db `\n`
g144:
  dw 1
g145:
  dw 3, g143, g144
g146:
  dw 41
  db `No manual entry for `
g147:
  dw 3
  db `\n`
g148:
  dw 1
g149:
  dw 3, g147, g148
g150:
  dw 1
g151:
  dw 41
  db `No manual entry for `
g152:
  dw 3
  db `\n`
g153:
  dw 1
g154:
  dw 3, g152, g153
g155:
  dw 41
  db `No manual entry for `
g156:
  dw 3
  db `\n`
g157:
  dw 1
g158:
  dw 3, g156, g157
g159:
  dw 5
  db `mv`
g160:
  dw 51
  db `mv - move (rename) files\n`
g161:
  dw 51
  db `mv: missing file operand\n`
g162:
  dw 89
  db `mv: missing destination file operand after '`
g163:
  dw 5
  db `'\n`
g164:
  dw 1
g165:
  dw 3, g163, g164
g166:
  dw 61
  db `mv: unexpected extra operands\n`
g167:
  dw 1
g168:
  dw 35
  db `mv: cannot stat '`
g169:
  dw 59
  db `': No such file or directory\n`
g170:
  dw 1
g171:
  dw 3, g169, g170
g172:
  dw 39
  db `rm: cannot remove '`
g173:
  dw 59
  db `': No such file or directory\n`
g174:
  dw 1
g175:
  dw 3, g173, g174
g176:
  dw 1
g177:
  dw 5
  db `rm`
g178:
  dw 133
  db `rm - remove files or directories (directories not supported yet!)\n`
g179:
  dw 41
  db `rm: missing operand\n`
g180:
  dw 39
  db `rm: cannot remove '`
g181:
  dw 59
  db `': No such file or directory\n`
g182:
  dw 1
g183:
  dw 3, g181, g182
g184:
  dw 1
g185:
  dw 7
  db `cat`
g186:
  dw 439
  db `I have a little shadow that goes in and out with me,\nAnd what can be the use of him is more than I can see.\nHe is very, very like me from the heels up to the head;\nAnd I see him jump before me, when I jump into my bed.\n`
g187:
  dw 1, g186
g188:
  dw 1, g185, g187
g189:
  dw 7
  db `fib`
g190:
  dw 101
  db `fib - naive fib computation upto the given number\n`
g191:
  dw 45
  db `fib: missing argument\n`
g192:
  dw 69
  db `create: unexpected extra argument\n`
g193:
  dw L91
g194:
  dw 1
g195:
  dw 3
g196:
  dw 1
g197:
  dw 3
g198:
  dw 1
g199:
  dw 1
g200:
  dw 1
g201:
  dw 63
  db `fib: expected numeric argument\n`
g202:
  dw 1
g203:
  dw 9
  db `fib `
g204:
  dw L95
g205:
  dw 1
g206:
  dw 1
g207:
  dw L99
g208:
  dw 1
g209:
  dw 1
g210:
  dw 11
  db ` --> `
g211:
  dw L103
g212:
  dw 1
g213:
  dw 1
g214:
  dw L107
g215:
  dw 1
g216:
  dw 1
g217:
  dw 11
  db `space`
g218:
  dw 95
  db `space - where is the stack-pointer? (in words)\n`
g219:
  dw 1
g220:
  dw L111
g221:
  dw 1
g222:
  dw 1
g223:
  dw L115
g224:
  dw 1
g225:
  dw 1
g226:
  dw L125
g227:
  dw 3, g218, g226
g228:
  dw 1, g217, g227
g229:
  dw 1
g230:
  dw 3, g228, g229

bare_start: jmp L540
