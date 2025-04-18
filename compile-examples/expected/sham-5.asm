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
  call Bare_freeze_bytes
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
  call Bare_freeze_bytes
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
  call Bare_string_index
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
  call Bare_string_index
  mov [4], ax
  mov ax, [bp+4]
  mov bx, dx
  call Bare_string_index
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
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L399
  mov cx, sp
  ;; (262'17) Tail: loop (f4) @ case_172'18 (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L401: ; Continuation
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
  push word L400
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

L402: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L401
  mov cx, sp
  ;; (183'17) Tail: loop (f8) @ case_172'18 (arg)
  mov bp, [bp+16]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L403: ; Function: t1
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
  push word L402
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

L404: ; Function: t19
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L403
  mov [2], sp
  ;; (0'0) Return: lam_285'20 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L405: ; Continuation
  ;; (265'6) Return: fs (f2)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L406: ; Continuation
  push word [bp+4]
  push word cx
  push word L405
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L407: ; Arm: 267'7
  push word [bp+8]
  push word cx
  push word L406
  mov cx, sp
  ;; (114'38) Tail: explode (f1) @ lit_267'22 (g169)
  mov bp, [bp+2]
  mov dx, g169
  mov ax, [bp]
  jmp ax

L408: ; Continuation
  ;; (0'0) Return: con_256'92 (g174)
  mov dx, g174
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L409: ; Continuation
  push word cx
  push word L408
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L410: ; Continuation
  push word cx
  push word L409
  mov cx, sp
  ;; (114'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L411: ; Arm: 255'9
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
  push word L410
  mov cx, sp
  ;; (256'26) Tail: concat (f3) @ con_256'27 (t2)
  mov bp, [bp+6]
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L412: ; Arm: 260'35
  ;; (257'10) Return: ps (f3)
  mov dx, [bp+6]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L413: ; Continuation
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

L414: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L412
  push word [bp+10]
  push word [bp+8]
  push word cx
  push word L413
  mov cx, sp
  ;; (260'73) Tail: loop (f2) @ ps (f3)
  mov dx, [bp+6]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp ax

L415: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L414
  mov cx, sp
  ;; (260'28) Tail: app_260'23 (arg) @ sought (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L416: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L411
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
  push word L415
  mov cx, sp
  ;; (260'23) Tail: eq_string (f2) @ name (t3)
  mov bp, [bp+4]
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L417: ; Continuation
  push word dx
  push word 0
  mov [2], sp
  ;; (0'0) Return: con_262'2 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L418: ; Continuation
  push word cx
  push word L417
  mov cx, sp
  ;; (262'17) Tail: loop (f2) @ case_172'18 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L419: ; Function: t1
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L416
  mov [2], sp
  push word [2]
  push word cx
  push word L418
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

L420: ; Function: t3
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L419
  mov [2], sp
  ;; (0'0) Return: lam_252'11 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L421: ; Continuation
  ;; (268'29) Tail: app_268'26 (arg) @ args (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L422: ; Continuation
  push word [bp+6]
  push word cx
  push word L421
  mov cx, sp
  ;; (268'26) Tail: app_268'22 (arg) @ fs (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L423: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L407
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L420
  mov [6], sp
  push word dx
  push word [bp+8]
  push word cx
  push word L422
  mov cx, sp
  ;; (268'22) Tail: fold_left (g7) @ lam_252'8 (t3)
  mov bp, g7
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L424: ; Function: t22
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L423
  mov [2], sp
  ;; (0'0) Return: lam_265'9 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L425: ; Continuation
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
  push word L404
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
  push word L424
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

L426: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L425
  mov cx, sp
  ;; (114'29) Tail: put_chars (g25) @ app_114'38 (arg)
  mov bp, g25
  mov dx, dx
  mov ax, [bp]
  jmp ax

L427: ; Continuation
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
  push word L426
  mov cx, sp
  ;; (114'38) Tail: explode (f4) @ lit_357'13 (g55)
  mov bp, [bp+8]
  mov dx, g55
  mov ax, [bp]
  jmp ax

L428: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L427
  mov cx, sp
  ;; (78'25) Tail: block (g1) @ lam_78'30 (g22)
  mov bp, g1
  mov dx, g22
  mov ax, [bp]
  jmp ax

L429: ; Continuation
  push word dx
  push word [bp+4]
  push word cx
  push word L428
  mov cx, sp
  ;; (71'23) Tail: block (g1) @ lam_71'28 (g14)
  mov bp, g1
  mov dx, g14
  mov ax, [bp]
  jmp ax

L430: ; Continuation
  push word dx
  push word cx
  push word L429
  mov cx, sp
  ;; (60'26) Tail: block (g1) @ lam_60'31 (g12)
  mov bp, g1
  mov dx, g12
  mov ax, [bp]
  jmp ax

L431: ; Start
  push word cx
  push word L430
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
g40: dw 1, `\n`, g40+3, 0
g41: dw 0
g42: dw 1, ':', g42+3, 1, ' ', g42+6, 0
g43: dw 0
g44: dw 0
g45: dw 1, 's', g45+3, 1, 'h', g45+6, 1, 'a', g45+9, 1, 'm', g45+12, 1, ':', g45+15, 1, ' ', g45+18, 0
g46: dw 0
g47: dw 1, 'P', g47+3, 1, 'e', g47+6, 1, 'r', g47+9, 1, 'm', g47+12, 1, 'i', g47+15, 1, 's', g47+18, 1, 's', g47+21, 1, 'i', g47+24, 1, 'o', g47+27, 1, 'n', g47+30, 1, ' ', g47+33, 1, 'd', g47+36, 1, 'e', g47+39, 1, 'n', g47+42, 1, 'i', g47+45, 1, 'e', g47+48, 1, 'd', g47+51, 0
g48: dw 1, `\n`, g48+3, 0
g49: dw 0
g50: dw 1, ':', g50+3, 1, ' ', g50+6, 0
g51: dw 0
g52: dw 0
g53: dw 1, 's', g53+3, 1, 'h', g53+6, 1, 'a', g53+9, 1, 'm', g53+12, 1, ':', g53+15, 1, ' ', g53+18, 0
g54: dw 0
g55: dw 1, 'S', g55+3, 1, 'h', g55+6, 1, 'a', g55+9, 1, 'm', g55+12, 1, ':', g55+15, 1, ' ', g55+18, 1, 'I', g55+21, 1, 'n', g55+24, 1, '-', g55+27, 1, 'm', g55+30, 1, 'e', g55+33, 1, 'm', g55+36, 1, 'o', g55+39, 1, 'r', g55+42, 1, 'y', g55+45, 1, ' ', g55+48, 1, 'f', g55+51, 1, 'i', g55+54, 1, 'l', g55+57, 1, 'e', g55+60, 1, '-', g55+63, 1, 's', g55+66, 1, 'y', g55+69, 1, 's', g55+72, 1, 't', g55+75, 1, 'e', g55+78, 1, 'm', g55+81, 1, '.', g55+84, 1, ' ', g55+87, 1, 'C', g55+90, 1, 'o', g55+93, 1, 'n', g55+96, 1, 's', g55+99, 1, 'i', g55+102, 1, 'd', g55+105, 1, 'e', g55+108, 1, 'r', g55+111, 1, ' ', g55+114, 1, 't', g55+117, 1, 'y', g55+120, 1, 'p', g55+123, 1, 'i', g55+126, 1, 'n', g55+129, 1, 'g', g55+132, 1, ' ', g55+135, 1, '"', g55+138, 1, 'l', g55+141, 1, 's', g55+144, 1, '"', g55+147, 1, '.', g55+150, 1, `\n`, g55+153, 0
g56: dw 1, 'r', g56+3, 1, 'e', g56+6, 1, 'a', g56+9, 1, 'd', g56+12, 1, 'm', g56+15, 1, 'e', g56+18, 0
g57: dw 1, 'W', g57+3, 1, 'e', g57+6, 1, 'l', g57+9, 1, 'c', g57+12, 1, 'o', g57+15, 1, 'm', g57+18, 1, 'e', g57+21, 1, ' ', g57+24, 1, 't', g57+27, 1, 'o', g57+30, 1, ' ', g57+33, 1, 's', g57+36, 1, 'h', g57+39, 1, 'a', g57+42, 1, 'm', g57+45, 1, ';', g57+48, 1, ' ', g57+51, 1, 'p', g57+54, 1, 'l', g57+57, 1, 'e', g57+60, 1, 'a', g57+63, 1, 's', g57+66, 1, 'e', g57+69, 1, ' ', g57+72, 1, 't', g57+75, 1, 'r', g57+78, 1, 'y', g57+81, 1, ' ', g57+84, 1, 'a', g57+87, 1, 'l', g57+90, 1, 'l', g57+93, 1, ' ', g57+96, 1, 't', g57+99, 1, 'h', g57+102, 1, 'e', g57+105, 1, ' ', g57+108, 1, 'c', g57+111, 1, 'o', g57+114, 1, 'm', g57+117, 1, 'm', g57+120, 1, 'a', g57+123, 1, 'n', g57+126, 1, 'd', g57+129, 1, 's', g57+132, 1, '!', g57+135, 1, `\n`, g57+138, 1, 'C', g57+141, 1, 'a', g57+144, 1, 'n', g57+147, 1, ' ', g57+150, 1, 'y', g57+153, 1, 'o', g57+156, 1, 'u', g57+159, 1, ' ', g57+162, 1, 'f', g57+165, 1, 'i', g57+168, 1, 'n', g57+171, 1, 'd', g57+174, 1, ' ', g57+177, 1, 't', g57+180, 1, 'h', g57+183, 1, 'e', g57+186, 1, ' ', g57+189, 1, 'h', g57+192, 1, 'i', g57+195, 1, 'd', g57+198, 1, 'd', g57+201, 1, 'e', g57+204, 1, 'n', g57+207, 1, ' ', g57+210, 1, 'E', g57+213, 1, 'a', g57+216, 1, 's', g57+219, 1, 't', g57+222, 1, 'e', g57+225, 1, 'r', g57+228, 1, ' ', g57+231, 1, 'E', g57+234, 1, 'g', g57+237, 1, 'g', g57+240, 1, '?', g57+243, 1, `\n`, g57+246, 0
g58: dw 0, g57
g59: dw 0, g56, g58
g60: dw 1, 'c', g60+3, 1, 'a', g60+6, 1, 't', g60+9, 0
g61: dw 1, 'c', g61+3, 1, 'a', g61+6, 1, 't', g61+9, 1, ' ', g61+12, 1, '-', g61+15, 1, ' ', g61+18, 1, 'c', g61+21, 1, 'o', g61+24, 1, 'n', g61+27, 1, 'c', g61+30, 1, 'a', g61+33, 1, 't', g61+36, 1, 'e', g61+39, 1, 'n', g61+42, 1, 'a', g61+45, 1, 't', g61+48, 1, 'e', g61+51, 1, ' ', g61+54, 1, 'f', g61+57, 1, 'i', g61+60, 1, 'l', g61+63, 1, 'e', g61+66, 1, 's', g61+69, 1, ' ', g61+72, 1, 'a', g61+75, 1, 'n', g61+78, 1, 'd', g61+81, 1, ' ', g61+84, 1, 'p', g61+87, 1, 'r', g61+90, 1, 'i', g61+93, 1, 'n', g61+96, 1, 't', g61+99, 1, ' ', g61+102, 1, 'o', g61+105, 1, 'n', g61+108, 1, ' ', g61+111, 1, 't', g61+114, 1, 'h', g61+117, 1, 'e', g61+120, 1, ' ', g61+123, 1, 's', g61+126, 1, 't', g61+129, 1, 'a', g61+132, 1, 'n', g61+135, 1, 'd', g61+138, 1, 'a', g61+141, 1, 'r', g61+144, 1, 'd', g61+147, 1, ' ', g61+150, 1, 'o', g61+153, 1, 'u', g61+156, 1, 't', g61+159, 1, 'p', g61+162, 1, 'u', g61+165, 1, 't', g61+168, 1, `\n`, g61+171, 0
g62: dw 1, 'c', g62+3, 1, 'a', g62+6, 1, 't', g62+9, 1, ':', g62+12, 1, ' ', g62+15, 1, 't', g62+18, 1, 'a', g62+21, 1, 'k', g62+24, 1, 'e', g62+27, 1, 's', g62+30, 1, ' ', g62+33, 1, 'a', g62+36, 1, 't', g62+39, 1, ' ', g62+42, 1, 'l', g62+45, 1, 'e', g62+48, 1, 'a', g62+51, 1, 's', g62+54, 1, 't', g62+57, 1, ' ', g62+60, 1, 'o', g62+63, 1, 'n', g62+66, 1, 'e', g62+69, 1, ' ', g62+72, 1, 'a', g62+75, 1, 'r', g62+78, 1, 'g', g62+81, 1, 'u', g62+84, 1, 'm', g62+87, 1, 'e', g62+90, 1, 'n', g62+93, 1, 't', g62+96, 1, `\n`, g62+99, 0
g63: dw 0
g64: dw 1, 'c', g64+3, 1, 'a', g64+6, 1, 't', g64+9, 1, ':', g64+12, 1, ' ', g64+15, 0
g65: dw 1, ' ', g65+3, 1, ':', g65+6, 1, ' ', g65+9, 1, 'N', g65+12, 1, 'o', g65+15, 1, ' ', g65+18, 1, 's', g65+21, 1, 'u', g65+24, 1, 'c', g65+27, 1, 'h', g65+30, 1, ' ', g65+33, 1, 'f', g65+36, 1, 'i', g65+39, 1, 'l', g65+42, 1, 'e', g65+45, 1, ' ', g65+48, 1, 'o', g65+51, 1, 'r', g65+54, 1, ' ', g65+57, 1, 'd', g65+60, 1, 'i', g65+63, 1, 'r', g65+66, 1, 'e', g65+69, 1, 'c', g65+72, 1, 't', g65+75, 1, 'o', g65+78, 1, 'r', g65+81, 1, 'y', g65+84, 1, `\n`, g65+87, 0
g66: dw 0
g67: dw 1, g65, g66
g68: dw 1, 'c', g68+3, 1, 'a', g68+6, 1, 't', g68+9, 1, ':', g68+12, 1, ' ', g68+15, 0
g69: dw 1, ' ', g69+3, 1, ':', g69+6, 1, ' ', g69+9, 1, 'N', g69+12, 1, 'o', g69+15, 1, 't', g69+18, 1, ' ', g69+21, 1, 'a', g69+24, 1, ' ', g69+27, 1, 'd', g69+30, 1, 'a', g69+33, 1, 't', g69+36, 1, 'a', g69+39, 1, ' ', g69+42, 1, 'f', g69+45, 1, 'i', g69+48, 1, 'l', g69+51, 1, 'e', g69+54, 1, `\n`, g69+57, 0
g70: dw 0
g71: dw 1, g69, g70
g72: dw 0
g73: dw 1, 'c', g73+3, 1, 'a', g73+6, 1, 't', g73+9, 1, ':', g73+12, 1, ' ', g73+15, 0
g74: dw 1, ' ', g74+3, 1, ':', g74+6, 1, ' ', g74+9, 1, 'N', g74+12, 1, 'o', g74+15, 1, ' ', g74+18, 1, 's', g74+21, 1, 'u', g74+24, 1, 'c', g74+27, 1, 'h', g74+30, 1, ' ', g74+33, 1, 'f', g74+36, 1, 'i', g74+39, 1, 'l', g74+42, 1, 'e', g74+45, 1, ' ', g74+48, 1, 'o', g74+51, 1, 'r', g74+54, 1, ' ', g74+57, 1, 'd', g74+60, 1, 'i', g74+63, 1, 'r', g74+66, 1, 'e', g74+69, 1, 'c', g74+72, 1, 't', g74+75, 1, 'o', g74+78, 1, 'r', g74+81, 1, 'y', g74+84, 1, `\n`, g74+87, 0
g75: dw 0
g76: dw 1, g74, g75
g77: dw 1, 'c', g77+3, 1, 'a', g77+6, 1, 't', g77+9, 1, ':', g77+12, 1, ' ', g77+15, 0
g78: dw 1, ' ', g78+3, 1, ':', g78+6, 1, ' ', g78+9, 1, 'N', g78+12, 1, 'o', g78+15, 1, 't', g78+18, 1, ' ', g78+21, 1, 'a', g78+24, 1, ' ', g78+27, 1, 'd', g78+30, 1, 'a', g78+33, 1, 't', g78+36, 1, 'a', g78+39, 1, ' ', g78+42, 1, 'f', g78+45, 1, 'i', g78+48, 1, 'l', g78+51, 1, 'e', g78+54, 1, `\n`, g78+57, 0
g79: dw 0
g80: dw 1, g78, g79
g81: dw 1, 'c', g81+3, 1, 'p', g81+6, 0
g82: dw 1, 'c', g82+3, 1, 'p', g82+6, 1, ' ', g82+9, 1, '-', g82+12, 1, ' ', g82+15, 1, 'c', g82+18, 1, 'o', g82+21, 1, 'p', g82+24, 1, 'y', g82+27, 1, ' ', g82+30, 1, 'f', g82+33, 1, 'i', g82+36, 1, 'l', g82+39, 1, 'e', g82+42, 1, 's', g82+45, 1, ' ', g82+48, 1, 'a', g82+51, 1, 'n', g82+54, 1, 'd', g82+57, 1, ' ', g82+60, 1, 'd', g82+63, 1, 'i', g82+66, 1, 'r', g82+69, 1, 'e', g82+72, 1, 'c', g82+75, 1, 't', g82+78, 1, 'o', g82+81, 1, 'r', g82+84, 1, 'i', g82+87, 1, 'e', g82+90, 1, 's', g82+93, 1, `\n`, g82+96, 0
g83: dw 1, 'c', g83+3, 1, 'p', g83+6, 1, ':', g83+9, 1, ' ', g83+12, 1, 'm', g83+15, 1, 'i', g83+18, 1, 's', g83+21, 1, 's', g83+24, 1, 'i', g83+27, 1, 'n', g83+30, 1, 'g', g83+33, 1, ' ', g83+36, 1, 'f', g83+39, 1, 'i', g83+42, 1, 'l', g83+45, 1, 'e', g83+48, 1, ' ', g83+51, 1, 'o', g83+54, 1, 'p', g83+57, 1, 'e', g83+60, 1, 'r', g83+63, 1, 'a', g83+66, 1, 'n', g83+69, 1, 'd', g83+72, 1, `\n`, g83+75, 0
g84: dw 1, 'c', g84+3, 1, 'p', g84+6, 1, ':', g84+9, 1, ' ', g84+12, 1, 'm', g84+15, 1, 'i', g84+18, 1, 's', g84+21, 1, 's', g84+24, 1, 'i', g84+27, 1, 'n', g84+30, 1, 'g', g84+33, 1, ' ', g84+36, 1, 'd', g84+39, 1, 'e', g84+42, 1, 's', g84+45, 1, 't', g84+48, 1, 'i', g84+51, 1, 'n', g84+54, 1, 'a', g84+57, 1, 't', g84+60, 1, 'i', g84+63, 1, 'o', g84+66, 1, 'n', g84+69, 1, ' ', g84+72, 1, 'f', g84+75, 1, 'i', g84+78, 1, 'l', g84+81, 1, 'e', g84+84, 1, ' ', g84+87, 1, 'o', g84+90, 1, 'p', g84+93, 1, 'e', g84+96, 1, 'r', g84+99, 1, 'a', g84+102, 1, 'n', g84+105, 1, 'd', g84+108, 1, ' ', g84+111, 1, 'a', g84+114, 1, 'f', g84+117, 1, 't', g84+120, 1, 'e', g84+123, 1, 'r', g84+126, 1, ' ', g84+129, 1, '\'', g84+132, 0
g85: dw 1, '\'', g85+3, 1, `\n`, g85+6, 0
g86: dw 0
g87: dw 1, g85, g86
g88: dw 1, 'c', g88+3, 1, 'p', g88+6, 1, ':', g88+9, 1, ' ', g88+12, 1, 'u', g88+15, 1, 'n', g88+18, 1, 'e', g88+21, 1, 'x', g88+24, 1, 'p', g88+27, 1, 'e', g88+30, 1, 'c', g88+33, 1, 't', g88+36, 1, 'e', g88+39, 1, 'd', g88+42, 1, ' ', g88+45, 1, 'e', g88+48, 1, 'x', g88+51, 1, 't', g88+54, 1, 'r', g88+57, 1, 'a', g88+60, 1, ' ', g88+63, 1, 'o', g88+66, 1, 'p', g88+69, 1, 'e', g88+72, 1, 'r', g88+75, 1, 'a', g88+78, 1, 'n', g88+81, 1, 'd', g88+84, 1, 's', g88+87, 1, `\n`, g88+90, 0
g89: dw 0
g90: dw 1, 'c', g90+3, 1, 'p', g90+6, 1, ':', g90+9, 1, ' ', g90+12, 1, 'c', g90+15, 1, 'a', g90+18, 1, 'n', g90+21, 1, 'n', g90+24, 1, 'o', g90+27, 1, 't', g90+30, 1, ' ', g90+33, 1, 's', g90+36, 1, 't', g90+39, 1, 'a', g90+42, 1, 't', g90+45, 1, ' ', g90+48, 1, '\'', g90+51, 0
g91: dw 1, '\'', g91+3, 1, ':', g91+6, 1, ' ', g91+9, 1, 'N', g91+12, 1, 'o', g91+15, 1, ' ', g91+18, 1, 's', g91+21, 1, 'u', g91+24, 1, 'c', g91+27, 1, 'h', g91+30, 1, ' ', g91+33, 1, 'f', g91+36, 1, 'i', g91+39, 1, 'l', g91+42, 1, 'e', g91+45, 1, ' ', g91+48, 1, 'o', g91+51, 1, 'r', g91+54, 1, ' ', g91+57, 1, 'd', g91+60, 1, 'i', g91+63, 1, 'r', g91+66, 1, 'e', g91+69, 1, 'c', g91+72, 1, 't', g91+75, 1, 'o', g91+78, 1, 'r', g91+81, 1, 'y', g91+84, 1, `\n`, g91+87, 0
g92: dw 0
g93: dw 1, g91, g92
g94: dw 1, 'c', g94+3, 1, 'r', g94+6, 1, 'e', g94+9, 1, 'a', g94+12, 1, 't', g94+15, 1, 'e', g94+18, 0
g95: dw 1, 'c', g95+3, 1, 'r', g95+6, 1, 'e', g95+9, 1, 'a', g95+12, 1, 't', g95+15, 1, 'e', g95+18, 1, ' ', g95+21, 1, '\8212', g95+24, 1, ' ', g95+27, 1, 'c', g95+30, 1, 'r', g95+33, 1, 'e', g95+36, 1, 'a', g95+39, 1, 't', g95+42, 1, 'e', g95+45, 1, ' ', g95+48, 1, 'a', g95+51, 1, ' ', g95+54, 1, 'n', g95+57, 1, 'e', g95+60, 1, 'w', g95+63, 1, ' ', g95+66, 1, 'f', g95+69, 1, 'i', g95+72, 1, 'l', g95+75, 1, 'e', g95+78, 1, `\n`, g95+81, 0
g96: dw 1, 'c', g96+3, 1, 'r', g96+6, 1, 'e', g96+9, 1, 'a', g96+12, 1, 't', g96+15, 1, 'e', g96+18, 1, ':', g96+21, 1, ' ', g96+24, 1, 'm', g96+27, 1, 'i', g96+30, 1, 's', g96+33, 1, 's', g96+36, 1, 'i', g96+39, 1, 'n', g96+42, 1, 'g', g96+45, 1, ' ', g96+48, 1, 'f', g96+51, 1, 'i', g96+54, 1, 'l', g96+57, 1, 'e', g96+60, 1, ' ', g96+63, 1, 'n', g96+66, 1, 'a', g96+69, 1, 'm', g96+72, 1, 'e', g96+75, 1, `\n`, g96+78, 0
g97: dw 1, 'c', g97+3, 1, 'r', g97+6, 1, 'e', g97+9, 1, 'a', g97+12, 1, 't', g97+15, 1, 'e', g97+18, 1, ':', g97+21, 1, ' ', g97+24, 1, 'u', g97+27, 1, 'n', g97+30, 1, 'e', g97+33, 1, 'x', g97+36, 1, 'p', g97+39, 1, 'e', g97+42, 1, 'c', g97+45, 1, 't', g97+48, 1, 'e', g97+51, 1, 'd', g97+54, 1, ' ', g97+57, 1, 'e', g97+60, 1, 'x', g97+63, 1, 't', g97+66, 1, 'r', g97+69, 1, 'a', g97+72, 1, ' ', g97+75, 1, 'o', g97+78, 1, 'p', g97+81, 1, 'e', g97+84, 1, 'r', g97+87, 1, 'a', g97+90, 1, 'n', g97+93, 1, 'd', g97+96, 1, 's', g97+99, 1, `\n`, g97+102, 0
g98: dw 1, '(', g98+3, 1, 't', g98+6, 1, 'o', g98+9, 1, ' ', g98+12, 1, 'f', g98+15, 1, 'i', g98+18, 1, 'n', g98+21, 1, 'i', g98+24, 1, 's', g98+27, 1, 'h', g98+30, 1, ' ', g98+33, 1, 't', g98+36, 1, 'y', g98+39, 1, 'p', g98+42, 1, 'e', g98+45, 1, ' ', g98+48, 1, '^', g98+51, 1, 'D', g98+54, 1, ' ', g98+57, 1, 'o', g98+60, 1, 'n', g98+63, 1, ' ', g98+66, 1, 'a', g98+69, 1, ' ', g98+72, 1, 'n', g98+75, 1, 'e', g98+78, 1, 'w', g98+81, 1, ' ', g98+84, 1, 'l', g98+87, 1, 'i', g98+90, 1, 'n', g98+93, 1, 'e', g98+96, 1, ')', g98+99, 1, `\n`, g98+102, 0
g99: dw 0
g100: dw 0
g101: dw 0
g102: dw 1
g103: dw 0
g104: dw 0
g105: dw 0
g106: dw 1, `\n`, g106+3, 0
g107: dw 0
g108: dw 0
g109: dw 1, 'f', g109+3, 1, 'i', g109+6, 1, 'l', g109+9, 1, 'e', g109+12, 0
g110: dw 1, 'f', g110+3, 1, 'i', g110+6, 1, 'l', g110+9, 1, 'e', g110+12, 1, ' ', g110+15, 1, '\8212', g110+18, 1, ' ', g110+21, 1, 'd', g110+24, 1, 'e', g110+27, 1, 't', g110+30, 1, 'e', g110+33, 1, 'r', g110+36, 1, 'm', g110+39, 1, 'i', g110+42, 1, 'n', g110+45, 1, 'e', g110+48, 1, ' ', g110+51, 1, 'f', g110+54, 1, 'i', g110+57, 1, 'l', g110+60, 1, 'e', g110+63, 1, ' ', g110+66, 1, 't', g110+69, 1, 'y', g110+72, 1, 'p', g110+75, 1, 'e', g110+78, 1, `\n`, g110+81, 0
g111: dw 1, 'f', g111+3, 1, 'i', g111+6, 1, 'l', g111+9, 1, 'e', g111+12, 1, ':', g111+15, 1, ' ', g111+18, 1, 't', g111+21, 1, 'a', g111+24, 1, 'k', g111+27, 1, 'e', g111+30, 1, 's', g111+33, 1, ' ', g111+36, 1, 'a', g111+39, 1, 't', g111+42, 1, ' ', g111+45, 1, 'l', g111+48, 1, 'e', g111+51, 1, 'a', g111+54, 1, 's', g111+57, 1, 't', g111+60, 1, ' ', g111+63, 1, 'o', g111+66, 1, 'n', g111+69, 1, 'e', g111+72, 1, ' ', g111+75, 1, 'a', g111+78, 1, 'r', g111+81, 1, 'g', g111+84, 1, 'u', g111+87, 1, 'm', g111+90, 1, 'e', g111+93, 1, 'n', g111+96, 1, 't', g111+99, 1, `\n`, g111+102, 0
g112: dw 0
g113: dw 1, ' ', g113+3, 1, ':', g113+6, 1, ' ', g113+9, 1, 'N', g113+12, 1, 'o', g113+15, 1, ' ', g113+18, 1, 's', g113+21, 1, 'u', g113+24, 1, 'c', g113+27, 1, 'h', g113+30, 1, ' ', g113+33, 1, 'f', g113+36, 1, 'i', g113+39, 1, 'l', g113+42, 1, 'e', g113+45, 1, ' ', g113+48, 1, 'o', g113+51, 1, 'r', g113+54, 1, ' ', g113+57, 1, 'd', g113+60, 1, 'i', g113+63, 1, 'r', g113+66, 1, 'e', g113+69, 1, 'c', g113+72, 1, 't', g113+75, 1, 'o', g113+78, 1, 'r', g113+81, 1, 'y', g113+84, 1, `\n`, g113+87, 0
g114: dw 0
g115: dw 1, g113, g114
g116: dw 1, ':', g116+3, 1, ' ', g116+6, 1, 'A', g116+9, 1, 'S', g116+12, 1, 'C', g116+15, 1, 'I', g116+18, 1, 'I', g116+21, 1, ' ', g116+24, 1, 't', g116+27, 1, 'e', g116+30, 1, 'x', g116+33, 1, 't', g116+36, 1, `\n`, g116+39, 0
g117: dw 0
g118: dw 1, g116, g117
g119: dw 1, ':', g119+3, 1, ' ', g119+6, 1, 'e', g119+9, 1, 'x', g119+12, 1, 'e', g119+15, 1, 'c', g119+18, 1, 'u', g119+21, 1, 't', g119+24, 1, 'a', g119+27, 1, 'b', g119+30, 1, 'l', g119+33, 1, 'e', g119+36, 1, `\n`, g119+39, 0
g120: dw 0
g121: dw 1, g119, g120
g122: dw 1, 'l', g122+3, 1, 's', g122+6, 0
g123: dw 1, 'l', g123+3, 1, 's', g123+6, 1, ' ', g123+9, 1, '-', g123+12, 1, ' ', g123+15, 1, 'l', g123+18, 1, 'i', g123+21, 1, 's', g123+24, 1, 't', g123+27, 1, ' ', g123+30, 1, 'd', g123+33, 1, 'i', g123+36, 1, 'r', g123+39, 1, 'e', g123+42, 1, 'c', g123+45, 1, 't', g123+48, 1, 'o', g123+51, 1, 'r', g123+54, 1, 'y', g123+57, 1, ' ', g123+60, 1, 'c', g123+63, 1, 'o', g123+66, 1, 'n', g123+69, 1, 't', g123+72, 1, 'e', g123+75, 1, 'n', g123+78, 1, 't', g123+81, 1, 's', g123+84, 1, `\n`, g123+87, 0
g124: dw 1, 'l', g124+3, 1, 's', g124+6, 1, ':', g124+9, 1, ' ', g124+12, 1, 't', g124+15, 1, 'a', g124+18, 1, 'k', g124+21, 1, 'e', g124+24, 1, 's', g124+27, 1, ' ', g124+30, 1, 'n', g124+33, 1, 'o', g124+36, 1, ' ', g124+39, 1, 'a', g124+42, 1, 'r', g124+45, 1, 'g', g124+48, 1, 'u', g124+51, 1, 'm', g124+54, 1, 'e', g124+57, 1, 'n', g124+60, 1, 't', g124+63, 1, 's', g124+66, 1, `\n`, g124+69, 0
g125: dw L67
g126: dw 0
g127: dw 0
g128: dw 1, 'm', g128+3, 1, 'a', g128+6, 1, 'n', g128+9, 0
g129: dw 1, 'm', g129+3, 1, 'a', g129+6, 1, 'n', g129+9, 1, ' ', g129+12, 1, '-', g129+15, 1, ' ', g129+18, 1, 'a', g129+21, 1, 'n', g129+24, 1, ' ', g129+27, 1, 'i', g129+30, 1, 'n', g129+33, 1, 't', g129+36, 1, 'e', g129+39, 1, 'r', g129+42, 1, 'f', g129+45, 1, 'a', g129+48, 1, 'c', g129+51, 1, 'e', g129+54, 1, ' ', g129+57, 1, 't', g129+60, 1, 'o', g129+63, 1, ' ', g129+66, 1, 't', g129+69, 1, 'h', g129+72, 1, 'e', g129+75, 1, ' ', g129+78, 1, 's', g129+81, 1, 'y', g129+84, 1, 's', g129+87, 1, 't', g129+90, 1, 'e', g129+93, 1, 'm', g129+96, 1, ' ', g129+99, 1, 'r', g129+102, 1, 'e', g129+105, 1, 'f', g129+108, 1, 'e', g129+111, 1, 'r', g129+114, 1, 'e', g129+117, 1, 'n', g129+120, 1, 'c', g129+123, 1, 'e', g129+126, 1, ' ', g129+129, 1, 'm', g129+132, 1, 'a', g129+135, 1, 'n', g129+138, 1, 'u', g129+141, 1, 'a', g129+144, 1, 'l', g129+147, 1, 's', g129+150, 1, `\n`, g129+153, 0
g130: dw 1, 'W', g130+3, 1, 'h', g130+6, 1, 'a', g130+9, 1, 't', g130+12, 1, ' ', g130+15, 1, 'm', g130+18, 1, 'a', g130+21, 1, 'n', g130+24, 1, 'u', g130+27, 1, 'a', g130+30, 1, 'l', g130+33, 1, ' ', g130+36, 1, 'p', g130+39, 1, 'a', g130+42, 1, 'g', g130+45, 1, 'e', g130+48, 1, ' ', g130+51, 1, 'd', g130+54, 1, 'o', g130+57, 1, ' ', g130+60, 1, 'y', g130+63, 1, 'o', g130+66, 1, 'u', g130+69, 1, ' ', g130+72, 1, 'w', g130+75, 1, 'a', g130+78, 1, 'n', g130+81, 1, 't', g130+84, 1, '?', g130+87, 1, `\n`, g130+90, 0
g131: dw 0
g132: dw 1, 'N', g132+3, 1, 'o', g132+6, 1, ' ', g132+9, 1, 'm', g132+12, 1, 'a', g132+15, 1, 'n', g132+18, 1, 'u', g132+21, 1, 'a', g132+24, 1, 'l', g132+27, 1, ' ', g132+30, 1, 'e', g132+33, 1, 'n', g132+36, 1, 't', g132+39, 1, 'r', g132+42, 1, 'y', g132+45, 1, ' ', g132+48, 1, 'f', g132+51, 1, 'o', g132+54, 1, 'r', g132+57, 1, ' ', g132+60, 0
g133: dw 1, `\n`, g133+3, 0
g134: dw 0
g135: dw 1, g133, g134
g136: dw 1, 'N', g136+3, 1, 'o', g136+6, 1, ' ', g136+9, 1, 'm', g136+12, 1, 'a', g136+15, 1, 'n', g136+18, 1, 'u', g136+21, 1, 'a', g136+24, 1, 'l', g136+27, 1, ' ', g136+30, 1, 'e', g136+33, 1, 'n', g136+36, 1, 't', g136+39, 1, 'r', g136+42, 1, 'y', g136+45, 1, ' ', g136+48, 1, 'f', g136+51, 1, 'o', g136+54, 1, 'r', g136+57, 1, ' ', g136+60, 0
g137: dw 1, `\n`, g137+3, 0
g138: dw 0
g139: dw 1, g137, g138
g140: dw 0
g141: dw 1, 'N', g141+3, 1, 'o', g141+6, 1, ' ', g141+9, 1, 'm', g141+12, 1, 'a', g141+15, 1, 'n', g141+18, 1, 'u', g141+21, 1, 'a', g141+24, 1, 'l', g141+27, 1, ' ', g141+30, 1, 'e', g141+33, 1, 'n', g141+36, 1, 't', g141+39, 1, 'r', g141+42, 1, 'y', g141+45, 1, ' ', g141+48, 1, 'f', g141+51, 1, 'o', g141+54, 1, 'r', g141+57, 1, ' ', g141+60, 0
g142: dw 1, `\n`, g142+3, 0
g143: dw 0
g144: dw 1, g142, g143
g145: dw 1, 'N', g145+3, 1, 'o', g145+6, 1, ' ', g145+9, 1, 'm', g145+12, 1, 'a', g145+15, 1, 'n', g145+18, 1, 'u', g145+21, 1, 'a', g145+24, 1, 'l', g145+27, 1, ' ', g145+30, 1, 'e', g145+33, 1, 'n', g145+36, 1, 't', g145+39, 1, 'r', g145+42, 1, 'y', g145+45, 1, ' ', g145+48, 1, 'f', g145+51, 1, 'o', g145+54, 1, 'r', g145+57, 1, ' ', g145+60, 0
g146: dw 1, `\n`, g146+3, 0
g147: dw 0
g148: dw 1, g146, g147
g149: dw 1, 'm', g149+3, 1, 'v', g149+6, 0
g150: dw 1, 'm', g150+3, 1, 'v', g150+6, 1, ' ', g150+9, 1, '-', g150+12, 1, ' ', g150+15, 1, 'm', g150+18, 1, 'o', g150+21, 1, 'v', g150+24, 1, 'e', g150+27, 1, ' ', g150+30, 1, '(', g150+33, 1, 'r', g150+36, 1, 'e', g150+39, 1, 'n', g150+42, 1, 'a', g150+45, 1, 'm', g150+48, 1, 'e', g150+51, 1, ')', g150+54, 1, ' ', g150+57, 1, 'f', g150+60, 1, 'i', g150+63, 1, 'l', g150+66, 1, 'e', g150+69, 1, 's', g150+72, 1, `\n`, g150+75, 0
g151: dw 1, 'm', g151+3, 1, 'v', g151+6, 1, ':', g151+9, 1, ' ', g151+12, 1, 'm', g151+15, 1, 'i', g151+18, 1, 's', g151+21, 1, 's', g151+24, 1, 'i', g151+27, 1, 'n', g151+30, 1, 'g', g151+33, 1, ' ', g151+36, 1, 'f', g151+39, 1, 'i', g151+42, 1, 'l', g151+45, 1, 'e', g151+48, 1, ' ', g151+51, 1, 'o', g151+54, 1, 'p', g151+57, 1, 'e', g151+60, 1, 'r', g151+63, 1, 'a', g151+66, 1, 'n', g151+69, 1, 'd', g151+72, 1, `\n`, g151+75, 0
g152: dw 1, 'm', g152+3, 1, 'v', g152+6, 1, ':', g152+9, 1, ' ', g152+12, 1, 'm', g152+15, 1, 'i', g152+18, 1, 's', g152+21, 1, 's', g152+24, 1, 'i', g152+27, 1, 'n', g152+30, 1, 'g', g152+33, 1, ' ', g152+36, 1, 'd', g152+39, 1, 'e', g152+42, 1, 's', g152+45, 1, 't', g152+48, 1, 'i', g152+51, 1, 'n', g152+54, 1, 'a', g152+57, 1, 't', g152+60, 1, 'i', g152+63, 1, 'o', g152+66, 1, 'n', g152+69, 1, ' ', g152+72, 1, 'f', g152+75, 1, 'i', g152+78, 1, 'l', g152+81, 1, 'e', g152+84, 1, ' ', g152+87, 1, 'o', g152+90, 1, 'p', g152+93, 1, 'e', g152+96, 1, 'r', g152+99, 1, 'a', g152+102, 1, 'n', g152+105, 1, 'd', g152+108, 1, ' ', g152+111, 1, 'a', g152+114, 1, 'f', g152+117, 1, 't', g152+120, 1, 'e', g152+123, 1, 'r', g152+126, 1, ' ', g152+129, 1, '\'', g152+132, 0
g153: dw 1, '\'', g153+3, 1, `\n`, g153+6, 0
g154: dw 0
g155: dw 1, g153, g154
g156: dw 1, 'm', g156+3, 1, 'v', g156+6, 1, ':', g156+9, 1, ' ', g156+12, 1, 'u', g156+15, 1, 'n', g156+18, 1, 'e', g156+21, 1, 'x', g156+24, 1, 'p', g156+27, 1, 'e', g156+30, 1, 'c', g156+33, 1, 't', g156+36, 1, 'e', g156+39, 1, 'd', g156+42, 1, ' ', g156+45, 1, 'e', g156+48, 1, 'x', g156+51, 1, 't', g156+54, 1, 'r', g156+57, 1, 'a', g156+60, 1, ' ', g156+63, 1, 'o', g156+66, 1, 'p', g156+69, 1, 'e', g156+72, 1, 'r', g156+75, 1, 'a', g156+78, 1, 'n', g156+81, 1, 'd', g156+84, 1, 's', g156+87, 1, `\n`, g156+90, 0
g157: dw 0
g158: dw 1, 'm', g158+3, 1, 'v', g158+6, 1, ':', g158+9, 1, ' ', g158+12, 1, 'c', g158+15, 1, 'a', g158+18, 1, 'n', g158+21, 1, 'n', g158+24, 1, 'o', g158+27, 1, 't', g158+30, 1, ' ', g158+33, 1, 's', g158+36, 1, 't', g158+39, 1, 'a', g158+42, 1, 't', g158+45, 1, ' ', g158+48, 1, '\'', g158+51, 0
g159: dw 1, '\'', g159+3, 1, ':', g159+6, 1, ' ', g159+9, 1, 'N', g159+12, 1, 'o', g159+15, 1, ' ', g159+18, 1, 's', g159+21, 1, 'u', g159+24, 1, 'c', g159+27, 1, 'h', g159+30, 1, ' ', g159+33, 1, 'f', g159+36, 1, 'i', g159+39, 1, 'l', g159+42, 1, 'e', g159+45, 1, ' ', g159+48, 1, 'o', g159+51, 1, 'r', g159+54, 1, ' ', g159+57, 1, 'd', g159+60, 1, 'i', g159+63, 1, 'r', g159+66, 1, 'e', g159+69, 1, 'c', g159+72, 1, 't', g159+75, 1, 'o', g159+78, 1, 'r', g159+81, 1, 'y', g159+84, 1, `\n`, g159+87, 0
g160: dw 0
g161: dw 1, g159, g160
g162: dw 1, 'r', g162+3, 1, 'm', g162+6, 1, ':', g162+9, 1, ' ', g162+12, 1, 'c', g162+15, 1, 'a', g162+18, 1, 'n', g162+21, 1, 'n', g162+24, 1, 'o', g162+27, 1, 't', g162+30, 1, ' ', g162+33, 1, 'r', g162+36, 1, 'e', g162+39, 1, 'm', g162+42, 1, 'o', g162+45, 1, 'v', g162+48, 1, 'e', g162+51, 1, ' ', g162+54, 1, '\'', g162+57, 0
g163: dw 1, '\'', g163+3, 1, ':', g163+6, 1, ' ', g163+9, 1, 'N', g163+12, 1, 'o', g163+15, 1, ' ', g163+18, 1, 's', g163+21, 1, 'u', g163+24, 1, 'c', g163+27, 1, 'h', g163+30, 1, ' ', g163+33, 1, 'f', g163+36, 1, 'i', g163+39, 1, 'l', g163+42, 1, 'e', g163+45, 1, ' ', g163+48, 1, 'o', g163+51, 1, 'r', g163+54, 1, ' ', g163+57, 1, 'd', g163+60, 1, 'i', g163+63, 1, 'r', g163+66, 1, 'e', g163+69, 1, 'c', g163+72, 1, 't', g163+75, 1, 'o', g163+78, 1, 'r', g163+81, 1, 'y', g163+84, 1, `\n`, g163+87, 0
g164: dw 0
g165: dw 1, g163, g164
g166: dw 0
g167: dw 1, 'r', g167+3, 1, 'm', g167+6, 0
g168: dw 1, 'r', g168+3, 1, 'm', g168+6, 1, ' ', g168+9, 1, '-', g168+12, 1, ' ', g168+15, 1, 'r', g168+18, 1, 'e', g168+21, 1, 'm', g168+24, 1, 'o', g168+27, 1, 'v', g168+30, 1, 'e', g168+33, 1, ' ', g168+36, 1, 'f', g168+39, 1, 'i', g168+42, 1, 'l', g168+45, 1, 'e', g168+48, 1, 's', g168+51, 1, ' ', g168+54, 1, 'o', g168+57, 1, 'r', g168+60, 1, ' ', g168+63, 1, 'd', g168+66, 1, 'i', g168+69, 1, 'r', g168+72, 1, 'e', g168+75, 1, 'c', g168+78, 1, 't', g168+81, 1, 'o', g168+84, 1, 'r', g168+87, 1, 'i', g168+90, 1, 'e', g168+93, 1, 's', g168+96, 1, ' ', g168+99, 1, '(', g168+102, 1, 'd', g168+105, 1, 'i', g168+108, 1, 'r', g168+111, 1, 'e', g168+114, 1, 'c', g168+117, 1, 't', g168+120, 1, 'o', g168+123, 1, 'r', g168+126, 1, 'i', g168+129, 1, 'e', g168+132, 1, 's', g168+135, 1, ' ', g168+138, 1, 'n', g168+141, 1, 'o', g168+144, 1, 't', g168+147, 1, ' ', g168+150, 1, 's', g168+153, 1, 'u', g168+156, 1, 'p', g168+159, 1, 'p', g168+162, 1, 'o', g168+165, 1, 'r', g168+168, 1, 't', g168+171, 1, 'e', g168+174, 1, 'd', g168+177, 1, ' ', g168+180, 1, 'y', g168+183, 1, 'e', g168+186, 1, 't', g168+189, 1, '!', g168+192, 1, ')', g168+195, 1, `\n`, g168+198, 0
g169: dw 1, 'r', g169+3, 1, 'm', g169+6, 1, ':', g169+9, 1, ' ', g169+12, 1, 'm', g169+15, 1, 'i', g169+18, 1, 's', g169+21, 1, 's', g169+24, 1, 'i', g169+27, 1, 'n', g169+30, 1, 'g', g169+33, 1, ' ', g169+36, 1, 'o', g169+39, 1, 'p', g169+42, 1, 'e', g169+45, 1, 'r', g169+48, 1, 'a', g169+51, 1, 'n', g169+54, 1, 'd', g169+57, 1, `\n`, g169+60, 0
g170: dw 1, 'r', g170+3, 1, 'm', g170+6, 1, ':', g170+9, 1, ' ', g170+12, 1, 'c', g170+15, 1, 'a', g170+18, 1, 'n', g170+21, 1, 'n', g170+24, 1, 'o', g170+27, 1, 't', g170+30, 1, ' ', g170+33, 1, 'r', g170+36, 1, 'e', g170+39, 1, 'm', g170+42, 1, 'o', g170+45, 1, 'v', g170+48, 1, 'e', g170+51, 1, ' ', g170+54, 1, '\'', g170+57, 0
g171: dw 1, '\'', g171+3, 1, ':', g171+6, 1, ' ', g171+9, 1, 'N', g171+12, 1, 'o', g171+15, 1, ' ', g171+18, 1, 's', g171+21, 1, 'u', g171+24, 1, 'c', g171+27, 1, 'h', g171+30, 1, ' ', g171+33, 1, 'f', g171+36, 1, 'i', g171+39, 1, 'l', g171+42, 1, 'e', g171+45, 1, ' ', g171+48, 1, 'o', g171+51, 1, 'r', g171+54, 1, ' ', g171+57, 1, 'd', g171+60, 1, 'i', g171+63, 1, 'r', g171+66, 1, 'e', g171+69, 1, 'c', g171+72, 1, 't', g171+75, 1, 'o', g171+78, 1, 'r', g171+81, 1, 'y', g171+84, 1, `\n`, g171+87, 0
g172: dw 0
g173: dw 1, g171, g172
g174: dw 0
g175: dw 1, 'c', g175+3, 1, 'a', g175+6, 1, 't', g175+9, 0
g176: dw 1, 'I', g176+3, 1, ' ', g176+6, 1, 'h', g176+9, 1, 'a', g176+12, 1, 'v', g176+15, 1, 'e', g176+18, 1, ' ', g176+21, 1, 'a', g176+24, 1, ' ', g176+27, 1, 'l', g176+30, 1, 'i', g176+33, 1, 't', g176+36, 1, 't', g176+39, 1, 'l', g176+42, 1, 'e', g176+45, 1, ' ', g176+48, 1, 's', g176+51, 1, 'h', g176+54, 1, 'a', g176+57, 1, 'd', g176+60, 1, 'o', g176+63, 1, 'w', g176+66, 1, ' ', g176+69, 1, 't', g176+72, 1, 'h', g176+75, 1, 'a', g176+78, 1, 't', g176+81, 1, ' ', g176+84, 1, 'g', g176+87, 1, 'o', g176+90, 1, 'e', g176+93, 1, 's', g176+96, 1, ' ', g176+99, 1, 'i', g176+102, 1, 'n', g176+105, 1, ' ', g176+108, 1, 'a', g176+111, 1, 'n', g176+114, 1, 'd', g176+117, 1, ' ', g176+120, 1, 'o', g176+123, 1, 'u', g176+126, 1, 't', g176+129, 1, ' ', g176+132, 1, 'w', g176+135, 1, 'i', g176+138, 1, 't', g176+141, 1, 'h', g176+144, 1, ' ', g176+147, 1, 'm', g176+150, 1, 'e', g176+153, 1, ',', g176+156, 1, `\n`, g176+159, 1, 'A', g176+162, 1, 'n', g176+165, 1, 'd', g176+168, 1, ' ', g176+171, 1, 'w', g176+174, 1, 'h', g176+177, 1, 'a', g176+180, 1, 't', g176+183, 1, ' ', g176+186, 1, 'c', g176+189, 1, 'a', g176+192, 1, 'n', g176+195, 1, ' ', g176+198, 1, 'b', g176+201, 1, 'e', g176+204, 1, ' ', g176+207, 1, 't', g176+210, 1, 'h', g176+213, 1, 'e', g176+216, 1, ' ', g176+219, 1, 'u', g176+222, 1, 's', g176+225, 1, 'e', g176+228, 1, ' ', g176+231, 1, 'o', g176+234, 1, 'f', g176+237, 1, ' ', g176+240, 1, 'h', g176+243, 1, 'i', g176+246, 1, 'm', g176+249, 1, ' ', g176+252, 1, 'i', g176+255, 1, 's', g176+258, 1, ' ', g176+261, 1, 'm', g176+264, 1, 'o', g176+267, 1, 'r', g176+270, 1, 'e', g176+273, 1, ' ', g176+276, 1, 't', g176+279, 1, 'h', g176+282, 1, 'a', g176+285, 1, 'n', g176+288, 1, ' ', g176+291, 1, 'I', g176+294, 1, ' ', g176+297, 1, 'c', g176+300, 1, 'a', g176+303, 1, 'n', g176+306, 1, ' ', g176+309, 1, 's', g176+312, 1, 'e', g176+315, 1, 'e', g176+318, 1, '.', g176+321, 1, `\n`, g176+324, 1, 'H', g176+327, 1, 'e', g176+330, 1, ' ', g176+333, 1, 'i', g176+336, 1, 's', g176+339, 1, ' ', g176+342, 1, 'v', g176+345, 1, 'e', g176+348, 1, 'r', g176+351, 1, 'y', g176+354, 1, ',', g176+357, 1, ' ', g176+360, 1, 'v', g176+363, 1, 'e', g176+366, 1, 'r', g176+369, 1, 'y', g176+372, 1, ' ', g176+375, 1, 'l', g176+378, 1, 'i', g176+381, 1, 'k', g176+384, 1, 'e', g176+387, 1, ' ', g176+390, 1, 'm', g176+393, 1, 'e', g176+396, 1, ' ', g176+399, 1, 'f', g176+402, 1, 'r', g176+405, 1, 'o', g176+408, 1, 'm', g176+411, 1, ' ', g176+414, 1, 't', g176+417, 1, 'h', g176+420, 1, 'e', g176+423, 1, ' ', g176+426, 1, 'h', g176+429, 1, 'e', g176+432, 1, 'e', g176+435, 1, 'l', g176+438, 1, 's', g176+441, 1, ' ', g176+444, 1, 'u', g176+447, 1, 'p', g176+450, 1, ' ', g176+453, 1, 't', g176+456, 1, 'o', g176+459, 1, ' ', g176+462, 1, 't', g176+465, 1, 'h', g176+468, 1, 'e', g176+471, 1, ' ', g176+474, 1, 'h', g176+477, 1, 'e', g176+480, 1, 'a', g176+483, 1, 'd', g176+486, 1, ';', g176+489, 1, `\n`, g176+492, 1, 'A', g176+495, 1, 'n', g176+498, 1, 'd', g176+501, 1, ' ', g176+504, 1, 'I', g176+507, 1, ' ', g176+510, 1, 's', g176+513, 1, 'e', g176+516, 1, 'e', g176+519, 1, ' ', g176+522, 1, 'h', g176+525, 1, 'i', g176+528, 1, 'm', g176+531, 1, ' ', g176+534, 1, 'j', g176+537, 1, 'u', g176+540, 1, 'm', g176+543, 1, 'p', g176+546, 1, ' ', g176+549, 1, 'b', g176+552, 1, 'e', g176+555, 1, 'f', g176+558, 1, 'o', g176+561, 1, 'r', g176+564, 1, 'e', g176+567, 1, ' ', g176+570, 1, 'm', g176+573, 1, 'e', g176+576, 1, ',', g176+579, 1, ' ', g176+582, 1, 'w', g176+585, 1, 'h', g176+588, 1, 'e', g176+591, 1, 'n', g176+594, 1, ' ', g176+597, 1, 'I', g176+600, 1, ' ', g176+603, 1, 'j', g176+606, 1, 'u', g176+609, 1, 'm', g176+612, 1, 'p', g176+615, 1, ' ', g176+618, 1, 'i', g176+621, 1, 'n', g176+624, 1, 't', g176+627, 1, 'o', g176+630, 1, ' ', g176+633, 1, 'm', g176+636, 1, 'y', g176+639, 1, ' ', g176+642, 1, 'b', g176+645, 1, 'e', g176+648, 1, 'd', g176+651, 1, '.', g176+654, 1, `\n`, g176+657, 0
g177: dw 0, g176
g178: dw 0, g175, g177
g179: dw 0
g180: dw 1, g178, g179

bare_start: jmp L431
