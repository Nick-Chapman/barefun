L1: ; Function: t1
  mov bp, [bp+2]
  mov dx, dx
  jmp [bp]

L2: ; Function: g1
  push word dx
  push word L1
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L3: ; Arm: 8'7
  mov dx, 0
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L4: ; Continuation
  mov ax, 1
  add ax, dx
  mov [2], ax
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

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
  jmp [bp]

L6: ; Arm: 15'7
  mov dx, dx
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L7: ; Continuation
  push word dx
  push word [bp+4]
  push word 1
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L8: ; Continuation
  push word [bp+6]
  push word cx
  push word L7
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L9: ; Function: t1
  mov bx, [bp+2]
  cmp word [bx], 0
  jz L6
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  push word [2]
  push word dx
  push word cx
  push word L8
  mov cx, sp
  mov bp, g3
  mov dx, [4]
  jmp [bp]

L10: ; Function: g3
  push word dx
  push word L9
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L11: ; Arm: 22'9
  mov dx, g4
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L12: ; Continuation
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L13: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L11
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
  push word L12
  mov cx, sp
  mov bp, [bp+6]
  mov dx, [8]
  jmp [bp]

L14: ; Function: t2
  push word bp
  push word dx
  push word [bp+2]
  push word L13
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L15: ; Continuation
  mov ax, [bp+4]
  mov [2], ax
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L16: ; Continuation
  push word [bp+6]
  push word cx
  push word L15
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L17: ; Continuation
  mov ax, dx
  call Bare_make_bytes
  mov [2], ax
  push word [2]
  push word L14
  mov [4], sp
  push word [2]
  push word [bp+4]
  push word cx
  push word L16
  mov cx, sp
  mov bp, [4]
  mov dx, 0
  jmp [bp]

L18: ; Function: g5
  push word dx
  push word cx
  push word L17
  mov cx, sp
  mov bp, g2
  mov dx, dx
  jmp [bp]

L19: ; Arm: 32'13
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L20: ; Continuation
  mov ax, [bp+4]
  sub ax, 1
  mov [2], ax
  mov bp, dx
  mov dx, [2]
  jmp [bp]

L21: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L19
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
  push word L20
  mov cx, sp
  mov bp, [bp+6]
  mov dx, [6]
  jmp [bp]

L22: ; Function: t1
  push word bp
  push word dx
  push word [bp+2]
  push word L21
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L23: ; Continuation
  mov ax, [bp+4]
  sub ax, 1
  mov [2], ax
  mov bp, dx
  mov dx, [2]
  jmp [bp]

L24: ; Function: g7
  push word dx
  push word L22
  mov [2], sp
  mov ax, dx
  call Bare_string_length
  mov [4], ax
  push word [4]
  push word cx
  push word L23
  mov cx, sp
  mov bp, [2]
  mov dx, g6
  jmp [bp]

L25: ; Arm: 86'30
  mov dx, g9
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L26: ; Arm: 86'7
  mov bx, dx
  cmp word [bx], 0
  jz L25
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov dx, g10
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L27: ; Arm: 89'10
  mov dx, g11
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L28: ; Continuation
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L29: ; Continuation
  push word [bp+6]
  push word cx
  push word L28
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L30: ; Arm: 91'18
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L29
  mov cx, sp
  mov dx, [bp+4]
  mov bp, g8
  jmp [bp]

L31: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L30
  mov dx, g12
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L32: ; Continuation
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L31
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  jmp [bp]

L33: ; Function: t1
  mov bx, [bp+4]
  cmp word [bx], 0
  jz L26
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov bx, dx
  cmp word [bx], 0
  jz L27
  mov ax, [bx+2]
  mov [6], ax
  mov ax, [bx+4]
  mov [8], ax
  push word [8]
  push word [6]
  push word [4]
  push word [bp+2]
  push word cx
  push word L32
  mov cx, sp
  mov bp, [bp+2]
  mov dx, [2]
  jmp [bp]

L34: ; Function: t1
  push word dx
  push word [bp+2]
  push word L33
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L35: ; Function: g8
  push word dx
  push word L34
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L36: ; Arm: 99'7
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L37: ; Continuation
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L38: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L36
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
  push word L37
  mov cx, sp
  mov bp, g13
  mov dx, [6]
  jmp [bp]

L39: ; Function: g13
  push word dx
  push word L38
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L40: ; Arm: 106'7
  mov dx, g15
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L41: ; Continuation
  push word dx
  push word [bp+4]
  push word 1
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L42: ; Continuation
  push word [bp+6]
  push word cx
  push word L41
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L43: ; Continuation
  push word dx
  push word [bp+6]
  push word cx
  push word L42
  mov cx, sp
  mov dx, [bp+4]
  mov bp, g14
  jmp [bp]

L44: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L40
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  push word [4]
  push word [bp+2]
  push word cx
  push word L43
  mov cx, sp
  mov bp, [bp+2]
  mov dx, [2]
  jmp [bp]

L45: ; Function: g14
  push word dx
  push word L44
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L46: ; Arm: 120'7
  mov dx, g17
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L47: ; Continuation
  mov dx, [bp+4]
  mov bp, g16
  jmp [bp]

L48: ; Arm: 55'19
  mov ax, [2]
  call Bare_put_char
  mov [10], ax
  mov dx, [10]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L49: ; Arm: 56'22
  mov ax, [2]
  call Bare_put_char
  mov [12], ax
  mov dx, [12]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L50: ; Arm: 57'16
  mov ax, [2]
  call Bare_put_char
  mov [14], ax
  mov dx, [14]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L51: ; Function: g16
  mov bx, dx
  cmp word [bx], 0
  jz L46
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
  push word L47
  mov cx, sp
  mov bx, [8]
  cmp word [bx], 1
  jz L48
  mov ax, [2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [10], ax
  mov bx, [10]
  cmp word [bx], 1
  jz L49
  mov ax, 26
  cmp word ax, [6]
  call Bare_make_bool_from_n
  mov [12], ax
  mov bx, [12]
  cmp word [bx], 1
  jz L50
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
  jmp [bp]

L52: ; Continuation
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L53: ; Arm: 133'20
  mov ax, `\n`
  call Bare_put_char
  mov [8], ax
  push word dx
  push word cx
  push word L52
  mov cx, sp
  mov bp, g13
  mov dx, g20
  jmp [bp]

L54: ; Continuation
  push word [bp+4]
  push word 4
  push word 1
  mov [2], sp
  mov bp, dx
  mov dx, [2]
  jmp [bp]

L55: ; Arm: 134'26
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
  push word cx
  push word L54
  mov cx, sp
  mov bp, g13
  mov dx, g21
  jmp [bp]

L56: ; Arm: 135'17
  mov bp, g18
  mov dx, dx
  jmp [bp]

L57: ; Arm: 138'15
  mov bp, g18
  mov dx, dx
  jmp [bp]

L58: ; Continuation
  mov ax, 8
  call Bare_put_char
  mov [2], ax
  mov ax, ' '
  call Bare_put_char
  mov [4], ax
  mov ax, 8
  call Bare_put_char
  mov [6], ax
  mov dx, [bp+4]
  mov bp, g18
  jmp [bp]

L59: ; Arm: 140'29
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
  jmp [bp]

L60: ; Continuation
  push word [bp+4]
  push word cx
  push word L58
  mov cx, sp
  mov bx, dx
  cmp word [bx], 1
  jz L59
  mov dx, g24
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L61: ; Arm: 43'9
  mov dx, g22
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L62: ; Arm: 136'19
  mov bx, dx
  cmp word [bx], 0
  jz L57
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
  push word cx
  push word L60
  mov cx, sp
  mov bx, [20]
  cmp word [bx], 1
  jz L61
  mov dx, g23
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L63: ; Continuation
  push word [bp+4]
  push word [bp+6]
  push word 1
  mov [2], sp
  mov bp, g18
  mov dx, [2]
  jmp [bp]

L64: ; Arm: 55'19
  mov ax, [2]
  call Bare_put_char
  mov [18], ax
  mov dx, [18]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L65: ; Arm: 56'22
  mov ax, [2]
  call Bare_put_char
  mov [20], ax
  mov dx, [20]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L66: ; Arm: 57'16
  mov ax, [2]
  call Bare_put_char
  mov [22], ax
  mov dx, [22]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L67: ; Function: g18
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
  jz L53
  mov ax, [2]
  cmp word ax, 4
  call Bare_make_bool_from_z
  mov [8], ax
  mov bx, [8]
  cmp word [bx], 1
  jz L55
  mov ax, 127
  cmp word ax, [4]
  call Bare_make_bool_from_n
  mov [10], ax
  mov bx, [10]
  cmp word [bx], 1
  jz L56
  mov ax, [4]
  cmp word ax, 127
  call Bare_make_bool_from_z
  mov [12], ax
  mov bx, [12]
  cmp word [bx], 1
  jz L62
  mov ax, [2]
  call Bare_char_to_num
  mov [14], ax
  mov ax, [14]
  cmp word ax, 8
  call Bare_make_bool_from_z
  mov [16], ax
  push word [2]
  push word dx
  push word cx
  push word L63
  mov cx, sp
  mov bx, [16]
  cmp word [bx], 1
  jz L64
  mov ax, [2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [18], ax
  mov bx, [18]
  cmp word [bx], 1
  jz L65
  mov ax, 26
  cmp word ax, [14]
  call Bare_make_bool_from_n
  mov [20], ax
  mov bx, [20]
  cmp word [bx], 1
  jz L66
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
  jmp [bp]

L68: ; Arm: 149'11
  mov dx, dx
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L69: ; Continuation
  mov ax, [bp+4]
  add ax, dx
  mov [2], ax
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L70: ; Continuation
  mov ax, [bp+4]
  sub ax, 2
  mov [2], ax
  push word dx
  push word cx
  push word L69
  mov cx, sp
  mov bp, g25
  mov dx, [2]
  jmp [bp]

L71: ; Function: g25
  mov ax, dx
  cmp word ax, 2
  call Bare_make_bool_from_n
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L68
  mov ax, dx
  sub ax, 1
  mov [4], ax
  push word dx
  push word cx
  push word L70
  mov cx, sp
  mov bp, g25
  mov dx, [4]
  jmp [bp]

L72: ; Continuation
  mov ax, dx
  mov bx, [bp+4]
  call Bare_mul
  mov [2], ax
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L73: ; Arm: 152'12
  mov ax, [bp+4]
  sub ax, 1
  mov [2], ax
  push word [bp+4]
  push word cx
  push word L72
  mov cx, sp
  mov bp, g26
  mov dx, [2]
  jmp [bp]

L74: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L73
  mov dx, 1
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L75: ; Arm: 43'9
  mov dx, g27
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L76: ; Function: g26
  mov ax, dx
  cmp word ax, 2
  call Bare_make_bool_from_n
  mov [2], ax
  push word dx
  push word cx
  push word L74
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L75
  mov dx, g28
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L77: ; Function: t1
  mov ax, [bp+2]
  cmp word ax, dx
  call Bare_make_bool_from_z
  mov [2], ax
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L78: ; Function: g36
  push word dx
  push word L77
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L79: ; Function: t1
  mov ax, [bp+2]
  cmp word ax, dx
  call Bare_make_bool_from_z
  mov [2], ax
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L80: ; Function: g42
  push word dx
  push word L79
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L81: ; Arm: 76'9
  push word [bp+2]
  push word 0
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L82: ; Arm: 79'15
  mov dx, g55
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L83: ; Continuation
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L84: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L82
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
  push word L83
  mov cx, sp
  mov bp, g48
  mov dx, [6]
  jmp [bp]

L85: ; Arm: 71'27
  push word [bp+4]
  push word 0
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L86: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L85
  mov dx, g53
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L87: ; Arm: 43'9
  mov dx, g51
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L88: ; Arm: 71'12
  mov ax, 9
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov [2], ax
  push word [bp+8]
  push word cx
  push word L86
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L87
  mov dx, g52
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L89: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L84
  mov cx, sp
  mov bx, dx
  cmp word [bx], 1
  jz L88
  mov dx, g54
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L90: ; Arm: 43'9
  mov dx, g49
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L91: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L81
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
  push word L89
  mov cx, sp
  mov bx, [10]
  cmp word [bx], 1
  jz L90
  mov dx, g50
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L92: ; Function: g48
  push word dx
  push word L91
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L93: ; Arm: 113'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L94: ; Continuation
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [2], ax
  mov bp, dx
  mov dx, [2]
  jmp [bp]

L95: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L93
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
  push word L94
  mov cx, sp
  mov bp, g58
  mov dx, [10]
  jmp [bp]

L96: ; Function: g58
  push word dx
  push word L95
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L97: ; Arm: 113'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L98: ; Continuation
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [2], ax
  mov bp, dx
  mov dx, [2]
  jmp [bp]

L99: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L97
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
  push word L98
  mov cx, sp
  mov bp, g62
  mov dx, [10]
  jmp [bp]

L100: ; Function: g62
  push word dx
  push word L99
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L101: ; Function: t1
  mov ax, [bp+2]
  cmp word ax, dx
  call Bare_make_bool_from_z
  mov [2], ax
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L102: ; Function: g66
  push word dx
  push word L101
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L103: ; Arm: 76'9
  push word [bp+2]
  push word 0
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L104: ; Arm: 79'15
  mov dx, g79
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L105: ; Continuation
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L106: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L104
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
  push word L105
  mov cx, sp
  mov bp, g72
  mov dx, [6]
  jmp [bp]

L107: ; Arm: 71'27
  push word [bp+4]
  push word 0
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L108: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L107
  mov dx, g77
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L109: ; Arm: 43'9
  mov dx, g75
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L110: ; Arm: 71'12
  mov ax, 9
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov [2], ax
  push word [bp+8]
  push word cx
  push word L108
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L109
  mov dx, g76
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L111: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L106
  mov cx, sp
  mov bx, dx
  cmp word [bx], 1
  jz L110
  mov dx, g78
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L112: ; Arm: 43'9
  mov dx, g73
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L113: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L103
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
  push word L111
  mov cx, sp
  mov bx, [10]
  cmp word [bx], 1
  jz L112
  mov dx, g74
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L114: ; Function: g72
  push word dx
  push word L113
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L115: ; Arm: 113'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L116: ; Continuation
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [2], ax
  mov bp, dx
  mov dx, [2]
  jmp [bp]

L117: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L115
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
  push word L116
  mov cx, sp
  mov bp, g82
  mov dx, [10]
  jmp [bp]

L118: ; Function: g82
  push word dx
  push word L117
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L119: ; Arm: 113'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L120: ; Continuation
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [2], ax
  mov bp, dx
  mov dx, [2]
  jmp [bp]

L121: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L119
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
  push word L120
  mov cx, sp
  mov bp, g86
  mov dx, [10]
  jmp [bp]

L122: ; Function: g86
  push word dx
  push word L121
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L123: ; Function: t1
  mov ax, [bp+2]
  cmp word ax, dx
  call Bare_make_bool_from_z
  mov [2], ax
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L124: ; Function: g90
  push word dx
  push word L123
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L125: ; Function: t1
  mov ax, [bp+2]
  cmp word ax, dx
  call Bare_make_bool_from_z
  mov [2], ax
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L126: ; Function: g95
  push word dx
  push word L125
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L127: ; Arm: 211'52
  mov dx, '*'
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L128: ; Function: g100
  mov ax, dx
  cmp word ax, 'o'
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L127
  mov dx, dx
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L129: ; Arm: 113'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L130: ; Continuation
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [2], ax
  mov bp, dx
  mov dx, [2]
  jmp [bp]

L131: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L129
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
  push word L130
  mov cx, sp
  mov bp, g103
  mov dx, [10]
  jmp [bp]

L132: ; Function: g103
  push word dx
  push word L131
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L133: ; Continuation
  push word [bp+4]
  push word [bp+6]
  push word 1
  mov [2], sp
  mov bp, dx
  mov dx, [2]
  jmp [bp]

L134: ; Continuation
  push word dx
  push word [bp+4]
  push word cx
  push word L133
  mov cx, sp
  mov bp, g13
  mov dx, g31
  jmp [bp]

L135: ; Continuation
  push word [bp+6]
  push word cx
  push word L134
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L136: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L135
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  jmp [bp]

L137: ; Arm: 221'7
  push word [bp+8]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L136
  mov cx, sp
  mov bp, g13
  mov dx, g30
  jmp [bp]

L138: ; Continuation
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L139: ; Continuation
  push word [bp+4]
  push word cx
  push word L138
  mov cx, sp
  mov bp, dx
  mov dx, g33
  jmp [bp]

L140: ; Continuation
  push word [bp+4]
  push word dx
  push word 1
  mov [2], sp
  push word [bp+8]
  push word cx
  push word L139
  mov cx, sp
  mov bp, [bp+6]
  mov dx, [2]
  jmp [bp]

L141: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L140
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L142: ; Continuation
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L141
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+10]
  jmp [bp]

L143: ; Arm: 223'22
  push word [4]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L142
  mov cx, sp
  mov bp, g13
  mov dx, g32
  jmp [bp]

L144: ; Continuation
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L145: ; Continuation
  push word [bp+4]
  push word [bp+6]
  push word 1
  mov [2], sp
  push word [bp+8]
  push word cx
  push word L144
  mov cx, sp
  mov bp, dx
  mov dx, [2]
  jmp [bp]

L146: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L137
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
  jz L143
  push word [4]
  push word [2]
  push word [bp+8]
  push word cx
  push word L145
  mov cx, sp
  mov dx, [bp+4]
  mov bp, [bp+6]
  jmp [bp]

L147: ; Function: t1
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L146
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L148: ; Function: t1
  push word bp
  push word dx
  push word [bp+2]
  push word L147
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L149: ; Arm: 242'36
  mov dx, g37
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L150: ; Continuation
  mov bp, [bp+4]
  mov dx, g107
  jmp [bp]

L151: ; Arm: 232'7
  mov dx, g40
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L152: ; Continuation
  mov ax, `\n`
  call Bare_put_char
  mov [2], ax
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L153: ; Continuation
  push word cx
  push word L152
  mov cx, sp
  mov bp, g16
  mov dx, dx
  jmp [bp]

L154: ; Continuation
  push word cx
  push word L153
  mov cx, sp
  mov bp, [bp+4]
  mov dx, g45
  jmp [bp]

L155: ; Continuation
  push word [bp+4]
  push word cx
  push word L154
  mov cx, sp
  mov bp, g16
  mov dx, dx
  jmp [bp]

L156: ; Arm: 159'7
  push word [bp+4]
  push word cx
  push word L155
  mov cx, sp
  mov bp, [bp+4]
  mov dx, g44
  jmp [bp]

L157: ; Continuation
  mov ax, `\n`
  call Bare_put_char
  mov [2], ax
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L158: ; Continuation
  push word cx
  push word L157
  mov cx, sp
  mov bp, g16
  mov dx, dx
  jmp [bp]

L159: ; Continuation
  push word cx
  push word L158
  mov cx, sp
  mov bp, [bp+4]
  mov dx, g47
  jmp [bp]

L160: ; Continuation
  push word [bp+4]
  push word cx
  push word L159
  mov cx, sp
  mov bp, g16
  mov dx, dx
  jmp [bp]

L161: ; Arm: 162'12
  mov ax, [bx+2]
  mov [6], ax
  mov ax, [bx+4]
  mov [8], ax
  push word [bp+4]
  push word cx
  push word L160
  mov cx, sp
  mov bp, [bp+4]
  mov dx, g46
  jmp [bp]

L162: ; Continuation
  mov ax, `\n`
  call Bare_put_char
  mov [2], ax
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L163: ; Continuation
  push word cx
  push word L162
  mov cx, sp
  mov bp, g16
  mov dx, dx
  jmp [bp]

L164: ; Continuation
  push word cx
  push word L163
  mov cx, sp
  mov bp, [bp+4]
  mov dx, g57
  jmp [bp]

L165: ; Continuation
  push word [bp+4]
  push word cx
  push word L164
  mov cx, sp
  mov bp, g16
  mov dx, dx
  jmp [bp]

L166: ; Arm: 165'15
  push word [bp+4]
  push word cx
  push word L165
  mov cx, sp
  mov bp, [bp+4]
  mov dx, g56
  jmp [bp]

L167: ; Continuation
  mov ax, `\n`
  call Bare_put_char
  mov [2], ax
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L168: ; Continuation
  push word cx
  push word L167
  mov cx, sp
  mov bp, g16
  mov dx, dx
  jmp [bp]

L169: ; Arm: 116'11
  push word g63
  push word '0'
  push word 1
  mov [4], sp
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L170: ; Continuation
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L171: ; Continuation
  mov ax, [bp+4]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  push word cx
  push word L168
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L169
  push word [bp+4]
  push word cx
  push word L170
  mov cx, sp
  mov bp, g62
  mov dx, g64
  jmp [bp]

L172: ; Continuation
  push word [bp+4]
  push word cx
  push word L171
  mov cx, sp
  mov bp, g16
  mov dx, dx
  jmp [bp]

L173: ; Continuation
  push word [bp+6]
  push word cx
  push word L172
  mov cx, sp
  mov bp, [bp+4]
  mov dx, g61
  jmp [bp]

L174: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L173
  mov cx, sp
  mov bp, g16
  mov dx, dx
  jmp [bp]

L175: ; Arm: 116'11
  push word g59
  push word '0'
  push word 1
  mov [4], sp
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L176: ; Continuation
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L177: ; Continuation
  mov ax, [bp+6]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  push word dx
  push word [bp+4]
  push word cx
  push word L174
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L175
  push word [bp+6]
  push word cx
  push word L176
  mov cx, sp
  mov bp, g58
  mov dx, g60
  jmp [bp]

L178: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L166
  mov ax, [bx+2]
  mov [2], ax
  push word [2]
  push word [bp+4]
  push word cx
  push word L177
  mov cx, sp
  mov bp, g25
  mov dx, [2]
  jmp [bp]

L179: ; Continuation
  push word [bp+4]
  push word cx
  push word L178
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+6]
  jmp [bp]

L180: ; Continuation
  push word dx
  push word [bp+4]
  push word cx
  push word L179
  mov cx, sp
  mov bp, g48
  mov dx, 0
  jmp [bp]

L181: ; Continuation
  mov bx, [bp+6]
  cmp word [bx], 0
  jz L156
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov bx, [4]
  cmp word [bx], 1
  jz L161
  push word [bp+4]
  push word cx
  push word L180
  mov cx, sp
  mov bp, [bp+4]
  mov dx, [2]
  jmp [bp]

L182: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L181
  mov cx, sp
  mov bp, g16
  mov dx, dx
  jmp [bp]

L183: ; Arm: 234'32
  push word [bp+14]
  push word [bp+6]
  push word cx
  push word L182
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g43
  jmp [bp]

L184: ; Continuation
  mov ax, `\n`
  call Bare_put_char
  mov [2], ax
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L185: ; Continuation
  push word cx
  push word L184
  mov cx, sp
  mov bp, g16
  mov dx, dx
  jmp [bp]

L186: ; Continuation
  push word cx
  push word L185
  mov cx, sp
  mov bp, [bp+4]
  mov dx, g69
  jmp [bp]

L187: ; Continuation
  push word [bp+4]
  push word cx
  push word L186
  mov cx, sp
  mov bp, g16
  mov dx, dx
  jmp [bp]

L188: ; Arm: 176'7
  push word [bp+4]
  push word cx
  push word L187
  mov cx, sp
  mov bp, [bp+4]
  mov dx, g68
  jmp [bp]

L189: ; Continuation
  mov ax, `\n`
  call Bare_put_char
  mov [2], ax
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L190: ; Continuation
  push word cx
  push word L189
  mov cx, sp
  mov bp, g16
  mov dx, dx
  jmp [bp]

L191: ; Continuation
  push word cx
  push word L190
  mov cx, sp
  mov bp, [bp+4]
  mov dx, g71
  jmp [bp]

L192: ; Continuation
  push word [bp+4]
  push word cx
  push word L191
  mov cx, sp
  mov bp, g16
  mov dx, dx
  jmp [bp]

L193: ; Arm: 179'12
  mov ax, [bx+2]
  mov [6], ax
  mov ax, [bx+4]
  mov [8], ax
  push word [bp+4]
  push word cx
  push word L192
  mov cx, sp
  mov bp, [bp+4]
  mov dx, g70
  jmp [bp]

L194: ; Continuation
  mov ax, `\n`
  call Bare_put_char
  mov [2], ax
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L195: ; Continuation
  push word cx
  push word L194
  mov cx, sp
  mov bp, g16
  mov dx, dx
  jmp [bp]

L196: ; Continuation
  push word cx
  push word L195
  mov cx, sp
  mov bp, [bp+4]
  mov dx, g81
  jmp [bp]

L197: ; Continuation
  push word [bp+4]
  push word cx
  push word L196
  mov cx, sp
  mov bp, g16
  mov dx, dx
  jmp [bp]

L198: ; Arm: 182'15
  push word [bp+4]
  push word cx
  push word L197
  mov cx, sp
  mov bp, [bp+4]
  mov dx, g80
  jmp [bp]

L199: ; Continuation
  mov ax, `\n`
  call Bare_put_char
  mov [2], ax
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L200: ; Continuation
  push word cx
  push word L199
  mov cx, sp
  mov bp, g16
  mov dx, dx
  jmp [bp]

L201: ; Arm: 116'11
  push word g87
  push word '0'
  push word 1
  mov [4], sp
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L202: ; Continuation
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L203: ; Continuation
  mov ax, [bp+4]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  push word cx
  push word L200
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L201
  push word [bp+4]
  push word cx
  push word L202
  mov cx, sp
  mov bp, g86
  mov dx, g88
  jmp [bp]

L204: ; Continuation
  push word [bp+4]
  push word cx
  push word L203
  mov cx, sp
  mov bp, g16
  mov dx, dx
  jmp [bp]

L205: ; Continuation
  push word [bp+6]
  push word cx
  push word L204
  mov cx, sp
  mov bp, [bp+4]
  mov dx, g85
  jmp [bp]

L206: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L205
  mov cx, sp
  mov bp, g16
  mov dx, dx
  jmp [bp]

L207: ; Arm: 116'11
  push word g83
  push word '0'
  push word 1
  mov [4], sp
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L208: ; Continuation
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L209: ; Continuation
  mov ax, [bp+6]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  push word dx
  push word [bp+4]
  push word cx
  push word L206
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L207
  push word [bp+6]
  push word cx
  push word L208
  mov cx, sp
  mov bp, g82
  mov dx, g84
  jmp [bp]

L210: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L198
  mov ax, [bx+2]
  mov [2], ax
  push word [2]
  push word [bp+4]
  push word cx
  push word L209
  mov cx, sp
  mov bp, g26
  mov dx, [2]
  jmp [bp]

L211: ; Continuation
  push word [bp+4]
  push word cx
  push word L210
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+6]
  jmp [bp]

L212: ; Continuation
  push word dx
  push word [bp+4]
  push word cx
  push word L211
  mov cx, sp
  mov bp, g72
  mov dx, 0
  jmp [bp]

L213: ; Continuation
  mov bx, [bp+6]
  cmp word [bx], 0
  jz L188
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov bx, [4]
  cmp word [bx], 1
  jz L193
  push word [bp+4]
  push word cx
  push word L212
  mov cx, sp
  mov bp, [bp+4]
  mov dx, [2]
  jmp [bp]

L214: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L213
  mov cx, sp
  mov bp, g16
  mov dx, dx
  jmp [bp]

L215: ; Arm: 235'35
  push word [bp+14]
  push word [bp+6]
  push word cx
  push word L214
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g67
  jmp [bp]

L216: ; Continuation
  mov ax, `\n`
  call Bare_put_char
  mov [2], ax
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L217: ; Continuation
  push word cx
  push word L216
  mov cx, sp
  mov bp, g16
  mov dx, dx
  jmp [bp]

L218: ; Continuation
  push word cx
  push word L217
  mov cx, sp
  mov bp, [bp+4]
  mov dx, g92
  jmp [bp]

L219: ; Continuation
  push word [bp+4]
  push word cx
  push word L218
  mov cx, sp
  mov bp, g16
  mov dx, dx
  jmp [bp]

L220: ; Arm: 205'9
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  push word [bp+6]
  push word cx
  push word L219
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g91
  jmp [bp]

L221: ; Arm: 198'38
  mov dx, g96
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L222: ; Continuation
  mov ax, `\n`
  call Bare_put_char
  mov [2], ax
  mov bp, [bp+4]
  mov dx, g98
  jmp [bp]

L223: ; Continuation
  push word [bp+4]
  push word cx
  push word L222
  mov cx, sp
  mov bp, g16
  mov dx, dx
  jmp [bp]

L224: ; Continuation
  push word [bp+6]
  push word cx
  push word L223
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L225: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L224
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L226: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L225
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+10]
  jmp [bp]

L227: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L226
  mov cx, sp
  mov bp, g13
  mov dx, g97
  jmp [bp]

L228: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L221
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L227
  mov cx, sp
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L229: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L228
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  jmp [bp]

L230: ; Continuation
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L229
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  jmp [bp]

L231: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L230
  mov cx, sp
  mov bp, g8
  mov dx, g95
  jmp [bp]

L232: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L231
  mov cx, sp
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L233: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L232
  mov cx, sp
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L234: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L233
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L235: ; Function: t1
  push word bp
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L234
  mov cx, sp
  mov bp, g18
  mov dx, g94
  jmp [bp]

L236: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L235
  mov [2], sp
  mov bp, [2]
  mov dx, g99
  jmp [bp]

L237: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L236
  mov cx, sp
  mov bp, g16
  mov dx, dx
  jmp [bp]

L238: ; Arm: 236'36
  mov bx, [bp+12]
  cmp word [bx], 1
  jz L220
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L237
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g93
  jmp [bp]

L239: ; Continuation
  mov ax, `\n`
  call Bare_put_char
  mov [2], ax
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L240: ; Continuation
  push word cx
  push word L239
  mov cx, sp
  mov bp, g16
  mov dx, dx
  jmp [bp]

L241: ; Continuation
  push word cx
  push word L240
  mov cx, sp
  mov bp, [bp+4]
  mov dx, g106
  jmp [bp]

L242: ; Continuation
  push word [bp+4]
  push word cx
  push word L241
  mov cx, sp
  mov bp, g16
  mov dx, dx
  jmp [bp]

L243: ; Arm: 116'11
  push word g104
  push word '0'
  push word 1
  mov [4], sp
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L244: ; Continuation
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L245: ; Continuation
  mov ax, [bp+6]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  push word [bp+4]
  push word cx
  push word L242
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L243
  push word [bp+6]
  push word cx
  push word L244
  mov cx, sp
  mov bp, g103
  mov dx, g105
  jmp [bp]

L246: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L245
  mov cx, sp
  mov bp, g16
  mov dx, dx
  jmp [bp]

L247: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L246
  mov cx, sp
  mov bp, [bp+4]
  mov dx, g102
  jmp [bp]

L248: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L247
  mov cx, sp
  mov bp, g16
  mov dx, dx
  jmp [bp]

L249: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L248
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L250: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L249
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L251: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L250
  mov cx, sp
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L252: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L251
  mov cx, sp
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L253: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L252
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L254: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L253
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g101
  jmp [bp]

L255: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L254
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L256: ; Continuation
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L255
  mov cx, sp
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L257: ; Continuation
  mov ax, [bp+8]
  call Bare_string_length
  mov [2], ax
  push word [2]
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L256
  mov cx, sp
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L258: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L238
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L257
  mov cx, sp
  mov bp, g14
  mov dx, g100
  jmp [bp]

L259: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L258
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  jmp [bp]

L260: ; Continuation
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L259
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  jmp [bp]

L261: ; Continuation
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L260
  mov cx, sp
  mov bp, g8
  mov dx, g90
  jmp [bp]

L262: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L261
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g89
  jmp [bp]

L263: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L215
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L262
  mov cx, sp
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L264: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L263
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+16]
  jmp [bp]

L265: ; Continuation
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L264
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+16]
  jmp [bp]

L266: ; Continuation
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L265
  mov cx, sp
  mov bp, g8
  mov dx, g66
  jmp [bp]

L267: ; Continuation
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L266
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g65
  jmp [bp]

L268: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L183
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L267
  mov cx, sp
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L269: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L268
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+16]
  jmp [bp]

L270: ; Continuation
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L269
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+16]
  jmp [bp]

L271: ; Continuation
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L270
  mov cx, sp
  mov bp, g8
  mov dx, g42
  jmp [bp]

L272: ; Continuation
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L271
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g41
  jmp [bp]

L273: ; Continuation
  push word [bp+10]
  push word cx
  push word L150
  mov cx, sp
  mov bx, dx
  cmp word [bx], 0
  jz L151
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  push word [4]
  push word [2]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L272
  mov cx, sp
  mov bp, [bp+6]
  mov dx, [2]
  jmp [bp]

L274: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L273
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  jmp [bp]

L275: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L274
  mov cx, sp
  mov bp, dx
  mov dx, g39
  jmp [bp]

L276: ; Continuation
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L275
  mov cx, sp
  mov bp, [bp+10]
  mov dx, g38
  jmp [bp]

L277: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L149
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L276
  mov cx, sp
  mov dx, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L278: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L277
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+16]
  jmp [bp]

L279: ; Continuation
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L278
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+16]
  jmp [bp]

L280: ; Continuation
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L279
  mov cx, sp
  mov bp, g8
  mov dx, g36
  jmp [bp]

L281: ; Continuation
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L280
  mov cx, sp
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L282: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L281
  mov cx, sp
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L283: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L282
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L284: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L283
  mov cx, sp
  mov bp, g18
  mov dx, g35
  jmp [bp]

L285: ; Function: t2
  push word g34
  push word ' '
  push word 1
  mov [2], sp
  push word [2]
  push word '>'
  push word 1
  mov [4], sp
  push word bp
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L284
  mov cx, sp
  mov bp, g16
  mov dx, [4]
  jmp [bp]

L286: ; Continuation
  mov bp, [bp+4]
  mov dx, g109
  jmp [bp]

L287: ; Continuation
  push word [bp+4]
  push word cx
  push word L286
  mov cx, sp
  mov bp, g16
  mov dx, dx
  jmp [bp]

L288: ; Continuation
  push word [bp+4]
  push word L148
  mov [2], sp
  push word [2]
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word L285
  mov [4], sp
  push word [4]
  push word cx
  push word L287
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g108
  jmp [bp]

L289: ; Continuation
  push word g29
  push word 4
  push word 1
  mov [2], sp
  push word dx
  push word [bp+4]
  push word cx
  push word L288
  mov cx, sp
  mov bp, [bp+4]
  mov dx, [2]
  jmp [bp]

L290: ; Continuation
  push word dx
  push word cx
  push word L289
  mov cx, sp
  mov bp, g1
  mov dx, g7
  jmp [bp]

L291: ; Start
  push word cx
  push word L290
  mov cx, sp
  mov bp, g1
  mov dx, g5
  jmp [bp]

g1: dw L2
g2: dw L5
g3: dw L10
g4: dw 0
g5: dw L18
g6: dw 0
g7: dw L24
g8: dw L35
g9: dw 1
g10: dw 0
g11: dw 0
g12: dw 0
g13: dw L39
g14: dw L45
g15: dw 0
g16: dw L51
g17: dw 0
g18: dw L67
g19: dw 0
g20: dw 0
g21: dw 0
g22: dw 0
g23: dw 1
g24: dw 0
g25: dw L71
g26: dw L76
g27: dw 0
g28: dw 1
g29: dw 0
g30: dw 0
g31: dw 0
g32: dw 0
g33: dw 0
g34: dw 0
g35: dw 0
g36: dw L78
g37: dw 0
g38: dw 0
g39: dw 0
g40: dw 0
g41: dw 3, 'f', 'i', 'b'
g42: dw L80
g43: dw 5, 'f', 'i', 'b', ':', ' '
g44: dw 7, 'E', 'R', 'R', 'O', 'R', ':', ' '
g45: dw 20, 'e', 'x', 'p', 'e', 'c', 't', 'e', 'd', ' ', 'a', 'n', ' ', 'a', 'r', 'g', 'u', 'm', 'e', 'n', 't'
g46: dw 7, 'E', 'R', 'R', 'O', 'R', ':', ' '
g47: dw 29, 'e', 'x', 'p', 'e', 'c', 't', 'e', 'd', ' ', 'e', 'x', 'a', 'c', 't', 'l', 'y', ' ', 'o', 'n', 'e', ' ', 'a', 'r', 'g', 'u', 'm', 'e', 'n', 't'
g48: dw L92
g49: dw 0
g50: dw 1
g51: dw 0
g52: dw 1
g53: dw 1
g54: dw 1
g55: dw 1
g56: dw 7, 'E', 'R', 'R', 'O', 'R', ':', ' '
g57: dw 27, 'e', 'x', 'p', 'e', 'c', 't', 'e', 'd', ' ', 'a', 'r', 'g', '1', ' ', 't', 'o', ' ', 'b', 'e', ' ', 'n', 'u', 'm', 'e', 'r', 'i', 'c'
g58: dw L96
g59: dw 0
g60: dw 0
g61: dw 5, ' ', '-', '-', '>', ' '
g62: dw L100
g63: dw 0
g64: dw 0
g65: dw 4, 'f', 'a', 'c', 't'
g66: dw L102
g67: dw 6, 'f', 'a', 'c', 't', ':', ' '
g68: dw 7, 'E', 'R', 'R', 'O', 'R', ':', ' '
g69: dw 20, 'e', 'x', 'p', 'e', 'c', 't', 'e', 'd', ' ', 'a', 'n', ' ', 'a', 'r', 'g', 'u', 'm', 'e', 'n', 't'
g70: dw 7, 'E', 'R', 'R', 'O', 'R', ':', ' '
g71: dw 29, 'e', 'x', 'p', 'e', 'c', 't', 'e', 'd', ' ', 'e', 'x', 'a', 'c', 't', 'l', 'y', ' ', 'o', 'n', 'e', ' ', 'a', 'r', 'g', 'u', 'm', 'e', 'n', 't'
g72: dw L114
g73: dw 0
g74: dw 1
g75: dw 0
g76: dw 1
g77: dw 1
g78: dw 1
g79: dw 1
g80: dw 7, 'E', 'R', 'R', 'O', 'R', ':', ' '
g81: dw 27, 'e', 'x', 'p', 'e', 'c', 't', 'e', 'd', ' ', 'a', 'r', 'g', '1', ' ', 't', 'o', ' ', 'b', 'e', ' ', 'n', 'u', 'm', 'e', 'r', 'i', 'c'
g82: dw L118
g83: dw 0
g84: dw 0
g85: dw 5, ' ', '-', '-', '>', ' '
g86: dw L122
g87: dw 0
g88: dw 0
g89: dw 3, 'r', 'e', 'v'
g90: dw L124
g91: dw 7, 'E', 'R', 'R', 'O', 'R', ':', ' '
g92: dw 26, 'r', 'e', 'v', ':', ' ', 'e', 'x', 'p', 'e', 'c', 't', 'e', 'd', ' ', 'n', 'o', ' ', 'a', 'r', 'g', 'u', 'm', 'e', 'n', 't', 's'
g93: dw 31, '(', 'r', 'e', 'v', 'e', 'r', 's', 'e', ' ', 't', 'y', 'p', 'e', 'd', ' ', 'l', 'i', 'n', 'e', 's', ' ', 'u', 'n', 't', 'i', 'l', ' ', '^', 'D', ')', `\n`
g94: dw 0
g95: dw L126
g96: dw 0
g97: dw 0
g98: dw 0
g99: dw 0
g100: dw L128
g101: dw 12, 'Y', 'o', 'u', ' ', 'w', 'r', 'o', 't', 'e', ':', ' ', '"'
g102: dw 3, '"', ' ', '('
g103: dw L132
g104: dw 0
g105: dw 0
g106: dw 7, ' ', 'c', 'h', 'a', 'r', 's', ')'
g107: dw 0
g108: dw 47, 'T', 'h', 'i', 's', ' ', 'i', 's', ' ', 'a', ' ', 's', 'h', 'e', 'l', 'l', ' ', 'p', 'r', 'o', 't', 'o', 't', 'y', 'p', 'e', '.', ' ', 'T', 'r', 'y', ':', ' ', 'f', 'i', 'b', ',', ' ', 'f', 'a', 'c', 't', ',', ' ', 'r', 'e', 'v', `\n`
g109: dw 0

bare_start: jmp L291
