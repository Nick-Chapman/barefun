(*Stage5 (ASM)*)
start=L11
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
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L5:
  mov ax, [bp+2]
  div ax, 107
  mov 201, ax
  mov bp, dx
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L6:
  mov ax, dx
  mod ax, 105
  mov 202, ax
  mov ax, 106
  add ax, 202
  mov 203, ax
  mov ax, 203
  mov 204, ax
  push [bp+1]
  push 204
  push #1
  mov 205, ax
  push dx
  push cx
  push #L5
  mov cx, sp
  mov dx, 205
  mov bp, 103
  mov ax, [bp]
  jmp [ax]

L7:
  mov ax, dx
  cmp ax, 104
  call bios_make_bool_from_z
  mov 201, ax
  mov ax, 201
  mov ax, [ax]
  cmp ax, #1
  bz L4
  mov ax, 201
  mov ax, [ax]
  cmp ax, #0
  bz L6
  crash

L8:
  push dx
  push #L7
  mov ax, sp
  mov 201, ax
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L9:
  mov dx, dx
  mov bp, 101
  mov ax, [bp]
  jmp [ax]

L10:
  push cx
  push #L9
  mov cx, sp
  mov bp, dx
  mov dx, 109
  mov ax, [bp]
  jmp [ax]

L11:
  push #0
  mov 102, sp
  push #L3
  mov 101, sp
  mov ax, #0
  mov 104, ax
  mov ax, #10
  mov 105, ax
  mov ax, #48
  mov 106, ax
  mov ax, #10
  mov 107, ax
  push #L8
  mov 103, sp
  push #0
  mov 108, sp
  mov ax, #42
  mov 109, ax
  push cx
  push #L10
  mov cx, sp
  mov dx, 108
  mov bp, 103
  mov ax, [bp]
  jmp [ax]


