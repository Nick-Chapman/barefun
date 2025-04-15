L1: ; Arm: 9'27
  ;; (9'38) Tail: outer (g1) @ c (f1)
  mov dx, [bp+1]
  mov bp, g1
  mov ax, [bp]
  jmp ax

L2: ; Function: t3
  call Bare_get_char
  mov [1], ax
  mov ax, [1]
  call Bare_put_char
  mov [2], ax
  mov ax, [1]
  cmp ax, '\n'
  call Bare_make_bool_from_z
  mov [3], ax
  mov bx, [3]
  cmp [bx], 1
  bz L1
  ;; (9'51) Tail: inner (me) @ con_9'51 (g3)
  mov bp, bp
  mov dx, g3
  mov ax, [bp]
  jmp ax

L3: ; Function: g1
  mov ax, dx
  call Bare_put_char
  mov [1], ax
  mov ax, ' '
  call Bare_put_char
  mov [2], ax
  push dx
  push L2
  mov [3], sp
  ;; (11'7) Tail: inner (t3) @ con_11'7 (g4)
  mov bp, [3]
  mov dx, g4
  mov ax, [bp]
  jmp ax

L4: ; Start
  ;; (14'8) Tail: outer (g1) @ '%'
  mov bp, g1
  mov dx, '%'
  mov ax, [bp]
  jmp ax

g1: dw L3
g2: dw 0
g3: dw 0
g4: dw 0

bare_start: jmp L4
