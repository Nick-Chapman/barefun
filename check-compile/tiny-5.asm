(*Stage5 (ASM)*)
start=L2
L1:
  call bios_get_char
  mov 201, ax
  mov ax, 201
  call bios_put_char
  mov 202, ax
  mov ax, 201
  call bios_put_char
  mov 203, ax
  mov cx, 103
  mov bp, 101
  mov bx, [bp]
  jmp [bx]

L2:
  mov sp, #0
  push #0
  mov 102, sp
  push #0
  mov 103, sp
  push #L1
  mov 101, sp
  push #0
  mov 104, sp
  mov cx, 104
  mov bp, 101
  mov bx, [bp]
  jmp [bx]


