L1: ; Function: t1
  ;; (4'54) Tail: f (f1) @ a (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L2: ; Function: g1
  push dx
  push L1
  mov [1], sp
  ;; (0'0) Return: lam_4'31 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L3: ; Arm: 8'7
  ;; (8'10) Return: 0
  mov dx, 0
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L4: ; Continuation
  mov ax, 1
  add ax, dx
  mov [1], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L5: ; Function: g2
  mov bx, dx
  cmp [bx], 0
  bz L3
  mov ax, [bx+1]
  mov [1], ax
  mov ax, [bx+2]
  mov [2], ax
  push cx
  push L4
  mov cx, sp
  ;; (9'27) Tail: length (g2) @ xs (t2)
  mov bp, g2
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L6: ; Arm: 15'7
  ;; (13'18) Return: ys (arg)
  mov dx, dx
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L7: ; Continuation
  push dx
  push [bp+2]
  push 1
  mov [1], sp
  ;; (0'0) Return: con_0'0 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L8: ; Continuation
  push [bp+3]
  push cx
  push L7
  mov cx, sp
  ;; (16'31) Tail: app_16'28 (arg) @ ys (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp ax

L9: ; Function: t1
  mov bx, [bp+1]
  cmp [bx], 0
  bz L6
  mov ax, [bx+1]
  mov [1], ax
  mov ax, [bx+2]
  mov [2], ax
  push [1]
  push dx
  push cx
  push L8
  mov cx, sp
  ;; (16'28) Tail: append (g3) @ xs (t2)
  mov bp, g3
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L10: ; Function: g3
  push dx
  push L9
  mov [1], sp
  ;; (0'0) Return: lam_13'18 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L11: ; Arm: 22'9
  ;; (0'0) Return: con_22'12 (g4)
  mov dx, g4
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L12: ; Continuation
  ;; (23'43) Tail: app_23'37 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp ax

L13: ; Function: t1
  mov bx, dx
  cmp [bx], 0
  bz L11
  mov ax, [bx+1]
  mov [1], ax
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bp+1]
  mov bx, [bp+2]
  mov si, [1]
  call Bare_set_bytes
  mov [3], ax
  mov ax, [bp+2]
  add ax, 1
  mov [4], ax
  push [2]
  push cx
  push L12
  mov cx, sp
  ;; (23'37) Tail: loop (f3) @ prim_0'0 (t4)
  mov bp, [bp+3]
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L14: ; Function: t2
  push bp
  push dx
  push [bp+1]
  push L13
  mov [1], sp
  ;; (0'0) Return: lam_20'17 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L15: ; Continuation
  mov ax, [bp+2]
  call Bare_freeze_bytes
  mov [1], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L16: ; Continuation
  push [bp+3]
  push cx
  push L15
  mov cx, sp
  ;; (25'9) Tail: app_25'7 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp ax

L17: ; Continuation
  mov ax, dx
  call Bare_make_bytes
  mov [1], ax
  push [1]
  push L14
  mov [2], sp
  push [1]
  push [bp+2]
  push cx
  push L16
  mov cx, sp
  ;; (25'7) Tail: loop (t2) @ 0
  mov bp, [2]
  mov dx, 0
  mov ax, [bp]
  jmp ax

L18: ; Function: g5
  push dx
  push cx
  push L17
  mov cx, sp
  ;; (19'29) Tail: length (g2) @ xs (arg)
  mov bp, g2
  mov dx, dx
  mov ax, [bp]
  jmp ax

L19: ; Arm: 32'13
  ;; (31'23) Return: acc (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L20: ; Continuation
  mov ax, [bp+2]
  sub ax, 1
  mov [1], ax
  ;; (33'45) Tail: app_33'19 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [1]
  mov ax, [bp]
  jmp ax

L21: ; Function: t1
  mov ax, dx
  cmp ax, 0
  call Bare_make_bool_from_n
  mov [1], ax
  mov bx, [1]
  cmp [bx], 1
  bz L19
  mov ax, [bp+1]
  mov bx, dx
  call Bare_string_index
  mov [2], ax
  push [bp+2]
  push [2]
  push 1
  mov [3], sp
  push dx
  push cx
  push L20
  mov cx, sp
  ;; (33'19) Tail: explode_loop (f3) @ con_0'0 (t3)
  mov bp, [bp+3]
  mov dx, [3]
  mov ax, [bp]
  jmp ax

L22: ; Function: t1
  push bp
  push dx
  push [bp+1]
  push L21
  mov [1], sp
  ;; (0'0) Return: lam_31'27 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L23: ; Continuation
  mov ax, [bp+2]
  sub ax, 1
  mov [1], ax
  ;; (35'18) Tail: app_35'15 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [1]
  mov ax, [bp]
  jmp ax

L24: ; Function: g7
  push dx
  push L22
  mov [1], sp
  mov ax, dx
  call Bare_string_length
  mov [2], ax
  push [2]
  push cx
  push L23
  mov cx, sp
  ;; (35'15) Tail: explode_loop (t1) @ con_35'15 (g6)
  mov bp, [1]
  mov dx, g6
  mov ax, [bp]
  jmp ax

L25: ; Arm: 86'30
  ;; (0'0) Return: con_86'33 (g9)
  mov dx, g9
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L26: ; Arm: 86'7
  mov bx, dx
  cmp [bx], 0
  bz L25
  mov ax, [bx+1]
  mov [1], ax
  mov ax, [bx+2]
  mov [2], ax
  ;; (0'0) Return: con_86'48 (g10)
  mov dx, g10
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L27: ; Arm: 89'10
  ;; (0'0) Return: con_89'13 (g11)
  mov dx, g11
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L28: ; Continuation
  ;; (91'37) Tail: app_91'34 (arg) @ ys (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp ax

L29: ; Continuation
  push [bp+3]
  push cx
  push L28
  mov cx, sp
  ;; (91'34) Tail: app_91'31 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp ax

L30: ; Arm: 91'18
  push [bp+4]
  push [bp+3]
  push cx
  push L29
  mov cx, sp
  ;; (91'31) Tail: eq_list (g8) @ eq (f2)
  mov dx, [bp+2]
  mov bp, g8
  mov ax, [bp]
  jmp ax

L31: ; Continuation
  mov bx, dx
  cmp [bx], 1
  bz L30
  ;; (0'0) Return: con_91'45 (g12)
  mov dx, g12
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L32: ; Continuation
  push [bp+5]
  push [bp+3]
  push [bp+2]
  push cx
  push L31
  mov cx, sp
  ;; (91'16) Tail: app_91'14 (arg) @ y (f4)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+4]
  mov ax, [bp]
  jmp ax

L33: ; Function: t1
  mov bx, [bp+2]
  cmp [bx], 0
  bz L26
  mov ax, [bx+1]
  mov [1], ax
  mov ax, [bx+2]
  mov [2], ax
  mov bx, dx
  cmp [bx], 0
  bz L27
  mov ax, [bx+1]
  mov [3], ax
  mov ax, [bx+2]
  mov [4], ax
  push [4]
  push [3]
  push [2]
  push [bp+1]
  push cx
  push L32
  mov cx, sp
  ;; (91'14) Tail: eq (f1) @ x (t1)
  mov bp, [bp+1]
  mov dx, [1]
  mov ax, [bp]
  jmp ax

L34: ; Function: t1
  push dx
  push [bp+1]
  push L33
  mov [1], sp
  ;; (0'0) Return: lam_84'22 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L35: ; Function: g8
  push dx
  push L34
  mov [1], sp
  ;; (0'0) Return: lam_84'19 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L36: ; Arm: 99'7
  ;; (97'16) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L37: ; Continuation
  ;; (100'34) Tail: app_100'21 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp ax

L38: ; Function: t1
  mov bx, dx
  cmp [bx], 0
  bz L36
  mov ax, [bx+1]
  mov [1], ax
  mov ax, [bx+2]
  mov [2], ax
  push [bp+1]
  push [1]
  push 1
  mov [3], sp
  push [2]
  push cx
  push L37
  mov cx, sp
  ;; (100'21) Tail: revloop (g13) @ con_0'0 (t3)
  mov bp, g13
  mov dx, [3]
  mov ax, [bp]
  jmp ax

L39: ; Function: g13
  push dx
  push L38
  mov [1], sp
  ;; (0'0) Return: lam_97'20 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L40: ; Arm: 106'7
  ;; (0'0) Return: con_106'10 (g15)
  mov dx, g15
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L41: ; Continuation
  push dx
  push [bp+2]
  push 1
  mov [1], sp
  ;; (0'0) Return: con_0'0 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L42: ; Continuation
  push [bp+3]
  push cx
  push L41
  mov cx, sp
  ;; (107'26) Tail: app_107'24 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp ax

L43: ; Continuation
  push dx
  push [bp+3]
  push cx
  push L42
  mov cx, sp
  ;; (107'24) Tail: map (g14) @ f (f2)
  mov dx, [bp+2]
  mov bp, g14
  mov ax, [bp]
  jmp ax

L44: ; Function: t1
  mov bx, dx
  cmp [bx], 0
  bz L40
  mov ax, [bx+1]
  mov [1], ax
  mov ax, [bx+2]
  mov [2], ax
  push [2]
  push [bp+1]
  push cx
  push L43
  mov cx, sp
  ;; (107'15) Tail: f (f1) @ x (t1)
  mov bp, [bp+1]
  mov dx, [1]
  mov ax, [bp]
  jmp ax

L45: ; Function: g14
  push dx
  push L44
  mov [1], sp
  ;; (0'0) Return: lam_104'14 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L46: ; Arm: 120'7
  ;; (0'0) Return: con_120'10 (g17)
  mov dx, g17
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L47: ; Continuation
  ;; (121'35) Tail: put_chars (g16) @ xs (f2)
  mov dx, [bp+2]
  mov bp, g16
  mov ax, [bp]
  jmp ax

L48: ; Arm: 55'19
  mov ax, [1]
  call Bare_put_char
  mov [5], ax
  ;; (0'0) Return: prim_0'0 (t5)
  mov dx, [5]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L49: ; Arm: 56'22
  mov ax, [1]
  call Bare_put_char
  mov [6], ax
  ;; (0'0) Return: prim_0'0 (t6)
  mov dx, [6]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L50: ; Arm: 57'16
  mov ax, [1]
  call Bare_put_char
  mov [7], ax
  ;; (0'0) Return: prim_0'0 (t7)
  mov dx, [7]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L51: ; Function: g16
  mov bx, dx
  cmp [bx], 0
  bz L46
  mov ax, [bx+1]
  mov [1], ax
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [1]
  call Bare_char_to_num
  mov [3], ax
  mov ax, [3]
  cmp ax, 8
  call Bare_make_bool_from_z
  mov [4], ax
  push [2]
  push cx
  push L47
  mov cx, sp
  mov bx, [4]
  cmp [bx], 1
  bz L48
  mov ax, [1]
  cmp ax, '\n'
  call Bare_make_bool_from_z
  mov [5], ax
  mov bx, [5]
  cmp [bx], 1
  bz L49
  mov ax, 26
  cmp ax, [3]
  call Bare_make_bool_from_n
  mov [6], ax
  mov bx, [6]
  cmp [bx], 1
  bz L50
  mov ax, '^'
  call Bare_put_char
  mov [7], ax
  mov ax, 65
  add ax, [3]
  mov [8], ax
  mov ax, [8]
  sub ax, 1
  mov [9], ax
  mov ax, [9]
  call Bare_num_to_char
  mov [10], ax
  mov ax, [10]
  call Bare_put_char
  mov [11], ax
  ;; (0'0) Return: prim_0'0 (t11)
  mov dx, [11]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L52: ; Continuation
  ;; (102'28) Tail: app_102'25 (arg) @ acc (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp ax

L53: ; Arm: 133'20
  mov ax, '\n'
  call Bare_put_char
  mov [4], ax
  push dx
  push cx
  push L52
  mov cx, sp
  ;; (102'25) Tail: revloop (g13) @ con_102'25 (g20)
  mov bp, g13
  mov dx, g20
  mov ax, [bp]
  jmp ax

L54: ; Continuation
  push [bp+2]
  push '\EOT'
  push 1
  mov [1], sp
  ;; (102'28) Tail: app_102'25 (arg) @ con_0'0 (t1)
  mov bp, dx
  mov dx, [1]
  mov ax, [bp]
  jmp ax

L55: ; Arm: 134'26
  mov ax, '^'
  call Bare_put_char
  mov [5], ax
  mov ax, 'D'
  call Bare_put_char
  mov [6], ax
  mov ax, '\n'
  call Bare_put_char
  mov [7], ax
  push dx
  push cx
  push L54
  mov cx, sp
  ;; (102'25) Tail: revloop (g13) @ con_102'25 (g21)
  mov bp, g13
  mov dx, g21
  mov ax, [bp]
  jmp ax

L56: ; Arm: 135'17
  ;; (135'31) Tail: readloop (g18) @ acc (arg)
  mov bp, g18
  mov dx, dx
  mov ax, [bp]
  jmp ax

L57: ; Arm: 138'15
  ;; (138'27) Tail: readloop (g18) @ acc (arg)
  mov bp, g18
  mov dx, dx
  mov ax, [bp]
  jmp ax

L58: ; Continuation
  mov ax, '\b'
  call Bare_put_char
  mov [1], ax
  mov ax, ' '
  call Bare_put_char
  mov [2], ax
  mov ax, '\b'
  call Bare_put_char
  mov [3], ax
  ;; (142'22) Tail: readloop (g18) @ tail (f2)
  mov dx, [bp+2]
  mov bp, g18
  mov ax, [bp]
  jmp ax

L59: ; Arm: 140'29
  mov ax, '\b'
  call Bare_put_char
  mov [1], ax
  mov ax, ' '
  call Bare_put_char
  mov [2], ax
  mov ax, '\b'
  call Bare_put_char
  mov [3], ax
  ;; (0'0) Return: prim_0'0 (t3)
  mov dx, [3]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L60: ; Continuation
  push [bp+2]
  push cx
  push L58
  mov cx, sp
  mov bx, dx
  cmp [bx], 1
  bz L59
  ;; (0'0) Return: con_140'53 (g24)
  mov dx, g24
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L61: ; Arm: 43'9
  ;; (0'0) Return: con_43'12 (g22)
  mov dx, g22
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L62: ; Arm: 136'19
  mov bx, dx
  cmp [bx], 0
  bz L57
  mov ax, [bx+1]
  mov [7], ax
  mov ax, [bx+2]
  mov [8], ax
  mov ax, [7]
  call Bare_char_to_num
  mov [9], ax
  mov ax, 26
  cmp ax, [9]
  call Bare_make_bool_from_n
  mov [10], ax
  push [8]
  push cx
  push L60
  mov cx, sp
  mov bx, [10]
  cmp [bx], 1
  bz L61
  ;; (0'0) Return: con_44'13 (g23)
  mov dx, g23
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L63: ; Continuation
  push [bp+2]
  push [bp+3]
  push 1
  mov [1], sp
  ;; (144'32) Tail: readloop (g18) @ con_0'0 (t1)
  mov bp, g18
  mov dx, [1]
  mov ax, [bp]
  jmp ax

L64: ; Arm: 55'19
  mov ax, [1]
  call Bare_put_char
  mov [9], ax
  ;; (0'0) Return: prim_0'0 (t9)
  mov dx, [9]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L65: ; Arm: 56'22
  mov ax, [1]
  call Bare_put_char
  mov [10], ax
  ;; (0'0) Return: prim_0'0 (t10)
  mov dx, [10]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L66: ; Arm: 57'16
  mov ax, [1]
  call Bare_put_char
  mov [11], ax
  ;; (0'0) Return: prim_0'0 (t11)
  mov dx, [11]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L67: ; Function: g18
  call Bare_get_char
  mov [1], ax
  mov ax, [1]
  call Bare_char_to_num
  mov [2], ax
  mov ax, [1]
  cmp ax, '\n'
  call Bare_make_bool_from_z
  mov [3], ax
  mov bx, [3]
  cmp [bx], 1
  bz L53
  mov ax, [1]
  cmp ax, '\EOT'
  call Bare_make_bool_from_z
  mov [4], ax
  mov bx, [4]
  cmp [bx], 1
  bz L55
  mov ax, 127
  cmp ax, [2]
  call Bare_make_bool_from_n
  mov [5], ax
  mov bx, [5]
  cmp [bx], 1
  bz L56
  mov ax, [2]
  cmp ax, 127
  call Bare_make_bool_from_z
  mov [6], ax
  mov bx, [6]
  cmp [bx], 1
  bz L62
  mov ax, [1]
  call Bare_char_to_num
  mov [7], ax
  mov ax, [7]
  cmp ax, 8
  call Bare_make_bool_from_z
  mov [8], ax
  push [1]
  push dx
  push cx
  push L63
  mov cx, sp
  mov bx, [8]
  cmp [bx], 1
  bz L64
  mov ax, [1]
  cmp ax, '\n'
  call Bare_make_bool_from_z
  mov [9], ax
  mov bx, [9]
  cmp [bx], 1
  bz L65
  mov ax, 26
  cmp ax, [7]
  call Bare_make_bool_from_n
  mov [10], ax
  mov bx, [10]
  cmp [bx], 1
  bz L66
  mov ax, '^'
  call Bare_put_char
  mov [11], ax
  mov ax, 65
  add ax, [7]
  mov [12], ax
  mov ax, [12]
  sub ax, 1
  mov [13], ax
  mov ax, [13]
  call Bare_num_to_char
  mov [14], ax
  mov ax, [14]
  call Bare_put_char
  mov [15], ax
  ;; (0'0) Return: prim_0'0 (t15)
  mov dx, [15]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L68: ; Arm: 149'11
  ;; (148'12) Return: n (arg)
  mov dx, dx
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L69: ; Continuation
  mov ax, [bp+2]
  add ax, dx
  mov [1], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L70: ; Continuation
  mov ax, [bp+2]
  sub ax, 2
  mov [1], ax
  push dx
  push cx
  push L69
  mov cx, sp
  ;; (149'39) Tail: fib (g25) @ prim_0'0 (t1)
  mov bp, g25
  mov dx, [1]
  mov ax, [bp]
  jmp ax

L71: ; Function: g25
  mov ax, dx
  cmp ax, 2
  call Bare_make_bool_from_n
  mov [1], ax
  mov bx, [1]
  cmp [bx], 1
  bz L68
  mov ax, dx
  sub ax, 1
  mov [2], ax
  push dx
  push cx
  push L70
  mov cx, sp
  ;; (149'27) Tail: fib (g25) @ prim_0'0 (t2)
  mov bp, g25
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L72: ; Continuation
  mov ax, dx
  mul ax, [bp+2]
  mov [1], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L73: ; Arm: 152'12
  mov ax, [bp+2]
  sub ax, 1
  mov [1], ax
  push [bp+2]
  push cx
  push L72
  mov cx, sp
  ;; (152'22) Tail: fact (g26) @ prim_0'0 (t1)
  mov bp, g26
  mov dx, [1]
  mov ax, [bp]
  jmp ax

L74: ; Continuation
  mov bx, dx
  cmp [bx], 1
  bz L73
  ;; (152'37) Return: 1
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L75: ; Arm: 43'9
  ;; (0'0) Return: con_43'12 (g27)
  mov dx, g27
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L76: ; Function: g26
  mov ax, dx
  cmp ax, 2
  call Bare_make_bool_from_n
  mov [1], ax
  push dx
  push cx
  push L74
  mov cx, sp
  mov bx, [1]
  cmp [bx], 1
  bz L75
  ;; (0'0) Return: con_44'13 (g28)
  mov dx, g28
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L77: ; Function: t1
  mov ax, [bp+1]
  cmp ax, dx
  call Bare_make_bool_from_z
  mov [1], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L78: ; Function: g36
  push dx
  push L77
  mov [1], sp
  ;; (0'0) Return: lam_0'0 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L79: ; Function: t1
  mov ax, [bp+1]
  cmp ax, dx
  call Bare_make_bool_from_z
  mov [1], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L80: ; Function: g42
  push dx
  push L79
  mov [1], sp
  ;; (0'0) Return: lam_0'0 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L81: ; Arm: 76'9
  push [bp+1]
  push 0
  mov [1], sp
  ;; (0'0) Return: con_76'12 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L82: ; Arm: 79'15
  ;; (0'0) Return: con_79'18 (g55)
  mov dx, g55
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L83: ; Continuation
  ;; (80'40) Tail: app_80'25 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp ax

L84: ; Continuation
  mov bx, dx
  cmp [bx], 1
  bz L82
  mov ax, [bx+1]
  mov [1], ax
  mov ax, 10
  mul ax, [bp+2]
  mov [2], ax
  mov ax, [2]
  add ax, [1]
  mov [3], ax
  push [bp+3]
  push cx
  push L83
  mov cx, sp
  ;; (80'25) Tail: loop (g48) @ prim_0'0 (t3)
  mov bp, g48
  mov dx, [3]
  mov ax, [bp]
  jmp ax

L85: ; Arm: 71'27
  push [bp+2]
  push 0
  mov [1], sp
  ;; (0'0) Return: con_71'32 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L86: ; Continuation
  mov bx, dx
  cmp [bx], 1
  bz L85
  ;; (0'0) Return: con_71'44 (g53)
  mov dx, g53
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L87: ; Arm: 43'9
  ;; (0'0) Return: con_43'12 (g51)
  mov dx, g51
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L88: ; Arm: 71'12
  mov ax, 9
  cmp ax, [bp+4]
  call Bare_make_bool_from_n
  mov [1], ax
  push [bp+4]
  push cx
  push L86
  mov cx, sp
  mov bx, [1]
  cmp [bx], 1
  bz L87
  ;; (0'0) Return: con_44'13 (g52)
  mov dx, g52
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L89: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push L84
  mov cx, sp
  mov bx, dx
  cmp [bx], 1
  bz L88
  ;; (0'0) Return: con_71'54 (g54)
  mov dx, g54
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L90: ; Arm: 43'9
  ;; (0'0) Return: con_43'12 (g49)
  mov dx, g49
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L91: ; Function: t1
  mov bx, dx
  cmp [bx], 0
  bz L81
  mov ax, [bx+1]
  mov [1], ax
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [1]
  call Bare_char_to_num
  mov [3], ax
  mov ax, [3]
  sub ax, 48
  mov [4], ax
  mov ax, [4]
  cmp ax, 0
  call Bare_make_bool_from_n
  mov [5], ax
  push [4]
  push [2]
  push [bp+1]
  push cx
  push L89
  mov cx, sp
  mov bx, [5]
  cmp [bx], 1
  bz L90
  ;; (0'0) Return: con_44'13 (g50)
  mov dx, g50
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L92: ; Function: g48
  push dx
  push L91
  mov [1], sp
  ;; (0'0) Return: lam_74'19 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L93: ; Arm: 113'13
  ;; (112'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L94: ; Continuation
  mov ax, [bp+2]
  div ax, 10
  mov [1], ax
  ;; (114'45) Tail: app_114'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [1]
  mov ax, [bp]
  jmp ax

L95: ; Function: t1
  mov ax, dx
  cmp ax, 0
  call Bare_make_bool_from_z
  mov [1], ax
  mov bx, [1]
  cmp [bx], 1
  bz L93
  mov ax, dx
  mod ax, 10
  mov [2], ax
  mov ax, 48
  add ax, [2]
  mov [3], ax
  mov ax, [3]
  call Bare_num_to_char
  mov [4], ax
  push [bp+1]
  push [4]
  push 1
  mov [5], sp
  push dx
  push cx
  push L94
  mov cx, sp
  ;; (114'11) Tail: loop (g58) @ con_0'0 (t5)
  mov bp, g58
  mov dx, [5]
  mov ax, [bp]
  jmp ax

L96: ; Function: g58
  push dx
  push L95
  mov [1], sp
  ;; (0'0) Return: lam_112'19 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L97: ; Arm: 113'13
  ;; (112'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L98: ; Continuation
  mov ax, [bp+2]
  div ax, 10
  mov [1], ax
  ;; (114'45) Tail: app_114'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [1]
  mov ax, [bp]
  jmp ax

L99: ; Function: t1
  mov ax, dx
  cmp ax, 0
  call Bare_make_bool_from_z
  mov [1], ax
  mov bx, [1]
  cmp [bx], 1
  bz L97
  mov ax, dx
  mod ax, 10
  mov [2], ax
  mov ax, 48
  add ax, [2]
  mov [3], ax
  mov ax, [3]
  call Bare_num_to_char
  mov [4], ax
  push [bp+1]
  push [4]
  push 1
  mov [5], sp
  push dx
  push cx
  push L98
  mov cx, sp
  ;; (114'11) Tail: loop (g62) @ con_0'0 (t5)
  mov bp, g62
  mov dx, [5]
  mov ax, [bp]
  jmp ax

L100: ; Function: g62
  push dx
  push L99
  mov [1], sp
  ;; (0'0) Return: lam_112'19 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L101: ; Function: t1
  mov ax, [bp+1]
  cmp ax, dx
  call Bare_make_bool_from_z
  mov [1], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L102: ; Function: g66
  push dx
  push L101
  mov [1], sp
  ;; (0'0) Return: lam_0'0 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L103: ; Arm: 76'9
  push [bp+1]
  push 0
  mov [1], sp
  ;; (0'0) Return: con_76'12 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L104: ; Arm: 79'15
  ;; (0'0) Return: con_79'18 (g79)
  mov dx, g79
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L105: ; Continuation
  ;; (80'40) Tail: app_80'25 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp ax

L106: ; Continuation
  mov bx, dx
  cmp [bx], 1
  bz L104
  mov ax, [bx+1]
  mov [1], ax
  mov ax, 10
  mul ax, [bp+2]
  mov [2], ax
  mov ax, [2]
  add ax, [1]
  mov [3], ax
  push [bp+3]
  push cx
  push L105
  mov cx, sp
  ;; (80'25) Tail: loop (g72) @ prim_0'0 (t3)
  mov bp, g72
  mov dx, [3]
  mov ax, [bp]
  jmp ax

L107: ; Arm: 71'27
  push [bp+2]
  push 0
  mov [1], sp
  ;; (0'0) Return: con_71'32 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L108: ; Continuation
  mov bx, dx
  cmp [bx], 1
  bz L107
  ;; (0'0) Return: con_71'44 (g77)
  mov dx, g77
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L109: ; Arm: 43'9
  ;; (0'0) Return: con_43'12 (g75)
  mov dx, g75
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L110: ; Arm: 71'12
  mov ax, 9
  cmp ax, [bp+4]
  call Bare_make_bool_from_n
  mov [1], ax
  push [bp+4]
  push cx
  push L108
  mov cx, sp
  mov bx, [1]
  cmp [bx], 1
  bz L109
  ;; (0'0) Return: con_44'13 (g76)
  mov dx, g76
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L111: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push L106
  mov cx, sp
  mov bx, dx
  cmp [bx], 1
  bz L110
  ;; (0'0) Return: con_71'54 (g78)
  mov dx, g78
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L112: ; Arm: 43'9
  ;; (0'0) Return: con_43'12 (g73)
  mov dx, g73
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L113: ; Function: t1
  mov bx, dx
  cmp [bx], 0
  bz L103
  mov ax, [bx+1]
  mov [1], ax
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [1]
  call Bare_char_to_num
  mov [3], ax
  mov ax, [3]
  sub ax, 48
  mov [4], ax
  mov ax, [4]
  cmp ax, 0
  call Bare_make_bool_from_n
  mov [5], ax
  push [4]
  push [2]
  push [bp+1]
  push cx
  push L111
  mov cx, sp
  mov bx, [5]
  cmp [bx], 1
  bz L112
  ;; (0'0) Return: con_44'13 (g74)
  mov dx, g74
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L114: ; Function: g72
  push dx
  push L113
  mov [1], sp
  ;; (0'0) Return: lam_74'19 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L115: ; Arm: 113'13
  ;; (112'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L116: ; Continuation
  mov ax, [bp+2]
  div ax, 10
  mov [1], ax
  ;; (114'45) Tail: app_114'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [1]
  mov ax, [bp]
  jmp ax

L117: ; Function: t1
  mov ax, dx
  cmp ax, 0
  call Bare_make_bool_from_z
  mov [1], ax
  mov bx, [1]
  cmp [bx], 1
  bz L115
  mov ax, dx
  mod ax, 10
  mov [2], ax
  mov ax, 48
  add ax, [2]
  mov [3], ax
  mov ax, [3]
  call Bare_num_to_char
  mov [4], ax
  push [bp+1]
  push [4]
  push 1
  mov [5], sp
  push dx
  push cx
  push L116
  mov cx, sp
  ;; (114'11) Tail: loop (g82) @ con_0'0 (t5)
  mov bp, g82
  mov dx, [5]
  mov ax, [bp]
  jmp ax

L118: ; Function: g82
  push dx
  push L117
  mov [1], sp
  ;; (0'0) Return: lam_112'19 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L119: ; Arm: 113'13
  ;; (112'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L120: ; Continuation
  mov ax, [bp+2]
  div ax, 10
  mov [1], ax
  ;; (114'45) Tail: app_114'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [1]
  mov ax, [bp]
  jmp ax

L121: ; Function: t1
  mov ax, dx
  cmp ax, 0
  call Bare_make_bool_from_z
  mov [1], ax
  mov bx, [1]
  cmp [bx], 1
  bz L119
  mov ax, dx
  mod ax, 10
  mov [2], ax
  mov ax, 48
  add ax, [2]
  mov [3], ax
  mov ax, [3]
  call Bare_num_to_char
  mov [4], ax
  push [bp+1]
  push [4]
  push 1
  mov [5], sp
  push dx
  push cx
  push L120
  mov cx, sp
  ;; (114'11) Tail: loop (g86) @ con_0'0 (t5)
  mov bp, g86
  mov dx, [5]
  mov ax, [bp]
  jmp ax

L122: ; Function: g86
  push dx
  push L121
  mov [1], sp
  ;; (0'0) Return: lam_112'19 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L123: ; Function: t1
  mov ax, [bp+1]
  cmp ax, dx
  call Bare_make_bool_from_z
  mov [1], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L124: ; Function: g90
  push dx
  push L123
  mov [1], sp
  ;; (0'0) Return: lam_0'0 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L125: ; Function: t1
  mov ax, [bp+1]
  cmp ax, dx
  call Bare_make_bool_from_z
  mov [1], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L126: ; Function: g95
  push dx
  push L125
  mov [1], sp
  ;; (0'0) Return: lam_0'0 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L127: ; Arm: 211'52
  ;; (211'57) Return: '*'
  mov dx, '*'
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L128: ; Function: g100
  mov ax, dx
  cmp ax, 'o'
  call Bare_make_bool_from_z
  mov [1], ax
  mov bx, [1]
  cmp [bx], 1
  bz L127
  ;; (211'30) Return: c (arg)
  mov dx, dx
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L129: ; Arm: 113'13
  ;; (112'15) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L130: ; Continuation
  mov ax, [bp+2]
  div ax, 10
  mov [1], ax
  ;; (114'45) Tail: app_114'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [1]
  mov ax, [bp]
  jmp ax

L131: ; Function: t1
  mov ax, dx
  cmp ax, 0
  call Bare_make_bool_from_z
  mov [1], ax
  mov bx, [1]
  cmp [bx], 1
  bz L129
  mov ax, dx
  mod ax, 10
  mov [2], ax
  mov ax, 48
  add ax, [2]
  mov [3], ax
  mov ax, [3]
  call Bare_num_to_char
  mov [4], ax
  push [bp+1]
  push [4]
  push 1
  mov [5], sp
  push dx
  push cx
  push L130
  mov cx, sp
  ;; (114'11) Tail: loop (g103) @ con_0'0 (t5)
  mov bp, g103
  mov dx, [5]
  mov ax, [bp]
  jmp ax

L132: ; Function: g103
  push dx
  push L131
  mov [1], sp
  ;; (0'0) Return: lam_112'19 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L133: ; Continuation
  push [bp+2]
  push [bp+3]
  push 1
  mov [1], sp
  ;; (102'28) Tail: app_102'25 (arg) @ con_0'0 (t1)
  mov bp, dx
  mov dx, [1]
  mov ax, [bp]
  jmp ax

L134: ; Continuation
  push dx
  push [bp+2]
  push cx
  push L133
  mov cx, sp
  ;; (102'25) Tail: revloop (g13) @ con_102'25 (g31)
  mov bp, g13
  mov dx, g31
  mov ax, [bp]
  jmp ax

L135: ; Continuation
  push [bp+3]
  push cx
  push L134
  mov cx, sp
  ;; (221'27) Tail: implode (f2) @ app_102'28 (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L136: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push L135
  mov cx, sp
  ;; (102'28) Tail: app_102'25 (arg) @ accCs (f4)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+4]
  mov ax, [bp]
  jmp ax

L137: ; Arm: 221'7
  push [bp+4]
  push [bp+2]
  push [bp+1]
  push cx
  push L136
  mov cx, sp
  ;; (102'25) Tail: revloop (g13) @ con_102'25 (g30)
  mov bp, g13
  mov dx, g30
  mov ax, [bp]
  jmp ax

L138: ; Continuation
  ;; (223'75) Tail: app_223'72 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp ax

L139: ; Continuation
  push [bp+2]
  push cx
  push L138
  mov cx, sp
  ;; (223'72) Tail: app_223'37 (arg) @ con_223'72 (g33)
  mov bp, dx
  mov dx, g33
  mov ax, [bp]
  jmp ax

L140: ; Continuation
  push [bp+2]
  push dx
  push 1
  mov [1], sp
  push [bp+4]
  push cx
  push L139
  mov cx, sp
  ;; (223'37) Tail: splitloop (f3) @ con_0'0 (t1)
  mov bp, [bp+3]
  mov dx, [1]
  mov ax, [bp]
  jmp ax

L141: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push cx
  push L140
  mov cx, sp
  ;; (223'46) Tail: implode (f2) @ app_102'28 (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L142: ; Continuation
  push [bp+6]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push L141
  mov cx, sp
  ;; (102'28) Tail: app_102'25 (arg) @ accCs (f5)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+5]
  mov ax, [bp]
  jmp ax

L143: ; Arm: 223'22
  push [2]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push cx
  push L142
  mov cx, sp
  ;; (102'25) Tail: revloop (g13) @ con_102'25 (g32)
  mov bp, g13
  mov dx, g32
  mov ax, [bp]
  jmp ax

L144: ; Continuation
  ;; (224'37) Tail: app_224'26 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp ax

L145: ; Continuation
  push [bp+2]
  push [bp+3]
  push 1
  mov [1], sp
  push [bp+4]
  push cx
  push L144
  mov cx, sp
  ;; (224'26) Tail: app_224'20 (arg) @ con_0'0 (t1)
  mov bp, dx
  mov dx, [1]
  mov ax, [bp]
  jmp ax

L146: ; Function: t1
  mov bx, dx
  cmp [bx], 0
  bz L137
  mov ax, [bx+1]
  mov [1], ax
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [1]
  cmp ax, ' '
  call Bare_make_bool_from_z
  mov [3], ax
  mov bx, [3]
  cmp [bx], 1
  bz L143
  push [2]
  push [1]
  push [bp+4]
  push cx
  push L145
  mov cx, sp
  ;; (224'20) Tail: splitloop (f3) @ accWs (f2)
  mov dx, [bp+2]
  mov bp, [bp+3]
  mov ax, [bp]
  jmp ax

L147: ; Function: t1
  push dx
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push L146
  mov [1], sp
  ;; (0'0) Return: lam_219'30 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L148: ; Function: t1
  push bp
  push dx
  push [bp+1]
  push L147
  mov [1], sp
  ;; (0'0) Return: lam_219'24 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L149: ; Arm: 242'36
  ;; (0'0) Return: con_242'41 (g37)
  mov dx, g37
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L150: ; Continuation
  ;; (243'28) Tail: mainloop (f2) @ con_243'28 (g107)
  mov bp, [bp+2]
  mov dx, g107
  mov ax, [bp]
  jmp ax

L151: ; Arm: 232'7
  ;; (0'0) Return: con_232'10 (g40)
  mov dx, g40
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L152: ; Continuation
  mov ax, '\n'
  call Bare_put_char
  mov [1], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L153: ; Continuation
  push cx
  push L152
  mov cx, sp
  ;; (123'29) Tail: put_chars (g16) @ app_123'38 (arg)
  mov bp, g16
  mov dx, dx
  mov ax, [bp]
  jmp ax

L154: ; Continuation
  push cx
  push L153
  mov cx, sp
  ;; (123'38) Tail: explode (f2) @ lit_159'16 (g45)
  mov bp, [bp+2]
  mov dx, g45
  mov ax, [bp]
  jmp ax

L155: ; Continuation
  push [bp+2]
  push cx
  push L154
  mov cx, sp
  ;; (123'29) Tail: put_chars (g16) @ app_123'38 (arg)
  mov bp, g16
  mov dx, dx
  mov ax, [bp]
  jmp ax

L156: ; Arm: 159'7
  push [bp+2]
  push cx
  push L155
  mov cx, sp
  ;; (123'38) Tail: explode (f2) @ lit_154'25 (g44)
  mov bp, [bp+2]
  mov dx, g44
  mov ax, [bp]
  jmp ax

L157: ; Continuation
  mov ax, '\n'
  call Bare_put_char
  mov [1], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L158: ; Continuation
  push cx
  push L157
  mov cx, sp
  ;; (123'29) Tail: put_chars (g16) @ app_123'38 (arg)
  mov bp, g16
  mov dx, dx
  mov ax, [bp]
  jmp ax

L159: ; Continuation
  push cx
  push L158
  mov cx, sp
  ;; (123'38) Tail: explode (f2) @ lit_162'21 (g47)
  mov bp, [bp+2]
  mov dx, g47
  mov ax, [bp]
  jmp ax

L160: ; Continuation
  push [bp+2]
  push cx
  push L159
  mov cx, sp
  ;; (123'29) Tail: put_chars (g16) @ app_123'38 (arg)
  mov bp, g16
  mov dx, dx
  mov ax, [bp]
  jmp ax

L161: ; Arm: 162'12
  mov ax, [bx+1]
  mov [3], ax
  mov ax, [bx+2]
  mov [4], ax
  push [bp+2]
  push cx
  push L160
  mov cx, sp
  ;; (123'38) Tail: explode (f2) @ lit_154'25 (g46)
  mov bp, [bp+2]
  mov dx, g46
  mov ax, [bp]
  jmp ax

L162: ; Continuation
  mov ax, '\n'
  call Bare_put_char
  mov [1], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L163: ; Continuation
  push cx
  push L162
  mov cx, sp
  ;; (123'29) Tail: put_chars (g16) @ app_123'38 (arg)
  mov bp, g16
  mov dx, dx
  mov ax, [bp]
  jmp ax

L164: ; Continuation
  push cx
  push L163
  mov cx, sp
  ;; (123'38) Tail: explode (f2) @ lit_165'24 (g57)
  mov bp, [bp+2]
  mov dx, g57
  mov ax, [bp]
  jmp ax

L165: ; Continuation
  push [bp+2]
  push cx
  push L164
  mov cx, sp
  ;; (123'29) Tail: put_chars (g16) @ app_123'38 (arg)
  mov bp, g16
  mov dx, dx
  mov ax, [bp]
  jmp ax

L166: ; Arm: 165'15
  push [bp+2]
  push cx
  push L165
  mov cx, sp
  ;; (123'38) Tail: explode (f2) @ lit_154'25 (g56)
  mov bp, [bp+2]
  mov dx, g56
  mov ax, [bp]
  jmp ax

L167: ; Continuation
  mov ax, '\n'
  call Bare_put_char
  mov [1], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L168: ; Continuation
  push cx
  push L167
  mov cx, sp
  ;; (125'26) Tail: put_chars (g16) @ case_116'2 (arg)
  mov bp, g16
  mov dx, dx
  mov ax, [bp]
  jmp ax

L169: ; Arm: 116'11
  push g63
  push '0'
  push 1
  mov [2], sp
  ;; (0'0) Return: con_0'0 (t2)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L170: ; Continuation
  ;; (116'41) Tail: app_116'38 (arg) @ res (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp ax

L171: ; Continuation
  mov ax, [bp+2]
  cmp ax, 0
  call Bare_make_bool_from_z
  mov [1], ax
  push cx
  push L168
  mov cx, sp
  mov bx, [1]
  cmp [bx], 1
  bz L169
  push [bp+2]
  push cx
  push L170
  mov cx, sp
  ;; (116'38) Tail: loop (g62) @ con_116'38 (g64)
  mov bp, g62
  mov dx, g64
  mov ax, [bp]
  jmp ax

L172: ; Continuation
  push [bp+2]
  push cx
  push L171
  mov cx, sp
  ;; (123'29) Tail: put_chars (g16) @ app_123'38 (arg)
  mov bp, g16
  mov dx, dx
  mov ax, [bp]
  jmp ax

L173: ; Continuation
  push [bp+3]
  push cx
  push L172
  mov cx, sp
  ;; (123'38) Tail: explode (f2) @ lit_169'22 (g61)
  mov bp, [bp+2]
  mov dx, g61
  mov ax, [bp]
  jmp ax

L174: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push L173
  mov cx, sp
  ;; (125'26) Tail: put_chars (g16) @ case_116'2 (arg)
  mov bp, g16
  mov dx, dx
  mov ax, [bp]
  jmp ax

L175: ; Arm: 116'11
  push g59
  push '0'
  push 1
  mov [2], sp
  ;; (0'0) Return: con_0'0 (t2)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L176: ; Continuation
  ;; (116'41) Tail: app_116'38 (arg) @ n (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp ax

L177: ; Continuation
  mov ax, [bp+3]
  cmp ax, 0
  call Bare_make_bool_from_z
  mov [1], ax
  push dx
  push [bp+2]
  push cx
  push L174
  mov cx, sp
  mov bx, [1]
  cmp [bx], 1
  bz L175
  push [bp+3]
  push cx
  push L176
  mov cx, sp
  ;; (116'38) Tail: loop (g58) @ con_116'38 (g60)
  mov bp, g58
  mov dx, g60
  mov ax, [bp]
  jmp ax

L178: ; Continuation
  mov bx, dx
  cmp [bx], 1
  bz L166
  mov ax, [bx+1]
  mov [1], ax
  push [1]
  push [bp+2]
  push cx
  push L177
  mov cx, sp
  ;; (167'25) Tail: fib (g25) @ n (t1)
  mov bp, g25
  mov dx, [1]
  mov ax, [bp]
  jmp ax

L179: ; Continuation
  push [bp+2]
  push cx
  push L178
  mov cx, sp
  ;; (82'9) Tail: app_82'7 (arg) @ s (f3)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+3]
  mov ax, [bp]
  jmp ax

L180: ; Continuation
  push dx
  push [bp+2]
  push cx
  push L179
  mov cx, sp
  ;; (82'7) Tail: loop (g48) @ 0
  mov bp, g48
  mov dx, 0
  mov ax, [bp]
  jmp ax

L181: ; Continuation
  mov bx, [bp+3]
  cmp [bx], 0
  bz L156
  mov ax, [bx+1]
  mov [1], ax
  mov ax, [bx+2]
  mov [2], ax
  mov bx, [2]
  cmp [bx], 1
  bz L161
  push [bp+2]
  push cx
  push L180
  mov cx, sp
  ;; (164'33) Tail: explode (f2) @ arg1 (t1)
  mov bp, [bp+2]
  mov dx, [1]
  mov ax, [bp]
  jmp ax

L182: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push L181
  mov cx, sp
  ;; (123'29) Tail: put_chars (g16) @ app_123'38 (arg)
  mov bp, g16
  mov dx, dx
  mov ax, [bp]
  jmp ax

L183: ; Arm: 234'32
  push [bp+7]
  push [bp+3]
  push cx
  push L182
  mov cx, sp
  ;; (123'38) Tail: explode (f3) @ lit_157'13 (g43)
  mov bp, [bp+3]
  mov dx, g43
  mov ax, [bp]
  jmp ax

L184: ; Continuation
  mov ax, '\n'
  call Bare_put_char
  mov [1], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L185: ; Continuation
  push cx
  push L184
  mov cx, sp
  ;; (123'29) Tail: put_chars (g16) @ app_123'38 (arg)
  mov bp, g16
  mov dx, dx
  mov ax, [bp]
  jmp ax

L186: ; Continuation
  push cx
  push L185
  mov cx, sp
  ;; (123'38) Tail: explode (f2) @ lit_176'16 (g69)
  mov bp, [bp+2]
  mov dx, g69
  mov ax, [bp]
  jmp ax

L187: ; Continuation
  push [bp+2]
  push cx
  push L186
  mov cx, sp
  ;; (123'29) Tail: put_chars (g16) @ app_123'38 (arg)
  mov bp, g16
  mov dx, dx
  mov ax, [bp]
  jmp ax

L188: ; Arm: 176'7
  push [bp+2]
  push cx
  push L187
  mov cx, sp
  ;; (123'38) Tail: explode (f2) @ lit_154'25 (g68)
  mov bp, [bp+2]
  mov dx, g68
  mov ax, [bp]
  jmp ax

L189: ; Continuation
  mov ax, '\n'
  call Bare_put_char
  mov [1], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L190: ; Continuation
  push cx
  push L189
  mov cx, sp
  ;; (123'29) Tail: put_chars (g16) @ app_123'38 (arg)
  mov bp, g16
  mov dx, dx
  mov ax, [bp]
  jmp ax

L191: ; Continuation
  push cx
  push L190
  mov cx, sp
  ;; (123'38) Tail: explode (f2) @ lit_179'21 (g71)
  mov bp, [bp+2]
  mov dx, g71
  mov ax, [bp]
  jmp ax

L192: ; Continuation
  push [bp+2]
  push cx
  push L191
  mov cx, sp
  ;; (123'29) Tail: put_chars (g16) @ app_123'38 (arg)
  mov bp, g16
  mov dx, dx
  mov ax, [bp]
  jmp ax

L193: ; Arm: 179'12
  mov ax, [bx+1]
  mov [3], ax
  mov ax, [bx+2]
  mov [4], ax
  push [bp+2]
  push cx
  push L192
  mov cx, sp
  ;; (123'38) Tail: explode (f2) @ lit_154'25 (g70)
  mov bp, [bp+2]
  mov dx, g70
  mov ax, [bp]
  jmp ax

L194: ; Continuation
  mov ax, '\n'
  call Bare_put_char
  mov [1], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L195: ; Continuation
  push cx
  push L194
  mov cx, sp
  ;; (123'29) Tail: put_chars (g16) @ app_123'38 (arg)
  mov bp, g16
  mov dx, dx
  mov ax, [bp]
  jmp ax

L196: ; Continuation
  push cx
  push L195
  mov cx, sp
  ;; (123'38) Tail: explode (f2) @ lit_182'24 (g81)
  mov bp, [bp+2]
  mov dx, g81
  mov ax, [bp]
  jmp ax

L197: ; Continuation
  push [bp+2]
  push cx
  push L196
  mov cx, sp
  ;; (123'29) Tail: put_chars (g16) @ app_123'38 (arg)
  mov bp, g16
  mov dx, dx
  mov ax, [bp]
  jmp ax

L198: ; Arm: 182'15
  push [bp+2]
  push cx
  push L197
  mov cx, sp
  ;; (123'38) Tail: explode (f2) @ lit_154'25 (g80)
  mov bp, [bp+2]
  mov dx, g80
  mov ax, [bp]
  jmp ax

L199: ; Continuation
  mov ax, '\n'
  call Bare_put_char
  mov [1], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L200: ; Continuation
  push cx
  push L199
  mov cx, sp
  ;; (125'26) Tail: put_chars (g16) @ case_116'2 (arg)
  mov bp, g16
  mov dx, dx
  mov ax, [bp]
  jmp ax

L201: ; Arm: 116'11
  push g87
  push '0'
  push 1
  mov [2], sp
  ;; (0'0) Return: con_0'0 (t2)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L202: ; Continuation
  ;; (116'41) Tail: app_116'38 (arg) @ res (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp ax

L203: ; Continuation
  mov ax, [bp+2]
  cmp ax, 0
  call Bare_make_bool_from_z
  mov [1], ax
  push cx
  push L200
  mov cx, sp
  mov bx, [1]
  cmp [bx], 1
  bz L201
  push [bp+2]
  push cx
  push L202
  mov cx, sp
  ;; (116'38) Tail: loop (g86) @ con_116'38 (g88)
  mov bp, g86
  mov dx, g88
  mov ax, [bp]
  jmp ax

L204: ; Continuation
  push [bp+2]
  push cx
  push L203
  mov cx, sp
  ;; (123'29) Tail: put_chars (g16) @ app_123'38 (arg)
  mov bp, g16
  mov dx, dx
  mov ax, [bp]
  jmp ax

L205: ; Continuation
  push [bp+3]
  push cx
  push L204
  mov cx, sp
  ;; (123'38) Tail: explode (f2) @ lit_186'22 (g85)
  mov bp, [bp+2]
  mov dx, g85
  mov ax, [bp]
  jmp ax

L206: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push L205
  mov cx, sp
  ;; (125'26) Tail: put_chars (g16) @ case_116'2 (arg)
  mov bp, g16
  mov dx, dx
  mov ax, [bp]
  jmp ax

L207: ; Arm: 116'11
  push g83
  push '0'
  push 1
  mov [2], sp
  ;; (0'0) Return: con_0'0 (t2)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L208: ; Continuation
  ;; (116'41) Tail: app_116'38 (arg) @ n (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp ax

L209: ; Continuation
  mov ax, [bp+3]
  cmp ax, 0
  call Bare_make_bool_from_z
  mov [1], ax
  push dx
  push [bp+2]
  push cx
  push L206
  mov cx, sp
  mov bx, [1]
  cmp [bx], 1
  bz L207
  push [bp+3]
  push cx
  push L208
  mov cx, sp
  ;; (116'38) Tail: loop (g82) @ con_116'38 (g84)
  mov bp, g82
  mov dx, g84
  mov ax, [bp]
  jmp ax

L210: ; Continuation
  mov bx, dx
  cmp [bx], 1
  bz L198
  mov ax, [bx+1]
  mov [1], ax
  push [1]
  push [bp+2]
  push cx
  push L209
  mov cx, sp
  ;; (184'26) Tail: fact (g26) @ n (t1)
  mov bp, g26
  mov dx, [1]
  mov ax, [bp]
  jmp ax

L211: ; Continuation
  push [bp+2]
  push cx
  push L210
  mov cx, sp
  ;; (82'9) Tail: app_82'7 (arg) @ s (f3)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+3]
  mov ax, [bp]
  jmp ax

L212: ; Continuation
  push dx
  push [bp+2]
  push cx
  push L211
  mov cx, sp
  ;; (82'7) Tail: loop (g72) @ 0
  mov bp, g72
  mov dx, 0
  mov ax, [bp]
  jmp ax

L213: ; Continuation
  mov bx, [bp+3]
  cmp [bx], 0
  bz L188
  mov ax, [bx+1]
  mov [1], ax
  mov ax, [bx+2]
  mov [2], ax
  mov bx, [2]
  cmp [bx], 1
  bz L193
  push [bp+2]
  push cx
  push L212
  mov cx, sp
  ;; (181'33) Tail: explode (f2) @ arg1 (t1)
  mov bp, [bp+2]
  mov dx, [1]
  mov ax, [bp]
  jmp ax

L214: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push L213
  mov cx, sp
  ;; (123'29) Tail: put_chars (g16) @ app_123'38 (arg)
  mov bp, g16
  mov dx, dx
  mov ax, [bp]
  jmp ax

L215: ; Arm: 235'35
  push [bp+7]
  push [bp+3]
  push cx
  push L214
  mov cx, sp
  ;; (123'38) Tail: explode (f3) @ lit_174'13 (g67)
  mov bp, [bp+3]
  mov dx, g67
  mov ax, [bp]
  jmp ax

L216: ; Continuation
  mov ax, '\n'
  call Bare_put_char
  mov [1], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L217: ; Continuation
  push cx
  push L216
  mov cx, sp
  ;; (123'29) Tail: put_chars (g16) @ app_123'38 (arg)
  mov bp, g16
  mov dx, dx
  mov ax, [bp]
  jmp ax

L218: ; Continuation
  push cx
  push L217
  mov cx, sp
  ;; (123'38) Tail: explode (f2) @ lit_205'18 (g92)
  mov bp, [bp+2]
  mov dx, g92
  mov ax, [bp]
  jmp ax

L219: ; Continuation
  push [bp+2]
  push cx
  push L218
  mov cx, sp
  ;; (123'29) Tail: put_chars (g16) @ app_123'38 (arg)
  mov bp, g16
  mov dx, dx
  mov ax, [bp]
  jmp ax

L220: ; Arm: 205'9
  mov ax, [bx+1]
  mov [1], ax
  mov ax, [bx+2]
  mov [2], ax
  push [bp+3]
  push cx
  push L219
  mov cx, sp
  ;; (123'38) Tail: explode (f3) @ lit_154'25 (g91)
  mov bp, [bp+3]
  mov dx, g91
  mov ax, [bp]
  jmp ax

L221: ; Arm: 198'38
  ;; (0'0) Return: con_198'43 (g96)
  mov dx, g96
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L222: ; Continuation
  mov ax, '\n'
  call Bare_put_char
  mov [1], ax
  ;; (199'56) Tail: loop (f2) @ con_199'56 (g98)
  mov bp, [bp+2]
  mov dx, g98
  mov ax, [bp]
  jmp ax

L223: ; Continuation
  push [bp+2]
  push cx
  push L222
  mov cx, sp
  ;; (123'29) Tail: put_chars (g16) @ app_123'38 (arg)
  mov bp, g16
  mov dx, dx
  mov ax, [bp]
  jmp ax

L224: ; Continuation
  push [bp+3]
  push cx
  push L223
  mov cx, sp
  ;; (123'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L225: ; Continuation
  push [bp+4]
  push [bp+3]
  push cx
  push L224
  mov cx, sp
  ;; (193'31) Tail: implode (f2) @ app_102'28 (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L226: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push L225
  mov cx, sp
  ;; (102'28) Tail: app_102'25 (arg) @ xs (f5)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+5]
  mov ax, [bp]
  jmp ax

L227: ; Continuation
  push dx
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push L226
  mov cx, sp
  ;; (102'25) Tail: revloop (g13) @ con_102'25 (g97)
  mov bp, g13
  mov dx, g97
  mov ax, [bp]
  jmp ax

L228: ; Continuation
  mov bx, dx
  cmp [bx], 1
  bz L221
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push L227
  mov cx, sp
  ;; (193'49) Tail: explode (f3) @ line (f5)
  mov dx, [bp+5]
  mov bp, [bp+3]
  mov ax, [bp]
  jmp ax

L229: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push L228
  mov cx, sp
  ;; (93'44) Tail: app_93'41 (arg) @ ys (f6)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+6]
  mov ax, [bp]
  jmp ax

L230: ; Continuation
  push [bp+7]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push L229
  mov cx, sp
  ;; (93'41) Tail: app_93'33 (arg) @ xs (f6)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+6]
  mov ax, [bp]
  jmp ax

L231: ; Continuation
  push dx
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push L230
  mov cx, sp
  ;; (93'33) Tail: eq_list (g8) @ lam_0'0 (g95)
  mov bp, g8
  mov dx, g95
  mov ax, [bp]
  jmp ax

L232: ; Continuation
  push dx
  push [bp+6]
  push [bp+5]
  push [bp+3]
  push [bp+2]
  push cx
  push L231
  mov cx, sp
  ;; (95'57) Tail: explode (f3) @ single_controlD (f4)
  mov dx, [bp+4]
  mov bp, [bp+3]
  mov ax, [bp]
  jmp ax

L233: ; Continuation
  push dx
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push L232
  mov cx, sp
  ;; (95'44) Tail: explode (f3) @ line (arg)
  mov bp, [bp+3]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L234: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push L233
  mov cx, sp
  ;; (146'27) Tail: implode (f2) @ app_146'37 (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L235: ; Function: t1
  push bp
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push cx
  push L234
  mov cx, sp
  ;; (146'37) Tail: readloop (g18) @ con_146'37 (g94)
  mov bp, g18
  mov dx, g94
  mov ax, [bp]
  jmp ax

L236: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push L235
  mov [1], sp
  ;; (201'6) Tail: loop (t1) @ con_201'6 (g99)
  mov bp, [1]
  mov dx, g99
  mov ax, [bp]
  jmp ax

L237: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push L236
  mov cx, sp
  ;; (123'29) Tail: put_chars (g16) @ app_123'38 (arg)
  mov bp, g16
  mov dx, dx
  mov ax, [bp]
  jmp ax

L238: ; Arm: 236'36
  mov bx, [bp+6]
  cmp [bx], 1
  bz L220
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push L237
  mov cx, sp
  ;; (123'38) Tail: explode (f3) @ lit_207'16 (g93)
  mov bp, [bp+3]
  mov dx, g93
  mov ax, [bp]
  jmp ax

L239: ; Continuation
  mov ax, '\n'
  call Bare_put_char
  mov [1], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L240: ; Continuation
  push cx
  push L239
  mov cx, sp
  ;; (123'29) Tail: put_chars (g16) @ app_123'38 (arg)
  mov bp, g16
  mov dx, dx
  mov ax, [bp]
  jmp ax

L241: ; Continuation
  push cx
  push L240
  mov cx, sp
  ;; (123'38) Tail: explode (f2) @ lit_216'13 (g106)
  mov bp, [bp+2]
  mov dx, g106
  mov ax, [bp]
  jmp ax

L242: ; Continuation
  push [bp+2]
  push cx
  push L241
  mov cx, sp
  ;; (125'26) Tail: put_chars (g16) @ case_116'2 (arg)
  mov bp, g16
  mov dx, dx
  mov ax, [bp]
  jmp ax

L243: ; Arm: 116'11
  push g104
  push '0'
  push 1
  mov [2], sp
  ;; (0'0) Return: con_0'0 (t2)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp ax

L244: ; Continuation
  ;; (116'41) Tail: app_116'38 (arg) @ n (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp ax

L245: ; Continuation
  mov ax, [bp+3]
  cmp ax, 0
  call Bare_make_bool_from_z
  mov [1], ax
  push [bp+2]
  push cx
  push L242
  mov cx, sp
  mov bx, [1]
  cmp [bx], 1
  bz L243
  push [bp+3]
  push cx
  push L244
  mov cx, sp
  ;; (116'38) Tail: loop (g103) @ con_116'38 (g105)
  mov bp, g103
  mov dx, g105
  mov ax, [bp]
  jmp ax

L246: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push L245
  mov cx, sp
  ;; (123'29) Tail: put_chars (g16) @ app_123'38 (arg)
  mov bp, g16
  mov dx, dx
  mov ax, [bp]
  jmp ax

L247: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push L246
  mov cx, sp
  ;; (123'38) Tail: explode (f2) @ lit_214'13 (g102)
  mov bp, [bp+2]
  mov dx, g102
  mov ax, [bp]
  jmp ax

L248: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push L247
  mov cx, sp
  ;; (123'29) Tail: put_chars (g16) @ app_123'38 (arg)
  mov bp, g16
  mov dx, dx
  mov ax, [bp]
  jmp ax

L249: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push L248
  mov cx, sp
  ;; (123'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L250: ; Continuation
  push [bp+4]
  push [bp+3]
  push cx
  push L249
  mov cx, sp
  ;; (39'34) Tail: implode (f2) @ app_39'55 (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L251: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push L250
  mov cx, sp
  ;; (39'55) Tail: app_39'42 (f5) @ app_39'64 (arg)
  mov bp, [bp+5]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L252: ; Continuation
  push dx
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push L251
  mov cx, sp
  ;; (39'64) Tail: explode (f3) @ s2 (f5)
  mov dx, [bp+5]
  mov bp, [bp+3]
  mov ax, [bp]
  jmp ax

L253: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push L252
  mov cx, sp
  ;; (39'42) Tail: append (g3) @ app_39'51 (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L254: ; Continuation
  push dx
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push L253
  mov cx, sp
  ;; (39'51) Tail: explode (f3) @ lit_213'28 (g101)
  mov bp, [bp+3]
  mov dx, g101
  mov ax, [bp]
  jmp ax

L255: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push L254
  mov cx, sp
  ;; (213'53) Tail: implode (f2) @ app_213'67 (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L256: ; Continuation
  push [bp+5]
  push [bp+3]
  push [bp+2]
  push cx
  push L255
  mov cx, sp
  ;; (213'67) Tail: star_the_ohs (f4) @ app_213'76 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L257: ; Continuation
  mov ax, [bp+4]
  call Bare_string_length
  mov [1], ax
  push [1]
  push dx
  push [bp+3]
  push [bp+2]
  push cx
  push L256
  mov cx, sp
  ;; (213'76) Tail: explode (f3) @ line (f4)
  mov dx, [bp+4]
  mov bp, [bp+3]
  mov ax, [bp]
  jmp ax

L258: ; Continuation
  mov bx, dx
  cmp [bx], 1
  bz L238
  push [bp+5]
  push [bp+3]
  push [bp+2]
  push cx
  push L257
  mov cx, sp
  ;; (211'25) Tail: map (g14) @ lam_211'30 (g100)
  mov bp, g14
  mov dx, g100
  mov ax, [bp]
  jmp ax

L259: ; Continuation
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push L258
  mov cx, sp
  ;; (93'44) Tail: app_93'41 (arg) @ ys (f7)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+7]
  mov ax, [bp]
  jmp ax

L260: ; Continuation
  push [bp+8]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push L259
  mov cx, sp
  ;; (93'41) Tail: app_93'33 (arg) @ xs (f7)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+7]
  mov ax, [bp]
  jmp ax

L261: ; Continuation
  push dx
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push L260
  mov cx, sp
  ;; (93'33) Tail: eq_list (g8) @ lam_0'0 (g90)
  mov bp, g8
  mov dx, g90
  mov ax, [bp]
  jmp ax

L262: ; Continuation
  push dx
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push L261
  mov cx, sp
  ;; (95'57) Tail: explode (f3) @ lit_236'30 (g89)
  mov bp, [bp+3]
  mov dx, g89
  mov ax, [bp]
  jmp ax

L263: ; Continuation
  mov bx, dx
  cmp [bx], 1
  bz L215
  push [bp+7]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push L262
  mov cx, sp
  ;; (95'44) Tail: explode (f3) @ command (f6)
  mov dx, [bp+6]
  mov bp, [bp+3]
  mov ax, [bp]
  jmp ax

L264: ; Continuation
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push L263
  mov cx, sp
  ;; (93'44) Tail: app_93'41 (arg) @ ys (f8)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+8]
  mov ax, [bp]
  jmp ax

L265: ; Continuation
  push [bp+9]
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push L264
  mov cx, sp
  ;; (93'41) Tail: app_93'33 (arg) @ xs (f8)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+8]
  mov ax, [bp]
  jmp ax

L266: ; Continuation
  push dx
  push [bp+8]
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push L265
  mov cx, sp
  ;; (93'33) Tail: eq_list (g8) @ lam_0'0 (g66)
  mov bp, g8
  mov dx, g66
  mov ax, [bp]
  jmp ax

L267: ; Continuation
  push dx
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push L266
  mov cx, sp
  ;; (95'57) Tail: explode (f3) @ lit_235'28 (g65)
  mov bp, [bp+3]
  mov dx, g65
  mov ax, [bp]
  jmp ax

L268: ; Continuation
  mov bx, dx
  cmp [bx], 1
  bz L183
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push L267
  mov cx, sp
  ;; (95'44) Tail: explode (f3) @ command (f6)
  mov dx, [bp+6]
  mov bp, [bp+3]
  mov ax, [bp]
  jmp ax

L269: ; Continuation
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push L268
  mov cx, sp
  ;; (93'44) Tail: app_93'41 (arg) @ ys (f8)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+8]
  mov ax, [bp]
  jmp ax

L270: ; Continuation
  push [bp+9]
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push L269
  mov cx, sp
  ;; (93'41) Tail: app_93'33 (arg) @ xs (f8)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+8]
  mov ax, [bp]
  jmp ax

L271: ; Continuation
  push dx
  push [bp+8]
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push L270
  mov cx, sp
  ;; (93'33) Tail: eq_list (g8) @ lam_0'0 (g42)
  mov bp, g8
  mov dx, g42
  mov ax, [bp]
  jmp ax

L272: ; Continuation
  push dx
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push L271
  mov cx, sp
  ;; (95'57) Tail: explode (f3) @ lit_234'26 (g41)
  mov bp, [bp+3]
  mov dx, g41
  mov ax, [bp]
  jmp ax

L273: ; Continuation
  push [bp+5]
  push cx
  push L150
  mov cx, sp
  mov bx, dx
  cmp [bx], 0
  bz L151
  mov ax, [bx+1]
  mov [1], ax
  mov ax, [bx+2]
  mov [2], ax
  push [2]
  push [1]
  push [bp+6]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push L272
  mov cx, sp
  ;; (95'44) Tail: explode (f3) @ command (t1)
  mov bp, [bp+3]
  mov dx, [1]
  mov ax, [bp]
  jmp ax

L274: ; Continuation
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push L273
  mov cx, sp
  ;; (227'18) Tail: app_227'15 (arg) @ s (f7)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+7]
  mov ax, [bp]
  jmp ax

L275: ; Continuation
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push L274
  mov cx, sp
  ;; (227'15) Tail: app_227'12 (arg) @ con_227'15 (g39)
  mov bp, dx
  mov dx, g39
  mov ax, [bp]
  jmp ax

L276: ; Continuation
  push dx
  push [bp+7]
  push [bp+6]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push L275
  mov cx, sp
  ;; (227'12) Tail: splitloop (f5) @ con_227'12 (g38)
  mov bp, [bp+5]
  mov dx, g38
  mov ax, [bp]
  jmp ax

L277: ; Continuation
  mov bx, dx
  cmp [bx], 1
  bz L149
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push L276
  mov cx, sp
  ;; (230'35) Tail: explode (f3) @ line (f7)
  mov dx, [bp+7]
  mov bp, [bp+3]
  mov ax, [bp]
  jmp ax

L278: ; Continuation
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push L277
  mov cx, sp
  ;; (93'44) Tail: app_93'41 (arg) @ ys (f8)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+8]
  mov ax, [bp]
  jmp ax

L279: ; Continuation
  push [bp+9]
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push L278
  mov cx, sp
  ;; (93'41) Tail: app_93'33 (arg) @ xs (f8)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+8]
  mov ax, [bp]
  jmp ax

L280: ; Continuation
  push dx
  push [bp+8]
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push L279
  mov cx, sp
  ;; (93'33) Tail: eq_list (g8) @ lam_0'0 (g36)
  mov bp, g8
  mov dx, g36
  mov ax, [bp]
  jmp ax

L281: ; Continuation
  push dx
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push L280
  mov cx, sp
  ;; (95'57) Tail: explode (f3) @ single_controlD (f4)
  mov dx, [bp+4]
  mov bp, [bp+3]
  mov ax, [bp]
  jmp ax

L282: ; Continuation
  push dx
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push L281
  mov cx, sp
  ;; (95'44) Tail: explode (f3) @ line (arg)
  mov bp, [bp+3]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L283: ; Continuation
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push L282
  mov cx, sp
  ;; (146'27) Tail: implode (f2) @ app_146'37 (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L284: ; Continuation
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push L283
  mov cx, sp
  ;; (146'37) Tail: readloop (g18) @ con_146'37 (g35)
  mov bp, g18
  mov dx, g35
  mov ax, [bp]
  jmp ax

L285: ; Function: t2
  push g34
  push ' '
  push 1
  mov [1], sp
  push [1]
  push '>'
  push 1
  mov [2], sp
  push bp
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push cx
  push L284
  mov cx, sp
  ;; (240'12) Tail: put_chars (g16) @ con_240'13 (t2)
  mov bp, g16
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L286: ; Continuation
  ;; (247'11) Tail: mainloop (f2) @ con_247'11 (g109)
  mov bp, [bp+2]
  mov dx, g109
  mov ax, [bp]
  jmp ax

L287: ; Continuation
  push [bp+2]
  push cx
  push L286
  mov cx, sp
  ;; (123'29) Tail: put_chars (g16) @ app_123'38 (arg)
  mov bp, g16
  mov dx, dx
  mov ax, [bp]
  jmp ax

L288: ; Continuation
  push [bp+2]
  push L148
  mov [1], sp
  push [1]
  push dx
  push [bp+3]
  push [bp+2]
  push L285
  mov [2], sp
  push [2]
  push cx
  push L287
  mov cx, sp
  ;; (123'38) Tail: explode (f3) @ lit_246'13 (g108)
  mov bp, [bp+3]
  mov dx, g108
  mov ax, [bp]
  jmp ax

L289: ; Continuation
  push g29
  push '\EOT'
  push 1
  mov [1], sp
  push dx
  push [bp+2]
  push cx
  push L288
  mov cx, sp
  ;; (191'30) Tail: implode (f2) @ con_0'0 (t1)
  mov bp, [bp+2]
  mov dx, [1]
  mov ax, [bp]
  jmp ax

L290: ; Continuation
  push dx
  push cx
  push L289
  mov cx, sp
  ;; (37'23) Tail: block (g1) @ lam_30'12 (g7)
  mov bp, g1
  mov dx, g7
  mov ax, [bp]
  jmp ax

L291: ; Start
  push cx
  push L290
  mov cx, sp
  ;; (28'23) Tail: block (g1) @ lam_18'12 (g5)
  mov bp, g1
  mov dx, g5
  mov ax, [bp]
  jmp ax

g1: dw L2
g2: dw L5
g3: dw L10
g4: dw 0
g5: dw L18
g6: dw 0
g7: dw L24
g8: dw L35
g9: dw 1
g10: dw 0
g11: dw 0
g12: dw 0
g13: dw L39
g14: dw L45
g15: dw 0
g16: dw L51
g17: dw 0
g18: dw L67
g19: dw 0
g20: dw 0
g21: dw 0
g22: dw 0
g23: dw 1
g24: dw 0
g25: dw L71
g26: dw L76
g27: dw 0
g28: dw 1
g29: dw 0
g30: dw 0
g31: dw 0
g32: dw 0
g33: dw 0
g34: dw 0
g35: dw 0
g36: dw L78
g37: dw 0
g38: dw 0
g39: dw 0
g40: dw 0
g41: dw 1, 'f', g41+3, 1, 'i', g41+6, 1, 'b', g41+9, 0
g42: dw L80
g43: dw 1, 'f', g43+3, 1, 'i', g43+6, 1, 'b', g43+9, 1, ':', g43+12, 1, ' ', g43+15, 0
g44: dw 1, 'E', g44+3, 1, 'R', g44+6, 1, 'R', g44+9, 1, 'O', g44+12, 1, 'R', g44+15, 1, ':', g44+18, 1, ' ', g44+21, 0
g45: dw 1, 'e', g45+3, 1, 'x', g45+6, 1, 'p', g45+9, 1, 'e', g45+12, 1, 'c', g45+15, 1, 't', g45+18, 1, 'e', g45+21, 1, 'd', g45+24, 1, ' ', g45+27, 1, 'a', g45+30, 1, 'n', g45+33, 1, ' ', g45+36, 1, 'a', g45+39, 1, 'r', g45+42, 1, 'g', g45+45, 1, 'u', g45+48, 1, 'm', g45+51, 1, 'e', g45+54, 1, 'n', g45+57, 1, 't', g45+60, 0
g46: dw 1, 'E', g46+3, 1, 'R', g46+6, 1, 'R', g46+9, 1, 'O', g46+12, 1, 'R', g46+15, 1, ':', g46+18, 1, ' ', g46+21, 0
g47: dw 1, 'e', g47+3, 1, 'x', g47+6, 1, 'p', g47+9, 1, 'e', g47+12, 1, 'c', g47+15, 1, 't', g47+18, 1, 'e', g47+21, 1, 'd', g47+24, 1, ' ', g47+27, 1, 'e', g47+30, 1, 'x', g47+33, 1, 'a', g47+36, 1, 'c', g47+39, 1, 't', g47+42, 1, 'l', g47+45, 1, 'y', g47+48, 1, ' ', g47+51, 1, 'o', g47+54, 1, 'n', g47+57, 1, 'e', g47+60, 1, ' ', g47+63, 1, 'a', g47+66, 1, 'r', g47+69, 1, 'g', g47+72, 1, 'u', g47+75, 1, 'm', g47+78, 1, 'e', g47+81, 1, 'n', g47+84, 1, 't', g47+87, 0
g48: dw L92
g49: dw 0
g50: dw 1
g51: dw 0
g52: dw 1
g53: dw 1
g54: dw 1
g55: dw 1
g56: dw 1, 'E', g56+3, 1, 'R', g56+6, 1, 'R', g56+9, 1, 'O', g56+12, 1, 'R', g56+15, 1, ':', g56+18, 1, ' ', g56+21, 0
g57: dw 1, 'e', g57+3, 1, 'x', g57+6, 1, 'p', g57+9, 1, 'e', g57+12, 1, 'c', g57+15, 1, 't', g57+18, 1, 'e', g57+21, 1, 'd', g57+24, 1, ' ', g57+27, 1, 'a', g57+30, 1, 'r', g57+33, 1, 'g', g57+36, 1, '1', g57+39, 1, ' ', g57+42, 1, 't', g57+45, 1, 'o', g57+48, 1, ' ', g57+51, 1, 'b', g57+54, 1, 'e', g57+57, 1, ' ', g57+60, 1, 'n', g57+63, 1, 'u', g57+66, 1, 'm', g57+69, 1, 'e', g57+72, 1, 'r', g57+75, 1, 'i', g57+78, 1, 'c', g57+81, 0
g58: dw L96
g59: dw 0
g60: dw 0
g61: dw 1, ' ', g61+3, 1, '-', g61+6, 1, '-', g61+9, 1, '>', g61+12, 1, ' ', g61+15, 0
g62: dw L100
g63: dw 0
g64: dw 0
g65: dw 1, 'f', g65+3, 1, 'a', g65+6, 1, 'c', g65+9, 1, 't', g65+12, 0
g66: dw L102
g67: dw 1, 'f', g67+3, 1, 'a', g67+6, 1, 'c', g67+9, 1, 't', g67+12, 1, ':', g67+15, 1, ' ', g67+18, 0
g68: dw 1, 'E', g68+3, 1, 'R', g68+6, 1, 'R', g68+9, 1, 'O', g68+12, 1, 'R', g68+15, 1, ':', g68+18, 1, ' ', g68+21, 0
g69: dw 1, 'e', g69+3, 1, 'x', g69+6, 1, 'p', g69+9, 1, 'e', g69+12, 1, 'c', g69+15, 1, 't', g69+18, 1, 'e', g69+21, 1, 'd', g69+24, 1, ' ', g69+27, 1, 'a', g69+30, 1, 'n', g69+33, 1, ' ', g69+36, 1, 'a', g69+39, 1, 'r', g69+42, 1, 'g', g69+45, 1, 'u', g69+48, 1, 'm', g69+51, 1, 'e', g69+54, 1, 'n', g69+57, 1, 't', g69+60, 0
g70: dw 1, 'E', g70+3, 1, 'R', g70+6, 1, 'R', g70+9, 1, 'O', g70+12, 1, 'R', g70+15, 1, ':', g70+18, 1, ' ', g70+21, 0
g71: dw 1, 'e', g71+3, 1, 'x', g71+6, 1, 'p', g71+9, 1, 'e', g71+12, 1, 'c', g71+15, 1, 't', g71+18, 1, 'e', g71+21, 1, 'd', g71+24, 1, ' ', g71+27, 1, 'e', g71+30, 1, 'x', g71+33, 1, 'a', g71+36, 1, 'c', g71+39, 1, 't', g71+42, 1, 'l', g71+45, 1, 'y', g71+48, 1, ' ', g71+51, 1, 'o', g71+54, 1, 'n', g71+57, 1, 'e', g71+60, 1, ' ', g71+63, 1, 'a', g71+66, 1, 'r', g71+69, 1, 'g', g71+72, 1, 'u', g71+75, 1, 'm', g71+78, 1, 'e', g71+81, 1, 'n', g71+84, 1, 't', g71+87, 0
g72: dw L114
g73: dw 0
g74: dw 1
g75: dw 0
g76: dw 1
g77: dw 1
g78: dw 1
g79: dw 1
g80: dw 1, 'E', g80+3, 1, 'R', g80+6, 1, 'R', g80+9, 1, 'O', g80+12, 1, 'R', g80+15, 1, ':', g80+18, 1, ' ', g80+21, 0
g81: dw 1, 'e', g81+3, 1, 'x', g81+6, 1, 'p', g81+9, 1, 'e', g81+12, 1, 'c', g81+15, 1, 't', g81+18, 1, 'e', g81+21, 1, 'd', g81+24, 1, ' ', g81+27, 1, 'a', g81+30, 1, 'r', g81+33, 1, 'g', g81+36, 1, '1', g81+39, 1, ' ', g81+42, 1, 't', g81+45, 1, 'o', g81+48, 1, ' ', g81+51, 1, 'b', g81+54, 1, 'e', g81+57, 1, ' ', g81+60, 1, 'n', g81+63, 1, 'u', g81+66, 1, 'm', g81+69, 1, 'e', g81+72, 1, 'r', g81+75, 1, 'i', g81+78, 1, 'c', g81+81, 0
g82: dw L118
g83: dw 0
g84: dw 0
g85: dw 1, ' ', g85+3, 1, '-', g85+6, 1, '-', g85+9, 1, '>', g85+12, 1, ' ', g85+15, 0
g86: dw L122
g87: dw 0
g88: dw 0
g89: dw 1, 'r', g89+3, 1, 'e', g89+6, 1, 'v', g89+9, 0
g90: dw L124
g91: dw 1, 'E', g91+3, 1, 'R', g91+6, 1, 'R', g91+9, 1, 'O', g91+12, 1, 'R', g91+15, 1, ':', g91+18, 1, ' ', g91+21, 0
g92: dw 1, 'r', g92+3, 1, 'e', g92+6, 1, 'v', g92+9, 1, ':', g92+12, 1, ' ', g92+15, 1, 'e', g92+18, 1, 'x', g92+21, 1, 'p', g92+24, 1, 'e', g92+27, 1, 'c', g92+30, 1, 't', g92+33, 1, 'e', g92+36, 1, 'd', g92+39, 1, ' ', g92+42, 1, 'n', g92+45, 1, 'o', g92+48, 1, ' ', g92+51, 1, 'a', g92+54, 1, 'r', g92+57, 1, 'g', g92+60, 1, 'u', g92+63, 1, 'm', g92+66, 1, 'e', g92+69, 1, 'n', g92+72, 1, 't', g92+75, 1, 's', g92+78, 0
g93: dw 1, '(', g93+3, 1, 'r', g93+6, 1, 'e', g93+9, 1, 'v', g93+12, 1, 'e', g93+15, 1, 'r', g93+18, 1, 's', g93+21, 1, 'e', g93+24, 1, ' ', g93+27, 1, 't', g93+30, 1, 'y', g93+33, 1, 'p', g93+36, 1, 'e', g93+39, 1, 'd', g93+42, 1, ' ', g93+45, 1, 'l', g93+48, 1, 'i', g93+51, 1, 'n', g93+54, 1, 'e', g93+57, 1, 's', g93+60, 1, ' ', g93+63, 1, 'u', g93+66, 1, 'n', g93+69, 1, 't', g93+72, 1, 'i', g93+75, 1, 'l', g93+78, 1, ' ', g93+81, 1, '^', g93+84, 1, 'D', g93+87, 1, ')', g93+90, 1, '\n', g93+93, 0
g94: dw 0
g95: dw L126
g96: dw 0
g97: dw 0
g98: dw 0
g99: dw 0
g100: dw L128
g101: dw 1, 'Y', g101+3, 1, 'o', g101+6, 1, 'u', g101+9, 1, ' ', g101+12, 1, 'w', g101+15, 1, 'r', g101+18, 1, 'o', g101+21, 1, 't', g101+24, 1, 'e', g101+27, 1, ':', g101+30, 1, ' ', g101+33, 1, '"', g101+36, 0
g102: dw 1, '"', g102+3, 1, ' ', g102+6, 1, '(', g102+9, 0
g103: dw L132
g104: dw 0
g105: dw 0
g106: dw 1, ' ', g106+3, 1, 'c', g106+6, 1, 'h', g106+9, 1, 'a', g106+12, 1, 'r', g106+15, 1, 's', g106+18, 1, ')', g106+21, 0
g107: dw 0
g108: dw 1, 'T', g108+3, 1, 'h', g108+6, 1, 'i', g108+9, 1, 's', g108+12, 1, ' ', g108+15, 1, 'i', g108+18, 1, 's', g108+21, 1, ' ', g108+24, 1, 'a', g108+27, 1, ' ', g108+30, 1, 's', g108+33, 1, 'h', g108+36, 1, 'e', g108+39, 1, 'l', g108+42, 1, 'l', g108+45, 1, ' ', g108+48, 1, 'p', g108+51, 1, 'r', g108+54, 1, 'o', g108+57, 1, 't', g108+60, 1, 'o', g108+63, 1, 't', g108+66, 1, 'y', g108+69, 1, 'p', g108+72, 1, 'e', g108+75, 1, '.', g108+78, 1, ' ', g108+81, 1, 'T', g108+84, 1, 'r', g108+87, 1, 'y', g108+90, 1, ':', g108+93, 1, ' ', g108+96, 1, 'f', g108+99, 1, 'i', g108+102, 1, 'b', g108+105, 1, ',', g108+108, 1, ' ', g108+111, 1, 'f', g108+114, 1, 'a', g108+117, 1, 'c', g108+120, 1, 't', g108+123, 1, ',', g108+126, 1, ' ', g108+129, 1, 'r', g108+132, 1, 'e', g108+135, 1, 'v', g108+138, 1, '\n', g108+141, 0
g109: dw 0

bare_start: jmp L291
