L1: ; Function: (lam,t1)
  mov bp, [bp+2]
  mov dx, dx
  jmp [bp]

L2: ; Function: (block,g1)
  push word dx
  push word L1
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L3: ; Arm: 21'7
  mov dx, 0
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L4: ; Continuation
  call Bare_enter_check
  mov ax, 1
  add ax, dx
  mov si, ax
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L5: ; Function: (length,g2)
  mov bx, dx
  cmp word [bx], 0
  jz L3
  mov ax, [bx+2]
  mov si, ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word cx
  push word L4
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g2
  mov dx, [Temps+4]
  jmp [bp]

L6: ; Arm: 26'7
  mov dx, g4
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L7: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+4]
  push word 1
  mov si, sp
  push word 6 ;; scanned
  mov dx, si
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
  mov si, ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [bp+2]
  push word cx
  push word L9
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+2]
  mov dx, si
  jmp [bp]

L11: ; Function: (map,g3)
  push word dx
  push word L10
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L12: ; Arm: 31'7
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
  mov si, ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [bp+2]
  push word cx
  push word L14
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+2]
  mov dx, si
  jmp [bp]

L16: ; Function: (iter,g5)
  push word dx
  push word L15
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L17: ; Arm: 36'7
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L18: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L19: ; Function: (lam,t1)
  mov bx, dx
  cmp word [bx], 0
  jz L17
  mov ax, [bx+2]
  mov si, ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [bp+2]
  push word si
  push word 1
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+4]
  push word cx
  push word L18
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g7
  mov dx, [Temps+6]
  jmp [bp]

L20: ; Function: (rev_onto,g7)
  push word dx
  push word L19
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L21: ; Arm: 49'9
  mov dx, g8
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L22: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L23: ; Function: (lam,t1)
  mov bx, dx
  cmp word [bx], 0
  jz L21
  mov ax, [bx+2]
  mov si, ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [bp+2]
  mov bx, si
  push word si ;; save
  mov si, [bp+4]
  call Bare_set_bytes
  pop word si ;; restore
  mov ax, [bp+4]
  add ax, 1
  mov [Temps+8], ax
  push word [Temps+4]
  push word cx
  push word L22
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+8]
  jmp [bp]

L24: ; Function: (loop,t2)
  push word bp
  push word dx
  push word [bp+2]
  push word L23
  mov si, sp
  push word 8 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L25: ; Continuation
  call Bare_enter_check
  mov si, [bp+4]
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L26: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word cx
  push word L25
  mov cx, sp
  push word 6 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L27: ; Continuation
  call Bare_enter_check
  mov ax, dx
  call Bare_make_bytes
  mov si, ax
  push word si
  push word L24
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word si
  push word [bp+4]
  push word cx
  push word L26
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [Temps+4]
  mov dx, 0
  jmp [bp]

L28: ; Function: (lam,g9)
  push word dx
  push word cx
  push word L27
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g2
  mov dx, dx
  jmp [bp]

L29: ; Arm: 60'9
  mov dx, g10
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
  mov si, ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [bp+2]
  mov bx, si
  push word si ;; save
  mov si, [bp+4]
  call Bare_set_bytes
  pop word si ;; restore
  mov ax, [bp+4]
  sub ax, 1
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
  mov si, sp
  push word 8 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L33: ; Continuation
  call Bare_enter_check
  mov si, [bp+4]
  mov dx, si
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
  mov si, ax
  push word si
  push word L32
  mov [Temps+4], sp
  push word 4 ;; scanned
  mov ax, dx
  sub ax, 1
  mov [Temps+6], ax
  push word si
  push word [bp+4]
  push word cx
  push word L34
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [Temps+4]
  mov dx, [Temps+6]
  jmp [bp]

L36: ; Function: (lam,g11)
  push word dx
  push word cx
  push word L35
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g2
  mov dx, dx
  jmp [bp]

L37: ; Arm: 68'13
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L38: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  sub ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L39: ; Function: (lam,t1)
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov si, ax
  mov bx, si
  cmp word [bx], 1
  jz L37
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
  push word L38
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+6]
  jmp [bp]

L40: ; Function: (explode_loop,t1)
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
  call Bare_enter_check
  mov ax, [bp+4]
  sub ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L42: ; Function: (lam,g13)
  push word dx
  push word L40
  mov si, sp
  push word 4 ;; scanned
  mov ax, dx
  call Bare_string_length
  mov [Temps+4], ax
  push word [Temps+4]
  push word cx
  push word L41
  mov cx, sp
  push word 6 ;; scanned
  mov bp, si
  mov dx, g12
  jmp [bp]

L43: ; Arm: 76'19
  mov dx, g16
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L44: ; Arm: 78'15
  mov dx, g17
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L45: ; Arm: 81'31
  mov dx, g20
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L46: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L45
  mov ax, [bp+4]
  sub ax, 1
  mov si, ax
  mov bp, [bp+6]
  mov dx, si
  jmp [bp]

L47: ; Arm: 8'9
  mov dx, g18
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L48: ; Function: (loop,t1)
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov si, ax
  mov bx, si
  cmp word [bx], 1
  jz L44
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
  push word L46
  mov cx, sp
  push word 8 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 1
  jz L47
  mov dx, g19
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L49: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L43
  push word [bp+6]
  push word [bp+4]
  push word L48
  mov si, sp
  push word 6 ;; scanned
  mov ax, [bp+8]
  sub ax, 1
  mov [Temps+4], ax
  mov bp, si
  mov dx, [Temps+4]
  jmp [bp]

L50: ; Arm: 8'9
  mov dx, g14
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L51: ; Function: (lam,t1)
  mov ax, [bp+2]
  call Bare_string_length
  mov si, ax
  mov ax, dx
  call Bare_string_length
  mov [Temps+4], ax
  mov ax, si
  cmp word ax, [Temps+4]
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word si
  push word dx
  push word [bp+2]
  push word cx
  push word L49
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 1
  jz L50
  mov dx, g15
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L52: ; Function: (lam,g21)
  push word dx
  push word L51
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L53: ; Arm: 106'7
  mov dx, g25
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L54: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, g24
  jmp [bp]

L55: ; Arm: 99'19
  mov ax, si
  call Bare_put_char
  mov dx, [Temps+10]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L56: ; Arm: 100'22
  mov ax, si
  call Bare_put_char
  mov dx, [Temps+12]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L57: ; Arm: 101'16
  mov ax, si
  call Bare_put_char
  mov dx, [Temps+14]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L58: ; Function: (put_chars,g24)
  mov bx, dx
  cmp word [bx], 0
  jz L53
  mov ax, [bx+2]
  mov si, ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, si
  call Bare_char_to_num
  mov [Temps+6], ax
  mov ax, [Temps+6]
  cmp word ax, 8
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  push word [Temps+4]
  push word cx
  push word L54
  mov cx, sp
  push word 6 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 1
  jz L55
  mov ax, si
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 1
  jz L56
  mov ax, 26
  cmp word ax, [Temps+6]
  call Bare_make_bool_from_n
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 1
  jz L57
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

L59: ; Arm: 244'11
  mov dx, dx
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L60: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  add ax, dx
  mov si, ax
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L61: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  sub ax, 2
  mov si, ax
  push word dx
  push word cx
  push word L60
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g54
  mov dx, si
  jmp [bp]

L62: ; Function: (fib,g54)
  mov ax, dx
  cmp word ax, 2
  call Bare_make_bool_from_n
  mov si, ax
  mov bx, si
  cmp word [bx], 1
  jz L59
  mov ax, dx
  sub ax, 1
  mov [Temps+4], ax
  push word dx
  push word cx
  push word L61
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g54
  mov dx, [Temps+4]
  jmp [bp]

L63: ; Function: (lam,g82)
  mov bx, dx
  mov ax, [bx+2]
  mov si, ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L64: ; Arm: 266'9
  push word [bp+2]
  push word 1
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L65: ; Arm: 269'15
  mov dx, g95
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L66: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L67: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 0
  jz L65
  mov ax, [bx+2]
  mov si, ax
  mov ax, 10
  mov bx, [bp+4]
  mul bx
  mov [Temps+4], ax
  mov ax, [Temps+4]
  add ax, si
  mov [Temps+6], ax
  push word [bp+6]
  push word cx
  push word L66
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g88
  mov dx, [Temps+6]
  jmp [bp]

L68: ; Arm: 261'27
  push word [bp+4]
  push word 1
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L69: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L68
  mov dx, g93
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L70: ; Arm: 8'9
  mov dx, g91
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L71: ; Arm: 261'12
  mov ax, 9
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov si, ax
  push word [bp+8]
  push word cx
  push word L69
  mov cx, sp
  push word 6 ;; scanned
  mov bx, si
  cmp word [bx], 1
  jz L70
  mov dx, g92
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L72: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L67
  mov cx, sp
  push word 8 ;; scanned
  mov bx, dx
  cmp word [bx], 1
  jz L71
  mov dx, g94
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L73: ; Arm: 8'9
  mov dx, g89
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L74: ; Function: (lam,t1)
  mov bx, dx
  cmp word [bx], 0
  jz L64
  mov ax, [bx+2]
  mov si, ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, si
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
  push word L72
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [Temps+10]
  cmp word [bx], 1
  jz L73
  mov dx, g90
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L75: ; Function: (loop,g88)
  push word dx
  push word L74
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L76: ; Arm: 115'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L77: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 10
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L78: ; Function: (lam,t1)
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 1
  jz L76
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
  push word L77
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g99
  mov dx, [Temps+10]
  jmp [bp]

L79: ; Function: (loop,g99)
  push word dx
  push word L78
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L80: ; Arm: 115'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L81: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 10
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L82: ; Function: (lam,t1)
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 1
  jz L80
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
  push word L81
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g103
  mov dx, [Temps+10]
  jmp [bp]

L83: ; Function: (loop,g103)
  push word dx
  push word L82
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L84: ; Arm: 90'7
  mov dx, g22
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L85: ; Continuation
  call Bare_enter_check
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L86: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L85
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L87: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L86
  mov cx, sp
  push word 8 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  jmp [bp]

L88: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word dx
  push word [bp+4]
  push word cx
  push word L87
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g7
  mov dx, g23
  jmp [bp]

L89: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L88
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L90: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+4]
  push word cx
  push word L89
  mov cx, sp
  push word 8 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L91: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L90
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L92: ; Function: (concat,t1)
  mov bx, dx
  cmp word [bx], 0
  jz L84
  mov ax, [bx+2]
  mov si, ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word si
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L91
  mov cx, sp
  push word 10 ;; scanned
  mov bp, bp
  mov dx, [Temps+4]
  jmp [bp]

L93: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word dx
  push word 1
  mov si, sp
  push word 6 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L94: ; Arm: 157'11
  push word [bp+6]
  push word cx
  push word L93
  mov cx, sp
  push word 6 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+2]
  jmp [bp]

L95: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L96: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word dx
  push word 1
  mov si, sp
  push word 6 ;; scanned
  push word [bp+8]
  push word cx
  push word L95
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, si
  jmp [bp]

L97: ; Arm: 159'26
  push word [Temps+4]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L96
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+2]
  jmp [bp]

L98: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L99: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word [bp+6]
  push word 1
  mov si, sp
  push word 6 ;; scanned
  push word [bp+8]
  push word cx
  push word L98
  mov cx, sp
  push word 6 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L100: ; Function: (lam,t1)
  mov bx, dx
  cmp word [bx], 0
  jz L94
  mov ax, [bx+2]
  mov si, ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, si
  cmp word ax, ` `
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov bx, [Temps+6]
  cmp word [bx], 1
  jz L97
  push word [Temps+4]
  push word si
  push word [bp+10]
  push word cx
  push word L99
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+6]
  mov bp, [bp+8]
  jmp [bp]

L101: ; Function: (lam,t1)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L100
  mov si, sp
  push word 12 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L102: ; Function: (have_letter,t1)
  push word bp
  push word dx
  push word [bp+4]
  push word [bp+2]
  push word L101
  mov si, sp
  push word 10 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L103: ; Arm: 164'9
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L104: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L105: ; Arm: 166'24
  push word [Temps+4]
  push word cx
  push word L104
  mov cx, sp
  push word 6 ;; scanned
  mov dx, [bp+2]
  mov bp, [bp+4]
  jmp [bp]

L106: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L107: ; Continuation
  call Bare_enter_check
  push word g26
  push word [bp+4]
  push word 1
  mov si, sp
  push word 6 ;; scanned
  push word [bp+6]
  push word cx
  push word L106
  mov cx, sp
  push word 6 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L108: ; Function: (lam,t2)
  mov bx, dx
  cmp word [bx], 0
  jz L103
  mov ax, [bx+2]
  mov si, ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, si
  cmp word ax, ` `
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov bx, [Temps+6]
  cmp word [bx], 1
  jz L105
  push word [Temps+4]
  push word si
  push word cx
  push word L107
  mov cx, sp
  push word 8 ;; scanned
  mov dx, [bp+2]
  mov bp, [bp+6]
  jmp [bp]

L109: ; Function: (at_word_start,t2)
  push word bp
  push word [bp+2]
  push word L102
  mov si, sp
  push word 6 ;; scanned
  push word si
  push word bp
  push word dx
  push word L108
  mov [Temps+4], sp
  push word 8 ;; scanned
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L110: ; Arm: 138'22
  mov ax, `\n`
  call Bare_put_char
  mov bp, [bp+2]
  mov dx, dx
  jmp [bp]

L111: ; Arm: 139'28
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

L112: ; Arm: 140'19
  mov bp, bp
  mov dx, dx
  jmp [bp]

L113: ; Arm: 143'17
  mov bp, bp
  mov dx, dx
  jmp [bp]

L114: ; Continuation
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

L115: ; Arm: 145'31
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

L116: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L114
  mov cx, sp
  push word 8 ;; scanned
  mov bx, dx
  cmp word [bx], 1
  jz L115
  mov dx, g32
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L117: ; Arm: 8'9
  mov dx, g30
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L118: ; Arm: 141'21
  mov bx, dx
  cmp word [bx], 0
  jz L113
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
  push word L116
  mov cx, sp
  push word 8 ;; scanned
  mov bx, [Temps+20]
  cmp word [bx], 1
  jz L117
  mov dx, g31
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L119: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word [bp+8]
  push word 1
  mov si, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, si
  jmp [bp]

L120: ; Arm: 99'19
  mov ax, si
  call Bare_put_char
  mov dx, [Temps+18]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L121: ; Arm: 100'22
  mov ax, si
  call Bare_put_char
  mov dx, [Temps+20]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L122: ; Arm: 101'16
  mov ax, si
  call Bare_put_char
  mov dx, [Temps+22]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L123: ; Function: (readloop,t1)
  call Bare_get_char
  mov si, ax
  mov ax, si
  call Bare_char_to_num
  mov [Temps+4], ax
  mov ax, si
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov bx, [Temps+6]
  cmp word [bx], 1
  jz L110
  mov ax, si
  cmp word ax, `\x04`
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 1
  jz L111
  mov ax, 127
  cmp word ax, [Temps+4]
  call Bare_make_bool_from_n
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 1
  jz L112
  mov ax, [Temps+4]
  cmp word ax, 127
  call Bare_make_bool_from_z
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 1
  jz L118
  mov ax, si
  call Bare_char_to_num
  mov [Temps+14], ax
  mov ax, [Temps+14]
  cmp word ax, 8
  call Bare_make_bool_from_z
  mov [Temps+16], ax
  push word si
  push word bp
  push word dx
  push word cx
  push word L119
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [Temps+16]
  cmp word [bx], 1
  jz L120
  mov ax, si
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+18], ax
  mov bx, [Temps+18]
  cmp word [bx], 1
  jz L121
  mov ax, 26
  cmp word ax, [Temps+14]
  call Bare_make_bool_from_n
  mov [Temps+20], ax
  mov bx, [Temps+20]
  cmp word [bx], 1
  jz L122
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

L124: ; Arm: 219'36
  mov dx, g34
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L125: ; Continuation
  call Bare_enter_check
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L126: ; Arm: 212'7
  mov dx, [bp+10]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L127: ; Arm: 183'9
  mov dx, g37
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L128: ; Arm: 187'35
  push word [bp+8]
  push word 1
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L129: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L128
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L130: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L129
  mov cx, sp
  push word 10 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L131: ; Function: (loop,t3)
  mov bx, dx
  cmp word [bx], 0
  jz L127
  mov ax, [bx+2]
  mov si, ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, si
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [Temps+8]
  push word [Temps+4]
  push word bp
  push word [bp+4]
  push word cx
  push word L130
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+6]
  jmp [bp]

L132: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L133: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L132
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g24
  mov dx, dx
  jmp [bp]

L134: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word cx
  push word L133
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L135: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L134
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L136: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L135
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L137: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L136
  mov cx, sp
  push word 12 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  jmp [bp]

L138: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L137
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g7
  mov dx, g45
  jmp [bp]

L139: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L138
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L140: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L139
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L141: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L140
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, g44
  jmp [bp]

L142: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L141
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L143: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L142
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L144: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L143
  mov cx, sp
  push word 12 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  jmp [bp]

L145: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L144
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g7
  mov dx, g43
  jmp [bp]

L146: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L145
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L147: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L146
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L148: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L147
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L149: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L148
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L150: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L149
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L151: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L150
  mov cx, sp
  push word 14 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  jmp [bp]

L152: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L151
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g7
  mov dx, g42
  jmp [bp]

L153: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L152
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L154: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L153
  mov cx, sp
  push word 14 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L155: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L154
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, g41
  jmp [bp]

L156: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L155
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L157: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L156
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L158: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L157
  mov cx, sp
  push word 14 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  jmp [bp]

L159: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L158
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g7
  mov dx, g40
  jmp [bp]

L160: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L159
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L161: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L160
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, g39
  jmp [bp]

L162: ; Arm: 204'9
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L161
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, g38
  jmp [bp]

L163: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L164: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L163
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g24
  mov dx, dx
  jmp [bp]

L165: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word cx
  push word L164
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L166: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L165
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L167: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L166
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L168: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L167
  mov cx, sp
  push word 12 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  jmp [bp]

L169: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L168
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g7
  mov dx, g53
  jmp [bp]

L170: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L169
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L171: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L170
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L172: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L171
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, g52
  jmp [bp]

L173: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L172
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L174: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L173
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L175: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L174
  mov cx, sp
  push word 12 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  jmp [bp]

L176: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L175
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g7
  mov dx, g51
  jmp [bp]

L177: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L176
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L178: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L177
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L179: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L178
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
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
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L181: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L180
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L182: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L181
  mov cx, sp
  push word 14 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  jmp [bp]

L183: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L182
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g7
  mov dx, g50
  jmp [bp]

L184: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L183
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L185: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L184
  mov cx, sp
  push word 14 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L186: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L185
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, g49
  jmp [bp]

L187: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L186
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L188: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L187
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L189: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L188
  mov cx, sp
  push word 14 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  jmp [bp]

L190: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L189
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g7
  mov dx, g48
  jmp [bp]

L191: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L190
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L192: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L191
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, g47
  jmp [bp]

L193: ; Arm: 207'14
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L192
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, g46
  jmp [bp]

L194: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L195: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 0
  jz L162
  mov ax, [bx+2]
  mov si, ax
  mov bx, si
  cmp word [bx], 0
  jz L193
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [bp+12]
  push word cx
  push word L194
  mov cx, sp
  push word 6 ;; scanned
  mov dx, [bp+8]
  mov bp, [Temps+4]
  jmp [bp]

L196: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L195
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L197: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word cx
  push word L125
  mov cx, sp
  push word 6 ;; scanned
  mov bx, dx
  cmp word [bx], 0
  jz L126
  mov ax, [bx+2]
  mov si, ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word si
  push word [bp+8]
  push word L131
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word [Temps+4]
  push word si
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L196
  mov cx, sp
  push word 16 ;; scanned
  mov bx, [bp+10]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L198: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L197
  mov cx, sp
  push word 14 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  jmp [bp]

L199: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L198
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g7
  mov dx, g36
  jmp [bp]

L200: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L199
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L201: ; Continuation
  call Bare_enter_check
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
  mov dx, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L202: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L124
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L201
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+10]
  mov dx, g35
  jmp [bp]

L203: ; Continuation
  call Bare_enter_check
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L202
  mov cx, sp
  push word 18 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+16]
  jmp [bp]

L204: ; Continuation
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
  push word L203
  mov cx, sp
  push word 20 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L205: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word L123
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
  push word L204
  mov cx, sp
  push word 18 ;; scanned
  mov bp, si
  mov dx, g33
  jmp [bp]

L206: ; Continuation
  call Bare_enter_check
  push word g28
  push word `\x04`
  push word 1
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
  push word L205
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+4]
  mov dx, si
  jmp [bp]

L207: ; Continuation
  call Bare_enter_check
  push word [bp+16]
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
  mov bp, g24
  mov dx, dx
  jmp [bp]

L208: ; Function: (mainloop,t3)
  push word bp
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L207
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+6]
  mov dx, g27
  jmp [bp]

L209: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L210: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L209
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g24
  mov dx, dx
  jmp [bp]

L211: ; Arm: 240'7
  push word [bp+8]
  push word cx
  push word L210
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g61
  jmp [bp]

L212: ; Arm: 183'9
  mov dx, g62
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L213: ; Arm: 187'35
  push word [bp+8]
  push word 1
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L214: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L213
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L215: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L214
  mov cx, sp
  push word 10 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L216: ; Function: (loop,t3)
  mov bx, dx
  cmp word [bx], 0
  jz L212
  mov ax, [bx+2]
  mov si, ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, si
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [Temps+8]
  push word [Temps+4]
  push word bp
  push word [bp+4]
  push word cx
  push word L215
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+6]
  jmp [bp]

L217: ; Arm: 183'9
  mov dx, g71
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L218: ; Arm: 187'35
  push word [bp+8]
  push word 1
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L219: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L218
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L220: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L219
  mov cx, sp
  push word 10 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L221: ; Function: (loop,t1)
  mov bx, dx
  cmp word [bx], 0
  jz L217
  mov ax, [bx+2]
  mov si, ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, si
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [Temps+8]
  push word [Temps+4]
  push word bp
  push word [bp+4]
  push word cx
  push word L220
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+6]
  jmp [bp]

L222: ; Continuation
  call Bare_enter_check
  mov bp, g24
  mov dx, dx
  jmp [bp]

L223: ; Continuation
  call Bare_enter_check
  push word cx
  push word L222
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L224: ; Arm: 233'11
  push word g75
  push word [bp+8]
  push word 1
  mov si, sp
  push word 6 ;; scanned
  push word si
  push word g72
  push word 1
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L223
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+4]
  jmp [bp]

L225: ; Continuation
  call Bare_enter_check
  mov bp, g24
  mov dx, dx
  jmp [bp]

L226: ; Arm: 236'16
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word cx
  push word L225
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, [Temps+4]
  jmp [bp]

L227: ; Continuation
  call Bare_enter_check
  mov bp, g24
  mov dx, dx
  jmp [bp]

L228: ; Continuation
  call Bare_enter_check
  push word cx
  push word L227
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L229: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 0
  jz L224
  mov ax, [bx+2]
  mov si, ax
  mov bx, si
  cmp word [bx], 0
  jz L226
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word g79
  push word [bp+8]
  push word 1
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word g76
  push word 1
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L228
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+8]
  jmp [bp]

L230: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L229
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L231: ; Function: (lam,t1)
  push word dx
  push word [bp+4]
  push word L221
  mov si, sp
  push word 6 ;; scanned
  push word si
  push word dx
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L230
  mov cx, sp
  push word 12 ;; scanned
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L232: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L233: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L232
  mov cx, sp
  push word 6 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+6]
  jmp [bp]

L234: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L231
  mov si, sp
  push word 10 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word cx
  push word L233
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g5
  mov dx, si
  jmp [bp]

L235: ; Continuation
  call Bare_enter_check
  mov bp, g24
  mov dx, dx
  jmp [bp]

L236: ; Continuation
  call Bare_enter_check
  push word cx
  push word L235
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L237: ; Arm: 233'11
  push word g66
  push word [bp+12]
  push word 1
  mov si, sp
  push word 6 ;; scanned
  push word si
  push word g63
  push word 1
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L236
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+8]
  mov dx, [Temps+4]
  jmp [bp]

L238: ; Continuation
  call Bare_enter_check
  mov bp, g24
  mov dx, dx
  jmp [bp]

L239: ; Arm: 236'16
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word cx
  push word L238
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, [Temps+4]
  jmp [bp]

L240: ; Continuation
  call Bare_enter_check
  mov bp, g24
  mov dx, dx
  jmp [bp]

L241: ; Continuation
  call Bare_enter_check
  push word cx
  push word L240
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L242: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L234
  mov cx, sp
  push word 14 ;; scanned
  mov bx, dx
  cmp word [bx], 0
  jz L237
  mov ax, [bx+2]
  mov si, ax
  mov bx, si
  cmp word [bx], 0
  jz L239
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word g70
  push word [bp+12]
  push word 1
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word g67
  push word 1
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word cx
  push word L241
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+8]
  mov dx, [Temps+8]
  jmp [bp]

L243: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L242
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+16]
  mov dx, dx
  jmp [bp]

L244: ; Function: (lam,t1)
  mov bx, dx
  cmp word [bx], 0
  jz L211
  mov ax, [bx+2]
  mov si, ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word si
  push word [bp+4]
  push word L216
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word [Temps+4]
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L243
  mov cx, sp
  push word 18 ;; scanned
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L245: ; Function: (lam,t1)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L244
  mov si, sp
  push word 10 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L246: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L247: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L246
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g24
  mov dx, dx
  jmp [bp]

L248: ; Arm: 225'9
  mov ax, [bx+2]
  mov si, ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [bp+4]
  push word cx
  push word L247
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g81
  jmp [bp]

L249: ; Arm: 194'9
  mov dx, g83
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L250: ; Continuation
  call Bare_enter_check
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L251: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L250
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g24
  mov dx, dx
  jmp [bp]

L252: ; Function: (loop,t1)
  mov bx, dx
  cmp word [bx], 0
  jz L249
  mov ax, [bx+2]
  mov si, ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, ` `
  call Bare_put_char
  push word [Temps+4]
  push word bp
  push word cx
  push word L251
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+2]
  mov dx, si
  jmp [bp]

L253: ; Continuation
  call Bare_enter_check
  mov ax, `\n`
  call Bare_put_char
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L254: ; Arm: 198'9
  mov dx, g84
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L255: ; Continuation
  call Bare_enter_check
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L256: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L255
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g24
  mov dx, dx
  jmp [bp]

L257: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word L252
  mov si, sp
  push word 4 ;; scanned
  push word [bp+6]
  push word cx
  push word L253
  mov cx, sp
  push word 6 ;; scanned
  mov bx, dx
  cmp word [bx], 0
  jz L254
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [Temps+6]
  push word si
  push word cx
  push word L256
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, [Temps+4]
  jmp [bp]

L258: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L257
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L259: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L258
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [bp+6]
  mov ax, [bx+2]
  mov si, ax
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L260: ; Function: (lam,t1)
  mov bx, dx
  cmp word [bx], 1
  jz L248
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L259
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g3
  mov dx, g82
  jmp [bp]

L261: ; Function: (lam,t4)
  push word dx
  push word [bp+2]
  push word L260
  mov si, sp
  push word 6 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L262: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L263: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L262
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g24
  mov dx, dx
  jmp [bp]

L264: ; Arm: 276'7
  push word [bp+4]
  push word cx
  push word L263
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g86
  jmp [bp]

L265: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L266: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L265
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g24
  mov dx, dx
  jmp [bp]

L267: ; Arm: 279'12
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [bp+4]
  push word cx
  push word L266
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov dx, g87
  jmp [bp]

L268: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L269: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L268
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g24
  mov dx, dx
  jmp [bp]

L270: ; Arm: 282'15
  push word [bp+6]
  push word cx
  push word L269
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, g96
  jmp [bp]

L271: ; Arm: 248'13
  mov dx, g97
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L272: ; Continuation
  call Bare_enter_check
  mov ax, `\n`
  call Bare_put_char
  mov ax, [bp+4]
  add ax, 1
  mov [Temps+4], ax
  mov bp, [bp+6]
  mov dx, [Temps+4]
  jmp [bp]

L273: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L272
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g24
  mov dx, dx
  jmp [bp]

L274: ; Arm: 118'11
  push word g104
  push word `0`
  push word 1
  mov [Temps+4], sp
  push word 6 ;; scanned
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L275: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L276: ; Continuation
  call Bare_enter_check
  mov ax, [bp+8]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov si, ax
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L273
  mov cx, sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 1
  jz L274
  push word [bp+8]
  push word cx
  push word L275
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g103
  mov dx, g105
  jmp [bp]

L277: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L276
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g24
  mov dx, dx
  jmp [bp]

L278: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L277
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, g102
  jmp [bp]

L279: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L278
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g24
  mov dx, dx
  jmp [bp]

L280: ; Arm: 118'11
  push word g100
  push word `0`
  push word 1
  mov [Temps+4], sp
  push word 6 ;; scanned
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L281: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L282: ; Continuation
  call Bare_enter_check
  mov ax, [bp+6]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov si, ax
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L279
  mov cx, sp
  push word 12 ;; scanned
  mov bx, si
  cmp word [bx], 1
  jz L280
  push word [bp+6]
  push word cx
  push word L281
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g99
  mov dx, g101
  jmp [bp]

L283: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L282
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g24
  mov dx, dx
  jmp [bp]

L284: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L283
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, g98
  jmp [bp]

L285: ; Function: (loop,t2)
  mov ax, [bp+4]
  cmp word ax, dx
  call Bare_make_bool_from_n
  mov si, ax
  mov bx, si
  cmp word [bx], 1
  jz L271
  push word bp
  push word dx
  push word [bp+2]
  push word cx
  push word L284
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g54
  mov dx, dx
  jmp [bp]

L286: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L287: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 0
  jz L270
  mov ax, [bx+2]
  mov si, ax
  push word si
  push word [bp+4]
  push word L285
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+6]
  push word cx
  push word L286
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [Temps+4]
  mov dx, 0
  jmp [bp]

L288: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L287
  mov cx, sp
  push word 8 ;; scanned
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  jmp [bp]

L289: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L288
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g88
  mov dx, 0
  jmp [bp]

L290: ; Function: (lam,t1)
  mov bx, dx
  cmp word [bx], 0
  jz L264
  mov ax, [bx+2]
  mov si, ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 1
  jz L267
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L289
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+2]
  mov dx, si
  jmp [bp]

L291: ; Function: (lam,t7)
  push word dx
  push word [bp+2]
  push word L290
  mov si, sp
  push word 6 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L292: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L245
  mov si, sp
  push word 8 ;; scanned
  push word si
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [Temps+4]
  push word g60
  push word 0
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word L261
  mov [Temps+8], sp
  push word 4 ;; scanned
  push word [Temps+8]
  push word 1
  mov [Temps+10], sp
  push word 4 ;; scanned
  push word [Temps+10]
  push word g80
  push word 0
  mov [Temps+12], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word L291
  mov [Temps+14], sp
  push word 4 ;; scanned
  push word [Temps+14]
  push word 1
  mov [Temps+16], sp
  push word 4 ;; scanned
  push word [Temps+16]
  push word g85
  push word 0
  mov [Temps+18], sp
  push word 6 ;; scanned
  push word g106
  push word [Temps+18]
  push word 1
  mov [Temps+20], sp
  push word 6 ;; scanned
  push word [Temps+20]
  push word [Temps+12]
  push word 1
  mov [Temps+22], sp
  push word 6 ;; scanned
  push word [Temps+22]
  push word [Temps+6]
  push word 1
  mov [Temps+24], sp
  push word 6 ;; scanned
  push word [Temps+24]
  push word g59
  push word 1
  mov [Temps+26], sp
  push word 6 ;; scanned
  push word [Temps+26]
  push word 0
  mov [Temps+28], sp
  push word 4 ;; scanned
  mov bp, [bp+10]
  mov dx, [Temps+28]
  jmp [bp]

L293: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L292
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g24
  mov dx, dx
  jmp [bp]

L294: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+4]
  push word L92
  mov si, sp
  push word 6 ;; scanned
  push word [bp+6]
  push word L109
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [Temps+4]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L208
  mov [Temps+6], sp
  push word 12 ;; scanned
  push word [Temps+6]
  push word si
  push word dx
  push word [bp+8]
  push word cx
  push word L293
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+8]
  mov dx, g55
  jmp [bp]

L295: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L294
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g1
  mov dx, g21
  jmp [bp]

L296: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+4]
  push word cx
  push word L295
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g1
  mov dx, g13
  jmp [bp]

L297: ; Continuation
  call Bare_enter_check
  push word dx
  push word cx
  push word L296
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g1
  mov dx, g11
  jmp [bp]

L298: ; Start
  push word cx
  push word L297
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
  dw L11
g4:
  dw 0
g5:
  dw L16
g6:
  dw 0
g7:
  dw L20
g8:
  dw 0
g9:
  dw L28
g10:
  dw 0
g11:
  dw L36
g12:
  dw 0
g13:
  dw L42
g14:
  dw 0
g15:
  dw 1
g16:
  dw 0
g17:
  dw 1
g18:
  dw 0
g19:
  dw 1
g20:
  dw 0
g21:
  dw L52
g22:
  dw 0
  db ``
g23:
  dw 0
g24:
  dw L58
g25:
  dw 0
g26:
  dw 0
g27:
  dw 2
  db `% `
g28:
  dw 0
g29:
  dw 0
g30:
  dw 0
g31:
  dw 1
g32:
  dw 0
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
  dw 17
  db `command not found`
g39:
  dw 1
  db `\n`
g40:
  dw 0
g41:
  dw 2
  db `: `
g42:
  dw 0
g43:
  dw 0
g44:
  dw 6
  db `sham: `
g45:
  dw 0
g46:
  dw 17
  db `Permission denied`
g47:
  dw 1
  db `\n`
g48:
  dw 0
g49:
  dw 2
  db `: `
g50:
  dw 0
g51:
  dw 0
g52:
  dw 6
  db `sham: `
g53:
  dw 0
g54:
  dw L62
g55:
  dw 53
  db `Shammy: In-memory file-system. Consider typing "ls".\n`
g56:
  dw 6
  db `readme`
g57:
  dw 46
  db `Welcome to sham; please try all the commands!\n`
g58:
  dw 0, g57
g59:
  dw 0, g56, g58
g60:
  dw 3
  db `cat`
g61:
  dw 33
  db `cat: takes at least one argument\n`
g62:
  dw 0
g63:
  dw 5
  db `cat: `
g64:
  dw 29
  db ` : No such file or directory\n`
g65:
  dw 0
g66:
  dw 1, g64, g65
g67:
  dw 5
  db `cat: `
g68:
  dw 19
  db ` : Not a data file\n`
g69:
  dw 0
g70:
  dw 1, g68, g69
g71:
  dw 0
g72:
  dw 5
  db `cat: `
g73:
  dw 29
  db ` : No such file or directory\n`
g74:
  dw 0
g75:
  dw 1, g73, g74
g76:
  dw 5
  db `cat: `
g77:
  dw 19
  db ` : Not a data file\n`
g78:
  dw 0
g79:
  dw 1, g77, g78
g80:
  dw 2
  db `ls`
g81:
  dw 23
  db `ls: takes no arguments\n`
g82:
  dw L63
g83:
  dw 0
g84:
  dw 0
g85:
  dw 3
  db `fib`
g86:
  dw 22
  db `fib: missing argument\n`
g87:
  dw 34
  db `create: unexpected extra argument\n`
g88:
  dw L75
g89:
  dw 0
g90:
  dw 1
g91:
  dw 0
g92:
  dw 1
g93:
  dw 0
g94:
  dw 0
g95:
  dw 0
g96:
  dw 31
  db `fib: expected numeric argument\n`
g97:
  dw 0
g98:
  dw 4
  db `fib `
g99:
  dw L79
g100:
  dw 0
g101:
  dw 0
g102:
  dw 5
  db ` --> `
g103:
  dw L83
g104:
  dw 0
g105:
  dw 0
g106:
  dw 0

bare_start: jmp L298
