(*Stage5 (ASM)*)
L1: ; Function: g1
  mov bx, dx
  mov ax, [bx+1]
  mov 201, ax
  mov ax, 201
  call bios_put_char
  mov 202, ax
  ;; (0'0) Return: prim_0'0 (t2)
  mov dx, 202
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L2: ; Start
  push #L1
  mov 101, sp
  mov ax, #'x'
  mov 102, ax
  push 102
  push #0
  mov 103, sp
  ;; (15'21) Tail: doit (g1) @ con_15'22 (g3)
  mov bp, 101
  mov dx, 103
  mov ax, [bp]
  jmp [ax]


