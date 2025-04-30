L1: ; Function: (lam,t1)
  mov bp, [bp+2]
  mov dx, dx
  jmp [bp]

L2: ; Function: (block,g1)
  push word dx
  push word L1
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L3: ; Arm: 22'7
  mov dx, 0
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L4: ; Continuation
  call Bare_enter_check
  mov ax, 1
  add ax, dx
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L5: ; Function: (length,g2)
  mov bx, dx
  cmp word [bx], 0
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
  call Bare_enter_check
  push word dx
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L8: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word cx
  push word L7
  mov cx, sp
  push word 6 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L9: ; Continuation
  call Bare_enter_check
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
  mov bx, dx
  cmp word [bx], 0
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
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L14: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word cx
  push word L13
  mov cx, sp
  push word 6 ;; scanned
  mov dx, [bp+4]
  mov bp, g5
  jmp [bp]

L15: ; Function: (lam,t1)
  mov bx, dx
  cmp word [bx], 0
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
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L19: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word cx
  push word L18
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L20: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L19
  mov cx, sp
  push word 8 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+6]
  jmp [bp]

L21: ; Continuation
  call Bare_enter_check
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
  mov bx, dx
  cmp word [bx], 0
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
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L27: ; Function: (lam,t1)
  mov bx, dx
  cmp word [bx], 0
  jz L25
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [bp+2]
  push word [Temps+2]
  push word 1
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
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L31: ; Function: (lam,t1)
  mov bx, dx
  cmp word [bx], 0
  jz L29
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [bp+2]
  mov si, [bp+4]
  mov bx, [Temps+2]
  call Bare_set_bytes
  mov ax, [bp+4]
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
  call Bare_enter_check
  mov ax, [bp+4]
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L34: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word cx
  push word L33
  mov cx, sp
  push word 6 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L35: ; Continuation
  call Bare_enter_check
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
  mov dx, 0
  jmp [bp]

L36: ; Function: (lam,g10)
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
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L39: ; Function: (lam,t1)
  mov bx, dx
  cmp word [bx], 0
  jz L37
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [bp+2]
  mov si, [bp+4]
  mov bx, [Temps+2]
  call Bare_set_bytes
  mov ax, [bp+4]
  sub ax, 1
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
  call Bare_enter_check
  mov ax, [bp+4]
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L42: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word cx
  push word L41
  mov cx, sp
  push word 6 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L43: ; Continuation
  call Bare_enter_check
  mov ax, dx
  call Bare_make_bytes
  mov [Temps+2], ax
  push word [Temps+2]
  push word L40
  mov [Temps+4], sp
  push word 4 ;; scanned
  mov ax, dx
  sub ax, 1
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
  call Bare_enter_check
  mov ax, [bp+4]
  sub ax, 1
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L47: ; Function: (lam,t1)
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L45
  mov ax, [bp+2]
  mov bx, dx
  call Bare_get_bytes
  mov [Temps+4], ax
  push word [bp+4]
  push word [Temps+4]
  push word 1
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
  call Bare_enter_check
  mov ax, [bp+4]
  sub ax, 1
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L50: ; Function: (lam,g14)
  push word dx
  push word L48
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, dx
  call Bare_string_length
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
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L53
  mov ax, [bp+4]
  sub ax, 1
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
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L52
  mov ax, [bp+2]
  mov bx, dx
  call Bare_get_bytes
  mov [Temps+4], ax
  mov ax, [bp+4]
  mov bx, dx
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
  cmp word [bx], 1
  jz L55
  mov dx, g20
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L57: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L51
  push word [bp+6]
  push word [bp+4]
  push word L56
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov ax, [bp+8]
  sub ax, 1
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
  mov ax, [bp+2]
  call Bare_string_length
  mov [Temps+2], ax
  mov ax, dx
  call Bare_string_length
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
  cmp word [bx], 1
  jz L58
  mov dx, g16
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L60: ; Function: (lam,g22)
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
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, g25
  jmp [bp]

L63: ; Arm: 105'19
  mov ax, [Temps+2]
  call Bare_put_char
  mov dx, [Temps+10]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L64: ; Arm: 106'22
  mov ax, [Temps+2]
  call Bare_put_char
  mov dx, [Temps+12]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L65: ; Arm: 107'16
  mov ax, [Temps+2]
  call Bare_put_char
  mov dx, [Temps+14]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L66: ; Function: (put_chars,g25)
  mov bx, dx
  cmp word [bx], 0
  jz L61
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [Temps+2]
  call Bare_char_to_num
  mov [Temps+6], ax
  mov ax, [Temps+6]
  cmp word ax, 8
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  push word [Temps+4]
  push word cx
  push word L62
  mov cx, sp
  push word 6 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 1
  jz L63
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 1
  jz L64
  mov ax, 26
  cmp word ax, [Temps+6]
  call Bare_make_bool_from_n
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 1
  jz L65
  mov ax, `^`
  call Bare_put_char
  mov ax, 65
  add ax, [Temps+6]
  mov [Temps+16], ax
  mov ax, [Temps+16]
  sub ax, 1
  mov [Temps+18], ax
  mov ax, [Temps+18]
  call Bare_num_to_char
  mov [Temps+20], ax
  mov ax, [Temps+20]
  call Bare_put_char
  mov dx, [Temps+22]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L67: ; Arm: 346'11
  mov dx, dx
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L68: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  add ax, dx
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L69: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  sub ax, 2
  mov [Temps+2], ax
  push word dx
  push word cx
  push word L68
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g55
  mov dx, [Temps+2]
  jmp [bp]

L70: ; Function: (fib,g55)
  mov ax, dx
  cmp word ax, 2
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L67
  mov ax, dx
  sub ax, 1
  mov [Temps+4], ax
  push word dx
  push word cx
  push word L69
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g55
  mov dx, [Temps+4]
  jmp [bp]

L71: ; Function: (lam,g126)
  mov bx, dx
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L72: ; Arm: 368'9
  push word [bp+2]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L73: ; Arm: 371'15
  mov dx, g191
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L74: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L75: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 0
  jz L73
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, 10
  mov bx, [bp+4]
  mul bx
  mov [Temps+4], ax
  mov ax, [Temps+4]
  add ax, [Temps+2]
  mov [Temps+6], ax
  push word [bp+6]
  push word cx
  push word L74
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g184
  mov dx, [Temps+6]
  jmp [bp]

L76: ; Arm: 363'27
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L77: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L76
  mov dx, g189
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L78: ; Arm: 8'9
  mov dx, g187
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L79: ; Arm: 363'12
  mov ax, 9
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+8]
  push word cx
  push word L77
  mov cx, sp
  push word 6 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L78
  mov dx, g188
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L80: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L75
  mov cx, sp
  push word 8 ;; scanned
  mov bx, dx
  cmp word [bx], 1
  jz L79
  mov dx, g190
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L81: ; Arm: 8'9
  mov dx, g185
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L82: ; Function: (lam,t1)
  mov bx, dx
  cmp word [bx], 0
  jz L72
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [Temps+2]
  call Bare_char_to_num
  mov [Temps+6], ax
  mov ax, [Temps+6]
  sub ax, 48
  mov [Temps+8], ax
  mov ax, [Temps+8]
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [Temps+10], ax
  push word [Temps+8]
  push word [Temps+4]
  push word [bp+2]
  push word cx
  push word L80
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [Temps+10]
  cmp word [bx], 1
  jz L81
  mov dx, g186
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L83: ; Function: (loop,g184)
  push word dx
  push word L82
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L84: ; Arm: 121'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L85: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 10
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L86: ; Function: (lam,t1)
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L84
  mov ax, dx
  mov bx, 10
  push word dx ;; save
  mov dx, 0
  div bx
  mov [Temps+4], dx
  pop word dx ;; restore
  mov ax, 48
  add ax, [Temps+4]
  mov [Temps+6], ax
  mov ax, [Temps+6]
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 1
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L85
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g195
  mov dx, [Temps+10]
  jmp [bp]

L87: ; Function: (loop,g195)
  push word dx
  push word L86
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L88: ; Arm: 121'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L89: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 10
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L90: ; Function: (lam,t1)
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L88
  mov ax, dx
  mov bx, 10
  push word dx ;; save
  mov dx, 0
  div bx
  mov [Temps+4], dx
  pop word dx ;; restore
  mov ax, 48
  add ax, [Temps+4]
  mov [Temps+6], ax
  mov ax, [Temps+6]
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 1
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L89
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g198
  mov dx, [Temps+10]
  jmp [bp]

L91: ; Function: (loop,g198)
  push word dx
  push word L90
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L92: ; Arm: 121'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L93: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 10
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L94: ; Function: (lam,t1)
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L92
  mov ax, dx
  mov bx, 10
  push word dx ;; save
  mov dx, 0
  div bx
  mov [Temps+4], dx
  pop word dx ;; restore
  mov ax, 48
  add ax, [Temps+4]
  mov [Temps+6], ax
  mov ax, [Temps+6]
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 1
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L93
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g202
  mov dx, [Temps+10]
  jmp [bp]

L95: ; Function: (loop,g202)
  push word dx
  push word L94
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L96: ; Arm: 121'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L97: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 10
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L98: ; Function: (lam,t1)
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L96
  mov ax, dx
  mov bx, 10
  push word dx ;; save
  mov dx, 0
  div bx
  mov [Temps+4], dx
  pop word dx ;; restore
  mov ax, 48
  add ax, [Temps+4]
  mov [Temps+6], ax
  mov ax, [Temps+6]
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 1
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L97
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g205
  mov dx, [Temps+10]
  jmp [bp]

L99: ; Function: (loop,g205)
  push word dx
  push word L98
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L100: ; Arm: 121'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L101: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 10
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L102: ; Function: (lam,t1)
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L100
  mov ax, dx
  mov bx, 10
  push word dx ;; save
  mov dx, 0
  div bx
  mov [Temps+4], dx
  pop word dx ;; restore
  mov ax, 48
  add ax, [Temps+4]
  mov [Temps+6], ax
  mov ax, [Temps+6]
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 1
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
  push word dx
  push word L102
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L104: ; Arm: 121'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L105: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 10
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L106: ; Function: (lam,t1)
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L104
  mov ax, dx
  mov bx, 10
  push word dx ;; save
  mov dx, 0
  div bx
  mov [Temps+4], dx
  pop word dx ;; restore
  mov ax, 48
  add ax, [Temps+4]
  mov [Temps+6], ax
  mov ax, [Temps+6]
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 1
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
  push word dx
  push word L106
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L108: ; Continuation
  call Bare_enter_check
  mov ax, `\n`
  call Bare_put_char
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L109: ; Continuation
  call Bare_enter_check
  push word dx
  push word `-`
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, [Temps+2]
  jmp [bp]

L110: ; Arm: 124'11
  push word g212
  push word `0`
  push word 1
  mov [Temps+10], sp
  push word 6 ;; scanned
  mov dx, [Temps+10]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L111: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L112: ; Arm: 128'2
  mov ax, 0
  sub ax, [Temps+2]
  mov [Temps+6], ax
  mov ax, [Temps+6]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  push word cx
  push word L109
  mov cx, sp
  push word 4 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 1
  jz L110
  push word [Temps+6]
  push word cx
  push word L111
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g211
  mov dx, g213
  jmp [bp]

L113: ; Continuation
  call Bare_enter_check
  mov bp, g25
  mov dx, dx
  jmp [bp]

L114: ; Arm: 124'11
  push word g215
  push word `0`
  push word 1
  mov [Temps+8], sp
  push word 6 ;; scanned
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L115: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L116: ; Function: (lam,t1)
  mov ax, sp
  call Bare_addr_to_num
  mov [Temps+2], ax
  mov ax, [Temps+2]
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [Temps+4], ax
  push word [bp+2]
  push word cx
  push word L108
  mov cx, sp
  push word 6 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 1
  jz L112
  mov ax, [Temps+2]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word cx
  push word L113
  mov cx, sp
  push word 4 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 1
  jz L114
  push word [Temps+2]
  push word cx
  push word L115
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g214
  mov dx, g216
  jmp [bp]

L117: ; Function: (lam,g217)
  push word dx
  push word L116
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L118: ; Arm: 96'7
  mov dx, g23
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L119: ; Continuation
  call Bare_enter_check
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L120: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L119
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L121: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L120
  mov cx, sp
  push word 8 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  jmp [bp]

L122: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word dx
  push word [bp+4]
  push word cx
  push word L121
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g8
  mov dx, g24
  jmp [bp]

L123: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L122
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L124: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+4]
  push word cx
  push word L123
  mov cx, sp
  push word 8 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L125: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L124
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L126: ; Function: (concat,t1)
  mov bx, dx
  cmp word [bx], 0
  jz L118
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+2]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L125
  mov cx, sp
  push word 10 ;; scanned
  mov bp, bp
  mov dx, [Temps+4]
  jmp [bp]

L127: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word dx
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L128: ; Arm: 166'11
  push word [bp+6]
  push word cx
  push word L127
  mov cx, sp
  push word 6 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+2]
  jmp [bp]

L129: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L130: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word dx
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word cx
  push word L129
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, [Temps+2]
  jmp [bp]

L131: ; Arm: 168'26
  push word [Temps+4]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L130
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+2]
  jmp [bp]

L132: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L133: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word [bp+6]
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word cx
  push word L132
  mov cx, sp
  push word 6 ;; scanned
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L134: ; Function: (lam,t1)
  mov bx, dx
  cmp word [bx], 0
  jz L128
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [Temps+2]
  cmp word ax, ` `
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov bx, [Temps+6]
  cmp word [bx], 1
  jz L131
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+10]
  push word cx
  push word L133
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+6]
  mov bp, [bp+8]
  jmp [bp]

L135: ; Function: (lam,t1)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L134
  mov [Temps+2], sp
  push word 12 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L136: ; Function: (have_letter,t1)
  push word bp
  push word dx
  push word [bp+4]
  push word [bp+2]
  push word L135
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L137: ; Arm: 173'9
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L138: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L139: ; Arm: 175'24
  push word [Temps+4]
  push word cx
  push word L138
  mov cx, sp
  push word 6 ;; scanned
  mov dx, [bp+2]
  mov bp, [bp+4]
  jmp [bp]

L140: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L141: ; Continuation
  call Bare_enter_check
  push word g27
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+6]
  push word cx
  push word L140
  mov cx, sp
  push word 6 ;; scanned
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L142: ; Function: (lam,t2)
  mov bx, dx
  cmp word [bx], 0
  jz L137
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [Temps+2]
  cmp word ax, ` `
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov bx, [Temps+6]
  cmp word [bx], 1
  jz L139
  push word [Temps+4]
  push word [Temps+2]
  push word cx
  push word L141
  mov cx, sp
  push word 8 ;; scanned
  mov dx, [bp+2]
  mov bp, [bp+6]
  jmp [bp]

L143: ; Function: (at_word_start,t2)
  push word bp
  push word [bp+2]
  push word L136
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word bp
  push word dx
  push word L142
  mov [Temps+4], sp
  push word 8 ;; scanned
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L144: ; Arm: 147'22
  mov ax, `\n`
  call Bare_put_char
  mov bp, [bp+2]
  mov dx, dx
  jmp [bp]

L145: ; Arm: 148'28
  mov ax, `^`
  call Bare_put_char
  mov ax, `D`
  call Bare_put_char
  mov ax, `\n`
  call Bare_put_char
  push word dx
  push word `\x04`
  push word 1
  mov [Temps+16], sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+16]
  jmp [bp]

L146: ; Arm: 149'19
  mov bp, bp
  mov dx, dx
  jmp [bp]

L147: ; Arm: 152'17
  mov bp, bp
  mov dx, dx
  jmp [bp]

L148: ; Continuation
  call Bare_enter_check
  mov ax, `\x08`
  call Bare_put_char
  mov ax, ` `
  call Bare_put_char
  mov ax, `\x08`
  call Bare_put_char
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L149: ; Arm: 154'31
  mov ax, `\x08`
  call Bare_put_char
  mov ax, ` `
  call Bare_put_char
  mov ax, `\x08`
  call Bare_put_char
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L150: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L148
  mov cx, sp
  push word 8 ;; scanned
  mov bx, dx
  cmp word [bx], 1
  jz L149
  mov dx, g33
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L151: ; Arm: 8'9
  mov dx, g31
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L152: ; Arm: 150'21
  mov bx, dx
  cmp word [bx], 0
  jz L147
  mov ax, [bx+2]
  mov [Temps+14], ax
  mov ax, [bx+4]
  mov [Temps+16], ax
  mov ax, [Temps+14]
  call Bare_char_to_num
  mov [Temps+18], ax
  mov ax, 26
  cmp word ax, [Temps+18]
  call Bare_make_bool_from_n
  mov [Temps+20], ax
  push word [Temps+16]
  push word bp
  push word cx
  push word L150
  mov cx, sp
  push word 8 ;; scanned
  mov bx, [Temps+20]
  cmp word [bx], 1
  jz L151
  mov dx, g32
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L153: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word [bp+8]
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+2]
  jmp [bp]

L154: ; Arm: 105'19
  mov ax, [Temps+2]
  call Bare_put_char
  mov dx, [Temps+18]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L155: ; Arm: 106'22
  mov ax, [Temps+2]
  call Bare_put_char
  mov dx, [Temps+20]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L156: ; Arm: 107'16
  mov ax, [Temps+2]
  call Bare_put_char
  mov dx, [Temps+22]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L157: ; Function: (readloop,t1)
  call Bare_get_char
  mov [Temps+2], ax
  mov ax, [Temps+2]
  call Bare_char_to_num
  mov [Temps+4], ax
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov bx, [Temps+6]
  cmp word [bx], 1
  jz L144
  mov ax, [Temps+2]
  cmp word ax, `\x04`
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 1
  jz L145
  mov ax, 127
  cmp word ax, [Temps+4]
  call Bare_make_bool_from_n
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 1
  jz L146
  mov ax, [Temps+4]
  cmp word ax, 127
  call Bare_make_bool_from_z
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 1
  jz L152
  mov ax, [Temps+2]
  call Bare_char_to_num
  mov [Temps+14], ax
  mov ax, [Temps+14]
  cmp word ax, 8
  call Bare_make_bool_from_z
  mov [Temps+16], ax
  push word [Temps+2]
  push word bp
  push word dx
  push word cx
  push word L153
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [Temps+16]
  cmp word [bx], 1
  jz L154
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+18], ax
  mov bx, [Temps+18]
  cmp word [bx], 1
  jz L155
  mov ax, 26
  cmp word ax, [Temps+14]
  call Bare_make_bool_from_n
  mov [Temps+20], ax
  mov bx, [Temps+20]
  cmp word [bx], 1
  jz L156
  mov ax, `^`
  call Bare_put_char
  mov ax, 65
  add ax, [Temps+14]
  mov [Temps+24], ax
  mov ax, [Temps+24]
  sub ax, 1
  mov [Temps+26], ax
  mov ax, [Temps+26]
  call Bare_num_to_char
  mov [Temps+28], ax
  mov ax, [Temps+28]
  call Bare_put_char
  mov dx, [Temps+30]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L158: ; Arm: 229'36
  mov dx, g35
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L159: ; Continuation
  call Bare_enter_check
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L160: ; Arm: 221'7
  mov dx, [bp+10]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L161: ; Arm: 192'9
  mov dx, g38
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L162: ; Arm: 196'35
  push word [bp+8]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L163: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L162
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L164: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L163
  mov cx, sp
  push word 10 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L165: ; Function: (loop,t3)
  mov bx, dx
  cmp word [bx], 0
  jz L161
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
  push word L164
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+6]
  jmp [bp]

L166: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L167: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L166
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L168: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word cx
  push word L167
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L169: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L168
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L170: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L169
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L171: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L170
  mov cx, sp
  push word 12 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  jmp [bp]

L172: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L171
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g8
  mov dx, g46
  jmp [bp]

L173: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L172
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L174: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L173
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L175: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L174
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, g45
  jmp [bp]

L176: ; Continuation
  call Bare_enter_check
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
  call Bare_enter_check
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
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L177
  mov cx, sp
  push word 12 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  jmp [bp]

L179: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L178
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g8
  mov dx, g44
  jmp [bp]

L180: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L179
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L181: ; Continuation
  call Bare_enter_check
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
  call Bare_enter_check
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
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L182
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L184: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L183
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L185: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L184
  mov cx, sp
  push word 14 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  jmp [bp]

L186: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L185
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g8
  mov dx, g43
  jmp [bp]

L187: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L186
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L188: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L187
  mov cx, sp
  push word 14 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L189: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L188
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, g42
  jmp [bp]

L190: ; Continuation
  call Bare_enter_check
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
  call Bare_enter_check
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L190
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L192: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L191
  mov cx, sp
  push word 14 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  jmp [bp]

L193: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L192
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g8
  mov dx, g41
  jmp [bp]

L194: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L193
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L195: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L194
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, g40
  jmp [bp]

L196: ; Arm: 213'9
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L195
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, g39
  jmp [bp]

L197: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L198: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L197
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L199: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word cx
  push word L198
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L200: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L199
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L201: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L200
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L202: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L201
  mov cx, sp
  push word 12 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  jmp [bp]

L203: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L202
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g8
  mov dx, g54
  jmp [bp]

L204: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L203
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L205: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L204
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L206: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L205
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, g53
  jmp [bp]

L207: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L206
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L208: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L207
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L209: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L208
  mov cx, sp
  push word 12 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  jmp [bp]

L210: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L209
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g8
  mov dx, g52
  jmp [bp]

L211: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L210
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L212: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L211
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L213: ; Continuation
  call Bare_enter_check
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
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L213
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L215: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L214
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L216: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L215
  mov cx, sp
  push word 14 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  jmp [bp]

L217: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L216
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g8
  mov dx, g51
  jmp [bp]

L218: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L217
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L219: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L218
  mov cx, sp
  push word 14 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L220: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L219
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, g50
  jmp [bp]

L221: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L220
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L222: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L221
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L223: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L222
  mov cx, sp
  push word 14 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  jmp [bp]

L224: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L223
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g8
  mov dx, g49
  jmp [bp]

L225: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L224
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L226: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L225
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, g48
  jmp [bp]

L227: ; Arm: 216'14
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L226
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, g47
  jmp [bp]

L228: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L229: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 0
  jz L196
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 0
  jz L227
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [bp+12]
  push word cx
  push word L228
  mov cx, sp
  push word 6 ;; scanned
  mov dx, [bp+8]
  mov bp, [Temps+6]
  jmp [bp]

L230: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L229
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L231: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word cx
  push word L159
  mov cx, sp
  push word 6 ;; scanned
  mov bx, dx
  cmp word [bx], 0
  jz L160
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+2]
  push word [bp+8]
  push word L165
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L230
  mov cx, sp
  push word 16 ;; scanned
  mov bx, [bp+10]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L232: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L231
  mov cx, sp
  push word 14 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  jmp [bp]

L233: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L232
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g8
  mov dx, g37
  jmp [bp]

L234: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L233
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L235: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L234
  mov cx, sp
  push word 16 ;; scanned
  mov dx, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L236: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L158
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L235
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+10]
  mov dx, g36
  jmp [bp]

L237: ; Continuation
  call Bare_enter_check
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L236
  mov cx, sp
  push word 18 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+16]
  jmp [bp]

L238: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L237
  mov cx, sp
  push word 20 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L239: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word L157
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L238
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [Temps+2]
  mov dx, g34
  jmp [bp]

L240: ; Continuation
  call Bare_enter_check
  push word g29
  push word `\x04`
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L239
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+4]
  mov dx, [Temps+2]
  jmp [bp]

L241: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L240
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L242: ; Function: (mainloop,t3)
  push word bp
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L241
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+6]
  mov dx, g28
  jmp [bp]

L243: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L244: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L243
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L245: ; Arm: 250'7
  push word [bp+8]
  push word cx
  push word L244
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g63
  jmp [bp]

L246: ; Arm: 192'9
  mov dx, g64
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L247: ; Arm: 196'35
  push word [bp+8]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L248: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L247
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L249: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L248
  mov cx, sp
  push word 10 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L250: ; Function: (loop,t3)
  mov bx, dx
  cmp word [bx], 0
  jz L246
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
  push word L249
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+6]
  jmp [bp]

L251: ; Arm: 192'9
  mov dx, g73
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L252: ; Arm: 196'35
  push word [bp+8]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L253: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L252
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L254: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L253
  mov cx, sp
  push word 10 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L255: ; Function: (loop,t1)
  mov bx, dx
  cmp word [bx], 0
  jz L251
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
  push word L254
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+6]
  jmp [bp]

L256: ; Continuation
  call Bare_enter_check
  mov bp, g25
  mov dx, dx
  jmp [bp]

L257: ; Continuation
  call Bare_enter_check
  push word cx
  push word L256
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L258: ; Arm: 243'11
  push word g77
  push word [bp+8]
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g74
  push word 1
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L257
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+4]
  jmp [bp]

L259: ; Continuation
  call Bare_enter_check
  mov bp, g25
  mov dx, dx
  jmp [bp]

L260: ; Arm: 246'16
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word cx
  push word L259
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, [Temps+4]
  jmp [bp]

L261: ; Continuation
  call Bare_enter_check
  mov bp, g25
  mov dx, dx
  jmp [bp]

L262: ; Continuation
  call Bare_enter_check
  push word cx
  push word L261
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L263: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 0
  jz L258
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 0
  jz L260
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word g81
  push word [bp+8]
  push word 1
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [Temps+8]
  push word g78
  push word 1
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L262
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+10]
  jmp [bp]

L264: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L263
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L265: ; Function: (lam,t1)
  push word dx
  push word [bp+4]
  push word L255
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word dx
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L264
  mov cx, sp
  push word 12 ;; scanned
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L266: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L267: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L266
  mov cx, sp
  push word 6 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+6]
  jmp [bp]

L268: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L265
  mov [Temps+2], sp
  push word 10 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word cx
  push word L267
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g5
  mov dx, [Temps+2]
  jmp [bp]

L269: ; Continuation
  call Bare_enter_check
  mov bp, g25
  mov dx, dx
  jmp [bp]

L270: ; Continuation
  call Bare_enter_check
  push word cx
  push word L269
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L271: ; Arm: 243'11
  push word g68
  push word [bp+12]
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g65
  push word 1
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L270
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+8]
  mov dx, [Temps+4]
  jmp [bp]

L272: ; Continuation
  call Bare_enter_check
  mov bp, g25
  mov dx, dx
  jmp [bp]

L273: ; Arm: 246'16
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word cx
  push word L272
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, [Temps+4]
  jmp [bp]

L274: ; Continuation
  call Bare_enter_check
  mov bp, g25
  mov dx, dx
  jmp [bp]

L275: ; Continuation
  call Bare_enter_check
  push word cx
  push word L274
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L276: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L268
  mov cx, sp
  push word 14 ;; scanned
  mov bx, dx
  cmp word [bx], 0
  jz L271
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 0
  jz L273
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word g72
  push word [bp+12]
  push word 1
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [Temps+8]
  push word g69
  push word 1
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L275
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+8]
  mov dx, [Temps+10]
  jmp [bp]

L277: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L276
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+16]
  mov dx, dx
  jmp [bp]

L278: ; Function: (lam,t1)
  mov bx, dx
  cmp word [bx], 0
  jz L245
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+2]
  push word [bp+4]
  push word L250
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
  push word L277
  mov cx, sp
  push word 18 ;; scanned
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L279: ; Function: (lam,t1)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L278
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L280: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L281: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L280
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L282: ; Arm: 287'7
  push word [bp+8]
  push word cx
  push word L281
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g84
  jmp [bp]

L283: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L284: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L283
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L285: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word cx
  push word L284
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L286: ; Arm: 290'10
  push word g88
  push word [Temps+2]
  push word 1
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word g85
  push word 1
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word [bp+2]
  push word cx
  push word L285
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+8]
  jmp [bp]

L287: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L288: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L287
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L289: ; Arm: 293'12
  mov ax, [bx+2]
  mov [Temps+10], ax
  mov ax, [bx+4]
  mov [Temps+12], ax
  push word [bp+8]
  push word cx
  push word L288
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g89
  jmp [bp]

L290: ; Arm: 192'9
  mov dx, g90
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L291: ; Arm: 196'35
  push word [bp+8]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L292: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L291
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L293: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L292
  mov cx, sp
  push word 10 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L294: ; Function: (loop,t5)
  mov bx, dx
  cmp word [bx], 0
  jz L290
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
  push word L293
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+6]
  jmp [bp]

L295: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L296: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L295
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L297: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word cx
  push word L296
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L298: ; Arm: 296'15
  push word g94
  push word [bp+10]
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g91
  push word 1
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L297
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+4]
  jmp [bp]

L299: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word 0
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word dx
  push word [Temps+2]
  push word 1
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [Temps+4]
  push word 0
  mov [Temps+6], sp
  push word 4 ;; scanned
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L300: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 0
  jz L298
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [bp+12]
  push word cx
  push word L299
  mov cx, sp
  push word 8 ;; scanned
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L301: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L300
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L302: ; Function: (lam,t1)
  mov bx, dx
  cmp word [bx], 0
  jz L282
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 0
  jz L286
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 1
  jz L289
  push word [Temps+2]
  push word [bp+4]
  push word L294
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [Temps+10]
  push word [Temps+6]
  push word [Temps+2]
  push word [bp+8]
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L301
  mov cx, sp
  push word 16 ;; scanned
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+12], ax
  mov dx, [Temps+12]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L303: ; Function: (lam,t4)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L302
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L304: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L305: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L304
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L306: ; Arm: 330'7
  push word [bp+12]
  push word cx
  push word L305
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, g97
  jmp [bp]

L307: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L308: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L307
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L309: ; Arm: 333'12
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [bp+12]
  push word cx
  push word L308
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, g98
  jmp [bp]

L310: ; Arm: 147'22
  mov ax, `\n`
  call Bare_put_char
  mov bp, [bp+2]
  mov dx, dx
  jmp [bp]

L311: ; Arm: 148'28
  mov ax, `^`
  call Bare_put_char
  mov ax, `D`
  call Bare_put_char
  mov ax, `\n`
  call Bare_put_char
  push word dx
  push word `\x04`
  push word 1
  mov [Temps+16], sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+16]
  jmp [bp]

L312: ; Arm: 149'19
  mov bp, bp
  mov dx, dx
  jmp [bp]

L313: ; Arm: 152'17
  mov bp, bp
  mov dx, dx
  jmp [bp]

L314: ; Continuation
  call Bare_enter_check
  mov ax, `\x08`
  call Bare_put_char
  mov ax, ` `
  call Bare_put_char
  mov ax, `\x08`
  call Bare_put_char
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L315: ; Arm: 154'31
  mov ax, `\x08`
  call Bare_put_char
  mov ax, ` `
  call Bare_put_char
  mov ax, `\x08`
  call Bare_put_char
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L316: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L314
  mov cx, sp
  push word 8 ;; scanned
  mov bx, dx
  cmp word [bx], 1
  jz L315
  mov dx, g104
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L317: ; Arm: 8'9
  mov dx, g102
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L318: ; Arm: 150'21
  mov bx, dx
  cmp word [bx], 0
  jz L313
  mov ax, [bx+2]
  mov [Temps+14], ax
  mov ax, [bx+4]
  mov [Temps+16], ax
  mov ax, [Temps+14]
  call Bare_char_to_num
  mov [Temps+18], ax
  mov ax, 26
  cmp word ax, [Temps+18]
  call Bare_make_bool_from_n
  mov [Temps+20], ax
  push word [Temps+16]
  push word bp
  push word cx
  push word L316
  mov cx, sp
  push word 8 ;; scanned
  mov bx, [Temps+20]
  cmp word [bx], 1
  jz L317
  mov dx, g103
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L319: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word [bp+8]
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+2]
  jmp [bp]

L320: ; Arm: 105'19
  mov ax, [Temps+2]
  call Bare_put_char
  mov dx, [Temps+18]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L321: ; Arm: 106'22
  mov ax, [Temps+2]
  call Bare_put_char
  mov dx, [Temps+20]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L322: ; Arm: 107'16
  mov ax, [Temps+2]
  call Bare_put_char
  mov dx, [Temps+22]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L323: ; Function: (readloop,t1)
  call Bare_get_char
  mov [Temps+2], ax
  mov ax, [Temps+2]
  call Bare_char_to_num
  mov [Temps+4], ax
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov bx, [Temps+6]
  cmp word [bx], 1
  jz L310
  mov ax, [Temps+2]
  cmp word ax, `\x04`
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 1
  jz L311
  mov ax, 127
  cmp word ax, [Temps+4]
  call Bare_make_bool_from_n
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 1
  jz L312
  mov ax, [Temps+4]
  cmp word ax, 127
  call Bare_make_bool_from_z
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 1
  jz L318
  mov ax, [Temps+2]
  call Bare_char_to_num
  mov [Temps+14], ax
  mov ax, [Temps+14]
  cmp word ax, 8
  call Bare_make_bool_from_z
  mov [Temps+16], ax
  push word [Temps+2]
  push word bp
  push word dx
  push word cx
  push word L319
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [Temps+16]
  cmp word [bx], 1
  jz L320
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+18], ax
  mov bx, [Temps+18]
  cmp word [bx], 1
  jz L321
  mov ax, 26
  cmp word ax, [Temps+14]
  call Bare_make_bool_from_n
  mov [Temps+20], ax
  mov bx, [Temps+20]
  cmp word [bx], 1
  jz L322
  mov ax, `^`
  call Bare_put_char
  mov ax, 65
  add ax, [Temps+14]
  mov [Temps+24], ax
  mov ax, [Temps+24]
  sub ax, 1
  mov [Temps+26], ax
  mov ax, [Temps+26]
  call Bare_num_to_char
  mov [Temps+28], ax
  mov ax, [Temps+28]
  call Bare_put_char
  mov dx, [Temps+30]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L324: ; Continuation
  call Bare_enter_check
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L325: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L324
  mov cx, sp
  push word 6 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+6]
  jmp [bp]

L326: ; Arm: 339'44
  push word [bp+10]
  push word [bp+8]
  push word cx
  push word L325
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g8
  mov dx, g106
  jmp [bp]

L327: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word dx
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+2]
  jmp [bp]

L328: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L327
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L329: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L328
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L330: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L329
  mov cx, sp
  push word 12 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+10]
  jmp [bp]

L331: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L330
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g8
  mov dx, g108
  jmp [bp]

L332: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L331
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L333: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L332
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, g107
  jmp [bp]

L334: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L326
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L333
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L335: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L334
  mov cx, sp
  push word 16 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+10]
  jmp [bp]

L336: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L335
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L337: ; Function: (loop,t1)
  push word [bp+4]
  push word L323
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word bp
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L336
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [Temps+2]
  mov dx, g105
  jmp [bp]

L338: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word 0
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word [bp+4]
  push word 0
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word dx
  push word [Temps+4]
  push word 1
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word 0
  mov [Temps+8], sp
  push word 4 ;; scanned
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L339: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word cx
  push word L338
  mov cx, sp
  push word 8 ;; scanned
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L340: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L337
  mov [Temps+2], sp
  push word 14 ;; scanned
  push word [bp+16]
  push word [bp+14]
  push word cx
  push word L339
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [Temps+2]
  mov dx, g109
  jmp [bp]

L341: ; Continuation
  call Bare_enter_check
  push word g100
  push word `\x04`
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L340
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+4]
  mov dx, [Temps+2]
  jmp [bp]

L342: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L341
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L343: ; Function: (lam,t1)
  mov bx, dx
  cmp word [bx], 0
  jz L306
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 1
  jz L309
  push word [Temps+2]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L342
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+6]
  mov dx, g99
  jmp [bp]

L344: ; Function: (lam,t7)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L343
  mov [Temps+2], sp
  push word 14 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L345: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L346: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L345
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L347: ; Arm: 325'7
  push word [bp+8]
  push word cx
  push word L346
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g112
  jmp [bp]

L348: ; Arm: 192'9
  mov dx, g113
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L349: ; Arm: 196'35
  push word [bp+8]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L350: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L349
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L351: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L350
  mov cx, sp
  push word 10 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L352: ; Function: (loop,t1)
  mov bx, dx
  cmp word [bx], 0
  jz L348
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
  push word L351
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+6]
  jmp [bp]

L353: ; Continuation
  call Bare_enter_check
  mov bp, g25
  mov dx, dx
  jmp [bp]

L354: ; Continuation
  call Bare_enter_check
  push word cx
  push word L353
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L355: ; Arm: 318'11
  push word g116
  push word [bp+8]
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L354
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+2]
  jmp [bp]

L356: ; Continuation
  call Bare_enter_check
  mov bp, g25
  mov dx, dx
  jmp [bp]

L357: ; Continuation
  call Bare_enter_check
  push word cx
  push word L356
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L358: ; Arm: 321'16
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word g119
  push word [bp+8]
  push word 1
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L357
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+6]
  jmp [bp]

L359: ; Continuation
  call Bare_enter_check
  mov bp, g25
  mov dx, dx
  jmp [bp]

L360: ; Continuation
  call Bare_enter_check
  push word cx
  push word L359
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L361: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 0
  jz L355
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 0
  jz L358
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word g122
  push word [bp+8]
  push word 1
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L360
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+8]
  jmp [bp]

L362: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L361
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L363: ; Function: (lam,t3)
  push word dx
  push word [bp+4]
  push word L352
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word dx
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L362
  mov cx, sp
  push word 12 ;; scanned
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L364: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L365: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L364
  mov cx, sp
  push word 6 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+6]
  jmp [bp]

L366: ; Function: (lam,t1)
  mov bx, dx
  cmp word [bx], 0
  jz L347
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L363
  mov [Temps+6], sp
  push word 10 ;; scanned
  push word dx
  push word [bp+8]
  push word cx
  push word L365
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g5
  mov dx, [Temps+6]
  jmp [bp]

L367: ; Function: (lam,t10)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L366
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L368: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L369: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L368
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L370: ; Arm: 235'9
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [bp+4]
  push word cx
  push word L369
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g125
  jmp [bp]

L371: ; Arm: 203'9
  mov dx, g127
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L372: ; Continuation
  call Bare_enter_check
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L373: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L372
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L374: ; Function: (loop,t1)
  mov bx, dx
  cmp word [bx], 0
  jz L371
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, ` `
  call Bare_put_char
  push word [Temps+4]
  push word bp
  push word cx
  push word L373
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+2]
  jmp [bp]

L375: ; Continuation
  call Bare_enter_check
  mov ax, `\n`
  call Bare_put_char
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L376: ; Arm: 207'9
  mov dx, g128
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L377: ; Continuation
  call Bare_enter_check
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L378: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L377
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L379: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word L374
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+6]
  push word cx
  push word L375
  mov cx, sp
  push word 6 ;; scanned
  mov bx, dx
  cmp word [bx], 0
  jz L376
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [Temps+6]
  push word [Temps+2]
  push word cx
  push word L378
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, [Temps+4]
  jmp [bp]

L380: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L379
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L381: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L380
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [bp+6]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L382: ; Function: (lam,t1)
  mov bx, dx
  cmp word [bx], 1
  jz L370
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L381
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g3
  mov dx, g126
  jmp [bp]

L383: ; Function: (lam,t13)
  push word dx
  push word [bp+2]
  push word L382
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L384: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L385: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L384
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L386: ; Arm: 264'7
  push word [bp+8]
  push word cx
  push word L385
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g131
  jmp [bp]

L387: ; Arm: 192'9
  mov dx, g132
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L388: ; Arm: 196'35
  push word [bp+8]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L389: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L388
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L390: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L389
  mov cx, sp
  push word 10 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L391: ; Function: (loop,t3)
  mov bx, dx
  cmp word [bx], 0
  jz L387
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
  push word L390
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+6]
  jmp [bp]

L392: ; Arm: 192'9
  mov dx, g141
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L393: ; Arm: 196'35
  push word [bp+8]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L394: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L393
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L395: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L394
  mov cx, sp
  push word 10 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L396: ; Function: (loop,t1)
  mov bx, dx
  cmp word [bx], 0
  jz L392
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
  push word L395
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+6]
  jmp [bp]

L397: ; Continuation
  call Bare_enter_check
  mov bp, g25
  mov dx, dx
  jmp [bp]

L398: ; Continuation
  call Bare_enter_check
  push word cx
  push word L397
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L399: ; Arm: 257'11
  push word g145
  push word [bp+8]
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g142
  push word 1
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L398
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+4]
  jmp [bp]

L400: ; Continuation
  call Bare_enter_check
  mov bp, g25
  mov dx, dx
  jmp [bp]

L401: ; Continuation
  call Bare_enter_check
  push word cx
  push word L400
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L402: ; Arm: 260'16
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word g149
  push word [bp+8]
  push word 1
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word g146
  push word 1
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L401
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+8]
  jmp [bp]

L403: ; Continuation
  call Bare_enter_check
  mov bp, g25
  mov dx, dx
  jmp [bp]

L404: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 0
  jz L399
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 0
  jz L402
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word cx
  push word L403
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, [Temps+4]
  jmp [bp]

L405: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L404
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L406: ; Function: (lam,t1)
  push word dx
  push word [bp+4]
  push word L396
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word dx
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L405
  mov cx, sp
  push word 12 ;; scanned
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L407: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L408: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L407
  mov cx, sp
  push word 6 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+6]
  jmp [bp]

L409: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L406
  mov [Temps+2], sp
  push word 10 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word cx
  push word L408
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g5
  mov dx, [Temps+2]
  jmp [bp]

L410: ; Continuation
  call Bare_enter_check
  mov bp, g25
  mov dx, dx
  jmp [bp]

L411: ; Continuation
  call Bare_enter_check
  push word cx
  push word L410
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L412: ; Arm: 257'11
  push word g136
  push word [bp+12]
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g133
  push word 1
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L411
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+8]
  mov dx, [Temps+4]
  jmp [bp]

L413: ; Continuation
  call Bare_enter_check
  mov bp, g25
  mov dx, dx
  jmp [bp]

L414: ; Continuation
  call Bare_enter_check
  push word cx
  push word L413
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L415: ; Arm: 260'16
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word g140
  push word [bp+12]
  push word 1
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word g137
  push word 1
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L414
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+8]
  mov dx, [Temps+8]
  jmp [bp]

L416: ; Continuation
  call Bare_enter_check
  mov bp, g25
  mov dx, dx
  jmp [bp]

L417: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L409
  mov cx, sp
  push word 14 ;; scanned
  mov bx, dx
  cmp word [bx], 0
  jz L412
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 0
  jz L415
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word cx
  push word L416
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, [Temps+4]
  jmp [bp]

L418: ; Continuation
  call Bare_enter_check
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
  mov bp, [bp+16]
  mov dx, dx
  jmp [bp]

L419: ; Function: (lam,t1)
  mov bx, dx
  cmp word [bx], 0
  jz L386
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+2]
  push word [bp+4]
  push word L391
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
  push word L418
  mov cx, sp
  push word 18 ;; scanned
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L420: ; Function: (lam,t16)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L419
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L421: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L422: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L421
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L423: ; Arm: 302'7
  push word [bp+8]
  push word cx
  push word L422
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g152
  jmp [bp]

L424: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L425: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L424
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L426: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word cx
  push word L425
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L427: ; Arm: 305'10
  push word g156
  push word [Temps+2]
  push word 1
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word g153
  push word 1
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word [bp+2]
  push word cx
  push word L426
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+8]
  jmp [bp]

L428: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L429: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L428
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L430: ; Arm: 308'12
  mov ax, [bx+2]
  mov [Temps+10], ax
  mov ax, [bx+4]
  mov [Temps+12], ax
  push word [bp+8]
  push word cx
  push word L429
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g157
  jmp [bp]

L431: ; Arm: 192'9
  mov dx, g158
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L432: ; Arm: 196'35
  push word [bp+8]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L433: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L432
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L434: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L433
  mov cx, sp
  push word 10 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L435: ; Function: (loop,t5)
  mov bx, dx
  cmp word [bx], 0
  jz L431
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
  push word L434
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+6]
  jmp [bp]

L436: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L437: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L436
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L438: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word cx
  push word L437
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L439: ; Arm: 311'15
  push word g162
  push word [bp+12]
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g159
  push word 1
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+10]
  push word [bp+4]
  push word cx
  push word L438
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, [Temps+4]
  jmp [bp]

L440: ; Continuation
  call Bare_enter_check
  mov dx, g167
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L441: ; Continuation
  call Bare_enter_check
  push word cx
  push word L440
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L442: ; Continuation
  call Bare_enter_check
  push word cx
  push word L441
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L443: ; Arm: 270'9
  push word g166
  push word [bp+8]
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g163
  push word 1
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+2]
  push word cx
  push word L442
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+4]
  jmp [bp]

L444: ; Arm: 275'35
  mov dx, [bp+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L445: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word 0
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word dx
  push word [Temps+2]
  push word 1
  mov [Temps+4], sp
  push word 6 ;; scanned
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L446: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L444
  push word [bp+10]
  push word [bp+8]
  push word cx
  push word L445
  mov cx, sp
  push word 8 ;; scanned
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L447: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L446
  mov cx, sp
  push word 12 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L448: ; Function: (loop,t2)
  mov bx, dx
  cmp word [bx], 0
  jz L443
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
  push word L447
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov dx, [Temps+6]
  jmp [bp]

L449: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word 0
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word dx
  push word [Temps+2]
  push word 1
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [Temps+4]
  push word 0
  mov [Temps+6], sp
  push word 4 ;; scanned
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L450: ; Continuation
  call Bare_enter_check
  push word dx
  push word 0
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L449
  mov cx, sp
  push word 8 ;; scanned
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L451: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L450
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L452: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 0
  jz L439
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L448
  mov [Temps+4], sp
  push word 10 ;; scanned
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+14]
  push word cx
  push word L451
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [bp+10]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L453: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L452
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+16]
  mov dx, dx
  jmp [bp]

L454: ; Function: (lam,t1)
  mov bx, dx
  cmp word [bx], 0
  jz L423
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 0
  jz L427
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 1
  jz L430
  push word [Temps+2]
  push word [bp+4]
  push word L435
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
  push word L453
  mov cx, sp
  push word 18 ;; scanned
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+12], ax
  mov dx, [Temps+12]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L455: ; Function: (lam,t19)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L454
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L456: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L457: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L456
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L458: ; Arm: 282'7
  push word [bp+8]
  push word cx
  push word L457
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g170
  jmp [bp]

L459: ; Continuation
  call Bare_enter_check
  mov dx, g175
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L460: ; Continuation
  call Bare_enter_check
  push word cx
  push word L459
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L461: ; Continuation
  call Bare_enter_check
  push word cx
  push word L460
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L462: ; Arm: 270'9
  push word g174
  push word [bp+8]
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g171
  push word 1
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+2]
  push word cx
  push word L461
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+4]
  jmp [bp]

L463: ; Arm: 275'35
  mov dx, [bp+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L464: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word 0
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word dx
  push word [Temps+2]
  push word 1
  mov [Temps+4], sp
  push word 6 ;; scanned
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L465: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L463
  push word [bp+10]
  push word [bp+8]
  push word cx
  push word L464
  mov cx, sp
  push word 8 ;; scanned
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L466: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L465
  mov cx, sp
  push word 12 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L467: ; Function: (loop,t1)
  mov bx, dx
  cmp word [bx], 0
  jz L462
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
  push word L466
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov dx, [Temps+6]
  jmp [bp]

L468: ; Continuation
  call Bare_enter_check
  push word dx
  push word 0
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L469: ; Continuation
  call Bare_enter_check
  push word cx
  push word L468
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L470: ; Function: (lam,t1)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L467
  mov [Temps+2], sp
  push word 10 ;; scanned
  push word [Temps+2]
  push word cx
  push word L469
  mov cx, sp
  push word 6 ;; scanned
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L471: ; Function: (lam,t3)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L470
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L472: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L473: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word cx
  push word L472
  mov cx, sp
  push word 6 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L474: ; Function: (lam,t1)
  mov bx, dx
  cmp word [bx], 0
  jz L458
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L471
  mov [Temps+6], sp
  push word 8 ;; scanned
  push word dx
  push word [bp+8]
  push word cx
  push word L473
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g7
  mov dx, [Temps+6]
  jmp [bp]

L475: ; Function: (lam,t22)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L474
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L476: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L477: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L476
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L478: ; Arm: 378'7
  push word [bp+4]
  push word cx
  push word L477
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g182
  jmp [bp]

L479: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L480: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L479
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L481: ; Arm: 381'12
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [bp+4]
  push word cx
  push word L480
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g183
  jmp [bp]

L482: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L483: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L482
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L484: ; Arm: 384'15
  push word [bp+6]
  push word cx
  push word L483
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, g192
  jmp [bp]

L485: ; Arm: 350'13
  mov dx, g193
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L486: ; Continuation
  call Bare_enter_check
  mov ax, `\n`
  call Bare_put_char
  mov ax, [bp+4]
  add ax, 1
  mov [Temps+4], ax
  mov bp, [bp+6]
  mov dx, [Temps+4]
  jmp [bp]

L487: ; Continuation
  call Bare_enter_check
  push word dx
  push word `-`
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, [Temps+2]
  jmp [bp]

L488: ; Arm: 124'11
  push word g203
  push word `0`
  push word 1
  mov [Temps+8], sp
  push word 6 ;; scanned
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L489: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L490: ; Arm: 128'2
  mov ax, 0
  sub ax, [bp+8]
  mov [Temps+4], ax
  mov ax, [Temps+4]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word cx
  push word L487
  mov cx, sp
  push word 4 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 1
  jz L488
  push word [Temps+4]
  push word cx
  push word L489
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g202
  mov dx, g204
  jmp [bp]

L491: ; Continuation
  call Bare_enter_check
  mov bp, g25
  mov dx, dx
  jmp [bp]

L492: ; Arm: 124'11
  push word g206
  push word `0`
  push word 1
  mov [Temps+6], sp
  push word 6 ;; scanned
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L493: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L494: ; Continuation
  call Bare_enter_check
  mov ax, [bp+8]
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L486
  mov cx, sp
  push word 8 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L490
  mov ax, [bp+8]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  push word cx
  push word L491
  mov cx, sp
  push word 4 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 1
  jz L492
  push word [bp+8]
  push word cx
  push word L493
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g205
  mov dx, g207
  jmp [bp]

L495: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L494
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L496: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L495
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, g201
  jmp [bp]

L497: ; Continuation
  call Bare_enter_check
  push word dx
  push word `-`
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, g25
  mov dx, [Temps+2]
  jmp [bp]

L498: ; Arm: 124'11
  push word g196
  push word `0`
  push word 1
  mov [Temps+8], sp
  push word 6 ;; scanned
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L499: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L500: ; Arm: 128'2
  mov ax, 0
  sub ax, [bp+6]
  mov [Temps+4], ax
  mov ax, [Temps+4]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word cx
  push word L497
  mov cx, sp
  push word 4 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 1
  jz L498
  push word [Temps+4]
  push word cx
  push word L499
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g195
  mov dx, g197
  jmp [bp]

L501: ; Continuation
  call Bare_enter_check
  mov bp, g25
  mov dx, dx
  jmp [bp]

L502: ; Arm: 124'11
  push word g199
  push word `0`
  push word 1
  mov [Temps+6], sp
  push word 6 ;; scanned
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L503: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L504: ; Continuation
  call Bare_enter_check
  mov ax, [bp+6]
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L496
  mov cx, sp
  push word 12 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L500
  mov ax, [bp+6]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  push word cx
  push word L501
  mov cx, sp
  push word 4 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 1
  jz L502
  push word [bp+6]
  push word cx
  push word L503
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g198
  mov dx, g200
  jmp [bp]

L505: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L504
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L506: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L505
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, g194
  jmp [bp]

L507: ; Function: (loop,t2)
  mov ax, [bp+4]
  cmp word ax, dx
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L485
  push word bp
  push word dx
  push word [bp+2]
  push word cx
  push word L506
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g55
  mov dx, dx
  jmp [bp]

L508: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L509: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 0
  jz L484
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [bp+4]
  push word L507
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+6]
  push word cx
  push word L508
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [Temps+4]
  mov dx, 0
  jmp [bp]

L510: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L509
  mov cx, sp
  push word 8 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  jmp [bp]

L511: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L510
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g184
  mov dx, 0
  jmp [bp]

L512: ; Function: (lam,t1)
  mov bx, dx
  cmp word [bx], 0
  jz L478
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 1
  jz L481
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L511
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+2]
  jmp [bp]

L513: ; Function: (lam,t25)
  push word dx
  push word [bp+2]
  push word L512
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L514: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L279
  mov [Temps+2], sp
  push word 8 ;; scanned
  push word [Temps+2]
  push word g62
  push word 1
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [Temps+4]
  push word g61
  push word 0
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L303
  mov [Temps+8], sp
  push word 8 ;; scanned
  push word [Temps+8]
  push word g83
  push word 1
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [Temps+10]
  push word g82
  push word 0
  mov [Temps+12], sp
  push word 6 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L344
  mov [Temps+14], sp
  push word 12 ;; scanned
  push word [Temps+14]
  push word g96
  push word 1
  mov [Temps+16], sp
  push word 6 ;; scanned
  push word [Temps+16]
  push word g95
  push word 0
  mov [Temps+18], sp
  push word 6 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L367
  mov [Temps+20], sp
  push word 8 ;; scanned
  push word [Temps+20]
  push word g111
  push word 1
  mov [Temps+22], sp
  push word 6 ;; scanned
  push word [Temps+22]
  push word g110
  push word 0
  mov [Temps+24], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word L383
  mov [Temps+26], sp
  push word 4 ;; scanned
  push word [Temps+26]
  push word g124
  push word 1
  mov [Temps+28], sp
  push word 6 ;; scanned
  push word [Temps+28]
  push word g123
  push word 0
  mov [Temps+30], sp
  push word 6 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L420
  mov [Temps+32], sp
  push word 8 ;; scanned
  push word [Temps+32]
  push word g130
  push word 1
  mov [Temps+34], sp
  push word 6 ;; scanned
  push word [Temps+34]
  push word g129
  push word 0
  mov [Temps+36], sp
  push word 6 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L455
  mov [Temps+38], sp
  push word 8 ;; scanned
  push word [Temps+38]
  push word g151
  push word 1
  mov [Temps+40], sp
  push word 6 ;; scanned
  push word [Temps+40]
  push word g150
  push word 0
  mov [Temps+42], sp
  push word 6 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L475
  mov [Temps+44], sp
  push word 8 ;; scanned
  push word [Temps+44]
  push word g169
  push word 1
  mov [Temps+46], sp
  push word 6 ;; scanned
  push word [Temps+46]
  push word g168
  push word 0
  mov [Temps+48], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word L513
  mov [Temps+50], sp
  push word 4 ;; scanned
  push word [Temps+50]
  push word g181
  push word 1
  mov [Temps+52], sp
  push word 6 ;; scanned
  push word [Temps+52]
  push word g180
  push word 0
  mov [Temps+54], sp
  push word 6 ;; scanned
  push word g221
  push word [Temps+54]
  push word 1
  mov [Temps+56], sp
  push word 6 ;; scanned
  push word [Temps+56]
  push word g179
  push word 1
  mov [Temps+58], sp
  push word 6 ;; scanned
  push word [Temps+58]
  push word [Temps+48]
  push word 1
  mov [Temps+60], sp
  push word 6 ;; scanned
  push word [Temps+60]
  push word [Temps+42]
  push word 1
  mov [Temps+62], sp
  push word 6 ;; scanned
  push word [Temps+62]
  push word [Temps+36]
  push word 1
  mov [Temps+64], sp
  push word 6 ;; scanned
  push word [Temps+64]
  push word [Temps+30]
  push word 1
  mov [Temps+66], sp
  push word 6 ;; scanned
  push word [Temps+66]
  push word [Temps+24]
  push word 1
  mov [Temps+68], sp
  push word 6 ;; scanned
  push word [Temps+68]
  push word [Temps+18]
  push word 1
  mov [Temps+70], sp
  push word 6 ;; scanned
  push word [Temps+70]
  push word [Temps+12]
  push word 1
  mov [Temps+72], sp
  push word 6 ;; scanned
  push word [Temps+72]
  push word [Temps+6]
  push word 1
  mov [Temps+74], sp
  push word 6 ;; scanned
  push word [Temps+74]
  push word g60
  push word 1
  mov [Temps+76], sp
  push word 6 ;; scanned
  push word [Temps+76]
  push word 0
  mov [Temps+78], sp
  push word 4 ;; scanned
  mov bp, [bp+14]
  mov dx, [Temps+78]
  jmp [bp]

L515: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L514
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g25
  mov dx, dx
  jmp [bp]

L516: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+4]
  push word L126
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+6]
  push word L143
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [Temps+4]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L242
  mov [Temps+6], sp
  push word 12 ;; scanned
  push word [Temps+6]
  push word [Temps+2]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L515
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+8]
  mov dx, g56
  jmp [bp]

L517: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L516
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g1
  mov dx, g22
  jmp [bp]

L518: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+4]
  push word cx
  push word L517
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g1
  mov dx, g14
  jmp [bp]

L519: ; Continuation
  call Bare_enter_check
  push word dx
  push word cx
  push word L518
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g1
  mov dx, g12
  jmp [bp]

L520: ; Start
  push word cx
  push word L519
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
  dw 0
g5:
  dw L16
g6:
  dw 0
g7:
  dw L24
g8:
  dw L28
g9:
  dw 0
g10:
  dw L36
g11:
  dw 0
g12:
  dw L44
g13:
  dw 0
g14:
  dw L50
g15:
  dw 0
g16:
  dw 1
g17:
  dw 0
g18:
  dw 1
g19:
  dw 0
g20:
  dw 1
g21:
  dw 0
g22:
  dw L60
g23:
  dw 0
  db ``
g24:
  dw 0
g25:
  dw L66
g26:
  dw 0
g27:
  dw 0
g28:
  dw 2
  db `% `
g29:
  dw 0
g30:
  dw 0
g31:
  dw 0
g32:
  dw 1
g33:
  dw 0
g34:
  dw 0
g35:
  dw 0
g36:
  dw 0
g37:
  dw 0
g38:
  dw 0
g39:
  dw 17
  db `command not found`
g40:
  dw 1
  db `\n`
g41:
  dw 0
g42:
  dw 2
  db `: `
g43:
  dw 0
g44:
  dw 0
g45:
  dw 6
  db `sham: `
g46:
  dw 0
g47:
  dw 17
  db `Permission denied`
g48:
  dw 1
  db `\n`
g49:
  dw 0
g50:
  dw 2
  db `: `
g51:
  dw 0
g52:
  dw 0
g53:
  dw 6
  db `sham: `
g54:
  dw 0
g55:
  dw L70
g56:
  dw 51
  db `Sham: In-memory file-system. Consider typing "ls".\n`
g57:
  dw 6
  db `readme`
g58:
  dw 82
  db `Welcome to sham; please try all the commands!\nCan you find the hidden Easter Egg?\n`
g59:
  dw 0, g58
g60:
  dw 0, g57, g59
g61:
  dw 3
  db `cat`
g62:
  dw 57
  db `cat - concatenate files and print on the standard output\n`
g63:
  dw 33
  db `cat: takes at least one argument\n`
g64:
  dw 0
g65:
  dw 5
  db `cat: `
g66:
  dw 29
  db ` : No such file or directory\n`
g67:
  dw 0
g68:
  dw 1, g66, g67
g69:
  dw 5
  db `cat: `
g70:
  dw 19
  db ` : Not a data file\n`
g71:
  dw 0
g72:
  dw 1, g70, g71
g73:
  dw 0
g74:
  dw 5
  db `cat: `
g75:
  dw 29
  db ` : No such file or directory\n`
g76:
  dw 0
g77:
  dw 1, g75, g76
g78:
  dw 5
  db `cat: `
g79:
  dw 19
  db ` : Not a data file\n`
g80:
  dw 0
g81:
  dw 1, g79, g80
g82:
  dw 2
  db `cp`
g83:
  dw 32
  db `cp - copy files and directories\n`
g84:
  dw 25
  db `cp: missing file operand\n`
g85:
  dw 44
  db `cp: missing destination file operand after '`
g86:
  dw 2
  db `'\n`
g87:
  dw 0
g88:
  dw 1, g86, g87
g89:
  dw 30
  db `cp: unexpected extra operands\n`
g90:
  dw 0
g91:
  dw 17
  db `cp: cannot stat '`
g92:
  dw 29
  db `': No such file or directory\n`
g93:
  dw 0
g94:
  dw 1, g92, g93
g95:
  dw 6
  db `create`
g96:
  dw 27
  db `create - create a new file\n`
g97:
  dw 26
  db `create: missing file name\n`
g98:
  dw 34
  db `create: unexpected extra operands\n`
g99:
  dw 34
  db `(to finish type ^D on a new line)\n`
g100:
  dw 0
g101:
  dw 0
g102:
  dw 0
g103:
  dw 1
g104:
  dw 0
g105:
  dw 0
g106:
  dw 0
g107:
  dw 1
  db `\n`
g108:
  dw 0
g109:
  dw 0
g110:
  dw 4
  db `file`
g111:
  dw 27
  db `file - determine file type\n`
g112:
  dw 34
  db `file: takes at least one argument\n`
g113:
  dw 0
g114:
  dw 29
  db ` : No such file or directory\n`
g115:
  dw 0
g116:
  dw 1, g114, g115
g117:
  dw 13
  db `: ASCII text\n`
g118:
  dw 0
g119:
  dw 1, g117, g118
g120:
  dw 13
  db `: executable\n`
g121:
  dw 0
g122:
  dw 1, g120, g121
g123:
  dw 2
  db `ls`
g124:
  dw 29
  db `ls - list directory contents\n`
g125:
  dw 23
  db `ls: takes no arguments\n`
g126:
  dw L71
g127:
  dw 0
g128:
  dw 0
g129:
  dw 3
  db `man`
g130:
  dw 51
  db `man - an interface to the system reference manuals\n`
g131:
  dw 30
  db `What manual page do you want?\n`
g132:
  dw 0
g133:
  dw 20
  db `No manual entry for `
g134:
  dw 1
  db `\n`
g135:
  dw 0
g136:
  dw 1, g134, g135
g137:
  dw 20
  db `No manual entry for `
g138:
  dw 1
  db `\n`
g139:
  dw 0
g140:
  dw 1, g138, g139
g141:
  dw 0
g142:
  dw 20
  db `No manual entry for `
g143:
  dw 1
  db `\n`
g144:
  dw 0
g145:
  dw 1, g143, g144
g146:
  dw 20
  db `No manual entry for `
g147:
  dw 1
  db `\n`
g148:
  dw 0
g149:
  dw 1, g147, g148
g150:
  dw 2
  db `mv`
g151:
  dw 25
  db `mv - move (rename) files\n`
g152:
  dw 25
  db `mv: missing file operand\n`
g153:
  dw 44
  db `mv: missing destination file operand after '`
g154:
  dw 2
  db `'\n`
g155:
  dw 0
g156:
  dw 1, g154, g155
g157:
  dw 30
  db `mv: unexpected extra operands\n`
g158:
  dw 0
g159:
  dw 17
  db `mv: cannot stat '`
g160:
  dw 29
  db `': No such file or directory\n`
g161:
  dw 0
g162:
  dw 1, g160, g161
g163:
  dw 19
  db `rm: cannot remove '`
g164:
  dw 29
  db `': No such file or directory\n`
g165:
  dw 0
g166:
  dw 1, g164, g165
g167:
  dw 0
g168:
  dw 2
  db `rm`
g169:
  dw 66
  db `rm - remove files or directories (directories not supported yet!)\n`
g170:
  dw 20
  db `rm: missing operand\n`
g171:
  dw 19
  db `rm: cannot remove '`
g172:
  dw 29
  db `': No such file or directory\n`
g173:
  dw 0
g174:
  dw 1, g172, g173
g175:
  dw 0
g176:
  dw 3
  db `cat`
g177:
  dw 219
  db `I have a little shadow that goes in and out with me,\nAnd what can be the use of him is more than I can see.\nHe is very, very like me from the heels up to the head;\nAnd I see him jump before me, when I jump into my bed.\n`
g178:
  dw 0, g177
g179:
  dw 0, g176, g178
g180:
  dw 3
  db `fib`
g181:
  dw 50
  db `fib - naive fib computation upto the given number\n`
g182:
  dw 22
  db `fib: missing argument\n`
g183:
  dw 34
  db `create: unexpected extra argument\n`
g184:
  dw L83
g185:
  dw 0
g186:
  dw 1
g187:
  dw 0
g188:
  dw 1
g189:
  dw 0
g190:
  dw 0
g191:
  dw 0
g192:
  dw 31
  db `fib: expected numeric argument\n`
g193:
  dw 0
g194:
  dw 4
  db `fib `
g195:
  dw L87
g196:
  dw 0
g197:
  dw 0
g198:
  dw L91
g199:
  dw 0
g200:
  dw 0
g201:
  dw 5
  db ` --> `
g202:
  dw L95
g203:
  dw 0
g204:
  dw 0
g205:
  dw L99
g206:
  dw 0
g207:
  dw 0
g208:
  dw 5
  db `space`
g209:
  dw 47
  db `space - where is the stack-pointer? (in words)\n`
g210:
  dw 0
g211:
  dw L103
g212:
  dw 0
g213:
  dw 0
g214:
  dw L107
g215:
  dw 0
g216:
  dw 0
g217:
  dw L117
g218:
  dw 1, g209, g217
g219:
  dw 0, g208, g218
g220:
  dw 0
g221:
  dw 1, g219, g220

bare_start: jmp L520
