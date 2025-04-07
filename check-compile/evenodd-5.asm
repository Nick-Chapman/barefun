(*Stage5 (ASM)*)
start=L14
L1:
  mov dx, 103
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L2:
  mov dx, 106
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L3:
  mov ax, 202
  sub ax, 107
  mov 204, ax
  mov dx, 204
  mov bp, 101
  mov ax, [bp]
  jmp [ax]

L4:
  mov ax, dx
  sub ax, 104
  mov 202, ax
  mov ax, 202
  cmp ax, 105
  call bios_make_bool
  mov 203, ax
  mov ax, 203
  mov ax, [ax]
  cmp ax, #1
  bz L2
  mov ax, 203
  mov ax, [ax]
  cmp ax, #0
  bz L3
  crash

L5:
  mov ax, dx
  cmp ax, 102
  call bios_make_bool
  mov 201, ax
  mov ax, 201
  mov ax, [ax]
  cmp ax, #1
  bz L1
  mov ax, 201
  mov ax, [ax]
  cmp ax, #0
  bz L4
  crash

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
  mov dx, 112
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L8:
  mov dx, 113
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L9:
  push cx
  push #L6
  mov cx, sp
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L7
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L8
  crash

L10:
  mov ax, dx
  call bios_put_char
  mov 201, ax
  push cx
  push #L9
  mov cx, sp
  mov dx, 111
  mov bp, 101
  mov ax, [bp]
  jmp [ax]

L11:
  mov dx, 109
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L12:
  mov dx, 110
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L13:
  push cx
  push #L10
  mov cx, sp
  mov ax, dx
  mov ax, [ax]
  cmp ax, #1
  bz L11
  mov ax, dx
  mov ax, [ax]
  cmp ax, #0
  bz L12
  crash

L14:
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
  push #L5
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
  push #L13
  mov cx, sp
  mov dx, 108
  mov bp, 101
  mov ax, [bp]
  jmp [ax]


