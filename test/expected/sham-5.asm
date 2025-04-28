L1: ; Function: t1
  mov bp, [bp+2]
  mov dx, dx
  jmp [bp]

L2: ; Function: g1
  push word dx
  push word L1
  mov [Temps+2], sp
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

L5: ; Function: g2
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
  mov dx, [bp+4]
  mov bp, g3
  jmp [bp]

L10: ; Function: t1
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
  mov bp, [bp+2]
  mov dx, [Temps+2]
  jmp [bp]

L11: ; Function: g3
  push word dx
  push word L10
  mov [Temps+2], sp
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
  mov dx, [bp+4]
  mov bp, g5
  jmp [bp]

L15: ; Function: t1
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
  mov bp, [bp+2]
  mov dx, [Temps+2]
  jmp [bp]

L16: ; Function: g5
  push word dx
  push word L15
  mov [Temps+2], sp
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
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L22: ; Function: t1
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
  mov dx, [bp+2]
  mov bp, g7
  jmp [bp]

L23: ; Function: t1
  push word dx
  push word [bp+2]
  push word L22
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L24: ; Function: g7
  push word dx
  push word L23
  mov [Temps+2], sp
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

L27: ; Function: t1
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
  push word [Temps+4]
  push word cx
  push word L26
  mov cx, sp
  mov bp, g8
  mov dx, [Temps+6]
  jmp [bp]

L28: ; Function: g8
  push word dx
  push word L27
  mov [Temps+2], sp
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

L31: ; Function: t1
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
  mov [Temps+6], ax
  mov ax, [bp+4]
  add ax, 1
  mov [Temps+8], ax
  push word [Temps+4]
  push word cx
  push word L30
  mov cx, sp
  mov bp, [bp+6]
  mov dx, [Temps+8]
  jmp [bp]

L32: ; Function: t2
  push word bp
  push word dx
  push word [bp+2]
  push word L31
  mov [Temps+2], sp
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
  push word [Temps+2]
  push word [bp+4]
  push word cx
  push word L34
  mov cx, sp
  mov bp, [Temps+4]
  mov dx, 0
  jmp [bp]

L36: ; Function: g10
  push word dx
  push word cx
  push word L35
  mov cx, sp
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

L39: ; Function: t1
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
  mov [Temps+6], ax
  mov ax, [bp+4]
  sub ax, 1
  mov [Temps+8], ax
  push word [Temps+4]
  push word cx
  push word L38
  mov cx, sp
  mov bp, [bp+6]
  mov dx, [Temps+8]
  jmp [bp]

L40: ; Function: t2
  push word bp
  push word dx
  push word [bp+2]
  push word L39
  mov [Temps+2], sp
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
  mov ax, dx
  sub ax, 1
  mov [Temps+6], ax
  push word [Temps+2]
  push word [bp+4]
  push word cx
  push word L42
  mov cx, sp
  mov bp, [Temps+4]
  mov dx, [Temps+6]
  jmp [bp]

L44: ; Function: g12
  push word dx
  push word cx
  push word L43
  mov cx, sp
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

L47: ; Function: t1
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
  push word dx
  push word cx
  push word L46
  mov cx, sp
  mov bp, [bp+6]
  mov dx, [Temps+6]
  jmp [bp]

L48: ; Function: t1
  push word bp
  push word dx
  push word [bp+2]
  push word L47
  mov [Temps+2], sp
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

L50: ; Function: g14
  push word dx
  push word L48
  mov [Temps+2], sp
  mov ax, dx
  call Bare_string_length
  mov [Temps+4], ax
  push word [Temps+4]
  push word cx
  push word L49
  mov cx, sp
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

L56: ; Function: t1
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

L59: ; Function: t1
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
  mov bx, [Temps+6]
  cmp word [bx], 1
  jz L58
  mov dx, g16
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L60: ; Function: g22
  push word dx
  push word L59
  mov [Temps+2], sp
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
  mov [Temps+10], ax
  mov dx, [Temps+10]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L64: ; Arm: 106'22
  mov ax, [Temps+2]
  call Bare_put_char
  mov [Temps+12], ax
  mov dx, [Temps+12]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L65: ; Arm: 107'16
  mov ax, [Temps+2]
  call Bare_put_char
  mov [Temps+14], ax
  mov dx, [Temps+14]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L66: ; Function: g25
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
  mov [Temps+14], ax
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
  mov [Temps+22], ax
  mov dx, [Temps+22]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L67: ; Arm: 342'11
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
  mov bp, g55
  mov dx, [Temps+2]
  jmp [bp]

L70: ; Function: g55
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
  mov bp, g55
  mov dx, [Temps+4]
  jmp [bp]

L71: ; Function: g126
  mov bx, dx
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L72: ; Arm: 364'9
  push word [bp+2]
  push word 1
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L73: ; Arm: 367'15
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
  call Bare_mul
  mov [Temps+4], ax
  mov ax, [Temps+4]
  add ax, [Temps+2]
  mov [Temps+6], ax
  push word [bp+6]
  push word cx
  push word L74
  mov cx, sp
  mov bp, g184
  mov dx, [Temps+6]
  jmp [bp]

L76: ; Arm: 359'27
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
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

L79: ; Arm: 359'12
  mov ax, 9
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+8]
  push word cx
  push word L77
  mov cx, sp
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

L82: ; Function: t1
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
  mov bx, [Temps+10]
  cmp word [bx], 1
  jz L81
  mov dx, g186
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L83: ; Function: g184
  push word dx
  push word L82
  mov [Temps+2], sp
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
  call Bare_div
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L86: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L84
  mov ax, dx
  mov bx, 10
  call Bare_mod
  mov [Temps+4], ax
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
  push word dx
  push word cx
  push word L85
  mov cx, sp
  mov bp, g195
  mov dx, [Temps+10]
  jmp [bp]

L87: ; Function: g195
  push word dx
  push word L86
  mov [Temps+2], sp
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
  call Bare_div
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L90: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L88
  mov ax, dx
  mov bx, 10
  call Bare_mod
  mov [Temps+4], ax
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
  push word dx
  push word cx
  push word L89
  mov cx, sp
  mov bp, g199
  mov dx, [Temps+10]
  jmp [bp]

L91: ; Function: g199
  push word dx
  push word L90
  mov [Temps+2], sp
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
  call Bare_div
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L94: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L92
  mov ax, dx
  mov bx, 10
  call Bare_mod
  mov [Temps+4], ax
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
  push word dx
  push word cx
  push word L93
  mov cx, sp
  mov bp, g205
  mov dx, [Temps+10]
  jmp [bp]

L95: ; Function: g205
  push word dx
  push word L94
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L96: ; Continuation
  call Bare_enter_check
  mov ax, `\n`
  call Bare_put_char
  mov [Temps+2], ax
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L97: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L96
  mov cx, sp
  mov bp, g25
  mov dx, dx
  jmp [bp]

L98: ; Arm: 124'11
  push word g206
  push word `0`
  push word 1
  mov [Temps+6], sp
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L99: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L100: ; Function: t1
  mov ax, sp
  call Bare_addr_to_num
  mov [Temps+2], ax
  mov ax, [Temps+2]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  push word [bp+2]
  push word cx
  push word L97
  mov cx, sp
  mov bx, [Temps+4]
  cmp word [bx], 1
  jz L98
  push word [Temps+2]
  push word cx
  push word L99
  mov cx, sp
  mov bp, g205
  mov dx, g207
  jmp [bp]

L101: ; Function: g208
  push word dx
  push word L100
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L102: ; Arm: 96'7
  mov dx, g23
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L103: ; Continuation
  call Bare_enter_check
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L104: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L103
  mov cx, sp
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L105: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L104
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  jmp [bp]

L106: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word dx
  push word [bp+4]
  push word cx
  push word L105
  mov cx, sp
  mov bp, g8
  mov dx, g24
  jmp [bp]

L107: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L106
  mov cx, sp
  mov bp, g8
  mov dx, dx
  jmp [bp]

L108: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+4]
  push word cx
  push word L107
  mov cx, sp
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L109: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L108
  mov cx, sp
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L110: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L102
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+2]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L109
  mov cx, sp
  mov bp, bp
  mov dx, [Temps+4]
  jmp [bp]

L111: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word dx
  push word 1
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L112: ; Arm: 163'11
  push word [bp+6]
  push word cx
  push word L111
  mov cx, sp
  mov dx, [bp+10]
  mov bp, [bp+2]
  jmp [bp]

L113: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L114: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word dx
  push word 1
  mov [Temps+2], sp
  push word [bp+8]
  push word cx
  push word L113
  mov cx, sp
  mov bp, [bp+4]
  mov dx, [Temps+2]
  jmp [bp]

L115: ; Arm: 165'26
  push word [Temps+4]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L114
  mov cx, sp
  mov dx, [bp+10]
  mov bp, [bp+2]
  jmp [bp]

L116: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L117: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word [bp+6]
  push word 1
  mov [Temps+2], sp
  push word [bp+8]
  push word cx
  push word L116
  mov cx, sp
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L118: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L112
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
  jz L115
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+10]
  push word cx
  push word L117
  mov cx, sp
  mov dx, [bp+6]
  mov bp, [bp+8]
  jmp [bp]

L119: ; Function: t1
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L118
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L120: ; Function: t1
  push word bp
  push word dx
  push word [bp+4]
  push word [bp+2]
  push word L119
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L121: ; Arm: 170'9
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L122: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L123: ; Arm: 172'24
  push word [Temps+4]
  push word cx
  push word L122
  mov cx, sp
  mov dx, [bp+2]
  mov bp, [bp+4]
  jmp [bp]

L124: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L125: ; Continuation
  call Bare_enter_check
  push word g27
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word [bp+6]
  push word cx
  push word L124
  mov cx, sp
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L126: ; Function: t2
  mov bx, dx
  cmp word [bx], 0
  jz L121
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
  jz L123
  push word [Temps+4]
  push word [Temps+2]
  push word cx
  push word L125
  mov cx, sp
  mov dx, [bp+2]
  mov bp, [bp+6]
  jmp [bp]

L127: ; Function: t2
  push word bp
  push word [bp+2]
  push word L120
  mov [Temps+2], sp
  push word [Temps+2]
  push word bp
  push word dx
  push word L126
  mov [Temps+4], sp
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L128: ; Arm: 144'22
  mov ax, `\n`
  call Bare_put_char
  mov [Temps+8], ax
  mov bp, [bp+2]
  mov dx, dx
  jmp [bp]

L129: ; Arm: 145'28
  mov ax, `^`
  call Bare_put_char
  mov [Temps+10], ax
  mov ax, `D`
  call Bare_put_char
  mov [Temps+12], ax
  mov ax, `\n`
  call Bare_put_char
  mov [Temps+14], ax
  push word dx
  push word `\x04`
  push word 1
  mov [Temps+16], sp
  mov bp, [bp+2]
  mov dx, [Temps+16]
  jmp [bp]

L130: ; Arm: 146'19
  mov bp, bp
  mov dx, dx
  jmp [bp]

L131: ; Arm: 149'17
  mov bp, bp
  mov dx, dx
  jmp [bp]

L132: ; Continuation
  call Bare_enter_check
  mov ax, `\x08`
  call Bare_put_char
  mov [Temps+2], ax
  mov ax, ` `
  call Bare_put_char
  mov [Temps+4], ax
  mov ax, `\x08`
  call Bare_put_char
  mov [Temps+6], ax
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L133: ; Arm: 151'31
  mov ax, `\x08`
  call Bare_put_char
  mov [Temps+2], ax
  mov ax, ` `
  call Bare_put_char
  mov [Temps+4], ax
  mov ax, `\x08`
  call Bare_put_char
  mov [Temps+6], ax
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L134: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L132
  mov cx, sp
  mov bx, dx
  cmp word [bx], 1
  jz L133
  mov dx, g33
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L135: ; Arm: 8'9
  mov dx, g31
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L136: ; Arm: 147'21
  mov bx, dx
  cmp word [bx], 0
  jz L131
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
  push word L134
  mov cx, sp
  mov bx, [Temps+20]
  cmp word [bx], 1
  jz L135
  mov dx, g32
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L137: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word [bp+8]
  push word 1
  mov [Temps+2], sp
  mov bp, [bp+6]
  mov dx, [Temps+2]
  jmp [bp]

L138: ; Arm: 105'19
  mov ax, [Temps+2]
  call Bare_put_char
  mov [Temps+18], ax
  mov dx, [Temps+18]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L139: ; Arm: 106'22
  mov ax, [Temps+2]
  call Bare_put_char
  mov [Temps+20], ax
  mov dx, [Temps+20]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L140: ; Arm: 107'16
  mov ax, [Temps+2]
  call Bare_put_char
  mov [Temps+22], ax
  mov dx, [Temps+22]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L141: ; Function: t1
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
  jz L128
  mov ax, [Temps+2]
  cmp word ax, `\x04`
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 1
  jz L129
  mov ax, 127
  cmp word ax, [Temps+4]
  call Bare_make_bool_from_n
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 1
  jz L130
  mov ax, [Temps+4]
  cmp word ax, 127
  call Bare_make_bool_from_z
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 1
  jz L136
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
  push word L137
  mov cx, sp
  mov bx, [Temps+16]
  cmp word [bx], 1
  jz L138
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+18], ax
  mov bx, [Temps+18]
  cmp word [bx], 1
  jz L139
  mov ax, 26
  cmp word ax, [Temps+14]
  call Bare_make_bool_from_n
  mov [Temps+20], ax
  mov bx, [Temps+20]
  cmp word [bx], 1
  jz L140
  mov ax, `^`
  call Bare_put_char
  mov [Temps+22], ax
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
  mov [Temps+30], ax
  mov dx, [Temps+30]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L142: ; Arm: 225'36
  mov dx, g35
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L143: ; Continuation
  call Bare_enter_check
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L144: ; Arm: 218'7
  mov dx, [bp+10]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L145: ; Arm: 189'9
  mov dx, g38
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L146: ; Arm: 193'35
  push word [bp+8]
  push word 1
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L147: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L146
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L148: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L147
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L149: ; Function: t3
  mov bx, dx
  cmp word [bx], 0
  jz L145
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
  push word L148
  mov cx, sp
  mov bp, [bp+2]
  mov dx, [Temps+6]
  jmp [bp]

L150: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L151: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L150
  mov cx, sp
  mov bp, g25
  mov dx, dx
  jmp [bp]

L152: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word cx
  push word L151
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L153: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L152
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L154: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L153
  mov cx, sp
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L155: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L154
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  jmp [bp]

L156: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L155
  mov cx, sp
  mov bp, g8
  mov dx, g46
  jmp [bp]

L157: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L156
  mov cx, sp
  mov bp, g8
  mov dx, dx
  jmp [bp]

L158: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L157
  mov cx, sp
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L159: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L158
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g45
  jmp [bp]

L160: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L159
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L161: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L160
  mov cx, sp
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L162: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L161
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  jmp [bp]

L163: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L162
  mov cx, sp
  mov bp, g8
  mov dx, g44
  jmp [bp]

L164: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L163
  mov cx, sp
  mov bp, g8
  mov dx, dx
  jmp [bp]

L165: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L164
  mov cx, sp
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L166: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L165
  mov cx, sp
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L167: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L166
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L168: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L167
  mov cx, sp
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L169: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L168
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  jmp [bp]

L170: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L169
  mov cx, sp
  mov bp, g8
  mov dx, g43
  jmp [bp]

L171: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L170
  mov cx, sp
  mov bp, g8
  mov dx, dx
  jmp [bp]

L172: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L171
  mov cx, sp
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L173: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L172
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g42
  jmp [bp]

L174: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L173
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L175: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L174
  mov cx, sp
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L176: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L175
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  jmp [bp]

L177: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L176
  mov cx, sp
  mov bp, g8
  mov dx, g41
  jmp [bp]

L178: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L177
  mov cx, sp
  mov bp, g8
  mov dx, dx
  jmp [bp]

L179: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L178
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g40
  jmp [bp]

L180: ; Arm: 210'9
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L179
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g39
  jmp [bp]

L181: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L182: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L181
  mov cx, sp
  mov bp, g25
  mov dx, dx
  jmp [bp]

L183: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word cx
  push word L182
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L184: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L183
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L185: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L184
  mov cx, sp
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L186: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L185
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  jmp [bp]

L187: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L186
  mov cx, sp
  mov bp, g8
  mov dx, g54
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
  mov bp, g8
  mov dx, dx
  jmp [bp]

L189: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L188
  mov cx, sp
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L190: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L189
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g53
  jmp [bp]

L191: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L190
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L192: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L191
  mov cx, sp
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L193: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L192
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  jmp [bp]

L194: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L193
  mov cx, sp
  mov bp, g8
  mov dx, g52
  jmp [bp]

L195: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L194
  mov cx, sp
  mov bp, g8
  mov dx, dx
  jmp [bp]

L196: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L195
  mov cx, sp
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L197: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L196
  mov cx, sp
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L198: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L197
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L199: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L198
  mov cx, sp
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L200: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L199
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  jmp [bp]

L201: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L200
  mov cx, sp
  mov bp, g8
  mov dx, g51
  jmp [bp]

L202: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L201
  mov cx, sp
  mov bp, g8
  mov dx, dx
  jmp [bp]

L203: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L202
  mov cx, sp
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L204: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L203
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g50
  jmp [bp]

L205: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L204
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L206: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L205
  mov cx, sp
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L207: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L206
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  jmp [bp]

L208: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L207
  mov cx, sp
  mov bp, g8
  mov dx, g49
  jmp [bp]

L209: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L208
  mov cx, sp
  mov bp, g8
  mov dx, dx
  jmp [bp]

L210: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L209
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g48
  jmp [bp]

L211: ; Arm: 213'14
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L210
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g47
  jmp [bp]

L212: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L213: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 0
  jz L180
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 0
  jz L211
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [bp+12]
  push word cx
  push word L212
  mov cx, sp
  mov dx, [bp+8]
  mov bp, [Temps+6]
  jmp [bp]

L214: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L213
  mov cx, sp
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L215: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word cx
  push word L143
  mov cx, sp
  mov bx, dx
  cmp word [bx], 0
  jz L144
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+2]
  push word [bp+8]
  push word L149
  mov [Temps+6], sp
  push word [Temps+6]
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L214
  mov cx, sp
  mov bx, [bp+10]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
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
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  jmp [bp]

L217: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L216
  mov cx, sp
  mov bp, g8
  mov dx, g37
  jmp [bp]

L218: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L217
  mov cx, sp
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L219: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L218
  mov cx, sp
  mov dx, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L220: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L142
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L219
  mov cx, sp
  mov bp, [bp+10]
  mov dx, g36
  jmp [bp]

L221: ; Continuation
  call Bare_enter_check
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L220
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+16]
  jmp [bp]

L222: ; Continuation
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
  push word L221
  mov cx, sp
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L223: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word L141
  mov [Temps+2], sp
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L222
  mov cx, sp
  mov bp, [Temps+2]
  mov dx, g34
  jmp [bp]

L224: ; Continuation
  call Bare_enter_check
  push word g29
  push word `\x04`
  push word 1
  mov [Temps+2], sp
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L223
  mov cx, sp
  mov bp, [bp+4]
  mov dx, [Temps+2]
  jmp [bp]

L225: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L224
  mov cx, sp
  mov bp, g25
  mov dx, dx
  jmp [bp]

L226: ; Function: t3
  push word bp
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L225
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g28
  jmp [bp]

L227: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L228: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L227
  mov cx, sp
  mov bp, g25
  mov dx, dx
  jmp [bp]

L229: ; Arm: 246'7
  push word [bp+8]
  push word cx
  push word L228
  mov cx, sp
  mov bp, [bp+2]
  mov dx, g63
  jmp [bp]

L230: ; Arm: 189'9
  mov dx, g64
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L231: ; Arm: 193'35
  push word [bp+8]
  push word 1
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L232: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L231
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L233: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L232
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L234: ; Function: t3
  mov bx, dx
  cmp word [bx], 0
  jz L230
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
  push word L233
  mov cx, sp
  mov bp, [bp+2]
  mov dx, [Temps+6]
  jmp [bp]

L235: ; Arm: 189'9
  mov dx, g73
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L236: ; Arm: 193'35
  push word [bp+8]
  push word 1
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L237: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L236
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L238: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L237
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L239: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L235
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
  push word L238
  mov cx, sp
  mov bp, [bp+2]
  mov dx, [Temps+6]
  jmp [bp]

L240: ; Continuation
  call Bare_enter_check
  mov bp, g25
  mov dx, dx
  jmp [bp]

L241: ; Continuation
  call Bare_enter_check
  push word cx
  push word L240
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L242: ; Arm: 239'11
  push word g77
  push word [bp+8]
  push word 1
  mov [Temps+2], sp
  push word [Temps+2]
  push word g74
  push word 1
  mov [Temps+4], sp
  push word [bp+4]
  push word cx
  push word L241
  mov cx, sp
  mov bp, [bp+6]
  mov dx, [Temps+4]
  jmp [bp]

L243: ; Continuation
  call Bare_enter_check
  mov bp, g25
  mov dx, dx
  jmp [bp]

L244: ; Arm: 242'16
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word cx
  push word L243
  mov cx, sp
  mov bp, [bp+4]
  mov dx, [Temps+4]
  jmp [bp]

L245: ; Continuation
  call Bare_enter_check
  mov bp, g25
  mov dx, dx
  jmp [bp]

L246: ; Continuation
  call Bare_enter_check
  push word cx
  push word L245
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L247: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 0
  jz L242
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 0
  jz L244
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word g81
  push word [bp+8]
  push word 1
  mov [Temps+8], sp
  push word [Temps+8]
  push word g78
  push word 1
  mov [Temps+10], sp
  push word [bp+4]
  push word cx
  push word L246
  mov cx, sp
  mov bp, [bp+6]
  mov dx, [Temps+10]
  jmp [bp]

L248: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L247
  mov cx, sp
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L249: ; Function: t1
  push word dx
  push word [bp+4]
  push word L239
  mov [Temps+2], sp
  push word [Temps+2]
  push word dx
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L248
  mov cx, sp
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L250: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L251: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L250
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+6]
  jmp [bp]

L252: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L249
  mov [Temps+2], sp
  push word [bp+12]
  push word [bp+10]
  push word cx
  push word L251
  mov cx, sp
  mov bp, g5
  mov dx, [Temps+2]
  jmp [bp]

L253: ; Continuation
  call Bare_enter_check
  mov bp, g25
  mov dx, dx
  jmp [bp]

L254: ; Continuation
  call Bare_enter_check
  push word cx
  push word L253
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L255: ; Arm: 239'11
  push word g68
  push word [bp+12]
  push word 1
  mov [Temps+2], sp
  push word [Temps+2]
  push word g65
  push word 1
  mov [Temps+4], sp
  push word [bp+4]
  push word cx
  push word L254
  mov cx, sp
  mov bp, [bp+8]
  mov dx, [Temps+4]
  jmp [bp]

L256: ; Continuation
  call Bare_enter_check
  mov bp, g25
  mov dx, dx
  jmp [bp]

L257: ; Arm: 242'16
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word cx
  push word L256
  mov cx, sp
  mov bp, [bp+4]
  mov dx, [Temps+4]
  jmp [bp]

L258: ; Continuation
  call Bare_enter_check
  mov bp, g25
  mov dx, dx
  jmp [bp]

L259: ; Continuation
  call Bare_enter_check
  push word cx
  push word L258
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L260: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L252
  mov cx, sp
  mov bx, dx
  cmp word [bx], 0
  jz L255
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 0
  jz L257
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word g72
  push word [bp+12]
  push word 1
  mov [Temps+8], sp
  push word [Temps+8]
  push word g69
  push word 1
  mov [Temps+10], sp
  push word [bp+4]
  push word cx
  push word L259
  mov cx, sp
  mov bp, [bp+8]
  mov dx, [Temps+10]
  jmp [bp]

L261: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L260
  mov cx, sp
  mov bp, [bp+16]
  mov dx, dx
  jmp [bp]

L262: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L229
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+2]
  push word [bp+4]
  push word L234
  mov [Temps+6], sp
  push word [Temps+6]
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L261
  mov cx, sp
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L263: ; Function: t1
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L262
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L264: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L265: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L264
  mov cx, sp
  mov bp, g25
  mov dx, dx
  jmp [bp]

L266: ; Arm: 283'7
  push word [bp+8]
  push word cx
  push word L265
  mov cx, sp
  mov bp, [bp+2]
  mov dx, g84
  jmp [bp]

L267: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L268: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L267
  mov cx, sp
  mov bp, g25
  mov dx, dx
  jmp [bp]

L269: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word cx
  push word L268
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L270: ; Arm: 286'10
  push word g88
  push word [Temps+2]
  push word 1
  mov [Temps+6], sp
  push word [Temps+6]
  push word g85
  push word 1
  mov [Temps+8], sp
  push word [bp+8]
  push word [bp+2]
  push word cx
  push word L269
  mov cx, sp
  mov bp, [bp+6]
  mov dx, [Temps+8]
  jmp [bp]

L271: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L272: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L271
  mov cx, sp
  mov bp, g25
  mov dx, dx
  jmp [bp]

L273: ; Arm: 289'12
  mov ax, [bx+2]
  mov [Temps+10], ax
  mov ax, [bx+4]
  mov [Temps+12], ax
  push word [bp+8]
  push word cx
  push word L272
  mov cx, sp
  mov bp, [bp+2]
  mov dx, g89
  jmp [bp]

L274: ; Arm: 189'9
  mov dx, g90
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L275: ; Arm: 193'35
  push word [bp+8]
  push word 1
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L276: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L275
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L277: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L276
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L278: ; Function: t5
  mov bx, dx
  cmp word [bx], 0
  jz L274
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
  push word L277
  mov cx, sp
  mov bp, [bp+2]
  mov dx, [Temps+6]
  jmp [bp]

L279: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L280: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L279
  mov cx, sp
  mov bp, g25
  mov dx, dx
  jmp [bp]

L281: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word cx
  push word L280
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L282: ; Arm: 292'15
  push word g94
  push word [bp+10]
  push word 1
  mov [Temps+2], sp
  push word [Temps+2]
  push word g91
  push word 1
  mov [Temps+4], sp
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L281
  mov cx, sp
  mov bp, [bp+6]
  mov dx, [Temps+4]
  jmp [bp]

L283: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word 0
  mov [Temps+2], sp
  push word dx
  push word [Temps+2]
  push word 1
  mov [Temps+4], sp
  push word [Temps+4]
  push word 0
  mov [Temps+6], sp
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L284: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 0
  jz L282
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [bp+12]
  push word cx
  push word L283
  mov cx, sp
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L285: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L284
  mov cx, sp
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L286: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L266
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 0
  jz L270
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 1
  jz L273
  push word [Temps+2]
  push word [bp+4]
  push word L278
  mov [Temps+10], sp
  push word [Temps+10]
  push word [Temps+6]
  push word [Temps+2]
  push word [bp+8]
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L285
  mov cx, sp
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+12], ax
  mov dx, [Temps+12]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L287: ; Function: t4
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L286
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L288: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L289: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L288
  mov cx, sp
  mov bp, g25
  mov dx, dx
  jmp [bp]

L290: ; Arm: 326'7
  push word [bp+12]
  push word cx
  push word L289
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g97
  jmp [bp]

L291: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L292: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L291
  mov cx, sp
  mov bp, g25
  mov dx, dx
  jmp [bp]

L293: ; Arm: 329'12
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [bp+12]
  push word cx
  push word L292
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g98
  jmp [bp]

L294: ; Arm: 144'22
  mov ax, `\n`
  call Bare_put_char
  mov [Temps+8], ax
  mov bp, [bp+2]
  mov dx, dx
  jmp [bp]

L295: ; Arm: 145'28
  mov ax, `^`
  call Bare_put_char
  mov [Temps+10], ax
  mov ax, `D`
  call Bare_put_char
  mov [Temps+12], ax
  mov ax, `\n`
  call Bare_put_char
  mov [Temps+14], ax
  push word dx
  push word `\x04`
  push word 1
  mov [Temps+16], sp
  mov bp, [bp+2]
  mov dx, [Temps+16]
  jmp [bp]

L296: ; Arm: 146'19
  mov bp, bp
  mov dx, dx
  jmp [bp]

L297: ; Arm: 149'17
  mov bp, bp
  mov dx, dx
  jmp [bp]

L298: ; Continuation
  call Bare_enter_check
  mov ax, `\x08`
  call Bare_put_char
  mov [Temps+2], ax
  mov ax, ` `
  call Bare_put_char
  mov [Temps+4], ax
  mov ax, `\x08`
  call Bare_put_char
  mov [Temps+6], ax
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L299: ; Arm: 151'31
  mov ax, `\x08`
  call Bare_put_char
  mov [Temps+2], ax
  mov ax, ` `
  call Bare_put_char
  mov [Temps+4], ax
  mov ax, `\x08`
  call Bare_put_char
  mov [Temps+6], ax
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L300: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L298
  mov cx, sp
  mov bx, dx
  cmp word [bx], 1
  jz L299
  mov dx, g104
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L301: ; Arm: 8'9
  mov dx, g102
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L302: ; Arm: 147'21
  mov bx, dx
  cmp word [bx], 0
  jz L297
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
  push word L300
  mov cx, sp
  mov bx, [Temps+20]
  cmp word [bx], 1
  jz L301
  mov dx, g103
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L303: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word [bp+8]
  push word 1
  mov [Temps+2], sp
  mov bp, [bp+6]
  mov dx, [Temps+2]
  jmp [bp]

L304: ; Arm: 105'19
  mov ax, [Temps+2]
  call Bare_put_char
  mov [Temps+18], ax
  mov dx, [Temps+18]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L305: ; Arm: 106'22
  mov ax, [Temps+2]
  call Bare_put_char
  mov [Temps+20], ax
  mov dx, [Temps+20]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L306: ; Arm: 107'16
  mov ax, [Temps+2]
  call Bare_put_char
  mov [Temps+22], ax
  mov dx, [Temps+22]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L307: ; Function: t1
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
  jz L294
  mov ax, [Temps+2]
  cmp word ax, `\x04`
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 1
  jz L295
  mov ax, 127
  cmp word ax, [Temps+4]
  call Bare_make_bool_from_n
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 1
  jz L296
  mov ax, [Temps+4]
  cmp word ax, 127
  call Bare_make_bool_from_z
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 1
  jz L302
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
  push word L303
  mov cx, sp
  mov bx, [Temps+16]
  cmp word [bx], 1
  jz L304
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+18], ax
  mov bx, [Temps+18]
  cmp word [bx], 1
  jz L305
  mov ax, 26
  cmp word ax, [Temps+14]
  call Bare_make_bool_from_n
  mov [Temps+20], ax
  mov bx, [Temps+20]
  cmp word [bx], 1
  jz L306
  mov ax, `^`
  call Bare_put_char
  mov [Temps+22], ax
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
  mov [Temps+30], ax
  mov dx, [Temps+30]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L308: ; Continuation
  call Bare_enter_check
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L309: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L308
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+6]
  jmp [bp]

L310: ; Arm: 335'44
  push word [bp+10]
  push word [bp+8]
  push word cx
  push word L309
  mov cx, sp
  mov bp, g8
  mov dx, g106
  jmp [bp]

L311: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word dx
  push word 1
  mov [Temps+2], sp
  mov bp, [bp+6]
  mov dx, [Temps+2]
  jmp [bp]

L312: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L311
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L313: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L312
  mov cx, sp
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L314: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L313
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+10]
  jmp [bp]

L315: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L314
  mov cx, sp
  mov bp, g8
  mov dx, g108
  jmp [bp]

L316: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L315
  mov cx, sp
  mov bp, g8
  mov dx, dx
  jmp [bp]

L317: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L316
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g107
  jmp [bp]

L318: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L310
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L317
  mov cx, sp
  mov dx, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L319: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L318
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+10]
  jmp [bp]

L320: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L319
  mov cx, sp
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L321: ; Function: t1
  push word [bp+4]
  push word L307
  mov [Temps+2], sp
  push word bp
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L320
  mov cx, sp
  mov bp, [Temps+2]
  mov dx, g105
  jmp [bp]

L322: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word 0
  mov [Temps+2], sp
  push word [Temps+2]
  push word [bp+4]
  push word 0
  mov [Temps+4], sp
  push word dx
  push word [Temps+4]
  push word 1
  mov [Temps+6], sp
  push word [Temps+6]
  push word 0
  mov [Temps+8], sp
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L323: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word cx
  push word L322
  mov cx, sp
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L324: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L321
  mov [Temps+2], sp
  push word [bp+16]
  push word [bp+14]
  push word cx
  push word L323
  mov cx, sp
  mov bp, [Temps+2]
  mov dx, g109
  jmp [bp]

L325: ; Continuation
  call Bare_enter_check
  push word g100
  push word `\x04`
  push word 1
  mov [Temps+2], sp
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L324
  mov cx, sp
  mov bp, [bp+4]
  mov dx, [Temps+2]
  jmp [bp]

L326: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L325
  mov cx, sp
  mov bp, g25
  mov dx, dx
  jmp [bp]

L327: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L290
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 1
  jz L293
  push word [Temps+2]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L326
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g99
  jmp [bp]

L328: ; Function: t7
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L327
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L329: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L330: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L329
  mov cx, sp
  mov bp, g25
  mov dx, dx
  jmp [bp]

L331: ; Arm: 321'7
  push word [bp+8]
  push word cx
  push word L330
  mov cx, sp
  mov bp, [bp+2]
  mov dx, g112
  jmp [bp]

L332: ; Arm: 189'9
  mov dx, g113
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L333: ; Arm: 193'35
  push word [bp+8]
  push word 1
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L334: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L333
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L335: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L334
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L336: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L332
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
  push word L335
  mov cx, sp
  mov bp, [bp+2]
  mov dx, [Temps+6]
  jmp [bp]

L337: ; Continuation
  call Bare_enter_check
  mov bp, g25
  mov dx, dx
  jmp [bp]

L338: ; Continuation
  call Bare_enter_check
  push word cx
  push word L337
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L339: ; Arm: 314'11
  push word g116
  push word [bp+8]
  push word 1
  mov [Temps+2], sp
  push word [bp+4]
  push word cx
  push word L338
  mov cx, sp
  mov bp, [bp+6]
  mov dx, [Temps+2]
  jmp [bp]

L340: ; Continuation
  call Bare_enter_check
  mov bp, g25
  mov dx, dx
  jmp [bp]

L341: ; Continuation
  call Bare_enter_check
  push word cx
  push word L340
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L342: ; Arm: 317'16
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word g119
  push word [bp+8]
  push word 1
  mov [Temps+6], sp
  push word [bp+4]
  push word cx
  push word L341
  mov cx, sp
  mov bp, [bp+6]
  mov dx, [Temps+6]
  jmp [bp]

L343: ; Continuation
  call Bare_enter_check
  mov bp, g25
  mov dx, dx
  jmp [bp]

L344: ; Continuation
  call Bare_enter_check
  push word cx
  push word L343
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L345: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 0
  jz L339
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 0
  jz L342
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word g122
  push word [bp+8]
  push word 1
  mov [Temps+8], sp
  push word [bp+4]
  push word cx
  push word L344
  mov cx, sp
  mov bp, [bp+6]
  mov dx, [Temps+8]
  jmp [bp]

L346: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L345
  mov cx, sp
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L347: ; Function: t3
  push word dx
  push word [bp+4]
  push word L336
  mov [Temps+2], sp
  push word [Temps+2]
  push word dx
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L346
  mov cx, sp
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L348: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L349: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L348
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+6]
  jmp [bp]

L350: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L331
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L347
  mov [Temps+6], sp
  push word dx
  push word [bp+8]
  push word cx
  push word L349
  mov cx, sp
  mov bp, g5
  mov dx, [Temps+6]
  jmp [bp]

L351: ; Function: t10
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L350
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L352: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L353: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L352
  mov cx, sp
  mov bp, g25
  mov dx, dx
  jmp [bp]

L354: ; Arm: 231'9
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [bp+4]
  push word cx
  push word L353
  mov cx, sp
  mov bp, [bp+2]
  mov dx, g125
  jmp [bp]

L355: ; Arm: 200'9
  mov dx, g127
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L356: ; Continuation
  call Bare_enter_check
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L357: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L356
  mov cx, sp
  mov bp, g25
  mov dx, dx
  jmp [bp]

L358: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L355
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, ` `
  call Bare_put_char
  mov [Temps+6], ax
  push word [Temps+4]
  push word bp
  push word cx
  push word L357
  mov cx, sp
  mov bp, [bp+2]
  mov dx, [Temps+2]
  jmp [bp]

L359: ; Continuation
  call Bare_enter_check
  mov ax, `\n`
  call Bare_put_char
  mov [Temps+2], ax
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L360: ; Arm: 204'9
  mov dx, g128
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L361: ; Continuation
  call Bare_enter_check
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L362: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L361
  mov cx, sp
  mov bp, g25
  mov dx, dx
  jmp [bp]

L363: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word L358
  mov [Temps+2], sp
  push word [bp+6]
  push word cx
  push word L359
  mov cx, sp
  mov bx, dx
  cmp word [bx], 0
  jz L360
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [Temps+6]
  push word [Temps+2]
  push word cx
  push word L362
  mov cx, sp
  mov bp, [bp+4]
  mov dx, [Temps+4]
  jmp [bp]

L364: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L363
  mov cx, sp
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L365: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L364
  mov cx, sp
  mov bx, [bp+6]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L366: ; Function: t1
  mov bx, dx
  cmp word [bx], 1
  jz L354
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L365
  mov cx, sp
  mov bp, g3
  mov dx, g126
  jmp [bp]

L367: ; Function: t13
  push word dx
  push word [bp+2]
  push word L366
  mov [Temps+2], sp
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
  mov bp, g25
  mov dx, dx
  jmp [bp]

L370: ; Arm: 260'7
  push word [bp+8]
  push word cx
  push word L369
  mov cx, sp
  mov bp, [bp+2]
  mov dx, g131
  jmp [bp]

L371: ; Arm: 189'9
  mov dx, g132
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L372: ; Arm: 193'35
  push word [bp+8]
  push word 1
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L373: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L372
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L374: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L373
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L375: ; Function: t3
  mov bx, dx
  cmp word [bx], 0
  jz L371
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
  push word L374
  mov cx, sp
  mov bp, [bp+2]
  mov dx, [Temps+6]
  jmp [bp]

L376: ; Arm: 189'9
  mov dx, g141
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L377: ; Arm: 193'35
  push word [bp+8]
  push word 1
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L378: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L377
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L379: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L378
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L380: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L376
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
  push word L379
  mov cx, sp
  mov bp, [bp+2]
  mov dx, [Temps+6]
  jmp [bp]

L381: ; Continuation
  call Bare_enter_check
  mov bp, g25
  mov dx, dx
  jmp [bp]

L382: ; Continuation
  call Bare_enter_check
  push word cx
  push word L381
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L383: ; Arm: 253'11
  push word g145
  push word [bp+8]
  push word 1
  mov [Temps+2], sp
  push word [Temps+2]
  push word g142
  push word 1
  mov [Temps+4], sp
  push word [bp+4]
  push word cx
  push word L382
  mov cx, sp
  mov bp, [bp+6]
  mov dx, [Temps+4]
  jmp [bp]

L384: ; Continuation
  call Bare_enter_check
  mov bp, g25
  mov dx, dx
  jmp [bp]

L385: ; Continuation
  call Bare_enter_check
  push word cx
  push word L384
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L386: ; Arm: 256'16
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word g149
  push word [bp+8]
  push word 1
  mov [Temps+6], sp
  push word [Temps+6]
  push word g146
  push word 1
  mov [Temps+8], sp
  push word [bp+4]
  push word cx
  push word L385
  mov cx, sp
  mov bp, [bp+6]
  mov dx, [Temps+8]
  jmp [bp]

L387: ; Continuation
  call Bare_enter_check
  mov bp, g25
  mov dx, dx
  jmp [bp]

L388: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 0
  jz L383
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 0
  jz L386
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word cx
  push word L387
  mov cx, sp
  mov bp, [bp+4]
  mov dx, [Temps+4]
  jmp [bp]

L389: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L388
  mov cx, sp
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L390: ; Function: t1
  push word dx
  push word [bp+4]
  push word L380
  mov [Temps+2], sp
  push word [Temps+2]
  push word dx
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L389
  mov cx, sp
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L391: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L392: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L391
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+6]
  jmp [bp]

L393: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L390
  mov [Temps+2], sp
  push word [bp+12]
  push word [bp+10]
  push word cx
  push word L392
  mov cx, sp
  mov bp, g5
  mov dx, [Temps+2]
  jmp [bp]

L394: ; Continuation
  call Bare_enter_check
  mov bp, g25
  mov dx, dx
  jmp [bp]

L395: ; Continuation
  call Bare_enter_check
  push word cx
  push word L394
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L396: ; Arm: 253'11
  push word g136
  push word [bp+12]
  push word 1
  mov [Temps+2], sp
  push word [Temps+2]
  push word g133
  push word 1
  mov [Temps+4], sp
  push word [bp+4]
  push word cx
  push word L395
  mov cx, sp
  mov bp, [bp+8]
  mov dx, [Temps+4]
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
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L399: ; Arm: 256'16
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word g140
  push word [bp+12]
  push word 1
  mov [Temps+6], sp
  push word [Temps+6]
  push word g137
  push word 1
  mov [Temps+8], sp
  push word [bp+4]
  push word cx
  push word L398
  mov cx, sp
  mov bp, [bp+8]
  mov dx, [Temps+8]
  jmp [bp]

L400: ; Continuation
  call Bare_enter_check
  mov bp, g25
  mov dx, dx
  jmp [bp]

L401: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L393
  mov cx, sp
  mov bx, dx
  cmp word [bx], 0
  jz L396
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 0
  jz L399
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word cx
  push word L400
  mov cx, sp
  mov bp, [bp+4]
  mov dx, [Temps+4]
  jmp [bp]

L402: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L401
  mov cx, sp
  mov bp, [bp+16]
  mov dx, dx
  jmp [bp]

L403: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L370
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+2]
  push word [bp+4]
  push word L375
  mov [Temps+6], sp
  push word [Temps+6]
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L402
  mov cx, sp
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L404: ; Function: t16
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L403
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L405: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L406: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L405
  mov cx, sp
  mov bp, g25
  mov dx, dx
  jmp [bp]

L407: ; Arm: 298'7
  push word [bp+8]
  push word cx
  push word L406
  mov cx, sp
  mov bp, [bp+2]
  mov dx, g152
  jmp [bp]

L408: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L409: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L408
  mov cx, sp
  mov bp, g25
  mov dx, dx
  jmp [bp]

L410: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word cx
  push word L409
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L411: ; Arm: 301'10
  push word g156
  push word [Temps+2]
  push word 1
  mov [Temps+6], sp
  push word [Temps+6]
  push word g153
  push word 1
  mov [Temps+8], sp
  push word [bp+8]
  push word [bp+2]
  push word cx
  push word L410
  mov cx, sp
  mov bp, [bp+6]
  mov dx, [Temps+8]
  jmp [bp]

L412: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L413: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L412
  mov cx, sp
  mov bp, g25
  mov dx, dx
  jmp [bp]

L414: ; Arm: 304'12
  mov ax, [bx+2]
  mov [Temps+10], ax
  mov ax, [bx+4]
  mov [Temps+12], ax
  push word [bp+8]
  push word cx
  push word L413
  mov cx, sp
  mov bp, [bp+2]
  mov dx, g157
  jmp [bp]

L415: ; Arm: 189'9
  mov dx, g158
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L416: ; Arm: 193'35
  push word [bp+8]
  push word 1
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L417: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L416
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L418: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L417
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L419: ; Function: t5
  mov bx, dx
  cmp word [bx], 0
  jz L415
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
  push word L418
  mov cx, sp
  mov bp, [bp+2]
  mov dx, [Temps+6]
  jmp [bp]

L420: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L421: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L420
  mov cx, sp
  mov bp, g25
  mov dx, dx
  jmp [bp]

L422: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word cx
  push word L421
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L423: ; Arm: 307'15
  push word g162
  push word [bp+12]
  push word 1
  mov [Temps+2], sp
  push word [Temps+2]
  push word g159
  push word 1
  mov [Temps+4], sp
  push word [bp+10]
  push word [bp+4]
  push word cx
  push word L422
  mov cx, sp
  mov bp, [bp+8]
  mov dx, [Temps+4]
  jmp [bp]

L424: ; Continuation
  call Bare_enter_check
  mov dx, g167
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L425: ; Continuation
  call Bare_enter_check
  push word cx
  push word L424
  mov cx, sp
  mov bp, g25
  mov dx, dx
  jmp [bp]

L426: ; Continuation
  call Bare_enter_check
  push word cx
  push word L425
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L427: ; Arm: 266'9
  push word g166
  push word [bp+8]
  push word 1
  mov [Temps+2], sp
  push word [Temps+2]
  push word g163
  push word 1
  mov [Temps+4], sp
  push word [bp+2]
  push word cx
  push word L426
  mov cx, sp
  mov bp, [bp+6]
  mov dx, [Temps+4]
  jmp [bp]

L428: ; Arm: 271'35
  mov dx, [bp+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L429: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word 0
  mov [Temps+2], sp
  push word dx
  push word [Temps+2]
  push word 1
  mov [Temps+4], sp
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L430: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L428
  push word [bp+10]
  push word [bp+8]
  push word cx
  push word L429
  mov cx, sp
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L431: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L430
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L432: ; Function: t2
  mov bx, dx
  cmp word [bx], 0
  jz L427
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
  push word L431
  mov cx, sp
  mov bp, [bp+4]
  mov dx, [Temps+6]
  jmp [bp]

L433: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word 0
  mov [Temps+2], sp
  push word dx
  push word [Temps+2]
  push word 1
  mov [Temps+4], sp
  push word [Temps+4]
  push word 0
  mov [Temps+6], sp
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L434: ; Continuation
  call Bare_enter_check
  push word dx
  push word 0
  mov [Temps+2], sp
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L433
  mov cx, sp
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L435: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L434
  mov cx, sp
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L436: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 0
  jz L423
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L432
  mov [Temps+4], sp
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+14]
  push word cx
  push word L435
  mov cx, sp
  mov bx, [bp+10]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L437: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L436
  mov cx, sp
  mov bp, [bp+16]
  mov dx, dx
  jmp [bp]

L438: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L407
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 0
  jz L411
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 1
  jz L414
  push word [Temps+2]
  push word [bp+4]
  push word L419
  mov [Temps+10], sp
  push word [Temps+10]
  push word [Temps+6]
  push word [Temps+2]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L437
  mov cx, sp
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+12], ax
  mov dx, [Temps+12]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L439: ; Function: t19
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L438
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L440: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L441: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L440
  mov cx, sp
  mov bp, g25
  mov dx, dx
  jmp [bp]

L442: ; Arm: 278'7
  push word [bp+8]
  push word cx
  push word L441
  mov cx, sp
  mov bp, [bp+2]
  mov dx, g170
  jmp [bp]

L443: ; Continuation
  call Bare_enter_check
  mov dx, g175
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L444: ; Continuation
  call Bare_enter_check
  push word cx
  push word L443
  mov cx, sp
  mov bp, g25
  mov dx, dx
  jmp [bp]

L445: ; Continuation
  call Bare_enter_check
  push word cx
  push word L444
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L446: ; Arm: 266'9
  push word g174
  push word [bp+8]
  push word 1
  mov [Temps+2], sp
  push word [Temps+2]
  push word g171
  push word 1
  mov [Temps+4], sp
  push word [bp+2]
  push word cx
  push word L445
  mov cx, sp
  mov bp, [bp+6]
  mov dx, [Temps+4]
  jmp [bp]

L447: ; Arm: 271'35
  mov dx, [bp+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L448: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word 0
  mov [Temps+2], sp
  push word dx
  push word [Temps+2]
  push word 1
  mov [Temps+4], sp
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L449: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L447
  push word [bp+10]
  push word [bp+8]
  push word cx
  push word L448
  mov cx, sp
  mov dx, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L450: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L449
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L451: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L446
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
  push word L450
  mov cx, sp
  mov bp, [bp+4]
  mov dx, [Temps+6]
  jmp [bp]

L452: ; Continuation
  call Bare_enter_check
  push word dx
  push word 0
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L453: ; Continuation
  call Bare_enter_check
  push word cx
  push word L452
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L454: ; Function: t1
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L451
  mov [Temps+2], sp
  push word [Temps+2]
  push word cx
  push word L453
  mov cx, sp
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L455: ; Function: t3
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L454
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L456: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L457: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word cx
  push word L456
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L458: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L442
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L455
  mov [Temps+6], sp
  push word dx
  push word [bp+8]
  push word cx
  push word L457
  mov cx, sp
  mov bp, g7
  mov dx, [Temps+6]
  jmp [bp]

L459: ; Function: t22
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L458
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L460: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L461: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L460
  mov cx, sp
  mov bp, g25
  mov dx, dx
  jmp [bp]

L462: ; Arm: 374'7
  push word [bp+4]
  push word cx
  push word L461
  mov cx, sp
  mov bp, [bp+2]
  mov dx, g182
  jmp [bp]

L463: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L464: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L463
  mov cx, sp
  mov bp, g25
  mov dx, dx
  jmp [bp]

L465: ; Arm: 377'12
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [bp+4]
  push word cx
  push word L464
  mov cx, sp
  mov bp, [bp+2]
  mov dx, g183
  jmp [bp]

L466: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L467: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L466
  mov cx, sp
  mov bp, g25
  mov dx, dx
  jmp [bp]

L468: ; Arm: 380'15
  push word [bp+6]
  push word cx
  push word L467
  mov cx, sp
  mov bp, [bp+4]
  mov dx, g192
  jmp [bp]

L469: ; Arm: 346'13
  mov dx, g193
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L470: ; Continuation
  call Bare_enter_check
  mov ax, `\n`
  call Bare_put_char
  mov [Temps+2], ax
  mov ax, [bp+4]
  add ax, 1
  mov [Temps+4], ax
  mov bp, [bp+6]
  mov dx, [Temps+4]
  jmp [bp]

L471: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L470
  mov cx, sp
  mov bp, g25
  mov dx, dx
  jmp [bp]

L472: ; Arm: 124'11
  push word g200
  push word `0`
  push word 1
  mov [Temps+4], sp
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L473: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L474: ; Continuation
  call Bare_enter_check
  mov ax, [bp+8]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L471
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L472
  push word [bp+8]
  push word cx
  push word L473
  mov cx, sp
  mov bp, g199
  mov dx, g201
  jmp [bp]

L475: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L474
  mov cx, sp
  mov bp, g25
  mov dx, dx
  jmp [bp]

L476: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L475
  mov cx, sp
  mov bp, [bp+4]
  mov dx, g198
  jmp [bp]

L477: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L476
  mov cx, sp
  mov bp, g25
  mov dx, dx
  jmp [bp]

L478: ; Arm: 124'11
  push word g196
  push word `0`
  push word 1
  mov [Temps+4], sp
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L479: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L480: ; Continuation
  call Bare_enter_check
  mov ax, [bp+6]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L477
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L478
  push word [bp+6]
  push word cx
  push word L479
  mov cx, sp
  mov bp, g195
  mov dx, g197
  jmp [bp]

L481: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L480
  mov cx, sp
  mov bp, g25
  mov dx, dx
  jmp [bp]

L482: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L481
  mov cx, sp
  mov bp, [bp+4]
  mov dx, g194
  jmp [bp]

L483: ; Function: t2
  mov ax, [bp+4]
  cmp word ax, dx
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L469
  push word bp
  push word dx
  push word [bp+2]
  push word cx
  push word L482
  mov cx, sp
  mov bp, g55
  mov dx, dx
  jmp [bp]

L484: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L485: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 0
  jz L468
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [bp+4]
  push word L483
  mov [Temps+4], sp
  push word [bp+6]
  push word cx
  push word L484
  mov cx, sp
  mov bp, [Temps+4]
  mov dx, 0
  jmp [bp]

L486: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L485
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  jmp [bp]

L487: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L486
  mov cx, sp
  mov bp, g184
  mov dx, 0
  jmp [bp]

L488: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L462
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 1
  jz L465
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L487
  mov cx, sp
  mov bp, [bp+2]
  mov dx, [Temps+2]
  jmp [bp]

L489: ; Function: t25
  push word dx
  push word [bp+2]
  push word L488
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L490: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L263
  mov [Temps+2], sp
  push word [Temps+2]
  push word g62
  push word 1
  mov [Temps+4], sp
  push word [Temps+4]
  push word g61
  push word 0
  mov [Temps+6], sp
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L287
  mov [Temps+8], sp
  push word [Temps+8]
  push word g83
  push word 1
  mov [Temps+10], sp
  push word [Temps+10]
  push word g82
  push word 0
  mov [Temps+12], sp
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L328
  mov [Temps+14], sp
  push word [Temps+14]
  push word g96
  push word 1
  mov [Temps+16], sp
  push word [Temps+16]
  push word g95
  push word 0
  mov [Temps+18], sp
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L351
  mov [Temps+20], sp
  push word [Temps+20]
  push word g111
  push word 1
  mov [Temps+22], sp
  push word [Temps+22]
  push word g110
  push word 0
  mov [Temps+24], sp
  push word [bp+8]
  push word L367
  mov [Temps+26], sp
  push word [Temps+26]
  push word g124
  push word 1
  mov [Temps+28], sp
  push word [Temps+28]
  push word g123
  push word 0
  mov [Temps+30], sp
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L404
  mov [Temps+32], sp
  push word [Temps+32]
  push word g130
  push word 1
  mov [Temps+34], sp
  push word [Temps+34]
  push word g129
  push word 0
  mov [Temps+36], sp
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L439
  mov [Temps+38], sp
  push word [Temps+38]
  push word g151
  push word 1
  mov [Temps+40], sp
  push word [Temps+40]
  push word g150
  push word 0
  mov [Temps+42], sp
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L459
  mov [Temps+44], sp
  push word [Temps+44]
  push word g169
  push word 1
  mov [Temps+46], sp
  push word [Temps+46]
  push word g168
  push word 0
  mov [Temps+48], sp
  push word [bp+8]
  push word L489
  mov [Temps+50], sp
  push word [Temps+50]
  push word g181
  push word 1
  mov [Temps+52], sp
  push word [Temps+52]
  push word g180
  push word 0
  mov [Temps+54], sp
  push word g212
  push word [Temps+54]
  push word 1
  mov [Temps+56], sp
  push word [Temps+56]
  push word g179
  push word 1
  mov [Temps+58], sp
  push word [Temps+58]
  push word [Temps+48]
  push word 1
  mov [Temps+60], sp
  push word [Temps+60]
  push word [Temps+42]
  push word 1
  mov [Temps+62], sp
  push word [Temps+62]
  push word [Temps+36]
  push word 1
  mov [Temps+64], sp
  push word [Temps+64]
  push word [Temps+30]
  push word 1
  mov [Temps+66], sp
  push word [Temps+66]
  push word [Temps+24]
  push word 1
  mov [Temps+68], sp
  push word [Temps+68]
  push word [Temps+18]
  push word 1
  mov [Temps+70], sp
  push word [Temps+70]
  push word [Temps+12]
  push word 1
  mov [Temps+72], sp
  push word [Temps+72]
  push word [Temps+6]
  push word 1
  mov [Temps+74], sp
  push word [Temps+74]
  push word g60
  push word 1
  mov [Temps+76], sp
  push word [Temps+76]
  push word 0
  mov [Temps+78], sp
  mov bp, [bp+14]
  mov dx, [Temps+78]
  jmp [bp]

L491: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L490
  mov cx, sp
  mov bp, g25
  mov dx, dx
  jmp [bp]

L492: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+4]
  push word L110
  mov [Temps+2], sp
  push word [bp+6]
  push word L127
  mov [Temps+4], sp
  push word [Temps+4]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L226
  mov [Temps+6], sp
  push word [Temps+6]
  push word [Temps+2]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L491
  mov cx, sp
  mov bp, [bp+8]
  mov dx, g56
  jmp [bp]

L493: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L492
  mov cx, sp
  mov bp, g1
  mov dx, g22
  jmp [bp]

L494: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+4]
  push word cx
  push word L493
  mov cx, sp
  mov bp, g1
  mov dx, g14
  jmp [bp]

L495: ; Continuation
  call Bare_enter_check
  push word dx
  push word cx
  push word L494
  mov cx, sp
  mov bp, g1
  mov dx, g12
  jmp [bp]

L496: ; Start
  push word cx
  push word L495
  mov cx, sp
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
  dw 5
  db ` --> `
g199:
  dw L91
g200:
  dw 0
g201:
  dw 0
g202:
  dw 5
  db `space`
g203:
  dw 36
  db `space - where is the stack-pointer?\n`
g204:
  dw 0
g205:
  dw L95
g206:
  dw 0
g207:
  dw 0
g208:
  dw L101
g209:
  dw 1, g203, g208
g210:
  dw 0, g202, g209
g211:
  dw 0
g212:
  dw 1, g210, g211

bare_start: jmp L496
