(*Stage5 (ASM)*)
L1: ; Function: t1
  ;; (2'54) Tail: f (f1) @ a (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L2: ; Function: g1
  push dx
  push #L1
  mov 201, sp
  ;; (0'0) Return: lam_2'31 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L3: ; Function: g2
  mov ax, dx
  call bios_explode
  mov 201, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L4: ; Arm: 53'30
  ;; (0'0) Return: con_53'33 (g4)
  mov dx, 104
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L5: ; Arm: 53'45
  mov ax, dx
  mov ax, [ax+1]
  mov 201, ax
  mov ax, dx
  mov ax, [ax+2]
  mov 202, ax
  ;; (0'0) Return: con_53'48 (g5)
  mov dx, 105
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L6: ; Arm: 53'7
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L4
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L5
  crash

L7: ; Arm: 56'10
  ;; (0'0) Return: con_56'13 (g6)
  mov dx, 106
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L8: ; Continuation
  ;; (58'37) Tail: app_58'34 (arg) @ ys (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L9: ; Continuation
  push [bp+3]
  push cx
  push #L8
  mov cx, sp
  ;; (58'34) Tail: app_58'31 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L10: ; Arm: 58'18
  push [bp+4]
  push [bp+3]
  push cx
  push #L9
  mov cx, sp
  ;; (58'31) Tail: eq_list (g3) @ eq (f2)
  mov dx, [bp+2]
  mov bp, 103
  mov ax, [bp]
  jmp [ax]

L11: ; Arm: 58'40
  ;; (0'0) Return: con_58'45 (g7)
  mov dx, 107
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L12: ; Continuation
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L10
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L11
  crash

L13: ; Continuation
  push [bp+5]
  push [bp+3]
  push [bp+2]
  push cx
  push #L12
  mov cx, sp
  ;; (58'16) Tail: app_58'14 (arg) @ y (f4)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+4]
  mov ax, [bp]
  jmp [ax]

L14: ; Arm: 57'13
  mov ax, dx
  mov ax, [ax+1]
  mov 203, ax
  mov ax, dx
  mov ax, [ax+2]
  mov 204, ax
  push 204
  push 203
  push 202
  push [bp+1]
  push cx
  push #L13
  mov cx, sp
  ;; (58'14) Tail: eq (f1) @ x (t1)
  mov bp, [bp+1]
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L15: ; Arm: 54'10
  mov ax, [bp+2]
  mov ax, [ax+1]
  mov 201, ax
  mov ax, [bp+2]
  mov ax, [ax+2]
  mov 202, ax
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L7
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L14
  crash

L16: ; Function: t1
  mov ax, [bp+2]
  mov ax, [ax]
  cmp ax, #0
  bz L6
  mov ax, [bp+2]
  mov ax, [ax]
  cmp ax, #1
  bz L15
  crash

L17: ; Function: t1
  push dx
  push [bp+1]
  push #L16
  mov 201, sp
  ;; (0'0) Return: lam_51'22 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L18: ; Function: g3
  push dx
  push #L17
  mov 201, sp
  ;; (0'0) Return: lam_51'19 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L19: ; Arm: 64'7
  ;; (62'18) Return: ys (arg)
  mov dx, dx
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L20: ; Continuation
  push dx
  push [bp+2]
  push #1
  mov 201, sp
  ;; (0'0) Return: con_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L21: ; Continuation
  push [bp+3]
  push cx
  push #L20
  mov cx, sp
  ;; (65'31) Tail: app_65'28 (arg) @ ys (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L22: ; Arm: 65'10
  mov ax, [bp+1]
  mov ax, [ax+1]
  mov 201, ax
  mov ax, [bp+1]
  mov ax, [ax+2]
  mov 202, ax
  push 201
  push dx
  push cx
  push #L21
  mov cx, sp
  ;; (65'28) Tail: append (g8) @ xs (t2)
  mov bp, 108
  mov dx, 202
  mov ax, [bp]
  jmp [ax]

L23: ; Function: t1
  mov ax, [bp+1]
  mov ax, [ax]
  cmp ax, #0
  bz L19
  mov ax, [bp+1]
  mov ax, [ax]
  cmp ax, #1
  bz L22
  crash

L24: ; Function: g8
  push dx
  push #L23
  mov 201, sp
  ;; (0'0) Return: lam_62'18 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L25: ; Arm: 69'7
  ;; (67'16) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L26: ; Continuation
  ;; (70'34) Tail: app_70'21 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L27: ; Arm: 70'10
  mov ax, dx
  mov ax, [ax+1]
  mov 201, ax
  mov ax, dx
  mov ax, [ax+2]
  mov 202, ax
  push [bp+1]
  push 201
  push #1
  mov 203, sp
  push 202
  push cx
  push #L26
  mov cx, sp
  ;; (70'21) Tail: revloop (g9) @ con_0'0 (t3)
  mov bp, 109
  mov dx, 203
  mov ax, [bp]
  jmp [ax]

L28: ; Function: t1
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L25
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L27
  crash

L29: ; Function: g9
  push dx
  push #L28
  mov 201, sp
  ;; (0'0) Return: lam_67'20 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L30: ; Arm: 76'7
  ;; (0'0) Return: con_76'10 (g11)
  mov dx, 111
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L31: ; Continuation
  push dx
  push [bp+2]
  push #1
  mov 201, sp
  ;; (0'0) Return: con_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L32: ; Continuation
  push [bp+3]
  push cx
  push #L31
  mov cx, sp
  ;; (77'26) Tail: app_77'24 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L33: ; Continuation
  push dx
  push [bp+3]
  push cx
  push #L32
  mov cx, sp
  ;; (77'24) Tail: map (g10) @ f (f2)
  mov dx, [bp+2]
  mov bp, 110
  mov ax, [bp]
  jmp [ax]

L34: ; Arm: 77'10
  mov ax, dx
  mov ax, [ax+1]
  mov 201, ax
  mov ax, dx
  mov ax, [ax+2]
  mov 202, ax
  push 202
  push [bp+1]
  push cx
  push #L33
  mov cx, sp
  ;; (77'15) Tail: f (f1) @ x (t1)
  mov bp, [bp+1]
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L35: ; Function: t1
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L30
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L34
  crash

L36: ; Function: g10
  push dx
  push #L35
  mov 201, sp
  ;; (0'0) Return: lam_74'14 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L37: ; Arm: 81'7
  ;; (0'0) Return: lit_81'10 (g13)
  mov dx, 113
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L38: ; Continuation
  mov ax, 114
  add ax, dx
  mov 201, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L39: ; Arm: 82'10
  mov ax, dx
  mov ax, [ax+1]
  mov 201, ax
  mov ax, dx
  mov ax, [ax+2]
  mov 202, ax
  push cx
  push #L38
  mov cx, sp
  ;; (82'27) Tail: length (g12) @ xs (t2)
  mov bp, 112
  mov dx, 202
  mov ax, [bp]
  jmp [ax]

L40: ; Function: g12
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L37
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L39
  crash

L41: ; Arm: 95'7
  ;; (0'0) Return: con_95'10 (g16)
  mov dx, 116
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L42: ; Continuation
  ;; (96'35) Tail: put_chars (g15) @ xs (f2)
  mov dx, [bp+2]
  mov bp, 115
  mov ax, [bp]
  jmp [ax]

L43: ; Arm: 19'19
  mov ax, 201
  call bios_put_char
  mov 205, ax
  ;; (0'0) Return: prim_0'0 (t5)
  mov dx, 205
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L44: ; Arm: 20'22
  mov ax, 201
  call bios_put_char
  mov 206, ax
  ;; (0'0) Return: prim_0'0 (t6)
  mov dx, 206
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L45: ; Arm: 21'16
  mov ax, 201
  call bios_put_char
  mov 207, ax
  ;; (0'0) Return: prim_0'0 (t7)
  mov dx, 207
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L46: ; Arm: 21'32
  mov ax, 120
  call bios_put_char
  mov 207, ax
  mov ax, 121
  add ax, 203
  mov 208, ax
  mov ax, 208
  sub ax, 122
  mov 209, ax
  mov ax, 209
  call bios_num_to_char
  mov 210, ax
  mov ax, 210
  call bios_put_char
  mov 211, ax
  ;; (0'0) Return: prim_0'0 (t11)
  mov dx, 211
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L47: ; Arm: 20'38
  mov ax, 119
  cmp ax, 203
  call bios_make_bool_from_n
  mov 206, ax
  mov ax, 206
  mov ax, [ax]
  cmp ax, #1
  bz L45
  mov ax, 206
  mov ax, [ax]
  cmp ax, #0
  bz L46
  crash

L48: ; Arm: 19'35
  mov ax, 201
  cmp ax, 118
  call bios_make_bool_from_z
  mov 205, ax
  mov ax, 205
  mov ax, [ax]
  cmp ax, #1
  bz L44
  mov ax, 205
  mov ax, [ax]
  cmp ax, #0
  bz L47
  crash

L49: ; Arm: 96'10
  mov ax, dx
  mov ax, [ax+1]
  mov 201, ax
  mov ax, dx
  mov ax, [ax+2]
  mov 202, ax
  mov ax, 201
  call bios_char_to_num
  mov 203, ax
  mov ax, 203
  cmp ax, 117
  call bios_make_bool_from_z
  mov 204, ax
  push 202
  push cx
  push #L42
  mov cx, sp
  mov ax, 204
  mov ax, [ax]
  cmp ax, #1
  bz L43
  mov ax, 204
  mov ax, [ax]
  cmp ax, #0
  bz L48
  crash

L50: ; Function: g15
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L41
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L49
  crash

L51: ; Continuation
  ;; (72'28) Tail: app_72'25 (arg) @ acc (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L52: ; Arm: 108'20
  mov ax, 126
  call bios_put_char
  mov 204, ax
  push dx
  push cx
  push #L51
  mov cx, sp
  ;; (72'25) Tail: revloop (g9) @ con_72'25 (g27)
  mov bp, 109
  mov dx, 127
  mov ax, [bp]
  jmp [ax]

L53: ; Continuation
  push [bp+2]
  push 137
  push #1
  mov 201, sp
  ;; (72'28) Tail: app_72'25 (arg) @ con_0'0 (t1)
  mov bp, dx
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L54: ; Continuation
  mov ax, 135
  call bios_put_char
  mov 201, ax
  push [bp+2]
  push cx
  push #L53
  mov cx, sp
  ;; (72'25) Tail: revloop (g9) @ con_72'25 (g36)
  mov bp, 109
  mov dx, 136
  mov ax, [bp]
  jmp [ax]

L55: ; Arm: 19'19
  mov ax, 201
  call bios_put_char
  mov 207, ax
  ;; (0'0) Return: prim_0'0 (t7)
  mov dx, 207
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L56: ; Arm: 20'22
  mov ax, 201
  call bios_put_char
  mov 208, ax
  ;; (0'0) Return: prim_0'0 (t8)
  mov dx, 208
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L57: ; Arm: 21'16
  mov ax, 201
  call bios_put_char
  mov 209, ax
  ;; (0'0) Return: prim_0'0 (t9)
  mov dx, 209
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L58: ; Arm: 21'32
  mov ax, 132
  call bios_put_char
  mov 209, ax
  mov ax, 133
  add ax, 205
  mov 210, ax
  mov ax, 210
  sub ax, 134
  mov 211, ax
  mov ax, 211
  call bios_num_to_char
  mov 212, ax
  mov ax, 212
  call bios_put_char
  mov 213, ax
  ;; (0'0) Return: prim_0'0 (t13)
  mov dx, 213
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L59: ; Arm: 20'38
  mov ax, 131
  cmp ax, 205
  call bios_make_bool_from_n
  mov 208, ax
  mov ax, 208
  mov ax, [ax]
  cmp ax, #1
  bz L57
  mov ax, 208
  mov ax, [ax]
  cmp ax, #0
  bz L58
  crash

L60: ; Arm: 19'35
  mov ax, 201
  cmp ax, 130
  call bios_make_bool_from_z
  mov 207, ax
  mov ax, 207
  mov ax, [ax]
  cmp ax, #1
  bz L56
  mov ax, 207
  mov ax, [ax]
  cmp ax, #0
  bz L59
  crash

L61: ; Arm: 109'26
  mov ax, 201
  call bios_char_to_num
  mov 205, ax
  mov ax, 205
  cmp ax, 129
  call bios_make_bool_from_z
  mov 206, ax
  push dx
  push cx
  push #L54
  mov cx, sp
  mov ax, 206
  mov ax, [ax]
  cmp ax, #1
  bz L55
  mov ax, 206
  mov ax, [ax]
  cmp ax, #0
  bz L60
  crash

L62: ; Arm: 110'17
  ;; (110'31) Tail: readloop (g23) @ acc (arg)
  mov bp, 123
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L63: ; Arm: 113'15
  ;; (113'27) Tail: readloop (g23) @ acc (arg)
  mov bp, 123
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L64: ; Continuation
  mov ax, 147
  call bios_put_char
  mov 201, ax
  mov ax, 148
  call bios_put_char
  mov 202, ax
  mov ax, 149
  call bios_put_char
  mov 203, ax
  ;; (117'22) Tail: readloop (g23) @ tail (f2)
  mov dx, [bp+2]
  mov bp, 123
  mov ax, [bp]
  jmp [ax]

L65: ; Arm: 115'29
  mov ax, 143
  call bios_put_char
  mov 201, ax
  mov ax, 144
  call bios_put_char
  mov 202, ax
  mov ax, 145
  call bios_put_char
  mov 203, ax
  ;; (0'0) Return: prim_0'0 (t3)
  mov dx, 203
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L66: ; Arm: 115'48
  ;; (0'0) Return: con_115'53 (g46)
  mov dx, 146
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L67: ; Continuation
  push [bp+2]
  push cx
  push #L64
  mov cx, sp
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L65
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L66
  crash

L68: ; Arm: 8'9
  ;; (0'0) Return: con_8'12 (g41)
  mov dx, 141
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L69: ; Arm: 9'10
  ;; (0'0) Return: con_9'13 (g42)
  mov dx, 142
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L70: ; Arm: 114'20
  mov ax, dx
  mov ax, [ax+1]
  mov 207, ax
  mov ax, dx
  mov ax, [ax+2]
  mov 208, ax
  mov ax, 207
  call bios_char_to_num
  mov 209, ax
  mov ax, 140
  cmp ax, 209
  call bios_make_bool_from_n
  mov 210, ax
  push 208
  push cx
  push #L67
  mov cx, sp
  mov ax, 210
  mov ax, [ax]
  cmp ax, #1
  bz L68
  mov ax, 210
  mov ax, [ax]
  cmp ax, #0
  bz L69
  crash

L71: ; Arm: 111'19
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L63
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L70
  crash

L72: ; Continuation
  push [bp+2]
  push [bp+3]
  push #1
  mov 201, sp
  ;; (119'32) Tail: readloop (g23) @ con_0'0 (t1)
  mov bp, 123
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L73: ; Arm: 19'19
  mov ax, 201
  call bios_put_char
  mov 209, ax
  ;; (0'0) Return: prim_0'0 (t9)
  mov dx, 209
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L74: ; Arm: 20'22
  mov ax, 201
  call bios_put_char
  mov 210, ax
  ;; (0'0) Return: prim_0'0 (t10)
  mov dx, 210
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L75: ; Arm: 21'16
  mov ax, 201
  call bios_put_char
  mov 211, ax
  ;; (0'0) Return: prim_0'0 (t11)
  mov dx, 211
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L76: ; Arm: 21'32
  mov ax, 153
  call bios_put_char
  mov 211, ax
  mov ax, 154
  add ax, 207
  mov 212, ax
  mov ax, 212
  sub ax, 155
  mov 213, ax
  mov ax, 213
  call bios_num_to_char
  mov 214, ax
  mov ax, 214
  call bios_put_char
  mov 215, ax
  ;; (0'0) Return: prim_0'0 (t15)
  mov dx, 215
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L77: ; Arm: 20'38
  mov ax, 152
  cmp ax, 207
  call bios_make_bool_from_n
  mov 210, ax
  mov ax, 210
  mov ax, [ax]
  cmp ax, #1
  bz L75
  mov ax, 210
  mov ax, [ax]
  cmp ax, #0
  bz L76
  crash

L78: ; Arm: 19'35
  mov ax, 201
  cmp ax, 151
  call bios_make_bool_from_z
  mov 209, ax
  mov ax, 209
  mov ax, [ax]
  cmp ax, #1
  bz L74
  mov ax, 209
  mov ax, [ax]
  cmp ax, #0
  bz L77
  crash

L79: ; Arm: 118'8
  mov ax, 201
  call bios_char_to_num
  mov 207, ax
  mov ax, 207
  cmp ax, 150
  call bios_make_bool_from_z
  mov 208, ax
  push 201
  push dx
  push cx
  push #L72
  mov cx, sp
  mov ax, 208
  mov ax, [ax]
  cmp ax, #1
  bz L73
  mov ax, 208
  mov ax, [ax]
  cmp ax, #0
  bz L78
  crash

L80: ; Arm: 110'35
  mov ax, 202
  cmp ax, 139
  call bios_make_bool_from_z
  mov 206, ax
  mov ax, 206
  mov ax, [ax]
  cmp ax, #1
  bz L71
  mov ax, 206
  mov ax, [ax]
  cmp ax, #0
  bz L79
  crash

L81: ; Arm: 109'82
  mov ax, 138
  cmp ax, 202
  call bios_make_bool_from_n
  mov 205, ax
  mov ax, 205
  mov ax, [ax]
  cmp ax, #1
  bz L62
  mov ax, 205
  mov ax, [ax]
  cmp ax, #0
  bz L80
  crash

L82: ; Arm: 108'50
  mov ax, 201
  cmp ax, 128
  call bios_make_bool_from_z
  mov 204, ax
  mov ax, 204
  mov ax, [ax]
  cmp ax, #1
  bz L61
  mov ax, 204
  mov ax, [ax]
  cmp ax, #0
  bz L81
  crash

L83: ; Function: g23
  call bios_get_char
  mov 201, ax
  mov ax, 201
  call bios_char_to_num
  mov 202, ax
  mov ax, 201
  cmp ax, 125
  call bios_make_bool_from_z
  mov 203, ax
  mov ax, 203
  mov ax, [ax]
  cmp ax, #1
  bz L52
  mov ax, 203
  mov ax, [ax]
  cmp ax, #0
  bz L82
  crash

L84: ; Arm: 125'11
  ;; (123'12) Return: n (arg)
  mov dx, dx
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L85: ; Continuation
  mov ax, [bp+2]
  add ax, dx
  mov 201, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L86: ; Continuation
  mov ax, [bp+2]
  sub ax, 159
  mov 201, ax
  push dx
  push cx
  push #L85
  mov cx, sp
  ;; (125'39) Tail: fib (g56) @ prim_0'0 (t1)
  mov bp, 156
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L87: ; Arm: 125'18
  mov ax, dx
  sub ax, 158
  mov 202, ax
  push dx
  push cx
  push #L86
  mov cx, sp
  ;; (125'27) Tail: fib (g56) @ prim_0'0 (t2)
  mov bp, 156
  mov dx, 202
  mov ax, [bp]
  jmp [ax]

L88: ; Function: g56
  mov ax, dx
  cmp ax, 157
  call bios_make_bool_from_n
  mov 201, ax
  mov ax, 201
  mov ax, [ax]
  cmp ax, #1
  bz L84
  mov ax, 201
  mov ax, [ax]
  cmp ax, #0
  bz L87
  crash

L89: ; Continuation
  mov ax, dx
  mul ax, [bp+2]
  mov 201, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L90: ; Arm: 129'12
  mov ax, [bp+2]
  sub ax, 164
  mov 201, ax
  push [bp+2]
  push cx
  push #L89
  mov cx, sp
  ;; (129'22) Tail: fact (g60) @ prim_0'0 (t1)
  mov bp, 160
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L91: ; Arm: 129'32
  ;; (0'0) Return: lit_129'37 (g65)
  mov dx, 165
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L92: ; Continuation
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L90
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L91
  crash

L93: ; Arm: 8'9
  ;; (0'0) Return: con_8'12 (g62)
  mov dx, 162
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L94: ; Arm: 9'10
  ;; (0'0) Return: con_9'13 (g63)
  mov dx, 163
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L95: ; Function: g60
  mov ax, dx
  cmp ax, 161
  call bios_make_bool_from_n
  mov 201, ax
  push dx
  push cx
  push #L92
  mov cx, sp
  mov ax, 201
  mov ax, [ax]
  cmp ax, #1
  bz L93
  mov ax, 201
  mov ax, [ax]
  cmp ax, #0
  bz L94
  crash

L96: ; Continuation
  push [bp+2]
  push [bp+3]
  push #1
  mov 201, sp
  ;; (72'28) Tail: app_72'25 (arg) @ con_0'0 (t1)
  mov bp, dx
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L97: ; Continuation
  push dx
  push [bp+2]
  push cx
  push #L96
  mov cx, sp
  ;; (72'25) Tail: revloop (g9) @ con_72'25 (g68)
  mov bp, 109
  mov dx, 168
  mov ax, [bp]
  jmp [ax]

L98: ; Continuation
  push [bp+2]
  push cx
  push #L97
  mov cx, sp
  ;; (72'28) Tail: app_72'25 (arg) @ accCs (f3)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+3]
  mov ax, [bp]
  jmp [ax]

L99: ; Arm: 196'7
  push [bp+2]
  push [bp+1]
  push cx
  push #L98
  mov cx, sp
  ;; (72'25) Tail: revloop (g9) @ con_72'25 (g67)
  mov bp, 109
  mov dx, 167
  mov ax, [bp]
  jmp [ax]

L100: ; Continuation
  ;; (199'65) Tail: app_199'62 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L101: ; Continuation
  push [bp+2]
  push cx
  push #L100
  mov cx, sp
  ;; (199'62) Tail: app_199'37 (arg) @ con_199'62 (g71)
  mov bp, dx
  mov dx, 171
  mov ax, [bp]
  jmp [ax]

L102: ; Continuation
  push [bp+2]
  push dx
  push #1
  mov 201, sp
  push [bp+3]
  push cx
  push #L101
  mov cx, sp
  ;; (199'37) Tail: splitloop (g66) @ con_0'0 (t1)
  mov bp, 166
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L103: ; Continuation
  push [bp+4]
  push [bp+2]
  push cx
  push #L102
  mov cx, sp
  ;; (72'28) Tail: app_72'25 (arg) @ accCs (f3)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+3]
  mov ax, [bp]
  jmp [ax]

L104: ; Arm: 199'22
  push 202
  push [bp+2]
  push [bp+1]
  push cx
  push #L103
  mov cx, sp
  ;; (72'25) Tail: revloop (g9) @ con_72'25 (g70)
  mov bp, 109
  mov dx, 170
  mov ax, [bp]
  jmp [ax]

L105: ; Continuation
  ;; (200'37) Tail: app_200'26 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L106: ; Continuation
  push [bp+2]
  push [bp+3]
  push #1
  mov 201, sp
  push [bp+4]
  push cx
  push #L105
  mov cx, sp
  ;; (200'26) Tail: app_200'20 (arg) @ con_0'0 (t1)
  mov bp, dx
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L107: ; Arm: 200'5
  push 202
  push 201
  push [bp+2]
  push cx
  push #L106
  mov cx, sp
  ;; (200'20) Tail: splitloop (g66) @ accWs (f1)
  mov dx, [bp+1]
  mov bp, 166
  mov ax, [bp]
  jmp [ax]

L108: ; Arm: 198'10
  mov ax, dx
  mov ax, [ax+1]
  mov 201, ax
  mov ax, dx
  mov ax, [ax+2]
  mov 202, ax
  mov ax, 201
  cmp ax, 169
  call bios_make_bool_from_z
  mov 203, ax
  mov ax, 203
  mov ax, [ax]
  cmp ax, #1
  bz L104
  mov ax, 203
  mov ax, [ax]
  cmp ax, #0
  bz L107
  crash

L109: ; Function: t1
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L99
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L108
  crash

L110: ; Function: t1
  push dx
  push [bp+1]
  push #L109
  mov 201, sp
  ;; (0'0) Return: lam_194'30 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L111: ; Function: g66
  push dx
  push #L110
  mov 201, sp
  ;; (0'0) Return: lam_194'24 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L112: ; Function: t1
  mov ax, [bp+1]
  cmp ax, dx
  call bios_make_bool_from_z
  mov 201, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L113: ; Function: g78
  push dx
  push #L112
  mov 201, sp
  ;; (0'0) Return: lam_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L114: ; Function: t1
  mov ax, [bp+1]
  cmp ax, dx
  call bios_make_bool_from_z
  mov 201, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L115: ; Function: g87
  push dx
  push #L114
  mov 201, sp
  ;; (0'0) Return: lam_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L116: ; Arm: 41'9
  push [bp+1]
  push #0
  mov 201, sp
  ;; (0'0) Return: con_41'12 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L117: ; Arm: 44'15
  ;; (0'0) Return: con_44'18 (g105)
  mov dx, 305
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L118: ; Continuation
  ;; (45'40) Tail: app_45'25 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L119: ; Arm: 45'17
  mov ax, dx
  mov ax, [ax+1]
  mov 201, ax
  mov ax, 306
  mul ax, [bp+2]
  mov 202, ax
  mov ax, 202
  add ax, 201
  mov 203, ax
  push [bp+3]
  push cx
  push #L118
  mov cx, sp
  ;; (45'25) Tail: loop (g95) @ prim_0'0 (t3)
  mov bp, 195
  mov dx, 203
  mov ax, [bp]
  jmp [ax]

L120: ; Continuation
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L117
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L119
  crash

L121: ; Arm: 36'27
  push [bp+2]
  push #0
  mov 201, sp
  ;; (0'0) Return: con_36'32 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L122: ; Arm: 36'40
  ;; (0'0) Return: con_36'45 (g103)
  mov dx, 303
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L123: ; Continuation
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L121
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L122
  crash

L124: ; Arm: 8'9
  ;; (0'0) Return: con_8'12 (g101)
  mov dx, 301
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L125: ; Arm: 9'10
  ;; (0'0) Return: con_9'13 (g102)
  mov dx, 302
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L126: ; Arm: 36'12
  mov ax, 300
  cmp ax, [bp+4]
  call bios_make_bool_from_n
  mov 201, ax
  push [bp+4]
  push cx
  push #L123
  mov cx, sp
  mov ax, 201
  mov ax, [ax]
  cmp ax, #1
  bz L124
  mov ax, 201
  mov ax, [ax]
  cmp ax, #0
  bz L125
  crash

L127: ; Arm: 36'50
  ;; (0'0) Return: con_36'55 (g104)
  mov dx, 304
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L128: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L120
  mov cx, sp
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L126
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L127
  crash

L129: ; Arm: 8'9
  ;; (0'0) Return: con_8'12 (g98)
  mov dx, 198
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L130: ; Arm: 9'10
  ;; (0'0) Return: con_9'13 (g99)
  mov dx, 199
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L131: ; Arm: 42'12
  mov ax, dx
  mov ax, [ax+1]
  mov 201, ax
  mov ax, dx
  mov ax, [ax+2]
  mov 202, ax
  mov ax, 201
  call bios_char_to_num
  mov 203, ax
  mov ax, 203
  sub ax, 196
  mov 204, ax
  mov ax, 204
  cmp ax, 197
  call bios_make_bool_from_n
  mov 205, ax
  push 204
  push 202
  push [bp+1]
  push cx
  push #L128
  mov cx, sp
  mov ax, 205
  mov ax, [ax]
  cmp ax, #1
  bz L129
  mov ax, 205
  mov ax, [ax]
  cmp ax, #0
  bz L130
  crash

L132: ; Function: t1
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L116
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L131
  crash

L133: ; Function: g95
  push dx
  push #L132
  mov 201, sp
  ;; (0'0) Return: lam_39'19 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L134: ; Arm: 88'13
  ;; (87'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L135: ; Continuation
  mov ax, [bp+2]
  div ax, 315
  mov 201, ax
  ;; (89'45) Tail: app_89'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L136: ; Arm: 88'22
  mov ax, dx
  mod ax, 313
  mov 202, ax
  mov ax, 314
  add ax, 202
  mov 203, ax
  mov ax, 203
  call bios_num_to_char
  mov 204, ax
  push [bp+1]
  push 204
  push #1
  mov 205, sp
  push dx
  push cx
  push #L135
  mov cx, sp
  ;; (89'11) Tail: loop (g111) @ con_0'0 (t5)
  mov bp, 311
  mov dx, 205
  mov ax, [bp]
  jmp [ax]

L137: ; Function: t1
  mov ax, dx
  cmp ax, 312
  call bios_make_bool_from_z
  mov 201, ax
  mov ax, 201
  mov ax, [ax]
  cmp ax, #1
  bz L134
  mov ax, 201
  mov ax, [ax]
  cmp ax, #0
  bz L136
  crash

L138: ; Function: g111
  push dx
  push #L137
  mov 201, sp
  ;; (0'0) Return: lam_87'19 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L139: ; Arm: 88'13
  ;; (87'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L140: ; Continuation
  mov ax, [bp+2]
  div ax, 326
  mov 201, ax
  ;; (89'45) Tail: app_89'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L141: ; Arm: 88'22
  mov ax, dx
  mod ax, 324
  mov 202, ax
  mov ax, 325
  add ax, 202
  mov 203, ax
  mov ax, 203
  call bios_num_to_char
  mov 204, ax
  push [bp+1]
  push 204
  push #1
  mov 205, sp
  push dx
  push cx
  push #L140
  mov cx, sp
  ;; (89'11) Tail: loop (g122) @ con_0'0 (t5)
  mov bp, 322
  mov dx, 205
  mov ax, [bp]
  jmp [ax]

L142: ; Function: t1
  mov ax, dx
  cmp ax, 323
  call bios_make_bool_from_z
  mov 201, ax
  mov ax, 201
  mov ax, [ax]
  cmp ax, #1
  bz L139
  mov ax, 201
  mov ax, [ax]
  cmp ax, #0
  bz L141
  crash

L143: ; Function: g122
  push dx
  push #L142
  mov 201, sp
  ;; (0'0) Return: lam_87'19 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L144: ; Function: t1
  mov ax, [bp+1]
  cmp ax, dx
  call bios_make_bool_from_z
  mov 201, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L145: ; Function: g134
  push dx
  push #L144
  mov 201, sp
  ;; (0'0) Return: lam_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L146: ; Arm: 41'9
  push [bp+1]
  push #0
  mov 201, sp
  ;; (0'0) Return: con_41'12 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L147: ; Arm: 44'15
  ;; (0'0) Return: con_44'18 (g152)
  mov dx, 352
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L148: ; Continuation
  ;; (45'40) Tail: app_45'25 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L149: ; Arm: 45'17
  mov ax, dx
  mov ax, [ax+1]
  mov 201, ax
  mov ax, 353
  mul ax, [bp+2]
  mov 202, ax
  mov ax, 202
  add ax, 201
  mov 203, ax
  push [bp+3]
  push cx
  push #L148
  mov cx, sp
  ;; (45'25) Tail: loop (g142) @ prim_0'0 (t3)
  mov bp, 342
  mov dx, 203
  mov ax, [bp]
  jmp [ax]

L150: ; Continuation
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L147
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L149
  crash

L151: ; Arm: 36'27
  push [bp+2]
  push #0
  mov 201, sp
  ;; (0'0) Return: con_36'32 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L152: ; Arm: 36'40
  ;; (0'0) Return: con_36'45 (g150)
  mov dx, 350
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L153: ; Continuation
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L151
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L152
  crash

L154: ; Arm: 8'9
  ;; (0'0) Return: con_8'12 (g148)
  mov dx, 348
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L155: ; Arm: 9'10
  ;; (0'0) Return: con_9'13 (g149)
  mov dx, 349
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L156: ; Arm: 36'12
  mov ax, 347
  cmp ax, [bp+4]
  call bios_make_bool_from_n
  mov 201, ax
  push [bp+4]
  push cx
  push #L153
  mov cx, sp
  mov ax, 201
  mov ax, [ax]
  cmp ax, #1
  bz L154
  mov ax, 201
  mov ax, [ax]
  cmp ax, #0
  bz L155
  crash

L157: ; Arm: 36'50
  ;; (0'0) Return: con_36'55 (g151)
  mov dx, 351
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L158: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L150
  mov cx, sp
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L156
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L157
  crash

L159: ; Arm: 8'9
  ;; (0'0) Return: con_8'12 (g145)
  mov dx, 345
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L160: ; Arm: 9'10
  ;; (0'0) Return: con_9'13 (g146)
  mov dx, 346
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L161: ; Arm: 42'12
  mov ax, dx
  mov ax, [ax+1]
  mov 201, ax
  mov ax, dx
  mov ax, [ax+2]
  mov 202, ax
  mov ax, 201
  call bios_char_to_num
  mov 203, ax
  mov ax, 203
  sub ax, 343
  mov 204, ax
  mov ax, 204
  cmp ax, 344
  call bios_make_bool_from_n
  mov 205, ax
  push 204
  push 202
  push [bp+1]
  push cx
  push #L158
  mov cx, sp
  mov ax, 205
  mov ax, [ax]
  cmp ax, #1
  bz L159
  mov ax, 205
  mov ax, [ax]
  cmp ax, #0
  bz L160
  crash

L162: ; Function: t1
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L146
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L161
  crash

L163: ; Function: g142
  push dx
  push #L162
  mov 201, sp
  ;; (0'0) Return: lam_39'19 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L164: ; Arm: 88'13
  ;; (87'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L165: ; Continuation
  mov ax, [bp+2]
  div ax, 362
  mov 201, ax
  ;; (89'45) Tail: app_89'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L166: ; Arm: 88'22
  mov ax, dx
  mod ax, 360
  mov 202, ax
  mov ax, 361
  add ax, 202
  mov 203, ax
  mov ax, 203
  call bios_num_to_char
  mov 204, ax
  push [bp+1]
  push 204
  push #1
  mov 205, sp
  push dx
  push cx
  push #L165
  mov cx, sp
  ;; (89'11) Tail: loop (g158) @ con_0'0 (t5)
  mov bp, 358
  mov dx, 205
  mov ax, [bp]
  jmp [ax]

L167: ; Function: t1
  mov ax, dx
  cmp ax, 359
  call bios_make_bool_from_z
  mov 201, ax
  mov ax, 201
  mov ax, [ax]
  cmp ax, #1
  bz L164
  mov ax, 201
  mov ax, [ax]
  cmp ax, #0
  bz L166
  crash

L168: ; Function: g158
  push dx
  push #L167
  mov 201, sp
  ;; (0'0) Return: lam_87'19 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L169: ; Arm: 88'13
  ;; (87'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L170: ; Continuation
  mov ax, [bp+2]
  div ax, 373
  mov 201, ax
  ;; (89'45) Tail: app_89'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L171: ; Arm: 88'22
  mov ax, dx
  mod ax, 371
  mov 202, ax
  mov ax, 372
  add ax, 202
  mov 203, ax
  mov ax, 203
  call bios_num_to_char
  mov 204, ax
  push [bp+1]
  push 204
  push #1
  mov 205, sp
  push dx
  push cx
  push #L170
  mov cx, sp
  ;; (89'11) Tail: loop (g169) @ con_0'0 (t5)
  mov bp, 369
  mov dx, 205
  mov ax, [bp]
  jmp [ax]

L172: ; Function: t1
  mov ax, dx
  cmp ax, 370
  call bios_make_bool_from_z
  mov 201, ax
  mov ax, 201
  mov ax, [ax]
  cmp ax, #1
  bz L169
  mov ax, 201
  mov ax, [ax]
  cmp ax, #0
  bz L171
  crash

L173: ; Function: g169
  push dx
  push #L172
  mov 201, sp
  ;; (0'0) Return: lam_87'19 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L174: ; Function: t1
  mov ax, [bp+1]
  cmp ax, dx
  call bios_make_bool_from_z
  mov 201, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L175: ; Function: g181
  push dx
  push #L174
  mov 201, sp
  ;; (0'0) Return: lam_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L176: ; Function: t1
  mov ax, [bp+1]
  cmp ax, dx
  call bios_make_bool_from_z
  mov 201, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L177: ; Function: g188
  push dx
  push #L176
  mov 201, sp
  ;; (0'0) Return: lam_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L178: ; Arm: 173'39
  ;; (0'0) Return: con_173'44 (g192)
  mov dx, 392
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L179: ; Continuation
  mov ax, 394
  call bios_put_char
  mov 201, ax
  ;; (174'46) Tail: loop (g186) @ con_174'46 (g195)
  mov bp, 386
  mov dx, 395
  mov ax, [bp]
  jmp [ax]

L180: ; Continuation
  push cx
  push #L179
  mov cx, sp
  ;; (174'17) Tail: put_chars (g15) @ app_72'28 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L181: ; Continuation
  push cx
  push #L180
  mov cx, sp
  ;; (72'28) Tail: app_72'25 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L182: ; Arm: 173'47
  push [bp+2]
  push cx
  push #L181
  mov cx, sp
  ;; (72'25) Tail: revloop (g9) @ con_72'25 (g193)
  mov bp, 109
  mov dx, 393
  mov ax, [bp]
  jmp [ax]

L183: ; Continuation
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L178
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L182
  crash

L184: ; Continuation
  push [bp+2]
  push cx
  push #L183
  mov cx, sp
  ;; (60'44) Tail: app_60'41 (arg) @ con_0'0 (g191)
  mov bp, dx
  mov dx, 391
  mov ax, [bp]
  jmp [ax]

L185: ; Continuation
  push [bp+2]
  push cx
  push #L184
  mov cx, sp
  ;; (60'41) Tail: app_60'33 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L186: ; Continuation
  push dx
  push cx
  push #L185
  mov cx, sp
  ;; (60'33) Tail: eq_list (g3) @ lam_0'0 (g188)
  mov bp, 103
  mov dx, 388
  mov ax, [bp]
  jmp [ax]

L187: ; Function: g186
  push cx
  push #L186
  mov cx, sp
  ;; (121'28) Tail: readloop (g23) @ con_121'28 (g187)
  mov bp, 123
  mov dx, 387
  mov ax, [bp]
  jmp [ax]

L188: ; Arm: 186'52
  ;; (0'0) Return: lit_186'57 (g198)
  mov dx, 398
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L189: ; Arm: 186'61
  ;; (186'30) Return: c (arg)
  mov dx, dx
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L190: ; Function: g199
  mov ax, dx
  cmp ax, 397
  call bios_make_bool_from_z
  mov 201, ax
  mov ax, 201
  mov ax, [ax]
  cmp ax, #1
  bz L188
  mov ax, 201
  mov ax, [ax]
  cmp ax, #0
  bz L189
  crash

L191: ; Arm: 88'13
  ;; (87'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L192: ; Continuation
  mov ax, [bp+2]
  div ax, 406
  mov 201, ax
  ;; (89'45) Tail: app_89'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L193: ; Arm: 88'22
  mov ax, dx
  mod ax, 404
  mov 202, ax
  mov ax, 405
  add ax, 202
  mov 203, ax
  mov ax, 203
  call bios_num_to_char
  mov 204, ax
  push [bp+1]
  push 204
  push #1
  mov 205, sp
  push dx
  push cx
  push #L192
  mov cx, sp
  ;; (89'11) Tail: loop (g202) @ con_0'0 (t5)
  mov bp, 402
  mov dx, 205
  mov ax, [bp]
  jmp [ax]

L194: ; Function: t1
  mov ax, dx
  cmp ax, 403
  call bios_make_bool_from_z
  mov 201, ax
  mov ax, 201
  mov ax, [ax]
  cmp ax, #1
  bz L191
  mov ax, 201
  mov ax, [ax]
  cmp ax, #0
  bz L193
  crash

L195: ; Function: g202
  push dx
  push #L194
  mov 201, sp
  ;; (0'0) Return: lam_87'19 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L196: ; Arm: 218'37
  ;; (0'0) Return: con_218'42 (g82)
  mov dx, 182
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L197: ; Continuation
  ;; (219'26) Tail: mainloop (f2) @ con_219'26 (g214)
  mov bp, [bp+2]
  mov dx, 414
  mov ax, [bp]
  jmp [ax]

L198: ; Arm: 208'7
  ;; (0'0) Return: con_208'10 (g85)
  mov dx, 185
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L199: ; Continuation
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L200: ; Function: t1
  push cx
  push #L199
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L201: ; Continuation
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L202: ; Function: t1
  push cx
  push #L201
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L203: ; Continuation
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L204: ; Function: t1
  push cx
  push #L203
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L205: ; Continuation
  mov ax, 191
  call bios_put_char
  mov 201, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L206: ; Continuation
  push cx
  push #L205
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_136'16 (g90)
  mov bp, dx
  mov dx, 190
  mov ax, [bp]
  jmp [ax]

L207: ; Continuation
  push [bp+2]
  push #L204
  mov 201, sp
  push cx
  push #L206
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L208: ; Continuation
  push [bp+2]
  push cx
  push #L207
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_131'25 (g89)
  mov bp, dx
  mov dx, 189
  mov ax, [bp]
  jmp [ax]

L209: ; Arm: 136'7
  push [bp+2]
  push #L202
  mov 201, sp
  push [bp+2]
  push cx
  push #L208
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L210: ; Continuation
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L211: ; Function: t5
  push cx
  push #L210
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L212: ; Continuation
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L213: ; Function: t1
  push cx
  push #L212
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L214: ; Continuation
  mov ax, 194
  call bios_put_char
  mov 201, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L215: ; Continuation
  push cx
  push #L214
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_139'21 (g93)
  mov bp, dx
  mov dx, 193
  mov ax, [bp]
  jmp [ax]

L216: ; Continuation
  push [bp+2]
  push #L213
  mov 201, sp
  push cx
  push #L215
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L217: ; Continuation
  push [bp+2]
  push cx
  push #L216
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_131'25 (g92)
  mov bp, dx
  mov dx, 192
  mov ax, [bp]
  jmp [ax]

L218: ; Arm: 139'12
  mov ax, 202
  mov ax, [ax+1]
  mov 203, ax
  mov ax, 202
  mov ax, [ax+2]
  mov 204, ax
  push [bp+2]
  push #L211
  mov 205, sp
  push [bp+2]
  push cx
  push #L217
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t5)
  mov bp, 101
  mov dx, 205
  mov ax, [bp]
  jmp [ax]

L219: ; Continuation
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L220: ; Function: t1
  push cx
  push #L219
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L221: ; Continuation
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L222: ; Function: t1
  push cx
  push #L221
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L223: ; Continuation
  mov ax, 310
  call bios_put_char
  mov 201, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L224: ; Continuation
  push cx
  push #L223
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_142'24 (g109)
  mov bp, dx
  mov dx, 309
  mov ax, [bp]
  jmp [ax]

L225: ; Continuation
  push [bp+2]
  push #L222
  mov 201, sp
  push cx
  push #L224
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L226: ; Continuation
  push [bp+2]
  push cx
  push #L225
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_131'25 (g108)
  mov bp, dx
  mov dx, 308
  mov ax, [bp]
  jmp [ax]

L227: ; Arm: 142'15
  push [bp+2]
  push #L220
  mov 201, sp
  push [bp+2]
  push cx
  push #L226
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L228: ; Continuation
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L229: ; Function: t1
  push cx
  push #L228
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L230: ; Continuation
  mov ax, 332
  call bios_put_char
  mov 201, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L231: ; Continuation
  push cx
  push #L230
  mov cx, sp
  ;; (100'26) Tail: put_chars (g15) @ case_91'2 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L232: ; Arm: 91'11
  ;; (0'0) Return: con_0'0 (g130)
  mov dx, 330
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L233: ; Continuation
  ;; (91'41) Tail: app_91'38 (arg) @ res (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L234: ; Arm: 91'28
  push [bp+2]
  push cx
  push #L233
  mov cx, sp
  ;; (91'38) Tail: loop (g122) @ con_91'38 (g131)
  mov bp, 322
  mov dx, 331
  mov ax, [bp]
  jmp [ax]

L235: ; Continuation
  mov ax, [bp+2]
  cmp ax, 327
  call bios_make_bool_from_z
  mov 201, ax
  push cx
  push #L231
  mov cx, sp
  mov ax, 201
  mov ax, [ax]
  cmp ax, #1
  bz L232
  mov ax, 201
  mov ax, [ax]
  cmp ax, #0
  bz L234
  crash

L236: ; Continuation
  push [bp+2]
  push cx
  push #L235
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_146'22 (g121)
  mov bp, dx
  mov dx, 321
  mov ax, [bp]
  jmp [ax]

L237: ; Continuation
  push [bp+2]
  push #L229
  mov 201, sp
  push [bp+3]
  push cx
  push #L236
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L238: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L237
  mov cx, sp
  ;; (100'26) Tail: put_chars (g15) @ case_91'2 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L239: ; Arm: 91'11
  ;; (0'0) Return: con_0'0 (g119)
  mov dx, 319
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L240: ; Continuation
  ;; (91'41) Tail: app_91'38 (arg) @ n (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L241: ; Arm: 91'28
  push [bp+3]
  push cx
  push #L240
  mov cx, sp
  ;; (91'38) Tail: loop (g111) @ con_91'38 (g120)
  mov bp, 311
  mov dx, 320
  mov ax, [bp]
  jmp [ax]

L242: ; Continuation
  mov ax, [bp+3]
  cmp ax, 316
  call bios_make_bool_from_z
  mov 201, ax
  push dx
  push [bp+2]
  push cx
  push #L238
  mov cx, sp
  mov ax, 201
  mov ax, [ax]
  cmp ax, #1
  bz L239
  mov ax, 201
  mov ax, [ax]
  cmp ax, #0
  bz L241
  crash

L243: ; Arm: 143'17
  mov ax, dx
  mov ax, [ax+1]
  mov 201, ax
  push 201
  push [bp+2]
  push cx
  push #L242
  mov cx, sp
  ;; (144'25) Tail: fib (g56) @ n (t1)
  mov bp, 156
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L244: ; Continuation
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L227
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L243
  crash

L245: ; Continuation
  push [bp+2]
  push cx
  push #L244
  mov cx, sp
  ;; (47'9) Tail: app_47'7 (arg) @ arg1 (f3)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+3]
  mov ax, [bp]
  jmp [ax]

L246: ; Arm: 140'10
  push 201
  push [bp+2]
  push cx
  push #L245
  mov cx, sp
  ;; (47'7) Tail: loop (g95) @ lit_47'7 (g107)
  mov bp, 195
  mov dx, 307
  mov ax, [bp]
  jmp [ax]

L247: ; Arm: 137'15
  mov ax, [bp+3]
  mov ax, [ax+1]
  mov 201, ax
  mov ax, [bp+3]
  mov ax, [ax+2]
  mov 202, ax
  mov ax, 202
  mov ax, [ax]
  cmp ax, #1
  bz L218
  mov ax, 202
  mov ax, [ax]
  cmp ax, #0
  bz L246
  crash

L248: ; Continuation
  mov ax, [bp+3]
  mov ax, [ax]
  cmp ax, #0
  bz L209
  mov ax, [bp+3]
  mov ax, [ax]
  cmp ax, #1
  bz L247
  crash

L249: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L248
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_134'13 (g88)
  mov bp, dx
  mov dx, 188
  mov ax, [bp]
  jmp [ax]

L250: ; Arm: 210'45
  push [bp+2]
  push #L200
  mov 201, sp
  push [bp+5]
  push [bp+2]
  push cx
  push #L249
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L251: ; Continuation
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L252: ; Function: t1
  push cx
  push #L251
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L253: ; Continuation
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L254: ; Function: t1
  push cx
  push #L253
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L255: ; Continuation
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L256: ; Function: t1
  push cx
  push #L255
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L257: ; Continuation
  mov ax, 338
  call bios_put_char
  mov 201, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L258: ; Continuation
  push cx
  push #L257
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_153'16 (g137)
  mov bp, dx
  mov dx, 337
  mov ax, [bp]
  jmp [ax]

L259: ; Continuation
  push [bp+2]
  push #L256
  mov 201, sp
  push cx
  push #L258
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L260: ; Continuation
  push [bp+2]
  push cx
  push #L259
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_131'25 (g136)
  mov bp, dx
  mov dx, 336
  mov ax, [bp]
  jmp [ax]

L261: ; Arm: 153'7
  push [bp+2]
  push #L254
  mov 201, sp
  push [bp+2]
  push cx
  push #L260
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L262: ; Continuation
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L263: ; Function: t5
  push cx
  push #L262
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L264: ; Continuation
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L265: ; Function: t1
  push cx
  push #L264
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L266: ; Continuation
  mov ax, 341
  call bios_put_char
  mov 201, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L267: ; Continuation
  push cx
  push #L266
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_156'21 (g140)
  mov bp, dx
  mov dx, 340
  mov ax, [bp]
  jmp [ax]

L268: ; Continuation
  push [bp+2]
  push #L265
  mov 201, sp
  push cx
  push #L267
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L269: ; Continuation
  push [bp+2]
  push cx
  push #L268
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_131'25 (g139)
  mov bp, dx
  mov dx, 339
  mov ax, [bp]
  jmp [ax]

L270: ; Arm: 156'12
  mov ax, 202
  mov ax, [ax+1]
  mov 203, ax
  mov ax, 202
  mov ax, [ax+2]
  mov 204, ax
  push [bp+2]
  push #L263
  mov 205, sp
  push [bp+2]
  push cx
  push #L269
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t5)
  mov bp, 101
  mov dx, 205
  mov ax, [bp]
  jmp [ax]

L271: ; Continuation
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L272: ; Function: t1
  push cx
  push #L271
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L273: ; Continuation
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L274: ; Function: t1
  push cx
  push #L273
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L275: ; Continuation
  mov ax, 357
  call bios_put_char
  mov 201, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L276: ; Continuation
  push cx
  push #L275
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_159'24 (g156)
  mov bp, dx
  mov dx, 356
  mov ax, [bp]
  jmp [ax]

L277: ; Continuation
  push [bp+2]
  push #L274
  mov 201, sp
  push cx
  push #L276
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L278: ; Continuation
  push [bp+2]
  push cx
  push #L277
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_131'25 (g155)
  mov bp, dx
  mov dx, 355
  mov ax, [bp]
  jmp [ax]

L279: ; Arm: 159'15
  push [bp+2]
  push #L272
  mov 201, sp
  push [bp+2]
  push cx
  push #L278
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L280: ; Continuation
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L281: ; Function: t1
  push cx
  push #L280
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L282: ; Continuation
  mov ax, 379
  call bios_put_char
  mov 201, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L283: ; Continuation
  push cx
  push #L282
  mov cx, sp
  ;; (100'26) Tail: put_chars (g15) @ case_91'2 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L284: ; Arm: 91'11
  ;; (0'0) Return: con_0'0 (g177)
  mov dx, 377
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L285: ; Continuation
  ;; (91'41) Tail: app_91'38 (arg) @ res (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L286: ; Arm: 91'28
  push [bp+2]
  push cx
  push #L285
  mov cx, sp
  ;; (91'38) Tail: loop (g169) @ con_91'38 (g178)
  mov bp, 369
  mov dx, 378
  mov ax, [bp]
  jmp [ax]

L287: ; Continuation
  mov ax, [bp+2]
  cmp ax, 374
  call bios_make_bool_from_z
  mov 201, ax
  push cx
  push #L283
  mov cx, sp
  mov ax, 201
  mov ax, [ax]
  cmp ax, #1
  bz L284
  mov ax, 201
  mov ax, [ax]
  cmp ax, #0
  bz L286
  crash

L288: ; Continuation
  push [bp+2]
  push cx
  push #L287
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_163'22 (g168)
  mov bp, dx
  mov dx, 368
  mov ax, [bp]
  jmp [ax]

L289: ; Continuation
  push [bp+2]
  push #L281
  mov 201, sp
  push [bp+3]
  push cx
  push #L288
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L290: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L289
  mov cx, sp
  ;; (100'26) Tail: put_chars (g15) @ case_91'2 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L291: ; Arm: 91'11
  ;; (0'0) Return: con_0'0 (g166)
  mov dx, 366
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L292: ; Continuation
  ;; (91'41) Tail: app_91'38 (arg) @ n (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L293: ; Arm: 91'28
  push [bp+3]
  push cx
  push #L292
  mov cx, sp
  ;; (91'38) Tail: loop (g158) @ con_91'38 (g167)
  mov bp, 358
  mov dx, 367
  mov ax, [bp]
  jmp [ax]

L294: ; Continuation
  mov ax, [bp+3]
  cmp ax, 363
  call bios_make_bool_from_z
  mov 201, ax
  push dx
  push [bp+2]
  push cx
  push #L290
  mov cx, sp
  mov ax, 201
  mov ax, [ax]
  cmp ax, #1
  bz L291
  mov ax, 201
  mov ax, [ax]
  cmp ax, #0
  bz L293
  crash

L295: ; Arm: 160'17
  mov ax, dx
  mov ax, [ax+1]
  mov 201, ax
  push 201
  push [bp+2]
  push cx
  push #L294
  mov cx, sp
  ;; (161'26) Tail: fact (g60) @ n (t1)
  mov bp, 160
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L296: ; Continuation
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L279
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L295
  crash

L297: ; Continuation
  push [bp+2]
  push cx
  push #L296
  mov cx, sp
  ;; (47'9) Tail: app_47'7 (arg) @ arg1 (f3)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+3]
  mov ax, [bp]
  jmp [ax]

L298: ; Arm: 157'10
  push 201
  push [bp+2]
  push cx
  push #L297
  mov cx, sp
  ;; (47'7) Tail: loop (g142) @ lit_47'7 (g154)
  mov bp, 342
  mov dx, 354
  mov ax, [bp]
  jmp [ax]

L299: ; Arm: 154'15
  mov ax, [bp+3]
  mov ax, [ax+1]
  mov 201, ax
  mov ax, [bp+3]
  mov ax, [ax+2]
  mov 202, ax
  mov ax, 202
  mov ax, [ax]
  cmp ax, #1
  bz L270
  mov ax, 202
  mov ax, [ax]
  cmp ax, #0
  bz L298
  crash

L300: ; Continuation
  mov ax, [bp+3]
  mov ax, [ax]
  cmp ax, #0
  bz L261
  mov ax, [bp+3]
  mov ax, [ax]
  cmp ax, #1
  bz L299
  crash

L301: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L300
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_151'13 (g135)
  mov bp, dx
  mov dx, 335
  mov ax, [bp]
  jmp [ax]

L302: ; Arm: 211'48
  push [bp+2]
  push #L252
  mov 201, sp
  push [bp+5]
  push [bp+2]
  push cx
  push #L301
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L303: ; Continuation
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L304: ; Function: t3
  push cx
  push #L303
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L305: ; Continuation
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L306: ; Function: t1
  push cx
  push #L305
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L307: ; Continuation
  mov ax, 384
  call bios_put_char
  mov 201, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L308: ; Continuation
  push cx
  push #L307
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_180'18 (g183)
  mov bp, dx
  mov dx, 383
  mov ax, [bp]
  jmp [ax]

L309: ; Continuation
  push [bp+2]
  push #L306
  mov 201, sp
  push cx
  push #L308
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L310: ; Continuation
  push [bp+2]
  push cx
  push #L309
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_131'25 (g182)
  mov bp, dx
  mov dx, 382
  mov ax, [bp]
  jmp [ax]

L311: ; Arm: 180'9
  mov ax, [bp+4]
  mov ax, [ax+1]
  mov 201, ax
  mov ax, [bp+4]
  mov ax, [ax+2]
  mov 202, ax
  push [bp+2]
  push #L304
  mov 203, sp
  push [bp+2]
  push cx
  push #L310
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t3)
  mov bp, 101
  mov dx, 203
  mov ax, [bp]
  jmp [ax]

L312: ; Continuation
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L313: ; Function: t1
  push cx
  push #L312
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L314: ; Continuation
  ;; (176'6) Tail: loop (g186) @ con_176'6 (g196)
  mov bp, 386
  mov dx, 396
  mov ax, [bp]
  jmp [ax]

L315: ; Continuation
  push cx
  push #L314
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_182'16 (g185)
  mov bp, dx
  mov dx, 385
  mov ax, [bp]
  jmp [ax]

L316: ; Arm: 181'7
  push [bp+2]
  push #L313
  mov 201, sp
  push cx
  push #L315
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L317: ; Arm: 212'49
  mov ax, [bp+4]
  mov ax, [ax]
  cmp ax, #1
  bz L311
  mov ax, [bp+4]
  mov ax, [ax]
  cmp ax, #0
  bz L316
  crash

L318: ; Continuation
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L319: ; Function: t1
  push cx
  push #L318
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L320: ; Continuation
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L321: ; Function: t1
  push cx
  push #L320
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L322: ; Continuation
  mov ax, 413
  call bios_put_char
  mov 201, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L323: ; Continuation
  push cx
  push #L322
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_191'13 (g212)
  mov bp, dx
  mov dx, 412
  mov ax, [bp]
  jmp [ax]

L324: ; Continuation
  push [bp+2]
  push #L321
  mov 201, sp
  push cx
  push #L323
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L325: ; Continuation
  push [bp+2]
  push cx
  push #L324
  mov cx, sp
  ;; (100'26) Tail: put_chars (g15) @ case_91'2 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L326: ; Arm: 91'11
  ;; (0'0) Return: con_0'0 (g210)
  mov dx, 410
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L327: ; Continuation
  ;; (91'41) Tail: app_91'38 (arg) @ n (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L328: ; Arm: 91'28
  push [bp+3]
  push cx
  push #L327
  mov cx, sp
  ;; (91'38) Tail: loop (g202) @ con_91'38 (g211)
  mov bp, 402
  mov dx, 411
  mov ax, [bp]
  jmp [ax]

L329: ; Continuation
  mov ax, [bp+3]
  cmp ax, 407
  call bios_make_bool_from_z
  mov 201, ax
  push [bp+2]
  push cx
  push #L325
  mov cx, sp
  mov ax, 201
  mov ax, [ax]
  cmp ax, #1
  bz L326
  mov ax, 201
  mov ax, [ax]
  cmp ax, #0
  bz L328
  crash

L330: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L329
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_189'13 (g201)
  mov bp, dx
  mov dx, 401
  mov ax, [bp]
  jmp [ax]

L331: ; Continuation
  push [bp+2]
  push #L319
  mov 201, sp
  push [bp+3]
  push [bp+2]
  push cx
  push #L330
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L332: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L331
  mov cx, sp
  ;; (188'12) Tail: put_chars (g15) @ app_188'46 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L333: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L332
  mov cx, sp
  ;; (188'46) Tail: app_188'20 (f4) @ app_188'60 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L334: ; Continuation
  push dx
  push [bp+5]
  push [bp+2]
  push cx
  push #L333
  mov cx, sp
  ;; (188'60) Tail: star_the_ohs (f4) @ xs (f3)
  mov dx, [bp+3]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp [ax]

L335: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L334
  mov cx, sp
  ;; (188'20) Tail: append (g8) @ app_188'29 (arg)
  mov bp, 108
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L336: ; Continuation
  push dx
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L335
  mov cx, sp
  ;; (188'29) Tail: explode (f2) @ lit_188'29 (g200)
  mov bp, [bp+2]
  mov dx, 400
  mov ax, [bp]
  jmp [ax]

L337: ; Continuation
  push dx
  push [bp+3]
  push [bp+2]
  push cx
  push #L336
  mov cx, sp
  ;; (187'17) Tail: length (g12) @ xs (f3)
  mov dx, [bp+3]
  mov bp, 112
  mov ax, [bp]
  jmp [ax]

L338: ; Arm: 212'66
  push [bp+3]
  push [bp+2]
  push cx
  push #L337
  mov cx, sp
  ;; (186'25) Tail: map (g10) @ lam_186'30 (g199)
  mov bp, 110
  mov dx, 399
  mov ax, [bp]
  jmp [ax]

L339: ; Continuation
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L317
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L338
  crash

L340: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L339
  mov cx, sp
  ;; (60'44) Tail: app_60'41 (arg) @ ys (f5)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+5]
  mov ax, [bp]
  jmp [ax]

L341: ; Continuation
  push [bp+6]
  push [bp+5]
  push [bp+3]
  push [bp+2]
  push cx
  push #L340
  mov cx, sp
  ;; (60'41) Tail: app_60'33 (arg) @ command (f4)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+4]
  mov ax, [bp]
  jmp [ax]

L342: ; Continuation
  push dx
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L341
  mov cx, sp
  ;; (60'33) Tail: eq_list (g3) @ lam_0'0 (g181)
  mov bp, 103
  mov dx, 381
  mov ax, [bp]
  jmp [ax]

L343: ; Arm: 211'66
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L342
  mov cx, sp
  ;; (212'42) Tail: explode (f2) @ lit_212'42 (g180)
  mov bp, [bp+2]
  mov dx, 380
  mov ax, [bp]
  jmp [ax]

L344: ; Continuation
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L302
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L343
  crash

L345: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L344
  mov cx, sp
  ;; (60'44) Tail: app_60'41 (arg) @ ys (f6)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+6]
  mov ax, [bp]
  jmp [ax]

L346: ; Continuation
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L345
  mov cx, sp
  ;; (60'41) Tail: app_60'33 (arg) @ command (f4)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+4]
  mov ax, [bp]
  jmp [ax]

L347: ; Continuation
  push dx
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L346
  mov cx, sp
  ;; (60'33) Tail: eq_list (g3) @ lam_0'0 (g134)
  mov bp, 103
  mov dx, 334
  mov ax, [bp]
  jmp [ax]

L348: ; Arm: 210'62
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L347
  mov cx, sp
  ;; (211'40) Tail: explode (f2) @ lit_211'40 (g133)
  mov bp, [bp+2]
  mov dx, 333
  mov ax, [bp]
  jmp [ax]

L349: ; Continuation
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L250
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L348
  crash

L350: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L349
  mov cx, sp
  ;; (60'44) Tail: app_60'41 (arg) @ ys (f6)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+6]
  mov ax, [bp]
  jmp [ax]

L351: ; Continuation
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L350
  mov cx, sp
  ;; (60'41) Tail: app_60'33 (arg) @ command (f4)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+4]
  mov ax, [bp]
  jmp [ax]

L352: ; Continuation
  push dx
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L351
  mov cx, sp
  ;; (60'33) Tail: eq_list (g3) @ lam_0'0 (g87)
  mov bp, 103
  mov dx, 187
  mov ax, [bp]
  jmp [ax]

L353: ; Arm: 209'18
  mov ax, dx
  mov ax, [ax+1]
  mov 201, ax
  mov ax, dx
  mov ax, [ax+2]
  mov 202, ax
  push 202
  push 201
  push [bp+4]
  push [bp+2]
  push cx
  push #L352
  mov cx, sp
  ;; (210'38) Tail: explode (f2) @ lit_210'38 (g86)
  mov bp, [bp+2]
  mov dx, 186
  mov ax, [bp]
  jmp [ax]

L354: ; Continuation
  push [bp+3]
  push cx
  push #L197
  mov cx, sp
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L198
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L353
  crash

L355: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L354
  mov cx, sp
  ;; (203'18) Tail: app_203'15 (arg) @ xs (f4)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+4]
  mov ax, [bp]
  jmp [ax]

L356: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L355
  mov cx, sp
  ;; (203'15) Tail: app_203'12 (arg) @ con_203'15 (g84)
  mov bp, dx
  mov dx, 184
  mov ax, [bp]
  jmp [ax]

L357: ; Arm: 218'45
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L356
  mov cx, sp
  ;; (203'12) Tail: splitloop (g66) @ con_203'12 (g83)
  mov bp, 166
  mov dx, 183
  mov ax, [bp]
  jmp [ax]

L358: ; Continuation
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L196
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L357
  crash

L359: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L358
  mov cx, sp
  ;; (60'44) Tail: app_60'41 (arg) @ con_0'0 (g81)
  mov bp, dx
  mov dx, 181
  mov ax, [bp]
  jmp [ax]

L360: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L359
  mov cx, sp
  ;; (60'41) Tail: app_60'33 (arg) @ xs (f4)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+4]
  mov ax, [bp]
  jmp [ax]

L361: ; Continuation
  push dx
  push [bp+3]
  push [bp+2]
  push cx
  push #L360
  mov cx, sp
  ;; (60'33) Tail: eq_list (g3) @ lam_0'0 (g78)
  mov bp, 103
  mov dx, 178
  mov ax, [bp]
  jmp [ax]

L362: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L361
  mov cx, sp
  ;; (121'28) Tail: readloop (g23) @ con_121'28 (g77)
  mov bp, 123
  mov dx, 177
  mov ax, [bp]
  jmp [ax]

L363: ; Function: t1
  push bp
  push [bp+1]
  push cx
  push #L362
  mov cx, sp
  ;; (216'12) Tail: put_chars (g15) @ con_216'13 (g76)
  mov bp, 115
  mov dx, 176
  mov ax, [bp]
  jmp [ax]

L364: ; Continuation
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L365: ; Function: t2
  push cx
  push #L364
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L366: ; Continuation
  ;; (223'11) Tail: mainloop (f2) @ con_223'11 (g216)
  mov bp, [bp+2]
  mov dx, 416
  mov ax, [bp]
  jmp [ax]

L367: ; Continuation
  push [bp+2]
  push cx
  push #L366
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_222'13 (g215)
  mov bp, dx
  mov dx, 415
  mov ax, [bp]
  jmp [ax]

L368: ; Continuation
  push dx
  push #L363
  mov 201, sp
  push dx
  push #L365
  mov 202, sp
  push 201
  push cx
  push #L367
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t2)
  mov bp, 101
  mov dx, 202
  mov ax, [bp]
  jmp [ax]

L369: ; Start
  push #L2
  mov 101, sp
  push #L3
  mov 102, sp
  push #1
  mov 104, sp
  push #0
  mov 105, sp
  push #0
  mov 106, sp
  push #0
  mov 107, sp
  push #L18
  mov 103, sp
  push #L24
  mov 108, sp
  push #L29
  mov 109, sp
  push #0
  mov 111, sp
  push #L36
  mov 110, sp
  mov ax, #0
  mov 113, ax
  mov ax, #1
  mov 114, ax
  push #L40
  mov 112, sp
  push #0
  mov 116, sp
  mov ax, #8
  mov 117, ax
  mov ax, #'\n'
  mov 118, ax
  mov ax, #26
  mov 119, ax
  mov ax, #'^'
  mov 120, ax
  mov ax, #65
  mov 121, ax
  mov ax, #1
  mov 122, ax
  push #L50
  mov 115, sp
  push #0
  mov 124, sp
  mov ax, #'\n'
  mov 125, ax
  mov ax, #'\n'
  mov 126, ax
  push #0
  mov 127, sp
  mov ax, #'\EOT'
  mov 128, ax
  mov ax, #8
  mov 129, ax
  mov ax, #'\n'
  mov 130, ax
  mov ax, #26
  mov 131, ax
  mov ax, #'^'
  mov 132, ax
  mov ax, #65
  mov 133, ax
  mov ax, #1
  mov 134, ax
  mov ax, #'\n'
  mov 135, ax
  push #0
  mov 136, sp
  mov ax, #'\EOT'
  mov 137, ax
  mov ax, #127
  mov 138, ax
  mov ax, #127
  mov 139, ax
  mov ax, #26
  mov 140, ax
  push #0
  mov 141, sp
  push #1
  mov 142, sp
  mov ax, #'\b'
  mov 143, ax
  mov ax, #' '
  mov 144, ax
  mov ax, #'\b'
  mov 145, ax
  push #0
  mov 146, sp
  mov ax, #'\b'
  mov 147, ax
  mov ax, #' '
  mov 148, ax
  mov ax, #'\b'
  mov 149, ax
  mov ax, #8
  mov 150, ax
  mov ax, #'\n'
  mov 151, ax
  mov ax, #26
  mov 152, ax
  mov ax, #'^'
  mov 153, ax
  mov ax, #65
  mov 154, ax
  mov ax, #1
  mov 155, ax
  push #L83
  mov 123, sp
  mov ax, #2
  mov 157, ax
  mov ax, #1
  mov 158, ax
  mov ax, #2
  mov 159, ax
  push #L88
  mov 156, sp
  mov ax, #2
  mov 161, ax
  push #0
  mov 162, sp
  push #1
  mov 163, sp
  mov ax, #1
  mov 164, ax
  mov ax, #1
  mov 165, ax
  push #L95
  mov 160, sp
  push #0
  mov 167, sp
  push #0
  mov 168, sp
  mov ax, #' '
  mov 169, ax
  push #0
  mov 170, sp
  push #0
  mov 171, sp
  push #L111
  mov 166, sp
  mov ax, #'>'
  mov 172, ax
  mov ax, #' '
  mov 173, ax
  push #0
  mov 174, sp
  push 174
  push 173
  push #1
  mov 175, sp
  push 175
  push 172
  push #1
  mov 176, sp
  push #0
  mov 177, sp
  push #L113
  mov 178, sp
  mov ax, #'\EOT'
  mov 179, ax
  push #0
  mov 180, sp
  push 180
  push 179
  push #1
  mov 181, sp
  push #0
  mov 182, sp
  push #0
  mov 183, sp
  push #0
  mov 184, sp
  push #0
  mov 185, sp
  push #0
  push sp
  push #'b'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'f'
  push #1
  mov ax, sp
  mov 186, ax
  push #L115
  mov 187, sp
  push #0
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  push sp
  push #'b'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'f'
  push #1
  mov ax, sp
  mov 188, ax
  push #0
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  push sp
  push #'R'
  push #1
  push sp
  push #'O'
  push #1
  push sp
  push #'R'
  push #1
  push sp
  push #'R'
  push #1
  push sp
  push #'E'
  push #1
  mov ax, sp
  mov 189, ax
  push #0
  push sp
  push #'t'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #'u'
  push #1
  push sp
  push #'g'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'c'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'p'
  push #1
  push sp
  push #'x'
  push #1
  push sp
  push #'e'
  push #1
  mov ax, sp
  mov 190, ax
  mov ax, #'\n'
  mov 191, ax
  push #0
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  push sp
  push #'R'
  push #1
  push sp
  push #'O'
  push #1
  push sp
  push #'R'
  push #1
  push sp
  push #'R'
  push #1
  push sp
  push #'E'
  push #1
  mov ax, sp
  mov 192, ax
  push #0
  push sp
  push #'t'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #'u'
  push #1
  push sp
  push #'g'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'y'
  push #1
  push sp
  push #'l'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'c'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'x'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'c'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'p'
  push #1
  push sp
  push #'x'
  push #1
  push sp
  push #'e'
  push #1
  mov ax, sp
  mov 193, ax
  mov ax, #'\n'
  mov 194, ax
  mov ax, #48
  mov 196, ax
  mov ax, #0
  mov 197, ax
  push #0
  mov 198, sp
  push #1
  mov 199, sp
  mov ax, #9
  mov 300, ax
  push #0
  mov 301, sp
  push #1
  mov 302, sp
  push #1
  mov 303, sp
  push #1
  mov 304, sp
  push #1
  mov 305, sp
  mov ax, #10
  mov 306, ax
  push #L133
  mov 195, sp
  mov ax, #0
  mov 307, ax
  push #0
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  push sp
  push #'R'
  push #1
  push sp
  push #'O'
  push #1
  push sp
  push #'R'
  push #1
  push sp
  push #'R'
  push #1
  push sp
  push #'E'
  push #1
  mov ax, sp
  mov 308, ax
  push #0
  push sp
  push #'c'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #'u'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'b'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'1'
  push #1
  push sp
  push #'g'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'c'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'p'
  push #1
  push sp
  push #'x'
  push #1
  push sp
  push #'e'
  push #1
  mov ax, sp
  mov 309, ax
  mov ax, #'\n'
  mov 310, ax
  mov ax, #0
  mov 312, ax
  mov ax, #10
  mov 313, ax
  mov ax, #48
  mov 314, ax
  mov ax, #10
  mov 315, ax
  push #L138
  mov 311, sp
  mov ax, #0
  mov 316, ax
  mov ax, #'0'
  mov 317, ax
  push #0
  mov 318, sp
  push 318
  push 317
  push #1
  mov 319, sp
  push #0
  mov 320, sp
  push #0
  push sp
  push #' '
  push #1
  push sp
  push #'>'
  push #1
  push sp
  push #'-'
  push #1
  push sp
  push #'-'
  push #1
  push sp
  push #' '
  push #1
  mov ax, sp
  mov 321, ax
  mov ax, #0
  mov 323, ax
  mov ax, #10
  mov 324, ax
  mov ax, #48
  mov 325, ax
  mov ax, #10
  mov 326, ax
  push #L143
  mov 322, sp
  mov ax, #0
  mov 327, ax
  mov ax, #'0'
  mov 328, ax
  push #0
  mov 329, sp
  push 329
  push 328
  push #1
  mov 330, sp
  push #0
  mov 331, sp
  mov ax, #'\n'
  mov 332, ax
  push #0
  push sp
  push #'t'
  push #1
  push sp
  push #'c'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'f'
  push #1
  mov ax, sp
  mov 333, ax
  push #L145
  mov 334, sp
  push #0
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'c'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'f'
  push #1
  mov ax, sp
  mov 335, ax
  push #0
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  push sp
  push #'R'
  push #1
  push sp
  push #'O'
  push #1
  push sp
  push #'R'
  push #1
  push sp
  push #'R'
  push #1
  push sp
  push #'E'
  push #1
  mov ax, sp
  mov 336, ax
  push #0
  push sp
  push #'t'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #'u'
  push #1
  push sp
  push #'g'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'c'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'p'
  push #1
  push sp
  push #'x'
  push #1
  push sp
  push #'e'
  push #1
  mov ax, sp
  mov 337, ax
  mov ax, #'\n'
  mov 338, ax
  push #0
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  push sp
  push #'R'
  push #1
  push sp
  push #'O'
  push #1
  push sp
  push #'R'
  push #1
  push sp
  push #'R'
  push #1
  push sp
  push #'E'
  push #1
  mov ax, sp
  mov 339, ax
  push #0
  push sp
  push #'t'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #'u'
  push #1
  push sp
  push #'g'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'y'
  push #1
  push sp
  push #'l'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'c'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'x'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'c'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'p'
  push #1
  push sp
  push #'x'
  push #1
  push sp
  push #'e'
  push #1
  mov ax, sp
  mov 340, ax
  mov ax, #'\n'
  mov 341, ax
  mov ax, #48
  mov 343, ax
  mov ax, #0
  mov 344, ax
  push #0
  mov 345, sp
  push #1
  mov 346, sp
  mov ax, #9
  mov 347, ax
  push #0
  mov 348, sp
  push #1
  mov 349, sp
  push #1
  mov 350, sp
  push #1
  mov 351, sp
  push #1
  mov 352, sp
  mov ax, #10
  mov 353, ax
  push #L163
  mov 342, sp
  mov ax, #0
  mov 354, ax
  push #0
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  push sp
  push #'R'
  push #1
  push sp
  push #'O'
  push #1
  push sp
  push #'R'
  push #1
  push sp
  push #'R'
  push #1
  push sp
  push #'E'
  push #1
  mov ax, sp
  mov 355, ax
  push #0
  push sp
  push #'c'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #'u'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'b'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'1'
  push #1
  push sp
  push #'g'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'c'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'p'
  push #1
  push sp
  push #'x'
  push #1
  push sp
  push #'e'
  push #1
  mov ax, sp
  mov 356, ax
  mov ax, #'\n'
  mov 357, ax
  mov ax, #0
  mov 359, ax
  mov ax, #10
  mov 360, ax
  mov ax, #48
  mov 361, ax
  mov ax, #10
  mov 362, ax
  push #L168
  mov 358, sp
  mov ax, #0
  mov 363, ax
  mov ax, #'0'
  mov 364, ax
  push #0
  mov 365, sp
  push 365
  push 364
  push #1
  mov 366, sp
  push #0
  mov 367, sp
  push #0
  push sp
  push #' '
  push #1
  push sp
  push #'>'
  push #1
  push sp
  push #'-'
  push #1
  push sp
  push #'-'
  push #1
  push sp
  push #' '
  push #1
  mov ax, sp
  mov 368, ax
  mov ax, #0
  mov 370, ax
  mov ax, #10
  mov 371, ax
  mov ax, #48
  mov 372, ax
  mov ax, #10
  mov 373, ax
  push #L173
  mov 369, sp
  mov ax, #0
  mov 374, ax
  mov ax, #'0'
  mov 375, ax
  push #0
  mov 376, sp
  push 376
  push 375
  push #1
  mov 377, sp
  push #0
  mov 378, sp
  mov ax, #'\n'
  mov 379, ax
  push #0
  push sp
  push #'v'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'r'
  push #1
  mov ax, sp
  mov 380, ax
  push #L175
  mov 381, sp
  push #0
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  push sp
  push #'R'
  push #1
  push sp
  push #'O'
  push #1
  push sp
  push #'R'
  push #1
  push sp
  push #'R'
  push #1
  push sp
  push #'E'
  push #1
  mov ax, sp
  mov 382, ax
  push #0
  push sp
  push #'s'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #'u'
  push #1
  push sp
  push #'g'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'c'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'p'
  push #1
  push sp
  push #'x'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  push sp
  push #'v'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'r'
  push #1
  mov ax, sp
  mov 383, ax
  mov ax, #'\n'
  mov 384, ax
  push #0
  push sp
  push #'\n'
  push #1
  push sp
  push #')'
  push #1
  push sp
  push #'D'
  push #1
  push sp
  push #'^'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'l'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'u'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'l'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'p'
  push #1
  push sp
  push #'y'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'v'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'('
  push #1
  mov ax, sp
  mov 385, ax
  push #0
  mov 387, sp
  push #L177
  mov 388, sp
  mov ax, #'\EOT'
  mov 389, ax
  push #0
  mov 390, sp
  push 390
  push 389
  push #1
  mov 391, sp
  push #0
  mov 392, sp
  push #0
  mov 393, sp
  mov ax, #'\n'
  mov 394, ax
  push #0
  mov 395, sp
  push #L187
  mov 386, sp
  push #0
  mov 396, sp
  mov ax, #'o'
  mov 397, ax
  mov ax, #'*'
  mov 398, ax
  push #L190
  mov 399, sp
  push #0
  push sp
  push #'"'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'w'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'u'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'Y'
  push #1
  mov ax, sp
  mov 400, ax
  push #0
  push sp
  push #'('
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'"'
  push #1
  mov ax, sp
  mov 401, ax
  mov ax, #0
  mov 403, ax
  mov ax, #10
  mov 404, ax
  mov ax, #48
  mov 405, ax
  mov ax, #10
  mov 406, ax
  push #L195
  mov 402, sp
  mov ax, #0
  mov 407, ax
  mov ax, #'0'
  mov 408, ax
  push #0
  mov 409, sp
  push 409
  push 408
  push #1
  mov 410, sp
  push #0
  mov 411, sp
  push #0
  push sp
  push #')'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'h'
  push #1
  push sp
  push #'c'
  push #1
  push sp
  push #' '
  push #1
  mov ax, sp
  mov 412, ax
  mov ax, #'\n'
  mov 413, ax
  push #0
  mov 414, sp
  push #0
  push sp
  push #'\n'
  push #1
  push sp
  push #'v'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #','
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'c'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'f'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #','
  push #1
  push sp
  push #'b'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'f'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  push sp
  push #'y'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'T'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'.'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'p'
  push #1
  push sp
  push #'y'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'p'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'l'
  push #1
  push sp
  push #'l'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'h'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'h'
  push #1
  push sp
  push #'T'
  push #1
  mov ax, sp
  mov 415, ax
  push #0
  mov 416, sp
  push cx
  push #L368
  mov cx, sp
  ;; (4'23) Tail: block (g1) @ lam_0'0 (g2)
  mov bp, 101
  mov dx, 102
  mov ax, [bp]
  jmp [ax]


