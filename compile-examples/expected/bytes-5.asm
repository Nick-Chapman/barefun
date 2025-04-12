(*Stage5 (ASM)*)
L1: ; Function: t1
  ;; (2'54) Tail: f (f1) @ a (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L2: ; Function: g1
  push dx
  push #L1
  mov 1, sp
  ;; (0'0) Return: lam_2'31 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L3: ; Arm: 8'7
  ;; (0'0) Return: lit_8'10 (g3)
  mov dx, [103]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L4: ; Continuation
  mov ax, [104]
  add ax, dx
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L5: ; Function: g2
  mov bx, dx
  cmp [bx], #0
  bz L3
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push cx
  push #L4
  mov cx, sp
  ;; (9'27) Tail: length (g2) @ xs (t2)
  mov bp, [102]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L6: ; Arm: 15'9
  ;; (0'0) Return: con_15'12 (g5)
  mov dx, [105]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L7: ; Continuation
  ;; (16'43) Tail: app_16'37 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L8: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L6
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov ax, [bp+1]
  mov bx, [bp+2]
  mov si, [1]
  call bios_set_bytes
  mov 3, ax
  mov ax, [bp+2]
  add ax, [106]
  mov 4, ax
  push [2]
  push cx
  push #L7
  mov cx, sp
  ;; (16'37) Tail: loop (f3) @ prim_0'0 (t4)
  mov bp, [bp+3]
  mov dx, [4]
  mov ax, [bp]
  jmp [ax]

L9: ; Function: t2
  push bp
  push dx
  push [bp+1]
  push #L8
  mov 1, sp
  ;; (0'0) Return: lam_13'17 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L10: ; Continuation
  mov ax, [bp+2]
  call bios_freeze_bytes
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L11: ; Continuation
  push [bp+3]
  push cx
  push #L10
  mov cx, sp
  ;; (18'9) Tail: app_18'7 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L12: ; Continuation
  mov ax, dx
  call bios_make_bytes
  mov 1, ax
  push [1]
  push #L9
  mov 2, sp
  push [1]
  push [bp+2]
  push cx
  push #L11
  mov cx, sp
  ;; (18'7) Tail: loop (t2) @ lit_18'7 (g7)
  mov bp, [2]
  mov dx, [107]
  mov ax, [bp]
  jmp [ax]

L13: ; Function: g8
  push dx
  push cx
  push #L12
  mov cx, sp
  ;; (12'29) Tail: length (g2) @ xs (arg)
  mov bp, [102]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L14: ; Arm: 25'13
  ;; (24'23) Return: acc (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L15: ; Continuation
  mov ax, [bp+2]
  sub ax, [110]
  mov 1, ax
  ;; (26'45) Tail: app_26'19 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L16: ; Function: t1
  mov ax, dx
  cmp ax, [109]
  call bios_make_bool_from_n
  mov 1, ax
  mov bx, [1]
  cmp [bx], #1
  bz L14
  mov ax, [bp+1]
  mov bx, dx
  call bios_string_index
  mov 2, ax
  push [bp+2]
  push [2]
  push #1
  mov 3, sp
  push dx
  push cx
  push #L15
  mov cx, sp
  ;; (26'19) Tail: explode_loop (f3) @ con_0'0 (t3)
  mov bp, [bp+3]
  mov dx, [3]
  mov ax, [bp]
  jmp [ax]

L17: ; Function: t1
  push bp
  push dx
  push [bp+1]
  push #L16
  mov 1, sp
  ;; (0'0) Return: lam_24'27 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L18: ; Continuation
  mov ax, [bp+2]
  sub ax, [112]
  mov 1, ax
  ;; (28'18) Tail: app_28'15 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L19: ; Function: g13
  push dx
  push #L17
  mov 1, sp
  mov ax, dx
  call bios_string_length
  mov 2, ax
  push [2]
  push cx
  push #L18
  mov cx, sp
  ;; (28'15) Tail: explode_loop (t1) @ con_28'15 (g11)
  mov bp, [1]
  mov dx, [111]
  mov ax, [bp]
  jmp [ax]

L20: ; Arm: 34'7
  ;; (0'0) Return: con_34'10 (g15)
  mov dx, [115]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L21: ; Function: g14
  mov bx, dx
  cmp [bx], #0
  bz L20
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov ax, [1]
  call bios_put_char
  mov 3, ax
  ;; (35'39) Tail: put_chars (g14) @ xsMore (t2)
  mov bp, [114]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L22: ; Continuation
  ;; (37'29) Tail: put_chars (g14) @ app_37'38 (arg)
  mov bp, [114]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L23: ; Continuation
  push cx
  push #L22
  mov cx, sp
  ;; (37'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L24: ; Continuation
  push [bp+3]
  push cx
  push #L23
  mov cx, sp
  ;; (42'22) Tail: implode (f2) @ con_42'23 (g26)
  mov bp, [bp+2]
  mov dx, [126]
  mov ax, [bp]
  jmp [ax]

L25: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L24
  mov cx, sp
  ;; (37'29) Tail: put_chars (g14) @ app_37'38 (arg)
  mov bp, [114]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L26: ; Continuation
  mov ax, [117]
  call bios_make_bytes
  mov 1, ax
  mov ax, [1]
  call bios_freeze_bytes
  mov 2, ax
  push [bp+3]
  push [bp+2]
  push cx
  push #L25
  mov cx, sp
  ;; (37'38) Tail: explode (f3) @ s (t2)
  mov bp, [bp+3]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L27: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L26
  mov cx, sp
  ;; (37'29) Tail: put_chars (g14) @ app_37'38 (arg)
  mov bp, [114]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L28: ; Continuation
  push dx
  push [bp+2]
  push cx
  push #L27
  mov cx, sp
  ;; (37'38) Tail: explode (arg) @ lit_40'13 (g16)
  mov bp, dx
  mov dx, [116]
  mov ax, [bp]
  jmp [ax]

L29: ; Continuation
  push dx
  push cx
  push #L28
  mov cx, sp
  ;; (30'23) Tail: block (g1) @ lam_23'12 (g13)
  mov bp, [101]
  mov dx, [113]
  mov ax, [bp]
  jmp [ax]

L30: ; Start
  push #L2
  mov 101, sp
  mov ax, #0
  mov 103, ax
  mov ax, #1
  mov 104, ax
  push #L5
  mov 102, sp
  push #0
  mov 105, sp
  mov ax, #1
  mov 106, ax
  mov ax, #0
  mov 107, ax
  push #L13
  mov 108, sp
  mov ax, #0
  mov 109, ax
  mov ax, #1
  mov 110, ax
  push #0
  mov 111, sp
  mov ax, #1
  mov 112, ax
  push #L19
  mov 113, sp
  push #0
  mov 115, sp
  push #L21
  mov 114, sp
  push #0
  push sp
  push #'\n'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'O'
  push #1
  mov ax, sp
  mov 116, ax
  mov ax, #5
  mov 117, ax
  mov ax, #'T'
  mov 118, ax
  mov ax, #'w'
  mov 119, ax
  mov ax, #'o'
  mov 120, ax
  mov ax, #'\n'
  mov 121, ax
  push #0
  mov 122, sp
  push [122]
  push [121]
  push #1
  mov 123, sp
  push [123]
  push [120]
  push #1
  mov 124, sp
  push [124]
  push [119]
  push #1
  mov 125, sp
  push [125]
  push [118]
  push #1
  mov 126, sp
  push cx
  push #L29
  mov cx, sp
  ;; (21'23) Tail: block (g1) @ lam_11'12 (g8)
  mov bp, [101]
  mov dx, [108]
  mov ax, [bp]
  jmp [ax]


