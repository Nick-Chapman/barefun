L1: ; Function: t1
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L2: ; Function: g1
  push word dx
  push word L1
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L3: ; Arm: 22'7
  mov dx, 0
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L4: ; Continuation
  mov ax, 1
  add ax, dx
  mov [2], ax
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L5: ; Function: g2
  mov bx, dx
  cmp word [bx], 0
  jz L3
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  push word cx
  push word L4
  mov cx, sp
  mov bp, g2
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L6: ; Arm: 27'7
  mov dx, g4
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L7: ; Continuation
  push word dx
  push word [bp+4]
  push word 1
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L8: ; Continuation
  push word [bp+6]
  push word cx
  push word L7
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L9: ; Continuation
  push word dx
  push word [bp+6]
  push word cx
  push word L8
  mov cx, sp
  mov dx, [bp+4]
  mov bp, g3
  mov ax, [bp]
  jmp ax

L10: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L6
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  push word [4]
  push word [bp+2]
  push word cx
  push word L9
  mov cx, sp
  mov bp, [bp+2]
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L11: ; Function: g3
  push word dx
  push word L10
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L12: ; Arm: 32'7
  mov dx, g6
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L13: ; Continuation
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L14: ; Continuation
  push word [bp+6]
  push word cx
  push word L13
  mov cx, sp
  mov dx, [bp+4]
  mov bp, g5
  mov ax, [bp]
  jmp ax

L15: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L12
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  push word [4]
  push word [bp+2]
  push word cx
  push word L14
  mov cx, sp
  mov bp, [bp+2]
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L16: ; Function: g5
  push word dx
  push word L15
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L17: ; Arm: 37'7
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L18: ; Continuation
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L19: ; Continuation
  push word [bp+6]
  push word cx
  push word L18
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L20: ; Continuation
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L19
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+6]
  mov ax, [bp]
  jmp ax

L21: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word dx
  push word cx
  push word L20
  mov cx, sp
  mov dx, [bp+6]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp ax

L22: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L17
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  push word [4]
  push word [2]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L21
  mov cx, sp
  mov dx, [bp+2]
  mov bp, g7
  mov ax, [bp]
  jmp ax

L23: ; Function: t1
  push word dx
  push word [bp+2]
  push word L22
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L24: ; Function: g7
  push word dx
  push word L23
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L25: ; Arm: 42'7
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L26: ; Continuation
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L27: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L25
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  push word [bp+2]
  push word [2]
  push word 1
  mov [6], sp
  push word [4]
  push word cx
  push word L26
  mov cx, sp
  mov bp, g8
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L28: ; Function: g8
  push word dx
  push word L27
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L29: ; Arm: 55'9
  mov dx, g9
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L30: ; Continuation
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L31: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L29
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov ax, [bp+2]
  mov bx, [bp+4]
  mov si, [2]
  call Bare_set_bytes
  mov [6], ax
  mov ax, [bp+4]
  add ax, 1
  mov [8], ax
  push word [4]
  push word cx
  push word L30
  mov cx, sp
  mov bp, [bp+6]
  mov dx, [8]
  mov ax, [bp]
  jmp ax

L32: ; Function: t2
  push word bp
  push word dx
  push word [bp+2]
  push word L31
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L33: ; Continuation
  mov ax, [bp+4]
  mov [2], ax
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L34: ; Continuation
  push word [bp+6]
  push word cx
  push word L33
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L35: ; Continuation
  mov ax, dx
  call Bare_make_bytes
  mov [2], ax
  push word [2]
  push word L32
  mov [4], sp
  push word [2]
  push word [bp+4]
  push word cx
  push word L34
  mov cx, sp
  mov bp, [4]
  mov dx, 0
  mov ax, [bp]
  jmp ax

L36: ; Function: g10
  push word dx
  push word cx
  push word L35
  mov cx, sp
  mov bp, g2
  mov dx, dx
  mov ax, [bp]
  jmp ax

L37: ; Arm: 66'9
  mov dx, g11
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L38: ; Continuation
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L39: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L37
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov ax, [bp+2]
  mov bx, [bp+4]
  mov si, [2]
  call Bare_set_bytes
  mov [6], ax
  mov ax, [bp+4]
  sub ax, 1
  mov [8], ax
  push word [4]
  push word cx
  push word L38
  mov cx, sp
  mov bp, [bp+6]
  mov dx, [8]
  mov ax, [bp]
  jmp ax

L40: ; Function: t2
  push word bp
  push word dx
  push word [bp+2]
  push word L39
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L41: ; Continuation
  mov ax, [bp+4]
  mov [2], ax
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L42: ; Continuation
  push word [bp+6]
  push word cx
  push word L41
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L43: ; Continuation
  mov ax, dx
  call Bare_make_bytes
  mov [2], ax
  push word [2]
  push word L40
  mov [4], sp
  mov ax, dx
  sub ax, 1
  mov [6], ax
  push word [2]
  push word [bp+4]
  push word cx
  push word L42
  mov cx, sp
  mov bp, [4]
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L44: ; Function: g12
  push word dx
  push word cx
  push word L43
  mov cx, sp
  mov bp, g2
  mov dx, dx
  mov ax, [bp]
  jmp ax

L45: ; Arm: 74'13
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L46: ; Continuation
  mov ax, [bp+4]
  sub ax, 1
  mov [2], ax
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L47: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L45
  mov ax, [bp+2]
  mov bx, dx
  call Bare_get_bytes
  mov [4], ax
  push word [bp+4]
  push word [4]
  push word 1
  mov [6], sp
  push word dx
  push word cx
  push word L46
  mov cx, sp
  mov bp, [bp+6]
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L48: ; Function: t1
  push word bp
  push word dx
  push word [bp+2]
  push word L47
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L49: ; Continuation
  mov ax, [bp+4]
  sub ax, 1
  mov [2], ax
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L50: ; Function: g14
  push word dx
  push word L48
  mov [2], sp
  mov ax, dx
  call Bare_string_length
  mov [4], ax
  push word [4]
  push word cx
  push word L49
  mov cx, sp
  mov bp, [2]
  mov dx, g13
  mov ax, [bp]
  jmp ax

L51: ; Arm: 82'19
  mov dx, g17
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L52: ; Arm: 84'15
  mov dx, g18
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L53: ; Arm: 87'31
  mov dx, g21
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L54: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L53
  mov ax, [bp+4]
  sub ax, 1
  mov [2], ax
  mov bp, [bp+6]
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L55: ; Arm: 8'9
  mov dx, g19
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L56: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L52
  mov ax, [bp+2]
  mov bx, dx
  call Bare_get_bytes
  mov [4], ax
  mov ax, [bp+4]
  mov bx, dx
  call Bare_get_bytes
  mov [6], ax
  mov ax, [4]
  cmp word ax, [6]
  call Bare_make_bool_from_z
  mov [8], ax
  push word bp
  push word dx
  push word cx
  push word L54
  mov cx, sp
  mov bx, [8]
  cmp word [bx], 1
  jz L55
  mov dx, g20
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L57: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L51
  push word [bp+6]
  push word [bp+4]
  push word L56
  mov [2], sp
  mov ax, [bp+8]
  sub ax, 1
  mov [4], ax
  mov bp, [2]
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L58: ; Arm: 8'9
  mov dx, g15
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L59: ; Function: t1
  mov ax, [bp+2]
  call Bare_string_length
  mov [2], ax
  mov ax, dx
  call Bare_string_length
  mov [4], ax
  mov ax, [2]
  cmp word ax, [4]
  call Bare_make_bool_from_z
  mov [6], ax
  push word [2]
  push word dx
  push word [bp+2]
  push word cx
  push word L57
  mov cx, sp
  mov bx, [6]
  cmp word [bx], 1
  jz L58
  mov dx, g16
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L60: ; Function: g22
  push word dx
  push word L59
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L61: ; Arm: 112'7
  mov dx, g26
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L62: ; Continuation
  mov dx, [bp+4]
  mov bp, g25
  mov ax, [bp]
  jmp ax

L63: ; Arm: 105'19
  mov ax, [2]
  call Bare_put_char
  mov [10], ax
  mov dx, [10]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L64: ; Arm: 106'22
  mov ax, [2]
  call Bare_put_char
  mov [12], ax
  mov dx, [12]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L65: ; Arm: 107'16
  mov ax, [2]
  call Bare_put_char
  mov [14], ax
  mov dx, [14]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L66: ; Function: g25
  mov bx, dx
  cmp word [bx], 0
  jz L61
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov ax, [2]
  call Bare_char_to_num
  mov [6], ax
  mov ax, [6]
  cmp word ax, 8
  call Bare_make_bool_from_z
  mov [8], ax
  push word [4]
  push word cx
  push word L62
  mov cx, sp
  mov bx, [8]
  cmp word [bx], 1
  jz L63
  mov ax, [2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [10], ax
  mov bx, [10]
  cmp word [bx], 1
  jz L64
  mov ax, 26
  cmp word ax, [6]
  call Bare_make_bool_from_n
  mov [12], ax
  mov bx, [12]
  cmp word [bx], 1
  jz L65
  mov ax, '^'
  call Bare_put_char
  mov [14], ax
  mov ax, 65
  add ax, [6]
  mov [16], ax
  mov ax, [16]
  sub ax, 1
  mov [18], ax
  mov ax, [18]
  call Bare_num_to_char
  mov [20], ax
  mov ax, [20]
  call Bare_put_char
  mov [22], ax
  mov dx, [22]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L67: ; Arm: 342'11
  mov dx, dx
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L68: ; Continuation
  mov ax, [bp+4]
  add ax, dx
  mov [2], ax
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L69: ; Continuation
  mov ax, [bp+4]
  sub ax, 2
  mov [2], ax
  push word dx
  push word cx
  push word L68
  mov cx, sp
  mov bp, g55
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L70: ; Function: g55
  mov ax, dx
  cmp word ax, 2
  call Bare_make_bool_from_n
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L67
  mov ax, dx
  sub ax, 1
  mov [4], ax
  push word dx
  push word cx
  push word L69
  mov cx, sp
  mov bp, g55
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L71: ; Function: g126
  mov bx, dx
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L72: ; Arm: 364'9
  push word [bp+2]
  push word 1
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L73: ; Arm: 367'15
  mov dx, g191
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L74: ; Continuation
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L75: ; Continuation
  mov bx, dx
  cmp word [bx], 0
  jz L73
  mov ax, [bx+2]
  mov [2], ax
  mov ax, 10
  mov bx, [bp+4]
  call Bare_mul
  mov [4], ax
  mov ax, [4]
  add ax, [2]
  mov [6], ax
  push word [bp+6]
  push word cx
  push word L74
  mov cx, sp
  mov bp, g184
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L76: ; Arm: 359'27
  push word [bp+4]
  push word 1
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L77: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L76
  mov dx, g189
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L78: ; Arm: 8'9
  mov dx, g187
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L79: ; Arm: 359'12
  mov ax, 9
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov [2], ax
  push word [bp+8]
  push word cx
  push word L77
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L78
  mov dx, g188
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L80: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L75
  mov cx, sp
  mov bx, dx
  cmp word [bx], 1
  jz L79
  mov dx, g190
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L81: ; Arm: 8'9
  mov dx, g185
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L82: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L72
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov ax, [2]
  call Bare_char_to_num
  mov [6], ax
  mov ax, [6]
  sub ax, 48
  mov [8], ax
  mov ax, [8]
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [10], ax
  push word [8]
  push word [4]
  push word [bp+2]
  push word cx
  push word L80
  mov cx, sp
  mov bx, [10]
  cmp word [bx], 1
  jz L81
  mov dx, g186
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L83: ; Function: g184
  push word dx
  push word L82
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L84: ; Arm: 121'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L85: ; Continuation
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [2], ax
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L86: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L84
  mov ax, dx
  mov bx, 10
  call Bare_mod
  mov [4], ax
  mov ax, 48
  add ax, [4]
  mov [6], ax
  mov ax, [6]
  call Bare_num_to_char
  mov [8], ax
  push word [bp+2]
  push word [8]
  push word 1
  mov [10], sp
  push word dx
  push word cx
  push word L85
  mov cx, sp
  mov bp, g195
  mov dx, [10]
  mov ax, [bp]
  jmp ax

L87: ; Function: g195
  push word dx
  push word L86
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L88: ; Arm: 121'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L89: ; Continuation
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [2], ax
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L90: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L88
  mov ax, dx
  mov bx, 10
  call Bare_mod
  mov [4], ax
  mov ax, 48
  add ax, [4]
  mov [6], ax
  mov ax, [6]
  call Bare_num_to_char
  mov [8], ax
  push word [bp+2]
  push word [8]
  push word 1
  mov [10], sp
  push word dx
  push word cx
  push word L89
  mov cx, sp
  mov bp, g199
  mov dx, [10]
  mov ax, [bp]
  jmp ax

L91: ; Function: g199
  push word dx
  push word L90
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L92: ; Arm: 96'7
  mov dx, g23
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L93: ; Continuation
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L94: ; Continuation
  push word [bp+4]
  push word cx
  push word L93
  mov cx, sp
  mov bp, [bp+6]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L95: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L94
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  mov ax, [bp]
  jmp ax

L96: ; Continuation
  push word [bp+6]
  push word dx
  push word [bp+4]
  push word cx
  push word L95
  mov cx, sp
  mov bp, g8
  mov dx, g24
  mov ax, [bp]
  jmp ax

L97: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L96
  mov cx, sp
  mov bp, g8
  mov dx, dx
  mov ax, [bp]
  jmp ax

L98: ; Continuation
  push word dx
  push word [bp+4]
  push word cx
  push word L97
  mov cx, sp
  mov dx, [bp+8]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L99: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L98
  mov cx, sp
  mov dx, [bp+8]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L100: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L92
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  push word [2]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L99
  mov cx, sp
  mov bp, bp
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L101: ; Continuation
  push word [bp+4]
  push word dx
  push word 1
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L102: ; Arm: 163'11
  push word [bp+6]
  push word cx
  push word L101
  mov cx, sp
  mov dx, [bp+10]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp ax

L103: ; Continuation
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L104: ; Continuation
  push word [bp+6]
  push word dx
  push word 1
  mov [2], sp
  push word [bp+8]
  push word cx
  push word L103
  mov cx, sp
  mov bp, [bp+4]
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L105: ; Arm: 165'26
  push word [4]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L104
  mov cx, sp
  mov dx, [bp+10]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp ax

L106: ; Continuation
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L107: ; Continuation
  push word [bp+4]
  push word [bp+6]
  push word 1
  mov [2], sp
  push word [bp+8]
  push word cx
  push word L106
  mov cx, sp
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L108: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L102
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov ax, [2]
  cmp word ax, ' '
  call Bare_make_bool_from_z
  mov [6], ax
  mov bx, [6]
  cmp word [bx], 1
  jz L105
  push word [4]
  push word [2]
  push word [bp+10]
  push word cx
  push word L107
  mov cx, sp
  mov dx, [bp+6]
  mov bp, [bp+8]
  mov ax, [bp]
  jmp ax

L109: ; Function: t1
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L108
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L110: ; Function: t1
  push word bp
  push word dx
  push word [bp+4]
  push word [bp+2]
  push word L109
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L111: ; Arm: 170'9
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L112: ; Continuation
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L113: ; Arm: 172'24
  push word [4]
  push word cx
  push word L112
  mov cx, sp
  mov dx, [bp+2]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp ax

L114: ; Continuation
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L115: ; Continuation
  push word g27
  push word [bp+4]
  push word 1
  mov [2], sp
  push word [bp+6]
  push word cx
  push word L114
  mov cx, sp
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L116: ; Function: t2
  mov bx, dx
  cmp word [bx], 0
  jz L111
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov ax, [2]
  cmp word ax, ' '
  call Bare_make_bool_from_z
  mov [6], ax
  mov bx, [6]
  cmp word [bx], 1
  jz L113
  push word [4]
  push word [2]
  push word cx
  push word L115
  mov cx, sp
  mov dx, [bp+2]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L117: ; Function: t2
  push word bp
  push word [bp+2]
  push word L110
  mov [2], sp
  push word [2]
  push word bp
  push word dx
  push word L116
  mov [4], sp
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L118: ; Arm: 144'22
  mov ax, `\n`
  call Bare_put_char
  mov [8], ax
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L119: ; Arm: 145'28
  mov ax, '^'
  call Bare_put_char
  mov [10], ax
  mov ax, 'D'
  call Bare_put_char
  mov [12], ax
  mov ax, `\n`
  call Bare_put_char
  mov [14], ax
  push word dx
  push word 4
  push word 1
  mov [16], sp
  mov bp, [bp+2]
  mov dx, [16]
  mov ax, [bp]
  jmp ax

L120: ; Arm: 146'19
  mov bp, bp
  mov dx, dx
  mov ax, [bp]
  jmp ax

L121: ; Arm: 149'17
  mov bp, bp
  mov dx, dx
  mov ax, [bp]
  jmp ax

L122: ; Continuation
  mov ax, 8
  call Bare_put_char
  mov [2], ax
  mov ax, ' '
  call Bare_put_char
  mov [4], ax
  mov ax, 8
  call Bare_put_char
  mov [6], ax
  mov dx, [bp+6]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp ax

L123: ; Arm: 151'31
  mov ax, 8
  call Bare_put_char
  mov [2], ax
  mov ax, ' '
  call Bare_put_char
  mov [4], ax
  mov ax, 8
  call Bare_put_char
  mov [6], ax
  mov dx, [6]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L124: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L122
  mov cx, sp
  mov bx, dx
  cmp word [bx], 1
  jz L123
  mov dx, g33
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L125: ; Arm: 8'9
  mov dx, g31
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L126: ; Arm: 147'21
  mov bx, dx
  cmp word [bx], 0
  jz L121
  mov ax, [bx+2]
  mov [14], ax
  mov ax, [bx+4]
  mov [16], ax
  mov ax, [14]
  call Bare_char_to_num
  mov [18], ax
  mov ax, 26
  cmp word ax, [18]
  call Bare_make_bool_from_n
  mov [20], ax
  push word [16]
  push word bp
  push word cx
  push word L124
  mov cx, sp
  mov bx, [20]
  cmp word [bx], 1
  jz L125
  mov dx, g32
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L127: ; Continuation
  push word [bp+4]
  push word [bp+8]
  push word 1
  mov [2], sp
  mov bp, [bp+6]
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L128: ; Arm: 105'19
  mov ax, [2]
  call Bare_put_char
  mov [18], ax
  mov dx, [18]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L129: ; Arm: 106'22
  mov ax, [2]
  call Bare_put_char
  mov [20], ax
  mov dx, [20]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L130: ; Arm: 107'16
  mov ax, [2]
  call Bare_put_char
  mov [22], ax
  mov dx, [22]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L131: ; Function: t1
  call Bare_get_char
  mov [2], ax
  mov ax, [2]
  call Bare_char_to_num
  mov [4], ax
  mov ax, [2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [6], ax
  mov bx, [6]
  cmp word [bx], 1
  jz L118
  mov ax, [2]
  cmp word ax, 4
  call Bare_make_bool_from_z
  mov [8], ax
  mov bx, [8]
  cmp word [bx], 1
  jz L119
  mov ax, 127
  cmp word ax, [4]
  call Bare_make_bool_from_n
  mov [10], ax
  mov bx, [10]
  cmp word [bx], 1
  jz L120
  mov ax, [4]
  cmp word ax, 127
  call Bare_make_bool_from_z
  mov [12], ax
  mov bx, [12]
  cmp word [bx], 1
  jz L126
  mov ax, [2]
  call Bare_char_to_num
  mov [14], ax
  mov ax, [14]
  cmp word ax, 8
  call Bare_make_bool_from_z
  mov [16], ax
  push word [2]
  push word bp
  push word dx
  push word cx
  push word L127
  mov cx, sp
  mov bx, [16]
  cmp word [bx], 1
  jz L128
  mov ax, [2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [18], ax
  mov bx, [18]
  cmp word [bx], 1
  jz L129
  mov ax, 26
  cmp word ax, [14]
  call Bare_make_bool_from_n
  mov [20], ax
  mov bx, [20]
  cmp word [bx], 1
  jz L130
  mov ax, '^'
  call Bare_put_char
  mov [22], ax
  mov ax, 65
  add ax, [14]
  mov [24], ax
  mov ax, [24]
  sub ax, 1
  mov [26], ax
  mov ax, [26]
  call Bare_num_to_char
  mov [28], ax
  mov ax, [28]
  call Bare_put_char
  mov [30], ax
  mov dx, [30]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L132: ; Arm: 225'36
  mov dx, g35
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L133: ; Continuation
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L134: ; Arm: 218'7
  mov dx, [bp+10]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L135: ; Arm: 189'9
  mov dx, g38
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L136: ; Arm: 193'35
  push word [bp+8]
  push word 1
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L137: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L136
  mov dx, [bp+6]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp ax

L138: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L137
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L139: ; Function: t3
  mov bx, dx
  cmp word [bx], 0
  jz L135
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov bx, [2]
  mov ax, [bx+2]
  mov [6], ax
  mov ax, [bx+4]
  mov [8], ax
  push word [8]
  push word [4]
  push word bp
  push word [bp+4]
  push word cx
  push word L138
  mov cx, sp
  mov bp, [bp+2]
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L140: ; Continuation
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L141: ; Continuation
  push word [bp+4]
  push word cx
  push word L140
  mov cx, sp
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L142: ; Continuation
  push word [bp+6]
  push word cx
  push word L141
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L143: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L142
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L144: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L143
  mov cx, sp
  mov bp, [bp+10]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L145: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L144
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  mov ax, [bp]
  jmp ax

L146: ; Continuation
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L145
  mov cx, sp
  mov bp, g8
  mov dx, g46
  mov ax, [bp]
  jmp ax

L147: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L146
  mov cx, sp
  mov bp, g8
  mov dx, dx
  mov ax, [bp]
  jmp ax

L148: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L147
  mov cx, sp
  mov dx, [bp+10]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L149: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L148
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g45
  mov ax, [bp]
  jmp ax

L150: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L149
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L151: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L150
  mov cx, sp
  mov bp, [bp+10]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L152: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L151
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  mov ax, [bp]
  jmp ax

L153: ; Continuation
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L152
  mov cx, sp
  mov bp, g8
  mov dx, g44
  mov ax, [bp]
  jmp ax

L154: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L153
  mov cx, sp
  mov bp, g8
  mov dx, dx
  mov ax, [bp]
  jmp ax

L155: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L154
  mov cx, sp
  mov dx, [bp+10]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L156: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L155
  mov cx, sp
  mov dx, [bp+10]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L157: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L156
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L158: ; Continuation
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L157
  mov cx, sp
  mov bp, [bp+10]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L159: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L158
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  mov ax, [bp]
  jmp ax

L160: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L159
  mov cx, sp
  mov bp, g8
  mov dx, g43
  mov ax, [bp]
  jmp ax

L161: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L160
  mov cx, sp
  mov bp, g8
  mov dx, dx
  mov ax, [bp]
  jmp ax

L162: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L161
  mov cx, sp
  mov dx, [bp+12]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L163: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L162
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g42
  mov ax, [bp]
  jmp ax

L164: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L163
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L165: ; Continuation
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L164
  mov cx, sp
  mov bp, [bp+10]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L166: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L165
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  mov ax, [bp]
  jmp ax

L167: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L166
  mov cx, sp
  mov bp, g8
  mov dx, g41
  mov ax, [bp]
  jmp ax

L168: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L167
  mov cx, sp
  mov bp, g8
  mov dx, dx
  mov ax, [bp]
  jmp ax

L169: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L168
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g40
  mov ax, [bp]
  jmp ax

L170: ; Arm: 210'9
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L169
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g39
  mov ax, [bp]
  jmp ax

L171: ; Continuation
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L172: ; Continuation
  push word [bp+4]
  push word cx
  push word L171
  mov cx, sp
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L173: ; Continuation
  push word [bp+6]
  push word cx
  push word L172
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L174: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L173
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L175: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L174
  mov cx, sp
  mov bp, [bp+10]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L176: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L175
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  mov ax, [bp]
  jmp ax

L177: ; Continuation
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L176
  mov cx, sp
  mov bp, g8
  mov dx, g54
  mov ax, [bp]
  jmp ax

L178: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L177
  mov cx, sp
  mov bp, g8
  mov dx, dx
  mov ax, [bp]
  jmp ax

L179: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L178
  mov cx, sp
  mov dx, [bp+10]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L180: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L179
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g53
  mov ax, [bp]
  jmp ax

L181: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L180
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L182: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L181
  mov cx, sp
  mov bp, [bp+10]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L183: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L182
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  mov ax, [bp]
  jmp ax

L184: ; Continuation
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L183
  mov cx, sp
  mov bp, g8
  mov dx, g52
  mov ax, [bp]
  jmp ax

L185: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L184
  mov cx, sp
  mov bp, g8
  mov dx, dx
  mov ax, [bp]
  jmp ax

L186: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L185
  mov cx, sp
  mov dx, [bp+10]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L187: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L186
  mov cx, sp
  mov dx, [bp+10]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L188: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L187
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L189: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L188
  mov cx, sp
  mov bp, [bp+12]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L190: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L189
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  mov ax, [bp]
  jmp ax

L191: ; Continuation
  push word [bp+12]
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L190
  mov cx, sp
  mov bp, g8
  mov dx, g51
  mov ax, [bp]
  jmp ax

L192: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L191
  mov cx, sp
  mov bp, g8
  mov dx, dx
  mov ax, [bp]
  jmp ax

L193: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L192
  mov cx, sp
  mov dx, [bp+12]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L194: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L193
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g50
  mov ax, [bp]
  jmp ax

L195: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L194
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L196: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L195
  mov cx, sp
  mov bp, [bp+12]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L197: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L196
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  mov ax, [bp]
  jmp ax

L198: ; Continuation
  push word [bp+12]
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L197
  mov cx, sp
  mov bp, g8
  mov dx, g49
  mov ax, [bp]
  jmp ax

L199: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L198
  mov cx, sp
  mov bp, g8
  mov dx, dx
  mov ax, [bp]
  jmp ax

L200: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L199
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g48
  mov ax, [bp]
  jmp ax

L201: ; Arm: 213'14
  mov ax, [bx+2]
  mov [4], ax
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L200
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g47
  mov ax, [bp]
  jmp ax

L202: ; Continuation
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L203: ; Continuation
  mov bx, dx
  cmp word [bx], 0
  jz L170
  mov ax, [bx+2]
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 0
  jz L201
  mov ax, [bx+2]
  mov [4], ax
  mov ax, [bx+4]
  mov [6], ax
  push word [bp+12]
  push word cx
  push word L202
  mov cx, sp
  mov dx, [bp+8]
  mov bp, [6]
  mov ax, [bp]
  jmp ax

L204: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L203
  mov cx, sp
  mov bp, [bp+14]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L205: ; Continuation
  push word [bp+12]
  push word cx
  push word L133
  mov cx, sp
  mov bx, dx
  cmp word [bx], 0
  jz L134
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  push word [2]
  push word [bp+8]
  push word L139
  mov [6], sp
  push word [6]
  push word [4]
  push word [2]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L204
  mov cx, sp
  mov bx, [bp+10]
  mov ax, [bx+2]
  mov [8], ax
  mov dx, [8]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L206: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L205
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  mov ax, [bp]
  jmp ax

L207: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L206
  mov cx, sp
  mov bp, g8
  mov dx, g37
  mov ax, [bp]
  jmp ax

L208: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L207
  mov cx, sp
  mov bp, [bp+10]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L209: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L208
  mov cx, sp
  mov dx, [bp+14]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L210: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L132
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L209
  mov cx, sp
  mov bp, [bp+10]
  mov dx, g36
  mov ax, [bp]
  jmp ax

L211: ; Continuation
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L210
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+16]
  mov ax, [bp]
  jmp ax

L212: ; Continuation
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L211
  mov cx, sp
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L213: ; Continuation
  push word [bp+6]
  push word L131
  mov [2], sp
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L212
  mov cx, sp
  mov bp, [2]
  mov dx, g34
  mov ax, [bp]
  jmp ax

L214: ; Continuation
  push word g29
  push word 4
  push word 1
  mov [2], sp
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L213
  mov cx, sp
  mov bp, [bp+4]
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L215: ; Continuation
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L214
  mov cx, sp
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L216: ; Function: t3
  push word bp
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L215
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g28
  mov ax, [bp]
  jmp ax

L217: ; Continuation
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L218: ; Continuation
  push word [bp+4]
  push word cx
  push word L217
  mov cx, sp
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L219: ; Arm: 246'7
  push word [bp+8]
  push word cx
  push word L218
  mov cx, sp
  mov bp, [bp+2]
  mov dx, g63
  mov ax, [bp]
  jmp ax

L220: ; Arm: 189'9
  mov dx, g64
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L221: ; Arm: 193'35
  push word [bp+8]
  push word 1
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L222: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L221
  mov dx, [bp+6]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp ax

L223: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L222
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L224: ; Function: t3
  mov bx, dx
  cmp word [bx], 0
  jz L220
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov bx, [2]
  mov ax, [bx+2]
  mov [6], ax
  mov ax, [bx+4]
  mov [8], ax
  push word [8]
  push word [4]
  push word bp
  push word [bp+4]
  push word cx
  push word L223
  mov cx, sp
  mov bp, [bp+2]
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L225: ; Arm: 189'9
  mov dx, g73
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L226: ; Arm: 193'35
  push word [bp+8]
  push word 1
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L227: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L226
  mov dx, [bp+6]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp ax

L228: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L227
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L229: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L225
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov bx, [2]
  mov ax, [bx+2]
  mov [6], ax
  mov ax, [bx+4]
  mov [8], ax
  push word [8]
  push word [4]
  push word bp
  push word [bp+4]
  push word cx
  push word L228
  mov cx, sp
  mov bp, [bp+2]
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L230: ; Continuation
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L231: ; Continuation
  push word cx
  push word L230
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L232: ; Arm: 239'11
  push word g77
  push word [bp+8]
  push word 1
  mov [2], sp
  push word [2]
  push word g74
  push word 1
  mov [4], sp
  push word [bp+4]
  push word cx
  push word L231
  mov cx, sp
  mov bp, [bp+6]
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L233: ; Continuation
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L234: ; Arm: 242'16
  mov ax, [bx+2]
  mov [4], ax
  push word cx
  push word L233
  mov cx, sp
  mov bp, [bp+4]
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L235: ; Continuation
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L236: ; Continuation
  push word cx
  push word L235
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L237: ; Continuation
  mov bx, dx
  cmp word [bx], 0
  jz L232
  mov ax, [bx+2]
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 0
  jz L234
  mov ax, [bx+2]
  mov [4], ax
  mov ax, [bx+4]
  mov [6], ax
  push word g81
  push word [bp+8]
  push word 1
  mov [8], sp
  push word [8]
  push word g78
  push word 1
  mov [10], sp
  push word [bp+4]
  push word cx
  push word L236
  mov cx, sp
  mov bp, [bp+6]
  mov dx, [10]
  mov ax, [bp]
  jmp ax

L238: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L237
  mov cx, sp
  mov bp, [bp+10]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L239: ; Function: t1
  push word dx
  push word [bp+4]
  push word L229
  mov [2], sp
  push word [2]
  push word dx
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L238
  mov cx, sp
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [4], ax
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L240: ; Continuation
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L241: ; Continuation
  push word [bp+4]
  push word cx
  push word L240
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+6]
  mov ax, [bp]
  jmp ax

L242: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L239
  mov [2], sp
  push word [bp+12]
  push word [bp+10]
  push word cx
  push word L241
  mov cx, sp
  mov bp, g5
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L243: ; Continuation
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L244: ; Continuation
  push word cx
  push word L243
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L245: ; Arm: 239'11
  push word g68
  push word [bp+12]
  push word 1
  mov [2], sp
  push word [2]
  push word g65
  push word 1
  mov [4], sp
  push word [bp+4]
  push word cx
  push word L244
  mov cx, sp
  mov bp, [bp+8]
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L246: ; Continuation
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L247: ; Arm: 242'16
  mov ax, [bx+2]
  mov [4], ax
  push word cx
  push word L246
  mov cx, sp
  mov bp, [bp+4]
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L248: ; Continuation
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L249: ; Continuation
  push word cx
  push word L248
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L250: ; Continuation
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L242
  mov cx, sp
  mov bx, dx
  cmp word [bx], 0
  jz L245
  mov ax, [bx+2]
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 0
  jz L247
  mov ax, [bx+2]
  mov [4], ax
  mov ax, [bx+4]
  mov [6], ax
  push word g72
  push word [bp+12]
  push word 1
  mov [8], sp
  push word [8]
  push word g69
  push word 1
  mov [10], sp
  push word [bp+4]
  push word cx
  push word L249
  mov cx, sp
  mov bp, [bp+8]
  mov dx, [10]
  mov ax, [bp]
  jmp ax

L251: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L250
  mov cx, sp
  mov bp, [bp+16]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L252: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L219
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  push word [2]
  push word [bp+4]
  push word L224
  mov [6], sp
  push word [6]
  push word [4]
  push word [2]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L251
  mov cx, sp
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [8], ax
  mov dx, [8]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L253: ; Function: t1
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L252
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L254: ; Continuation
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L255: ; Continuation
  push word [bp+4]
  push word cx
  push word L254
  mov cx, sp
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L256: ; Arm: 283'7
  push word [bp+8]
  push word cx
  push word L255
  mov cx, sp
  mov bp, [bp+2]
  mov dx, g84
  mov ax, [bp]
  jmp ax

L257: ; Continuation
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L258: ; Continuation
  push word [bp+4]
  push word cx
  push word L257
  mov cx, sp
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L259: ; Continuation
  push word [bp+6]
  push word cx
  push word L258
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L260: ; Arm: 286'10
  push word g88
  push word [2]
  push word 1
  mov [6], sp
  push word [6]
  push word g85
  push word 1
  mov [8], sp
  push word [bp+8]
  push word [bp+2]
  push word cx
  push word L259
  mov cx, sp
  mov bp, [bp+6]
  mov dx, [8]
  mov ax, [bp]
  jmp ax

L261: ; Continuation
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L262: ; Continuation
  push word [bp+4]
  push word cx
  push word L261
  mov cx, sp
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L263: ; Arm: 289'12
  mov ax, [bx+2]
  mov [10], ax
  mov ax, [bx+4]
  mov [12], ax
  push word [bp+8]
  push word cx
  push word L262
  mov cx, sp
  mov bp, [bp+2]
  mov dx, g89
  mov ax, [bp]
  jmp ax

L264: ; Arm: 189'9
  mov dx, g90
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L265: ; Arm: 193'35
  push word [bp+8]
  push word 1
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L266: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L265
  mov dx, [bp+6]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp ax

L267: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L266
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L268: ; Function: t5
  mov bx, dx
  cmp word [bx], 0
  jz L264
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov bx, [2]
  mov ax, [bx+2]
  mov [6], ax
  mov ax, [bx+4]
  mov [8], ax
  push word [8]
  push word [4]
  push word bp
  push word [bp+4]
  push word cx
  push word L267
  mov cx, sp
  mov bp, [bp+2]
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L269: ; Continuation
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L270: ; Continuation
  push word [bp+4]
  push word cx
  push word L269
  mov cx, sp
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L271: ; Continuation
  push word [bp+6]
  push word cx
  push word L270
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L272: ; Arm: 292'15
  push word g94
  push word [bp+10]
  push word 1
  mov [2], sp
  push word [2]
  push word g91
  push word 1
  mov [4], sp
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L271
  mov cx, sp
  mov bp, [bp+6]
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L273: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word 0
  mov [2], sp
  push word dx
  push word [2]
  push word 1
  mov [4], sp
  push word [4]
  push word 0
  mov [6], sp
  mov dx, [6]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L274: ; Continuation
  mov bx, dx
  cmp word [bx], 0
  jz L272
  mov ax, [bx+2]
  mov [2], ax
  push word [2]
  push word [bp+12]
  push word cx
  push word L273
  mov cx, sp
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [4], ax
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L275: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L274
  mov cx, sp
  mov bp, [bp+14]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L276: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L256
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov bx, [4]
  cmp word [bx], 0
  jz L260
  mov ax, [bx+2]
  mov [6], ax
  mov ax, [bx+4]
  mov [8], ax
  mov bx, [8]
  cmp word [bx], 1
  jz L263
  push word [2]
  push word [bp+4]
  push word L268
  mov [10], sp
  push word [10]
  push word [6]
  push word [2]
  push word [bp+8]
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L275
  mov cx, sp
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [12], ax
  mov dx, [12]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L277: ; Function: t4
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L276
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L278: ; Continuation
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L279: ; Continuation
  push word [bp+4]
  push word cx
  push word L278
  mov cx, sp
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L280: ; Arm: 326'7
  push word [bp+12]
  push word cx
  push word L279
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g97
  mov ax, [bp]
  jmp ax

L281: ; Continuation
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L282: ; Continuation
  push word [bp+4]
  push word cx
  push word L281
  mov cx, sp
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L283: ; Arm: 329'12
  mov ax, [bx+2]
  mov [6], ax
  mov ax, [bx+4]
  mov [8], ax
  push word [bp+12]
  push word cx
  push word L282
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g98
  mov ax, [bp]
  jmp ax

L284: ; Arm: 144'22
  mov ax, `\n`
  call Bare_put_char
  mov [8], ax
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L285: ; Arm: 145'28
  mov ax, '^'
  call Bare_put_char
  mov [10], ax
  mov ax, 'D'
  call Bare_put_char
  mov [12], ax
  mov ax, `\n`
  call Bare_put_char
  mov [14], ax
  push word dx
  push word 4
  push word 1
  mov [16], sp
  mov bp, [bp+2]
  mov dx, [16]
  mov ax, [bp]
  jmp ax

L286: ; Arm: 146'19
  mov bp, bp
  mov dx, dx
  mov ax, [bp]
  jmp ax

L287: ; Arm: 149'17
  mov bp, bp
  mov dx, dx
  mov ax, [bp]
  jmp ax

L288: ; Continuation
  mov ax, 8
  call Bare_put_char
  mov [2], ax
  mov ax, ' '
  call Bare_put_char
  mov [4], ax
  mov ax, 8
  call Bare_put_char
  mov [6], ax
  mov dx, [bp+6]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp ax

L289: ; Arm: 151'31
  mov ax, 8
  call Bare_put_char
  mov [2], ax
  mov ax, ' '
  call Bare_put_char
  mov [4], ax
  mov ax, 8
  call Bare_put_char
  mov [6], ax
  mov dx, [6]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L290: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L288
  mov cx, sp
  mov bx, dx
  cmp word [bx], 1
  jz L289
  mov dx, g104
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L291: ; Arm: 8'9
  mov dx, g102
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L292: ; Arm: 147'21
  mov bx, dx
  cmp word [bx], 0
  jz L287
  mov ax, [bx+2]
  mov [14], ax
  mov ax, [bx+4]
  mov [16], ax
  mov ax, [14]
  call Bare_char_to_num
  mov [18], ax
  mov ax, 26
  cmp word ax, [18]
  call Bare_make_bool_from_n
  mov [20], ax
  push word [16]
  push word bp
  push word cx
  push word L290
  mov cx, sp
  mov bx, [20]
  cmp word [bx], 1
  jz L291
  mov dx, g103
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L293: ; Continuation
  push word [bp+4]
  push word [bp+8]
  push word 1
  mov [2], sp
  mov bp, [bp+6]
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L294: ; Arm: 105'19
  mov ax, [2]
  call Bare_put_char
  mov [18], ax
  mov dx, [18]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L295: ; Arm: 106'22
  mov ax, [2]
  call Bare_put_char
  mov [20], ax
  mov dx, [20]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L296: ; Arm: 107'16
  mov ax, [2]
  call Bare_put_char
  mov [22], ax
  mov dx, [22]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L297: ; Function: t1
  call Bare_get_char
  mov [2], ax
  mov ax, [2]
  call Bare_char_to_num
  mov [4], ax
  mov ax, [2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [6], ax
  mov bx, [6]
  cmp word [bx], 1
  jz L284
  mov ax, [2]
  cmp word ax, 4
  call Bare_make_bool_from_z
  mov [8], ax
  mov bx, [8]
  cmp word [bx], 1
  jz L285
  mov ax, 127
  cmp word ax, [4]
  call Bare_make_bool_from_n
  mov [10], ax
  mov bx, [10]
  cmp word [bx], 1
  jz L286
  mov ax, [4]
  cmp word ax, 127
  call Bare_make_bool_from_z
  mov [12], ax
  mov bx, [12]
  cmp word [bx], 1
  jz L292
  mov ax, [2]
  call Bare_char_to_num
  mov [14], ax
  mov ax, [14]
  cmp word ax, 8
  call Bare_make_bool_from_z
  mov [16], ax
  push word [2]
  push word bp
  push word dx
  push word cx
  push word L293
  mov cx, sp
  mov bx, [16]
  cmp word [bx], 1
  jz L294
  mov ax, [2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [18], ax
  mov bx, [18]
  cmp word [bx], 1
  jz L295
  mov ax, 26
  cmp word ax, [14]
  call Bare_make_bool_from_n
  mov [20], ax
  mov bx, [20]
  cmp word [bx], 1
  jz L296
  mov ax, '^'
  call Bare_put_char
  mov [22], ax
  mov ax, 65
  add ax, [14]
  mov [24], ax
  mov ax, [24]
  sub ax, 1
  mov [26], ax
  mov ax, [26]
  call Bare_num_to_char
  mov [28], ax
  mov ax, [28]
  call Bare_put_char
  mov [30], ax
  mov dx, [30]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L298: ; Continuation
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L299: ; Continuation
  push word [bp+4]
  push word cx
  push word L298
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+6]
  mov ax, [bp]
  jmp ax

L300: ; Arm: 335'44
  push word [bp+10]
  push word [bp+8]
  push word cx
  push word L299
  mov cx, sp
  mov bp, g8
  mov dx, g106
  mov ax, [bp]
  jmp ax

L301: ; Continuation
  push word [bp+4]
  push word dx
  push word 1
  mov [2], sp
  mov bp, [bp+6]
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L302: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L301
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L303: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L302
  mov cx, sp
  mov bp, [bp+10]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L304: ; Continuation
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L303
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+10]
  mov ax, [bp]
  jmp ax

L305: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L304
  mov cx, sp
  mov bp, g8
  mov dx, g108
  mov ax, [bp]
  jmp ax

L306: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L305
  mov cx, sp
  mov bp, g8
  mov dx, dx
  mov ax, [bp]
  jmp ax

L307: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L306
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g107
  mov ax, [bp]
  jmp ax

L308: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L300
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L307
  mov cx, sp
  mov dx, [bp+14]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L309: ; Continuation
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L308
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+10]
  mov ax, [bp]
  jmp ax

L310: ; Continuation
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L309
  mov cx, sp
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L311: ; Function: t1
  push word [bp+4]
  push word L297
  mov [2], sp
  push word bp
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L310
  mov cx, sp
  mov bp, [2]
  mov dx, g105
  mov ax, [bp]
  jmp ax

L312: ; Continuation
  push word [bp+6]
  push word 0
  mov [2], sp
  push word [2]
  push word [bp+4]
  push word 0
  mov [4], sp
  push word dx
  push word [4]
  push word 1
  mov [6], sp
  push word [6]
  push word 0
  mov [8], sp
  mov dx, [8]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L313: ; Continuation
  push word dx
  push word [bp+6]
  push word cx
  push word L312
  mov cx, sp
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [2], ax
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L314: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L311
  mov [2], sp
  push word [bp+16]
  push word [bp+14]
  push word cx
  push word L313
  mov cx, sp
  mov bp, [2]
  mov dx, g109
  mov ax, [bp]
  jmp ax

L315: ; Continuation
  push word g100
  push word 4
  push word 1
  mov [2], sp
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L314
  mov cx, sp
  mov bp, [bp+4]
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L316: ; Continuation
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L315
  mov cx, sp
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L317: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L280
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov bx, [4]
  cmp word [bx], 1
  jz L283
  push word [2]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L316
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g99
  mov ax, [bp]
  jmp ax

L318: ; Function: t7
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L317
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L319: ; Continuation
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L320: ; Continuation
  push word [bp+4]
  push word cx
  push word L319
  mov cx, sp
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L321: ; Arm: 321'7
  push word [bp+8]
  push word cx
  push word L320
  mov cx, sp
  mov bp, [bp+2]
  mov dx, g112
  mov ax, [bp]
  jmp ax

L322: ; Arm: 189'9
  mov dx, g113
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L323: ; Arm: 193'35
  push word [bp+8]
  push word 1
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L324: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L323
  mov dx, [bp+6]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp ax

L325: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L324
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L326: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L322
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov bx, [2]
  mov ax, [bx+2]
  mov [6], ax
  mov ax, [bx+4]
  mov [8], ax
  push word [8]
  push word [4]
  push word bp
  push word [bp+4]
  push word cx
  push word L325
  mov cx, sp
  mov bp, [bp+2]
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L327: ; Continuation
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L328: ; Continuation
  push word cx
  push word L327
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L329: ; Arm: 314'11
  push word g116
  push word [bp+8]
  push word 1
  mov [2], sp
  push word [bp+4]
  push word cx
  push word L328
  mov cx, sp
  mov bp, [bp+6]
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L330: ; Continuation
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L331: ; Continuation
  push word cx
  push word L330
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L332: ; Arm: 317'16
  mov ax, [bx+2]
  mov [4], ax
  push word g119
  push word [bp+8]
  push word 1
  mov [6], sp
  push word [bp+4]
  push word cx
  push word L331
  mov cx, sp
  mov bp, [bp+6]
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L333: ; Continuation
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L334: ; Continuation
  push word cx
  push word L333
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L335: ; Continuation
  mov bx, dx
  cmp word [bx], 0
  jz L329
  mov ax, [bx+2]
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 0
  jz L332
  mov ax, [bx+2]
  mov [4], ax
  mov ax, [bx+4]
  mov [6], ax
  push word g122
  push word [bp+8]
  push word 1
  mov [8], sp
  push word [bp+4]
  push word cx
  push word L334
  mov cx, sp
  mov bp, [bp+6]
  mov dx, [8]
  mov ax, [bp]
  jmp ax

L336: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L335
  mov cx, sp
  mov bp, [bp+10]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L337: ; Function: t3
  push word dx
  push word [bp+4]
  push word L326
  mov [2], sp
  push word [2]
  push word dx
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L336
  mov cx, sp
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [4], ax
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L338: ; Continuation
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L339: ; Continuation
  push word [bp+4]
  push word cx
  push word L338
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+6]
  mov ax, [bp]
  jmp ax

L340: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L321
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L337
  mov [6], sp
  push word dx
  push word [bp+8]
  push word cx
  push word L339
  mov cx, sp
  mov bp, g5
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L341: ; Function: t10
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L340
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L342: ; Continuation
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L343: ; Continuation
  push word [bp+4]
  push word cx
  push word L342
  mov cx, sp
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L344: ; Arm: 231'9
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  push word [bp+4]
  push word cx
  push word L343
  mov cx, sp
  mov bp, [bp+2]
  mov dx, g125
  mov ax, [bp]
  jmp ax

L345: ; Arm: 200'9
  mov dx, g127
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L346: ; Continuation
  mov dx, [bp+6]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp ax

L347: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L346
  mov cx, sp
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L348: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L345
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov ax, ' '
  call Bare_put_char
  mov [6], ax
  push word [4]
  push word bp
  push word cx
  push word L347
  mov cx, sp
  mov bp, [bp+2]
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L349: ; Continuation
  mov ax, `\n`
  call Bare_put_char
  mov [2], ax
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L350: ; Arm: 204'9
  mov dx, g128
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L351: ; Continuation
  mov dx, [bp+6]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp ax

L352: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L351
  mov cx, sp
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L353: ; Continuation
  push word [bp+4]
  push word L348
  mov [2], sp
  push word [bp+6]
  push word cx
  push word L349
  mov cx, sp
  mov bx, dx
  cmp word [bx], 0
  jz L350
  mov ax, [bx+2]
  mov [4], ax
  mov ax, [bx+4]
  mov [6], ax
  push word [6]
  push word [2]
  push word cx
  push word L352
  mov cx, sp
  mov bp, [bp+4]
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L354: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L353
  mov cx, sp
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L355: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L354
  mov cx, sp
  mov bx, [bp+6]
  mov ax, [bx+2]
  mov [2], ax
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L356: ; Function: t1
  mov bx, dx
  cmp word [bx], 1
  jz L344
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L355
  mov cx, sp
  mov bp, g3
  mov dx, g126
  mov ax, [bp]
  jmp ax

L357: ; Function: t13
  push word dx
  push word [bp+2]
  push word L356
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L358: ; Continuation
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L359: ; Continuation
  push word [bp+4]
  push word cx
  push word L358
  mov cx, sp
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L360: ; Arm: 260'7
  push word [bp+8]
  push word cx
  push word L359
  mov cx, sp
  mov bp, [bp+2]
  mov dx, g131
  mov ax, [bp]
  jmp ax

L361: ; Arm: 189'9
  mov dx, g132
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L362: ; Arm: 193'35
  push word [bp+8]
  push word 1
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L363: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L362
  mov dx, [bp+6]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp ax

L364: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L363
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L365: ; Function: t3
  mov bx, dx
  cmp word [bx], 0
  jz L361
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov bx, [2]
  mov ax, [bx+2]
  mov [6], ax
  mov ax, [bx+4]
  mov [8], ax
  push word [8]
  push word [4]
  push word bp
  push word [bp+4]
  push word cx
  push word L364
  mov cx, sp
  mov bp, [bp+2]
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L366: ; Arm: 189'9
  mov dx, g141
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L367: ; Arm: 193'35
  push word [bp+8]
  push word 1
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L368: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L367
  mov dx, [bp+6]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp ax

L369: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L368
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L370: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L366
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov bx, [2]
  mov ax, [bx+2]
  mov [6], ax
  mov ax, [bx+4]
  mov [8], ax
  push word [8]
  push word [4]
  push word bp
  push word [bp+4]
  push word cx
  push word L369
  mov cx, sp
  mov bp, [bp+2]
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L371: ; Continuation
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L372: ; Continuation
  push word cx
  push word L371
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L373: ; Arm: 253'11
  push word g145
  push word [bp+8]
  push word 1
  mov [2], sp
  push word [2]
  push word g142
  push word 1
  mov [4], sp
  push word [bp+4]
  push word cx
  push word L372
  mov cx, sp
  mov bp, [bp+6]
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L374: ; Continuation
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L375: ; Continuation
  push word cx
  push word L374
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L376: ; Arm: 256'16
  mov ax, [bx+2]
  mov [4], ax
  push word g149
  push word [bp+8]
  push word 1
  mov [6], sp
  push word [6]
  push word g146
  push word 1
  mov [8], sp
  push word [bp+4]
  push word cx
  push word L375
  mov cx, sp
  mov bp, [bp+6]
  mov dx, [8]
  mov ax, [bp]
  jmp ax

L377: ; Continuation
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L378: ; Continuation
  mov bx, dx
  cmp word [bx], 0
  jz L373
  mov ax, [bx+2]
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 0
  jz L376
  mov ax, [bx+2]
  mov [4], ax
  mov ax, [bx+4]
  mov [6], ax
  push word cx
  push word L377
  mov cx, sp
  mov bp, [bp+4]
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L379: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L378
  mov cx, sp
  mov bp, [bp+10]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L380: ; Function: t1
  push word dx
  push word [bp+4]
  push word L370
  mov [2], sp
  push word [2]
  push word dx
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L379
  mov cx, sp
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [4], ax
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L381: ; Continuation
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L382: ; Continuation
  push word [bp+4]
  push word cx
  push word L381
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+6]
  mov ax, [bp]
  jmp ax

L383: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L380
  mov [2], sp
  push word [bp+12]
  push word [bp+10]
  push word cx
  push word L382
  mov cx, sp
  mov bp, g5
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L384: ; Continuation
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L385: ; Continuation
  push word cx
  push word L384
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L386: ; Arm: 253'11
  push word g136
  push word [bp+12]
  push word 1
  mov [2], sp
  push word [2]
  push word g133
  push word 1
  mov [4], sp
  push word [bp+4]
  push word cx
  push word L385
  mov cx, sp
  mov bp, [bp+8]
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L387: ; Continuation
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L388: ; Continuation
  push word cx
  push word L387
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L389: ; Arm: 256'16
  mov ax, [bx+2]
  mov [4], ax
  push word g140
  push word [bp+12]
  push word 1
  mov [6], sp
  push word [6]
  push word g137
  push word 1
  mov [8], sp
  push word [bp+4]
  push word cx
  push word L388
  mov cx, sp
  mov bp, [bp+8]
  mov dx, [8]
  mov ax, [bp]
  jmp ax

L390: ; Continuation
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L391: ; Continuation
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L383
  mov cx, sp
  mov bx, dx
  cmp word [bx], 0
  jz L386
  mov ax, [bx+2]
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 0
  jz L389
  mov ax, [bx+2]
  mov [4], ax
  mov ax, [bx+4]
  mov [6], ax
  push word cx
  push word L390
  mov cx, sp
  mov bp, [bp+4]
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L392: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L391
  mov cx, sp
  mov bp, [bp+16]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L393: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L360
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  push word [2]
  push word [bp+4]
  push word L365
  mov [6], sp
  push word [6]
  push word [4]
  push word [2]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L392
  mov cx, sp
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [8], ax
  mov dx, [8]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L394: ; Function: t16
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L393
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L395: ; Continuation
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L396: ; Continuation
  push word [bp+4]
  push word cx
  push word L395
  mov cx, sp
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L397: ; Arm: 298'7
  push word [bp+8]
  push word cx
  push word L396
  mov cx, sp
  mov bp, [bp+2]
  mov dx, g152
  mov ax, [bp]
  jmp ax

L398: ; Continuation
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L399: ; Continuation
  push word [bp+4]
  push word cx
  push word L398
  mov cx, sp
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L400: ; Continuation
  push word [bp+6]
  push word cx
  push word L399
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L401: ; Arm: 301'10
  push word g156
  push word [2]
  push word 1
  mov [6], sp
  push word [6]
  push word g153
  push word 1
  mov [8], sp
  push word [bp+8]
  push word [bp+2]
  push word cx
  push word L400
  mov cx, sp
  mov bp, [bp+6]
  mov dx, [8]
  mov ax, [bp]
  jmp ax

L402: ; Continuation
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L403: ; Continuation
  push word [bp+4]
  push word cx
  push word L402
  mov cx, sp
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L404: ; Arm: 304'12
  mov ax, [bx+2]
  mov [10], ax
  mov ax, [bx+4]
  mov [12], ax
  push word [bp+8]
  push word cx
  push word L403
  mov cx, sp
  mov bp, [bp+2]
  mov dx, g157
  mov ax, [bp]
  jmp ax

L405: ; Arm: 189'9
  mov dx, g158
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L406: ; Arm: 193'35
  push word [bp+8]
  push word 1
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L407: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L406
  mov dx, [bp+6]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp ax

L408: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L407
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L409: ; Function: t5
  mov bx, dx
  cmp word [bx], 0
  jz L405
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov bx, [2]
  mov ax, [bx+2]
  mov [6], ax
  mov ax, [bx+4]
  mov [8], ax
  push word [8]
  push word [4]
  push word bp
  push word [bp+4]
  push word cx
  push word L408
  mov cx, sp
  mov bp, [bp+2]
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L410: ; Continuation
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L411: ; Continuation
  push word [bp+4]
  push word cx
  push word L410
  mov cx, sp
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L412: ; Continuation
  push word [bp+6]
  push word cx
  push word L411
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L413: ; Arm: 307'15
  push word g162
  push word [bp+12]
  push word 1
  mov [2], sp
  push word [2]
  push word g159
  push word 1
  mov [4], sp
  push word [bp+10]
  push word [bp+4]
  push word cx
  push word L412
  mov cx, sp
  mov bp, [bp+8]
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L414: ; Continuation
  mov dx, g167
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L415: ; Continuation
  push word cx
  push word L414
  mov cx, sp
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L416: ; Continuation
  push word cx
  push word L415
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L417: ; Arm: 266'9
  push word g166
  push word [bp+8]
  push word 1
  mov [2], sp
  push word [2]
  push word g163
  push word 1
  mov [4], sp
  push word [bp+2]
  push word cx
  push word L416
  mov cx, sp
  mov bp, [bp+6]
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L418: ; Arm: 271'35
  mov dx, [bp+6]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L419: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word 0
  mov [2], sp
  push word dx
  push word [2]
  push word 1
  mov [4], sp
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L420: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L418
  push word [bp+10]
  push word [bp+8]
  push word cx
  push word L419
  mov cx, sp
  mov dx, [bp+6]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp ax

L421: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L420
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L422: ; Function: t2
  mov bx, dx
  cmp word [bx], 0
  jz L417
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov bx, [2]
  mov ax, [bx+2]
  mov [6], ax
  mov ax, [bx+4]
  mov [8], ax
  push word [8]
  push word [6]
  push word [4]
  push word bp
  push word [bp+8]
  push word cx
  push word L421
  mov cx, sp
  mov bp, [bp+4]
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L423: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word 0
  mov [2], sp
  push word dx
  push word [2]
  push word 1
  mov [4], sp
  push word [4]
  push word 0
  mov [6], sp
  mov dx, [6]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L424: ; Continuation
  push word dx
  push word 0
  mov [2], sp
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L423
  mov cx, sp
  mov bx, [2]
  mov ax, [bx+2]
  mov [4], ax
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L425: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L424
  mov cx, sp
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L426: ; Continuation
  mov bx, dx
  cmp word [bx], 0
  jz L413
  mov ax, [bx+2]
  mov [2], ax
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L422
  mov [4], sp
  push word [4]
  push word [2]
  push word [bp+14]
  push word cx
  push word L425
  mov cx, sp
  mov bx, [bp+10]
  mov ax, [bx+2]
  mov [6], ax
  mov dx, [6]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L427: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L426
  mov cx, sp
  mov bp, [bp+16]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L428: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L397
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov bx, [4]
  cmp word [bx], 0
  jz L401
  mov ax, [bx+2]
  mov [6], ax
  mov ax, [bx+4]
  mov [8], ax
  mov bx, [8]
  cmp word [bx], 1
  jz L404
  push word [2]
  push word [bp+4]
  push word L409
  mov [10], sp
  push word [10]
  push word [6]
  push word [2]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L427
  mov cx, sp
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [12], ax
  mov dx, [12]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L429: ; Function: t19
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L428
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L430: ; Continuation
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L431: ; Continuation
  push word [bp+4]
  push word cx
  push word L430
  mov cx, sp
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L432: ; Arm: 278'7
  push word [bp+8]
  push word cx
  push word L431
  mov cx, sp
  mov bp, [bp+2]
  mov dx, g170
  mov ax, [bp]
  jmp ax

L433: ; Continuation
  mov dx, g175
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L434: ; Continuation
  push word cx
  push word L433
  mov cx, sp
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L435: ; Continuation
  push word cx
  push word L434
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L436: ; Arm: 266'9
  push word g174
  push word [bp+8]
  push word 1
  mov [2], sp
  push word [2]
  push word g171
  push word 1
  mov [4], sp
  push word [bp+2]
  push word cx
  push word L435
  mov cx, sp
  mov bp, [bp+6]
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L437: ; Arm: 271'35
  mov dx, [bp+6]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L438: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word 0
  mov [2], sp
  push word dx
  push word [2]
  push word 1
  mov [4], sp
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L439: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L437
  push word [bp+10]
  push word [bp+8]
  push word cx
  push word L438
  mov cx, sp
  mov dx, [bp+6]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp ax

L440: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L439
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L441: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L436
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov bx, [2]
  mov ax, [bx+2]
  mov [6], ax
  mov ax, [bx+4]
  mov [8], ax
  push word [8]
  push word [6]
  push word [4]
  push word bp
  push word [bp+8]
  push word cx
  push word L440
  mov cx, sp
  mov bp, [bp+4]
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L442: ; Continuation
  push word dx
  push word 0
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L443: ; Continuation
  push word cx
  push word L442
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L444: ; Function: t1
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L441
  mov [2], sp
  push word [2]
  push word cx
  push word L443
  mov cx, sp
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [4], ax
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L445: ; Function: t3
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L444
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L446: ; Continuation
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L447: ; Continuation
  push word [bp+6]
  push word cx
  push word L446
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L448: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L432
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L445
  mov [6], sp
  push word dx
  push word [bp+8]
  push word cx
  push word L447
  mov cx, sp
  mov bp, g7
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L449: ; Function: t22
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L448
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L450: ; Continuation
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L451: ; Continuation
  push word [bp+4]
  push word cx
  push word L450
  mov cx, sp
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L452: ; Arm: 374'7
  push word [bp+4]
  push word cx
  push word L451
  mov cx, sp
  mov bp, [bp+2]
  mov dx, g182
  mov ax, [bp]
  jmp ax

L453: ; Continuation
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L454: ; Continuation
  push word [bp+4]
  push word cx
  push word L453
  mov cx, sp
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L455: ; Arm: 377'12
  mov ax, [bx+2]
  mov [6], ax
  mov ax, [bx+4]
  mov [8], ax
  push word [bp+4]
  push word cx
  push word L454
  mov cx, sp
  mov bp, [bp+2]
  mov dx, g183
  mov ax, [bp]
  jmp ax

L456: ; Continuation
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L457: ; Continuation
  push word [bp+4]
  push word cx
  push word L456
  mov cx, sp
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L458: ; Arm: 380'15
  push word [bp+6]
  push word cx
  push word L457
  mov cx, sp
  mov bp, [bp+4]
  mov dx, g192
  mov ax, [bp]
  jmp ax

L459: ; Arm: 346'13
  mov dx, g193
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L460: ; Continuation
  mov ax, `\n`
  call Bare_put_char
  mov [2], ax
  mov ax, [bp+4]
  add ax, 1
  mov [4], ax
  mov bp, [bp+6]
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L461: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L460
  mov cx, sp
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L462: ; Arm: 124'11
  push word g200
  push word '0'
  push word 1
  mov [4], sp
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L463: ; Continuation
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L464: ; Continuation
  mov ax, [bp+8]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L461
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L462
  push word [bp+8]
  push word cx
  push word L463
  mov cx, sp
  mov bp, g199
  mov dx, g201
  mov ax, [bp]
  jmp ax

L465: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L464
  mov cx, sp
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L466: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L465
  mov cx, sp
  mov bp, [bp+4]
  mov dx, g198
  mov ax, [bp]
  jmp ax

L467: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L466
  mov cx, sp
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L468: ; Arm: 124'11
  push word g196
  push word '0'
  push word 1
  mov [4], sp
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L469: ; Continuation
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L470: ; Continuation
  mov ax, [bp+6]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L467
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L468
  push word [bp+6]
  push word cx
  push word L469
  mov cx, sp
  mov bp, g195
  mov dx, g197
  mov ax, [bp]
  jmp ax

L471: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L470
  mov cx, sp
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L472: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L471
  mov cx, sp
  mov bp, [bp+4]
  mov dx, g194
  mov ax, [bp]
  jmp ax

L473: ; Function: t2
  mov ax, [bp+4]
  cmp word ax, dx
  call Bare_make_bool_from_n
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L459
  push word bp
  push word dx
  push word [bp+2]
  push word cx
  push word L472
  mov cx, sp
  mov bp, g55
  mov dx, dx
  mov ax, [bp]
  jmp ax

L474: ; Continuation
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L475: ; Continuation
  mov bx, dx
  cmp word [bx], 0
  jz L458
  mov ax, [bx+2]
  mov [2], ax
  push word [2]
  push word [bp+4]
  push word L473
  mov [4], sp
  push word [bp+6]
  push word cx
  push word L474
  mov cx, sp
  mov bp, [4]
  mov dx, 0
  mov ax, [bp]
  jmp ax

L476: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L475
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  mov ax, [bp]
  jmp ax

L477: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L476
  mov cx, sp
  mov bp, g184
  mov dx, 0
  mov ax, [bp]
  jmp ax

L478: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L452
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov bx, [4]
  cmp word [bx], 1
  jz L455
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L477
  mov cx, sp
  mov bp, [bp+2]
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L479: ; Function: t25
  push word dx
  push word [bp+2]
  push word L478
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L480: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L253
  mov [2], sp
  push word [2]
  push word g62
  push word 1
  mov [4], sp
  push word [4]
  push word g61
  push word 0
  mov [6], sp
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L277
  mov [8], sp
  push word [8]
  push word g83
  push word 1
  mov [10], sp
  push word [10]
  push word g82
  push word 0
  mov [12], sp
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L318
  mov [14], sp
  push word [14]
  push word g96
  push word 1
  mov [16], sp
  push word [16]
  push word g95
  push word 0
  mov [18], sp
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L341
  mov [20], sp
  push word [20]
  push word g111
  push word 1
  mov [22], sp
  push word [22]
  push word g110
  push word 0
  mov [24], sp
  push word [bp+8]
  push word L357
  mov [26], sp
  push word [26]
  push word g124
  push word 1
  mov [28], sp
  push word [28]
  push word g123
  push word 0
  mov [30], sp
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L394
  mov [32], sp
  push word [32]
  push word g130
  push word 1
  mov [34], sp
  push word [34]
  push word g129
  push word 0
  mov [36], sp
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L429
  mov [38], sp
  push word [38]
  push word g151
  push word 1
  mov [40], sp
  push word [40]
  push word g150
  push word 0
  mov [42], sp
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L449
  mov [44], sp
  push word [44]
  push word g169
  push word 1
  mov [46], sp
  push word [46]
  push word g168
  push word 0
  mov [48], sp
  push word [bp+8]
  push word L479
  mov [50], sp
  push word [50]
  push word g181
  push word 1
  mov [52], sp
  push word [52]
  push word g180
  push word 0
  mov [54], sp
  push word g202
  push word [54]
  push word 1
  mov [56], sp
  push word [56]
  push word g179
  push word 1
  mov [58], sp
  push word [58]
  push word [48]
  push word 1
  mov [60], sp
  push word [60]
  push word [42]
  push word 1
  mov [62], sp
  push word [62]
  push word [36]
  push word 1
  mov [64], sp
  push word [64]
  push word [30]
  push word 1
  mov [66], sp
  push word [66]
  push word [24]
  push word 1
  mov [68], sp
  push word [68]
  push word [18]
  push word 1
  mov [70], sp
  push word [70]
  push word [12]
  push word 1
  mov [72], sp
  push word [72]
  push word [6]
  push word 1
  mov [74], sp
  push word [74]
  push word g60
  push word 1
  mov [76], sp
  push word [76]
  push word 0
  mov [78], sp
  mov bp, [bp+14]
  mov dx, [78]
  mov ax, [bp]
  jmp ax

L481: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L480
  mov cx, sp
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L482: ; Continuation
  push word [bp+8]
  push word [bp+4]
  push word L100
  mov [2], sp
  push word [bp+6]
  push word L117
  mov [4], sp
  push word [4]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L216
  mov [6], sp
  push word [6]
  push word [2]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L481
  mov cx, sp
  mov bp, [bp+8]
  mov dx, g56
  mov ax, [bp]
  jmp ax

L483: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L482
  mov cx, sp
  mov bp, g1
  mov dx, g22
  mov ax, [bp]
  jmp ax

L484: ; Continuation
  push word dx
  push word [bp+4]
  push word cx
  push word L483
  mov cx, sp
  mov bp, g1
  mov dx, g14
  mov ax, [bp]
  jmp ax

L485: ; Continuation
  push word dx
  push word cx
  push word L484
  mov cx, sp
  mov bp, g1
  mov dx, g12
  mov ax, [bp]
  jmp ax

L486: ; Start
  push word cx
  push word L485
  mov cx, sp
  mov bp, g1
  mov dx, g10
  mov ax, [bp]
  jmp ax

g1: dw L2
g2: dw L5
g3: dw L11
g4: dw 0
g5: dw L16
g6: dw 0
g7: dw L24
g8: dw L28
g9: dw 0
g10: dw L36
g11: dw 0
g12: dw L44
g13: dw 0
g14: dw L50
g15: dw 0
g16: dw 1
g17: dw 0
g18: dw 1
g19: dw 0
g20: dw 1
g21: dw 0
g22: dw L60
g23: dw 0
g24: dw 0
g25: dw L66
g26: dw 0
g27: dw 0
g28: dw 2, '%', ' '
g29: dw 0
g30: dw 0
g31: dw 0
g32: dw 1
g33: dw 0
g34: dw 0
g35: dw 0
g36: dw 0
g37: dw 0
g38: dw 0
g39: dw 17, 'c', 'o', 'm', 'm', 'a', 'n', 'd', ' ', 'n', 'o', 't', ' ', 'f', 'o', 'u', 'n', 'd'
g40: dw 1, `\n`
g41: dw 0
g42: dw 2, ':', ' '
g43: dw 0
g44: dw 0
g45: dw 6, 's', 'h', 'a', 'm', ':', ' '
g46: dw 0
g47: dw 17, 'P', 'e', 'r', 'm', 'i', 's', 's', 'i', 'o', 'n', ' ', 'd', 'e', 'n', 'i', 'e', 'd'
g48: dw 1, `\n`
g49: dw 0
g50: dw 2, ':', ' '
g51: dw 0
g52: dw 0
g53: dw 6, 's', 'h', 'a', 'm', ':', ' '
g54: dw 0
g55: dw L70
g56: dw 51, 'S', 'h', 'a', 'm', ':', ' ', 'I', 'n', '-', 'm', 'e', 'm', 'o', 'r', 'y', ' ', 'f', 'i', 'l', 'e', '-', 's', 'y', 's', 't', 'e', 'm', '.', ' ', 'C', 'o', 'n', 's', 'i', 'd', 'e', 'r', ' ', 't', 'y', 'p', 'i', 'n', 'g', ' ', '"', 'l', 's', '"', '.', `\n`
g57: dw 6, 'r', 'e', 'a', 'd', 'm', 'e'
g58: dw 82, 'W', 'e', 'l', 'c', 'o', 'm', 'e', ' ', 't', 'o', ' ', 's', 'h', 'a', 'm', ';', ' ', 'p', 'l', 'e', 'a', 's', 'e', ' ', 't', 'r', 'y', ' ', 'a', 'l', 'l', ' ', 't', 'h', 'e', ' ', 'c', 'o', 'm', 'm', 'a', 'n', 'd', 's', '!', `\n`, 'C', 'a', 'n', ' ', 'y', 'o', 'u', ' ', 'f', 'i', 'n', 'd', ' ', 't', 'h', 'e', ' ', 'h', 'i', 'd', 'd', 'e', 'n', ' ', 'E', 'a', 's', 't', 'e', 'r', ' ', 'E', 'g', 'g', '?', `\n`
g59: dw 0, g58
g60: dw 0, g57, g59
g61: dw 3, 'c', 'a', 't'
g62: dw 57, 'c', 'a', 't', ' ', '-', ' ', 'c', 'o', 'n', 'c', 'a', 't', 'e', 'n', 'a', 't', 'e', ' ', 'f', 'i', 'l', 'e', 's', ' ', 'a', 'n', 'd', ' ', 'p', 'r', 'i', 'n', 't', ' ', 'o', 'n', ' ', 't', 'h', 'e', ' ', 's', 't', 'a', 'n', 'd', 'a', 'r', 'd', ' ', 'o', 'u', 't', 'p', 'u', 't', `\n`
g63: dw 33, 'c', 'a', 't', ':', ' ', 't', 'a', 'k', 'e', 's', ' ', 'a', 't', ' ', 'l', 'e', 'a', 's', 't', ' ', 'o', 'n', 'e', ' ', 'a', 'r', 'g', 'u', 'm', 'e', 'n', 't', `\n`
g64: dw 0
g65: dw 5, 'c', 'a', 't', ':', ' '
g66: dw 29, ' ', ':', ' ', 'N', 'o', ' ', 's', 'u', 'c', 'h', ' ', 'f', 'i', 'l', 'e', ' ', 'o', 'r', ' ', 'd', 'i', 'r', 'e', 'c', 't', 'o', 'r', 'y', `\n`
g67: dw 0
g68: dw 1, g66, g67
g69: dw 5, 'c', 'a', 't', ':', ' '
g70: dw 19, ' ', ':', ' ', 'N', 'o', 't', ' ', 'a', ' ', 'd', 'a', 't', 'a', ' ', 'f', 'i', 'l', 'e', `\n`
g71: dw 0
g72: dw 1, g70, g71
g73: dw 0
g74: dw 5, 'c', 'a', 't', ':', ' '
g75: dw 29, ' ', ':', ' ', 'N', 'o', ' ', 's', 'u', 'c', 'h', ' ', 'f', 'i', 'l', 'e', ' ', 'o', 'r', ' ', 'd', 'i', 'r', 'e', 'c', 't', 'o', 'r', 'y', `\n`
g76: dw 0
g77: dw 1, g75, g76
g78: dw 5, 'c', 'a', 't', ':', ' '
g79: dw 19, ' ', ':', ' ', 'N', 'o', 't', ' ', 'a', ' ', 'd', 'a', 't', 'a', ' ', 'f', 'i', 'l', 'e', `\n`
g80: dw 0
g81: dw 1, g79, g80
g82: dw 2, 'c', 'p'
g83: dw 32, 'c', 'p', ' ', '-', ' ', 'c', 'o', 'p', 'y', ' ', 'f', 'i', 'l', 'e', 's', ' ', 'a', 'n', 'd', ' ', 'd', 'i', 'r', 'e', 'c', 't', 'o', 'r', 'i', 'e', 's', `\n`
g84: dw 25, 'c', 'p', ':', ' ', 'm', 'i', 's', 's', 'i', 'n', 'g', ' ', 'f', 'i', 'l', 'e', ' ', 'o', 'p', 'e', 'r', 'a', 'n', 'd', `\n`
g85: dw 44, 'c', 'p', ':', ' ', 'm', 'i', 's', 's', 'i', 'n', 'g', ' ', 'd', 'e', 's', 't', 'i', 'n', 'a', 't', 'i', 'o', 'n', ' ', 'f', 'i', 'l', 'e', ' ', 'o', 'p', 'e', 'r', 'a', 'n', 'd', ' ', 'a', 'f', 't', 'e', 'r', ' ', `'`
g86: dw 2, `'`, `\n`
g87: dw 0
g88: dw 1, g86, g87
g89: dw 30, 'c', 'p', ':', ' ', 'u', 'n', 'e', 'x', 'p', 'e', 'c', 't', 'e', 'd', ' ', 'e', 'x', 't', 'r', 'a', ' ', 'o', 'p', 'e', 'r', 'a', 'n', 'd', 's', `\n`
g90: dw 0
g91: dw 17, 'c', 'p', ':', ' ', 'c', 'a', 'n', 'n', 'o', 't', ' ', 's', 't', 'a', 't', ' ', `'`
g92: dw 29, `'`, ':', ' ', 'N', 'o', ' ', 's', 'u', 'c', 'h', ' ', 'f', 'i', 'l', 'e', ' ', 'o', 'r', ' ', 'd', 'i', 'r', 'e', 'c', 't', 'o', 'r', 'y', `\n`
g93: dw 0
g94: dw 1, g92, g93
g95: dw 6, 'c', 'r', 'e', 'a', 't', 'e'
g96: dw 27, 'c', 'r', 'e', 'a', 't', 'e', ' ', '-', ' ', 'c', 'r', 'e', 'a', 't', 'e', ' ', 'a', ' ', 'n', 'e', 'w', ' ', 'f', 'i', 'l', 'e', `\n`
g97: dw 26, 'c', 'r', 'e', 'a', 't', 'e', ':', ' ', 'm', 'i', 's', 's', 'i', 'n', 'g', ' ', 'f', 'i', 'l', 'e', ' ', 'n', 'a', 'm', 'e', `\n`
g98: dw 34, 'c', 'r', 'e', 'a', 't', 'e', ':', ' ', 'u', 'n', 'e', 'x', 'p', 'e', 'c', 't', 'e', 'd', ' ', 'e', 'x', 't', 'r', 'a', ' ', 'o', 'p', 'e', 'r', 'a', 'n', 'd', 's', `\n`
g99: dw 34, '(', 't', 'o', ' ', 'f', 'i', 'n', 'i', 's', 'h', ' ', 't', 'y', 'p', 'e', ' ', '^', 'D', ' ', 'o', 'n', ' ', 'a', ' ', 'n', 'e', 'w', ' ', 'l', 'i', 'n', 'e', ')', `\n`
g100: dw 0
g101: dw 0
g102: dw 0
g103: dw 1
g104: dw 0
g105: dw 0
g106: dw 0
g107: dw 1, `\n`
g108: dw 0
g109: dw 0
g110: dw 4, 'f', 'i', 'l', 'e'
g111: dw 27, 'f', 'i', 'l', 'e', ' ', '-', ' ', 'd', 'e', 't', 'e', 'r', 'm', 'i', 'n', 'e', ' ', 'f', 'i', 'l', 'e', ' ', 't', 'y', 'p', 'e', `\n`
g112: dw 34, 'f', 'i', 'l', 'e', ':', ' ', 't', 'a', 'k', 'e', 's', ' ', 'a', 't', ' ', 'l', 'e', 'a', 's', 't', ' ', 'o', 'n', 'e', ' ', 'a', 'r', 'g', 'u', 'm', 'e', 'n', 't', `\n`
g113: dw 0
g114: dw 29, ' ', ':', ' ', 'N', 'o', ' ', 's', 'u', 'c', 'h', ' ', 'f', 'i', 'l', 'e', ' ', 'o', 'r', ' ', 'd', 'i', 'r', 'e', 'c', 't', 'o', 'r', 'y', `\n`
g115: dw 0
g116: dw 1, g114, g115
g117: dw 13, ':', ' ', 'A', 'S', 'C', 'I', 'I', ' ', 't', 'e', 'x', 't', `\n`
g118: dw 0
g119: dw 1, g117, g118
g120: dw 13, ':', ' ', 'e', 'x', 'e', 'c', 'u', 't', 'a', 'b', 'l', 'e', `\n`
g121: dw 0
g122: dw 1, g120, g121
g123: dw 2, 'l', 's'
g124: dw 29, 'l', 's', ' ', '-', ' ', 'l', 'i', 's', 't', ' ', 'd', 'i', 'r', 'e', 'c', 't', 'o', 'r', 'y', ' ', 'c', 'o', 'n', 't', 'e', 'n', 't', 's', `\n`
g125: dw 23, 'l', 's', ':', ' ', 't', 'a', 'k', 'e', 's', ' ', 'n', 'o', ' ', 'a', 'r', 'g', 'u', 'm', 'e', 'n', 't', 's', `\n`
g126: dw L71
g127: dw 0
g128: dw 0
g129: dw 3, 'm', 'a', 'n'
g130: dw 51, 'm', 'a', 'n', ' ', '-', ' ', 'a', 'n', ' ', 'i', 'n', 't', 'e', 'r', 'f', 'a', 'c', 'e', ' ', 't', 'o', ' ', 't', 'h', 'e', ' ', 's', 'y', 's', 't', 'e', 'm', ' ', 'r', 'e', 'f', 'e', 'r', 'e', 'n', 'c', 'e', ' ', 'm', 'a', 'n', 'u', 'a', 'l', 's', `\n`
g131: dw 30, 'W', 'h', 'a', 't', ' ', 'm', 'a', 'n', 'u', 'a', 'l', ' ', 'p', 'a', 'g', 'e', ' ', 'd', 'o', ' ', 'y', 'o', 'u', ' ', 'w', 'a', 'n', 't', '?', `\n`
g132: dw 0
g133: dw 20, 'N', 'o', ' ', 'm', 'a', 'n', 'u', 'a', 'l', ' ', 'e', 'n', 't', 'r', 'y', ' ', 'f', 'o', 'r', ' '
g134: dw 1, `\n`
g135: dw 0
g136: dw 1, g134, g135
g137: dw 20, 'N', 'o', ' ', 'm', 'a', 'n', 'u', 'a', 'l', ' ', 'e', 'n', 't', 'r', 'y', ' ', 'f', 'o', 'r', ' '
g138: dw 1, `\n`
g139: dw 0
g140: dw 1, g138, g139
g141: dw 0
g142: dw 20, 'N', 'o', ' ', 'm', 'a', 'n', 'u', 'a', 'l', ' ', 'e', 'n', 't', 'r', 'y', ' ', 'f', 'o', 'r', ' '
g143: dw 1, `\n`
g144: dw 0
g145: dw 1, g143, g144
g146: dw 20, 'N', 'o', ' ', 'm', 'a', 'n', 'u', 'a', 'l', ' ', 'e', 'n', 't', 'r', 'y', ' ', 'f', 'o', 'r', ' '
g147: dw 1, `\n`
g148: dw 0
g149: dw 1, g147, g148
g150: dw 2, 'm', 'v'
g151: dw 25, 'm', 'v', ' ', '-', ' ', 'm', 'o', 'v', 'e', ' ', '(', 'r', 'e', 'n', 'a', 'm', 'e', ')', ' ', 'f', 'i', 'l', 'e', 's', `\n`
g152: dw 25, 'm', 'v', ':', ' ', 'm', 'i', 's', 's', 'i', 'n', 'g', ' ', 'f', 'i', 'l', 'e', ' ', 'o', 'p', 'e', 'r', 'a', 'n', 'd', `\n`
g153: dw 44, 'm', 'v', ':', ' ', 'm', 'i', 's', 's', 'i', 'n', 'g', ' ', 'd', 'e', 's', 't', 'i', 'n', 'a', 't', 'i', 'o', 'n', ' ', 'f', 'i', 'l', 'e', ' ', 'o', 'p', 'e', 'r', 'a', 'n', 'd', ' ', 'a', 'f', 't', 'e', 'r', ' ', `'`
g154: dw 2, `'`, `\n`
g155: dw 0
g156: dw 1, g154, g155
g157: dw 30, 'm', 'v', ':', ' ', 'u', 'n', 'e', 'x', 'p', 'e', 'c', 't', 'e', 'd', ' ', 'e', 'x', 't', 'r', 'a', ' ', 'o', 'p', 'e', 'r', 'a', 'n', 'd', 's', `\n`
g158: dw 0
g159: dw 17, 'm', 'v', ':', ' ', 'c', 'a', 'n', 'n', 'o', 't', ' ', 's', 't', 'a', 't', ' ', `'`
g160: dw 29, `'`, ':', ' ', 'N', 'o', ' ', 's', 'u', 'c', 'h', ' ', 'f', 'i', 'l', 'e', ' ', 'o', 'r', ' ', 'd', 'i', 'r', 'e', 'c', 't', 'o', 'r', 'y', `\n`
g161: dw 0
g162: dw 1, g160, g161
g163: dw 19, 'r', 'm', ':', ' ', 'c', 'a', 'n', 'n', 'o', 't', ' ', 'r', 'e', 'm', 'o', 'v', 'e', ' ', `'`
g164: dw 29, `'`, ':', ' ', 'N', 'o', ' ', 's', 'u', 'c', 'h', ' ', 'f', 'i', 'l', 'e', ' ', 'o', 'r', ' ', 'd', 'i', 'r', 'e', 'c', 't', 'o', 'r', 'y', `\n`
g165: dw 0
g166: dw 1, g164, g165
g167: dw 0
g168: dw 2, 'r', 'm'
g169: dw 66, 'r', 'm', ' ', '-', ' ', 'r', 'e', 'm', 'o', 'v', 'e', ' ', 'f', 'i', 'l', 'e', 's', ' ', 'o', 'r', ' ', 'd', 'i', 'r', 'e', 'c', 't', 'o', 'r', 'i', 'e', 's', ' ', '(', 'd', 'i', 'r', 'e', 'c', 't', 'o', 'r', 'i', 'e', 's', ' ', 'n', 'o', 't', ' ', 's', 'u', 'p', 'p', 'o', 'r', 't', 'e', 'd', ' ', 'y', 'e', 't', '!', ')', `\n`
g170: dw 20, 'r', 'm', ':', ' ', 'm', 'i', 's', 's', 'i', 'n', 'g', ' ', 'o', 'p', 'e', 'r', 'a', 'n', 'd', `\n`
g171: dw 19, 'r', 'm', ':', ' ', 'c', 'a', 'n', 'n', 'o', 't', ' ', 'r', 'e', 'm', 'o', 'v', 'e', ' ', `'`
g172: dw 29, `'`, ':', ' ', 'N', 'o', ' ', 's', 'u', 'c', 'h', ' ', 'f', 'i', 'l', 'e', ' ', 'o', 'r', ' ', 'd', 'i', 'r', 'e', 'c', 't', 'o', 'r', 'y', `\n`
g173: dw 0
g174: dw 1, g172, g173
g175: dw 0
g176: dw 3, 'c', 'a', 't'
g177: dw 219, 'I', ' ', 'h', 'a', 'v', 'e', ' ', 'a', ' ', 'l', 'i', 't', 't', 'l', 'e', ' ', 's', 'h', 'a', 'd', 'o', 'w', ' ', 't', 'h', 'a', 't', ' ', 'g', 'o', 'e', 's', ' ', 'i', 'n', ' ', 'a', 'n', 'd', ' ', 'o', 'u', 't', ' ', 'w', 'i', 't', 'h', ' ', 'm', 'e', ',', `\n`, 'A', 'n', 'd', ' ', 'w', 'h', 'a', 't', ' ', 'c', 'a', 'n', ' ', 'b', 'e', ' ', 't', 'h', 'e', ' ', 'u', 's', 'e', ' ', 'o', 'f', ' ', 'h', 'i', 'm', ' ', 'i', 's', ' ', 'm', 'o', 'r', 'e', ' ', 't', 'h', 'a', 'n', ' ', 'I', ' ', 'c', 'a', 'n', ' ', 's', 'e', 'e', '.', `\n`, 'H', 'e', ' ', 'i', 's', ' ', 'v', 'e', 'r', 'y', ',', ' ', 'v', 'e', 'r', 'y', ' ', 'l', 'i', 'k', 'e', ' ', 'm', 'e', ' ', 'f', 'r', 'o', 'm', ' ', 't', 'h', 'e', ' ', 'h', 'e', 'e', 'l', 's', ' ', 'u', 'p', ' ', 't', 'o', ' ', 't', 'h', 'e', ' ', 'h', 'e', 'a', 'd', ';', `\n`, 'A', 'n', 'd', ' ', 'I', ' ', 's', 'e', 'e', ' ', 'h', 'i', 'm', ' ', 'j', 'u', 'm', 'p', ' ', 'b', 'e', 'f', 'o', 'r', 'e', ' ', 'm', 'e', ',', ' ', 'w', 'h', 'e', 'n', ' ', 'I', ' ', 'j', 'u', 'm', 'p', ' ', 'i', 'n', 't', 'o', ' ', 'm', 'y', ' ', 'b', 'e', 'd', '.', `\n`
g178: dw 0, g177
g179: dw 0, g176, g178
g180: dw 3, 'f', 'i', 'b'
g181: dw 50, 'f', 'i', 'b', ' ', '-', ' ', 'n', 'a', 'i', 'v', 'e', ' ', 'f', 'i', 'b', ' ', 'c', 'o', 'm', 'p', 'u', 't', 'a', 't', 'i', 'o', 'n', ' ', 'u', 'p', 't', 'o', ' ', 't', 'h', 'e', ' ', 'g', 'i', 'v', 'e', 'n', ' ', 'n', 'u', 'm', 'b', 'e', 'r', `\n`
g182: dw 22, 'f', 'i', 'b', ':', ' ', 'm', 'i', 's', 's', 'i', 'n', 'g', ' ', 'a', 'r', 'g', 'u', 'm', 'e', 'n', 't', `\n`
g183: dw 34, 'c', 'r', 'e', 'a', 't', 'e', ':', ' ', 'u', 'n', 'e', 'x', 'p', 'e', 'c', 't', 'e', 'd', ' ', 'e', 'x', 't', 'r', 'a', ' ', 'a', 'r', 'g', 'u', 'm', 'e', 'n', 't', `\n`
g184: dw L83
g185: dw 0
g186: dw 1
g187: dw 0
g188: dw 1
g189: dw 0
g190: dw 0
g191: dw 0
g192: dw 31, 'f', 'i', 'b', ':', ' ', 'e', 'x', 'p', 'e', 'c', 't', 'e', 'd', ' ', 'n', 'u', 'm', 'e', 'r', 'i', 'c', ' ', 'a', 'r', 'g', 'u', 'm', 'e', 'n', 't', `\n`
g193: dw 0
g194: dw 4, 'f', 'i', 'b', ' '
g195: dw L87
g196: dw 0
g197: dw 0
g198: dw 5, ' ', '-', '-', '>', ' '
g199: dw L91
g200: dw 0
g201: dw 0
g202: dw 0

bare_start: jmp L486
