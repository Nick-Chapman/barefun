(*Stage5 (ASM)*)
start=L1
L0:
  call bios_halt
  crash

L1:
  mov sp, #0
  mov cx, #12
  mov ax, #'X'
  mov 101, ax
  push #0
  mov 102, sp
  mov ax, #'Y'
  mov 103, ax
  push #0
  mov 104, sp
  mov ax, #'Z'
  mov 105, ax
  mov ax, 101
  call bios_put_char
  mov 201, ax
  call bios_get_char
  mov 202, ax
  mov ax, 202
  call bios_put_char
  mov 203, ax
  mov ax, 103
  call bios_put_char
  mov 204, ax
  call bios_get_char
  mov 205, ax
  mov ax, 205
  call bios_put_char
  mov 206, ax
  mov ax, 105
  call bios_put_char
  mov 207, ax
  mov dx, 207
  mov bp, [cx]
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]


