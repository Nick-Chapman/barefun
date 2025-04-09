(*Stage5 (ASM)*)
L1: ; Arm: 4'7
  ;; (0'0) Return: con_4'10 (g2)
  mov dx, 102
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L2: ; Function: g1
  mov bx, dx
  cmp [bx], #0
  bz L1
  mov ax, [bx+1]
  mov 201, ax
  mov ax, [bx+2]
  mov 202, ax
  mov ax, 201
  call bios_put_char
  mov 203, ax
  ;; (5'39) Tail: put_chars (g1) @ xsMore (t2)
  mov bp, 101
  mov dx, 202
  mov ax, [bp]
  jmp [ax]

L3: ; Function: g3
  ;; (7'26) Return: x (arg)
  mov dx, dx
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L4: ; Continuation
  mov ax, dx
  call bios_explode
  mov 201, ax
  ;; (9'29) Tail: put_chars (g1) @ prim_0'0 (t1)
  mov bp, 101
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L5: ; Start
  push #0
  mov 102, sp
  push #L2
  mov 101, sp
  push #L3
  mov 103, sp
  push #0
  push sp
  push #'\n'
  push #1
  push sp
  push #'!'
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #'l'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'w'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #','
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'l'
  push #1
  push sp
  push #'l'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'H'
  push #1
  mov ax, sp
  mov 104, ax
  push cx
  push #L4
  mov cx, sp
  ;; (9'45) Tail: block (g3) @ lit_12'13 (g4)
  mov bp, 103
  mov dx, 104
  mov ax, [bp]
  jmp [ax]


