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

L67: ; Arm: 145'25
  call Bare_get_keyboard_last_scancode
  mov [Temps+6], ax
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L68: ; Function: (get_scan,g27)
  Bare_enter_check(0)
  hlt
  mov si, Bare_unit
  call Bare_is_keyboard_ready
  call Bare_make_bool_from_nz
  mov di, ax
  mov bx, di
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

L71: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L69
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
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
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

L75: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L73
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
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
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

L79: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L77
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
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
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

L83: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L81
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
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
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

L87: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L85
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
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
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

L91: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L89
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
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L93: ; Arm: 121'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L94: ; Continuation
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

L95: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L93
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
  push word L94
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g67
  mov dx, [Temps+10]
  jmp [bp]

L96: ; Function: (loop,g67)
  Bare_enter_check(6)
  push word dx
  push word L95
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L97: ; Arm: 121'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L98: ; Continuation
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

L99: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L97
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
  push word L98
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g70
  mov dx, [Temps+10]
  jmp [bp]

L100: ; Function: (loop,g70)
  Bare_enter_check(6)
  push word dx
  push word L99
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L101: ; Arm: 399'11
  mov dx, dx
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L102: ; Continuation
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

L103: ; Continuation
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
  push word L102
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g100
  mov dx, si
  jmp [bp]

L104: ; Function: (fib,g100)
  Bare_enter_check(8)
  mov ax, dx
  cmp word ax, 5
  call Bare_make_bool_from_n
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L101
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
  push word L103
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g100
  mov dx, di
  jmp [bp]

L105: ; Function: (lam,g170)
  Bare_enter_check(0)
  mov bx, dx
  mov si, [bx+2]
  mov di, [bx+4]
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L106: ; Arm: 421'9
  push word [bp+2]
  push word 3
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L107: ; Arm: 424'15
  mov dx, g235
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L108: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L109: ; Continuation
  Bare_enter_check(8)
  mov bx, dx
  cmp word [bx], 1
  jz L107
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
  push word L108
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g228
  mov dx, [Temps+6]
  jmp [bp]

L110: ; Arm: 416'27
  push word [bp+4]
  push word 3
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L111: ; Continuation
  Bare_enter_check(6)
  mov bx, dx
  cmp word [bx], 3
  jz L110
  mov dx, g233
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L112: ; Arm: 8'9
  mov dx, g231
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L113: ; Arm: 416'12
  mov ax, 19
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov si, ax
  push word [bp+8]
  push word cx
  push word L111
  mov cx, sp
  push word 6 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L112
  mov dx, g232
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L114: ; Continuation
  Bare_enter_check(18)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L109
  mov cx, sp
  push word 8 ;; scanned
  mov bx, dx
  cmp word [bx], 3
  jz L113
  mov dx, g234
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L115: ; Arm: 8'9
  mov dx, g229
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L116: ; Function: (lam,t1)
  Bare_enter_check(12)
  mov bx, dx
  cmp word [bx], 1
  jz L106
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
  push word L114
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L115
  mov dx, g230
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L117: ; Function: (loop,g228)
  Bare_enter_check(6)
  push word dx
  push word L116
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
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

L120: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L118
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
  push word L119
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g239
  mov dx, [Temps+10]
  jmp [bp]

L121: ; Function: (loop,g239)
  Bare_enter_check(6)
  push word dx
  push word L120
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
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

L124: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L122
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
  push word L123
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g242
  mov dx, [Temps+10]
  jmp [bp]

L125: ; Function: (loop,g242)
  Bare_enter_check(6)
  push word dx
  push word L124
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
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

L128: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L126
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
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
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

L132: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L130
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
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L134: ; Arm: 121'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L135: ; Continuation
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

L136: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L134
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
  push word L135
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g255
  mov dx, [Temps+10]
  jmp [bp]

L137: ; Function: (loop,g255)
  Bare_enter_check(6)
  push word dx
  push word L136
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L138: ; Arm: 121'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L139: ; Continuation
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

L140: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L138
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
  push word L139
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g258
  mov dx, [Temps+10]
  jmp [bp]

L141: ; Function: (loop,g258)
  Bare_enter_check(6)
  push word dx
  push word L140
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L142: ; Continuation
  Bare_enter_check(0)
  mov ax, `\n`
  call Bare_put_char
  mov si, Bare_unit
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L143: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, si
  jmp [bp]

L144: ; Arm: 124'11
  push word g256
  push word `0`
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  mov dx, [Temps+10]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L145: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L146: ; Arm: 128'2
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
  push word L143
  mov cx, sp
  push word 4 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L144
  push word [Temps+6]
  push word cx
  push word L145
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g255
  mov dx, g257
  jmp [bp]

L147: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L148: ; Arm: 124'11
  push word g259
  push word `0`
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L149: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L150: ; Function: (lam,t1)
  Bare_enter_check(22)
  mov ax, g254
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
  push word L142
  mov cx, sp
  push word 6 ;; scanned
  mov bx, di
  cmp word [bx], 3
  jz L146
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word cx
  push word L147
  mov cx, sp
  push word 4 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L148
  push word si
  push word cx
  push word L149
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g258
  mov dx, g260
  jmp [bp]

L151: ; Function: (lam,g261)
  Bare_enter_check(6)
  push word dx
  push word L150
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L152: ; Arm: 96'7
  mov dx, g23
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L153: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L154: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L153
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L155: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L154
  mov cx, sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L156: ; Continuation
  Bare_enter_check(12)
  push word [bp+6]
  push word dx
  push word [bp+4]
  push word cx
  push word L155
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g8
  mov dx, g24
  jmp [bp]

L157: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L156
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L158: ; Continuation
  Bare_enter_check(10)
  push word dx
  push word [bp+4]
  push word cx
  push word L157
  mov cx, sp
  push word 8 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L159: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L158
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L160: ; Function: (concat,t1)
  Bare_enter_check(12)
  mov bx, dx
  cmp word [bx], 1
  jz L152
  mov si, [bx+2]
  mov di, [bx+4]
  push word si
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L159
  mov cx, sp
  push word 10 ;; scanned
  mov bp, bp
  mov dx, di
  jmp [bp]

L161: ; Continuation
  Bare_enter_check(0)
  mov bp, dx
  mov dx, g37
  jmp [bp]

L162: ; Arm: 171'23
  push word cx
  push word L161
  mov cx, sp
  push word 4 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+10]
  jmp [bp]

L163: ; Continuation
  Bare_enter_check(0)
  mov bp, dx
  mov dx, g38
  jmp [bp]

L164: ; Arm: 172'26
  push word cx
  push word L163
  mov cx, sp
  push word 4 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+10]
  jmp [bp]

L165: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L166: ; Arm: 173'25
  push word [bp+12]
  push word cx
  push word L165
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+10]
  mov dx, g39
  jmp [bp]

L167: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L168: ; Arm: 174'28
  push word [bp+12]
  push word cx
  push word L167
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+10]
  mov dx, g40
  jmp [bp]

L169: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L170: ; Arm: 175'32
  push word [bp+12]
  push word cx
  push word L169
  mov cx, sp
  push word 6 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+10]
  jmp [bp]

L171: ; Arm: 176'24
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

L172: ; Arm: 177'26
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

L173: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L174: ; Continuation
  Bare_enter_check(8)
  mov ax, `}`
  call Bare_put_char
  mov si, Bare_unit
  push word [bp+8]
  push word cx
  push word L173
  mov cx, sp
  push word 6 ;; scanned
  mov dx, [bp+4]
  mov bp, [bp+6]
  jmp [bp]

L175: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, si
  jmp [bp]

L176: ; Arm: 124'11
  push word g45
  push word `0`
  push word 3
  mov [Temps+14], sp
  push word 6 ;; scanned
  mov dx, [Temps+14]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L177: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L178: ; Arm: 128'2
  mov ax, 1
  shr ax, 1
  mov bx, [bp+14]
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+10], ax
  mov ax, [Temps+10]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+12], ax
  push word cx
  push word L175
  mov cx, sp
  push word 4 ;; scanned
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L176
  push word [Temps+10]
  push word cx
  push word L177
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g44
  mov dx, g46
  jmp [bp]

L179: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L180: ; Arm: 124'11
  push word g48
  push word `0`
  push word 3
  mov [Temps+12], sp
  push word 6 ;; scanned
  mov dx, [Temps+12]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L181: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L182: ; Arm: 180'27
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
  push word L174
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L178
  mov ax, [bp+14]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  push word cx
  push word L179
  mov cx, sp
  push word 4 ;; scanned
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L180
  push word [bp+14]
  push word cx
  push word L181
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g47
  mov dx, g49
  jmp [bp]

L183: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L184: ; Continuation
  Bare_enter_check(8)
  mov ax, `}`
  call Bare_put_char
  mov si, Bare_unit
  push word [bp+8]
  push word cx
  push word L183
  mov cx, sp
  push word 6 ;; scanned
  mov dx, [bp+4]
  mov bp, [bp+6]
  jmp [bp]

L185: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, si
  jmp [bp]

L186: ; Arm: 124'11
  push word g53
  push word `0`
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  mov dx, [Temps+10]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L187: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L188: ; Arm: 128'2
  mov ax, 1
  shr ax, 1
  mov bx, [bp+14]
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
  push word L185
  mov cx, sp
  push word 4 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L186
  push word [Temps+6]
  push word cx
  push word L187
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g52
  mov dx, g54
  jmp [bp]

L189: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L190: ; Arm: 124'11
  push word g56
  push word `0`
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L191: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L192: ; Arm: 181'32
  mov ax, `{`
  call Bare_put_char
  mov si, Bare_unit
  mov ax, [bp+14]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov di, ax
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word cx
  push word L184
  mov cx, sp
  push word 10 ;; scanned
  mov bx, di
  cmp word [bx], 3
  jz L188
  mov ax, [bp+14]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word cx
  push word L189
  mov cx, sp
  push word 4 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L190
  push word [bp+14]
  push word cx
  push word L191
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g55
  mov dx, g57
  jmp [bp]

L193: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L194: ; Continuation
  Bare_enter_check(8)
  mov ax, `}`
  call Bare_put_char
  mov si, Bare_unit
  push word [bp+8]
  push word cx
  push word L193
  mov cx, sp
  push word 6 ;; scanned
  mov dx, [bp+4]
  mov bp, [bp+6]
  jmp [bp]

L195: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, si
  jmp [bp]

L196: ; Arm: 124'11
  push word g59
  push word `0`
  push word 3
  mov [Temps+14], sp
  push word 6 ;; scanned
  mov dx, [Temps+14]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L197: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L198: ; Arm: 128'2
  mov ax, 1
  shr ax, 1
  mov bx, [bp+14]
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+10], ax
  mov ax, [Temps+10]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+12], ax
  push word cx
  push word L195
  mov cx, sp
  push word 4 ;; scanned
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L196
  push word [Temps+10]
  push word cx
  push word L197
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g58
  mov dx, g60
  jmp [bp]

L199: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L200: ; Arm: 124'11
  push word g62
  push word `0`
  push word 3
  mov [Temps+12], sp
  push word 6 ;; scanned
  mov dx, [Temps+12]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L201: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L202: ; Arm: 184'22
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
  push word L194
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L198
  mov ax, [bp+14]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  push word cx
  push word L199
  mov cx, sp
  push word 4 ;; scanned
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L200
  push word [bp+14]
  push word cx
  push word L201
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g61
  mov dx, g63
  jmp [bp]

L203: ; Arm: 187'24
  mov ax, si
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  shr ax, 1
  mov bx, 129
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+8], ax
  mov ax, [Temps+8]
  shr ax, 1
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

L204: ; Continuation
  Bare_enter_check(26)
  mov bx, dx
  cmp word [bx], 3
  jz L192
  mov ax, [bp+16]
  mov bx, [bp+14]
  shr bx, 1
  call Bare_get_bytes
  mov si, ax
  mov ax, si
  cmp word ax, ` `
  call Bare_make_bool_from_z
  mov di, ax
  mov bx, di
  cmp word [bx], 3
  jz L202
  mov bx, [bp+12]
  cmp word [bx], 3
  jz L203
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
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L205: ; Arm: 8'9
  mov dx, g50
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L206: ; Continuation
  Bare_enter_check(26)
  mov bx, dx
  mov si, [bx]
  mov ax, [bp+14]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov di, ax
  mov bx, di
  cmp word [bx], 3
  jz L182
  mov ax, [bp+14]
  cmp word ax, si
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
  push word L204
  mov cx, sp
  push word 18 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L205
  mov dx, g51
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L207: ; Arm: 178'44
  mov dx, g41
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L208: ; Arm: 178'72
  mov dx, g42
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L209: ; Continuation
  Bare_enter_check(18)
  mov ax, 257
  cmp word ax, [bp+14]
  call Bare_make_bool_from_n
  mov si, ax
  mov ax, [bp+14]
  cmp word ax, 59
  call Bare_make_bool_from_z
  mov di, ax
  mov ax, [bp+14]
  cmp word ax, 315
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov bx, di
  cmp word [bx], 3
  jz L162
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L164
  mov bx, [bp+16]
  cmp word [bx], 3
  jz L166
  mov bx, dx
  cmp word [bx], 3
  jz L168
  mov bx, si
  cmp word [bx], 3
  jz L170
  mov ax, [bp+14]
  cmp word ax, 29
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L171
  mov ax, [bp+14]
  cmp word ax, 115
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L172
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L206
  mov cx, sp
  push word 16 ;; scanned
  mov bx, [bp+12]
  cmp word [bx], 3
  jz L207
  mov bx, [bp+8]
  cmp word [bx], 3
  jz L208
  mov dx, g43
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L210: ; Arm: 164'38
  mov dx, g36
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L211: ; Continuation
  Bare_enter_check(20)
  mov ax, [bp+14]
  cmp word ax, 341
  call Bare_make_bool_from_z
  mov si, ax
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L209
  mov cx, sp
  push word 18 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L210
  mov ax, [bp+14]
  cmp word ax, 365
  call Bare_make_bool_from_z
  mov di, ax
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L212: ; Arm: 163'36
  mov dx, g35
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L213: ; Continuation
  Bare_enter_check(18)
  mov ax, dx
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov si, ax
  mov ax, si
  cmp word ax, 85
  call Bare_make_bool_from_z
  mov di, ax
  push word si
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L211
  mov cx, sp
  push word 16 ;; scanned
  mov bx, di
  cmp word [bx], 3
  jz L212
  mov ax, si
  cmp word ax, 109
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L214: ; Function: (lam,t1)
  Bare_enter_check(16)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L213
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g27
  mov dx, g34
  jmp [bp]

L215: ; Function: (loop,t4)
  Bare_enter_check(12)
  push word bp
  push word dx
  push word [bp+4]
  push word [bp+2]
  push word L214
  mov si, sp
  push word 10 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L216: ; Continuation
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

L217: ; Arm: 219'11
  push word [bp+6]
  push word cx
  push word L216
  mov cx, sp
  push word 6 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+2]
  jmp [bp]

L218: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L219: ; Continuation
  Bare_enter_check(16)
  push word [bp+6]
  push word dx
  push word 3
  mov si, sp
  push word 6 ;; scanned
  push word [bp+8]
  push word cx
  push word L218
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, si
  jmp [bp]

L220: ; Arm: 221'26
  push word di
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L219
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+2]
  jmp [bp]

L221: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L222: ; Continuation
  Bare_enter_check(16)
  push word [bp+4]
  push word [bp+6]
  push word 3
  mov si, sp
  push word 6 ;; scanned
  push word [bp+8]
  push word cx
  push word L221
  mov cx, sp
  push word 6 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L223: ; Function: (lam,t1)
  Bare_enter_check(12)
  mov bx, dx
  cmp word [bx], 1
  jz L217
  mov si, [bx+2]
  mov di, [bx+4]
  mov ax, si
  cmp word ax, ` `
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L220
  push word di
  push word si
  push word [bp+10]
  push word cx
  push word L222
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+6]
  mov bp, [bp+8]
  jmp [bp]

L224: ; Function: (lam,t1)
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L223
  mov si, sp
  push word 12 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L225: ; Function: (have_letter,t1)
  Bare_enter_check(12)
  push word bp
  push word dx
  push word [bp+4]
  push word [bp+2]
  push word L224
  mov si, sp
  push word 10 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L226: ; Arm: 226'9
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L227: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L228: ; Arm: 228'24
  push word di
  push word cx
  push word L227
  mov cx, sp
  push word 6 ;; scanned
  mov dx, [bp+2]
  mov bp, [bp+4]
  jmp [bp]

L229: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L230: ; Continuation
  Bare_enter_check(16)
  push word g64
  push word [bp+4]
  push word 3
  mov si, sp
  push word 6 ;; scanned
  push word [bp+6]
  push word cx
  push word L229
  mov cx, sp
  push word 6 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L231: ; Function: (lam,t2)
  Bare_enter_check(10)
  mov bx, dx
  cmp word [bx], 1
  jz L226
  mov si, [bx+2]
  mov di, [bx+4]
  mov ax, si
  cmp word ax, ` `
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L228
  push word di
  push word si
  push word cx
  push word L230
  mov cx, sp
  push word 8 ;; scanned
  mov dx, [bp+2]
  mov bp, [bp+6]
  jmp [bp]

L232: ; Function: (at_word_start,t5)
  Bare_enter_check(18)
  push word bp
  push word [bp+2]
  push word L225
  mov si, sp
  push word 6 ;; scanned
  push word si
  push word bp
  push word dx
  push word L231
  mov di, sp
  push word 8 ;; scanned
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L233: ; Arm: 200'22
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L234: ; Arm: 201'28
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

L235: ; Arm: 202'19
  mov dx, [bp+6]
  mov bp, [bp+8]
  jmp [bp]

L236: ; Arm: 205'17
  mov dx, [bp+6]
  mov bp, [bp+8]
  jmp [bp]

L237: ; Continuation
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

L238: ; Arm: 207'31
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

L239: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L237
  mov cx, sp
  push word 8 ;; scanned
  mov bx, dx
  cmp word [bx], 3
  jz L238
  mov dx, g78
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L240: ; Arm: 8'9
  mov dx, g76
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L241: ; Arm: 203'21
  mov bx, [bp+6]
  cmp word [bx], 1
  jz L236
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
  push word L239
  mov cx, sp
  push word 8 ;; scanned
  mov bx, [Temps+18]
  cmp word [bx], 3
  jz L240
  mov dx, g77
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L242: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [bp+8]
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, si
  jmp [bp]

L243: ; Arm: 105'19
  mov ax, dx
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+16], ax
  mov dx, [Temps+16]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L244: ; Arm: 106'22
  mov ax, dx
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+18], ax
  mov dx, [Temps+18]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L245: ; Arm: 107'16
  mov ax, dx
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+20], ax
  mov dx, [Temps+20]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L246: ; Continuation
  Bare_enter_check(12)
  mov ax, dx
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov si, ax
  mov ax, dx
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov di, ax
  mov bx, di
  cmp word [bx], 3
  jz L233
  mov ax, dx
  cmp word ax, `\x04`
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L234
  mov ax, 255
  cmp word ax, si
  call Bare_make_bool_from_n
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L235
  mov ax, si
  cmp word ax, 255
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L241
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
  push word L242
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [Temps+14]
  cmp word [bx], 3
  jz L243
  mov ax, dx
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+16], ax
  mov bx, [Temps+16]
  cmp word [bx], 3
  jz L244
  mov ax, 53
  cmp word ax, [Temps+12]
  call Bare_make_bool_from_n
  mov [Temps+18], ax
  mov bx, [Temps+18]
  cmp word [bx], 3
  jz L245
  mov ax, `^`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+20], ax
  mov ax, 131
  shr ax, 1
  mov bx, [Temps+12]
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+22], ax
  mov ax, [Temps+22]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+24], ax
  mov ax, [Temps+24]
  shr ax, 1
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

L247: ; Continuation
  Bare_enter_check(12)
  mov bx, [bp+6]
  mov si, [bx]
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L246
  mov cx, sp
  push word 10 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L248: ; Function: (readloop,t1)
  Bare_enter_check(14)
  mov bx, [bp+4]
  mov si, [bx]
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L247
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+8]
  mov dx, si
  jmp [bp]

L249: ; Arm: 282'36
  mov dx, g80
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L250: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L251: ; Arm: 274'7
  mov dx, [bp+10]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L252: ; Arm: 245'9
  mov dx, g83
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L253: ; Arm: 249'35
  push word [bp+8]
  push word 3
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L254: ; Continuation
  Bare_enter_check(6)
  mov bx, dx
  cmp word [bx], 3
  jz L253
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L255: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L254
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L256: ; Function: (loop,t3)
  Bare_enter_check(14)
  mov bx, dx
  cmp word [bx], 1
  jz L252
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
  push word L255
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+6]
  jmp [bp]

L257: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L258: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L257
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L259: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L258
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L260: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L259
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L261: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L260
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L262: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L261
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+10]
  jmp [bp]

L263: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L262
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g8
  mov dx, g91
  jmp [bp]

L264: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L263
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g8
  mov dx, dx
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
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L265
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, g90
  jmp [bp]

L267: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L266
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L268: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L267
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L269: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L268
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+10]
  jmp [bp]

L270: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L269
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g8
  mov dx, g89
  jmp [bp]

L271: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L270
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L272: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L271
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L273: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L272
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
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
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L275: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L274
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L276: ; Continuation
  Bare_enter_check(16)
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L275
  mov cx, sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+12]
  jmp [bp]

L277: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L276
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g8
  mov dx, g88
  jmp [bp]

L278: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L277
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L279: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L278
  mov cx, sp
  push word 14 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L280: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L279
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, g87
  jmp [bp]

L281: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L280
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L282: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L281
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L283: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L282
  mov cx, sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+14]
  jmp [bp]

L284: ; Continuation
  Bare_enter_check(18)
  push word [bp+12]
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L283
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g8
  mov dx, g86
  jmp [bp]

L285: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L284
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g8
  mov dx, dx
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
  mov bp, [bp+6]
  mov dx, g85
  jmp [bp]

L287: ; Arm: 266'9
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L286
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, g84
  jmp [bp]

L288: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L289: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L288
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L290: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L289
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L291: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L290
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L292: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L291
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L293: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L292
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+10]
  jmp [bp]

L294: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L293
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g8
  mov dx, g99
  jmp [bp]

L295: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L294
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g8
  mov dx, dx
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
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L296
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, g98
  jmp [bp]

L298: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L297
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L299: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L298
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L300: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L299
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+10]
  jmp [bp]

L301: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L300
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g8
  mov dx, g97
  jmp [bp]

L302: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L301
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L303: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L302
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
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
  mov dx, [bp+10]
  mov bp, [bp+6]
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
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L306: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L305
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L307: ; Continuation
  Bare_enter_check(16)
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L306
  mov cx, sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+12]
  jmp [bp]

L308: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L307
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g8
  mov dx, g96
  jmp [bp]

L309: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L308
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L310: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L309
  mov cx, sp
  push word 14 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L311: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L310
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, g95
  jmp [bp]

L312: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L311
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L313: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L312
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L314: ; Continuation
  Bare_enter_check(16)
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L313
  mov cx, sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+12]
  jmp [bp]

L315: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L314
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g8
  mov dx, g94
  jmp [bp]

L316: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L315
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L317: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L316
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, g93
  jmp [bp]

L318: ; Arm: 269'14
  mov di, [bx+2]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L317
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, g92
  jmp [bp]

L319: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L320: ; Continuation
  Bare_enter_check(14)
  mov bx, dx
  cmp word [bx], 1
  jz L287
  mov si, [bx+2]
  mov bx, si
  cmp word [bx], 1
  jz L318
  mov di, [bx+2]
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [bp+12]
  push word cx
  push word L319
  mov cx, sp
  push word 6 ;; scanned
  mov dx, [bp+8]
  mov bp, [Temps+6]
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

L322: ; Continuation
  Bare_enter_check(34)
  push word [bp+12]
  push word cx
  push word L250
  mov cx, sp
  push word 6 ;; scanned
  mov bx, dx
  cmp word [bx], 1
  jz L251
  mov si, [bx+2]
  mov di, [bx+4]
  push word si
  push word [bp+8]
  push word L256
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word di
  push word si
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L321
  mov cx, sp
  push word 16 ;; scanned
  mov bx, [bp+10]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L323: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L322
  mov cx, sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+14]
  jmp [bp]

L324: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L323
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g8
  mov dx, g82
  jmp [bp]

L325: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L324
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L326: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L325
  mov cx, sp
  push word 16 ;; scanned
  mov dx, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L327: ; Continuation
  Bare_enter_check(18)
  mov bx, dx
  cmp word [bx], 3
  jz L249
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L326
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+10]
  mov dx, g81
  jmp [bp]

L328: ; Continuation
  Bare_enter_check(20)
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L327
  mov cx, sp
  push word 18 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+16]
  jmp [bp]

L329: ; Continuation
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
  push word L328
  mov cx, sp
  push word 20 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L330: ; Continuation
  Bare_enter_check(32)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+6]
  push word L248
  mov si, sp
  push word 10 ;; scanned
  push word dx
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L329
  mov cx, sp
  push word 18 ;; scanned
  mov bp, si
  mov dx, g79
  jmp [bp]

L331: ; Continuation
  Bare_enter_check(34)
  push word g75
  push word `\x04`
  push word 3
  mov si, sp
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
  push word L330
  mov cx, sp
  push word 24 ;; scanned
  mov bp, [bp+4]
  mov dx, si
  jmp [bp]

L332: ; Continuation
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
  push word L331
  mov cx, sp
  push word 24 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L333: ; Continuation
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
  push word L332
  mov cx, sp
  push word 24 ;; scanned
  mov bp, [bp+8]
  mov dx, g74
  jmp [bp]

L334: ; Continuation
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
  push word L333
  mov cx, sp
  push word 24 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L335: ; Continuation
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
  push word L334
  mov cx, sp
  push word 24 ;; scanned
  mov bp, [bp+8]
  mov dx, g73
  jmp [bp]

L336: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, si
  jmp [bp]

L337: ; Arm: 124'11
  push word g68
  push word `0`
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  mov dx, [Temps+10]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L338: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L339: ; Arm: 128'2
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
  push word L336
  mov cx, sp
  push word 4 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L337
  push word [Temps+6]
  push word cx
  push word L338
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g67
  mov dx, g69
  jmp [bp]

L340: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L341: ; Arm: 124'11
  push word g71
  push word `0`
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L342: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L343: ; Continuation
  Bare_enter_check(40)
  mov ax, g66
  call Bare_free_words
  shl ax, 1
  add ax, 1
  mov si, ax
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov di, ax
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
  push word L335
  mov cx, sp
  push word 24 ;; scanned
  mov bx, di
  cmp word [bx], 3
  jz L339
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word cx
  push word L340
  mov cx, sp
  push word 4 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L341
  push word si
  push word cx
  push word L342
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g70
  mov dx, g72
  jmp [bp]

L344: ; Continuation
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
  push word L343
  mov cx, sp
  push word 24 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L345: ; Function: (mainloop,t6)
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
  push word L344
  mov cx, sp
  push word 24 ;; scanned
  mov bp, [bp+6]
  mov dx, g65
  jmp [bp]

L346: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L347: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L346
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L348: ; Arm: 303'7
  push word [bp+8]
  push word cx
  push word L347
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g108
  jmp [bp]

L349: ; Arm: 245'9
  mov dx, g109
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L350: ; Arm: 249'35
  push word [bp+8]
  push word 3
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L351: ; Continuation
  Bare_enter_check(6)
  mov bx, dx
  cmp word [bx], 3
  jz L350
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L352: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L351
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L353: ; Function: (loop,t3)
  Bare_enter_check(14)
  mov bx, dx
  cmp word [bx], 1
  jz L349
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
  push word L352
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+6]
  jmp [bp]

L354: ; Arm: 245'9
  mov dx, g118
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L355: ; Arm: 249'35
  push word [bp+8]
  push word 3
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L356: ; Continuation
  Bare_enter_check(6)
  mov bx, dx
  cmp word [bx], 3
  jz L355
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L357: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L356
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L358: ; Function: (loop,t1)
  Bare_enter_check(14)
  mov bx, dx
  cmp word [bx], 1
  jz L354
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
  push word L357
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+6]
  jmp [bp]

L359: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L360: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L359
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L361: ; Arm: 296'11
  push word g122
  push word [bp+8]
  push word 3
  mov si, sp
  push word 6 ;; scanned
  push word si
  push word g119
  push word 3
  mov di, sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L360
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, di
  jmp [bp]

L362: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L363: ; Arm: 299'16
  mov di, [bx+2]
  push word cx
  push word L362
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, di
  jmp [bp]

L364: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L365: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L364
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L366: ; Continuation
  Bare_enter_check(24)
  mov bx, dx
  cmp word [bx], 1
  jz L361
  mov si, [bx+2]
  mov bx, si
  cmp word [bx], 1
  jz L363
  mov di, [bx+2]
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word g126
  push word [bp+8]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [Temps+8]
  push word g123
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L365
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+10]
  jmp [bp]

L367: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L366
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L368: ; Function: (lam,t1)
  Bare_enter_check(22)
  push word dx
  push word [bp+4]
  push word L358
  mov si, sp
  push word 6 ;; scanned
  push word si
  push word dx
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L367
  mov cx, sp
  push word 12 ;; scanned
  mov bx, [bp+8]
  mov di, [bx+2]
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L369: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L370: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L369
  mov cx, sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+6]
  jmp [bp]

L371: ; Continuation
  Bare_enter_check(22)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L368
  mov si, sp
  push word 10 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word cx
  push word L370
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g5
  mov dx, si
  jmp [bp]

L372: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L373: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L372
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L374: ; Arm: 296'11
  push word g113
  push word [bp+12]
  push word 3
  mov si, sp
  push word 6 ;; scanned
  push word si
  push word g110
  push word 3
  mov di, sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L373
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+8]
  mov dx, di
  jmp [bp]

L375: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L376: ; Arm: 299'16
  mov di, [bx+2]
  push word cx
  push word L375
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, di
  jmp [bp]

L377: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L378: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L377
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L379: ; Continuation
  Bare_enter_check(40)
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L371
  mov cx, sp
  push word 14 ;; scanned
  mov bx, dx
  cmp word [bx], 1
  jz L374
  mov si, [bx+2]
  mov bx, si
  cmp word [bx], 1
  jz L376
  mov di, [bx+2]
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word g117
  push word [bp+12]
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
  push word L378
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+8]
  mov dx, [Temps+10]
  jmp [bp]

L380: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L379
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+16]
  mov dx, dx
  jmp [bp]

L381: ; Function: (lam,t1)
  Bare_enter_check(28)
  mov bx, dx
  cmp word [bx], 1
  jz L348
  mov si, [bx+2]
  mov di, [bx+4]
  push word si
  push word [bp+4]
  push word L353
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
  push word L380
  mov cx, sp
  push word 18 ;; scanned
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L382: ; Function: (lam,t1)
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L381
  mov si, sp
  push word 10 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L383: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L384: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L383
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L385: ; Arm: 340'7
  push word [bp+8]
  push word cx
  push word L384
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g129
  jmp [bp]

L386: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L387: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L386
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L388: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L387
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L389: ; Arm: 343'10
  push word g133
  push word si
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word g130
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word [bp+2]
  push word cx
  push word L388
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+8]
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

L392: ; Arm: 346'12
  mov ax, [bx+2]
  mov [Temps+10], ax
  mov ax, [bx+4]
  mov [Temps+12], ax
  push word [bp+8]
  push word cx
  push word L391
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g134
  jmp [bp]

L393: ; Arm: 245'9
  mov dx, g135
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L394: ; Arm: 249'35
  push word [bp+8]
  push word 3
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L395: ; Continuation
  Bare_enter_check(6)
  mov bx, dx
  cmp word [bx], 3
  jz L394
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L396: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L395
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L397: ; Function: (loop,t5)
  Bare_enter_check(14)
  mov bx, dx
  cmp word [bx], 1
  jz L393
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
  push word L396
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+6]
  jmp [bp]

L398: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L399: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L398
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L400: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L399
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L401: ; Arm: 349'15
  push word g139
  push word [bp+10]
  push word 3
  mov si, sp
  push word 6 ;; scanned
  push word si
  push word g136
  push word 3
  mov di, sp
  push word 6 ;; scanned
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L400
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, di
  jmp [bp]

L402: ; Continuation
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

L403: ; Continuation
  Bare_enter_check(26)
  mov bx, dx
  cmp word [bx], 1
  jz L401
  mov si, [bx+2]
  push word si
  push word [bp+12]
  push word cx
  push word L402
  mov cx, sp
  push word 8 ;; scanned
  mov bx, [bp+8]
  mov di, [bx+2]
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
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
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L405: ; Function: (lam,t1)
  Bare_enter_check(26)
  mov bx, dx
  cmp word [bx], 1
  jz L385
  mov si, [bx+2]
  mov di, [bx+4]
  mov bx, di
  cmp word [bx], 1
  jz L389
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L392
  push word si
  push word [bp+4]
  push word L397
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [Temps+10]
  push word [Temps+6]
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L404
  mov cx, sp
  push word 16 ;; scanned
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+12], ax
  mov dx, [Temps+12]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L406: ; Function: (lam,t4)
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L405
  mov si, sp
  push word 10 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L407: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L408: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L407
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L409: ; Arm: 383'7
  push word [bp+18]
  push word cx
  push word L408
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, g142
  jmp [bp]

L410: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L411: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L410
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L412: ; Arm: 386'12
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [bp+18]
  push word cx
  push word L411
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, g143
  jmp [bp]

L413: ; Arm: 200'22
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L414: ; Arm: 201'28
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

L415: ; Arm: 202'19
  mov dx, [bp+6]
  mov bp, [bp+8]
  jmp [bp]

L416: ; Arm: 205'17
  mov dx, [bp+6]
  mov bp, [bp+8]
  jmp [bp]

L417: ; Continuation
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

L418: ; Arm: 207'31
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

L419: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L417
  mov cx, sp
  push word 8 ;; scanned
  mov bx, dx
  cmp word [bx], 3
  jz L418
  mov dx, g148
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L420: ; Arm: 8'9
  mov dx, g146
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L421: ; Arm: 203'21
  mov bx, [bp+6]
  cmp word [bx], 1
  jz L416
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
  push word L419
  mov cx, sp
  push word 8 ;; scanned
  mov bx, [Temps+18]
  cmp word [bx], 3
  jz L420
  mov dx, g147
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L422: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [bp+8]
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, si
  jmp [bp]

L423: ; Arm: 105'19
  mov ax, dx
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+16], ax
  mov dx, [Temps+16]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L424: ; Arm: 106'22
  mov ax, dx
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+18], ax
  mov dx, [Temps+18]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L425: ; Arm: 107'16
  mov ax, dx
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+20], ax
  mov dx, [Temps+20]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L426: ; Continuation
  Bare_enter_check(12)
  mov ax, dx
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov si, ax
  mov ax, dx
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov di, ax
  mov bx, di
  cmp word [bx], 3
  jz L413
  mov ax, dx
  cmp word ax, `\x04`
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L414
  mov ax, 255
  cmp word ax, si
  call Bare_make_bool_from_n
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L415
  mov ax, si
  cmp word ax, 255
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L421
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
  push word L422
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [Temps+14]
  cmp word [bx], 3
  jz L423
  mov ax, dx
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+16], ax
  mov bx, [Temps+16]
  cmp word [bx], 3
  jz L424
  mov ax, 53
  cmp word ax, [Temps+12]
  call Bare_make_bool_from_n
  mov [Temps+18], ax
  mov bx, [Temps+18]
  cmp word [bx], 3
  jz L425
  mov ax, `^`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+20], ax
  mov ax, 131
  shr ax, 1
  mov bx, [Temps+12]
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+22], ax
  mov ax, [Temps+22]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+24], ax
  mov ax, [Temps+24]
  shr ax, 1
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

L427: ; Continuation
  Bare_enter_check(12)
  mov bx, [bp+6]
  mov si, [bx]
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L426
  mov cx, sp
  push word 10 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L428: ; Function: (readloop,t1)
  Bare_enter_check(14)
  mov bx, [bp+4]
  mov si, [bx]
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L427
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+8]
  mov dx, si
  jmp [bp]

L429: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L430: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L429
  mov cx, sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+6]
  jmp [bp]

L431: ; Arm: 392'44
  push word [bp+10]
  push word [bp+8]
  push word cx
  push word L430
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g8
  mov dx, g150
  jmp [bp]

L432: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word dx
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, si
  jmp [bp]

L433: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L432
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L434: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L433
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L435: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L434
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+10]
  jmp [bp]

L436: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L435
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g8
  mov dx, g152
  jmp [bp]

L437: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L436
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L438: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L437
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, g151
  jmp [bp]

L439: ; Continuation
  Bare_enter_check(14)
  mov bx, dx
  cmp word [bx], 3
  jz L431
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L438
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L440: ; Continuation
  Bare_enter_check(18)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L439
  mov cx, sp
  push word 16 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+10]
  jmp [bp]

L441: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L440
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L442: ; Function: (loop,t1)
  Bare_enter_check(32)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+4]
  push word L428
  mov si, sp
  push word 10 ;; scanned
  push word bp
  push word dx
  push word [bp+18]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L441
  mov cx, sp
  push word 18 ;; scanned
  mov bp, si
  mov dx, g149
  jmp [bp]

L443: ; Continuation
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

L444: ; Continuation
  Bare_enter_check(10)
  push word dx
  push word [bp+6]
  push word cx
  push word L443
  mov cx, sp
  push word 8 ;; scanned
  mov bx, [bp+4]
  mov si, [bx+2]
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L445: ; Continuation
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
  push word L442
  mov si, sp
  push word 20 ;; scanned
  push word [bp+22]
  push word [bp+20]
  push word cx
  push word L444
  mov cx, sp
  push word 8 ;; scanned
  mov bp, si
  mov dx, g153
  jmp [bp]

L446: ; Continuation
  Bare_enter_check(34)
  push word g145
  push word `\x04`
  push word 3
  mov si, sp
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
  push word L445
  mov cx, sp
  push word 24 ;; scanned
  mov bp, [bp+4]
  mov dx, si
  jmp [bp]

L447: ; Continuation
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
  push word L446
  mov cx, sp
  push word 24 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L448: ; Function: (lam,t1)
  Bare_enter_check(26)
  mov bx, dx
  cmp word [bx], 1
  jz L409
  mov si, [bx+2]
  mov di, [bx+4]
  mov bx, di
  cmp word [bx], 3
  jz L412
  push word si
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
  push word L447
  mov cx, sp
  push word 24 ;; scanned
  mov bp, [bp+6]
  mov dx, g144
  jmp [bp]

L449: ; Function: (lam,t7)
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
  push word L448
  mov si, sp
  push word 20 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L450: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L451: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L450
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L452: ; Arm: 378'7
  push word [bp+8]
  push word cx
  push word L451
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g156
  jmp [bp]

L453: ; Arm: 245'9
  mov dx, g157
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L454: ; Arm: 249'35
  push word [bp+8]
  push word 3
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L455: ; Continuation
  Bare_enter_check(6)
  mov bx, dx
  cmp word [bx], 3
  jz L454
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L456: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L455
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L457: ; Function: (loop,t1)
  Bare_enter_check(14)
  mov bx, dx
  cmp word [bx], 1
  jz L453
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
  push word L456
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+6]
  jmp [bp]

L458: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L459: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L458
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L460: ; Arm: 371'11
  push word g160
  push word [bp+8]
  push word 3
  mov si, sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L459
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, si
  jmp [bp]

L461: ; Continuation
  Bare_enter_check(0)
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

L463: ; Arm: 374'16
  mov di, [bx+2]
  push word g163
  push word [bp+8]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L462
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+6]
  jmp [bp]

L464: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L465: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L464
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L466: ; Continuation
  Bare_enter_check(16)
  mov bx, dx
  cmp word [bx], 1
  jz L460
  mov si, [bx+2]
  mov bx, si
  cmp word [bx], 1
  jz L463
  mov di, [bx+2]
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word g166
  push word [bp+8]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L465
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+8]
  jmp [bp]

L467: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L466
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L468: ; Function: (lam,t3)
  Bare_enter_check(22)
  push word dx
  push word [bp+4]
  push word L457
  mov si, sp
  push word 6 ;; scanned
  push word si
  push word dx
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L467
  mov cx, sp
  push word 12 ;; scanned
  mov bx, [bp+8]
  mov di, [bx+2]
  mov dx, di
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
  mov bx, bp
  mov bp, dx
  mov dx, [bx+6]
  jmp [bp]

L471: ; Function: (lam,t1)
  Bare_enter_check(22)
  mov bx, dx
  cmp word [bx], 1
  jz L452
  mov si, [bx+2]
  mov di, [bx+4]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L468
  mov [Temps+6], sp
  push word 10 ;; scanned
  push word dx
  push word [bp+8]
  push word cx
  push word L470
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g5
  mov dx, [Temps+6]
  jmp [bp]

L472: ; Function: (lam,t10)
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L471
  mov si, sp
  push word 10 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L473: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L474: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L473
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L475: ; Arm: 288'9
  mov si, [bx+2]
  mov di, [bx+4]
  push word [bp+4]
  push word cx
  push word L474
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g169
  jmp [bp]

L476: ; Arm: 256'9
  mov dx, g171
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L477: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L478: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L477
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L479: ; Function: (loop,t1)
  Bare_enter_check(10)
  mov bx, dx
  cmp word [bx], 1
  jz L476
  mov si, [bx+2]
  mov di, [bx+4]
  mov ax, ` `
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  push word di
  push word bp
  push word cx
  push word L478
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+2]
  mov dx, si
  jmp [bp]

L480: ; Continuation
  Bare_enter_check(0)
  mov ax, `\n`
  call Bare_put_char
  mov si, Bare_unit
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L481: ; Arm: 260'9
  mov dx, g172
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L482: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L483: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L482
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L484: ; Continuation
  Bare_enter_check(24)
  push word [bp+4]
  push word L479
  mov si, sp
  push word 4 ;; scanned
  push word [bp+6]
  push word cx
  push word L480
  mov cx, sp
  push word 6 ;; scanned
  mov bx, dx
  cmp word [bx], 1
  jz L481
  mov di, [bx+2]
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [Temps+6]
  push word si
  push word cx
  push word L483
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, di
  jmp [bp]

L485: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L484
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L486: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L485
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [bp+6]
  mov si, [bx+2]
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L487: ; Function: (lam,t1)
  Bare_enter_check(10)
  mov bx, dx
  cmp word [bx], 3
  jz L475
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L486
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g3
  mov dx, g170
  jmp [bp]

L488: ; Function: (lam,t13)
  Bare_enter_check(8)
  push word dx
  push word [bp+2]
  push word L487
  mov si, sp
  push word 6 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L489: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L490: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L489
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L491: ; Arm: 317'7
  push word [bp+8]
  push word cx
  push word L490
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g175
  jmp [bp]

L492: ; Arm: 245'9
  mov dx, g176
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L493: ; Arm: 249'35
  push word [bp+8]
  push word 3
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L494: ; Continuation
  Bare_enter_check(6)
  mov bx, dx
  cmp word [bx], 3
  jz L493
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L495: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L494
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L496: ; Function: (loop,t3)
  Bare_enter_check(14)
  mov bx, dx
  cmp word [bx], 1
  jz L492
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
  push word L495
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+6]
  jmp [bp]

L497: ; Arm: 245'9
  mov dx, g185
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L498: ; Arm: 249'35
  push word [bp+8]
  push word 3
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L499: ; Continuation
  Bare_enter_check(6)
  mov bx, dx
  cmp word [bx], 3
  jz L498
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L500: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L499
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L501: ; Function: (loop,t1)
  Bare_enter_check(14)
  mov bx, dx
  cmp word [bx], 1
  jz L497
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
  push word L500
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+6]
  jmp [bp]

L502: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L503: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L502
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L504: ; Arm: 310'11
  push word g189
  push word [bp+8]
  push word 3
  mov si, sp
  push word 6 ;; scanned
  push word si
  push word g186
  push word 3
  mov di, sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L503
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, di
  jmp [bp]

L505: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L506: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L505
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L507: ; Arm: 313'16
  mov di, [bx+2]
  push word g193
  push word [bp+8]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word g190
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L506
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+8]
  jmp [bp]

L508: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L509: ; Continuation
  Bare_enter_check(24)
  mov bx, dx
  cmp word [bx], 1
  jz L504
  mov si, [bx+2]
  mov bx, si
  cmp word [bx], 1
  jz L507
  mov di, [bx+2]
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word cx
  push word L508
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, di
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
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L511: ; Function: (lam,t1)
  Bare_enter_check(22)
  push word dx
  push word [bp+4]
  push word L501
  mov si, sp
  push word 6 ;; scanned
  push word si
  push word dx
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L510
  mov cx, sp
  push word 12 ;; scanned
  mov bx, [bp+8]
  mov di, [bx+2]
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L512: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L513: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L512
  mov cx, sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+6]
  jmp [bp]

L514: ; Continuation
  Bare_enter_check(22)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L511
  mov si, sp
  push word 10 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word cx
  push word L513
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g5
  mov dx, si
  jmp [bp]

L515: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L516: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L515
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L517: ; Arm: 310'11
  push word g180
  push word [bp+12]
  push word 3
  mov si, sp
  push word 6 ;; scanned
  push word si
  push word g177
  push word 3
  mov di, sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L516
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+8]
  mov dx, di
  jmp [bp]

L518: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L519: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L518
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L520: ; Arm: 313'16
  mov di, [bx+2]
  push word g184
  push word [bp+12]
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
  push word L519
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+8]
  mov dx, [Temps+8]
  jmp [bp]

L521: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L522: ; Continuation
  Bare_enter_check(40)
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L514
  mov cx, sp
  push word 14 ;; scanned
  mov bx, dx
  cmp word [bx], 1
  jz L517
  mov si, [bx+2]
  mov bx, si
  cmp word [bx], 1
  jz L520
  mov di, [bx+2]
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word cx
  push word L521
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, di
  jmp [bp]

L523: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L522
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+16]
  mov dx, dx
  jmp [bp]

L524: ; Function: (lam,t1)
  Bare_enter_check(28)
  mov bx, dx
  cmp word [bx], 1
  jz L491
  mov si, [bx+2]
  mov di, [bx+4]
  push word si
  push word [bp+4]
  push word L496
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
  push word L523
  mov cx, sp
  push word 18 ;; scanned
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L525: ; Function: (lam,t16)
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L524
  mov si, sp
  push word 10 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L526: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L527: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L526
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L528: ; Arm: 355'7
  push word [bp+8]
  push word cx
  push word L527
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g196
  jmp [bp]

L529: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L530: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L529
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L531: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L530
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L532: ; Arm: 358'10
  push word g200
  push word si
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word g197
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word [bp+2]
  push word cx
  push word L531
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+8]
  jmp [bp]

L533: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L534: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L533
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L535: ; Arm: 361'12
  mov ax, [bx+2]
  mov [Temps+10], ax
  mov ax, [bx+4]
  mov [Temps+12], ax
  push word [bp+8]
  push word cx
  push word L534
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g201
  jmp [bp]

L536: ; Arm: 245'9
  mov dx, g202
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L537: ; Arm: 249'35
  push word [bp+8]
  push word 3
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L538: ; Continuation
  Bare_enter_check(6)
  mov bx, dx
  cmp word [bx], 3
  jz L537
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L539: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L538
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L540: ; Function: (loop,t5)
  Bare_enter_check(14)
  mov bx, dx
  cmp word [bx], 1
  jz L536
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
  push word L539
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+6]
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

L543: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L542
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L544: ; Arm: 364'15
  push word g206
  push word [bp+12]
  push word 3
  mov si, sp
  push word 6 ;; scanned
  push word si
  push word g203
  push word 3
  mov di, sp
  push word 6 ;; scanned
  push word [bp+10]
  push word [bp+4]
  push word cx
  push word L543
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, di
  jmp [bp]

L545: ; Continuation
  Bare_enter_check(0)
  mov dx, g211
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L546: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L545
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L547: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L546
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L548: ; Arm: 323'9
  push word g210
  push word [bp+8]
  push word 3
  mov si, sp
  push word 6 ;; scanned
  push word si
  push word g207
  push word 3
  mov di, sp
  push word 6 ;; scanned
  push word [bp+2]
  push word cx
  push word L547
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, di
  jmp [bp]

L549: ; Arm: 328'35
  mov dx, [bp+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L550: ; Continuation
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

L551: ; Continuation
  Bare_enter_check(10)
  mov bx, dx
  cmp word [bx], 3
  jz L549
  push word [bp+10]
  push word [bp+8]
  push word cx
  push word L550
  mov cx, sp
  push word 8 ;; scanned
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L552: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L551
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L553: ; Function: (loop,t2)
  Bare_enter_check(24)
  mov bx, dx
  cmp word [bx], 1
  jz L548
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
  push word L552
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov dx, [Temps+6]
  jmp [bp]

L554: ; Continuation
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

L555: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word 1
  mov si, sp
  push word 4 ;; scanned
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L554
  mov cx, sp
  push word 8 ;; scanned
  mov bx, si
  mov di, [bx+2]
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L556: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L555
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L557: ; Continuation
  Bare_enter_check(26)
  mov bx, dx
  cmp word [bx], 1
  jz L544
  mov si, [bx+2]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L553
  mov di, sp
  push word 10 ;; scanned
  push word di
  push word si
  push word [bp+14]
  push word cx
  push word L556
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [bp+10]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L558: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L557
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+16]
  mov dx, dx
  jmp [bp]

L559: ; Function: (lam,t1)
  Bare_enter_check(28)
  mov bx, dx
  cmp word [bx], 1
  jz L528
  mov si, [bx+2]
  mov di, [bx+4]
  mov bx, di
  cmp word [bx], 1
  jz L532
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L535
  push word si
  push word [bp+4]
  push word L540
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
  push word L558
  mov cx, sp
  push word 18 ;; scanned
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+12], ax
  mov dx, [Temps+12]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L560: ; Function: (lam,t19)
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L559
  mov si, sp
  push word 10 ;; scanned
  mov dx, si
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

L563: ; Arm: 335'7
  push word [bp+8]
  push word cx
  push word L562
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g214
  jmp [bp]

L564: ; Continuation
  Bare_enter_check(0)
  mov dx, g219
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L565: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L564
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L566: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L565
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L567: ; Arm: 323'9
  push word g218
  push word [bp+8]
  push word 3
  mov si, sp
  push word 6 ;; scanned
  push word si
  push word g215
  push word 3
  mov di, sp
  push word 6 ;; scanned
  push word [bp+2]
  push word cx
  push word L566
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, di
  jmp [bp]

L568: ; Arm: 328'35
  mov dx, [bp+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L569: ; Continuation
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

L570: ; Continuation
  Bare_enter_check(10)
  mov bx, dx
  cmp word [bx], 3
  jz L568
  push word [bp+10]
  push word [bp+8]
  push word cx
  push word L569
  mov cx, sp
  push word 8 ;; scanned
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L571: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L570
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L572: ; Function: (loop,t1)
  Bare_enter_check(24)
  mov bx, dx
  cmp word [bx], 1
  jz L567
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
  push word L571
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov dx, [Temps+6]
  jmp [bp]

L573: ; Continuation
  Bare_enter_check(6)
  push word dx
  push word 1
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L574: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L573
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L575: ; Function: (lam,t1)
  Bare_enter_check(20)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L572
  mov si, sp
  push word 10 ;; scanned
  push word si
  push word cx
  push word L574
  mov cx, sp
  push word 6 ;; scanned
  mov bx, [bp+8]
  mov di, [bx+2]
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L576: ; Function: (lam,t3)
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L575
  mov si, sp
  push word 10 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L577: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L578: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L577
  mov cx, sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L579: ; Function: (lam,t1)
  Bare_enter_check(20)
  mov bx, dx
  cmp word [bx], 1
  jz L563
  mov si, [bx+2]
  mov di, [bx+4]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L576
  mov [Temps+6], sp
  push word 8 ;; scanned
  push word dx
  push word [bp+8]
  push word cx
  push word L578
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g7
  mov dx, [Temps+6]
  jmp [bp]

L580: ; Function: (lam,t22)
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L579
  mov si, sp
  push word 10 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L581: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L582: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L581
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L583: ; Arm: 431'7
  push word [bp+4]
  push word cx
  push word L582
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g226
  jmp [bp]

L584: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L585: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L584
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L586: ; Arm: 434'12
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [bp+4]
  push word cx
  push word L585
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g227
  jmp [bp]

L587: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L588: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L587
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L589: ; Arm: 437'15
  push word [bp+6]
  push word cx
  push word L588
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, g236
  jmp [bp]

L590: ; Arm: 403'13
  mov dx, g237
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L591: ; Continuation
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

L592: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, si
  jmp [bp]

L593: ; Arm: 124'11
  push word g247
  push word `0`
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L594: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L595: ; Arm: 128'2
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
  push word L592
  mov cx, sp
  push word 4 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L593
  push word di
  push word cx
  push word L594
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g246
  mov dx, g248
  jmp [bp]

L596: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L597: ; Arm: 124'11
  push word g250
  push word `0`
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L598: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L599: ; Continuation
  Bare_enter_check(24)
  mov ax, [bp+8]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov si, ax
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L591
  mov cx, sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L595
  mov ax, [bp+8]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov di, ax
  push word cx
  push word L596
  mov cx, sp
  push word 4 ;; scanned
  mov bx, di
  cmp word [bx], 3
  jz L597
  push word [bp+8]
  push word cx
  push word L598
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g249
  mov dx, g251
  jmp [bp]

L600: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L599
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L601: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L600
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, g245
  jmp [bp]

L602: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, si
  jmp [bp]

L603: ; Arm: 124'11
  push word g240
  push word `0`
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L604: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L605: ; Arm: 128'2
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
  push word L602
  mov cx, sp
  push word 4 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L603
  push word di
  push word cx
  push word L604
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g239
  mov dx, g241
  jmp [bp]

L606: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov dx, dx
  jmp [bp]

L607: ; Arm: 124'11
  push word g243
  push word `0`
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L608: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L609: ; Continuation
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
  push word L601
  mov cx, sp
  push word 12 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L605
  mov ax, [bp+6]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov di, ax
  push word cx
  push word L606
  mov cx, sp
  push word 4 ;; scanned
  mov bx, di
  cmp word [bx], 3
  jz L607
  push word [bp+6]
  push word cx
  push word L608
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g242
  mov dx, g244
  jmp [bp]

L610: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L609
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L611: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L610
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, g238
  jmp [bp]

L612: ; Function: (loop,t2)
  Bare_enter_check(12)
  mov ax, [bp+4]
  cmp word ax, dx
  call Bare_make_bool_from_n
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L590
  push word bp
  push word dx
  push word [bp+2]
  push word cx
  push word L611
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g100
  mov dx, dx
  jmp [bp]

L613: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L614: ; Continuation
  Bare_enter_check(16)
  mov bx, dx
  cmp word [bx], 1
  jz L589
  mov si, [bx+2]
  push word si
  push word [bp+4]
  push word L612
  mov di, sp
  push word 6 ;; scanned
  push word [bp+6]
  push word cx
  push word L613
  mov cx, sp
  push word 6 ;; scanned
  mov bp, di
  mov dx, 1
  jmp [bp]

L615: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L614
  mov cx, sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L616: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L615
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g228
  mov dx, 1
  jmp [bp]

L617: ; Function: (lam,t1)
  Bare_enter_check(10)
  mov bx, dx
  cmp word [bx], 1
  jz L583
  mov si, [bx+2]
  mov di, [bx+4]
  mov bx, di
  cmp word [bx], 3
  jz L586
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L616
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+2]
  mov dx, si
  jmp [bp]

L618: ; Function: (lam,t25)
  Bare_enter_check(8)
  push word dx
  push word [bp+2]
  push word L617
  mov si, sp
  push word 6 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L619: ; Continuation
  Bare_enter_check(330)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L382
  mov si, sp
  push word 8 ;; scanned
  push word si
  push word g107
  push word 3
  mov di, sp
  push word 6 ;; scanned
  push word di
  push word g106
  push word 1
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L406
  mov [Temps+8], sp
  push word 8 ;; scanned
  push word [Temps+8]
  push word g128
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [Temps+10]
  push word g127
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
  push word L449
  mov [Temps+14], sp
  push word 18 ;; scanned
  push word [Temps+14]
  push word g141
  push word 3
  mov [Temps+16], sp
  push word 6 ;; scanned
  push word [Temps+16]
  push word g140
  push word 1
  mov [Temps+18], sp
  push word 6 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L472
  mov [Temps+20], sp
  push word 8 ;; scanned
  push word [Temps+20]
  push word g155
  push word 3
  mov [Temps+22], sp
  push word 6 ;; scanned
  push word [Temps+22]
  push word g154
  push word 1
  mov [Temps+24], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word L488
  mov [Temps+26], sp
  push word 4 ;; scanned
  push word [Temps+26]
  push word g168
  push word 3
  mov [Temps+28], sp
  push word 6 ;; scanned
  push word [Temps+28]
  push word g167
  push word 1
  mov [Temps+30], sp
  push word 6 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L525
  mov [Temps+32], sp
  push word 8 ;; scanned
  push word [Temps+32]
  push word g174
  push word 3
  mov [Temps+34], sp
  push word 6 ;; scanned
  push word [Temps+34]
  push word g173
  push word 1
  mov [Temps+36], sp
  push word 6 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L560
  mov [Temps+38], sp
  push word 8 ;; scanned
  push word [Temps+38]
  push word g195
  push word 3
  mov [Temps+40], sp
  push word 6 ;; scanned
  push word [Temps+40]
  push word g194
  push word 1
  mov [Temps+42], sp
  push word 6 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L580
  mov [Temps+44], sp
  push word 8 ;; scanned
  push word [Temps+44]
  push word g213
  push word 3
  mov [Temps+46], sp
  push word 6 ;; scanned
  push word [Temps+46]
  push word g212
  push word 1
  mov [Temps+48], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word L618
  mov [Temps+50], sp
  push word 4 ;; scanned
  push word [Temps+50]
  push word g225
  push word 3
  mov [Temps+52], sp
  push word 6 ;; scanned
  push word [Temps+52]
  push word g224
  push word 1
  mov [Temps+54], sp
  push word 6 ;; scanned
  push word g265
  push word [Temps+54]
  push word 3
  mov [Temps+56], sp
  push word 6 ;; scanned
  push word [Temps+56]
  push word g223
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
  push word g105
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

L620: ; Continuation
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
  push word L619
  mov cx, sp
  push word 22 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L621: ; Continuation
  Bare_enter_check(74)
  push word [bp+8]
  push word [bp+4]
  push word L160
  mov si, sp
  push word 6 ;; scanned
  push word g32
  mov di, sp
  push word 2 ;; scanned
  push word g33
  mov [Temps+6], sp
  push word 2 ;; scanned
  push word [Temps+6]
  push word di
  push word L215
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [bp+6]
  push word L232
  mov [Temps+10], sp
  push word 4 ;; scanned
  push word [Temps+10]
  push word [Temps+8]
  push word [Temps+6]
  push word di
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L345
  mov [Temps+12], sp
  push word 18 ;; scanned
  push word [Temps+12]
  push word [Temps+8]
  push word [Temps+6]
  push word di
  push word si
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L620
  mov cx, sp
  push word 22 ;; scanned
  mov bp, [bp+8]
  mov dx, g101
  jmp [bp]

L622: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L621
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g1
  mov dx, g22
  jmp [bp]

L623: ; Continuation
  Bare_enter_check(10)
  push word dx
  push word [bp+4]
  push word cx
  push word L622
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g1
  mov dx, g14
  jmp [bp]

L624: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word cx
  push word L623
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g1
  mov dx, g12
  jmp [bp]

L625: ; Start
  Bare_enter_check(6)
  push word cx
  push word L624
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
  dw 3
  db `{`
g66:
  dw 1
g67:
  dw L96
g68:
  dw 1
g69:
  dw 1
g70:
  dw L100
g71:
  dw 1
g72:
  dw 1
g73:
  dw 3
  db `}`
g74:
  dw 5
  db `% `
g75:
  dw 1
g76:
  dw 1
g77:
  dw 3
g78:
  dw 1
g79:
  dw 1
g80:
  dw 1
g81:
  dw 1
g82:
  dw 1
g83:
  dw 1
g84:
  dw 35
  db `command not found`
g85:
  dw 3
  db `\n`
g86:
  dw 1
g87:
  dw 5
  db `: `
g88:
  dw 1
g89:
  dw 1
g90:
  dw 13
  db `sham: `
g91:
  dw 1
g92:
  dw 35
  db `Permission denied`
g93:
  dw 3
  db `\n`
g94:
  dw 1
g95:
  dw 5
  db `: `
g96:
  dw 1
g97:
  dw 1
g98:
  dw 13
  db `sham: `
g99:
  dw 1
g100:
  dw L104
g101:
  dw 103
  db `Sham: In-memory file-system. Consider typing "ls".\n`
g102:
  dw 13
  db `readme`
g103:
  dw 165
  db `Welcome to sham; please try all the commands!\nCan you find the hidden Easter Egg?\n`
g104:
  dw 1, g103
g105:
  dw 1, g102, g104
g106:
  dw 7
  db `cat`
g107:
  dw 115
  db `cat - concatenate files and print on the standard output\n`
g108:
  dw 67
  db `cat: takes at least one argument\n`
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
  dw 1
g119:
  dw 11
  db `cat: `
g120:
  dw 59
  db ` : No such file or directory\n`
g121:
  dw 1
g122:
  dw 3, g120, g121
g123:
  dw 11
  db `cat: `
g124:
  dw 39
  db ` : Not a data file\n`
g125:
  dw 1
g126:
  dw 3, g124, g125
g127:
  dw 5
  db `cp`
g128:
  dw 65
  db `cp - copy files and directories\n`
g129:
  dw 51
  db `cp: missing file operand\n`
g130:
  dw 89
  db `cp: missing destination file operand after '`
g131:
  dw 5
  db `'\n`
g132:
  dw 1
g133:
  dw 3, g131, g132
g134:
  dw 61
  db `cp: unexpected extra operands\n`
g135:
  dw 1
g136:
  dw 35
  db `cp: cannot stat '`
g137:
  dw 59
  db `': No such file or directory\n`
g138:
  dw 1
g139:
  dw 3, g137, g138
g140:
  dw 13
  db `create`
g141:
  dw 55
  db `create - create a new file\n`
g142:
  dw 53
  db `create: missing file name\n`
g143:
  dw 69
  db `create: unexpected extra operands\n`
g144:
  dw 69
  db `(to finish type ^D on a new line)\n`
g145:
  dw 1
g146:
  dw 1
g147:
  dw 3
g148:
  dw 1
g149:
  dw 1
g150:
  dw 1
g151:
  dw 3
  db `\n`
g152:
  dw 1
g153:
  dw 1
g154:
  dw 9
  db `file`
g155:
  dw 55
  db `file - determine file type\n`
g156:
  dw 69
  db `file: takes at least one argument\n`
g157:
  dw 1
g158:
  dw 59
  db ` : No such file or directory\n`
g159:
  dw 1
g160:
  dw 3, g158, g159
g161:
  dw 27
  db `: ASCII text\n`
g162:
  dw 1
g163:
  dw 3, g161, g162
g164:
  dw 27
  db `: executable\n`
g165:
  dw 1
g166:
  dw 3, g164, g165
g167:
  dw 5
  db `ls`
g168:
  dw 59
  db `ls - list directory contents\n`
g169:
  dw 47
  db `ls: takes no arguments\n`
g170:
  dw L105
g171:
  dw 1
g172:
  dw 1
g173:
  dw 7
  db `man`
g174:
  dw 103
  db `man - an interface to the system reference manuals\n`
g175:
  dw 61
  db `What manual page do you want?\n`
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
  dw 1
g186:
  dw 41
  db `No manual entry for `
g187:
  dw 3
  db `\n`
g188:
  dw 1
g189:
  dw 3, g187, g188
g190:
  dw 41
  db `No manual entry for `
g191:
  dw 3
  db `\n`
g192:
  dw 1
g193:
  dw 3, g191, g192
g194:
  dw 5
  db `mv`
g195:
  dw 51
  db `mv - move (rename) files\n`
g196:
  dw 51
  db `mv: missing file operand\n`
g197:
  dw 89
  db `mv: missing destination file operand after '`
g198:
  dw 5
  db `'\n`
g199:
  dw 1
g200:
  dw 3, g198, g199
g201:
  dw 61
  db `mv: unexpected extra operands\n`
g202:
  dw 1
g203:
  dw 35
  db `mv: cannot stat '`
g204:
  dw 59
  db `': No such file or directory\n`
g205:
  dw 1
g206:
  dw 3, g204, g205
g207:
  dw 39
  db `rm: cannot remove '`
g208:
  dw 59
  db `': No such file or directory\n`
g209:
  dw 1
g210:
  dw 3, g208, g209
g211:
  dw 1
g212:
  dw 5
  db `rm`
g213:
  dw 133
  db `rm - remove files or directories (directories not supported yet!)\n`
g214:
  dw 41
  db `rm: missing operand\n`
g215:
  dw 39
  db `rm: cannot remove '`
g216:
  dw 59
  db `': No such file or directory\n`
g217:
  dw 1
g218:
  dw 3, g216, g217
g219:
  dw 1
g220:
  dw 7
  db `cat`
g221:
  dw 439
  db `I have a little shadow that goes in and out with me,\nAnd what can be the use of him is more than I can see.\nHe is very, very like me from the heels up to the head;\nAnd I see him jump before me, when I jump into my bed.\n`
g222:
  dw 1, g221
g223:
  dw 1, g220, g222
g224:
  dw 7
  db `fib`
g225:
  dw 101
  db `fib - naive fib computation upto the given number\n`
g226:
  dw 45
  db `fib: missing argument\n`
g227:
  dw 69
  db `create: unexpected extra argument\n`
g228:
  dw L117
g229:
  dw 1
g230:
  dw 3
g231:
  dw 1
g232:
  dw 3
g233:
  dw 1
g234:
  dw 1
g235:
  dw 1
g236:
  dw 63
  db `fib: expected numeric argument\n`
g237:
  dw 1
g238:
  dw 9
  db `fib `
g239:
  dw L121
g240:
  dw 1
g241:
  dw 1
g242:
  dw L125
g243:
  dw 1
g244:
  dw 1
g245:
  dw 11
  db ` --> `
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
  dw 11
  db `space`
g253:
  dw 95
  db `space - where is the stack-pointer? (in words)\n`
g254:
  dw 1
g255:
  dw L137
g256:
  dw 1
g257:
  dw 1
g258:
  dw L141
g259:
  dw 1
g260:
  dw 1
g261:
  dw L151
g262:
  dw 3, g253, g261
g263:
  dw 1, g252, g262
g264:
  dw 1
g265:
  dw 3, g263, g264

bare_start: jmp L625
