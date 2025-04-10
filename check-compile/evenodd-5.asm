(*Stage5 (ASM)*)
L1: ; Arm: 4'27
  ;; (0'0) Return: con_4'32 (g3)
  mov dx, 103
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L2: ; Arm: 3'26
  ;; (0'0) Return: con_3'31 (g6)
  mov dx, 106
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L3: ; Function: g1
  mov ax, dx
  cmp ax, 102
  call bios_make_bool_from_z
  mov 1, ax
  mov bx, 1
  cmp [bx], #1
  bz L1
  mov ax, dx
  sub ax, 104
  mov 2, ax
  mov ax, 2
  cmp ax, 105
  call bios_make_bool_from_z
  mov 3, ax
  mov bx, 3
  cmp [bx], #1
  bz L2
  mov ax, 2
  sub ax, 107
  mov 4, ax
  ;; (3'50) Tail: is_even (g1) @ prim_0'0 (t4)
  mov bp, 101
  mov dx, 4
  mov ax, [bp]
  jmp [ax]

L4: ; Continuation
  mov ax, dx
  call bios_put_char
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L5: ; Arm: 8'25
  ;; (0'0) Return: lit_8'30 (g12)
  mov dx, 112
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L6: ; Continuation
  push cx
  push #L4
  mov cx, sp
  mov bx, dx
  cmp [bx], #1
  bz L5
  ;; (0'0) Return: lit_8'39 (g13)
  mov dx, 113
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L7: ; Continuation
  mov ax, dx
  call bios_put_char
  mov 1, ax
  push cx
  push #L6
  mov cx, sp
  ;; (8'23) Tail: is_even (g1) @ lit_12'8 (g11)
  mov bp, 101
  mov dx, 111
  mov ax, [bp]
  jmp [ax]

L8: ; Arm: 8'25
  ;; (0'0) Return: lit_8'30 (g9)
  mov dx, 109
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L9: ; Continuation
  push cx
  push #L7
  mov cx, sp
  mov bx, dx
  cmp [bx], #1
  bz L8
  ;; (0'0) Return: lit_8'39 (g10)
  mov dx, 110
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L10: ; Start
  mov ax, #0
  mov 102, ax
  push #1
  mov 103, sp
  mov ax, #1
  mov 104, ax
  mov ax, #0
  mov 105, ax
  push #0
  mov 106, sp
  mov ax, #1
  mov 107, ax
  push #L3
  mov 101, sp
  mov ax, #42
  mov 108, ax
  mov ax, #'E'
  mov 109, ax
  mov ax, #'O'
  mov 110, ax
  mov ax, #13
  mov 111, ax
  mov ax, #'E'
  mov 112, ax
  mov ax, #'O'
  mov 113, ax
  push cx
  push #L9
  mov cx, sp
  ;; (8'23) Tail: is_even (g1) @ lit_11'8 (g8)
  mov bp, 101
  mov dx, 108
  mov ax, [bp]
  jmp [ax]


