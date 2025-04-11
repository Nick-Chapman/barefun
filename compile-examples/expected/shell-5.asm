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

L3: ; Arm: 6'7
  ;; (0'0) Return: lit_6'10 (g3)
  mov dx, 103
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L4: ; Continuation
  mov ax, 104
  add ax, dx
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L5: ; Function: g2
  mov bx, dx
  cmp [bx], #0
  bz L3
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push cx
  push #L4
  mov cx, sp
  ;; (7'27) Tail: length (g2) @ xs (t2)
  mov bp, 102
  mov dx, 2
  mov ax, [bp]
  jmp [ax]

L6: ; Arm: 13'7
  ;; (11'18) Return: ys (arg)
  mov dx, dx
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L7: ; Continuation
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

L8: ; Continuation
  push [bp+3]
  push cx
  push #L7
  mov cx, sp
  ;; (14'31) Tail: app_14'28 (arg) @ ys (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L9: ; Function: t1
  mov bx, [bp+1]
  cmp [bx], #0
  bz L6
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push 1
  push dx
  push cx
  push #L8
  mov cx, sp
  ;; (14'28) Tail: append (g5) @ xs (t2)
  mov bp, 105
  mov dx, 2
  mov ax, [bp]
  jmp [ax]

L10: ; Function: g5
  push dx
  push #L9
  mov 1, sp
  ;; (0'0) Return: lam_11'18 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L11: ; Arm: 20'9
  ;; (0'0) Return: con_20'12 (g6)
  mov dx, 106
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L12: ; Continuation
  ;; (21'43) Tail: app_21'37 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L13: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L11
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov ax, [bp+1]
  mov bx, [bp+2]
  mov si, 1
  call bios_set_bytes
  mov 3, ax
  mov ax, [bp+2]
  add ax, 107
  mov 4, ax
  push 2
  push cx
  push #L12
  mov cx, sp
  ;; (21'37) Tail: loop (f3) @ prim_0'0 (t4)
  mov bp, [bp+3]
  mov dx, 4
  mov ax, [bp]
  jmp [ax]

L14: ; Function: t2
  push bp
  push dx
  push [bp+1]
  push #L13
  mov 1, sp
  ;; (0'0) Return: lam_18'17 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L15: ; Continuation
  mov ax, [bp+2]
  call bios_freeze_bytes
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L16: ; Continuation
  push [bp+3]
  push cx
  push #L15
  mov cx, sp
  ;; (23'9) Tail: app_23'7 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L17: ; Continuation
  mov ax, dx
  call bios_make_bytes
  mov 1, ax
  push 1
  push #L14
  mov 2, sp
  push 1
  push [bp+2]
  push cx
  push #L16
  mov cx, sp
  ;; (23'7) Tail: loop (t2) @ lit_23'7 (g8)
  mov bp, 2
  mov dx, 108
  mov ax, [bp]
  jmp [ax]

L18: ; Function: g9
  push dx
  push cx
  push #L17
  mov cx, sp
  ;; (17'29) Tail: length (g2) @ xs (arg)
  mov bp, 102
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L19: ; Arm: 30'13
  ;; (29'23) Return: acc (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L20: ; Continuation
  mov ax, [bp+2]
  sub ax, 111
  mov 1, ax
  ;; (31'45) Tail: app_31'19 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L21: ; Function: t1
  mov ax, dx
  cmp ax, 110
  call bios_make_bool_from_n
  mov 1, ax
  mov bx, 1
  cmp [bx], #1
  bz L19
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
  push #L20
  mov cx, sp
  ;; (31'19) Tail: explode_loop (f3) @ con_0'0 (t3)
  mov bp, [bp+3]
  mov dx, 3
  mov ax, [bp]
  jmp [ax]

L22: ; Function: t1
  push bp
  push dx
  push [bp+1]
  push #L21
  mov 1, sp
  ;; (0'0) Return: lam_29'27 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L23: ; Continuation
  mov ax, [bp+2]
  sub ax, 113
  mov 1, ax
  ;; (33'18) Tail: app_33'15 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L24: ; Function: g14
  push dx
  push #L22
  mov 1, sp
  mov ax, dx
  call bios_string_length
  mov 2, ax
  push 2
  push cx
  push #L23
  mov cx, sp
  ;; (33'15) Tail: explode_loop (t1) @ con_33'15 (g12)
  mov bp, 1
  mov dx, 112
  mov ax, [bp]
  jmp [ax]

L25: ; Arm: 83'30
  ;; (0'0) Return: con_83'33 (g16)
  mov dx, 116
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L26: ; Arm: 83'7
  mov bx, dx
  cmp [bx], #0
  bz L25
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  ;; (0'0) Return: con_83'48 (g17)
  mov dx, 117
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L27: ; Arm: 86'10
  ;; (0'0) Return: con_86'13 (g18)
  mov dx, 118
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L28: ; Continuation
  ;; (88'37) Tail: app_88'34 (arg) @ ys (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L29: ; Continuation
  push [bp+3]
  push cx
  push #L28
  mov cx, sp
  ;; (88'34) Tail: app_88'31 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L30: ; Arm: 88'18
  push [bp+4]
  push [bp+3]
  push cx
  push #L29
  mov cx, sp
  ;; (88'31) Tail: eq_list (g15) @ eq (f2)
  mov dx, [bp+2]
  mov bp, 115
  mov ax, [bp]
  jmp [ax]

L31: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L30
  ;; (0'0) Return: con_88'45 (g19)
  mov dx, 119
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L32: ; Continuation
  push [bp+5]
  push [bp+3]
  push [bp+2]
  push cx
  push #L31
  mov cx, sp
  ;; (88'16) Tail: app_88'14 (arg) @ y (f4)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+4]
  mov ax, [bp]
  jmp [ax]

L33: ; Function: t1
  mov bx, [bp+2]
  cmp [bx], #0
  bz L26
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov bx, dx
  cmp [bx], #0
  bz L27
  mov ax, [bx+1]
  mov 3, ax
  mov ax, [bx+2]
  mov 4, ax
  push 4
  push 3
  push 2
  push [bp+1]
  push cx
  push #L32
  mov cx, sp
  ;; (88'14) Tail: eq (f1) @ x (t1)
  mov bp, [bp+1]
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L34: ; Function: t1
  push dx
  push [bp+1]
  push #L33
  mov 1, sp
  ;; (0'0) Return: lam_81'22 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L35: ; Function: g15
  push dx
  push #L34
  mov 1, sp
  ;; (0'0) Return: lam_81'19 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L36: ; Arm: 96'7
  ;; (94'16) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L37: ; Continuation
  ;; (97'34) Tail: app_97'21 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L38: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L36
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
  push #L37
  mov cx, sp
  ;; (97'21) Tail: revloop (g20) @ con_0'0 (t3)
  mov bp, 120
  mov dx, 3
  mov ax, [bp]
  jmp [ax]

L39: ; Function: g20
  push dx
  push #L38
  mov 1, sp
  ;; (0'0) Return: lam_94'20 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L40: ; Arm: 103'7
  ;; (0'0) Return: con_103'10 (g22)
  mov dx, 122
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L41: ; Continuation
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

L42: ; Continuation
  push [bp+3]
  push cx
  push #L41
  mov cx, sp
  ;; (104'26) Tail: app_104'24 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L43: ; Continuation
  push dx
  push [bp+3]
  push cx
  push #L42
  mov cx, sp
  ;; (104'24) Tail: map (g21) @ f (f2)
  mov dx, [bp+2]
  mov bp, 121
  mov ax, [bp]
  jmp [ax]

L44: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L40
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push 2
  push [bp+1]
  push cx
  push #L43
  mov cx, sp
  ;; (104'15) Tail: f (f1) @ x (t1)
  mov bp, [bp+1]
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L45: ; Function: g21
  push dx
  push #L44
  mov 1, sp
  ;; (0'0) Return: lam_101'14 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L46: ; Arm: 117'7
  ;; (0'0) Return: con_117'10 (g24)
  mov dx, 124
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L47: ; Continuation
  ;; (118'35) Tail: put_chars (g23) @ xs (f2)
  mov dx, [bp+2]
  mov bp, 123
  mov ax, [bp]
  jmp [ax]

L48: ; Arm: 52'19
  mov ax, 1
  call bios_put_char
  mov 5, ax
  ;; (0'0) Return: prim_0'0 (t5)
  mov dx, 5
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L49: ; Arm: 53'22
  mov ax, 1
  call bios_put_char
  mov 6, ax
  ;; (0'0) Return: prim_0'0 (t6)
  mov dx, 6
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L50: ; Arm: 54'16
  mov ax, 1
  call bios_put_char
  mov 7, ax
  ;; (0'0) Return: prim_0'0 (t7)
  mov dx, 7
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L51: ; Function: g23
  mov bx, dx
  cmp [bx], #0
  bz L46
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov ax, 1
  call bios_char_to_num
  mov 3, ax
  mov ax, 3
  cmp ax, 125
  call bios_make_bool_from_z
  mov 4, ax
  push 2
  push cx
  push #L47
  mov cx, sp
  mov bx, 4
  cmp [bx], #1
  bz L48
  mov ax, 1
  cmp ax, 126
  call bios_make_bool_from_z
  mov 5, ax
  mov bx, 5
  cmp [bx], #1
  bz L49
  mov ax, 127
  cmp ax, 3
  call bios_make_bool_from_n
  mov 6, ax
  mov bx, 6
  cmp [bx], #1
  bz L50
  mov ax, 128
  call bios_put_char
  mov 7, ax
  mov ax, 129
  add ax, 3
  mov 8, ax
  mov ax, 8
  sub ax, 130
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

L52: ; Continuation
  ;; (99'28) Tail: app_99'25 (arg) @ acc (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L53: ; Arm: 130'20
  mov ax, 134
  call bios_put_char
  mov 4, ax
  push dx
  push cx
  push #L52
  mov cx, sp
  ;; (99'25) Tail: revloop (g20) @ con_99'25 (g35)
  mov bp, 120
  mov dx, 135
  mov ax, [bp]
  jmp [ax]

L54: ; Continuation
  push [bp+2]
  push 141
  push #1
  mov 1, sp
  ;; (99'28) Tail: app_99'25 (arg) @ con_0'0 (t1)
  mov bp, dx
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L55: ; Arm: 131'26
  mov ax, 137
  call bios_put_char
  mov 5, ax
  mov ax, 138
  call bios_put_char
  mov 6, ax
  mov ax, 139
  call bios_put_char
  mov 7, ax
  push dx
  push cx
  push #L54
  mov cx, sp
  ;; (99'25) Tail: revloop (g20) @ con_99'25 (g40)
  mov bp, 120
  mov dx, 140
  mov ax, [bp]
  jmp [ax]

L56: ; Arm: 132'17
  ;; (132'31) Tail: readloop (g31) @ acc (arg)
  mov bp, 131
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L57: ; Arm: 135'15
  ;; (135'27) Tail: readloop (g31) @ acc (arg)
  mov bp, 131
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L58: ; Continuation
  mov ax, 151
  call bios_put_char
  mov 1, ax
  mov ax, 152
  call bios_put_char
  mov 2, ax
  mov ax, 153
  call bios_put_char
  mov 3, ax
  ;; (139'22) Tail: readloop (g31) @ tail (f2)
  mov dx, [bp+2]
  mov bp, 131
  mov ax, [bp]
  jmp [ax]

L59: ; Arm: 137'29
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

L60: ; Continuation
  push [bp+2]
  push cx
  push #L58
  mov cx, sp
  mov bx, dx
  cmp [bx], #1
  bz L59
  ;; (0'0) Return: con_137'53 (g50)
  mov dx, 150
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L61: ; Arm: 41'9
  ;; (0'0) Return: con_41'12 (g45)
  mov dx, 145
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L62: ; Arm: 133'19
  mov bx, dx
  cmp [bx], #0
  bz L57
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
  push #L60
  mov cx, sp
  mov bx, 10
  cmp [bx], #1
  bz L61
  ;; (0'0) Return: con_42'13 (g46)
  mov dx, 146
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L63: ; Continuation
  push [bp+2]
  push [bp+3]
  push #1
  mov 1, sp
  ;; (141'32) Tail: readloop (g31) @ con_0'0 (t1)
  mov bp, 131
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L64: ; Arm: 52'19
  mov ax, 1
  call bios_put_char
  mov 9, ax
  ;; (0'0) Return: prim_0'0 (t9)
  mov dx, 9
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L65: ; Arm: 53'22
  mov ax, 1
  call bios_put_char
  mov 10, ax
  ;; (0'0) Return: prim_0'0 (t10)
  mov dx, 10
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L66: ; Arm: 54'16
  mov ax, 1
  call bios_put_char
  mov 11, ax
  ;; (0'0) Return: prim_0'0 (t11)
  mov dx, 11
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L67: ; Function: g31
  call bios_get_char
  mov 1, ax
  mov ax, 1
  call bios_char_to_num
  mov 2, ax
  mov ax, 1
  cmp ax, 133
  call bios_make_bool_from_z
  mov 3, ax
  mov bx, 3
  cmp [bx], #1
  bz L53
  mov ax, 1
  cmp ax, 136
  call bios_make_bool_from_z
  mov 4, ax
  mov bx, 4
  cmp [bx], #1
  bz L55
  mov ax, 142
  cmp ax, 2
  call bios_make_bool_from_n
  mov 5, ax
  mov bx, 5
  cmp [bx], #1
  bz L56
  mov ax, 2
  cmp ax, 143
  call bios_make_bool_from_z
  mov 6, ax
  mov bx, 6
  cmp [bx], #1
  bz L62
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
  push #L63
  mov cx, sp
  mov bx, 8
  cmp [bx], #1
  bz L64
  mov ax, 1
  cmp ax, 155
  call bios_make_bool_from_z
  mov 9, ax
  mov bx, 9
  cmp [bx], #1
  bz L65
  mov ax, 156
  cmp ax, 7
  call bios_make_bool_from_n
  mov 10, ax
  mov bx, 10
  cmp [bx], #1
  bz L66
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

L68: ; Arm: 147'11
  ;; (145'12) Return: n (arg)
  mov dx, dx
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L69: ; Continuation
  mov ax, [bp+2]
  add ax, dx
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L70: ; Continuation
  mov ax, [bp+2]
  sub ax, 163
  mov 1, ax
  push dx
  push cx
  push #L69
  mov cx, sp
  ;; (147'39) Tail: fib (g60) @ prim_0'0 (t1)
  mov bp, 160
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L71: ; Function: g60
  mov ax, dx
  cmp ax, 161
  call bios_make_bool_from_n
  mov 1, ax
  mov bx, 1
  cmp [bx], #1
  bz L68
  mov ax, dx
  sub ax, 162
  mov 2, ax
  push dx
  push cx
  push #L70
  mov cx, sp
  ;; (147'27) Tail: fib (g60) @ prim_0'0 (t2)
  mov bp, 160
  mov dx, 2
  mov ax, [bp]
  jmp [ax]

L72: ; Continuation
  mov ax, dx
  mul ax, [bp+2]
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L73: ; Arm: 151'12
  mov ax, [bp+2]
  sub ax, 168
  mov 1, ax
  push [bp+2]
  push cx
  push #L72
  mov cx, sp
  ;; (151'22) Tail: fact (g64) @ prim_0'0 (t1)
  mov bp, 164
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L74: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L73
  ;; (0'0) Return: lit_151'37 (g69)
  mov dx, 169
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L75: ; Arm: 41'9
  ;; (0'0) Return: con_41'12 (g66)
  mov dx, 166
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L76: ; Function: g64
  mov ax, dx
  cmp ax, 165
  call bios_make_bool_from_n
  mov 1, ax
  push dx
  push cx
  push #L74
  mov cx, sp
  mov bx, 1
  cmp [bx], #1
  bz L75
  ;; (0'0) Return: con_42'13 (g67)
  mov dx, 167
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L77: ; Function: t1
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

L78: ; Function: g84
  push dx
  push #L77
  mov 1, sp
  ;; (0'0) Return: lam_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L79: ; Function: t1
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

L80: ; Function: g90
  push dx
  push #L79
  mov 1, sp
  ;; (0'0) Return: lam_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L81: ; Arm: 73'9
  push [bp+1]
  push #0
  mov 1, sp
  ;; (0'0) Return: con_73'12 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L82: ; Arm: 76'15
  ;; (0'0) Return: con_76'18 (g108)
  mov dx, 208
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L83: ; Continuation
  ;; (77'40) Tail: app_77'25 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L84: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L82
  mov ax, [bx+1]
  mov 1, ax
  mov ax, 209
  mul ax, [bp+2]
  mov 2, ax
  mov ax, 2
  add ax, 1
  mov 3, ax
  push [bp+3]
  push cx
  push #L83
  mov cx, sp
  ;; (77'25) Tail: loop (g98) @ prim_0'0 (t3)
  mov bp, 198
  mov dx, 3
  mov ax, [bp]
  jmp [ax]

L85: ; Arm: 68'27
  push [bp+2]
  push #0
  mov 1, sp
  ;; (0'0) Return: con_68'32 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L86: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L85
  ;; (0'0) Return: con_68'44 (g106)
  mov dx, 206
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L87: ; Arm: 41'9
  ;; (0'0) Return: con_41'12 (g104)
  mov dx, 204
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L88: ; Arm: 68'12
  mov ax, 203
  cmp ax, [bp+4]
  call bios_make_bool_from_n
  mov 1, ax
  push [bp+4]
  push cx
  push #L86
  mov cx, sp
  mov bx, 1
  cmp [bx], #1
  bz L87
  ;; (0'0) Return: con_42'13 (g105)
  mov dx, 205
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L89: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L84
  mov cx, sp
  mov bx, dx
  cmp [bx], #1
  bz L88
  ;; (0'0) Return: con_68'54 (g107)
  mov dx, 207
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L90: ; Arm: 41'9
  ;; (0'0) Return: con_41'12 (g101)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L91: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L81
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov ax, 1
  call bios_char_to_num
  mov 3, ax
  mov ax, 3
  sub ax, 199
  mov 4, ax
  mov ax, 4
  cmp ax, 200
  call bios_make_bool_from_n
  mov 5, ax
  push 4
  push 2
  push [bp+1]
  push cx
  push #L89
  mov cx, sp
  mov bx, 5
  cmp [bx], #1
  bz L90
  ;; (0'0) Return: con_42'13 (g102)
  mov dx, 202
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L92: ; Function: g98
  push dx
  push #L91
  mov 1, sp
  ;; (0'0) Return: lam_71'19 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L93: ; Arm: 110'13
  ;; (109'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L94: ; Continuation
  mov ax, [bp+2]
  div ax, 218
  mov 1, ax
  ;; (111'45) Tail: app_111'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L95: ; Function: t1
  mov ax, dx
  cmp ax, 215
  call bios_make_bool_from_z
  mov 1, ax
  mov bx, 1
  cmp [bx], #1
  bz L93
  mov ax, dx
  mod ax, 216
  mov 2, ax
  mov ax, 217
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
  push #L94
  mov cx, sp
  ;; (111'11) Tail: loop (g114) @ con_0'0 (t5)
  mov bp, 214
  mov dx, 5
  mov ax, [bp]
  jmp [ax]

L96: ; Function: g114
  push dx
  push #L95
  mov 1, sp
  ;; (0'0) Return: lam_109'19 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L97: ; Arm: 110'13
  ;; (109'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L98: ; Continuation
  mov ax, [bp+2]
  div ax, 229
  mov 1, ax
  ;; (111'45) Tail: app_111'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L99: ; Function: t1
  mov ax, dx
  cmp ax, 226
  call bios_make_bool_from_z
  mov 1, ax
  mov bx, 1
  cmp [bx], #1
  bz L97
  mov ax, dx
  mod ax, 227
  mov 2, ax
  mov ax, 228
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
  push #L98
  mov cx, sp
  ;; (111'11) Tail: loop (g125) @ con_0'0 (t5)
  mov bp, 225
  mov dx, 5
  mov ax, [bp]
  jmp [ax]

L100: ; Function: g125
  push dx
  push #L99
  mov 1, sp
  ;; (0'0) Return: lam_109'19 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L101: ; Function: t1
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

L102: ; Function: g137
  push dx
  push #L101
  mov 1, sp
  ;; (0'0) Return: lam_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L103: ; Arm: 73'9
  push [bp+1]
  push #0
  mov 1, sp
  ;; (0'0) Return: con_73'12 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L104: ; Arm: 76'15
  ;; (0'0) Return: con_76'18 (g155)
  mov dx, 255
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L105: ; Continuation
  ;; (77'40) Tail: app_77'25 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L106: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L104
  mov ax, [bx+1]
  mov 1, ax
  mov ax, 256
  mul ax, [bp+2]
  mov 2, ax
  mov ax, 2
  add ax, 1
  mov 3, ax
  push [bp+3]
  push cx
  push #L105
  mov cx, sp
  ;; (77'25) Tail: loop (g145) @ prim_0'0 (t3)
  mov bp, 245
  mov dx, 3
  mov ax, [bp]
  jmp [ax]

L107: ; Arm: 68'27
  push [bp+2]
  push #0
  mov 1, sp
  ;; (0'0) Return: con_68'32 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L108: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L107
  ;; (0'0) Return: con_68'44 (g153)
  mov dx, 253
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L109: ; Arm: 41'9
  ;; (0'0) Return: con_41'12 (g151)
  mov dx, 251
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L110: ; Arm: 68'12
  mov ax, 250
  cmp ax, [bp+4]
  call bios_make_bool_from_n
  mov 1, ax
  push [bp+4]
  push cx
  push #L108
  mov cx, sp
  mov bx, 1
  cmp [bx], #1
  bz L109
  ;; (0'0) Return: con_42'13 (g152)
  mov dx, 252
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L111: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L106
  mov cx, sp
  mov bx, dx
  cmp [bx], #1
  bz L110
  ;; (0'0) Return: con_68'54 (g154)
  mov dx, 254
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L112: ; Arm: 41'9
  ;; (0'0) Return: con_41'12 (g148)
  mov dx, 248
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L113: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L103
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov ax, 1
  call bios_char_to_num
  mov 3, ax
  mov ax, 3
  sub ax, 246
  mov 4, ax
  mov ax, 4
  cmp ax, 247
  call bios_make_bool_from_n
  mov 5, ax
  push 4
  push 2
  push [bp+1]
  push cx
  push #L111
  mov cx, sp
  mov bx, 5
  cmp [bx], #1
  bz L112
  ;; (0'0) Return: con_42'13 (g149)
  mov dx, 249
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L114: ; Function: g145
  push dx
  push #L113
  mov 1, sp
  ;; (0'0) Return: lam_71'19 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L115: ; Arm: 110'13
  ;; (109'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L116: ; Continuation
  mov ax, [bp+2]
  div ax, 265
  mov 1, ax
  ;; (111'45) Tail: app_111'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L117: ; Function: t1
  mov ax, dx
  cmp ax, 262
  call bios_make_bool_from_z
  mov 1, ax
  mov bx, 1
  cmp [bx], #1
  bz L115
  mov ax, dx
  mod ax, 263
  mov 2, ax
  mov ax, 264
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
  push #L116
  mov cx, sp
  ;; (111'11) Tail: loop (g161) @ con_0'0 (t5)
  mov bp, 261
  mov dx, 5
  mov ax, [bp]
  jmp [ax]

L118: ; Function: g161
  push dx
  push #L117
  mov 1, sp
  ;; (0'0) Return: lam_109'19 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L119: ; Arm: 110'13
  ;; (109'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L120: ; Continuation
  mov ax, [bp+2]
  div ax, 276
  mov 1, ax
  ;; (111'45) Tail: app_111'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L121: ; Function: t1
  mov ax, dx
  cmp ax, 273
  call bios_make_bool_from_z
  mov 1, ax
  mov bx, 1
  cmp [bx], #1
  bz L119
  mov ax, dx
  mod ax, 274
  mov 2, ax
  mov ax, 275
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
  push #L120
  mov cx, sp
  ;; (111'11) Tail: loop (g172) @ con_0'0 (t5)
  mov bp, 272
  mov dx, 5
  mov ax, [bp]
  jmp [ax]

L122: ; Function: g172
  push dx
  push #L121
  mov 1, sp
  ;; (0'0) Return: lam_109'19 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L123: ; Function: t1
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

L124: ; Function: g184
  push dx
  push #L123
  mov 1, sp
  ;; (0'0) Return: lam_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L125: ; Function: t1
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

L126: ; Function: g190
  push dx
  push #L125
  mov 1, sp
  ;; (0'0) Return: lam_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L127: ; Arm: 210'52
  ;; (0'0) Return: lit_210'57 (g197)
  mov dx, 297
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L128: ; Function: g198
  mov ax, dx
  cmp ax, 296
  call bios_make_bool_from_z
  mov 1, ax
  mov bx, 1
  cmp [bx], #1
  bz L127
  ;; (210'30) Return: c (arg)
  mov dx, dx
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L129: ; Arm: 110'13
  ;; (109'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L130: ; Continuation
  mov ax, [bp+2]
  div ax, 305
  mov 1, ax
  ;; (111'45) Tail: app_111'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L131: ; Function: t1
  mov ax, dx
  cmp ax, 302
  call bios_make_bool_from_z
  mov 1, ax
  mov bx, 1
  cmp [bx], #1
  bz L129
  mov ax, dx
  mod ax, 303
  mov 2, ax
  mov ax, 304
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
  ;; (111'11) Tail: loop (g201) @ con_0'0 (t5)
  mov bp, 301
  mov dx, 5
  mov ax, [bp]
  jmp [ax]

L132: ; Function: g201
  push dx
  push #L131
  mov 1, sp
  ;; (0'0) Return: lam_109'19 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L133: ; Continuation
  push [bp+2]
  push [bp+3]
  push #1
  mov 1, sp
  ;; (99'28) Tail: app_99'25 (arg) @ con_0'0 (t1)
  mov bp, dx
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L134: ; Continuation
  push dx
  push [bp+2]
  push cx
  push #L133
  mov cx, sp
  ;; (99'25) Tail: revloop (g20) @ con_99'25 (g74)
  mov bp, 120
  mov dx, 174
  mov ax, [bp]
  jmp [ax]

L135: ; Continuation
  push [bp+3]
  push cx
  push #L134
  mov cx, sp
  ;; (220'27) Tail: implode (f2) @ app_99'28 (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L136: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L135
  mov cx, sp
  ;; (99'28) Tail: app_99'25 (arg) @ accCs (f4)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+4]
  mov ax, [bp]
  jmp [ax]

L137: ; Arm: 220'7
  push [bp+4]
  push [bp+2]
  push [bp+1]
  push cx
  push #L136
  mov cx, sp
  ;; (99'25) Tail: revloop (g20) @ con_99'25 (g73)
  mov bp, 120
  mov dx, 173
  mov ax, [bp]
  jmp [ax]

L138: ; Continuation
  ;; (222'75) Tail: app_222'72 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L139: ; Continuation
  push [bp+2]
  push cx
  push #L138
  mov cx, sp
  ;; (222'72) Tail: app_222'37 (arg) @ con_222'72 (g77)
  mov bp, dx
  mov dx, 177
  mov ax, [bp]
  jmp [ax]

L140: ; Continuation
  push [bp+2]
  push dx
  push #1
  mov 1, sp
  push [bp+4]
  push cx
  push #L139
  mov cx, sp
  ;; (222'37) Tail: splitloop (f3) @ con_0'0 (t1)
  mov bp, [bp+3]
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L141: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push cx
  push #L140
  mov cx, sp
  ;; (222'46) Tail: implode (f2) @ app_99'28 (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L142: ; Continuation
  push [bp+6]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L141
  mov cx, sp
  ;; (99'28) Tail: app_99'25 (arg) @ accCs (f5)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+5]
  mov ax, [bp]
  jmp [ax]

L143: ; Arm: 222'22
  push 2
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push cx
  push #L142
  mov cx, sp
  ;; (99'25) Tail: revloop (g20) @ con_99'25 (g76)
  mov bp, 120
  mov dx, 176
  mov ax, [bp]
  jmp [ax]

L144: ; Continuation
  ;; (223'37) Tail: app_223'26 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L145: ; Continuation
  push [bp+2]
  push [bp+3]
  push #1
  mov 1, sp
  push [bp+4]
  push cx
  push #L144
  mov cx, sp
  ;; (223'26) Tail: app_223'20 (arg) @ con_0'0 (t1)
  mov bp, dx
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L146: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L137
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov ax, 1
  cmp ax, 175
  call bios_make_bool_from_z
  mov 3, ax
  mov bx, 3
  cmp [bx], #1
  bz L143
  push 2
  push 1
  push [bp+4]
  push cx
  push #L145
  mov cx, sp
  ;; (223'20) Tail: splitloop (f3) @ accWs (f2)
  mov dx, [bp+2]
  mov bp, [bp+3]
  mov ax, [bp]
  jmp [ax]

L147: ; Function: t1
  push dx
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push #L146
  mov 1, sp
  ;; (0'0) Return: lam_218'30 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L148: ; Function: t1
  push bp
  push dx
  push [bp+1]
  push #L147
  mov 1, sp
  ;; (0'0) Return: lam_218'24 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L149: ; Arm: 241'36
  ;; (0'0) Return: con_241'41 (g85)
  mov dx, 185
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L150: ; Continuation
  ;; (242'28) Tail: mainloop (f2) @ con_242'28 (g213)
  mov bp, [bp+2]
  mov dx, 313
  mov ax, [bp]
  jmp [ax]

L151: ; Arm: 231'7
  ;; (0'0) Return: con_231'10 (g88)
  mov dx, 188
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L152: ; Continuation
  mov ax, 194
  call bios_put_char
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L153: ; Continuation
  push cx
  push #L152
  mov cx, sp
  ;; (120'29) Tail: put_chars (g23) @ app_120'38 (arg)
  mov bp, 123
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L154: ; Continuation
  push cx
  push #L153
  mov cx, sp
  ;; (120'38) Tail: explode (f2) @ lit_158'16 (g93)
  mov bp, [bp+2]
  mov dx, 193
  mov ax, [bp]
  jmp [ax]

L155: ; Continuation
  push [bp+2]
  push cx
  push #L154
  mov cx, sp
  ;; (120'29) Tail: put_chars (g23) @ app_120'38 (arg)
  mov bp, 123
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L156: ; Arm: 158'7
  push [bp+2]
  push cx
  push #L155
  mov cx, sp
  ;; (120'38) Tail: explode (f2) @ lit_153'25 (g92)
  mov bp, [bp+2]
  mov dx, 192
  mov ax, [bp]
  jmp [ax]

L157: ; Continuation
  mov ax, 197
  call bios_put_char
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L158: ; Continuation
  push cx
  push #L157
  mov cx, sp
  ;; (120'29) Tail: put_chars (g23) @ app_120'38 (arg)
  mov bp, 123
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L159: ; Continuation
  push cx
  push #L158
  mov cx, sp
  ;; (120'38) Tail: explode (f2) @ lit_161'21 (g96)
  mov bp, [bp+2]
  mov dx, 196
  mov ax, [bp]
  jmp [ax]

L160: ; Continuation
  push [bp+2]
  push cx
  push #L159
  mov cx, sp
  ;; (120'29) Tail: put_chars (g23) @ app_120'38 (arg)
  mov bp, 123
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L161: ; Arm: 161'12
  mov ax, [bx+1]
  mov 3, ax
  mov ax, [bx+2]
  mov 4, ax
  push [bp+2]
  push cx
  push #L160
  mov cx, sp
  ;; (120'38) Tail: explode (f2) @ lit_153'25 (g95)
  mov bp, [bp+2]
  mov dx, 195
  mov ax, [bp]
  jmp [ax]

L162: ; Continuation
  mov ax, 213
  call bios_put_char
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L163: ; Continuation
  push cx
  push #L162
  mov cx, sp
  ;; (120'29) Tail: put_chars (g23) @ app_120'38 (arg)
  mov bp, 123
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L164: ; Continuation
  push cx
  push #L163
  mov cx, sp
  ;; (120'38) Tail: explode (f2) @ lit_164'24 (g112)
  mov bp, [bp+2]
  mov dx, 212
  mov ax, [bp]
  jmp [ax]

L165: ; Continuation
  push [bp+2]
  push cx
  push #L164
  mov cx, sp
  ;; (120'29) Tail: put_chars (g23) @ app_120'38 (arg)
  mov bp, 123
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L166: ; Arm: 164'15
  push [bp+2]
  push cx
  push #L165
  mov cx, sp
  ;; (120'38) Tail: explode (f2) @ lit_153'25 (g111)
  mov bp, [bp+2]
  mov dx, 211
  mov ax, [bp]
  jmp [ax]

L167: ; Continuation
  mov ax, 235
  call bios_put_char
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L168: ; Continuation
  push cx
  push #L167
  mov cx, sp
  ;; (122'26) Tail: put_chars (g23) @ case_113'2 (arg)
  mov bp, 123
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L169: ; Arm: 113'11
  ;; (0'0) Return: con_0'0 (g133)
  mov dx, 233
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L170: ; Continuation
  ;; (113'41) Tail: app_113'38 (arg) @ res (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L171: ; Continuation
  mov ax, [bp+2]
  cmp ax, 230
  call bios_make_bool_from_z
  mov 1, ax
  push cx
  push #L168
  mov cx, sp
  mov bx, 1
  cmp [bx], #1
  bz L169
  push [bp+2]
  push cx
  push #L170
  mov cx, sp
  ;; (113'38) Tail: loop (g125) @ con_113'38 (g134)
  mov bp, 225
  mov dx, 234
  mov ax, [bp]
  jmp [ax]

L172: ; Continuation
  push [bp+2]
  push cx
  push #L171
  mov cx, sp
  ;; (120'29) Tail: put_chars (g23) @ app_120'38 (arg)
  mov bp, 123
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L173: ; Continuation
  push [bp+3]
  push cx
  push #L172
  mov cx, sp
  ;; (120'38) Tail: explode (f2) @ lit_168'22 (g124)
  mov bp, [bp+2]
  mov dx, 224
  mov ax, [bp]
  jmp [ax]

L174: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L173
  mov cx, sp
  ;; (122'26) Tail: put_chars (g23) @ case_113'2 (arg)
  mov bp, 123
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L175: ; Arm: 113'11
  ;; (0'0) Return: con_0'0 (g122)
  mov dx, 222
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L176: ; Continuation
  ;; (113'41) Tail: app_113'38 (arg) @ n (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L177: ; Continuation
  mov ax, [bp+3]
  cmp ax, 219
  call bios_make_bool_from_z
  mov 1, ax
  push dx
  push [bp+2]
  push cx
  push #L174
  mov cx, sp
  mov bx, 1
  cmp [bx], #1
  bz L175
  push [bp+3]
  push cx
  push #L176
  mov cx, sp
  ;; (113'38) Tail: loop (g114) @ con_113'38 (g123)
  mov bp, 214
  mov dx, 223
  mov ax, [bp]
  jmp [ax]

L178: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L166
  mov ax, [bx+1]
  mov 1, ax
  push 1
  push [bp+2]
  push cx
  push #L177
  mov cx, sp
  ;; (166'25) Tail: fib (g60) @ n (t1)
  mov bp, 160
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L179: ; Continuation
  push [bp+2]
  push cx
  push #L178
  mov cx, sp
  ;; (79'9) Tail: app_79'7 (arg) @ s (f3)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+3]
  mov ax, [bp]
  jmp [ax]

L180: ; Continuation
  push dx
  push [bp+2]
  push cx
  push #L179
  mov cx, sp
  ;; (79'7) Tail: loop (g98) @ lit_79'7 (g110)
  mov bp, 198
  mov dx, 210
  mov ax, [bp]
  jmp [ax]

L181: ; Continuation
  mov bx, [bp+3]
  cmp [bx], #0
  bz L156
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov bx, 2
  cmp [bx], #1
  bz L161
  push [bp+2]
  push cx
  push #L180
  mov cx, sp
  ;; (163'33) Tail: explode (f2) @ arg1 (t1)
  mov bp, [bp+2]
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L182: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L181
  mov cx, sp
  ;; (120'29) Tail: put_chars (g23) @ app_120'38 (arg)
  mov bp, 123
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L183: ; Arm: 233'32
  push [bp+7]
  push [bp+3]
  push cx
  push #L182
  mov cx, sp
  ;; (120'38) Tail: explode (f3) @ lit_156'13 (g91)
  mov bp, [bp+3]
  mov dx, 191
  mov ax, [bp]
  jmp [ax]

L184: ; Continuation
  mov ax, 241
  call bios_put_char
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L185: ; Continuation
  push cx
  push #L184
  mov cx, sp
  ;; (120'29) Tail: put_chars (g23) @ app_120'38 (arg)
  mov bp, 123
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L186: ; Continuation
  push cx
  push #L185
  mov cx, sp
  ;; (120'38) Tail: explode (f2) @ lit_175'16 (g140)
  mov bp, [bp+2]
  mov dx, 240
  mov ax, [bp]
  jmp [ax]

L187: ; Continuation
  push [bp+2]
  push cx
  push #L186
  mov cx, sp
  ;; (120'29) Tail: put_chars (g23) @ app_120'38 (arg)
  mov bp, 123
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L188: ; Arm: 175'7
  push [bp+2]
  push cx
  push #L187
  mov cx, sp
  ;; (120'38) Tail: explode (f2) @ lit_153'25 (g139)
  mov bp, [bp+2]
  mov dx, 239
  mov ax, [bp]
  jmp [ax]

L189: ; Continuation
  mov ax, 244
  call bios_put_char
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L190: ; Continuation
  push cx
  push #L189
  mov cx, sp
  ;; (120'29) Tail: put_chars (g23) @ app_120'38 (arg)
  mov bp, 123
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L191: ; Continuation
  push cx
  push #L190
  mov cx, sp
  ;; (120'38) Tail: explode (f2) @ lit_178'21 (g143)
  mov bp, [bp+2]
  mov dx, 243
  mov ax, [bp]
  jmp [ax]

L192: ; Continuation
  push [bp+2]
  push cx
  push #L191
  mov cx, sp
  ;; (120'29) Tail: put_chars (g23) @ app_120'38 (arg)
  mov bp, 123
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L193: ; Arm: 178'12
  mov ax, [bx+1]
  mov 3, ax
  mov ax, [bx+2]
  mov 4, ax
  push [bp+2]
  push cx
  push #L192
  mov cx, sp
  ;; (120'38) Tail: explode (f2) @ lit_153'25 (g142)
  mov bp, [bp+2]
  mov dx, 242
  mov ax, [bp]
  jmp [ax]

L194: ; Continuation
  mov ax, 260
  call bios_put_char
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L195: ; Continuation
  push cx
  push #L194
  mov cx, sp
  ;; (120'29) Tail: put_chars (g23) @ app_120'38 (arg)
  mov bp, 123
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L196: ; Continuation
  push cx
  push #L195
  mov cx, sp
  ;; (120'38) Tail: explode (f2) @ lit_181'24 (g159)
  mov bp, [bp+2]
  mov dx, 259
  mov ax, [bp]
  jmp [ax]

L197: ; Continuation
  push [bp+2]
  push cx
  push #L196
  mov cx, sp
  ;; (120'29) Tail: put_chars (g23) @ app_120'38 (arg)
  mov bp, 123
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L198: ; Arm: 181'15
  push [bp+2]
  push cx
  push #L197
  mov cx, sp
  ;; (120'38) Tail: explode (f2) @ lit_153'25 (g158)
  mov bp, [bp+2]
  mov dx, 258
  mov ax, [bp]
  jmp [ax]

L199: ; Continuation
  mov ax, 282
  call bios_put_char
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L200: ; Continuation
  push cx
  push #L199
  mov cx, sp
  ;; (122'26) Tail: put_chars (g23) @ case_113'2 (arg)
  mov bp, 123
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L201: ; Arm: 113'11
  ;; (0'0) Return: con_0'0 (g180)
  mov dx, 280
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L202: ; Continuation
  ;; (113'41) Tail: app_113'38 (arg) @ res (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L203: ; Continuation
  mov ax, [bp+2]
  cmp ax, 277
  call bios_make_bool_from_z
  mov 1, ax
  push cx
  push #L200
  mov cx, sp
  mov bx, 1
  cmp [bx], #1
  bz L201
  push [bp+2]
  push cx
  push #L202
  mov cx, sp
  ;; (113'38) Tail: loop (g172) @ con_113'38 (g181)
  mov bp, 272
  mov dx, 281
  mov ax, [bp]
  jmp [ax]

L204: ; Continuation
  push [bp+2]
  push cx
  push #L203
  mov cx, sp
  ;; (120'29) Tail: put_chars (g23) @ app_120'38 (arg)
  mov bp, 123
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L205: ; Continuation
  push [bp+3]
  push cx
  push #L204
  mov cx, sp
  ;; (120'38) Tail: explode (f2) @ lit_185'22 (g171)
  mov bp, [bp+2]
  mov dx, 271
  mov ax, [bp]
  jmp [ax]

L206: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L205
  mov cx, sp
  ;; (122'26) Tail: put_chars (g23) @ case_113'2 (arg)
  mov bp, 123
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L207: ; Arm: 113'11
  ;; (0'0) Return: con_0'0 (g169)
  mov dx, 269
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L208: ; Continuation
  ;; (113'41) Tail: app_113'38 (arg) @ n (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L209: ; Continuation
  mov ax, [bp+3]
  cmp ax, 266
  call bios_make_bool_from_z
  mov 1, ax
  push dx
  push [bp+2]
  push cx
  push #L206
  mov cx, sp
  mov bx, 1
  cmp [bx], #1
  bz L207
  push [bp+3]
  push cx
  push #L208
  mov cx, sp
  ;; (113'38) Tail: loop (g161) @ con_113'38 (g170)
  mov bp, 261
  mov dx, 270
  mov ax, [bp]
  jmp [ax]

L210: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L198
  mov ax, [bx+1]
  mov 1, ax
  push 1
  push [bp+2]
  push cx
  push #L209
  mov cx, sp
  ;; (183'26) Tail: fact (g64) @ n (t1)
  mov bp, 164
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L211: ; Continuation
  push [bp+2]
  push cx
  push #L210
  mov cx, sp
  ;; (79'9) Tail: app_79'7 (arg) @ s (f3)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+3]
  mov ax, [bp]
  jmp [ax]

L212: ; Continuation
  push dx
  push [bp+2]
  push cx
  push #L211
  mov cx, sp
  ;; (79'7) Tail: loop (g145) @ lit_79'7 (g157)
  mov bp, 245
  mov dx, 257
  mov ax, [bp]
  jmp [ax]

L213: ; Continuation
  mov bx, [bp+3]
  cmp [bx], #0
  bz L188
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov bx, 2
  cmp [bx], #1
  bz L193
  push [bp+2]
  push cx
  push #L212
  mov cx, sp
  ;; (180'33) Tail: explode (f2) @ arg1 (t1)
  mov bp, [bp+2]
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L214: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L213
  mov cx, sp
  ;; (120'29) Tail: put_chars (g23) @ app_120'38 (arg)
  mov bp, 123
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L215: ; Arm: 234'35
  push [bp+7]
  push [bp+3]
  push cx
  push #L214
  mov cx, sp
  ;; (120'38) Tail: explode (f3) @ lit_173'13 (g138)
  mov bp, [bp+3]
  mov dx, 238
  mov ax, [bp]
  jmp [ax]

L216: ; Continuation
  mov ax, 287
  call bios_put_char
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L217: ; Continuation
  push cx
  push #L216
  mov cx, sp
  ;; (120'29) Tail: put_chars (g23) @ app_120'38 (arg)
  mov bp, 123
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L218: ; Continuation
  push cx
  push #L217
  mov cx, sp
  ;; (120'38) Tail: explode (f2) @ lit_204'18 (g186)
  mov bp, [bp+2]
  mov dx, 286
  mov ax, [bp]
  jmp [ax]

L219: ; Continuation
  push [bp+2]
  push cx
  push #L218
  mov cx, sp
  ;; (120'29) Tail: put_chars (g23) @ app_120'38 (arg)
  mov bp, 123
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L220: ; Arm: 204'9
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push [bp+3]
  push cx
  push #L219
  mov cx, sp
  ;; (120'38) Tail: explode (f3) @ lit_153'25 (g185)
  mov bp, [bp+3]
  mov dx, 285
  mov ax, [bp]
  jmp [ax]

L221: ; Arm: 197'38
  ;; (0'0) Return: con_197'43 (g191)
  mov dx, 291
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L222: ; Continuation
  mov ax, 293
  call bios_put_char
  mov 1, ax
  ;; (198'56) Tail: loop (f2) @ con_198'56 (g194)
  mov bp, [bp+2]
  mov dx, 294
  mov ax, [bp]
  jmp [ax]

L223: ; Continuation
  push [bp+2]
  push cx
  push #L222
  mov cx, sp
  ;; (120'29) Tail: put_chars (g23) @ app_120'38 (arg)
  mov bp, 123
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L224: ; Continuation
  push [bp+3]
  push cx
  push #L223
  mov cx, sp
  ;; (120'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L225: ; Continuation
  push [bp+4]
  push [bp+3]
  push cx
  push #L224
  mov cx, sp
  ;; (192'31) Tail: implode (f2) @ app_99'28 (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L226: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L225
  mov cx, sp
  ;; (99'28) Tail: app_99'25 (arg) @ xs (f5)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+5]
  mov ax, [bp]
  jmp [ax]

L227: ; Continuation
  push dx
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L226
  mov cx, sp
  ;; (99'25) Tail: revloop (g20) @ con_99'25 (g192)
  mov bp, 120
  mov dx, 292
  mov ax, [bp]
  jmp [ax]

L228: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L221
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L227
  mov cx, sp
  ;; (192'49) Tail: explode (f3) @ line (f5)
  mov dx, [bp+5]
  mov bp, [bp+3]
  mov ax, [bp]
  jmp [ax]

L229: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L228
  mov cx, sp
  ;; (90'44) Tail: app_90'41 (arg) @ ys (f6)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+6]
  mov ax, [bp]
  jmp [ax]

L230: ; Continuation
  push [bp+7]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L229
  mov cx, sp
  ;; (90'41) Tail: app_90'33 (arg) @ xs (f6)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+6]
  mov ax, [bp]
  jmp [ax]

L231: ; Continuation
  push dx
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L230
  mov cx, sp
  ;; (90'33) Tail: eq_list (g15) @ lam_0'0 (g190)
  mov bp, 115
  mov dx, 290
  mov ax, [bp]
  jmp [ax]

L232: ; Continuation
  push dx
  push [bp+6]
  push [bp+5]
  push [bp+3]
  push [bp+2]
  push cx
  push #L231
  mov cx, sp
  ;; (92'57) Tail: explode (f3) @ single_controlD (f4)
  mov dx, [bp+4]
  mov bp, [bp+3]
  mov ax, [bp]
  jmp [ax]

L233: ; Continuation
  push dx
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L232
  mov cx, sp
  ;; (92'44) Tail: explode (f3) @ line (arg)
  mov bp, [bp+3]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L234: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L233
  mov cx, sp
  ;; (143'27) Tail: implode (f2) @ app_143'37 (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L235: ; Function: t1
  push bp
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push cx
  push #L234
  mov cx, sp
  ;; (143'37) Tail: readloop (g31) @ con_143'37 (g189)
  mov bp, 131
  mov dx, 289
  mov ax, [bp]
  jmp [ax]

L236: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push #L235
  mov 1, sp
  ;; (200'6) Tail: loop (t1) @ con_200'6 (g195)
  mov bp, 1
  mov dx, 295
  mov ax, [bp]
  jmp [ax]

L237: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L236
  mov cx, sp
  ;; (120'29) Tail: put_chars (g23) @ app_120'38 (arg)
  mov bp, 123
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L238: ; Arm: 235'36
  mov bx, [bp+6]
  cmp [bx], #1
  bz L220
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L237
  mov cx, sp
  ;; (120'38) Tail: explode (f3) @ lit_206'16 (g188)
  mov bp, [bp+3]
  mov dx, 288
  mov ax, [bp]
  jmp [ax]

L239: ; Continuation
  mov ax, 312
  call bios_put_char
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L240: ; Continuation
  push cx
  push #L239
  mov cx, sp
  ;; (120'29) Tail: put_chars (g23) @ app_120'38 (arg)
  mov bp, 123
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L241: ; Continuation
  push cx
  push #L240
  mov cx, sp
  ;; (120'38) Tail: explode (f2) @ lit_215'13 (g211)
  mov bp, [bp+2]
  mov dx, 311
  mov ax, [bp]
  jmp [ax]

L242: ; Continuation
  push [bp+2]
  push cx
  push #L241
  mov cx, sp
  ;; (122'26) Tail: put_chars (g23) @ case_113'2 (arg)
  mov bp, 123
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L243: ; Arm: 113'11
  ;; (0'0) Return: con_0'0 (g209)
  mov dx, 309
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L244: ; Continuation
  ;; (113'41) Tail: app_113'38 (arg) @ n (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L245: ; Continuation
  mov ax, [bp+3]
  cmp ax, 306
  call bios_make_bool_from_z
  mov 1, ax
  push [bp+2]
  push cx
  push #L242
  mov cx, sp
  mov bx, 1
  cmp [bx], #1
  bz L243
  push [bp+3]
  push cx
  push #L244
  mov cx, sp
  ;; (113'38) Tail: loop (g201) @ con_113'38 (g210)
  mov bp, 301
  mov dx, 310
  mov ax, [bp]
  jmp [ax]

L246: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L245
  mov cx, sp
  ;; (120'29) Tail: put_chars (g23) @ app_120'38 (arg)
  mov bp, 123
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L247: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L246
  mov cx, sp
  ;; (120'38) Tail: explode (f2) @ lit_213'13 (g200)
  mov bp, [bp+2]
  mov dx, 300
  mov ax, [bp]
  jmp [ax]

L248: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L247
  mov cx, sp
  ;; (120'29) Tail: put_chars (g23) @ app_120'38 (arg)
  mov bp, 123
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L249: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L248
  mov cx, sp
  ;; (120'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L250: ; Continuation
  push [bp+4]
  push [bp+3]
  push cx
  push #L249
  mov cx, sp
  ;; (37'34) Tail: implode (f2) @ app_37'55 (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L251: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L250
  mov cx, sp
  ;; (37'55) Tail: app_37'42 (f5) @ app_37'64 (arg)
  mov bp, [bp+5]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L252: ; Continuation
  push dx
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L251
  mov cx, sp
  ;; (37'64) Tail: explode (f3) @ s2 (f5)
  mov dx, [bp+5]
  mov bp, [bp+3]
  mov ax, [bp]
  jmp [ax]

L253: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L252
  mov cx, sp
  ;; (37'42) Tail: append (g5) @ app_37'51 (arg)
  mov bp, 105
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L254: ; Continuation
  push dx
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L253
  mov cx, sp
  ;; (37'51) Tail: explode (f3) @ lit_212'28 (g199)
  mov bp, [bp+3]
  mov dx, 299
  mov ax, [bp]
  jmp [ax]

L255: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L254
  mov cx, sp
  ;; (212'53) Tail: implode (f2) @ app_212'67 (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L256: ; Continuation
  push [bp+5]
  push [bp+3]
  push [bp+2]
  push cx
  push #L255
  mov cx, sp
  ;; (212'67) Tail: star_the_ohs (f4) @ app_212'76 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L257: ; Continuation
  mov ax, [bp+4]
  call bios_string_length
  mov 1, ax
  push 1
  push dx
  push [bp+3]
  push [bp+2]
  push cx
  push #L256
  mov cx, sp
  ;; (212'76) Tail: explode (f3) @ line (f4)
  mov dx, [bp+4]
  mov bp, [bp+3]
  mov ax, [bp]
  jmp [ax]

L258: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L238
  push [bp+5]
  push [bp+3]
  push [bp+2]
  push cx
  push #L257
  mov cx, sp
  ;; (210'25) Tail: map (g21) @ lam_210'30 (g198)
  mov bp, 121
  mov dx, 298
  mov ax, [bp]
  jmp [ax]

L259: ; Continuation
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L258
  mov cx, sp
  ;; (90'44) Tail: app_90'41 (arg) @ ys (f7)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+7]
  mov ax, [bp]
  jmp [ax]

L260: ; Continuation
  push [bp+8]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L259
  mov cx, sp
  ;; (90'41) Tail: app_90'33 (arg) @ xs (f7)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+7]
  mov ax, [bp]
  jmp [ax]

L261: ; Continuation
  push dx
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L260
  mov cx, sp
  ;; (90'33) Tail: eq_list (g15) @ lam_0'0 (g184)
  mov bp, 115
  mov dx, 284
  mov ax, [bp]
  jmp [ax]

L262: ; Continuation
  push dx
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L261
  mov cx, sp
  ;; (92'57) Tail: explode (f3) @ lit_235'30 (g183)
  mov bp, [bp+3]
  mov dx, 283
  mov ax, [bp]
  jmp [ax]

L263: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L215
  push [bp+7]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L262
  mov cx, sp
  ;; (92'44) Tail: explode (f3) @ command (f6)
  mov dx, [bp+6]
  mov bp, [bp+3]
  mov ax, [bp]
  jmp [ax]

L264: ; Continuation
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L263
  mov cx, sp
  ;; (90'44) Tail: app_90'41 (arg) @ ys (f8)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+8]
  mov ax, [bp]
  jmp [ax]

L265: ; Continuation
  push [bp+9]
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L264
  mov cx, sp
  ;; (90'41) Tail: app_90'33 (arg) @ xs (f8)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+8]
  mov ax, [bp]
  jmp [ax]

L266: ; Continuation
  push dx
  push [bp+8]
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L265
  mov cx, sp
  ;; (90'33) Tail: eq_list (g15) @ lam_0'0 (g137)
  mov bp, 115
  mov dx, 237
  mov ax, [bp]
  jmp [ax]

L267: ; Continuation
  push dx
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L266
  mov cx, sp
  ;; (92'57) Tail: explode (f3) @ lit_234'28 (g136)
  mov bp, [bp+3]
  mov dx, 236
  mov ax, [bp]
  jmp [ax]

L268: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L183
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L267
  mov cx, sp
  ;; (92'44) Tail: explode (f3) @ command (f6)
  mov dx, [bp+6]
  mov bp, [bp+3]
  mov ax, [bp]
  jmp [ax]

L269: ; Continuation
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L268
  mov cx, sp
  ;; (90'44) Tail: app_90'41 (arg) @ ys (f8)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+8]
  mov ax, [bp]
  jmp [ax]

L270: ; Continuation
  push [bp+9]
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L269
  mov cx, sp
  ;; (90'41) Tail: app_90'33 (arg) @ xs (f8)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+8]
  mov ax, [bp]
  jmp [ax]

L271: ; Continuation
  push dx
  push [bp+8]
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L270
  mov cx, sp
  ;; (90'33) Tail: eq_list (g15) @ lam_0'0 (g90)
  mov bp, 115
  mov dx, 190
  mov ax, [bp]
  jmp [ax]

L272: ; Continuation
  push dx
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L271
  mov cx, sp
  ;; (92'57) Tail: explode (f3) @ lit_233'26 (g89)
  mov bp, [bp+3]
  mov dx, 189
  mov ax, [bp]
  jmp [ax]

L273: ; Continuation
  push [bp+5]
  push cx
  push #L150
  mov cx, sp
  mov bx, dx
  cmp [bx], #0
  bz L151
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push 2
  push 1
  push [bp+6]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L272
  mov cx, sp
  ;; (92'44) Tail: explode (f3) @ command (t1)
  mov bp, [bp+3]
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L274: ; Continuation
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L273
  mov cx, sp
  ;; (226'18) Tail: app_226'15 (arg) @ s (f7)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+7]
  mov ax, [bp]
  jmp [ax]

L275: ; Continuation
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L274
  mov cx, sp
  ;; (226'15) Tail: app_226'12 (arg) @ con_226'15 (g87)
  mov bp, dx
  mov dx, 187
  mov ax, [bp]
  jmp [ax]

L276: ; Continuation
  push dx
  push [bp+7]
  push [bp+6]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L275
  mov cx, sp
  ;; (226'12) Tail: splitloop (f5) @ con_226'12 (g86)
  mov bp, [bp+5]
  mov dx, 186
  mov ax, [bp]
  jmp [ax]

L277: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L149
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L276
  mov cx, sp
  ;; (229'35) Tail: explode (f3) @ line (f7)
  mov dx, [bp+7]
  mov bp, [bp+3]
  mov ax, [bp]
  jmp [ax]

L278: ; Continuation
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L277
  mov cx, sp
  ;; (90'44) Tail: app_90'41 (arg) @ ys (f8)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+8]
  mov ax, [bp]
  jmp [ax]

L279: ; Continuation
  push [bp+9]
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L278
  mov cx, sp
  ;; (90'41) Tail: app_90'33 (arg) @ xs (f8)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+8]
  mov ax, [bp]
  jmp [ax]

L280: ; Continuation
  push dx
  push [bp+8]
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L279
  mov cx, sp
  ;; (90'33) Tail: eq_list (g15) @ lam_0'0 (g84)
  mov bp, 115
  mov dx, 184
  mov ax, [bp]
  jmp [ax]

L281: ; Continuation
  push dx
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L280
  mov cx, sp
  ;; (92'57) Tail: explode (f3) @ single_controlD (f4)
  mov dx, [bp+4]
  mov bp, [bp+3]
  mov ax, [bp]
  jmp [ax]

L282: ; Continuation
  push dx
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L281
  mov cx, sp
  ;; (92'44) Tail: explode (f3) @ line (arg)
  mov bp, [bp+3]
  mov dx, dx
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
  ;; (143'27) Tail: implode (f2) @ app_143'37 (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L284: ; Continuation
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L283
  mov cx, sp
  ;; (143'37) Tail: readloop (g31) @ con_143'37 (g83)
  mov bp, 131
  mov dx, 183
  mov ax, [bp]
  jmp [ax]

L285: ; Function: t2
  push bp
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push cx
  push #L284
  mov cx, sp
  ;; (239'12) Tail: put_chars (g23) @ con_239'13 (g82)
  mov bp, 123
  mov dx, 182
  mov ax, [bp]
  jmp [ax]

L286: ; Continuation
  ;; (246'11) Tail: mainloop (f2) @ con_246'11 (g215)
  mov bp, [bp+2]
  mov dx, 315
  mov ax, [bp]
  jmp [ax]

L287: ; Continuation
  push [bp+2]
  push cx
  push #L286
  mov cx, sp
  ;; (120'29) Tail: put_chars (g23) @ app_120'38 (arg)
  mov bp, 123
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L288: ; Continuation
  push [bp+2]
  push #L148
  mov 1, sp
  push 1
  push dx
  push [bp+3]
  push [bp+2]
  push #L285
  mov 2, sp
  push 2
  push cx
  push #L287
  mov cx, sp
  ;; (120'38) Tail: explode (f3) @ lit_245'13 (g214)
  mov bp, [bp+3]
  mov dx, 314
  mov ax, [bp]
  jmp [ax]

L289: ; Continuation
  push dx
  push [bp+2]
  push cx
  push #L288
  mov cx, sp
  ;; (190'30) Tail: implode (f2) @ con_0'0 (g72)
  mov bp, [bp+2]
  mov dx, 172
  mov ax, [bp]
  jmp [ax]

L290: ; Continuation
  push dx
  push cx
  push #L289
  mov cx, sp
  ;; (35'23) Tail: block (g1) @ lam_28'12 (g14)
  mov bp, 101
  mov dx, 114
  mov ax, [bp]
  jmp [ax]

L291: ; Start
  push #L2
  mov 101, sp
  mov ax, #0
  mov 103, ax
  mov ax, #1
  mov 104, ax
  push #L5
  mov 102, sp
  push #L10
  mov 105, sp
  push #0
  mov 106, sp
  mov ax, #1
  mov 107, ax
  mov ax, #0
  mov 108, ax
  push #L18
  mov 109, sp
  mov ax, #0
  mov 110, ax
  mov ax, #1
  mov 111, ax
  push #0
  mov 112, sp
  mov ax, #1
  mov 113, ax
  push #L24
  mov 114, sp
  push #1
  mov 116, sp
  push #0
  mov 117, sp
  push #0
  mov 118, sp
  push #0
  mov 119, sp
  push #L35
  mov 115, sp
  push #L39
  mov 120, sp
  push #0
  mov 122, sp
  push #L45
  mov 121, sp
  push #0
  mov 124, sp
  mov ax, #8
  mov 125, ax
  mov ax, #'\n'
  mov 126, ax
  mov ax, #26
  mov 127, ax
  mov ax, #'^'
  mov 128, ax
  mov ax, #65
  mov 129, ax
  mov ax, #1
  mov 130, ax
  push #L51
  mov 123, sp
  push #0
  mov 132, sp
  mov ax, #'\n'
  mov 133, ax
  mov ax, #'\n'
  mov 134, ax
  push #0
  mov 135, sp
  mov ax, #'\EOT'
  mov 136, ax
  mov ax, #'^'
  mov 137, ax
  mov ax, #'D'
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
  push #L67
  mov 131, sp
  mov ax, #2
  mov 161, ax
  mov ax, #1
  mov 162, ax
  mov ax, #2
  mov 163, ax
  push #L71
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
  push #L76
  mov 164, sp
  mov ax, #'\EOT'
  mov 170, ax
  push #0
  mov 171, sp
  push 171
  push 170
  push #1
  mov 172, sp
  push #0
  mov 173, sp
  push #0
  mov 174, sp
  mov ax, #' '
  mov 175, ax
  push #0
  mov 176, sp
  push #0
  mov 177, sp
  mov ax, #'>'
  mov 178, ax
  mov ax, #' '
  mov 179, ax
  push #0
  mov 180, sp
  push 180
  push 179
  push #1
  mov 181, sp
  push 181
  push 178
  push #1
  mov 182, sp
  push #0
  mov 183, sp
  push #L78
  mov 184, sp
  push #0
  mov 185, sp
  push #0
  mov 186, sp
  push #0
  mov 187, sp
  push #0
  mov 188, sp
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
  mov 189, ax
  push #L80
  mov 190, sp
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
  mov 193, ax
  mov ax, #'\n'
  mov 194, ax
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
  mov 195, ax
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
  mov 196, ax
  mov ax, #'\n'
  mov 197, ax
  mov ax, #48
  mov 199, ax
  mov ax, #0
  mov 200, ax
  push #0
  mov 201, sp
  push #1
  mov 202, sp
  mov ax, #9
  mov 203, ax
  push #0
  mov 204, sp
  push #1
  mov 205, sp
  push #1
  mov 206, sp
  push #1
  mov 207, sp
  push #1
  mov 208, sp
  mov ax, #10
  mov 209, ax
  push #L92
  mov 198, sp
  mov ax, #0
  mov 210, ax
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
  mov 211, ax
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
  mov 212, ax
  mov ax, #'\n'
  mov 213, ax
  mov ax, #0
  mov 215, ax
  mov ax, #10
  mov 216, ax
  mov ax, #48
  mov 217, ax
  mov ax, #10
  mov 218, ax
  push #L96
  mov 214, sp
  mov ax, #0
  mov 219, ax
  mov ax, #'0'
  mov 220, ax
  push #0
  mov 221, sp
  push 221
  push 220
  push #1
  mov 222, sp
  push #0
  mov 223, sp
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
  mov 224, ax
  mov ax, #0
  mov 226, ax
  mov ax, #10
  mov 227, ax
  mov ax, #48
  mov 228, ax
  mov ax, #10
  mov 229, ax
  push #L100
  mov 225, sp
  mov ax, #0
  mov 230, ax
  mov ax, #'0'
  mov 231, ax
  push #0
  mov 232, sp
  push 232
  push 231
  push #1
  mov 233, sp
  push #0
  mov 234, sp
  mov ax, #'\n'
  mov 235, ax
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
  mov 236, ax
  push #L102
  mov 237, sp
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
  mov 240, ax
  mov ax, #'\n'
  mov 241, ax
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
  mov 242, ax
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
  mov 243, ax
  mov ax, #'\n'
  mov 244, ax
  mov ax, #48
  mov 246, ax
  mov ax, #0
  mov 247, ax
  push #0
  mov 248, sp
  push #1
  mov 249, sp
  mov ax, #9
  mov 250, ax
  push #0
  mov 251, sp
  push #1
  mov 252, sp
  push #1
  mov 253, sp
  push #1
  mov 254, sp
  push #1
  mov 255, sp
  mov ax, #10
  mov 256, ax
  push #L114
  mov 245, sp
  mov ax, #0
  mov 257, ax
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
  mov 258, ax
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
  mov 259, ax
  mov ax, #'\n'
  mov 260, ax
  mov ax, #0
  mov 262, ax
  mov ax, #10
  mov 263, ax
  mov ax, #48
  mov 264, ax
  mov ax, #10
  mov 265, ax
  push #L118
  mov 261, sp
  mov ax, #0
  mov 266, ax
  mov ax, #'0'
  mov 267, ax
  push #0
  mov 268, sp
  push 268
  push 267
  push #1
  mov 269, sp
  push #0
  mov 270, sp
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
  mov 271, ax
  mov ax, #0
  mov 273, ax
  mov ax, #10
  mov 274, ax
  mov ax, #48
  mov 275, ax
  mov ax, #10
  mov 276, ax
  push #L122
  mov 272, sp
  mov ax, #0
  mov 277, ax
  mov ax, #'0'
  mov 278, ax
  push #0
  mov 279, sp
  push 279
  push 278
  push #1
  mov 280, sp
  push #0
  mov 281, sp
  mov ax, #'\n'
  mov 282, ax
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
  mov 283, ax
  push #L124
  mov 284, sp
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
  mov 285, ax
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
  mov 286, ax
  mov ax, #'\n'
  mov 287, ax
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
  mov 288, ax
  push #0
  mov 289, sp
  push #L126
  mov 290, sp
  push #0
  mov 291, sp
  push #0
  mov 292, sp
  mov ax, #'\n'
  mov 293, ax
  push #0
  mov 294, sp
  push #0
  mov 295, sp
  mov ax, #'o'
  mov 296, ax
  mov ax, #'*'
  mov 297, ax
  push #L128
  mov 298, sp
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
  mov 299, ax
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
  mov 300, ax
  mov ax, #0
  mov 302, ax
  mov ax, #10
  mov 303, ax
  mov ax, #48
  mov 304, ax
  mov ax, #10
  mov 305, ax
  push #L132
  mov 301, sp
  mov ax, #0
  mov 306, ax
  mov ax, #'0'
  mov 307, ax
  push #0
  mov 308, sp
  push 308
  push 307
  push #1
  mov 309, sp
  push #0
  mov 310, sp
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
  mov 311, ax
  mov ax, #'\n'
  mov 312, ax
  push #0
  mov 313, sp
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
  mov 314, ax
  push #0
  mov 315, sp
  push cx
  push #L290
  mov cx, sp
  ;; (26'23) Tail: block (g1) @ lam_16'12 (g9)
  mov bp, 101
  mov dx, 109
  mov ax, [bp]
  jmp [ax]


