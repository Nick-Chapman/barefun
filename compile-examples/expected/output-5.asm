L1: ; Arm: 6'15
  ;; (0'0) Return: con_6'20 (g2)
  mov dx, g2
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L2: ; Function: g1
  mov ax, 255
  cmp word ax, dx
  call Bare_make_bool_from_n
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L1
  mov ax, ' '
  call Bare_put_char
  mov [4], ax
  mov ax, dx
  call Bare_num_to_char
  mov [6], ax
  mov ax, [6]
  call Bare_put_char
  mov [8], ax
  mov ax, dx
  add ax, 1
  mov [10], ax
  ;; (9'11) Tail: loop (g1) @ prim_0'0 (t5)
  mov bp, g1
  mov dx, [10]
  mov ax, [bp]
  jmp ax

L3: ; Start
  ;; (11'7) Tail: loop (g1) @ 0
  mov bp, g1
  mov dx, 0
  mov ax, [bp]
  jmp ax

g1: dw L2
g2: dw 0

bare_start: jmp L3
