(*Stage5 (ASM)*)
start=L5
L1:
  mov cx, [bp+1]
  mov bp, 101
  mov bx, [bp]
  jmp [bx]

L2:
  mov cx, 105
  mov bp, bp
  mov bx, [bp]
  jmp [bx]

L3:
  call bios_get_char
  mov 201, ax
  mov ax, 201
  call bios_put_char
  mov 202, ax
  mov ax, 201
  cmp ax, 104
  call bios_make_bool
  mov 203, ax
  mov ax, 203
  mov ax, [ax]
  cmp ax, #1
  bz L1
  mov ax, 203
  mov ax, [ax]
  cmp ax, #0
  bz L2
  crash

L4:
  mov ax, cx
  call bios_put_char
  mov 201, ax
  mov ax, 102
  call bios_put_char
  mov 202, ax
  push cx
  push #L3
  mov ax, sp
  mov 203, ax
  mov cx, 106
  mov bp, 203
  mov bx, [bp]
  jmp [bx]

L5:
  mov sp, #0
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
  push #L4
  mov 101, sp
  mov ax, #'%'
  mov 107, ax
  mov cx, 107
  mov bp, 101
  mov bx, [bp]
  jmp [bx]


