L1: ; Function: t1
  ;; (15'54) Tail: f (f1) @ a (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L2: ; Function: g1
  push word dx
  push word L1
  mov [2], sp
  ;; (0'0) Return: lam_15'31 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L3: ; Arm: 21'7
  ;; (21'10) Return: 0
  mov dx, 0
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L4: ; Continuation
  mov ax, 1
  add ax, dx
  mov [2], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L5: ; Function: g2
  mov bx, dx
  cmp word [bx], 0
  jz L3
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  push word cx
  push word L4
  mov cx, sp
  ;; (22'27) Tail: length (g2) @ xs (t2)
  mov bp, g2
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L6: ; Arm: 26'7
  ;; (0'0) Return: con_26'10 (g4)
  mov dx, g4
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L7: ; Continuation
  push word dx
  push word [bp+4]
  push word 1
  mov [2], sp
  ;; (0'0) Return: con_0'0 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L8: ; Continuation
  push word [bp+6]
  push word cx
  push word L7
  mov cx, sp
  ;; (27'26) Tail: app_27'24 (arg) @ xs (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L9: ; Continuation
  push word dx
  push word [bp+6]
  push word cx
  push word L8
  mov cx, sp
  ;; (27'24) Tail: map (g3) @ f (f2)
  mov dx, [bp+4]
  mov bp, g3
  mov ax, [bp]
  jmp ax

L10: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L6
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  push word [4]
  push word [bp+2]
  push word cx
  push word L9
  mov cx, sp
  ;; (27'15) Tail: f (f1) @ x (t1)
  mov bp, [bp+2]
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L11: ; Function: g3
  push word dx
  push word L10
  mov [2], sp
  ;; (0'0) Return: lam_24'14 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L12: ; Arm: 31'7
  ;; (0'0) Return: con_31'10 (g6)
  mov dx, g6
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L13: ; Continuation
  ;; (32'25) Tail: app_32'23 (arg) @ xs (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L14: ; Continuation
  push word [bp+6]
  push word cx
  push word L13
  mov cx, sp
  ;; (32'23) Tail: iter (g5) @ f (f2)
  mov dx, [bp+4]
  mov bp, g5
  mov ax, [bp]
  jmp ax

L15: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L12
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  push word [4]
  push word [bp+2]
  push word cx
  push word L14
  mov cx, sp
  ;; (32'15) Tail: f (f1) @ x (t1)
  mov bp, [bp+2]
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L16: ; Function: g5
  push word dx
  push word L15
  mov [2], sp
  ;; (0'0) Return: lam_29'15 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L17: ; Arm: 36'7
  ;; (34'20) Return: b (f2)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L18: ; Continuation
  ;; (37'33) Tail: app_37'25 (arg) @ xs (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L19: ; Continuation
  push word [bp+6]
  push word cx
  push word L18
  mov cx, sp
  ;; (37'25) Tail: app_37'23 (f2) @ app_37'30 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L20: ; Continuation
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L19
  mov cx, sp
  ;; (37'30) Tail: app_37'28 (arg) @ x (f3)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+6]
  mov ax, [bp]
  jmp ax

L21: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word dx
  push word cx
  push word L20
  mov cx, sp
  ;; (37'28) Tail: f (f2) @ b (f3)
  mov dx, [bp+6]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp ax

L22: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L17
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  push word [4]
  push word [2]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L21
  mov cx, sp
  ;; (37'23) Tail: fold_left (g7) @ f (f1)
  mov dx, [bp+2]
  mov bp, g7
  mov ax, [bp]
  jmp ax

L23: ; Function: t1
  push word dx
  push word [bp+2]
  push word L22
  mov [2], sp
  ;; (0'0) Return: lam_34'22 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L24: ; Function: g7
  push word dx
  push word L23
  mov [2], sp
  ;; (0'0) Return: lam_34'20 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L25: ; Arm: 41'7
  ;; (39'17) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L26: ; Continuation
  ;; (42'33) Tail: app_42'22 (arg) @ xs (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L27: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L25
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
  push word L26
  mov cx, sp
  ;; (42'22) Tail: rev_onto (g8) @ con_0'0 (t3)
  mov bp, g8
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L28: ; Function: g8
  push word dx
  push word L27
  mov [2], sp
  ;; (0'0) Return: lam_39'21 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L29: ; Arm: 54'9
  ;; (0'0) Return: con_54'12 (g9)
  mov dx, g9
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L30: ; Continuation
  ;; (55'43) Tail: app_55'37 (arg) @ xs (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L31: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L29
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov ax, [bp+2]
  mov bx, [bp+4]
  mov si, [2]
  call Bare_set_bytes
  mov [6], ax
  mov ax, [bp+4]
  add ax, 1
  mov [8], ax
  push word [4]
  push word cx
  push word L30
  mov cx, sp
  ;; (55'37) Tail: loop (f3) @ prim_0'0 (t4)
  mov bp, [bp+6]
  mov dx, [8]
  mov ax, [bp]
  jmp ax

L32: ; Function: t2
  push word bp
  push word dx
  push word [bp+2]
  push word L31
  mov [2], sp
  ;; (0'0) Return: lam_52'17 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L33: ; Continuation
  mov ax, [bp+4]
  mov [2], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L34: ; Continuation
  push word [bp+6]
  push word cx
  push word L33
  mov cx, sp
  ;; (57'9) Tail: app_57'7 (arg) @ xs (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L35: ; Continuation
  mov ax, dx
  call Bare_make_bytes
  mov [2], ax
  push word [2]
  push word L32
  mov [4], sp
  push word [2]
  push word [bp+4]
  push word cx
  push word L34
  mov cx, sp
  ;; (57'7) Tail: loop (t2) @ 0
  mov bp, [4]
  mov dx, 0
  mov ax, [bp]
  jmp ax

L36: ; Function: g10
  push word dx
  push word cx
  push word L35
  mov cx, sp
  ;; (51'29) Tail: length (g2) @ xs (arg)
  mov bp, g2
  mov dx, dx
  mov ax, [bp]
  jmp ax

L37: ; Arm: 65'9
  ;; (0'0) Return: con_65'12 (g11)
  mov dx, g11
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L38: ; Continuation
  ;; (66'43) Tail: app_66'37 (arg) @ xs (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L39: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L37
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov ax, [bp+2]
  mov bx, [bp+4]
  mov si, [2]
  call Bare_set_bytes
  mov [6], ax
  mov ax, [bp+4]
  sub ax, 1
  mov [8], ax
  push word [4]
  push word cx
  push word L38
  mov cx, sp
  ;; (66'37) Tail: loop (f3) @ prim_0'0 (t4)
  mov bp, [bp+6]
  mov dx, [8]
  mov ax, [bp]
  jmp ax

L40: ; Function: t2
  push word bp
  push word dx
  push word [bp+2]
  push word L39
  mov [2], sp
  ;; (0'0) Return: lam_63'17 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L41: ; Continuation
  mov ax, [bp+4]
  mov [2], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L42: ; Continuation
  push word [bp+6]
  push word cx
  push word L41
  mov cx, sp
  ;; (68'13) Tail: app_68'7 (arg) @ xs (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L43: ; Continuation
  mov ax, dx
  call Bare_make_bytes
  mov [2], ax
  push word [2]
  push word L40
  mov [4], sp
  mov ax, dx
  sub ax, 1
  mov [6], ax
  push word [2]
  push word [bp+4]
  push word cx
  push word L42
  mov cx, sp
  ;; (68'7) Tail: loop (t2) @ prim_0'0 (t3)
  mov bp, [4]
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L44: ; Function: g12
  push word dx
  push word cx
  push word L43
  mov cx, sp
  ;; (61'17) Tail: length (g2) @ xs (arg)
  mov bp, g2
  mov dx, dx
  mov ax, [bp]
  jmp ax

L45: ; Arm: 73'13
  ;; (72'23) Return: acc (f2)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L46: ; Continuation
  mov ax, [bp+4]
  sub ax, 1
  mov [2], ax
  ;; (74'45) Tail: app_74'19 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L47: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L45
  mov ax, [bp+2]
  mov bx, dx
  call Bare_get_bytes
  mov [4], ax
  push word [bp+4]
  push word [4]
  push word 1
  mov [6], sp
  push word dx
  push word cx
  push word L46
  mov cx, sp
  ;; (74'19) Tail: explode_loop (f3) @ con_0'0 (t3)
  mov bp, [bp+6]
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L48: ; Function: t1
  push word bp
  push word dx
  push word [bp+2]
  push word L47
  mov [2], sp
  ;; (0'0) Return: lam_72'27 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L49: ; Continuation
  mov ax, [bp+4]
  sub ax, 1
  mov [2], ax
  ;; (76'18) Tail: app_76'15 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L50: ; Function: g14
  push word dx
  push word L48
  mov [2], sp
  mov ax, dx
  call Bare_string_length
  mov [4], ax
  push word [4]
  push word cx
  push word L49
  mov cx, sp
  ;; (76'15) Tail: explode_loop (t1) @ con_76'15 (g13)
  mov bp, [2]
  mov dx, g13
  mov ax, [bp]
  jmp ax

L51: ; Arm: 81'19
  ;; (0'0) Return: con_81'24 (g17)
  mov dx, g17
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L52: ; Arm: 83'15
  ;; (0'0) Return: con_83'20 (g18)
  mov dx, g18
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L53: ; Arm: 86'31
  ;; (0'0) Return: con_86'36 (g21)
  mov dx, g21
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L54: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L53
  mov ax, [bp+4]
  sub ax, 1
  mov [2], ax
  ;; (86'52) Tail: loop (f3) @ prim_0'0 (t1)
  mov bp, [bp+6]
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L55: ; Arm: 8'9
  ;; (0'0) Return: con_8'12 (g19)
  mov dx, g19
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L56: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L52
  mov ax, [bp+2]
  mov bx, dx
  call Bare_get_bytes
  mov [4], ax
  mov ax, [bp+4]
  mov bx, dx
  call Bare_get_bytes
  mov [6], ax
  mov ax, [4]
  cmp word ax, [6]
  call Bare_make_bool_from_z
  mov [8], ax
  push word bp
  push word dx
  push word cx
  push word L54
  mov cx, sp
  mov bx, [8]
  cmp word [bx], 1
  jz L55
  ;; (0'0) Return: con_9'13 (g20)
  mov dx, g20
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L57: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L51
  push word [bp+6]
  push word [bp+4]
  push word L56
  mov [2], sp
  mov ax, [bp+8]
  sub ax, 1
  mov [4], ax
  ;; (88'9) Tail: loop (t1) @ prim_0'0 (t2)
  mov bp, [2]
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L58: ; Arm: 8'9
  ;; (0'0) Return: con_8'12 (g15)
  mov dx, g15
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L59: ; Function: t1
  mov ax, [bp+2]
  call Bare_string_length
  mov [2], ax
  mov ax, dx
  call Bare_string_length
  mov [4], ax
  mov ax, [2]
  cmp word ax, [4]
  call Bare_make_bool_from_z
  mov [6], ax
  push word [2]
  push word dx
  push word [bp+2]
  push word cx
  push word L57
  mov cx, sp
  mov bx, [6]
  cmp word [bx], 1
  jz L58
  ;; (0'0) Return: con_9'13 (g16)
  mov dx, g16
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L60: ; Function: g22
  push word dx
  push word L59
  mov [2], sp
  ;; (0'0) Return: lam_78'33 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L61: ; Arm: 111'7
  ;; (0'0) Return: con_111'10 (g26)
  mov dx, g26
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L62: ; Continuation
  ;; (112'35) Tail: put_chars (g25) @ xs (f2)
  mov dx, [bp+4]
  mov bp, g25
  mov ax, [bp]
  jmp ax

L63: ; Arm: 104'19
  mov ax, [2]
  call Bare_put_char
  mov [10], ax
  ;; (0'0) Return: prim_0'0 (t5)
  mov dx, [10]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L64: ; Arm: 105'22
  mov ax, [2]
  call Bare_put_char
  mov [12], ax
  ;; (0'0) Return: prim_0'0 (t6)
  mov dx, [12]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L65: ; Arm: 106'16
  mov ax, [2]
  call Bare_put_char
  mov [14], ax
  ;; (0'0) Return: prim_0'0 (t7)
  mov dx, [14]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L66: ; Function: g25
  mov bx, dx
  cmp word [bx], 0
  jz L61
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
  push word L62
  mov cx, sp
  mov bx, [8]
  cmp word [bx], 1
  jz L63
  mov ax, [2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [10], ax
  mov bx, [10]
  cmp word [bx], 1
  jz L64
  mov ax, 26
  cmp word ax, [6]
  call Bare_make_bool_from_n
  mov [12], ax
  mov bx, [12]
  cmp word [bx], 1
  jz L65
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

L67: ; Function: g125
  mov bx, dx
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  ;; (222'44) Return: name (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L68: ; Arm: 95'7
  ;; (0'0) Return: lit_95'10 (g23)
  mov dx, g23
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L69: ; Continuation
  ;; (91'10) Tail: implode (f2) @ app_46'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L70: ; Continuation
  push word [bp+4]
  push word cx
  push word L69
  mov cx, sp
  ;; (46'28) Tail: app_46'25 (f3) @ app_44'25 (arg)
  mov bp, [bp+6]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L71: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L70
  mov cx, sp
  ;; (44'25) Tail: app_44'22 (arg) @ xs (f4)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  mov ax, [bp]
  jmp ax

L72: ; Continuation
  push word [bp+6]
  push word dx
  push word [bp+4]
  push word cx
  push word L71
  mov cx, sp
  ;; (44'22) Tail: rev_onto (g8) @ con_44'22 (g24)
  mov bp, g8
  mov dx, g24
  mov ax, [bp]
  jmp ax

L73: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L72
  mov cx, sp
  ;; (46'25) Tail: rev_onto (g8) @ ys (arg)
  mov bp, g8
  mov dx, dx
  mov ax, [bp]
  jmp ax

L74: ; Continuation
  push word dx
  push word [bp+4]
  push word cx
  push word L73
  mov cx, sp
  ;; (91'32) Tail: explode (f3) @ s2 (f4)
  mov dx, [bp+8]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L75: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L74
  mov cx, sp
  ;; (91'19) Tail: explode (f3) @ x (f4)
  mov dx, [bp+8]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L76: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L68
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  push word [2]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L75
  mov cx, sp
  ;; (96'24) Tail: concat (me) @ xs (t2)
  mov bp, bp
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L77: ; Continuation
  push word [bp+4]
  push word dx
  push word 1
  mov [2], sp
  ;; (0'0) Return: con_0'0 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L78: ; Arm: 151'11
  push word [bp+6]
  push word cx
  push word L77
  mov cx, sp
  ;; (151'26) Tail: rev_implode (f1) @ accCs (f5)
  mov dx, [bp+10]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp ax

L79: ; Continuation
  ;; (153'74) Tail: app_153'45 (arg) @ xs (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L80: ; Continuation
  push word [bp+6]
  push word dx
  push word 1
  mov [2], sp
  push word [bp+8]
  push word cx
  push word L79
  mov cx, sp
  ;; (153'45) Tail: at_word_start (f2) @ con_0'0 (t1)
  mov bp, [bp+4]
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L81: ; Arm: 153'26
  push word [4]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L80
  mov cx, sp
  ;; (153'58) Tail: rev_implode (f1) @ accCs (f5)
  mov dx, [bp+10]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp ax

L82: ; Continuation
  ;; (154'43) Tail: app_154'32 (arg) @ xs (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L83: ; Continuation
  push word [bp+4]
  push word [bp+6]
  push word 1
  mov [2], sp
  push word [bp+8]
  push word cx
  push word L82
  mov cx, sp
  ;; (154'32) Tail: app_154'26 (arg) @ con_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L84: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L78
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov ax, [2]
  cmp word ax, ' '
  call Bare_make_bool_from_z
  mov [6], ax
  mov bx, [6]
  cmp word [bx], 1
  jz L81
  push word [4]
  push word [2]
  push word [bp+10]
  push word cx
  push word L83
  mov cx, sp
  ;; (154'26) Tail: have_letter (f4) @ accWs (f3)
  mov dx, [bp+6]
  mov bp, [bp+8]
  mov ax, [bp]
  jmp ax

L85: ; Function: t1
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L84
  mov [2], sp
  ;; (0'0) Return: lam_149'36 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L86: ; Function: t1
  push word bp
  push word dx
  push word [bp+4]
  push word [bp+2]
  push word L85
  mov [2], sp
  ;; (0'0) Return: lam_149'30 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L87: ; Arm: 158'9
  ;; (148'24) Return: accWs (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L88: ; Continuation
  ;; (160'49) Tail: app_160'43 (arg) @ xs (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L89: ; Arm: 160'24
  push word [4]
  push word cx
  push word L88
  mov cx, sp
  ;; (160'43) Tail: at_word_start (f2) @ accWs (f1)
  mov dx, [bp+2]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp ax

L90: ; Continuation
  ;; (161'31) Tail: app_161'27 (arg) @ xs (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L91: ; Continuation
  push word g27
  push word [bp+4]
  push word 1
  mov [2], sp
  push word [bp+6]
  push word cx
  push word L90
  mov cx, sp
  ;; (161'27) Tail: app_161'21 (arg) @ con_161'28 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L92: ; Function: t2
  mov bx, dx
  cmp word [bx], 0
  jz L87
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov ax, [2]
  cmp word ax, ' '
  call Bare_make_bool_from_z
  mov [6], ax
  mov bx, [6]
  cmp word [bx], 1
  jz L89
  push word [4]
  push word [2]
  push word cx
  push word L91
  mov cx, sp
  ;; (161'21) Tail: have_letter (f3) @ accWs (f1)
  mov dx, [bp+2]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L93: ; Function: t2
  push word bp
  push word [bp+2]
  push word L86
  mov [2], sp
  push word [2]
  push word bp
  push word dx
  push word L92
  mov [4], sp
  ;; (0'0) Return: lam_156'8 (t2)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L94: ; Arm: 132'22
  mov ax, `\n`
  call Bare_put_char
  mov [8], ax
  ;; (132'51) Tail: rev_implode (f1) @ acc (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L95: ; Arm: 133'28
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
  push word '\EOT'
  push word 1
  mov [16], sp
  ;; (133'76) Tail: rev_implode (f1) @ con_0'0 (t8)
  mov bp, [bp+2]
  mov dx, [16]
  mov ax, [bp]
  jmp ax

L96: ; Arm: 134'19
  ;; (134'33) Tail: readloop (me) @ acc (arg)
  mov bp, bp
  mov dx, dx
  mov ax, [bp]
  jmp ax

L97: ; Arm: 137'17
  ;; (137'29) Tail: readloop (me) @ acc (arg)
  mov bp, bp
  mov dx, dx
  mov ax, [bp]
  jmp ax

L98: ; Continuation
  mov ax, '\b'
  call Bare_put_char
  mov [2], ax
  mov ax, ' '
  call Bare_put_char
  mov [4], ax
  mov ax, '\b'
  call Bare_put_char
  mov [6], ax
  ;; (141'24) Tail: readloop (f2) @ tail (f3)
  mov dx, [bp+6]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp ax

L99: ; Arm: 139'31
  mov ax, '\b'
  call Bare_put_char
  mov [2], ax
  mov ax, ' '
  call Bare_put_char
  mov [4], ax
  mov ax, '\b'
  call Bare_put_char
  mov [6], ax
  ;; (0'0) Return: prim_0'0 (t3)
  mov dx, [6]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L100: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L98
  mov cx, sp
  mov bx, dx
  cmp word [bx], 1
  jz L99
  ;; (0'0) Return: con_139'55 (g33)
  mov dx, g33
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L101: ; Arm: 8'9
  ;; (0'0) Return: con_8'12 (g31)
  mov dx, g31
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L102: ; Arm: 135'21
  mov bx, dx
  cmp word [bx], 0
  jz L97
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
  push word bp
  push word cx
  push word L100
  mov cx, sp
  mov bx, [20]
  cmp word [bx], 1
  jz L101
  ;; (0'0) Return: con_9'13 (g32)
  mov dx, g32
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L103: ; Continuation
  push word [bp+4]
  push word [bp+8]
  push word 1
  mov [2], sp
  ;; (143'34) Tail: readloop (f3) @ con_0'0 (t1)
  mov bp, [bp+6]
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L104: ; Arm: 104'19
  mov ax, [2]
  call Bare_put_char
  mov [18], ax
  ;; (0'0) Return: prim_0'0 (t9)
  mov dx, [18]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L105: ; Arm: 105'22
  mov ax, [2]
  call Bare_put_char
  mov [20], ax
  ;; (0'0) Return: prim_0'0 (t10)
  mov dx, [20]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L106: ; Arm: 106'16
  mov ax, [2]
  call Bare_put_char
  mov [22], ax
  ;; (0'0) Return: prim_0'0 (t11)
  mov dx, [22]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L107: ; Function: t1
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
  jz L94
  mov ax, [2]
  cmp word ax, '\EOT'
  call Bare_make_bool_from_z
  mov [8], ax
  mov bx, [8]
  cmp word [bx], 1
  jz L95
  mov ax, 127
  cmp word ax, [4]
  call Bare_make_bool_from_n
  mov [10], ax
  mov bx, [10]
  cmp word [bx], 1
  jz L96
  mov ax, [4]
  cmp word ax, 127
  call Bare_make_bool_from_z
  mov [12], ax
  mov bx, [12]
  cmp word [bx], 1
  jz L102
  mov ax, [2]
  call Bare_char_to_num
  mov [14], ax
  mov ax, [14]
  cmp word ax, 8
  call Bare_make_bool_from_z
  mov [16], ax
  push word [2]
  push word bp
  push word dx
  push word cx
  push word L103
  mov cx, sp
  mov bx, [16]
  cmp word [bx], 1
  jz L104
  mov ax, [2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [18], ax
  mov bx, [18]
  cmp word [bx], 1
  jz L105
  mov ax, 26
  cmp word ax, [14]
  call Bare_make_bool_from_n
  mov [20], ax
  mov bx, [20]
  cmp word [bx], 1
  jz L106
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

L108: ; Arm: 213'36
  ;; (0'0) Return: con_213'41 (g35)
  mov dx, g35
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L109: ; Continuation
  ;; (215'13) Tail: mainloop (f2) @ fs (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L110: ; Arm: 206'7
  ;; (209'17) Return: fs (f5)
  mov dx, [bp+10]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L111: ; Arm: 177'9
  ;; (0'0) Return: con_177'12 (g38)
  mov dx, g38
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L112: ; Arm: 181'35
  push word [bp+8]
  push word 1
  mov [2], sp
  ;; (0'0) Return: con_181'40 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L113: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L112
  ;; (181'60) Tail: loop (f2) @ ps (f3)
  mov dx, [bp+6]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp ax

L114: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L113
  mov cx, sp
  ;; (181'28) Tail: app_181'23 (arg) @ command (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L115: ; Function: t3
  mov bx, dx
  cmp word [bx], 0
  jz L111
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov bx, [2]
  mov ax, [bx+2]
  mov [6], ax
  mov ax, [bx+4]
  mov [8], ax
  push word [8]
  push word [4]
  push word bp
  push word [bp+4]
  push word cx
  push word L114
  mov cx, sp
  ;; (181'23) Tail: eq_string (f1) @ name (t3)
  mov bp, [bp+2]
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L116: ; Continuation
  ;; (209'17) Return: fs (f2)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L117: ; Continuation
  push word [bp+4]
  push word cx
  push word L116
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L118: ; Continuation
  push word [bp+6]
  push word cx
  push word L117
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L119: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L118
  mov cx, sp
  ;; (91'10) Tail: implode (f2) @ app_46'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L120: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L119
  mov cx, sp
  ;; (46'28) Tail: app_46'25 (f5) @ app_44'25 (arg)
  mov bp, [bp+10]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L121: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L120
  mov cx, sp
  ;; (44'25) Tail: app_44'22 (arg) @ xs (f6)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  mov ax, [bp]
  jmp ax

L122: ; Continuation
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L121
  mov cx, sp
  ;; (44'22) Tail: rev_onto (g8) @ con_44'22 (g46)
  mov bp, g8
  mov dx, g46
  mov ax, [bp]
  jmp ax

L123: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L122
  mov cx, sp
  ;; (46'25) Tail: rev_onto (g8) @ ys (arg)
  mov bp, g8
  mov dx, dx
  mov ax, [bp]
  jmp ax

L124: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L123
  mov cx, sp
  ;; (91'32) Tail: explode (f3) @ s2 (f5)
  mov dx, [bp+10]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L125: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L124
  mov cx, sp
  ;; (91'19) Tail: explode (f3) @ lit_196'26 (g45)
  mov bp, [bp+6]
  mov dx, g45
  mov ax, [bp]
  jmp ax

L126: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L125
  mov cx, sp
  ;; (91'10) Tail: implode (f2) @ app_46'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L127: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L126
  mov cx, sp
  ;; (46'28) Tail: app_46'25 (f5) @ app_44'25 (arg)
  mov bp, [bp+10]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L128: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L127
  mov cx, sp
  ;; (44'25) Tail: app_44'22 (arg) @ xs (f6)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  mov ax, [bp]
  jmp ax

L129: ; Continuation
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L128
  mov cx, sp
  ;; (44'22) Tail: rev_onto (g8) @ con_44'22 (g44)
  mov bp, g8
  mov dx, g44
  mov ax, [bp]
  jmp ax

L130: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L129
  mov cx, sp
  ;; (46'25) Tail: rev_onto (g8) @ ys (arg)
  mov bp, g8
  mov dx, dx
  mov ax, [bp]
  jmp ax

L131: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L130
  mov cx, sp
  ;; (91'32) Tail: explode (f3) @ s2 (f5)
  mov dx, [bp+10]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L132: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L131
  mov cx, sp
  ;; (91'19) Tail: explode (f3) @ command (f5)
  mov dx, [bp+10]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L133: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L132
  mov cx, sp
  ;; (91'10) Tail: implode (f2) @ app_46'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L134: ; Continuation
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L133
  mov cx, sp
  ;; (46'28) Tail: app_46'25 (f5) @ app_44'25 (arg)
  mov bp, [bp+10]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L135: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L134
  mov cx, sp
  ;; (44'25) Tail: app_44'22 (arg) @ xs (f7)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  mov ax, [bp]
  jmp ax

L136: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L135
  mov cx, sp
  ;; (44'22) Tail: rev_onto (g8) @ con_44'22 (g43)
  mov bp, g8
  mov dx, g43
  mov ax, [bp]
  jmp ax

L137: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L136
  mov cx, sp
  ;; (46'25) Tail: rev_onto (g8) @ ys (arg)
  mov bp, g8
  mov dx, dx
  mov ax, [bp]
  jmp ax

L138: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L137
  mov cx, sp
  ;; (91'32) Tail: explode (f3) @ s2 (f6)
  mov dx, [bp+12]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L139: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L138
  mov cx, sp
  ;; (91'19) Tail: explode (f3) @ lit_196'43 (g42)
  mov bp, [bp+6]
  mov dx, g42
  mov ax, [bp]
  jmp ax

L140: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L139
  mov cx, sp
  ;; (91'10) Tail: implode (f2) @ app_46'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L141: ; Continuation
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L140
  mov cx, sp
  ;; (46'28) Tail: app_46'25 (f5) @ app_44'25 (arg)
  mov bp, [bp+10]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L142: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L141
  mov cx, sp
  ;; (44'25) Tail: app_44'22 (arg) @ xs (f7)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  mov ax, [bp]
  jmp ax

L143: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L142
  mov cx, sp
  ;; (44'22) Tail: rev_onto (g8) @ con_44'22 (g41)
  mov bp, g8
  mov dx, g41
  mov ax, [bp]
  jmp ax

L144: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L143
  mov cx, sp
  ;; (46'25) Tail: rev_onto (g8) @ ys (arg)
  mov bp, g8
  mov dx, dx
  mov ax, [bp]
  jmp ax

L145: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L144
  mov cx, sp
  ;; (91'32) Tail: explode (f3) @ lit_196'50 (g40)
  mov bp, [bp+6]
  mov dx, g40
  mov ax, [bp]
  jmp ax

L146: ; Arm: 198'9
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L145
  mov cx, sp
  ;; (91'19) Tail: explode (f3) @ lit_198'16 (g39)
  mov bp, [bp+6]
  mov dx, g39
  mov ax, [bp]
  jmp ax

L147: ; Continuation
  ;; (209'17) Return: fs (f2)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L148: ; Continuation
  push word [bp+4]
  push word cx
  push word L147
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L149: ; Continuation
  push word [bp+6]
  push word cx
  push word L148
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L150: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L149
  mov cx, sp
  ;; (91'10) Tail: implode (f2) @ app_46'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L151: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L150
  mov cx, sp
  ;; (46'28) Tail: app_46'25 (f5) @ app_44'25 (arg)
  mov bp, [bp+10]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L152: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L151
  mov cx, sp
  ;; (44'25) Tail: app_44'22 (arg) @ xs (f6)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  mov ax, [bp]
  jmp ax

L153: ; Continuation
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L152
  mov cx, sp
  ;; (44'22) Tail: rev_onto (g8) @ con_44'22 (g54)
  mov bp, g8
  mov dx, g54
  mov ax, [bp]
  jmp ax

L154: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L153
  mov cx, sp
  ;; (46'25) Tail: rev_onto (g8) @ ys (arg)
  mov bp, g8
  mov dx, dx
  mov ax, [bp]
  jmp ax

L155: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L154
  mov cx, sp
  ;; (91'32) Tail: explode (f3) @ s2 (f5)
  mov dx, [bp+10]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L156: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L155
  mov cx, sp
  ;; (91'19) Tail: explode (f3) @ lit_196'26 (g53)
  mov bp, [bp+6]
  mov dx, g53
  mov ax, [bp]
  jmp ax

L157: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L156
  mov cx, sp
  ;; (91'10) Tail: implode (f2) @ app_46'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L158: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L157
  mov cx, sp
  ;; (46'28) Tail: app_46'25 (f5) @ app_44'25 (arg)
  mov bp, [bp+10]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L159: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L158
  mov cx, sp
  ;; (44'25) Tail: app_44'22 (arg) @ xs (f6)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  mov ax, [bp]
  jmp ax

L160: ; Continuation
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L159
  mov cx, sp
  ;; (44'22) Tail: rev_onto (g8) @ con_44'22 (g52)
  mov bp, g8
  mov dx, g52
  mov ax, [bp]
  jmp ax

L161: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L160
  mov cx, sp
  ;; (46'25) Tail: rev_onto (g8) @ ys (arg)
  mov bp, g8
  mov dx, dx
  mov ax, [bp]
  jmp ax

L162: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L161
  mov cx, sp
  ;; (91'32) Tail: explode (f3) @ s2 (f5)
  mov dx, [bp+10]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L163: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L162
  mov cx, sp
  ;; (91'19) Tail: explode (f3) @ command (f5)
  mov dx, [bp+10]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L164: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L163
  mov cx, sp
  ;; (91'10) Tail: implode (f2) @ app_46'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L165: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L164
  mov cx, sp
  ;; (46'28) Tail: app_46'25 (f6) @ app_44'25 (arg)
  mov bp, [bp+12]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L166: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L165
  mov cx, sp
  ;; (44'25) Tail: app_44'22 (arg) @ xs (f7)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  mov ax, [bp]
  jmp ax

L167: ; Continuation
  push word [bp+12]
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L166
  mov cx, sp
  ;; (44'22) Tail: rev_onto (g8) @ con_44'22 (g51)
  mov bp, g8
  mov dx, g51
  mov ax, [bp]
  jmp ax

L168: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L167
  mov cx, sp
  ;; (46'25) Tail: rev_onto (g8) @ ys (arg)
  mov bp, g8
  mov dx, dx
  mov ax, [bp]
  jmp ax

L169: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L168
  mov cx, sp
  ;; (91'32) Tail: explode (f3) @ s2 (f6)
  mov dx, [bp+12]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L170: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L169
  mov cx, sp
  ;; (91'19) Tail: explode (f3) @ lit_196'43 (g50)
  mov bp, [bp+6]
  mov dx, g50
  mov ax, [bp]
  jmp ax

L171: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L170
  mov cx, sp
  ;; (91'10) Tail: implode (f2) @ app_46'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L172: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L171
  mov cx, sp
  ;; (46'28) Tail: app_46'25 (f6) @ app_44'25 (arg)
  mov bp, [bp+12]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L173: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L172
  mov cx, sp
  ;; (44'25) Tail: app_44'22 (arg) @ xs (f7)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  mov ax, [bp]
  jmp ax

L174: ; Continuation
  push word [bp+12]
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L173
  mov cx, sp
  ;; (44'22) Tail: rev_onto (g8) @ con_44'22 (g49)
  mov bp, g8
  mov dx, g49
  mov ax, [bp]
  jmp ax

L175: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L174
  mov cx, sp
  ;; (46'25) Tail: rev_onto (g8) @ ys (arg)
  mov bp, g8
  mov dx, dx
  mov ax, [bp]
  jmp ax

L176: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L175
  mov cx, sp
  ;; (91'32) Tail: explode (f3) @ lit_196'50 (g48)
  mov bp, [bp+6]
  mov dx, g48
  mov ax, [bp]
  jmp ax

L177: ; Arm: 201'14
  mov ax, [bx+2]
  mov [4], ax
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L176
  mov cx, sp
  ;; (91'19) Tail: explode (f3) @ lit_201'21 (g47)
  mov bp, [bp+6]
  mov dx, g47
  mov ax, [bp]
  jmp ax

L178: ; Continuation
  ;; (202'32) Tail: app_202'29 (arg) @ args (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L179: ; Continuation
  mov bx, dx
  cmp word [bx], 0
  jz L146
  mov ax, [bx+2]
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 0
  jz L177
  mov ax, [bx+2]
  mov [4], ax
  mov ax, [bx+4]
  mov [6], ax
  push word [bp+12]
  push word cx
  push word L178
  mov cx, sp
  ;; (202'29) Tail: f (t3) @ fs (f4)
  mov dx, [bp+8]
  mov bp, [6]
  mov ax, [bp]
  jmp ax

L180: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L179
  mov cx, sp
  ;; (183'17) Tail: loop (f7) @ case_172'18 (arg)
  mov bp, [bp+14]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L181: ; Continuation
  push word [bp+12]
  push word cx
  push word L109
  mov cx, sp
  mov bx, dx
  cmp word [bx], 0
  jz L110
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  push word [2]
  push word [bp+8]
  push word L115
  mov [6], sp
  push word [6]
  push word [4]
  push word [2]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L180
  mov cx, sp
  mov bx, [bp+10]
  mov ax, [bx+2]
  mov [8], ax
  ;; (172'43) Return: ps (t4)
  mov dx, [8]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L182: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L181
  mov cx, sp
  ;; (44'25) Tail: app_44'22 (arg) @ xs (f7)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  mov ax, [bp]
  jmp ax

L183: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L182
  mov cx, sp
  ;; (44'22) Tail: rev_onto (g8) @ con_44'22 (g37)
  mov bp, g8
  mov dx, g37
  mov ax, [bp]
  jmp ax

L184: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L183
  mov cx, sp
  ;; (164'33) Tail: app_164'30 (f5) @ app_164'42 (arg)
  mov bp, [bp+10]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L185: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L184
  mov cx, sp
  ;; (164'42) Tail: explode (f3) @ line (f7)
  mov dx, [bp+14]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L186: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L108
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L185
  mov cx, sp
  ;; (164'30) Tail: at_word_start (f5) @ con_164'30 (g36)
  mov bp, [bp+10]
  mov dx, g36
  mov ax, [bp]
  jmp ax

L187: ; Continuation
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L186
  mov cx, sp
  ;; (213'20) Tail: app_213'15 (arg) @ single_controlD (f8)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+16]
  mov ax, [bp]
  jmp ax

L188: ; Continuation
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L187
  mov cx, sp
  ;; (213'15) Tail: eq_string (f4) @ line (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L189: ; Continuation
  push word [bp+6]
  push word L107
  mov [2], sp
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L188
  mov cx, sp
  ;; (145'11) Tail: readloop (t1) @ con_145'11 (g34)
  mov bp, [2]
  mov dx, g34
  mov ax, [bp]
  jmp ax

L190: ; Continuation
  push word g29
  push word '\EOT'
  push word 1
  mov [2], sp
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L189
  mov cx, sp
  ;; (211'32) Tail: implode (f2) @ con_0'0 (t1)
  mov bp, [bp+4]
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L191: ; Continuation
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L190
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L192: ; Function: t3
  push word bp
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L191
  mov cx, sp
  ;; (114'38) Tail: explode (f3) @ lit_210'13 (g28)
  mov bp, [bp+6]
  mov dx, g28
  mov ax, [bp]
  jmp ax

L193: ; Continuation
  ;; (225'18) Return: fs (f2)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L194: ; Continuation
  push word [bp+4]
  push word cx
  push word L193
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L195: ; Arm: 235'7
  push word [bp+8]
  push word cx
  push word L194
  mov cx, sp
  ;; (114'38) Tail: explode (f1) @ lit_235'22 (g62)
  mov bp, [bp+2]
  mov dx, g62
  mov ax, [bp]
  jmp ax

L196: ; Arm: 177'9
  ;; (0'0) Return: con_177'12 (g63)
  mov dx, g63
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L197: ; Arm: 181'35
  push word [bp+8]
  push word 1
  mov [2], sp
  ;; (0'0) Return: con_181'40 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L198: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L197
  ;; (181'60) Tail: loop (f2) @ ps (f3)
  mov dx, [bp+6]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp ax

L199: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L198
  mov cx, sp
  ;; (181'28) Tail: app_181'23 (arg) @ x (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L200: ; Function: t3
  mov bx, dx
  cmp word [bx], 0
  jz L196
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov bx, [2]
  mov ax, [bx+2]
  mov [6], ax
  mov ax, [bx+4]
  mov [8], ax
  push word [8]
  push word [4]
  push word bp
  push word [bp+4]
  push word cx
  push word L199
  mov cx, sp
  ;; (181'23) Tail: eq_string (f1) @ name (t3)
  mov bp, [bp+2]
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L201: ; Arm: 177'9
  ;; (0'0) Return: con_177'12 (g72)
  mov dx, g72
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L202: ; Arm: 181'35
  push word [bp+8]
  push word 1
  mov [2], sp
  ;; (0'0) Return: con_181'40 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L203: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L202
  ;; (181'60) Tail: loop (f2) @ ps (f3)
  mov dx, [bp+6]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp ax

L204: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L203
  mov cx, sp
  ;; (181'28) Tail: app_181'23 (arg) @ x (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L205: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L201
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov bx, [2]
  mov ax, [bx+2]
  mov [6], ax
  mov ax, [bx+4]
  mov [8], ax
  push word [8]
  push word [4]
  push word bp
  push word [bp+4]
  push word cx
  push word L204
  mov cx, sp
  ;; (181'23) Tail: eq_string (f1) @ name (t3)
  mov bp, [bp+2]
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L206: ; Continuation
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L207: ; Continuation
  push word cx
  push word L206
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L208: ; Arm: 228'11
  push word g76
  push word [bp+8]
  push word 1
  mov [2], sp
  push word [2]
  push word g73
  push word 1
  mov [4], sp
  push word [bp+4]
  push word cx
  push word L207
  mov cx, sp
  ;; (228'33) Tail: concat (f3) @ con_228'34 (t2)
  mov bp, [bp+6]
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L209: ; Continuation
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L210: ; Arm: 231'16
  mov ax, [bx+2]
  mov [4], ax
  push word cx
  push word L209
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ s (t2)
  mov bp, [bp+4]
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L211: ; Continuation
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L212: ; Continuation
  push word cx
  push word L211
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L213: ; Continuation
  mov bx, dx
  cmp word [bx], 0
  jz L208
  mov ax, [bx+2]
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 0
  jz L210
  mov ax, [bx+2]
  mov [4], ax
  mov ax, [bx+4]
  mov [6], ax
  push word g80
  push word [bp+8]
  push word 1
  mov [8], sp
  push word [8]
  push word g77
  push word 1
  mov [10], sp
  push word [bp+4]
  push word cx
  push word L212
  mov cx, sp
  ;; (232'48) Tail: concat (f3) @ con_232'49 (t5)
  mov bp, [bp+6]
  mov dx, [10]
  mov ax, [bp]
  jmp ax

L214: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L213
  mov cx, sp
  ;; (183'17) Tail: loop (f5) @ case_172'18 (arg)
  mov bp, [bp+10]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L215: ; Function: t1
  push word dx
  push word [bp+4]
  push word L205
  mov [2], sp
  push word [2]
  push word dx
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L214
  mov cx, sp
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [4], ax
  ;; (172'43) Return: ps (t2)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L216: ; Continuation
  ;; (225'18) Return: fs (f2)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L217: ; Continuation
  push word [bp+4]
  push word cx
  push word L216
  mov cx, sp
  ;; (236'32) Tail: app_236'27 (arg) @ xs (f3)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+6]
  mov ax, [bp]
  jmp ax

L218: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L215
  mov [2], sp
  push word [bp+12]
  push word [bp+10]
  push word cx
  push word L217
  mov cx, sp
  ;; (236'27) Tail: iter (g5) @ lam_226'11 (t1)
  mov bp, g5
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L219: ; Continuation
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L220: ; Continuation
  push word cx
  push word L219
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L221: ; Arm: 228'11
  push word g67
  push word [bp+12]
  push word 1
  mov [2], sp
  push word [2]
  push word g64
  push word 1
  mov [4], sp
  push word [bp+4]
  push word cx
  push word L220
  mov cx, sp
  ;; (228'33) Tail: concat (f4) @ con_228'34 (t2)
  mov bp, [bp+8]
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L222: ; Continuation
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L223: ; Arm: 231'16
  mov ax, [bx+2]
  mov [4], ax
  push word cx
  push word L222
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ s (t2)
  mov bp, [bp+4]
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L224: ; Continuation
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L225: ; Continuation
  push word cx
  push word L224
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L226: ; Continuation
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L218
  mov cx, sp
  mov bx, dx
  cmp word [bx], 0
  jz L221
  mov ax, [bx+2]
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 0
  jz L223
  mov ax, [bx+2]
  mov [4], ax
  mov ax, [bx+4]
  mov [6], ax
  push word g71
  push word [bp+12]
  push word 1
  mov [8], sp
  push word [8]
  push word g68
  push word 1
  mov [10], sp
  push word [bp+4]
  push word cx
  push word L225
  mov cx, sp
  ;; (232'48) Tail: concat (f4) @ con_232'49 (t5)
  mov bp, [bp+8]
  mov dx, [10]
  mov ax, [bp]
  jmp ax

L227: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L226
  mov cx, sp
  ;; (183'17) Tail: loop (f8) @ case_172'18 (arg)
  mov bp, [bp+16]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L228: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L195
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  push word [2]
  push word [bp+4]
  push word L200
  mov [6], sp
  push word [6]
  push word [4]
  push word [2]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L227
  mov cx, sp
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [8], ax
  ;; (172'43) Return: ps (t4)
  mov dx, [8]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L229: ; Function: t1
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L228
  mov [2], sp
  ;; (0'0) Return: lam_225'21 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L230: ; Continuation
  ;; (270'17) Return: fs (f2)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L231: ; Continuation
  push word [bp+4]
  push word cx
  push word L230
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L232: ; Arm: 272'7
  push word [bp+8]
  push word cx
  push word L231
  mov cx, sp
  ;; (114'38) Tail: explode (f1) @ lit_272'22 (g83)
  mov bp, [bp+2]
  mov dx, g83
  mov ax, [bp]
  jmp ax

L233: ; Continuation
  ;; (270'17) Return: fs (f2)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L234: ; Continuation
  push word [bp+4]
  push word cx
  push word L233
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L235: ; Continuation
  push word [bp+6]
  push word cx
  push word L234
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L236: ; Arm: 275'10
  push word g87
  push word [2]
  push word 1
  mov [6], sp
  push word [6]
  push word g84
  push word 1
  mov [8], sp
  push word [bp+8]
  push word [bp+2]
  push word cx
  push word L235
  mov cx, sp
  ;; (275'33) Tail: concat (f3) @ con_275'34 (t4)
  mov bp, [bp+6]
  mov dx, [8]
  mov ax, [bp]
  jmp ax

L237: ; Continuation
  ;; (270'17) Return: fs (f2)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L238: ; Continuation
  push word [bp+4]
  push word cx
  push word L237
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L239: ; Arm: 278'12
  mov ax, [bx+2]
  mov [10], ax
  mov ax, [bx+4]
  mov [12], ax
  push word [bp+8]
  push word cx
  push word L238
  mov cx, sp
  ;; (114'38) Tail: explode (f1) @ lit_278'27 (g88)
  mov bp, [bp+2]
  mov dx, g88
  mov ax, [bp]
  jmp ax

L240: ; Arm: 177'9
  ;; (0'0) Return: con_177'12 (g89)
  mov dx, g89
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L241: ; Arm: 181'35
  push word [bp+8]
  push word 1
  mov [2], sp
  ;; (0'0) Return: con_181'40 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L242: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L241
  ;; (181'60) Tail: loop (f2) @ ps (f3)
  mov dx, [bp+6]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp ax

L243: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L242
  mov cx, sp
  ;; (181'28) Tail: app_181'23 (arg) @ source (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L244: ; Function: t5
  mov bx, dx
  cmp word [bx], 0
  jz L240
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov bx, [2]
  mov ax, [bx+2]
  mov [6], ax
  mov ax, [bx+4]
  mov [8], ax
  push word [8]
  push word [4]
  push word bp
  push word [bp+4]
  push word cx
  push word L243
  mov cx, sp
  ;; (181'23) Tail: eq_string (f1) @ name (t3)
  mov bp, [bp+2]
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L245: ; Continuation
  ;; (270'17) Return: fs (f2)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L246: ; Continuation
  push word [bp+4]
  push word cx
  push word L245
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L247: ; Continuation
  push word [bp+6]
  push word cx
  push word L246
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L248: ; Arm: 281'15
  push word g93
  push word [bp+10]
  push word 1
  mov [2], sp
  push word [2]
  push word g90
  push word 1
  mov [4], sp
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L247
  mov cx, sp
  ;; (281'38) Tail: concat (f3) @ con_281'39 (t2)
  mov bp, [bp+6]
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L249: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word 0
  mov [2], sp
  push word dx
  push word [2]
  push word 1
  mov [4], sp
  push word [4]
  push word 0
  mov [6], sp
  ;; (0'0) Return: con_283'11 (t3)
  mov dx, [6]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L250: ; Continuation
  mov bx, dx
  cmp word [bx], 0
  jz L248
  mov ax, [bx+2]
  mov [2], ax
  push word [2]
  push word [bp+12]
  push word cx
  push word L249
  mov cx, sp
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [4], ax
  ;; (172'43) Return: ps (t2)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L251: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L250
  mov cx, sp
  ;; (183'17) Tail: loop (f7) @ case_172'18 (arg)
  mov bp, [bp+14]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L252: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L232
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov bx, [4]
  cmp word [bx], 0
  jz L236
  mov ax, [bx+2]
  mov [6], ax
  mov ax, [bx+4]
  mov [8], ax
  mov bx, [8]
  cmp word [bx], 1
  jz L239
  push word [2]
  push word [bp+4]
  push word L244
  mov [10], sp
  push word [10]
  push word [6]
  push word [2]
  push word [bp+8]
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L251
  mov cx, sp
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [12], ax
  ;; (172'43) Return: ps (t6)
  mov dx, [12]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L253: ; Function: t4
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L252
  mov [2], sp
  ;; (0'0) Return: lam_270'20 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L254: ; Continuation
  ;; (313'21) Return: fs (f2)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L255: ; Continuation
  push word [bp+4]
  push word cx
  push word L254
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L256: ; Arm: 315'7
  push word [bp+12]
  push word cx
  push word L255
  mov cx, sp
  ;; (114'38) Tail: explode (f3) @ lit_315'22 (g96)
  mov bp, [bp+6]
  mov dx, g96
  mov ax, [bp]
  jmp ax

L257: ; Continuation
  ;; (313'21) Return: fs (f2)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L258: ; Continuation
  push word [bp+4]
  push word cx
  push word L257
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L259: ; Arm: 318'12
  mov ax, [bx+2]
  mov [6], ax
  mov ax, [bx+4]
  mov [8], ax
  push word [bp+12]
  push word cx
  push word L258
  mov cx, sp
  ;; (114'38) Tail: explode (f3) @ lit_318'27 (g97)
  mov bp, [bp+6]
  mov dx, g97
  mov ax, [bp]
  jmp ax

L260: ; Arm: 132'22
  mov ax, `\n`
  call Bare_put_char
  mov [8], ax
  ;; (132'51) Tail: rev_implode (f1) @ acc (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L261: ; Arm: 133'28
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
  push word '\EOT'
  push word 1
  mov [16], sp
  ;; (133'76) Tail: rev_implode (f1) @ con_0'0 (t8)
  mov bp, [bp+2]
  mov dx, [16]
  mov ax, [bp]
  jmp ax

L262: ; Arm: 134'19
  ;; (134'33) Tail: readloop (me) @ acc (arg)
  mov bp, bp
  mov dx, dx
  mov ax, [bp]
  jmp ax

L263: ; Arm: 137'17
  ;; (137'29) Tail: readloop (me) @ acc (arg)
  mov bp, bp
  mov dx, dx
  mov ax, [bp]
  jmp ax

L264: ; Continuation
  mov ax, '\b'
  call Bare_put_char
  mov [2], ax
  mov ax, ' '
  call Bare_put_char
  mov [4], ax
  mov ax, '\b'
  call Bare_put_char
  mov [6], ax
  ;; (141'24) Tail: readloop (f2) @ tail (f3)
  mov dx, [bp+6]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp ax

L265: ; Arm: 139'31
  mov ax, '\b'
  call Bare_put_char
  mov [2], ax
  mov ax, ' '
  call Bare_put_char
  mov [4], ax
  mov ax, '\b'
  call Bare_put_char
  mov [6], ax
  ;; (0'0) Return: prim_0'0 (t3)
  mov dx, [6]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L266: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L264
  mov cx, sp
  mov bx, dx
  cmp word [bx], 1
  jz L265
  ;; (0'0) Return: con_139'55 (g103)
  mov dx, g103
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L267: ; Arm: 8'9
  ;; (0'0) Return: con_8'12 (g101)
  mov dx, g101
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L268: ; Arm: 135'21
  mov bx, dx
  cmp word [bx], 0
  jz L263
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
  push word bp
  push word cx
  push word L266
  mov cx, sp
  mov bx, [20]
  cmp word [bx], 1
  jz L267
  ;; (0'0) Return: con_9'13 (g102)
  mov dx, g102
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L269: ; Continuation
  push word [bp+4]
  push word [bp+8]
  push word 1
  mov [2], sp
  ;; (143'34) Tail: readloop (f3) @ con_0'0 (t1)
  mov bp, [bp+6]
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L270: ; Arm: 104'19
  mov ax, [2]
  call Bare_put_char
  mov [18], ax
  ;; (0'0) Return: prim_0'0 (t9)
  mov dx, [18]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L271: ; Arm: 105'22
  mov ax, [2]
  call Bare_put_char
  mov [20], ax
  ;; (0'0) Return: prim_0'0 (t10)
  mov dx, [20]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L272: ; Arm: 106'16
  mov ax, [2]
  call Bare_put_char
  mov [22], ax
  ;; (0'0) Return: prim_0'0 (t11)
  mov dx, [22]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L273: ; Function: t1
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
  jz L260
  mov ax, [2]
  cmp word ax, '\EOT'
  call Bare_make_bool_from_z
  mov [8], ax
  mov bx, [8]
  cmp word [bx], 1
  jz L261
  mov ax, 127
  cmp word ax, [4]
  call Bare_make_bool_from_n
  mov [10], ax
  mov bx, [10]
  cmp word [bx], 1
  jz L262
  mov ax, [4]
  cmp word ax, 127
  call Bare_make_bool_from_z
  mov [12], ax
  mov bx, [12]
  cmp word [bx], 1
  jz L268
  mov ax, [2]
  call Bare_char_to_num
  mov [14], ax
  mov ax, [14]
  cmp word ax, 8
  call Bare_make_bool_from_z
  mov [16], ax
  push word [2]
  push word bp
  push word dx
  push word cx
  push word L269
  mov cx, sp
  mov bx, [16]
  cmp word [bx], 1
  jz L270
  mov ax, [2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [18], ax
  mov bx, [18]
  cmp word [bx], 1
  jz L271
  mov ax, 26
  cmp word ax, [14]
  call Bare_make_bool_from_n
  mov [20], ax
  mov bx, [20]
  cmp word [bx], 1
  jz L272
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

L274: ; Continuation
  ;; (324'56) Tail: concat (f2) @ app_44'25 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L275: ; Continuation
  push word [bp+4]
  push word cx
  push word L274
  mov cx, sp
  ;; (44'25) Tail: app_44'22 (arg) @ acc (f3)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+6]
  mov ax, [bp]
  jmp ax

L276: ; Arm: 324'44
  push word [bp+10]
  push word [bp+8]
  push word cx
  push word L275
  mov cx, sp
  ;; (44'22) Tail: rev_onto (g8) @ con_44'22 (g105)
  mov bp, g8
  mov dx, g105
  mov ax, [bp]
  jmp ax

L277: ; Continuation
  push word [bp+4]
  push word dx
  push word 1
  mov [2], sp
  ;; (325'17) Tail: loop (f3) @ con_0'0 (t1)
  mov bp, [bp+6]
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L278: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L277
  mov cx, sp
  ;; (91'10) Tail: implode (f2) @ app_46'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L279: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L278
  mov cx, sp
  ;; (46'28) Tail: app_46'25 (f5) @ app_44'25 (arg)
  mov bp, [bp+10]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L280: ; Continuation
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L279
  mov cx, sp
  ;; (44'25) Tail: app_44'22 (arg) @ xs (f5)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+10]
  mov ax, [bp]
  jmp ax

L281: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L280
  mov cx, sp
  ;; (44'22) Tail: rev_onto (g8) @ con_44'22 (g107)
  mov bp, g8
  mov dx, g107
  mov ax, [bp]
  jmp ax

L282: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L281
  mov cx, sp
  ;; (46'25) Tail: rev_onto (g8) @ ys (arg)
  mov bp, g8
  mov dx, dx
  mov ax, [bp]
  jmp ax

L283: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L282
  mov cx, sp
  ;; (91'32) Tail: explode (f3) @ lit_325'26 (g106)
  mov bp, [bp+6]
  mov dx, g106
  mov ax, [bp]
  jmp ax

L284: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L276
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L283
  mov cx, sp
  ;; (91'19) Tail: explode (f3) @ line (f7)
  mov dx, [bp+14]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L285: ; Continuation
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L284
  mov cx, sp
  ;; (324'28) Tail: app_324'23 (arg) @ single_controlD (f5)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+10]
  mov ax, [bp]
  jmp ax

L286: ; Continuation
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L285
  mov cx, sp
  ;; (324'23) Tail: eq_string (f4) @ line (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L287: ; Function: t1
  push word [bp+4]
  push word L273
  mov [2], sp
  push word bp
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L286
  mov cx, sp
  ;; (145'11) Tail: readloop (t1) @ con_145'11 (g104)
  mov bp, [2]
  mov dx, g104
  mov ax, [bp]
  jmp ax

L288: ; Continuation
  push word [bp+6]
  push word 0
  mov [2], sp
  push word [2]
  push word [bp+4]
  push word 0
  mov [4], sp
  push word dx
  push word [4]
  push word 1
  mov [6], sp
  push word [6]
  push word 0
  mov [8], sp
  ;; (0'0) Return: con_328'8 (t4)
  mov dx, [8]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L289: ; Continuation
  push word dx
  push word [bp+6]
  push word cx
  push word L288
  mov cx, sp
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [2], ax
  ;; (172'43) Return: ps (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L290: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L287
  mov [2], sp
  push word [bp+16]
  push word [bp+14]
  push word cx
  push word L289
  mov cx, sp
  ;; (327'28) Tail: loop (t1) @ con_327'28 (g108)
  mov bp, [2]
  mov dx, g108
  mov ax, [bp]
  jmp ax

L291: ; Continuation
  push word g99
  push word '\EOT'
  push word 1
  mov [2], sp
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L290
  mov cx, sp
  ;; (321'38) Tail: implode (f2) @ con_321'39 (t1)
  mov bp, [bp+4]
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L292: ; Continuation
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L291
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L293: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L256
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov bx, [4]
  cmp word [bx], 1
  jz L259
  push word [2]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L292
  mov cx, sp
  ;; (114'38) Tail: explode (f3) @ lit_320'19 (g98)
  mov bp, [bp+6]
  mov dx, g98
  mov ax, [bp]
  jmp ax

L294: ; Function: t7
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L293
  mov [2], sp
  ;; (0'0) Return: lam_313'24 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L295: ; Continuation
  ;; (300'19) Return: fs (f2)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L296: ; Continuation
  push word [bp+4]
  push word cx
  push word L295
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L297: ; Arm: 310'7
  push word [bp+8]
  push word cx
  push word L296
  mov cx, sp
  ;; (114'38) Tail: explode (f1) @ lit_310'22 (g111)
  mov bp, [bp+2]
  mov dx, g111
  mov ax, [bp]
  jmp ax

L298: ; Arm: 177'9
  ;; (0'0) Return: con_177'12 (g112)
  mov dx, g112
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L299: ; Arm: 181'35
  push word [bp+8]
  push word 1
  mov [2], sp
  ;; (0'0) Return: con_181'40 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L300: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L299
  ;; (181'60) Tail: loop (f2) @ ps (f3)
  mov dx, [bp+6]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp ax

L301: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L300
  mov cx, sp
  ;; (181'28) Tail: app_181'23 (arg) @ x (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L302: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L298
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov bx, [2]
  mov ax, [bx+2]
  mov [6], ax
  mov ax, [bx+4]
  mov [8], ax
  push word [8]
  push word [4]
  push word bp
  push word [bp+4]
  push word cx
  push word L301
  mov cx, sp
  ;; (181'23) Tail: eq_string (f1) @ name (t3)
  mov bp, [bp+2]
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L303: ; Continuation
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L304: ; Continuation
  push word cx
  push word L303
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L305: ; Arm: 303'11
  push word g115
  push word [bp+8]
  push word 1
  mov [2], sp
  push word [bp+4]
  push word cx
  push word L304
  mov cx, sp
  ;; (303'33) Tail: concat (f3) @ con_303'34 (t1)
  mov bp, [bp+6]
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L306: ; Continuation
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L307: ; Continuation
  push word cx
  push word L306
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L308: ; Arm: 306'16
  mov ax, [bx+2]
  mov [4], ax
  push word g118
  push word [bp+8]
  push word 1
  mov [6], sp
  push word [bp+4]
  push word cx
  push word L307
  mov cx, sp
  ;; (306'38) Tail: concat (f3) @ con_306'39 (t3)
  mov bp, [bp+6]
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L309: ; Continuation
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L310: ; Continuation
  push word cx
  push word L309
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L311: ; Continuation
  mov bx, dx
  cmp word [bx], 0
  jz L305
  mov ax, [bx+2]
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 0
  jz L308
  mov ax, [bx+2]
  mov [4], ax
  mov ax, [bx+4]
  mov [6], ax
  push word g121
  push word [bp+8]
  push word 1
  mov [8], sp
  push word [bp+4]
  push word cx
  push word L310
  mov cx, sp
  ;; (307'48) Tail: concat (f3) @ con_307'49 (t4)
  mov bp, [bp+6]
  mov dx, [8]
  mov ax, [bp]
  jmp ax

L312: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L311
  mov cx, sp
  ;; (183'17) Tail: loop (f5) @ case_172'18 (arg)
  mov bp, [bp+10]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L313: ; Function: t3
  push word dx
  push word [bp+4]
  push word L302
  mov [2], sp
  push word [2]
  push word dx
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L312
  mov cx, sp
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [4], ax
  ;; (172'43) Return: ps (t2)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L314: ; Continuation
  ;; (300'19) Return: fs (f2)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L315: ; Continuation
  push word [bp+4]
  push word cx
  push word L314
  mov cx, sp
  ;; (311'24) Tail: app_311'18 (arg) @ args (f3)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+6]
  mov ax, [bp]
  jmp ax

L316: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L297
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L313
  mov [6], sp
  push word dx
  push word [bp+8]
  push word cx
  push word L315
  mov cx, sp
  ;; (311'18) Tail: iter (g5) @ lam_301'12 (t3)
  mov bp, g5
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L317: ; Function: t10
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L316
  mov [2], sp
  ;; (0'0) Return: lam_300'22 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L318: ; Continuation
  ;; (217'17) Return: fs (f2)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L319: ; Continuation
  push word [bp+4]
  push word cx
  push word L318
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L320: ; Arm: 219'9
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  push word [bp+4]
  push word cx
  push word L319
  mov cx, sp
  ;; (114'38) Tail: explode (f1) @ lit_219'23 (g124)
  mov bp, [bp+2]
  mov dx, g124
  mov ax, [bp]
  jmp ax

L321: ; Arm: 188'9
  ;; (0'0) Return: con_188'12 (g126)
  mov dx, g126
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L322: ; Continuation
  ;; (189'48) Tail: loop (f2) @ xs (f3)
  mov dx, [bp+6]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp ax

L323: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L322
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L324: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L321
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov ax, ' '
  call Bare_put_char
  mov [6], ax
  push word [4]
  push word bp
  push word cx
  push word L323
  mov cx, sp
  ;; (114'38) Tail: explode (f1) @ x (t1)
  mov bp, [bp+2]
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L325: ; Continuation
  mov ax, `\n`
  call Bare_put_char
  mov [2], ax
  ;; (217'17) Return: fs (f2)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L326: ; Arm: 192'9
  ;; (0'0) Return: con_192'12 (g127)
  mov dx, g127
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L327: ; Continuation
  ;; (193'34) Tail: loop (f2) @ xs (f3)
  mov dx, [bp+6]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp ax

L328: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L327
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L329: ; Continuation
  push word [bp+4]
  push word L324
  mov [2], sp
  push word [bp+6]
  push word cx
  push word L325
  mov cx, sp
  mov bx, dx
  cmp word [bx], 0
  jz L326
  mov ax, [bx+2]
  mov [4], ax
  mov ax, [bx+4]
  mov [6], ax
  push word [6]
  push word [2]
  push word cx
  push word L328
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ x (t2)
  mov bp, [bp+4]
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L330: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L329
  mov cx, sp
  ;; (223'43) Tail: app_223'33 (f4) @ case_172'18 (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L331: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L330
  mov cx, sp
  mov bx, [bp+6]
  mov ax, [bx+2]
  mov [2], ax
  ;; (172'43) Return: ps (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L332: ; Function: t1
  mov bx, dx
  cmp word [bx], 1
  jz L320
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L331
  mov cx, sp
  ;; (223'33) Tail: map (g3) @ lam_222'19 (g125)
  mov bp, g3
  mov dx, g125
  mov ax, [bp]
  jmp ax

L333: ; Function: t13
  push word dx
  push word [bp+2]
  push word L332
  mov [2], sp
  ;; (0'0) Return: lam_217'20 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L334: ; Continuation
  ;; (238'18) Return: fs (f2)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L335: ; Continuation
  push word [bp+4]
  push word cx
  push word L334
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L336: ; Arm: 249'7
  push word [bp+8]
  push word cx
  push word L335
  mov cx, sp
  ;; (114'38) Tail: explode (f1) @ lit_249'22 (g130)
  mov bp, [bp+2]
  mov dx, g130
  mov ax, [bp]
  jmp ax

L337: ; Arm: 177'9
  ;; (0'0) Return: con_177'12 (g131)
  mov dx, g131
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L338: ; Arm: 181'35
  push word [bp+8]
  push word 1
  mov [2], sp
  ;; (0'0) Return: con_181'40 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L339: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L338
  ;; (181'60) Tail: loop (f2) @ ps (f3)
  mov dx, [bp+6]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp ax

L340: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L339
  mov cx, sp
  ;; (181'28) Tail: app_181'23 (arg) @ x (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L341: ; Function: t3
  mov bx, dx
  cmp word [bx], 0
  jz L337
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov bx, [2]
  mov ax, [bx+2]
  mov [6], ax
  mov ax, [bx+4]
  mov [8], ax
  push word [8]
  push word [4]
  push word bp
  push word [bp+4]
  push word cx
  push word L340
  mov cx, sp
  ;; (181'23) Tail: eq_string (f1) @ name (t3)
  mov bp, [bp+2]
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L342: ; Arm: 177'9
  ;; (0'0) Return: con_177'12 (g140)
  mov dx, g140
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L343: ; Arm: 181'35
  push word [bp+8]
  push word 1
  mov [2], sp
  ;; (0'0) Return: con_181'40 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L344: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L343
  ;; (181'60) Tail: loop (f2) @ ps (f3)
  mov dx, [bp+6]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp ax

L345: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L344
  mov cx, sp
  ;; (181'28) Tail: app_181'23 (arg) @ name (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L346: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L342
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov bx, [2]
  mov ax, [bx+2]
  mov [6], ax
  mov ax, [bx+4]
  mov [8], ax
  push word [8]
  push word [4]
  push word bp
  push word [bp+4]
  push word cx
  push word L345
  mov cx, sp
  ;; (181'23) Tail: eq_string (f1) @ name (t3)
  mov bp, [bp+2]
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L347: ; Continuation
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L348: ; Continuation
  push word cx
  push word L347
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L349: ; Arm: 242'11
  push word g144
  push word [bp+8]
  push word 1
  mov [2], sp
  push word [2]
  push word g141
  push word 1
  mov [4], sp
  push word [bp+4]
  push word cx
  push word L348
  mov cx, sp
  ;; (240'35) Tail: concat (f3) @ con_240'36 (t2)
  mov bp, [bp+6]
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L350: ; Continuation
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L351: ; Continuation
  push word cx
  push word L350
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L352: ; Arm: 245'16
  mov ax, [bx+2]
  mov [4], ax
  push word g148
  push word [bp+8]
  push word 1
  mov [6], sp
  push word [6]
  push word g145
  push word 1
  mov [8], sp
  push word [bp+4]
  push word cx
  push word L351
  mov cx, sp
  ;; (240'35) Tail: concat (f3) @ con_240'36 (t4)
  mov bp, [bp+6]
  mov dx, [8]
  mov ax, [bp]
  jmp ax

L353: ; Continuation
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L354: ; Continuation
  mov bx, dx
  cmp word [bx], 0
  jz L349
  mov ax, [bx+2]
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 0
  jz L352
  mov ax, [bx+2]
  mov [4], ax
  mov ax, [bx+4]
  mov [6], ax
  push word cx
  push word L353
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ meta (t2)
  mov bp, [bp+4]
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L355: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L354
  mov cx, sp
  ;; (183'17) Tail: loop (f5) @ case_172'18 (arg)
  mov bp, [bp+10]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L356: ; Function: t1
  push word dx
  push word [bp+4]
  push word L346
  mov [2], sp
  push word [2]
  push word dx
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L355
  mov cx, sp
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [4], ax
  ;; (172'43) Return: ps (t2)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L357: ; Continuation
  ;; (238'18) Return: fs (f2)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L358: ; Continuation
  push word [bp+4]
  push word cx
  push word L357
  mov cx, sp
  ;; (250'32) Tail: app_250'27 (arg) @ xs (f3)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+6]
  mov ax, [bp]
  jmp ax

L359: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L356
  mov [2], sp
  push word [bp+12]
  push word [bp+10]
  push word cx
  push word L358
  mov cx, sp
  ;; (250'27) Tail: iter (g5) @ lam_239'11 (t1)
  mov bp, g5
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L360: ; Continuation
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L361: ; Continuation
  push word cx
  push word L360
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L362: ; Arm: 242'11
  push word g135
  push word [bp+12]
  push word 1
  mov [2], sp
  push word [2]
  push word g132
  push word 1
  mov [4], sp
  push word [bp+4]
  push word cx
  push word L361
  mov cx, sp
  ;; (240'35) Tail: concat (f4) @ con_240'36 (t2)
  mov bp, [bp+8]
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L363: ; Continuation
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L364: ; Continuation
  push word cx
  push word L363
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L365: ; Arm: 245'16
  mov ax, [bx+2]
  mov [4], ax
  push word g139
  push word [bp+12]
  push word 1
  mov [6], sp
  push word [6]
  push word g136
  push word 1
  mov [8], sp
  push word [bp+4]
  push word cx
  push word L364
  mov cx, sp
  ;; (240'35) Tail: concat (f4) @ con_240'36 (t4)
  mov bp, [bp+8]
  mov dx, [8]
  mov ax, [bp]
  jmp ax

L366: ; Continuation
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L367: ; Continuation
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L359
  mov cx, sp
  mov bx, dx
  cmp word [bx], 0
  jz L362
  mov ax, [bx+2]
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 0
  jz L365
  mov ax, [bx+2]
  mov [4], ax
  mov ax, [bx+4]
  mov [6], ax
  push word cx
  push word L366
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ meta (t2)
  mov bp, [bp+4]
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L368: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L367
  mov cx, sp
  ;; (183'17) Tail: loop (f8) @ case_172'18 (arg)
  mov bp, [bp+16]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L369: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L336
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  push word [2]
  push word [bp+4]
  push word L341
  mov [6], sp
  push word [6]
  push word [4]
  push word [2]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L368
  mov cx, sp
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [8], ax
  ;; (172'43) Return: ps (t4)
  mov dx, [8]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L370: ; Function: t16
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L369
  mov [2], sp
  ;; (0'0) Return: lam_238'21 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L371: ; Continuation
  ;; (285'17) Return: fs (f2)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L372: ; Continuation
  push word [bp+4]
  push word cx
  push word L371
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L373: ; Arm: 287'7
  push word [bp+8]
  push word cx
  push word L372
  mov cx, sp
  ;; (114'38) Tail: explode (f1) @ lit_287'22 (g151)
  mov bp, [bp+2]
  mov dx, g151
  mov ax, [bp]
  jmp ax

L374: ; Continuation
  ;; (285'17) Return: fs (f2)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L375: ; Continuation
  push word [bp+4]
  push word cx
  push word L374
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L376: ; Continuation
  push word [bp+6]
  push word cx
  push word L375
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L377: ; Arm: 290'10
  push word g155
  push word [2]
  push word 1
  mov [6], sp
  push word [6]
  push word g152
  push word 1
  mov [8], sp
  push word [bp+8]
  push word [bp+2]
  push word cx
  push word L376
  mov cx, sp
  ;; (290'33) Tail: concat (f3) @ con_290'34 (t4)
  mov bp, [bp+6]
  mov dx, [8]
  mov ax, [bp]
  jmp ax

L378: ; Continuation
  ;; (285'17) Return: fs (f2)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L379: ; Continuation
  push word [bp+4]
  push word cx
  push word L378
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L380: ; Arm: 293'12
  mov ax, [bx+2]
  mov [10], ax
  mov ax, [bx+4]
  mov [12], ax
  push word [bp+8]
  push word cx
  push word L379
  mov cx, sp
  ;; (114'38) Tail: explode (f1) @ lit_293'27 (g156)
  mov bp, [bp+2]
  mov dx, g156
  mov ax, [bp]
  jmp ax

L381: ; Arm: 177'9
  ;; (0'0) Return: con_177'12 (g157)
  mov dx, g157
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L382: ; Arm: 181'35
  push word [bp+8]
  push word 1
  mov [2], sp
  ;; (0'0) Return: con_181'40 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L383: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L382
  ;; (181'60) Tail: loop (f2) @ ps (f3)
  mov dx, [bp+6]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp ax

L384: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L383
  mov cx, sp
  ;; (181'28) Tail: app_181'23 (arg) @ source (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L385: ; Function: t5
  mov bx, dx
  cmp word [bx], 0
  jz L381
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov bx, [2]
  mov ax, [bx+2]
  mov [6], ax
  mov ax, [bx+4]
  mov [8], ax
  push word [8]
  push word [4]
  push word bp
  push word [bp+4]
  push word cx
  push word L384
  mov cx, sp
  ;; (181'23) Tail: eq_string (f1) @ name (t3)
  mov bp, [bp+2]
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L386: ; Continuation
  ;; (285'17) Return: fs (f2)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L387: ; Continuation
  push word [bp+4]
  push word cx
  push word L386
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L388: ; Continuation
  push word [bp+6]
  push word cx
  push word L387
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L389: ; Arm: 296'15
  push word g161
  push word [bp+12]
  push word 1
  mov [2], sp
  push word [2]
  push word g158
  push word 1
  mov [4], sp
  push word [bp+10]
  push word [bp+4]
  push word cx
  push word L388
  mov cx, sp
  ;; (296'38) Tail: concat (f4) @ con_296'39 (t2)
  mov bp, [bp+8]
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L390: ; Continuation
  ;; (0'0) Return: con_256'92 (g166)
  mov dx, g166
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L391: ; Continuation
  push word cx
  push word L390
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L392: ; Continuation
  push word cx
  push word L391
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L393: ; Arm: 255'9
  push word g165
  push word [bp+8]
  push word 1
  mov [2], sp
  push word [2]
  push word g162
  push word 1
  mov [4], sp
  push word [bp+2]
  push word cx
  push word L392
  mov cx, sp
  ;; (256'26) Tail: concat (f3) @ con_256'27 (t2)
  mov bp, [bp+6]
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L394: ; Arm: 260'35
  ;; (257'10) Return: ps (f3)
  mov dx, [bp+6]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L395: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word 0
  mov [2], sp
  push word dx
  push word [2]
  push word 1
  mov [4], sp
  ;; (0'0) Return: con_0'0 (t2)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L396: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L394
  push word [bp+10]
  push word [bp+8]
  push word cx
  push word L395
  mov cx, sp
  ;; (260'73) Tail: loop (f2) @ ps (f3)
  mov dx, [bp+6]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp ax

L397: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L396
  mov cx, sp
  ;; (260'28) Tail: app_260'23 (arg) @ source (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L398: ; Function: t2
  mov bx, dx
  cmp word [bx], 0
  jz L393
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov bx, [2]
  mov ax, [bx+2]
  mov [6], ax
  mov ax, [bx+4]
  mov [8], ax
  push word [8]
  push word [6]
  push word [4]
  push word bp
  push word [bp+8]
  push word cx
  push word L397
  mov cx, sp
  ;; (260'23) Tail: eq_string (f2) @ name (t3)
  mov bp, [bp+4]
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L399: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word 0
  mov [2], sp
  push word dx
  push word [2]
  push word 1
  mov [4], sp
  push word [4]
  push word 0
  mov [6], sp
  ;; (0'0) Return: con_298'11 (t3)
  mov dx, [6]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L400: ; Continuation
  push word dx
  push word 0
  mov [2], sp
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L399
  mov cx, sp
  mov bx, [2]
  mov ax, [bx+2]
  mov [4], ax
  ;; (172'43) Return: ps (t2)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L401: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L400
  mov cx, sp
  ;; (262'17) Tail: loop (f4) @ case_172'18 (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L402: ; Continuation
  mov bx, dx
  cmp word [bx], 0
  jz L389
  mov ax, [bx+2]
  mov [2], ax
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L398
  mov [4], sp
  push word [4]
  push word [2]
  push word [bp+14]
  push word cx
  push word L401
  mov cx, sp
  mov bx, [bp+10]
  mov ax, [bx+2]
  mov [6], ax
  ;; (172'43) Return: ps (t3)
  mov dx, [6]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L403: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L402
  mov cx, sp
  ;; (183'17) Tail: loop (f8) @ case_172'18 (arg)
  mov bp, [bp+16]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L404: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L373
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov bx, [4]
  cmp word [bx], 0
  jz L377
  mov ax, [bx+2]
  mov [6], ax
  mov ax, [bx+4]
  mov [8], ax
  mov bx, [8]
  cmp word [bx], 1
  jz L380
  push word [2]
  push word [bp+4]
  push word L385
  mov [10], sp
  push word [10]
  push word [6]
  push word [2]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L403
  mov cx, sp
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [12], ax
  ;; (172'43) Return: ps (t6)
  mov dx, [12]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L405: ; Function: t19
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L404
  mov [2], sp
  ;; (0'0) Return: lam_285'20 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L406: ; Continuation
  ;; (265'6) Return: fs (f2)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L407: ; Continuation
  push word [bp+4]
  push word cx
  push word L406
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L408: ; Arm: 267'7
  push word [bp+8]
  push word cx
  push word L407
  mov cx, sp
  ;; (114'38) Tail: explode (f1) @ lit_267'22 (g169)
  mov bp, [bp+2]
  mov dx, g169
  mov ax, [bp]
  jmp ax

L409: ; Continuation
  ;; (0'0) Return: con_256'92 (g174)
  mov dx, g174
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L410: ; Continuation
  push word cx
  push word L409
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L411: ; Continuation
  push word cx
  push word L410
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L412: ; Arm: 255'9
  push word g173
  push word [bp+8]
  push word 1
  mov [2], sp
  push word [2]
  push word g170
  push word 1
  mov [4], sp
  push word [bp+2]
  push word cx
  push word L411
  mov cx, sp
  ;; (256'26) Tail: concat (f3) @ con_256'27 (t2)
  mov bp, [bp+6]
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L413: ; Arm: 260'35
  ;; (257'10) Return: ps (f3)
  mov dx, [bp+6]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L414: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word 0
  mov [2], sp
  push word dx
  push word [2]
  push word 1
  mov [4], sp
  ;; (0'0) Return: con_0'0 (t2)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L415: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L413
  push word [bp+10]
  push word [bp+8]
  push word cx
  push word L414
  mov cx, sp
  ;; (260'73) Tail: loop (f2) @ ps (f3)
  mov dx, [bp+6]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp ax

L416: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L415
  mov cx, sp
  ;; (260'28) Tail: app_260'23 (arg) @ sought (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L417: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L412
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov bx, [2]
  mov ax, [bx+2]
  mov [6], ax
  mov ax, [bx+4]
  mov [8], ax
  push word [8]
  push word [6]
  push word [4]
  push word bp
  push word [bp+8]
  push word cx
  push word L416
  mov cx, sp
  ;; (260'23) Tail: eq_string (f2) @ name (t3)
  mov bp, [bp+4]
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L418: ; Continuation
  push word dx
  push word 0
  mov [2], sp
  ;; (0'0) Return: con_262'2 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L419: ; Continuation
  push word cx
  push word L418
  mov cx, sp
  ;; (262'17) Tail: loop (f2) @ case_172'18 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L420: ; Function: t1
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L417
  mov [2], sp
  push word [2]
  push word cx
  push word L419
  mov cx, sp
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [4], ax
  ;; (172'43) Return: ps (t2)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L421: ; Function: t3
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L420
  mov [2], sp
  ;; (0'0) Return: lam_252'11 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L422: ; Continuation
  ;; (268'29) Tail: app_268'26 (arg) @ args (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L423: ; Continuation
  push word [bp+6]
  push word cx
  push word L422
  mov cx, sp
  ;; (268'26) Tail: app_268'22 (arg) @ fs (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L424: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L408
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L421
  mov [6], sp
  push word dx
  push word [bp+8]
  push word cx
  push word L423
  mov cx, sp
  ;; (268'22) Tail: fold_left (g7) @ lam_252'8 (t3)
  mov bp, g7
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L425: ; Function: t22
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L424
  mov [2], sp
  ;; (0'0) Return: lam_265'9 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L426: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L229
  mov [2], sp
  push word [2]
  push word g61
  push word 1
  mov [4], sp
  push word [4]
  push word g60
  push word 0
  mov [6], sp
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L253
  mov [8], sp
  push word [8]
  push word g82
  push word 1
  mov [10], sp
  push word [10]
  push word g81
  push word 0
  mov [12], sp
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L294
  mov [14], sp
  push word [14]
  push word g95
  push word 1
  mov [16], sp
  push word [16]
  push word g94
  push word 0
  mov [18], sp
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L317
  mov [20], sp
  push word [20]
  push word g110
  push word 1
  mov [22], sp
  push word [22]
  push word g109
  push word 0
  mov [24], sp
  push word [bp+8]
  push word L333
  mov [26], sp
  push word [26]
  push word g123
  push word 1
  mov [28], sp
  push word [28]
  push word g122
  push word 0
  mov [30], sp
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L370
  mov [32], sp
  push word [32]
  push word g129
  push word 1
  mov [34], sp
  push word [34]
  push word g128
  push word 0
  mov [36], sp
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L405
  mov [38], sp
  push word [38]
  push word g150
  push word 1
  mov [40], sp
  push word [40]
  push word g149
  push word 0
  mov [42], sp
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L425
  mov [44], sp
  push word [44]
  push word g168
  push word 1
  mov [46], sp
  push word [46]
  push word g167
  push word 0
  mov [48], sp
  push word g180
  push word [48]
  push word 1
  mov [50], sp
  push word [50]
  push word [42]
  push word 1
  mov [52], sp
  push word [52]
  push word [36]
  push word 1
  mov [54], sp
  push word [54]
  push word [30]
  push word 1
  mov [56], sp
  push word [56]
  push word [24]
  push word 1
  mov [58], sp
  push word [58]
  push word [18]
  push word 1
  mov [60], sp
  push word [60]
  push word [12]
  push word 1
  mov [62], sp
  push word [62]
  push word [6]
  push word 1
  mov [64], sp
  push word [64]
  push word g59
  push word 1
  mov [66], sp
  push word [66]
  push word 0
  mov [68], sp
  ;; (358'11) Tail: mainloop (f7) @ con_343'12 (t34)
  mov bp, [bp+14]
  mov dx, [68]
  mov ax, [bp]
  jmp ax

L427: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L426
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L428: ; Continuation
  push word [bp+8]
  push word [bp+4]
  push word L76
  mov [2], sp
  push word [bp+6]
  push word L93
  mov [4], sp
  push word [4]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L192
  mov [6], sp
  push word [6]
  push word [2]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L427
  mov cx, sp
  ;; (114'38) Tail: explode (f4) @ lit_357'13 (g55)
  mov bp, [bp+8]
  mov dx, g55
  mov ax, [bp]
  jmp ax

L429: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L428
  mov cx, sp
  ;; (78'25) Tail: block (g1) @ lam_78'30 (g22)
  mov bp, g1
  mov dx, g22
  mov ax, [bp]
  jmp ax

L430: ; Continuation
  push word dx
  push word [bp+4]
  push word cx
  push word L429
  mov cx, sp
  ;; (71'23) Tail: block (g1) @ lam_71'28 (g14)
  mov bp, g1
  mov dx, g14
  mov ax, [bp]
  jmp ax

L431: ; Continuation
  push word dx
  push word cx
  push word L430
  mov cx, sp
  ;; (60'26) Tail: block (g1) @ lam_60'31 (g12)
  mov bp, g1
  mov dx, g12
  mov ax, [bp]
  jmp ax

L432: ; Start
  push word cx
  push word L431
  mov cx, sp
  ;; (4'17) Tail: block (g1) @ lam_50'31 (g10)
  mov bp, g1
  mov dx, g10
  mov ax, [bp]
  jmp ax

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
g28: dw 2, '%', ' '
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
g39: dw 17, 'c', 'o', 'm', 'm', 'a', 'n', 'd', ' ', 'n', 'o', 't', ' ', 'f', 'o', 'u', 'n', 'd'
g40: dw 1, `\n`
g41: dw 0
g42: dw 2, ':', ' '
g43: dw 0
g44: dw 0
g45: dw 6, 's', 'h', 'a', 'm', ':', ' '
g46: dw 0
g47: dw 17, 'P', 'e', 'r', 'm', 'i', 's', 's', 'i', 'o', 'n', ' ', 'd', 'e', 'n', 'i', 'e', 'd'
g48: dw 1, `\n`
g49: dw 0
g50: dw 2, ':', ' '
g51: dw 0
g52: dw 0
g53: dw 6, 's', 'h', 'a', 'm', ':', ' '
g54: dw 0
g55: dw 51, 'S', 'h', 'a', 'm', ':', ' ', 'I', 'n', '-', 'm', 'e', 'm', 'o', 'r', 'y', ' ', 'f', 'i', 'l', 'e', '-', 's', 'y', 's', 't', 'e', 'm', '.', ' ', 'C', 'o', 'n', 's', 'i', 'd', 'e', 'r', ' ', 't', 'y', 'p', 'i', 'n', 'g', ' ', '"', 'l', 's', '"', '.', `\n`
g56: dw 6, 'r', 'e', 'a', 'd', 'm', 'e'
g57: dw 82, 'W', 'e', 'l', 'c', 'o', 'm', 'e', ' ', 't', 'o', ' ', 's', 'h', 'a', 'm', ';', ' ', 'p', 'l', 'e', 'a', 's', 'e', ' ', 't', 'r', 'y', ' ', 'a', 'l', 'l', ' ', 't', 'h', 'e', ' ', 'c', 'o', 'm', 'm', 'a', 'n', 'd', 's', '!', `\n`, 'C', 'a', 'n', ' ', 'y', 'o', 'u', ' ', 'f', 'i', 'n', 'd', ' ', 't', 'h', 'e', ' ', 'h', 'i', 'd', 'd', 'e', 'n', ' ', 'E', 'a', 's', 't', 'e', 'r', ' ', 'E', 'g', 'g', '?', `\n`
g58: dw 0, g57
g59: dw 0, g56, g58
g60: dw 3, 'c', 'a', 't'
g61: dw 57, 'c', 'a', 't', ' ', '-', ' ', 'c', 'o', 'n', 'c', 'a', 't', 'e', 'n', 'a', 't', 'e', ' ', 'f', 'i', 'l', 'e', 's', ' ', 'a', 'n', 'd', ' ', 'p', 'r', 'i', 'n', 't', ' ', 'o', 'n', ' ', 't', 'h', 'e', ' ', 's', 't', 'a', 'n', 'd', 'a', 'r', 'd', ' ', 'o', 'u', 't', 'p', 'u', 't', `\n`
g62: dw 33, 'c', 'a', 't', ':', ' ', 't', 'a', 'k', 'e', 's', ' ', 'a', 't', ' ', 'l', 'e', 'a', 's', 't', ' ', 'o', 'n', 'e', ' ', 'a', 'r', 'g', 'u', 'm', 'e', 'n', 't', `\n`
g63: dw 0
g64: dw 5, 'c', 'a', 't', ':', ' '
g65: dw 29, ' ', ':', ' ', 'N', 'o', ' ', 's', 'u', 'c', 'h', ' ', 'f', 'i', 'l', 'e', ' ', 'o', 'r', ' ', 'd', 'i', 'r', 'e', 'c', 't', 'o', 'r', 'y', `\n`
g66: dw 0
g67: dw 1, g65, g66
g68: dw 5, 'c', 'a', 't', ':', ' '
g69: dw 19, ' ', ':', ' ', 'N', 'o', 't', ' ', 'a', ' ', 'd', 'a', 't', 'a', ' ', 'f', 'i', 'l', 'e', `\n`
g70: dw 0
g71: dw 1, g69, g70
g72: dw 0
g73: dw 5, 'c', 'a', 't', ':', ' '
g74: dw 29, ' ', ':', ' ', 'N', 'o', ' ', 's', 'u', 'c', 'h', ' ', 'f', 'i', 'l', 'e', ' ', 'o', 'r', ' ', 'd', 'i', 'r', 'e', 'c', 't', 'o', 'r', 'y', `\n`
g75: dw 0
g76: dw 1, g74, g75
g77: dw 5, 'c', 'a', 't', ':', ' '
g78: dw 19, ' ', ':', ' ', 'N', 'o', 't', ' ', 'a', ' ', 'd', 'a', 't', 'a', ' ', 'f', 'i', 'l', 'e', `\n`
g79: dw 0
g80: dw 1, g78, g79
g81: dw 2, 'c', 'p'
g82: dw 32, 'c', 'p', ' ', '-', ' ', 'c', 'o', 'p', 'y', ' ', 'f', 'i', 'l', 'e', 's', ' ', 'a', 'n', 'd', ' ', 'd', 'i', 'r', 'e', 'c', 't', 'o', 'r', 'i', 'e', 's', `\n`
g83: dw 25, 'c', 'p', ':', ' ', 'm', 'i', 's', 's', 'i', 'n', 'g', ' ', 'f', 'i', 'l', 'e', ' ', 'o', 'p', 'e', 'r', 'a', 'n', 'd', `\n`
g84: dw 44, 'c', 'p', ':', ' ', 'm', 'i', 's', 's', 'i', 'n', 'g', ' ', 'd', 'e', 's', 't', 'i', 'n', 'a', 't', 'i', 'o', 'n', ' ', 'f', 'i', 'l', 'e', ' ', 'o', 'p', 'e', 'r', 'a', 'n', 'd', ' ', 'a', 'f', 't', 'e', 'r', ' ', '\''
g85: dw 2, '\'', `\n`
g86: dw 0
g87: dw 1, g85, g86
g88: dw 30, 'c', 'p', ':', ' ', 'u', 'n', 'e', 'x', 'p', 'e', 'c', 't', 'e', 'd', ' ', 'e', 'x', 't', 'r', 'a', ' ', 'o', 'p', 'e', 'r', 'a', 'n', 'd', 's', `\n`
g89: dw 0
g90: dw 17, 'c', 'p', ':', ' ', 'c', 'a', 'n', 'n', 'o', 't', ' ', 's', 't', 'a', 't', ' ', '\''
g91: dw 29, '\'', ':', ' ', 'N', 'o', ' ', 's', 'u', 'c', 'h', ' ', 'f', 'i', 'l', 'e', ' ', 'o', 'r', ' ', 'd', 'i', 'r', 'e', 'c', 't', 'o', 'r', 'y', `\n`
g92: dw 0
g93: dw 1, g91, g92
g94: dw 6, 'c', 'r', 'e', 'a', 't', 'e'
g95: dw 27, 'c', 'r', 'e', 'a', 't', 'e', ' ', '\8212', ' ', 'c', 'r', 'e', 'a', 't', 'e', ' ', 'a', ' ', 'n', 'e', 'w', ' ', 'f', 'i', 'l', 'e', `\n`
g96: dw 26, 'c', 'r', 'e', 'a', 't', 'e', ':', ' ', 'm', 'i', 's', 's', 'i', 'n', 'g', ' ', 'f', 'i', 'l', 'e', ' ', 'n', 'a', 'm', 'e', `\n`
g97: dw 34, 'c', 'r', 'e', 'a', 't', 'e', ':', ' ', 'u', 'n', 'e', 'x', 'p', 'e', 'c', 't', 'e', 'd', ' ', 'e', 'x', 't', 'r', 'a', ' ', 'o', 'p', 'e', 'r', 'a', 'n', 'd', 's', `\n`
g98: dw 34, '(', 't', 'o', ' ', 'f', 'i', 'n', 'i', 's', 'h', ' ', 't', 'y', 'p', 'e', ' ', '^', 'D', ' ', 'o', 'n', ' ', 'a', ' ', 'n', 'e', 'w', ' ', 'l', 'i', 'n', 'e', ')', `\n`
g99: dw 0
g100: dw 0
g101: dw 0
g102: dw 1
g103: dw 0
g104: dw 0
g105: dw 0
g106: dw 1, `\n`
g107: dw 0
g108: dw 0
g109: dw 4, 'f', 'i', 'l', 'e'
g110: dw 27, 'f', 'i', 'l', 'e', ' ', '\8212', ' ', 'd', 'e', 't', 'e', 'r', 'm', 'i', 'n', 'e', ' ', 'f', 'i', 'l', 'e', ' ', 't', 'y', 'p', 'e', `\n`
g111: dw 34, 'f', 'i', 'l', 'e', ':', ' ', 't', 'a', 'k', 'e', 's', ' ', 'a', 't', ' ', 'l', 'e', 'a', 's', 't', ' ', 'o', 'n', 'e', ' ', 'a', 'r', 'g', 'u', 'm', 'e', 'n', 't', `\n`
g112: dw 0
g113: dw 29, ' ', ':', ' ', 'N', 'o', ' ', 's', 'u', 'c', 'h', ' ', 'f', 'i', 'l', 'e', ' ', 'o', 'r', ' ', 'd', 'i', 'r', 'e', 'c', 't', 'o', 'r', 'y', `\n`
g114: dw 0
g115: dw 1, g113, g114
g116: dw 13, ':', ' ', 'A', 'S', 'C', 'I', 'I', ' ', 't', 'e', 'x', 't', `\n`
g117: dw 0
g118: dw 1, g116, g117
g119: dw 13, ':', ' ', 'e', 'x', 'e', 'c', 'u', 't', 'a', 'b', 'l', 'e', `\n`
g120: dw 0
g121: dw 1, g119, g120
g122: dw 2, 'l', 's'
g123: dw 29, 'l', 's', ' ', '-', ' ', 'l', 'i', 's', 't', ' ', 'd', 'i', 'r', 'e', 'c', 't', 'o', 'r', 'y', ' ', 'c', 'o', 'n', 't', 'e', 'n', 't', 's', `\n`
g124: dw 23, 'l', 's', ':', ' ', 't', 'a', 'k', 'e', 's', ' ', 'n', 'o', ' ', 'a', 'r', 'g', 'u', 'm', 'e', 'n', 't', 's', `\n`
g125: dw L67
g126: dw 0
g127: dw 0
g128: dw 3, 'm', 'a', 'n'
g129: dw 51, 'm', 'a', 'n', ' ', '-', ' ', 'a', 'n', ' ', 'i', 'n', 't', 'e', 'r', 'f', 'a', 'c', 'e', ' ', 't', 'o', ' ', 't', 'h', 'e', ' ', 's', 'y', 's', 't', 'e', 'm', ' ', 'r', 'e', 'f', 'e', 'r', 'e', 'n', 'c', 'e', ' ', 'm', 'a', 'n', 'u', 'a', 'l', 's', `\n`
g130: dw 30, 'W', 'h', 'a', 't', ' ', 'm', 'a', 'n', 'u', 'a', 'l', ' ', 'p', 'a', 'g', 'e', ' ', 'd', 'o', ' ', 'y', 'o', 'u', ' ', 'w', 'a', 'n', 't', '?', `\n`
g131: dw 0
g132: dw 20, 'N', 'o', ' ', 'm', 'a', 'n', 'u', 'a', 'l', ' ', 'e', 'n', 't', 'r', 'y', ' ', 'f', 'o', 'r', ' '
g133: dw 1, `\n`
g134: dw 0
g135: dw 1, g133, g134
g136: dw 20, 'N', 'o', ' ', 'm', 'a', 'n', 'u', 'a', 'l', ' ', 'e', 'n', 't', 'r', 'y', ' ', 'f', 'o', 'r', ' '
g137: dw 1, `\n`
g138: dw 0
g139: dw 1, g137, g138
g140: dw 0
g141: dw 20, 'N', 'o', ' ', 'm', 'a', 'n', 'u', 'a', 'l', ' ', 'e', 'n', 't', 'r', 'y', ' ', 'f', 'o', 'r', ' '
g142: dw 1, `\n`
g143: dw 0
g144: dw 1, g142, g143
g145: dw 20, 'N', 'o', ' ', 'm', 'a', 'n', 'u', 'a', 'l', ' ', 'e', 'n', 't', 'r', 'y', ' ', 'f', 'o', 'r', ' '
g146: dw 1, `\n`
g147: dw 0
g148: dw 1, g146, g147
g149: dw 2, 'm', 'v'
g150: dw 25, 'm', 'v', ' ', '-', ' ', 'm', 'o', 'v', 'e', ' ', '(', 'r', 'e', 'n', 'a', 'm', 'e', ')', ' ', 'f', 'i', 'l', 'e', 's', `\n`
g151: dw 25, 'm', 'v', ':', ' ', 'm', 'i', 's', 's', 'i', 'n', 'g', ' ', 'f', 'i', 'l', 'e', ' ', 'o', 'p', 'e', 'r', 'a', 'n', 'd', `\n`
g152: dw 44, 'm', 'v', ':', ' ', 'm', 'i', 's', 's', 'i', 'n', 'g', ' ', 'd', 'e', 's', 't', 'i', 'n', 'a', 't', 'i', 'o', 'n', ' ', 'f', 'i', 'l', 'e', ' ', 'o', 'p', 'e', 'r', 'a', 'n', 'd', ' ', 'a', 'f', 't', 'e', 'r', ' ', '\''
g153: dw 2, '\'', `\n`
g154: dw 0
g155: dw 1, g153, g154
g156: dw 30, 'm', 'v', ':', ' ', 'u', 'n', 'e', 'x', 'p', 'e', 'c', 't', 'e', 'd', ' ', 'e', 'x', 't', 'r', 'a', ' ', 'o', 'p', 'e', 'r', 'a', 'n', 'd', 's', `\n`
g157: dw 0
g158: dw 17, 'm', 'v', ':', ' ', 'c', 'a', 'n', 'n', 'o', 't', ' ', 's', 't', 'a', 't', ' ', '\''
g159: dw 29, '\'', ':', ' ', 'N', 'o', ' ', 's', 'u', 'c', 'h', ' ', 'f', 'i', 'l', 'e', ' ', 'o', 'r', ' ', 'd', 'i', 'r', 'e', 'c', 't', 'o', 'r', 'y', `\n`
g160: dw 0
g161: dw 1, g159, g160
g162: dw 19, 'r', 'm', ':', ' ', 'c', 'a', 'n', 'n', 'o', 't', ' ', 'r', 'e', 'm', 'o', 'v', 'e', ' ', '\''
g163: dw 29, '\'', ':', ' ', 'N', 'o', ' ', 's', 'u', 'c', 'h', ' ', 'f', 'i', 'l', 'e', ' ', 'o', 'r', ' ', 'd', 'i', 'r', 'e', 'c', 't', 'o', 'r', 'y', `\n`
g164: dw 0
g165: dw 1, g163, g164
g166: dw 0
g167: dw 2, 'r', 'm'
g168: dw 66, 'r', 'm', ' ', '-', ' ', 'r', 'e', 'm', 'o', 'v', 'e', ' ', 'f', 'i', 'l', 'e', 's', ' ', 'o', 'r', ' ', 'd', 'i', 'r', 'e', 'c', 't', 'o', 'r', 'i', 'e', 's', ' ', '(', 'd', 'i', 'r', 'e', 'c', 't', 'o', 'r', 'i', 'e', 's', ' ', 'n', 'o', 't', ' ', 's', 'u', 'p', 'p', 'o', 'r', 't', 'e', 'd', ' ', 'y', 'e', 't', '!', ')', `\n`
g169: dw 20, 'r', 'm', ':', ' ', 'm', 'i', 's', 's', 'i', 'n', 'g', ' ', 'o', 'p', 'e', 'r', 'a', 'n', 'd', `\n`
g170: dw 19, 'r', 'm', ':', ' ', 'c', 'a', 'n', 'n', 'o', 't', ' ', 'r', 'e', 'm', 'o', 'v', 'e', ' ', '\''
g171: dw 29, '\'', ':', ' ', 'N', 'o', ' ', 's', 'u', 'c', 'h', ' ', 'f', 'i', 'l', 'e', ' ', 'o', 'r', ' ', 'd', 'i', 'r', 'e', 'c', 't', 'o', 'r', 'y', `\n`
g172: dw 0
g173: dw 1, g171, g172
g174: dw 0
g175: dw 3, 'c', 'a', 't'
g176: dw 219, 'I', ' ', 'h', 'a', 'v', 'e', ' ', 'a', ' ', 'l', 'i', 't', 't', 'l', 'e', ' ', 's', 'h', 'a', 'd', 'o', 'w', ' ', 't', 'h', 'a', 't', ' ', 'g', 'o', 'e', 's', ' ', 'i', 'n', ' ', 'a', 'n', 'd', ' ', 'o', 'u', 't', ' ', 'w', 'i', 't', 'h', ' ', 'm', 'e', ',', `\n`, 'A', 'n', 'd', ' ', 'w', 'h', 'a', 't', ' ', 'c', 'a', 'n', ' ', 'b', 'e', ' ', 't', 'h', 'e', ' ', 'u', 's', 'e', ' ', 'o', 'f', ' ', 'h', 'i', 'm', ' ', 'i', 's', ' ', 'm', 'o', 'r', 'e', ' ', 't', 'h', 'a', 'n', ' ', 'I', ' ', 'c', 'a', 'n', ' ', 's', 'e', 'e', '.', `\n`, 'H', 'e', ' ', 'i', 's', ' ', 'v', 'e', 'r', 'y', ',', ' ', 'v', 'e', 'r', 'y', ' ', 'l', 'i', 'k', 'e', ' ', 'm', 'e', ' ', 'f', 'r', 'o', 'm', ' ', 't', 'h', 'e', ' ', 'h', 'e', 'e', 'l', 's', ' ', 'u', 'p', ' ', 't', 'o', ' ', 't', 'h', 'e', ' ', 'h', 'e', 'a', 'd', ';', `\n`, 'A', 'n', 'd', ' ', 'I', ' ', 's', 'e', 'e', ' ', 'h', 'i', 'm', ' ', 'j', 'u', 'm', 'p', ' ', 'b', 'e', 'f', 'o', 'r', 'e', ' ', 'm', 'e', ',', ' ', 'w', 'h', 'e', 'n', ' ', 'I', ' ', 'j', 'u', 'm', 'p', ' ', 'i', 'n', 't', 'o', ' ', 'm', 'y', ' ', 'b', 'e', 'd', '.', `\n`
g177: dw 0, g176
g178: dw 0, g175, g177
g179: dw 0
g180: dw 1, g178, g179

bare_start: jmp L432
