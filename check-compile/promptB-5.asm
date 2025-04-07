(*Stage5 (ASM)*)
start=L5_Top
L1_Arm1:
  mov dx, [bp+1]
  mov bp, 101
  mov ax, [bp]
  jmp [ax]

L2_Arm2:
  mov dx, 105
  mov bp, bp
  mov ax, [bp]
  jmp [ax]

L3_Function:
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

L4_TopLam:
  mov ax, dx
  call bios_put_char
  mov 201, ax
  mov ax, 102
  call bios_put_char
  mov 202, ax
  push dx
  push #L3_Function
  mov ax, sp
  mov 203, ax
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
  push #L4_TopLam
  mov 101, sp
  mov ax, #'%'
  mov 107, ax
  mov dx, 107
  mov bp, 101
  mov ax, [bp]
  jmp [ax]


