L1: ; Arm: 6'13
  ;; (5'15) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L2: ; Continuation
  mov ax, [bp+4]
  div ax, 10
  mov [2], ax
  ;; (7'41) Tail: app_7'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L3: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L1
  mov ax, dx
  mod ax, 10
  mov [4], ax
  mov ax, 48
  add ax, [4]
  mov [6], ax
  mov ax, [6]
  call Bare_num_to_char
  mov [8], ax
  push word [bp+2]
  push word [8]
  push word 1
  mov [10], sp
  push word dx
  push word cx
  push word L2
  mov cx, sp
  ;; (7'11) Tail: loop (g1) @ con_0'0 (t5)
  mov bp, g1
  mov dx, [10]
  mov ax, [bp]
  jmp ax

L4: ; Function: g1
  push word dx
  push word L3
  mov [2], sp
  ;; (0'0) Return: lam_5'19 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L5: ; Arm: 13'7
  ;; (0'0) Return: con_13'10 (g3)
  mov dx, g3
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L6: ; Function: g2
  mov bx, dx
  cmp word [bx], 0
  jz L5
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov ax, [2]
  call Bare_put_char
  mov [6], ax
  ;; (14'35) Tail: put_chars (g2) @ xs (t2)
  mov bp, g2
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L7: ; Arm: 22'10
  mov ax, [bx+2]
  mov [2], ax
  ;; (22'8) Return: n (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L8: ; Continuation
  mov ax, [bp+4]
  add ax, dx
  mov [2], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L9: ; Continuation
  push word dx
  push word cx
  push word L8
  mov cx, sp
  ;; (23'33) Tail: eval (g4) @ e2 (f2)
  mov dx, [bp+4]
  mov bp, g4
  mov ax, [bp]
  jmp ax

L10: ; Arm: 23'15
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  push word [4]
  push word cx
  push word L9
  mov cx, sp
  ;; (23'23) Tail: eval (g4) @ e1 (t1)
  mov bp, g4
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L11: ; Continuation
  mov ax, [bp+4]
  sub ax, dx
  mov [2], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L12: ; Continuation
  push word dx
  push word cx
  push word L11
  mov cx, sp
  ;; (24'33) Tail: eval (g4) @ e2 (f2)
  mov dx, [bp+4]
  mov bp, g4
  mov ax, [bp]
  jmp ax

L13: ; Function: g4
  mov bx, dx
  cmp word [bx], 0
  jz L7
  cmp word [bx], 1
  jz L10
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  push word [4]
  push word cx
  push word L12
  mov cx, sp
  ;; (24'23) Tail: eval (g4) @ e1 (t1)
  mov bp, g4
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L14: ; Continuation
  ;; (16'26) Tail: put_chars (g2) @ case_9'11 (arg)
  mov bp, g2
  mov dx, dx
  mov ax, [bp]
  jmp ax

L15: ; Arm: 9'20
  push word g5
  push word '0'
  push word 1
  mov [4], sp
  ;; (0'0) Return: con_9'26 (t2)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L16: ; Continuation
  ;; (9'44) Tail: app_9'41 (arg) @ i (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L17: ; Continuation
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  push word cx
  push word L14
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L15
  push word dx
  push word cx
  push word L16
  mov cx, sp
  ;; (9'41) Tail: loop (g1) @ con_9'41 (g6)
  mov bp, g1
  mov dx, g6
  mov ax, [bp]
  jmp ax

L18: ; Start
  push word 1000
  push word 0
  mov [2], sp
  push word 42
  push word 0
  mov [4], sp
  push word 3
  push word 0
  mov [6], sp
  push word [6]
  push word [4]
  push word 1
  mov [8], sp
  push word [8]
  push word [2]
  push word 2
  mov [10], sp
  push word cx
  push word L17
  mov cx, sp
  ;; (29'16) Tail: eval (g4) @ con_26'15 (t5)
  mov bp, g4
  mov dx, [10]
  mov ax, [bp]
  jmp ax

g1: dw L4
g2: dw L6
g3: dw 0
g4: dw L13
g5: dw 0
g6: dw 0

bare_start: jmp L18
