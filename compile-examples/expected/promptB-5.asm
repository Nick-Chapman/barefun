(*Stage5 (ASM)*)
L1: ; Arm: 9'27
  ;; (9'38) Tail: outer (g1) @ c (f1)
  mov dx, [bp+1]
  mov bp, [101]
  mov ax, [bp]
  jmp [ax]

L2: ; Function: t3
  call bios_get_char
  mov 1, ax
  mov ax, [1]
  call bios_put_char
  mov 2, ax
  mov ax, [1]
  cmp ax, [104]
  call bios_make_bool_from_z
  mov 3, ax
  mov bx, [3]
  cmp [bx], #1
  bz L1
  ;; (9'51) Tail: inner (me) @ con_9'51 (g5)
  mov bp, bp
  mov dx, [105]
  mov ax, [bp]
  jmp [ax]

L3: ; Function: g1
  mov ax, dx
  call bios_put_char
  mov 1, ax
  mov ax, [102]
  call bios_put_char
  mov 2, ax
  push dx
  push #L2
  mov 3, sp
  ;; (11'7) Tail: inner (t3) @ con_11'7 (g6)
  mov bp, [3]
  mov dx, [106]
  mov ax, [bp]
  jmp [ax]

L4: ; Start
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
  push #L3
  mov 101, sp
  mov ax, #'%'
  mov 107, ax
  ;; (14'8) Tail: outer (g1) @ lit_14'8 (g7)
  mov bp, [101]
  mov dx, [107]
  mov ax, [bp]
  jmp [ax]


