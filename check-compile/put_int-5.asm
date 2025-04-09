(*Stage5 (ASM)*)
start=L11_Top
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
  mov dx, 202
  mov bp, 101
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
  ;; (5'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L5_Cont:
  mov ax, [bp+2]
  div ax, 107
  mov 201, ax
  ;; (7'41) Tail: app_7'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L6_Arm2:
  mov ax, dx
  mod ax, 105
  mov 202, ax
  mov ax, 106
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
  push #L5_Cont
  mov cx, sp
  ;; (7'11) Tail: loop (g3) @ con_0'0 (t5)
  mov dx, 205
  mov bp, 103
  mov ax, [bp]
  jmp [ax]

L7_Func_t1:
  mov ax, dx
  cmp ax, 104
  call bios_make_bool_from_z
  mov 201, ax
  mov ax, 201
  mov ax, [ax]
  cmp ax, #1
  bz L4_Arm1
  mov ax, 201
  mov ax, [ax]
  cmp ax, #0
  bz L6_Arm2
  crash

L8_TopLam_g3:
  push dx
  push #L7_Func_t1
  mov ax, sp
  mov 201, ax
  ;; (0'0) Return: lam_5'19 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L9_Cont:
  ;; (16'26) Tail: put_chars (g1) @ app_9'35 (arg)
  mov dx, dx
  mov bp, 101
  mov ax, [bp]
  jmp [ax]

L10_Cont:
  push cx
  push #L9_Cont
  mov cx, sp
  ;; (9'35) Tail: app_9'32 (arg) @ lit_18'22 (g9)
  mov bp, dx
  mov dx, 109
  mov ax, [bp]
  jmp [ax]

L11_Top:
  push #0
  mov 102, sp
  push #L3_TopLam_g1
  mov 101, sp
  mov ax, #0
  mov 104, ax
  mov ax, #10
  mov 105, ax
  mov ax, #48
  mov 106, ax
  mov ax, #10
  mov 107, ax
  push #L8_TopLam_g3
  mov 103, sp
  push #0
  mov 108, sp
  mov ax, #42
  mov 109, ax
  push cx
  push #L10_Cont
  mov cx, sp
  ;; (9'32) Tail: loop (g3) @ con_9'32 (g8)
  mov dx, 108
  mov bp, 103
  mov ax, [bp]
  jmp [ax]


