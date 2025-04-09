(*Stage5 (ASM)*)
L1: ; Arm: 3'11
  ;; (2'13) Return: def (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L2: ; Continuation
  ;; (4'17) Tail: app_4'9 (arg) @ lit_4'17 (g3)
  mov bp, dx
  mov dx, 103
  mov ax, [bp]
  jmp [ax]

L3: ; Function: t1
  mov ax, dx
  cmp ax, 102
  call bios_make_bool_from_z
  mov 201, ax
  mov bx, 201
  cmp [bx], #1
  bz L1
  mov ax, dx
  call bios_num_to_char
  mov 202, ax
  push cx
  push #L2
  mov cx, sp
  ;; (4'9) Tail: loop (g1) @ prim_0'0 (t2)
  mov bp, 101
  mov dx, 202
  mov ax, [bp]
  jmp [ax]

L4: ; Function: g1
  push dx
  push #L3
  mov 201, sp
  ;; (0'0) Return: lam_2'17 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L5: ; Continuation
  mov ax, dx
  call bios_put_char
  mov 201, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L6: ; Continuation
  push cx
  push #L5
  mov cx, sp
  ;; (6'33) Tail: app_6'29 (arg) @ lit_6'33 (g5)
  mov bp, dx
  mov dx, 105
  mov ax, [bp]
  jmp [ax]

L7: ; Start
  mov ax, #0
  mov 102, ax
  mov ax, #0
  mov 103, ax
  push #L4
  mov 101, sp
  mov ax, #'X'
  mov 104, ax
  mov ax, #52
  mov 105, ax
  push cx
  push #L6
  mov cx, sp
  ;; (6'29) Tail: loop (g1) @ lit_6'29 (g4)
  mov bp, 101
  mov dx, 104
  mov ax, [bp]
  jmp [ax]


