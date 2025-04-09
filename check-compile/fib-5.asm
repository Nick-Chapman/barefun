(*Stage5 (ASM)*)
L1: ; Arm: 13'7
  ;; (0'0) Return: con_13'10 (g2)
  mov dx, 102
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L2: ; Function: g1
  mov bx, dx
  cmp [bx], #0
  bz L1
  mov ax, [bx+1]
  mov 201, ax
  mov ax, [bx+2]
  mov 202, ax
  mov ax, 201
  call bios_put_char
  mov 203, ax
  ;; (14'35) Tail: put_chars (g1) @ xs (t2)
  mov bp, 101
  mov dx, 202
  mov ax, [bp]
  jmp [ax]

L3: ; Arm: 24'11
  ;; (22'12) Return: n (arg)
  mov dx, dx
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L4: ; Continuation
  mov ax, [bp+2]
  add ax, dx
  mov 201, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L5: ; Continuation
  mov ax, [bp+2]
  sub ax, 106
  mov 201, ax
  push dx
  push cx
  push #L4
  mov cx, sp
  ;; (24'39) Tail: fib (g3) @ prim_0'0 (t1)
  mov bp, 103
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L6: ; Function: g3
  mov ax, dx
  cmp ax, 104
  call bios_make_bool_from_n
  mov 201, ax
  mov bx, 201
  cmp [bx], #1
  bz L3
  mov ax, dx
  sub ax, 105
  mov 202, ax
  push dx
  push cx
  push #L5
  mov cx, sp
  ;; (24'27) Tail: fib (g3) @ prim_0'0 (t2)
  mov bp, 103
  mov dx, 202
  mov ax, [bp]
  jmp [ax]

L7: ; Arm: 6'13
  ;; (5'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L8: ; Continuation
  mov ax, [bp+2]
  div ax, 121
  mov 201, ax
  ;; (7'41) Tail: app_7'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L9: ; Function: t1
  mov ax, dx
  cmp ax, 118
  call bios_make_bool_from_z
  mov 201, ax
  mov bx, 201
  cmp [bx], #1
  bz L7
  mov ax, dx
  mod ax, 119
  mov 202, ax
  mov ax, 120
  add ax, 202
  mov 203, ax
  mov ax, 203
  call bios_num_to_char
  mov 204, ax
  push [bp+1]
  push 204
  push #1
  mov 205, sp
  push dx
  push cx
  push #L8
  mov cx, sp
  ;; (7'11) Tail: loop (g17) @ con_0'0 (t5)
  mov bp, 117
  mov dx, 205
  mov ax, [bp]
  jmp [ax]

L10: ; Function: g17
  push dx
  push #L9
  mov 201, sp
  ;; (0'0) Return: lam_5'19 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L11: ; Arm: 6'13
  ;; (5'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L12: ; Continuation
  mov ax, [bp+2]
  div ax, 139
  mov 201, ax
  ;; (7'41) Tail: app_7'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L13: ; Function: t1
  mov ax, dx
  cmp ax, 136
  call bios_make_bool_from_z
  mov 201, ax
  mov bx, 201
  cmp [bx], #1
  bz L11
  mov ax, dx
  mod ax, 137
  mov 202, ax
  mov ax, 138
  add ax, 202
  mov 203, ax
  mov ax, 203
  call bios_num_to_char
  mov 204, ax
  push [bp+1]
  push 204
  push #1
  mov 205, sp
  push dx
  push cx
  push #L12
  mov cx, sp
  ;; (7'11) Tail: loop (g35) @ con_0'0 (t5)
  mov bp, 135
  mov dx, 205
  mov ax, [bp]
  jmp [ax]

L14: ; Function: g35
  push dx
  push #L13
  mov 201, sp
  ;; (0'0) Return: lam_5'19 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L15: ; Continuation
  mov ax, 145
  call bios_put_char
  mov 201, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L16: ; Continuation
  push cx
  push #L15
  mov cx, sp
  ;; (18'26) Tail: put_chars (g1) @ case_9'2 (arg)
  mov bp, 101
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L17: ; Arm: 9'11
  ;; (0'0) Return: con_9'17 (g43)
  mov dx, 143
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L18: ; Continuation
  ;; (9'35) Tail: app_9'32 (arg) @ res (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L19: ; Continuation
  mov ax, [bp+2]
  cmp ax, 140
  call bios_make_bool_from_z
  mov 201, ax
  push cx
  push #L16
  mov cx, sp
  mov bx, 201
  cmp [bx], #1
  bz L17
  push [bp+2]
  push cx
  push #L18
  mov cx, sp
  ;; (9'32) Tail: loop (g35) @ con_9'32 (g44)
  mov bp, 135
  mov dx, 144
  mov ax, [bp]
  jmp [ax]

L20: ; Continuation
  push [bp+2]
  push cx
  push #L19
  mov cx, sp
  ;; (16'29) Tail: put_chars (g1) @ con_0'0 (g34)
  mov bp, 101
  mov dx, 134
  mov ax, [bp]
  jmp [ax]

L21: ; Continuation
  push [bp+2]
  push cx
  push #L20
  mov cx, sp
  ;; (18'26) Tail: put_chars (g1) @ app_9'35 (arg)
  mov bp, 101
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L22: ; Continuation
  push [bp+2]
  push cx
  push #L21
  mov cx, sp
  ;; (9'35) Tail: app_9'32 (arg) @ lit_34'21 (g23)
  mov bp, dx
  mov dx, 123
  mov ax, [bp]
  jmp [ax]

L23: ; Continuation
  push [bp+2]
  push cx
  push #L22
  mov cx, sp
  ;; (9'32) Tail: loop (g17) @ con_9'32 (g22)
  mov bp, 117
  mov dx, 122
  mov ax, [bp]
  jmp [ax]

L24: ; Continuation
  push dx
  push cx
  push #L23
  mov cx, sp
  ;; (16'29) Tail: put_chars (g1) @ con_0'0 (g16)
  mov bp, 101
  mov dx, 116
  mov ax, [bp]
  jmp [ax]

L25: ; Start
  push #0
  mov 102, sp
  push #L2
  mov 101, sp
  mov ax, #2
  mov 104, ax
  mov ax, #1
  mov 105, ax
  mov ax, #2
  mov 106, ax
  push #L6
  mov 103, sp
  mov ax, #20
  mov 107, ax
  mov ax, #'f'
  mov 108, ax
  mov ax, #'i'
  mov 109, ax
  mov ax, #'b'
  mov 110, ax
  mov ax, #' '
  mov 111, ax
  push #0
  mov 112, sp
  push 112
  push 111
  push #1
  mov 113, sp
  push 113
  push 110
  push #1
  mov 114, sp
  push 114
  push 109
  push #1
  mov 115, sp
  push 115
  push 108
  push #1
  mov 116, sp
  mov ax, #0
  mov 118, ax
  mov ax, #10
  mov 119, ax
  mov ax, #48
  mov 120, ax
  mov ax, #10
  mov 121, ax
  push #L10
  mov 117, sp
  push #0
  mov 122, sp
  mov ax, #20
  mov 123, ax
  mov ax, #' '
  mov 124, ax
  mov ax, #'-'
  mov 125, ax
  mov ax, #'-'
  mov 126, ax
  mov ax, #'>'
  mov 127, ax
  mov ax, #' '
  mov 128, ax
  push #0
  mov 129, sp
  push 129
  push 128
  push #1
  mov 130, sp
  push 130
  push 127
  push #1
  mov 131, sp
  push 131
  push 126
  push #1
  mov 132, sp
  push 132
  push 125
  push #1
  mov 133, sp
  push 133
  push 124
  push #1
  mov 134, sp
  mov ax, #0
  mov 136, ax
  mov ax, #10
  mov 137, ax
  mov ax, #48
  mov 138, ax
  mov ax, #10
  mov 139, ax
  push #L14
  mov 135, sp
  mov ax, #0
  mov 140, ax
  mov ax, #'0'
  mov 141, ax
  push #0
  mov 142, sp
  push 142
  push 141
  push #1
  mov 143, sp
  push #0
  mov 144, sp
  mov ax, #'\n'
  mov 145, ax
  push cx
  push #L24
  mov cx, sp
  ;; (27'16) Tail: fib (g3) @ lit_34'21 (g7)
  mov bp, 103
  mov dx, 107
  mov ax, [bp]
  jmp [ax]


