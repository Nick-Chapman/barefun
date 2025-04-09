(*Stage5 (ASM)*)
start=L8_Top
L1_Arm1:
  ;; (2'13) Return: def (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L2_Cont:
  ;; (4'17) Tail: app_4'9 (arg) @ lit_4'17 (g3)
  mov bp, dx
  mov dx, 103
  mov ax, [bp]
  jmp [ax]

L3_Arm2:
  mov ax, dx
  call bios_num_to_char
  mov 202, ax
  push cx
  push #L2_Cont
  mov cx, sp
  ;; (4'9) Tail: def (g1) @ prim_0'0 (t2)
  mov dx, 202
  mov bp, 101
  mov ax, [bp]
  jmp [ax]

L4_Func_t1:
  mov ax, dx
  cmp ax, 102
  call bios_make_bool_from_z
  mov 201, ax
  mov ax, 201
  mov ax, [ax]
  cmp ax, #1
  bz L1_Arm1
  mov ax, 201
  mov ax, [ax]
  cmp ax, #0
  bz L3_Arm2
  crash

L5_TopLam_g1:
  push dx
  push #L4_Func_t1
  mov ax, sp
  mov 201, ax
  ;; (0'0) Return: lam_2'17 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L6_Cont:
  mov ax, dx
  call bios_put_char
  mov 201, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L7_Cont:
  push cx
  push #L6_Cont
  mov cx, sp
  ;; (6'33) Tail: app_6'29 (arg) @ lit_6'33 (g5)
  mov bp, dx
  mov dx, 105
  mov ax, [bp]
  jmp [ax]

L8_Top:
  mov ax, #0
  mov 102, ax
  mov ax, #0
  mov 103, ax
  push #L5_TopLam_g1
  mov 101, sp
  mov ax, #'X'
  mov 104, ax
  mov ax, #52
  mov 105, ax
  push cx
  push #L7_Cont
  mov cx, sp
  ;; (6'29) Tail: def (g1) @ lit_6'29 (g4)
  mov dx, 104
  mov bp, 101
  mov ax, [bp]
  jmp [ax]


