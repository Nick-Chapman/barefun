L1: ; Function: g1
  mov bx, dx
  mov ax, [bx+1]
  mov [2], ax
  mov ax, [2]
  call Bare_put_char
  mov [4], ax
  ;; (0'0) Return: prim_0'0 (t2)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L2: ; Start
  push 'x'
  push 0
  mov [2], sp
  ;; (15'21) Tail: doit (g1) @ con_15'22 (t1)
  mov bp, g1
  mov dx, [2]
  mov ax, [bp]
  jmp ax

g1: dw L1

bare_start: jmp L2
