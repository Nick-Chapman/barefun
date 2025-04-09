(*Stage5 (ASM)*)
start=L14_Top
L1_Arm1:
  ;; (0'0) Return: con_4'32 (g3)
  mov dx, 103
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L2_Arm1:
  ;; (0'0) Return: con_3'31 (g6)
  mov dx, 106
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L3_Arm2:
  mov ax, 202
  sub ax, 107
  mov 204, ax
  ;; (3'50) Tail: is_even (g1) @ prim_0'0 (t4)
  mov bp, 101
  mov dx, 204
  mov ax, [bp]
  jmp [ax]

L4_Arm2:
  mov ax, dx
  sub ax, 104
  mov 202, ax
  mov ax, 202
  cmp ax, 105
  call bios_make_bool_from_z
  mov 203, ax
  mov ax, 203
  mov ax, [ax]
  cmp ax, #1
  bz L2_Arm1
  mov ax, 203
  mov ax, [ax]
  cmp ax, #0
  bz L3_Arm2
  crash

L5_TopLam_g1:
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
  bz L4_Arm2
  crash

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

L7_Arm1:
  ;; (0'0) Return: lit_8'30 (g12)
  mov dx, 112
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L8_Arm2:
  ;; (0'0) Return: lit_8'39 (g13)
  mov dx, 113
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L9_Cont:
  push cx
  push #L6_Cont
  mov cx, sp
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L7_Arm1
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L8_Arm2
  crash

L10_Cont:
  mov ax, dx
  call bios_put_char
  mov 201, ax
  push cx
  push #L9_Cont
  mov cx, sp
  ;; (8'23) Tail: is_even (g1) @ lit_12'8 (g11)
  mov bp, 101
  mov dx, 111
  mov ax, [bp]
  jmp [ax]

L11_Arm1:
  ;; (0'0) Return: lit_8'30 (g9)
  mov dx, 109
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L12_Arm2:
  ;; (0'0) Return: lit_8'39 (g10)
  mov dx, 110
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L13_Cont:
  push cx
  push #L10_Cont
  mov cx, sp
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L11_Arm1
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L12_Arm2
  crash

L14_Top:
  mov ax, #0
  mov 102, ax
  push #1
  mov 103, sp
  mov ax, #1
  mov 104, ax
  mov ax, #0
  mov 105, ax
  push #0
  mov 106, sp
  mov ax, #1
  mov 107, ax
  push #L5_TopLam_g1
  mov 101, sp
  mov ax, #42
  mov 108, ax
  mov ax, #'E'
  mov 109, ax
  mov ax, #'O'
  mov 110, ax
  mov ax, #13
  mov 111, ax
  mov ax, #'E'
  mov 112, ax
  mov ax, #'O'
  mov 113, ax
  push cx
  push #L13_Cont
  mov cx, sp
  ;; (8'23) Tail: is_even (g1) @ lit_11'8 (g8)
  mov bp, 101
  mov dx, 108
  mov ax, [bp]
  jmp [ax]


