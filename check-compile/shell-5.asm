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
  mov 1, sp
  ;; (0'0) Return: lam_2'31 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L3: ; Function: g2
  mov ax, dx
  call bios_explode
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
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

L5: ; Arm: 53'7
  mov bx, dx
  cmp [bx], #0
  bz L4
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  ;; (0'0) Return: con_53'48 (g5)
  mov dx, 105
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L6: ; Arm: 56'10
  ;; (0'0) Return: con_56'13 (g6)
  mov dx, 106
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L7: ; Continuation
  ;; (58'37) Tail: app_58'34 (arg) @ ys (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L8: ; Continuation
  push [bp+3]
  push cx
  push #L7
  mov cx, sp
  ;; (58'34) Tail: app_58'31 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L9: ; Arm: 58'18
  push [bp+4]
  push [bp+3]
  push cx
  push #L8
  mov cx, sp
  ;; (58'31) Tail: eq_list (g3) @ eq (f2)
  mov dx, [bp+2]
  mov bp, 103
  mov ax, [bp]
  jmp [ax]

L10: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L9
  ;; (0'0) Return: con_58'45 (g7)
  mov dx, 107
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L11: ; Continuation
  push [bp+5]
  push [bp+3]
  push [bp+2]
  push cx
  push #L10
  mov cx, sp
  ;; (58'16) Tail: app_58'14 (arg) @ y (f4)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+4]
  mov ax, [bp]
  jmp [ax]

L12: ; Function: t1
  mov bx, [bp+2]
  cmp [bx], #0
  bz L5
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov bx, dx
  cmp [bx], #0
  bz L6
  mov ax, [bx+1]
  mov 3, ax
  mov ax, [bx+2]
  mov 4, ax
  push 4
  push 3
  push 2
  push [bp+1]
  push cx
  push #L11
  mov cx, sp
  ;; (58'14) Tail: eq (f1) @ x (t1)
  mov bp, [bp+1]
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L13: ; Function: t1
  push dx
  push [bp+1]
  push #L12
  mov 1, sp
  ;; (0'0) Return: lam_51'22 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L14: ; Function: g3
  push dx
  push #L13
  mov 1, sp
  ;; (0'0) Return: lam_51'19 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L15: ; Arm: 64'7
  ;; (62'18) Return: ys (arg)
  mov dx, dx
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L16: ; Continuation
  push dx
  push [bp+2]
  push #1
  mov 1, sp
  ;; (0'0) Return: con_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L17: ; Continuation
  push [bp+3]
  push cx
  push #L16
  mov cx, sp
  ;; (65'31) Tail: app_65'28 (arg) @ ys (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L18: ; Function: t1
  mov bx, [bp+1]
  cmp [bx], #0
  bz L15
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push 1
  push dx
  push cx
  push #L17
  mov cx, sp
  ;; (65'28) Tail: append (g8) @ xs (t2)
  mov bp, 108
  mov dx, 2
  mov ax, [bp]
  jmp [ax]

L19: ; Function: g8
  push dx
  push #L18
  mov 1, sp
  ;; (0'0) Return: lam_62'18 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L20: ; Arm: 69'7
  ;; (67'16) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L21: ; Continuation
  ;; (70'34) Tail: app_70'21 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L22: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L20
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push [bp+1]
  push 1
  push #1
  mov 3, sp
  push 2
  push cx
  push #L21
  mov cx, sp
  ;; (70'21) Tail: revloop (g9) @ con_0'0 (t3)
  mov bp, 109
  mov dx, 3
  mov ax, [bp]
  jmp [ax]

L23: ; Function: g9
  push dx
  push #L22
  mov 1, sp
  ;; (0'0) Return: lam_67'20 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L24: ; Arm: 76'7
  ;; (0'0) Return: con_76'10 (g11)
  mov dx, 111
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L25: ; Continuation
  push dx
  push [bp+2]
  push #1
  mov 1, sp
  ;; (0'0) Return: con_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L26: ; Continuation
  push [bp+3]
  push cx
  push #L25
  mov cx, sp
  ;; (77'26) Tail: app_77'24 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L27: ; Continuation
  push dx
  push [bp+3]
  push cx
  push #L26
  mov cx, sp
  ;; (77'24) Tail: map (g10) @ f (f2)
  mov dx, [bp+2]
  mov bp, 110
  mov ax, [bp]
  jmp [ax]

L28: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L24
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push 2
  push [bp+1]
  push cx
  push #L27
  mov cx, sp
  ;; (77'15) Tail: f (f1) @ x (t1)
  mov bp, [bp+1]
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L29: ; Function: g10
  push dx
  push #L28
  mov 1, sp
  ;; (0'0) Return: lam_74'14 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L30: ; Arm: 81'7
  ;; (0'0) Return: lit_81'10 (g13)
  mov dx, 113
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L31: ; Continuation
  mov ax, 114
  add ax, dx
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L32: ; Function: g12
  mov bx, dx
  cmp [bx], #0
  bz L30
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push cx
  push #L31
  mov cx, sp
  ;; (82'27) Tail: length (g12) @ xs (t2)
  mov bp, 112
  mov dx, 2
  mov ax, [bp]
  jmp [ax]

L33: ; Arm: 95'7
  ;; (0'0) Return: con_95'10 (g16)
  mov dx, 116
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L34: ; Continuation
  ;; (96'35) Tail: put_chars (g15) @ xs (f2)
  mov dx, [bp+2]
  mov bp, 115
  mov ax, [bp]
  jmp [ax]

L35: ; Arm: 19'19
  mov ax, 1
  call bios_put_char
  mov 5, ax
  ;; (0'0) Return: prim_0'0 (t5)
  mov dx, 5
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L36: ; Arm: 20'22
  mov ax, 1
  call bios_put_char
  mov 6, ax
  ;; (0'0) Return: prim_0'0 (t6)
  mov dx, 6
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L37: ; Arm: 21'16
  mov ax, 1
  call bios_put_char
  mov 7, ax
  ;; (0'0) Return: prim_0'0 (t7)
  mov dx, 7
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L38: ; Function: g15
  mov bx, dx
  cmp [bx], #0
  bz L33
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov ax, 1
  call bios_char_to_num
  mov 3, ax
  mov ax, 3
  cmp ax, 117
  call bios_make_bool_from_z
  mov 4, ax
  push 2
  push cx
  push #L34
  mov cx, sp
  mov bx, 4
  cmp [bx], #1
  bz L35
  mov ax, 1
  cmp ax, 118
  call bios_make_bool_from_z
  mov 5, ax
  mov bx, 5
  cmp [bx], #1
  bz L36
  mov ax, 119
  cmp ax, 3
  call bios_make_bool_from_n
  mov 6, ax
  mov bx, 6
  cmp [bx], #1
  bz L37
  mov ax, 120
  call bios_put_char
  mov 7, ax
  mov ax, 121
  add ax, 3
  mov 8, ax
  mov ax, 8
  sub ax, 122
  mov 9, ax
  mov ax, 9
  call bios_num_to_char
  mov 10, ax
  mov ax, 10
  call bios_put_char
  mov 11, ax
  ;; (0'0) Return: prim_0'0 (t11)
  mov dx, 11
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L39: ; Continuation
  ;; (72'28) Tail: app_72'25 (arg) @ acc (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L40: ; Arm: 108'20
  mov ax, 126
  call bios_put_char
  mov 4, ax
  push dx
  push cx
  push #L39
  mov cx, sp
  ;; (72'25) Tail: revloop (g9) @ con_72'25 (g27)
  mov bp, 109
  mov dx, 127
  mov ax, [bp]
  jmp [ax]

L41: ; Continuation
  push [bp+2]
  push 137
  push #1
  mov 1, sp
  ;; (72'28) Tail: app_72'25 (arg) @ con_0'0 (t1)
  mov bp, dx
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L42: ; Continuation
  mov ax, 135
  call bios_put_char
  mov 1, ax
  push [bp+2]
  push cx
  push #L41
  mov cx, sp
  ;; (72'25) Tail: revloop (g9) @ con_72'25 (g36)
  mov bp, 109
  mov dx, 136
  mov ax, [bp]
  jmp [ax]

L43: ; Arm: 19'19
  mov ax, 1
  call bios_put_char
  mov 7, ax
  ;; (0'0) Return: prim_0'0 (t7)
  mov dx, 7
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L44: ; Arm: 20'22
  mov ax, 1
  call bios_put_char
  mov 8, ax
  ;; (0'0) Return: prim_0'0 (t8)
  mov dx, 8
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L45: ; Arm: 21'16
  mov ax, 1
  call bios_put_char
  mov 9, ax
  ;; (0'0) Return: prim_0'0 (t9)
  mov dx, 9
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L46: ; Arm: 109'26
  mov ax, 1
  call bios_char_to_num
  mov 5, ax
  mov ax, 5
  cmp ax, 129
  call bios_make_bool_from_z
  mov 6, ax
  push dx
  push cx
  push #L42
  mov cx, sp
  mov bx, 6
  cmp [bx], #1
  bz L43
  mov ax, 1
  cmp ax, 130
  call bios_make_bool_from_z
  mov 7, ax
  mov bx, 7
  cmp [bx], #1
  bz L44
  mov ax, 131
  cmp ax, 5
  call bios_make_bool_from_n
  mov 8, ax
  mov bx, 8
  cmp [bx], #1
  bz L45
  mov ax, 132
  call bios_put_char
  mov 9, ax
  mov ax, 133
  add ax, 5
  mov 10, ax
  mov ax, 10
  sub ax, 134
  mov 11, ax
  mov ax, 11
  call bios_num_to_char
  mov 12, ax
  mov ax, 12
  call bios_put_char
  mov 13, ax
  ;; (0'0) Return: prim_0'0 (t13)
  mov dx, 13
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L47: ; Arm: 110'17
  ;; (110'31) Tail: readloop (g23) @ acc (arg)
  mov bp, 123
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L48: ; Arm: 113'15
  ;; (113'27) Tail: readloop (g23) @ acc (arg)
  mov bp, 123
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L49: ; Continuation
  mov ax, 147
  call bios_put_char
  mov 1, ax
  mov ax, 148
  call bios_put_char
  mov 2, ax
  mov ax, 149
  call bios_put_char
  mov 3, ax
  ;; (117'22) Tail: readloop (g23) @ tail (f2)
  mov dx, [bp+2]
  mov bp, 123
  mov ax, [bp]
  jmp [ax]

L50: ; Arm: 115'29
  mov ax, 143
  call bios_put_char
  mov 1, ax
  mov ax, 144
  call bios_put_char
  mov 2, ax
  mov ax, 145
  call bios_put_char
  mov 3, ax
  ;; (0'0) Return: prim_0'0 (t3)
  mov dx, 3
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L51: ; Continuation
  push [bp+2]
  push cx
  push #L49
  mov cx, sp
  mov bx, dx
  cmp [bx], #1
  bz L50
  ;; (0'0) Return: con_115'53 (g46)
  mov dx, 146
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L52: ; Arm: 8'9
  ;; (0'0) Return: con_8'12 (g41)
  mov dx, 141
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L53: ; Arm: 111'19
  mov bx, dx
  cmp [bx], #0
  bz L48
  mov ax, [bx+1]
  mov 7, ax
  mov ax, [bx+2]
  mov 8, ax
  mov ax, 7
  call bios_char_to_num
  mov 9, ax
  mov ax, 140
  cmp ax, 9
  call bios_make_bool_from_n
  mov 10, ax
  push 8
  push cx
  push #L51
  mov cx, sp
  mov bx, 10
  cmp [bx], #1
  bz L52
  ;; (0'0) Return: con_9'13 (g42)
  mov dx, 142
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L54: ; Continuation
  push [bp+2]
  push [bp+3]
  push #1
  mov 1, sp
  ;; (119'32) Tail: readloop (g23) @ con_0'0 (t1)
  mov bp, 123
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L55: ; Arm: 19'19
  mov ax, 1
  call bios_put_char
  mov 9, ax
  ;; (0'0) Return: prim_0'0 (t9)
  mov dx, 9
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L56: ; Arm: 20'22
  mov ax, 1
  call bios_put_char
  mov 10, ax
  ;; (0'0) Return: prim_0'0 (t10)
  mov dx, 10
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L57: ; Arm: 21'16
  mov ax, 1
  call bios_put_char
  mov 11, ax
  ;; (0'0) Return: prim_0'0 (t11)
  mov dx, 11
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L58: ; Function: g23
  call bios_get_char
  mov 1, ax
  mov ax, 1
  call bios_char_to_num
  mov 2, ax
  mov ax, 1
  cmp ax, 125
  call bios_make_bool_from_z
  mov 3, ax
  mov bx, 3
  cmp [bx], #1
  bz L40
  mov ax, 1
  cmp ax, 128
  call bios_make_bool_from_z
  mov 4, ax
  mov bx, 4
  cmp [bx], #1
  bz L46
  mov ax, 138
  cmp ax, 2
  call bios_make_bool_from_n
  mov 5, ax
  mov bx, 5
  cmp [bx], #1
  bz L47
  mov ax, 2
  cmp ax, 139
  call bios_make_bool_from_z
  mov 6, ax
  mov bx, 6
  cmp [bx], #1
  bz L53
  mov ax, 1
  call bios_char_to_num
  mov 7, ax
  mov ax, 7
  cmp ax, 150
  call bios_make_bool_from_z
  mov 8, ax
  push 1
  push dx
  push cx
  push #L54
  mov cx, sp
  mov bx, 8
  cmp [bx], #1
  bz L55
  mov ax, 1
  cmp ax, 151
  call bios_make_bool_from_z
  mov 9, ax
  mov bx, 9
  cmp [bx], #1
  bz L56
  mov ax, 152
  cmp ax, 7
  call bios_make_bool_from_n
  mov 10, ax
  mov bx, 10
  cmp [bx], #1
  bz L57
  mov ax, 153
  call bios_put_char
  mov 11, ax
  mov ax, 154
  add ax, 7
  mov 12, ax
  mov ax, 12
  sub ax, 155
  mov 13, ax
  mov ax, 13
  call bios_num_to_char
  mov 14, ax
  mov ax, 14
  call bios_put_char
  mov 15, ax
  ;; (0'0) Return: prim_0'0 (t15)
  mov dx, 15
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L59: ; Arm: 125'11
  ;; (123'12) Return: n (arg)
  mov dx, dx
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L60: ; Continuation
  mov ax, [bp+2]
  add ax, dx
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L61: ; Continuation
  mov ax, [bp+2]
  sub ax, 159
  mov 1, ax
  push dx
  push cx
  push #L60
  mov cx, sp
  ;; (125'39) Tail: fib (g56) @ prim_0'0 (t1)
  mov bp, 156
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L62: ; Function: g56
  mov ax, dx
  cmp ax, 157
  call bios_make_bool_from_n
  mov 1, ax
  mov bx, 1
  cmp [bx], #1
  bz L59
  mov ax, dx
  sub ax, 158
  mov 2, ax
  push dx
  push cx
  push #L61
  mov cx, sp
  ;; (125'27) Tail: fib (g56) @ prim_0'0 (t2)
  mov bp, 156
  mov dx, 2
  mov ax, [bp]
  jmp [ax]

L63: ; Continuation
  mov ax, dx
  mul ax, [bp+2]
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L64: ; Arm: 129'12
  mov ax, [bp+2]
  sub ax, 164
  mov 1, ax
  push [bp+2]
  push cx
  push #L63
  mov cx, sp
  ;; (129'22) Tail: fact (g60) @ prim_0'0 (t1)
  mov bp, 160
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L65: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L64
  ;; (0'0) Return: lit_129'37 (g65)
  mov dx, 165
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L66: ; Arm: 8'9
  ;; (0'0) Return: con_8'12 (g62)
  mov dx, 162
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L67: ; Function: g60
  mov ax, dx
  cmp ax, 161
  call bios_make_bool_from_n
  mov 1, ax
  push dx
  push cx
  push #L65
  mov cx, sp
  mov bx, 1
  cmp [bx], #1
  bz L66
  ;; (0'0) Return: con_9'13 (g63)
  mov dx, 163
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L68: ; Continuation
  push [bp+2]
  push [bp+3]
  push #1
  mov 1, sp
  ;; (72'28) Tail: app_72'25 (arg) @ con_0'0 (t1)
  mov bp, dx
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L69: ; Continuation
  push dx
  push [bp+2]
  push cx
  push #L68
  mov cx, sp
  ;; (72'25) Tail: revloop (g9) @ con_72'25 (g68)
  mov bp, 109
  mov dx, 168
  mov ax, [bp]
  jmp [ax]

L70: ; Continuation
  push [bp+2]
  push cx
  push #L69
  mov cx, sp
  ;; (72'28) Tail: app_72'25 (arg) @ accCs (f3)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+3]
  mov ax, [bp]
  jmp [ax]

L71: ; Arm: 196'7
  push [bp+2]
  push [bp+1]
  push cx
  push #L70
  mov cx, sp
  ;; (72'25) Tail: revloop (g9) @ con_72'25 (g67)
  mov bp, 109
  mov dx, 167
  mov ax, [bp]
  jmp [ax]

L72: ; Continuation
  ;; (199'65) Tail: app_199'62 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L73: ; Continuation
  push [bp+2]
  push cx
  push #L72
  mov cx, sp
  ;; (199'62) Tail: app_199'37 (arg) @ con_199'62 (g71)
  mov bp, dx
  mov dx, 171
  mov ax, [bp]
  jmp [ax]

L74: ; Continuation
  push [bp+2]
  push dx
  push #1
  mov 1, sp
  push [bp+3]
  push cx
  push #L73
  mov cx, sp
  ;; (199'37) Tail: splitloop (g66) @ con_0'0 (t1)
  mov bp, 166
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L75: ; Continuation
  push [bp+4]
  push [bp+2]
  push cx
  push #L74
  mov cx, sp
  ;; (72'28) Tail: app_72'25 (arg) @ accCs (f3)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+3]
  mov ax, [bp]
  jmp [ax]

L76: ; Arm: 199'22
  push 2
  push [bp+2]
  push [bp+1]
  push cx
  push #L75
  mov cx, sp
  ;; (72'25) Tail: revloop (g9) @ con_72'25 (g70)
  mov bp, 109
  mov dx, 170
  mov ax, [bp]
  jmp [ax]

L77: ; Continuation
  ;; (200'37) Tail: app_200'26 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L78: ; Continuation
  push [bp+2]
  push [bp+3]
  push #1
  mov 1, sp
  push [bp+4]
  push cx
  push #L77
  mov cx, sp
  ;; (200'26) Tail: app_200'20 (arg) @ con_0'0 (t1)
  mov bp, dx
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L79: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L71
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov ax, 1
  cmp ax, 169
  call bios_make_bool_from_z
  mov 3, ax
  mov bx, 3
  cmp [bx], #1
  bz L76
  push 2
  push 1
  push [bp+2]
  push cx
  push #L78
  mov cx, sp
  ;; (200'20) Tail: splitloop (g66) @ accWs (f1)
  mov dx, [bp+1]
  mov bp, 166
  mov ax, [bp]
  jmp [ax]

L80: ; Function: t1
  push dx
  push [bp+1]
  push #L79
  mov 1, sp
  ;; (0'0) Return: lam_194'30 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L81: ; Function: g66
  push dx
  push #L80
  mov 1, sp
  ;; (0'0) Return: lam_194'24 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L82: ; Function: t1
  mov ax, [bp+1]
  cmp ax, dx
  call bios_make_bool_from_z
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L83: ; Function: g78
  push dx
  push #L82
  mov 1, sp
  ;; (0'0) Return: lam_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L84: ; Function: t1
  mov ax, [bp+1]
  cmp ax, dx
  call bios_make_bool_from_z
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L85: ; Function: g87
  push dx
  push #L84
  mov 1, sp
  ;; (0'0) Return: lam_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L86: ; Arm: 41'9
  push [bp+1]
  push #0
  mov 1, sp
  ;; (0'0) Return: con_41'12 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L87: ; Arm: 44'15
  ;; (0'0) Return: con_44'18 (g105)
  mov dx, 205
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L88: ; Continuation
  ;; (45'40) Tail: app_45'25 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L89: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L87
  mov ax, [bx+1]
  mov 1, ax
  mov ax, 206
  mul ax, [bp+2]
  mov 2, ax
  mov ax, 2
  add ax, 1
  mov 3, ax
  push [bp+3]
  push cx
  push #L88
  mov cx, sp
  ;; (45'25) Tail: loop (g95) @ prim_0'0 (t3)
  mov bp, 195
  mov dx, 3
  mov ax, [bp]
  jmp [ax]

L90: ; Arm: 36'27
  push [bp+2]
  push #0
  mov 1, sp
  ;; (0'0) Return: con_36'32 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L91: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L90
  ;; (0'0) Return: con_36'45 (g103)
  mov dx, 203
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L92: ; Arm: 8'9
  ;; (0'0) Return: con_8'12 (g101)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L93: ; Arm: 36'12
  mov ax, 200
  cmp ax, [bp+4]
  call bios_make_bool_from_n
  mov 1, ax
  push [bp+4]
  push cx
  push #L91
  mov cx, sp
  mov bx, 1
  cmp [bx], #1
  bz L92
  ;; (0'0) Return: con_9'13 (g102)
  mov dx, 202
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L94: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L89
  mov cx, sp
  mov bx, dx
  cmp [bx], #1
  bz L93
  ;; (0'0) Return: con_36'55 (g104)
  mov dx, 204
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L95: ; Arm: 8'9
  ;; (0'0) Return: con_8'12 (g98)
  mov dx, 198
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L96: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L86
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov ax, 1
  call bios_char_to_num
  mov 3, ax
  mov ax, 3
  sub ax, 196
  mov 4, ax
  mov ax, 4
  cmp ax, 197
  call bios_make_bool_from_n
  mov 5, ax
  push 4
  push 2
  push [bp+1]
  push cx
  push #L94
  mov cx, sp
  mov bx, 5
  cmp [bx], #1
  bz L95
  ;; (0'0) Return: con_9'13 (g99)
  mov dx, 199
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L97: ; Function: g95
  push dx
  push #L96
  mov 1, sp
  ;; (0'0) Return: lam_39'19 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L98: ; Arm: 88'13
  ;; (87'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L99: ; Continuation
  mov ax, [bp+2]
  div ax, 215
  mov 1, ax
  ;; (89'45) Tail: app_89'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L100: ; Function: t1
  mov ax, dx
  cmp ax, 212
  call bios_make_bool_from_z
  mov 1, ax
  mov bx, 1
  cmp [bx], #1
  bz L98
  mov ax, dx
  mod ax, 213
  mov 2, ax
  mov ax, 214
  add ax, 2
  mov 3, ax
  mov ax, 3
  call bios_num_to_char
  mov 4, ax
  push [bp+1]
  push 4
  push #1
  mov 5, sp
  push dx
  push cx
  push #L99
  mov cx, sp
  ;; (89'11) Tail: loop (g111) @ con_0'0 (t5)
  mov bp, 211
  mov dx, 5
  mov ax, [bp]
  jmp [ax]

L101: ; Function: g111
  push dx
  push #L100
  mov 1, sp
  ;; (0'0) Return: lam_87'19 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L102: ; Arm: 88'13
  ;; (87'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L103: ; Continuation
  mov ax, [bp+2]
  div ax, 226
  mov 1, ax
  ;; (89'45) Tail: app_89'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L104: ; Function: t1
  mov ax, dx
  cmp ax, 223
  call bios_make_bool_from_z
  mov 1, ax
  mov bx, 1
  cmp [bx], #1
  bz L102
  mov ax, dx
  mod ax, 224
  mov 2, ax
  mov ax, 225
  add ax, 2
  mov 3, ax
  mov ax, 3
  call bios_num_to_char
  mov 4, ax
  push [bp+1]
  push 4
  push #1
  mov 5, sp
  push dx
  push cx
  push #L103
  mov cx, sp
  ;; (89'11) Tail: loop (g122) @ con_0'0 (t5)
  mov bp, 222
  mov dx, 5
  mov ax, [bp]
  jmp [ax]

L105: ; Function: g122
  push dx
  push #L104
  mov 1, sp
  ;; (0'0) Return: lam_87'19 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L106: ; Function: t1
  mov ax, [bp+1]
  cmp ax, dx
  call bios_make_bool_from_z
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L107: ; Function: g134
  push dx
  push #L106
  mov 1, sp
  ;; (0'0) Return: lam_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L108: ; Arm: 41'9
  push [bp+1]
  push #0
  mov 1, sp
  ;; (0'0) Return: con_41'12 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L109: ; Arm: 44'15
  ;; (0'0) Return: con_44'18 (g152)
  mov dx, 252
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L110: ; Continuation
  ;; (45'40) Tail: app_45'25 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L111: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L109
  mov ax, [bx+1]
  mov 1, ax
  mov ax, 253
  mul ax, [bp+2]
  mov 2, ax
  mov ax, 2
  add ax, 1
  mov 3, ax
  push [bp+3]
  push cx
  push #L110
  mov cx, sp
  ;; (45'25) Tail: loop (g142) @ prim_0'0 (t3)
  mov bp, 242
  mov dx, 3
  mov ax, [bp]
  jmp [ax]

L112: ; Arm: 36'27
  push [bp+2]
  push #0
  mov 1, sp
  ;; (0'0) Return: con_36'32 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L113: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L112
  ;; (0'0) Return: con_36'45 (g150)
  mov dx, 250
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L114: ; Arm: 8'9
  ;; (0'0) Return: con_8'12 (g148)
  mov dx, 248
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L115: ; Arm: 36'12
  mov ax, 247
  cmp ax, [bp+4]
  call bios_make_bool_from_n
  mov 1, ax
  push [bp+4]
  push cx
  push #L113
  mov cx, sp
  mov bx, 1
  cmp [bx], #1
  bz L114
  ;; (0'0) Return: con_9'13 (g149)
  mov dx, 249
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L116: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L111
  mov cx, sp
  mov bx, dx
  cmp [bx], #1
  bz L115
  ;; (0'0) Return: con_36'55 (g151)
  mov dx, 251
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L117: ; Arm: 8'9
  ;; (0'0) Return: con_8'12 (g145)
  mov dx, 245
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L118: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L108
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov ax, 1
  call bios_char_to_num
  mov 3, ax
  mov ax, 3
  sub ax, 243
  mov 4, ax
  mov ax, 4
  cmp ax, 244
  call bios_make_bool_from_n
  mov 5, ax
  push 4
  push 2
  push [bp+1]
  push cx
  push #L116
  mov cx, sp
  mov bx, 5
  cmp [bx], #1
  bz L117
  ;; (0'0) Return: con_9'13 (g146)
  mov dx, 246
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L119: ; Function: g142
  push dx
  push #L118
  mov 1, sp
  ;; (0'0) Return: lam_39'19 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L120: ; Arm: 88'13
  ;; (87'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L121: ; Continuation
  mov ax, [bp+2]
  div ax, 262
  mov 1, ax
  ;; (89'45) Tail: app_89'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L122: ; Function: t1
  mov ax, dx
  cmp ax, 259
  call bios_make_bool_from_z
  mov 1, ax
  mov bx, 1
  cmp [bx], #1
  bz L120
  mov ax, dx
  mod ax, 260
  mov 2, ax
  mov ax, 261
  add ax, 2
  mov 3, ax
  mov ax, 3
  call bios_num_to_char
  mov 4, ax
  push [bp+1]
  push 4
  push #1
  mov 5, sp
  push dx
  push cx
  push #L121
  mov cx, sp
  ;; (89'11) Tail: loop (g158) @ con_0'0 (t5)
  mov bp, 258
  mov dx, 5
  mov ax, [bp]
  jmp [ax]

L123: ; Function: g158
  push dx
  push #L122
  mov 1, sp
  ;; (0'0) Return: lam_87'19 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L124: ; Arm: 88'13
  ;; (87'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L125: ; Continuation
  mov ax, [bp+2]
  div ax, 273
  mov 1, ax
  ;; (89'45) Tail: app_89'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L126: ; Function: t1
  mov ax, dx
  cmp ax, 270
  call bios_make_bool_from_z
  mov 1, ax
  mov bx, 1
  cmp [bx], #1
  bz L124
  mov ax, dx
  mod ax, 271
  mov 2, ax
  mov ax, 272
  add ax, 2
  mov 3, ax
  mov ax, 3
  call bios_num_to_char
  mov 4, ax
  push [bp+1]
  push 4
  push #1
  mov 5, sp
  push dx
  push cx
  push #L125
  mov cx, sp
  ;; (89'11) Tail: loop (g169) @ con_0'0 (t5)
  mov bp, 269
  mov dx, 5
  mov ax, [bp]
  jmp [ax]

L127: ; Function: g169
  push dx
  push #L126
  mov 1, sp
  ;; (0'0) Return: lam_87'19 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L128: ; Function: t1
  mov ax, [bp+1]
  cmp ax, dx
  call bios_make_bool_from_z
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L129: ; Function: g181
  push dx
  push #L128
  mov 1, sp
  ;; (0'0) Return: lam_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L130: ; Function: t1
  mov ax, [bp+1]
  cmp ax, dx
  call bios_make_bool_from_z
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L131: ; Function: g188
  push dx
  push #L130
  mov 1, sp
  ;; (0'0) Return: lam_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L132: ; Arm: 173'39
  ;; (0'0) Return: con_173'44 (g192)
  mov dx, 292
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L133: ; Continuation
  mov ax, 294
  call bios_put_char
  mov 1, ax
  ;; (174'46) Tail: loop (g186) @ con_174'46 (g195)
  mov bp, 286
  mov dx, 295
  mov ax, [bp]
  jmp [ax]

L134: ; Continuation
  push cx
  push #L133
  mov cx, sp
  ;; (174'17) Tail: put_chars (g15) @ app_72'28 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L135: ; Continuation
  push cx
  push #L134
  mov cx, sp
  ;; (72'28) Tail: app_72'25 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L136: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L132
  push [bp+2]
  push cx
  push #L135
  mov cx, sp
  ;; (72'25) Tail: revloop (g9) @ con_72'25 (g193)
  mov bp, 109
  mov dx, 293
  mov ax, [bp]
  jmp [ax]

L137: ; Continuation
  push [bp+2]
  push cx
  push #L136
  mov cx, sp
  ;; (60'44) Tail: app_60'41 (arg) @ con_0'0 (g191)
  mov bp, dx
  mov dx, 291
  mov ax, [bp]
  jmp [ax]

L138: ; Continuation
  push [bp+2]
  push cx
  push #L137
  mov cx, sp
  ;; (60'41) Tail: app_60'33 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L139: ; Continuation
  push dx
  push cx
  push #L138
  mov cx, sp
  ;; (60'33) Tail: eq_list (g3) @ lam_0'0 (g188)
  mov bp, 103
  mov dx, 288
  mov ax, [bp]
  jmp [ax]

L140: ; Function: g186
  push cx
  push #L139
  mov cx, sp
  ;; (121'28) Tail: readloop (g23) @ con_121'28 (g187)
  mov bp, 123
  mov dx, 287
  mov ax, [bp]
  jmp [ax]

L141: ; Arm: 186'52
  ;; (0'0) Return: lit_186'57 (g198)
  mov dx, 298
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L142: ; Function: g199
  mov ax, dx
  cmp ax, 297
  call bios_make_bool_from_z
  mov 1, ax
  mov bx, 1
  cmp [bx], #1
  bz L141
  ;; (186'30) Return: c (arg)
  mov dx, dx
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L143: ; Arm: 88'13
  ;; (87'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L144: ; Continuation
  mov ax, [bp+2]
  div ax, 306
  mov 1, ax
  ;; (89'45) Tail: app_89'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L145: ; Function: t1
  mov ax, dx
  cmp ax, 303
  call bios_make_bool_from_z
  mov 1, ax
  mov bx, 1
  cmp [bx], #1
  bz L143
  mov ax, dx
  mod ax, 304
  mov 2, ax
  mov ax, 305
  add ax, 2
  mov 3, ax
  mov ax, 3
  call bios_num_to_char
  mov 4, ax
  push [bp+1]
  push 4
  push #1
  mov 5, sp
  push dx
  push cx
  push #L144
  mov cx, sp
  ;; (89'11) Tail: loop (g202) @ con_0'0 (t5)
  mov bp, 302
  mov dx, 5
  mov ax, [bp]
  jmp [ax]

L146: ; Function: g202
  push dx
  push #L145
  mov 1, sp
  ;; (0'0) Return: lam_87'19 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L147: ; Arm: 218'37
  ;; (0'0) Return: con_218'42 (g82)
  mov dx, 182
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L148: ; Continuation
  ;; (219'26) Tail: mainloop (f2) @ con_219'26 (g214)
  mov bp, [bp+2]
  mov dx, 314
  mov ax, [bp]
  jmp [ax]

L149: ; Arm: 208'7
  ;; (0'0) Return: con_208'10 (g85)
  mov dx, 185
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L150: ; Continuation
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L151: ; Function: t1
  push cx
  push #L150
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L152: ; Continuation
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L153: ; Function: t1
  push cx
  push #L152
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L154: ; Continuation
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L155: ; Function: t1
  push cx
  push #L154
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L156: ; Continuation
  mov ax, 191
  call bios_put_char
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L157: ; Continuation
  push cx
  push #L156
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_136'16 (g90)
  mov bp, dx
  mov dx, 190
  mov ax, [bp]
  jmp [ax]

L158: ; Continuation
  push [bp+2]
  push #L155
  mov 1, sp
  push cx
  push #L157
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L159: ; Continuation
  push [bp+2]
  push cx
  push #L158
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_131'25 (g89)
  mov bp, dx
  mov dx, 189
  mov ax, [bp]
  jmp [ax]

L160: ; Arm: 136'7
  push [bp+2]
  push #L153
  mov 1, sp
  push [bp+2]
  push cx
  push #L159
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L161: ; Continuation
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L162: ; Function: t5
  push cx
  push #L161
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L163: ; Continuation
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L164: ; Function: t1
  push cx
  push #L163
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L165: ; Continuation
  mov ax, 194
  call bios_put_char
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L166: ; Continuation
  push cx
  push #L165
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_139'21 (g93)
  mov bp, dx
  mov dx, 193
  mov ax, [bp]
  jmp [ax]

L167: ; Continuation
  push [bp+2]
  push #L164
  mov 1, sp
  push cx
  push #L166
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L168: ; Continuation
  push [bp+2]
  push cx
  push #L167
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_131'25 (g92)
  mov bp, dx
  mov dx, 192
  mov ax, [bp]
  jmp [ax]

L169: ; Arm: 139'12
  mov ax, [bx+1]
  mov 3, ax
  mov ax, [bx+2]
  mov 4, ax
  push [bp+2]
  push #L162
  mov 5, sp
  push [bp+2]
  push cx
  push #L168
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t5)
  mov bp, 101
  mov dx, 5
  mov ax, [bp]
  jmp [ax]

L170: ; Continuation
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L171: ; Function: t1
  push cx
  push #L170
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L172: ; Continuation
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L173: ; Function: t1
  push cx
  push #L172
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L174: ; Continuation
  mov ax, 210
  call bios_put_char
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L175: ; Continuation
  push cx
  push #L174
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_142'24 (g109)
  mov bp, dx
  mov dx, 209
  mov ax, [bp]
  jmp [ax]

L176: ; Continuation
  push [bp+2]
  push #L173
  mov 1, sp
  push cx
  push #L175
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L177: ; Continuation
  push [bp+2]
  push cx
  push #L176
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_131'25 (g108)
  mov bp, dx
  mov dx, 208
  mov ax, [bp]
  jmp [ax]

L178: ; Arm: 142'15
  push [bp+2]
  push #L171
  mov 1, sp
  push [bp+2]
  push cx
  push #L177
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L179: ; Continuation
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L180: ; Function: t1
  push cx
  push #L179
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L181: ; Continuation
  mov ax, 232
  call bios_put_char
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L182: ; Continuation
  push cx
  push #L181
  mov cx, sp
  ;; (100'26) Tail: put_chars (g15) @ case_91'2 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L183: ; Arm: 91'11
  ;; (0'0) Return: con_0'0 (g130)
  mov dx, 230
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L184: ; Continuation
  ;; (91'41) Tail: app_91'38 (arg) @ res (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L185: ; Continuation
  mov ax, [bp+2]
  cmp ax, 227
  call bios_make_bool_from_z
  mov 1, ax
  push cx
  push #L182
  mov cx, sp
  mov bx, 1
  cmp [bx], #1
  bz L183
  push [bp+2]
  push cx
  push #L184
  mov cx, sp
  ;; (91'38) Tail: loop (g122) @ con_91'38 (g131)
  mov bp, 222
  mov dx, 231
  mov ax, [bp]
  jmp [ax]

L186: ; Continuation
  push [bp+2]
  push cx
  push #L185
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_146'22 (g121)
  mov bp, dx
  mov dx, 221
  mov ax, [bp]
  jmp [ax]

L187: ; Continuation
  push [bp+2]
  push #L180
  mov 1, sp
  push [bp+3]
  push cx
  push #L186
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L188: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L187
  mov cx, sp
  ;; (100'26) Tail: put_chars (g15) @ case_91'2 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L189: ; Arm: 91'11
  ;; (0'0) Return: con_0'0 (g119)
  mov dx, 219
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L190: ; Continuation
  ;; (91'41) Tail: app_91'38 (arg) @ n (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L191: ; Continuation
  mov ax, [bp+3]
  cmp ax, 216
  call bios_make_bool_from_z
  mov 1, ax
  push dx
  push [bp+2]
  push cx
  push #L188
  mov cx, sp
  mov bx, 1
  cmp [bx], #1
  bz L189
  push [bp+3]
  push cx
  push #L190
  mov cx, sp
  ;; (91'38) Tail: loop (g111) @ con_91'38 (g120)
  mov bp, 211
  mov dx, 220
  mov ax, [bp]
  jmp [ax]

L192: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L178
  mov ax, [bx+1]
  mov 1, ax
  push 1
  push [bp+2]
  push cx
  push #L191
  mov cx, sp
  ;; (144'25) Tail: fib (g56) @ n (t1)
  mov bp, 156
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L193: ; Continuation
  push [bp+2]
  push cx
  push #L192
  mov cx, sp
  ;; (47'9) Tail: app_47'7 (arg) @ arg1 (f3)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+3]
  mov ax, [bp]
  jmp [ax]

L194: ; Continuation
  mov bx, [bp+3]
  cmp [bx], #0
  bz L160
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov bx, 2
  cmp [bx], #1
  bz L169
  push 1
  push [bp+2]
  push cx
  push #L193
  mov cx, sp
  ;; (47'7) Tail: loop (g95) @ lit_47'7 (g107)
  mov bp, 195
  mov dx, 207
  mov ax, [bp]
  jmp [ax]

L195: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L194
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_134'13 (g88)
  mov bp, dx
  mov dx, 188
  mov ax, [bp]
  jmp [ax]

L196: ; Arm: 210'45
  push [bp+2]
  push #L151
  mov 1, sp
  push [bp+5]
  push [bp+2]
  push cx
  push #L195
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L197: ; Continuation
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L198: ; Function: t1
  push cx
  push #L197
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
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
  mov ax, 238
  call bios_put_char
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L204: ; Continuation
  push cx
  push #L203
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_153'16 (g137)
  mov bp, dx
  mov dx, 237
  mov ax, [bp]
  jmp [ax]

L205: ; Continuation
  push [bp+2]
  push #L202
  mov 1, sp
  push cx
  push #L204
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L206: ; Continuation
  push [bp+2]
  push cx
  push #L205
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_131'25 (g136)
  mov bp, dx
  mov dx, 236
  mov ax, [bp]
  jmp [ax]

L207: ; Arm: 153'7
  push [bp+2]
  push #L200
  mov 1, sp
  push [bp+2]
  push cx
  push #L206
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L208: ; Continuation
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L209: ; Function: t5
  push cx
  push #L208
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L210: ; Continuation
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L211: ; Function: t1
  push cx
  push #L210
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L212: ; Continuation
  mov ax, 241
  call bios_put_char
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L213: ; Continuation
  push cx
  push #L212
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_156'21 (g140)
  mov bp, dx
  mov dx, 240
  mov ax, [bp]
  jmp [ax]

L214: ; Continuation
  push [bp+2]
  push #L211
  mov 1, sp
  push cx
  push #L213
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L215: ; Continuation
  push [bp+2]
  push cx
  push #L214
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_131'25 (g139)
  mov bp, dx
  mov dx, 239
  mov ax, [bp]
  jmp [ax]

L216: ; Arm: 156'12
  mov ax, [bx+1]
  mov 3, ax
  mov ax, [bx+2]
  mov 4, ax
  push [bp+2]
  push #L209
  mov 5, sp
  push [bp+2]
  push cx
  push #L215
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t5)
  mov bp, 101
  mov dx, 5
  mov ax, [bp]
  jmp [ax]

L217: ; Continuation
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L218: ; Function: t1
  push cx
  push #L217
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
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
  mov ax, 257
  call bios_put_char
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L222: ; Continuation
  push cx
  push #L221
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_159'24 (g156)
  mov bp, dx
  mov dx, 256
  mov ax, [bp]
  jmp [ax]

L223: ; Continuation
  push [bp+2]
  push #L220
  mov 1, sp
  push cx
  push #L222
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L224: ; Continuation
  push [bp+2]
  push cx
  push #L223
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_131'25 (g155)
  mov bp, dx
  mov dx, 255
  mov ax, [bp]
  jmp [ax]

L225: ; Arm: 159'15
  push [bp+2]
  push #L218
  mov 1, sp
  push [bp+2]
  push cx
  push #L224
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L226: ; Continuation
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L227: ; Function: t1
  push cx
  push #L226
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L228: ; Continuation
  mov ax, 279
  call bios_put_char
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L229: ; Continuation
  push cx
  push #L228
  mov cx, sp
  ;; (100'26) Tail: put_chars (g15) @ case_91'2 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L230: ; Arm: 91'11
  ;; (0'0) Return: con_0'0 (g177)
  mov dx, 277
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L231: ; Continuation
  ;; (91'41) Tail: app_91'38 (arg) @ res (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L232: ; Continuation
  mov ax, [bp+2]
  cmp ax, 274
  call bios_make_bool_from_z
  mov 1, ax
  push cx
  push #L229
  mov cx, sp
  mov bx, 1
  cmp [bx], #1
  bz L230
  push [bp+2]
  push cx
  push #L231
  mov cx, sp
  ;; (91'38) Tail: loop (g169) @ con_91'38 (g178)
  mov bp, 269
  mov dx, 278
  mov ax, [bp]
  jmp [ax]

L233: ; Continuation
  push [bp+2]
  push cx
  push #L232
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_163'22 (g168)
  mov bp, dx
  mov dx, 268
  mov ax, [bp]
  jmp [ax]

L234: ; Continuation
  push [bp+2]
  push #L227
  mov 1, sp
  push [bp+3]
  push cx
  push #L233
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L235: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L234
  mov cx, sp
  ;; (100'26) Tail: put_chars (g15) @ case_91'2 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L236: ; Arm: 91'11
  ;; (0'0) Return: con_0'0 (g166)
  mov dx, 266
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L237: ; Continuation
  ;; (91'41) Tail: app_91'38 (arg) @ n (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L238: ; Continuation
  mov ax, [bp+3]
  cmp ax, 263
  call bios_make_bool_from_z
  mov 1, ax
  push dx
  push [bp+2]
  push cx
  push #L235
  mov cx, sp
  mov bx, 1
  cmp [bx], #1
  bz L236
  push [bp+3]
  push cx
  push #L237
  mov cx, sp
  ;; (91'38) Tail: loop (g158) @ con_91'38 (g167)
  mov bp, 258
  mov dx, 267
  mov ax, [bp]
  jmp [ax]

L239: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L225
  mov ax, [bx+1]
  mov 1, ax
  push 1
  push [bp+2]
  push cx
  push #L238
  mov cx, sp
  ;; (161'26) Tail: fact (g60) @ n (t1)
  mov bp, 160
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L240: ; Continuation
  push [bp+2]
  push cx
  push #L239
  mov cx, sp
  ;; (47'9) Tail: app_47'7 (arg) @ arg1 (f3)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+3]
  mov ax, [bp]
  jmp [ax]

L241: ; Continuation
  mov bx, [bp+3]
  cmp [bx], #0
  bz L207
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov bx, 2
  cmp [bx], #1
  bz L216
  push 1
  push [bp+2]
  push cx
  push #L240
  mov cx, sp
  ;; (47'7) Tail: loop (g142) @ lit_47'7 (g154)
  mov bp, 242
  mov dx, 254
  mov ax, [bp]
  jmp [ax]

L242: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L241
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_151'13 (g135)
  mov bp, dx
  mov dx, 235
  mov ax, [bp]
  jmp [ax]

L243: ; Arm: 211'48
  push [bp+2]
  push #L198
  mov 1, sp
  push [bp+5]
  push [bp+2]
  push cx
  push #L242
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L244: ; Continuation
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L245: ; Function: t3
  push cx
  push #L244
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L246: ; Continuation
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L247: ; Function: t1
  push cx
  push #L246
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L248: ; Continuation
  mov ax, 284
  call bios_put_char
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L249: ; Continuation
  push cx
  push #L248
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_180'18 (g183)
  mov bp, dx
  mov dx, 283
  mov ax, [bp]
  jmp [ax]

L250: ; Continuation
  push [bp+2]
  push #L247
  mov 1, sp
  push cx
  push #L249
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L251: ; Continuation
  push [bp+2]
  push cx
  push #L250
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_131'25 (g182)
  mov bp, dx
  mov dx, 282
  mov ax, [bp]
  jmp [ax]

L252: ; Arm: 180'9
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push [bp+2]
  push #L245
  mov 3, sp
  push [bp+2]
  push cx
  push #L251
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t3)
  mov bp, 101
  mov dx, 3
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
  ;; (176'6) Tail: loop (g186) @ con_176'6 (g196)
  mov bp, 286
  mov dx, 296
  mov ax, [bp]
  jmp [ax]

L256: ; Continuation
  push cx
  push #L255
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_182'16 (g185)
  mov bp, dx
  mov dx, 285
  mov ax, [bp]
  jmp [ax]

L257: ; Arm: 212'49
  mov bx, [bp+4]
  cmp [bx], #1
  bz L252
  push [bp+2]
  push #L254
  mov 1, sp
  push cx
  push #L256
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L258: ; Continuation
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L259: ; Function: t1
  push cx
  push #L258
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L260: ; Continuation
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L261: ; Function: t1
  push cx
  push #L260
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L262: ; Continuation
  mov ax, 313
  call bios_put_char
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L263: ; Continuation
  push cx
  push #L262
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_191'13 (g212)
  mov bp, dx
  mov dx, 312
  mov ax, [bp]
  jmp [ax]

L264: ; Continuation
  push [bp+2]
  push #L261
  mov 1, sp
  push cx
  push #L263
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L265: ; Continuation
  push [bp+2]
  push cx
  push #L264
  mov cx, sp
  ;; (100'26) Tail: put_chars (g15) @ case_91'2 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L266: ; Arm: 91'11
  ;; (0'0) Return: con_0'0 (g210)
  mov dx, 310
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L267: ; Continuation
  ;; (91'41) Tail: app_91'38 (arg) @ n (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L268: ; Continuation
  mov ax, [bp+3]
  cmp ax, 307
  call bios_make_bool_from_z
  mov 1, ax
  push [bp+2]
  push cx
  push #L265
  mov cx, sp
  mov bx, 1
  cmp [bx], #1
  bz L266
  push [bp+3]
  push cx
  push #L267
  mov cx, sp
  ;; (91'38) Tail: loop (g202) @ con_91'38 (g211)
  mov bp, 302
  mov dx, 311
  mov ax, [bp]
  jmp [ax]

L269: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L268
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_189'13 (g201)
  mov bp, dx
  mov dx, 301
  mov ax, [bp]
  jmp [ax]

L270: ; Continuation
  push [bp+2]
  push #L259
  mov 1, sp
  push [bp+3]
  push [bp+2]
  push cx
  push #L269
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L271: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L270
  mov cx, sp
  ;; (188'12) Tail: put_chars (g15) @ app_188'46 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L272: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L271
  mov cx, sp
  ;; (188'46) Tail: app_188'20 (f4) @ app_188'60 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L273: ; Continuation
  push dx
  push [bp+5]
  push [bp+2]
  push cx
  push #L272
  mov cx, sp
  ;; (188'60) Tail: star_the_ohs (f4) @ xs (f3)
  mov dx, [bp+3]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp [ax]

L274: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L273
  mov cx, sp
  ;; (188'20) Tail: append (g8) @ app_188'29 (arg)
  mov bp, 108
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L275: ; Continuation
  push dx
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L274
  mov cx, sp
  ;; (188'29) Tail: explode (f2) @ lit_188'29 (g200)
  mov bp, [bp+2]
  mov dx, 300
  mov ax, [bp]
  jmp [ax]

L276: ; Continuation
  push dx
  push [bp+3]
  push [bp+2]
  push cx
  push #L275
  mov cx, sp
  ;; (187'17) Tail: length (g12) @ xs (f3)
  mov dx, [bp+3]
  mov bp, 112
  mov ax, [bp]
  jmp [ax]

L277: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L257
  push [bp+3]
  push [bp+2]
  push cx
  push #L276
  mov cx, sp
  ;; (186'25) Tail: map (g10) @ lam_186'30 (g199)
  mov bp, 110
  mov dx, 299
  mov ax, [bp]
  jmp [ax]

L278: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L277
  mov cx, sp
  ;; (60'44) Tail: app_60'41 (arg) @ ys (f5)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+5]
  mov ax, [bp]
  jmp [ax]

L279: ; Continuation
  push [bp+6]
  push [bp+5]
  push [bp+3]
  push [bp+2]
  push cx
  push #L278
  mov cx, sp
  ;; (60'41) Tail: app_60'33 (arg) @ command (f4)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+4]
  mov ax, [bp]
  jmp [ax]

L280: ; Continuation
  push dx
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L279
  mov cx, sp
  ;; (60'33) Tail: eq_list (g3) @ lam_0'0 (g181)
  mov bp, 103
  mov dx, 281
  mov ax, [bp]
  jmp [ax]

L281: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L243
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L280
  mov cx, sp
  ;; (212'42) Tail: explode (f2) @ lit_212'42 (g180)
  mov bp, [bp+2]
  mov dx, 280
  mov ax, [bp]
  jmp [ax]

L282: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L281
  mov cx, sp
  ;; (60'44) Tail: app_60'41 (arg) @ ys (f6)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+6]
  mov ax, [bp]
  jmp [ax]

L283: ; Continuation
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L282
  mov cx, sp
  ;; (60'41) Tail: app_60'33 (arg) @ command (f4)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+4]
  mov ax, [bp]
  jmp [ax]

L284: ; Continuation
  push dx
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L283
  mov cx, sp
  ;; (60'33) Tail: eq_list (g3) @ lam_0'0 (g134)
  mov bp, 103
  mov dx, 234
  mov ax, [bp]
  jmp [ax]

L285: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L196
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L284
  mov cx, sp
  ;; (211'40) Tail: explode (f2) @ lit_211'40 (g133)
  mov bp, [bp+2]
  mov dx, 233
  mov ax, [bp]
  jmp [ax]

L286: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L285
  mov cx, sp
  ;; (60'44) Tail: app_60'41 (arg) @ ys (f6)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+6]
  mov ax, [bp]
  jmp [ax]

L287: ; Continuation
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L286
  mov cx, sp
  ;; (60'41) Tail: app_60'33 (arg) @ command (f4)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+4]
  mov ax, [bp]
  jmp [ax]

L288: ; Continuation
  push dx
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L287
  mov cx, sp
  ;; (60'33) Tail: eq_list (g3) @ lam_0'0 (g87)
  mov bp, 103
  mov dx, 187
  mov ax, [bp]
  jmp [ax]

L289: ; Continuation
  push [bp+3]
  push cx
  push #L148
  mov cx, sp
  mov bx, dx
  cmp [bx], #0
  bz L149
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push 2
  push 1
  push [bp+4]
  push [bp+2]
  push cx
  push #L288
  mov cx, sp
  ;; (210'38) Tail: explode (f2) @ lit_210'38 (g86)
  mov bp, [bp+2]
  mov dx, 186
  mov ax, [bp]
  jmp [ax]

L290: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L289
  mov cx, sp
  ;; (203'18) Tail: app_203'15 (arg) @ xs (f4)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+4]
  mov ax, [bp]
  jmp [ax]

L291: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L290
  mov cx, sp
  ;; (203'15) Tail: app_203'12 (arg) @ con_203'15 (g84)
  mov bp, dx
  mov dx, 184
  mov ax, [bp]
  jmp [ax]

L292: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L147
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L291
  mov cx, sp
  ;; (203'12) Tail: splitloop (g66) @ con_203'12 (g83)
  mov bp, 166
  mov dx, 183
  mov ax, [bp]
  jmp [ax]

L293: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L292
  mov cx, sp
  ;; (60'44) Tail: app_60'41 (arg) @ con_0'0 (g81)
  mov bp, dx
  mov dx, 181
  mov ax, [bp]
  jmp [ax]

L294: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L293
  mov cx, sp
  ;; (60'41) Tail: app_60'33 (arg) @ xs (f4)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+4]
  mov ax, [bp]
  jmp [ax]

L295: ; Continuation
  push dx
  push [bp+3]
  push [bp+2]
  push cx
  push #L294
  mov cx, sp
  ;; (60'33) Tail: eq_list (g3) @ lam_0'0 (g78)
  mov bp, 103
  mov dx, 178
  mov ax, [bp]
  jmp [ax]

L296: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L295
  mov cx, sp
  ;; (121'28) Tail: readloop (g23) @ con_121'28 (g77)
  mov bp, 123
  mov dx, 177
  mov ax, [bp]
  jmp [ax]

L297: ; Function: t1
  push bp
  push [bp+1]
  push cx
  push #L296
  mov cx, sp
  ;; (216'12) Tail: put_chars (g15) @ con_216'13 (g76)
  mov bp, 115
  mov dx, 176
  mov ax, [bp]
  jmp [ax]

L298: ; Continuation
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L299: ; Function: t2
  push cx
  push #L298
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L300: ; Continuation
  ;; (223'11) Tail: mainloop (f2) @ con_223'11 (g216)
  mov bp, [bp+2]
  mov dx, 316
  mov ax, [bp]
  jmp [ax]

L301: ; Continuation
  push [bp+2]
  push cx
  push #L300
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_222'13 (g215)
  mov bp, dx
  mov dx, 315
  mov ax, [bp]
  jmp [ax]

L302: ; Continuation
  push dx
  push #L297
  mov 1, sp
  push dx
  push #L299
  mov 2, sp
  push 1
  push cx
  push #L301
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t2)
  mov bp, 101
  mov dx, 2
  mov ax, [bp]
  jmp [ax]

L303: ; Start
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
  push #L14
  mov 103, sp
  push #L19
  mov 108, sp
  push #L23
  mov 109, sp
  push #0
  mov 111, sp
  push #L29
  mov 110, sp
  mov ax, #0
  mov 113, ax
  mov ax, #1
  mov 114, ax
  push #L32
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
  push #L38
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
  push #L58
  mov 123, sp
  mov ax, #2
  mov 157, ax
  mov ax, #1
  mov 158, ax
  mov ax, #2
  mov 159, ax
  push #L62
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
  push #L67
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
  push #L81
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
  push #L83
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
  push #L85
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
  mov 200, ax
  push #0
  mov 201, sp
  push #1
  mov 202, sp
  push #1
  mov 203, sp
  push #1
  mov 204, sp
  push #1
  mov 205, sp
  mov ax, #10
  mov 206, ax
  push #L97
  mov 195, sp
  mov ax, #0
  mov 207, ax
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
  mov 208, ax
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
  mov 209, ax
  mov ax, #'\n'
  mov 210, ax
  mov ax, #0
  mov 212, ax
  mov ax, #10
  mov 213, ax
  mov ax, #48
  mov 214, ax
  mov ax, #10
  mov 215, ax
  push #L101
  mov 211, sp
  mov ax, #0
  mov 216, ax
  mov ax, #'0'
  mov 217, ax
  push #0
  mov 218, sp
  push 218
  push 217
  push #1
  mov 219, sp
  push #0
  mov 220, sp
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
  mov 221, ax
  mov ax, #0
  mov 223, ax
  mov ax, #10
  mov 224, ax
  mov ax, #48
  mov 225, ax
  mov ax, #10
  mov 226, ax
  push #L105
  mov 222, sp
  mov ax, #0
  mov 227, ax
  mov ax, #'0'
  mov 228, ax
  push #0
  mov 229, sp
  push 229
  push 228
  push #1
  mov 230, sp
  push #0
  mov 231, sp
  mov ax, #'\n'
  mov 232, ax
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
  mov 233, ax
  push #L107
  mov 234, sp
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
  mov 235, ax
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
  mov 236, ax
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
  mov 237, ax
  mov ax, #'\n'
  mov 238, ax
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
  mov 239, ax
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
  mov 240, ax
  mov ax, #'\n'
  mov 241, ax
  mov ax, #48
  mov 243, ax
  mov ax, #0
  mov 244, ax
  push #0
  mov 245, sp
  push #1
  mov 246, sp
  mov ax, #9
  mov 247, ax
  push #0
  mov 248, sp
  push #1
  mov 249, sp
  push #1
  mov 250, sp
  push #1
  mov 251, sp
  push #1
  mov 252, sp
  mov ax, #10
  mov 253, ax
  push #L119
  mov 242, sp
  mov ax, #0
  mov 254, ax
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
  mov 255, ax
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
  mov 256, ax
  mov ax, #'\n'
  mov 257, ax
  mov ax, #0
  mov 259, ax
  mov ax, #10
  mov 260, ax
  mov ax, #48
  mov 261, ax
  mov ax, #10
  mov 262, ax
  push #L123
  mov 258, sp
  mov ax, #0
  mov 263, ax
  mov ax, #'0'
  mov 264, ax
  push #0
  mov 265, sp
  push 265
  push 264
  push #1
  mov 266, sp
  push #0
  mov 267, sp
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
  mov 268, ax
  mov ax, #0
  mov 270, ax
  mov ax, #10
  mov 271, ax
  mov ax, #48
  mov 272, ax
  mov ax, #10
  mov 273, ax
  push #L127
  mov 269, sp
  mov ax, #0
  mov 274, ax
  mov ax, #'0'
  mov 275, ax
  push #0
  mov 276, sp
  push 276
  push 275
  push #1
  mov 277, sp
  push #0
  mov 278, sp
  mov ax, #'\n'
  mov 279, ax
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
  mov 280, ax
  push #L129
  mov 281, sp
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
  mov 282, ax
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
  mov 283, ax
  mov ax, #'\n'
  mov 284, ax
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
  mov 285, ax
  push #0
  mov 287, sp
  push #L131
  mov 288, sp
  mov ax, #'\EOT'
  mov 289, ax
  push #0
  mov 290, sp
  push 290
  push 289
  push #1
  mov 291, sp
  push #0
  mov 292, sp
  push #0
  mov 293, sp
  mov ax, #'\n'
  mov 294, ax
  push #0
  mov 295, sp
  push #L140
  mov 286, sp
  push #0
  mov 296, sp
  mov ax, #'o'
  mov 297, ax
  mov ax, #'*'
  mov 298, ax
  push #L142
  mov 299, sp
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
  mov 300, ax
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
  mov 301, ax
  mov ax, #0
  mov 303, ax
  mov ax, #10
  mov 304, ax
  mov ax, #48
  mov 305, ax
  mov ax, #10
  mov 306, ax
  push #L146
  mov 302, sp
  mov ax, #0
  mov 307, ax
  mov ax, #'0'
  mov 308, ax
  push #0
  mov 309, sp
  push 309
  push 308
  push #1
  mov 310, sp
  push #0
  mov 311, sp
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
  mov 312, ax
  mov ax, #'\n'
  mov 313, ax
  push #0
  mov 314, sp
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
  mov 315, ax
  push #0
  mov 316, sp
  push cx
  push #L302
  mov cx, sp
  ;; (4'23) Tail: block (g1) @ lam_0'0 (g2)
  mov bp, 101
  mov dx, 102
  mov ax, [bp]
  jmp [ax]


