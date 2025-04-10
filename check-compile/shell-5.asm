(*Stage5 (ASM)*)
L1: ; Function: t1
  ;; (9'54) Tail: f (f1) @ a (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L2: ; Function: g1
  push dx
  push #L1
  mov 1, sp
  ;; (0'0) Return: lam_9'31 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L3: ; Arm: 4'13
  ;; (3'23) Return: acc (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L4: ; Continuation
  mov ax, [bp+2]
  sub ax, 103
  mov 1, ax
  ;; (5'45) Tail: app_5'19 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L5: ; Function: t1
  mov ax, dx
  cmp ax, 102
  call bios_make_bool_from_n
  mov 1, ax
  mov bx, 1
  cmp [bx], #1
  bz L3
  mov ax, [bp+1]
  mov bx, dx
  call bios_string_index
  mov 2, ax
  push [bp+2]
  push 2
  push #1
  mov 3, sp
  push dx
  push cx
  push #L4
  mov cx, sp
  ;; (5'19) Tail: explode_loop (f3) @ con_0'0 (t3)
  mov bp, [bp+3]
  mov dx, 3
  mov ax, [bp]
  jmp [ax]

L6: ; Function: t1
  push bp
  push dx
  push [bp+1]
  push #L5
  mov 1, sp
  ;; (0'0) Return: lam_3'27 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L7: ; Continuation
  mov ax, [bp+2]
  sub ax, 105
  mov 1, ax
  ;; (7'18) Tail: app_7'15 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L8: ; Function: g6
  push dx
  push #L6
  mov 1, sp
  mov ax, dx
  call bios_string_length
  mov 2, ax
  push 2
  push cx
  push #L7
  mov cx, sp
  ;; (7'15) Tail: explode_loop (t1) @ con_7'15 (g4)
  mov bp, 1
  mov dx, 104
  mov ax, [bp]
  jmp [ax]

L9: ; Arm: 60'30
  ;; (0'0) Return: con_60'33 (g8)
  mov dx, 108
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L10: ; Arm: 60'7
  mov bx, dx
  cmp [bx], #0
  bz L9
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  ;; (0'0) Return: con_60'48 (g9)
  mov dx, 109
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L11: ; Arm: 63'10
  ;; (0'0) Return: con_63'13 (g10)
  mov dx, 110
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L12: ; Continuation
  ;; (65'37) Tail: app_65'34 (arg) @ ys (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L13: ; Continuation
  push [bp+3]
  push cx
  push #L12
  mov cx, sp
  ;; (65'34) Tail: app_65'31 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L14: ; Arm: 65'18
  push [bp+4]
  push [bp+3]
  push cx
  push #L13
  mov cx, sp
  ;; (65'31) Tail: eq_list (g7) @ eq (f2)
  mov dx, [bp+2]
  mov bp, 107
  mov ax, [bp]
  jmp [ax]

L15: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L14
  ;; (0'0) Return: con_65'45 (g11)
  mov dx, 111
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L16: ; Continuation
  push [bp+5]
  push [bp+3]
  push [bp+2]
  push cx
  push #L15
  mov cx, sp
  ;; (65'16) Tail: app_65'14 (arg) @ y (f4)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+4]
  mov ax, [bp]
  jmp [ax]

L17: ; Function: t1
  mov bx, [bp+2]
  cmp [bx], #0
  bz L10
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov bx, dx
  cmp [bx], #0
  bz L11
  mov ax, [bx+1]
  mov 3, ax
  mov ax, [bx+2]
  mov 4, ax
  push 4
  push 3
  push 2
  push [bp+1]
  push cx
  push #L16
  mov cx, sp
  ;; (65'14) Tail: eq (f1) @ x (t1)
  mov bp, [bp+1]
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L18: ; Function: t1
  push dx
  push [bp+1]
  push #L17
  mov 1, sp
  ;; (0'0) Return: lam_58'22 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L19: ; Function: g7
  push dx
  push #L18
  mov 1, sp
  ;; (0'0) Return: lam_58'19 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L20: ; Arm: 71'7
  ;; (69'18) Return: ys (arg)
  mov dx, dx
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L21: ; Continuation
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

L22: ; Continuation
  push [bp+3]
  push cx
  push #L21
  mov cx, sp
  ;; (72'31) Tail: app_72'28 (arg) @ ys (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L23: ; Function: t1
  mov bx, [bp+1]
  cmp [bx], #0
  bz L20
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push 1
  push dx
  push cx
  push #L22
  mov cx, sp
  ;; (72'28) Tail: append (g12) @ xs (t2)
  mov bp, 112
  mov dx, 2
  mov ax, [bp]
  jmp [ax]

L24: ; Function: g12
  push dx
  push #L23
  mov 1, sp
  ;; (0'0) Return: lam_69'18 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L25: ; Arm: 76'7
  ;; (74'16) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L26: ; Continuation
  ;; (77'34) Tail: app_77'21 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L27: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L25
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
  push #L26
  mov cx, sp
  ;; (77'21) Tail: revloop (g13) @ con_0'0 (t3)
  mov bp, 113
  mov dx, 3
  mov ax, [bp]
  jmp [ax]

L28: ; Function: g13
  push dx
  push #L27
  mov 1, sp
  ;; (0'0) Return: lam_74'20 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L29: ; Arm: 83'7
  ;; (0'0) Return: con_83'10 (g15)
  mov dx, 115
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L30: ; Continuation
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

L31: ; Continuation
  push [bp+3]
  push cx
  push #L30
  mov cx, sp
  ;; (84'26) Tail: app_84'24 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L32: ; Continuation
  push dx
  push [bp+3]
  push cx
  push #L31
  mov cx, sp
  ;; (84'24) Tail: map (g14) @ f (f2)
  mov dx, [bp+2]
  mov bp, 114
  mov ax, [bp]
  jmp [ax]

L33: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L29
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push 2
  push [bp+1]
  push cx
  push #L32
  mov cx, sp
  ;; (84'15) Tail: f (f1) @ x (t1)
  mov bp, [bp+1]
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L34: ; Function: g14
  push dx
  push #L33
  mov 1, sp
  ;; (0'0) Return: lam_81'14 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L35: ; Arm: 88'7
  ;; (0'0) Return: lit_88'10 (g17)
  mov dx, 117
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L36: ; Continuation
  mov ax, 118
  add ax, dx
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L37: ; Function: g16
  mov bx, dx
  cmp [bx], #0
  bz L35
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push cx
  push #L36
  mov cx, sp
  ;; (89'27) Tail: length (g16) @ xs (t2)
  mov bp, 116
  mov dx, 2
  mov ax, [bp]
  jmp [ax]

L38: ; Arm: 102'7
  ;; (0'0) Return: con_102'10 (g20)
  mov dx, 120
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L39: ; Continuation
  ;; (103'35) Tail: put_chars (g19) @ xs (f2)
  mov dx, [bp+2]
  mov bp, 119
  mov ax, [bp]
  jmp [ax]

L40: ; Arm: 26'19
  mov ax, 1
  call bios_put_char
  mov 5, ax
  ;; (0'0) Return: prim_0'0 (t5)
  mov dx, 5
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L41: ; Arm: 27'22
  mov ax, 1
  call bios_put_char
  mov 6, ax
  ;; (0'0) Return: prim_0'0 (t6)
  mov dx, 6
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L42: ; Arm: 28'16
  mov ax, 1
  call bios_put_char
  mov 7, ax
  ;; (0'0) Return: prim_0'0 (t7)
  mov dx, 7
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L43: ; Function: g19
  mov bx, dx
  cmp [bx], #0
  bz L38
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov ax, 1
  call bios_char_to_num
  mov 3, ax
  mov ax, 3
  cmp ax, 121
  call bios_make_bool_from_z
  mov 4, ax
  push 2
  push cx
  push #L39
  mov cx, sp
  mov bx, 4
  cmp [bx], #1
  bz L40
  mov ax, 1
  cmp ax, 122
  call bios_make_bool_from_z
  mov 5, ax
  mov bx, 5
  cmp [bx], #1
  bz L41
  mov ax, 123
  cmp ax, 3
  call bios_make_bool_from_n
  mov 6, ax
  mov bx, 6
  cmp [bx], #1
  bz L42
  mov ax, 124
  call bios_put_char
  mov 7, ax
  mov ax, 125
  add ax, 3
  mov 8, ax
  mov ax, 8
  sub ax, 126
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

L44: ; Continuation
  ;; (79'28) Tail: app_79'25 (arg) @ acc (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L45: ; Arm: 115'20
  mov ax, 130
  call bios_put_char
  mov 4, ax
  push dx
  push cx
  push #L44
  mov cx, sp
  ;; (79'25) Tail: revloop (g13) @ con_79'25 (g31)
  mov bp, 113
  mov dx, 131
  mov ax, [bp]
  jmp [ax]

L46: ; Continuation
  push [bp+2]
  push 141
  push #1
  mov 1, sp
  ;; (79'28) Tail: app_79'25 (arg) @ con_0'0 (t1)
  mov bp, dx
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L47: ; Continuation
  mov ax, 139
  call bios_put_char
  mov 1, ax
  push [bp+2]
  push cx
  push #L46
  mov cx, sp
  ;; (79'25) Tail: revloop (g13) @ con_79'25 (g40)
  mov bp, 113
  mov dx, 140
  mov ax, [bp]
  jmp [ax]

L48: ; Arm: 26'19
  mov ax, 1
  call bios_put_char
  mov 7, ax
  ;; (0'0) Return: prim_0'0 (t7)
  mov dx, 7
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L49: ; Arm: 27'22
  mov ax, 1
  call bios_put_char
  mov 8, ax
  ;; (0'0) Return: prim_0'0 (t8)
  mov dx, 8
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L50: ; Arm: 28'16
  mov ax, 1
  call bios_put_char
  mov 9, ax
  ;; (0'0) Return: prim_0'0 (t9)
  mov dx, 9
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L51: ; Arm: 116'26
  mov ax, 1
  call bios_char_to_num
  mov 5, ax
  mov ax, 5
  cmp ax, 133
  call bios_make_bool_from_z
  mov 6, ax
  push dx
  push cx
  push #L47
  mov cx, sp
  mov bx, 6
  cmp [bx], #1
  bz L48
  mov ax, 1
  cmp ax, 134
  call bios_make_bool_from_z
  mov 7, ax
  mov bx, 7
  cmp [bx], #1
  bz L49
  mov ax, 135
  cmp ax, 5
  call bios_make_bool_from_n
  mov 8, ax
  mov bx, 8
  cmp [bx], #1
  bz L50
  mov ax, 136
  call bios_put_char
  mov 9, ax
  mov ax, 137
  add ax, 5
  mov 10, ax
  mov ax, 10
  sub ax, 138
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

L52: ; Arm: 117'17
  ;; (117'31) Tail: readloop (g27) @ acc (arg)
  mov bp, 127
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L53: ; Arm: 120'15
  ;; (120'27) Tail: readloop (g27) @ acc (arg)
  mov bp, 127
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L54: ; Continuation
  mov ax, 151
  call bios_put_char
  mov 1, ax
  mov ax, 152
  call bios_put_char
  mov 2, ax
  mov ax, 153
  call bios_put_char
  mov 3, ax
  ;; (124'22) Tail: readloop (g27) @ tail (f2)
  mov dx, [bp+2]
  mov bp, 127
  mov ax, [bp]
  jmp [ax]

L55: ; Arm: 122'29
  mov ax, 147
  call bios_put_char
  mov 1, ax
  mov ax, 148
  call bios_put_char
  mov 2, ax
  mov ax, 149
  call bios_put_char
  mov 3, ax
  ;; (0'0) Return: prim_0'0 (t3)
  mov dx, 3
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L56: ; Continuation
  push [bp+2]
  push cx
  push #L54
  mov cx, sp
  mov bx, dx
  cmp [bx], #1
  bz L55
  ;; (0'0) Return: con_122'53 (g50)
  mov dx, 150
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L57: ; Arm: 15'9
  ;; (0'0) Return: con_15'12 (g45)
  mov dx, 145
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L58: ; Arm: 118'19
  mov bx, dx
  cmp [bx], #0
  bz L53
  mov ax, [bx+1]
  mov 7, ax
  mov ax, [bx+2]
  mov 8, ax
  mov ax, 7
  call bios_char_to_num
  mov 9, ax
  mov ax, 144
  cmp ax, 9
  call bios_make_bool_from_n
  mov 10, ax
  push 8
  push cx
  push #L56
  mov cx, sp
  mov bx, 10
  cmp [bx], #1
  bz L57
  ;; (0'0) Return: con_16'13 (g46)
  mov dx, 146
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L59: ; Continuation
  push [bp+2]
  push [bp+3]
  push #1
  mov 1, sp
  ;; (126'32) Tail: readloop (g27) @ con_0'0 (t1)
  mov bp, 127
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L60: ; Arm: 26'19
  mov ax, 1
  call bios_put_char
  mov 9, ax
  ;; (0'0) Return: prim_0'0 (t9)
  mov dx, 9
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L61: ; Arm: 27'22
  mov ax, 1
  call bios_put_char
  mov 10, ax
  ;; (0'0) Return: prim_0'0 (t10)
  mov dx, 10
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L62: ; Arm: 28'16
  mov ax, 1
  call bios_put_char
  mov 11, ax
  ;; (0'0) Return: prim_0'0 (t11)
  mov dx, 11
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L63: ; Function: g27
  call bios_get_char
  mov 1, ax
  mov ax, 1
  call bios_char_to_num
  mov 2, ax
  mov ax, 1
  cmp ax, 129
  call bios_make_bool_from_z
  mov 3, ax
  mov bx, 3
  cmp [bx], #1
  bz L45
  mov ax, 1
  cmp ax, 132
  call bios_make_bool_from_z
  mov 4, ax
  mov bx, 4
  cmp [bx], #1
  bz L51
  mov ax, 142
  cmp ax, 2
  call bios_make_bool_from_n
  mov 5, ax
  mov bx, 5
  cmp [bx], #1
  bz L52
  mov ax, 2
  cmp ax, 143
  call bios_make_bool_from_z
  mov 6, ax
  mov bx, 6
  cmp [bx], #1
  bz L58
  mov ax, 1
  call bios_char_to_num
  mov 7, ax
  mov ax, 7
  cmp ax, 154
  call bios_make_bool_from_z
  mov 8, ax
  push 1
  push dx
  push cx
  push #L59
  mov cx, sp
  mov bx, 8
  cmp [bx], #1
  bz L60
  mov ax, 1
  cmp ax, 155
  call bios_make_bool_from_z
  mov 9, ax
  mov bx, 9
  cmp [bx], #1
  bz L61
  mov ax, 156
  cmp ax, 7
  call bios_make_bool_from_n
  mov 10, ax
  mov bx, 10
  cmp [bx], #1
  bz L62
  mov ax, 157
  call bios_put_char
  mov 11, ax
  mov ax, 158
  add ax, 7
  mov 12, ax
  mov ax, 12
  sub ax, 159
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

L64: ; Arm: 132'11
  ;; (130'12) Return: n (arg)
  mov dx, dx
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L65: ; Continuation
  mov ax, [bp+2]
  add ax, dx
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L66: ; Continuation
  mov ax, [bp+2]
  sub ax, 163
  mov 1, ax
  push dx
  push cx
  push #L65
  mov cx, sp
  ;; (132'39) Tail: fib (g60) @ prim_0'0 (t1)
  mov bp, 160
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L67: ; Function: g60
  mov ax, dx
  cmp ax, 161
  call bios_make_bool_from_n
  mov 1, ax
  mov bx, 1
  cmp [bx], #1
  bz L64
  mov ax, dx
  sub ax, 162
  mov 2, ax
  push dx
  push cx
  push #L66
  mov cx, sp
  ;; (132'27) Tail: fib (g60) @ prim_0'0 (t2)
  mov bp, 160
  mov dx, 2
  mov ax, [bp]
  jmp [ax]

L68: ; Continuation
  mov ax, dx
  mul ax, [bp+2]
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L69: ; Arm: 136'12
  mov ax, [bp+2]
  sub ax, 168
  mov 1, ax
  push [bp+2]
  push cx
  push #L68
  mov cx, sp
  ;; (136'22) Tail: fact (g64) @ prim_0'0 (t1)
  mov bp, 164
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L70: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L69
  ;; (0'0) Return: lit_136'37 (g69)
  mov dx, 169
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L71: ; Arm: 15'9
  ;; (0'0) Return: con_15'12 (g66)
  mov dx, 166
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L72: ; Function: g64
  mov ax, dx
  cmp ax, 165
  call bios_make_bool_from_n
  mov 1, ax
  push dx
  push cx
  push #L70
  mov cx, sp
  mov bx, 1
  cmp [bx], #1
  bz L71
  ;; (0'0) Return: con_16'13 (g67)
  mov dx, 167
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L73: ; Continuation
  push [bp+2]
  push [bp+3]
  push #1
  mov 1, sp
  ;; (79'28) Tail: app_79'25 (arg) @ con_0'0 (t1)
  mov bp, dx
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L74: ; Continuation
  push dx
  push [bp+2]
  push cx
  push #L73
  mov cx, sp
  ;; (79'25) Tail: revloop (g13) @ con_79'25 (g72)
  mov bp, 113
  mov dx, 172
  mov ax, [bp]
  jmp [ax]

L75: ; Continuation
  push [bp+2]
  push cx
  push #L74
  mov cx, sp
  ;; (79'28) Tail: app_79'25 (arg) @ accCs (f3)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+3]
  mov ax, [bp]
  jmp [ax]

L76: ; Arm: 203'7
  push [bp+2]
  push [bp+1]
  push cx
  push #L75
  mov cx, sp
  ;; (79'25) Tail: revloop (g13) @ con_79'25 (g71)
  mov bp, 113
  mov dx, 171
  mov ax, [bp]
  jmp [ax]

L77: ; Continuation
  ;; (206'65) Tail: app_206'62 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L78: ; Continuation
  push [bp+2]
  push cx
  push #L77
  mov cx, sp
  ;; (206'62) Tail: app_206'37 (arg) @ con_206'62 (g75)
  mov bp, dx
  mov dx, 175
  mov ax, [bp]
  jmp [ax]

L79: ; Continuation
  push [bp+2]
  push dx
  push #1
  mov 1, sp
  push [bp+3]
  push cx
  push #L78
  mov cx, sp
  ;; (206'37) Tail: splitloop (g70) @ con_0'0 (t1)
  mov bp, 170
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L80: ; Continuation
  push [bp+4]
  push [bp+2]
  push cx
  push #L79
  mov cx, sp
  ;; (79'28) Tail: app_79'25 (arg) @ accCs (f3)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+3]
  mov ax, [bp]
  jmp [ax]

L81: ; Arm: 206'22
  push 2
  push [bp+2]
  push [bp+1]
  push cx
  push #L80
  mov cx, sp
  ;; (79'25) Tail: revloop (g13) @ con_79'25 (g74)
  mov bp, 113
  mov dx, 174
  mov ax, [bp]
  jmp [ax]

L82: ; Continuation
  ;; (207'37) Tail: app_207'26 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L83: ; Continuation
  push [bp+2]
  push [bp+3]
  push #1
  mov 1, sp
  push [bp+4]
  push cx
  push #L82
  mov cx, sp
  ;; (207'26) Tail: app_207'20 (arg) @ con_0'0 (t1)
  mov bp, dx
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L84: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L76
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov ax, 1
  cmp ax, 173
  call bios_make_bool_from_z
  mov 3, ax
  mov bx, 3
  cmp [bx], #1
  bz L81
  push 2
  push 1
  push [bp+2]
  push cx
  push #L83
  mov cx, sp
  ;; (207'20) Tail: splitloop (g70) @ accWs (f1)
  mov dx, [bp+1]
  mov bp, 170
  mov ax, [bp]
  jmp [ax]

L85: ; Function: t1
  push dx
  push [bp+1]
  push #L84
  mov 1, sp
  ;; (0'0) Return: lam_201'30 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L86: ; Function: g70
  push dx
  push #L85
  mov 1, sp
  ;; (0'0) Return: lam_201'24 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L87: ; Function: t1
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

L88: ; Function: g82
  push dx
  push #L87
  mov 1, sp
  ;; (0'0) Return: lam_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L89: ; Function: t1
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

L90: ; Function: g91
  push dx
  push #L89
  mov 1, sp
  ;; (0'0) Return: lam_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L91: ; Arm: 48'9
  push [bp+1]
  push #0
  mov 1, sp
  ;; (0'0) Return: con_48'12 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L92: ; Arm: 51'15
  ;; (0'0) Return: con_51'18 (g109)
  mov dx, 209
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L93: ; Continuation
  ;; (52'40) Tail: app_52'25 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L94: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L92
  mov ax, [bx+1]
  mov 1, ax
  mov ax, 210
  mul ax, [bp+2]
  mov 2, ax
  mov ax, 2
  add ax, 1
  mov 3, ax
  push [bp+3]
  push cx
  push #L93
  mov cx, sp
  ;; (52'25) Tail: loop (g99) @ prim_0'0 (t3)
  mov bp, 199
  mov dx, 3
  mov ax, [bp]
  jmp [ax]

L95: ; Arm: 43'27
  push [bp+2]
  push #0
  mov 1, sp
  ;; (0'0) Return: con_43'32 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L96: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L95
  ;; (0'0) Return: con_43'45 (g107)
  mov dx, 207
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L97: ; Arm: 15'9
  ;; (0'0) Return: con_15'12 (g105)
  mov dx, 205
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L98: ; Arm: 43'12
  mov ax, 204
  cmp ax, [bp+4]
  call bios_make_bool_from_n
  mov 1, ax
  push [bp+4]
  push cx
  push #L96
  mov cx, sp
  mov bx, 1
  cmp [bx], #1
  bz L97
  ;; (0'0) Return: con_16'13 (g106)
  mov dx, 206
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L99: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L94
  mov cx, sp
  mov bx, dx
  cmp [bx], #1
  bz L98
  ;; (0'0) Return: con_43'55 (g108)
  mov dx, 208
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L100: ; Arm: 15'9
  ;; (0'0) Return: con_15'12 (g102)
  mov dx, 202
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L101: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L91
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov ax, 1
  call bios_char_to_num
  mov 3, ax
  mov ax, 3
  sub ax, 200
  mov 4, ax
  mov ax, 4
  cmp ax, 201
  call bios_make_bool_from_n
  mov 5, ax
  push 4
  push 2
  push [bp+1]
  push cx
  push #L99
  mov cx, sp
  mov bx, 5
  cmp [bx], #1
  bz L100
  ;; (0'0) Return: con_16'13 (g103)
  mov dx, 203
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L102: ; Function: g99
  push dx
  push #L101
  mov 1, sp
  ;; (0'0) Return: lam_46'19 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L103: ; Arm: 95'13
  ;; (94'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L104: ; Continuation
  mov ax, [bp+2]
  div ax, 219
  mov 1, ax
  ;; (96'45) Tail: app_96'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L105: ; Function: t1
  mov ax, dx
  cmp ax, 216
  call bios_make_bool_from_z
  mov 1, ax
  mov bx, 1
  cmp [bx], #1
  bz L103
  mov ax, dx
  mod ax, 217
  mov 2, ax
  mov ax, 218
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
  push #L104
  mov cx, sp
  ;; (96'11) Tail: loop (g115) @ con_0'0 (t5)
  mov bp, 215
  mov dx, 5
  mov ax, [bp]
  jmp [ax]

L106: ; Function: g115
  push dx
  push #L105
  mov 1, sp
  ;; (0'0) Return: lam_94'19 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L107: ; Arm: 95'13
  ;; (94'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L108: ; Continuation
  mov ax, [bp+2]
  div ax, 230
  mov 1, ax
  ;; (96'45) Tail: app_96'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L109: ; Function: t1
  mov ax, dx
  cmp ax, 227
  call bios_make_bool_from_z
  mov 1, ax
  mov bx, 1
  cmp [bx], #1
  bz L107
  mov ax, dx
  mod ax, 228
  mov 2, ax
  mov ax, 229
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
  push #L108
  mov cx, sp
  ;; (96'11) Tail: loop (g126) @ con_0'0 (t5)
  mov bp, 226
  mov dx, 5
  mov ax, [bp]
  jmp [ax]

L110: ; Function: g126
  push dx
  push #L109
  mov 1, sp
  ;; (0'0) Return: lam_94'19 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L111: ; Function: t1
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

L112: ; Function: g138
  push dx
  push #L111
  mov 1, sp
  ;; (0'0) Return: lam_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L113: ; Arm: 48'9
  push [bp+1]
  push #0
  mov 1, sp
  ;; (0'0) Return: con_48'12 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L114: ; Arm: 51'15
  ;; (0'0) Return: con_51'18 (g156)
  mov dx, 256
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L115: ; Continuation
  ;; (52'40) Tail: app_52'25 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L116: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L114
  mov ax, [bx+1]
  mov 1, ax
  mov ax, 257
  mul ax, [bp+2]
  mov 2, ax
  mov ax, 2
  add ax, 1
  mov 3, ax
  push [bp+3]
  push cx
  push #L115
  mov cx, sp
  ;; (52'25) Tail: loop (g146) @ prim_0'0 (t3)
  mov bp, 246
  mov dx, 3
  mov ax, [bp]
  jmp [ax]

L117: ; Arm: 43'27
  push [bp+2]
  push #0
  mov 1, sp
  ;; (0'0) Return: con_43'32 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L118: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L117
  ;; (0'0) Return: con_43'45 (g154)
  mov dx, 254
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L119: ; Arm: 15'9
  ;; (0'0) Return: con_15'12 (g152)
  mov dx, 252
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L120: ; Arm: 43'12
  mov ax, 251
  cmp ax, [bp+4]
  call bios_make_bool_from_n
  mov 1, ax
  push [bp+4]
  push cx
  push #L118
  mov cx, sp
  mov bx, 1
  cmp [bx], #1
  bz L119
  ;; (0'0) Return: con_16'13 (g153)
  mov dx, 253
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L121: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L116
  mov cx, sp
  mov bx, dx
  cmp [bx], #1
  bz L120
  ;; (0'0) Return: con_43'55 (g155)
  mov dx, 255
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L122: ; Arm: 15'9
  ;; (0'0) Return: con_15'12 (g149)
  mov dx, 249
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L123: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L113
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov ax, 1
  call bios_char_to_num
  mov 3, ax
  mov ax, 3
  sub ax, 247
  mov 4, ax
  mov ax, 4
  cmp ax, 248
  call bios_make_bool_from_n
  mov 5, ax
  push 4
  push 2
  push [bp+1]
  push cx
  push #L121
  mov cx, sp
  mov bx, 5
  cmp [bx], #1
  bz L122
  ;; (0'0) Return: con_16'13 (g150)
  mov dx, 250
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L124: ; Function: g146
  push dx
  push #L123
  mov 1, sp
  ;; (0'0) Return: lam_46'19 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L125: ; Arm: 95'13
  ;; (94'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L126: ; Continuation
  mov ax, [bp+2]
  div ax, 266
  mov 1, ax
  ;; (96'45) Tail: app_96'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L127: ; Function: t1
  mov ax, dx
  cmp ax, 263
  call bios_make_bool_from_z
  mov 1, ax
  mov bx, 1
  cmp [bx], #1
  bz L125
  mov ax, dx
  mod ax, 264
  mov 2, ax
  mov ax, 265
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
  push #L126
  mov cx, sp
  ;; (96'11) Tail: loop (g162) @ con_0'0 (t5)
  mov bp, 262
  mov dx, 5
  mov ax, [bp]
  jmp [ax]

L128: ; Function: g162
  push dx
  push #L127
  mov 1, sp
  ;; (0'0) Return: lam_94'19 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L129: ; Arm: 95'13
  ;; (94'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L130: ; Continuation
  mov ax, [bp+2]
  div ax, 277
  mov 1, ax
  ;; (96'45) Tail: app_96'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L131: ; Function: t1
  mov ax, dx
  cmp ax, 274
  call bios_make_bool_from_z
  mov 1, ax
  mov bx, 1
  cmp [bx], #1
  bz L129
  mov ax, dx
  mod ax, 275
  mov 2, ax
  mov ax, 276
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
  push #L130
  mov cx, sp
  ;; (96'11) Tail: loop (g173) @ con_0'0 (t5)
  mov bp, 273
  mov dx, 5
  mov ax, [bp]
  jmp [ax]

L132: ; Function: g173
  push dx
  push #L131
  mov 1, sp
  ;; (0'0) Return: lam_94'19 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L133: ; Function: t1
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

L134: ; Function: g185
  push dx
  push #L133
  mov 1, sp
  ;; (0'0) Return: lam_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L135: ; Function: t1
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

L136: ; Function: g192
  push dx
  push #L135
  mov 1, sp
  ;; (0'0) Return: lam_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L137: ; Arm: 180'39
  ;; (0'0) Return: con_180'44 (g196)
  mov dx, 296
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L138: ; Continuation
  mov ax, 298
  call bios_put_char
  mov 1, ax
  ;; (181'46) Tail: loop (g190) @ con_181'46 (g199)
  mov bp, 290
  mov dx, 299
  mov ax, [bp]
  jmp [ax]

L139: ; Continuation
  push cx
  push #L138
  mov cx, sp
  ;; (181'17) Tail: put_chars (g19) @ app_79'28 (arg)
  mov bp, 119
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L140: ; Continuation
  push cx
  push #L139
  mov cx, sp
  ;; (79'28) Tail: app_79'25 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L141: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L137
  push [bp+2]
  push cx
  push #L140
  mov cx, sp
  ;; (79'25) Tail: revloop (g13) @ con_79'25 (g197)
  mov bp, 113
  mov dx, 297
  mov ax, [bp]
  jmp [ax]

L142: ; Continuation
  push [bp+2]
  push cx
  push #L141
  mov cx, sp
  ;; (67'44) Tail: app_67'41 (arg) @ con_0'0 (g195)
  mov bp, dx
  mov dx, 295
  mov ax, [bp]
  jmp [ax]

L143: ; Continuation
  push [bp+2]
  push cx
  push #L142
  mov cx, sp
  ;; (67'41) Tail: app_67'33 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L144: ; Continuation
  push dx
  push cx
  push #L143
  mov cx, sp
  ;; (67'33) Tail: eq_list (g7) @ lam_0'0 (g192)
  mov bp, 107
  mov dx, 292
  mov ax, [bp]
  jmp [ax]

L145: ; Function: g190
  push cx
  push #L144
  mov cx, sp
  ;; (128'28) Tail: readloop (g27) @ con_128'28 (g191)
  mov bp, 127
  mov dx, 291
  mov ax, [bp]
  jmp [ax]

L146: ; Arm: 193'52
  ;; (0'0) Return: lit_193'57 (g202)
  mov dx, 302
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L147: ; Function: g203
  mov ax, dx
  cmp ax, 301
  call bios_make_bool_from_z
  mov 1, ax
  mov bx, 1
  cmp [bx], #1
  bz L146
  ;; (193'30) Return: c (arg)
  mov dx, dx
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L148: ; Arm: 95'13
  ;; (94'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L149: ; Continuation
  mov ax, [bp+2]
  div ax, 310
  mov 1, ax
  ;; (96'45) Tail: app_96'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L150: ; Function: t1
  mov ax, dx
  cmp ax, 307
  call bios_make_bool_from_z
  mov 1, ax
  mov bx, 1
  cmp [bx], #1
  bz L148
  mov ax, dx
  mod ax, 308
  mov 2, ax
  mov ax, 309
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
  push #L149
  mov cx, sp
  ;; (96'11) Tail: loop (g206) @ con_0'0 (t5)
  mov bp, 306
  mov dx, 5
  mov ax, [bp]
  jmp [ax]

L151: ; Function: g206
  push dx
  push #L150
  mov 1, sp
  ;; (0'0) Return: lam_94'19 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L152: ; Arm: 225'37
  ;; (0'0) Return: con_225'42 (g86)
  mov dx, 186
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L153: ; Continuation
  ;; (226'26) Tail: mainloop (f2) @ con_226'26 (g218)
  mov bp, [bp+2]
  mov dx, 318
  mov ax, [bp]
  jmp [ax]

L154: ; Arm: 215'7
  ;; (0'0) Return: con_215'10 (g89)
  mov dx, 189
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L155: ; Continuation
  ;; (105'48) Tail: put_chars (g19) @ app_105'57 (arg)
  mov bp, 119
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L156: ; Function: t1
  push cx
  push #L155
  mov cx, sp
  ;; (105'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L157: ; Continuation
  ;; (105'48) Tail: put_chars (g19) @ app_105'57 (arg)
  mov bp, 119
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L158: ; Function: t1
  push cx
  push #L157
  mov cx, sp
  ;; (105'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L159: ; Continuation
  ;; (105'48) Tail: put_chars (g19) @ app_105'57 (arg)
  mov bp, 119
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L160: ; Function: t1
  push cx
  push #L159
  mov cx, sp
  ;; (105'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L161: ; Continuation
  mov ax, 195
  call bios_put_char
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L162: ; Continuation
  push cx
  push #L161
  mov cx, sp
  ;; (105'61) Tail: app_105'28 (arg) @ lit_143'16 (g94)
  mov bp, dx
  mov dx, 194
  mov ax, [bp]
  jmp [ax]

L163: ; Continuation
  push [bp+2]
  push #L160
  mov 1, sp
  push cx
  push #L162
  mov cx, sp
  ;; (105'28) Tail: block (g1) @ lam_105'33 (t1)
  mov bp, 101
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L164: ; Continuation
  push [bp+2]
  push cx
  push #L163
  mov cx, sp
  ;; (105'61) Tail: app_105'28 (arg) @ lit_138'25 (g93)
  mov bp, dx
  mov dx, 193
  mov ax, [bp]
  jmp [ax]

L165: ; Arm: 143'7
  push [bp+2]
  push #L158
  mov 1, sp
  push [bp+2]
  push cx
  push #L164
  mov cx, sp
  ;; (105'28) Tail: block (g1) @ lam_105'33 (t1)
  mov bp, 101
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L166: ; Continuation
  ;; (105'48) Tail: put_chars (g19) @ app_105'57 (arg)
  mov bp, 119
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L167: ; Function: t5
  push cx
  push #L166
  mov cx, sp
  ;; (105'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L168: ; Continuation
  ;; (105'48) Tail: put_chars (g19) @ app_105'57 (arg)
  mov bp, 119
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L169: ; Function: t1
  push cx
  push #L168
  mov cx, sp
  ;; (105'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L170: ; Continuation
  mov ax, 198
  call bios_put_char
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L171: ; Continuation
  push cx
  push #L170
  mov cx, sp
  ;; (105'61) Tail: app_105'28 (arg) @ lit_146'21 (g97)
  mov bp, dx
  mov dx, 197
  mov ax, [bp]
  jmp [ax]

L172: ; Continuation
  push [bp+2]
  push #L169
  mov 1, sp
  push cx
  push #L171
  mov cx, sp
  ;; (105'28) Tail: block (g1) @ lam_105'33 (t1)
  mov bp, 101
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L173: ; Continuation
  push [bp+2]
  push cx
  push #L172
  mov cx, sp
  ;; (105'61) Tail: app_105'28 (arg) @ lit_138'25 (g96)
  mov bp, dx
  mov dx, 196
  mov ax, [bp]
  jmp [ax]

L174: ; Arm: 146'12
  mov ax, [bx+1]
  mov 3, ax
  mov ax, [bx+2]
  mov 4, ax
  push [bp+2]
  push #L167
  mov 5, sp
  push [bp+2]
  push cx
  push #L173
  mov cx, sp
  ;; (105'28) Tail: block (g1) @ lam_105'33 (t5)
  mov bp, 101
  mov dx, 5
  mov ax, [bp]
  jmp [ax]

L175: ; Continuation
  ;; (105'48) Tail: put_chars (g19) @ app_105'57 (arg)
  mov bp, 119
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L176: ; Function: t1
  push cx
  push #L175
  mov cx, sp
  ;; (105'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L177: ; Continuation
  ;; (105'48) Tail: put_chars (g19) @ app_105'57 (arg)
  mov bp, 119
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L178: ; Function: t1
  push cx
  push #L177
  mov cx, sp
  ;; (105'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L179: ; Continuation
  mov ax, 214
  call bios_put_char
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L180: ; Continuation
  push cx
  push #L179
  mov cx, sp
  ;; (105'61) Tail: app_105'28 (arg) @ lit_149'24 (g113)
  mov bp, dx
  mov dx, 213
  mov ax, [bp]
  jmp [ax]

L181: ; Continuation
  push [bp+2]
  push #L178
  mov 1, sp
  push cx
  push #L180
  mov cx, sp
  ;; (105'28) Tail: block (g1) @ lam_105'33 (t1)
  mov bp, 101
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L182: ; Continuation
  push [bp+2]
  push cx
  push #L181
  mov cx, sp
  ;; (105'61) Tail: app_105'28 (arg) @ lit_138'25 (g112)
  mov bp, dx
  mov dx, 212
  mov ax, [bp]
  jmp [ax]

L183: ; Arm: 149'15
  push [bp+2]
  push #L176
  mov 1, sp
  push [bp+2]
  push cx
  push #L182
  mov cx, sp
  ;; (105'28) Tail: block (g1) @ lam_105'33 (t1)
  mov bp, 101
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L184: ; Continuation
  ;; (105'48) Tail: put_chars (g19) @ app_105'57 (arg)
  mov bp, 119
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L185: ; Function: t1
  push cx
  push #L184
  mov cx, sp
  ;; (105'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L186: ; Continuation
  mov ax, 236
  call bios_put_char
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L187: ; Continuation
  push cx
  push #L186
  mov cx, sp
  ;; (107'26) Tail: put_chars (g19) @ case_98'2 (arg)
  mov bp, 119
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L188: ; Arm: 98'11
  ;; (0'0) Return: con_0'0 (g134)
  mov dx, 234
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L189: ; Continuation
  ;; (98'41) Tail: app_98'38 (arg) @ res (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L190: ; Continuation
  mov ax, [bp+2]
  cmp ax, 231
  call bios_make_bool_from_z
  mov 1, ax
  push cx
  push #L187
  mov cx, sp
  mov bx, 1
  cmp [bx], #1
  bz L188
  push [bp+2]
  push cx
  push #L189
  mov cx, sp
  ;; (98'38) Tail: loop (g126) @ con_98'38 (g135)
  mov bp, 226
  mov dx, 235
  mov ax, [bp]
  jmp [ax]

L191: ; Continuation
  push [bp+2]
  push cx
  push #L190
  mov cx, sp
  ;; (105'61) Tail: app_105'28 (arg) @ lit_153'22 (g125)
  mov bp, dx
  mov dx, 225
  mov ax, [bp]
  jmp [ax]

L192: ; Continuation
  push [bp+2]
  push #L185
  mov 1, sp
  push [bp+3]
  push cx
  push #L191
  mov cx, sp
  ;; (105'28) Tail: block (g1) @ lam_105'33 (t1)
  mov bp, 101
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L193: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L192
  mov cx, sp
  ;; (107'26) Tail: put_chars (g19) @ case_98'2 (arg)
  mov bp, 119
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L194: ; Arm: 98'11
  ;; (0'0) Return: con_0'0 (g123)
  mov dx, 223
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L195: ; Continuation
  ;; (98'41) Tail: app_98'38 (arg) @ n (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L196: ; Continuation
  mov ax, [bp+3]
  cmp ax, 220
  call bios_make_bool_from_z
  mov 1, ax
  push dx
  push [bp+2]
  push cx
  push #L193
  mov cx, sp
  mov bx, 1
  cmp [bx], #1
  bz L194
  push [bp+3]
  push cx
  push #L195
  mov cx, sp
  ;; (98'38) Tail: loop (g115) @ con_98'38 (g124)
  mov bp, 215
  mov dx, 224
  mov ax, [bp]
  jmp [ax]

L197: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L183
  mov ax, [bx+1]
  mov 1, ax
  push 1
  push [bp+2]
  push cx
  push #L196
  mov cx, sp
  ;; (151'25) Tail: fib (g60) @ n (t1)
  mov bp, 160
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L198: ; Continuation
  push [bp+2]
  push cx
  push #L197
  mov cx, sp
  ;; (54'9) Tail: app_54'7 (arg) @ arg1 (f3)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+3]
  mov ax, [bp]
  jmp [ax]

L199: ; Continuation
  mov bx, [bp+3]
  cmp [bx], #0
  bz L165
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov bx, 2
  cmp [bx], #1
  bz L174
  push 1
  push [bp+2]
  push cx
  push #L198
  mov cx, sp
  ;; (54'7) Tail: loop (g99) @ lit_54'7 (g111)
  mov bp, 199
  mov dx, 211
  mov ax, [bp]
  jmp [ax]

L200: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L199
  mov cx, sp
  ;; (105'61) Tail: app_105'28 (arg) @ lit_141'13 (g92)
  mov bp, dx
  mov dx, 192
  mov ax, [bp]
  jmp [ax]

L201: ; Arm: 217'45
  push [bp+2]
  push #L156
  mov 1, sp
  push [bp+5]
  push [bp+2]
  push cx
  push #L200
  mov cx, sp
  ;; (105'28) Tail: block (g1) @ lam_105'33 (t1)
  mov bp, 101
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L202: ; Continuation
  ;; (105'48) Tail: put_chars (g19) @ app_105'57 (arg)
  mov bp, 119
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L203: ; Function: t1
  push cx
  push #L202
  mov cx, sp
  ;; (105'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L204: ; Continuation
  ;; (105'48) Tail: put_chars (g19) @ app_105'57 (arg)
  mov bp, 119
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L205: ; Function: t1
  push cx
  push #L204
  mov cx, sp
  ;; (105'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L206: ; Continuation
  ;; (105'48) Tail: put_chars (g19) @ app_105'57 (arg)
  mov bp, 119
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L207: ; Function: t1
  push cx
  push #L206
  mov cx, sp
  ;; (105'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L208: ; Continuation
  mov ax, 242
  call bios_put_char
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L209: ; Continuation
  push cx
  push #L208
  mov cx, sp
  ;; (105'61) Tail: app_105'28 (arg) @ lit_160'16 (g141)
  mov bp, dx
  mov dx, 241
  mov ax, [bp]
  jmp [ax]

L210: ; Continuation
  push [bp+2]
  push #L207
  mov 1, sp
  push cx
  push #L209
  mov cx, sp
  ;; (105'28) Tail: block (g1) @ lam_105'33 (t1)
  mov bp, 101
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L211: ; Continuation
  push [bp+2]
  push cx
  push #L210
  mov cx, sp
  ;; (105'61) Tail: app_105'28 (arg) @ lit_138'25 (g140)
  mov bp, dx
  mov dx, 240
  mov ax, [bp]
  jmp [ax]

L212: ; Arm: 160'7
  push [bp+2]
  push #L205
  mov 1, sp
  push [bp+2]
  push cx
  push #L211
  mov cx, sp
  ;; (105'28) Tail: block (g1) @ lam_105'33 (t1)
  mov bp, 101
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L213: ; Continuation
  ;; (105'48) Tail: put_chars (g19) @ app_105'57 (arg)
  mov bp, 119
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L214: ; Function: t5
  push cx
  push #L213
  mov cx, sp
  ;; (105'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L215: ; Continuation
  ;; (105'48) Tail: put_chars (g19) @ app_105'57 (arg)
  mov bp, 119
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L216: ; Function: t1
  push cx
  push #L215
  mov cx, sp
  ;; (105'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L217: ; Continuation
  mov ax, 245
  call bios_put_char
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L218: ; Continuation
  push cx
  push #L217
  mov cx, sp
  ;; (105'61) Tail: app_105'28 (arg) @ lit_163'21 (g144)
  mov bp, dx
  mov dx, 244
  mov ax, [bp]
  jmp [ax]

L219: ; Continuation
  push [bp+2]
  push #L216
  mov 1, sp
  push cx
  push #L218
  mov cx, sp
  ;; (105'28) Tail: block (g1) @ lam_105'33 (t1)
  mov bp, 101
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L220: ; Continuation
  push [bp+2]
  push cx
  push #L219
  mov cx, sp
  ;; (105'61) Tail: app_105'28 (arg) @ lit_138'25 (g143)
  mov bp, dx
  mov dx, 243
  mov ax, [bp]
  jmp [ax]

L221: ; Arm: 163'12
  mov ax, [bx+1]
  mov 3, ax
  mov ax, [bx+2]
  mov 4, ax
  push [bp+2]
  push #L214
  mov 5, sp
  push [bp+2]
  push cx
  push #L220
  mov cx, sp
  ;; (105'28) Tail: block (g1) @ lam_105'33 (t5)
  mov bp, 101
  mov dx, 5
  mov ax, [bp]
  jmp [ax]

L222: ; Continuation
  ;; (105'48) Tail: put_chars (g19) @ app_105'57 (arg)
  mov bp, 119
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L223: ; Function: t1
  push cx
  push #L222
  mov cx, sp
  ;; (105'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L224: ; Continuation
  ;; (105'48) Tail: put_chars (g19) @ app_105'57 (arg)
  mov bp, 119
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L225: ; Function: t1
  push cx
  push #L224
  mov cx, sp
  ;; (105'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L226: ; Continuation
  mov ax, 261
  call bios_put_char
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L227: ; Continuation
  push cx
  push #L226
  mov cx, sp
  ;; (105'61) Tail: app_105'28 (arg) @ lit_166'24 (g160)
  mov bp, dx
  mov dx, 260
  mov ax, [bp]
  jmp [ax]

L228: ; Continuation
  push [bp+2]
  push #L225
  mov 1, sp
  push cx
  push #L227
  mov cx, sp
  ;; (105'28) Tail: block (g1) @ lam_105'33 (t1)
  mov bp, 101
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L229: ; Continuation
  push [bp+2]
  push cx
  push #L228
  mov cx, sp
  ;; (105'61) Tail: app_105'28 (arg) @ lit_138'25 (g159)
  mov bp, dx
  mov dx, 259
  mov ax, [bp]
  jmp [ax]

L230: ; Arm: 166'15
  push [bp+2]
  push #L223
  mov 1, sp
  push [bp+2]
  push cx
  push #L229
  mov cx, sp
  ;; (105'28) Tail: block (g1) @ lam_105'33 (t1)
  mov bp, 101
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L231: ; Continuation
  ;; (105'48) Tail: put_chars (g19) @ app_105'57 (arg)
  mov bp, 119
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L232: ; Function: t1
  push cx
  push #L231
  mov cx, sp
  ;; (105'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L233: ; Continuation
  mov ax, 283
  call bios_put_char
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L234: ; Continuation
  push cx
  push #L233
  mov cx, sp
  ;; (107'26) Tail: put_chars (g19) @ case_98'2 (arg)
  mov bp, 119
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L235: ; Arm: 98'11
  ;; (0'0) Return: con_0'0 (g181)
  mov dx, 281
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L236: ; Continuation
  ;; (98'41) Tail: app_98'38 (arg) @ res (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L237: ; Continuation
  mov ax, [bp+2]
  cmp ax, 278
  call bios_make_bool_from_z
  mov 1, ax
  push cx
  push #L234
  mov cx, sp
  mov bx, 1
  cmp [bx], #1
  bz L235
  push [bp+2]
  push cx
  push #L236
  mov cx, sp
  ;; (98'38) Tail: loop (g173) @ con_98'38 (g182)
  mov bp, 273
  mov dx, 282
  mov ax, [bp]
  jmp [ax]

L238: ; Continuation
  push [bp+2]
  push cx
  push #L237
  mov cx, sp
  ;; (105'61) Tail: app_105'28 (arg) @ lit_170'22 (g172)
  mov bp, dx
  mov dx, 272
  mov ax, [bp]
  jmp [ax]

L239: ; Continuation
  push [bp+2]
  push #L232
  mov 1, sp
  push [bp+3]
  push cx
  push #L238
  mov cx, sp
  ;; (105'28) Tail: block (g1) @ lam_105'33 (t1)
  mov bp, 101
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L240: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L239
  mov cx, sp
  ;; (107'26) Tail: put_chars (g19) @ case_98'2 (arg)
  mov bp, 119
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L241: ; Arm: 98'11
  ;; (0'0) Return: con_0'0 (g170)
  mov dx, 270
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L242: ; Continuation
  ;; (98'41) Tail: app_98'38 (arg) @ n (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L243: ; Continuation
  mov ax, [bp+3]
  cmp ax, 267
  call bios_make_bool_from_z
  mov 1, ax
  push dx
  push [bp+2]
  push cx
  push #L240
  mov cx, sp
  mov bx, 1
  cmp [bx], #1
  bz L241
  push [bp+3]
  push cx
  push #L242
  mov cx, sp
  ;; (98'38) Tail: loop (g162) @ con_98'38 (g171)
  mov bp, 262
  mov dx, 271
  mov ax, [bp]
  jmp [ax]

L244: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L230
  mov ax, [bx+1]
  mov 1, ax
  push 1
  push [bp+2]
  push cx
  push #L243
  mov cx, sp
  ;; (168'26) Tail: fact (g64) @ n (t1)
  mov bp, 164
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L245: ; Continuation
  push [bp+2]
  push cx
  push #L244
  mov cx, sp
  ;; (54'9) Tail: app_54'7 (arg) @ arg1 (f3)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+3]
  mov ax, [bp]
  jmp [ax]

L246: ; Continuation
  mov bx, [bp+3]
  cmp [bx], #0
  bz L212
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov bx, 2
  cmp [bx], #1
  bz L221
  push 1
  push [bp+2]
  push cx
  push #L245
  mov cx, sp
  ;; (54'7) Tail: loop (g146) @ lit_54'7 (g158)
  mov bp, 246
  mov dx, 258
  mov ax, [bp]
  jmp [ax]

L247: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L246
  mov cx, sp
  ;; (105'61) Tail: app_105'28 (arg) @ lit_158'13 (g139)
  mov bp, dx
  mov dx, 239
  mov ax, [bp]
  jmp [ax]

L248: ; Arm: 218'48
  push [bp+2]
  push #L203
  mov 1, sp
  push [bp+5]
  push [bp+2]
  push cx
  push #L247
  mov cx, sp
  ;; (105'28) Tail: block (g1) @ lam_105'33 (t1)
  mov bp, 101
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L249: ; Continuation
  ;; (105'48) Tail: put_chars (g19) @ app_105'57 (arg)
  mov bp, 119
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L250: ; Function: t3
  push cx
  push #L249
  mov cx, sp
  ;; (105'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L251: ; Continuation
  ;; (105'48) Tail: put_chars (g19) @ app_105'57 (arg)
  mov bp, 119
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L252: ; Function: t1
  push cx
  push #L251
  mov cx, sp
  ;; (105'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L253: ; Continuation
  mov ax, 288
  call bios_put_char
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L254: ; Continuation
  push cx
  push #L253
  mov cx, sp
  ;; (105'61) Tail: app_105'28 (arg) @ lit_187'18 (g187)
  mov bp, dx
  mov dx, 287
  mov ax, [bp]
  jmp [ax]

L255: ; Continuation
  push [bp+2]
  push #L252
  mov 1, sp
  push cx
  push #L254
  mov cx, sp
  ;; (105'28) Tail: block (g1) @ lam_105'33 (t1)
  mov bp, 101
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L256: ; Continuation
  push [bp+2]
  push cx
  push #L255
  mov cx, sp
  ;; (105'61) Tail: app_105'28 (arg) @ lit_138'25 (g186)
  mov bp, dx
  mov dx, 286
  mov ax, [bp]
  jmp [ax]

L257: ; Arm: 187'9
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push [bp+2]
  push #L250
  mov 3, sp
  push [bp+2]
  push cx
  push #L256
  mov cx, sp
  ;; (105'28) Tail: block (g1) @ lam_105'33 (t3)
  mov bp, 101
  mov dx, 3
  mov ax, [bp]
  jmp [ax]

L258: ; Continuation
  ;; (105'48) Tail: put_chars (g19) @ app_105'57 (arg)
  mov bp, 119
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L259: ; Function: t1
  push cx
  push #L258
  mov cx, sp
  ;; (105'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L260: ; Continuation
  ;; (183'6) Tail: loop (g190) @ con_183'6 (g200)
  mov bp, 290
  mov dx, 300
  mov ax, [bp]
  jmp [ax]

L261: ; Continuation
  push cx
  push #L260
  mov cx, sp
  ;; (105'61) Tail: app_105'28 (arg) @ lit_189'16 (g189)
  mov bp, dx
  mov dx, 289
  mov ax, [bp]
  jmp [ax]

L262: ; Arm: 219'49
  mov bx, [bp+4]
  cmp [bx], #1
  bz L257
  push [bp+2]
  push #L259
  mov 1, sp
  push cx
  push #L261
  mov cx, sp
  ;; (105'28) Tail: block (g1) @ lam_105'33 (t1)
  mov bp, 101
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L263: ; Continuation
  ;; (105'48) Tail: put_chars (g19) @ app_105'57 (arg)
  mov bp, 119
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L264: ; Function: t1
  push cx
  push #L263
  mov cx, sp
  ;; (105'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L265: ; Continuation
  ;; (105'48) Tail: put_chars (g19) @ app_105'57 (arg)
  mov bp, 119
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L266: ; Function: t1
  push cx
  push #L265
  mov cx, sp
  ;; (105'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L267: ; Continuation
  mov ax, 317
  call bios_put_char
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L268: ; Continuation
  push cx
  push #L267
  mov cx, sp
  ;; (105'61) Tail: app_105'28 (arg) @ lit_198'13 (g216)
  mov bp, dx
  mov dx, 316
  mov ax, [bp]
  jmp [ax]

L269: ; Continuation
  push [bp+2]
  push #L266
  mov 1, sp
  push cx
  push #L268
  mov cx, sp
  ;; (105'28) Tail: block (g1) @ lam_105'33 (t1)
  mov bp, 101
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L270: ; Continuation
  push [bp+2]
  push cx
  push #L269
  mov cx, sp
  ;; (107'26) Tail: put_chars (g19) @ case_98'2 (arg)
  mov bp, 119
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L271: ; Arm: 98'11
  ;; (0'0) Return: con_0'0 (g214)
  mov dx, 314
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L272: ; Continuation
  ;; (98'41) Tail: app_98'38 (arg) @ n (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L273: ; Continuation
  mov ax, [bp+3]
  cmp ax, 311
  call bios_make_bool_from_z
  mov 1, ax
  push [bp+2]
  push cx
  push #L270
  mov cx, sp
  mov bx, 1
  cmp [bx], #1
  bz L271
  push [bp+3]
  push cx
  push #L272
  mov cx, sp
  ;; (98'38) Tail: loop (g206) @ con_98'38 (g215)
  mov bp, 306
  mov dx, 315
  mov ax, [bp]
  jmp [ax]

L274: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L273
  mov cx, sp
  ;; (105'61) Tail: app_105'28 (arg) @ lit_196'13 (g205)
  mov bp, dx
  mov dx, 305
  mov ax, [bp]
  jmp [ax]

L275: ; Continuation
  push [bp+2]
  push #L264
  mov 1, sp
  push [bp+3]
  push [bp+2]
  push cx
  push #L274
  mov cx, sp
  ;; (105'28) Tail: block (g1) @ lam_105'33 (t1)
  mov bp, 101
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L276: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L275
  mov cx, sp
  ;; (195'12) Tail: put_chars (g19) @ app_195'46 (arg)
  mov bp, 119
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L277: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L276
  mov cx, sp
  ;; (195'46) Tail: app_195'20 (f4) @ app_195'60 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L278: ; Continuation
  push dx
  push [bp+5]
  push [bp+2]
  push cx
  push #L277
  mov cx, sp
  ;; (195'60) Tail: star_the_ohs (f4) @ xs (f3)
  mov dx, [bp+3]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp [ax]

L279: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L278
  mov cx, sp
  ;; (195'20) Tail: append (g12) @ app_195'29 (arg)
  mov bp, 112
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L280: ; Continuation
  push dx
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L279
  mov cx, sp
  ;; (195'29) Tail: explode (f2) @ lit_195'29 (g204)
  mov bp, [bp+2]
  mov dx, 304
  mov ax, [bp]
  jmp [ax]

L281: ; Continuation
  push dx
  push [bp+3]
  push [bp+2]
  push cx
  push #L280
  mov cx, sp
  ;; (194'17) Tail: length (g16) @ xs (f3)
  mov dx, [bp+3]
  mov bp, 116
  mov ax, [bp]
  jmp [ax]

L282: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L262
  push [bp+3]
  push [bp+2]
  push cx
  push #L281
  mov cx, sp
  ;; (193'25) Tail: map (g14) @ lam_193'30 (g203)
  mov bp, 114
  mov dx, 303
  mov ax, [bp]
  jmp [ax]

L283: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L282
  mov cx, sp
  ;; (67'44) Tail: app_67'41 (arg) @ ys (f5)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+5]
  mov ax, [bp]
  jmp [ax]

L284: ; Continuation
  push [bp+6]
  push [bp+5]
  push [bp+3]
  push [bp+2]
  push cx
  push #L283
  mov cx, sp
  ;; (67'41) Tail: app_67'33 (arg) @ command (f4)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+4]
  mov ax, [bp]
  jmp [ax]

L285: ; Continuation
  push dx
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L284
  mov cx, sp
  ;; (67'33) Tail: eq_list (g7) @ lam_0'0 (g185)
  mov bp, 107
  mov dx, 285
  mov ax, [bp]
  jmp [ax]

L286: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L248
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L285
  mov cx, sp
  ;; (219'42) Tail: explode (f2) @ lit_219'42 (g184)
  mov bp, [bp+2]
  mov dx, 284
  mov ax, [bp]
  jmp [ax]

L287: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L286
  mov cx, sp
  ;; (67'44) Tail: app_67'41 (arg) @ ys (f6)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+6]
  mov ax, [bp]
  jmp [ax]

L288: ; Continuation
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L287
  mov cx, sp
  ;; (67'41) Tail: app_67'33 (arg) @ command (f4)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+4]
  mov ax, [bp]
  jmp [ax]

L289: ; Continuation
  push dx
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L288
  mov cx, sp
  ;; (67'33) Tail: eq_list (g7) @ lam_0'0 (g138)
  mov bp, 107
  mov dx, 238
  mov ax, [bp]
  jmp [ax]

L290: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L201
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L289
  mov cx, sp
  ;; (218'40) Tail: explode (f2) @ lit_218'40 (g137)
  mov bp, [bp+2]
  mov dx, 237
  mov ax, [bp]
  jmp [ax]

L291: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L290
  mov cx, sp
  ;; (67'44) Tail: app_67'41 (arg) @ ys (f6)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+6]
  mov ax, [bp]
  jmp [ax]

L292: ; Continuation
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L291
  mov cx, sp
  ;; (67'41) Tail: app_67'33 (arg) @ command (f4)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+4]
  mov ax, [bp]
  jmp [ax]

L293: ; Continuation
  push dx
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L292
  mov cx, sp
  ;; (67'33) Tail: eq_list (g7) @ lam_0'0 (g91)
  mov bp, 107
  mov dx, 191
  mov ax, [bp]
  jmp [ax]

L294: ; Continuation
  push [bp+3]
  push cx
  push #L153
  mov cx, sp
  mov bx, dx
  cmp [bx], #0
  bz L154
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push 2
  push 1
  push [bp+4]
  push [bp+2]
  push cx
  push #L293
  mov cx, sp
  ;; (217'38) Tail: explode (f2) @ lit_217'38 (g90)
  mov bp, [bp+2]
  mov dx, 190
  mov ax, [bp]
  jmp [ax]

L295: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L294
  mov cx, sp
  ;; (210'18) Tail: app_210'15 (arg) @ xs (f4)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+4]
  mov ax, [bp]
  jmp [ax]

L296: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L295
  mov cx, sp
  ;; (210'15) Tail: app_210'12 (arg) @ con_210'15 (g88)
  mov bp, dx
  mov dx, 188
  mov ax, [bp]
  jmp [ax]

L297: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L152
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L296
  mov cx, sp
  ;; (210'12) Tail: splitloop (g70) @ con_210'12 (g87)
  mov bp, 170
  mov dx, 187
  mov ax, [bp]
  jmp [ax]

L298: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L297
  mov cx, sp
  ;; (67'44) Tail: app_67'41 (arg) @ con_0'0 (g85)
  mov bp, dx
  mov dx, 185
  mov ax, [bp]
  jmp [ax]

L299: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L298
  mov cx, sp
  ;; (67'41) Tail: app_67'33 (arg) @ xs (f4)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+4]
  mov ax, [bp]
  jmp [ax]

L300: ; Continuation
  push dx
  push [bp+3]
  push [bp+2]
  push cx
  push #L299
  mov cx, sp
  ;; (67'33) Tail: eq_list (g7) @ lam_0'0 (g82)
  mov bp, 107
  mov dx, 182
  mov ax, [bp]
  jmp [ax]

L301: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L300
  mov cx, sp
  ;; (128'28) Tail: readloop (g27) @ con_128'28 (g81)
  mov bp, 127
  mov dx, 181
  mov ax, [bp]
  jmp [ax]

L302: ; Function: t1
  push bp
  push [bp+1]
  push cx
  push #L301
  mov cx, sp
  ;; (223'12) Tail: put_chars (g19) @ con_223'13 (g80)
  mov bp, 119
  mov dx, 180
  mov ax, [bp]
  jmp [ax]

L303: ; Continuation
  ;; (105'48) Tail: put_chars (g19) @ app_105'57 (arg)
  mov bp, 119
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L304: ; Function: t2
  push cx
  push #L303
  mov cx, sp
  ;; (105'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L305: ; Continuation
  ;; (230'11) Tail: mainloop (f2) @ con_230'11 (g220)
  mov bp, [bp+2]
  mov dx, 320
  mov ax, [bp]
  jmp [ax]

L306: ; Continuation
  push [bp+2]
  push cx
  push #L305
  mov cx, sp
  ;; (105'61) Tail: app_105'28 (arg) @ lit_229'13 (g219)
  mov bp, dx
  mov dx, 319
  mov ax, [bp]
  jmp [ax]

L307: ; Continuation
  push dx
  push #L302
  mov 1, sp
  push dx
  push #L304
  mov 2, sp
  push 1
  push cx
  push #L306
  mov cx, sp
  ;; (105'28) Tail: block (g1) @ lam_105'33 (t2)
  mov bp, 101
  mov dx, 2
  mov ax, [bp]
  jmp [ax]

L308: ; Start
  push #L2
  mov 101, sp
  mov ax, #0
  mov 102, ax
  mov ax, #1
  mov 103, ax
  push #0
  mov 104, sp
  mov ax, #1
  mov 105, ax
  push #L8
  mov 106, sp
  push #1
  mov 108, sp
  push #0
  mov 109, sp
  push #0
  mov 110, sp
  push #0
  mov 111, sp
  push #L19
  mov 107, sp
  push #L24
  mov 112, sp
  push #L28
  mov 113, sp
  push #0
  mov 115, sp
  push #L34
  mov 114, sp
  mov ax, #0
  mov 117, ax
  mov ax, #1
  mov 118, ax
  push #L37
  mov 116, sp
  push #0
  mov 120, sp
  mov ax, #8
  mov 121, ax
  mov ax, #'\n'
  mov 122, ax
  mov ax, #26
  mov 123, ax
  mov ax, #'^'
  mov 124, ax
  mov ax, #65
  mov 125, ax
  mov ax, #1
  mov 126, ax
  push #L43
  mov 119, sp
  push #0
  mov 128, sp
  mov ax, #'\n'
  mov 129, ax
  mov ax, #'\n'
  mov 130, ax
  push #0
  mov 131, sp
  mov ax, #'\EOT'
  mov 132, ax
  mov ax, #8
  mov 133, ax
  mov ax, #'\n'
  mov 134, ax
  mov ax, #26
  mov 135, ax
  mov ax, #'^'
  mov 136, ax
  mov ax, #65
  mov 137, ax
  mov ax, #1
  mov 138, ax
  mov ax, #'\n'
  mov 139, ax
  push #0
  mov 140, sp
  mov ax, #'\EOT'
  mov 141, ax
  mov ax, #127
  mov 142, ax
  mov ax, #127
  mov 143, ax
  mov ax, #26
  mov 144, ax
  push #0
  mov 145, sp
  push #1
  mov 146, sp
  mov ax, #'\b'
  mov 147, ax
  mov ax, #' '
  mov 148, ax
  mov ax, #'\b'
  mov 149, ax
  push #0
  mov 150, sp
  mov ax, #'\b'
  mov 151, ax
  mov ax, #' '
  mov 152, ax
  mov ax, #'\b'
  mov 153, ax
  mov ax, #8
  mov 154, ax
  mov ax, #'\n'
  mov 155, ax
  mov ax, #26
  mov 156, ax
  mov ax, #'^'
  mov 157, ax
  mov ax, #65
  mov 158, ax
  mov ax, #1
  mov 159, ax
  push #L63
  mov 127, sp
  mov ax, #2
  mov 161, ax
  mov ax, #1
  mov 162, ax
  mov ax, #2
  mov 163, ax
  push #L67
  mov 160, sp
  mov ax, #2
  mov 165, ax
  push #0
  mov 166, sp
  push #1
  mov 167, sp
  mov ax, #1
  mov 168, ax
  mov ax, #1
  mov 169, ax
  push #L72
  mov 164, sp
  push #0
  mov 171, sp
  push #0
  mov 172, sp
  mov ax, #' '
  mov 173, ax
  push #0
  mov 174, sp
  push #0
  mov 175, sp
  push #L86
  mov 170, sp
  mov ax, #'>'
  mov 176, ax
  mov ax, #' '
  mov 177, ax
  push #0
  mov 178, sp
  push 178
  push 177
  push #1
  mov 179, sp
  push 179
  push 176
  push #1
  mov 180, sp
  push #0
  mov 181, sp
  push #L88
  mov 182, sp
  mov ax, #'\EOT'
  mov 183, ax
  push #0
  mov 184, sp
  push 184
  push 183
  push #1
  mov 185, sp
  push #0
  mov 186, sp
  push #0
  mov 187, sp
  push #0
  mov 188, sp
  push #0
  mov 189, sp
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
  mov 190, ax
  push #L90
  mov 191, sp
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
  mov 192, ax
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
  mov 193, ax
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
  mov 194, ax
  mov ax, #'\n'
  mov 195, ax
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
  mov 196, ax
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
  mov 197, ax
  mov ax, #'\n'
  mov 198, ax
  mov ax, #48
  mov 200, ax
  mov ax, #0
  mov 201, ax
  push #0
  mov 202, sp
  push #1
  mov 203, sp
  mov ax, #9
  mov 204, ax
  push #0
  mov 205, sp
  push #1
  mov 206, sp
  push #1
  mov 207, sp
  push #1
  mov 208, sp
  push #1
  mov 209, sp
  mov ax, #10
  mov 210, ax
  push #L102
  mov 199, sp
  mov ax, #0
  mov 211, ax
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
  mov 212, ax
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
  mov 213, ax
  mov ax, #'\n'
  mov 214, ax
  mov ax, #0
  mov 216, ax
  mov ax, #10
  mov 217, ax
  mov ax, #48
  mov 218, ax
  mov ax, #10
  mov 219, ax
  push #L106
  mov 215, sp
  mov ax, #0
  mov 220, ax
  mov ax, #'0'
  mov 221, ax
  push #0
  mov 222, sp
  push 222
  push 221
  push #1
  mov 223, sp
  push #0
  mov 224, sp
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
  mov 225, ax
  mov ax, #0
  mov 227, ax
  mov ax, #10
  mov 228, ax
  mov ax, #48
  mov 229, ax
  mov ax, #10
  mov 230, ax
  push #L110
  mov 226, sp
  mov ax, #0
  mov 231, ax
  mov ax, #'0'
  mov 232, ax
  push #0
  mov 233, sp
  push 233
  push 232
  push #1
  mov 234, sp
  push #0
  mov 235, sp
  mov ax, #'\n'
  mov 236, ax
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
  mov 237, ax
  push #L112
  mov 238, sp
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
  mov 239, ax
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
  mov 240, ax
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
  mov 241, ax
  mov ax, #'\n'
  mov 242, ax
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
  mov 243, ax
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
  mov 244, ax
  mov ax, #'\n'
  mov 245, ax
  mov ax, #48
  mov 247, ax
  mov ax, #0
  mov 248, ax
  push #0
  mov 249, sp
  push #1
  mov 250, sp
  mov ax, #9
  mov 251, ax
  push #0
  mov 252, sp
  push #1
  mov 253, sp
  push #1
  mov 254, sp
  push #1
  mov 255, sp
  push #1
  mov 256, sp
  mov ax, #10
  mov 257, ax
  push #L124
  mov 246, sp
  mov ax, #0
  mov 258, ax
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
  mov 259, ax
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
  mov 260, ax
  mov ax, #'\n'
  mov 261, ax
  mov ax, #0
  mov 263, ax
  mov ax, #10
  mov 264, ax
  mov ax, #48
  mov 265, ax
  mov ax, #10
  mov 266, ax
  push #L128
  mov 262, sp
  mov ax, #0
  mov 267, ax
  mov ax, #'0'
  mov 268, ax
  push #0
  mov 269, sp
  push 269
  push 268
  push #1
  mov 270, sp
  push #0
  mov 271, sp
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
  mov 272, ax
  mov ax, #0
  mov 274, ax
  mov ax, #10
  mov 275, ax
  mov ax, #48
  mov 276, ax
  mov ax, #10
  mov 277, ax
  push #L132
  mov 273, sp
  mov ax, #0
  mov 278, ax
  mov ax, #'0'
  mov 279, ax
  push #0
  mov 280, sp
  push 280
  push 279
  push #1
  mov 281, sp
  push #0
  mov 282, sp
  mov ax, #'\n'
  mov 283, ax
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
  mov 284, ax
  push #L134
  mov 285, sp
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
  mov 286, ax
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
  mov 287, ax
  mov ax, #'\n'
  mov 288, ax
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
  mov 289, ax
  push #0
  mov 291, sp
  push #L136
  mov 292, sp
  mov ax, #'\EOT'
  mov 293, ax
  push #0
  mov 294, sp
  push 294
  push 293
  push #1
  mov 295, sp
  push #0
  mov 296, sp
  push #0
  mov 297, sp
  mov ax, #'\n'
  mov 298, ax
  push #0
  mov 299, sp
  push #L145
  mov 290, sp
  push #0
  mov 300, sp
  mov ax, #'o'
  mov 301, ax
  mov ax, #'*'
  mov 302, ax
  push #L147
  mov 303, sp
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
  mov 304, ax
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
  mov 305, ax
  mov ax, #0
  mov 307, ax
  mov ax, #10
  mov 308, ax
  mov ax, #48
  mov 309, ax
  mov ax, #10
  mov 310, ax
  push #L151
  mov 306, sp
  mov ax, #0
  mov 311, ax
  mov ax, #'0'
  mov 312, ax
  push #0
  mov 313, sp
  push 313
  push 312
  push #1
  mov 314, sp
  push #0
  mov 315, sp
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
  mov 316, ax
  mov ax, #'\n'
  mov 317, ax
  push #0
  mov 318, sp
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
  mov 319, ax
  push #0
  mov 320, sp
  push cx
  push #L307
  mov cx, sp
  ;; (11'23) Tail: block (g1) @ lam_2'12 (g6)
  mov bp, 101
  mov dx, 106
  mov ax, [bp]
  jmp [ax]


