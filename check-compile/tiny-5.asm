(*Stage5 (ASM)*)
start=L2_Top
L1_TopLam_g1:
  call bios_get_char
  mov 201, ax
  mov ax, 201
  call bios_put_char
  mov 202, ax
  mov ax, 201
  call bios_put_char
  mov 203, ax
  mov dx, 103
  mov bp, 101
  mov ax, [bp]
  jmp [ax]

L2_Top:
  push #0
  mov 102, sp
  push #0
  mov 103, sp
  push #L1_TopLam_g1
  mov 101, sp
  push #0
  mov 104, sp
  mov dx, 104
  mov bp, 101
  mov ax, [bp]
  jmp [ax]


