(*Stage5 (ASM)*)
start=L8_Top
L1_Arm1:
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L2_Continuation:
  mov bp, dx
  mov dx, 103
  mov ax, [bp]
  jmp [ax]

L3_Arm2:
  mov ax, dx
  call bios_num_to_char
  mov 202, ax
  push cx
  push #L2_Continuation
  mov cx, sp
  mov dx, 202
  mov bp, 101
  mov ax, [bp]
  jmp [ax]

L4_Function:
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

L5_TopLam:
  push dx
  push #L4_Function
  mov ax, sp
  mov 201, ax
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L6_Continuation:
  mov ax, dx
  call bios_put_char
  mov 201, ax
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L7_Continuation:
  push cx
  push #L6_Continuation
  mov cx, sp
  mov bp, dx
  mov dx, 105
  mov ax, [bp]
  jmp [ax]

L8_Top:
  mov ax, #0
  mov 102, ax
  mov ax, #0
  mov 103, ax
  push #L5_TopLam
  mov 101, sp
  mov ax, #'X'
  mov 104, ax
  mov ax, #52
  mov 105, ax
  push cx
  push #L7_Continuation
  mov cx, sp
  mov dx, 104
  mov bp, 101
  mov ax, [bp]
  jmp [ax]


