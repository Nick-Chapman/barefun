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
  ;; (34'17) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L18: ; Continuation
  ;; (37'33) Tail: app_37'22 (arg) @ xs (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L19: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L17
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
  push word L18
  mov cx, sp
  ;; (37'22) Tail: rev_onto (g7) @ con_0'0 (t3)
  mov bp, g7
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L20: ; Function: g7
  push word dx
  push word L19
  mov [2], sp
  ;; (0'0) Return: lam_34'21 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L21: ; Arm: 49'9
  ;; (0'0) Return: con_49'12 (g8)
  mov dx, g8
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L22: ; Continuation
  ;; (50'43) Tail: app_50'37 (arg) @ xs (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L23: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L21
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
  push word L22
  mov cx, sp
  ;; (50'37) Tail: loop (f3) @ prim_0'0 (t4)
  mov bp, [bp+6]
  mov dx, [8]
  mov ax, [bp]
  jmp ax

L24: ; Function: t2
  push word bp
  push word dx
  push word [bp+2]
  push word L23
  mov [2], sp
  ;; (0'0) Return: lam_47'17 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L25: ; Continuation
  mov ax, [bp+4]
  mov [2], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L26: ; Continuation
  push word [bp+6]
  push word cx
  push word L25
  mov cx, sp
  ;; (52'9) Tail: app_52'7 (arg) @ xs (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L27: ; Continuation
  mov ax, dx
  call Bare_make_bytes
  mov [2], ax
  push word [2]
  push word L24
  mov [4], sp
  push word [2]
  push word [bp+4]
  push word cx
  push word L26
  mov cx, sp
  ;; (52'7) Tail: loop (t2) @ 0
  mov bp, [4]
  mov dx, 0
  mov ax, [bp]
  jmp ax

L28: ; Function: g9
  push word dx
  push word cx
  push word L27
  mov cx, sp
  ;; (46'29) Tail: length (g2) @ xs (arg)
  mov bp, g2
  mov dx, dx
  mov ax, [bp]
  jmp ax

L29: ; Arm: 60'9
  ;; (0'0) Return: con_60'12 (g10)
  mov dx, g10
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L30: ; Continuation
  ;; (61'43) Tail: app_61'37 (arg) @ xs (f2)
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
  sub ax, 1
  mov [8], ax
  push word [4]
  push word cx
  push word L30
  mov cx, sp
  ;; (61'37) Tail: loop (f3) @ prim_0'0 (t4)
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
  ;; (0'0) Return: lam_58'17 (t1)
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
  ;; (63'13) Tail: app_63'7 (arg) @ xs (f2)
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
  mov ax, dx
  sub ax, 1
  mov [6], ax
  push word [2]
  push word [bp+4]
  push word cx
  push word L34
  mov cx, sp
  ;; (63'7) Tail: loop (t2) @ prim_0'0 (t3)
  mov bp, [4]
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L36: ; Function: g11
  push word dx
  push word cx
  push word L35
  mov cx, sp
  ;; (56'17) Tail: length (g2) @ xs (arg)
  mov bp, g2
  mov dx, dx
  mov ax, [bp]
  jmp ax

L37: ; Arm: 68'13
  ;; (67'23) Return: acc (f2)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L38: ; Continuation
  mov ax, [bp+4]
  sub ax, 1
  mov [2], ax
  ;; (69'45) Tail: app_69'19 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L39: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L37
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
  push word L38
  mov cx, sp
  ;; (69'19) Tail: explode_loop (f3) @ con_0'0 (t3)
  mov bp, [bp+6]
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L40: ; Function: t1
  push word bp
  push word dx
  push word [bp+2]
  push word L39
  mov [2], sp
  ;; (0'0) Return: lam_67'27 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L41: ; Continuation
  mov ax, [bp+4]
  sub ax, 1
  mov [2], ax
  ;; (71'18) Tail: app_71'15 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L42: ; Function: g13
  push word dx
  push word L40
  mov [2], sp
  mov ax, dx
  call Bare_string_length
  mov [4], ax
  push word [4]
  push word cx
  push word L41
  mov cx, sp
  ;; (71'15) Tail: explode_loop (t1) @ con_71'15 (g12)
  mov bp, [2]
  mov dx, g12
  mov ax, [bp]
  jmp ax

L43: ; Arm: 76'19
  ;; (0'0) Return: con_76'24 (g16)
  mov dx, g16
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L44: ; Arm: 78'15
  ;; (0'0) Return: con_78'20 (g17)
  mov dx, g17
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L45: ; Arm: 81'31
  ;; (0'0) Return: con_81'36 (g20)
  mov dx, g20
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L46: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L45
  mov ax, [bp+4]
  sub ax, 1
  mov [2], ax
  ;; (81'52) Tail: loop (f3) @ prim_0'0 (t1)
  mov bp, [bp+6]
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L47: ; Arm: 8'9
  ;; (0'0) Return: con_8'12 (g18)
  mov dx, g18
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L48: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L44
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
  push word L46
  mov cx, sp
  mov bx, [8]
  cmp word [bx], 1
  jz L47
  ;; (0'0) Return: con_9'13 (g19)
  mov dx, g19
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L49: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L43
  push word [bp+6]
  push word [bp+4]
  push word L48
  mov [2], sp
  mov ax, [bp+8]
  sub ax, 1
  mov [4], ax
  ;; (83'9) Tail: loop (t1) @ prim_0'0 (t2)
  mov bp, [2]
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L50: ; Arm: 8'9
  ;; (0'0) Return: con_8'12 (g14)
  mov dx, g14
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L51: ; Function: t1
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
  push word L49
  mov cx, sp
  mov bx, [6]
  cmp word [bx], 1
  jz L50
  ;; (0'0) Return: con_9'13 (g15)
  mov dx, g15
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L52: ; Function: g21
  push word dx
  push word L51
  mov [2], sp
  ;; (0'0) Return: lam_73'33 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L53: ; Arm: 106'7
  ;; (0'0) Return: con_106'10 (g25)
  mov dx, g25
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L54: ; Continuation
  ;; (107'35) Tail: put_chars (g24) @ xs (f2)
  mov dx, [bp+4]
  mov bp, g24
  mov ax, [bp]
  jmp ax

L55: ; Arm: 99'19
  mov ax, [2]
  call Bare_put_char
  mov [10], ax
  ;; (0'0) Return: prim_0'0 (t5)
  mov dx, [10]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L56: ; Arm: 100'22
  mov ax, [2]
  call Bare_put_char
  mov [12], ax
  ;; (0'0) Return: prim_0'0 (t6)
  mov dx, [12]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L57: ; Arm: 101'16
  mov ax, [2]
  call Bare_put_char
  mov [14], ax
  ;; (0'0) Return: prim_0'0 (t7)
  mov dx, [14]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L58: ; Function: g24
  mov bx, dx
  cmp word [bx], 0
  jz L53
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
  push word L54
  mov cx, sp
  mov bx, [8]
  cmp word [bx], 1
  jz L55
  mov ax, [2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [10], ax
  mov bx, [10]
  cmp word [bx], 1
  jz L56
  mov ax, 26
  cmp word ax, [6]
  call Bare_make_bool_from_n
  mov [12], ax
  mov bx, [12]
  cmp word [bx], 1
  jz L57
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

L59: ; Arm: 244'11
  ;; (243'12) Return: n (arg)
  mov dx, dx
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L60: ; Continuation
  mov ax, [bp+4]
  add ax, dx
  mov [2], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L61: ; Continuation
  mov ax, [bp+4]
  sub ax, 2
  mov [2], ax
  push word dx
  push word cx
  push word L60
  mov cx, sp
  ;; (244'39) Tail: fib (g54) @ prim_0'0 (t1)
  mov bp, g54
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L62: ; Function: g54
  mov ax, dx
  cmp word ax, 2
  call Bare_make_bool_from_n
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L59
  mov ax, dx
  sub ax, 1
  mov [4], ax
  push word dx
  push word cx
  push word L61
  mov cx, sp
  ;; (244'27) Tail: fib (g54) @ prim_0'0 (t2)
  mov bp, g54
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L63: ; Function: g82
  mov bx, dx
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  ;; (227'44) Return: name (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L64: ; Arm: 266'9
  push word [bp+2]
  push word 1
  mov [2], sp
  ;; (0'0) Return: con_266'12 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L65: ; Arm: 269'15
  ;; (0'0) Return: con_269'18 (g95)
  mov dx, g95
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L66: ; Continuation
  ;; (270'40) Tail: app_270'25 (arg) @ xs (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L67: ; Continuation
  mov bx, dx
  cmp word [bx], 0
  jz L65
  mov ax, [bx+2]
  mov [2], ax
  mov ax, 10
  mov bx, [bp+4]
  call Bare_mul
  mov [4], ax
  mov ax, [4]
  add ax, [2]
  mov [6], ax
  push word [bp+6]
  push word cx
  push word L66
  mov cx, sp
  ;; (270'25) Tail: loop (g88) @ prim_0'0 (t3)
  mov bp, g88
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L68: ; Arm: 261'27
  push word [bp+4]
  push word 1
  mov [2], sp
  ;; (0'0) Return: con_261'32 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L69: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L68
  ;; (0'0) Return: con_261'44 (g93)
  mov dx, g93
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L70: ; Arm: 8'9
  ;; (0'0) Return: con_8'12 (g91)
  mov dx, g91
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L71: ; Arm: 261'12
  mov ax, 9
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov [2], ax
  push word [bp+8]
  push word cx
  push word L69
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L70
  ;; (0'0) Return: con_9'13 (g92)
  mov dx, g92
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L72: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L67
  mov cx, sp
  mov bx, dx
  cmp word [bx], 1
  jz L71
  ;; (0'0) Return: con_261'54 (g94)
  mov dx, g94
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L73: ; Arm: 8'9
  ;; (0'0) Return: con_8'12 (g89)
  mov dx, g89
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L74: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L64
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov ax, [2]
  call Bare_char_to_num
  mov [6], ax
  mov ax, [6]
  sub ax, 48
  mov [8], ax
  mov ax, [8]
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [10], ax
  push word [8]
  push word [4]
  push word [bp+2]
  push word cx
  push word L72
  mov cx, sp
  mov bx, [10]
  cmp word [bx], 1
  jz L73
  ;; (0'0) Return: con_9'13 (g90)
  mov dx, g90
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L75: ; Function: g88
  push word dx
  push word L74
  mov [2], sp
  ;; (0'0) Return: lam_264'19 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L76: ; Arm: 115'13
  ;; (114'15) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L77: ; Continuation
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [2], ax
  ;; (116'41) Tail: app_116'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L78: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L76
  mov ax, dx
  mov bx, 10
  call Bare_mod
  mov [4], ax
  mov ax, 48
  add ax, [4]
  mov [6], ax
  mov ax, [6]
  call Bare_num_to_char
  mov [8], ax
  push word [bp+2]
  push word [8]
  push word 1
  mov [10], sp
  push word dx
  push word cx
  push word L77
  mov cx, sp
  ;; (116'11) Tail: loop (g99) @ con_0'0 (t5)
  mov bp, g99
  mov dx, [10]
  mov ax, [bp]
  jmp ax

L79: ; Function: g99
  push word dx
  push word L78
  mov [2], sp
  ;; (0'0) Return: lam_114'19 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L80: ; Arm: 115'13
  ;; (114'15) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L81: ; Continuation
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [2], ax
  ;; (116'41) Tail: app_116'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L82: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L80
  mov ax, dx
  mov bx, 10
  call Bare_mod
  mov [4], ax
  mov ax, 48
  add ax, [4]
  mov [6], ax
  mov ax, [6]
  call Bare_num_to_char
  mov [8], ax
  push word [bp+2]
  push word [8]
  push word 1
  mov [10], sp
  push word dx
  push word cx
  push word L81
  mov cx, sp
  ;; (116'11) Tail: loop (g103) @ con_0'0 (t5)
  mov bp, g103
  mov dx, [10]
  mov ax, [bp]
  jmp ax

L83: ; Function: g103
  push word dx
  push word L82
  mov [2], sp
  ;; (0'0) Return: lam_114'19 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L84: ; Arm: 90'7
  ;; (0'0) Return: lit_90'10 (g22)
  mov dx, g22
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L85: ; Continuation
  ;; (86'10) Tail: implode (f2) @ app_41'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L86: ; Continuation
  push word [bp+4]
  push word cx
  push word L85
  mov cx, sp
  ;; (41'28) Tail: app_41'25 (f3) @ app_39'25 (arg)
  mov bp, [bp+6]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L87: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L86
  mov cx, sp
  ;; (39'25) Tail: app_39'22 (arg) @ xs (f4)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  mov ax, [bp]
  jmp ax

L88: ; Continuation
  push word [bp+6]
  push word dx
  push word [bp+4]
  push word cx
  push word L87
  mov cx, sp
  ;; (39'22) Tail: rev_onto (g7) @ con_39'22 (g23)
  mov bp, g7
  mov dx, g23
  mov ax, [bp]
  jmp ax

L89: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L88
  mov cx, sp
  ;; (41'25) Tail: rev_onto (g7) @ ys (arg)
  mov bp, g7
  mov dx, dx
  mov ax, [bp]
  jmp ax

L90: ; Continuation
  push word dx
  push word [bp+4]
  push word cx
  push word L89
  mov cx, sp
  ;; (86'32) Tail: explode (f3) @ s2 (f4)
  mov dx, [bp+8]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L91: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L90
  mov cx, sp
  ;; (86'19) Tail: explode (f3) @ x (f4)
  mov dx, [bp+8]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L92: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L84
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  push word [2]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L91
  mov cx, sp
  ;; (91'24) Tail: concat (me) @ xs (t2)
  mov bp, bp
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L93: ; Continuation
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

L94: ; Arm: 157'11
  push word [bp+6]
  push word cx
  push word L93
  mov cx, sp
  ;; (157'26) Tail: rev_implode (f1) @ accCs (f5)
  mov dx, [bp+10]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp ax

L95: ; Continuation
  ;; (159'74) Tail: app_159'45 (arg) @ xs (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L96: ; Continuation
  push word [bp+6]
  push word dx
  push word 1
  mov [2], sp
  push word [bp+8]
  push word cx
  push word L95
  mov cx, sp
  ;; (159'45) Tail: at_word_start (f2) @ con_0'0 (t1)
  mov bp, [bp+4]
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L97: ; Arm: 159'26
  push word [4]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L96
  mov cx, sp
  ;; (159'58) Tail: rev_implode (f1) @ accCs (f5)
  mov dx, [bp+10]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp ax

L98: ; Continuation
  ;; (160'43) Tail: app_160'32 (arg) @ xs (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L99: ; Continuation
  push word [bp+4]
  push word [bp+6]
  push word 1
  mov [2], sp
  push word [bp+8]
  push word cx
  push word L98
  mov cx, sp
  ;; (160'32) Tail: app_160'26 (arg) @ con_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L100: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L94
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
  jz L97
  push word [4]
  push word [2]
  push word [bp+10]
  push word cx
  push word L99
  mov cx, sp
  ;; (160'26) Tail: have_letter (f4) @ accWs (f3)
  mov dx, [bp+6]
  mov bp, [bp+8]
  mov ax, [bp]
  jmp ax

L101: ; Function: t1
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L100
  mov [2], sp
  ;; (0'0) Return: lam_155'36 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L102: ; Function: t1
  push word bp
  push word dx
  push word [bp+4]
  push word [bp+2]
  push word L101
  mov [2], sp
  ;; (0'0) Return: lam_155'30 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L103: ; Arm: 164'9
  ;; (154'24) Return: accWs (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L104: ; Continuation
  ;; (166'49) Tail: app_166'43 (arg) @ xs (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L105: ; Arm: 166'24
  push word [4]
  push word cx
  push word L104
  mov cx, sp
  ;; (166'43) Tail: at_word_start (f2) @ accWs (f1)
  mov dx, [bp+2]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp ax

L106: ; Continuation
  ;; (167'31) Tail: app_167'27 (arg) @ xs (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L107: ; Continuation
  push word g26
  push word [bp+4]
  push word 1
  mov [2], sp
  push word [bp+6]
  push word cx
  push word L106
  mov cx, sp
  ;; (167'27) Tail: app_167'21 (arg) @ con_167'28 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L108: ; Function: t2
  mov bx, dx
  cmp word [bx], 0
  jz L103
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
  jz L105
  push word [4]
  push word [2]
  push word cx
  push word L107
  mov cx, sp
  ;; (167'21) Tail: have_letter (f3) @ accWs (f1)
  mov dx, [bp+2]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L109: ; Function: t2
  push word bp
  push word [bp+2]
  push word L102
  mov [2], sp
  push word [2]
  push word bp
  push word dx
  push word L108
  mov [4], sp
  ;; (0'0) Return: lam_162'8 (t2)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L110: ; Arm: 138'22
  mov ax, `\n`
  call Bare_put_char
  mov [8], ax
  ;; (138'51) Tail: rev_implode (f1) @ acc (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L111: ; Arm: 139'28
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
  push word 4
  push word 1
  mov [16], sp
  ;; (139'76) Tail: rev_implode (f1) @ con_0'0 (t8)
  mov bp, [bp+2]
  mov dx, [16]
  mov ax, [bp]
  jmp ax

L112: ; Arm: 140'19
  ;; (140'33) Tail: readloop (me) @ acc (arg)
  mov bp, bp
  mov dx, dx
  mov ax, [bp]
  jmp ax

L113: ; Arm: 143'17
  ;; (143'29) Tail: readloop (me) @ acc (arg)
  mov bp, bp
  mov dx, dx
  mov ax, [bp]
  jmp ax

L114: ; Continuation
  mov ax, 8
  call Bare_put_char
  mov [2], ax
  mov ax, ' '
  call Bare_put_char
  mov [4], ax
  mov ax, 8
  call Bare_put_char
  mov [6], ax
  ;; (147'24) Tail: readloop (f2) @ tail (f3)
  mov dx, [bp+6]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp ax

L115: ; Arm: 145'31
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

L116: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L114
  mov cx, sp
  mov bx, dx
  cmp word [bx], 1
  jz L115
  ;; (0'0) Return: con_145'55 (g32)
  mov dx, g32
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L117: ; Arm: 8'9
  ;; (0'0) Return: con_8'12 (g30)
  mov dx, g30
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L118: ; Arm: 141'21
  mov bx, dx
  cmp word [bx], 0
  jz L113
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
  push word L116
  mov cx, sp
  mov bx, [20]
  cmp word [bx], 1
  jz L117
  ;; (0'0) Return: con_9'13 (g31)
  mov dx, g31
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L119: ; Continuation
  push word [bp+4]
  push word [bp+8]
  push word 1
  mov [2], sp
  ;; (149'34) Tail: readloop (f3) @ con_0'0 (t1)
  mov bp, [bp+6]
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L120: ; Arm: 99'19
  mov ax, [2]
  call Bare_put_char
  mov [18], ax
  ;; (0'0) Return: prim_0'0 (t9)
  mov dx, [18]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L121: ; Arm: 100'22
  mov ax, [2]
  call Bare_put_char
  mov [20], ax
  ;; (0'0) Return: prim_0'0 (t10)
  mov dx, [20]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L122: ; Arm: 101'16
  mov ax, [2]
  call Bare_put_char
  mov [22], ax
  ;; (0'0) Return: prim_0'0 (t11)
  mov dx, [22]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L123: ; Function: t1
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
  jz L110
  mov ax, [2]
  cmp word ax, 4
  call Bare_make_bool_from_z
  mov [8], ax
  mov bx, [8]
  cmp word [bx], 1
  jz L111
  mov ax, 127
  cmp word ax, [4]
  call Bare_make_bool_from_n
  mov [10], ax
  mov bx, [10]
  cmp word [bx], 1
  jz L112
  mov ax, [4]
  cmp word ax, 127
  call Bare_make_bool_from_z
  mov [12], ax
  mov bx, [12]
  cmp word [bx], 1
  jz L118
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
  push word L119
  mov cx, sp
  mov bx, [16]
  cmp word [bx], 1
  jz L120
  mov ax, [2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [18], ax
  mov bx, [18]
  cmp word [bx], 1
  jz L121
  mov ax, 26
  cmp word ax, [14]
  call Bare_make_bool_from_n
  mov [20], ax
  mov bx, [20]
  cmp word [bx], 1
  jz L122
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

L124: ; Arm: 219'36
  ;; (0'0) Return: con_219'41 (g34)
  mov dx, g34
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L125: ; Continuation
  ;; (221'13) Tail: mainloop (f2) @ fs (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L126: ; Arm: 212'7
  ;; (215'17) Return: fs (f5)
  mov dx, [bp+10]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L127: ; Arm: 183'9
  ;; (0'0) Return: con_183'12 (g37)
  mov dx, g37
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L128: ; Arm: 187'35
  push word [bp+8]
  push word 1
  mov [2], sp
  ;; (0'0) Return: con_187'40 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L129: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L128
  ;; (187'60) Tail: loop (f2) @ ps (f3)
  mov dx, [bp+6]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp ax

L130: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L129
  mov cx, sp
  ;; (187'28) Tail: app_187'23 (arg) @ command (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L131: ; Function: t3
  mov bx, dx
  cmp word [bx], 0
  jz L127
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
  push word L130
  mov cx, sp
  ;; (187'23) Tail: eq_string (f1) @ name (t3)
  mov bp, [bp+2]
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L132: ; Continuation
  ;; (215'17) Return: fs (f2)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L133: ; Continuation
  push word [bp+4]
  push word cx
  push word L132
  mov cx, sp
  ;; (109'29) Tail: put_chars (g24) @ app_109'38 (arg)
  mov bp, g24
  mov dx, dx
  mov ax, [bp]
  jmp ax

L134: ; Continuation
  push word [bp+6]
  push word cx
  push word L133
  mov cx, sp
  ;; (109'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L135: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L134
  mov cx, sp
  ;; (86'10) Tail: implode (f2) @ app_41'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L136: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L135
  mov cx, sp
  ;; (41'28) Tail: app_41'25 (f5) @ app_39'25 (arg)
  mov bp, [bp+10]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L137: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L136
  mov cx, sp
  ;; (39'25) Tail: app_39'22 (arg) @ xs (f6)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  mov ax, [bp]
  jmp ax

L138: ; Continuation
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L137
  mov cx, sp
  ;; (39'22) Tail: rev_onto (g7) @ con_39'22 (g45)
  mov bp, g7
  mov dx, g45
  mov ax, [bp]
  jmp ax

L139: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L138
  mov cx, sp
  ;; (41'25) Tail: rev_onto (g7) @ ys (arg)
  mov bp, g7
  mov dx, dx
  mov ax, [bp]
  jmp ax

L140: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L139
  mov cx, sp
  ;; (86'32) Tail: explode (f3) @ s2 (f5)
  mov dx, [bp+10]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L141: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L140
  mov cx, sp
  ;; (86'19) Tail: explode (f3) @ lit_202'26 (g44)
  mov bp, [bp+6]
  mov dx, g44
  mov ax, [bp]
  jmp ax

L142: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L141
  mov cx, sp
  ;; (86'10) Tail: implode (f2) @ app_41'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L143: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L142
  mov cx, sp
  ;; (41'28) Tail: app_41'25 (f5) @ app_39'25 (arg)
  mov bp, [bp+10]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L144: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L143
  mov cx, sp
  ;; (39'25) Tail: app_39'22 (arg) @ xs (f6)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  mov ax, [bp]
  jmp ax

L145: ; Continuation
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L144
  mov cx, sp
  ;; (39'22) Tail: rev_onto (g7) @ con_39'22 (g43)
  mov bp, g7
  mov dx, g43
  mov ax, [bp]
  jmp ax

L146: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L145
  mov cx, sp
  ;; (41'25) Tail: rev_onto (g7) @ ys (arg)
  mov bp, g7
  mov dx, dx
  mov ax, [bp]
  jmp ax

L147: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L146
  mov cx, sp
  ;; (86'32) Tail: explode (f3) @ s2 (f5)
  mov dx, [bp+10]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L148: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L147
  mov cx, sp
  ;; (86'19) Tail: explode (f3) @ command (f5)
  mov dx, [bp+10]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L149: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L148
  mov cx, sp
  ;; (86'10) Tail: implode (f2) @ app_41'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L150: ; Continuation
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L149
  mov cx, sp
  ;; (41'28) Tail: app_41'25 (f5) @ app_39'25 (arg)
  mov bp, [bp+10]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L151: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L150
  mov cx, sp
  ;; (39'25) Tail: app_39'22 (arg) @ xs (f7)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  mov ax, [bp]
  jmp ax

L152: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L151
  mov cx, sp
  ;; (39'22) Tail: rev_onto (g7) @ con_39'22 (g42)
  mov bp, g7
  mov dx, g42
  mov ax, [bp]
  jmp ax

L153: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L152
  mov cx, sp
  ;; (41'25) Tail: rev_onto (g7) @ ys (arg)
  mov bp, g7
  mov dx, dx
  mov ax, [bp]
  jmp ax

L154: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L153
  mov cx, sp
  ;; (86'32) Tail: explode (f3) @ s2 (f6)
  mov dx, [bp+12]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L155: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L154
  mov cx, sp
  ;; (86'19) Tail: explode (f3) @ lit_202'43 (g41)
  mov bp, [bp+6]
  mov dx, g41
  mov ax, [bp]
  jmp ax

L156: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L155
  mov cx, sp
  ;; (86'10) Tail: implode (f2) @ app_41'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L157: ; Continuation
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L156
  mov cx, sp
  ;; (41'28) Tail: app_41'25 (f5) @ app_39'25 (arg)
  mov bp, [bp+10]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L158: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L157
  mov cx, sp
  ;; (39'25) Tail: app_39'22 (arg) @ xs (f7)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  mov ax, [bp]
  jmp ax

L159: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L158
  mov cx, sp
  ;; (39'22) Tail: rev_onto (g7) @ con_39'22 (g40)
  mov bp, g7
  mov dx, g40
  mov ax, [bp]
  jmp ax

L160: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L159
  mov cx, sp
  ;; (41'25) Tail: rev_onto (g7) @ ys (arg)
  mov bp, g7
  mov dx, dx
  mov ax, [bp]
  jmp ax

L161: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L160
  mov cx, sp
  ;; (86'32) Tail: explode (f3) @ lit_202'50 (g39)
  mov bp, [bp+6]
  mov dx, g39
  mov ax, [bp]
  jmp ax

L162: ; Arm: 204'9
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L161
  mov cx, sp
  ;; (86'19) Tail: explode (f3) @ lit_204'16 (g38)
  mov bp, [bp+6]
  mov dx, g38
  mov ax, [bp]
  jmp ax

L163: ; Continuation
  ;; (215'17) Return: fs (f2)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L164: ; Continuation
  push word [bp+4]
  push word cx
  push word L163
  mov cx, sp
  ;; (109'29) Tail: put_chars (g24) @ app_109'38 (arg)
  mov bp, g24
  mov dx, dx
  mov ax, [bp]
  jmp ax

L165: ; Continuation
  push word [bp+6]
  push word cx
  push word L164
  mov cx, sp
  ;; (109'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L166: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L165
  mov cx, sp
  ;; (86'10) Tail: implode (f2) @ app_41'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L167: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L166
  mov cx, sp
  ;; (41'28) Tail: app_41'25 (f5) @ app_39'25 (arg)
  mov bp, [bp+10]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L168: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L167
  mov cx, sp
  ;; (39'25) Tail: app_39'22 (arg) @ xs (f6)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  mov ax, [bp]
  jmp ax

L169: ; Continuation
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L168
  mov cx, sp
  ;; (39'22) Tail: rev_onto (g7) @ con_39'22 (g53)
  mov bp, g7
  mov dx, g53
  mov ax, [bp]
  jmp ax

L170: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L169
  mov cx, sp
  ;; (41'25) Tail: rev_onto (g7) @ ys (arg)
  mov bp, g7
  mov dx, dx
  mov ax, [bp]
  jmp ax

L171: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L170
  mov cx, sp
  ;; (86'32) Tail: explode (f3) @ s2 (f5)
  mov dx, [bp+10]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L172: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L171
  mov cx, sp
  ;; (86'19) Tail: explode (f3) @ lit_202'26 (g52)
  mov bp, [bp+6]
  mov dx, g52
  mov ax, [bp]
  jmp ax

L173: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L172
  mov cx, sp
  ;; (86'10) Tail: implode (f2) @ app_41'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L174: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L173
  mov cx, sp
  ;; (41'28) Tail: app_41'25 (f5) @ app_39'25 (arg)
  mov bp, [bp+10]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L175: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L174
  mov cx, sp
  ;; (39'25) Tail: app_39'22 (arg) @ xs (f6)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  mov ax, [bp]
  jmp ax

L176: ; Continuation
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L175
  mov cx, sp
  ;; (39'22) Tail: rev_onto (g7) @ con_39'22 (g51)
  mov bp, g7
  mov dx, g51
  mov ax, [bp]
  jmp ax

L177: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L176
  mov cx, sp
  ;; (41'25) Tail: rev_onto (g7) @ ys (arg)
  mov bp, g7
  mov dx, dx
  mov ax, [bp]
  jmp ax

L178: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L177
  mov cx, sp
  ;; (86'32) Tail: explode (f3) @ s2 (f5)
  mov dx, [bp+10]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L179: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L178
  mov cx, sp
  ;; (86'19) Tail: explode (f3) @ command (f5)
  mov dx, [bp+10]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L180: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L179
  mov cx, sp
  ;; (86'10) Tail: implode (f2) @ app_41'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L181: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L180
  mov cx, sp
  ;; (41'28) Tail: app_41'25 (f6) @ app_39'25 (arg)
  mov bp, [bp+12]
  mov dx, dx
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
  ;; (39'25) Tail: app_39'22 (arg) @ xs (f7)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  mov ax, [bp]
  jmp ax

L183: ; Continuation
  push word [bp+12]
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L182
  mov cx, sp
  ;; (39'22) Tail: rev_onto (g7) @ con_39'22 (g50)
  mov bp, g7
  mov dx, g50
  mov ax, [bp]
  jmp ax

L184: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L183
  mov cx, sp
  ;; (41'25) Tail: rev_onto (g7) @ ys (arg)
  mov bp, g7
  mov dx, dx
  mov ax, [bp]
  jmp ax

L185: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L184
  mov cx, sp
  ;; (86'32) Tail: explode (f3) @ s2 (f6)
  mov dx, [bp+12]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L186: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L185
  mov cx, sp
  ;; (86'19) Tail: explode (f3) @ lit_202'43 (g49)
  mov bp, [bp+6]
  mov dx, g49
  mov ax, [bp]
  jmp ax

L187: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L186
  mov cx, sp
  ;; (86'10) Tail: implode (f2) @ app_41'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L188: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L187
  mov cx, sp
  ;; (41'28) Tail: app_41'25 (f6) @ app_39'25 (arg)
  mov bp, [bp+12]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L189: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L188
  mov cx, sp
  ;; (39'25) Tail: app_39'22 (arg) @ xs (f7)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  mov ax, [bp]
  jmp ax

L190: ; Continuation
  push word [bp+12]
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L189
  mov cx, sp
  ;; (39'22) Tail: rev_onto (g7) @ con_39'22 (g48)
  mov bp, g7
  mov dx, g48
  mov ax, [bp]
  jmp ax

L191: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L190
  mov cx, sp
  ;; (41'25) Tail: rev_onto (g7) @ ys (arg)
  mov bp, g7
  mov dx, dx
  mov ax, [bp]
  jmp ax

L192: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L191
  mov cx, sp
  ;; (86'32) Tail: explode (f3) @ lit_202'50 (g47)
  mov bp, [bp+6]
  mov dx, g47
  mov ax, [bp]
  jmp ax

L193: ; Arm: 207'14
  mov ax, [bx+2]
  mov [4], ax
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L192
  mov cx, sp
  ;; (86'19) Tail: explode (f3) @ lit_207'21 (g46)
  mov bp, [bp+6]
  mov dx, g46
  mov ax, [bp]
  jmp ax

L194: ; Continuation
  ;; (208'30) Tail: app_208'27 (arg) @ args (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L195: ; Continuation
  mov bx, dx
  cmp word [bx], 0
  jz L162
  mov ax, [bx+2]
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 0
  jz L193
  mov ax, [bx+2]
  mov [4], ax
  push word [bp+12]
  push word cx
  push word L194
  mov cx, sp
  ;; (208'27) Tail: f (t2) @ fs (f4)
  mov dx, [bp+8]
  mov bp, [4]
  mov ax, [bp]
  jmp ax

L196: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L195
  mov cx, sp
  ;; (189'17) Tail: loop (f7) @ case_178'18 (arg)
  mov bp, [bp+14]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L197: ; Continuation
  push word [bp+12]
  push word cx
  push word L125
  mov cx, sp
  mov bx, dx
  cmp word [bx], 0
  jz L126
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  push word [2]
  push word [bp+8]
  push word L131
  mov [6], sp
  push word [6]
  push word [4]
  push word [2]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L196
  mov cx, sp
  mov bx, [bp+10]
  mov ax, [bx+2]
  mov [8], ax
  ;; (178'43) Return: ps (t4)
  mov dx, [8]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L198: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L197
  mov cx, sp
  ;; (39'25) Tail: app_39'22 (arg) @ xs (f7)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  mov ax, [bp]
  jmp ax

L199: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L198
  mov cx, sp
  ;; (39'22) Tail: rev_onto (g7) @ con_39'22 (g36)
  mov bp, g7
  mov dx, g36
  mov ax, [bp]
  jmp ax

L200: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L199
  mov cx, sp
  ;; (170'33) Tail: app_170'30 (f5) @ app_170'42 (arg)
  mov bp, [bp+10]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L201: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L200
  mov cx, sp
  ;; (170'42) Tail: explode (f3) @ line (f7)
  mov dx, [bp+14]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L202: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L124
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L201
  mov cx, sp
  ;; (170'30) Tail: at_word_start (f5) @ con_170'30 (g35)
  mov bp, [bp+10]
  mov dx, g35
  mov ax, [bp]
  jmp ax

L203: ; Continuation
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L202
  mov cx, sp
  ;; (219'20) Tail: app_219'15 (arg) @ single_controlD (f8)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+16]
  mov ax, [bp]
  jmp ax

L204: ; Continuation
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L203
  mov cx, sp
  ;; (219'15) Tail: eq_string (f4) @ line (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L205: ; Continuation
  push word [bp+6]
  push word L123
  mov [2], sp
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word cx
  push word L204
  mov cx, sp
  ;; (151'11) Tail: readloop (t1) @ con_151'11 (g33)
  mov bp, [2]
  mov dx, g33
  mov ax, [bp]
  jmp ax

L206: ; Continuation
  push word g28
  push word 4
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
  push word L205
  mov cx, sp
  ;; (217'32) Tail: implode (f2) @ con_0'0 (t1)
  mov bp, [bp+4]
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L207: ; Continuation
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L206
  mov cx, sp
  ;; (109'29) Tail: put_chars (g24) @ app_109'38 (arg)
  mov bp, g24
  mov dx, dx
  mov ax, [bp]
  jmp ax

L208: ; Function: t3
  push word bp
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L207
  mov cx, sp
  ;; (109'38) Tail: explode (f3) @ lit_216'13 (g27)
  mov bp, [bp+6]
  mov dx, g27
  mov ax, [bp]
  jmp ax

L209: ; Continuation
  ;; (230'18) Return: fs (f2)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L210: ; Continuation
  push word [bp+4]
  push word cx
  push word L209
  mov cx, sp
  ;; (109'29) Tail: put_chars (g24) @ app_109'38 (arg)
  mov bp, g24
  mov dx, dx
  mov ax, [bp]
  jmp ax

L211: ; Arm: 240'7
  push word [bp+8]
  push word cx
  push word L210
  mov cx, sp
  ;; (109'38) Tail: explode (f1) @ lit_240'22 (g61)
  mov bp, [bp+2]
  mov dx, g61
  mov ax, [bp]
  jmp ax

L212: ; Arm: 183'9
  ;; (0'0) Return: con_183'12 (g62)
  mov dx, g62
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L213: ; Arm: 187'35
  push word [bp+8]
  push word 1
  mov [2], sp
  ;; (0'0) Return: con_187'40 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L214: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L213
  ;; (187'60) Tail: loop (f2) @ ps (f3)
  mov dx, [bp+6]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp ax

L215: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L214
  mov cx, sp
  ;; (187'28) Tail: app_187'23 (arg) @ x (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L216: ; Function: t3
  mov bx, dx
  cmp word [bx], 0
  jz L212
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
  push word L215
  mov cx, sp
  ;; (187'23) Tail: eq_string (f1) @ name (t3)
  mov bp, [bp+2]
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L217: ; Arm: 183'9
  ;; (0'0) Return: con_183'12 (g71)
  mov dx, g71
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L218: ; Arm: 187'35
  push word [bp+8]
  push word 1
  mov [2], sp
  ;; (0'0) Return: con_187'40 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L219: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L218
  ;; (187'60) Tail: loop (f2) @ ps (f3)
  mov dx, [bp+6]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp ax

L220: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L219
  mov cx, sp
  ;; (187'28) Tail: app_187'23 (arg) @ x (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L221: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L217
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
  push word L220
  mov cx, sp
  ;; (187'23) Tail: eq_string (f1) @ name (t3)
  mov bp, [bp+2]
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L222: ; Continuation
  ;; (109'29) Tail: put_chars (g24) @ app_109'38 (arg)
  mov bp, g24
  mov dx, dx
  mov ax, [bp]
  jmp ax

L223: ; Continuation
  push word cx
  push word L222
  mov cx, sp
  ;; (109'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L224: ; Arm: 233'11
  push word g75
  push word [bp+8]
  push word 1
  mov [2], sp
  push word [2]
  push word g72
  push word 1
  mov [4], sp
  push word [bp+4]
  push word cx
  push word L223
  mov cx, sp
  ;; (233'33) Tail: concat (f3) @ con_233'34 (t2)
  mov bp, [bp+6]
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L225: ; Continuation
  ;; (109'29) Tail: put_chars (g24) @ app_109'38 (arg)
  mov bp, g24
  mov dx, dx
  mov ax, [bp]
  jmp ax

L226: ; Arm: 236'16
  mov ax, [bx+2]
  mov [4], ax
  push word cx
  push word L225
  mov cx, sp
  ;; (109'38) Tail: explode (f2) @ s (t2)
  mov bp, [bp+4]
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L227: ; Continuation
  ;; (109'29) Tail: put_chars (g24) @ app_109'38 (arg)
  mov bp, g24
  mov dx, dx
  mov ax, [bp]
  jmp ax

L228: ; Continuation
  push word cx
  push word L227
  mov cx, sp
  ;; (109'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L229: ; Continuation
  mov bx, dx
  cmp word [bx], 0
  jz L224
  mov ax, [bx+2]
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 0
  jz L226
  mov ax, [bx+2]
  mov [4], ax
  push word g79
  push word [bp+8]
  push word 1
  mov [6], sp
  push word [6]
  push word g76
  push word 1
  mov [8], sp
  push word [bp+4]
  push word cx
  push word L228
  mov cx, sp
  ;; (237'46) Tail: concat (f3) @ con_237'47 (t4)
  mov bp, [bp+6]
  mov dx, [8]
  mov ax, [bp]
  jmp ax

L230: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L229
  mov cx, sp
  ;; (189'17) Tail: loop (f5) @ case_178'18 (arg)
  mov bp, [bp+10]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L231: ; Function: t1
  push word dx
  push word [bp+4]
  push word L221
  mov [2], sp
  push word [2]
  push word dx
  push word [bp+6]
  push word [bp+2]
  push word cx
  push word L230
  mov cx, sp
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [4], ax
  ;; (178'43) Return: ps (t2)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L232: ; Continuation
  ;; (230'18) Return: fs (f2)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L233: ; Continuation
  push word [bp+4]
  push word cx
  push word L232
  mov cx, sp
  ;; (241'32) Tail: app_241'27 (arg) @ xs (f3)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+6]
  mov ax, [bp]
  jmp ax

L234: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L231
  mov [2], sp
  push word [bp+12]
  push word [bp+10]
  push word cx
  push word L233
  mov cx, sp
  ;; (241'27) Tail: iter (g5) @ lam_231'11 (t1)
  mov bp, g5
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L235: ; Continuation
  ;; (109'29) Tail: put_chars (g24) @ app_109'38 (arg)
  mov bp, g24
  mov dx, dx
  mov ax, [bp]
  jmp ax

L236: ; Continuation
  push word cx
  push word L235
  mov cx, sp
  ;; (109'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L237: ; Arm: 233'11
  push word g66
  push word [bp+12]
  push word 1
  mov [2], sp
  push word [2]
  push word g63
  push word 1
  mov [4], sp
  push word [bp+4]
  push word cx
  push word L236
  mov cx, sp
  ;; (233'33) Tail: concat (f4) @ con_233'34 (t2)
  mov bp, [bp+8]
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L238: ; Continuation
  ;; (109'29) Tail: put_chars (g24) @ app_109'38 (arg)
  mov bp, g24
  mov dx, dx
  mov ax, [bp]
  jmp ax

L239: ; Arm: 236'16
  mov ax, [bx+2]
  mov [4], ax
  push word cx
  push word L238
  mov cx, sp
  ;; (109'38) Tail: explode (f2) @ s (t2)
  mov bp, [bp+4]
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L240: ; Continuation
  ;; (109'29) Tail: put_chars (g24) @ app_109'38 (arg)
  mov bp, g24
  mov dx, dx
  mov ax, [bp]
  jmp ax

L241: ; Continuation
  push word cx
  push word L240
  mov cx, sp
  ;; (109'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L242: ; Continuation
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L234
  mov cx, sp
  mov bx, dx
  cmp word [bx], 0
  jz L237
  mov ax, [bx+2]
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 0
  jz L239
  mov ax, [bx+2]
  mov [4], ax
  push word g70
  push word [bp+12]
  push word 1
  mov [6], sp
  push word [6]
  push word g67
  push word 1
  mov [8], sp
  push word [bp+4]
  push word cx
  push word L241
  mov cx, sp
  ;; (237'46) Tail: concat (f4) @ con_237'47 (t4)
  mov bp, [bp+8]
  mov dx, [8]
  mov ax, [bp]
  jmp ax

L243: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L242
  mov cx, sp
  ;; (189'17) Tail: loop (f8) @ case_178'18 (arg)
  mov bp, [bp+16]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L244: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L211
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  push word [2]
  push word [bp+4]
  push word L216
  mov [6], sp
  push word [6]
  push word [4]
  push word [2]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L243
  mov cx, sp
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [8], ax
  ;; (178'43) Return: ps (t4)
  mov dx, [8]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L245: ; Function: t1
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L244
  mov [2], sp
  ;; (0'0) Return: lam_230'21 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L246: ; Continuation
  ;; (223'17) Return: fs (f2)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L247: ; Continuation
  push word [bp+4]
  push word cx
  push word L246
  mov cx, sp
  ;; (109'29) Tail: put_chars (g24) @ app_109'38 (arg)
  mov bp, g24
  mov dx, dx
  mov ax, [bp]
  jmp ax

L248: ; Arm: 225'9
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  push word [bp+4]
  push word cx
  push word L247
  mov cx, sp
  ;; (109'38) Tail: explode (f1) @ lit_225'23 (g81)
  mov bp, [bp+2]
  mov dx, g81
  mov ax, [bp]
  jmp ax

L249: ; Arm: 194'9
  ;; (0'0) Return: con_194'12 (g83)
  mov dx, g83
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L250: ; Continuation
  ;; (195'48) Tail: loop (f2) @ xs (f3)
  mov dx, [bp+6]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp ax

L251: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L250
  mov cx, sp
  ;; (109'29) Tail: put_chars (g24) @ app_109'38 (arg)
  mov bp, g24
  mov dx, dx
  mov ax, [bp]
  jmp ax

L252: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L249
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
  push word L251
  mov cx, sp
  ;; (109'38) Tail: explode (f1) @ x (t1)
  mov bp, [bp+2]
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L253: ; Continuation
  mov ax, `\n`
  call Bare_put_char
  mov [2], ax
  ;; (223'17) Return: fs (f2)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L254: ; Arm: 198'9
  ;; (0'0) Return: con_198'12 (g84)
  mov dx, g84
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L255: ; Continuation
  ;; (199'34) Tail: loop (f2) @ xs (f3)
  mov dx, [bp+6]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp ax

L256: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L255
  mov cx, sp
  ;; (109'29) Tail: put_chars (g24) @ app_109'38 (arg)
  mov bp, g24
  mov dx, dx
  mov ax, [bp]
  jmp ax

L257: ; Continuation
  push word [bp+4]
  push word L252
  mov [2], sp
  push word [bp+6]
  push word cx
  push word L253
  mov cx, sp
  mov bx, dx
  cmp word [bx], 0
  jz L254
  mov ax, [bx+2]
  mov [4], ax
  mov ax, [bx+4]
  mov [6], ax
  push word [6]
  push word [2]
  push word cx
  push word L256
  mov cx, sp
  ;; (109'38) Tail: explode (f2) @ x (t2)
  mov bp, [bp+4]
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L258: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L257
  mov cx, sp
  ;; (228'43) Tail: app_228'33 (f4) @ case_178'18 (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L259: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L258
  mov cx, sp
  mov bx, [bp+6]
  mov ax, [bx+2]
  mov [2], ax
  ;; (178'43) Return: ps (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L260: ; Function: t1
  mov bx, dx
  cmp word [bx], 1
  jz L248
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L259
  mov cx, sp
  ;; (228'33) Tail: map (g3) @ lam_227'19 (g82)
  mov bp, g3
  mov dx, g82
  mov ax, [bp]
  jmp ax

L261: ; Function: t4
  push word dx
  push word [bp+2]
  push word L260
  mov [2], sp
  ;; (0'0) Return: lam_223'20 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L262: ; Continuation
  ;; (274'18) Return: fs (f2)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L263: ; Continuation
  push word [bp+4]
  push word cx
  push word L262
  mov cx, sp
  ;; (109'29) Tail: put_chars (g24) @ app_109'38 (arg)
  mov bp, g24
  mov dx, dx
  mov ax, [bp]
  jmp ax

L264: ; Arm: 276'7
  push word [bp+4]
  push word cx
  push word L263
  mov cx, sp
  ;; (109'38) Tail: explode (f1) @ lit_276'22 (g86)
  mov bp, [bp+2]
  mov dx, g86
  mov ax, [bp]
  jmp ax

L265: ; Continuation
  ;; (274'18) Return: fs (f2)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L266: ; Continuation
  push word [bp+4]
  push word cx
  push word L265
  mov cx, sp
  ;; (109'29) Tail: put_chars (g24) @ app_109'38 (arg)
  mov bp, g24
  mov dx, dx
  mov ax, [bp]
  jmp ax

L267: ; Arm: 279'12
  mov ax, [bx+2]
  mov [6], ax
  mov ax, [bx+4]
  mov [8], ax
  push word [bp+4]
  push word cx
  push word L266
  mov cx, sp
  ;; (109'38) Tail: explode (f1) @ lit_279'27 (g87)
  mov bp, [bp+2]
  mov dx, g87
  mov ax, [bp]
  jmp ax

L268: ; Continuation
  ;; (274'18) Return: fs (f2)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L269: ; Continuation
  push word [bp+4]
  push word cx
  push word L268
  mov cx, sp
  ;; (109'29) Tail: put_chars (g24) @ app_109'38 (arg)
  mov bp, g24
  mov dx, dx
  mov ax, [bp]
  jmp ax

L270: ; Arm: 282'15
  push word [bp+6]
  push word cx
  push word L269
  mov cx, sp
  ;; (109'38) Tail: explode (f2) @ lit_282'30 (g96)
  mov bp, [bp+4]
  mov dx, g96
  mov ax, [bp]
  jmp ax

L271: ; Arm: 248'13
  ;; (0'0) Return: con_248'18 (g97)
  mov dx, g97
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L272: ; Continuation
  mov ax, `\n`
  call Bare_put_char
  mov [2], ax
  mov ax, [bp+4]
  add ax, 1
  mov [4], ax
  ;; (255'11) Tail: loop (f3) @ prim_0'0 (t2)
  mov bp, [bp+6]
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L273: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L272
  mov cx, sp
  ;; (120'26) Tail: put_chars (g24) @ case_118'2 (arg)
  mov bp, g24
  mov dx, dx
  mov ax, [bp]
  jmp ax

L274: ; Arm: 118'11
  push word g104
  push word '0'
  push word 1
  mov [4], sp
  ;; (0'0) Return: con_118'17 (t2)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L275: ; Continuation
  ;; (118'35) Tail: app_118'32 (arg) @ res (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L276: ; Continuation
  mov ax, [bp+8]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L273
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L274
  push word [bp+8]
  push word cx
  push word L275
  mov cx, sp
  ;; (118'32) Tail: loop (g103) @ con_118'32 (g105)
  mov bp, g103
  mov dx, g105
  mov ax, [bp]
  jmp ax

L277: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L276
  mov cx, sp
  ;; (109'29) Tail: put_chars (g24) @ app_109'38 (arg)
  mov bp, g24
  mov dx, dx
  mov ax, [bp]
  jmp ax

L278: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L277
  mov cx, sp
  ;; (109'38) Tail: explode (f2) @ lit_252'17 (g102)
  mov bp, [bp+4]
  mov dx, g102
  mov ax, [bp]
  jmp ax

L279: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L278
  mov cx, sp
  ;; (120'26) Tail: put_chars (g24) @ case_118'2 (arg)
  mov bp, g24
  mov dx, dx
  mov ax, [bp]
  jmp ax

L280: ; Arm: 118'11
  push word g100
  push word '0'
  push word 1
  mov [4], sp
  ;; (0'0) Return: con_118'17 (t2)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L281: ; Continuation
  ;; (118'35) Tail: app_118'32 (arg) @ i (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L282: ; Continuation
  mov ax, [bp+6]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L279
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L280
  push word [bp+6]
  push word cx
  push word L281
  mov cx, sp
  ;; (118'32) Tail: loop (g99) @ con_118'32 (g101)
  mov bp, g99
  mov dx, g101
  mov ax, [bp]
  jmp ax

L283: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L282
  mov cx, sp
  ;; (109'29) Tail: put_chars (g24) @ app_109'38 (arg)
  mov bp, g24
  mov dx, dx
  mov ax, [bp]
  jmp ax

L284: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L283
  mov cx, sp
  ;; (109'38) Tail: explode (f2) @ lit_250'17 (g98)
  mov bp, [bp+4]
  mov dx, g98
  mov ax, [bp]
  jmp ax

L285: ; Function: t2
  mov ax, [bp+4]
  cmp word ax, dx
  call Bare_make_bool_from_n
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L271
  push word bp
  push word dx
  push word [bp+2]
  push word cx
  push word L284
  mov cx, sp
  ;; (249'20) Tail: fib (g54) @ i (arg)
  mov bp, g54
  mov dx, dx
  mov ax, [bp]
  jmp ax

L286: ; Continuation
  ;; (274'18) Return: fs (f2)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L287: ; Continuation
  mov bx, dx
  cmp word [bx], 0
  jz L270
  mov ax, [bx+2]
  mov [2], ax
  push word [2]
  push word [bp+4]
  push word L285
  mov [4], sp
  push word [bp+6]
  push word cx
  push word L286
  mov cx, sp
  ;; (257'7) Tail: loop (t2) @ 0
  mov bp, [4]
  mov dx, 0
  mov ax, [bp]
  jmp ax

L288: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L287
  mov cx, sp
  ;; (272'9) Tail: app_272'7 (arg) @ s (f4)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  mov ax, [bp]
  jmp ax

L289: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L288
  mov cx, sp
  ;; (272'7) Tail: loop (g88) @ 0
  mov bp, g88
  mov dx, 0
  mov ax, [bp]
  jmp ax

L290: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L264
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov bx, [4]
  cmp word [bx], 1
  jz L267
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L289
  mov cx, sp
  ;; (281'33) Tail: explode (f1) @ arg1 (t1)
  mov bp, [bp+2]
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L291: ; Function: t7
  push word dx
  push word [bp+2]
  push word L290
  mov [2], sp
  ;; (0'0) Return: lam_274'21 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L292: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L245
  mov [2], sp
  push word [2]
  push word 1
  mov [4], sp
  push word [4]
  push word g60
  push word 0
  mov [6], sp
  push word [bp+4]
  push word L261
  mov [8], sp
  push word [8]
  push word 1
  mov [10], sp
  push word [10]
  push word g80
  push word 0
  mov [12], sp
  push word [bp+4]
  push word L291
  mov [14], sp
  push word [14]
  push word 1
  mov [16], sp
  push word [16]
  push word g85
  push word 0
  mov [18], sp
  push word g106
  push word [18]
  push word 1
  mov [20], sp
  push word [20]
  push word [12]
  push word 1
  mov [22], sp
  push word [22]
  push word [6]
  push word 1
  mov [24], sp
  push word [24]
  push word g59
  push word 1
  mov [26], sp
  push word [26]
  push word 0
  mov [28], sp
  ;; (297'11) Tail: mainloop (f5) @ con_288'12 (t14)
  mov bp, [bp+10]
  mov dx, [28]
  mov ax, [bp]
  jmp ax

L293: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L292
  mov cx, sp
  ;; (109'29) Tail: put_chars (g24) @ app_109'38 (arg)
  mov bp, g24
  mov dx, dx
  mov ax, [bp]
  jmp ax

L294: ; Continuation
  push word [bp+8]
  push word [bp+4]
  push word L92
  mov [2], sp
  push word [bp+6]
  push word L109
  mov [4], sp
  push word [4]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L208
  mov [6], sp
  push word [6]
  push word [2]
  push word dx
  push word [bp+8]
  push word cx
  push word L293
  mov cx, sp
  ;; (109'38) Tail: explode (f4) @ lit_296'13 (g55)
  mov bp, [bp+8]
  mov dx, g55
  mov ax, [bp]
  jmp ax

L295: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L294
  mov cx, sp
  ;; (73'25) Tail: block (g1) @ lam_73'30 (g21)
  mov bp, g1
  mov dx, g21
  mov ax, [bp]
  jmp ax

L296: ; Continuation
  push word dx
  push word [bp+4]
  push word cx
  push word L295
  mov cx, sp
  ;; (66'23) Tail: block (g1) @ lam_66'28 (g13)
  mov bp, g1
  mov dx, g13
  mov ax, [bp]
  jmp ax

L297: ; Continuation
  push word dx
  push word cx
  push word L296
  mov cx, sp
  ;; (55'26) Tail: block (g1) @ lam_55'31 (g11)
  mov bp, g1
  mov dx, g11
  mov ax, [bp]
  jmp ax

L298: ; Start
  push word cx
  push word L297
  mov cx, sp
  ;; (4'17) Tail: block (g1) @ lam_45'31 (g9)
  mov bp, g1
  mov dx, g9
  mov ax, [bp]
  jmp ax

g1: dw L2
g2: dw L5
g3: dw L11
g4: dw 0
g5: dw L16
g6: dw 0
g7: dw L20
g8: dw 0
g9: dw L28
g10: dw 0
g11: dw L36
g12: dw 0
g13: dw L42
g14: dw 0
g15: dw 1
g16: dw 0
g17: dw 1
g18: dw 0
g19: dw 1
g20: dw 0
g21: dw L52
g22: dw 0
g23: dw 0
g24: dw L58
g25: dw 0
g26: dw 0
g27: dw 2, '%', ' '
g28: dw 0
g29: dw 0
g30: dw 0
g31: dw 1
g32: dw 0
g33: dw 0
g34: dw 0
g35: dw 0
g36: dw 0
g37: dw 0
g38: dw 17, 'c', 'o', 'm', 'm', 'a', 'n', 'd', ' ', 'n', 'o', 't', ' ', 'f', 'o', 'u', 'n', 'd'
g39: dw 1, `\n`
g40: dw 0
g41: dw 2, ':', ' '
g42: dw 0
g43: dw 0
g44: dw 6, 's', 'h', 'a', 'm', ':', ' '
g45: dw 0
g46: dw 17, 'P', 'e', 'r', 'm', 'i', 's', 's', 'i', 'o', 'n', ' ', 'd', 'e', 'n', 'i', 'e', 'd'
g47: dw 1, `\n`
g48: dw 0
g49: dw 2, ':', ' '
g50: dw 0
g51: dw 0
g52: dw 6, 's', 'h', 'a', 'm', ':', ' '
g53: dw 0
g54: dw L62
g55: dw 53, 'S', 'h', 'a', 'm', 'm', 'y', ':', ' ', 'I', 'n', '-', 'm', 'e', 'm', 'o', 'r', 'y', ' ', 'f', 'i', 'l', 'e', '-', 's', 'y', 's', 't', 'e', 'm', '.', ' ', 'C', 'o', 'n', 's', 'i', 'd', 'e', 'r', ' ', 't', 'y', 'p', 'i', 'n', 'g', ' ', '"', 'l', 's', '"', '.', `\n`
g56: dw 6, 'r', 'e', 'a', 'd', 'm', 'e'
g57: dw 46, 'W', 'e', 'l', 'c', 'o', 'm', 'e', ' ', 't', 'o', ' ', 's', 'h', 'a', 'm', ';', ' ', 'p', 'l', 'e', 'a', 's', 'e', ' ', 't', 'r', 'y', ' ', 'a', 'l', 'l', ' ', 't', 'h', 'e', ' ', 'c', 'o', 'm', 'm', 'a', 'n', 'd', 's', '!', `\n`
g58: dw 0, g57
g59: dw 0, g56, g58
g60: dw 3, 'c', 'a', 't'
g61: dw 33, 'c', 'a', 't', ':', ' ', 't', 'a', 'k', 'e', 's', ' ', 'a', 't', ' ', 'l', 'e', 'a', 's', 't', ' ', 'o', 'n', 'e', ' ', 'a', 'r', 'g', 'u', 'm', 'e', 'n', 't', `\n`
g62: dw 0
g63: dw 5, 'c', 'a', 't', ':', ' '
g64: dw 29, ' ', ':', ' ', 'N', 'o', ' ', 's', 'u', 'c', 'h', ' ', 'f', 'i', 'l', 'e', ' ', 'o', 'r', ' ', 'd', 'i', 'r', 'e', 'c', 't', 'o', 'r', 'y', `\n`
g65: dw 0
g66: dw 1, g64, g65
g67: dw 5, 'c', 'a', 't', ':', ' '
g68: dw 19, ' ', ':', ' ', 'N', 'o', 't', ' ', 'a', ' ', 'd', 'a', 't', 'a', ' ', 'f', 'i', 'l', 'e', `\n`
g69: dw 0
g70: dw 1, g68, g69
g71: dw 0
g72: dw 5, 'c', 'a', 't', ':', ' '
g73: dw 29, ' ', ':', ' ', 'N', 'o', ' ', 's', 'u', 'c', 'h', ' ', 'f', 'i', 'l', 'e', ' ', 'o', 'r', ' ', 'd', 'i', 'r', 'e', 'c', 't', 'o', 'r', 'y', `\n`
g74: dw 0
g75: dw 1, g73, g74
g76: dw 5, 'c', 'a', 't', ':', ' '
g77: dw 19, ' ', ':', ' ', 'N', 'o', 't', ' ', 'a', ' ', 'd', 'a', 't', 'a', ' ', 'f', 'i', 'l', 'e', `\n`
g78: dw 0
g79: dw 1, g77, g78
g80: dw 2, 'l', 's'
g81: dw 23, 'l', 's', ':', ' ', 't', 'a', 'k', 'e', 's', ' ', 'n', 'o', ' ', 'a', 'r', 'g', 'u', 'm', 'e', 'n', 't', 's', `\n`
g82: dw L63
g83: dw 0
g84: dw 0
g85: dw 3, 'f', 'i', 'b'
g86: dw 22, 'f', 'i', 'b', ':', ' ', 'm', 'i', 's', 's', 'i', 'n', 'g', ' ', 'a', 'r', 'g', 'u', 'm', 'e', 'n', 't', `\n`
g87: dw 34, 'c', 'r', 'e', 'a', 't', 'e', ':', ' ', 'u', 'n', 'e', 'x', 'p', 'e', 'c', 't', 'e', 'd', ' ', 'e', 'x', 't', 'r', 'a', ' ', 'a', 'r', 'g', 'u', 'm', 'e', 'n', 't', `\n`
g88: dw L75
g89: dw 0
g90: dw 1
g91: dw 0
g92: dw 1
g93: dw 0
g94: dw 0
g95: dw 0
g96: dw 31, 'f', 'i', 'b', ':', ' ', 'e', 'x', 'p', 'e', 'c', 't', 'e', 'd', ' ', 'n', 'u', 'm', 'e', 'r', 'i', 'c', ' ', 'a', 'r', 'g', 'u', 'm', 'e', 'n', 't', `\n`
g97: dw 0
g98: dw 4, 'f', 'i', 'b', ' '
g99: dw L79
g100: dw 0
g101: dw 0
g102: dw 5, ' ', '-', '-', '>', ' '
g103: dw L83
g104: dw 0
g105: dw 0
g106: dw 0

bare_start: jmp L298
