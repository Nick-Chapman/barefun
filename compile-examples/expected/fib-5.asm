L1: ; Arm: 20'7
  ;; (0'0) Return: con_20'10 (g2)
  mov dx, g2
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L2: ; Function: g1
  mov bx, dx
  cmp [bx], 0
  bz L1
  mov ax, [bx+1]
  mov [1], ax
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [1]
  call Bare_put_char
  mov [3], ax
  ;; (21'35) Tail: put_chars (g1) @ xs (t2)
  mov bp, g1
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L3: ; Arm: 30'11
  ;; (29'12) Return: n (arg)
  mov dx, dx
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L4: ; Continuation
  mov ax, [bp+2]
  add ax, dx
  mov [1], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L5: ; Continuation
  mov ax, [bp+2]
  sub ax, 2
  mov [1], ax
  push dx
  push cx
  push L4
  mov cx, sp
  ;; (30'39) Tail: fib (g3) @ prim_0'0 (t1)
  mov bp, g3
  mov dx, [1]
  mov ax, [bp]
  jmp ax

L6: ; Function: g3
  mov ax, dx
  cmp ax, 2
  call Bare_make_bool_from_n
  mov [1], ax
  mov bx, [1]
  cmp [bx], 1
  bz L3
  mov ax, dx
  sub ax, 1
  mov [2], ax
  push dx
  push cx
  push L5
  mov cx, sp
  ;; (30'27) Tail: fib (g3) @ prim_0'0 (t2)
  mov bp, g3
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L7: ; Arm: 4'13
  ;; (3'23) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L8: ; Continuation
  mov ax, [bp+2]
  sub ax, 1
  mov [1], ax
  ;; (5'45) Tail: app_5'19 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [1]
  mov ax, [bp]
  jmp ax

L9: ; Function: t1
  mov ax, dx
  cmp ax, 0
  call Bare_make_bool_from_n
  mov [1], ax
  mov bx, [1]
  cmp [bx], 1
  bz L7
  mov ax, g5
  mov bx, dx
  call Bare_string_index
  mov [2], ax
  push [bp+1]
  push [2]
  push 1
  mov [3], sp
  push dx
  push cx
  push L8
  mov cx, sp
  ;; (5'19) Tail: explode_loop (g4) @ con_0'0 (t3)
  mov bp, g4
  mov dx, [3]
  mov ax, [bp]
  jmp ax

L10: ; Function: g4
  push dx
  push L9
  mov [1], sp
  ;; (0'0) Return: lam_3'27 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L11: ; Arm: 13'13
  ;; (12'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L12: ; Continuation
  mov ax, [bp+2]
  div ax, 10
  mov [1], ax
  ;; (14'41) Tail: app_14'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [1]
  mov ax, [bp]
  jmp ax

L13: ; Function: t1
  mov ax, dx
  cmp ax, 0
  call Bare_make_bool_from_z
  mov [1], ax
  mov bx, [1]
  cmp [bx], 1
  bz L11
  mov ax, dx
  mod ax, 10
  mov [2], ax
  mov ax, 48
  add ax, [2]
  mov [3], ax
  mov ax, [3]
  call Bare_num_to_char
  mov [4], ax
  push [bp+1]
  push [4]
  push 1
  mov [5], sp
  push dx
  push cx
  push L12
  mov cx, sp
  ;; (14'11) Tail: loop (g7) @ con_0'0 (t5)
  mov bp, g7
  mov dx, [5]
  mov ax, [bp]
  jmp ax

L14: ; Function: g7
  push dx
  push L13
  mov [1], sp
  ;; (0'0) Return: lam_12'19 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L15: ; Arm: 4'13
  ;; (3'23) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L16: ; Continuation
  mov ax, [bp+2]
  sub ax, 1
  mov [1], ax
  ;; (5'45) Tail: app_5'19 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [1]
  mov ax, [bp]
  jmp ax

L17: ; Function: t1
  mov ax, dx
  cmp ax, 0
  call Bare_make_bool_from_n
  mov [1], ax
  mov bx, [1]
  cmp [bx], 1
  bz L15
  mov ax, g10
  mov bx, dx
  call Bare_string_index
  mov [2], ax
  push [bp+1]
  push [2]
  push 1
  mov [3], sp
  push dx
  push cx
  push L16
  mov cx, sp
  ;; (5'19) Tail: explode_loop (g9) @ con_0'0 (t3)
  mov bp, g9
  mov dx, [3]
  mov ax, [bp]
  jmp ax

L18: ; Function: g9
  push dx
  push L17
  mov [1], sp
  ;; (0'0) Return: lam_3'27 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L19: ; Arm: 13'13
  ;; (12'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L20: ; Continuation
  mov ax, [bp+2]
  div ax, 10
  mov [1], ax
  ;; (14'41) Tail: app_14'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [1]
  mov ax, [bp]
  jmp ax

L21: ; Function: t1
  mov ax, dx
  cmp ax, 0
  call Bare_make_bool_from_z
  mov [1], ax
  mov bx, [1]
  cmp [bx], 1
  bz L19
  mov ax, dx
  mod ax, 10
  mov [2], ax
  mov ax, 48
  add ax, [2]
  mov [3], ax
  mov ax, [3]
  call Bare_num_to_char
  mov [4], ax
  push [bp+1]
  push [4]
  push 1
  mov [5], sp
  push dx
  push cx
  push L20
  mov cx, sp
  ;; (14'11) Tail: loop (g12) @ con_0'0 (t5)
  mov bp, g12
  mov dx, [5]
  mov ax, [bp]
  jmp ax

L22: ; Function: g12
  push dx
  push L21
  mov [1], sp
  ;; (0'0) Return: lam_12'19 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L23: ; Continuation
  mov ax, '\n'
  call Bare_put_char
  mov [1], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L24: ; Continuation
  push cx
  push L23
  mov cx, sp
  ;; (25'26) Tail: put_chars (g1) @ case_16'2 (arg)
  mov bp, g1
  mov dx, dx
  mov ax, [bp]
  jmp ax

L25: ; Arm: 16'11
  push g13
  push '0'
  push 1
  mov [2], sp
  ;; (0'0) Return: con_16'17 (t2)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L26: ; Continuation
  ;; (16'35) Tail: app_16'32 (arg) @ res (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp ax

L27: ; Continuation
  mov ax, [bp+2]
  cmp ax, 0
  call Bare_make_bool_from_z
  mov [1], ax
  push cx
  push L24
  mov cx, sp
  mov bx, [1]
  cmp [bx], 1
  bz L25
  push [bp+2]
  push cx
  push L26
  mov cx, sp
  ;; (16'32) Tail: loop (g12) @ con_16'32 (g14)
  mov bp, g12
  mov dx, g14
  mov ax, [bp]
  jmp ax

L28: ; Continuation
  push [bp+2]
  push cx
  push L27
  mov cx, sp
  ;; (23'29) Tail: put_chars (g1) @ app_7'18 (arg)
  mov bp, g1
  mov dx, dx
  mov ax, [bp]
  jmp ax

L29: ; Continuation
  push [bp+2]
  push cx
  push L28
  mov cx, sp
  ;; (7'18) Tail: app_7'15 (arg) @ 4
  mov bp, dx
  mov dx, 4
  mov ax, [bp]
  jmp ax

L30: ; Continuation
  push [bp+2]
  push cx
  push L29
  mov cx, sp
  ;; (7'15) Tail: explode_loop (g9) @ con_7'15 (g11)
  mov bp, g9
  mov dx, g11
  mov ax, [bp]
  jmp ax

L31: ; Continuation
  push [bp+2]
  push cx
  push L30
  mov cx, sp
  ;; (25'26) Tail: put_chars (g1) @ app_16'35 (arg)
  mov bp, g1
  mov dx, dx
  mov ax, [bp]
  jmp ax

L32: ; Continuation
  push [bp+2]
  push cx
  push L31
  mov cx, sp
  ;; (16'35) Tail: app_16'32 (arg) @ 20
  mov bp, dx
  mov dx, 20
  mov ax, [bp]
  jmp ax

L33: ; Continuation
  push [bp+2]
  push cx
  push L32
  mov cx, sp
  ;; (16'32) Tail: loop (g7) @ con_16'32 (g8)
  mov bp, g7
  mov dx, g8
  mov ax, [bp]
  jmp ax

L34: ; Continuation
  push [bp+2]
  push cx
  push L33
  mov cx, sp
  ;; (23'29) Tail: put_chars (g1) @ app_7'18 (arg)
  mov bp, g1
  mov dx, dx
  mov ax, [bp]
  jmp ax

L35: ; Continuation
  push [bp+2]
  push cx
  push L34
  mov cx, sp
  ;; (7'18) Tail: app_7'15 (arg) @ 3
  mov bp, dx
  mov dx, 3
  mov ax, [bp]
  jmp ax

L36: ; Continuation
  push dx
  push cx
  push L35
  mov cx, sp
  ;; (7'15) Tail: explode_loop (g4) @ con_7'15 (g6)
  mov bp, g4
  mov dx, g6
  mov ax, [bp]
  jmp ax

L37: ; Start
  push cx
  push L36
  mov cx, sp
  ;; (33'16) Tail: fib (g3) @ 20
  mov bp, g3
  mov dx, 20
  mov ax, [bp]
  jmp ax

g1: dw L2
g2: dw 0
g3: dw L6
g4: dw L10
g5: dw 1, 'f', g5+3, 1, 'i', g5+6, 1, 'b', g5+9, 1, ' ', g5+12, 0
g6: dw 0
g7: dw L14
g8: dw 0
g9: dw L18
g10: dw 1, ' ', g10+3, 1, '-', g10+6, 1, '-', g10+9, 1, '>', g10+12, 1, ' ', g10+15, 0
g11: dw 0
g12: dw L22
g13: dw 0
g14: dw 0

bare_start: jmp L37
