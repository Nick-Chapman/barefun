(*Stage5 (ASM)*)
L1: ; Arm: 11'7
  ;; (0'0) Return: con_11'10 (g2)
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
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov ax, 1
  call bios_put_char
  mov 3, ax
  ;; (12'39) Tail: put_chars (g1) @ xsMore (t2)
  mov bp, 101
  mov dx, 2
  mov ax, [bp]
  jmp [ax]

L3: ; Arm: 4'13
  ;; (3'23) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L4: ; Continuation
  mov ax, [bp+2]
  sub ax, 106
  mov 1, ax
  ;; (5'45) Tail: app_5'19 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L5: ; Function: t1
  mov ax, dx
  cmp ax, 104
  call bios_make_bool_from_n
  mov 1, ax
  mov bx, 1
  cmp [bx], #1
  bz L3
  mov ax, 105
  mov bx, dx
  call bios_string_index
  mov 2, ax
  push [bp+1]
  push 2
  push #1
  mov 3, sp
  push dx
  push cx
  push #L4
  mov cx, sp
  ;; (5'19) Tail: explode_loop (g3) @ con_0'0 (t3)
  mov bp, 103
  mov dx, 3
  mov ax, [bp]
  jmp [ax]

L6: ; Function: g3
  push dx
  push #L5
  mov 1, sp
  ;; (0'0) Return: lam_3'27 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L7: ; Continuation
  ;; (14'29) Tail: put_chars (g1) @ app_7'18 (arg)
  mov bp, 101
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L8: ; Continuation
  push cx
  push #L7
  mov cx, sp
  ;; (7'18) Tail: app_7'15 (arg) @ lit_0'0 (g8)
  mov bp, dx
  mov dx, 108
  mov ax, [bp]
  jmp [ax]

L9: ; Start
  push #0
  mov 102, sp
  push #L2
  mov 101, sp
  mov ax, #0
  mov 104, ax
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
  mov 105, ax
  mov ax, #1
  mov 106, ax
  push #L6
  mov 103, sp
  push #0
  mov 107, sp
  mov ax, #13
  mov 108, ax
  push cx
  push #L8
  mov cx, sp
  ;; (7'15) Tail: explode_loop (g3) @ con_7'15 (g7)
  mov bp, 103
  mov dx, 107
  mov ax, [bp]
  jmp [ax]


