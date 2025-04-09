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

L3: ; Arm: 6'13
  ;; (5'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L4: ; Continuation
  mov ax, [bp+2]
  div ax, 107
  mov 201, ax
  ;; (7'41) Tail: app_7'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 201
  mov ax, [bp]
  jmp [ax]

L5: ; Function: t1
  mov ax, dx
  cmp ax, 104
  call bios_make_bool_from_z
  mov 201, ax
  mov bx, 201
  cmp [bx], #1
  bz L3
  mov ax, dx
  mod ax, 105
  mov 202, ax
  mov ax, 106
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
  push #L4
  mov cx, sp
  ;; (7'11) Tail: loop (g3) @ con_0'0 (t5)
  mov bp, 103
  mov dx, 205
  mov ax, [bp]
  jmp [ax]

L6: ; Function: g3
  push dx
  push #L5
  mov 201, sp
  ;; (0'0) Return: lam_5'19 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L7: ; Continuation
  ;; (16'26) Tail: put_chars (g1) @ app_9'35 (arg)
  mov bp, 101
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L8: ; Continuation
  push cx
  push #L7
  mov cx, sp
  ;; (9'35) Tail: app_9'32 (arg) @ lit_18'22 (g9)
  mov bp, dx
  mov dx, 109
  mov ax, [bp]
  jmp [ax]

L9: ; Start
  push #0
  mov 102, sp
  push #L2
  mov 101, sp
  mov ax, #0
  mov 104, ax
  mov ax, #10
  mov 105, ax
  mov ax, #48
  mov 106, ax
  mov ax, #10
  mov 107, ax
  push #L6
  mov 103, sp
  push #0
  mov 108, sp
  mov ax, #42
  mov 109, ax
  push cx
  push #L8
  mov cx, sp
  ;; (9'32) Tail: loop (g3) @ con_9'32 (g8)
  mov bp, 103
  mov dx, 108
  mov ax, [bp]
  jmp [ax]


