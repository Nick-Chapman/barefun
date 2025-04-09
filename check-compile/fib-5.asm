(*Stage5 (ASM)*)
start=L30_Top
L1_Arm1:
  ;; (0'0) Return: con_13'10 (g2)
  mov dx, 102
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L2_Arm2:
  mov ax, dx
  mov ax, [ax+1]
  mov 201, ax
  mov ax, dx
  mov ax, [ax+2]
  mov 202, ax
  mov ax, 201
  call bios_put_char
  mov 203, ax
  ;; (14'35) Tail: put_chars (g1) @ xs (t2)
  mov bp, 101
  mov dx, 202
  mov ax, [bp]
  jmp [ax]

L3_TopLam_g1:
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L1_Arm1
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L2_Arm2
  crash

L4_Arm1:
  ;; (22'12) Return: n (arg)
  mov dx, dx
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L5_Cont:
  mov ax, [bp+2]
  add ax, dx
  mov 201, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L6_Cont:
  mov ax, [bp+2]
  sub ax, 106
  mov 201, ax
  push dx
  push cx
  push #L5_Cont
  mov cx, sp
  ;; (24'39) Tail: fib (g3) @ prim_0'0 (t1)
  mov bp, 103
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L7_Arm2:
  mov ax, dx
  sub ax, 105
  mov 202, ax
  push dx
  push cx
  push #L6_Cont
  mov cx, sp
  ;; (24'27) Tail: fib (g3) @ prim_0'0 (t2)
  mov bp, 103
  mov dx, 202
  mov ax, [bp]
  jmp [ax]

L8_TopLam_g3:
  mov ax, dx
  cmp ax, 104
  call bios_make_bool_from_n
  mov 201, ax
  mov ax, 201
  mov ax, [ax]
  cmp ax, #1
  bz L4_Arm1
  mov ax, 201
  mov ax, [ax]
  cmp ax, #0
  bz L7_Arm2
  crash

L9_Arm1:
  ;; (5'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L10_Cont:
  mov ax, [bp+2]
  div ax, 121
  mov 201, ax
  ;; (7'41) Tail: app_7'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L11_Arm2:
  mov ax, dx
  mod ax, 119
  mov 202, ax
  mov ax, 120
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
  push #L10_Cont
  mov cx, sp
  ;; (7'11) Tail: loop (g17) @ con_0'0 (t5)
  mov bp, 117
  mov dx, 205
  mov ax, [bp]
  jmp [ax]

L12_Func_t1:
  mov ax, dx
  cmp ax, 118
  call bios_make_bool_from_z
  mov 201, ax
  mov ax, 201
  mov ax, [ax]
  cmp ax, #1
  bz L9_Arm1
  mov ax, 201
  mov ax, [ax]
  cmp ax, #0
  bz L11_Arm2
  crash

L13_TopLam_g17:
  push dx
  push #L12_Func_t1
  mov 201, sp
  ;; (0'0) Return: lam_5'19 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L14_Arm1:
  ;; (5'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L15_Cont:
  mov ax, [bp+2]
  div ax, 139
  mov 201, ax
  ;; (7'41) Tail: app_7'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L16_Arm2:
  mov ax, dx
  mod ax, 137
  mov 202, ax
  mov ax, 138
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
  push #L15_Cont
  mov cx, sp
  ;; (7'11) Tail: loop (g35) @ con_0'0 (t5)
  mov bp, 135
  mov dx, 205
  mov ax, [bp]
  jmp [ax]

L17_Func_t1:
  mov ax, dx
  cmp ax, 136
  call bios_make_bool_from_z
  mov 201, ax
  mov ax, 201
  mov ax, [ax]
  cmp ax, #1
  bz L14_Arm1
  mov ax, 201
  mov ax, [ax]
  cmp ax, #0
  bz L16_Arm2
  crash

L18_TopLam_g35:
  push dx
  push #L17_Func_t1
  mov 201, sp
  ;; (0'0) Return: lam_5'19 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L19_Cont:
  mov ax, 145
  call bios_put_char
  mov 201, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L20_Cont:
  push cx
  push #L19_Cont
  mov cx, sp
  ;; (18'26) Tail: put_chars (g1) @ case_9'2 (arg)
  mov bp, 101
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L21_Arm1:
  ;; (0'0) Return: con_9'17 (g43)
  mov dx, 143
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L22_Cont:
  ;; (9'35) Tail: app_9'32 (arg) @ res (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L23_Arm2:
  push [bp+2]
  push cx
  push #L22_Cont
  mov cx, sp
  ;; (9'32) Tail: loop (g35) @ con_9'32 (g44)
  mov bp, 135
  mov dx, 144
  mov ax, [bp]
  jmp [ax]

L24_Cont:
  mov ax, [bp+2]
  cmp ax, 140
  call bios_make_bool_from_z
  mov 201, ax
  push cx
  push #L20_Cont
  mov cx, sp
  mov ax, 201
  mov ax, [ax]
  cmp ax, #1
  bz L21_Arm1
  mov ax, 201
  mov ax, [ax]
  cmp ax, #0
  bz L23_Arm2
  crash

L25_Cont:
  push [bp+2]
  push cx
  push #L24_Cont
  mov cx, sp
  ;; (16'29) Tail: put_chars (g1) @ con_0'0 (g34)
  mov bp, 101
  mov dx, 134
  mov ax, [bp]
  jmp [ax]

L26_Cont:
  push [bp+2]
  push cx
  push #L25_Cont
  mov cx, sp
  ;; (18'26) Tail: put_chars (g1) @ app_9'35 (arg)
  mov bp, 101
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L27_Cont:
  push [bp+2]
  push cx
  push #L26_Cont
  mov cx, sp
  ;; (9'35) Tail: app_9'32 (arg) @ lit_34'21 (g23)
  mov bp, dx
  mov dx, 123
  mov ax, [bp]
  jmp [ax]

L28_Cont:
  push [bp+2]
  push cx
  push #L27_Cont
  mov cx, sp
  ;; (9'32) Tail: loop (g17) @ con_9'32 (g22)
  mov bp, 117
  mov dx, 122
  mov ax, [bp]
  jmp [ax]

L29_Cont:
  push dx
  push cx
  push #L28_Cont
  mov cx, sp
  ;; (16'29) Tail: put_chars (g1) @ con_0'0 (g16)
  mov bp, 101
  mov dx, 116
  mov ax, [bp]
  jmp [ax]

L30_Top:
  push #0
  mov 102, sp
  push #L3_TopLam_g1
  mov 101, sp
  mov ax, #2
  mov 104, ax
  mov ax, #1
  mov 105, ax
  mov ax, #2
  mov 106, ax
  push #L8_TopLam_g3
  mov 103, sp
  mov ax, #20
  mov 107, ax
  mov ax, #'f'
  mov 108, ax
  mov ax, #'i'
  mov 109, ax
  mov ax, #'b'
  mov 110, ax
  mov ax, #' '
  mov 111, ax
  push #0
  mov 112, sp
  push 112
  push 111
  push #1
  mov 113, sp
  push 113
  push 110
  push #1
  mov 114, sp
  push 114
  push 109
  push #1
  mov 115, sp
  push 115
  push 108
  push #1
  mov 116, sp
  mov ax, #0
  mov 118, ax
  mov ax, #10
  mov 119, ax
  mov ax, #48
  mov 120, ax
  mov ax, #10
  mov 121, ax
  push #L13_TopLam_g17
  mov 117, sp
  push #0
  mov 122, sp
  mov ax, #20
  mov 123, ax
  mov ax, #' '
  mov 124, ax
  mov ax, #'-'
  mov 125, ax
  mov ax, #'-'
  mov 126, ax
  mov ax, #'>'
  mov 127, ax
  mov ax, #' '
  mov 128, ax
  push #0
  mov 129, sp
  push 129
  push 128
  push #1
  mov 130, sp
  push 130
  push 127
  push #1
  mov 131, sp
  push 131
  push 126
  push #1
  mov 132, sp
  push 132
  push 125
  push #1
  mov 133, sp
  push 133
  push 124
  push #1
  mov 134, sp
  mov ax, #0
  mov 136, ax
  mov ax, #10
  mov 137, ax
  mov ax, #48
  mov 138, ax
  mov ax, #10
  mov 139, ax
  push #L18_TopLam_g35
  mov 135, sp
  mov ax, #0
  mov 140, ax
  mov ax, #'0'
  mov 141, ax
  push #0
  mov 142, sp
  push 142
  push 141
  push #1
  mov 143, sp
  push #0
  mov 144, sp
  mov ax, #'\n'
  mov 145, ax
  push cx
  push #L29_Cont
  mov cx, sp
  ;; (27'16) Tail: fib (g3) @ lit_34'21 (g7)
  mov bp, 103
  mov dx, 107
  mov ax, [bp]
  jmp [ax]


