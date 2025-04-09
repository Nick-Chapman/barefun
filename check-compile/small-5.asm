(*Stage5 (ASM)*)
L1: ; Arm: 4'7
  ;; (0'0) Return: con_4'10 (g2)
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
  ;; (5'39) Tail: put_chars (g1) @ xsMore (t2)
  mov bp, 101
  mov dx, 202
  mov ax, [bp]
  jmp [ax]

L3: ; Arm: 12'9
  ;; (10'18) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L4: ; Continuation
  ;; (13'38) Tail: app_13'27 (arg) @ ysMore (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L5: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L3
  mov ax, [bx+1]
  mov 201, ax
  mov ax, [bx+2]
  mov 202, ax
  push [bp+1]
  push 201
  push #1
  mov 203, sp
  push 202
  push cx
  push #L4
  mov cx, sp
  ;; (13'27) Tail: revloop (g24) @ con_0'0 (t3)
  mov bp, 124
  mov dx, 203
  mov ax, [bp]
  jmp [ax]

L6: ; Function: g24
  push dx
  push #L5
  mov 201, sp
  ;; (0'0) Return: lam_10'22 (t1)
  mov dx, 201
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L7: ; Continuation
  ;; (15'13) Tail: app_15'10 (arg) @ sofar (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L8: ; Arm: 23'27
  mov ax, 123
  call bios_put_char
  mov 203, ax
  push dx
  push cx
  push #L7
  mov cx, sp
  ;; (15'10) Tail: revloop (g24) @ con_15'10 (g25)
  mov bp, 124
  mov dx, 125
  mov ax, [bp]
  jmp [ax]

L9: ; Function: g20
  call bios_get_char
  mov 201, ax
  mov ax, 201
  cmp ax, 122
  call bios_make_bool_from_z
  mov 202, ax
  mov bx, 202
  cmp [bx], #1
  bz L8
  mov ax, 201
  call bios_put_char
  mov 203, ax
  push dx
  push 201
  push #1
  mov 204, sp
  ;; (24'33) Tail: readloop (g20) @ con_0'0 (t4)
  mov bp, 120
  mov dx, 204
  mov ax, [bp]
  jmp [ax]

L10: ; Continuation
  mov ax, 127
  call bios_put_char
  mov 201, ax
  ;; (34'10) Tail: mainloop (g14) @ con_34'10 (g28)
  mov bp, 114
  mov dx, 128
  mov ax, [bp]
  jmp [ax]

L11: ; Continuation
  push cx
  push #L10
  mov cx, sp
  ;; (32'12) Tail: put_chars (g1) @ app_26'11 (arg)
  mov bp, 101
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L12: ; Continuation
  push cx
  push #L11
  mov cx, sp
  ;; (26'11) Tail: readloop (g20) @ con_26'11 (g26)
  mov bp, 120
  mov dx, 126
  mov ax, [bp]
  jmp [ax]

L13: ; Function: g14
  push cx
  push #L12
  mov cx, sp
  ;; (7'29) Tail: put_chars (g1) @ con_0'0 (g19)
  mov bp, 101
  mov dx, 119
  mov ax, [bp]
  jmp [ax]

L14: ; Continuation
  ;; (7'29) Tail: put_chars (g1) @ con_0'0 (g51)
  mov bp, 101
  mov dx, 151
  mov ax, [bp]
  jmp [ax]

L15: ; Continuation
  push cx
  push #L14
  mov cx, sp
  ;; (38'20) Tail: mainloop (g14) @ con_38'20 (g38)
  mov bp, 114
  mov dx, 138
  mov ax, [bp]
  jmp [ax]

L16: ; Continuation
  push cx
  push #L15
  mov cx, sp
  ;; (7'29) Tail: put_chars (g1) @ con_0'0 (g37)
  mov bp, 101
  mov dx, 137
  mov ax, [bp]
  jmp [ax]

L17: ; Start
  push #0
  mov 102, sp
  push #L2
  mov 101, sp
  mov ax, #'L'
  mov 103, ax
  mov ax, #'O'
  mov 104, ax
  mov ax, #'A'
  mov 105, ax
  mov ax, #'D'
  mov 106, ax
  mov ax, #'\n'
  mov 107, ax
  push #0
  mov 108, sp
  push 108
  push 107
  push #1
  mov 109, sp
  push 109
  push 106
  push #1
  mov 110, sp
  push 110
  push 105
  push #1
  mov 111, sp
  push 111
  push 104
  push #1
  mov 112, sp
  push 112
  push 103
  push #1
  mov 113, sp
  mov ax, #'>'
  mov 115, ax
  mov ax, #' '
  mov 116, ax
  push #0
  mov 117, sp
  push 117
  push 116
  push #1
  mov 118, sp
  push 118
  push 115
  push #1
  mov 119, sp
  push #0
  mov 121, sp
  mov ax, #'\n'
  mov 122, ax
  mov ax, #'\n'
  mov 123, ax
  push #L6
  mov 124, sp
  push #0
  mov 125, sp
  push #L9
  mov 120, sp
  push #0
  mov 126, sp
  mov ax, #'\n'
  mov 127, ax
  push #0
  mov 128, sp
  push #L13
  mov 114, sp
  mov ax, #'R'
  mov 129, ax
  mov ax, #'U'
  mov 130, ax
  mov ax, #'N'
  mov 131, ax
  mov ax, #'\n'
  mov 132, ax
  push #0
  mov 133, sp
  push 133
  push 132
  push #1
  mov 134, sp
  push 134
  push 131
  push #1
  mov 135, sp
  push 135
  push 130
  push #1
  mov 136, sp
  push 136
  push 129
  push #1
  mov 137, sp
  push #0
  mov 138, sp
  mov ax, #'N'
  mov 139, ax
  mov ax, #'E'
  mov 140, ax
  mov ax, #'V'
  mov 141, ax
  mov ax, #'E'
  mov 142, ax
  mov ax, #'R'
  mov 143, ax
  mov ax, #'\n'
  mov 144, ax
  push #0
  mov 145, sp
  push 145
  push 144
  push #1
  mov 146, sp
  push 146
  push 143
  push #1
  mov 147, sp
  push 147
  push 142
  push #1
  mov 148, sp
  push 148
  push 141
  push #1
  mov 149, sp
  push 149
  push 140
  push #1
  mov 150, sp
  push 150
  push 139
  push #1
  mov 151, sp
  push cx
  push #L16
  mov cx, sp
  ;; (7'29) Tail: put_chars (g1) @ con_0'0 (g13)
  mov bp, 101
  mov dx, 113
  mov ax, [bp]
  jmp [ax]


