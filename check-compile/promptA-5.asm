(*Stage5 (ASM)*)
start=L5
L1:
  mov dx, 107
  mov bp, 101
  mov bx, [bp]
  jmp [bx]

L2:
  mov dx, 108
  mov bp, 104
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
  mov dx, 109
  mov bp, 104
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
  mov 104, sp
  push #0
  mov 109, sp
  push #L4
  mov 101, sp
  push #0
  mov 110, sp
  mov dx, 110
  mov bp, 101
  mov bx, [bp]
  jmp [bx]


