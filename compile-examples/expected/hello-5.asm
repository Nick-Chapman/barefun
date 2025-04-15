L1: ; Arm: 11'7
  ;; (0'0) Return: con_11'10 (g2)
  mov dx, g2
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L2: ; Function: g1
  mov bx, dx
  cmp word [bx], 0
  jz L1
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov ax, [2]
  call Bare_put_char
  mov [6], ax
  ;; (12'39) Tail: put_chars (g1) @ xsMore (t2)
  mov bp, g1
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L3: ; Arm: 4'13
  ;; (3'23) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L4: ; Continuation
  mov ax, [bp+4]
  sub ax, 1
  mov [2], ax
  ;; (5'45) Tail: app_5'19 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L5: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L3
  mov ax, g4
  mov bx, dx
  call Bare_string_index
  mov [4], ax
  push [bp+2]
  push [4]
  push 1
  mov [6], sp
  push dx
  push cx
  push L4
  mov cx, sp
  ;; (5'19) Tail: explode_loop (g3) @ con_0'0 (t3)
  mov bp, g3
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L6: ; Function: g3
  push dx
  push L5
  mov [2], sp
  ;; (0'0) Return: lam_3'27 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L7: ; Continuation
  ;; (14'29) Tail: put_chars (g1) @ app_7'18 (arg)
  mov bp, g1
  mov dx, dx
  mov ax, [bp]
  jmp ax

L8: ; Continuation
  push cx
  push L7
  mov cx, sp
  ;; (7'18) Tail: app_7'15 (arg) @ 13
  mov bp, dx
  mov dx, 13
  mov ax, [bp]
  jmp ax

L9: ; Start
  push cx
  push L8
  mov cx, sp
  ;; (7'15) Tail: explode_loop (g3) @ con_7'15 (g5)
  mov bp, g3
  mov dx, g5
  mov ax, [bp]
  jmp ax

g1: dw L2
g2: dw 0
g3: dw L6
g4: dw 1, 'H', g4+3, 1, 'e', g4+6, 1, 'l', g4+9, 1, 'l', g4+12, 1, 'o', g4+15, 1, ',', g4+18, 1, ' ', g4+21, 1, 'w', g4+24, 1, 'o', g4+27, 1, 'r', g4+30, 1, 'l', g4+33, 1, 'd', g4+36, 1, '!', g4+39, 1, `\n`, g4+42, 0
g5: dw 0

bare_start: jmp L9
