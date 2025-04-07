(*Stage5 (ASM)*)
start=L6_Top
L1_Arm1:
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
  mov dx, 202
  mov bp, 101
  mov ax, [bp]
  jmp [ax]

L3_TopLam:
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L1_Arm1
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L2_Arm2
  crash

L4_TopLam:
  mov dx, dx
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L5_Continuation:
  mov ax, dx
  call bios_explode
  mov 201, ax
  mov dx, 201
  mov bp, 101
  mov ax, [bp]
  jmp [ax]

L6_Top:
  push #0
  mov 102, sp
  push #L3_TopLam
  mov 101, sp
  push #L4_TopLam
  mov 103, sp
  push #0
  push sp
  push #'\n'
  push #1
  push sp
  push #'!'
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #'l'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'w'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #','
  push #1
  push sp
  push #'o'
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
  push #'H'
  push #1
  mov ax, sp
  mov 104, ax
  push cx
  push #L5_Continuation
  mov cx, sp
  mov dx, 104
  mov bp, 103
  mov ax, [bp]
  jmp [ax]


