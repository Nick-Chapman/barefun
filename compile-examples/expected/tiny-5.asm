(*Stage5 (ASM)*)
L1: ; Function: g1
  call bios_get_char
  mov 1, ax
  mov ax, [1]
  call bios_put_char
  mov 2, ax
  mov ax, [1]
  call bios_put_char
  mov 3, ax
  ;; (7'13) Tail: mainloop (g1) @ con_7'13 (g3)
  mov bp, [101]
  mov dx, [103]
  mov ax, [bp]
  jmp [ax]

L2: ; Start
  push #0
  mov 102, sp
  push #0
  mov 103, sp
  push #L1
  mov 101, sp
  push #0
  mov 104, sp
  ;; (0'0) Tail: mainloop (g1) @ con_0'0 (g4)
  mov bp, [101]
  mov dx, [104]
  mov ax, [bp]
  jmp [ax]


