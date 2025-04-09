(*Stage5 (ASM)*)
L1: ; Arm: 6'13
  ;; (5'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L2: ; Continuation
  mov ax, [bp+2]
  div ax, 105
  mov 201, ax
  ;; (7'41) Tail: app_7'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L3: ; Arm: 6'22
  mov ax, dx
  mod ax, 103
  mov 202, ax
  mov ax, 104
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
  push #L2
  mov cx, sp
  ;; (7'11) Tail: loop (g1) @ con_0'0 (t5)
  mov bp, 101
  mov dx, 205
  mov ax, [bp]
  jmp [ax]

L4: ; Function: t1
  mov ax, dx
  cmp ax, 102
  call bios_make_bool_from_z
  mov 201, ax
  mov bx, 201
  cmp [bx], #1
  bz L1
  cmp [bx], #0
  bz L3
  crash

L5: ; Function: g1
  push dx
  push #L4
  mov 201, sp
  ;; (0'0) Return: lam_5'19 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L6: ; Arm: 13'7
  ;; (0'0) Return: con_13'10 (g7)
  mov dx, 107
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L7: ; Arm: 14'10
  mov ax, [bx+1]
  mov 201, ax
  mov ax, [bx+2]
  mov 202, ax
  mov ax, 201
  call bios_put_char
  mov 203, ax
  ;; (14'35) Tail: put_chars (g6) @ xs (t2)
  mov bp, 106
  mov dx, 202
  mov ax, [bp]
  jmp [ax]

L8: ; Function: g6
  mov bx, dx
  cmp [bx], #0
  bz L6
  cmp [bx], #1
  bz L7
  crash

L9: ; Arm: 27'10
  mov ax, [bx+1]
  mov 201, ax
  ;; (27'8) Return: n (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L10: ; Continuation
  mov ax, [bp+2]
  add ax, dx
  mov 201, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L11: ; Continuation
  push dx
  push cx
  push #L10
  mov cx, sp
  ;; (28'33) Tail: eval (g8) @ e2 (f2)
  mov dx, [bp+2]
  mov bp, 108
  mov ax, [bp]
  jmp [ax]

L12: ; Arm: 28'15
  mov ax, [bx+1]
  mov 201, ax
  mov ax, [bx+2]
  mov 202, ax
  push 202
  push cx
  push #L11
  mov cx, sp
  ;; (28'23) Tail: eval (g8) @ e1 (t1)
  mov bp, 108
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L13: ; Continuation
  mov ax, [bp+2]
  sub ax, dx
  mov 201, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L14: ; Continuation
  push dx
  push cx
  push #L13
  mov cx, sp
  ;; (29'33) Tail: eval (g8) @ e2 (f2)
  mov dx, [bp+2]
  mov bp, 108
  mov ax, [bp]
  jmp [ax]

L15: ; Arm: 29'15
  mov ax, [bx+1]
  mov 201, ax
  mov ax, [bx+2]
  mov 202, ax
  push 202
  push cx
  push #L14
  mov cx, sp
  ;; (29'23) Tail: eval (g8) @ e1 (t1)
  mov bp, 108
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L16: ; Function: g8
  mov bx, dx
  cmp [bx], #0
  bz L9
  cmp [bx], #1
  bz L12
  cmp [bx], #2
  bz L15
  crash

L17: ; Continuation
  ;; (16'26) Tail: put_chars (g6) @ case_9'11 (arg)
  mov bp, 106
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L18: ; Arm: 9'20
  ;; (0'0) Return: con_9'26 (g20)
  mov dx, 120
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L19: ; Continuation
  ;; (9'44) Tail: app_9'41 (arg) @ i (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L20: ; Arm: 9'31
  push dx
  push cx
  push #L19
  mov cx, sp
  ;; (9'41) Tail: loop (g1) @ con_9'41 (g21)
  mov bp, 101
  mov dx, 121
  mov ax, [bp]
  jmp [ax]

L21: ; Continuation
  mov ax, dx
  cmp ax, 117
  call bios_make_bool_from_z
  mov 201, ax
  push cx
  push #L17
  mov cx, sp
  mov bx, 201
  cmp [bx], #1
  bz L18
  cmp [bx], #0
  bz L20
  crash

L22: ; Start
  mov ax, #0
  mov 102, ax
  mov ax, #10
  mov 103, ax
  mov ax, #48
  mov 104, ax
  mov ax, #10
  mov 105, ax
  push #L5
  mov 101, sp
  push #0
  mov 107, sp
  push #L8
  mov 106, sp
  push #L16
  mov 108, sp
  mov ax, #1000
  mov 109, ax
  push 109
  push #0
  mov 110, sp
  mov ax, #42
  mov 111, ax
  push 111
  push #0
  mov 112, sp
  mov ax, #3
  mov 113, ax
  push 113
  push #0
  mov 114, sp
  push 114
  push 112
  push #1
  mov 115, sp
  push 115
  push 110
  push #2
  mov 116, sp
  mov ax, #0
  mov 117, ax
  mov ax, #'0'
  mov 118, ax
  push #0
  mov 119, sp
  push 119
  push 118
  push #1
  mov 120, sp
  push #0
  mov 121, sp
  push cx
  push #L21
  mov cx, sp
  ;; (37'16) Tail: eval (g8) @ con_34'15 (g16)
  mov bp, 108
  mov dx, 116
  mov ax, [bp]
  jmp [ax]


