(*Stage5 (ASM)*)
L1: ; Arm: 20'7
  ;; (0'0) Return: con_20'10 (g2)
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
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov ax, 1
  call bios_put_char
  mov 3, ax
  ;; (21'35) Tail: put_chars (g1) @ xs (t2)
  mov bp, 101
  mov dx, 2
  mov ax, [bp]
  jmp [ax]

L3: ; Arm: 31'11
  ;; (29'12) Return: n (arg)
  mov dx, dx
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L4: ; Continuation
  mov ax, [bp+2]
  add ax, dx
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L5: ; Continuation
  mov ax, [bp+2]
  sub ax, 106
  mov 1, ax
  push dx
  push cx
  push #L4
  mov cx, sp
  ;; (31'39) Tail: fib (g3) @ prim_0'0 (t1)
  mov bp, 103
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L6: ; Function: g3
  mov ax, dx
  cmp ax, 104
  call bios_make_bool_from_n
  mov 1, ax
  mov bx, 1
  cmp [bx], #1
  bz L3
  mov ax, dx
  sub ax, 105
  mov 2, ax
  push dx
  push cx
  push #L5
  mov cx, sp
  ;; (31'27) Tail: fib (g3) @ prim_0'0 (t2)
  mov bp, 103
  mov dx, 2
  mov ax, [bp]
  jmp [ax]

L7: ; Arm: 4'13
  ;; (3'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L8: ; Continuation
  mov ax, [bp+2]
  sub ax, 112
  mov 1, ax
  ;; (5'41) Tail: app_5'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L9: ; Function: t1
  mov ax, dx
  cmp ax, 109
  call bios_make_bool_from_z
  mov 1, ax
  mov bx, 1
  cmp [bx], #1
  bz L7
  mov ax, dx
  sub ax, 110
  mov 2, ax
  mov ax, 111
  mov bx, 2
  call bios_string_index
  mov 3, ax
  push [bp+1]
  push 3
  push #1
  mov 4, sp
  push dx
  push cx
  push #L8
  mov cx, sp
  ;; (5'11) Tail: loop (g8) @ con_0'0 (t4)
  mov bp, 108
  mov dx, 4
  mov ax, [bp]
  jmp [ax]

L10: ; Function: g8
  push dx
  push #L9
  mov 1, sp
  ;; (0'0) Return: lam_3'19 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L11: ; Arm: 13'13
  ;; (12'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L12: ; Continuation
  mov ax, [bp+2]
  div ax, 119
  mov 1, ax
  ;; (14'41) Tail: app_14'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L13: ; Function: t1
  mov ax, dx
  cmp ax, 116
  call bios_make_bool_from_z
  mov 1, ax
  mov bx, 1
  cmp [bx], #1
  bz L11
  mov ax, dx
  mod ax, 117
  mov 2, ax
  mov ax, 118
  add ax, 2
  mov 3, ax
  mov ax, 3
  call bios_num_to_char
  mov 4, ax
  push [bp+1]
  push 4
  push #1
  mov 5, sp
  push dx
  push cx
  push #L12
  mov cx, sp
  ;; (14'11) Tail: loop (g15) @ con_0'0 (t5)
  mov bp, 115
  mov dx, 5
  mov ax, [bp]
  jmp [ax]

L14: ; Function: g15
  push dx
  push #L13
  mov 1, sp
  ;; (0'0) Return: lam_12'19 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L15: ; Arm: 4'13
  ;; (3'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L16: ; Continuation
  mov ax, [bp+2]
  sub ax, 126
  mov 1, ax
  ;; (5'41) Tail: app_5'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L17: ; Function: t1
  mov ax, dx
  cmp ax, 123
  call bios_make_bool_from_z
  mov 1, ax
  mov bx, 1
  cmp [bx], #1
  bz L15
  mov ax, dx
  sub ax, 124
  mov 2, ax
  mov ax, 125
  mov bx, 2
  call bios_string_index
  mov 3, ax
  push [bp+1]
  push 3
  push #1
  mov 4, sp
  push dx
  push cx
  push #L16
  mov cx, sp
  ;; (5'11) Tail: loop (g22) @ con_0'0 (t4)
  mov bp, 122
  mov dx, 4
  mov ax, [bp]
  jmp [ax]

L18: ; Function: g22
  push dx
  push #L17
  mov 1, sp
  ;; (0'0) Return: lam_3'19 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L19: ; Arm: 13'13
  ;; (12'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L20: ; Continuation
  mov ax, [bp+2]
  div ax, 133
  mov 1, ax
  ;; (14'41) Tail: app_14'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L21: ; Function: t1
  mov ax, dx
  cmp ax, 130
  call bios_make_bool_from_z
  mov 1, ax
  mov bx, 1
  cmp [bx], #1
  bz L19
  mov ax, dx
  mod ax, 131
  mov 2, ax
  mov ax, 132
  add ax, 2
  mov 3, ax
  mov ax, 3
  call bios_num_to_char
  mov 4, ax
  push [bp+1]
  push 4
  push #1
  mov 5, sp
  push dx
  push cx
  push #L20
  mov cx, sp
  ;; (14'11) Tail: loop (g29) @ con_0'0 (t5)
  mov bp, 129
  mov dx, 5
  mov ax, [bp]
  jmp [ax]

L22: ; Function: g29
  push dx
  push #L21
  mov 1, sp
  ;; (0'0) Return: lam_12'19 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L23: ; Continuation
  mov ax, 139
  call bios_put_char
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L24: ; Continuation
  push cx
  push #L23
  mov cx, sp
  ;; (25'26) Tail: put_chars (g1) @ case_16'2 (arg)
  mov bp, 101
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L25: ; Arm: 16'11
  ;; (0'0) Return: con_16'17 (g37)
  mov dx, 137
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L26: ; Continuation
  ;; (16'35) Tail: app_16'32 (arg) @ res (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L27: ; Continuation
  mov ax, [bp+2]
  cmp ax, 134
  call bios_make_bool_from_z
  mov 1, ax
  push cx
  push #L24
  mov cx, sp
  mov bx, 1
  cmp [bx], #1
  bz L25
  push [bp+2]
  push cx
  push #L26
  mov cx, sp
  ;; (16'32) Tail: loop (g29) @ con_16'32 (g38)
  mov bp, 129
  mov dx, 138
  mov ax, [bp]
  jmp [ax]

L28: ; Continuation
  push [bp+2]
  push cx
  push #L27
  mov cx, sp
  ;; (23'29) Tail: put_chars (g1) @ app_7'10 (arg)
  mov bp, 101
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L29: ; Continuation
  push [bp+2]
  push cx
  push #L28
  mov cx, sp
  ;; (7'10) Tail: app_7'7 (arg) @ lit_0'0 (g28)
  mov bp, dx
  mov dx, 128
  mov ax, [bp]
  jmp [ax]

L30: ; Continuation
  push [bp+2]
  push cx
  push #L29
  mov cx, sp
  ;; (7'7) Tail: loop (g22) @ con_7'7 (g27)
  mov bp, 122
  mov dx, 127
  mov ax, [bp]
  jmp [ax]

L31: ; Continuation
  push [bp+2]
  push cx
  push #L30
  mov cx, sp
  ;; (25'26) Tail: put_chars (g1) @ app_16'35 (arg)
  mov bp, 101
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L32: ; Continuation
  push [bp+2]
  push cx
  push #L31
  mov cx, sp
  ;; (16'35) Tail: app_16'32 (arg) @ lit_41'21 (g21)
  mov bp, dx
  mov dx, 121
  mov ax, [bp]
  jmp [ax]

L33: ; Continuation
  push [bp+2]
  push cx
  push #L32
  mov cx, sp
  ;; (16'32) Tail: loop (g15) @ con_16'32 (g20)
  mov bp, 115
  mov dx, 120
  mov ax, [bp]
  jmp [ax]

L34: ; Continuation
  push [bp+2]
  push cx
  push #L33
  mov cx, sp
  ;; (23'29) Tail: put_chars (g1) @ app_7'10 (arg)
  mov bp, 101
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L35: ; Continuation
  push [bp+2]
  push cx
  push #L34
  mov cx, sp
  ;; (7'10) Tail: app_7'7 (arg) @ lit_0'0 (g14)
  mov bp, dx
  mov dx, 114
  mov ax, [bp]
  jmp [ax]

L36: ; Continuation
  push dx
  push cx
  push #L35
  mov cx, sp
  ;; (7'7) Tail: loop (g8) @ con_7'7 (g13)
  mov bp, 108
  mov dx, 113
  mov ax, [bp]
  jmp [ax]

L37: ; Start
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
  mov ax, #0
  mov 109, ax
  mov ax, #1
  mov 110, ax
  push #0
  push sp
  push #' '
  push #1
  push sp
  push #'b'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'f'
  push #1
  mov ax, sp
  mov 111, ax
  mov ax, #1
  mov 112, ax
  push #L10
  mov 108, sp
  push #0
  mov 113, sp
  mov ax, #4
  mov 114, ax
  mov ax, #0
  mov 116, ax
  mov ax, #10
  mov 117, ax
  mov ax, #48
  mov 118, ax
  mov ax, #10
  mov 119, ax
  push #L14
  mov 115, sp
  push #0
  mov 120, sp
  mov ax, #20
  mov 121, ax
  mov ax, #0
  mov 123, ax
  mov ax, #1
  mov 124, ax
  push #0
  push sp
  push #' '
  push #1
  push sp
  push #'>'
  push #1
  push sp
  push #'-'
  push #1
  push sp
  push #'-'
  push #1
  push sp
  push #' '
  push #1
  mov ax, sp
  mov 125, ax
  mov ax, #1
  mov 126, ax
  push #L18
  mov 122, sp
  push #0
  mov 127, sp
  mov ax, #5
  mov 128, ax
  mov ax, #0
  mov 130, ax
  mov ax, #10
  mov 131, ax
  mov ax, #48
  mov 132, ax
  mov ax, #10
  mov 133, ax
  push #L22
  mov 129, sp
  mov ax, #0
  mov 134, ax
  mov ax, #'0'
  mov 135, ax
  push #0
  mov 136, sp
  push 136
  push 135
  push #1
  mov 137, sp
  push #0
  mov 138, sp
  mov ax, #'\n'
  mov 139, ax
  push cx
  push #L36
  mov cx, sp
  ;; (34'16) Tail: fib (g3) @ lit_41'21 (g7)
  mov bp, 103
  mov dx, 107
  mov ax, [bp]
  jmp [ax]


