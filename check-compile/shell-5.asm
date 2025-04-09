(*Stage5 (ASM)*)
start=L369_Top
L1_Func_t1:
  ;; (2'54) Tail: f (f1) @ a (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L2_TopLam_g1:
  push dx
  push #L1_Func_t1
  mov 201, sp
  ;; (0'0) Return: lam_2'31 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L3_TopLam_g2:
  mov ax, dx
  call bios_explode
  mov 201, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L4_Arm1:
  ;; (0'0) Return: con_53'33 (g4)
  mov dx, 104
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L5_Arm2:
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

L6_Arm1:
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L4_Arm1
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L5_Arm2
  crash

L7_Arm1:
  ;; (0'0) Return: con_56'13 (g6)
  mov dx, 106
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L8_Cont:
  ;; (58'37) Tail: app_58'34 (arg) @ ys (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L9_Cont:
  push [bp+3]
  push cx
  push #L8_Cont
  mov cx, sp
  ;; (58'34) Tail: app_58'31 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L10_Arm1:
  push [bp+4]
  push [bp+3]
  push cx
  push #L9_Cont
  mov cx, sp
  ;; (58'31) Tail: eq_list (g3) @ eq (f2)
  mov dx, [bp+2]
  mov bp, 103
  mov ax, [bp]
  jmp [ax]

L11_Arm2:
  ;; (0'0) Return: con_58'45 (g7)
  mov dx, 107
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L12_Cont:
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L10_Arm1
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L11_Arm2
  crash

L13_Cont:
  push [bp+5]
  push [bp+3]
  push [bp+2]
  push cx
  push #L12_Cont
  mov cx, sp
  ;; (58'16) Tail: app_58'14 (arg) @ y (f4)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+4]
  mov ax, [bp]
  jmp [ax]

L14_Arm2:
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
  push #L13_Cont
  mov cx, sp
  ;; (58'14) Tail: eq (f1) @ x (t1)
  mov bp, [bp+1]
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L15_Arm2:
  mov ax, [bp+2]
  mov ax, [ax+1]
  mov 201, ax
  mov ax, [bp+2]
  mov ax, [ax+2]
  mov 202, ax
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L7_Arm1
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L14_Arm2
  crash

L16_Func_t1:
  mov ax, [bp+2]
  mov ax, [ax]
  cmp ax, #0
  bz L6_Arm1
  mov ax, [bp+2]
  mov ax, [ax]
  cmp ax, #1
  bz L15_Arm2
  crash

L17_Func_t1:
  push dx
  push [bp+1]
  push #L16_Func_t1
  mov 201, sp
  ;; (0'0) Return: lam_51'22 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L18_TopLam_g3:
  push dx
  push #L17_Func_t1
  mov 201, sp
  ;; (0'0) Return: lam_51'19 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L19_Arm1:
  ;; (62'18) Return: ys (arg)
  mov dx, dx
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L20_Cont:
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

L21_Cont:
  push [bp+3]
  push cx
  push #L20_Cont
  mov cx, sp
  ;; (65'31) Tail: app_65'28 (arg) @ ys (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L22_Arm2:
  mov ax, [bp+1]
  mov ax, [ax+1]
  mov 201, ax
  mov ax, [bp+1]
  mov ax, [ax+2]
  mov 202, ax
  push 201
  push dx
  push cx
  push #L21_Cont
  mov cx, sp
  ;; (65'28) Tail: append (g8) @ xs (t2)
  mov bp, 108
  mov dx, 202
  mov ax, [bp]
  jmp [ax]

L23_Func_t1:
  mov ax, [bp+1]
  mov ax, [ax]
  cmp ax, #0
  bz L19_Arm1
  mov ax, [bp+1]
  mov ax, [ax]
  cmp ax, #1
  bz L22_Arm2
  crash

L24_TopLam_g8:
  push dx
  push #L23_Func_t1
  mov 201, sp
  ;; (0'0) Return: lam_62'18 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L25_Arm1:
  ;; (67'16) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L26_Cont:
  ;; (70'34) Tail: app_70'21 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L27_Arm2:
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
  push #L26_Cont
  mov cx, sp
  ;; (70'21) Tail: revloop (g9) @ con_0'0 (t3)
  mov bp, 109
  mov dx, 203
  mov ax, [bp]
  jmp [ax]

L28_Func_t1:
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L25_Arm1
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L27_Arm2
  crash

L29_TopLam_g9:
  push dx
  push #L28_Func_t1
  mov 201, sp
  ;; (0'0) Return: lam_67'20 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L30_Arm1:
  ;; (0'0) Return: con_76'10 (g11)
  mov dx, 111
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L31_Cont:
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

L32_Cont:
  push [bp+3]
  push cx
  push #L31_Cont
  mov cx, sp
  ;; (77'26) Tail: app_77'24 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L33_Cont:
  push dx
  push [bp+3]
  push cx
  push #L32_Cont
  mov cx, sp
  ;; (77'24) Tail: map (g10) @ f (f2)
  mov dx, [bp+2]
  mov bp, 110
  mov ax, [bp]
  jmp [ax]

L34_Arm2:
  mov ax, dx
  mov ax, [ax+1]
  mov 201, ax
  mov ax, dx
  mov ax, [ax+2]
  mov 202, ax
  push 202
  push [bp+1]
  push cx
  push #L33_Cont
  mov cx, sp
  ;; (77'15) Tail: f (f1) @ x (t1)
  mov bp, [bp+1]
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L35_Func_t1:
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L30_Arm1
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L34_Arm2
  crash

L36_TopLam_g10:
  push dx
  push #L35_Func_t1
  mov 201, sp
  ;; (0'0) Return: lam_74'14 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L37_Arm1:
  ;; (0'0) Return: lit_81'10 (g13)
  mov dx, 113
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L38_Cont:
  mov ax, 114
  add ax, dx
  mov 201, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L39_Arm2:
  mov ax, dx
  mov ax, [ax+1]
  mov 201, ax
  mov ax, dx
  mov ax, [ax+2]
  mov 202, ax
  push cx
  push #L38_Cont
  mov cx, sp
  ;; (82'27) Tail: length (g12) @ xs (t2)
  mov bp, 112
  mov dx, 202
  mov ax, [bp]
  jmp [ax]

L40_TopLam_g12:
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L37_Arm1
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L39_Arm2
  crash

L41_Arm1:
  ;; (0'0) Return: con_95'10 (g16)
  mov dx, 116
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L42_Cont:
  ;; (96'35) Tail: put_chars (g15) @ xs (f2)
  mov dx, [bp+2]
  mov bp, 115
  mov ax, [bp]
  jmp [ax]

L43_Arm1:
  mov ax, 201
  call bios_put_char
  mov 205, ax
  ;; (0'0) Return: prim_0'0 (t5)
  mov dx, 205
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L44_Arm1:
  mov ax, 201
  call bios_put_char
  mov 206, ax
  ;; (0'0) Return: prim_0'0 (t6)
  mov dx, 206
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L45_Arm1:
  mov ax, 201
  call bios_put_char
  mov 207, ax
  ;; (0'0) Return: prim_0'0 (t7)
  mov dx, 207
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L46_Arm2:
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

L47_Arm2:
  mov ax, 119
  cmp ax, 203
  call bios_make_bool_from_n
  mov 206, ax
  mov ax, 206
  mov ax, [ax]
  cmp ax, #1
  bz L45_Arm1
  mov ax, 206
  mov ax, [ax]
  cmp ax, #0
  bz L46_Arm2
  crash

L48_Arm2:
  mov ax, 201
  cmp ax, 118
  call bios_make_bool_from_z
  mov 205, ax
  mov ax, 205
  mov ax, [ax]
  cmp ax, #1
  bz L44_Arm1
  mov ax, 205
  mov ax, [ax]
  cmp ax, #0
  bz L47_Arm2
  crash

L49_Arm2:
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
  push #L42_Cont
  mov cx, sp
  mov ax, 204
  mov ax, [ax]
  cmp ax, #1
  bz L43_Arm1
  mov ax, 204
  mov ax, [ax]
  cmp ax, #0
  bz L48_Arm2
  crash

L50_TopLam_g15:
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L41_Arm1
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L49_Arm2
  crash

L51_Cont:
  ;; (72'28) Tail: app_72'25 (arg) @ acc (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L52_Arm1:
  mov ax, 126
  call bios_put_char
  mov 204, ax
  push dx
  push cx
  push #L51_Cont
  mov cx, sp
  ;; (72'25) Tail: revloop (g9) @ con_72'25 (g27)
  mov bp, 109
  mov dx, 127
  mov ax, [bp]
  jmp [ax]

L53_Cont:
  push [bp+2]
  push 137
  push #1
  mov 201, sp
  ;; (72'28) Tail: app_72'25 (arg) @ con_0'0 (t1)
  mov bp, dx
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L54_Cont:
  mov ax, 135
  call bios_put_char
  mov 201, ax
  push [bp+2]
  push cx
  push #L53_Cont
  mov cx, sp
  ;; (72'25) Tail: revloop (g9) @ con_72'25 (g36)
  mov bp, 109
  mov dx, 136
  mov ax, [bp]
  jmp [ax]

L55_Arm1:
  mov ax, 201
  call bios_put_char
  mov 207, ax
  ;; (0'0) Return: prim_0'0 (t7)
  mov dx, 207
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L56_Arm1:
  mov ax, 201
  call bios_put_char
  mov 208, ax
  ;; (0'0) Return: prim_0'0 (t8)
  mov dx, 208
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L57_Arm1:
  mov ax, 201
  call bios_put_char
  mov 209, ax
  ;; (0'0) Return: prim_0'0 (t9)
  mov dx, 209
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L58_Arm2:
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

L59_Arm2:
  mov ax, 131
  cmp ax, 205
  call bios_make_bool_from_n
  mov 208, ax
  mov ax, 208
  mov ax, [ax]
  cmp ax, #1
  bz L57_Arm1
  mov ax, 208
  mov ax, [ax]
  cmp ax, #0
  bz L58_Arm2
  crash

L60_Arm2:
  mov ax, 201
  cmp ax, 130
  call bios_make_bool_from_z
  mov 207, ax
  mov ax, 207
  mov ax, [ax]
  cmp ax, #1
  bz L56_Arm1
  mov ax, 207
  mov ax, [ax]
  cmp ax, #0
  bz L59_Arm2
  crash

L61_Arm1:
  mov ax, 201
  call bios_char_to_num
  mov 205, ax
  mov ax, 205
  cmp ax, 129
  call bios_make_bool_from_z
  mov 206, ax
  push dx
  push cx
  push #L54_Cont
  mov cx, sp
  mov ax, 206
  mov ax, [ax]
  cmp ax, #1
  bz L55_Arm1
  mov ax, 206
  mov ax, [ax]
  cmp ax, #0
  bz L60_Arm2
  crash

L62_Arm1:
  ;; (110'31) Tail: readloop (g23) @ acc (arg)
  mov bp, 123
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L63_Arm1:
  ;; (113'27) Tail: readloop (g23) @ acc (arg)
  mov bp, 123
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L64_Cont:
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

L65_Arm1:
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

L66_Arm2:
  ;; (0'0) Return: con_115'53 (g46)
  mov dx, 146
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L67_Cont:
  push [bp+2]
  push cx
  push #L64_Cont
  mov cx, sp
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L65_Arm1
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L66_Arm2
  crash

L68_Arm1:
  ;; (0'0) Return: con_8'12 (g41)
  mov dx, 141
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L69_Arm2:
  ;; (0'0) Return: con_9'13 (g42)
  mov dx, 142
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L70_Arm2:
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
  push #L67_Cont
  mov cx, sp
  mov ax, 210
  mov ax, [ax]
  cmp ax, #1
  bz L68_Arm1
  mov ax, 210
  mov ax, [ax]
  cmp ax, #0
  bz L69_Arm2
  crash

L71_Arm1:
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L63_Arm1
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L70_Arm2
  crash

L72_Cont:
  push [bp+2]
  push [bp+3]
  push #1
  mov 201, sp
  ;; (119'32) Tail: readloop (g23) @ con_0'0 (t1)
  mov bp, 123
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L73_Arm1:
  mov ax, 201
  call bios_put_char
  mov 209, ax
  ;; (0'0) Return: prim_0'0 (t9)
  mov dx, 209
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L74_Arm1:
  mov ax, 201
  call bios_put_char
  mov 210, ax
  ;; (0'0) Return: prim_0'0 (t10)
  mov dx, 210
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L75_Arm1:
  mov ax, 201
  call bios_put_char
  mov 211, ax
  ;; (0'0) Return: prim_0'0 (t11)
  mov dx, 211
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L76_Arm2:
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

L77_Arm2:
  mov ax, 152
  cmp ax, 207
  call bios_make_bool_from_n
  mov 210, ax
  mov ax, 210
  mov ax, [ax]
  cmp ax, #1
  bz L75_Arm1
  mov ax, 210
  mov ax, [ax]
  cmp ax, #0
  bz L76_Arm2
  crash

L78_Arm2:
  mov ax, 201
  cmp ax, 151
  call bios_make_bool_from_z
  mov 209, ax
  mov ax, 209
  mov ax, [ax]
  cmp ax, #1
  bz L74_Arm1
  mov ax, 209
  mov ax, [ax]
  cmp ax, #0
  bz L77_Arm2
  crash

L79_Arm2:
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
  push #L72_Cont
  mov cx, sp
  mov ax, 208
  mov ax, [ax]
  cmp ax, #1
  bz L73_Arm1
  mov ax, 208
  mov ax, [ax]
  cmp ax, #0
  bz L78_Arm2
  crash

L80_Arm2:
  mov ax, 202
  cmp ax, 139
  call bios_make_bool_from_z
  mov 206, ax
  mov ax, 206
  mov ax, [ax]
  cmp ax, #1
  bz L71_Arm1
  mov ax, 206
  mov ax, [ax]
  cmp ax, #0
  bz L79_Arm2
  crash

L81_Arm2:
  mov ax, 138
  cmp ax, 202
  call bios_make_bool_from_n
  mov 205, ax
  mov ax, 205
  mov ax, [ax]
  cmp ax, #1
  bz L62_Arm1
  mov ax, 205
  mov ax, [ax]
  cmp ax, #0
  bz L80_Arm2
  crash

L82_Arm2:
  mov ax, 201
  cmp ax, 128
  call bios_make_bool_from_z
  mov 204, ax
  mov ax, 204
  mov ax, [ax]
  cmp ax, #1
  bz L61_Arm1
  mov ax, 204
  mov ax, [ax]
  cmp ax, #0
  bz L81_Arm2
  crash

L83_TopLam_g23:
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
  bz L52_Arm1
  mov ax, 203
  mov ax, [ax]
  cmp ax, #0
  bz L82_Arm2
  crash

L84_Arm1:
  ;; (123'12) Return: n (arg)
  mov dx, dx
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L85_Cont:
  mov ax, [bp+2]
  add ax, dx
  mov 201, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L86_Cont:
  mov ax, [bp+2]
  sub ax, 159
  mov 201, ax
  push dx
  push cx
  push #L85_Cont
  mov cx, sp
  ;; (125'39) Tail: fib (g56) @ prim_0'0 (t1)
  mov bp, 156
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L87_Arm2:
  mov ax, dx
  sub ax, 158
  mov 202, ax
  push dx
  push cx
  push #L86_Cont
  mov cx, sp
  ;; (125'27) Tail: fib (g56) @ prim_0'0 (t2)
  mov bp, 156
  mov dx, 202
  mov ax, [bp]
  jmp [ax]

L88_TopLam_g56:
  mov ax, dx
  cmp ax, 157
  call bios_make_bool_from_n
  mov 201, ax
  mov ax, 201
  mov ax, [ax]
  cmp ax, #1
  bz L84_Arm1
  mov ax, 201
  mov ax, [ax]
  cmp ax, #0
  bz L87_Arm2
  crash

L89_Cont:
  mov ax, dx
  mul ax, [bp+2]
  mov 201, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L90_Arm1:
  mov ax, [bp+2]
  sub ax, 164
  mov 201, ax
  push [bp+2]
  push cx
  push #L89_Cont
  mov cx, sp
  ;; (129'22) Tail: fact (g60) @ prim_0'0 (t1)
  mov bp, 160
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L91_Arm2:
  ;; (0'0) Return: lit_129'37 (g65)
  mov dx, 165
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L92_Cont:
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L90_Arm1
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L91_Arm2
  crash

L93_Arm1:
  ;; (0'0) Return: con_8'12 (g62)
  mov dx, 162
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L94_Arm2:
  ;; (0'0) Return: con_9'13 (g63)
  mov dx, 163
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L95_TopLam_g60:
  mov ax, dx
  cmp ax, 161
  call bios_make_bool_from_n
  mov 201, ax
  push dx
  push cx
  push #L92_Cont
  mov cx, sp
  mov ax, 201
  mov ax, [ax]
  cmp ax, #1
  bz L93_Arm1
  mov ax, 201
  mov ax, [ax]
  cmp ax, #0
  bz L94_Arm2
  crash

L96_Cont:
  push [bp+2]
  push [bp+3]
  push #1
  mov 201, sp
  ;; (72'28) Tail: app_72'25 (arg) @ con_0'0 (t1)
  mov bp, dx
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L97_Cont:
  push dx
  push [bp+2]
  push cx
  push #L96_Cont
  mov cx, sp
  ;; (72'25) Tail: revloop (g9) @ con_72'25 (g68)
  mov bp, 109
  mov dx, 168
  mov ax, [bp]
  jmp [ax]

L98_Cont:
  push [bp+2]
  push cx
  push #L97_Cont
  mov cx, sp
  ;; (72'28) Tail: app_72'25 (arg) @ accCs (f3)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+3]
  mov ax, [bp]
  jmp [ax]

L99_Arm1:
  push [bp+2]
  push [bp+1]
  push cx
  push #L98_Cont
  mov cx, sp
  ;; (72'25) Tail: revloop (g9) @ con_72'25 (g67)
  mov bp, 109
  mov dx, 167
  mov ax, [bp]
  jmp [ax]

L100_Cont:
  ;; (199'65) Tail: app_199'62 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L101_Cont:
  push [bp+2]
  push cx
  push #L100_Cont
  mov cx, sp
  ;; (199'62) Tail: app_199'37 (arg) @ con_199'62 (g71)
  mov bp, dx
  mov dx, 171
  mov ax, [bp]
  jmp [ax]

L102_Cont:
  push [bp+2]
  push dx
  push #1
  mov 201, sp
  push [bp+3]
  push cx
  push #L101_Cont
  mov cx, sp
  ;; (199'37) Tail: splitloop (g66) @ con_0'0 (t1)
  mov bp, 166
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L103_Cont:
  push [bp+4]
  push [bp+2]
  push cx
  push #L102_Cont
  mov cx, sp
  ;; (72'28) Tail: app_72'25 (arg) @ accCs (f3)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+3]
  mov ax, [bp]
  jmp [ax]

L104_Arm1:
  push 202
  push [bp+2]
  push [bp+1]
  push cx
  push #L103_Cont
  mov cx, sp
  ;; (72'25) Tail: revloop (g9) @ con_72'25 (g70)
  mov bp, 109
  mov dx, 170
  mov ax, [bp]
  jmp [ax]

L105_Cont:
  ;; (200'37) Tail: app_200'26 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L106_Cont:
  push [bp+2]
  push [bp+3]
  push #1
  mov 201, sp
  push [bp+4]
  push cx
  push #L105_Cont
  mov cx, sp
  ;; (200'26) Tail: app_200'20 (arg) @ con_0'0 (t1)
  mov bp, dx
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L107_Arm2:
  push 202
  push 201
  push [bp+2]
  push cx
  push #L106_Cont
  mov cx, sp
  ;; (200'20) Tail: splitloop (g66) @ accWs (f1)
  mov dx, [bp+1]
  mov bp, 166
  mov ax, [bp]
  jmp [ax]

L108_Arm2:
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
  bz L104_Arm1
  mov ax, 203
  mov ax, [ax]
  cmp ax, #0
  bz L107_Arm2
  crash

L109_Func_t1:
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L99_Arm1
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L108_Arm2
  crash

L110_Func_t1:
  push dx
  push [bp+1]
  push #L109_Func_t1
  mov 201, sp
  ;; (0'0) Return: lam_194'30 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L111_TopLam_g66:
  push dx
  push #L110_Func_t1
  mov 201, sp
  ;; (0'0) Return: lam_194'24 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L112_Func_t1:
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

L113_TopLam_g78:
  push dx
  push #L112_Func_t1
  mov 201, sp
  ;; (0'0) Return: lam_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L114_Func_t1:
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

L115_TopLam_g87:
  push dx
  push #L114_Func_t1
  mov 201, sp
  ;; (0'0) Return: lam_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L116_Arm1:
  push [bp+1]
  push #0
  mov 201, sp
  ;; (0'0) Return: con_41'12 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L117_Arm1:
  ;; (0'0) Return: con_44'18 (g105)
  mov dx, 205
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L118_Cont:
  ;; (45'40) Tail: app_45'25 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L119_Arm2:
  mov ax, dx
  mov ax, [ax+1]
  mov 201, ax
  mov ax, 206
  mul ax, [bp+2]
  mov 202, ax
  mov ax, 202
  add ax, 201
  mov 203, ax
  push [bp+3]
  push cx
  push #L118_Cont
  mov cx, sp
  ;; (45'25) Tail: loop (g95) @ prim_0'0 (t3)
  mov bp, 195
  mov dx, 203
  mov ax, [bp]
  jmp [ax]

L120_Cont:
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L117_Arm1
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L119_Arm2
  crash

L121_Arm1:
  push [bp+2]
  push #0
  mov 201, sp
  ;; (0'0) Return: con_36'32 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L122_Arm2:
  ;; (0'0) Return: con_36'45 (g103)
  mov dx, 203
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L123_Cont:
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L121_Arm1
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L122_Arm2
  crash

L124_Arm1:
  ;; (0'0) Return: con_8'12 (g101)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L125_Arm2:
  ;; (0'0) Return: con_9'13 (g102)
  mov dx, 202
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L126_Arm1:
  mov ax, 200
  cmp ax, [bp+4]
  call bios_make_bool_from_n
  mov 201, ax
  push [bp+4]
  push cx
  push #L123_Cont
  mov cx, sp
  mov ax, 201
  mov ax, [ax]
  cmp ax, #1
  bz L124_Arm1
  mov ax, 201
  mov ax, [ax]
  cmp ax, #0
  bz L125_Arm2
  crash

L127_Arm2:
  ;; (0'0) Return: con_36'55 (g104)
  mov dx, 204
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L128_Cont:
  push [bp+3]
  push [bp+2]
  push cx
  push #L120_Cont
  mov cx, sp
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L126_Arm1
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L127_Arm2
  crash

L129_Arm1:
  ;; (0'0) Return: con_8'12 (g98)
  mov dx, 198
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L130_Arm2:
  ;; (0'0) Return: con_9'13 (g99)
  mov dx, 199
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L131_Arm2:
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
  push #L128_Cont
  mov cx, sp
  mov ax, 205
  mov ax, [ax]
  cmp ax, #1
  bz L129_Arm1
  mov ax, 205
  mov ax, [ax]
  cmp ax, #0
  bz L130_Arm2
  crash

L132_Func_t1:
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L116_Arm1
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L131_Arm2
  crash

L133_TopLam_g95:
  push dx
  push #L132_Func_t1
  mov 201, sp
  ;; (0'0) Return: lam_39'19 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L134_Arm1:
  ;; (87'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L135_Cont:
  mov ax, [bp+2]
  div ax, 215
  mov 201, ax
  ;; (89'45) Tail: app_89'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L136_Arm2:
  mov ax, dx
  mod ax, 213
  mov 202, ax
  mov ax, 214
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
  push #L135_Cont
  mov cx, sp
  ;; (89'11) Tail: loop (g111) @ con_0'0 (t5)
  mov bp, 211
  mov dx, 205
  mov ax, [bp]
  jmp [ax]

L137_Func_t1:
  mov ax, dx
  cmp ax, 212
  call bios_make_bool_from_z
  mov 201, ax
  mov ax, 201
  mov ax, [ax]
  cmp ax, #1
  bz L134_Arm1
  mov ax, 201
  mov ax, [ax]
  cmp ax, #0
  bz L136_Arm2
  crash

L138_TopLam_g111:
  push dx
  push #L137_Func_t1
  mov 201, sp
  ;; (0'0) Return: lam_87'19 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L139_Arm1:
  ;; (87'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L140_Cont:
  mov ax, [bp+2]
  div ax, 226
  mov 201, ax
  ;; (89'45) Tail: app_89'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L141_Arm2:
  mov ax, dx
  mod ax, 224
  mov 202, ax
  mov ax, 225
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
  push #L140_Cont
  mov cx, sp
  ;; (89'11) Tail: loop (g122) @ con_0'0 (t5)
  mov bp, 222
  mov dx, 205
  mov ax, [bp]
  jmp [ax]

L142_Func_t1:
  mov ax, dx
  cmp ax, 223
  call bios_make_bool_from_z
  mov 201, ax
  mov ax, 201
  mov ax, [ax]
  cmp ax, #1
  bz L139_Arm1
  mov ax, 201
  mov ax, [ax]
  cmp ax, #0
  bz L141_Arm2
  crash

L143_TopLam_g122:
  push dx
  push #L142_Func_t1
  mov 201, sp
  ;; (0'0) Return: lam_87'19 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L144_Func_t1:
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

L145_TopLam_g134:
  push dx
  push #L144_Func_t1
  mov 201, sp
  ;; (0'0) Return: lam_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L146_Arm1:
  push [bp+1]
  push #0
  mov 201, sp
  ;; (0'0) Return: con_41'12 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L147_Arm1:
  ;; (0'0) Return: con_44'18 (g152)
  mov dx, 252
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L148_Cont:
  ;; (45'40) Tail: app_45'25 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L149_Arm2:
  mov ax, dx
  mov ax, [ax+1]
  mov 201, ax
  mov ax, 253
  mul ax, [bp+2]
  mov 202, ax
  mov ax, 202
  add ax, 201
  mov 203, ax
  push [bp+3]
  push cx
  push #L148_Cont
  mov cx, sp
  ;; (45'25) Tail: loop (g142) @ prim_0'0 (t3)
  mov bp, 242
  mov dx, 203
  mov ax, [bp]
  jmp [ax]

L150_Cont:
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L147_Arm1
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L149_Arm2
  crash

L151_Arm1:
  push [bp+2]
  push #0
  mov 201, sp
  ;; (0'0) Return: con_36'32 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L152_Arm2:
  ;; (0'0) Return: con_36'45 (g150)
  mov dx, 250
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L153_Cont:
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L151_Arm1
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L152_Arm2
  crash

L154_Arm1:
  ;; (0'0) Return: con_8'12 (g148)
  mov dx, 248
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L155_Arm2:
  ;; (0'0) Return: con_9'13 (g149)
  mov dx, 249
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L156_Arm1:
  mov ax, 247
  cmp ax, [bp+4]
  call bios_make_bool_from_n
  mov 201, ax
  push [bp+4]
  push cx
  push #L153_Cont
  mov cx, sp
  mov ax, 201
  mov ax, [ax]
  cmp ax, #1
  bz L154_Arm1
  mov ax, 201
  mov ax, [ax]
  cmp ax, #0
  bz L155_Arm2
  crash

L157_Arm2:
  ;; (0'0) Return: con_36'55 (g151)
  mov dx, 251
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L158_Cont:
  push [bp+3]
  push [bp+2]
  push cx
  push #L150_Cont
  mov cx, sp
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L156_Arm1
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L157_Arm2
  crash

L159_Arm1:
  ;; (0'0) Return: con_8'12 (g145)
  mov dx, 245
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L160_Arm2:
  ;; (0'0) Return: con_9'13 (g146)
  mov dx, 246
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L161_Arm2:
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
  sub ax, 243
  mov 204, ax
  mov ax, 204
  cmp ax, 244
  call bios_make_bool_from_n
  mov 205, ax
  push 204
  push 202
  push [bp+1]
  push cx
  push #L158_Cont
  mov cx, sp
  mov ax, 205
  mov ax, [ax]
  cmp ax, #1
  bz L159_Arm1
  mov ax, 205
  mov ax, [ax]
  cmp ax, #0
  bz L160_Arm2
  crash

L162_Func_t1:
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L146_Arm1
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L161_Arm2
  crash

L163_TopLam_g142:
  push dx
  push #L162_Func_t1
  mov 201, sp
  ;; (0'0) Return: lam_39'19 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L164_Arm1:
  ;; (87'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L165_Cont:
  mov ax, [bp+2]
  div ax, 262
  mov 201, ax
  ;; (89'45) Tail: app_89'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L166_Arm2:
  mov ax, dx
  mod ax, 260
  mov 202, ax
  mov ax, 261
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
  push #L165_Cont
  mov cx, sp
  ;; (89'11) Tail: loop (g158) @ con_0'0 (t5)
  mov bp, 258
  mov dx, 205
  mov ax, [bp]
  jmp [ax]

L167_Func_t1:
  mov ax, dx
  cmp ax, 259
  call bios_make_bool_from_z
  mov 201, ax
  mov ax, 201
  mov ax, [ax]
  cmp ax, #1
  bz L164_Arm1
  mov ax, 201
  mov ax, [ax]
  cmp ax, #0
  bz L166_Arm2
  crash

L168_TopLam_g158:
  push dx
  push #L167_Func_t1
  mov 201, sp
  ;; (0'0) Return: lam_87'19 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L169_Arm1:
  ;; (87'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L170_Cont:
  mov ax, [bp+2]
  div ax, 273
  mov 201, ax
  ;; (89'45) Tail: app_89'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L171_Arm2:
  mov ax, dx
  mod ax, 271
  mov 202, ax
  mov ax, 272
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
  push #L170_Cont
  mov cx, sp
  ;; (89'11) Tail: loop (g169) @ con_0'0 (t5)
  mov bp, 269
  mov dx, 205
  mov ax, [bp]
  jmp [ax]

L172_Func_t1:
  mov ax, dx
  cmp ax, 270
  call bios_make_bool_from_z
  mov 201, ax
  mov ax, 201
  mov ax, [ax]
  cmp ax, #1
  bz L169_Arm1
  mov ax, 201
  mov ax, [ax]
  cmp ax, #0
  bz L171_Arm2
  crash

L173_TopLam_g169:
  push dx
  push #L172_Func_t1
  mov 201, sp
  ;; (0'0) Return: lam_87'19 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L174_Func_t1:
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

L175_TopLam_g181:
  push dx
  push #L174_Func_t1
  mov 201, sp
  ;; (0'0) Return: lam_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L176_Func_t1:
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

L177_TopLam_g188:
  push dx
  push #L176_Func_t1
  mov 201, sp
  ;; (0'0) Return: lam_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L178_Arm1:
  ;; (0'0) Return: con_173'44 (g192)
  mov dx, 292
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L179_Cont:
  mov ax, 294
  call bios_put_char
  mov 201, ax
  ;; (174'46) Tail: loop (g186) @ con_174'46 (g195)
  mov bp, 286
  mov dx, 295
  mov ax, [bp]
  jmp [ax]

L180_Cont:
  push cx
  push #L179_Cont
  mov cx, sp
  ;; (174'17) Tail: put_chars (g15) @ app_72'28 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L181_Cont:
  push cx
  push #L180_Cont
  mov cx, sp
  ;; (72'28) Tail: app_72'25 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L182_Arm2:
  push [bp+2]
  push cx
  push #L181_Cont
  mov cx, sp
  ;; (72'25) Tail: revloop (g9) @ con_72'25 (g193)
  mov bp, 109
  mov dx, 293
  mov ax, [bp]
  jmp [ax]

L183_Cont:
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L178_Arm1
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L182_Arm2
  crash

L184_Cont:
  push [bp+2]
  push cx
  push #L183_Cont
  mov cx, sp
  ;; (60'44) Tail: app_60'41 (arg) @ con_0'0 (g191)
  mov bp, dx
  mov dx, 291
  mov ax, [bp]
  jmp [ax]

L185_Cont:
  push [bp+2]
  push cx
  push #L184_Cont
  mov cx, sp
  ;; (60'41) Tail: app_60'33 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L186_Cont:
  push dx
  push cx
  push #L185_Cont
  mov cx, sp
  ;; (60'33) Tail: eq_list (g3) @ lam_0'0 (g188)
  mov bp, 103
  mov dx, 288
  mov ax, [bp]
  jmp [ax]

L187_TopLam_g186:
  push cx
  push #L186_Cont
  mov cx, sp
  ;; (121'28) Tail: readloop (g23) @ con_121'28 (g187)
  mov bp, 123
  mov dx, 287
  mov ax, [bp]
  jmp [ax]

L188_Arm1:
  ;; (0'0) Return: lit_186'57 (g198)
  mov dx, 298
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L189_Arm2:
  ;; (186'30) Return: c (arg)
  mov dx, dx
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L190_TopLam_g199:
  mov ax, dx
  cmp ax, 297
  call bios_make_bool_from_z
  mov 201, ax
  mov ax, 201
  mov ax, [ax]
  cmp ax, #1
  bz L188_Arm1
  mov ax, 201
  mov ax, [ax]
  cmp ax, #0
  bz L189_Arm2
  crash

L191_Arm1:
  ;; (87'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L192_Cont:
  mov ax, [bp+2]
  div ax, 306
  mov 201, ax
  ;; (89'45) Tail: app_89'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L193_Arm2:
  mov ax, dx
  mod ax, 304
  mov 202, ax
  mov ax, 305
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
  push #L192_Cont
  mov cx, sp
  ;; (89'11) Tail: loop (g202) @ con_0'0 (t5)
  mov bp, 302
  mov dx, 205
  mov ax, [bp]
  jmp [ax]

L194_Func_t1:
  mov ax, dx
  cmp ax, 303
  call bios_make_bool_from_z
  mov 201, ax
  mov ax, 201
  mov ax, [ax]
  cmp ax, #1
  bz L191_Arm1
  mov ax, 201
  mov ax, [ax]
  cmp ax, #0
  bz L193_Arm2
  crash

L195_TopLam_g202:
  push dx
  push #L194_Func_t1
  mov 201, sp
  ;; (0'0) Return: lam_87'19 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L196_Arm1:
  ;; (0'0) Return: con_218'42 (g82)
  mov dx, 182
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L197_Cont:
  ;; (219'26) Tail: mainloop (f2) @ con_219'26 (g214)
  mov bp, [bp+2]
  mov dx, 314
  mov ax, [bp]
  jmp [ax]

L198_Arm1:
  ;; (0'0) Return: con_208'10 (g85)
  mov dx, 185
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L199_Cont:
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L200_Func_t1:
  push cx
  push #L199_Cont
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L201_Cont:
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L202_Func_t1:
  push cx
  push #L201_Cont
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L203_Cont:
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L204_Func_t1:
  push cx
  push #L203_Cont
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L205_Cont:
  mov ax, 191
  call bios_put_char
  mov 201, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L206_Cont:
  push cx
  push #L205_Cont
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_136'16 (g90)
  mov bp, dx
  mov dx, 190
  mov ax, [bp]
  jmp [ax]

L207_Cont:
  push [bp+2]
  push #L204_Func_t1
  mov 201, sp
  push cx
  push #L206_Cont
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L208_Cont:
  push [bp+2]
  push cx
  push #L207_Cont
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_131'25 (g89)
  mov bp, dx
  mov dx, 189
  mov ax, [bp]
  jmp [ax]

L209_Arm1:
  push [bp+2]
  push #L202_Func_t1
  mov 201, sp
  push [bp+2]
  push cx
  push #L208_Cont
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L210_Cont:
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L211_Func_t5:
  push cx
  push #L210_Cont
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L212_Cont:
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L213_Func_t1:
  push cx
  push #L212_Cont
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L214_Cont:
  mov ax, 194
  call bios_put_char
  mov 201, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L215_Cont:
  push cx
  push #L214_Cont
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_139'21 (g93)
  mov bp, dx
  mov dx, 193
  mov ax, [bp]
  jmp [ax]

L216_Cont:
  push [bp+2]
  push #L213_Func_t1
  mov 201, sp
  push cx
  push #L215_Cont
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L217_Cont:
  push [bp+2]
  push cx
  push #L216_Cont
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_131'25 (g92)
  mov bp, dx
  mov dx, 192
  mov ax, [bp]
  jmp [ax]

L218_Arm1:
  mov ax, 202
  mov ax, [ax+1]
  mov 203, ax
  mov ax, 202
  mov ax, [ax+2]
  mov 204, ax
  push [bp+2]
  push #L211_Func_t5
  mov 205, sp
  push [bp+2]
  push cx
  push #L217_Cont
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t5)
  mov bp, 101
  mov dx, 205
  mov ax, [bp]
  jmp [ax]

L219_Cont:
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L220_Func_t1:
  push cx
  push #L219_Cont
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L221_Cont:
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L222_Func_t1:
  push cx
  push #L221_Cont
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L223_Cont:
  mov ax, 210
  call bios_put_char
  mov 201, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L224_Cont:
  push cx
  push #L223_Cont
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_142'24 (g109)
  mov bp, dx
  mov dx, 209
  mov ax, [bp]
  jmp [ax]

L225_Cont:
  push [bp+2]
  push #L222_Func_t1
  mov 201, sp
  push cx
  push #L224_Cont
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L226_Cont:
  push [bp+2]
  push cx
  push #L225_Cont
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_131'25 (g108)
  mov bp, dx
  mov dx, 208
  mov ax, [bp]
  jmp [ax]

L227_Arm1:
  push [bp+2]
  push #L220_Func_t1
  mov 201, sp
  push [bp+2]
  push cx
  push #L226_Cont
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L228_Cont:
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L229_Func_t1:
  push cx
  push #L228_Cont
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L230_Cont:
  mov ax, 232
  call bios_put_char
  mov 201, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L231_Cont:
  push cx
  push #L230_Cont
  mov cx, sp
  ;; (100'26) Tail: put_chars (g15) @ case_91'2 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L232_Arm1:
  ;; (0'0) Return: con_0'0 (g130)
  mov dx, 230
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L233_Cont:
  ;; (91'41) Tail: app_91'38 (arg) @ res (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L234_Arm2:
  push [bp+2]
  push cx
  push #L233_Cont
  mov cx, sp
  ;; (91'38) Tail: loop (g122) @ con_91'38 (g131)
  mov bp, 222
  mov dx, 231
  mov ax, [bp]
  jmp [ax]

L235_Cont:
  mov ax, [bp+2]
  cmp ax, 227
  call bios_make_bool_from_z
  mov 201, ax
  push cx
  push #L231_Cont
  mov cx, sp
  mov ax, 201
  mov ax, [ax]
  cmp ax, #1
  bz L232_Arm1
  mov ax, 201
  mov ax, [ax]
  cmp ax, #0
  bz L234_Arm2
  crash

L236_Cont:
  push [bp+2]
  push cx
  push #L235_Cont
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_146'22 (g121)
  mov bp, dx
  mov dx, 221
  mov ax, [bp]
  jmp [ax]

L237_Cont:
  push [bp+2]
  push #L229_Func_t1
  mov 201, sp
  push [bp+3]
  push cx
  push #L236_Cont
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L238_Cont:
  push [bp+3]
  push [bp+2]
  push cx
  push #L237_Cont
  mov cx, sp
  ;; (100'26) Tail: put_chars (g15) @ case_91'2 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L239_Arm1:
  ;; (0'0) Return: con_0'0 (g119)
  mov dx, 219
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L240_Cont:
  ;; (91'41) Tail: app_91'38 (arg) @ n (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L241_Arm2:
  push [bp+3]
  push cx
  push #L240_Cont
  mov cx, sp
  ;; (91'38) Tail: loop (g111) @ con_91'38 (g120)
  mov bp, 211
  mov dx, 220
  mov ax, [bp]
  jmp [ax]

L242_Cont:
  mov ax, [bp+3]
  cmp ax, 216
  call bios_make_bool_from_z
  mov 201, ax
  push dx
  push [bp+2]
  push cx
  push #L238_Cont
  mov cx, sp
  mov ax, 201
  mov ax, [ax]
  cmp ax, #1
  bz L239_Arm1
  mov ax, 201
  mov ax, [ax]
  cmp ax, #0
  bz L241_Arm2
  crash

L243_Arm2:
  mov ax, dx
  mov ax, [ax+1]
  mov 201, ax
  push 201
  push [bp+2]
  push cx
  push #L242_Cont
  mov cx, sp
  ;; (144'25) Tail: fib (g56) @ n (t1)
  mov bp, 156
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L244_Cont:
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L227_Arm1
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L243_Arm2
  crash

L245_Cont:
  push [bp+2]
  push cx
  push #L244_Cont
  mov cx, sp
  ;; (47'9) Tail: app_47'7 (arg) @ arg1 (f3)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+3]
  mov ax, [bp]
  jmp [ax]

L246_Arm2:
  push 201
  push [bp+2]
  push cx
  push #L245_Cont
  mov cx, sp
  ;; (47'7) Tail: loop (g95) @ lit_47'7 (g107)
  mov bp, 195
  mov dx, 207
  mov ax, [bp]
  jmp [ax]

L247_Arm2:
  mov ax, [bp+3]
  mov ax, [ax+1]
  mov 201, ax
  mov ax, [bp+3]
  mov ax, [ax+2]
  mov 202, ax
  mov ax, 202
  mov ax, [ax]
  cmp ax, #1
  bz L218_Arm1
  mov ax, 202
  mov ax, [ax]
  cmp ax, #0
  bz L246_Arm2
  crash

L248_Cont:
  mov ax, [bp+3]
  mov ax, [ax]
  cmp ax, #0
  bz L209_Arm1
  mov ax, [bp+3]
  mov ax, [ax]
  cmp ax, #1
  bz L247_Arm2
  crash

L249_Cont:
  push [bp+3]
  push [bp+2]
  push cx
  push #L248_Cont
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_134'13 (g88)
  mov bp, dx
  mov dx, 188
  mov ax, [bp]
  jmp [ax]

L250_Arm1:
  push [bp+2]
  push #L200_Func_t1
  mov 201, sp
  push [bp+5]
  push [bp+2]
  push cx
  push #L249_Cont
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L251_Cont:
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L252_Func_t1:
  push cx
  push #L251_Cont
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L253_Cont:
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L254_Func_t1:
  push cx
  push #L253_Cont
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L255_Cont:
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L256_Func_t1:
  push cx
  push #L255_Cont
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L257_Cont:
  mov ax, 238
  call bios_put_char
  mov 201, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L258_Cont:
  push cx
  push #L257_Cont
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_153'16 (g137)
  mov bp, dx
  mov dx, 237
  mov ax, [bp]
  jmp [ax]

L259_Cont:
  push [bp+2]
  push #L256_Func_t1
  mov 201, sp
  push cx
  push #L258_Cont
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L260_Cont:
  push [bp+2]
  push cx
  push #L259_Cont
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_131'25 (g136)
  mov bp, dx
  mov dx, 236
  mov ax, [bp]
  jmp [ax]

L261_Arm1:
  push [bp+2]
  push #L254_Func_t1
  mov 201, sp
  push [bp+2]
  push cx
  push #L260_Cont
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L262_Cont:
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L263_Func_t5:
  push cx
  push #L262_Cont
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L264_Cont:
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L265_Func_t1:
  push cx
  push #L264_Cont
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L266_Cont:
  mov ax, 241
  call bios_put_char
  mov 201, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L267_Cont:
  push cx
  push #L266_Cont
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_156'21 (g140)
  mov bp, dx
  mov dx, 240
  mov ax, [bp]
  jmp [ax]

L268_Cont:
  push [bp+2]
  push #L265_Func_t1
  mov 201, sp
  push cx
  push #L267_Cont
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L269_Cont:
  push [bp+2]
  push cx
  push #L268_Cont
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_131'25 (g139)
  mov bp, dx
  mov dx, 239
  mov ax, [bp]
  jmp [ax]

L270_Arm1:
  mov ax, 202
  mov ax, [ax+1]
  mov 203, ax
  mov ax, 202
  mov ax, [ax+2]
  mov 204, ax
  push [bp+2]
  push #L263_Func_t5
  mov 205, sp
  push [bp+2]
  push cx
  push #L269_Cont
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t5)
  mov bp, 101
  mov dx, 205
  mov ax, [bp]
  jmp [ax]

L271_Cont:
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L272_Func_t1:
  push cx
  push #L271_Cont
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L273_Cont:
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L274_Func_t1:
  push cx
  push #L273_Cont
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L275_Cont:
  mov ax, 257
  call bios_put_char
  mov 201, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L276_Cont:
  push cx
  push #L275_Cont
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_159'24 (g156)
  mov bp, dx
  mov dx, 256
  mov ax, [bp]
  jmp [ax]

L277_Cont:
  push [bp+2]
  push #L274_Func_t1
  mov 201, sp
  push cx
  push #L276_Cont
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L278_Cont:
  push [bp+2]
  push cx
  push #L277_Cont
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_131'25 (g155)
  mov bp, dx
  mov dx, 255
  mov ax, [bp]
  jmp [ax]

L279_Arm1:
  push [bp+2]
  push #L272_Func_t1
  mov 201, sp
  push [bp+2]
  push cx
  push #L278_Cont
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L280_Cont:
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L281_Func_t1:
  push cx
  push #L280_Cont
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L282_Cont:
  mov ax, 279
  call bios_put_char
  mov 201, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L283_Cont:
  push cx
  push #L282_Cont
  mov cx, sp
  ;; (100'26) Tail: put_chars (g15) @ case_91'2 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L284_Arm1:
  ;; (0'0) Return: con_0'0 (g177)
  mov dx, 277
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L285_Cont:
  ;; (91'41) Tail: app_91'38 (arg) @ res (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L286_Arm2:
  push [bp+2]
  push cx
  push #L285_Cont
  mov cx, sp
  ;; (91'38) Tail: loop (g169) @ con_91'38 (g178)
  mov bp, 269
  mov dx, 278
  mov ax, [bp]
  jmp [ax]

L287_Cont:
  mov ax, [bp+2]
  cmp ax, 274
  call bios_make_bool_from_z
  mov 201, ax
  push cx
  push #L283_Cont
  mov cx, sp
  mov ax, 201
  mov ax, [ax]
  cmp ax, #1
  bz L284_Arm1
  mov ax, 201
  mov ax, [ax]
  cmp ax, #0
  bz L286_Arm2
  crash

L288_Cont:
  push [bp+2]
  push cx
  push #L287_Cont
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_163'22 (g168)
  mov bp, dx
  mov dx, 268
  mov ax, [bp]
  jmp [ax]

L289_Cont:
  push [bp+2]
  push #L281_Func_t1
  mov 201, sp
  push [bp+3]
  push cx
  push #L288_Cont
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L290_Cont:
  push [bp+3]
  push [bp+2]
  push cx
  push #L289_Cont
  mov cx, sp
  ;; (100'26) Tail: put_chars (g15) @ case_91'2 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L291_Arm1:
  ;; (0'0) Return: con_0'0 (g166)
  mov dx, 266
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L292_Cont:
  ;; (91'41) Tail: app_91'38 (arg) @ n (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L293_Arm2:
  push [bp+3]
  push cx
  push #L292_Cont
  mov cx, sp
  ;; (91'38) Tail: loop (g158) @ con_91'38 (g167)
  mov bp, 258
  mov dx, 267
  mov ax, [bp]
  jmp [ax]

L294_Cont:
  mov ax, [bp+3]
  cmp ax, 263
  call bios_make_bool_from_z
  mov 201, ax
  push dx
  push [bp+2]
  push cx
  push #L290_Cont
  mov cx, sp
  mov ax, 201
  mov ax, [ax]
  cmp ax, #1
  bz L291_Arm1
  mov ax, 201
  mov ax, [ax]
  cmp ax, #0
  bz L293_Arm2
  crash

L295_Arm2:
  mov ax, dx
  mov ax, [ax+1]
  mov 201, ax
  push 201
  push [bp+2]
  push cx
  push #L294_Cont
  mov cx, sp
  ;; (161'26) Tail: fact (g60) @ n (t1)
  mov bp, 160
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L296_Cont:
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L279_Arm1
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L295_Arm2
  crash

L297_Cont:
  push [bp+2]
  push cx
  push #L296_Cont
  mov cx, sp
  ;; (47'9) Tail: app_47'7 (arg) @ arg1 (f3)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+3]
  mov ax, [bp]
  jmp [ax]

L298_Arm2:
  push 201
  push [bp+2]
  push cx
  push #L297_Cont
  mov cx, sp
  ;; (47'7) Tail: loop (g142) @ lit_47'7 (g154)
  mov bp, 242
  mov dx, 254
  mov ax, [bp]
  jmp [ax]

L299_Arm2:
  mov ax, [bp+3]
  mov ax, [ax+1]
  mov 201, ax
  mov ax, [bp+3]
  mov ax, [ax+2]
  mov 202, ax
  mov ax, 202
  mov ax, [ax]
  cmp ax, #1
  bz L270_Arm1
  mov ax, 202
  mov ax, [ax]
  cmp ax, #0
  bz L298_Arm2
  crash

L300_Cont:
  mov ax, [bp+3]
  mov ax, [ax]
  cmp ax, #0
  bz L261_Arm1
  mov ax, [bp+3]
  mov ax, [ax]
  cmp ax, #1
  bz L299_Arm2
  crash

L301_Cont:
  push [bp+3]
  push [bp+2]
  push cx
  push #L300_Cont
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_151'13 (g135)
  mov bp, dx
  mov dx, 235
  mov ax, [bp]
  jmp [ax]

L302_Arm1:
  push [bp+2]
  push #L252_Func_t1
  mov 201, sp
  push [bp+5]
  push [bp+2]
  push cx
  push #L301_Cont
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L303_Cont:
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L304_Func_t3:
  push cx
  push #L303_Cont
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L305_Cont:
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L306_Func_t1:
  push cx
  push #L305_Cont
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L307_Cont:
  mov ax, 284
  call bios_put_char
  mov 201, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L308_Cont:
  push cx
  push #L307_Cont
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_180'18 (g183)
  mov bp, dx
  mov dx, 283
  mov ax, [bp]
  jmp [ax]

L309_Cont:
  push [bp+2]
  push #L306_Func_t1
  mov 201, sp
  push cx
  push #L308_Cont
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L310_Cont:
  push [bp+2]
  push cx
  push #L309_Cont
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_131'25 (g182)
  mov bp, dx
  mov dx, 282
  mov ax, [bp]
  jmp [ax]

L311_Arm1:
  mov ax, [bp+4]
  mov ax, [ax+1]
  mov 201, ax
  mov ax, [bp+4]
  mov ax, [ax+2]
  mov 202, ax
  push [bp+2]
  push #L304_Func_t3
  mov 203, sp
  push [bp+2]
  push cx
  push #L310_Cont
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t3)
  mov bp, 101
  mov dx, 203
  mov ax, [bp]
  jmp [ax]

L312_Cont:
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L313_Func_t1:
  push cx
  push #L312_Cont
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L314_Cont:
  ;; (176'6) Tail: loop (g186) @ con_176'6 (g196)
  mov bp, 286
  mov dx, 296
  mov ax, [bp]
  jmp [ax]

L315_Cont:
  push cx
  push #L314_Cont
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_182'16 (g185)
  mov bp, dx
  mov dx, 285
  mov ax, [bp]
  jmp [ax]

L316_Arm2:
  push [bp+2]
  push #L313_Func_t1
  mov 201, sp
  push cx
  push #L315_Cont
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L317_Arm1:
  mov ax, [bp+4]
  mov ax, [ax]
  cmp ax, #1
  bz L311_Arm1
  mov ax, [bp+4]
  mov ax, [ax]
  cmp ax, #0
  bz L316_Arm2
  crash

L318_Cont:
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L319_Func_t1:
  push cx
  push #L318_Cont
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L320_Cont:
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L321_Func_t1:
  push cx
  push #L320_Cont
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L322_Cont:
  mov ax, 313
  call bios_put_char
  mov 201, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L323_Cont:
  push cx
  push #L322_Cont
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_191'13 (g212)
  mov bp, dx
  mov dx, 312
  mov ax, [bp]
  jmp [ax]

L324_Cont:
  push [bp+2]
  push #L321_Func_t1
  mov 201, sp
  push cx
  push #L323_Cont
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L325_Cont:
  push [bp+2]
  push cx
  push #L324_Cont
  mov cx, sp
  ;; (100'26) Tail: put_chars (g15) @ case_91'2 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L326_Arm1:
  ;; (0'0) Return: con_0'0 (g210)
  mov dx, 310
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L327_Cont:
  ;; (91'41) Tail: app_91'38 (arg) @ n (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L328_Arm2:
  push [bp+3]
  push cx
  push #L327_Cont
  mov cx, sp
  ;; (91'38) Tail: loop (g202) @ con_91'38 (g211)
  mov bp, 302
  mov dx, 311
  mov ax, [bp]
  jmp [ax]

L329_Cont:
  mov ax, [bp+3]
  cmp ax, 307
  call bios_make_bool_from_z
  mov 201, ax
  push [bp+2]
  push cx
  push #L325_Cont
  mov cx, sp
  mov ax, 201
  mov ax, [ax]
  cmp ax, #1
  bz L326_Arm1
  mov ax, 201
  mov ax, [ax]
  cmp ax, #0
  bz L328_Arm2
  crash

L330_Cont:
  push [bp+3]
  push [bp+2]
  push cx
  push #L329_Cont
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_189'13 (g201)
  mov bp, dx
  mov dx, 301
  mov ax, [bp]
  jmp [ax]

L331_Cont:
  push [bp+2]
  push #L319_Func_t1
  mov 201, sp
  push [bp+3]
  push [bp+2]
  push cx
  push #L330_Cont
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t1)
  mov bp, 101
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L332_Cont:
  push [bp+3]
  push [bp+2]
  push cx
  push #L331_Cont
  mov cx, sp
  ;; (188'12) Tail: put_chars (g15) @ app_188'46 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L333_Cont:
  push [bp+3]
  push [bp+2]
  push cx
  push #L332_Cont
  mov cx, sp
  ;; (188'46) Tail: app_188'20 (f4) @ app_188'60 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L334_Cont:
  push dx
  push [bp+5]
  push [bp+2]
  push cx
  push #L333_Cont
  mov cx, sp
  ;; (188'60) Tail: star_the_ohs (f4) @ xs (f3)
  mov dx, [bp+3]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp [ax]

L335_Cont:
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L334_Cont
  mov cx, sp
  ;; (188'20) Tail: append (g8) @ app_188'29 (arg)
  mov bp, 108
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L336_Cont:
  push dx
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L335_Cont
  mov cx, sp
  ;; (188'29) Tail: explode (f2) @ lit_188'29 (g200)
  mov bp, [bp+2]
  mov dx, 300
  mov ax, [bp]
  jmp [ax]

L337_Cont:
  push dx
  push [bp+3]
  push [bp+2]
  push cx
  push #L336_Cont
  mov cx, sp
  ;; (187'17) Tail: length (g12) @ xs (f3)
  mov dx, [bp+3]
  mov bp, 112
  mov ax, [bp]
  jmp [ax]

L338_Arm2:
  push [bp+3]
  push [bp+2]
  push cx
  push #L337_Cont
  mov cx, sp
  ;; (186'25) Tail: map (g10) @ lam_186'30 (g199)
  mov bp, 110
  mov dx, 299
  mov ax, [bp]
  jmp [ax]

L339_Cont:
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L317_Arm1
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L338_Arm2
  crash

L340_Cont:
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L339_Cont
  mov cx, sp
  ;; (60'44) Tail: app_60'41 (arg) @ ys (f5)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+5]
  mov ax, [bp]
  jmp [ax]

L341_Cont:
  push [bp+6]
  push [bp+5]
  push [bp+3]
  push [bp+2]
  push cx
  push #L340_Cont
  mov cx, sp
  ;; (60'41) Tail: app_60'33 (arg) @ command (f4)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+4]
  mov ax, [bp]
  jmp [ax]

L342_Cont:
  push dx
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L341_Cont
  mov cx, sp
  ;; (60'33) Tail: eq_list (g3) @ lam_0'0 (g181)
  mov bp, 103
  mov dx, 281
  mov ax, [bp]
  jmp [ax]

L343_Arm2:
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L342_Cont
  mov cx, sp
  ;; (212'42) Tail: explode (f2) @ lit_212'42 (g180)
  mov bp, [bp+2]
  mov dx, 280
  mov ax, [bp]
  jmp [ax]

L344_Cont:
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L302_Arm1
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L343_Arm2
  crash

L345_Cont:
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L344_Cont
  mov cx, sp
  ;; (60'44) Tail: app_60'41 (arg) @ ys (f6)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+6]
  mov ax, [bp]
  jmp [ax]

L346_Cont:
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L345_Cont
  mov cx, sp
  ;; (60'41) Tail: app_60'33 (arg) @ command (f4)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+4]
  mov ax, [bp]
  jmp [ax]

L347_Cont:
  push dx
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L346_Cont
  mov cx, sp
  ;; (60'33) Tail: eq_list (g3) @ lam_0'0 (g134)
  mov bp, 103
  mov dx, 234
  mov ax, [bp]
  jmp [ax]

L348_Arm2:
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L347_Cont
  mov cx, sp
  ;; (211'40) Tail: explode (f2) @ lit_211'40 (g133)
  mov bp, [bp+2]
  mov dx, 233
  mov ax, [bp]
  jmp [ax]

L349_Cont:
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L250_Arm1
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L348_Arm2
  crash

L350_Cont:
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L349_Cont
  mov cx, sp
  ;; (60'44) Tail: app_60'41 (arg) @ ys (f6)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+6]
  mov ax, [bp]
  jmp [ax]

L351_Cont:
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L350_Cont
  mov cx, sp
  ;; (60'41) Tail: app_60'33 (arg) @ command (f4)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+4]
  mov ax, [bp]
  jmp [ax]

L352_Cont:
  push dx
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L351_Cont
  mov cx, sp
  ;; (60'33) Tail: eq_list (g3) @ lam_0'0 (g87)
  mov bp, 103
  mov dx, 187
  mov ax, [bp]
  jmp [ax]

L353_Arm2:
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
  push #L352_Cont
  mov cx, sp
  ;; (210'38) Tail: explode (f2) @ lit_210'38 (g86)
  mov bp, [bp+2]
  mov dx, 186
  mov ax, [bp]
  jmp [ax]

L354_Cont:
  push [bp+3]
  push cx
  push #L197_Cont
  mov cx, sp
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L198_Arm1
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L353_Arm2
  crash

L355_Cont:
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L354_Cont
  mov cx, sp
  ;; (203'18) Tail: app_203'15 (arg) @ xs (f4)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+4]
  mov ax, [bp]
  jmp [ax]

L356_Cont:
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L355_Cont
  mov cx, sp
  ;; (203'15) Tail: app_203'12 (arg) @ con_203'15 (g84)
  mov bp, dx
  mov dx, 184
  mov ax, [bp]
  jmp [ax]

L357_Arm2:
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L356_Cont
  mov cx, sp
  ;; (203'12) Tail: splitloop (g66) @ con_203'12 (g83)
  mov bp, 166
  mov dx, 183
  mov ax, [bp]
  jmp [ax]

L358_Cont:
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L196_Arm1
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L357_Arm2
  crash

L359_Cont:
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L358_Cont
  mov cx, sp
  ;; (60'44) Tail: app_60'41 (arg) @ con_0'0 (g81)
  mov bp, dx
  mov dx, 181
  mov ax, [bp]
  jmp [ax]

L360_Cont:
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L359_Cont
  mov cx, sp
  ;; (60'41) Tail: app_60'33 (arg) @ xs (f4)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+4]
  mov ax, [bp]
  jmp [ax]

L361_Cont:
  push dx
  push [bp+3]
  push [bp+2]
  push cx
  push #L360_Cont
  mov cx, sp
  ;; (60'33) Tail: eq_list (g3) @ lam_0'0 (g78)
  mov bp, 103
  mov dx, 178
  mov ax, [bp]
  jmp [ax]

L362_Cont:
  push [bp+3]
  push [bp+2]
  push cx
  push #L361_Cont
  mov cx, sp
  ;; (121'28) Tail: readloop (g23) @ con_121'28 (g77)
  mov bp, 123
  mov dx, 177
  mov ax, [bp]
  jmp [ax]

L363_Func_t1:
  push bp
  push [bp+1]
  push cx
  push #L362_Cont
  mov cx, sp
  ;; (216'12) Tail: put_chars (g15) @ con_216'13 (g76)
  mov bp, 115
  mov dx, 176
  mov ax, [bp]
  jmp [ax]

L364_Cont:
  ;; (98'48) Tail: put_chars (g15) @ app_98'57 (arg)
  mov bp, 115
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L365_Func_t2:
  push cx
  push #L364_Cont
  mov cx, sp
  ;; (98'57) Tail: explode (f1) @ s (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L366_Cont:
  ;; (223'11) Tail: mainloop (f2) @ con_223'11 (g216)
  mov bp, [bp+2]
  mov dx, 316
  mov ax, [bp]
  jmp [ax]

L367_Cont:
  push [bp+2]
  push cx
  push #L366_Cont
  mov cx, sp
  ;; (98'61) Tail: app_98'28 (arg) @ lit_222'13 (g215)
  mov bp, dx
  mov dx, 315
  mov ax, [bp]
  jmp [ax]

L368_Cont:
  push dx
  push #L363_Func_t1
  mov 201, sp
  push dx
  push #L365_Func_t2
  mov 202, sp
  push 201
  push cx
  push #L367_Cont
  mov cx, sp
  ;; (98'28) Tail: block (g1) @ lam_98'33 (t2)
  mov bp, 101
  mov dx, 202
  mov ax, [bp]
  jmp [ax]

L369_Top:
  push #L2_TopLam_g1
  mov 101, sp
  push #L3_TopLam_g2
  mov 102, sp
  push #1
  mov 104, sp
  push #0
  mov 105, sp
  push #0
  mov 106, sp
  push #0
  mov 107, sp
  push #L18_TopLam_g3
  mov 103, sp
  push #L24_TopLam_g8
  mov 108, sp
  push #L29_TopLam_g9
  mov 109, sp
  push #0
  mov 111, sp
  push #L36_TopLam_g10
  mov 110, sp
  mov ax, #0
  mov 113, ax
  mov ax, #1
  mov 114, ax
  push #L40_TopLam_g12
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
  push #L50_TopLam_g15
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
  push #L83_TopLam_g23
  mov 123, sp
  mov ax, #2
  mov 157, ax
  mov ax, #1
  mov 158, ax
  mov ax, #2
  mov 159, ax
  push #L88_TopLam_g56
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
  push #L95_TopLam_g60
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
  push #L111_TopLam_g66
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
  push #L113_TopLam_g78
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
  push #L115_TopLam_g87
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
  push #L133_TopLam_g95
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
  push #L138_TopLam_g111
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
  push #L143_TopLam_g122
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
  push #L145_TopLam_g134
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
  push #L163_TopLam_g142
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
  push #L168_TopLam_g158
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
  push #L173_TopLam_g169
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
  push #L175_TopLam_g181
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
  push #L177_TopLam_g188
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
  push #L187_TopLam_g186
  mov 286, sp
  push #0
  mov 296, sp
  mov ax, #'o'
  mov 297, ax
  mov ax, #'*'
  mov 298, ax
  push #L190_TopLam_g199
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
  push #L195_TopLam_g202
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
  push #L368_Cont
  mov cx, sp
  ;; (4'23) Tail: block (g1) @ lam_0'0 (g2)
  mov bp, 101
  mov dx, 102
  mov ax, [bp]
  jmp [ax]


