(*Stage5 (ASM)*)
L1: ; Arm: 11'7
  ;; (0'0) Return: con_11'10 (g2)
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
  ;; (12'39) Tail: put_chars (g1) @ xsMore (t2)
  mov bp, 101
  mov dx, 2
  mov ax, [bp]
  jmp [ax]

L3: ; Arm: 4'13
  ;; (3'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L4: ; Continuation
  mov ax, [bp+2]
  sub ax, 107
  mov 1, ax
  ;; (5'41) Tail: app_5'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L5: ; Function: t1
  mov ax, dx
  cmp ax, 104
  call bios_make_bool_from_z
  mov 1, ax
  mov bx, 1
  cmp [bx], #1
  bz L3
  mov ax, dx
  sub ax, 105
  mov 2, ax
  mov ax, 106
  mov bx, 2
  call bios_string_index
  mov 3, ax
  push [bp+1]
  push 3
  push #1
  mov 4, sp
  push dx
  push cx
  push #L4
  mov cx, sp
  ;; (5'11) Tail: loop (g3) @ con_0'0 (t4)
  mov bp, 103
  mov dx, 4
  mov ax, [bp]
  jmp [ax]

L6: ; Function: g3
  push dx
  push #L5
  mov 1, sp
  ;; (0'0) Return: lam_3'19 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
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
  sub ax, 115
  mov 1, ax
  ;; (5'41) Tail: app_5'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L9: ; Function: t1
  mov ax, dx
  cmp ax, 112
  call bios_make_bool_from_z
  mov 1, ax
  mov bx, 1
  cmp [bx], #1
  bz L7
  mov ax, dx
  sub ax, 113
  mov 2, ax
  mov ax, 114
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
  ;; (5'11) Tail: loop (g11) @ con_0'0 (t4)
  mov bp, 111
  mov dx, 4
  mov ax, [bp]
  jmp [ax]

L10: ; Function: g11
  push dx
  push #L9
  mov 1, sp
  ;; (0'0) Return: lam_3'19 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L11: ; Arm: 19'9
  ;; (17'18) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L12: ; Continuation
  ;; (20'38) Tail: app_20'27 (arg) @ ysMore (f2)
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
  push 1
  push #1
  mov 3, sp
  push 2
  push cx
  push #L12
  mov cx, sp
  ;; (20'27) Tail: revloop (g22) @ con_0'0 (t3)
  mov bp, 122
  mov dx, 3
  mov ax, [bp]
  jmp [ax]

L14: ; Function: g22
  push dx
  push #L13
  mov 1, sp
  ;; (0'0) Return: lam_17'22 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L15: ; Continuation
  ;; (22'13) Tail: app_22'10 (arg) @ sofar (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L16: ; Arm: 30'27
  mov ax, 121
  call bios_put_char
  mov 3, ax
  push dx
  push cx
  push #L15
  mov cx, sp
  ;; (22'10) Tail: revloop (g22) @ con_22'10 (g23)
  mov bp, 122
  mov dx, 123
  mov ax, [bp]
  jmp [ax]

L17: ; Function: g18
  call bios_get_char
  mov 1, ax
  mov ax, 1
  cmp ax, 120
  call bios_make_bool_from_z
  mov 2, ax
  mov bx, 2
  cmp [bx], #1
  bz L16
  mov ax, 1
  call bios_put_char
  mov 3, ax
  push dx
  push 1
  push #1
  mov 4, sp
  ;; (31'33) Tail: readloop (g18) @ con_0'0 (t4)
  mov bp, 118
  mov dx, 4
  mov ax, [bp]
  jmp [ax]

L18: ; Continuation
  mov ax, 125
  call bios_put_char
  mov 1, ax
  ;; (41'10) Tail: mainloop (g10) @ con_41'10 (g26)
  mov bp, 110
  mov dx, 126
  mov ax, [bp]
  jmp [ax]

L19: ; Continuation
  push cx
  push #L18
  mov cx, sp
  ;; (39'12) Tail: put_chars (g1) @ app_33'11 (arg)
  mov bp, 101
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L20: ; Continuation
  push cx
  push #L19
  mov cx, sp
  ;; (33'11) Tail: readloop (g18) @ con_33'11 (g24)
  mov bp, 118
  mov dx, 124
  mov ax, [bp]
  jmp [ax]

L21: ; Continuation
  push cx
  push #L20
  mov cx, sp
  ;; (14'29) Tail: put_chars (g1) @ app_7'10 (arg)
  mov bp, 101
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L22: ; Continuation
  push cx
  push #L21
  mov cx, sp
  ;; (7'10) Tail: app_7'7 (arg) @ lit_0'0 (g17)
  mov bp, dx
  mov dx, 117
  mov ax, [bp]
  jmp [ax]

L23: ; Function: g10
  push cx
  push #L22
  mov cx, sp
  ;; (7'7) Tail: loop (g11) @ con_7'7 (g16)
  mov bp, 111
  mov dx, 116
  mov ax, [bp]
  jmp [ax]

L24: ; Arm: 4'13
  ;; (3'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L25: ; Continuation
  mov ax, [bp+2]
  sub ax, 131
  mov 1, ax
  ;; (5'41) Tail: app_5'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L26: ; Function: t1
  mov ax, dx
  cmp ax, 128
  call bios_make_bool_from_z
  mov 1, ax
  mov bx, 1
  cmp [bx], #1
  bz L24
  mov ax, dx
  sub ax, 129
  mov 2, ax
  mov ax, 130
  mov bx, 2
  call bios_string_index
  mov 3, ax
  push [bp+1]
  push 3
  push #1
  mov 4, sp
  push dx
  push cx
  push #L25
  mov cx, sp
  ;; (5'11) Tail: loop (g27) @ con_0'0 (t4)
  mov bp, 127
  mov dx, 4
  mov ax, [bp]
  jmp [ax]

L27: ; Function: g27
  push dx
  push #L26
  mov 1, sp
  ;; (0'0) Return: lam_3'19 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L28: ; Arm: 4'13
  ;; (3'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L29: ; Continuation
  mov ax, [bp+2]
  sub ax, 139
  mov 1, ax
  ;; (5'41) Tail: app_5'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L30: ; Function: t1
  mov ax, dx
  cmp ax, 136
  call bios_make_bool_from_z
  mov 1, ax
  mov bx, 1
  cmp [bx], #1
  bz L28
  mov ax, dx
  sub ax, 137
  mov 2, ax
  mov ax, 138
  mov bx, 2
  call bios_string_index
  mov 3, ax
  push [bp+1]
  push 3
  push #1
  mov 4, sp
  push dx
  push cx
  push #L29
  mov cx, sp
  ;; (5'11) Tail: loop (g35) @ con_0'0 (t4)
  mov bp, 135
  mov dx, 4
  mov ax, [bp]
  jmp [ax]

L31: ; Function: g35
  push dx
  push #L30
  mov 1, sp
  ;; (0'0) Return: lam_3'19 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L32: ; Continuation
  ;; (14'29) Tail: put_chars (g1) @ app_7'10 (arg)
  mov bp, 101
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L33: ; Continuation
  push cx
  push #L32
  mov cx, sp
  ;; (7'10) Tail: app_7'7 (arg) @ lit_0'0 (g41)
  mov bp, dx
  mov dx, 141
  mov ax, [bp]
  jmp [ax]

L34: ; Continuation
  push cx
  push #L33
  mov cx, sp
  ;; (7'7) Tail: loop (g35) @ con_7'7 (g40)
  mov bp, 135
  mov dx, 140
  mov ax, [bp]
  jmp [ax]

L35: ; Continuation
  push cx
  push #L34
  mov cx, sp
  ;; (45'20) Tail: mainloop (g10) @ con_45'20 (g34)
  mov bp, 110
  mov dx, 134
  mov ax, [bp]
  jmp [ax]

L36: ; Continuation
  push cx
  push #L35
  mov cx, sp
  ;; (14'29) Tail: put_chars (g1) @ app_7'10 (arg)
  mov bp, 101
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L37: ; Continuation
  push cx
  push #L36
  mov cx, sp
  ;; (7'10) Tail: app_7'7 (arg) @ lit_0'0 (g33)
  mov bp, dx
  mov dx, 133
  mov ax, [bp]
  jmp [ax]

L38: ; Continuation
  push cx
  push #L37
  mov cx, sp
  ;; (7'7) Tail: loop (g27) @ con_7'7 (g32)
  mov bp, 127
  mov dx, 132
  mov ax, [bp]
  jmp [ax]

L39: ; Continuation
  push cx
  push #L38
  mov cx, sp
  ;; (14'29) Tail: put_chars (g1) @ app_7'10 (arg)
  mov bp, 101
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L40: ; Continuation
  push cx
  push #L39
  mov cx, sp
  ;; (7'10) Tail: app_7'7 (arg) @ lit_0'0 (g9)
  mov bp, dx
  mov dx, 109
  mov ax, [bp]
  jmp [ax]

L41: ; Start
  push #0
  mov 102, sp
  push #L2
  mov 101, sp
  mov ax, #0
  mov 104, ax
  mov ax, #1
  mov 105, ax
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
  mov 106, ax
  mov ax, #1
  mov 107, ax
  push #L6
  mov 103, sp
  push #0
  mov 108, sp
  mov ax, #5
  mov 109, ax
  mov ax, #0
  mov 112, ax
  mov ax, #1
  mov 113, ax
  push #0
  push sp
  push #' '
  push #1
  push sp
  push #'>'
  push #1
  mov ax, sp
  mov 114, ax
  mov ax, #1
  mov 115, ax
  push #L10
  mov 111, sp
  push #0
  mov 116, sp
  mov ax, #2
  mov 117, ax
  push #0
  mov 119, sp
  mov ax, #'\n'
  mov 120, ax
  mov ax, #'\n'
  mov 121, ax
  push #L14
  mov 122, sp
  push #0
  mov 123, sp
  push #L17
  mov 118, sp
  push #0
  mov 124, sp
  mov ax, #'\n'
  mov 125, ax
  push #0
  mov 126, sp
  push #L23
  mov 110, sp
  mov ax, #0
  mov 128, ax
  mov ax, #1
  mov 129, ax
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
  mov 130, ax
  mov ax, #1
  mov 131, ax
  push #L27
  mov 127, sp
  push #0
  mov 132, sp
  mov ax, #4
  mov 133, ax
  push #0
  mov 134, sp
  mov ax, #0
  mov 136, ax
  mov ax, #1
  mov 137, ax
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
  mov 138, ax
  mov ax, #1
  mov 139, ax
  push #L31
  mov 135, sp
  push #0
  mov 140, sp
  mov ax, #6
  mov 141, ax
  push cx
  push #L40
  mov cx, sp
  ;; (7'7) Tail: loop (g3) @ con_7'7 (g8)
  mov bp, 103
  mov dx, 108
  mov ax, [bp]
  jmp [ax]


