L1: ; Arm: 13'7
  ;; (0'0) Return: con_13'10 (g2)
  mov dx, g2
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L2: ; Function: g1
  mov bx, dx
  cmp word [bx], 0
  jz L1
  mov ax, [bx+1]
  mov [2], ax
  mov ax, [bx+2]
  mov [4], ax
  mov ax, [2]
  call Bare_put_char
  mov [6], ax
  ;; (14'35) Tail: put_chars (g1) @ xs (t2)
  mov bp, g1
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L3: ; Arm: 6'13
  ;; (5'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L4: ; Continuation
  mov ax, [bp+2]
  div ax, 10
  mov [2], ax
  ;; (7'41) Tail: app_7'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L5: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L3
  mov ax, dx
  mod ax, 10
  mov [4], ax
  mov ax, 48
  add ax, [4]
  mov [6], ax
  mov ax, [6]
  call Bare_num_to_char
  mov [8], ax
  push [bp+1]
  push [8]
  push 1
  mov [10], sp
  push dx
  push cx
  push L4
  mov cx, sp
  ;; (7'11) Tail: loop (g3) @ con_0'0 (t5)
  mov bp, g3
  mov dx, [10]
  mov ax, [bp]
  jmp ax

L6: ; Function: g3
  push dx
  push L5
  mov [2], sp
  ;; (0'0) Return: lam_5'19 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L7: ; Continuation
  ;; (16'26) Tail: put_chars (g1) @ app_9'35 (arg)
  mov bp, g1
  mov dx, dx
  mov ax, [bp]
  jmp ax

L8: ; Continuation
  push cx
  push L7
  mov cx, sp
  ;; (9'35) Tail: app_9'32 (arg) @ 42
  mov bp, dx
  mov dx, 42
  mov ax, [bp]
  jmp ax

L9: ; Start
  push cx
  push L8
  mov cx, sp
  ;; (9'32) Tail: loop (g3) @ con_9'32 (g4)
  mov bp, g3
  mov dx, g4
  mov ax, [bp]
  jmp ax

g1: dw L2
g2: dw 0
g3: dw L6
g4: dw 0

bare_start: jmp L9
