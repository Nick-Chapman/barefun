L1: ; Arm: 14'7
  ;; (12'17) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L2: ; Continuation
  ;; (15'33) Tail: app_15'22 (arg) @ xs (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L3: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L1
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  push word [bp+2]
  push word [2]
  push word 1
  mov [6], sp
  push word [4]
  push word cx
  push word L2
  mov cx, sp
  ;; (15'22) Tail: rev_onto (g1) @ con_0'0 (t3)
  mov bp, g1
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L4: ; Function: g1
  push word dx
  push word L3
  mov [2], sp
  ;; (0'0) Return: lam_12'21 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L5: ; Arm: 37'7
  ;; (0'0) Return: con_37'10 (g3)
  mov dx, g3
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L6: ; Continuation
  ;; (38'35) Tail: put_chars (g2) @ xs (f2)
  mov dx, [bp+4]
  mov bp, g2
  mov ax, [bp]
  jmp ax

L7: ; Arm: 30'19
  mov ax, [2]
  call Bare_put_char
  mov [10], ax
  ;; (0'0) Return: prim_0'0 (t5)
  mov dx, [10]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L8: ; Arm: 31'22
  mov ax, [2]
  call Bare_put_char
  mov [12], ax
  ;; (0'0) Return: prim_0'0 (t6)
  mov dx, [12]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L9: ; Arm: 32'16
  mov ax, [2]
  call Bare_put_char
  mov [14], ax
  ;; (0'0) Return: prim_0'0 (t7)
  mov dx, [14]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L10: ; Function: g2
  mov bx, dx
  cmp word [bx], 0
  jz L5
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov ax, [2]
  call Bare_char_to_num
  mov [6], ax
  mov ax, [6]
  cmp word ax, 8
  call Bare_make_bool_from_z
  mov [8], ax
  push word [4]
  push word cx
  push word L6
  mov cx, sp
  mov bx, [8]
  cmp word [bx], 1
  jz L7
  mov ax, [2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [10], ax
  mov bx, [10]
  cmp word [bx], 1
  jz L8
  mov ax, 26
  cmp word ax, [6]
  call Bare_make_bool_from_n
  mov [12], ax
  mov bx, [12]
  cmp word [bx], 1
  jz L9
  mov ax, '^'
  call Bare_put_char
  mov [14], ax
  mov ax, 65
  add ax, [6]
  mov [16], ax
  mov ax, [16]
  sub ax, 1
  mov [18], ax
  mov ax, [18]
  call Bare_num_to_char
  mov [20], ax
  mov ax, [20]
  call Bare_put_char
  mov [22], ax
  ;; (0'0) Return: prim_0'0 (t11)
  mov dx, [22]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L11: ; Arm: 21'13
  ;; (20'23) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L12: ; Continuation
  mov ax, [bp+4]
  sub ax, 1
  mov [2], ax
  ;; (22'45) Tail: app_22'19 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L13: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L11
  mov ax, g6
  mov bx, dx
  call Bare_get_bytes
  mov [4], ax
  push word [bp+2]
  push word [4]
  push word 1
  mov [6], sp
  push word dx
  push word cx
  push word L12
  mov cx, sp
  ;; (22'19) Tail: explode_loop (g5) @ con_0'0 (t3)
  mov bp, g5
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L14: ; Function: g5
  push word dx
  push word L13
  mov [2], sp
  ;; (0'0) Return: lam_20'27 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L15: ; Continuation
  ;; (17'25) Tail: app_17'22 (arg) @ acc (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L16: ; Arm: 56'22
  mov ax, `\n`
  call Bare_put_char
  mov [8], ax
  push word dx
  push word cx
  push word L15
  mov cx, sp
  ;; (17'22) Tail: rev_onto (g1) @ con_17'22 (g10)
  mov bp, g1
  mov dx, g10
  mov ax, [bp]
  jmp ax

L17: ; Continuation
  push word [bp+4]
  push word 4
  push word 1
  mov [2], sp
  ;; (17'25) Tail: app_17'22 (arg) @ con_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L18: ; Arm: 57'28
  mov ax, '^'
  call Bare_put_char
  mov [10], ax
  mov ax, 'D'
  call Bare_put_char
  mov [12], ax
  mov ax, `\n`
  call Bare_put_char
  mov [14], ax
  push word dx
  push word cx
  push word L17
  mov cx, sp
  ;; (17'22) Tail: rev_onto (g1) @ con_17'22 (g11)
  mov bp, g1
  mov dx, g11
  mov ax, [bp]
  jmp ax

L19: ; Arm: 58'19
  ;; (58'33) Tail: readloop (g8) @ acc (arg)
  mov bp, g8
  mov dx, dx
  mov ax, [bp]
  jmp ax

L20: ; Arm: 61'17
  ;; (61'29) Tail: readloop (g8) @ acc (arg)
  mov bp, g8
  mov dx, dx
  mov ax, [bp]
  jmp ax

L21: ; Continuation
  mov ax, 8
  call Bare_put_char
  mov [2], ax
  mov ax, ' '
  call Bare_put_char
  mov [4], ax
  mov ax, 8
  call Bare_put_char
  mov [6], ax
  ;; (65'24) Tail: readloop (g8) @ tail (f2)
  mov dx, [bp+4]
  mov bp, g8
  mov ax, [bp]
  jmp ax

L22: ; Arm: 63'31
  mov ax, 8
  call Bare_put_char
  mov [2], ax
  mov ax, ' '
  call Bare_put_char
  mov [4], ax
  mov ax, 8
  call Bare_put_char
  mov [6], ax
  ;; (0'0) Return: prim_0'0 (t3)
  mov dx, [6]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L23: ; Continuation
  push word [bp+4]
  push word cx
  push word L21
  mov cx, sp
  mov bx, dx
  cmp word [bx], 1
  jz L22
  ;; (0'0) Return: con_63'55 (g14)
  mov dx, g14
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L24: ; Arm: 6'9
  ;; (0'0) Return: con_6'12 (g12)
  mov dx, g12
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L25: ; Arm: 59'21
  mov bx, dx
  cmp word [bx], 0
  jz L20
  mov ax, [bx+2]
  mov [14], ax
  mov ax, [bx+4]
  mov [16], ax
  mov ax, [14]
  call Bare_char_to_num
  mov [18], ax
  mov ax, 26
  cmp word ax, [18]
  call Bare_make_bool_from_n
  mov [20], ax
  push word [16]
  push word cx
  push word L23
  mov cx, sp
  mov bx, [20]
  cmp word [bx], 1
  jz L24
  ;; (0'0) Return: con_7'13 (g13)
  mov dx, g13
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L26: ; Continuation
  push word [bp+4]
  push word [bp+6]
  push word 1
  mov [2], sp
  ;; (67'34) Tail: readloop (g8) @ con_0'0 (t1)
  mov bp, g8
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L27: ; Arm: 30'19
  mov ax, [2]
  call Bare_put_char
  mov [18], ax
  ;; (0'0) Return: prim_0'0 (t9)
  mov dx, [18]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L28: ; Arm: 31'22
  mov ax, [2]
  call Bare_put_char
  mov [20], ax
  ;; (0'0) Return: prim_0'0 (t10)
  mov dx, [20]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L29: ; Arm: 32'16
  mov ax, [2]
  call Bare_put_char
  mov [22], ax
  ;; (0'0) Return: prim_0'0 (t11)
  mov dx, [22]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L30: ; Function: g8
  call Bare_get_char
  mov [2], ax
  mov ax, [2]
  call Bare_char_to_num
  mov [4], ax
  mov ax, [2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [6], ax
  mov bx, [6]
  cmp word [bx], 1
  jz L16
  mov ax, [2]
  cmp word ax, 4
  call Bare_make_bool_from_z
  mov [8], ax
  mov bx, [8]
  cmp word [bx], 1
  jz L18
  mov ax, 127
  cmp word ax, [4]
  call Bare_make_bool_from_n
  mov [10], ax
  mov bx, [10]
  cmp word [bx], 1
  jz L19
  mov ax, [4]
  cmp word ax, 127
  call Bare_make_bool_from_z
  mov [12], ax
  mov bx, [12]
  cmp word [bx], 1
  jz L25
  mov ax, [2]
  call Bare_char_to_num
  mov [14], ax
  mov ax, [14]
  cmp word ax, 8
  call Bare_make_bool_from_z
  mov [16], ax
  push word [2]
  push word dx
  push word cx
  push word L26
  mov cx, sp
  mov bx, [16]
  cmp word [bx], 1
  jz L27
  mov ax, [2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [18], ax
  mov bx, [18]
  cmp word [bx], 1
  jz L28
  mov ax, 26
  cmp word ax, [14]
  call Bare_make_bool_from_n
  mov [20], ax
  mov bx, [20]
  cmp word [bx], 1
  jz L29
  mov ax, '^'
  call Bare_put_char
  mov [22], ax
  mov ax, 65
  add ax, [14]
  mov [24], ax
  mov ax, [24]
  sub ax, 1
  mov [26], ax
  mov ax, [26]
  call Bare_num_to_char
  mov [28], ax
  mov ax, [28]
  call Bare_put_char
  mov [30], ax
  ;; (0'0) Return: prim_0'0 (t15)
  mov dx, [30]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L31: ; Arm: 79'29
  ;; (0'0) Return: con_79'34 (g17)
  mov dx, g17
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L32: ; Continuation
  mov ax, `\n`
  call Bare_put_char
  mov [2], ax
  ;; (80'40) Tail: mainloop (g4) @ con_80'40 (g18)
  mov bp, g4
  mov dx, g18
  mov ax, [bp]
  jmp ax

L33: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L31
  push word cx
  push word L32
  mov cx, sp
  ;; (80'15) Tail: put_chars (g2) @ line (f2)
  mov dx, [bp+4]
  mov bp, g2
  mov ax, [bp]
  jmp ax

L34: ; Arm: 73'7
  ;; (0'0) Return: con_73'10 (g16)
  mov dx, g16
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L35: ; Continuation
  push word dx
  push word cx
  push word L33
  mov cx, sp
  mov bx, dx
  cmp word [bx], 0
  jz L34
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov ax, [2]
  cmp word ax, 4
  call Bare_make_bool_from_z
  mov [6], ax
  ;; (0'0) Return: prim_0'0 (t3)
  mov dx, [6]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L36: ; Continuation
  push word cx
  push word L35
  mov cx, sp
  ;; (69'11) Tail: readloop (g8) @ con_69'11 (g15)
  mov bp, g8
  mov dx, g15
  mov ax, [bp]
  jmp ax

L37: ; Continuation
  push word cx
  push word L36
  mov cx, sp
  ;; (40'29) Tail: put_chars (g2) @ app_24'18 (arg)
  mov bp, g2
  mov dx, dx
  mov ax, [bp]
  jmp ax

L38: ; Continuation
  push word cx
  push word L37
  mov cx, sp
  ;; (24'18) Tail: app_24'15 (arg) @ 1
  mov bp, dx
  mov dx, 1
  mov ax, [bp]
  jmp ax

L39: ; Function: g4
  push word cx
  push word L38
  mov cx, sp
  ;; (24'15) Tail: explode_loop (g5) @ con_24'15 (g7)
  mov bp, g5
  mov dx, g7
  mov ax, [bp]
  jmp ax

L40: ; Arm: 21'13
  ;; (20'23) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L41: ; Continuation
  mov ax, [bp+4]
  sub ax, 1
  mov [2], ax
  ;; (22'45) Tail: app_22'19 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L42: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L40
  mov ax, g20
  mov bx, dx
  call Bare_get_bytes
  mov [4], ax
  push word [bp+2]
  push word [4]
  push word 1
  mov [6], sp
  push word dx
  push word cx
  push word L41
  mov cx, sp
  ;; (22'19) Tail: explode_loop (g19) @ con_0'0 (t3)
  mov bp, g19
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L43: ; Function: g19
  push word dx
  push word L42
  mov [2], sp
  ;; (0'0) Return: lam_20'27 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L44: ; Continuation
  ;; (84'11) Tail: mainloop (g4) @ con_84'11 (g22)
  mov bp, g4
  mov dx, g22
  mov ax, [bp]
  jmp ax

L45: ; Continuation
  push word cx
  push word L44
  mov cx, sp
  ;; (40'29) Tail: put_chars (g2) @ app_24'18 (arg)
  mov bp, g2
  mov dx, dx
  mov ax, [bp]
  jmp ax

L46: ; Continuation
  push word cx
  push word L45
  mov cx, sp
  ;; (24'18) Tail: app_24'15 (arg) @ 44
  mov bp, dx
  mov dx, 44
  mov ax, [bp]
  jmp ax

L47: ; Start
  push word cx
  push word L46
  mov cx, sp
  ;; (24'15) Tail: explode_loop (g19) @ con_24'15 (g21)
  mov bp, g19
  mov dx, g21
  mov ax, [bp]
  jmp ax

g1: dw L4
g2: dw L10
g3: dw 0
g4: dw L39
g5: dw L14
g6: dw 2, '%', ' '
g7: dw 0
g8: dw L30
g9: dw 0
g10: dw 0
g11: dw 0
g12: dw 0
g13: dw 1
g14: dw 0
g15: dw 0
g16: dw 0
g17: dw 0
g18: dw 0
g19: dw L43
g20: dw 45, 'R', 'e', 'a', 'd', 'l', 'i', 'n', 'e', ':', ' ', 'e', 'd', 'i', 't', ' ', 'w', 'i', 't', 'h', ' ', 'b', 'a', 'c', 'k', 's', 'p', 'a', 'c', 'e', ';', ' ', 'e', 'x', 'i', 't', ' ', 'w', 'i', 't', 'h', ' ', '^', 'D', '.', `\n`
g21: dw 0
g22: dw 0

bare_start: jmp L47
