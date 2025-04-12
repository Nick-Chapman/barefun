(*Stage5 (ASM)*)
L1: ; Arm: 10'7
  ;; (0'0) Return: con_10'10 (g2)
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
  ;; (11'39) Tail: put_chars (g1) @ xsMore (t2)
  mov bp, [101]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L3: ; Arm: 4'13
  ;; (3'23) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L4: ; Continuation
  mov ax, [bp+2]
  sub ax, [106]
  mov 1, ax
  ;; (5'45) Tail: app_5'19 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L5: ; Function: t1
  mov ax, dx
  cmp ax, [104]
  call bios_make_bool_from_n
  mov 1, ax
  mov bx, [1]
  cmp [bx], #1
  bz L3
  mov ax, [105]
  mov bx, dx
  call bios_string_index
  mov 2, ax
  push [bp+1]
  push [2]
  push #1
  mov 3, sp
  push dx
  push cx
  push #L4
  mov cx, sp
  ;; (5'19) Tail: explode_loop (g3) @ con_0'0 (t3)
  mov bp, [103]
  mov dx, [3]
  mov ax, [bp]
  jmp [ax]

L6: ; Function: g3
  push dx
  push #L5
  mov 1, sp
  ;; (0'0) Return: lam_3'27 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
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
  sub ax, [113]
  mov 1, ax
  ;; (5'45) Tail: app_5'19 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L9: ; Function: t1
  mov ax, dx
  cmp ax, [111]
  call bios_make_bool_from_n
  mov 1, ax
  mov bx, [1]
  cmp [bx], #1
  bz L7
  mov ax, [112]
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
  ;; (5'19) Tail: explode_loop (g10) @ con_0'0 (t3)
  mov bp, [110]
  mov dx, [3]
  mov ax, [bp]
  jmp [ax]

L10: ; Function: g10
  push dx
  push #L9
  mov 1, sp
  ;; (0'0) Return: lam_3'27 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L11: ; Arm: 18'9
  ;; (16'18) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L12: ; Continuation
  ;; (19'38) Tail: app_19'27 (arg) @ ysMore (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L13: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L11
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push [bp+1]
  push [1]
  push #1
  mov 3, sp
  push [2]
  push cx
  push #L12
  mov cx, sp
  ;; (19'27) Tail: revloop (g20) @ con_0'0 (t3)
  mov bp, [120]
  mov dx, [3]
  mov ax, [bp]
  jmp [ax]

L14: ; Function: g20
  push dx
  push #L13
  mov 1, sp
  ;; (0'0) Return: lam_16'22 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L15: ; Continuation
  ;; (21'13) Tail: app_21'10 (arg) @ sofar (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L16: ; Arm: 29'27
  mov ax, [119]
  call bios_put_char
  mov 3, ax
  push dx
  push cx
  push #L15
  mov cx, sp
  ;; (21'10) Tail: revloop (g20) @ con_21'10 (g21)
  mov bp, [120]
  mov dx, [121]
  mov ax, [bp]
  jmp [ax]

L17: ; Function: g16
  call bios_get_char
  mov 1, ax
  mov ax, [1]
  cmp ax, [118]
  call bios_make_bool_from_z
  mov 2, ax
  mov bx, [2]
  cmp [bx], #1
  bz L16
  mov ax, [1]
  call bios_put_char
  mov 3, ax
  push dx
  push [1]
  push #1
  mov 4, sp
  ;; (30'33) Tail: readloop (g16) @ con_0'0 (t4)
  mov bp, [116]
  mov dx, [4]
  mov ax, [bp]
  jmp [ax]

L18: ; Continuation
  mov ax, [123]
  call bios_put_char
  mov 1, ax
  ;; (40'10) Tail: mainloop (g9) @ con_40'10 (g24)
  mov bp, [109]
  mov dx, [124]
  mov ax, [bp]
  jmp [ax]

L19: ; Continuation
  push cx
  push #L18
  mov cx, sp
  ;; (38'12) Tail: put_chars (g1) @ app_32'11 (arg)
  mov bp, [101]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L20: ; Continuation
  push cx
  push #L19
  mov cx, sp
  ;; (32'11) Tail: readloop (g16) @ con_32'11 (g22)
  mov bp, [116]
  mov dx, [122]
  mov ax, [bp]
  jmp [ax]

L21: ; Continuation
  push cx
  push #L20
  mov cx, sp
  ;; (13'29) Tail: put_chars (g1) @ app_7'18 (arg)
  mov bp, [101]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L22: ; Continuation
  push cx
  push #L21
  mov cx, sp
  ;; (7'18) Tail: app_7'15 (arg) @ lit_0'0 (g15)
  mov bp, dx
  mov dx, [115]
  mov ax, [bp]
  jmp [ax]

L23: ; Function: g9
  push cx
  push #L22
  mov cx, sp
  ;; (7'15) Tail: explode_loop (g10) @ con_7'15 (g14)
  mov bp, [110]
  mov dx, [114]
  mov ax, [bp]
  jmp [ax]

L24: ; Arm: 4'13
  ;; (3'23) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L25: ; Continuation
  mov ax, [bp+2]
  sub ax, [128]
  mov 1, ax
  ;; (5'45) Tail: app_5'19 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L26: ; Function: t1
  mov ax, dx
  cmp ax, [126]
  call bios_make_bool_from_n
  mov 1, ax
  mov bx, [1]
  cmp [bx], #1
  bz L24
  mov ax, [127]
  mov bx, dx
  call bios_string_index
  mov 2, ax
  push [bp+1]
  push [2]
  push #1
  mov 3, sp
  push dx
  push cx
  push #L25
  mov cx, sp
  ;; (5'19) Tail: explode_loop (g25) @ con_0'0 (t3)
  mov bp, [125]
  mov dx, [3]
  mov ax, [bp]
  jmp [ax]

L27: ; Function: g25
  push dx
  push #L26
  mov 1, sp
  ;; (0'0) Return: lam_3'27 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L28: ; Arm: 4'13
  ;; (3'23) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L29: ; Continuation
  mov ax, [bp+2]
  sub ax, [135]
  mov 1, ax
  ;; (5'45) Tail: app_5'19 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L30: ; Function: t1
  mov ax, dx
  cmp ax, [133]
  call bios_make_bool_from_n
  mov 1, ax
  mov bx, [1]
  cmp [bx], #1
  bz L28
  mov ax, [134]
  mov bx, dx
  call bios_string_index
  mov 2, ax
  push [bp+1]
  push [2]
  push #1
  mov 3, sp
  push dx
  push cx
  push #L29
  mov cx, sp
  ;; (5'19) Tail: explode_loop (g32) @ con_0'0 (t3)
  mov bp, [132]
  mov dx, [3]
  mov ax, [bp]
  jmp [ax]

L31: ; Function: g32
  push dx
  push #L30
  mov 1, sp
  ;; (0'0) Return: lam_3'27 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L32: ; Continuation
  ;; (13'29) Tail: put_chars (g1) @ app_7'18 (arg)
  mov bp, [101]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L33: ; Continuation
  push cx
  push #L32
  mov cx, sp
  ;; (7'18) Tail: app_7'15 (arg) @ lit_0'0 (g37)
  mov bp, dx
  mov dx, [137]
  mov ax, [bp]
  jmp [ax]

L34: ; Continuation
  push cx
  push #L33
  mov cx, sp
  ;; (7'15) Tail: explode_loop (g32) @ con_7'15 (g36)
  mov bp, [132]
  mov dx, [136]
  mov ax, [bp]
  jmp [ax]

L35: ; Continuation
  push cx
  push #L34
  mov cx, sp
  ;; (44'20) Tail: mainloop (g9) @ con_44'20 (g31)
  mov bp, [109]
  mov dx, [131]
  mov ax, [bp]
  jmp [ax]

L36: ; Continuation
  push cx
  push #L35
  mov cx, sp
  ;; (13'29) Tail: put_chars (g1) @ app_7'18 (arg)
  mov bp, [101]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L37: ; Continuation
  push cx
  push #L36
  mov cx, sp
  ;; (7'18) Tail: app_7'15 (arg) @ lit_0'0 (g30)
  mov bp, dx
  mov dx, [130]
  mov ax, [bp]
  jmp [ax]

L38: ; Continuation
  push cx
  push #L37
  mov cx, sp
  ;; (7'15) Tail: explode_loop (g25) @ con_7'15 (g29)
  mov bp, [125]
  mov dx, [129]
  mov ax, [bp]
  jmp [ax]

L39: ; Continuation
  push cx
  push #L38
  mov cx, sp
  ;; (13'29) Tail: put_chars (g1) @ app_7'18 (arg)
  mov bp, [101]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L40: ; Continuation
  push cx
  push #L39
  mov cx, sp
  ;; (7'18) Tail: app_7'15 (arg) @ lit_0'0 (g8)
  mov bp, dx
  mov dx, [108]
  mov ax, [bp]
  jmp [ax]

L41: ; Start
  push #0
  mov 102, sp
  push #L2
  mov 101, sp
  mov ax, #0
  mov 104, ax
  push #0
  push sp
  push #'\n'
  push #1
  push sp
  push #'D'
  push #1
  push sp
  push #'A'
  push #1
  push sp
  push #'O'
  push #1
  push sp
  push #'L'
  push #1
  mov ax, sp
  mov 105, ax
  mov ax, #1
  mov 106, ax
  push #L6
  mov 103, sp
  push #0
  mov 107, sp
  mov ax, #4
  mov 108, ax
  mov ax, #0
  mov 111, ax
  push #0
  push sp
  push #' '
  push #1
  push sp
  push #'>'
  push #1
  mov ax, sp
  mov 112, ax
  mov ax, #1
  mov 113, ax
  push #L10
  mov 110, sp
  push #0
  mov 114, sp
  mov ax, #1
  mov 115, ax
  push #0
  mov 117, sp
  mov ax, #'\n'
  mov 118, ax
  mov ax, #'\n'
  mov 119, ax
  push #L14
  mov 120, sp
  push #0
  mov 121, sp
  push #L17
  mov 116, sp
  push #0
  mov 122, sp
  mov ax, #'\n'
  mov 123, ax
  push #0
  mov 124, sp
  push #L23
  mov 109, sp
  mov ax, #0
  mov 126, ax
  push #0
  push sp
  push #'\n'
  push #1
  push sp
  push #'N'
  push #1
  push sp
  push #'U'
  push #1
  push sp
  push #'R'
  push #1
  mov ax, sp
  mov 127, ax
  mov ax, #1
  mov 128, ax
  push #L27
  mov 125, sp
  push #0
  mov 129, sp
  mov ax, #3
  mov 130, ax
  push #0
  mov 131, sp
  mov ax, #0
  mov 133, ax
  push #0
  push sp
  push #'\n'
  push #1
  push sp
  push #'R'
  push #1
  push sp
  push #'E'
  push #1
  push sp
  push #'V'
  push #1
  push sp
  push #'E'
  push #1
  push sp
  push #'N'
  push #1
  mov ax, sp
  mov 134, ax
  mov ax, #1
  mov 135, ax
  push #L31
  mov 132, sp
  push #0
  mov 136, sp
  mov ax, #5
  mov 137, ax
  push cx
  push #L40
  mov cx, sp
  ;; (7'15) Tail: explode_loop (g3) @ con_7'15 (g7)
  mov bp, [103]
  mov dx, [107]
  mov ax, [bp]
  jmp [ax]


