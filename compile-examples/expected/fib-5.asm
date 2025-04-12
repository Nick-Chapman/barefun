(*Stage5 (ASM)*)
L1: ; Arm: 20'7
  ;; (0'0) Return: con_20'10 (g2)
  mov dx, [102]
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
  mov ax, [1]
  call bios_put_char
  mov 3, ax
  ;; (21'35) Tail: put_chars (g1) @ xs (t2)
  mov bp, [101]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L3: ; Arm: 30'11
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
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L5: ; Continuation
  mov ax, [bp+2]
  sub ax, [106]
  mov 1, ax
  push dx
  push cx
  push #L4
  mov cx, sp
  ;; (30'39) Tail: fib (g3) @ prim_0'0 (t1)
  mov bp, [103]
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L6: ; Function: g3
  mov ax, dx
  cmp ax, [104]
  call bios_make_bool_from_n
  mov 1, ax
  mov bx, [1]
  cmp [bx], #1
  bz L3
  mov ax, dx
  sub ax, [105]
  mov 2, ax
  push dx
  push cx
  push #L5
  mov cx, sp
  ;; (30'27) Tail: fib (g3) @ prim_0'0 (t2)
  mov bp, [103]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L7: ; Arm: 4'13
  ;; (3'23) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L8: ; Continuation
  mov ax, [bp+2]
  sub ax, [111]
  mov 1, ax
  ;; (5'45) Tail: app_5'19 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L9: ; Function: t1
  mov ax, dx
  cmp ax, [109]
  call bios_make_bool_from_n
  mov 1, ax
  mov bx, [1]
  cmp [bx], #1
  bz L7
  mov ax, [110]
  mov bx, dx
  call bios_string_index
  mov 2, ax
  push [bp+1]
  push [2]
  push #1
  mov 3, sp
  push dx
  push cx
  push #L8
  mov cx, sp
  ;; (5'19) Tail: explode_loop (g8) @ con_0'0 (t3)
  mov bp, [108]
  mov dx, [3]
  mov ax, [bp]
  jmp [ax]

L10: ; Function: g8
  push dx
  push #L9
  mov 1, sp
  ;; (0'0) Return: lam_3'27 (t1)
  mov dx, [1]
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
  div ax, [118]
  mov 1, ax
  ;; (14'41) Tail: app_14'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L13: ; Function: t1
  mov ax, dx
  cmp ax, [115]
  call bios_make_bool_from_z
  mov 1, ax
  mov bx, [1]
  cmp [bx], #1
  bz L11
  mov ax, dx
  mod ax, [116]
  mov 2, ax
  mov ax, [117]
  add ax, [2]
  mov 3, ax
  mov ax, [3]
  call bios_num_to_char
  mov 4, ax
  push [bp+1]
  push [4]
  push #1
  mov 5, sp
  push dx
  push cx
  push #L12
  mov cx, sp
  ;; (14'11) Tail: loop (g14) @ con_0'0 (t5)
  mov bp, [114]
  mov dx, [5]
  mov ax, [bp]
  jmp [ax]

L14: ; Function: g14
  push dx
  push #L13
  mov 1, sp
  ;; (0'0) Return: lam_12'19 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L15: ; Arm: 4'13
  ;; (3'23) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L16: ; Continuation
  mov ax, [bp+2]
  sub ax, [124]
  mov 1, ax
  ;; (5'45) Tail: app_5'19 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L17: ; Function: t1
  mov ax, dx
  cmp ax, [122]
  call bios_make_bool_from_n
  mov 1, ax
  mov bx, [1]
  cmp [bx], #1
  bz L15
  mov ax, [123]
  mov bx, dx
  call bios_string_index
  mov 2, ax
  push [bp+1]
  push [2]
  push #1
  mov 3, sp
  push dx
  push cx
  push #L16
  mov cx, sp
  ;; (5'19) Tail: explode_loop (g21) @ con_0'0 (t3)
  mov bp, [121]
  mov dx, [3]
  mov ax, [bp]
  jmp [ax]

L18: ; Function: g21
  push dx
  push #L17
  mov 1, sp
  ;; (0'0) Return: lam_3'27 (t1)
  mov dx, [1]
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
  div ax, [131]
  mov 1, ax
  ;; (14'41) Tail: app_14'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L21: ; Function: t1
  mov ax, dx
  cmp ax, [128]
  call bios_make_bool_from_z
  mov 1, ax
  mov bx, [1]
  cmp [bx], #1
  bz L19
  mov ax, dx
  mod ax, [129]
  mov 2, ax
  mov ax, [130]
  add ax, [2]
  mov 3, ax
  mov ax, [3]
  call bios_num_to_char
  mov 4, ax
  push [bp+1]
  push [4]
  push #1
  mov 5, sp
  push dx
  push cx
  push #L20
  mov cx, sp
  ;; (14'11) Tail: loop (g27) @ con_0'0 (t5)
  mov bp, [127]
  mov dx, [5]
  mov ax, [bp]
  jmp [ax]

L22: ; Function: g27
  push dx
  push #L21
  mov 1, sp
  ;; (0'0) Return: lam_12'19 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L23: ; Continuation
  mov ax, [137]
  call bios_put_char
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L24: ; Continuation
  push cx
  push #L23
  mov cx, sp
  ;; (25'26) Tail: put_chars (g1) @ case_16'2 (arg)
  mov bp, [101]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L25: ; Arm: 16'11
  ;; (0'0) Return: con_16'17 (g35)
  mov dx, [135]
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
  cmp ax, [132]
  call bios_make_bool_from_z
  mov 1, ax
  push cx
  push #L24
  mov cx, sp
  mov bx, [1]
  cmp [bx], #1
  bz L25
  push [bp+2]
  push cx
  push #L26
  mov cx, sp
  ;; (16'32) Tail: loop (g27) @ con_16'32 (g36)
  mov bp, [127]
  mov dx, [136]
  mov ax, [bp]
  jmp [ax]

L28: ; Continuation
  push [bp+2]
  push cx
  push #L27
  mov cx, sp
  ;; (23'29) Tail: put_chars (g1) @ app_7'18 (arg)
  mov bp, [101]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L29: ; Continuation
  push [bp+2]
  push cx
  push #L28
  mov cx, sp
  ;; (7'18) Tail: app_7'15 (arg) @ lit_0'0 (g26)
  mov bp, dx
  mov dx, [126]
  mov ax, [bp]
  jmp [ax]

L30: ; Continuation
  push [bp+2]
  push cx
  push #L29
  mov cx, sp
  ;; (7'15) Tail: explode_loop (g21) @ con_7'15 (g25)
  mov bp, [121]
  mov dx, [125]
  mov ax, [bp]
  jmp [ax]

L31: ; Continuation
  push [bp+2]
  push cx
  push #L30
  mov cx, sp
  ;; (25'26) Tail: put_chars (g1) @ app_16'35 (arg)
  mov bp, [101]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L32: ; Continuation
  push [bp+2]
  push cx
  push #L31
  mov cx, sp
  ;; (16'35) Tail: app_16'32 (arg) @ lit_40'21 (g20)
  mov bp, dx
  mov dx, [120]
  mov ax, [bp]
  jmp [ax]

L33: ; Continuation
  push [bp+2]
  push cx
  push #L32
  mov cx, sp
  ;; (16'32) Tail: loop (g14) @ con_16'32 (g19)
  mov bp, [114]
  mov dx, [119]
  mov ax, [bp]
  jmp [ax]

L34: ; Continuation
  push [bp+2]
  push cx
  push #L33
  mov cx, sp
  ;; (23'29) Tail: put_chars (g1) @ app_7'18 (arg)
  mov bp, [101]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L35: ; Continuation
  push [bp+2]
  push cx
  push #L34
  mov cx, sp
  ;; (7'18) Tail: app_7'15 (arg) @ lit_0'0 (g13)
  mov bp, dx
  mov dx, [113]
  mov ax, [bp]
  jmp [ax]

L36: ; Continuation
  push dx
  push cx
  push #L35
  mov cx, sp
  ;; (7'15) Tail: explode_loop (g8) @ con_7'15 (g12)
  mov bp, [108]
  mov dx, [112]
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
  mov 110, ax
  mov ax, #1
  mov 111, ax
  push #L10
  mov 108, sp
  push #0
  mov 112, sp
  mov ax, #3
  mov 113, ax
  mov ax, #0
  mov 115, ax
  mov ax, #10
  mov 116, ax
  mov ax, #48
  mov 117, ax
  mov ax, #10
  mov 118, ax
  push #L14
  mov 114, sp
  push #0
  mov 119, sp
  mov ax, #20
  mov 120, ax
  mov ax, #0
  mov 122, ax
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
  mov 123, ax
  mov ax, #1
  mov 124, ax
  push #L18
  mov 121, sp
  push #0
  mov 125, sp
  mov ax, #4
  mov 126, ax
  mov ax, #0
  mov 128, ax
  mov ax, #10
  mov 129, ax
  mov ax, #48
  mov 130, ax
  mov ax, #10
  mov 131, ax
  push #L22
  mov 127, sp
  mov ax, #0
  mov 132, ax
  mov ax, #'0'
  mov 133, ax
  push #0
  mov 134, sp
  push [134]
  push [133]
  push #1
  mov 135, sp
  push #0
  mov 136, sp
  mov ax, #'\n'
  mov 137, ax
  push cx
  push #L36
  mov cx, sp
  ;; (33'16) Tail: fib (g3) @ lit_40'21 (g7)
  mov bp, [103]
  mov dx, [107]
  mov ax, [bp]
  jmp [ax]


