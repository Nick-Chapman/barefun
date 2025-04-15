L1: ; Arm: 3'11
  ;; (2'13) Return: def (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L2: ; Continuation
  ;; (4'17) Tail: app_4'9 (arg) @ 0
  mov bp, dx
  mov dx, 0
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
  call Bare_num_to_char
  mov [4], ax
  push cx
  push L2
  mov cx, sp
  ;; (4'9) Tail: loop (g1) @ prim_0'0 (t2)
  mov bp, g1
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L4: ; Function: g1
  push dx
  push L3
  mov [2], sp
  ;; (0'0) Return: lam_2'17 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L5: ; Continuation
  mov ax, dx
  call Bare_put_char
  mov [2], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L6: ; Continuation
  push cx
  push L5
  mov cx, sp
  ;; (6'33) Tail: app_6'29 (arg) @ 52
  mov bp, dx
  mov dx, 52
  mov ax, [bp]
  jmp ax

L7: ; Start
  push cx
  push L6
  mov cx, sp
  ;; (6'29) Tail: loop (g1) @ 'X'
  mov bp, g1
  mov dx, 'X'
  mov ax, [bp]
  jmp ax

g1: dw L4

bare_start: jmp L7
