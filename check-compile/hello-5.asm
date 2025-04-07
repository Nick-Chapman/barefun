(*Stage5 (ASM)*)
start=L6
L1:
  mov dx, 102
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L2:
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

L3:
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L1
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L2
  crash

L4:
  mov dx, dx
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L5:
  mov ax, dx
  call bios_explode
  mov 201, ax
  mov dx, 201
  mov bp, 101
  mov ax, [bp]
  jmp [ax]

L6:
  push #0
  mov 102, sp
  push #L3
  mov 101, sp
  push #L4
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
  push #L5
  mov cx, sp
  mov dx, 104
  mov bp, 103
  mov ax, [bp]
  jmp [ax]


