(*Stage5 (ASM)*)
start=L8
L1:
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L2:
  mov bp, dx
  mov dx, 103
  mov ax, [bp]
  jmp [ax]

L3:
  mov ax, dx
  mov 202, ax
  push cx
  push #L2
  mov cx, sp
  mov dx, 202
  mov bp, 101
  mov ax, [bp]
  jmp [ax]

L4:
  mov ax, dx
  cmp ax, 102
  call bios_make_bool_from_z
  mov 201, ax
  mov ax, 201
  mov ax, [ax]
  cmp ax, #1
  bz L1
  mov ax, 201
  mov ax, [ax]
  cmp ax, #0
  bz L3
  crash

L5:
  push dx
  push #L4
  mov ax, sp
  mov 201, ax
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L6:
  mov ax, dx
  call bios_put_char
  mov 201, ax
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L7:
  push cx
  push #L6
  mov cx, sp
  mov bp, dx
  mov dx, 105
  mov ax, [bp]
  jmp [ax]

L8:
  mov ax, #0
  mov 102, ax
  mov ax, #0
  mov 103, ax
  push #L5
  mov 101, sp
  mov ax, #'X'
  mov 104, ax
  mov ax, #52
  mov 105, ax
  push cx
  push #L7
  mov cx, sp
  mov dx, 104
  mov bp, 101
  mov ax, [bp]
  jmp [ax]


