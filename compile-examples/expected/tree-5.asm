L1: ; Arm: 6'13
  ;; (5'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L2: ; Continuation
  mov ax, [bp+2]
  div ax, 10
  mov [1], ax
  ;; (7'41) Tail: app_7'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [1]
  mov ax, [bp]
  jmp ax

L3: ; Function: t1
  mov ax, dx
  cmp ax, 0
  call Bare_make_bool_from_z
  mov [1], ax
  mov bx, [1]
  cmp [bx], 1
  bz L1
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
  push L2
  mov cx, sp
  ;; (7'11) Tail: loop (g1) @ con_0'0 (t5)
  mov bp, g1
  mov dx, [5]
  mov ax, [bp]
  jmp ax

L4: ; Function: g1
  push dx
  push L3
  mov [1], sp
  ;; (0'0) Return: lam_5'19 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L5: ; Arm: 13'7
  ;; (0'0) Return: con_13'10 (g3)
  mov dx, g3
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L6: ; Function: g2
  mov bx, dx
  cmp [bx], 0
  bz L5
  mov ax, [bx+1]
  mov [1], ax
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [1]
  call Bare_put_char
  mov [3], ax
  ;; (14'35) Tail: put_chars (g2) @ xs (t2)
  mov bp, g2
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L7: ; Arm: 22'10
  mov ax, [bx+1]
  mov [1], ax
  ;; (22'8) Return: n (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L8: ; Continuation
  mov ax, [bp+2]
  add ax, dx
  mov [1], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L9: ; Continuation
  push dx
  push cx
  push L8
  mov cx, sp
  ;; (23'33) Tail: eval (g4) @ e2 (f2)
  mov dx, [bp+2]
  mov bp, g4
  mov ax, [bp]
  jmp ax

L10: ; Arm: 23'15
  mov ax, [bx+1]
  mov [1], ax
  mov ax, [bx+2]
  mov [2], ax
  push [2]
  push cx
  push L9
  mov cx, sp
  ;; (23'23) Tail: eval (g4) @ e1 (t1)
  mov bp, g4
  mov dx, [1]
  mov ax, [bp]
  jmp ax

L11: ; Continuation
  mov ax, [bp+2]
  sub ax, dx
  mov [1], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L12: ; Continuation
  push dx
  push cx
  push L11
  mov cx, sp
  ;; (24'33) Tail: eval (g4) @ e2 (f2)
  mov dx, [bp+2]
  mov bp, g4
  mov ax, [bp]
  jmp ax

L13: ; Function: g4
  mov bx, dx
  cmp [bx], 0
  bz L7
  cmp [bx], 1
  bz L10
  mov ax, [bx+1]
  mov [1], ax
  mov ax, [bx+2]
  mov [2], ax
  push [2]
  push cx
  push L12
  mov cx, sp
  ;; (24'23) Tail: eval (g4) @ e1 (t1)
  mov bp, g4
  mov dx, [1]
  mov ax, [bp]
  jmp ax

L14: ; Continuation
  ;; (16'26) Tail: put_chars (g2) @ case_9'11 (arg)
  mov bp, g2
  mov dx, dx
  mov ax, [bp]
  jmp ax

L15: ; Arm: 9'20
  push g5
  push '0'
  push 1
  mov [2], sp
  ;; (0'0) Return: con_9'26 (t2)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L16: ; Continuation
  ;; (9'44) Tail: app_9'41 (arg) @ i (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp ax

L17: ; Continuation
  mov ax, dx
  cmp ax, 0
  call Bare_make_bool_from_z
  mov [1], ax
  push cx
  push L14
  mov cx, sp
  mov bx, [1]
  cmp [bx], 1
  bz L15
  push dx
  push cx
  push L16
  mov cx, sp
  ;; (9'41) Tail: loop (g1) @ con_9'41 (g6)
  mov bp, g1
  mov dx, g6
  mov ax, [bp]
  jmp ax

L18: ; Start
  push 1000
  push 0
  mov [1], sp
  push 42
  push 0
  mov [2], sp
  push 3
  push 0
  mov [3], sp
  push [3]
  push [2]
  push 1
  mov [4], sp
  push [4]
  push [1]
  push 2
  mov [5], sp
  push cx
  push L17
  mov cx, sp
  ;; (29'16) Tail: eval (g4) @ con_26'15 (t5)
  mov bp, g4
  mov dx, [5]
  mov ax, [bp]
  jmp ax

g1: dw L4
g2: dw L6
g3: dw 0
g4: dw L13
g5: dw 0
g6: dw 0

bare_start: jmp L18
