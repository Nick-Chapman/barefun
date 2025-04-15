(*Stage5 (ASM)*)
L1: ; Arm: 11'7
  ;; (0'0) Return: con_11'10 (g2)
  mov dx, #g2
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
  mov ax, [1]
  call Bare_put_char
  mov 3, ax
  ;; (12'39) Tail: put_chars (g1) @ xsMore (t2)
  mov bp, #g1
  mov dx, [2]
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
  sub ax, #1
  mov 1, ax
  ;; (5'45) Tail: app_5'19 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L5: ; Function: t1
  mov ax, dx
  cmp ax, #0
  call Bare_make_bool_from_n
  mov 1, ax
  mov bx, [1]
  cmp [bx], #1
  bz L3
  mov ax, #g4
  mov bx, dx
  call Bare_string_index
  mov 2, ax
  push [bp+1]
  push [2]
  push #1
  mov 3, sp
  push dx
  push cx
  push #L4
  mov cx, sp
  ;; (5'19) Tail: explode_loop (g3) @ con_0'0 (t3)
  mov bp, #g3
  mov dx, [3]
  mov ax, [bp]
  jmp [ax]

L6: ; Function: g3
  push dx
  push #L5
  mov 1, sp
  ;; (0'0) Return: lam_3'27 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L7: ; Continuation
  ;; (14'29) Tail: put_chars (g1) @ app_7'18 (arg)
  mov bp, #g1
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L8: ; Continuation
  push cx
  push #L7
  mov cx, sp
  ;; (7'18) Tail: app_7'15 (arg) @ 13
  mov bp, dx
  mov dx, #13
  mov ax, [bp]
  jmp [ax]

L9: ; Start
  push cx
  push #L8
  mov cx, sp
  ;; (7'15) Tail: explode_loop (g3) @ con_7'15 (g5)
  mov bp, #g3
  mov dx, #g5
  mov ax, [bp]
  jmp [ax]

g1: dw L2
g2: dw 0
g3: dw L6
g4: dw 1, 'H', g4+3, 1, 'e', g4+6, 1, 'l', g4+9, 1, 'l', g4+12, 1, 'o', g4+15, 1, ',', g4+18, 1, ' ', g4+21, 1, 'w', g4+24, 1, 'o', g4+27, 1, 'r', g4+30, 1, 'l', g4+33, 1, 'd', g4+36, 1, '!', g4+39, 1, '\n', g4+42, 0
g5: dw 0

