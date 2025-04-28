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

L3: ; Arm: 25'7
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

L6: ; Arm: 30'7
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L7: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L8: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L6
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
  push word L7
  mov cx, sp
  mov bp, g3
  mov dx, [Temps+6]
  jmp [bp]

L9: ; Function: g3
  push word dx
  push word L8
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L10: ; Arm: 43'9
  mov dx, g4
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L11: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L12: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L10
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
  push word L11
  mov cx, sp
  mov bp, [bp+6]
  mov dx, [Temps+8]
  jmp [bp]

L13: ; Function: t2
  push word bp
  push word dx
  push word [bp+2]
  push word L12
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L14: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L15: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word cx
  push word L14
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L16: ; Continuation
  call Bare_enter_check
  mov ax, dx
  call Bare_make_bytes
  mov [Temps+2], ax
  push word [Temps+2]
  push word L13
  mov [Temps+4], sp
  push word [Temps+2]
  push word [bp+4]
  push word cx
  push word L15
  mov cx, sp
  mov bp, [Temps+4]
  mov dx, 0
  jmp [bp]

L17: ; Function: g5
  push word dx
  push word cx
  push word L16
  mov cx, sp
  mov bp, g2
  mov dx, dx
  jmp [bp]

L18: ; Arm: 51'13
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L19: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  sub ax, 1
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L20: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L18
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
  push word L19
  mov cx, sp
  mov bp, [bp+6]
  mov dx, [Temps+6]
  jmp [bp]

L21: ; Function: t1
  push word bp
  push word dx
  push word [bp+2]
  push word L20
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L22: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  sub ax, 1
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L23: ; Function: g7
  push word dx
  push word L21
  mov [Temps+2], sp
  mov ax, dx
  call Bare_string_length
  mov [Temps+4], ax
  push word [Temps+4]
  push word cx
  push word L22
  mov cx, sp
  mov bp, [Temps+2]
  mov dx, g6
  jmp [bp]

L24: ; Arm: 72'7
  mov dx, g9
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L25: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, g8
  jmp [bp]

L26: ; Arm: 65'19
  mov ax, [Temps+2]
  call Bare_put_char
  mov [Temps+10], ax
  mov dx, [Temps+10]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L27: ; Arm: 66'22
  mov ax, [Temps+2]
  call Bare_put_char
  mov [Temps+12], ax
  mov dx, [Temps+12]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L28: ; Arm: 67'16
  mov ax, [Temps+2]
  call Bare_put_char
  mov [Temps+14], ax
  mov dx, [Temps+14]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L29: ; Function: g8
  mov bx, dx
  cmp word [bx], 0
  jz L24
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
  push word L25
  mov cx, sp
  mov bx, [Temps+8]
  cmp word [bx], 1
  jz L26
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 1
  jz L27
  mov ax, 26
  cmp word ax, [Temps+6]
  call Bare_make_bool_from_n
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 1
  jz L28
  mov ax, '^'
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

L30: ; Arm: 86'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L31: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L32: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L30
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
  push word L31
  mov cx, sp
  mov bp, g29
  mov dx, [Temps+10]
  jmp [bp]

L33: ; Function: g29
  push word dx
  push word L32
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L34: ; Arm: 86'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L35: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L36: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L34
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
  push word L35
  mov cx, sp
  mov bp, g39
  mov dx, [Temps+10]
  jmp [bp]

L37: ; Function: g39
  push word dx
  push word L36
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L38: ; Arm: 86'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L39: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L40: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L38
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
  push word L39
  mov cx, sp
  mov bp, g42
  mov dx, [Temps+10]
  jmp [bp]

L41: ; Function: g42
  push word dx
  push word L40
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L42: ; Arm: 86'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L43: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L44: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L42
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
  push word L43
  mov cx, sp
  mov bp, g52
  mov dx, [Temps+10]
  jmp [bp]

L45: ; Function: g52
  push word dx
  push word L44
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L46: ; Arm: 86'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L47: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L48: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L46
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
  push word L47
  mov cx, sp
  mov bp, g55
  mov dx, [Temps+10]
  jmp [bp]

L49: ; Function: g55
  push word dx
  push word L48
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L50: ; Arm: 86'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L51: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L52: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L50
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
  push word L51
  mov cx, sp
  mov bp, g58
  mov dx, [Temps+10]
  jmp [bp]

L53: ; Function: g58
  push word dx
  push word L52
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L54: ; Arm: 86'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L55: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L56: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L54
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
  push word L55
  mov cx, sp
  mov bp, g75
  mov dx, [Temps+10]
  jmp [bp]

L57: ; Function: g75
  push word dx
  push word L56
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L58: ; Arm: 86'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L59: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L60: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L58
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
  push word L59
  mov cx, sp
  mov bp, g85
  mov dx, [Temps+10]
  jmp [bp]

L61: ; Function: g85
  push word dx
  push word L60
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L62: ; Arm: 86'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L63: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L64: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L62
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
  push word L63
  mov cx, sp
  mov bp, g103
  mov dx, [Temps+10]
  jmp [bp]

L65: ; Function: g103
  push word dx
  push word L64
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L66: ; Arm: 86'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L67: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L68: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L66
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
  push word L67
  mov cx, sp
  mov bp, g113
  mov dx, [Temps+10]
  jmp [bp]

L69: ; Function: g113
  push word dx
  push word L68
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L70: ; Arm: 100'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L71: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  sub ax, 1
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L72: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L70
  push word [bp+2]
  push word '-'
  push word 1
  mov [Temps+4], sp
  push word dx
  push word cx
  push word L71
  mov cx, sp
  mov bp, g132
  mov dx, [Temps+4]
  jmp [bp]

L73: ; Function: g132
  push word dx
  push word L72
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L74: ; Arm: 86'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L75: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L76: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L74
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
  push word L75
  mov cx, sp
  mov bp, g137
  mov dx, [Temps+10]
  jmp [bp]

L77: ; Function: g137
  push word dx
  push word L76
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L78: ; Arm: 86'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L79: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L80: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L78
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
  push word L79
  mov cx, sp
  mov bp, g147
  mov dx, [Temps+10]
  jmp [bp]

L81: ; Function: g147
  push word dx
  push word L80
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L82: ; Arm: 86'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L83: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L84: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L82
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
  push word L83
  mov cx, sp
  mov bp, g150
  mov dx, [Temps+10]
  jmp [bp]

L85: ; Function: g150
  push word dx
  push word L84
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L86: ; Arm: 86'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L87: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L88: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L86
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
  push word L87
  mov cx, sp
  mov bp, g160
  mov dx, [Temps+10]
  jmp [bp]

L89: ; Function: g160
  push word dx
  push word L88
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L90: ; Arm: 86'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L91: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L92: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L90
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
  push word L91
  mov cx, sp
  mov bp, g163
  mov dx, [Temps+10]
  jmp [bp]

L93: ; Function: g163
  push word dx
  push word L92
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L94: ; Arm: 86'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L95: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L96: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L94
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
  push word L95
  mov cx, sp
  mov bp, g166
  mov dx, [Temps+10]
  jmp [bp]

L97: ; Function: g166
  push word dx
  push word L96
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L98: ; Arm: 86'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L99: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L100: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L98
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
  push word L99
  mov cx, sp
  mov bp, g183
  mov dx, [Temps+10]
  jmp [bp]

L101: ; Function: g183
  push word dx
  push word L100
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L102: ; Arm: 86'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L103: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L104: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L102
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
  push word L103
  mov cx, sp
  mov bp, g193
  mov dx, [Temps+10]
  jmp [bp]

L105: ; Function: g193
  push word dx
  push word L104
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L106: ; Arm: 86'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L107: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L108: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L106
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
  push word L107
  mov cx, sp
  mov bp, g211
  mov dx, [Temps+10]
  jmp [bp]

L109: ; Function: g211
  push word dx
  push word L108
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L110: ; Arm: 86'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L111: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L112: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L110
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
  push word L111
  mov cx, sp
  mov bp, g221
  mov dx, [Temps+10]
  jmp [bp]

L113: ; Function: g221
  push word dx
  push word L112
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L114: ; Arm: 86'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L115: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L116: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L114
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
  push word L115
  mov cx, sp
  mov bp, g243
  mov dx, [Temps+10]
  jmp [bp]

L117: ; Function: g243
  push word dx
  push word L116
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L118: ; Arm: 86'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L119: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L120: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L118
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
  push word L119
  mov cx, sp
  mov bp, g253
  mov dx, [Temps+10]
  jmp [bp]

L121: ; Function: g253
  push word dx
  push word L120
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L122: ; Arm: 86'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L123: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L124: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L122
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
  push word L123
  mov cx, sp
  mov bp, g256
  mov dx, [Temps+10]
  jmp [bp]

L125: ; Function: g256
  push word dx
  push word L124
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L126: ; Arm: 86'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L127: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L128: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L126
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
  push word L127
  mov cx, sp
  mov bp, g266
  mov dx, [Temps+10]
  jmp [bp]

L129: ; Function: g266
  push word dx
  push word L128
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L130: ; Arm: 86'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L131: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L132: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L130
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
  push word L131
  mov cx, sp
  mov bp, g274
  mov dx, [Temps+10]
  jmp [bp]

L133: ; Function: g274
  push word dx
  push word L132
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L134: ; Arm: 86'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L135: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L136: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L134
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
  push word L135
  mov cx, sp
  mov bp, g284
  mov dx, [Temps+10]
  jmp [bp]

L137: ; Function: g284
  push word dx
  push word L136
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L138: ; Arm: 86'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L139: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L140: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L138
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
  push word L139
  mov cx, sp
  mov bp, g302
  mov dx, [Temps+10]
  jmp [bp]

L141: ; Function: g302
  push word dx
  push word L140
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L142: ; Arm: 86'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L143: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L144: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L142
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
  push word L143
  mov cx, sp
  mov bp, g312
  mov dx, [Temps+10]
  jmp [bp]

L145: ; Function: g312
  push word dx
  push word L144
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L146: ; Arm: 86'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L147: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L148: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L146
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
  push word L147
  mov cx, sp
  mov bp, g330
  mov dx, [Temps+10]
  jmp [bp]

L149: ; Function: g330
  push word dx
  push word L148
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L150: ; Arm: 117'16
  mov dx, g22
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L151: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L150
  mov ax, 0
  add ax, [bp+8]
  mov [Temps+2], ax
  mov ax, [bp+4]
  mov bx, [Temps+2]
  call Bare_get_bytes
  mov [Temps+4], ax
  mov ax, [bp+6]
  mov si, [bp+8]
  mov bx, [Temps+4]
  call Bare_set_bytes
  mov [Temps+6], ax
  mov ax, [bp+8]
  add ax, 1
  mov [Temps+8], ax
  mov bp, [bp+10]
  mov dx, [Temps+8]
  jmp [bp]

L152: ; Arm: 13'9
  mov dx, g20
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L153: ; Function: t2
  mov ax, dx
  cmp word ax, 512
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word dx
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L151
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L152
  mov dx, g21
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L154: ; Arm: 254'16
  mov dx, g24
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L155: ; Arm: 100'13
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L156: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  sub ax, 1
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L157: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L155
  push word [bp+4]
  push word [bp+2]
  push word 1
  mov [Temps+4], sp
  push word dx
  push word cx
  push word L156
  mov cx, sp
  mov bp, [bp+6]
  mov dx, [Temps+4]
  jmp [bp]

L158: ; Function: t5
  push word bp
  push word dx
  push word [bp+2]
  push word L157
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L159: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  add ax, 1
  mov [Temps+2], ax
  mov bp, [bp+6]
  mov dx, [Temps+2]
  jmp [bp]

L160: ; Continuation
  call Bare_enter_check
  call Bare_crash
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L161: ; Continuation
  call Bare_enter_check
  push word cx
  push word L160
  mov cx, sp
  mov bp, g8
  mov dx, dx
  jmp [bp]

L162: ; Continuation
  call Bare_enter_check
  push word cx
  push word L161
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L163: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word cx
  push word L162
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L164: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L163
  mov cx, sp
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L165: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L164
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
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
  mov bp, g3
  mov dx, g37
  jmp [bp]

L167: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L166
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L168: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L167
  mov cx, sp
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L169: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L168
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g36
  jmp [bp]

L170: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L169
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L171: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L170
  mov cx, sp
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L172: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L171
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  jmp [bp]

L173: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L172
  mov cx, sp
  mov bp, g3
  mov dx, g35
  jmp [bp]

L174: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L173
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L175: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L174
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g34
  jmp [bp]

L176: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L175
  mov cx, sp
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L177: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L176
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L178: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L177
  mov cx, sp
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L179: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L178
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+10]
  jmp [bp]

L180: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L179
  mov cx, sp
  mov bp, g3
  mov dx, g33
  jmp [bp]

L181: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L180
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L182: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L181
  mov cx, sp
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L183: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L182
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g32
  jmp [bp]

L184: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L183
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L185: ; Arm: 89'11
  push word g30
  push word '0'
  push word 1
  mov [Temps+4], sp
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L186: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L187: ; Arm: 243'23
  mov ax, [bp+10]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L184
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L185
  push word [bp+10]
  push word cx
  push word L186
  mov cx, sp
  mov bp, g29
  mov dx, g31
  jmp [bp]

L188: ; Arm: 128'16
  mov dx, g70
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L189: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L188
  mov ax, [bp+6]
  mov bx, [bp+10]
  call Bare_get_bytes
  mov [Temps+2], ax
  mov ax, [bp+4]
  add ax, [bp+10]
  mov [Temps+4], ax
  mov ax, [bp+8]
  mov si, [Temps+4]
  mov bx, [Temps+2]
  call Bare_set_bytes
  mov [Temps+6], ax
  mov ax, [bp+10]
  add ax, 1
  mov [Temps+8], ax
  mov bp, [bp+12]
  mov dx, [Temps+8]
  jmp [bp]

L190: ; Arm: 13'9
  mov dx, g68
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L191: ; Function: t1
  mov ax, dx
  cmp word ax, 64
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L189
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L190
  mov dx, g69
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L192: ; Continuation
  call Bare_enter_check
  mov bx, [bp+4]
  mov ax, g71
  mov word [bx], ax
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L193: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word L191
  mov [Temps+2], sp
  push word [bp+8]
  push word cx
  push word L192
  mov cx, sp
  mov bp, [Temps+2]
  mov dx, 0
  jmp [bp]

L194: ; Arm: 205'23
  push word [Temps+8]
  push word [bp+14]
  push word [bp+12]
  push word cx
  push word L193
  mov cx, sp
  mov bx, [Temps+12]
  mov ax, [bx+2]
  mov [Temps+16], ax
  mov dx, [Temps+16]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L195: ; Arm: 128'16
  mov dx, g129
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L196: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L195
  mov ax, [bp+6]
  mov bx, [bp+10]
  call Bare_get_bytes
  mov [Temps+2], ax
  mov ax, [bp+4]
  add ax, [bp+10]
  mov [Temps+4], ax
  mov ax, [bp+8]
  mov si, [Temps+4]
  mov bx, [Temps+2]
  call Bare_set_bytes
  mov [Temps+6], ax
  mov ax, [bp+10]
  add ax, 1
  mov [Temps+8], ax
  mov bp, [bp+12]
  mov dx, [Temps+8]
  jmp [bp]

L197: ; Arm: 13'9
  mov dx, g127
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L198: ; Function: t1
  mov ax, dx
  cmp word ax, 64
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L196
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L197
  mov dx, g128
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L199: ; Continuation
  call Bare_enter_check
  push word g130
  mov ax, sp
  mov [Temps+2], ax
  push word [bp+8]
  push word [bp+4]
  push word [Temps+2]
  push word 0
  mov [Temps+4], sp
  mov bx, [bp+6]
  mov ax, [Temps+4]
  mov word [bx], ax
  mov [Temps+6], ax
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L200: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word L198
  mov [Temps+2], sp
  push word [bp+12]
  push word [bp+10]
  push word [bp+4]
  push word cx
  push word L199
  mov cx, sp
  mov bp, [Temps+2]
  mov dx, 0
  jmp [bp]

L201: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L200
  mov cx, sp
  mov bx, dx
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L202: ; Continuation
  call Bare_enter_check
  call Bare_crash
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L203: ; Continuation
  call Bare_enter_check
  push word cx
  push word L202
  mov cx, sp
  mov bp, g8
  mov dx, dx
  jmp [bp]

L204: ; Continuation
  call Bare_enter_check
  push word cx
  push word L203
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L205: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word cx
  push word L204
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L206: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L205
  mov cx, sp
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L207: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L206
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  jmp [bp]

L208: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L207
  mov cx, sp
  mov bp, g3
  mov dx, g111
  jmp [bp]

L209: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L208
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L210: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L209
  mov cx, sp
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L211: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L210
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g110
  jmp [bp]

L212: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L211
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L213: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L212
  mov cx, sp
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L214: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L213
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  jmp [bp]

L215: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L214
  mov cx, sp
  mov bp, g3
  mov dx, g109
  jmp [bp]

L216: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L215
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L217: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L216
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g108
  jmp [bp]

L218: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L217
  mov cx, sp
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L219: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L218
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L220: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L219
  mov cx, sp
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L221: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L220
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  jmp [bp]

L222: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L221
  mov cx, sp
  mov bp, g3
  mov dx, g107
  jmp [bp]

L223: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L222
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L224: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L223
  mov cx, sp
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L225: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L224
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g106
  jmp [bp]

L226: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L225
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L227: ; Arm: 89'11
  push word g104
  push word '0'
  push word 1
  mov [Temps+4], sp
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L228: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L229: ; Arm: 157'27
  mov ax, [bp+8]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L226
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L227
  push word [bp+8]
  push word cx
  push word L228
  mov cx, sp
  mov bp, g103
  mov dx, g105
  jmp [bp]

L230: ; Arm: 117'16
  mov dx, g126
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L231: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L230
  mov ax, [bp+6]
  add ax, [bp+10]
  mov [Temps+2], ax
  mov ax, [bp+4]
  mov bx, [Temps+2]
  call Bare_get_bytes
  mov [Temps+4], ax
  mov ax, [bp+8]
  mov si, [bp+10]
  mov bx, [Temps+4]
  call Bare_set_bytes
  mov [Temps+6], ax
  mov ax, [bp+10]
  add ax, 1
  mov [Temps+8], ax
  mov bp, [bp+12]
  mov dx, [Temps+8]
  jmp [bp]

L232: ; Arm: 13'9
  mov dx, g124
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L233: ; Function: t3
  mov ax, dx
  cmp word ax, 512
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L231
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L232
  mov dx, g125
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L234: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word 0
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L235: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 512
  call Bare_mul
  mov [Temps+2], ax
  mov ax, 512
  call Bare_make_bytes
  mov [Temps+4], ax
  push word [Temps+4]
  push word [Temps+2]
  push word dx
  push word L233
  mov [Temps+6], sp
  push word [Temps+4]
  push word cx
  push word L234
  mov cx, sp
  mov bp, [Temps+6]
  mov dx, 0
  jmp [bp]

L236: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L235
  mov cx, sp
  mov bx, [bp+6]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L237: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L236
  mov cx, sp
  mov bp, g8
  mov dx, dx
  jmp [bp]

L238: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L237
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L239: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L238
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L240: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L239
  mov cx, sp
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L241: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L240
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  jmp [bp]

L242: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L241
  mov cx, sp
  mov bp, g3
  mov dx, g123
  jmp [bp]

L243: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L242
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L244: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L243
  mov cx, sp
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L245: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L244
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g122
  jmp [bp]

L246: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L245
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L247: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L246
  mov cx, sp
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L248: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L247
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  jmp [bp]

L249: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L248
  mov cx, sp
  mov bp, g3
  mov dx, g121
  jmp [bp]

L250: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L249
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L251: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L250
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g120
  jmp [bp]

L252: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L251
  mov cx, sp
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L253: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L252
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L254: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L253
  mov cx, sp
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L255: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L254
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  jmp [bp]

L256: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L255
  mov cx, sp
  mov bp, g3
  mov dx, g119
  jmp [bp]

L257: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L256
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L258: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L257
  mov cx, sp
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L259: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L258
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g118
  jmp [bp]

L260: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L259
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L261: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L260
  mov cx, sp
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L262: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L261
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  jmp [bp]

L263: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L262
  mov cx, sp
  mov bp, g3
  mov dx, g117
  jmp [bp]

L264: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L263
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L265: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L264
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g116
  jmp [bp]

L266: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L265
  mov cx, sp
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L267: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L266
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L268: ; Arm: 89'11
  push word g114
  push word '0'
  push word 1
  mov [Temps+4], sp
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L269: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L270: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word cx
  push word L201
  mov cx, sp
  mov bx, dx
  cmp word [bx], 1
  jz L229
  mov ax, [bp+8]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  push word [bp+14]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L267
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L268
  push word [bp+8]
  push word cx
  push word L269
  mov cx, sp
  mov bp, g113
  mov dx, g115
  jmp [bp]

L271: ; Arm: 153'34
  mov dx, g100
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L272: ; Arm: 13'9
  mov dx, g101
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L273: ; Continuation
  call Bare_enter_check
  mov ax, [bp+8]
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [Temps+2], ax
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
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L271
  mov ax, [bp+8]
  cmp word ax, 32
  call Bare_make_bool_from_n
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 1
  jz L272
  mov dx, g102
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L274: ; Continuation
  call Bare_enter_check
  call Bare_crash
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L275: ; Continuation
  call Bare_enter_check
  push word cx
  push word L274
  mov cx, sp
  mov bp, g8
  mov dx, dx
  jmp [bp]

L276: ; Continuation
  call Bare_enter_check
  push word cx
  push word L275
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L277: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word cx
  push word L276
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L278: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L277
  mov cx, sp
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L279: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L278
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  jmp [bp]

L280: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L279
  mov cx, sp
  mov bp, g3
  mov dx, g83
  jmp [bp]

L281: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L280
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L282: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L281
  mov cx, sp
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L283: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L282
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g82
  jmp [bp]

L284: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L283
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L285: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L284
  mov cx, sp
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L286: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L285
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  jmp [bp]

L287: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L286
  mov cx, sp
  mov bp, g3
  mov dx, g81
  jmp [bp]

L288: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L287
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L289: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L288
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g80
  jmp [bp]

L290: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L289
  mov cx, sp
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L291: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L290
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L292: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L291
  mov cx, sp
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L293: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L292
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  jmp [bp]

L294: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L293
  mov cx, sp
  mov bp, g3
  mov dx, g79
  jmp [bp]

L295: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L294
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L296: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L295
  mov cx, sp
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L297: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L296
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g78
  jmp [bp]

L298: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L297
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L299: ; Arm: 89'11
  push word g76
  push word '0'
  push word 1
  mov [Temps+4], sp
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L300: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L301: ; Arm: 163'27
  mov ax, [bp+10]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L298
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L299
  push word [bp+10]
  push word cx
  push word L300
  mov cx, sp
  mov bp, g75
  mov dx, g77
  jmp [bp]

L302: ; Arm: 128'16
  mov dx, g98
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L303: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L302
  mov ax, [bp+8]
  mov bx, [bp+10]
  call Bare_get_bytes
  mov [Temps+2], ax
  mov ax, [bp+6]
  add ax, [bp+10]
  mov [Temps+4], ax
  mov ax, [bp+4]
  mov si, [Temps+4]
  mov bx, [Temps+2]
  call Bare_set_bytes
  mov [Temps+6], ax
  mov ax, [bp+10]
  add ax, 1
  mov [Temps+8], ax
  mov bp, [bp+12]
  mov dx, [Temps+8]
  jmp [bp]

L304: ; Arm: 13'9
  mov dx, g96
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L305: ; Function: t1
  mov ax, dx
  cmp word ax, 512
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L303
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L304
  mov dx, g97
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L306: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word L305
  mov [Temps+2], sp
  mov bp, [Temps+2]
  mov dx, 0
  jmp [bp]

L307: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 512
  call Bare_mul
  mov [Temps+2], ax
  push word [Temps+2]
  push word dx
  push word cx
  push word L306
  mov cx, sp
  mov bx, [bp+6]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L308: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L307
  mov cx, sp
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L309: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L308
  mov cx, sp
  mov bp, g8
  mov dx, dx
  jmp [bp]

L310: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L309
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L311: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L310
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L312: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L311
  mov cx, sp
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L313: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L312
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  jmp [bp]

L314: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L313
  mov cx, sp
  mov bp, g3
  mov dx, g95
  jmp [bp]

L315: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L314
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L316: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L315
  mov cx, sp
  mov dx, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L317: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L316
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g94
  jmp [bp]

L318: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L317
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L319: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L318
  mov cx, sp
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L320: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L319
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  jmp [bp]

L321: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L320
  mov cx, sp
  mov bp, g3
  mov dx, g93
  jmp [bp]

L322: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L321
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L323: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L322
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g92
  jmp [bp]

L324: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L323
  mov cx, sp
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L325: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L324
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L326: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L325
  mov cx, sp
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L327: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L326
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  jmp [bp]

L328: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L327
  mov cx, sp
  mov bp, g3
  mov dx, g91
  jmp [bp]

L329: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L328
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L330: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L329
  mov cx, sp
  mov dx, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L331: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L330
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g90
  jmp [bp]

L332: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L331
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L333: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L332
  mov cx, sp
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L334: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L333
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  jmp [bp]

L335: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L334
  mov cx, sp
  mov bp, g3
  mov dx, g89
  jmp [bp]

L336: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L335
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L337: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L336
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g88
  jmp [bp]

L338: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L337
  mov cx, sp
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L339: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L338
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L340: ; Arm: 89'11
  push word g86
  push word '0'
  push word 1
  mov [Temps+4], sp
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L341: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L342: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L301
  mov ax, [bp+10]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L339
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L340
  push word [bp+10]
  push word cx
  push word L341
  mov cx, sp
  mov bp, g85
  mov dx, g87
  jmp [bp]

L343: ; Arm: 153'34
  mov dx, g72
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L344: ; Arm: 13'9
  mov dx, g73
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L345: ; Arm: 209'29
  mov ax, [Temps+10]
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [Temps+18], ax
  push word [Temps+12]
  push word [Temps+10]
  push word [Temps+2]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L342
  mov cx, sp
  mov bx, [Temps+18]
  cmp word [bx], 1
  jz L343
  mov ax, [Temps+10]
  cmp word ax, 32
  call Bare_make_bool_from_n
  mov [Temps+20], ax
  mov bx, [Temps+20]
  cmp word [bx], 1
  jz L344
  mov dx, g74
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L346: ; Continuation
  call Bare_enter_check
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  mov ax, [bx]
  mov [Temps+6], ax
  mov bx, [Temps+6]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov ax, [bx+4]
  mov [Temps+10], ax
  mov ax, [bx+6]
  mov [Temps+12], ax
  mov ax, [bp+10]
  cmp word ax, [Temps+10]
  call Bare_make_bool_from_z
  mov [Temps+14], ax
  mov bx, [Temps+14]
  cmp word [bx], 1
  jz L194
  mov bx, [Temps+8]
  mov ax, [bx]
  mov [Temps+16], ax
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L273
  mov cx, sp
  mov bx, [Temps+16]
  cmp word [bx], 1
  jz L345
  mov dx, g99
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L347: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L346
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L348: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L347
  mov cx, sp
  mov bp, [bp+16]
  mov dx, dx
  jmp [bp]

L349: ; Continuation
  call Bare_enter_check
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L348
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+16]
  jmp [bp]

L350: ; Continuation
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
  push word L349
  mov cx, sp
  mov bp, g3
  mov dx, g67
  jmp [bp]

L351: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L350
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L352: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L351
  mov cx, sp
  mov dx, [bp+16]
  mov bp, [bp+6]
  jmp [bp]

L353: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L352
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g66
  jmp [bp]

L354: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L353
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L355: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L354
  mov cx, sp
  mov bp, [bp+16]
  mov dx, dx
  jmp [bp]

L356: ; Continuation
  call Bare_enter_check
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L355
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+16]
  jmp [bp]

L357: ; Continuation
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
  push word L356
  mov cx, sp
  mov bp, g3
  mov dx, g65
  jmp [bp]

L358: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L357
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L359: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L358
  mov cx, sp
  mov dx, [bp+16]
  mov bp, [bp+6]
  jmp [bp]

L360: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L359
  mov cx, sp
  mov dx, [bp+16]
  mov bp, [bp+6]
  jmp [bp]

L361: ; Continuation
  call Bare_enter_check
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
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L362: ; Continuation
  call Bare_enter_check
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
  mov bp, [bp+18]
  mov dx, dx
  jmp [bp]

L363: ; Continuation
  call Bare_enter_check
  push word [bp+20]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L362
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+18]
  jmp [bp]

L364: ; Continuation
  call Bare_enter_check
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
  push word L363
  mov cx, sp
  mov bp, g3
  mov dx, g64
  jmp [bp]

L365: ; Continuation
  call Bare_enter_check
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L364
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L366: ; Continuation
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
  push word L365
  mov cx, sp
  mov dx, [bp+18]
  mov bp, [bp+6]
  jmp [bp]

L367: ; Continuation
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
  push word L366
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g63
  jmp [bp]

L368: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L367
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L369: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L368
  mov cx, sp
  mov bp, [bp+18]
  mov dx, dx
  jmp [bp]

L370: ; Continuation
  call Bare_enter_check
  push word [bp+20]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L369
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+18]
  jmp [bp]

L371: ; Continuation
  call Bare_enter_check
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
  push word L370
  mov cx, sp
  mov bp, g3
  mov dx, g62
  jmp [bp]

L372: ; Continuation
  call Bare_enter_check
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L371
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L373: ; Continuation
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
  push word L372
  mov cx, sp
  mov dx, [bp+18]
  mov bp, [bp+6]
  jmp [bp]

L374: ; Continuation
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
  push word L373
  mov cx, sp
  mov dx, [bp+18]
  mov bp, [bp+6]
  jmp [bp]

L375: ; Continuation
  call Bare_enter_check
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L374
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L376: ; Continuation
  call Bare_enter_check
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L375
  mov cx, sp
  mov bp, [bp+20]
  mov dx, dx
  jmp [bp]

L377: ; Continuation
  call Bare_enter_check
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
  push word L376
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+20]
  jmp [bp]

L378: ; Continuation
  call Bare_enter_check
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
  push word L377
  mov cx, sp
  mov bp, g3
  mov dx, g61
  jmp [bp]

L379: ; Continuation
  call Bare_enter_check
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
  push word L378
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L380: ; Continuation
  call Bare_enter_check
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
  push word L379
  mov cx, sp
  mov dx, [bp+20]
  mov bp, [bp+6]
  jmp [bp]

L381: ; Continuation
  call Bare_enter_check
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
  push word L380
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g60
  jmp [bp]

L382: ; Continuation
  call Bare_enter_check
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L381
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L383: ; Continuation
  call Bare_enter_check
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L382
  mov cx, sp
  mov bp, dx
  mov dx, 64
  jmp [bp]

L384: ; Continuation
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
  push word L383
  mov cx, sp
  mov bp, g58
  mov dx, g59
  jmp [bp]

L385: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L384
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L386: ; Arm: 89'11
  push word g56
  push word '0'
  push word 1
  mov [Temps+4], sp
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L387: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L388: ; Continuation
  call Bare_enter_check
  mov ax, [bp+12]
  cmp word ax, 0
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
  push word L385
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L386
  push word [bp+12]
  push word cx
  push word L387
  mov cx, sp
  mov bp, g55
  mov dx, g57
  jmp [bp]

L389: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L388
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L390: ; Arm: 89'11
  push word g53
  push word '0'
  push word 1
  mov [Temps+4], sp
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L391: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L392: ; Continuation
  call Bare_enter_check
  mov ax, [bp+10]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L389
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L390
  push word [bp+10]
  push word cx
  push word L391
  mov cx, sp
  mov bp, g52
  mov dx, g54
  jmp [bp]

L393: ; Continuation
  call Bare_enter_check
  mov ax, [bp+10]
  mov bx, 8
  call Bare_mod
  mov [Temps+2], ax
  mov ax, 64
  mov bx, [Temps+2]
  call Bare_mul
  mov [Temps+4], ax
  push word [Temps+4]
  push word [bp+14]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L392
  mov cx, sp
  mov bx, [bp+12]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L394: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L393
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L395: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L394
  mov cx, sp
  mov bp, [bp+16]
  mov dx, dx
  jmp [bp]

L396: ; Continuation
  call Bare_enter_check
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L395
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+16]
  jmp [bp]

L397: ; Continuation
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
  push word L396
  mov cx, sp
  mov bp, g3
  mov dx, g51
  jmp [bp]

L398: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L397
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L399: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L398
  mov cx, sp
  mov dx, [bp+16]
  mov bp, [bp+6]
  jmp [bp]

L400: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L399
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g50
  jmp [bp]

L401: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L400
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
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

L403: ; Continuation
  call Bare_enter_check
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L402
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+16]
  jmp [bp]

L404: ; Continuation
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
  push word L403
  mov cx, sp
  mov bp, g3
  mov dx, g49
  jmp [bp]

L405: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L404
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L406: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L405
  mov cx, sp
  mov dx, [bp+16]
  mov bp, [bp+6]
  jmp [bp]

L407: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L406
  mov cx, sp
  mov dx, [bp+16]
  mov bp, [bp+6]
  jmp [bp]

L408: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L407
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L409: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L408
  mov cx, sp
  mov bp, [bp+18]
  mov dx, dx
  jmp [bp]

L410: ; Continuation
  call Bare_enter_check
  push word [bp+20]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L409
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+18]
  jmp [bp]

L411: ; Continuation
  call Bare_enter_check
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
  push word L410
  mov cx, sp
  mov bp, g3
  mov dx, g48
  jmp [bp]

L412: ; Continuation
  call Bare_enter_check
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L411
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L413: ; Continuation
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
  push word L412
  mov cx, sp
  mov dx, [bp+18]
  mov bp, [bp+6]
  jmp [bp]

L414: ; Continuation
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
  push word L413
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g47
  jmp [bp]

L415: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L414
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L416: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L415
  mov cx, sp
  mov bp, [bp+18]
  mov dx, dx
  jmp [bp]

L417: ; Continuation
  call Bare_enter_check
  push word [bp+20]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L416
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+18]
  jmp [bp]

L418: ; Continuation
  call Bare_enter_check
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
  push word L417
  mov cx, sp
  mov bp, g3
  mov dx, g46
  jmp [bp]

L419: ; Continuation
  call Bare_enter_check
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L418
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L420: ; Continuation
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
  push word L419
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g45
  jmp [bp]

L421: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L420
  mov cx, sp
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L422: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L421
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L423: ; Arm: 89'11
  push word g43
  push word '0'
  push word 1
  mov [Temps+4], sp
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L424: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L425: ; Continuation
  call Bare_enter_check
  mov ax, [bp+14]
  cmp word ax, 0
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
  push word L422
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L423
  push word [bp+14]
  push word cx
  push word L424
  mov cx, sp
  mov bp, g42
  mov dx, g44
  jmp [bp]

L426: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L425
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L427: ; Arm: 89'11
  push word g40
  push word '0'
  push word 1
  mov [Temps+6], sp
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L428: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L429: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word cx
  push word L159
  mov cx, sp
  mov bx, dx
  cmp word [bx], 1
  jz L187
  mov ax, [bp+10]
  mov bx, 8
  call Bare_div
  mov [Temps+2], ax
  mov ax, [bp+10]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  push word [Temps+2]
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L426
  mov cx, sp
  mov bx, [Temps+4]
  cmp word [bx], 1
  jz L427
  push word [bp+10]
  push word cx
  push word L428
  mov cx, sp
  mov bp, g39
  mov dx, g41
  jmp [bp]

L430: ; Arm: 228'33
  mov dx, g26
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L431: ; Arm: 13'9
  mov dx, g27
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L432: ; Continuation
  call Bare_enter_check
  mov ax, dx
  mov [Temps+2], ax
  push word [Temps+2]
  push word 0
  mov [Temps+4], sp
  mov ax, [bp+10]
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [Temps+6], ax
  push word [Temps+4]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L429
  mov cx, sp
  mov bx, [Temps+6]
  cmp word [bx], 1
  jz L430
  mov ax, [bp+10]
  cmp word ax, 256
  call Bare_make_bool_from_n
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 1
  jz L431
  mov dx, g28
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L433: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L432
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L434: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L433
  mov cx, sp
  mov bp, dx
  mov dx, 64
  jmp [bp]

L435: ; Function: t6
  mov ax, 124
  cmp word ax, dx
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L154
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
  push word [Temps+8]
  push word L158
  mov [Temps+10], sp
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L434
  mov cx, sp
  mov bp, [Temps+10]
  mov dx, g25
  jmp [bp]

L436: ; Arm: 263'16
  mov dx, g131
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L437: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  add ax, 1
  mov [Temps+2], ax
  mov bp, [bp+6]
  mov dx, [Temps+2]
  jmp [bp]

L438: ; Continuation
  call Bare_enter_check
  call Bare_crash
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L439: ; Continuation
  call Bare_enter_check
  push word cx
  push word L438
  mov cx, sp
  mov bp, g8
  mov dx, dx
  jmp [bp]

L440: ; Continuation
  call Bare_enter_check
  push word cx
  push word L439
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L441: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word cx
  push word L440
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L442: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L441
  mov cx, sp
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L443: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L442
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  jmp [bp]

L444: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L443
  mov cx, sp
  mov bp, g3
  mov dx, g145
  jmp [bp]

L445: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L444
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L446: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L445
  mov cx, sp
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L447: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L446
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g144
  jmp [bp]

L448: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L447
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L449: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L448
  mov cx, sp
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L450: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L449
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  jmp [bp]

L451: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L450
  mov cx, sp
  mov bp, g3
  mov dx, g143
  jmp [bp]

L452: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L451
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L453: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L452
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g142
  jmp [bp]

L454: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L453
  mov cx, sp
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L455: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L454
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L456: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L455
  mov cx, sp
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L457: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L456
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  jmp [bp]

L458: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L457
  mov cx, sp
  mov bp, g3
  mov dx, g141
  jmp [bp]

L459: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L458
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L460: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L459
  mov cx, sp
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L461: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L460
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g140
  jmp [bp]

L462: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L461
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L463: ; Arm: 89'11
  push word g138
  push word '0'
  push word 1
  mov [Temps+4], sp
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L464: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L465: ; Arm: 243'23
  mov ax, [bp+10]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L462
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L463
  push word [bp+10]
  push word cx
  push word L464
  mov cx, sp
  mov bp, g137
  mov dx, g139
  jmp [bp]

L466: ; Arm: 128'16
  mov dx, g178
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L467: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L466
  mov ax, [bp+6]
  mov bx, [bp+10]
  call Bare_get_bytes
  mov [Temps+2], ax
  mov ax, [bp+4]
  add ax, [bp+10]
  mov [Temps+4], ax
  mov ax, [bp+8]
  mov si, [Temps+4]
  mov bx, [Temps+2]
  call Bare_set_bytes
  mov [Temps+6], ax
  mov ax, [bp+10]
  add ax, 1
  mov [Temps+8], ax
  mov bp, [bp+12]
  mov dx, [Temps+8]
  jmp [bp]

L468: ; Arm: 13'9
  mov dx, g176
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L469: ; Function: t1
  mov ax, dx
  cmp word ax, 64
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L467
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L468
  mov dx, g177
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L470: ; Continuation
  call Bare_enter_check
  mov bx, [bp+4]
  mov ax, g179
  mov word [bx], ax
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L471: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word L469
  mov [Temps+2], sp
  push word [bp+8]
  push word cx
  push word L470
  mov cx, sp
  mov bp, [Temps+2]
  mov dx, 0
  jmp [bp]

L472: ; Arm: 205'23
  push word [Temps+8]
  push word [bp+14]
  push word [bp+12]
  push word cx
  push word L471
  mov cx, sp
  mov bx, [Temps+12]
  mov ax, [bx+2]
  mov [Temps+16], ax
  mov dx, [Temps+16]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L473: ; Arm: 128'16
  mov dx, g237
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L474: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L473
  mov ax, [bp+6]
  mov bx, [bp+10]
  call Bare_get_bytes
  mov [Temps+2], ax
  mov ax, [bp+4]
  add ax, [bp+10]
  mov [Temps+4], ax
  mov ax, [bp+8]
  mov si, [Temps+4]
  mov bx, [Temps+2]
  call Bare_set_bytes
  mov [Temps+6], ax
  mov ax, [bp+10]
  add ax, 1
  mov [Temps+8], ax
  mov bp, [bp+12]
  mov dx, [Temps+8]
  jmp [bp]

L475: ; Arm: 13'9
  mov dx, g235
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L476: ; Function: t1
  mov ax, dx
  cmp word ax, 64
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L474
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L475
  mov dx, g236
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L477: ; Continuation
  call Bare_enter_check
  push word g238
  mov ax, sp
  mov [Temps+2], ax
  push word [bp+8]
  push word [bp+4]
  push word [Temps+2]
  push word 0
  mov [Temps+4], sp
  mov bx, [bp+6]
  mov ax, [Temps+4]
  mov word [bx], ax
  mov [Temps+6], ax
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L478: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word L476
  mov [Temps+2], sp
  push word [bp+12]
  push word [bp+10]
  push word [bp+4]
  push word cx
  push word L477
  mov cx, sp
  mov bp, [Temps+2]
  mov dx, 0
  jmp [bp]

L479: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L478
  mov cx, sp
  mov bx, dx
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L480: ; Continuation
  call Bare_enter_check
  call Bare_crash
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L481: ; Continuation
  call Bare_enter_check
  push word cx
  push word L480
  mov cx, sp
  mov bp, g8
  mov dx, dx
  jmp [bp]

L482: ; Continuation
  call Bare_enter_check
  push word cx
  push word L481
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L483: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word cx
  push word L482
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L484: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L483
  mov cx, sp
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L485: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L484
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  jmp [bp]

L486: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L485
  mov cx, sp
  mov bp, g3
  mov dx, g219
  jmp [bp]

L487: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L486
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L488: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L487
  mov cx, sp
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L489: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L488
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g218
  jmp [bp]

L490: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L489
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L491: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L490
  mov cx, sp
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L492: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L491
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  jmp [bp]

L493: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L492
  mov cx, sp
  mov bp, g3
  mov dx, g217
  jmp [bp]

L494: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L493
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L495: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L494
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g216
  jmp [bp]

L496: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L495
  mov cx, sp
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L497: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L496
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L498: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L497
  mov cx, sp
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L499: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L498
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  jmp [bp]

L500: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L499
  mov cx, sp
  mov bp, g3
  mov dx, g215
  jmp [bp]

L501: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L500
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L502: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L501
  mov cx, sp
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L503: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L502
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g214
  jmp [bp]

L504: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L503
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L505: ; Arm: 89'11
  push word g212
  push word '0'
  push word 1
  mov [Temps+4], sp
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L506: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L507: ; Arm: 157'27
  mov ax, [bp+8]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L504
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L505
  push word [bp+8]
  push word cx
  push word L506
  mov cx, sp
  mov bp, g211
  mov dx, g213
  jmp [bp]

L508: ; Arm: 117'16
  mov dx, g234
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L509: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L508
  mov ax, [bp+6]
  add ax, [bp+10]
  mov [Temps+2], ax
  mov ax, [bp+4]
  mov bx, [Temps+2]
  call Bare_get_bytes
  mov [Temps+4], ax
  mov ax, [bp+8]
  mov si, [bp+10]
  mov bx, [Temps+4]
  call Bare_set_bytes
  mov [Temps+6], ax
  mov ax, [bp+10]
  add ax, 1
  mov [Temps+8], ax
  mov bp, [bp+12]
  mov dx, [Temps+8]
  jmp [bp]

L510: ; Arm: 13'9
  mov dx, g232
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L511: ; Function: t3
  mov ax, dx
  cmp word ax, 512
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L509
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L510
  mov dx, g233
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L512: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word 0
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L513: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 512
  call Bare_mul
  mov [Temps+2], ax
  mov ax, 512
  call Bare_make_bytes
  mov [Temps+4], ax
  push word [Temps+4]
  push word [Temps+2]
  push word dx
  push word L511
  mov [Temps+6], sp
  push word [Temps+4]
  push word cx
  push word L512
  mov cx, sp
  mov bp, [Temps+6]
  mov dx, 0
  jmp [bp]

L514: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L513
  mov cx, sp
  mov bx, [bp+6]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L515: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L514
  mov cx, sp
  mov bp, g8
  mov dx, dx
  jmp [bp]

L516: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L515
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L517: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L516
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L518: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L517
  mov cx, sp
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L519: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L518
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  jmp [bp]

L520: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L519
  mov cx, sp
  mov bp, g3
  mov dx, g231
  jmp [bp]

L521: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L520
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L522: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L521
  mov cx, sp
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L523: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L522
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g230
  jmp [bp]

L524: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L523
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L525: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L524
  mov cx, sp
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L526: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L525
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  jmp [bp]

L527: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L526
  mov cx, sp
  mov bp, g3
  mov dx, g229
  jmp [bp]

L528: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L527
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L529: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L528
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g228
  jmp [bp]

L530: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L529
  mov cx, sp
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L531: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L530
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L532: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L531
  mov cx, sp
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L533: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L532
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  jmp [bp]

L534: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L533
  mov cx, sp
  mov bp, g3
  mov dx, g227
  jmp [bp]

L535: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L534
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L536: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L535
  mov cx, sp
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L537: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L536
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g226
  jmp [bp]

L538: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L537
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L539: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L538
  mov cx, sp
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L540: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L539
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  jmp [bp]

L541: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L540
  mov cx, sp
  mov bp, g3
  mov dx, g225
  jmp [bp]

L542: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L541
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L543: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L542
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g224
  jmp [bp]

L544: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L543
  mov cx, sp
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L545: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L544
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L546: ; Arm: 89'11
  push word g222
  push word '0'
  push word 1
  mov [Temps+4], sp
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L547: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L548: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word cx
  push word L479
  mov cx, sp
  mov bx, dx
  cmp word [bx], 1
  jz L507
  mov ax, [bp+8]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  push word [bp+14]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L545
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L546
  push word [bp+8]
  push word cx
  push word L547
  mov cx, sp
  mov bp, g221
  mov dx, g223
  jmp [bp]

L549: ; Arm: 153'34
  mov dx, g208
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L550: ; Arm: 13'9
  mov dx, g209
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L551: ; Continuation
  call Bare_enter_check
  mov ax, [bp+8]
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L548
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L549
  mov ax, [bp+8]
  cmp word ax, 32
  call Bare_make_bool_from_n
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 1
  jz L550
  mov dx, g210
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L552: ; Continuation
  call Bare_enter_check
  call Bare_crash
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L553: ; Continuation
  call Bare_enter_check
  push word cx
  push word L552
  mov cx, sp
  mov bp, g8
  mov dx, dx
  jmp [bp]

L554: ; Continuation
  call Bare_enter_check
  push word cx
  push word L553
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L555: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word cx
  push word L554
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L556: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L555
  mov cx, sp
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L557: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L556
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  jmp [bp]

L558: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L557
  mov cx, sp
  mov bp, g3
  mov dx, g191
  jmp [bp]

L559: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L558
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L560: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L559
  mov cx, sp
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L561: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L560
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g190
  jmp [bp]

L562: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L561
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L563: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L562
  mov cx, sp
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L564: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L563
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  jmp [bp]

L565: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L564
  mov cx, sp
  mov bp, g3
  mov dx, g189
  jmp [bp]

L566: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L565
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L567: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L566
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g188
  jmp [bp]

L568: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L567
  mov cx, sp
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L569: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L568
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L570: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L569
  mov cx, sp
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L571: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L570
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  jmp [bp]

L572: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L571
  mov cx, sp
  mov bp, g3
  mov dx, g187
  jmp [bp]

L573: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L572
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L574: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L573
  mov cx, sp
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L575: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L574
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g186
  jmp [bp]

L576: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L575
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L577: ; Arm: 89'11
  push word g184
  push word '0'
  push word 1
  mov [Temps+4], sp
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L578: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L579: ; Arm: 163'27
  mov ax, [bp+10]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L576
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L577
  push word [bp+10]
  push word cx
  push word L578
  mov cx, sp
  mov bp, g183
  mov dx, g185
  jmp [bp]

L580: ; Arm: 128'16
  mov dx, g206
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L581: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L580
  mov ax, [bp+8]
  mov bx, [bp+10]
  call Bare_get_bytes
  mov [Temps+2], ax
  mov ax, [bp+6]
  add ax, [bp+10]
  mov [Temps+4], ax
  mov ax, [bp+4]
  mov si, [Temps+4]
  mov bx, [Temps+2]
  call Bare_set_bytes
  mov [Temps+6], ax
  mov ax, [bp+10]
  add ax, 1
  mov [Temps+8], ax
  mov bp, [bp+12]
  mov dx, [Temps+8]
  jmp [bp]

L582: ; Arm: 13'9
  mov dx, g204
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L583: ; Function: t1
  mov ax, dx
  cmp word ax, 512
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L581
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L582
  mov dx, g205
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L584: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word L583
  mov [Temps+2], sp
  mov bp, [Temps+2]
  mov dx, 0
  jmp [bp]

L585: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 512
  call Bare_mul
  mov [Temps+2], ax
  push word [Temps+2]
  push word dx
  push word cx
  push word L584
  mov cx, sp
  mov bx, [bp+6]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L586: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L585
  mov cx, sp
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L587: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L586
  mov cx, sp
  mov bp, g8
  mov dx, dx
  jmp [bp]

L588: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L587
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L589: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L588
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L590: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L589
  mov cx, sp
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L591: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L590
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  jmp [bp]

L592: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L591
  mov cx, sp
  mov bp, g3
  mov dx, g203
  jmp [bp]

L593: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L592
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L594: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L593
  mov cx, sp
  mov dx, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L595: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L594
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g202
  jmp [bp]

L596: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L595
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L597: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L596
  mov cx, sp
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L598: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L597
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  jmp [bp]

L599: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L598
  mov cx, sp
  mov bp, g3
  mov dx, g201
  jmp [bp]

L600: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L599
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L601: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L600
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g200
  jmp [bp]

L602: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L601
  mov cx, sp
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L603: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L602
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L604: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L603
  mov cx, sp
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L605: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L604
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  jmp [bp]

L606: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L605
  mov cx, sp
  mov bp, g3
  mov dx, g199
  jmp [bp]

L607: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L606
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L608: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L607
  mov cx, sp
  mov dx, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L609: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L608
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g198
  jmp [bp]

L610: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L609
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L611: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L610
  mov cx, sp
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L612: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L611
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  jmp [bp]

L613: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L612
  mov cx, sp
  mov bp, g3
  mov dx, g197
  jmp [bp]

L614: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L613
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L615: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L614
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g196
  jmp [bp]

L616: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L615
  mov cx, sp
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L617: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L616
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L618: ; Arm: 89'11
  push word g194
  push word '0'
  push word 1
  mov [Temps+4], sp
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L619: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L620: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L579
  mov ax, [bp+10]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L617
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L618
  push word [bp+10]
  push word cx
  push word L619
  mov cx, sp
  mov bp, g193
  mov dx, g195
  jmp [bp]

L621: ; Arm: 153'34
  mov dx, g180
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L622: ; Arm: 13'9
  mov dx, g181
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L623: ; Arm: 209'29
  mov ax, [Temps+10]
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [Temps+18], ax
  push word [Temps+12]
  push word [Temps+10]
  push word [Temps+2]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L620
  mov cx, sp
  mov bx, [Temps+18]
  cmp word [bx], 1
  jz L621
  mov ax, [Temps+10]
  cmp word ax, 32
  call Bare_make_bool_from_n
  mov [Temps+20], ax
  mov bx, [Temps+20]
  cmp word [bx], 1
  jz L622
  mov dx, g182
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L624: ; Continuation
  call Bare_enter_check
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  mov ax, [bx]
  mov [Temps+6], ax
  mov bx, [Temps+6]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov ax, [bx+4]
  mov [Temps+10], ax
  mov ax, [bx+6]
  mov [Temps+12], ax
  mov ax, [bp+10]
  cmp word ax, [Temps+10]
  call Bare_make_bool_from_z
  mov [Temps+14], ax
  mov bx, [Temps+14]
  cmp word [bx], 1
  jz L472
  mov bx, [Temps+8]
  mov ax, [bx]
  mov [Temps+16], ax
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L551
  mov cx, sp
  mov bx, [Temps+16]
  cmp word [bx], 1
  jz L623
  mov dx, g207
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L625: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L624
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L626: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L625
  mov cx, sp
  mov bp, [bp+16]
  mov dx, dx
  jmp [bp]

L627: ; Continuation
  call Bare_enter_check
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L626
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+16]
  jmp [bp]

L628: ; Continuation
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
  push word L627
  mov cx, sp
  mov bp, g3
  mov dx, g175
  jmp [bp]

L629: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L628
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L630: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L629
  mov cx, sp
  mov dx, [bp+16]
  mov bp, [bp+6]
  jmp [bp]

L631: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L630
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g174
  jmp [bp]

L632: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L631
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L633: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L632
  mov cx, sp
  mov bp, [bp+16]
  mov dx, dx
  jmp [bp]

L634: ; Continuation
  call Bare_enter_check
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L633
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+16]
  jmp [bp]

L635: ; Continuation
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
  push word L634
  mov cx, sp
  mov bp, g3
  mov dx, g173
  jmp [bp]

L636: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L635
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L637: ; Continuation
  call Bare_enter_check
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
  mov dx, [bp+16]
  mov bp, [bp+6]
  jmp [bp]

L638: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L637
  mov cx, sp
  mov dx, [bp+16]
  mov bp, [bp+6]
  jmp [bp]

L639: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L638
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L640: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L639
  mov cx, sp
  mov bp, [bp+18]
  mov dx, dx
  jmp [bp]

L641: ; Continuation
  call Bare_enter_check
  push word [bp+20]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L640
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+18]
  jmp [bp]

L642: ; Continuation
  call Bare_enter_check
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
  push word L641
  mov cx, sp
  mov bp, g3
  mov dx, g172
  jmp [bp]

L643: ; Continuation
  call Bare_enter_check
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L642
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L644: ; Continuation
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
  push word L643
  mov cx, sp
  mov dx, [bp+18]
  mov bp, [bp+6]
  jmp [bp]

L645: ; Continuation
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
  push word L644
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g171
  jmp [bp]

L646: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L645
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L647: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L646
  mov cx, sp
  mov bp, [bp+18]
  mov dx, dx
  jmp [bp]

L648: ; Continuation
  call Bare_enter_check
  push word [bp+20]
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
  mov di, bp
  mov bp, dx
  mov dx, [di+18]
  jmp [bp]

L649: ; Continuation
  call Bare_enter_check
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
  push word L648
  mov cx, sp
  mov bp, g3
  mov dx, g170
  jmp [bp]

L650: ; Continuation
  call Bare_enter_check
  push word [bp+18]
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
  mov bp, g3
  mov dx, dx
  jmp [bp]

L651: ; Continuation
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
  push word L650
  mov cx, sp
  mov dx, [bp+18]
  mov bp, [bp+6]
  jmp [bp]

L652: ; Continuation
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
  push word L651
  mov cx, sp
  mov dx, [bp+18]
  mov bp, [bp+6]
  jmp [bp]

L653: ; Continuation
  call Bare_enter_check
  push word [bp+18]
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
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L654: ; Continuation
  call Bare_enter_check
  push word [bp+18]
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
  mov bp, [bp+20]
  mov dx, dx
  jmp [bp]

L655: ; Continuation
  call Bare_enter_check
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
  push word L654
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+20]
  jmp [bp]

L656: ; Continuation
  call Bare_enter_check
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
  push word L655
  mov cx, sp
  mov bp, g3
  mov dx, g169
  jmp [bp]

L657: ; Continuation
  call Bare_enter_check
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
  push word L656
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L658: ; Continuation
  call Bare_enter_check
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
  mov dx, [bp+20]
  mov bp, [bp+6]
  jmp [bp]

L659: ; Continuation
  call Bare_enter_check
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
  push word L658
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g168
  jmp [bp]

L660: ; Continuation
  call Bare_enter_check
  push word [bp+18]
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
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L661: ; Continuation
  call Bare_enter_check
  push word [bp+18]
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
  mov bp, dx
  mov dx, 64
  jmp [bp]

L662: ; Continuation
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
  push word L661
  mov cx, sp
  mov bp, g166
  mov dx, g167
  jmp [bp]

L663: ; Continuation
  call Bare_enter_check
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
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L664: ; Arm: 89'11
  push word g164
  push word '0'
  push word 1
  mov [Temps+4], sp
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L665: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L666: ; Continuation
  call Bare_enter_check
  mov ax, [bp+12]
  cmp word ax, 0
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
  push word L663
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L664
  push word [bp+12]
  push word cx
  push word L665
  mov cx, sp
  mov bp, g163
  mov dx, g165
  jmp [bp]

L667: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L666
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L668: ; Arm: 89'11
  push word g161
  push word '0'
  push word 1
  mov [Temps+4], sp
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L669: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L670: ; Continuation
  call Bare_enter_check
  mov ax, [bp+10]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L667
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L668
  push word [bp+10]
  push word cx
  push word L669
  mov cx, sp
  mov bp, g160
  mov dx, g162
  jmp [bp]

L671: ; Continuation
  call Bare_enter_check
  mov ax, [bp+10]
  mov bx, 8
  call Bare_mod
  mov [Temps+2], ax
  mov ax, 64
  mov bx, [Temps+2]
  call Bare_mul
  mov [Temps+4], ax
  push word [Temps+4]
  push word [bp+14]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L670
  mov cx, sp
  mov bx, [bp+12]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L672: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L671
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L673: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L672
  mov cx, sp
  mov bp, [bp+16]
  mov dx, dx
  jmp [bp]

L674: ; Continuation
  call Bare_enter_check
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L673
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+16]
  jmp [bp]

L675: ; Continuation
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
  push word L674
  mov cx, sp
  mov bp, g3
  mov dx, g159
  jmp [bp]

L676: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L675
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L677: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L676
  mov cx, sp
  mov dx, [bp+16]
  mov bp, [bp+6]
  jmp [bp]

L678: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L677
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g158
  jmp [bp]

L679: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L678
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L680: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L679
  mov cx, sp
  mov bp, [bp+16]
  mov dx, dx
  jmp [bp]

L681: ; Continuation
  call Bare_enter_check
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L680
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+16]
  jmp [bp]

L682: ; Continuation
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
  push word L681
  mov cx, sp
  mov bp, g3
  mov dx, g157
  jmp [bp]

L683: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L682
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L684: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L683
  mov cx, sp
  mov dx, [bp+16]
  mov bp, [bp+6]
  jmp [bp]

L685: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L684
  mov cx, sp
  mov dx, [bp+16]
  mov bp, [bp+6]
  jmp [bp]

L686: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L685
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L687: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L686
  mov cx, sp
  mov bp, [bp+18]
  mov dx, dx
  jmp [bp]

L688: ; Continuation
  call Bare_enter_check
  push word [bp+20]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L687
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+18]
  jmp [bp]

L689: ; Continuation
  call Bare_enter_check
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
  push word L688
  mov cx, sp
  mov bp, g3
  mov dx, g156
  jmp [bp]

L690: ; Continuation
  call Bare_enter_check
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L689
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L691: ; Continuation
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
  push word L690
  mov cx, sp
  mov dx, [bp+18]
  mov bp, [bp+6]
  jmp [bp]

L692: ; Continuation
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
  push word L691
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g155
  jmp [bp]

L693: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L692
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L694: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L693
  mov cx, sp
  mov bp, [bp+18]
  mov dx, dx
  jmp [bp]

L695: ; Continuation
  call Bare_enter_check
  push word [bp+20]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L694
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+18]
  jmp [bp]

L696: ; Continuation
  call Bare_enter_check
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
  push word L695
  mov cx, sp
  mov bp, g3
  mov dx, g154
  jmp [bp]

L697: ; Continuation
  call Bare_enter_check
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L696
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L698: ; Continuation
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
  push word L697
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g153
  jmp [bp]

L699: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L698
  mov cx, sp
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L700: ; Continuation
  call Bare_enter_check
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
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L701: ; Arm: 89'11
  push word g151
  push word '0'
  push word 1
  mov [Temps+4], sp
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L702: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L703: ; Continuation
  call Bare_enter_check
  mov ax, [bp+14]
  cmp word ax, 0
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
  push word L700
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L701
  push word [bp+14]
  push word cx
  push word L702
  mov cx, sp
  mov bp, g150
  mov dx, g152
  jmp [bp]

L704: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L703
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L705: ; Arm: 89'11
  push word g148
  push word '0'
  push word 1
  mov [Temps+6], sp
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L706: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L707: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word cx
  push word L437
  mov cx, sp
  mov bx, dx
  cmp word [bx], 1
  jz L465
  mov ax, [bp+10]
  mov bx, 8
  call Bare_div
  mov [Temps+2], ax
  mov ax, [bp+10]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  push word [Temps+2]
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L704
  mov cx, sp
  mov bx, [Temps+4]
  cmp word [bx], 1
  jz L705
  push word [bp+10]
  push word cx
  push word L706
  mov cx, sp
  mov bp, g147
  mov dx, g149
  jmp [bp]

L708: ; Arm: 228'33
  mov dx, g134
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L709: ; Arm: 13'9
  mov dx, g135
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L710: ; Continuation
  call Bare_enter_check
  mov ax, dx
  mov [Temps+2], ax
  push word [Temps+2]
  push word 0
  mov [Temps+4], sp
  mov ax, [bp+10]
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [Temps+6], ax
  push word [Temps+4]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L707
  mov cx, sp
  mov bx, [Temps+6]
  cmp word [bx], 1
  jz L708
  mov ax, [bp+10]
  cmp word ax, 256
  call Bare_make_bool_from_n
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 1
  jz L709
  mov dx, g136
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L711: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L710
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L712: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L711
  mov cx, sp
  mov bp, dx
  mov dx, 64
  jmp [bp]

L713: ; Function: t1
  mov ax, 119
  cmp word ax, dx
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L436
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L712
  mov cx, sp
  mov bp, g132
  mov dx, g133
  jmp [bp]

L714: ; Arm: 272'16
  mov dx, g239
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L715: ; Continuation
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

L716: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L715
  mov cx, sp
  mov bp, g8
  mov dx, dx
  jmp [bp]

L717: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L716
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L718: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L717
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L719: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L718
  mov cx, sp
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L720: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L719
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  jmp [bp]

L721: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L720
  mov cx, sp
  mov bp, g3
  mov dx, g335
  jmp [bp]

L722: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L721
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L723: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L722
  mov cx, sp
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L724: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L723
  mov cx, sp
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L725: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L724
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L726: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L725
  mov cx, sp
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L727: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L726
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  jmp [bp]

L728: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L727
  mov cx, sp
  mov bp, g3
  mov dx, g334
  jmp [bp]

L729: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L728
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L730: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L729
  mov cx, sp
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L731: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L730
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g333
  jmp [bp]

L732: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L731
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L733: ; Arm: 89'11
  push word g331
  push word '0'
  push word 1
  mov [Temps+6], sp
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L734: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L735: ; Continuation
  call Bare_enter_check
  mov ax, dx
  mov [Temps+2], ax
  mov ax, [bp+8]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  push word [Temps+2]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L732
  mov cx, sp
  mov bx, [Temps+4]
  cmp word [bx], 1
  jz L733
  push word [bp+8]
  push word cx
  push word L734
  mov cx, sp
  mov bp, g330
  mov dx, g332
  jmp [bp]

L736: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L735
  mov cx, sp
  mov bx, dx
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L737: ; Continuation
  call Bare_enter_check
  call Bare_crash
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L738: ; Continuation
  call Bare_enter_check
  push word cx
  push word L737
  mov cx, sp
  mov bp, g8
  mov dx, dx
  jmp [bp]

L739: ; Continuation
  call Bare_enter_check
  push word cx
  push word L738
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L740: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word cx
  push word L739
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L741: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L740
  mov cx, sp
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L742: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L741
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  jmp [bp]

L743: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L742
  mov cx, sp
  mov bp, g3
  mov dx, g251
  jmp [bp]

L744: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L743
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L745: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L744
  mov cx, sp
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L746: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L745
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g250
  jmp [bp]

L747: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L746
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L748: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L747
  mov cx, sp
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L749: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L748
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  jmp [bp]

L750: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L749
  mov cx, sp
  mov bp, g3
  mov dx, g249
  jmp [bp]

L751: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L750
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L752: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L751
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g248
  jmp [bp]

L753: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L752
  mov cx, sp
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L754: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L753
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L755: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L754
  mov cx, sp
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L756: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L755
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  jmp [bp]

L757: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L756
  mov cx, sp
  mov bp, g3
  mov dx, g247
  jmp [bp]

L758: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L757
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L759: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L758
  mov cx, sp
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L760: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L759
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g246
  jmp [bp]

L761: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L760
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L762: ; Arm: 89'11
  push word g244
  push word '0'
  push word 1
  mov [Temps+4], sp
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L763: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L764: ; Arm: 234'23
  mov ax, [bp+10]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L761
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L762
  push word [bp+10]
  push word cx
  push word L763
  mov cx, sp
  mov bp, g243
  mov dx, g245
  jmp [bp]

L765: ; Arm: 117'16
  mov dx, g329
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L766: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L765
  mov ax, [bp+4]
  add ax, [bp+10]
  mov [Temps+2], ax
  mov ax, [bp+6]
  mov bx, [Temps+2]
  call Bare_get_bytes
  mov [Temps+4], ax
  mov ax, [bp+8]
  mov si, [bp+10]
  mov bx, [Temps+4]
  call Bare_set_bytes
  mov [Temps+6], ax
  mov ax, [bp+10]
  add ax, 1
  mov [Temps+8], ax
  mov bp, [bp+12]
  mov dx, [Temps+8]
  jmp [bp]

L767: ; Arm: 13'9
  mov dx, g327
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L768: ; Function: t2
  mov ax, dx
  cmp word ax, 64
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L766
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L767
  mov dx, g328
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L769: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word 0
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L770: ; Continuation
  call Bare_enter_check
  mov ax, 64
  call Bare_make_bytes
  mov [Temps+2], ax
  push word [Temps+2]
  push word dx
  push word [bp+4]
  push word L768
  mov [Temps+4], sp
  push word [Temps+2]
  push word cx
  push word L769
  mov cx, sp
  mov bp, [Temps+4]
  mov dx, 0
  jmp [bp]

L771: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 8
  call Bare_mod
  mov [Temps+2], ax
  mov ax, 64
  mov bx, [Temps+2]
  call Bare_mul
  mov [Temps+4], ax
  push word [Temps+4]
  push word cx
  push word L770
  mov cx, sp
  mov bx, dx
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L772: ; Arm: 189'23
  mov dx, [Temps+12]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L773: ; Continuation
  call Bare_enter_check
  push word g326
  mov ax, sp
  mov [Temps+2], ax
  push word dx
  push word [bp+4]
  push word [Temps+2]
  push word 0
  mov [Temps+4], sp
  mov bx, [bp+6]
  mov ax, [Temps+4]
  mov word [bx], ax
  mov [Temps+6], ax
  mov dx, dx
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L774: ; Continuation
  call Bare_enter_check
  call Bare_crash
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L775: ; Continuation
  call Bare_enter_check
  push word cx
  push word L774
  mov cx, sp
  mov bp, g8
  mov dx, dx
  jmp [bp]

L776: ; Continuation
  call Bare_enter_check
  push word cx
  push word L775
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L777: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word cx
  push word L776
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L778: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L777
  mov cx, sp
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L779: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L778
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  jmp [bp]

L780: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L779
  mov cx, sp
  mov bp, g3
  mov dx, g310
  jmp [bp]

L781: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L780
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L782: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L781
  mov cx, sp
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L783: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L782
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g309
  jmp [bp]

L784: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L783
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L785: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L784
  mov cx, sp
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L786: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L785
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  jmp [bp]

L787: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L786
  mov cx, sp
  mov bp, g3
  mov dx, g308
  jmp [bp]

L788: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L787
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L789: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L788
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g307
  jmp [bp]

L790: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L789
  mov cx, sp
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L791: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L790
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L792: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L791
  mov cx, sp
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L793: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L792
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  jmp [bp]

L794: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L793
  mov cx, sp
  mov bp, g3
  mov dx, g306
  jmp [bp]

L795: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L794
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L796: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L795
  mov cx, sp
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L797: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L796
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g305
  jmp [bp]

L798: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L797
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L799: ; Arm: 89'11
  push word g303
  push word '0'
  push word 1
  mov [Temps+4], sp
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L800: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L801: ; Arm: 157'27
  mov ax, [bp+8]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L798
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L799
  push word [bp+8]
  push word cx
  push word L800
  mov cx, sp
  mov bp, g302
  mov dx, g304
  jmp [bp]

L802: ; Arm: 117'16
  mov dx, g325
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L803: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L802
  mov ax, [bp+6]
  add ax, [bp+10]
  mov [Temps+2], ax
  mov ax, [bp+4]
  mov bx, [Temps+2]
  call Bare_get_bytes
  mov [Temps+4], ax
  mov ax, [bp+8]
  mov si, [bp+10]
  mov bx, [Temps+4]
  call Bare_set_bytes
  mov [Temps+6], ax
  mov ax, [bp+10]
  add ax, 1
  mov [Temps+8], ax
  mov bp, [bp+12]
  mov dx, [Temps+8]
  jmp [bp]

L804: ; Arm: 13'9
  mov dx, g323
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L805: ; Function: t3
  mov ax, dx
  cmp word ax, 512
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L803
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L804
  mov dx, g324
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L806: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word 0
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L807: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 512
  call Bare_mul
  mov [Temps+2], ax
  mov ax, 512
  call Bare_make_bytes
  mov [Temps+4], ax
  push word [Temps+4]
  push word [Temps+2]
  push word dx
  push word L805
  mov [Temps+6], sp
  push word [Temps+4]
  push word cx
  push word L806
  mov cx, sp
  mov bp, [Temps+6]
  mov dx, 0
  jmp [bp]

L808: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L807
  mov cx, sp
  mov bx, [bp+6]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L809: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L808
  mov cx, sp
  mov bp, g8
  mov dx, dx
  jmp [bp]

L810: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L809
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L811: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L810
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L812: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L811
  mov cx, sp
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L813: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L812
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  jmp [bp]

L814: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L813
  mov cx, sp
  mov bp, g3
  mov dx, g322
  jmp [bp]

L815: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L814
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L816: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L815
  mov cx, sp
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L817: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L816
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g321
  jmp [bp]

L818: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L817
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L819: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L818
  mov cx, sp
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L820: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L819
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  jmp [bp]

L821: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L820
  mov cx, sp
  mov bp, g3
  mov dx, g320
  jmp [bp]

L822: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L821
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L823: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L822
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g319
  jmp [bp]

L824: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L823
  mov cx, sp
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L825: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L824
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L826: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L825
  mov cx, sp
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L827: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L826
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  jmp [bp]

L828: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L827
  mov cx, sp
  mov bp, g3
  mov dx, g318
  jmp [bp]

L829: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L828
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L830: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L829
  mov cx, sp
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L831: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L830
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g317
  jmp [bp]

L832: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L831
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L833: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L832
  mov cx, sp
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L834: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L833
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  jmp [bp]

L835: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L834
  mov cx, sp
  mov bp, g3
  mov dx, g316
  jmp [bp]

L836: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L835
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L837: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L836
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g315
  jmp [bp]

L838: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L837
  mov cx, sp
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L839: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L838
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L840: ; Arm: 89'11
  push word g313
  push word '0'
  push word 1
  mov [Temps+4], sp
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L841: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L842: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+8]
  push word cx
  push word L773
  mov cx, sp
  mov bx, dx
  cmp word [bx], 1
  jz L801
  mov ax, [bp+8]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L839
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L840
  push word [bp+8]
  push word cx
  push word L841
  mov cx, sp
  mov bp, g312
  mov dx, g314
  jmp [bp]

L843: ; Arm: 153'34
  mov dx, g299
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L844: ; Arm: 13'9
  mov dx, g300
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L845: ; Continuation
  call Bare_enter_check
  mov ax, [bp+8]
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L842
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L843
  mov ax, [bp+8]
  cmp word ax, 32
  call Bare_make_bool_from_n
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 1
  jz L844
  mov dx, g301
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L846: ; Continuation
  call Bare_enter_check
  call Bare_crash
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L847: ; Continuation
  call Bare_enter_check
  push word cx
  push word L846
  mov cx, sp
  mov bp, g8
  mov dx, dx
  jmp [bp]

L848: ; Continuation
  call Bare_enter_check
  push word cx
  push word L847
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L849: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word cx
  push word L848
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L850: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L849
  mov cx, sp
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L851: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L850
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  jmp [bp]

L852: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L851
  mov cx, sp
  mov bp, g3
  mov dx, g282
  jmp [bp]

L853: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L852
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L854: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L853
  mov cx, sp
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L855: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L854
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g281
  jmp [bp]

L856: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L855
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L857: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L856
  mov cx, sp
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L858: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L857
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  jmp [bp]

L859: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L858
  mov cx, sp
  mov bp, g3
  mov dx, g280
  jmp [bp]

L860: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L859
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L861: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L860
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g279
  jmp [bp]

L862: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L861
  mov cx, sp
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L863: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L862
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L864: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L863
  mov cx, sp
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L865: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L864
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  jmp [bp]

L866: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L865
  mov cx, sp
  mov bp, g3
  mov dx, g278
  jmp [bp]

L867: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L866
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L868: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L867
  mov cx, sp
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L869: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L868
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g277
  jmp [bp]

L870: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L869
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L871: ; Arm: 89'11
  push word g275
  push word '0'
  push word 1
  mov [Temps+4], sp
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L872: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L873: ; Arm: 163'27
  mov ax, [bp+10]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L870
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L871
  push word [bp+10]
  push word cx
  push word L872
  mov cx, sp
  mov bp, g274
  mov dx, g276
  jmp [bp]

L874: ; Arm: 128'16
  mov dx, g297
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L875: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L874
  mov ax, [bp+8]
  mov bx, [bp+10]
  call Bare_get_bytes
  mov [Temps+2], ax
  mov ax, [bp+6]
  add ax, [bp+10]
  mov [Temps+4], ax
  mov ax, [bp+4]
  mov si, [Temps+4]
  mov bx, [Temps+2]
  call Bare_set_bytes
  mov [Temps+6], ax
  mov ax, [bp+10]
  add ax, 1
  mov [Temps+8], ax
  mov bp, [bp+12]
  mov dx, [Temps+8]
  jmp [bp]

L876: ; Arm: 13'9
  mov dx, g295
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L877: ; Function: t1
  mov ax, dx
  cmp word ax, 512
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L875
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L876
  mov dx, g296
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L878: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word L877
  mov [Temps+2], sp
  mov bp, [Temps+2]
  mov dx, 0
  jmp [bp]

L879: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 512
  call Bare_mul
  mov [Temps+2], ax
  push word [Temps+2]
  push word dx
  push word cx
  push word L878
  mov cx, sp
  mov bx, [bp+6]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L880: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L879
  mov cx, sp
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L881: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L880
  mov cx, sp
  mov bp, g8
  mov dx, dx
  jmp [bp]

L882: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L881
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L883: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L882
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L884: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L883
  mov cx, sp
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L885: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L884
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  jmp [bp]

L886: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L885
  mov cx, sp
  mov bp, g3
  mov dx, g294
  jmp [bp]

L887: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L886
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L888: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L887
  mov cx, sp
  mov dx, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L889: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L888
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g293
  jmp [bp]

L890: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L889
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L891: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L890
  mov cx, sp
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L892: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L891
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  jmp [bp]

L893: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L892
  mov cx, sp
  mov bp, g3
  mov dx, g292
  jmp [bp]

L894: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L893
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L895: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L894
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g291
  jmp [bp]

L896: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L895
  mov cx, sp
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L897: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L896
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L898: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L897
  mov cx, sp
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L899: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L898
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  jmp [bp]

L900: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L899
  mov cx, sp
  mov bp, g3
  mov dx, g290
  jmp [bp]

L901: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L900
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L902: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L901
  mov cx, sp
  mov dx, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L903: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L902
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g289
  jmp [bp]

L904: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L903
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L905: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L904
  mov cx, sp
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L906: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L905
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  jmp [bp]

L907: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L906
  mov cx, sp
  mov bp, g3
  mov dx, g288
  jmp [bp]

L908: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L907
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L909: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L908
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g287
  jmp [bp]

L910: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L909
  mov cx, sp
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L911: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L910
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L912: ; Arm: 89'11
  push word g285
  push word '0'
  push word 1
  mov [Temps+4], sp
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L913: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L914: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L873
  mov ax, [bp+10]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L911
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L912
  push word [bp+10]
  push word cx
  push word L913
  mov cx, sp
  mov bp, g284
  mov dx, g286
  jmp [bp]

L915: ; Arm: 153'34
  mov dx, g271
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L916: ; Arm: 13'9
  mov dx, g272
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L917: ; Arm: 191'29
  mov ax, [Temps+10]
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [Temps+18], ax
  push word [Temps+12]
  push word [Temps+10]
  push word [Temps+2]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L914
  mov cx, sp
  mov bx, [Temps+18]
  cmp word [bx], 1
  jz L915
  mov ax, [Temps+10]
  cmp word ax, 32
  call Bare_make_bool_from_n
  mov [Temps+20], ax
  mov bx, [Temps+20]
  cmp word [bx], 1
  jz L916
  mov dx, g273
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L918: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word cx
  push word L771
  mov cx, sp
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  mov ax, [bx]
  mov [Temps+6], ax
  mov bx, [Temps+6]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov ax, [bx+4]
  mov [Temps+10], ax
  mov ax, [bx+6]
  mov [Temps+12], ax
  mov ax, [bp+12]
  cmp word ax, [Temps+10]
  call Bare_make_bool_from_z
  mov [Temps+14], ax
  mov bx, [Temps+14]
  cmp word [bx], 1
  jz L772
  mov bx, [Temps+8]
  mov ax, [bx]
  mov [Temps+16], ax
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+12]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L845
  mov cx, sp
  mov bx, [Temps+16]
  cmp word [bx], 1
  jz L917
  mov dx, g298
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L919: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L918
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L920: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L919
  mov cx, sp
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L921: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L920
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  jmp [bp]

L922: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L921
  mov cx, sp
  mov bp, g3
  mov dx, g270
  jmp [bp]

L923: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L922
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L924: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L923
  mov cx, sp
  mov dx, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L925: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L924
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g269
  jmp [bp]

L926: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L925
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L927: ; Arm: 89'11
  push word g267
  push word '0'
  push word 1
  mov [Temps+6], sp
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L928: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L929: ; Continuation
  call Bare_enter_check
  mov ax, [bp+10]
  mov bx, 8
  call Bare_div
  mov [Temps+2], ax
  mov ax, [Temps+2]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  push word [Temps+2]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L926
  mov cx, sp
  mov bx, [Temps+4]
  cmp word [bx], 1
  jz L927
  push word [Temps+2]
  push word cx
  push word L928
  mov cx, sp
  mov bp, g266
  mov dx, g268
  jmp [bp]

L930: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L929
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L931: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L930
  mov cx, sp
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L932: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L931
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  jmp [bp]

L933: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L932
  mov cx, sp
  mov bp, g3
  mov dx, g265
  jmp [bp]

L934: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L933
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L935: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L934
  mov cx, sp
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L936: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L935
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g264
  jmp [bp]

L937: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L936
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L938: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L937
  mov cx, sp
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L939: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L938
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  jmp [bp]

L940: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L939
  mov cx, sp
  mov bp, g3
  mov dx, g263
  jmp [bp]

L941: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L940
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L942: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L941
  mov cx, sp
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L943: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L942
  mov cx, sp
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L944: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L943
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L945: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L944
  mov cx, sp
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L946: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L945
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  jmp [bp]

L947: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L946
  mov cx, sp
  mov bp, g3
  mov dx, g262
  jmp [bp]

L948: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L947
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L949: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L948
  mov cx, sp
  mov dx, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L950: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L949
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g261
  jmp [bp]

L951: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L950
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L952: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L951
  mov cx, sp
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L953: ; Continuation
  call Bare_enter_check
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L952
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  jmp [bp]

L954: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L953
  mov cx, sp
  mov bp, g3
  mov dx, g260
  jmp [bp]

L955: ; Continuation
  call Bare_enter_check
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L954
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L956: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L955
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g259
  jmp [bp]

L957: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L956
  mov cx, sp
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L958: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L957
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L959: ; Arm: 89'11
  push word g257
  push word '0'
  push word 1
  mov [Temps+4], sp
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L960: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L961: ; Continuation
  call Bare_enter_check
  mov ax, [bp+12]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L958
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L959
  push word [bp+12]
  push word cx
  push word L960
  mov cx, sp
  mov bp, g256
  mov dx, g258
  jmp [bp]

L962: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L961
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L963: ; Arm: 89'11
  push word g254
  push word '0'
  push word 1
  mov [Temps+6], sp
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L964: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L965: ; Continuation
  call Bare_enter_check
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L736
  mov cx, sp
  mov bx, dx
  cmp word [bx], 1
  jz L764
  mov ax, [bp+10]
  mov bx, 8
  call Bare_div
  mov [Temps+2], ax
  mov ax, [bp+10]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  push word [Temps+2]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L962
  mov cx, sp
  mov bx, [Temps+4]
  cmp word [bx], 1
  jz L963
  push word [bp+10]
  push word cx
  push word L964
  mov cx, sp
  mov bp, g253
  mov dx, g255
  jmp [bp]

L966: ; Arm: 228'33
  mov dx, g240
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L967: ; Arm: 13'9
  mov dx, g241
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L968: ; Function: t1
  mov ax, 125
  cmp word ax, dx
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L714
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [Temps+4], ax
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L965
  mov cx, sp
  mov bx, [Temps+4]
  cmp word [bx], 1
  jz L966
  mov ax, dx
  cmp word ax, 256
  call Bare_make_bool_from_n
  mov [Temps+6], ax
  mov bx, [Temps+6]
  cmp word [bx], 1
  jz L967
  mov dx, g242
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L969: ; Continuation
  call Bare_enter_check
  mov dx, g336
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L970: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L968
  mov [Temps+2], sp
  push word cx
  push word L969
  mov cx, sp
  mov bp, [Temps+2]
  mov dx, 100
  jmp [bp]

L971: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L713
  mov [Temps+2], sp
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L970
  mov cx, sp
  mov bp, [Temps+2]
  mov dx, 114
  jmp [bp]

L972: ; Continuation
  call Bare_enter_check
  push word g23
  mov ax, sp
  mov [Temps+2], ax
  push word [bp+10]
  push word 0
  mov [Temps+4], sp
  push word [Temps+4]
  push word 0
  push word [Temps+2]
  push word 0
  mov [Temps+6], sp
  push word [Temps+6]
  mov ax, sp
  mov [Temps+8], ax
  push word [Temps+8]
  push word [bp+8]
  push word 0
  mov [Temps+10], sp
  push word [Temps+10]
  push word [bp+6]
  push word [bp+4]
  push word L435
  mov [Temps+12], sp
  push word [Temps+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L971
  mov cx, sp
  mov bp, [Temps+12]
  mov dx, 101
  jmp [bp]

L973: ; Continuation
  call Bare_enter_check
  mov ax, 512
  call Bare_make_bytes
  mov [Temps+2], ax
  push word [Temps+2]
  push word dx
  push word L153
  mov [Temps+4], sp
  push word [Temps+2]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L972
  mov cx, sp
  mov bp, [Temps+4]
  mov dx, 0
  jmp [bp]

L974: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L973
  mov cx, sp
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L975: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L974
  mov cx, sp
  mov bp, g8
  mov dx, dx
  jmp [bp]

L976: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L975
  mov cx, sp
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L977: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L976
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L978: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L977
  mov cx, sp
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L979: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L978
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  jmp [bp]

L980: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L979
  mov cx, sp
  mov bp, g3
  mov dx, g19
  jmp [bp]

L981: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L980
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L982: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L981
  mov cx, sp
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L983: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L982
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g18
  jmp [bp]

L984: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L983
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L985: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L984
  mov cx, sp
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L986: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L985
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  jmp [bp]

L987: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L986
  mov cx, sp
  mov bp, g3
  mov dx, g17
  jmp [bp]

L988: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L987
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L989: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L988
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g16
  jmp [bp]

L990: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L989
  mov cx, sp
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L991: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L990
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L992: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L991
  mov cx, sp
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L993: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L992
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  jmp [bp]

L994: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L993
  mov cx, sp
  mov bp, g3
  mov dx, g15
  jmp [bp]

L995: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L994
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L996: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L995
  mov cx, sp
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L997: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L996
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g14
  jmp [bp]

L998: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L997
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L999: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L998
  mov cx, sp
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L1000: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L999
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  jmp [bp]

L1001: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1000
  mov cx, sp
  mov bp, g3
  mov dx, g13
  jmp [bp]

L1002: ; Continuation
  call Bare_enter_check
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1001
  mov cx, sp
  mov bp, g3
  mov dx, dx
  jmp [bp]

L1003: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1002
  mov cx, sp
  mov bp, [bp+6]
  mov dx, g12
  jmp [bp]

L1004: ; Continuation
  call Bare_enter_check
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1003
  mov cx, sp
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L1005: ; Continuation
  call Bare_enter_check
  mov ax, 16384
  call Bare_make_bytes
  mov [Temps+2], ax
  push word [Temps+2]
  push word 0
  mov [Temps+4], sp
  push word g11
  push word '0'
  push word 1
  mov [Temps+6], sp
  push word [Temps+4]
  push word dx
  push word [bp+4]
  push word cx
  push word L1004
  mov cx, sp
  mov bp, [bp+4]
  mov dx, [Temps+6]
  jmp [bp]

L1006: ; Continuation
  call Bare_enter_check
  push word dx
  push word cx
  push word L1005
  mov cx, sp
  mov bp, g1
  mov dx, g7
  jmp [bp]

L1007: ; Start
  push word cx
  push word L1006
  mov cx, sp
  mov bp, g1
  mov dx, g5
  jmp [bp]

g1:
  dw L2
g2:
  dw L5
g3:
  dw L9
g4:
  dw 0
g5:
  dw L17
g6:
  dw 0
g7:
  dw L23
g8:
  dw L29
g9:
  dw 0
g11:
  dw 0
g12:
  dw 11
  db ' ', ' ', ' ', '*', '*', 'S', 'L', 'O', 'W', '*', '*'
g13:
  dw 0
g14:
  dw 12
  db 'r', 'e', 'a', 'd', '_', 's', 'e', 'c', 't', 'o', 'r', ' '
g15:
  dw 0
g16:
  dw 1
  db `\n`
g17:
  dw 0
g18:
  dw 7
  db 't', 'r', 'a', 'c', 'e', ':', ' '
g19:
  dw 0
g20:
  dw 0
g21:
  dw 1
g22:
  dw 0
g23:
  dw 0
g24:
  dw 0
g25:
  dw 0
g26:
  dw 1
g27:
  dw 0
g28:
  dw 1
g29:
  dw L33
g30:
  dw 0
g31:
  dw 0
g32:
  dw 12
  db 'w', 'r', 'i', 't', 'e', '_', 'b', 'l', 'o', 'c', 'k', ' '
g33:
  dw 0
g34:
  dw 1
  db `\n`
g35:
  dw 0
g36:
  dw 7
  db 'e', 'r', 'r', 'o', 'r', ':', ' '
g37:
  dw 0
g38:
  dw 0
g39:
  dw L37
g40:
  dw 0
g41:
  dw 0
g42:
  dw L41
g43:
  dw 0
g44:
  dw 0
g45:
  dw 1
  db ']'
g46:
  dw 0
g47:
  dw 1
  db '['
g48:
  dw 0
g49:
  dw 0
g50:
  dw 12
  db 'w', 'r', 'i', 't', 'e', '_', 'b', 'l', 'o', 'c', 'k', ' '
g51:
  dw 0
g52:
  dw L45
g53:
  dw 0
g54:
  dw 0
g55:
  dw L49
g56:
  dw 0
g57:
  dw 0
g58:
  dw L53
g59:
  dw 0
g60:
  dw 6
  db ',', ' ', 'l', 'e', 'n', '='
g61:
  dw 0
g62:
  dw 0
g63:
  dw 9
  db ',', ' ', 'o', 'f', 'f', 's', 'e', 't', '='
g64:
  dw 0
g65:
  dw 0
g66:
  dw 21
  db 'u', 'p', 'd', 'a', 't', 'e', '_', 's', 'e', 'c', 't', 'o', 'r', 'C', '1', ' ', 's', 'e', 'c', 'i', '='
g67:
  dw 0
g68:
  dw 0
g69:
  dw 1
g70:
  dw 0
g71:
  dw 1
g72:
  dw 1
g73:
  dw 0
g74:
  dw 1
g75:
  dw L57
g76:
  dw 0
g77:
  dw 0
g78:
  dw 13
  db 'w', 'r', 'i', 't', 'e', '_', 's', 'e', 'c', 't', 'o', 'r', ' '
g79:
  dw 0
g80:
  dw 1
  db `\n`
g81:
  dw 0
g82:
  dw 7
  db 'e', 'r', 'r', 'o', 'r', ':', ' '
g83:
  dw 0
g84:
  dw 0
g85:
  dw L61
g86:
  dw 0
g87:
  dw 0
g88:
  dw 11
  db ' ', ' ', ' ', '*', '*', 'S', 'L', 'O', 'W', '*', '*'
g89:
  dw 0
g90:
  dw 13
  db 'w', 'r', 'i', 't', 'e', '_', 's', 'e', 'c', 't', 'o', 'r', ' '
g91:
  dw 0
g92:
  dw 1
  db `\n`
g93:
  dw 0
g94:
  dw 7
  db 't', 'r', 'a', 'c', 'e', ':', ' '
g95:
  dw 0
g96:
  dw 0
g97:
  dw 1
g98:
  dw 0
g99:
  dw 0
g100:
  dw 1
g101:
  dw 0
g102:
  dw 1
g103:
  dw L65
g104:
  dw 0
g105:
  dw 0
g106:
  dw 12
  db 'r', 'e', 'a', 'd', '_', 's', 'e', 'c', 't', 'o', 'r', ' '
g107:
  dw 0
g108:
  dw 1
  db `\n`
g109:
  dw 0
g110:
  dw 7
  db 'e', 'r', 'r', 'o', 'r', ':', ' '
g111:
  dw 0
g112:
  dw 0
g113:
  dw L69
g114:
  dw 0
g115:
  dw 0
g116:
  dw 11
  db ' ', ' ', ' ', '*', '*', 'S', 'L', 'O', 'W', '*', '*'
g117:
  dw 0
g118:
  dw 12
  db 'r', 'e', 'a', 'd', '_', 's', 'e', 'c', 't', 'o', 'r', ' '
g119:
  dw 0
g120:
  dw 1
  db `\n`
g121:
  dw 0
g122:
  dw 7
  db 't', 'r', 'a', 'c', 'e', ':', ' '
g123:
  dw 0
g124:
  dw 0
g125:
  dw 1
g126:
  dw 0
g127:
  dw 0
g128:
  dw 1
g129:
  dw 0
g130:
  dw 1
g131:
  dw 0
g132:
  dw L73
g133:
  dw 0
g134:
  dw 1
g135:
  dw 0
g136:
  dw 1
g137:
  dw L77
g138:
  dw 0
g139:
  dw 0
g140:
  dw 12
  db 'w', 'r', 'i', 't', 'e', '_', 'b', 'l', 'o', 'c', 'k', ' '
g141:
  dw 0
g142:
  dw 1
  db `\n`
g143:
  dw 0
g144:
  dw 7
  db 'e', 'r', 'r', 'o', 'r', ':', ' '
g145:
  dw 0
g146:
  dw 0
g147:
  dw L81
g148:
  dw 0
g149:
  dw 0
g150:
  dw L85
g151:
  dw 0
g152:
  dw 0
g153:
  dw 1
  db ']'
g154:
  dw 0
g155:
  dw 1
  db '['
g156:
  dw 0
g157:
  dw 0
g158:
  dw 12
  db 'w', 'r', 'i', 't', 'e', '_', 'b', 'l', 'o', 'c', 'k', ' '
g159:
  dw 0
g160:
  dw L89
g161:
  dw 0
g162:
  dw 0
g163:
  dw L93
g164:
  dw 0
g165:
  dw 0
g166:
  dw L97
g167:
  dw 0
g168:
  dw 6
  db ',', ' ', 'l', 'e', 'n', '='
g169:
  dw 0
g170:
  dw 0
g171:
  dw 9
  db ',', ' ', 'o', 'f', 'f', 's', 'e', 't', '='
g172:
  dw 0
g173:
  dw 0
g174:
  dw 21
  db 'u', 'p', 'd', 'a', 't', 'e', '_', 's', 'e', 'c', 't', 'o', 'r', 'C', '1', ' ', 's', 'e', 'c', 'i', '='
g175:
  dw 0
g176:
  dw 0
g177:
  dw 1
g178:
  dw 0
g179:
  dw 1
g180:
  dw 1
g181:
  dw 0
g182:
  dw 1
g183:
  dw L101
g184:
  dw 0
g185:
  dw 0
g186:
  dw 13
  db 'w', 'r', 'i', 't', 'e', '_', 's', 'e', 'c', 't', 'o', 'r', ' '
g187:
  dw 0
g188:
  dw 1
  db `\n`
g189:
  dw 0
g190:
  dw 7
  db 'e', 'r', 'r', 'o', 'r', ':', ' '
g191:
  dw 0
g192:
  dw 0
g193:
  dw L105
g194:
  dw 0
g195:
  dw 0
g196:
  dw 11
  db ' ', ' ', ' ', '*', '*', 'S', 'L', 'O', 'W', '*', '*'
g197:
  dw 0
g198:
  dw 13
  db 'w', 'r', 'i', 't', 'e', '_', 's', 'e', 'c', 't', 'o', 'r', ' '
g199:
  dw 0
g200:
  dw 1
  db `\n`
g201:
  dw 0
g202:
  dw 7
  db 't', 'r', 'a', 'c', 'e', ':', ' '
g203:
  dw 0
g204:
  dw 0
g205:
  dw 1
g206:
  dw 0
g207:
  dw 0
g208:
  dw 1
g209:
  dw 0
g210:
  dw 1
g211:
  dw L109
g212:
  dw 0
g213:
  dw 0
g214:
  dw 12
  db 'r', 'e', 'a', 'd', '_', 's', 'e', 'c', 't', 'o', 'r', ' '
g215:
  dw 0
g216:
  dw 1
  db `\n`
g217:
  dw 0
g218:
  dw 7
  db 'e', 'r', 'r', 'o', 'r', ':', ' '
g219:
  dw 0
g220:
  dw 0
g221:
  dw L113
g222:
  dw 0
g223:
  dw 0
g224:
  dw 11
  db ' ', ' ', ' ', '*', '*', 'S', 'L', 'O', 'W', '*', '*'
g225:
  dw 0
g226:
  dw 12
  db 'r', 'e', 'a', 'd', '_', 's', 'e', 'c', 't', 'o', 'r', ' '
g227:
  dw 0
g228:
  dw 1
  db `\n`
g229:
  dw 0
g230:
  dw 7
  db 't', 'r', 'a', 'c', 'e', ':', ' '
g231:
  dw 0
g232:
  dw 0
g233:
  dw 1
g234:
  dw 0
g235:
  dw 0
g236:
  dw 1
g237:
  dw 0
g238:
  dw 1
g239:
  dw 0
g240:
  dw 1
g241:
  dw 0
g242:
  dw 1
g243:
  dw L117
g244:
  dw 0
g245:
  dw 0
g246:
  dw 11
  db 'r', 'e', 'a', 'd', '_', 'b', 'l', 'o', 'c', 'k', ' '
g247:
  dw 0
g248:
  dw 1
  db `\n`
g249:
  dw 0
g250:
  dw 7
  db 'e', 'r', 'r', 'o', 'r', ':', ' '
g251:
  dw 0
g252:
  dw 0
g253:
  dw L121
g254:
  dw 0
g255:
  dw 0
g256:
  dw L125
g257:
  dw 0
g258:
  dw 0
g259:
  dw 1
  db ']'
g260:
  dw 0
g261:
  dw 1
  db '['
g262:
  dw 0
g263:
  dw 0
g264:
  dw 11
  db 'r', 'e', 'a', 'd', '_', 'b', 'l', 'o', 'c', 'k', ' '
g265:
  dw 0
g266:
  dw L129
g267:
  dw 0
g268:
  dw 0
g269:
  dw 19
  db 'r', 'e', 'a', 'd', '_', 's', 'e', 'c', 't', 'o', 'r', 'C', '1', ' ', 's', 'e', 'c', 'i', '='
g270:
  dw 0
g271:
  dw 1
g272:
  dw 0
g273:
  dw 1
g274:
  dw L133
g275:
  dw 0
g276:
  dw 0
g277:
  dw 13
  db 'w', 'r', 'i', 't', 'e', '_', 's', 'e', 'c', 't', 'o', 'r', ' '
g278:
  dw 0
g279:
  dw 1
  db `\n`
g280:
  dw 0
g281:
  dw 7
  db 'e', 'r', 'r', 'o', 'r', ':', ' '
g282:
  dw 0
g283:
  dw 0
g284:
  dw L137
g285:
  dw 0
g286:
  dw 0
g287:
  dw 11
  db ' ', ' ', ' ', '*', '*', 'S', 'L', 'O', 'W', '*', '*'
g288:
  dw 0
g289:
  dw 13
  db 'w', 'r', 'i', 't', 'e', '_', 's', 'e', 'c', 't', 'o', 'r', ' '
g290:
  dw 0
g291:
  dw 1
  db `\n`
g292:
  dw 0
g293:
  dw 7
  db 't', 'r', 'a', 'c', 'e', ':', ' '
g294:
  dw 0
g295:
  dw 0
g296:
  dw 1
g297:
  dw 0
g298:
  dw 0
g299:
  dw 1
g300:
  dw 0
g301:
  dw 1
g302:
  dw L141
g303:
  dw 0
g304:
  dw 0
g305:
  dw 12
  db 'r', 'e', 'a', 'd', '_', 's', 'e', 'c', 't', 'o', 'r', ' '
g306:
  dw 0
g307:
  dw 1
  db `\n`
g308:
  dw 0
g309:
  dw 7
  db 'e', 'r', 'r', 'o', 'r', ':', ' '
g310:
  dw 0
g311:
  dw 0
g312:
  dw L145
g313:
  dw 0
g314:
  dw 0
g315:
  dw 11
  db ' ', ' ', ' ', '*', '*', 'S', 'L', 'O', 'W', '*', '*'
g316:
  dw 0
g317:
  dw 12
  db 'r', 'e', 'a', 'd', '_', 's', 'e', 'c', 't', 'o', 'r', ' '
g318:
  dw 0
g319:
  dw 1
  db `\n`
g320:
  dw 0
g321:
  dw 7
  db 't', 'r', 'a', 'c', 'e', ':', ' '
g322:
  dw 0
g323:
  dw 0
g324:
  dw 1
g325:
  dw 0
g326:
  dw 0
g327:
  dw 0
g328:
  dw 1
g329:
  dw 0
g330:
  dw L149
g331:
  dw 0
g332:
  dw 0
g333:
  dw 3
  db ' ', ':', ' '
g334:
  dw 0
g335:
  dw 0
g336:
  dw 0

bare_start: jmp L1007
