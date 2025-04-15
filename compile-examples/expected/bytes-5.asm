L1: ; Function: t1
  ;; (4'54) Tail: f (f1) @ a (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L2: ; Function: g1
  push dx
  push L1
  mov [1], sp
  ;; (0'0) Return: lam_4'31 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L3: ; Arm: 8'7
  ;; (8'10) Return: 0
  mov dx, 0
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L4: ; Continuation
  mov ax, 1
  add ax, dx
  mov [1], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L5: ; Function: g2
  mov bx, dx
  cmp [bx], 0
  bz L3
  mov ax, [bx+1]
  mov [1], ax
  mov ax, [bx+2]
  mov [2], ax
  push cx
  push L4
  mov cx, sp
  ;; (9'27) Tail: length (g2) @ xs (t2)
  mov bp, g2
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L6: ; Arm: 15'9
  ;; (0'0) Return: con_15'12 (g3)
  mov dx, g3
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L7: ; Continuation
  ;; (16'43) Tail: app_16'37 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp ax

L8: ; Function: t1
  mov bx, dx
  cmp [bx], 0
  bz L6
  mov ax, [bx+1]
  mov [1], ax
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bp+1]
  mov bx, [bp+2]
  mov si, [1]
  call Bare_set_bytes
  mov [3], ax
  mov ax, [bp+2]
  add ax, 1
  mov [4], ax
  push [2]
  push cx
  push L7
  mov cx, sp
  ;; (16'37) Tail: loop (f3) @ prim_0'0 (t4)
  mov bp, [bp+3]
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L9: ; Function: t2
  push bp
  push dx
  push [bp+1]
  push L8
  mov [1], sp
  ;; (0'0) Return: lam_13'17 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L10: ; Continuation
  mov ax, [bp+2]
  call Bare_freeze_bytes
  mov [1], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L11: ; Continuation
  push [bp+3]
  push cx
  push L10
  mov cx, sp
  ;; (18'9) Tail: app_18'7 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp ax

L12: ; Continuation
  mov ax, dx
  call Bare_make_bytes
  mov [1], ax
  push [1]
  push L9
  mov [2], sp
  push [1]
  push [bp+2]
  push cx
  push L11
  mov cx, sp
  ;; (18'7) Tail: loop (t2) @ 0
  mov bp, [2]
  mov dx, 0
  mov ax, [bp]
  jmp ax

L13: ; Function: g4
  push dx
  push cx
  push L12
  mov cx, sp
  ;; (12'29) Tail: length (g2) @ xs (arg)
  mov bp, g2
  mov dx, dx
  mov ax, [bp]
  jmp ax

L14: ; Arm: 25'13
  ;; (24'23) Return: acc (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L15: ; Continuation
  mov ax, [bp+2]
  sub ax, 1
  mov [1], ax
  ;; (26'45) Tail: app_26'19 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [1]
  mov ax, [bp]
  jmp ax

L16: ; Function: t1
  mov ax, dx
  cmp ax, 0
  call Bare_make_bool_from_n
  mov [1], ax
  mov bx, [1]
  cmp [bx], 1
  bz L14
  mov ax, [bp+1]
  mov bx, dx
  call Bare_string_index
  mov [2], ax
  push [bp+2]
  push [2]
  push 1
  mov [3], sp
  push dx
  push cx
  push L15
  mov cx, sp
  ;; (26'19) Tail: explode_loop (f3) @ con_0'0 (t3)
  mov bp, [bp+3]
  mov dx, [3]
  mov ax, [bp]
  jmp ax

L17: ; Function: t1
  push bp
  push dx
  push [bp+1]
  push L16
  mov [1], sp
  ;; (0'0) Return: lam_24'27 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L18: ; Continuation
  mov ax, [bp+2]
  sub ax, 1
  mov [1], ax
  ;; (28'18) Tail: app_28'15 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [1]
  mov ax, [bp]
  jmp ax

L19: ; Function: g6
  push dx
  push L17
  mov [1], sp
  mov ax, dx
  call Bare_string_length
  mov [2], ax
  push [2]
  push cx
  push L18
  mov cx, sp
  ;; (28'15) Tail: explode_loop (t1) @ con_28'15 (g5)
  mov bp, [1]
  mov dx, g5
  mov ax, [bp]
  jmp ax

L20: ; Arm: 34'7
  ;; (0'0) Return: con_34'10 (g8)
  mov dx, g8
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L21: ; Function: g7
  mov bx, dx
  cmp [bx], 0
  bz L20
  mov ax, [bx+1]
  mov [1], ax
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [1]
  call Bare_put_char
  mov [3], ax
  ;; (35'39) Tail: put_chars (g7) @ xsMore (t2)
  mov bp, g7
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L22: ; Continuation
  ;; (37'29) Tail: put_chars (g7) @ app_37'38 (arg)
  mov bp, g7
  mov dx, dx
  mov ax, [bp]
  jmp ax

L23: ; Continuation
  push cx
  push L22
  mov cx, sp
  ;; (37'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L24: ; Continuation
  push g10
  push '\n'
  push 1
  mov [1], sp
  push [1]
  push 'o'
  push 1
  mov [2], sp
  push [2]
  push 'w'
  push 1
  mov [3], sp
  push [3]
  push 'T'
  push 1
  mov [4], sp
  push [bp+3]
  push cx
  push L23
  mov cx, sp
  ;; (42'22) Tail: implode (f2) @ con_42'23 (t4)
  mov bp, [bp+2]
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L25: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push L24
  mov cx, sp
  ;; (37'29) Tail: put_chars (g7) @ app_37'38 (arg)
  mov bp, g7
  mov dx, dx
  mov ax, [bp]
  jmp ax

L26: ; Continuation
  mov ax, 5
  call Bare_make_bytes
  mov [1], ax
  mov ax, [1]
  call Bare_freeze_bytes
  mov [2], ax
  push [bp+3]
  push [bp+2]
  push cx
  push L25
  mov cx, sp
  ;; (37'38) Tail: explode (f3) @ s (t2)
  mov bp, [bp+3]
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L27: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push L26
  mov cx, sp
  ;; (37'29) Tail: put_chars (g7) @ app_37'38 (arg)
  mov bp, g7
  mov dx, dx
  mov ax, [bp]
  jmp ax

L28: ; Continuation
  push dx
  push [bp+2]
  push cx
  push L27
  mov cx, sp
  ;; (37'38) Tail: explode (arg) @ lit_40'13 (g9)
  mov bp, dx
  mov dx, g9
  mov ax, [bp]
  jmp ax

L29: ; Continuation
  push dx
  push cx
  push L28
  mov cx, sp
  ;; (30'23) Tail: block (g1) @ lam_23'12 (g6)
  mov bp, g1
  mov dx, g6
  mov ax, [bp]
  jmp ax

L30: ; Start
  push cx
  push L29
  mov cx, sp
  ;; (21'23) Tail: block (g1) @ lam_11'12 (g4)
  mov bp, g1
  mov dx, g4
  mov ax, [bp]
  jmp ax

g1: dw L2
g2: dw L5
g3: dw 0
g4: dw L13
g5: dw 0
g6: dw L19
g7: dw L21
g8: dw 0
g9: dw 1, 'O', g9+3, 1, 'n', g9+6, 1, 'e', g9+9, 1, '\n', g9+12, 0
g10: dw 0

bare_start: jmp L30
