(*Stage5 (ASM)*)
start=L5_Top
L1_Arm1:
  ;; (9'38) Tail: outer (g1) @ c (f1)
  mov dx, [bp+1]
  mov bp, 101
  mov ax, [bp]
  jmp [ax]

L2_Arm2:
  ;; (9'51) Tail: inner (me) @ con_9'51 (g5)
  mov dx, 105
  mov bp, bp
  mov ax, [bp]
  jmp [ax]

L3_Func_t3:
  call bios_get_char
  mov 201, ax
  mov ax, 201
  call bios_put_char
  mov 202, ax
  mov ax, 201
  cmp ax, 104
  call bios_make_bool_from_z
  mov 203, ax
  mov ax, 203
  mov ax, [ax]
  cmp ax, #1
  bz L1_Arm1
  mov ax, 203
  mov ax, [ax]
  cmp ax, #0
  bz L2_Arm2
  crash

L4_TopLam_g1:
  mov ax, dx
  call bios_put_char
  mov 201, ax
  mov ax, 102
  call bios_put_char
  mov 202, ax
  push dx
  push #L3_Func_t3
  mov 203, sp
  ;; (11'7) Tail: inner (t3) @ con_11'7 (g6)
  mov dx, 106
  mov bp, 203
  mov ax, [bp]
  jmp [ax]

L5_Top:
  mov ax, #' '
  mov 102, ax
  push #0
  mov 103, sp
  mov ax, #'\n'
  mov 104, ax
  push #0
  mov 105, sp
  push #0
  mov 106, sp
  push #L4_TopLam_g1
  mov 101, sp
  mov ax, #'%'
  mov 107, ax
  ;; (14'8) Tail: outer (g1) @ lit_14'8 (g7)
  mov dx, 107
  mov bp, 101
  mov ax, [bp]
  jmp [ax]


