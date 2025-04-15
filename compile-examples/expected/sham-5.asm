(*Stage5 (ASM)*)
L1: ; Function: t1
  ;; (15'54) Tail: f (f1) @ a (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L2: ; Function: g1
  push dx
  push #L1
  mov 1, sp
  ;; (0'0) Return: lam_15'31 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L3: ; Arm: 21'7
  ;; (21'10) Return: 0
  mov dx, #0
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L4: ; Continuation
  mov ax, #1
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
  ;; (22'27) Tail: length (g2) @ xs (t2)
  mov bp, #g2
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L6: ; Arm: 26'7
  ;; (0'0) Return: con_26'10 (g4)
  mov dx, #g4
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L7: ; Continuation
  push dx
  push [bp+2]
  push #1
  mov 1, sp
  ;; (0'0) Return: con_0'0 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L8: ; Continuation
  push [bp+3]
  push cx
  push #L7
  mov cx, sp
  ;; (27'26) Tail: app_27'24 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L9: ; Continuation
  push dx
  push [bp+3]
  push cx
  push #L8
  mov cx, sp
  ;; (27'24) Tail: map (g3) @ f (f2)
  mov dx, [bp+2]
  mov bp, #g3
  mov ax, [bp]
  jmp [ax]

L10: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L6
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push [2]
  push [bp+1]
  push cx
  push #L9
  mov cx, sp
  ;; (27'15) Tail: f (f1) @ x (t1)
  mov bp, [bp+1]
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L11: ; Function: g3
  push dx
  push #L10
  mov 1, sp
  ;; (0'0) Return: lam_24'14 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L12: ; Arm: 31'7
  ;; (0'0) Return: con_31'10 (g6)
  mov dx, #g6
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L13: ; Continuation
  ;; (32'25) Tail: app_32'23 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L14: ; Continuation
  push [bp+3]
  push cx
  push #L13
  mov cx, sp
  ;; (32'23) Tail: iter (g5) @ f (f2)
  mov dx, [bp+2]
  mov bp, #g5
  mov ax, [bp]
  jmp [ax]

L15: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L12
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push [2]
  push [bp+1]
  push cx
  push #L14
  mov cx, sp
  ;; (32'15) Tail: f (f1) @ x (t1)
  mov bp, [bp+1]
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L16: ; Function: g5
  push dx
  push #L15
  mov 1, sp
  ;; (0'0) Return: lam_29'15 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L17: ; Arm: 36'7
  ;; (34'20) Return: b (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L18: ; Continuation
  ;; (37'33) Tail: app_37'25 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L19: ; Continuation
  push [bp+3]
  push cx
  push #L18
  mov cx, sp
  ;; (37'25) Tail: app_37'23 (f2) @ app_37'30 (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L20: ; Continuation
  push [bp+4]
  push [bp+2]
  push cx
  push #L19
  mov cx, sp
  ;; (37'30) Tail: app_37'28 (arg) @ x (f3)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+3]
  mov ax, [bp]
  jmp [ax]

L21: ; Continuation
  push [bp+5]
  push [bp+4]
  push dx
  push cx
  push #L20
  mov cx, sp
  ;; (37'28) Tail: f (f2) @ b (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L22: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L17
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push [2]
  push [1]
  push [bp+2]
  push [bp+1]
  push cx
  push #L21
  mov cx, sp
  ;; (37'23) Tail: fold_left (g7) @ f (f1)
  mov dx, [bp+1]
  mov bp, #g7
  mov ax, [bp]
  jmp [ax]

L23: ; Function: t1
  push dx
  push [bp+1]
  push #L22
  mov 1, sp
  ;; (0'0) Return: lam_34'22 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L24: ; Function: g7
  push dx
  push #L23
  mov 1, sp
  ;; (0'0) Return: lam_34'20 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L25: ; Arm: 41'7
  ;; (39'17) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L26: ; Continuation
  ;; (42'33) Tail: app_42'22 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L27: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L25
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
  push #L26
  mov cx, sp
  ;; (42'22) Tail: rev_onto (g8) @ con_0'0 (t3)
  mov bp, #g8
  mov dx, [3]
  mov ax, [bp]
  jmp [ax]

L28: ; Function: g8
  push dx
  push #L27
  mov 1, sp
  ;; (0'0) Return: lam_39'21 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L29: ; Arm: 54'9
  ;; (0'0) Return: con_54'12 (g9)
  mov dx, #g9
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L30: ; Continuation
  ;; (55'43) Tail: app_55'37 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L31: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L29
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
  add ax, #1
  mov 4, ax
  push [2]
  push cx
  push #L30
  mov cx, sp
  ;; (55'37) Tail: loop (f3) @ prim_0'0 (t4)
  mov bp, [bp+3]
  mov dx, [4]
  mov ax, [bp]
  jmp [ax]

L32: ; Function: t2
  push bp
  push dx
  push [bp+1]
  push #L31
  mov 1, sp
  ;; (0'0) Return: lam_52'17 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L33: ; Continuation
  mov ax, [bp+2]
  call bios_freeze_bytes
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L34: ; Continuation
  push [bp+3]
  push cx
  push #L33
  mov cx, sp
  ;; (57'9) Tail: app_57'7 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L35: ; Continuation
  mov ax, dx
  call bios_make_bytes
  mov 1, ax
  push [1]
  push #L32
  mov 2, sp
  push [1]
  push [bp+2]
  push cx
  push #L34
  mov cx, sp
  ;; (57'7) Tail: loop (t2) @ 0
  mov bp, [2]
  mov dx, #0
  mov ax, [bp]
  jmp [ax]

L36: ; Function: g10
  push dx
  push cx
  push #L35
  mov cx, sp
  ;; (51'29) Tail: length (g2) @ xs (arg)
  mov bp, #g2
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L37: ; Arm: 65'9
  ;; (0'0) Return: con_65'12 (g11)
  mov dx, #g11
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L38: ; Continuation
  ;; (66'43) Tail: app_66'37 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L39: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L37
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
  sub ax, #1
  mov 4, ax
  push [2]
  push cx
  push #L38
  mov cx, sp
  ;; (66'37) Tail: loop (f3) @ prim_0'0 (t4)
  mov bp, [bp+3]
  mov dx, [4]
  mov ax, [bp]
  jmp [ax]

L40: ; Function: t2
  push bp
  push dx
  push [bp+1]
  push #L39
  mov 1, sp
  ;; (0'0) Return: lam_63'17 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L41: ; Continuation
  mov ax, [bp+2]
  call bios_freeze_bytes
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L42: ; Continuation
  push [bp+3]
  push cx
  push #L41
  mov cx, sp
  ;; (68'13) Tail: app_68'7 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L43: ; Continuation
  mov ax, dx
  call bios_make_bytes
  mov 1, ax
  push [1]
  push #L40
  mov 2, sp
  mov ax, dx
  sub ax, #1
  mov 3, ax
  push [1]
  push [bp+2]
  push cx
  push #L42
  mov cx, sp
  ;; (68'7) Tail: loop (t2) @ prim_0'0 (t3)
  mov bp, [2]
  mov dx, [3]
  mov ax, [bp]
  jmp [ax]

L44: ; Function: g12
  push dx
  push cx
  push #L43
  mov cx, sp
  ;; (61'17) Tail: length (g2) @ xs (arg)
  mov bp, #g2
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L45: ; Arm: 73'13
  ;; (72'23) Return: acc (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L46: ; Continuation
  mov ax, [bp+2]
  sub ax, #1
  mov 1, ax
  ;; (74'45) Tail: app_74'19 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L47: ; Function: t1
  mov ax, dx
  cmp ax, #0
  call bios_make_bool_from_n
  mov 1, ax
  mov bx, [1]
  cmp [bx], #1
  bz L45
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
  push #L46
  mov cx, sp
  ;; (74'19) Tail: explode_loop (f3) @ con_0'0 (t3)
  mov bp, [bp+3]
  mov dx, [3]
  mov ax, [bp]
  jmp [ax]

L48: ; Function: t1
  push bp
  push dx
  push [bp+1]
  push #L47
  mov 1, sp
  ;; (0'0) Return: lam_72'27 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L49: ; Continuation
  mov ax, [bp+2]
  sub ax, #1
  mov 1, ax
  ;; (76'18) Tail: app_76'15 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L50: ; Function: g14
  push dx
  push #L48
  mov 1, sp
  mov ax, dx
  call bios_string_length
  mov 2, ax
  push [2]
  push cx
  push #L49
  mov cx, sp
  ;; (76'15) Tail: explode_loop (t1) @ con_76'15 (g13)
  mov bp, [1]
  mov dx, #g13
  mov ax, [bp]
  jmp [ax]

L51: ; Arm: 81'19
  ;; (0'0) Return: con_81'24 (g17)
  mov dx, #g17
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L52: ; Arm: 83'15
  ;; (0'0) Return: con_83'20 (g18)
  mov dx, #g18
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L53: ; Arm: 86'31
  ;; (0'0) Return: con_86'36 (g21)
  mov dx, #g21
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L54: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L53
  mov ax, [bp+2]
  sub ax, #1
  mov 1, ax
  ;; (86'52) Tail: loop (f3) @ prim_0'0 (t1)
  mov bp, [bp+3]
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L55: ; Arm: 8'9
  ;; (0'0) Return: con_8'12 (g19)
  mov dx, #g19
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L56: ; Function: t1
  mov ax, dx
  cmp ax, #0
  call bios_make_bool_from_n
  mov 1, ax
  mov bx, [1]
  cmp [bx], #1
  bz L52
  mov ax, [bp+1]
  mov bx, dx
  call bios_string_index
  mov 2, ax
  mov ax, [bp+2]
  mov bx, dx
  call bios_string_index
  mov 3, ax
  mov ax, [2]
  cmp ax, [3]
  call bios_make_bool_from_z
  mov 4, ax
  push bp
  push dx
  push cx
  push #L54
  mov cx, sp
  mov bx, [4]
  cmp [bx], #1
  bz L55
  ;; (0'0) Return: con_9'13 (g20)
  mov dx, #g20
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L57: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L51
  push [bp+3]
  push [bp+2]
  push #L56
  mov 1, sp
  mov ax, [bp+4]
  sub ax, #1
  mov 2, ax
  ;; (88'9) Tail: loop (t1) @ prim_0'0 (t2)
  mov bp, [1]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L58: ; Arm: 8'9
  ;; (0'0) Return: con_8'12 (g15)
  mov dx, #g15
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L59: ; Function: t1
  mov ax, [bp+1]
  call bios_string_length
  mov 1, ax
  mov ax, dx
  call bios_string_length
  mov 2, ax
  mov ax, [1]
  cmp ax, [2]
  call bios_make_bool_from_z
  mov 3, ax
  push [1]
  push dx
  push [bp+1]
  push cx
  push #L57
  mov cx, sp
  mov bx, [3]
  cmp [bx], #1
  bz L58
  ;; (0'0) Return: con_9'13 (g16)
  mov dx, #g16
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L60: ; Function: g22
  push dx
  push #L59
  mov 1, sp
  ;; (0'0) Return: lam_78'33 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L61: ; Arm: 111'7
  ;; (0'0) Return: con_111'10 (g26)
  mov dx, #g26
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L62: ; Continuation
  ;; (112'35) Tail: put_chars (g25) @ xs (f2)
  mov dx, [bp+2]
  mov bp, #g25
  mov ax, [bp]
  jmp [ax]

L63: ; Arm: 104'19
  mov ax, [1]
  call bios_put_char
  mov 5, ax
  ;; (0'0) Return: prim_0'0 (t5)
  mov dx, [5]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L64: ; Arm: 105'22
  mov ax, [1]
  call bios_put_char
  mov 6, ax
  ;; (0'0) Return: prim_0'0 (t6)
  mov dx, [6]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L65: ; Arm: 106'16
  mov ax, [1]
  call bios_put_char
  mov 7, ax
  ;; (0'0) Return: prim_0'0 (t7)
  mov dx, [7]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L66: ; Function: g25
  mov bx, dx
  cmp [bx], #0
  bz L61
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov ax, [1]
  call bios_char_to_num
  mov 3, ax
  mov ax, [3]
  cmp ax, #8
  call bios_make_bool_from_z
  mov 4, ax
  push [2]
  push cx
  push #L62
  mov cx, sp
  mov bx, [4]
  cmp [bx], #1
  bz L63
  mov ax, [1]
  cmp ax, #'\n'
  call bios_make_bool_from_z
  mov 5, ax
  mov bx, [5]
  cmp [bx], #1
  bz L64
  mov ax, #26
  cmp ax, [3]
  call bios_make_bool_from_n
  mov 6, ax
  mov bx, [6]
  cmp [bx], #1
  bz L65
  mov ax, #'^'
  call bios_put_char
  mov 7, ax
  mov ax, #65
  add ax, [3]
  mov 8, ax
  mov ax, [8]
  sub ax, #1
  mov 9, ax
  mov ax, [9]
  call bios_num_to_char
  mov 10, ax
  mov ax, [10]
  call bios_put_char
  mov 11, ax
  ;; (0'0) Return: prim_0'0 (t11)
  mov dx, [11]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L67: ; Function: g63
  mov bx, dx
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  ;; (222'44) Return: name (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L68: ; Arm: 95'7
  ;; (0'0) Return: lit_95'10 (g23)
  mov dx, #g23
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L69: ; Continuation
  ;; (91'10) Tail: implode (f2) @ app_46'28 (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L70: ; Continuation
  push [bp+2]
  push cx
  push #L69
  mov cx, sp
  ;; (46'28) Tail: app_46'25 (f3) @ app_44'25 (arg)
  mov bp, [bp+3]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L71: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L70
  mov cx, sp
  ;; (44'25) Tail: app_44'22 (arg) @ xs (f4)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+4]
  mov ax, [bp]
  jmp [ax]

L72: ; Continuation
  push [bp+3]
  push dx
  push [bp+2]
  push cx
  push #L71
  mov cx, sp
  ;; (44'22) Tail: rev_onto (g8) @ con_44'22 (g24)
  mov bp, #g8
  mov dx, #g24
  mov ax, [bp]
  jmp [ax]

L73: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L72
  mov cx, sp
  ;; (46'25) Tail: rev_onto (g8) @ ys (arg)
  mov bp, #g8
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L74: ; Continuation
  push dx
  push [bp+2]
  push cx
  push #L73
  mov cx, sp
  ;; (91'32) Tail: explode (f3) @ s2 (f4)
  mov dx, [bp+4]
  mov bp, [bp+3]
  mov ax, [bp]
  jmp [ax]

L75: ; Continuation
  push dx
  push [bp+3]
  push [bp+2]
  push cx
  push #L74
  mov cx, sp
  ;; (91'19) Tail: explode (f3) @ x (f4)
  mov dx, [bp+4]
  mov bp, [bp+3]
  mov ax, [bp]
  jmp [ax]

L76: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L68
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push [1]
  push [bp+2]
  push [bp+1]
  push cx
  push #L75
  mov cx, sp
  ;; (96'24) Tail: concat (me) @ xs (t2)
  mov bp, bp
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L77: ; Continuation
  push [bp+2]
  push dx
  push #1
  mov 1, sp
  ;; (0'0) Return: con_0'0 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L78: ; Arm: 151'11
  push [bp+3]
  push cx
  push #L77
  mov cx, sp
  ;; (151'26) Tail: rev_implode (f1) @ accCs (f5)
  mov dx, [bp+5]
  mov bp, [bp+1]
  mov ax, [bp]
  jmp [ax]

L79: ; Continuation
  ;; (153'74) Tail: app_153'45 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L80: ; Continuation
  push [bp+3]
  push dx
  push #1
  mov 1, sp
  push [bp+4]
  push cx
  push #L79
  mov cx, sp
  ;; (153'45) Tail: at_word_start (f2) @ con_0'0 (t1)
  mov bp, [bp+2]
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L81: ; Arm: 153'26
  push [2]
  push [bp+3]
  push [bp+2]
  push cx
  push #L80
  mov cx, sp
  ;; (153'58) Tail: rev_implode (f1) @ accCs (f5)
  mov dx, [bp+5]
  mov bp, [bp+1]
  mov ax, [bp]
  jmp [ax]

L82: ; Continuation
  ;; (154'43) Tail: app_154'32 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L83: ; Continuation
  push [bp+2]
  push [bp+3]
  push #1
  mov 1, sp
  push [bp+4]
  push cx
  push #L82
  mov cx, sp
  ;; (154'32) Tail: app_154'26 (arg) @ con_0'0 (t1)
  mov bp, dx
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L84: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L78
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov ax, [1]
  cmp ax, #' '
  call bios_make_bool_from_z
  mov 3, ax
  mov bx, [3]
  cmp [bx], #1
  bz L81
  push [2]
  push [1]
  push [bp+5]
  push cx
  push #L83
  mov cx, sp
  ;; (154'26) Tail: have_letter (f4) @ accWs (f3)
  mov dx, [bp+3]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp [ax]

L85: ; Function: t1
  push dx
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push #L84
  mov 1, sp
  ;; (0'0) Return: lam_149'36 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L86: ; Function: t1
  push bp
  push dx
  push [bp+2]
  push [bp+1]
  push #L85
  mov 1, sp
  ;; (0'0) Return: lam_149'30 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L87: ; Arm: 158'9
  ;; (148'24) Return: accWs (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L88: ; Continuation
  ;; (160'49) Tail: app_160'43 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L89: ; Arm: 160'24
  push [2]
  push cx
  push #L88
  mov cx, sp
  ;; (160'43) Tail: at_word_start (f2) @ accWs (f1)
  mov dx, [bp+1]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L90: ; Continuation
  ;; (161'31) Tail: app_161'27 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L91: ; Continuation
  push #g27
  push [bp+2]
  push #1
  mov 1, sp
  push [bp+3]
  push cx
  push #L90
  mov cx, sp
  ;; (161'27) Tail: app_161'21 (arg) @ con_161'28 (t1)
  mov bp, dx
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L92: ; Function: t2
  mov bx, dx
  cmp [bx], #0
  bz L87
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov ax, [1]
  cmp ax, #' '
  call bios_make_bool_from_z
  mov 3, ax
  mov bx, [3]
  cmp [bx], #1
  bz L89
  push [2]
  push [1]
  push cx
  push #L91
  mov cx, sp
  ;; (161'21) Tail: have_letter (f3) @ accWs (f1)
  mov dx, [bp+1]
  mov bp, [bp+3]
  mov ax, [bp]
  jmp [ax]

L93: ; Function: t2
  push bp
  push [bp+1]
  push #L86
  mov 1, sp
  push [1]
  push bp
  push dx
  push #L92
  mov 2, sp
  ;; (0'0) Return: lam_156'8 (t2)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L94: ; Arm: 132'22
  mov ax, #'\n'
  call bios_put_char
  mov 4, ax
  ;; (132'51) Tail: rev_implode (f1) @ acc (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L95: ; Arm: 133'28
  mov ax, #'^'
  call bios_put_char
  mov 5, ax
  mov ax, #'D'
  call bios_put_char
  mov 6, ax
  mov ax, #'\n'
  call bios_put_char
  mov 7, ax
  push dx
  push #'\EOT'
  push #1
  mov 8, sp
  ;; (133'76) Tail: rev_implode (f1) @ con_0'0 (t8)
  mov bp, [bp+1]
  mov dx, [8]
  mov ax, [bp]
  jmp [ax]

L96: ; Arm: 134'19
  ;; (134'33) Tail: readloop (me) @ acc (arg)
  mov bp, bp
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L97: ; Arm: 137'17
  ;; (137'29) Tail: readloop (me) @ acc (arg)
  mov bp, bp
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L98: ; Continuation
  mov ax, #'\b'
  call bios_put_char
  mov 1, ax
  mov ax, #' '
  call bios_put_char
  mov 2, ax
  mov ax, #'\b'
  call bios_put_char
  mov 3, ax
  ;; (141'24) Tail: readloop (f2) @ tail (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L99: ; Arm: 139'31
  mov ax, #'\b'
  call bios_put_char
  mov 1, ax
  mov ax, #' '
  call bios_put_char
  mov 2, ax
  mov ax, #'\b'
  call bios_put_char
  mov 3, ax
  ;; (0'0) Return: prim_0'0 (t3)
  mov dx, [3]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L100: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L98
  mov cx, sp
  mov bx, dx
  cmp [bx], #1
  bz L99
  ;; (0'0) Return: con_139'55 (g33)
  mov dx, #g33
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L101: ; Arm: 8'9
  ;; (0'0) Return: con_8'12 (g31)
  mov dx, #g31
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L102: ; Arm: 135'21
  mov bx, dx
  cmp [bx], #0
  bz L97
  mov ax, [bx+1]
  mov 7, ax
  mov ax, [bx+2]
  mov 8, ax
  mov ax, [7]
  call bios_char_to_num
  mov 9, ax
  mov ax, #26
  cmp ax, [9]
  call bios_make_bool_from_n
  mov 10, ax
  push [8]
  push bp
  push cx
  push #L100
  mov cx, sp
  mov bx, [10]
  cmp [bx], #1
  bz L101
  ;; (0'0) Return: con_9'13 (g32)
  mov dx, #g32
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L103: ; Continuation
  push [bp+2]
  push [bp+4]
  push #1
  mov 1, sp
  ;; (143'34) Tail: readloop (f3) @ con_0'0 (t1)
  mov bp, [bp+3]
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L104: ; Arm: 104'19
  mov ax, [1]
  call bios_put_char
  mov 9, ax
  ;; (0'0) Return: prim_0'0 (t9)
  mov dx, [9]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L105: ; Arm: 105'22
  mov ax, [1]
  call bios_put_char
  mov 10, ax
  ;; (0'0) Return: prim_0'0 (t10)
  mov dx, [10]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L106: ; Arm: 106'16
  mov ax, [1]
  call bios_put_char
  mov 11, ax
  ;; (0'0) Return: prim_0'0 (t11)
  mov dx, [11]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L107: ; Function: t1
  call bios_get_char
  mov 1, ax
  mov ax, [1]
  call bios_char_to_num
  mov 2, ax
  mov ax, [1]
  cmp ax, #'\n'
  call bios_make_bool_from_z
  mov 3, ax
  mov bx, [3]
  cmp [bx], #1
  bz L94
  mov ax, [1]
  cmp ax, #'\EOT'
  call bios_make_bool_from_z
  mov 4, ax
  mov bx, [4]
  cmp [bx], #1
  bz L95
  mov ax, #127
  cmp ax, [2]
  call bios_make_bool_from_n
  mov 5, ax
  mov bx, [5]
  cmp [bx], #1
  bz L96
  mov ax, [2]
  cmp ax, #127
  call bios_make_bool_from_z
  mov 6, ax
  mov bx, [6]
  cmp [bx], #1
  bz L102
  mov ax, [1]
  call bios_char_to_num
  mov 7, ax
  mov ax, [7]
  cmp ax, #8
  call bios_make_bool_from_z
  mov 8, ax
  push [1]
  push bp
  push dx
  push cx
  push #L103
  mov cx, sp
  mov bx, [8]
  cmp [bx], #1
  bz L104
  mov ax, [1]
  cmp ax, #'\n'
  call bios_make_bool_from_z
  mov 9, ax
  mov bx, [9]
  cmp [bx], #1
  bz L105
  mov ax, #26
  cmp ax, [7]
  call bios_make_bool_from_n
  mov 10, ax
  mov bx, [10]
  cmp [bx], #1
  bz L106
  mov ax, #'^'
  call bios_put_char
  mov 11, ax
  mov ax, #65
  add ax, [7]
  mov 12, ax
  mov ax, [12]
  sub ax, #1
  mov 13, ax
  mov ax, [13]
  call bios_num_to_char
  mov 14, ax
  mov ax, [14]
  call bios_put_char
  mov 15, ax
  ;; (0'0) Return: prim_0'0 (t15)
  mov dx, [15]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L108: ; Arm: 213'36
  ;; (0'0) Return: con_213'41 (g35)
  mov dx, #g35
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L109: ; Continuation
  ;; (215'13) Tail: mainloop (f2) @ fs (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L110: ; Arm: 206'7
  ;; (209'17) Return: fs (f5)
  mov dx, [bp+5]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L111: ; Arm: 177'9
  ;; (0'0) Return: con_177'12 (g38)
  mov dx, #g38
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L112: ; Arm: 181'35
  push [bp+4]
  push #1
  mov 1, sp
  ;; (0'0) Return: con_181'40 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L113: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L112
  ;; (181'60) Tail: loop (f2) @ ps (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L114: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push cx
  push #L113
  mov cx, sp
  ;; (181'28) Tail: app_181'23 (arg) @ command (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L115: ; Function: t3
  mov bx, dx
  cmp [bx], #0
  bz L111
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov bx, [1]
  mov ax, [bx+1]
  mov 3, ax
  mov ax, [bx+2]
  mov 4, ax
  push [4]
  push [2]
  push bp
  push [bp+2]
  push cx
  push #L114
  mov cx, sp
  ;; (181'23) Tail: eq_string (f1) @ name (t3)
  mov bp, [bp+1]
  mov dx, [3]
  mov ax, [bp]
  jmp [ax]

L116: ; Continuation
  ;; (209'17) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L117: ; Continuation
  push [bp+2]
  push cx
  push #L116
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, #g25
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L118: ; Continuation
  push [bp+3]
  push cx
  push #L117
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L119: ; Continuation
  push [bp+4]
  push [bp+3]
  push cx
  push #L118
  mov cx, sp
  ;; (91'10) Tail: implode (f2) @ app_46'28 (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L120: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L119
  mov cx, sp
  ;; (46'28) Tail: app_46'25 (f5) @ app_44'25 (arg)
  mov bp, [bp+5]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L121: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L120
  mov cx, sp
  ;; (44'25) Tail: app_44'22 (arg) @ xs (f6)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+6]
  mov ax, [bp]
  jmp [ax]

L122: ; Continuation
  push [bp+5]
  push dx
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L121
  mov cx, sp
  ;; (44'22) Tail: rev_onto (g8) @ con_44'22 (g46)
  mov bp, #g8
  mov dx, #g46
  mov ax, [bp]
  jmp [ax]

L123: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L122
  mov cx, sp
  ;; (46'25) Tail: rev_onto (g8) @ ys (arg)
  mov bp, #g8
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L124: ; Continuation
  push dx
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L123
  mov cx, sp
  ;; (91'32) Tail: explode (f3) @ s2 (f5)
  mov dx, [bp+5]
  mov bp, [bp+3]
  mov ax, [bp]
  jmp [ax]

L125: ; Continuation
  push dx
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L124
  mov cx, sp
  ;; (91'19) Tail: explode (f3) @ lit_196'26 (g45)
  mov bp, [bp+3]
  mov dx, #g45
  mov ax, [bp]
  jmp [ax]

L126: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L125
  mov cx, sp
  ;; (91'10) Tail: implode (f2) @ app_46'28 (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L127: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L126
  mov cx, sp
  ;; (46'28) Tail: app_46'25 (f5) @ app_44'25 (arg)
  mov bp, [bp+5]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L128: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L127
  mov cx, sp
  ;; (44'25) Tail: app_44'22 (arg) @ xs (f6)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+6]
  mov ax, [bp]
  jmp [ax]

L129: ; Continuation
  push [bp+5]
  push dx
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L128
  mov cx, sp
  ;; (44'22) Tail: rev_onto (g8) @ con_44'22 (g44)
  mov bp, #g8
  mov dx, #g44
  mov ax, [bp]
  jmp [ax]

L130: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L129
  mov cx, sp
  ;; (46'25) Tail: rev_onto (g8) @ ys (arg)
  mov bp, #g8
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L131: ; Continuation
  push dx
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L130
  mov cx, sp
  ;; (91'32) Tail: explode (f3) @ s2 (f5)
  mov dx, [bp+5]
  mov bp, [bp+3]
  mov ax, [bp]
  jmp [ax]

L132: ; Continuation
  push dx
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L131
  mov cx, sp
  ;; (91'19) Tail: explode (f3) @ command (f5)
  mov dx, [bp+5]
  mov bp, [bp+3]
  mov ax, [bp]
  jmp [ax]

L133: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L132
  mov cx, sp
  ;; (91'10) Tail: implode (f2) @ app_46'28 (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L134: ; Continuation
  push [bp+6]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L133
  mov cx, sp
  ;; (46'28) Tail: app_46'25 (f5) @ app_44'25 (arg)
  mov bp, [bp+5]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L135: ; Continuation
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L134
  mov cx, sp
  ;; (44'25) Tail: app_44'22 (arg) @ xs (f7)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+7]
  mov ax, [bp]
  jmp [ax]

L136: ; Continuation
  push [bp+6]
  push [bp+5]
  push dx
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L135
  mov cx, sp
  ;; (44'22) Tail: rev_onto (g8) @ con_44'22 (g43)
  mov bp, #g8
  mov dx, #g43
  mov ax, [bp]
  jmp [ax]

L137: ; Continuation
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L136
  mov cx, sp
  ;; (46'25) Tail: rev_onto (g8) @ ys (arg)
  mov bp, #g8
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L138: ; Continuation
  push dx
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L137
  mov cx, sp
  ;; (91'32) Tail: explode (f3) @ s2 (f6)
  mov dx, [bp+6]
  mov bp, [bp+3]
  mov ax, [bp]
  jmp [ax]

L139: ; Continuation
  push dx
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L138
  mov cx, sp
  ;; (91'19) Tail: explode (f3) @ lit_196'43 (g42)
  mov bp, [bp+3]
  mov dx, #g42
  mov ax, [bp]
  jmp [ax]

L140: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L139
  mov cx, sp
  ;; (91'10) Tail: implode (f2) @ app_46'28 (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L141: ; Continuation
  push [bp+6]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L140
  mov cx, sp
  ;; (46'28) Tail: app_46'25 (f5) @ app_44'25 (arg)
  mov bp, [bp+5]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L142: ; Continuation
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L141
  mov cx, sp
  ;; (44'25) Tail: app_44'22 (arg) @ xs (f7)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+7]
  mov ax, [bp]
  jmp [ax]

L143: ; Continuation
  push [bp+6]
  push [bp+5]
  push dx
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L142
  mov cx, sp
  ;; (44'22) Tail: rev_onto (g8) @ con_44'22 (g41)
  mov bp, #g8
  mov dx, #g41
  mov ax, [bp]
  jmp [ax]

L144: ; Continuation
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L143
  mov cx, sp
  ;; (46'25) Tail: rev_onto (g8) @ ys (arg)
  mov bp, #g8
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L145: ; Continuation
  push dx
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L144
  mov cx, sp
  ;; (91'32) Tail: explode (f3) @ lit_196'50 (g40)
  mov bp, [bp+3]
  mov dx, #g40
  mov ax, [bp]
  jmp [ax]

L146: ; Arm: 198'9
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L145
  mov cx, sp
  ;; (91'19) Tail: explode (f3) @ lit_198'16 (g39)
  mov bp, [bp+3]
  mov dx, #g39
  mov ax, [bp]
  jmp [ax]

L147: ; Continuation
  ;; (209'17) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L148: ; Continuation
  push [bp+2]
  push cx
  push #L147
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, #g25
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L149: ; Continuation
  push [bp+3]
  push cx
  push #L148
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L150: ; Continuation
  push [bp+4]
  push [bp+3]
  push cx
  push #L149
  mov cx, sp
  ;; (91'10) Tail: implode (f2) @ app_46'28 (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L151: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L150
  mov cx, sp
  ;; (46'28) Tail: app_46'25 (f5) @ app_44'25 (arg)
  mov bp, [bp+5]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L152: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L151
  mov cx, sp
  ;; (44'25) Tail: app_44'22 (arg) @ xs (f6)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+6]
  mov ax, [bp]
  jmp [ax]

L153: ; Continuation
  push [bp+5]
  push dx
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L152
  mov cx, sp
  ;; (44'22) Tail: rev_onto (g8) @ con_44'22 (g54)
  mov bp, #g8
  mov dx, #g54
  mov ax, [bp]
  jmp [ax]

L154: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L153
  mov cx, sp
  ;; (46'25) Tail: rev_onto (g8) @ ys (arg)
  mov bp, #g8
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L155: ; Continuation
  push dx
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L154
  mov cx, sp
  ;; (91'32) Tail: explode (f3) @ s2 (f5)
  mov dx, [bp+5]
  mov bp, [bp+3]
  mov ax, [bp]
  jmp [ax]

L156: ; Continuation
  push dx
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L155
  mov cx, sp
  ;; (91'19) Tail: explode (f3) @ lit_196'26 (g53)
  mov bp, [bp+3]
  mov dx, #g53
  mov ax, [bp]
  jmp [ax]

L157: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L156
  mov cx, sp
  ;; (91'10) Tail: implode (f2) @ app_46'28 (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L158: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L157
  mov cx, sp
  ;; (46'28) Tail: app_46'25 (f5) @ app_44'25 (arg)
  mov bp, [bp+5]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L159: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L158
  mov cx, sp
  ;; (44'25) Tail: app_44'22 (arg) @ xs (f6)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+6]
  mov ax, [bp]
  jmp [ax]

L160: ; Continuation
  push [bp+5]
  push dx
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L159
  mov cx, sp
  ;; (44'22) Tail: rev_onto (g8) @ con_44'22 (g52)
  mov bp, #g8
  mov dx, #g52
  mov ax, [bp]
  jmp [ax]

L161: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L160
  mov cx, sp
  ;; (46'25) Tail: rev_onto (g8) @ ys (arg)
  mov bp, #g8
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L162: ; Continuation
  push dx
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L161
  mov cx, sp
  ;; (91'32) Tail: explode (f3) @ s2 (f5)
  mov dx, [bp+5]
  mov bp, [bp+3]
  mov ax, [bp]
  jmp [ax]

L163: ; Continuation
  push dx
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L162
  mov cx, sp
  ;; (91'19) Tail: explode (f3) @ command (f5)
  mov dx, [bp+5]
  mov bp, [bp+3]
  mov ax, [bp]
  jmp [ax]

L164: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L163
  mov cx, sp
  ;; (91'10) Tail: implode (f2) @ app_46'28 (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L165: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L164
  mov cx, sp
  ;; (46'28) Tail: app_46'25 (f6) @ app_44'25 (arg)
  mov bp, [bp+6]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L166: ; Continuation
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L165
  mov cx, sp
  ;; (44'25) Tail: app_44'22 (arg) @ xs (f7)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+7]
  mov ax, [bp]
  jmp [ax]

L167: ; Continuation
  push [bp+6]
  push dx
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L166
  mov cx, sp
  ;; (44'22) Tail: rev_onto (g8) @ con_44'22 (g51)
  mov bp, #g8
  mov dx, #g51
  mov ax, [bp]
  jmp [ax]

L168: ; Continuation
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L167
  mov cx, sp
  ;; (46'25) Tail: rev_onto (g8) @ ys (arg)
  mov bp, #g8
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L169: ; Continuation
  push dx
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L168
  mov cx, sp
  ;; (91'32) Tail: explode (f3) @ s2 (f6)
  mov dx, [bp+6]
  mov bp, [bp+3]
  mov ax, [bp]
  jmp [ax]

L170: ; Continuation
  push dx
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L169
  mov cx, sp
  ;; (91'19) Tail: explode (f3) @ lit_196'43 (g50)
  mov bp, [bp+3]
  mov dx, #g50
  mov ax, [bp]
  jmp [ax]

L171: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L170
  mov cx, sp
  ;; (91'10) Tail: implode (f2) @ app_46'28 (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L172: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L171
  mov cx, sp
  ;; (46'28) Tail: app_46'25 (f6) @ app_44'25 (arg)
  mov bp, [bp+6]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L173: ; Continuation
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L172
  mov cx, sp
  ;; (44'25) Tail: app_44'22 (arg) @ xs (f7)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+7]
  mov ax, [bp]
  jmp [ax]

L174: ; Continuation
  push [bp+6]
  push dx
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L173
  mov cx, sp
  ;; (44'22) Tail: rev_onto (g8) @ con_44'22 (g49)
  mov bp, #g8
  mov dx, #g49
  mov ax, [bp]
  jmp [ax]

L175: ; Continuation
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L174
  mov cx, sp
  ;; (46'25) Tail: rev_onto (g8) @ ys (arg)
  mov bp, #g8
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L176: ; Continuation
  push dx
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L175
  mov cx, sp
  ;; (91'32) Tail: explode (f3) @ lit_196'50 (g48)
  mov bp, [bp+3]
  mov dx, #g48
  mov ax, [bp]
  jmp [ax]

L177: ; Arm: 201'14
  mov ax, [bx+1]
  mov 2, ax
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L176
  mov cx, sp
  ;; (91'19) Tail: explode (f3) @ lit_201'21 (g47)
  mov bp, [bp+3]
  mov dx, #g47
  mov ax, [bp]
  jmp [ax]

L178: ; Continuation
  ;; (202'32) Tail: app_202'29 (arg) @ args (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L179: ; Continuation
  mov bx, dx
  cmp [bx], #0
  bz L146
  mov ax, [bx+1]
  mov 1, ax
  mov bx, [1]
  cmp [bx], #0
  bz L177
  mov ax, [bx+1]
  mov 2, ax
  mov ax, [bx+2]
  mov 3, ax
  push [bp+6]
  push cx
  push #L178
  mov cx, sp
  ;; (202'29) Tail: f (t3) @ fs (f4)
  mov dx, [bp+4]
  mov bp, [3]
  mov ax, [bp]
  jmp [ax]

L180: ; Continuation
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L179
  mov cx, sp
  ;; (183'17) Tail: loop (f7) @ case_172'18 (arg)
  mov bp, [bp+7]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L181: ; Continuation
  push [bp+6]
  push cx
  push #L109
  mov cx, sp
  mov bx, dx
  cmp [bx], #0
  bz L110
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push [1]
  push [bp+4]
  push #L115
  mov 3, sp
  push [3]
  push [2]
  push [1]
  push [bp+5]
  push [bp+3]
  push [bp+2]
  push cx
  push #L180
  mov cx, sp
  mov bx, [bp+5]
  mov ax, [bx+1]
  mov 4, ax
  ;; (172'43) Return: ps (t4)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L182: ; Continuation
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L181
  mov cx, sp
  ;; (44'25) Tail: app_44'22 (arg) @ xs (f7)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+7]
  mov ax, [bp]
  jmp [ax]

L183: ; Continuation
  push dx
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L182
  mov cx, sp
  ;; (44'22) Tail: rev_onto (g8) @ con_44'22 (g37)
  mov bp, #g8
  mov dx, #g37
  mov ax, [bp]
  jmp [ax]

L184: ; Continuation
  push [bp+7]
  push [bp+6]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L183
  mov cx, sp
  ;; (164'33) Tail: app_164'30 (f5) @ app_164'42 (arg)
  mov bp, [bp+5]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L185: ; Continuation
  push [bp+6]
  push [bp+5]
  push dx
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L184
  mov cx, sp
  ;; (164'42) Tail: explode (f3) @ line (f7)
  mov dx, [bp+7]
  mov bp, [bp+3]
  mov ax, [bp]
  jmp [ax]

L186: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L108
  push [bp+8]
  push [bp+7]
  push [bp+6]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L185
  mov cx, sp
  ;; (164'30) Tail: at_word_start (f5) @ con_164'30 (g36)
  mov bp, [bp+5]
  mov dx, #g36
  mov ax, [bp]
  jmp [ax]

L187: ; Continuation
  push [bp+9]
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L186
  mov cx, sp
  ;; (213'20) Tail: app_213'15 (arg) @ single_controlD (f8)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+8]
  mov ax, [bp]
  jmp [ax]

L188: ; Continuation
  push dx
  push [bp+8]
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L187
  mov cx, sp
  ;; (213'15) Tail: eq_string (f4) @ line (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L189: ; Continuation
  push [bp+3]
  push #L107
  mov 1, sp
  push dx
  push [bp+8]
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+2]
  push cx
  push #L188
  mov cx, sp
  ;; (145'11) Tail: readloop (t1) @ con_145'11 (g34)
  mov bp, [1]
  mov dx, #g34
  mov ax, [bp]
  jmp [ax]

L190: ; Continuation
  push #g29
  push #'\EOT'
  push #1
  mov 1, sp
  push [bp+8]
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L189
  mov cx, sp
  ;; (211'32) Tail: implode (f2) @ con_0'0 (t1)
  mov bp, [bp+2]
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L191: ; Continuation
  push [bp+8]
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L190
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, #g25
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L192: ; Function: t3
  push bp
  push dx
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push cx
  push #L191
  mov cx, sp
  ;; (114'38) Tail: explode (f3) @ lit_210'13 (g28)
  mov bp, [bp+3]
  mov dx, #g28
  mov ax, [bp]
  jmp [ax]

L193: ; Continuation
  ;; (217'17) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L194: ; Continuation
  push [bp+2]
  push cx
  push #L193
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, #g25
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L195: ; Arm: 219'9
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push [bp+2]
  push cx
  push #L194
  mov cx, sp
  ;; (114'38) Tail: explode (f1) @ lit_219'23 (g62)
  mov bp, [bp+1]
  mov dx, #g62
  mov ax, [bp]
  jmp [ax]

L196: ; Arm: 188'9
  ;; (0'0) Return: con_188'12 (g64)
  mov dx, #g64
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L197: ; Continuation
  ;; (189'48) Tail: loop (f2) @ xs (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L198: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L197
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, #g25
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L199: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L196
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov ax, #' '
  call bios_put_char
  mov 3, ax
  push [2]
  push bp
  push cx
  push #L198
  mov cx, sp
  ;; (114'38) Tail: explode (f1) @ x (t1)
  mov bp, [bp+1]
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L200: ; Continuation
  mov ax, #'\n'
  call bios_put_char
  mov 1, ax
  ;; (217'17) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L201: ; Arm: 192'9
  ;; (0'0) Return: con_192'12 (g65)
  mov dx, #g65
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L202: ; Continuation
  ;; (193'34) Tail: loop (f2) @ xs (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L203: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L202
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, #g25
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L204: ; Continuation
  push [bp+2]
  push #L199
  mov 1, sp
  push [bp+3]
  push cx
  push #L200
  mov cx, sp
  mov bx, dx
  cmp [bx], #0
  bz L201
  mov ax, [bx+1]
  mov 2, ax
  mov ax, [bx+2]
  mov 3, ax
  push [3]
  push [1]
  push cx
  push #L203
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ x (t2)
  mov bp, [bp+2]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L205: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L204
  mov cx, sp
  ;; (223'43) Tail: app_223'33 (f4) @ case_172'18 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L206: ; Continuation
  push dx
  push [bp+3]
  push [bp+2]
  push cx
  push #L205
  mov cx, sp
  mov bx, [bp+3]
  mov ax, [bx+1]
  mov 1, ax
  ;; (172'43) Return: ps (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L207: ; Function: t1
  mov bx, dx
  cmp [bx], #1
  bz L195
  push [bp+2]
  push [bp+1]
  push cx
  push #L206
  mov cx, sp
  ;; (223'33) Tail: map (g3) @ lam_222'19 (g63)
  mov bp, #g3
  mov dx, #g63
  mov ax, [bp]
  jmp [ax]

L208: ; Function: t1
  push dx
  push [bp+1]
  push #L207
  mov 1, sp
  ;; (0'0) Return: lam_217'20 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L209: ; Continuation
  ;; (225'18) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L210: ; Continuation
  push [bp+2]
  push cx
  push #L209
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, #g25
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L211: ; Arm: 235'7
  push [bp+4]
  push cx
  push #L210
  mov cx, sp
  ;; (114'38) Tail: explode (f1) @ lit_235'22 (g68)
  mov bp, [bp+1]
  mov dx, #g68
  mov ax, [bp]
  jmp [ax]

L212: ; Arm: 177'9
  ;; (0'0) Return: con_177'12 (g69)
  mov dx, #g69
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L213: ; Arm: 181'35
  push [bp+4]
  push #1
  mov 1, sp
  ;; (0'0) Return: con_181'40 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L214: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L213
  ;; (181'60) Tail: loop (f2) @ ps (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L215: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push cx
  push #L214
  mov cx, sp
  ;; (181'28) Tail: app_181'23 (arg) @ x (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L216: ; Function: t3
  mov bx, dx
  cmp [bx], #0
  bz L212
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov bx, [1]
  mov ax, [bx+1]
  mov 3, ax
  mov ax, [bx+2]
  mov 4, ax
  push [4]
  push [2]
  push bp
  push [bp+2]
  push cx
  push #L215
  mov cx, sp
  ;; (181'23) Tail: eq_string (f1) @ name (t3)
  mov bp, [bp+1]
  mov dx, [3]
  mov ax, [bp]
  jmp [ax]

L217: ; Arm: 177'9
  ;; (0'0) Return: con_177'12 (g78)
  mov dx, #g78
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L218: ; Arm: 181'35
  push [bp+4]
  push #1
  mov 1, sp
  ;; (0'0) Return: con_181'40 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L219: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L218
  ;; (181'60) Tail: loop (f2) @ ps (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L220: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push cx
  push #L219
  mov cx, sp
  ;; (181'28) Tail: app_181'23 (arg) @ x (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L221: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L217
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov bx, [1]
  mov ax, [bx+1]
  mov 3, ax
  mov ax, [bx+2]
  mov 4, ax
  push [4]
  push [2]
  push bp
  push [bp+2]
  push cx
  push #L220
  mov cx, sp
  ;; (181'23) Tail: eq_string (f1) @ name (t3)
  mov bp, [bp+1]
  mov dx, [3]
  mov ax, [bp]
  jmp [ax]

L222: ; Continuation
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, #g25
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L223: ; Continuation
  push cx
  push #L222
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L224: ; Arm: 228'11
  push #g82
  push [bp+4]
  push #1
  mov 1, sp
  push [1]
  push #g79
  push #1
  mov 2, sp
  push [bp+2]
  push cx
  push #L223
  mov cx, sp
  ;; (228'33) Tail: concat (f3) @ con_228'34 (t2)
  mov bp, [bp+3]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L225: ; Continuation
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, #g25
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L226: ; Arm: 231'16
  mov ax, [bx+1]
  mov 2, ax
  push cx
  push #L225
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ s (t2)
  mov bp, [bp+2]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L227: ; Continuation
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, #g25
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L228: ; Continuation
  push cx
  push #L227
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L229: ; Continuation
  mov bx, dx
  cmp [bx], #0
  bz L224
  mov ax, [bx+1]
  mov 1, ax
  mov bx, [1]
  cmp [bx], #0
  bz L226
  mov ax, [bx+1]
  mov 2, ax
  mov ax, [bx+2]
  mov 3, ax
  push #g86
  push [bp+4]
  push #1
  mov 4, sp
  push [4]
  push #g83
  push #1
  mov 5, sp
  push [bp+2]
  push cx
  push #L228
  mov cx, sp
  ;; (232'48) Tail: concat (f3) @ con_232'49 (t5)
  mov bp, [bp+3]
  mov dx, [5]
  mov ax, [bp]
  jmp [ax]

L230: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L229
  mov cx, sp
  ;; (183'17) Tail: loop (f5) @ case_172'18 (arg)
  mov bp, [bp+5]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L231: ; Function: t1
  push dx
  push [bp+2]
  push #L221
  mov 1, sp
  push [1]
  push dx
  push [bp+3]
  push [bp+1]
  push cx
  push #L230
  mov cx, sp
  mov bx, [bp+4]
  mov ax, [bx+1]
  mov 2, ax
  ;; (172'43) Return: ps (t2)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L232: ; Continuation
  ;; (225'18) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L233: ; Continuation
  push [bp+2]
  push cx
  push #L232
  mov cx, sp
  ;; (236'32) Tail: app_236'27 (arg) @ xs (f3)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+3]
  mov ax, [bp]
  jmp [ax]

L234: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push #L231
  mov 1, sp
  push [bp+6]
  push [bp+5]
  push cx
  push #L233
  mov cx, sp
  ;; (236'27) Tail: iter (g5) @ lam_226'11 (t1)
  mov bp, #g5
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L235: ; Continuation
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, #g25
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L236: ; Continuation
  push cx
  push #L235
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L237: ; Arm: 228'11
  push #g73
  push [bp+6]
  push #1
  mov 1, sp
  push [1]
  push #g70
  push #1
  mov 2, sp
  push [bp+2]
  push cx
  push #L236
  mov cx, sp
  ;; (228'33) Tail: concat (f4) @ con_228'34 (t2)
  mov bp, [bp+4]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L238: ; Continuation
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, #g25
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L239: ; Arm: 231'16
  mov ax, [bx+1]
  mov 2, ax
  push cx
  push #L238
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ s (t2)
  mov bp, [bp+2]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L240: ; Continuation
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, #g25
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L241: ; Continuation
  push cx
  push #L240
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L242: ; Continuation
  push [bp+7]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L234
  mov cx, sp
  mov bx, dx
  cmp [bx], #0
  bz L237
  mov ax, [bx+1]
  mov 1, ax
  mov bx, [1]
  cmp [bx], #0
  bz L239
  mov ax, [bx+1]
  mov 2, ax
  mov ax, [bx+2]
  mov 3, ax
  push #g77
  push [bp+6]
  push #1
  mov 4, sp
  push [4]
  push #g74
  push #1
  mov 5, sp
  push [bp+2]
  push cx
  push #L241
  mov cx, sp
  ;; (232'48) Tail: concat (f4) @ con_232'49 (t5)
  mov bp, [bp+4]
  mov dx, [5]
  mov ax, [bp]
  jmp [ax]

L243: ; Continuation
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L242
  mov cx, sp
  ;; (183'17) Tail: loop (f8) @ case_172'18 (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L244: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L211
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push [1]
  push [bp+2]
  push #L216
  mov 3, sp
  push [3]
  push [2]
  push [1]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push cx
  push #L243
  mov cx, sp
  mov bx, [bp+4]
  mov ax, [bx+1]
  mov 4, ax
  ;; (172'43) Return: ps (t4)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L245: ; Function: t4
  push dx
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push #L244
  mov 1, sp
  ;; (0'0) Return: lam_225'21 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L246: ; Continuation
  ;; (238'18) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L247: ; Continuation
  push [bp+2]
  push cx
  push #L246
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, #g25
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L248: ; Arm: 249'7
  push [bp+4]
  push cx
  push #L247
  mov cx, sp
  ;; (114'38) Tail: explode (f1) @ lit_249'22 (g89)
  mov bp, [bp+1]
  mov dx, #g89
  mov ax, [bp]
  jmp [ax]

L249: ; Arm: 177'9
  ;; (0'0) Return: con_177'12 (g90)
  mov dx, #g90
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L250: ; Arm: 181'35
  push [bp+4]
  push #1
  mov 1, sp
  ;; (0'0) Return: con_181'40 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L251: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L250
  ;; (181'60) Tail: loop (f2) @ ps (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L252: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push cx
  push #L251
  mov cx, sp
  ;; (181'28) Tail: app_181'23 (arg) @ x (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L253: ; Function: t3
  mov bx, dx
  cmp [bx], #0
  bz L249
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov bx, [1]
  mov ax, [bx+1]
  mov 3, ax
  mov ax, [bx+2]
  mov 4, ax
  push [4]
  push [2]
  push bp
  push [bp+2]
  push cx
  push #L252
  mov cx, sp
  ;; (181'23) Tail: eq_string (f1) @ name (t3)
  mov bp, [bp+1]
  mov dx, [3]
  mov ax, [bp]
  jmp [ax]

L254: ; Arm: 177'9
  ;; (0'0) Return: con_177'12 (g99)
  mov dx, #g99
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L255: ; Arm: 181'35
  push [bp+4]
  push #1
  mov 1, sp
  ;; (0'0) Return: con_181'40 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L256: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L255
  ;; (181'60) Tail: loop (f2) @ ps (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L257: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push cx
  push #L256
  mov cx, sp
  ;; (181'28) Tail: app_181'23 (arg) @ name (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L258: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L254
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov bx, [1]
  mov ax, [bx+1]
  mov 3, ax
  mov ax, [bx+2]
  mov 4, ax
  push [4]
  push [2]
  push bp
  push [bp+2]
  push cx
  push #L257
  mov cx, sp
  ;; (181'23) Tail: eq_string (f1) @ name (t3)
  mov bp, [bp+1]
  mov dx, [3]
  mov ax, [bp]
  jmp [ax]

L259: ; Continuation
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, #g25
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L260: ; Continuation
  push cx
  push #L259
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L261: ; Arm: 242'11
  push #g103
  push [bp+4]
  push #1
  mov 1, sp
  push [1]
  push #g100
  push #1
  mov 2, sp
  push [bp+2]
  push cx
  push #L260
  mov cx, sp
  ;; (240'35) Tail: concat (f3) @ con_240'36 (t2)
  mov bp, [bp+3]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L262: ; Continuation
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, #g25
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L263: ; Continuation
  push cx
  push #L262
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L264: ; Arm: 245'16
  mov ax, [bx+1]
  mov 2, ax
  push #g107
  push [bp+4]
  push #1
  mov 3, sp
  push [3]
  push #g104
  push #1
  mov 4, sp
  push [bp+2]
  push cx
  push #L263
  mov cx, sp
  ;; (240'35) Tail: concat (f3) @ con_240'36 (t4)
  mov bp, [bp+3]
  mov dx, [4]
  mov ax, [bp]
  jmp [ax]

L265: ; Continuation
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, #g25
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L266: ; Continuation
  mov bx, dx
  cmp [bx], #0
  bz L261
  mov ax, [bx+1]
  mov 1, ax
  mov bx, [1]
  cmp [bx], #0
  bz L264
  mov ax, [bx+1]
  mov 2, ax
  mov ax, [bx+2]
  mov 3, ax
  push cx
  push #L265
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ meta (t2)
  mov bp, [bp+2]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L267: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L266
  mov cx, sp
  ;; (183'17) Tail: loop (f5) @ case_172'18 (arg)
  mov bp, [bp+5]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L268: ; Function: t1
  push dx
  push [bp+2]
  push #L258
  mov 1, sp
  push [1]
  push dx
  push [bp+3]
  push [bp+1]
  push cx
  push #L267
  mov cx, sp
  mov bx, [bp+4]
  mov ax, [bx+1]
  mov 2, ax
  ;; (172'43) Return: ps (t2)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L269: ; Continuation
  ;; (238'18) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L270: ; Continuation
  push [bp+2]
  push cx
  push #L269
  mov cx, sp
  ;; (250'32) Tail: app_250'27 (arg) @ xs (f3)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+3]
  mov ax, [bp]
  jmp [ax]

L271: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push #L268
  mov 1, sp
  push [bp+6]
  push [bp+5]
  push cx
  push #L270
  mov cx, sp
  ;; (250'27) Tail: iter (g5) @ lam_239'11 (t1)
  mov bp, #g5
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L272: ; Continuation
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, #g25
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L273: ; Continuation
  push cx
  push #L272
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L274: ; Arm: 242'11
  push #g94
  push [bp+6]
  push #1
  mov 1, sp
  push [1]
  push #g91
  push #1
  mov 2, sp
  push [bp+2]
  push cx
  push #L273
  mov cx, sp
  ;; (240'35) Tail: concat (f4) @ con_240'36 (t2)
  mov bp, [bp+4]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L275: ; Continuation
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, #g25
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L276: ; Continuation
  push cx
  push #L275
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L277: ; Arm: 245'16
  mov ax, [bx+1]
  mov 2, ax
  push #g98
  push [bp+6]
  push #1
  mov 3, sp
  push [3]
  push #g95
  push #1
  mov 4, sp
  push [bp+2]
  push cx
  push #L276
  mov cx, sp
  ;; (240'35) Tail: concat (f4) @ con_240'36 (t4)
  mov bp, [bp+4]
  mov dx, [4]
  mov ax, [bp]
  jmp [ax]

L278: ; Continuation
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, #g25
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L279: ; Continuation
  push [bp+7]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L271
  mov cx, sp
  mov bx, dx
  cmp [bx], #0
  bz L274
  mov ax, [bx+1]
  mov 1, ax
  mov bx, [1]
  cmp [bx], #0
  bz L277
  mov ax, [bx+1]
  mov 2, ax
  mov ax, [bx+2]
  mov 3, ax
  push cx
  push #L278
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ meta (t2)
  mov bp, [bp+2]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L280: ; Continuation
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L279
  mov cx, sp
  ;; (183'17) Tail: loop (f8) @ case_172'18 (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L281: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L248
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push [1]
  push [bp+2]
  push #L253
  mov 3, sp
  push [3]
  push [2]
  push [1]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push cx
  push #L280
  mov cx, sp
  mov bx, [bp+4]
  mov ax, [bx+1]
  mov 4, ax
  ;; (172'43) Return: ps (t4)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L282: ; Function: t7
  push dx
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push #L281
  mov 1, sp
  ;; (0'0) Return: lam_238'21 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L283: ; Continuation
  ;; (265'6) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L284: ; Continuation
  push [bp+2]
  push cx
  push #L283
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, #g25
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L285: ; Arm: 267'7
  push [bp+4]
  push cx
  push #L284
  mov cx, sp
  ;; (114'38) Tail: explode (f1) @ lit_267'22 (g110)
  mov bp, [bp+1]
  mov dx, #g110
  mov ax, [bp]
  jmp [ax]

L286: ; Continuation
  ;; (0'0) Return: con_256'92 (g115)
  mov dx, #g115
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L287: ; Continuation
  push cx
  push #L286
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, #g25
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L288: ; Continuation
  push cx
  push #L287
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L289: ; Arm: 255'9
  push #g114
  push [bp+4]
  push #1
  mov 1, sp
  push [1]
  push #g111
  push #1
  mov 2, sp
  push [bp+1]
  push cx
  push #L288
  mov cx, sp
  ;; (256'26) Tail: concat (f3) @ con_256'27 (t2)
  mov bp, [bp+3]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L290: ; Arm: 260'35
  ;; (257'10) Return: ps (f3)
  mov dx, [bp+3]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L291: ; Continuation
  push [bp+3]
  push [bp+2]
  push #0
  mov 1, sp
  push dx
  push [1]
  push #1
  mov 2, sp
  ;; (0'0) Return: con_0'0 (t2)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L292: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L290
  push [bp+5]
  push [bp+4]
  push cx
  push #L291
  mov cx, sp
  ;; (260'73) Tail: loop (f2) @ ps (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L293: ; Continuation
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push cx
  push #L292
  mov cx, sp
  ;; (260'28) Tail: app_260'23 (arg) @ sought (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L294: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L289
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov bx, [1]
  mov ax, [bx+1]
  mov 3, ax
  mov ax, [bx+2]
  mov 4, ax
  push [4]
  push [3]
  push [2]
  push bp
  push [bp+4]
  push cx
  push #L293
  mov cx, sp
  ;; (260'23) Tail: eq_string (f2) @ name (t3)
  mov bp, [bp+2]
  mov dx, [3]
  mov ax, [bp]
  jmp [ax]

L295: ; Continuation
  push dx
  push #0
  mov 1, sp
  ;; (0'0) Return: con_262'2 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L296: ; Continuation
  push cx
  push #L295
  mov cx, sp
  ;; (262'17) Tail: loop (f2) @ case_172'18 (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L297: ; Function: t1
  push dx
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push #L294
  mov 1, sp
  push [1]
  push cx
  push #L296
  mov cx, sp
  mov bx, [bp+4]
  mov ax, [bx+1]
  mov 2, ax
  ;; (172'43) Return: ps (t2)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L298: ; Function: t3
  push dx
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push #L297
  mov 1, sp
  ;; (0'0) Return: lam_252'11 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L299: ; Continuation
  ;; (268'29) Tail: app_268'26 (arg) @ args (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L300: ; Continuation
  push [bp+3]
  push cx
  push #L299
  mov cx, sp
  ;; (268'26) Tail: app_268'22 (arg) @ fs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L301: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L285
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push #L298
  mov 3, sp
  push dx
  push [bp+4]
  push cx
  push #L300
  mov cx, sp
  ;; (268'22) Tail: fold_left (g7) @ lam_252'8 (t3)
  mov bp, #g7
  mov dx, [3]
  mov ax, [bp]
  jmp [ax]

L302: ; Function: t10
  push dx
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push #L301
  mov 1, sp
  ;; (0'0) Return: lam_265'9 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L303: ; Continuation
  ;; (270'17) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L304: ; Continuation
  push [bp+2]
  push cx
  push #L303
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, #g25
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L305: ; Arm: 272'7
  push [bp+4]
  push cx
  push #L304
  mov cx, sp
  ;; (114'38) Tail: explode (f1) @ lit_272'22 (g118)
  mov bp, [bp+1]
  mov dx, #g118
  mov ax, [bp]
  jmp [ax]

L306: ; Continuation
  ;; (270'17) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L307: ; Continuation
  push [bp+2]
  push cx
  push #L306
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, #g25
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L308: ; Continuation
  push [bp+3]
  push cx
  push #L307
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L309: ; Arm: 275'10
  push #g122
  push [1]
  push #1
  mov 3, sp
  push [3]
  push #g119
  push #1
  mov 4, sp
  push [bp+4]
  push [bp+1]
  push cx
  push #L308
  mov cx, sp
  ;; (275'33) Tail: concat (f3) @ con_275'34 (t4)
  mov bp, [bp+3]
  mov dx, [4]
  mov ax, [bp]
  jmp [ax]

L310: ; Continuation
  ;; (270'17) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L311: ; Continuation
  push [bp+2]
  push cx
  push #L310
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, #g25
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L312: ; Arm: 278'12
  mov ax, [bx+1]
  mov 5, ax
  mov ax, [bx+2]
  mov 6, ax
  push [bp+4]
  push cx
  push #L311
  mov cx, sp
  ;; (114'38) Tail: explode (f1) @ lit_278'27 (g123)
  mov bp, [bp+1]
  mov dx, #g123
  mov ax, [bp]
  jmp [ax]

L313: ; Arm: 177'9
  ;; (0'0) Return: con_177'12 (g124)
  mov dx, #g124
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L314: ; Arm: 181'35
  push [bp+4]
  push #1
  mov 1, sp
  ;; (0'0) Return: con_181'40 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L315: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L314
  ;; (181'60) Tail: loop (f2) @ ps (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L316: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push cx
  push #L315
  mov cx, sp
  ;; (181'28) Tail: app_181'23 (arg) @ source (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L317: ; Function: t5
  mov bx, dx
  cmp [bx], #0
  bz L313
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov bx, [1]
  mov ax, [bx+1]
  mov 3, ax
  mov ax, [bx+2]
  mov 4, ax
  push [4]
  push [2]
  push bp
  push [bp+2]
  push cx
  push #L316
  mov cx, sp
  ;; (181'23) Tail: eq_string (f1) @ name (t3)
  mov bp, [bp+1]
  mov dx, [3]
  mov ax, [bp]
  jmp [ax]

L318: ; Continuation
  ;; (270'17) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L319: ; Continuation
  push [bp+2]
  push cx
  push #L318
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, #g25
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L320: ; Continuation
  push [bp+3]
  push cx
  push #L319
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L321: ; Arm: 281'15
  push #g128
  push [bp+5]
  push #1
  mov 1, sp
  push [1]
  push #g125
  push #1
  mov 2, sp
  push [bp+4]
  push [bp+2]
  push cx
  push #L320
  mov cx, sp
  ;; (281'38) Tail: concat (f3) @ con_281'39 (t2)
  mov bp, [bp+3]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L322: ; Continuation
  push [bp+3]
  push [bp+2]
  push #0
  mov 1, sp
  push dx
  push [1]
  push #1
  mov 2, sp
  push [2]
  push #0
  mov 3, sp
  ;; (0'0) Return: con_283'11 (t3)
  mov dx, [3]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L323: ; Continuation
  mov bx, dx
  cmp [bx], #0
  bz L321
  mov ax, [bx+1]
  mov 1, ax
  push [1]
  push [bp+6]
  push cx
  push #L322
  mov cx, sp
  mov bx, [bp+4]
  mov ax, [bx+1]
  mov 2, ax
  ;; (172'43) Return: ps (t2)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L324: ; Continuation
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L323
  mov cx, sp
  ;; (183'17) Tail: loop (f7) @ case_172'18 (arg)
  mov bp, [bp+7]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L325: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L305
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov bx, [2]
  cmp [bx], #0
  bz L309
  mov ax, [bx+1]
  mov 3, ax
  mov ax, [bx+2]
  mov 4, ax
  mov bx, [4]
  cmp [bx], #1
  bz L312
  push [1]
  push [bp+2]
  push #L317
  mov 5, sp
  push [5]
  push [3]
  push [1]
  push [bp+4]
  push [bp+3]
  push [bp+1]
  push cx
  push #L324
  mov cx, sp
  mov bx, [bp+4]
  mov ax, [bx+1]
  mov 6, ax
  ;; (172'43) Return: ps (t6)
  mov dx, [6]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L326: ; Function: t13
  push dx
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push #L325
  mov 1, sp
  ;; (0'0) Return: lam_270'20 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L327: ; Continuation
  ;; (285'17) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L328: ; Continuation
  push [bp+2]
  push cx
  push #L327
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, #g25
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L329: ; Arm: 287'7
  push [bp+4]
  push cx
  push #L328
  mov cx, sp
  ;; (114'38) Tail: explode (f1) @ lit_287'22 (g131)
  mov bp, [bp+1]
  mov dx, #g131
  mov ax, [bp]
  jmp [ax]

L330: ; Continuation
  ;; (285'17) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L331: ; Continuation
  push [bp+2]
  push cx
  push #L330
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, #g25
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L332: ; Continuation
  push [bp+3]
  push cx
  push #L331
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L333: ; Arm: 290'10
  push #g135
  push [1]
  push #1
  mov 3, sp
  push [3]
  push #g132
  push #1
  mov 4, sp
  push [bp+4]
  push [bp+1]
  push cx
  push #L332
  mov cx, sp
  ;; (290'33) Tail: concat (f3) @ con_290'34 (t4)
  mov bp, [bp+3]
  mov dx, [4]
  mov ax, [bp]
  jmp [ax]

L334: ; Continuation
  ;; (285'17) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L335: ; Continuation
  push [bp+2]
  push cx
  push #L334
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, #g25
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L336: ; Arm: 293'12
  mov ax, [bx+1]
  mov 5, ax
  mov ax, [bx+2]
  mov 6, ax
  push [bp+4]
  push cx
  push #L335
  mov cx, sp
  ;; (114'38) Tail: explode (f1) @ lit_293'27 (g136)
  mov bp, [bp+1]
  mov dx, #g136
  mov ax, [bp]
  jmp [ax]

L337: ; Arm: 177'9
  ;; (0'0) Return: con_177'12 (g137)
  mov dx, #g137
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L338: ; Arm: 181'35
  push [bp+4]
  push #1
  mov 1, sp
  ;; (0'0) Return: con_181'40 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L339: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L338
  ;; (181'60) Tail: loop (f2) @ ps (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L340: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push cx
  push #L339
  mov cx, sp
  ;; (181'28) Tail: app_181'23 (arg) @ source (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L341: ; Function: t5
  mov bx, dx
  cmp [bx], #0
  bz L337
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov bx, [1]
  mov ax, [bx+1]
  mov 3, ax
  mov ax, [bx+2]
  mov 4, ax
  push [4]
  push [2]
  push bp
  push [bp+2]
  push cx
  push #L340
  mov cx, sp
  ;; (181'23) Tail: eq_string (f1) @ name (t3)
  mov bp, [bp+1]
  mov dx, [3]
  mov ax, [bp]
  jmp [ax]

L342: ; Continuation
  ;; (285'17) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L343: ; Continuation
  push [bp+2]
  push cx
  push #L342
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, #g25
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L344: ; Continuation
  push [bp+3]
  push cx
  push #L343
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L345: ; Arm: 296'15
  push #g141
  push [bp+6]
  push #1
  mov 1, sp
  push [1]
  push #g138
  push #1
  mov 2, sp
  push [bp+5]
  push [bp+2]
  push cx
  push #L344
  mov cx, sp
  ;; (296'38) Tail: concat (f4) @ con_296'39 (t2)
  mov bp, [bp+4]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L346: ; Continuation
  ;; (0'0) Return: con_256'92 (g146)
  mov dx, #g146
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L347: ; Continuation
  push cx
  push #L346
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, #g25
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L348: ; Continuation
  push cx
  push #L347
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L349: ; Arm: 255'9
  push #g145
  push [bp+4]
  push #1
  mov 1, sp
  push [1]
  push #g142
  push #1
  mov 2, sp
  push [bp+1]
  push cx
  push #L348
  mov cx, sp
  ;; (256'26) Tail: concat (f3) @ con_256'27 (t2)
  mov bp, [bp+3]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L350: ; Arm: 260'35
  ;; (257'10) Return: ps (f3)
  mov dx, [bp+3]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L351: ; Continuation
  push [bp+3]
  push [bp+2]
  push #0
  mov 1, sp
  push dx
  push [1]
  push #1
  mov 2, sp
  ;; (0'0) Return: con_0'0 (t2)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L352: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L350
  push [bp+5]
  push [bp+4]
  push cx
  push #L351
  mov cx, sp
  ;; (260'73) Tail: loop (f2) @ ps (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L353: ; Continuation
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push cx
  push #L352
  mov cx, sp
  ;; (260'28) Tail: app_260'23 (arg) @ source (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L354: ; Function: t2
  mov bx, dx
  cmp [bx], #0
  bz L349
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov bx, [1]
  mov ax, [bx+1]
  mov 3, ax
  mov ax, [bx+2]
  mov 4, ax
  push [4]
  push [3]
  push [2]
  push bp
  push [bp+4]
  push cx
  push #L353
  mov cx, sp
  ;; (260'23) Tail: eq_string (f2) @ name (t3)
  mov bp, [bp+2]
  mov dx, [3]
  mov ax, [bp]
  jmp [ax]

L355: ; Continuation
  push [bp+3]
  push [bp+2]
  push #0
  mov 1, sp
  push dx
  push [1]
  push #1
  mov 2, sp
  push [2]
  push #0
  mov 3, sp
  ;; (0'0) Return: con_298'11 (t3)
  mov dx, [3]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L356: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L355
  mov cx, sp
  ;; (262'17) Tail: loop (f4) @ case_172'18 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L357: ; Continuation
  mov bx, dx
  cmp [bx], #0
  bz L345
  mov ax, [bx+1]
  mov 1, ax
  push [bp+6]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push #L354
  mov 2, sp
  push [2]
  push [1]
  push [bp+7]
  push cx
  push #L356
  mov cx, sp
  mov bx, [bp+5]
  mov ax, [bx+1]
  mov 3, ax
  ;; (172'43) Return: ps (t3)
  mov dx, [3]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L358: ; Continuation
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L357
  mov cx, sp
  ;; (183'17) Tail: loop (f8) @ case_172'18 (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L359: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L329
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov bx, [2]
  cmp [bx], #0
  bz L333
  mov ax, [bx+1]
  mov 3, ax
  mov ax, [bx+2]
  mov 4, ax
  mov bx, [4]
  cmp [bx], #1
  bz L336
  push [1]
  push [bp+2]
  push #L341
  mov 5, sp
  push [5]
  push [3]
  push [1]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push cx
  push #L358
  mov cx, sp
  mov bx, [bp+4]
  mov ax, [bx+1]
  mov 6, ax
  ;; (172'43) Return: ps (t6)
  mov dx, [6]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L360: ; Function: t16
  push dx
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push #L359
  mov 1, sp
  ;; (0'0) Return: lam_285'20 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L361: ; Continuation
  push [bp+2]
  push #L208
  mov 1, sp
  push [1]
  push #g61
  push #1
  mov 2, sp
  push [2]
  push #g60
  push #0
  mov 3, sp
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push #L245
  mov 4, sp
  push [4]
  push #g67
  push #1
  mov 5, sp
  push [5]
  push #g66
  push #0
  mov 6, sp
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push #L282
  mov 7, sp
  push [7]
  push #g88
  push #1
  mov 8, sp
  push [8]
  push #g87
  push #0
  mov 9, sp
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push #L302
  mov 10, sp
  push [10]
  push #g109
  push #1
  mov 11, sp
  push [11]
  push #g108
  push #0
  mov 12, sp
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push #L326
  mov 13, sp
  push [13]
  push #g117
  push #1
  mov 14, sp
  push [14]
  push #g116
  push #0
  mov 15, sp
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push #L360
  mov 16, sp
  push [16]
  push #g130
  push #1
  mov 17, sp
  push [17]
  push #g129
  push #0
  mov 18, sp
  push #g147
  push [18]
  push #1
  mov 19, sp
  push [19]
  push [15]
  push #1
  mov 20, sp
  push [20]
  push [12]
  push #1
  mov 21, sp
  push [21]
  push [9]
  push #1
  mov 22, sp
  push [22]
  push [6]
  push #1
  mov 23, sp
  push [23]
  push [3]
  push #1
  mov 24, sp
  push [24]
  push #g59
  push #1
  mov 25, sp
  push [25]
  push #0
  mov 26, sp
  ;; (321'11) Tail: mainloop (f5) @ con_308'13 (t26)
  mov bp, [bp+5]
  mov dx, [26]
  mov ax, [bp]
  jmp [ax]

L362: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L361
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, #g25
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L363: ; Continuation
  push [bp+4]
  push [bp+2]
  push #L76
  mov 1, sp
  push [bp+3]
  push #L93
  mov 2, sp
  push [2]
  push dx
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push #L192
  mov 3, sp
  push [3]
  push [1]
  push dx
  push [bp+4]
  push cx
  push #L362
  mov cx, sp
  ;; (114'38) Tail: explode (f4) @ lit_320'13 (g55)
  mov bp, [bp+4]
  mov dx, #g55
  mov ax, [bp]
  jmp [ax]

L364: ; Continuation
  push dx
  push [bp+3]
  push [bp+2]
  push cx
  push #L363
  mov cx, sp
  ;; (78'25) Tail: block (g1) @ lam_78'30 (g22)
  mov bp, #g1
  mov dx, #g22
  mov ax, [bp]
  jmp [ax]

L365: ; Continuation
  push dx
  push [bp+2]
  push cx
  push #L364
  mov cx, sp
  ;; (71'23) Tail: block (g1) @ lam_71'28 (g14)
  mov bp, #g1
  mov dx, #g14
  mov ax, [bp]
  jmp [ax]

L366: ; Continuation
  push dx
  push cx
  push #L365
  mov cx, sp
  ;; (60'26) Tail: block (g1) @ lam_60'31 (g12)
  mov bp, #g1
  mov dx, #g12
  mov ax, [bp]
  jmp [ax]

L367: ; Start
  push cx
  push #L366
  mov cx, sp
  ;; (4'17) Tail: block (g1) @ lam_50'31 (g10)
  mov bp, #g1
  mov dx, #g10
  mov ax, [bp]
  jmp [ax]

g1: dw L2
g2: dw L5
g3: dw L11
g4: dw 0
g5: dw L16
g6: dw 0
g7: dw L24
g8: dw L28
g9: dw 0
g10: dw L36
g11: dw 0
g12: dw L44
g13: dw 0
g14: dw L50
g15: dw 0
g16: dw 1
g17: dw 0
g18: dw 1
g19: dw 0
g20: dw 1
g21: dw 0
g22: dw L60
g23: dw 0
g24: dw 0
g25: dw L66
g26: dw 0
g27: dw 0
g28: dw 1, '%', g28+3, 1, ' ', g28+6, 0
g29: dw 0
g30: dw 0
g31: dw 0
g32: dw 1
g33: dw 0
g34: dw 0
g35: dw 0
g36: dw 0
g37: dw 0
g38: dw 0
g39: dw 1, 'c', g39+3, 1, 'o', g39+6, 1, 'm', g39+9, 1, 'm', g39+12, 1, 'a', g39+15, 1, 'n', g39+18, 1, 'd', g39+21, 1, ' ', g39+24, 1, 'n', g39+27, 1, 'o', g39+30, 1, 't', g39+33, 1, ' ', g39+36, 1, 'f', g39+39, 1, 'o', g39+42, 1, 'u', g39+45, 1, 'n', g39+48, 1, 'd', g39+51, 0
g40: dw 1, '\n', g40+3, 0
g41: dw 0
g42: dw 1, ':', g42+3, 1, ' ', g42+6, 0
g43: dw 0
g44: dw 0
g45: dw 1, 's', g45+3, 1, 'h', g45+6, 1, 'a', g45+9, 1, 'm', g45+12, 1, ':', g45+15, 1, ' ', g45+18, 0
g46: dw 0
g47: dw 1, 'P', g47+3, 1, 'e', g47+6, 1, 'r', g47+9, 1, 'm', g47+12, 1, 'i', g47+15, 1, 's', g47+18, 1, 's', g47+21, 1, 'i', g47+24, 1, 'o', g47+27, 1, 'n', g47+30, 1, ' ', g47+33, 1, 'd', g47+36, 1, 'e', g47+39, 1, 'n', g47+42, 1, 'i', g47+45, 1, 'e', g47+48, 1, 'd', g47+51, 0
g48: dw 1, '\n', g48+3, 0
g49: dw 0
g50: dw 1, ':', g50+3, 1, ' ', g50+6, 0
g51: dw 0
g52: dw 0
g53: dw 1, 's', g53+3, 1, 'h', g53+6, 1, 'a', g53+9, 1, 'm', g53+12, 1, ':', g53+15, 1, ' ', g53+18, 0
g54: dw 0
g55: dw 1, 'S', g55+3, 1, 'h', g55+6, 1, 'a', g55+9, 1, 'm', g55+12, 1, ':', g55+15, 1, ' ', g55+18, 1, 'I', g55+21, 1, 'n', g55+24, 1, '-', g55+27, 1, 'm', g55+30, 1, 'e', g55+33, 1, 'm', g55+36, 1, 'o', g55+39, 1, 'r', g55+42, 1, 'y', g55+45, 1, ' ', g55+48, 1, 'f', g55+51, 1, 'i', g55+54, 1, 'l', g55+57, 1, 'e', g55+60, 1, '-', g55+63, 1, 's', g55+66, 1, 'y', g55+69, 1, 's', g55+72, 1, 't', g55+75, 1, 'e', g55+78, 1, 'm', g55+81, 1, '.', g55+84, 1, ' ', g55+87, 1, 'C', g55+90, 1, 'o', g55+93, 1, 'n', g55+96, 1, 's', g55+99, 1, 'i', g55+102, 1, 'd', g55+105, 1, 'e', g55+108, 1, 'r', g55+111, 1, ' ', g55+114, 1, 't', g55+117, 1, 'y', g55+120, 1, 'p', g55+123, 1, 'i', g55+126, 1, 'n', g55+129, 1, 'g', g55+132, 1, ' ', g55+135, 1, '"', g55+138, 1, 'l', g55+141, 1, 's', g55+144, 1, '"', g55+147, 1, '.', g55+150, 1, '\n', g55+153, 0
g56: dw 1, 'r', g56+3, 1, 'e', g56+6, 1, 'a', g56+9, 1, 'd', g56+12, 1, 'm', g56+15, 1, 'e', g56+18, 0
g57: dw 1, 'W', g57+3, 1, 'e', g57+6, 1, 'l', g57+9, 1, 'c', g57+12, 1, 'o', g57+15, 1, 'm', g57+18, 1, 'e', g57+21, 1, ' ', g57+24, 1, 't', g57+27, 1, 'o', g57+30, 1, ' ', g57+33, 1, 's', g57+36, 1, 'h', g57+39, 1, 'a', g57+42, 1, 'm', g57+45, 1, ';', g57+48, 1, ' ', g57+51, 1, 'p', g57+54, 1, 'l', g57+57, 1, 'e', g57+60, 1, 'a', g57+63, 1, 's', g57+66, 1, 'e', g57+69, 1, ' ', g57+72, 1, 't', g57+75, 1, 'r', g57+78, 1, 'y', g57+81, 1, ' ', g57+84, 1, 'a', g57+87, 1, 'l', g57+90, 1, 'l', g57+93, 1, ' ', g57+96, 1, 't', g57+99, 1, 'h', g57+102, 1, 'e', g57+105, 1, ' ', g57+108, 1, 'c', g57+111, 1, 'o', g57+114, 1, 'm', g57+117, 1, 'm', g57+120, 1, 'a', g57+123, 1, 'n', g57+126, 1, 'd', g57+129, 1, 's', g57+132, 1, '!', g57+135, 1, '\n', g57+138, 1, 'C', g57+141, 1, 'a', g57+144, 1, 'n', g57+147, 1, ' ', g57+150, 1, 'y', g57+153, 1, 'o', g57+156, 1, 'u', g57+159, 1, ' ', g57+162, 1, 'f', g57+165, 1, 'i', g57+168, 1, 'n', g57+171, 1, 'd', g57+174, 1, ' ', g57+177, 1, 't', g57+180, 1, 'h', g57+183, 1, 'e', g57+186, 1, ' ', g57+189, 1, 'h', g57+192, 1, 'i', g57+195, 1, 'd', g57+198, 1, 'd', g57+201, 1, 'e', g57+204, 1, 'n', g57+207, 1, ' ', g57+210, 1, 'E', g57+213, 1, 'a', g57+216, 1, 's', g57+219, 1, 't', g57+222, 1, 'e', g57+225, 1, 'r', g57+228, 1, ' ', g57+231, 1, 'E', g57+234, 1, 'g', g57+237, 1, 'g', g57+240, 1, '?', g57+243, 1, '\n', g57+246, 0
g58: dw 0, g57
g59: dw 0, g56, g58
g60: dw 1, 'l', g60+3, 1, 's', g60+6, 0
g61: dw 1, 'l', g61+3, 1, 's', g61+6, 1, ' ', g61+9, 1, '-', g61+12, 1, ' ', g61+15, 1, 'l', g61+18, 1, 'i', g61+21, 1, 's', g61+24, 1, 't', g61+27, 1, ' ', g61+30, 1, 'd', g61+33, 1, 'i', g61+36, 1, 'r', g61+39, 1, 'e', g61+42, 1, 'c', g61+45, 1, 't', g61+48, 1, 'o', g61+51, 1, 'r', g61+54, 1, 'y', g61+57, 1, ' ', g61+60, 1, 'c', g61+63, 1, 'o', g61+66, 1, 'n', g61+69, 1, 't', g61+72, 1, 'e', g61+75, 1, 'n', g61+78, 1, 't', g61+81, 1, 's', g61+84, 1, '\n', g61+87, 0
g62: dw 1, 'l', g62+3, 1, 's', g62+6, 1, ':', g62+9, 1, ' ', g62+12, 1, 't', g62+15, 1, 'a', g62+18, 1, 'k', g62+21, 1, 'e', g62+24, 1, 's', g62+27, 1, ' ', g62+30, 1, 'n', g62+33, 1, 'o', g62+36, 1, ' ', g62+39, 1, 'a', g62+42, 1, 'r', g62+45, 1, 'g', g62+48, 1, 'u', g62+51, 1, 'm', g62+54, 1, 'e', g62+57, 1, 'n', g62+60, 1, 't', g62+63, 1, 's', g62+66, 1, '\n', g62+69, 0
g63: dw L67
g64: dw 0
g65: dw 0
g66: dw 1, 'c', g66+3, 1, 'a', g66+6, 1, 't', g66+9, 0
g67: dw 1, 'c', g67+3, 1, 'a', g67+6, 1, 't', g67+9, 1, ' ', g67+12, 1, '-', g67+15, 1, ' ', g67+18, 1, 'c', g67+21, 1, 'o', g67+24, 1, 'n', g67+27, 1, 'c', g67+30, 1, 'a', g67+33, 1, 't', g67+36, 1, 'e', g67+39, 1, 'n', g67+42, 1, 'a', g67+45, 1, 't', g67+48, 1, 'e', g67+51, 1, ' ', g67+54, 1, 'f', g67+57, 1, 'i', g67+60, 1, 'l', g67+63, 1, 'e', g67+66, 1, 's', g67+69, 1, ' ', g67+72, 1, 'a', g67+75, 1, 'n', g67+78, 1, 'd', g67+81, 1, ' ', g67+84, 1, 'p', g67+87, 1, 'r', g67+90, 1, 'i', g67+93, 1, 'n', g67+96, 1, 't', g67+99, 1, ' ', g67+102, 1, 'o', g67+105, 1, 'n', g67+108, 1, ' ', g67+111, 1, 't', g67+114, 1, 'h', g67+117, 1, 'e', g67+120, 1, ' ', g67+123, 1, 's', g67+126, 1, 't', g67+129, 1, 'a', g67+132, 1, 'n', g67+135, 1, 'd', g67+138, 1, 'a', g67+141, 1, 'r', g67+144, 1, 'd', g67+147, 1, ' ', g67+150, 1, 'o', g67+153, 1, 'u', g67+156, 1, 't', g67+159, 1, 'p', g67+162, 1, 'u', g67+165, 1, 't', g67+168, 1, '\n', g67+171, 0
g68: dw 1, 'c', g68+3, 1, 'a', g68+6, 1, 't', g68+9, 1, ':', g68+12, 1, ' ', g68+15, 1, 't', g68+18, 1, 'a', g68+21, 1, 'k', g68+24, 1, 'e', g68+27, 1, 's', g68+30, 1, ' ', g68+33, 1, 'a', g68+36, 1, 't', g68+39, 1, ' ', g68+42, 1, 'l', g68+45, 1, 'e', g68+48, 1, 'a', g68+51, 1, 's', g68+54, 1, 't', g68+57, 1, ' ', g68+60, 1, 'o', g68+63, 1, 'n', g68+66, 1, 'e', g68+69, 1, ' ', g68+72, 1, 'a', g68+75, 1, 'r', g68+78, 1, 'g', g68+81, 1, 'u', g68+84, 1, 'm', g68+87, 1, 'e', g68+90, 1, 'n', g68+93, 1, 't', g68+96, 1, '\n', g68+99, 0
g69: dw 0
g70: dw 1, 'c', g70+3, 1, 'a', g70+6, 1, 't', g70+9, 1, ':', g70+12, 1, ' ', g70+15, 0
g71: dw 1, ' ', g71+3, 1, ':', g71+6, 1, ' ', g71+9, 1, 'N', g71+12, 1, 'o', g71+15, 1, ' ', g71+18, 1, 's', g71+21, 1, 'u', g71+24, 1, 'c', g71+27, 1, 'h', g71+30, 1, ' ', g71+33, 1, 'f', g71+36, 1, 'i', g71+39, 1, 'l', g71+42, 1, 'e', g71+45, 1, '\n', g71+48, 0
g72: dw 0
g73: dw 1, g71, g72
g74: dw 1, 'c', g74+3, 1, 'a', g74+6, 1, 't', g74+9, 1, ':', g74+12, 1, ' ', g74+15, 0
g75: dw 1, ' ', g75+3, 1, ':', g75+6, 1, ' ', g75+9, 1, 'N', g75+12, 1, 'o', g75+15, 1, 't', g75+18, 1, ' ', g75+21, 1, 'a', g75+24, 1, ' ', g75+27, 1, 'd', g75+30, 1, 'a', g75+33, 1, 't', g75+36, 1, 'a', g75+39, 1, ' ', g75+42, 1, 'f', g75+45, 1, 'i', g75+48, 1, 'l', g75+51, 1, 'e', g75+54, 1, '\n', g75+57, 0
g76: dw 0
g77: dw 1, g75, g76
g78: dw 0
g79: dw 1, 'c', g79+3, 1, 'a', g79+6, 1, 't', g79+9, 1, ':', g79+12, 1, ' ', g79+15, 0
g80: dw 1, ' ', g80+3, 1, ':', g80+6, 1, ' ', g80+9, 1, 'N', g80+12, 1, 'o', g80+15, 1, ' ', g80+18, 1, 's', g80+21, 1, 'u', g80+24, 1, 'c', g80+27, 1, 'h', g80+30, 1, ' ', g80+33, 1, 'f', g80+36, 1, 'i', g80+39, 1, 'l', g80+42, 1, 'e', g80+45, 1, '\n', g80+48, 0
g81: dw 0
g82: dw 1, g80, g81
g83: dw 1, 'c', g83+3, 1, 'a', g83+6, 1, 't', g83+9, 1, ':', g83+12, 1, ' ', g83+15, 0
g84: dw 1, ' ', g84+3, 1, ':', g84+6, 1, ' ', g84+9, 1, 'N', g84+12, 1, 'o', g84+15, 1, 't', g84+18, 1, ' ', g84+21, 1, 'a', g84+24, 1, ' ', g84+27, 1, 'd', g84+30, 1, 'a', g84+33, 1, 't', g84+36, 1, 'a', g84+39, 1, ' ', g84+42, 1, 'f', g84+45, 1, 'i', g84+48, 1, 'l', g84+51, 1, 'e', g84+54, 1, '\n', g84+57, 0
g85: dw 0
g86: dw 1, g84, g85
g87: dw 1, 'm', g87+3, 1, 'a', g87+6, 1, 'n', g87+9, 0
g88: dw 1, 'm', g88+3, 1, 'a', g88+6, 1, 'n', g88+9, 1, ' ', g88+12, 1, '-', g88+15, 1, ' ', g88+18, 1, 'a', g88+21, 1, 'n', g88+24, 1, ' ', g88+27, 1, 'i', g88+30, 1, 'n', g88+33, 1, 't', g88+36, 1, 'e', g88+39, 1, 'r', g88+42, 1, 'f', g88+45, 1, 'a', g88+48, 1, 'c', g88+51, 1, 'e', g88+54, 1, ' ', g88+57, 1, 't', g88+60, 1, 'o', g88+63, 1, ' ', g88+66, 1, 't', g88+69, 1, 'h', g88+72, 1, 'e', g88+75, 1, ' ', g88+78, 1, 's', g88+81, 1, 'y', g88+84, 1, 's', g88+87, 1, 't', g88+90, 1, 'e', g88+93, 1, 'm', g88+96, 1, ' ', g88+99, 1, 'r', g88+102, 1, 'e', g88+105, 1, 'f', g88+108, 1, 'e', g88+111, 1, 'r', g88+114, 1, 'e', g88+117, 1, 'n', g88+120, 1, 'c', g88+123, 1, 'e', g88+126, 1, ' ', g88+129, 1, 'm', g88+132, 1, 'a', g88+135, 1, 'n', g88+138, 1, 'u', g88+141, 1, 'a', g88+144, 1, 'l', g88+147, 1, 's', g88+150, 1, '\n', g88+153, 0
g89: dw 1, 'W', g89+3, 1, 'h', g89+6, 1, 'a', g89+9, 1, 't', g89+12, 1, ' ', g89+15, 1, 'm', g89+18, 1, 'a', g89+21, 1, 'n', g89+24, 1, 'u', g89+27, 1, 'a', g89+30, 1, 'l', g89+33, 1, ' ', g89+36, 1, 'p', g89+39, 1, 'a', g89+42, 1, 'g', g89+45, 1, 'e', g89+48, 1, ' ', g89+51, 1, 'd', g89+54, 1, 'o', g89+57, 1, ' ', g89+60, 1, 'y', g89+63, 1, 'o', g89+66, 1, 'u', g89+69, 1, ' ', g89+72, 1, 'w', g89+75, 1, 'a', g89+78, 1, 'n', g89+81, 1, 't', g89+84, 1, '?', g89+87, 1, '\n', g89+90, 0
g90: dw 0
g91: dw 1, 'N', g91+3, 1, 'o', g91+6, 1, ' ', g91+9, 1, 'm', g91+12, 1, 'a', g91+15, 1, 'n', g91+18, 1, 'u', g91+21, 1, 'a', g91+24, 1, 'l', g91+27, 1, ' ', g91+30, 1, 'e', g91+33, 1, 'n', g91+36, 1, 't', g91+39, 1, 'r', g91+42, 1, 'y', g91+45, 1, ' ', g91+48, 1, 'f', g91+51, 1, 'o', g91+54, 1, 'r', g91+57, 1, ' ', g91+60, 0
g92: dw 1, '\n', g92+3, 0
g93: dw 0
g94: dw 1, g92, g93
g95: dw 1, 'N', g95+3, 1, 'o', g95+6, 1, ' ', g95+9, 1, 'm', g95+12, 1, 'a', g95+15, 1, 'n', g95+18, 1, 'u', g95+21, 1, 'a', g95+24, 1, 'l', g95+27, 1, ' ', g95+30, 1, 'e', g95+33, 1, 'n', g95+36, 1, 't', g95+39, 1, 'r', g95+42, 1, 'y', g95+45, 1, ' ', g95+48, 1, 'f', g95+51, 1, 'o', g95+54, 1, 'r', g95+57, 1, ' ', g95+60, 0
g96: dw 1, '\n', g96+3, 0
g97: dw 0
g98: dw 1, g96, g97
g99: dw 0
g100: dw 1, 'N', g100+3, 1, 'o', g100+6, 1, ' ', g100+9, 1, 'm', g100+12, 1, 'a', g100+15, 1, 'n', g100+18, 1, 'u', g100+21, 1, 'a', g100+24, 1, 'l', g100+27, 1, ' ', g100+30, 1, 'e', g100+33, 1, 'n', g100+36, 1, 't', g100+39, 1, 'r', g100+42, 1, 'y', g100+45, 1, ' ', g100+48, 1, 'f', g100+51, 1, 'o', g100+54, 1, 'r', g100+57, 1, ' ', g100+60, 0
g101: dw 1, '\n', g101+3, 0
g102: dw 0
g103: dw 1, g101, g102
g104: dw 1, 'N', g104+3, 1, 'o', g104+6, 1, ' ', g104+9, 1, 'm', g104+12, 1, 'a', g104+15, 1, 'n', g104+18, 1, 'u', g104+21, 1, 'a', g104+24, 1, 'l', g104+27, 1, ' ', g104+30, 1, 'e', g104+33, 1, 'n', g104+36, 1, 't', g104+39, 1, 'r', g104+42, 1, 'y', g104+45, 1, ' ', g104+48, 1, 'f', g104+51, 1, 'o', g104+54, 1, 'r', g104+57, 1, ' ', g104+60, 0
g105: dw 1, '\n', g105+3, 0
g106: dw 0
g107: dw 1, g105, g106
g108: dw 1, 'r', g108+3, 1, 'm', g108+6, 0
g109: dw 1, 'r', g109+3, 1, 'm', g109+6, 1, ' ', g109+9, 1, '-', g109+12, 1, ' ', g109+15, 1, 'r', g109+18, 1, 'e', g109+21, 1, 'm', g109+24, 1, 'o', g109+27, 1, 'v', g109+30, 1, 'e', g109+33, 1, ' ', g109+36, 1, 'f', g109+39, 1, 'i', g109+42, 1, 'l', g109+45, 1, 'e', g109+48, 1, 's', g109+51, 1, ' ', g109+54, 1, 'o', g109+57, 1, 'r', g109+60, 1, ' ', g109+63, 1, 'd', g109+66, 1, 'i', g109+69, 1, 'r', g109+72, 1, 'e', g109+75, 1, 'c', g109+78, 1, 't', g109+81, 1, 'o', g109+84, 1, 'r', g109+87, 1, 'i', g109+90, 1, 'e', g109+93, 1, 's', g109+96, 1, ' ', g109+99, 1, '(', g109+102, 1, 'd', g109+105, 1, 'i', g109+108, 1, 'r', g109+111, 1, 'e', g109+114, 1, 'c', g109+117, 1, 't', g109+120, 1, 'o', g109+123, 1, 'r', g109+126, 1, 'i', g109+129, 1, 'e', g109+132, 1, 's', g109+135, 1, ' ', g109+138, 1, 'n', g109+141, 1, 'o', g109+144, 1, 't', g109+147, 1, ' ', g109+150, 1, 's', g109+153, 1, 'u', g109+156, 1, 'p', g109+159, 1, 'p', g109+162, 1, 'o', g109+165, 1, 'r', g109+168, 1, 't', g109+171, 1, 'e', g109+174, 1, 'd', g109+177, 1, ' ', g109+180, 1, 'y', g109+183, 1, 'e', g109+186, 1, 't', g109+189, 1, '!', g109+192, 1, ')', g109+195, 1, '\n', g109+198, 0
g110: dw 1, 'r', g110+3, 1, 'm', g110+6, 1, ':', g110+9, 1, ' ', g110+12, 1, 'm', g110+15, 1, 'i', g110+18, 1, 's', g110+21, 1, 's', g110+24, 1, 'i', g110+27, 1, 'n', g110+30, 1, 'g', g110+33, 1, ' ', g110+36, 1, 'o', g110+39, 1, 'p', g110+42, 1, 'e', g110+45, 1, 'r', g110+48, 1, 'a', g110+51, 1, 'n', g110+54, 1, 'd', g110+57, 1, '\n', g110+60, 0
g111: dw 1, 'r', g111+3, 1, 'm', g111+6, 1, ':', g111+9, 1, ' ', g111+12, 1, 'c', g111+15, 1, 'a', g111+18, 1, 'n', g111+21, 1, 'n', g111+24, 1, 'o', g111+27, 1, 't', g111+30, 1, ' ', g111+33, 1, 'r', g111+36, 1, 'e', g111+39, 1, 'm', g111+42, 1, 'o', g111+45, 1, 'v', g111+48, 1, 'e', g111+51, 1, ' ', g111+54, 1, '\'', g111+57, 0
g112: dw 1, '\'', g112+3, 1, ':', g112+6, 1, ' ', g112+9, 1, 'N', g112+12, 1, 'o', g112+15, 1, ' ', g112+18, 1, 's', g112+21, 1, 'u', g112+24, 1, 'c', g112+27, 1, 'h', g112+30, 1, ' ', g112+33, 1, 'f', g112+36, 1, 'i', g112+39, 1, 'l', g112+42, 1, 'e', g112+45, 1, ' ', g112+48, 1, 'o', g112+51, 1, 'r', g112+54, 1, ' ', g112+57, 1, 'd', g112+60, 1, 'i', g112+63, 1, 'r', g112+66, 1, 'e', g112+69, 1, 'c', g112+72, 1, 't', g112+75, 1, 'o', g112+78, 1, 'r', g112+81, 1, 'y', g112+84, 1, '\n', g112+87, 0
g113: dw 0
g114: dw 1, g112, g113
g115: dw 0
g116: dw 1, 'c', g116+3, 1, 'p', g116+6, 0
g117: dw 1, 'c', g117+3, 1, 'p', g117+6, 1, ' ', g117+9, 1, '-', g117+12, 1, ' ', g117+15, 1, 'c', g117+18, 1, 'o', g117+21, 1, 'p', g117+24, 1, 'y', g117+27, 1, ' ', g117+30, 1, 'f', g117+33, 1, 'i', g117+36, 1, 'l', g117+39, 1, 'e', g117+42, 1, 's', g117+45, 1, ' ', g117+48, 1, 'a', g117+51, 1, 'n', g117+54, 1, 'd', g117+57, 1, ' ', g117+60, 1, 'd', g117+63, 1, 'i', g117+66, 1, 'r', g117+69, 1, 'e', g117+72, 1, 'c', g117+75, 1, 't', g117+78, 1, 'o', g117+81, 1, 'r', g117+84, 1, 'i', g117+87, 1, 'e', g117+90, 1, 's', g117+93, 1, '\n', g117+96, 0
g118: dw 1, 'c', g118+3, 1, 'p', g118+6, 1, ':', g118+9, 1, ' ', g118+12, 1, 'm', g118+15, 1, 'i', g118+18, 1, 's', g118+21, 1, 's', g118+24, 1, 'i', g118+27, 1, 'n', g118+30, 1, 'g', g118+33, 1, ' ', g118+36, 1, 'f', g118+39, 1, 'i', g118+42, 1, 'l', g118+45, 1, 'e', g118+48, 1, ' ', g118+51, 1, 'o', g118+54, 1, 'p', g118+57, 1, 'e', g118+60, 1, 'r', g118+63, 1, 'a', g118+66, 1, 'n', g118+69, 1, 'd', g118+72, 1, '\n', g118+75, 0
g119: dw 1, 'c', g119+3, 1, 'p', g119+6, 1, ':', g119+9, 1, ' ', g119+12, 1, 'm', g119+15, 1, 'i', g119+18, 1, 's', g119+21, 1, 's', g119+24, 1, 'i', g119+27, 1, 'n', g119+30, 1, 'g', g119+33, 1, ' ', g119+36, 1, 'd', g119+39, 1, 'e', g119+42, 1, 's', g119+45, 1, 't', g119+48, 1, 'i', g119+51, 1, 'n', g119+54, 1, 'a', g119+57, 1, 't', g119+60, 1, 'i', g119+63, 1, 'o', g119+66, 1, 'n', g119+69, 1, ' ', g119+72, 1, 'f', g119+75, 1, 'i', g119+78, 1, 'l', g119+81, 1, 'e', g119+84, 1, ' ', g119+87, 1, 'o', g119+90, 1, 'p', g119+93, 1, 'e', g119+96, 1, 'r', g119+99, 1, 'a', g119+102, 1, 'n', g119+105, 1, 'd', g119+108, 1, ' ', g119+111, 1, 'a', g119+114, 1, 'f', g119+117, 1, 't', g119+120, 1, 'e', g119+123, 1, 'r', g119+126, 1, ' ', g119+129, 1, '\'', g119+132, 0
g120: dw 1, '\'', g120+3, 1, '\n', g120+6, 0
g121: dw 0
g122: dw 1, g120, g121
g123: dw 1, 'c', g123+3, 1, 'p', g123+6, 1, ':', g123+9, 1, ' ', g123+12, 1, 'u', g123+15, 1, 'n', g123+18, 1, 'e', g123+21, 1, 'x', g123+24, 1, 'p', g123+27, 1, 'e', g123+30, 1, 'c', g123+33, 1, 't', g123+36, 1, 'e', g123+39, 1, 'd', g123+42, 1, ' ', g123+45, 1, 'e', g123+48, 1, 'x', g123+51, 1, 't', g123+54, 1, 'r', g123+57, 1, 'a', g123+60, 1, ' ', g123+63, 1, 'o', g123+66, 1, 'p', g123+69, 1, 'e', g123+72, 1, 'r', g123+75, 1, 'a', g123+78, 1, 'n', g123+81, 1, 'd', g123+84, 1, 's', g123+87, 1, '\n', g123+90, 0
g124: dw 0
g125: dw 1, 'c', g125+3, 1, 'p', g125+6, 1, ':', g125+9, 1, ' ', g125+12, 1, 'c', g125+15, 1, 'a', g125+18, 1, 'n', g125+21, 1, 'n', g125+24, 1, 'o', g125+27, 1, 't', g125+30, 1, ' ', g125+33, 1, 's', g125+36, 1, 't', g125+39, 1, 'a', g125+42, 1, 't', g125+45, 1, ' ', g125+48, 1, '\'', g125+51, 0
g126: dw 1, '\'', g126+3, 1, ':', g126+6, 1, ' ', g126+9, 1, 'N', g126+12, 1, 'o', g126+15, 1, ' ', g126+18, 1, 's', g126+21, 1, 'u', g126+24, 1, 'c', g126+27, 1, 'h', g126+30, 1, ' ', g126+33, 1, 'f', g126+36, 1, 'i', g126+39, 1, 'l', g126+42, 1, 'e', g126+45, 1, ' ', g126+48, 1, 'o', g126+51, 1, 'r', g126+54, 1, ' ', g126+57, 1, 'd', g126+60, 1, 'i', g126+63, 1, 'r', g126+66, 1, 'e', g126+69, 1, 'c', g126+72, 1, 't', g126+75, 1, 'o', g126+78, 1, 'r', g126+81, 1, 'y', g126+84, 1, '\n', g126+87, 0
g127: dw 0
g128: dw 1, g126, g127
g129: dw 1, 'm', g129+3, 1, 'v', g129+6, 0
g130: dw 1, 'm', g130+3, 1, 'v', g130+6, 1, ' ', g130+9, 1, '-', g130+12, 1, ' ', g130+15, 1, 'm', g130+18, 1, 'o', g130+21, 1, 'v', g130+24, 1, 'e', g130+27, 1, ' ', g130+30, 1, '(', g130+33, 1, 'r', g130+36, 1, 'e', g130+39, 1, 'n', g130+42, 1, 'a', g130+45, 1, 'm', g130+48, 1, 'e', g130+51, 1, ')', g130+54, 1, ' ', g130+57, 1, 'f', g130+60, 1, 'i', g130+63, 1, 'l', g130+66, 1, 'e', g130+69, 1, 's', g130+72, 1, '\n', g130+75, 0
g131: dw 1, 'm', g131+3, 1, 'v', g131+6, 1, ':', g131+9, 1, ' ', g131+12, 1, 'm', g131+15, 1, 'i', g131+18, 1, 's', g131+21, 1, 's', g131+24, 1, 'i', g131+27, 1, 'n', g131+30, 1, 'g', g131+33, 1, ' ', g131+36, 1, 'f', g131+39, 1, 'i', g131+42, 1, 'l', g131+45, 1, 'e', g131+48, 1, ' ', g131+51, 1, 'o', g131+54, 1, 'p', g131+57, 1, 'e', g131+60, 1, 'r', g131+63, 1, 'a', g131+66, 1, 'n', g131+69, 1, 'd', g131+72, 1, '\n', g131+75, 0
g132: dw 1, 'm', g132+3, 1, 'v', g132+6, 1, ':', g132+9, 1, ' ', g132+12, 1, 'm', g132+15, 1, 'i', g132+18, 1, 's', g132+21, 1, 's', g132+24, 1, 'i', g132+27, 1, 'n', g132+30, 1, 'g', g132+33, 1, ' ', g132+36, 1, 'd', g132+39, 1, 'e', g132+42, 1, 's', g132+45, 1, 't', g132+48, 1, 'i', g132+51, 1, 'n', g132+54, 1, 'a', g132+57, 1, 't', g132+60, 1, 'i', g132+63, 1, 'o', g132+66, 1, 'n', g132+69, 1, ' ', g132+72, 1, 'f', g132+75, 1, 'i', g132+78, 1, 'l', g132+81, 1, 'e', g132+84, 1, ' ', g132+87, 1, 'o', g132+90, 1, 'p', g132+93, 1, 'e', g132+96, 1, 'r', g132+99, 1, 'a', g132+102, 1, 'n', g132+105, 1, 'd', g132+108, 1, ' ', g132+111, 1, 'a', g132+114, 1, 'f', g132+117, 1, 't', g132+120, 1, 'e', g132+123, 1, 'r', g132+126, 1, ' ', g132+129, 1, '\'', g132+132, 0
g133: dw 1, '\'', g133+3, 1, '\n', g133+6, 0
g134: dw 0
g135: dw 1, g133, g134
g136: dw 1, 'm', g136+3, 1, 'v', g136+6, 1, ':', g136+9, 1, ' ', g136+12, 1, 'u', g136+15, 1, 'n', g136+18, 1, 'e', g136+21, 1, 'x', g136+24, 1, 'p', g136+27, 1, 'e', g136+30, 1, 'c', g136+33, 1, 't', g136+36, 1, 'e', g136+39, 1, 'd', g136+42, 1, ' ', g136+45, 1, 'e', g136+48, 1, 'x', g136+51, 1, 't', g136+54, 1, 'r', g136+57, 1, 'a', g136+60, 1, ' ', g136+63, 1, 'o', g136+66, 1, 'p', g136+69, 1, 'e', g136+72, 1, 'r', g136+75, 1, 'a', g136+78, 1, 'n', g136+81, 1, 'd', g136+84, 1, 's', g136+87, 1, '\n', g136+90, 0
g137: dw 0
g138: dw 1, 'm', g138+3, 1, 'v', g138+6, 1, ':', g138+9, 1, ' ', g138+12, 1, 'c', g138+15, 1, 'a', g138+18, 1, 'n', g138+21, 1, 'n', g138+24, 1, 'o', g138+27, 1, 't', g138+30, 1, ' ', g138+33, 1, 's', g138+36, 1, 't', g138+39, 1, 'a', g138+42, 1, 't', g138+45, 1, ' ', g138+48, 1, '\'', g138+51, 0
g139: dw 1, '\'', g139+3, 1, ':', g139+6, 1, ' ', g139+9, 1, 'N', g139+12, 1, 'o', g139+15, 1, ' ', g139+18, 1, 's', g139+21, 1, 'u', g139+24, 1, 'c', g139+27, 1, 'h', g139+30, 1, ' ', g139+33, 1, 'f', g139+36, 1, 'i', g139+39, 1, 'l', g139+42, 1, 'e', g139+45, 1, ' ', g139+48, 1, 'o', g139+51, 1, 'r', g139+54, 1, ' ', g139+57, 1, 'd', g139+60, 1, 'i', g139+63, 1, 'r', g139+66, 1, 'e', g139+69, 1, 'c', g139+72, 1, 't', g139+75, 1, 'o', g139+78, 1, 'r', g139+81, 1, 'y', g139+84, 1, '\n', g139+87, 0
g140: dw 0
g141: dw 1, g139, g140
g142: dw 1, 'r', g142+3, 1, 'm', g142+6, 1, ':', g142+9, 1, ' ', g142+12, 1, 'c', g142+15, 1, 'a', g142+18, 1, 'n', g142+21, 1, 'n', g142+24, 1, 'o', g142+27, 1, 't', g142+30, 1, ' ', g142+33, 1, 'r', g142+36, 1, 'e', g142+39, 1, 'm', g142+42, 1, 'o', g142+45, 1, 'v', g142+48, 1, 'e', g142+51, 1, ' ', g142+54, 1, '\'', g142+57, 0
g143: dw 1, '\'', g143+3, 1, ':', g143+6, 1, ' ', g143+9, 1, 'N', g143+12, 1, 'o', g143+15, 1, ' ', g143+18, 1, 's', g143+21, 1, 'u', g143+24, 1, 'c', g143+27, 1, 'h', g143+30, 1, ' ', g143+33, 1, 'f', g143+36, 1, 'i', g143+39, 1, 'l', g143+42, 1, 'e', g143+45, 1, ' ', g143+48, 1, 'o', g143+51, 1, 'r', g143+54, 1, ' ', g143+57, 1, 'd', g143+60, 1, 'i', g143+63, 1, 'r', g143+66, 1, 'e', g143+69, 1, 'c', g143+72, 1, 't', g143+75, 1, 'o', g143+78, 1, 'r', g143+81, 1, 'y', g143+84, 1, '\n', g143+87, 0
g144: dw 0
g145: dw 1, g143, g144
g146: dw 0
g147: dw 0

