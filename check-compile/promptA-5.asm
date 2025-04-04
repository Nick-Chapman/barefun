(*Stage5 (ASM)*)
start=L5
L1:
  mov bp, 101
  mov bp, [bp]
  mov ax, 107
  mov ax, [ax]
  mov bx, [bp]
  jmp [bx]

L2:
  mov bp, 104
  mov bp, [bp]
  mov ax, 108
  mov ax, [ax]
  mov bx, [bp]
  jmp [bx]

L3:
  call bios_get_char
  mov 201, ax
  mov ax, 201
  call bios_put_char
  mov 202, ax
  mov ax, 201
  cmp ax, 106
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
  mov ax, 102
  call bios_put_char
  mov 201, ax
  mov ax, 103
  call bios_put_char
  mov 202, ax
  mov bp, 104
  mov bp, [bp]
  mov ax, 109
  mov ax, [ax]
  mov bx, [bp]
  jmp [bx]

L5:
  mov sp, #0
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
  push #L3
  push sp
  mov 104, sp
  push #0
  mov 109, sp
  push #L4
  push sp
  mov 101, sp
  push #0
  mov 110, sp
  mov bp, 101
  mov bp, [bp]
  mov ax, 110
  mov ax, [ax]
  mov bx, [bp]
  jmp [bx]


