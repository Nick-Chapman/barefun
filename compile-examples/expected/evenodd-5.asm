L1: ; Arm: 4'27
  ;; (0'0) Return: con_4'32 (g2)
  mov dx, g2
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L2: ; Arm: 3'26
  ;; (0'0) Return: con_3'31 (g3)
  mov dx, g3
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L3: ; Function: g1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L1
  mov ax, dx
  sub ax, 1
  mov [4], ax
  mov ax, [4]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [6], ax
  mov bx, [6]
  cmp word [bx], 1
  jz L2
  mov ax, [4]
  sub ax, 1
  mov [8], ax
  ;; (3'50) Tail: is_even (g1) @ prim_0'0 (t4)
  mov bp, g1
  mov dx, [8]
  mov ax, [bp]
  jmp ax

L4: ; Continuation
  mov ax, dx
  call Bare_put_char
  mov [2], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L5: ; Arm: 8'25
  ;; (8'30) Return: 'E'
  mov dx, 'E'
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L6: ; Continuation
  push word cx
  push word L4
  mov cx, sp
  mov bx, dx
  cmp word [bx], 1
  jz L5
  ;; (8'39) Return: 'O'
  mov dx, 'O'
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L7: ; Continuation
  mov ax, dx
  call Bare_put_char
  mov [2], ax
  push word cx
  push word L6
  mov cx, sp
  ;; (8'23) Tail: is_even (g1) @ 13
  mov bp, g1
  mov dx, 13
  mov ax, [bp]
  jmp ax

L8: ; Arm: 8'25
  ;; (8'30) Return: 'E'
  mov dx, 'E'
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L9: ; Continuation
  push word cx
  push word L7
  mov cx, sp
  mov bx, dx
  cmp word [bx], 1
  jz L8
  ;; (8'39) Return: 'O'
  mov dx, 'O'
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L10: ; Start
  push word cx
  push word L9
  mov cx, sp
  ;; (8'23) Tail: is_even (g1) @ 42
  mov bp, g1
  mov dx, 42
  mov ax, [bp]
  jmp ax

g1: dw L3
g2: dw 1
g3: dw 0

bare_start: jmp L10
