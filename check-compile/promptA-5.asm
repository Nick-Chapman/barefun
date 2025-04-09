(*Stage5 (ASM)*)
L1: ; Arm: 10'29
  ;; (10'40) Tail: outer (g1) @ con_10'40 (g7)
  mov bp, 101
  mov dx, 107
  mov ax, [bp]
  jmp [ax]

L2: ; Function: g4
  call bios_get_char
  mov 1, ax
  mov ax, 1
  call bios_put_char
  mov 2, ax
  mov ax, 1
  cmp ax, 106
  call bios_make_bool_from_z
  mov 3, ax
  mov bx, 3
  cmp [bx], #1
  bz L1
  ;; (10'54) Tail: inner (g4) @ con_10'54 (g8)
  mov bp, 104
  mov dx, 108
  mov ax, [bp]
  jmp [ax]

L3: ; Function: g1
  mov ax, 102
  call bios_put_char
  mov 1, ax
  mov ax, 103
  call bios_put_char
  mov 2, ax
  ;; (12'9) Tail: inner (g4) @ con_12'9 (g9)
  mov bp, 104
  mov dx, 109
  mov ax, [bp]
  jmp [ax]

L4: ; Start
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
  push #L2
  mov 104, sp
  push #0
  mov 109, sp
  push #L3
  mov 101, sp
  push #0
  mov 110, sp
  ;; (13'11) Tail: outer (g1) @ con_13'11 (g10)
  mov bp, 101
  mov dx, 110
  mov ax, [bp]
  jmp [ax]


