(*Stage5 (ASM)*)
L1: ; Arm: 10'29
  ;; (10'40) Tail: outer (g1) @ con_10'40 (g4)
  mov bp, [101]
  mov dx, [104]
  mov ax, [bp]
  jmp [ax]

L2: ; Function: g2
  call bios_get_char
  mov 1, ax
  mov ax, [1]
  call bios_put_char
  mov 2, ax
  mov ax, [1]
  cmp ax, #'\n'
  call bios_make_bool_from_z
  mov 3, ax
  mov bx, [3]
  cmp [bx], #1
  bz L1
  ;; (10'54) Tail: inner (g2) @ con_10'54 (g5)
  mov bp, [102]
  mov dx, [105]
  mov ax, [bp]
  jmp [ax]

L3: ; Function: g1
  mov ax, #'%'
  call bios_put_char
  mov 1, ax
  mov ax, #' '
  call bios_put_char
  mov 2, ax
  ;; (12'9) Tail: inner (g2) @ con_12'9 (g6)
  mov bp, [102]
  mov dx, [106]
  mov ax, [bp]
  jmp [ax]

L4: ; Start
  push #0
  mov 103, sp
  push #0
  mov 104, sp
  push #0
  mov 105, sp
  push #L2
  mov 102, sp
  push #0
  mov 106, sp
  push #L3
  mov 101, sp
  push #0
  mov 107, sp
  ;; (13'11) Tail: outer (g1) @ con_13'11 (g7)
  mov bp, [101]
  mov dx, [107]
  mov ax, [bp]
  jmp [ax]


