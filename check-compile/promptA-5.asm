(*Stage5 (ASM)*)
start=L5_Top
L1_Arm1:
  ;; (10'40) Tail: outer (g1) @ con_10'40 (g7)
  mov dx, 107
  mov bp, 101
  mov ax, [bp]
  jmp [ax]

L2_Arm2:
  ;; (10'54) Tail: inner (g4) @ con_10'54 (g8)
  mov dx, 108
  mov bp, 104
  mov ax, [bp]
  jmp [ax]

L3_TopLam_g4:
  call bios_get_char
  mov 201, ax
  mov ax, 201
  call bios_put_char
  mov 202, ax
  mov ax, 201
  cmp ax, 106
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
  mov ax, 102
  call bios_put_char
  mov 201, ax
  mov ax, 103
  call bios_put_char
  mov 202, ax
  ;; (12'9) Tail: inner (g4) @ con_12'9 (g9)
  mov dx, 109
  mov bp, 104
  mov ax, [bp]
  jmp [ax]

L5_Top:
  mov ax, #'%'
  mov 102, ax
  mov ax, #' '
  mov 103, ax
  push #0
  mov 105, sp
  mov ax, #'\n'
  mov 106, ax
  push #0
  mov 107, sp
  push #0
  mov 108, sp
  push #L3_TopLam_g4
  mov 104, sp
  push #0
  mov 109, sp
  push #L4_TopLam_g1
  mov 101, sp
  push #0
  mov 110, sp
  ;; (13'11) Tail: outer (g1) @ con_13'11 (g10)
  mov dx, 110
  mov bp, 101
  mov ax, [bp]
  jmp [ax]


