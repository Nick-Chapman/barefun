L1: ; Function: t1
  ;; (19'54) Tail: f (f1) @ a (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L2: ; Function: g1
  push word dx
  push word L1
  mov [2], sp
  ;; (0'0) Return: lam_19'31 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L3: ; Arm: 25'7
  ;; (25'10) Return: 0
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
  ;; (26'27) Tail: length (g2) @ xs (t2)
  mov bp, g2
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L6: ; Arm: 30'7
  ;; (28'17) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L7: ; Continuation
  ;; (31'33) Tail: app_31'22 (arg) @ xs (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L8: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L6
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
  push word L7
  mov cx, sp
  ;; (31'22) Tail: rev_onto (g3) @ con_0'0 (t3)
  mov bp, g3
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L9: ; Function: g3
  push word dx
  push word L8
  mov [2], sp
  ;; (0'0) Return: lam_28'21 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L10: ; Arm: 43'9
  ;; (0'0) Return: con_43'12 (g4)
  mov dx, g4
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L11: ; Continuation
  ;; (44'43) Tail: app_44'37 (arg) @ xs (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L12: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L10
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
  push word L11
  mov cx, sp
  ;; (44'37) Tail: loop (f3) @ prim_0'0 (t4)
  mov bp, [bp+6]
  mov dx, [8]
  mov ax, [bp]
  jmp ax

L13: ; Function: t2
  push word bp
  push word dx
  push word [bp+2]
  push word L12
  mov [2], sp
  ;; (0'0) Return: lam_41'17 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L14: ; Continuation
  mov ax, [bp+4]
  mov [2], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L15: ; Continuation
  push word [bp+6]
  push word cx
  push word L14
  mov cx, sp
  ;; (46'9) Tail: app_46'7 (arg) @ xs (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L16: ; Continuation
  mov ax, dx
  call Bare_make_bytes
  mov [2], ax
  push word [2]
  push word L13
  mov [4], sp
  push word [2]
  push word [bp+4]
  push word cx
  push word L15
  mov cx, sp
  ;; (46'7) Tail: loop (t2) @ 0
  mov bp, [4]
  mov dx, 0
  mov ax, [bp]
  jmp ax

L17: ; Function: g5
  push word dx
  push word cx
  push word L16
  mov cx, sp
  ;; (40'29) Tail: length (g2) @ xs (arg)
  mov bp, g2
  mov dx, dx
  mov ax, [bp]
  jmp ax

L18: ; Arm: 51'13
  ;; (50'23) Return: acc (f2)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L19: ; Continuation
  mov ax, [bp+4]
  sub ax, 1
  mov [2], ax
  ;; (52'45) Tail: app_52'19 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L20: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L18
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
  push word L19
  mov cx, sp
  ;; (52'19) Tail: explode_loop (f3) @ con_0'0 (t3)
  mov bp, [bp+6]
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L21: ; Function: t1
  push word bp
  push word dx
  push word [bp+2]
  push word L20
  mov [2], sp
  ;; (0'0) Return: lam_50'27 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L22: ; Continuation
  mov ax, [bp+4]
  sub ax, 1
  mov [2], ax
  ;; (54'18) Tail: app_54'15 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L23: ; Function: g7
  push word dx
  push word L21
  mov [2], sp
  mov ax, dx
  call Bare_string_length
  mov [4], ax
  push word [4]
  push word cx
  push word L22
  mov cx, sp
  ;; (54'15) Tail: explode_loop (t1) @ con_54'15 (g6)
  mov bp, [2]
  mov dx, g6
  mov ax, [bp]
  jmp ax

L24: ; Arm: 72'7
  ;; (0'0) Return: con_72'10 (g9)
  mov dx, g9
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L25: ; Continuation
  ;; (73'35) Tail: put_chars (g8) @ xs (f2)
  mov dx, [bp+4]
  mov bp, g8
  mov ax, [bp]
  jmp ax

L26: ; Arm: 65'19
  mov ax, [2]
  call Bare_put_char
  mov [10], ax
  ;; (0'0) Return: prim_0'0 (t5)
  mov dx, [10]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L27: ; Arm: 66'22
  mov ax, [2]
  call Bare_put_char
  mov [12], ax
  ;; (0'0) Return: prim_0'0 (t6)
  mov dx, [12]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L28: ; Arm: 67'16
  mov ax, [2]
  call Bare_put_char
  mov [14], ax
  ;; (0'0) Return: prim_0'0 (t7)
  mov dx, [14]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L29: ; Function: g8
  mov bx, dx
  cmp word [bx], 0
  jz L24
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
  push word L25
  mov cx, sp
  mov bx, [8]
  cmp word [bx], 1
  jz L26
  mov ax, [2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [10], ax
  mov bx, [10]
  cmp word [bx], 1
  jz L27
  mov ax, 26
  cmp word ax, [6]
  call Bare_make_bool_from_n
  mov [12], ax
  mov bx, [12]
  cmp word [bx], 1
  jz L28
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

L30: ; Arm: 86'13
  ;; (85'15) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L31: ; Continuation
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [2], ax
  ;; (87'41) Tail: app_87'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L32: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L30
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
  push word L31
  mov cx, sp
  ;; (87'11) Tail: loop (g29) @ con_0'0 (t5)
  mov bp, g29
  mov dx, [10]
  mov ax, [bp]
  jmp ax

L33: ; Function: g29
  push word dx
  push word L32
  mov [2], sp
  ;; (0'0) Return: lam_85'19 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L34: ; Arm: 86'13
  ;; (85'15) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L35: ; Continuation
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [2], ax
  ;; (87'41) Tail: app_87'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L36: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L34
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
  push word L35
  mov cx, sp
  ;; (87'11) Tail: loop (g39) @ con_0'0 (t5)
  mov bp, g39
  mov dx, [10]
  mov ax, [bp]
  jmp ax

L37: ; Function: g39
  push word dx
  push word L36
  mov [2], sp
  ;; (0'0) Return: lam_85'19 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L38: ; Arm: 86'13
  ;; (85'15) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L39: ; Continuation
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [2], ax
  ;; (87'41) Tail: app_87'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L40: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L38
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
  push word L39
  mov cx, sp
  ;; (87'11) Tail: loop (g42) @ con_0'0 (t5)
  mov bp, g42
  mov dx, [10]
  mov ax, [bp]
  jmp ax

L41: ; Function: g42
  push word dx
  push word L40
  mov [2], sp
  ;; (0'0) Return: lam_85'19 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L42: ; Arm: 86'13
  ;; (85'15) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L43: ; Continuation
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [2], ax
  ;; (87'41) Tail: app_87'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L44: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L42
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
  push word L43
  mov cx, sp
  ;; (87'11) Tail: loop (g52) @ con_0'0 (t5)
  mov bp, g52
  mov dx, [10]
  mov ax, [bp]
  jmp ax

L45: ; Function: g52
  push word dx
  push word L44
  mov [2], sp
  ;; (0'0) Return: lam_85'19 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L46: ; Arm: 86'13
  ;; (85'15) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L47: ; Continuation
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [2], ax
  ;; (87'41) Tail: app_87'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L48: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L46
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
  push word L47
  mov cx, sp
  ;; (87'11) Tail: loop (g55) @ con_0'0 (t5)
  mov bp, g55
  mov dx, [10]
  mov ax, [bp]
  jmp ax

L49: ; Function: g55
  push word dx
  push word L48
  mov [2], sp
  ;; (0'0) Return: lam_85'19 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L50: ; Arm: 86'13
  ;; (85'15) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L51: ; Continuation
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [2], ax
  ;; (87'41) Tail: app_87'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L52: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L50
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
  push word L51
  mov cx, sp
  ;; (87'11) Tail: loop (g58) @ con_0'0 (t5)
  mov bp, g58
  mov dx, [10]
  mov ax, [bp]
  jmp ax

L53: ; Function: g58
  push word dx
  push word L52
  mov [2], sp
  ;; (0'0) Return: lam_85'19 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L54: ; Arm: 86'13
  ;; (85'15) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L55: ; Continuation
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [2], ax
  ;; (87'41) Tail: app_87'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L56: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L54
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
  push word L55
  mov cx, sp
  ;; (87'11) Tail: loop (g75) @ con_0'0 (t5)
  mov bp, g75
  mov dx, [10]
  mov ax, [bp]
  jmp ax

L57: ; Function: g75
  push word dx
  push word L56
  mov [2], sp
  ;; (0'0) Return: lam_85'19 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L58: ; Arm: 86'13
  ;; (85'15) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L59: ; Continuation
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [2], ax
  ;; (87'41) Tail: app_87'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L60: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L58
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
  push word L59
  mov cx, sp
  ;; (87'11) Tail: loop (g85) @ con_0'0 (t5)
  mov bp, g85
  mov dx, [10]
  mov ax, [bp]
  jmp ax

L61: ; Function: g85
  push word dx
  push word L60
  mov [2], sp
  ;; (0'0) Return: lam_85'19 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L62: ; Arm: 86'13
  ;; (85'15) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L63: ; Continuation
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [2], ax
  ;; (87'41) Tail: app_87'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L64: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L62
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
  push word L63
  mov cx, sp
  ;; (87'11) Tail: loop (g103) @ con_0'0 (t5)
  mov bp, g103
  mov dx, [10]
  mov ax, [bp]
  jmp ax

L65: ; Function: g103
  push word dx
  push word L64
  mov [2], sp
  ;; (0'0) Return: lam_85'19 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L66: ; Arm: 86'13
  ;; (85'15) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L67: ; Continuation
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [2], ax
  ;; (87'41) Tail: app_87'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L68: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L66
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
  push word L67
  mov cx, sp
  ;; (87'11) Tail: loop (g113) @ con_0'0 (t5)
  mov bp, g113
  mov dx, [10]
  mov ax, [bp]
  jmp ax

L69: ; Function: g113
  push word dx
  push word L68
  mov [2], sp
  ;; (0'0) Return: lam_85'19 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L70: ; Arm: 100'13
  ;; (99'15) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L71: ; Continuation
  mov ax, [bp+4]
  sub ax, 1
  mov [2], ax
  ;; (100'41) Tail: app_100'32 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L72: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L70
  push word [bp+2]
  push word '-'
  push word 1
  mov [4], sp
  push word dx
  push word cx
  push word L71
  mov cx, sp
  ;; (100'32) Tail: loop (g132) @ con_0'0 (t2)
  mov bp, g132
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L73: ; Function: g132
  push word dx
  push word L72
  mov [2], sp
  ;; (0'0) Return: lam_99'19 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L74: ; Arm: 86'13
  ;; (85'15) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L75: ; Continuation
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [2], ax
  ;; (87'41) Tail: app_87'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L76: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L74
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
  push word L75
  mov cx, sp
  ;; (87'11) Tail: loop (g137) @ con_0'0 (t5)
  mov bp, g137
  mov dx, [10]
  mov ax, [bp]
  jmp ax

L77: ; Function: g137
  push word dx
  push word L76
  mov [2], sp
  ;; (0'0) Return: lam_85'19 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L78: ; Arm: 86'13
  ;; (85'15) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L79: ; Continuation
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [2], ax
  ;; (87'41) Tail: app_87'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L80: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L78
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
  push word L79
  mov cx, sp
  ;; (87'11) Tail: loop (g147) @ con_0'0 (t5)
  mov bp, g147
  mov dx, [10]
  mov ax, [bp]
  jmp ax

L81: ; Function: g147
  push word dx
  push word L80
  mov [2], sp
  ;; (0'0) Return: lam_85'19 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L82: ; Arm: 86'13
  ;; (85'15) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L83: ; Continuation
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [2], ax
  ;; (87'41) Tail: app_87'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L84: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L82
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
  push word L83
  mov cx, sp
  ;; (87'11) Tail: loop (g150) @ con_0'0 (t5)
  mov bp, g150
  mov dx, [10]
  mov ax, [bp]
  jmp ax

L85: ; Function: g150
  push word dx
  push word L84
  mov [2], sp
  ;; (0'0) Return: lam_85'19 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L86: ; Arm: 86'13
  ;; (85'15) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L87: ; Continuation
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [2], ax
  ;; (87'41) Tail: app_87'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L88: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L86
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
  push word L87
  mov cx, sp
  ;; (87'11) Tail: loop (g160) @ con_0'0 (t5)
  mov bp, g160
  mov dx, [10]
  mov ax, [bp]
  jmp ax

L89: ; Function: g160
  push word dx
  push word L88
  mov [2], sp
  ;; (0'0) Return: lam_85'19 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L90: ; Arm: 86'13
  ;; (85'15) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L91: ; Continuation
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [2], ax
  ;; (87'41) Tail: app_87'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L92: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L90
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
  push word L91
  mov cx, sp
  ;; (87'11) Tail: loop (g163) @ con_0'0 (t5)
  mov bp, g163
  mov dx, [10]
  mov ax, [bp]
  jmp ax

L93: ; Function: g163
  push word dx
  push word L92
  mov [2], sp
  ;; (0'0) Return: lam_85'19 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L94: ; Arm: 86'13
  ;; (85'15) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L95: ; Continuation
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [2], ax
  ;; (87'41) Tail: app_87'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L96: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L94
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
  push word L95
  mov cx, sp
  ;; (87'11) Tail: loop (g166) @ con_0'0 (t5)
  mov bp, g166
  mov dx, [10]
  mov ax, [bp]
  jmp ax

L97: ; Function: g166
  push word dx
  push word L96
  mov [2], sp
  ;; (0'0) Return: lam_85'19 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L98: ; Arm: 86'13
  ;; (85'15) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L99: ; Continuation
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [2], ax
  ;; (87'41) Tail: app_87'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L100: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L98
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
  push word L99
  mov cx, sp
  ;; (87'11) Tail: loop (g183) @ con_0'0 (t5)
  mov bp, g183
  mov dx, [10]
  mov ax, [bp]
  jmp ax

L101: ; Function: g183
  push word dx
  push word L100
  mov [2], sp
  ;; (0'0) Return: lam_85'19 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L102: ; Arm: 86'13
  ;; (85'15) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L103: ; Continuation
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [2], ax
  ;; (87'41) Tail: app_87'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L104: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L102
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
  push word L103
  mov cx, sp
  ;; (87'11) Tail: loop (g193) @ con_0'0 (t5)
  mov bp, g193
  mov dx, [10]
  mov ax, [bp]
  jmp ax

L105: ; Function: g193
  push word dx
  push word L104
  mov [2], sp
  ;; (0'0) Return: lam_85'19 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L106: ; Arm: 86'13
  ;; (85'15) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L107: ; Continuation
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [2], ax
  ;; (87'41) Tail: app_87'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L108: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L106
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
  push word L107
  mov cx, sp
  ;; (87'11) Tail: loop (g211) @ con_0'0 (t5)
  mov bp, g211
  mov dx, [10]
  mov ax, [bp]
  jmp ax

L109: ; Function: g211
  push word dx
  push word L108
  mov [2], sp
  ;; (0'0) Return: lam_85'19 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L110: ; Arm: 86'13
  ;; (85'15) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L111: ; Continuation
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [2], ax
  ;; (87'41) Tail: app_87'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L112: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L110
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
  push word L111
  mov cx, sp
  ;; (87'11) Tail: loop (g221) @ con_0'0 (t5)
  mov bp, g221
  mov dx, [10]
  mov ax, [bp]
  jmp ax

L113: ; Function: g221
  push word dx
  push word L112
  mov [2], sp
  ;; (0'0) Return: lam_85'19 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L114: ; Arm: 86'13
  ;; (85'15) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L115: ; Continuation
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [2], ax
  ;; (87'41) Tail: app_87'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L116: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L114
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
  push word L115
  mov cx, sp
  ;; (87'11) Tail: loop (g243) @ con_0'0 (t5)
  mov bp, g243
  mov dx, [10]
  mov ax, [bp]
  jmp ax

L117: ; Function: g243
  push word dx
  push word L116
  mov [2], sp
  ;; (0'0) Return: lam_85'19 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L118: ; Arm: 86'13
  ;; (85'15) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L119: ; Continuation
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [2], ax
  ;; (87'41) Tail: app_87'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L120: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L118
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
  push word L119
  mov cx, sp
  ;; (87'11) Tail: loop (g253) @ con_0'0 (t5)
  mov bp, g253
  mov dx, [10]
  mov ax, [bp]
  jmp ax

L121: ; Function: g253
  push word dx
  push word L120
  mov [2], sp
  ;; (0'0) Return: lam_85'19 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L122: ; Arm: 86'13
  ;; (85'15) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L123: ; Continuation
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [2], ax
  ;; (87'41) Tail: app_87'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L124: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L122
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
  push word L123
  mov cx, sp
  ;; (87'11) Tail: loop (g256) @ con_0'0 (t5)
  mov bp, g256
  mov dx, [10]
  mov ax, [bp]
  jmp ax

L125: ; Function: g256
  push word dx
  push word L124
  mov [2], sp
  ;; (0'0) Return: lam_85'19 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L126: ; Arm: 86'13
  ;; (85'15) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L127: ; Continuation
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [2], ax
  ;; (87'41) Tail: app_87'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L128: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L126
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
  push word L127
  mov cx, sp
  ;; (87'11) Tail: loop (g266) @ con_0'0 (t5)
  mov bp, g266
  mov dx, [10]
  mov ax, [bp]
  jmp ax

L129: ; Function: g266
  push word dx
  push word L128
  mov [2], sp
  ;; (0'0) Return: lam_85'19 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L130: ; Arm: 86'13
  ;; (85'15) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L131: ; Continuation
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [2], ax
  ;; (87'41) Tail: app_87'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L132: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L130
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
  push word L131
  mov cx, sp
  ;; (87'11) Tail: loop (g274) @ con_0'0 (t5)
  mov bp, g274
  mov dx, [10]
  mov ax, [bp]
  jmp ax

L133: ; Function: g274
  push word dx
  push word L132
  mov [2], sp
  ;; (0'0) Return: lam_85'19 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L134: ; Arm: 86'13
  ;; (85'15) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L135: ; Continuation
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [2], ax
  ;; (87'41) Tail: app_87'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L136: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L134
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
  push word L135
  mov cx, sp
  ;; (87'11) Tail: loop (g284) @ con_0'0 (t5)
  mov bp, g284
  mov dx, [10]
  mov ax, [bp]
  jmp ax

L137: ; Function: g284
  push word dx
  push word L136
  mov [2], sp
  ;; (0'0) Return: lam_85'19 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L138: ; Arm: 86'13
  ;; (85'15) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L139: ; Continuation
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [2], ax
  ;; (87'41) Tail: app_87'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L140: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L138
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
  push word L139
  mov cx, sp
  ;; (87'11) Tail: loop (g302) @ con_0'0 (t5)
  mov bp, g302
  mov dx, [10]
  mov ax, [bp]
  jmp ax

L141: ; Function: g302
  push word dx
  push word L140
  mov [2], sp
  ;; (0'0) Return: lam_85'19 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L142: ; Arm: 86'13
  ;; (85'15) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L143: ; Continuation
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [2], ax
  ;; (87'41) Tail: app_87'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L144: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L142
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
  push word L143
  mov cx, sp
  ;; (87'11) Tail: loop (g312) @ con_0'0 (t5)
  mov bp, g312
  mov dx, [10]
  mov ax, [bp]
  jmp ax

L145: ; Function: g312
  push word dx
  push word L144
  mov [2], sp
  ;; (0'0) Return: lam_85'19 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L146: ; Arm: 86'13
  ;; (85'15) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L147: ; Continuation
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [2], ax
  ;; (87'41) Tail: app_87'11 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L148: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L146
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
  push word L147
  mov cx, sp
  ;; (87'11) Tail: loop (g330) @ con_0'0 (t5)
  mov bp, g330
  mov dx, [10]
  mov ax, [bp]
  jmp ax

L149: ; Function: g330
  push word dx
  push word L148
  mov [2], sp
  ;; (0'0) Return: lam_85'19 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L150: ; Arm: 117'16
  ;; (0'0) Return: con_117'21 (g22)
  mov dx, g22
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L151: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L150
  mov ax, 0
  add ax, [bp+8]
  mov [2], ax
  mov ax, [bp+4]
  mov bx, [2]
  call Bare_get_bytes
  mov [4], ax
  mov ax, [bp+6]
  mov bx, [bp+8]
  mov si, [4]
  call Bare_set_bytes
  mov [6], ax
  mov ax, [bp+8]
  add ax, 1
  mov [8], ax
  ;; (120'11) Tail: loop (f5) @ prim_0'0 (t4)
  mov bp, [bp+10]
  mov dx, [8]
  mov ax, [bp]
  jmp ax

L152: ; Arm: 13'9
  ;; (0'0) Return: con_13'12 (g20)
  mov dx, g20
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L153: ; Function: t2
  mov ax, dx
  cmp word ax, 512
  call Bare_make_bool_from_n
  mov [2], ax
  push word bp
  push word dx
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L151
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L152
  ;; (0'0) Return: con_14'13 (g21)
  mov dx, g21
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L154: ; Arm: 254'16
  ;; (0'0) Return: con_254'21 (g24)
  mov dx, g24
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L155: ; Arm: 100'13
  ;; (99'15) Return: acc (f2)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L156: ; Continuation
  mov ax, [bp+4]
  sub ax, 1
  mov [2], ax
  ;; (100'41) Tail: app_100'32 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L157: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L155
  push word [bp+4]
  push word [bp+2]
  push word 1
  mov [4], sp
  push word dx
  push word cx
  push word L156
  mov cx, sp
  ;; (100'32) Tail: loop (f3) @ con_0'0 (t2)
  mov bp, [bp+6]
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L158: ; Function: t5
  push word bp
  push word dx
  push word [bp+2]
  push word L157
  mov [2], sp
  ;; (0'0) Return: lam_99'19 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L159: ; Continuation
  mov ax, [bp+4]
  add ax, 1
  mov [2], ax
  ;; (257'11) Tail: loop (f3) @ prim_0'0 (t1)
  mov bp, [bp+6]
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L160: ; Continuation
  call Bare_crash "Crash"
  mov [2], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L161: ; Continuation
  push word cx
  push word L160
  mov cx, sp
  ;; (75'29) Tail: put_chars (g8) @ app_75'38 (arg)
  mov bp, g8
  mov dx, dx
  mov ax, [bp]
  jmp ax

L162: ; Continuation
  push word cx
  push word L161
  mov cx, sp
  ;; (75'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L163: ; Continuation
  push word [bp+6]
  push word cx
  push word L162
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L164: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L163
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f4) @ app_33'25 (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L165: ; Continuation
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L164
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f4)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  mov ax, [bp]
  jmp ax

L166: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L165
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g37)
  mov bp, g3
  mov dx, g37
  mov ax, [bp]
  jmp ax

L167: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L166
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L168: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L167
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f4)
  mov dx, [bp+8]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L169: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L168
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_105'26 (g36)
  mov bp, [bp+6]
  mov dx, g36
  mov ax, [bp]
  jmp ax

L170: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L169
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L171: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L170
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f4) @ app_33'25 (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L172: ; Continuation
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L171
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f4)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  mov ax, [bp]
  jmp ax

L173: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L172
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g35)
  mov bp, g3
  mov dx, g35
  mov ax, [bp]
  jmp ax

L174: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L173
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L175: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L174
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ lit_105'42 (g34)
  mov bp, [bp+6]
  mov dx, g34
  mov ax, [bp]
  jmp ax

L176: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L175
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ m (arg)
  mov bp, [bp+6]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L177: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L176
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L178: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L177
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f4) @ app_33'25 (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L179: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L178
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f5)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+10]
  mov ax, [bp]
  jmp ax

L180: ; Continuation
  push word [bp+8]
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L179
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g33)
  mov bp, g3
  mov dx, g33
  mov ax, [bp]
  jmp ax

L181: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L180
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L182: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L181
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f4)
  mov dx, [bp+8]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L183: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L182
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_243'35 (g32)
  mov bp, [bp+6]
  mov dx, g32
  mov ax, [bp]
  jmp ax

L184: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L183
  mov cx, sp
  ;; (96'21) Tail: implode (f2) @ case_89'2 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L185: ; Arm: 89'11
  push word g30
  push word '0'
  push word 1
  mov [4], sp
  ;; (0'0) Return: con_89'17 (t2)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L186: ; Continuation
  ;; (89'35) Tail: app_89'32 (arg) @ i (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L187: ; Arm: 243'23
  mov ax, [bp+10]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L184
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L185
  push word [bp+10]
  push word cx
  push word L186
  mov cx, sp
  ;; (89'32) Tail: loop (g29) @ con_89'32 (g31)
  mov bp, g29
  mov dx, g31
  mov ax, [bp]
  jmp ax

L188: ; Arm: 128'16
  ;; (0'0) Return: con_128'21 (g70)
  mov dx, g70
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L189: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L188
  mov ax, [bp+6]
  mov bx, [bp+10]
  call Bare_get_bytes
  mov [2], ax
  mov ax, [bp+4]
  add ax, [bp+10]
  mov [4], ax
  mov ax, [bp+8]
  mov bx, [4]
  mov si, [2]
  call Bare_set_bytes
  mov [6], ax
  mov ax, [bp+10]
  add ax, 1
  mov [8], ax
  ;; (131'11) Tail: loop (f6) @ prim_0'0 (t4)
  mov bp, [bp+12]
  mov dx, [8]
  mov ax, [bp]
  jmp ax

L190: ; Arm: 13'9
  ;; (0'0) Return: con_13'12 (g68)
  mov dx, g68
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L191: ; Function: t1
  mov ax, dx
  cmp word ax, 64
  call Bare_make_bool_from_n
  mov [2], ax
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L189
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L190
  ;; (0'0) Return: con_14'13 (g69)
  mov dx, g69
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L192: ; Continuation
  ;; SetRef
  mov bx, [bp+4]
  mov [bx], g71
  ;; SetRef-done
  mov [2], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L193: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word L191
  mov [2], sp
  push word [bp+8]
  push word cx
  push word L192
  mov cx, sp
  ;; (133'7) Tail: loop (t1) @ 0
  mov bp, [2]
  mov dx, 0
  mov ax, [bp]
  jmp ax

L194: ; Arm: 205'23
  push word [8]
  push word [bp+14]
  push word [bp+12]
  push word cx
  push word L193
  mov cx, sp
  mov bx, [12]
  mov ax, [bx+2]
  mov [16], ax
  ;; (151'47) Return: x (t8)
  mov dx, [16]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L195: ; Arm: 128'16
  ;; (0'0) Return: con_128'21 (g129)
  mov dx, g129
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L196: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L195
  mov ax, [bp+6]
  mov bx, [bp+10]
  call Bare_get_bytes
  mov [2], ax
  mov ax, [bp+4]
  add ax, [bp+10]
  mov [4], ax
  mov ax, [bp+8]
  mov bx, [4]
  mov si, [2]
  call Bare_set_bytes
  mov [6], ax
  mov ax, [bp+10]
  add ax, 1
  mov [8], ax
  ;; (131'11) Tail: loop (f6) @ prim_0'0 (t4)
  mov bp, [bp+12]
  mov dx, [8]
  mov ax, [bp]
  jmp ax

L197: ; Arm: 13'9
  ;; (0'0) Return: con_13'12 (g127)
  mov dx, g127
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L198: ; Function: t1
  mov ax, dx
  cmp word ax, 64
  call Bare_make_bool_from_n
  mov [2], ax
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L196
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L197
  ;; (0'0) Return: con_14'13 (g128)
  mov dx, g128
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L199: ; Continuation
  ;; MakeRef
  push word g130
  mov ax, sp
  ;; MakeRef-done
  mov [2], ax
  push word [bp+8]
  push word [bp+4]
  push word [2]
  push word 0
  mov [4], sp
  ;; SetRef
  mov bx, [bp+6]
  mov [bx], [4]
  ;; SetRef-done
  mov [6], ax
  ;; (0'0) Return: prim_0'0 (t3)
  mov dx, [6]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L200: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word L198
  mov [2], sp
  push word [bp+12]
  push word [bp+10]
  push word [bp+4]
  push word cx
  push word L199
  mov cx, sp
  ;; (133'7) Tail: loop (t1) @ 0
  mov bp, [2]
  mov dx, 0
  mov ax, [bp]
  jmp ax

L201: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L200
  mov cx, sp
  mov bx, dx
  mov ax, [bx+2]
  mov [2], ax
  ;; (151'47) Return: x (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L202: ; Continuation
  call Bare_crash "Crash"
  mov [2], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L203: ; Continuation
  push word cx
  push word L202
  mov cx, sp
  ;; (75'29) Tail: put_chars (g8) @ app_75'38 (arg)
  mov bp, g8
  mov dx, dx
  mov ax, [bp]
  jmp ax

L204: ; Continuation
  push word cx
  push word L203
  mov cx, sp
  ;; (75'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L205: ; Continuation
  push word [bp+6]
  push word cx
  push word L204
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L206: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L205
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f4) @ app_33'25 (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L207: ; Continuation
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L206
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f4)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  mov ax, [bp]
  jmp ax

L208: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L207
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g111)
  mov bp, g3
  mov dx, g111
  mov ax, [bp]
  jmp ax

L209: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L208
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L210: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L209
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f4)
  mov dx, [bp+8]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L211: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L210
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_105'26 (g110)
  mov bp, [bp+6]
  mov dx, g110
  mov ax, [bp]
  jmp ax

L212: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L211
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L213: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L212
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f4) @ app_33'25 (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L214: ; Continuation
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L213
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f4)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  mov ax, [bp]
  jmp ax

L215: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L214
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g109)
  mov bp, g3
  mov dx, g109
  mov ax, [bp]
  jmp ax

L216: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L215
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L217: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L216
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ lit_105'42 (g108)
  mov bp, [bp+6]
  mov dx, g108
  mov ax, [bp]
  jmp ax

L218: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L217
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ m (arg)
  mov bp, [bp+6]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L219: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L218
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L220: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L219
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f4) @ app_33'25 (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L221: ; Continuation
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L220
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f4)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  mov ax, [bp]
  jmp ax

L222: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L221
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g107)
  mov bp, g3
  mov dx, g107
  mov ax, [bp]
  jmp ax

L223: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L222
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L224: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L223
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f4)
  mov dx, [bp+8]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L225: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L224
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_157'39 (g106)
  mov bp, [bp+6]
  mov dx, g106
  mov ax, [bp]
  jmp ax

L226: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L225
  mov cx, sp
  ;; (96'21) Tail: implode (f2) @ case_89'2 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L227: ; Arm: 89'11
  push word g104
  push word '0'
  push word 1
  mov [4], sp
  ;; (0'0) Return: con_89'17 (t2)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L228: ; Continuation
  ;; (89'35) Tail: app_89'32 (arg) @ seci (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L229: ; Arm: 157'27
  mov ax, [bp+8]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L226
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L227
  push word [bp+8]
  push word cx
  push word L228
  mov cx, sp
  ;; (89'32) Tail: loop (g103) @ con_89'32 (g105)
  mov bp, g103
  mov dx, g105
  mov ax, [bp]
  jmp ax

L230: ; Arm: 117'16
  ;; (0'0) Return: con_117'21 (g126)
  mov dx, g126
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L231: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L230
  mov ax, [bp+6]
  add ax, [bp+10]
  mov [2], ax
  mov ax, [bp+4]
  mov bx, [2]
  call Bare_get_bytes
  mov [4], ax
  mov ax, [bp+8]
  mov bx, [bp+10]
  mov si, [4]
  call Bare_set_bytes
  mov [6], ax
  mov ax, [bp+10]
  add ax, 1
  mov [8], ax
  ;; (120'11) Tail: loop (f6) @ prim_0'0 (t4)
  mov bp, [bp+12]
  mov dx, [8]
  mov ax, [bp]
  jmp ax

L232: ; Arm: 13'9
  ;; (0'0) Return: con_13'12 (g124)
  mov dx, g124
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L233: ; Function: t3
  mov ax, dx
  cmp word ax, 512
  call Bare_make_bool_from_n
  mov [2], ax
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L231
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L232
  ;; (0'0) Return: con_14'13 (g125)
  mov dx, g125
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L234: ; Continuation
  push word [bp+4]
  push word 0
  mov [2], sp
  ;; (0'0) Return: con_159'4 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L235: ; Continuation
  mov ax, [bp+4]
  mul ax, 512
  mov [2], ax
  mov ax, 512
  call Bare_make_bytes
  mov [4], ax
  push word [4]
  push word [2]
  push word dx
  push word L233
  mov [6], sp
  push word [4]
  push word cx
  push word L234
  mov cx, sp
  ;; (122'7) Tail: loop (t3) @ 0
  mov bp, [6]
  mov dx, 0
  mov ax, [bp]
  jmp ax

L236: ; Continuation
  push word [bp+4]
  push word cx
  push word L235
  mov cx, sp
  mov bx, [bp+6]
  mov ax, [bx+2]
  mov [2], ax
  ;; (139'43) Return: x (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L237: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L236
  mov cx, sp
  ;; (75'29) Tail: put_chars (g8) @ app_75'38 (arg)
  mov bp, g8
  mov dx, dx
  mov ax, [bp]
  jmp ax

L238: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L237
  mov cx, sp
  ;; (75'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L239: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L238
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L240: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L239
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f6) @ app_33'25 (arg)
  mov bp, [bp+12]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L241: ; Continuation
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L240
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f6)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  mov ax, [bp]
  jmp ax

L242: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L241
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g123)
  mov bp, g3
  mov dx, g123
  mov ax, [bp]
  jmp ax

L243: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L242
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L244: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L243
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f6)
  mov dx, [bp+12]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L245: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L244
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_107'45 (g122)
  mov bp, [bp+6]
  mov dx, g122
  mov ax, [bp]
  jmp ax

L246: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L245
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L247: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L246
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f6) @ app_33'25 (arg)
  mov bp, [bp+12]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L248: ; Continuation
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L247
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f6)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  mov ax, [bp]
  jmp ax

L249: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L248
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g121)
  mov bp, g3
  mov dx, g121
  mov ax, [bp]
  jmp ax

L250: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L249
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L251: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L250
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ lit_107'61 (g120)
  mov bp, [bp+6]
  mov dx, g120
  mov ax, [bp]
  jmp ax

L252: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L251
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ m (arg)
  mov bp, [bp+6]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L253: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L252
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L254: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L253
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f6) @ app_33'25 (arg)
  mov bp, [bp+12]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L255: ; Continuation
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L254
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f6)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  mov ax, [bp]
  jmp ax

L256: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L255
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g119)
  mov bp, g3
  mov dx, g119
  mov ax, [bp]
  jmp ax

L257: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L256
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L258: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L257
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f6)
  mov dx, [bp+12]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L259: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L258
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_158'21 (g118)
  mov bp, [bp+6]
  mov dx, g118
  mov ax, [bp]
  jmp ax

L260: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L259
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L261: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L260
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f6) @ app_33'25 (arg)
  mov bp, [bp+12]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L262: ; Continuation
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L261
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f6)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  mov ax, [bp]
  jmp ax

L263: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L262
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g117)
  mov bp, g3
  mov dx, g117
  mov ax, [bp]
  jmp ax

L264: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L263
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L265: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L264
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ lit_158'50 (g116)
  mov bp, [bp+6]
  mov dx, g116
  mov ax, [bp]
  jmp ax

L266: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L265
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ s1 (arg)
  mov bp, [bp+6]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L267: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L266
  mov cx, sp
  ;; (96'21) Tail: implode (f2) @ case_89'2 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L268: ; Arm: 89'11
  push word g114
  push word '0'
  push word 1
  mov [4], sp
  ;; (0'0) Return: con_89'17 (t2)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L269: ; Continuation
  ;; (89'35) Tail: app_89'32 (arg) @ seci (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L270: ; Continuation
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word cx
  push word L201
  mov cx, sp
  mov bx, dx
  cmp word [bx], 1
  jz L229
  mov ax, [bp+8]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  push word [bp+14]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L267
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L268
  push word [bp+8]
  push word cx
  push word L269
  mov cx, sp
  ;; (89'32) Tail: loop (g113) @ con_89'32 (g115)
  mov bp, g113
  mov dx, g115
  mov ax, [bp]
  jmp ax

L271: ; Arm: 153'34
  ;; (0'0) Return: con_153'39 (g100)
  mov dx, g100
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L272: ; Arm: 13'9
  ;; (0'0) Return: con_13'12 (g101)
  mov dx, g101
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L273: ; Continuation
  mov ax, [bp+8]
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [2], ax
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L270
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L271
  mov ax, [bp+8]
  cmp word ax, 32
  call Bare_make_bool_from_n
  mov [4], ax
  mov bx, [4]
  cmp word [bx], 1
  jz L272
  ;; (0'0) Return: con_14'13 (g102)
  mov dx, g102
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L274: ; Continuation
  call Bare_crash "Crash"
  mov [2], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L275: ; Continuation
  push word cx
  push word L274
  mov cx, sp
  ;; (75'29) Tail: put_chars (g8) @ app_75'38 (arg)
  mov bp, g8
  mov dx, dx
  mov ax, [bp]
  jmp ax

L276: ; Continuation
  push word cx
  push word L275
  mov cx, sp
  ;; (75'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L277: ; Continuation
  push word [bp+6]
  push word cx
  push word L276
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L278: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L277
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f4) @ app_33'25 (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L279: ; Continuation
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L278
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f4)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  mov ax, [bp]
  jmp ax

L280: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L279
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g83)
  mov bp, g3
  mov dx, g83
  mov ax, [bp]
  jmp ax

L281: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L280
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L282: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L281
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f4)
  mov dx, [bp+8]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L283: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L282
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_105'26 (g82)
  mov bp, [bp+6]
  mov dx, g82
  mov ax, [bp]
  jmp ax

L284: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L283
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L285: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L284
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f4) @ app_33'25 (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L286: ; Continuation
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L285
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f4)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  mov ax, [bp]
  jmp ax

L287: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L286
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g81)
  mov bp, g3
  mov dx, g81
  mov ax, [bp]
  jmp ax

L288: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L287
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L289: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L288
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ lit_105'42 (g80)
  mov bp, [bp+6]
  mov dx, g80
  mov ax, [bp]
  jmp ax

L290: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L289
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ m (arg)
  mov bp, [bp+6]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L291: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L290
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L292: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L291
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f4) @ app_33'25 (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L293: ; Continuation
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L292
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f4)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  mov ax, [bp]
  jmp ax

L294: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L293
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g79)
  mov bp, g3
  mov dx, g79
  mov ax, [bp]
  jmp ax

L295: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L294
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L296: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L295
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f4)
  mov dx, [bp+8]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L297: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L296
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_163'39 (g78)
  mov bp, [bp+6]
  mov dx, g78
  mov ax, [bp]
  jmp ax

L298: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L297
  mov cx, sp
  ;; (96'21) Tail: implode (f2) @ case_89'2 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L299: ; Arm: 89'11
  push word g76
  push word '0'
  push word 1
  mov [4], sp
  ;; (0'0) Return: con_89'17 (t2)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L300: ; Continuation
  ;; (89'35) Tail: app_89'32 (arg) @ secj (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L301: ; Arm: 163'27
  mov ax, [bp+10]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L298
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L299
  push word [bp+10]
  push word cx
  push word L300
  mov cx, sp
  ;; (89'32) Tail: loop (g75) @ con_89'32 (g77)
  mov bp, g75
  mov dx, g77
  mov ax, [bp]
  jmp ax

L302: ; Arm: 128'16
  ;; (0'0) Return: con_128'21 (g98)
  mov dx, g98
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L303: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L302
  mov ax, [bp+8]
  mov bx, [bp+10]
  call Bare_get_bytes
  mov [2], ax
  mov ax, [bp+6]
  add ax, [bp+10]
  mov [4], ax
  mov ax, [bp+4]
  mov bx, [4]
  mov si, [2]
  call Bare_set_bytes
  mov [6], ax
  mov ax, [bp+10]
  add ax, 1
  mov [8], ax
  ;; (131'11) Tail: loop (f6) @ prim_0'0 (t4)
  mov bp, [bp+12]
  mov dx, [8]
  mov ax, [bp]
  jmp ax

L304: ; Arm: 13'9
  ;; (0'0) Return: con_13'12 (g96)
  mov dx, g96
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L305: ; Function: t1
  mov ax, dx
  cmp word ax, 512
  call Bare_make_bool_from_n
  mov [2], ax
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L303
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L304
  ;; (0'0) Return: con_14'13 (g97)
  mov dx, g97
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L306: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word L305
  mov [2], sp
  ;; (133'7) Tail: loop (t1) @ 0
  mov bp, [2]
  mov dx, 0
  mov ax, [bp]
  jmp ax

L307: ; Continuation
  mov ax, [bp+4]
  mul ax, 512
  mov [2], ax
  push word [2]
  push word dx
  push word cx
  push word L306
  mov cx, sp
  mov bx, [bp+6]
  mov ax, [bx+2]
  mov [4], ax
  ;; (151'47) Return: x (t2)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L308: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L307
  mov cx, sp
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [2], ax
  ;; (139'43) Return: x (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L309: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L308
  mov cx, sp
  ;; (75'29) Tail: put_chars (g8) @ app_75'38 (arg)
  mov bp, g8
  mov dx, dx
  mov ax, [bp]
  jmp ax

L310: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L309
  mov cx, sp
  ;; (75'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L311: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L310
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L312: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L311
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f7) @ app_33'25 (arg)
  mov bp, [bp+14]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L313: ; Continuation
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L312
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f7)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  mov ax, [bp]
  jmp ax

L314: ; Continuation
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L313
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g95)
  mov bp, g3
  mov dx, g95
  mov ax, [bp]
  jmp ax

L315: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L314
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L316: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L315
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f7)
  mov dx, [bp+14]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L317: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L316
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_107'45 (g94)
  mov bp, [bp+6]
  mov dx, g94
  mov ax, [bp]
  jmp ax

L318: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L317
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L319: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L318
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f7) @ app_33'25 (arg)
  mov bp, [bp+14]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L320: ; Continuation
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L319
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f7)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  mov ax, [bp]
  jmp ax

L321: ; Continuation
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L320
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g93)
  mov bp, g3
  mov dx, g93
  mov ax, [bp]
  jmp ax

L322: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L321
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L323: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L322
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ lit_107'61 (g92)
  mov bp, [bp+6]
  mov dx, g92
  mov ax, [bp]
  jmp ax

L324: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L323
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ m (arg)
  mov bp, [bp+6]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L325: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L324
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L326: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L325
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f7) @ app_33'25 (arg)
  mov bp, [bp+14]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L327: ; Continuation
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L326
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f7)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  mov ax, [bp]
  jmp ax

L328: ; Continuation
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L327
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g91)
  mov bp, g3
  mov dx, g91
  mov ax, [bp]
  jmp ax

L329: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L328
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L330: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L329
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f7)
  mov dx, [bp+14]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L331: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L330
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_164'21 (g90)
  mov bp, [bp+6]
  mov dx, g90
  mov ax, [bp]
  jmp ax

L332: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L331
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L333: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L332
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f7) @ app_33'25 (arg)
  mov bp, [bp+14]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L334: ; Continuation
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L333
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f7)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  mov ax, [bp]
  jmp ax

L335: ; Continuation
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L334
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g89)
  mov bp, g3
  mov dx, g89
  mov ax, [bp]
  jmp ax

L336: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L335
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L337: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L336
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ lit_164'51 (g88)
  mov bp, [bp+6]
  mov dx, g88
  mov ax, [bp]
  jmp ax

L338: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L337
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ s1 (arg)
  mov bp, [bp+6]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L339: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L338
  mov cx, sp
  ;; (96'21) Tail: implode (f2) @ case_89'2 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L340: ; Arm: 89'11
  push word g86
  push word '0'
  push word 1
  mov [4], sp
  ;; (0'0) Return: con_89'17 (t2)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L341: ; Continuation
  ;; (89'35) Tail: app_89'32 (arg) @ secj (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L342: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L301
  mov ax, [bp+10]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L339
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L340
  push word [bp+10]
  push word cx
  push word L341
  mov cx, sp
  ;; (89'32) Tail: loop (g85) @ con_89'32 (g87)
  mov bp, g85
  mov dx, g87
  mov ax, [bp]
  jmp ax

L343: ; Arm: 153'34
  ;; (0'0) Return: con_153'39 (g72)
  mov dx, g72
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L344: ; Arm: 13'9
  ;; (0'0) Return: con_13'12 (g73)
  mov dx, g73
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L345: ; Arm: 209'34
  mov ax, [10]
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [18], ax
  push word [12]
  push word [10]
  push word [2]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L342
  mov cx, sp
  mov bx, [18]
  cmp word [bx], 1
  jz L343
  mov ax, [10]
  cmp word ax, 32
  call Bare_make_bool_from_n
  mov [20], ax
  mov bx, [20]
  cmp word [bx], 1
  jz L344
  ;; (0'0) Return: con_14'13 (g74)
  mov dx, g74
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L346: ; Continuation
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  ;; DeRef
  mov bx, [4]
  mov ax, [bx]
  ;; DeRef-done
  mov [6], ax
  mov bx, [6]
  mov ax, [bx+2]
  mov [8], ax
  mov ax, [bx+4]
  mov [10], ax
  mov ax, [bx+6]
  mov [12], ax
  mov ax, [bp+10]
  cmp word ax, [10]
  call Bare_make_bool_from_z
  mov [14], ax
  mov bx, [14]
  cmp word [bx], 1
  jz L194
  ;; DeRef
  mov bx, [8]
  mov ax, [bx]
  ;; DeRef-done
  mov [16], ax
  push word [4]
  push word [2]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L273
  mov cx, sp
  mov bx, [16]
  cmp word [bx], 1
  jz L345
  ;; (0'0) Return: con_209'74 (g99)
  mov dx, g99
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L347: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L346
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L348: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L347
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f8) @ app_33'25 (arg)
  mov bp, [bp+16]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L349: ; Continuation
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L348
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f8)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+16]
  mov ax, [bp]
  jmp ax

L350: ; Continuation
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L349
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g67)
  mov bp, g3
  mov dx, g67
  mov ax, [bp]
  jmp ax

L351: ; Continuation
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L350
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L352: ; Continuation
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L351
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f8)
  mov dx, [bp+16]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L353: ; Continuation
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L352
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_199'9 (g66)
  mov bp, [bp+6]
  mov dx, g66
  mov ax, [bp]
  jmp ax

L354: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L353
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L355: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L354
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f8) @ app_33'25 (arg)
  mov bp, [bp+16]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L356: ; Continuation
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L355
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f8)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+16]
  mov ax, [bp]
  jmp ax

L357: ; Continuation
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L356
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g65)
  mov bp, g3
  mov dx, g65
  mov ax, [bp]
  jmp ax

L358: ; Continuation
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L357
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L359: ; Continuation
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L358
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f8)
  mov dx, [bp+16]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L360: ; Continuation
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L359
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ s1 (f8)
  mov dx, [bp+16]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L361: ; Continuation
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L360
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L362: ; Continuation
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L361
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f9) @ app_33'25 (arg)
  mov bp, [bp+18]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L363: ; Continuation
  push word [bp+20]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L362
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f9)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+18]
  mov ax, [bp]
  jmp ax

L364: ; Continuation
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L363
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g64)
  mov bp, g3
  mov dx, g64
  mov ax, [bp]
  jmp ax

L365: ; Continuation
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L364
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L366: ; Continuation
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L365
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f9)
  mov dx, [bp+18]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L367: ; Continuation
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L366
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_199'47 (g63)
  mov bp, [bp+6]
  mov dx, g63
  mov ax, [bp]
  jmp ax

L368: ; Continuation
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L367
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L369: ; Continuation
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L368
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f9) @ app_33'25 (arg)
  mov bp, [bp+18]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L370: ; Continuation
  push word [bp+20]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L369
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f9)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+18]
  mov ax, [bp]
  jmp ax

L371: ; Continuation
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L370
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g62)
  mov bp, g3
  mov dx, g62
  mov ax, [bp]
  jmp ax

L372: ; Continuation
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L371
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L373: ; Continuation
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L372
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f9)
  mov dx, [bp+18]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L374: ; Continuation
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L373
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ s1 (f9)
  mov dx, [bp+18]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L375: ; Continuation
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L374
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L376: ; Continuation
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L375
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f10) @ app_33'25 (arg)
  mov bp, [bp+20]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L377: ; Continuation
  push word [bp+22]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L376
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f10)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+20]
  mov ax, [bp]
  jmp ax

L378: ; Continuation
  push word dx
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L377
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g61)
  mov bp, g3
  mov dx, g61
  mov ax, [bp]
  jmp ax

L379: ; Continuation
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L378
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L380: ; Continuation
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L379
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f10)
  mov dx, [bp+20]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L381: ; Continuation
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L380
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_199'75 (g60)
  mov bp, [bp+6]
  mov dx, g60
  mov ax, [bp]
  jmp ax

L382: ; Continuation
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L381
  mov cx, sp
  ;; (96'21) Tail: implode (f2) @ app_89'35 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L383: ; Continuation
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L382
  mov cx, sp
  ;; (89'35) Tail: app_89'32 (arg) @ 64
  mov bp, dx
  mov dx, 64
  mov ax, [bp]
  jmp ax

L384: ; Continuation
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L383
  mov cx, sp
  ;; (89'32) Tail: loop (g58) @ con_89'32 (g59)
  mov bp, g58
  mov dx, g59
  mov ax, [bp]
  jmp ax

L385: ; Continuation
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L384
  mov cx, sp
  ;; (96'21) Tail: implode (f2) @ case_89'2 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L386: ; Arm: 89'11
  push word g56
  push word '0'
  push word 1
  mov [4], sp
  ;; (0'0) Return: con_89'17 (t2)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L387: ; Continuation
  ;; (89'35) Tail: app_89'32 (arg) @ offset (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L388: ; Continuation
  mov ax, [bp+12]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L385
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L386
  push word [bp+12]
  push word cx
  push word L387
  mov cx, sp
  ;; (89'32) Tail: loop (g55) @ con_89'32 (g57)
  mov bp, g55
  mov dx, g57
  mov ax, [bp]
  jmp ax

L389: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L388
  mov cx, sp
  ;; (96'21) Tail: implode (f2) @ case_89'2 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L390: ; Arm: 89'11
  push word g53
  push word '0'
  push word 1
  mov [4], sp
  ;; (0'0) Return: con_89'17 (t2)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L391: ; Continuation
  ;; (89'35) Tail: app_89'32 (arg) @ seci (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L392: ; Continuation
  mov ax, [bp+10]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L389
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L390
  push word [bp+10]
  push word cx
  push word L391
  mov cx, sp
  ;; (89'32) Tail: loop (g52) @ con_89'32 (g54)
  mov bp, g52
  mov dx, g54
  mov ax, [bp]
  jmp ax

L393: ; Continuation
  mov ax, [bp+10]
  mov bx, 8
  call Bare_mod
  mov [2], ax
  mov ax, 64
  mul ax, [2]
  mov [4], ax
  push word [4]
  push word [bp+14]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L392
  mov cx, sp
  mov bx, [bp+12]
  mov ax, [bx+2]
  mov [6], ax
  ;; (226'45) Return: x (t3)
  mov dx, [6]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L394: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L393
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L395: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L394
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f8) @ app_33'25 (arg)
  mov bp, [bp+16]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L396: ; Continuation
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L395
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f8)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+16]
  mov ax, [bp]
  jmp ax

L397: ; Continuation
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L396
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g51)
  mov bp, g3
  mov dx, g51
  mov ax, [bp]
  jmp ax

L398: ; Continuation
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L397
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L399: ; Continuation
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L398
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f8)
  mov dx, [bp+16]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L400: ; Continuation
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L399
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_245'20 (g50)
  mov bp, [bp+6]
  mov dx, g50
  mov ax, [bp]
  jmp ax

L401: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L400
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
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
  ;; (35'28) Tail: app_35'25 (f8) @ app_33'25 (arg)
  mov bp, [bp+16]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L403: ; Continuation
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L402
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f8)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+16]
  mov ax, [bp]
  jmp ax

L404: ; Continuation
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L403
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g49)
  mov bp, g3
  mov dx, g49
  mov ax, [bp]
  jmp ax

L405: ; Continuation
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L404
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L406: ; Continuation
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L405
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f8)
  mov dx, [bp+16]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L407: ; Continuation
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L406
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ s1 (f8)
  mov dx, [bp+16]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L408: ; Continuation
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L407
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L409: ; Continuation
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L408
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f9) @ app_33'25 (arg)
  mov bp, [bp+18]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L410: ; Continuation
  push word [bp+20]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L409
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f9)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+18]
  mov ax, [bp]
  jmp ax

L411: ; Continuation
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L410
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g48)
  mov bp, g3
  mov dx, g48
  mov ax, [bp]
  jmp ax

L412: ; Continuation
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L411
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L413: ; Continuation
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L412
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f9)
  mov dx, [bp+18]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L414: ; Continuation
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L413
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_230'21 (g47)
  mov bp, [bp+6]
  mov dx, g47
  mov ax, [bp]
  jmp ax

L415: ; Continuation
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L414
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L416: ; Continuation
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L415
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f9) @ app_33'25 (arg)
  mov bp, [bp+18]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L417: ; Continuation
  push word [bp+20]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L416
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f9)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+18]
  mov ax, [bp]
  jmp ax

L418: ; Continuation
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L417
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g46)
  mov bp, g3
  mov dx, g46
  mov ax, [bp]
  jmp ax

L419: ; Continuation
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L418
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L420: ; Continuation
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L419
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ lit_230'39 (g45)
  mov bp, [bp+6]
  mov dx, g45
  mov ax, [bp]
  jmp ax

L421: ; Continuation
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L420
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ s1 (arg)
  mov bp, [bp+6]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L422: ; Continuation
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L421
  mov cx, sp
  ;; (96'21) Tail: implode (f2) @ case_89'2 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L423: ; Arm: 89'11
  push word g43
  push word '0'
  push word 1
  mov [4], sp
  ;; (0'0) Return: con_89'17 (t2)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L424: ; Continuation
  ;; (89'35) Tail: app_89'32 (arg) @ seci (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L425: ; Continuation
  mov ax, [bp+14]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L422
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L423
  push word [bp+14]
  push word cx
  push word L424
  mov cx, sp
  ;; (89'32) Tail: loop (g42) @ con_89'32 (g44)
  mov bp, g42
  mov dx, g44
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
  ;; (96'21) Tail: implode (f2) @ case_89'2 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L427: ; Arm: 89'11
  push word g40
  push word '0'
  push word 1
  mov [6], sp
  ;; (0'0) Return: con_89'17 (t3)
  mov dx, [6]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L428: ; Continuation
  ;; (89'35) Tail: app_89'32 (arg) @ i (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L429: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word cx
  push word L159
  mov cx, sp
  mov bx, dx
  cmp word [bx], 1
  jz L187
  mov ax, [bp+10]
  mov bx, 8
  call Bare_div
  mov [2], ax
  mov ax, [bp+10]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [4], ax
  push word [2]
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L426
  mov cx, sp
  mov bx, [4]
  cmp word [bx], 1
  jz L427
  push word [bp+10]
  push word cx
  push word L428
  mov cx, sp
  ;; (89'32) Tail: loop (g39) @ con_89'32 (g41)
  mov bp, g39
  mov dx, g41
  mov ax, [bp]
  jmp ax

L430: ; Arm: 228'33
  ;; (0'0) Return: con_228'38 (g26)
  mov dx, g26
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L431: ; Arm: 13'9
  ;; (0'0) Return: con_13'12 (g27)
  mov dx, g27
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L432: ; Continuation
  mov ax, dx
  mov [2], ax
  push word [2]
  push word 0
  mov [4], sp
  mov ax, [bp+10]
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [6], ax
  push word [4]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L429
  mov cx, sp
  mov bx, [6]
  cmp word [bx], 1
  jz L430
  mov ax, [bp+10]
  cmp word ax, 256
  call Bare_make_bool_from_n
  mov [8], ax
  mov bx, [8]
  cmp word [bx], 1
  jz L431
  ;; (0'0) Return: con_14'13 (g28)
  mov dx, g28
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L433: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L432
  mov cx, sp
  ;; (256'62) Tail: implode (f2) @ app_256'78 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L434: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L433
  mov cx, sp
  ;; (256'78) Tail: app_102'7 (arg) @ 64
  mov bp, dx
  mov dx, 64
  mov ax, [bp]
  jmp ax

L435: ; Function: t6
  mov ax, 124
  cmp word ax, dx
  call Bare_make_bool_from_n
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L154
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
  push word [8]
  push word L158
  mov [10], sp
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L434
  mov cx, sp
  ;; (102'7) Tail: loop (t5) @ con_102'7 (g25)
  mov bp, [10]
  mov dx, g25
  mov ax, [bp]
  jmp ax

L436: ; Arm: 263'16
  ;; (0'0) Return: con_263'21 (g131)
  mov dx, g131
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L437: ; Continuation
  mov ax, [bp+4]
  add ax, 1
  mov [2], ax
  ;; (266'11) Tail: loop (f3) @ prim_0'0 (t1)
  mov bp, [bp+6]
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L438: ; Continuation
  call Bare_crash "Crash"
  mov [2], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L439: ; Continuation
  push word cx
  push word L438
  mov cx, sp
  ;; (75'29) Tail: put_chars (g8) @ app_75'38 (arg)
  mov bp, g8
  mov dx, dx
  mov ax, [bp]
  jmp ax

L440: ; Continuation
  push word cx
  push word L439
  mov cx, sp
  ;; (75'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L441: ; Continuation
  push word [bp+6]
  push word cx
  push word L440
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L442: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L441
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f4) @ app_33'25 (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L443: ; Continuation
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L442
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f4)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  mov ax, [bp]
  jmp ax

L444: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L443
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g145)
  mov bp, g3
  mov dx, g145
  mov ax, [bp]
  jmp ax

L445: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L444
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L446: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L445
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f4)
  mov dx, [bp+8]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L447: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L446
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_105'26 (g144)
  mov bp, [bp+6]
  mov dx, g144
  mov ax, [bp]
  jmp ax

L448: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L447
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L449: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L448
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f4) @ app_33'25 (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L450: ; Continuation
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L449
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f4)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  mov ax, [bp]
  jmp ax

L451: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L450
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g143)
  mov bp, g3
  mov dx, g143
  mov ax, [bp]
  jmp ax

L452: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L451
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L453: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L452
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ lit_105'42 (g142)
  mov bp, [bp+6]
  mov dx, g142
  mov ax, [bp]
  jmp ax

L454: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L453
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ m (arg)
  mov bp, [bp+6]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L455: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L454
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L456: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L455
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f4) @ app_33'25 (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L457: ; Continuation
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L456
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f4)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  mov ax, [bp]
  jmp ax

L458: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L457
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g141)
  mov bp, g3
  mov dx, g141
  mov ax, [bp]
  jmp ax

L459: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L458
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L460: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L459
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f4)
  mov dx, [bp+8]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L461: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L460
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_243'35 (g140)
  mov bp, [bp+6]
  mov dx, g140
  mov ax, [bp]
  jmp ax

L462: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L461
  mov cx, sp
  ;; (96'21) Tail: implode (f2) @ case_89'2 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L463: ; Arm: 89'11
  push word g138
  push word '0'
  push word 1
  mov [4], sp
  ;; (0'0) Return: con_89'17 (t2)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L464: ; Continuation
  ;; (89'35) Tail: app_89'32 (arg) @ i (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L465: ; Arm: 243'23
  mov ax, [bp+10]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L462
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L463
  push word [bp+10]
  push word cx
  push word L464
  mov cx, sp
  ;; (89'32) Tail: loop (g137) @ con_89'32 (g139)
  mov bp, g137
  mov dx, g139
  mov ax, [bp]
  jmp ax

L466: ; Arm: 128'16
  ;; (0'0) Return: con_128'21 (g178)
  mov dx, g178
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L467: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L466
  mov ax, [bp+6]
  mov bx, [bp+10]
  call Bare_get_bytes
  mov [2], ax
  mov ax, [bp+4]
  add ax, [bp+10]
  mov [4], ax
  mov ax, [bp+8]
  mov bx, [4]
  mov si, [2]
  call Bare_set_bytes
  mov [6], ax
  mov ax, [bp+10]
  add ax, 1
  mov [8], ax
  ;; (131'11) Tail: loop (f6) @ prim_0'0 (t4)
  mov bp, [bp+12]
  mov dx, [8]
  mov ax, [bp]
  jmp ax

L468: ; Arm: 13'9
  ;; (0'0) Return: con_13'12 (g176)
  mov dx, g176
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L469: ; Function: t1
  mov ax, dx
  cmp word ax, 64
  call Bare_make_bool_from_n
  mov [2], ax
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L467
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L468
  ;; (0'0) Return: con_14'13 (g177)
  mov dx, g177
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L470: ; Continuation
  ;; SetRef
  mov bx, [bp+4]
  mov [bx], g179
  ;; SetRef-done
  mov [2], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L471: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word L469
  mov [2], sp
  push word [bp+8]
  push word cx
  push word L470
  mov cx, sp
  ;; (133'7) Tail: loop (t1) @ 0
  mov bp, [2]
  mov dx, 0
  mov ax, [bp]
  jmp ax

L472: ; Arm: 205'23
  push word [8]
  push word [bp+14]
  push word [bp+12]
  push word cx
  push word L471
  mov cx, sp
  mov bx, [12]
  mov ax, [bx+2]
  mov [16], ax
  ;; (151'47) Return: x (t8)
  mov dx, [16]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L473: ; Arm: 128'16
  ;; (0'0) Return: con_128'21 (g237)
  mov dx, g237
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L474: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L473
  mov ax, [bp+6]
  mov bx, [bp+10]
  call Bare_get_bytes
  mov [2], ax
  mov ax, [bp+4]
  add ax, [bp+10]
  mov [4], ax
  mov ax, [bp+8]
  mov bx, [4]
  mov si, [2]
  call Bare_set_bytes
  mov [6], ax
  mov ax, [bp+10]
  add ax, 1
  mov [8], ax
  ;; (131'11) Tail: loop (f6) @ prim_0'0 (t4)
  mov bp, [bp+12]
  mov dx, [8]
  mov ax, [bp]
  jmp ax

L475: ; Arm: 13'9
  ;; (0'0) Return: con_13'12 (g235)
  mov dx, g235
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L476: ; Function: t1
  mov ax, dx
  cmp word ax, 64
  call Bare_make_bool_from_n
  mov [2], ax
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L474
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L475
  ;; (0'0) Return: con_14'13 (g236)
  mov dx, g236
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L477: ; Continuation
  ;; MakeRef
  push word g238
  mov ax, sp
  ;; MakeRef-done
  mov [2], ax
  push word [bp+8]
  push word [bp+4]
  push word [2]
  push word 0
  mov [4], sp
  ;; SetRef
  mov bx, [bp+6]
  mov [bx], [4]
  ;; SetRef-done
  mov [6], ax
  ;; (0'0) Return: prim_0'0 (t3)
  mov dx, [6]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L478: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word L476
  mov [2], sp
  push word [bp+12]
  push word [bp+10]
  push word [bp+4]
  push word cx
  push word L477
  mov cx, sp
  ;; (133'7) Tail: loop (t1) @ 0
  mov bp, [2]
  mov dx, 0
  mov ax, [bp]
  jmp ax

L479: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L478
  mov cx, sp
  mov bx, dx
  mov ax, [bx+2]
  mov [2], ax
  ;; (151'47) Return: x (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L480: ; Continuation
  call Bare_crash "Crash"
  mov [2], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L481: ; Continuation
  push word cx
  push word L480
  mov cx, sp
  ;; (75'29) Tail: put_chars (g8) @ app_75'38 (arg)
  mov bp, g8
  mov dx, dx
  mov ax, [bp]
  jmp ax

L482: ; Continuation
  push word cx
  push word L481
  mov cx, sp
  ;; (75'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L483: ; Continuation
  push word [bp+6]
  push word cx
  push word L482
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L484: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L483
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f4) @ app_33'25 (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L485: ; Continuation
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L484
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f4)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  mov ax, [bp]
  jmp ax

L486: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L485
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g219)
  mov bp, g3
  mov dx, g219
  mov ax, [bp]
  jmp ax

L487: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L486
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L488: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L487
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f4)
  mov dx, [bp+8]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L489: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L488
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_105'26 (g218)
  mov bp, [bp+6]
  mov dx, g218
  mov ax, [bp]
  jmp ax

L490: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L489
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L491: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L490
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f4) @ app_33'25 (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L492: ; Continuation
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L491
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f4)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  mov ax, [bp]
  jmp ax

L493: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L492
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g217)
  mov bp, g3
  mov dx, g217
  mov ax, [bp]
  jmp ax

L494: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L493
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L495: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L494
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ lit_105'42 (g216)
  mov bp, [bp+6]
  mov dx, g216
  mov ax, [bp]
  jmp ax

L496: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L495
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ m (arg)
  mov bp, [bp+6]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L497: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L496
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L498: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L497
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f4) @ app_33'25 (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L499: ; Continuation
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L498
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f4)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  mov ax, [bp]
  jmp ax

L500: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L499
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g215)
  mov bp, g3
  mov dx, g215
  mov ax, [bp]
  jmp ax

L501: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L500
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L502: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L501
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f4)
  mov dx, [bp+8]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L503: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L502
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_157'39 (g214)
  mov bp, [bp+6]
  mov dx, g214
  mov ax, [bp]
  jmp ax

L504: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L503
  mov cx, sp
  ;; (96'21) Tail: implode (f2) @ case_89'2 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L505: ; Arm: 89'11
  push word g212
  push word '0'
  push word 1
  mov [4], sp
  ;; (0'0) Return: con_89'17 (t2)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L506: ; Continuation
  ;; (89'35) Tail: app_89'32 (arg) @ seci (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L507: ; Arm: 157'27
  mov ax, [bp+8]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L504
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L505
  push word [bp+8]
  push word cx
  push word L506
  mov cx, sp
  ;; (89'32) Tail: loop (g211) @ con_89'32 (g213)
  mov bp, g211
  mov dx, g213
  mov ax, [bp]
  jmp ax

L508: ; Arm: 117'16
  ;; (0'0) Return: con_117'21 (g234)
  mov dx, g234
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L509: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L508
  mov ax, [bp+6]
  add ax, [bp+10]
  mov [2], ax
  mov ax, [bp+4]
  mov bx, [2]
  call Bare_get_bytes
  mov [4], ax
  mov ax, [bp+8]
  mov bx, [bp+10]
  mov si, [4]
  call Bare_set_bytes
  mov [6], ax
  mov ax, [bp+10]
  add ax, 1
  mov [8], ax
  ;; (120'11) Tail: loop (f6) @ prim_0'0 (t4)
  mov bp, [bp+12]
  mov dx, [8]
  mov ax, [bp]
  jmp ax

L510: ; Arm: 13'9
  ;; (0'0) Return: con_13'12 (g232)
  mov dx, g232
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L511: ; Function: t3
  mov ax, dx
  cmp word ax, 512
  call Bare_make_bool_from_n
  mov [2], ax
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L509
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L510
  ;; (0'0) Return: con_14'13 (g233)
  mov dx, g233
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L512: ; Continuation
  push word [bp+4]
  push word 0
  mov [2], sp
  ;; (0'0) Return: con_159'4 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L513: ; Continuation
  mov ax, [bp+4]
  mul ax, 512
  mov [2], ax
  mov ax, 512
  call Bare_make_bytes
  mov [4], ax
  push word [4]
  push word [2]
  push word dx
  push word L511
  mov [6], sp
  push word [4]
  push word cx
  push word L512
  mov cx, sp
  ;; (122'7) Tail: loop (t3) @ 0
  mov bp, [6]
  mov dx, 0
  mov ax, [bp]
  jmp ax

L514: ; Continuation
  push word [bp+4]
  push word cx
  push word L513
  mov cx, sp
  mov bx, [bp+6]
  mov ax, [bx+2]
  mov [2], ax
  ;; (139'43) Return: x (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L515: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L514
  mov cx, sp
  ;; (75'29) Tail: put_chars (g8) @ app_75'38 (arg)
  mov bp, g8
  mov dx, dx
  mov ax, [bp]
  jmp ax

L516: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L515
  mov cx, sp
  ;; (75'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L517: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L516
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L518: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L517
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f6) @ app_33'25 (arg)
  mov bp, [bp+12]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L519: ; Continuation
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L518
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f6)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  mov ax, [bp]
  jmp ax

L520: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L519
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g231)
  mov bp, g3
  mov dx, g231
  mov ax, [bp]
  jmp ax

L521: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L520
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L522: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L521
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f6)
  mov dx, [bp+12]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L523: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L522
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_107'45 (g230)
  mov bp, [bp+6]
  mov dx, g230
  mov ax, [bp]
  jmp ax

L524: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L523
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L525: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L524
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f6) @ app_33'25 (arg)
  mov bp, [bp+12]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L526: ; Continuation
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L525
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f6)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  mov ax, [bp]
  jmp ax

L527: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L526
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g229)
  mov bp, g3
  mov dx, g229
  mov ax, [bp]
  jmp ax

L528: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L527
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L529: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L528
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ lit_107'61 (g228)
  mov bp, [bp+6]
  mov dx, g228
  mov ax, [bp]
  jmp ax

L530: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L529
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ m (arg)
  mov bp, [bp+6]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L531: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L530
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L532: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L531
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f6) @ app_33'25 (arg)
  mov bp, [bp+12]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L533: ; Continuation
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L532
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f6)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  mov ax, [bp]
  jmp ax

L534: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L533
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g227)
  mov bp, g3
  mov dx, g227
  mov ax, [bp]
  jmp ax

L535: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L534
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L536: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L535
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f6)
  mov dx, [bp+12]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L537: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L536
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_158'21 (g226)
  mov bp, [bp+6]
  mov dx, g226
  mov ax, [bp]
  jmp ax

L538: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L537
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L539: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L538
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f6) @ app_33'25 (arg)
  mov bp, [bp+12]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L540: ; Continuation
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L539
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f6)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  mov ax, [bp]
  jmp ax

L541: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L540
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g225)
  mov bp, g3
  mov dx, g225
  mov ax, [bp]
  jmp ax

L542: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L541
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L543: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L542
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ lit_158'50 (g224)
  mov bp, [bp+6]
  mov dx, g224
  mov ax, [bp]
  jmp ax

L544: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L543
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ s1 (arg)
  mov bp, [bp+6]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L545: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L544
  mov cx, sp
  ;; (96'21) Tail: implode (f2) @ case_89'2 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L546: ; Arm: 89'11
  push word g222
  push word '0'
  push word 1
  mov [4], sp
  ;; (0'0) Return: con_89'17 (t2)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L547: ; Continuation
  ;; (89'35) Tail: app_89'32 (arg) @ seci (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L548: ; Continuation
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word cx
  push word L479
  mov cx, sp
  mov bx, dx
  cmp word [bx], 1
  jz L507
  mov ax, [bp+8]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  push word [bp+14]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L545
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L546
  push word [bp+8]
  push word cx
  push word L547
  mov cx, sp
  ;; (89'32) Tail: loop (g221) @ con_89'32 (g223)
  mov bp, g221
  mov dx, g223
  mov ax, [bp]
  jmp ax

L549: ; Arm: 153'34
  ;; (0'0) Return: con_153'39 (g208)
  mov dx, g208
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L550: ; Arm: 13'9
  ;; (0'0) Return: con_13'12 (g209)
  mov dx, g209
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L551: ; Continuation
  mov ax, [bp+8]
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [2], ax
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L548
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L549
  mov ax, [bp+8]
  cmp word ax, 32
  call Bare_make_bool_from_n
  mov [4], ax
  mov bx, [4]
  cmp word [bx], 1
  jz L550
  ;; (0'0) Return: con_14'13 (g210)
  mov dx, g210
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L552: ; Continuation
  call Bare_crash "Crash"
  mov [2], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L553: ; Continuation
  push word cx
  push word L552
  mov cx, sp
  ;; (75'29) Tail: put_chars (g8) @ app_75'38 (arg)
  mov bp, g8
  mov dx, dx
  mov ax, [bp]
  jmp ax

L554: ; Continuation
  push word cx
  push word L553
  mov cx, sp
  ;; (75'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L555: ; Continuation
  push word [bp+6]
  push word cx
  push word L554
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L556: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L555
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f4) @ app_33'25 (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L557: ; Continuation
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L556
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f4)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  mov ax, [bp]
  jmp ax

L558: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L557
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g191)
  mov bp, g3
  mov dx, g191
  mov ax, [bp]
  jmp ax

L559: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L558
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L560: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L559
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f4)
  mov dx, [bp+8]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L561: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L560
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_105'26 (g190)
  mov bp, [bp+6]
  mov dx, g190
  mov ax, [bp]
  jmp ax

L562: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L561
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L563: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L562
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f4) @ app_33'25 (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L564: ; Continuation
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L563
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f4)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  mov ax, [bp]
  jmp ax

L565: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L564
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g189)
  mov bp, g3
  mov dx, g189
  mov ax, [bp]
  jmp ax

L566: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L565
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L567: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L566
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ lit_105'42 (g188)
  mov bp, [bp+6]
  mov dx, g188
  mov ax, [bp]
  jmp ax

L568: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L567
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ m (arg)
  mov bp, [bp+6]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L569: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L568
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L570: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L569
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f4) @ app_33'25 (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L571: ; Continuation
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L570
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f4)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  mov ax, [bp]
  jmp ax

L572: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L571
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g187)
  mov bp, g3
  mov dx, g187
  mov ax, [bp]
  jmp ax

L573: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L572
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L574: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L573
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f4)
  mov dx, [bp+8]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L575: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L574
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_163'39 (g186)
  mov bp, [bp+6]
  mov dx, g186
  mov ax, [bp]
  jmp ax

L576: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L575
  mov cx, sp
  ;; (96'21) Tail: implode (f2) @ case_89'2 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L577: ; Arm: 89'11
  push word g184
  push word '0'
  push word 1
  mov [4], sp
  ;; (0'0) Return: con_89'17 (t2)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L578: ; Continuation
  ;; (89'35) Tail: app_89'32 (arg) @ secj (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L579: ; Arm: 163'27
  mov ax, [bp+10]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L576
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L577
  push word [bp+10]
  push word cx
  push word L578
  mov cx, sp
  ;; (89'32) Tail: loop (g183) @ con_89'32 (g185)
  mov bp, g183
  mov dx, g185
  mov ax, [bp]
  jmp ax

L580: ; Arm: 128'16
  ;; (0'0) Return: con_128'21 (g206)
  mov dx, g206
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L581: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L580
  mov ax, [bp+8]
  mov bx, [bp+10]
  call Bare_get_bytes
  mov [2], ax
  mov ax, [bp+6]
  add ax, [bp+10]
  mov [4], ax
  mov ax, [bp+4]
  mov bx, [4]
  mov si, [2]
  call Bare_set_bytes
  mov [6], ax
  mov ax, [bp+10]
  add ax, 1
  mov [8], ax
  ;; (131'11) Tail: loop (f6) @ prim_0'0 (t4)
  mov bp, [bp+12]
  mov dx, [8]
  mov ax, [bp]
  jmp ax

L582: ; Arm: 13'9
  ;; (0'0) Return: con_13'12 (g204)
  mov dx, g204
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L583: ; Function: t1
  mov ax, dx
  cmp word ax, 512
  call Bare_make_bool_from_n
  mov [2], ax
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L581
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L582
  ;; (0'0) Return: con_14'13 (g205)
  mov dx, g205
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L584: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word L583
  mov [2], sp
  ;; (133'7) Tail: loop (t1) @ 0
  mov bp, [2]
  mov dx, 0
  mov ax, [bp]
  jmp ax

L585: ; Continuation
  mov ax, [bp+4]
  mul ax, 512
  mov [2], ax
  push word [2]
  push word dx
  push word cx
  push word L584
  mov cx, sp
  mov bx, [bp+6]
  mov ax, [bx+2]
  mov [4], ax
  ;; (151'47) Return: x (t2)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L586: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L585
  mov cx, sp
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [2], ax
  ;; (139'43) Return: x (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L587: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L586
  mov cx, sp
  ;; (75'29) Tail: put_chars (g8) @ app_75'38 (arg)
  mov bp, g8
  mov dx, dx
  mov ax, [bp]
  jmp ax

L588: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L587
  mov cx, sp
  ;; (75'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L589: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L588
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L590: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L589
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f7) @ app_33'25 (arg)
  mov bp, [bp+14]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L591: ; Continuation
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L590
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f7)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  mov ax, [bp]
  jmp ax

L592: ; Continuation
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L591
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g203)
  mov bp, g3
  mov dx, g203
  mov ax, [bp]
  jmp ax

L593: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L592
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L594: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L593
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f7)
  mov dx, [bp+14]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L595: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L594
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_107'45 (g202)
  mov bp, [bp+6]
  mov dx, g202
  mov ax, [bp]
  jmp ax

L596: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L595
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L597: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L596
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f7) @ app_33'25 (arg)
  mov bp, [bp+14]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L598: ; Continuation
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L597
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f7)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  mov ax, [bp]
  jmp ax

L599: ; Continuation
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L598
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g201)
  mov bp, g3
  mov dx, g201
  mov ax, [bp]
  jmp ax

L600: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L599
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L601: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L600
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ lit_107'61 (g200)
  mov bp, [bp+6]
  mov dx, g200
  mov ax, [bp]
  jmp ax

L602: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L601
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ m (arg)
  mov bp, [bp+6]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L603: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L602
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L604: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L603
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f7) @ app_33'25 (arg)
  mov bp, [bp+14]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L605: ; Continuation
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L604
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f7)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  mov ax, [bp]
  jmp ax

L606: ; Continuation
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L605
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g199)
  mov bp, g3
  mov dx, g199
  mov ax, [bp]
  jmp ax

L607: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L606
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L608: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L607
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f7)
  mov dx, [bp+14]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L609: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L608
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_164'21 (g198)
  mov bp, [bp+6]
  mov dx, g198
  mov ax, [bp]
  jmp ax

L610: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L609
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L611: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L610
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f7) @ app_33'25 (arg)
  mov bp, [bp+14]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L612: ; Continuation
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L611
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f7)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  mov ax, [bp]
  jmp ax

L613: ; Continuation
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L612
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g197)
  mov bp, g3
  mov dx, g197
  mov ax, [bp]
  jmp ax

L614: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L613
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L615: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L614
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ lit_164'51 (g196)
  mov bp, [bp+6]
  mov dx, g196
  mov ax, [bp]
  jmp ax

L616: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L615
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ s1 (arg)
  mov bp, [bp+6]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L617: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L616
  mov cx, sp
  ;; (96'21) Tail: implode (f2) @ case_89'2 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L618: ; Arm: 89'11
  push word g194
  push word '0'
  push word 1
  mov [4], sp
  ;; (0'0) Return: con_89'17 (t2)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L619: ; Continuation
  ;; (89'35) Tail: app_89'32 (arg) @ secj (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L620: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L579
  mov ax, [bp+10]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L617
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L618
  push word [bp+10]
  push word cx
  push word L619
  mov cx, sp
  ;; (89'32) Tail: loop (g193) @ con_89'32 (g195)
  mov bp, g193
  mov dx, g195
  mov ax, [bp]
  jmp ax

L621: ; Arm: 153'34
  ;; (0'0) Return: con_153'39 (g180)
  mov dx, g180
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L622: ; Arm: 13'9
  ;; (0'0) Return: con_13'12 (g181)
  mov dx, g181
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L623: ; Arm: 209'34
  mov ax, [10]
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [18], ax
  push word [12]
  push word [10]
  push word [2]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L620
  mov cx, sp
  mov bx, [18]
  cmp word [bx], 1
  jz L621
  mov ax, [10]
  cmp word ax, 32
  call Bare_make_bool_from_n
  mov [20], ax
  mov bx, [20]
  cmp word [bx], 1
  jz L622
  ;; (0'0) Return: con_14'13 (g182)
  mov dx, g182
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L624: ; Continuation
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  ;; DeRef
  mov bx, [4]
  mov ax, [bx]
  ;; DeRef-done
  mov [6], ax
  mov bx, [6]
  mov ax, [bx+2]
  mov [8], ax
  mov ax, [bx+4]
  mov [10], ax
  mov ax, [bx+6]
  mov [12], ax
  mov ax, [bp+10]
  cmp word ax, [10]
  call Bare_make_bool_from_z
  mov [14], ax
  mov bx, [14]
  cmp word [bx], 1
  jz L472
  ;; DeRef
  mov bx, [8]
  mov ax, [bx]
  ;; DeRef-done
  mov [16], ax
  push word [4]
  push word [2]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L551
  mov cx, sp
  mov bx, [16]
  cmp word [bx], 1
  jz L623
  ;; (0'0) Return: con_209'74 (g207)
  mov dx, g207
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L625: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L624
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L626: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L625
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f8) @ app_33'25 (arg)
  mov bp, [bp+16]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L627: ; Continuation
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L626
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f8)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+16]
  mov ax, [bp]
  jmp ax

L628: ; Continuation
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L627
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g175)
  mov bp, g3
  mov dx, g175
  mov ax, [bp]
  jmp ax

L629: ; Continuation
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L628
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L630: ; Continuation
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L629
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f8)
  mov dx, [bp+16]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L631: ; Continuation
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L630
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_199'9 (g174)
  mov bp, [bp+6]
  mov dx, g174
  mov ax, [bp]
  jmp ax

L632: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L631
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L633: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L632
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f8) @ app_33'25 (arg)
  mov bp, [bp+16]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L634: ; Continuation
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L633
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f8)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+16]
  mov ax, [bp]
  jmp ax

L635: ; Continuation
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L634
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g173)
  mov bp, g3
  mov dx, g173
  mov ax, [bp]
  jmp ax

L636: ; Continuation
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L635
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L637: ; Continuation
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L636
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f8)
  mov dx, [bp+16]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L638: ; Continuation
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L637
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ s1 (f8)
  mov dx, [bp+16]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L639: ; Continuation
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L638
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L640: ; Continuation
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L639
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f9) @ app_33'25 (arg)
  mov bp, [bp+18]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L641: ; Continuation
  push word [bp+20]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L640
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f9)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+18]
  mov ax, [bp]
  jmp ax

L642: ; Continuation
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L641
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g172)
  mov bp, g3
  mov dx, g172
  mov ax, [bp]
  jmp ax

L643: ; Continuation
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L642
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L644: ; Continuation
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L643
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f9)
  mov dx, [bp+18]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L645: ; Continuation
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L644
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_199'47 (g171)
  mov bp, [bp+6]
  mov dx, g171
  mov ax, [bp]
  jmp ax

L646: ; Continuation
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L645
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L647: ; Continuation
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L646
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f9) @ app_33'25 (arg)
  mov bp, [bp+18]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L648: ; Continuation
  push word [bp+20]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L647
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f9)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+18]
  mov ax, [bp]
  jmp ax

L649: ; Continuation
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L648
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g170)
  mov bp, g3
  mov dx, g170
  mov ax, [bp]
  jmp ax

L650: ; Continuation
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L649
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L651: ; Continuation
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L650
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f9)
  mov dx, [bp+18]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L652: ; Continuation
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L651
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ s1 (f9)
  mov dx, [bp+18]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L653: ; Continuation
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L652
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L654: ; Continuation
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L653
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f10) @ app_33'25 (arg)
  mov bp, [bp+20]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L655: ; Continuation
  push word [bp+22]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L654
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f10)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+20]
  mov ax, [bp]
  jmp ax

L656: ; Continuation
  push word dx
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L655
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g169)
  mov bp, g3
  mov dx, g169
  mov ax, [bp]
  jmp ax

L657: ; Continuation
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L656
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L658: ; Continuation
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L657
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f10)
  mov dx, [bp+20]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L659: ; Continuation
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L658
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_199'75 (g168)
  mov bp, [bp+6]
  mov dx, g168
  mov ax, [bp]
  jmp ax

L660: ; Continuation
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L659
  mov cx, sp
  ;; (96'21) Tail: implode (f2) @ app_89'35 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L661: ; Continuation
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L660
  mov cx, sp
  ;; (89'35) Tail: app_89'32 (arg) @ 64
  mov bp, dx
  mov dx, 64
  mov ax, [bp]
  jmp ax

L662: ; Continuation
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L661
  mov cx, sp
  ;; (89'32) Tail: loop (g166) @ con_89'32 (g167)
  mov bp, g166
  mov dx, g167
  mov ax, [bp]
  jmp ax

L663: ; Continuation
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L662
  mov cx, sp
  ;; (96'21) Tail: implode (f2) @ case_89'2 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L664: ; Arm: 89'11
  push word g164
  push word '0'
  push word 1
  mov [4], sp
  ;; (0'0) Return: con_89'17 (t2)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L665: ; Continuation
  ;; (89'35) Tail: app_89'32 (arg) @ offset (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L666: ; Continuation
  mov ax, [bp+12]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L663
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L664
  push word [bp+12]
  push word cx
  push word L665
  mov cx, sp
  ;; (89'32) Tail: loop (g163) @ con_89'32 (g165)
  mov bp, g163
  mov dx, g165
  mov ax, [bp]
  jmp ax

L667: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L666
  mov cx, sp
  ;; (96'21) Tail: implode (f2) @ case_89'2 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L668: ; Arm: 89'11
  push word g161
  push word '0'
  push word 1
  mov [4], sp
  ;; (0'0) Return: con_89'17 (t2)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L669: ; Continuation
  ;; (89'35) Tail: app_89'32 (arg) @ seci (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L670: ; Continuation
  mov ax, [bp+10]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L667
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L668
  push word [bp+10]
  push word cx
  push word L669
  mov cx, sp
  ;; (89'32) Tail: loop (g160) @ con_89'32 (g162)
  mov bp, g160
  mov dx, g162
  mov ax, [bp]
  jmp ax

L671: ; Continuation
  mov ax, [bp+10]
  mov bx, 8
  call Bare_mod
  mov [2], ax
  mov ax, 64
  mul ax, [2]
  mov [4], ax
  push word [4]
  push word [bp+14]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L670
  mov cx, sp
  mov bx, [bp+12]
  mov ax, [bx+2]
  mov [6], ax
  ;; (226'45) Return: x (t3)
  mov dx, [6]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L672: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L671
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L673: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L672
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f8) @ app_33'25 (arg)
  mov bp, [bp+16]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L674: ; Continuation
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L673
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f8)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+16]
  mov ax, [bp]
  jmp ax

L675: ; Continuation
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L674
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g159)
  mov bp, g3
  mov dx, g159
  mov ax, [bp]
  jmp ax

L676: ; Continuation
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L675
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L677: ; Continuation
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L676
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f8)
  mov dx, [bp+16]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L678: ; Continuation
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L677
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_245'20 (g158)
  mov bp, [bp+6]
  mov dx, g158
  mov ax, [bp]
  jmp ax

L679: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L678
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L680: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L679
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f8) @ app_33'25 (arg)
  mov bp, [bp+16]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L681: ; Continuation
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L680
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f8)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+16]
  mov ax, [bp]
  jmp ax

L682: ; Continuation
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L681
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g157)
  mov bp, g3
  mov dx, g157
  mov ax, [bp]
  jmp ax

L683: ; Continuation
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L682
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L684: ; Continuation
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L683
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f8)
  mov dx, [bp+16]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L685: ; Continuation
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L684
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ s1 (f8)
  mov dx, [bp+16]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L686: ; Continuation
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L685
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L687: ; Continuation
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L686
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f9) @ app_33'25 (arg)
  mov bp, [bp+18]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L688: ; Continuation
  push word [bp+20]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L687
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f9)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+18]
  mov ax, [bp]
  jmp ax

L689: ; Continuation
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L688
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g156)
  mov bp, g3
  mov dx, g156
  mov ax, [bp]
  jmp ax

L690: ; Continuation
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L689
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L691: ; Continuation
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L690
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f9)
  mov dx, [bp+18]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L692: ; Continuation
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L691
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_230'21 (g155)
  mov bp, [bp+6]
  mov dx, g155
  mov ax, [bp]
  jmp ax

L693: ; Continuation
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L692
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L694: ; Continuation
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L693
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f9) @ app_33'25 (arg)
  mov bp, [bp+18]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L695: ; Continuation
  push word [bp+20]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L694
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f9)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+18]
  mov ax, [bp]
  jmp ax

L696: ; Continuation
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L695
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g154)
  mov bp, g3
  mov dx, g154
  mov ax, [bp]
  jmp ax

L697: ; Continuation
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L696
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L698: ; Continuation
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L697
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ lit_230'39 (g153)
  mov bp, [bp+6]
  mov dx, g153
  mov ax, [bp]
  jmp ax

L699: ; Continuation
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L698
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ s1 (arg)
  mov bp, [bp+6]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L700: ; Continuation
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L699
  mov cx, sp
  ;; (96'21) Tail: implode (f2) @ case_89'2 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L701: ; Arm: 89'11
  push word g151
  push word '0'
  push word 1
  mov [4], sp
  ;; (0'0) Return: con_89'17 (t2)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L702: ; Continuation
  ;; (89'35) Tail: app_89'32 (arg) @ seci (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L703: ; Continuation
  mov ax, [bp+14]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L700
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L701
  push word [bp+14]
  push word cx
  push word L702
  mov cx, sp
  ;; (89'32) Tail: loop (g150) @ con_89'32 (g152)
  mov bp, g150
  mov dx, g152
  mov ax, [bp]
  jmp ax

L704: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L703
  mov cx, sp
  ;; (96'21) Tail: implode (f2) @ case_89'2 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L705: ; Arm: 89'11
  push word g148
  push word '0'
  push word 1
  mov [6], sp
  ;; (0'0) Return: con_89'17 (t3)
  mov dx, [6]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L706: ; Continuation
  ;; (89'35) Tail: app_89'32 (arg) @ i (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L707: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word cx
  push word L437
  mov cx, sp
  mov bx, dx
  cmp word [bx], 1
  jz L465
  mov ax, [bp+10]
  mov bx, 8
  call Bare_div
  mov [2], ax
  mov ax, [bp+10]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [4], ax
  push word [2]
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L704
  mov cx, sp
  mov bx, [4]
  cmp word [bx], 1
  jz L705
  push word [bp+10]
  push word cx
  push word L706
  mov cx, sp
  ;; (89'32) Tail: loop (g147) @ con_89'32 (g149)
  mov bp, g147
  mov dx, g149
  mov ax, [bp]
  jmp ax

L708: ; Arm: 228'33
  ;; (0'0) Return: con_228'38 (g134)
  mov dx, g134
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L709: ; Arm: 13'9
  ;; (0'0) Return: con_13'12 (g135)
  mov dx, g135
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L710: ; Continuation
  mov ax, dx
  mov [2], ax
  push word [2]
  push word 0
  mov [4], sp
  mov ax, [bp+10]
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [6], ax
  push word [4]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L707
  mov cx, sp
  mov bx, [6]
  cmp word [bx], 1
  jz L708
  mov ax, [bp+10]
  cmp word ax, 256
  call Bare_make_bool_from_n
  mov [8], ax
  mov bx, [8]
  cmp word [bx], 1
  jz L709
  ;; (0'0) Return: con_14'13 (g136)
  mov dx, g136
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L711: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L710
  mov cx, sp
  ;; (265'62) Tail: implode (f2) @ app_265'78 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L712: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L711
  mov cx, sp
  ;; (265'78) Tail: app_102'7 (arg) @ 64
  mov bp, dx
  mov dx, 64
  mov ax, [bp]
  jmp ax

L713: ; Function: t1
  mov ax, 119
  cmp word ax, dx
  call Bare_make_bool_from_n
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L436
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L712
  mov cx, sp
  ;; (102'7) Tail: loop (g132) @ con_102'7 (g133)
  mov bp, g132
  mov dx, g133
  mov ax, [bp]
  jmp ax

L714: ; Arm: 272'16
  ;; (0'0) Return: con_272'21 (g239)
  mov dx, g239
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L715: ; Continuation
  mov ax, `\n`
  call Bare_put_char
  mov [2], ax
  mov ax, [bp+4]
  add ax, 1
  mov [4], ax
  ;; (275'11) Tail: loop (f3) @ prim_0'0 (t2)
  mov bp, [bp+6]
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L716: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L715
  mov cx, sp
  ;; (75'29) Tail: put_chars (g8) @ app_75'38 (arg)
  mov bp, g8
  mov dx, dx
  mov ax, [bp]
  jmp ax

L717: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L716
  mov cx, sp
  ;; (75'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L718: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L717
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L719: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L718
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f6) @ app_33'25 (arg)
  mov bp, [bp+12]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L720: ; Continuation
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L719
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f6)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  mov ax, [bp]
  jmp ax

L721: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L720
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g335)
  mov bp, g3
  mov dx, g335
  mov ax, [bp]
  jmp ax

L722: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L721
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L723: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L722
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f6)
  mov dx, [bp+12]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L724: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L723
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ s1 (f6)
  mov dx, [bp+12]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L725: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L724
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L726: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L725
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f7) @ app_33'25 (arg)
  mov bp, [bp+14]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L727: ; Continuation
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L726
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f7)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  mov ax, [bp]
  jmp ax

L728: ; Continuation
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L727
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g334)
  mov bp, g3
  mov dx, g334
  mov ax, [bp]
  jmp ax

L729: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L728
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L730: ; Continuation
  push word dx
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L729
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ block_string (f6)
  mov dx, [bp+12]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L731: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L730
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_274'35 (g333)
  mov bp, [bp+6]
  mov dx, g333
  mov ax, [bp]
  jmp ax

L732: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L731
  mov cx, sp
  ;; (96'21) Tail: implode (f2) @ case_89'2 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L733: ; Arm: 89'11
  push word g331
  push word '0'
  push word 1
  mov [6], sp
  ;; (0'0) Return: con_89'17 (t3)
  mov dx, [6]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L734: ; Continuation
  ;; (89'35) Tail: app_89'32 (arg) @ i (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L735: ; Continuation
  mov ax, dx
  mov [2], ax
  mov ax, [bp+8]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [4], ax
  push word [2]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L732
  mov cx, sp
  mov bx, [4]
  cmp word [bx], 1
  jz L733
  push word [bp+8]
  push word cx
  push word L734
  mov cx, sp
  ;; (89'32) Tail: loop (g330) @ con_89'32 (g332)
  mov bp, g330
  mov dx, g332
  mov ax, [bp]
  jmp ax

L736: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L735
  mov cx, sp
  mov bx, dx
  mov ax, [bx+2]
  mov [2], ax
  ;; (226'45) Return: x (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L737: ; Continuation
  call Bare_crash "Crash"
  mov [2], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L738: ; Continuation
  push word cx
  push word L737
  mov cx, sp
  ;; (75'29) Tail: put_chars (g8) @ app_75'38 (arg)
  mov bp, g8
  mov dx, dx
  mov ax, [bp]
  jmp ax

L739: ; Continuation
  push word cx
  push word L738
  mov cx, sp
  ;; (75'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L740: ; Continuation
  push word [bp+6]
  push word cx
  push word L739
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L741: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L740
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f4) @ app_33'25 (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L742: ; Continuation
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L741
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f4)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  mov ax, [bp]
  jmp ax

L743: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L742
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g251)
  mov bp, g3
  mov dx, g251
  mov ax, [bp]
  jmp ax

L744: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L743
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L745: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L744
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f4)
  mov dx, [bp+8]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L746: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L745
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_105'26 (g250)
  mov bp, [bp+6]
  mov dx, g250
  mov ax, [bp]
  jmp ax

L747: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L746
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L748: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L747
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f4) @ app_33'25 (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L749: ; Continuation
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L748
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f4)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  mov ax, [bp]
  jmp ax

L750: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L749
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g249)
  mov bp, g3
  mov dx, g249
  mov ax, [bp]
  jmp ax

L751: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L750
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L752: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L751
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ lit_105'42 (g248)
  mov bp, [bp+6]
  mov dx, g248
  mov ax, [bp]
  jmp ax

L753: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L752
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ m (arg)
  mov bp, [bp+6]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L754: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L753
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L755: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L754
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f4) @ app_33'25 (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L756: ; Continuation
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L755
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f4)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  mov ax, [bp]
  jmp ax

L757: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L756
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g247)
  mov bp, g3
  mov dx, g247
  mov ax, [bp]
  jmp ax

L758: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L757
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L759: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L758
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f4)
  mov dx, [bp+8]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L760: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L759
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_234'35 (g246)
  mov bp, [bp+6]
  mov dx, g246
  mov ax, [bp]
  jmp ax

L761: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L760
  mov cx, sp
  ;; (96'21) Tail: implode (f2) @ case_89'2 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L762: ; Arm: 89'11
  push word g244
  push word '0'
  push word 1
  mov [4], sp
  ;; (0'0) Return: con_89'17 (t2)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L763: ; Continuation
  ;; (89'35) Tail: app_89'32 (arg) @ i (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L764: ; Arm: 234'23
  mov ax, [bp+10]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L761
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L762
  push word [bp+10]
  push word cx
  push word L763
  mov cx, sp
  ;; (89'32) Tail: loop (g243) @ con_89'32 (g245)
  mov bp, g243
  mov dx, g245
  mov ax, [bp]
  jmp ax

L765: ; Arm: 117'16
  ;; (0'0) Return: con_117'21 (g329)
  mov dx, g329
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L766: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L765
  mov ax, [bp+4]
  add ax, [bp+10]
  mov [2], ax
  mov ax, [bp+6]
  mov bx, [2]
  call Bare_get_bytes
  mov [4], ax
  mov ax, [bp+8]
  mov bx, [bp+10]
  mov si, [4]
  call Bare_set_bytes
  mov [6], ax
  mov ax, [bp+10]
  add ax, 1
  mov [8], ax
  ;; (120'11) Tail: loop (f6) @ prim_0'0 (t4)
  mov bp, [bp+12]
  mov dx, [8]
  mov ax, [bp]
  jmp ax

L767: ; Arm: 13'9
  ;; (0'0) Return: con_13'12 (g327)
  mov dx, g327
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L768: ; Function: t2
  mov ax, dx
  cmp word ax, 64
  call Bare_make_bool_from_n
  mov [2], ax
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L766
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L767
  ;; (0'0) Return: con_14'13 (g328)
  mov dx, g328
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L769: ; Continuation
  push word [bp+4]
  push word 0
  mov [2], sp
  ;; (0'0) Return: con_239'4 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L770: ; Continuation
  mov ax, 64
  call Bare_make_bytes
  mov [2], ax
  push word [2]
  push word dx
  push word [bp+4]
  push word L768
  mov [4], sp
  push word [2]
  push word cx
  push word L769
  mov cx, sp
  ;; (122'7) Tail: loop (t2) @ 0
  mov bp, [4]
  mov dx, 0
  mov ax, [bp]
  jmp ax

L771: ; Continuation
  mov ax, [bp+4]
  mov bx, 8
  call Bare_mod
  mov [2], ax
  mov ax, 64
  mul ax, [2]
  mov [4], ax
  push word [4]
  push word cx
  push word L770
  mov cx, sp
  mov bx, dx
  mov ax, [bx+2]
  mov [6], ax
  ;; (151'47) Return: x (t3)
  mov dx, [6]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L772: ; Arm: 189'23
  ;; (188'30) Return: sector (t6)
  mov dx, [12]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L773: ; Continuation
  ;; MakeRef
  push word g326
  mov ax, sp
  ;; MakeRef-done
  mov [2], ax
  push word dx
  push word [bp+4]
  push word [2]
  push word 0
  mov [4], sp
  ;; SetRef
  mov bx, [bp+6]
  mov [bx], [4]
  ;; SetRef-done
  mov [6], ax
  ;; (192'14) Return: sector (arg)
  mov dx, dx
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L774: ; Continuation
  call Bare_crash "Crash"
  mov [2], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L775: ; Continuation
  push word cx
  push word L774
  mov cx, sp
  ;; (75'29) Tail: put_chars (g8) @ app_75'38 (arg)
  mov bp, g8
  mov dx, dx
  mov ax, [bp]
  jmp ax

L776: ; Continuation
  push word cx
  push word L775
  mov cx, sp
  ;; (75'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L777: ; Continuation
  push word [bp+6]
  push word cx
  push word L776
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L778: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L777
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f4) @ app_33'25 (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L779: ; Continuation
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L778
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f4)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  mov ax, [bp]
  jmp ax

L780: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L779
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g310)
  mov bp, g3
  mov dx, g310
  mov ax, [bp]
  jmp ax

L781: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L780
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L782: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L781
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f4)
  mov dx, [bp+8]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L783: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L782
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_105'26 (g309)
  mov bp, [bp+6]
  mov dx, g309
  mov ax, [bp]
  jmp ax

L784: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L783
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L785: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L784
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f4) @ app_33'25 (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L786: ; Continuation
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L785
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f4)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  mov ax, [bp]
  jmp ax

L787: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L786
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g308)
  mov bp, g3
  mov dx, g308
  mov ax, [bp]
  jmp ax

L788: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L787
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L789: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L788
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ lit_105'42 (g307)
  mov bp, [bp+6]
  mov dx, g307
  mov ax, [bp]
  jmp ax

L790: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L789
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ m (arg)
  mov bp, [bp+6]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L791: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L790
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L792: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L791
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f4) @ app_33'25 (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L793: ; Continuation
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L792
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f4)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  mov ax, [bp]
  jmp ax

L794: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L793
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g306)
  mov bp, g3
  mov dx, g306
  mov ax, [bp]
  jmp ax

L795: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L794
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L796: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L795
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f4)
  mov dx, [bp+8]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L797: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L796
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_157'39 (g305)
  mov bp, [bp+6]
  mov dx, g305
  mov ax, [bp]
  jmp ax

L798: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L797
  mov cx, sp
  ;; (96'21) Tail: implode (f2) @ case_89'2 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L799: ; Arm: 89'11
  push word g303
  push word '0'
  push word 1
  mov [4], sp
  ;; (0'0) Return: con_89'17 (t2)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L800: ; Continuation
  ;; (89'35) Tail: app_89'32 (arg) @ seci (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L801: ; Arm: 157'27
  mov ax, [bp+8]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L798
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L799
  push word [bp+8]
  push word cx
  push word L800
  mov cx, sp
  ;; (89'32) Tail: loop (g302) @ con_89'32 (g304)
  mov bp, g302
  mov dx, g304
  mov ax, [bp]
  jmp ax

L802: ; Arm: 117'16
  ;; (0'0) Return: con_117'21 (g325)
  mov dx, g325
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L803: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L802
  mov ax, [bp+6]
  add ax, [bp+10]
  mov [2], ax
  mov ax, [bp+4]
  mov bx, [2]
  call Bare_get_bytes
  mov [4], ax
  mov ax, [bp+8]
  mov bx, [bp+10]
  mov si, [4]
  call Bare_set_bytes
  mov [6], ax
  mov ax, [bp+10]
  add ax, 1
  mov [8], ax
  ;; (120'11) Tail: loop (f6) @ prim_0'0 (t4)
  mov bp, [bp+12]
  mov dx, [8]
  mov ax, [bp]
  jmp ax

L804: ; Arm: 13'9
  ;; (0'0) Return: con_13'12 (g323)
  mov dx, g323
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L805: ; Function: t3
  mov ax, dx
  cmp word ax, 512
  call Bare_make_bool_from_n
  mov [2], ax
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L803
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L804
  ;; (0'0) Return: con_14'13 (g324)
  mov dx, g324
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L806: ; Continuation
  push word [bp+4]
  push word 0
  mov [2], sp
  ;; (0'0) Return: con_159'4 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L807: ; Continuation
  mov ax, [bp+4]
  mul ax, 512
  mov [2], ax
  mov ax, 512
  call Bare_make_bytes
  mov [4], ax
  push word [4]
  push word [2]
  push word dx
  push word L805
  mov [6], sp
  push word [4]
  push word cx
  push word L806
  mov cx, sp
  ;; (122'7) Tail: loop (t3) @ 0
  mov bp, [6]
  mov dx, 0
  mov ax, [bp]
  jmp ax

L808: ; Continuation
  push word [bp+4]
  push word cx
  push word L807
  mov cx, sp
  mov bx, [bp+6]
  mov ax, [bx+2]
  mov [2], ax
  ;; (139'43) Return: x (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L809: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L808
  mov cx, sp
  ;; (75'29) Tail: put_chars (g8) @ app_75'38 (arg)
  mov bp, g8
  mov dx, dx
  mov ax, [bp]
  jmp ax

L810: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L809
  mov cx, sp
  ;; (75'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L811: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L810
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L812: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L811
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f6) @ app_33'25 (arg)
  mov bp, [bp+12]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L813: ; Continuation
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L812
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f6)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  mov ax, [bp]
  jmp ax

L814: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L813
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g322)
  mov bp, g3
  mov dx, g322
  mov ax, [bp]
  jmp ax

L815: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L814
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L816: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L815
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f6)
  mov dx, [bp+12]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L817: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L816
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_107'45 (g321)
  mov bp, [bp+6]
  mov dx, g321
  mov ax, [bp]
  jmp ax

L818: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L817
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L819: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L818
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f6) @ app_33'25 (arg)
  mov bp, [bp+12]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L820: ; Continuation
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L819
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f6)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  mov ax, [bp]
  jmp ax

L821: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L820
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g320)
  mov bp, g3
  mov dx, g320
  mov ax, [bp]
  jmp ax

L822: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L821
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L823: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L822
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ lit_107'61 (g319)
  mov bp, [bp+6]
  mov dx, g319
  mov ax, [bp]
  jmp ax

L824: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L823
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ m (arg)
  mov bp, [bp+6]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L825: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L824
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L826: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L825
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f6) @ app_33'25 (arg)
  mov bp, [bp+12]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L827: ; Continuation
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L826
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f6)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  mov ax, [bp]
  jmp ax

L828: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L827
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g318)
  mov bp, g3
  mov dx, g318
  mov ax, [bp]
  jmp ax

L829: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L828
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L830: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L829
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f6)
  mov dx, [bp+12]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L831: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L830
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_158'21 (g317)
  mov bp, [bp+6]
  mov dx, g317
  mov ax, [bp]
  jmp ax

L832: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L831
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L833: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L832
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f6) @ app_33'25 (arg)
  mov bp, [bp+12]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L834: ; Continuation
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L833
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f6)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  mov ax, [bp]
  jmp ax

L835: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L834
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g316)
  mov bp, g3
  mov dx, g316
  mov ax, [bp]
  jmp ax

L836: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L835
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L837: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L836
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ lit_158'50 (g315)
  mov bp, [bp+6]
  mov dx, g315
  mov ax, [bp]
  jmp ax

L838: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L837
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ s1 (arg)
  mov bp, [bp+6]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L839: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L838
  mov cx, sp
  ;; (96'21) Tail: implode (f2) @ case_89'2 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L840: ; Arm: 89'11
  push word g313
  push word '0'
  push word 1
  mov [4], sp
  ;; (0'0) Return: con_89'17 (t2)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L841: ; Continuation
  ;; (89'35) Tail: app_89'32 (arg) @ seci (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L842: ; Continuation
  push word [bp+12]
  push word [bp+8]
  push word cx
  push word L773
  mov cx, sp
  mov bx, dx
  cmp word [bx], 1
  jz L801
  mov ax, [bp+8]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L839
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L840
  push word [bp+8]
  push word cx
  push word L841
  mov cx, sp
  ;; (89'32) Tail: loop (g312) @ con_89'32 (g314)
  mov bp, g312
  mov dx, g314
  mov ax, [bp]
  jmp ax

L843: ; Arm: 153'34
  ;; (0'0) Return: con_153'39 (g299)
  mov dx, g299
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L844: ; Arm: 13'9
  ;; (0'0) Return: con_13'12 (g300)
  mov dx, g300
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L845: ; Continuation
  mov ax, [bp+8]
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [2], ax
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L842
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L843
  mov ax, [bp+8]
  cmp word ax, 32
  call Bare_make_bool_from_n
  mov [4], ax
  mov bx, [4]
  cmp word [bx], 1
  jz L844
  ;; (0'0) Return: con_14'13 (g301)
  mov dx, g301
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L846: ; Continuation
  call Bare_crash "Crash"
  mov [2], ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L847: ; Continuation
  push word cx
  push word L846
  mov cx, sp
  ;; (75'29) Tail: put_chars (g8) @ app_75'38 (arg)
  mov bp, g8
  mov dx, dx
  mov ax, [bp]
  jmp ax

L848: ; Continuation
  push word cx
  push word L847
  mov cx, sp
  ;; (75'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L849: ; Continuation
  push word [bp+6]
  push word cx
  push word L848
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L850: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L849
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f4) @ app_33'25 (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L851: ; Continuation
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L850
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f4)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  mov ax, [bp]
  jmp ax

L852: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L851
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g282)
  mov bp, g3
  mov dx, g282
  mov ax, [bp]
  jmp ax

L853: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L852
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L854: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L853
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f4)
  mov dx, [bp+8]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L855: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L854
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_105'26 (g281)
  mov bp, [bp+6]
  mov dx, g281
  mov ax, [bp]
  jmp ax

L856: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L855
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L857: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L856
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f4) @ app_33'25 (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L858: ; Continuation
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L857
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f4)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  mov ax, [bp]
  jmp ax

L859: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L858
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g280)
  mov bp, g3
  mov dx, g280
  mov ax, [bp]
  jmp ax

L860: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L859
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L861: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L860
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ lit_105'42 (g279)
  mov bp, [bp+6]
  mov dx, g279
  mov ax, [bp]
  jmp ax

L862: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L861
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ m (arg)
  mov bp, [bp+6]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L863: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L862
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L864: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L863
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f4) @ app_33'25 (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L865: ; Continuation
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L864
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f4)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+8]
  mov ax, [bp]
  jmp ax

L866: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L865
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g278)
  mov bp, g3
  mov dx, g278
  mov ax, [bp]
  jmp ax

L867: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L866
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L868: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L867
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f4)
  mov dx, [bp+8]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L869: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L868
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_163'39 (g277)
  mov bp, [bp+6]
  mov dx, g277
  mov ax, [bp]
  jmp ax

L870: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L869
  mov cx, sp
  ;; (96'21) Tail: implode (f2) @ case_89'2 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L871: ; Arm: 89'11
  push word g275
  push word '0'
  push word 1
  mov [4], sp
  ;; (0'0) Return: con_89'17 (t2)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L872: ; Continuation
  ;; (89'35) Tail: app_89'32 (arg) @ secj (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L873: ; Arm: 163'27
  mov ax, [bp+10]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L870
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L871
  push word [bp+10]
  push word cx
  push word L872
  mov cx, sp
  ;; (89'32) Tail: loop (g274) @ con_89'32 (g276)
  mov bp, g274
  mov dx, g276
  mov ax, [bp]
  jmp ax

L874: ; Arm: 128'16
  ;; (0'0) Return: con_128'21 (g297)
  mov dx, g297
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L875: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L874
  mov ax, [bp+8]
  mov bx, [bp+10]
  call Bare_get_bytes
  mov [2], ax
  mov ax, [bp+6]
  add ax, [bp+10]
  mov [4], ax
  mov ax, [bp+4]
  mov bx, [4]
  mov si, [2]
  call Bare_set_bytes
  mov [6], ax
  mov ax, [bp+10]
  add ax, 1
  mov [8], ax
  ;; (131'11) Tail: loop (f6) @ prim_0'0 (t4)
  mov bp, [bp+12]
  mov dx, [8]
  mov ax, [bp]
  jmp ax

L876: ; Arm: 13'9
  ;; (0'0) Return: con_13'12 (g295)
  mov dx, g295
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L877: ; Function: t1
  mov ax, dx
  cmp word ax, 512
  call Bare_make_bool_from_n
  mov [2], ax
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L875
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L876
  ;; (0'0) Return: con_14'13 (g296)
  mov dx, g296
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L878: ; Continuation
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word L877
  mov [2], sp
  ;; (133'7) Tail: loop (t1) @ 0
  mov bp, [2]
  mov dx, 0
  mov ax, [bp]
  jmp ax

L879: ; Continuation
  mov ax, [bp+4]
  mul ax, 512
  mov [2], ax
  push word [2]
  push word dx
  push word cx
  push word L878
  mov cx, sp
  mov bx, [bp+6]
  mov ax, [bx+2]
  mov [4], ax
  ;; (151'47) Return: x (t2)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L880: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L879
  mov cx, sp
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [2], ax
  ;; (139'43) Return: x (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L881: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L880
  mov cx, sp
  ;; (75'29) Tail: put_chars (g8) @ app_75'38 (arg)
  mov bp, g8
  mov dx, dx
  mov ax, [bp]
  jmp ax

L882: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L881
  mov cx, sp
  ;; (75'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L883: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L882
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L884: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L883
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f7) @ app_33'25 (arg)
  mov bp, [bp+14]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L885: ; Continuation
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L884
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f7)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  mov ax, [bp]
  jmp ax

L886: ; Continuation
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L885
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g294)
  mov bp, g3
  mov dx, g294
  mov ax, [bp]
  jmp ax

L887: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L886
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L888: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L887
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f7)
  mov dx, [bp+14]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L889: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L888
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_107'45 (g293)
  mov bp, [bp+6]
  mov dx, g293
  mov ax, [bp]
  jmp ax

L890: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L889
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L891: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L890
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f7) @ app_33'25 (arg)
  mov bp, [bp+14]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L892: ; Continuation
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L891
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f7)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  mov ax, [bp]
  jmp ax

L893: ; Continuation
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L892
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g292)
  mov bp, g3
  mov dx, g292
  mov ax, [bp]
  jmp ax

L894: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L893
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L895: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L894
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ lit_107'61 (g291)
  mov bp, [bp+6]
  mov dx, g291
  mov ax, [bp]
  jmp ax

L896: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L895
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ m (arg)
  mov bp, [bp+6]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L897: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L896
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L898: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L897
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f7) @ app_33'25 (arg)
  mov bp, [bp+14]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L899: ; Continuation
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L898
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f7)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  mov ax, [bp]
  jmp ax

L900: ; Continuation
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L899
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g290)
  mov bp, g3
  mov dx, g290
  mov ax, [bp]
  jmp ax

L901: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L900
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L902: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L901
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f7)
  mov dx, [bp+14]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L903: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L902
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_164'21 (g289)
  mov bp, [bp+6]
  mov dx, g289
  mov ax, [bp]
  jmp ax

L904: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L903
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L905: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L904
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f7) @ app_33'25 (arg)
  mov bp, [bp+14]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L906: ; Continuation
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L905
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f7)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  mov ax, [bp]
  jmp ax

L907: ; Continuation
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L906
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g288)
  mov bp, g3
  mov dx, g288
  mov ax, [bp]
  jmp ax

L908: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L907
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L909: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L908
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ lit_164'51 (g287)
  mov bp, [bp+6]
  mov dx, g287
  mov ax, [bp]
  jmp ax

L910: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L909
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ s1 (arg)
  mov bp, [bp+6]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L911: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L910
  mov cx, sp
  ;; (96'21) Tail: implode (f2) @ case_89'2 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L912: ; Arm: 89'11
  push word g285
  push word '0'
  push word 1
  mov [4], sp
  ;; (0'0) Return: con_89'17 (t2)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L913: ; Continuation
  ;; (89'35) Tail: app_89'32 (arg) @ secj (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L914: ; Continuation
  mov bx, dx
  cmp word [bx], 1
  jz L873
  mov ax, [bp+10]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L911
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L912
  push word [bp+10]
  push word cx
  push word L913
  mov cx, sp
  ;; (89'32) Tail: loop (g284) @ con_89'32 (g286)
  mov bp, g284
  mov dx, g286
  mov ax, [bp]
  jmp ax

L915: ; Arm: 153'34
  ;; (0'0) Return: con_153'39 (g271)
  mov dx, g271
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L916: ; Arm: 13'9
  ;; (0'0) Return: con_13'12 (g272)
  mov dx, g272
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L917: ; Arm: 191'34
  mov ax, [10]
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [18], ax
  push word [12]
  push word [10]
  push word [2]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L914
  mov cx, sp
  mov bx, [18]
  cmp word [bx], 1
  jz L915
  mov ax, [10]
  cmp word ax, 32
  call Bare_make_bool_from_n
  mov [20], ax
  mov bx, [20]
  cmp word [bx], 1
  jz L916
  ;; (0'0) Return: con_14'13 (g273)
  mov dx, g273
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L918: ; Continuation
  push word [bp+10]
  push word cx
  push word L771
  mov cx, sp
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  ;; DeRef
  mov bx, [4]
  mov ax, [bx]
  ;; DeRef-done
  mov [6], ax
  mov bx, [6]
  mov ax, [bx+2]
  mov [8], ax
  mov ax, [bx+4]
  mov [10], ax
  mov ax, [bx+6]
  mov [12], ax
  mov ax, [bp+12]
  cmp word ax, [10]
  call Bare_make_bool_from_z
  mov [14], ax
  mov bx, [14]
  cmp word [bx], 1
  jz L772
  ;; DeRef
  mov bx, [8]
  mov ax, [bx]
  ;; DeRef-done
  mov [16], ax
  push word [4]
  push word [2]
  push word [bp+12]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L845
  mov cx, sp
  mov bx, [16]
  cmp word [bx], 1
  jz L917
  ;; (0'0) Return: con_191'74 (g298)
  mov dx, g298
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L919: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L918
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L920: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L919
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f7) @ app_33'25 (arg)
  mov bp, [bp+14]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L921: ; Continuation
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L920
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f7)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  mov ax, [bp]
  jmp ax

L922: ; Continuation
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L921
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g270)
  mov bp, g3
  mov dx, g270
  mov ax, [bp]
  jmp ax

L923: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L922
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L924: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L923
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f7)
  mov dx, [bp+14]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L925: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L924
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_183'9 (g269)
  mov bp, [bp+6]
  mov dx, g269
  mov ax, [bp]
  jmp ax

L926: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L925
  mov cx, sp
  ;; (96'21) Tail: implode (f2) @ case_89'2 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L927: ; Arm: 89'11
  push word g267
  push word '0'
  push word 1
  mov [6], sp
  ;; (0'0) Return: con_89'17 (t3)
  mov dx, [6]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L928: ; Continuation
  ;; (89'35) Tail: app_89'32 (arg) @ seci (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L929: ; Continuation
  mov ax, [bp+10]
  mov bx, 8
  call Bare_div
  mov [2], ax
  mov ax, [2]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [4], ax
  push word [2]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L926
  mov cx, sp
  mov bx, [4]
  cmp word [bx], 1
  jz L927
  push word [2]
  push word cx
  push word L928
  mov cx, sp
  ;; (89'32) Tail: loop (g266) @ con_89'32 (g268)
  mov bp, g266
  mov dx, g268
  mov ax, [bp]
  jmp ax

L930: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L929
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L931: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L930
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f6) @ app_33'25 (arg)
  mov bp, [bp+12]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L932: ; Continuation
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L931
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f6)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  mov ax, [bp]
  jmp ax

L933: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L932
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g265)
  mov bp, g3
  mov dx, g265
  mov ax, [bp]
  jmp ax

L934: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L933
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L935: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L934
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f6)
  mov dx, [bp+12]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L936: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L935
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_236'20 (g264)
  mov bp, [bp+6]
  mov dx, g264
  mov ax, [bp]
  jmp ax

L937: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L936
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L938: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L937
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f6) @ app_33'25 (arg)
  mov bp, [bp+12]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L939: ; Continuation
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L938
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f6)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  mov ax, [bp]
  jmp ax

L940: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L939
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g263)
  mov bp, g3
  mov dx, g263
  mov ax, [bp]
  jmp ax

L941: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L940
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L942: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L941
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f6)
  mov dx, [bp+12]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L943: ; Continuation
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L942
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ s1 (f6)
  mov dx, [bp+12]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L944: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L943
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L945: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L944
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f7) @ app_33'25 (arg)
  mov bp, [bp+14]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L946: ; Continuation
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L945
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f7)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  mov ax, [bp]
  jmp ax

L947: ; Continuation
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L946
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g262)
  mov bp, g3
  mov dx, g262
  mov ax, [bp]
  jmp ax

L948: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L947
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L949: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L948
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f7)
  mov dx, [bp+14]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L950: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L949
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_230'21 (g261)
  mov bp, [bp+6]
  mov dx, g261
  mov ax, [bp]
  jmp ax

L951: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L950
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L952: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L951
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f7) @ app_33'25 (arg)
  mov bp, [bp+14]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L953: ; Continuation
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L952
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f7)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+14]
  mov ax, [bp]
  jmp ax

L954: ; Continuation
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L953
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g260)
  mov bp, g3
  mov dx, g260
  mov ax, [bp]
  jmp ax

L955: ; Continuation
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L954
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L956: ; Continuation
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L955
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ lit_230'39 (g259)
  mov bp, [bp+6]
  mov dx, g259
  mov ax, [bp]
  jmp ax

L957: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L956
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ s1 (arg)
  mov bp, [bp+6]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L958: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L957
  mov cx, sp
  ;; (96'21) Tail: implode (f2) @ case_89'2 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L959: ; Arm: 89'11
  push word g257
  push word '0'
  push word 1
  mov [4], sp
  ;; (0'0) Return: con_89'17 (t2)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L960: ; Continuation
  ;; (89'35) Tail: app_89'32 (arg) @ seci (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L961: ; Continuation
  mov ax, [bp+12]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L958
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L959
  push word [bp+12]
  push word cx
  push word L960
  mov cx, sp
  ;; (89'32) Tail: loop (g256) @ con_89'32 (g258)
  mov bp, g256
  mov dx, g258
  mov ax, [bp]
  jmp ax

L962: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L961
  mov cx, sp
  ;; (96'21) Tail: implode (f2) @ case_89'2 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L963: ; Arm: 89'11
  push word g254
  push word '0'
  push word 1
  mov [6], sp
  ;; (0'0) Return: con_89'17 (t3)
  mov dx, [6]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L964: ; Continuation
  ;; (89'35) Tail: app_89'32 (arg) @ i (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L965: ; Continuation
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L736
  mov cx, sp
  mov bx, dx
  cmp word [bx], 1
  jz L764
  mov ax, [bp+10]
  mov bx, 8
  call Bare_div
  mov [2], ax
  mov ax, [bp+10]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [4], ax
  push word [2]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L962
  mov cx, sp
  mov bx, [4]
  cmp word [bx], 1
  jz L963
  push word [bp+10]
  push word cx
  push word L964
  mov cx, sp
  ;; (89'32) Tail: loop (g253) @ con_89'32 (g255)
  mov bp, g253
  mov dx, g255
  mov ax, [bp]
  jmp ax

L966: ; Arm: 228'33
  ;; (0'0) Return: con_228'38 (g240)
  mov dx, g240
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L967: ; Arm: 13'9
  ;; (0'0) Return: con_13'12 (g241)
  mov dx, g241
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L968: ; Function: t1
  mov ax, 125
  cmp word ax, dx
  call Bare_make_bool_from_n
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L714
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [4], ax
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L965
  mov cx, sp
  mov bx, [4]
  cmp word [bx], 1
  jz L966
  mov ax, dx
  cmp word ax, 256
  call Bare_make_bool_from_n
  mov [6], ax
  mov bx, [6]
  cmp word [bx], 1
  jz L967
  ;; (0'0) Return: con_14'13 (g242)
  mov dx, g242
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L969: ; Continuation
  ;; (0'0) Return: con_284'2 (g336)
  mov dx, g336
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L970: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L968
  mov [2], sp
  push word cx
  push word L969
  mov cx, sp
  ;; (277'7) Tail: loop (t1) @ 100
  mov bp, [2]
  mov dx, 100
  mov ax, [bp]
  jmp ax

L971: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L713
  mov [2], sp
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L970
  mov cx, sp
  ;; (268'7) Tail: loop (t1) @ 114
  mov bp, [2]
  mov dx, 114
  mov ax, [bp]
  jmp ax

L972: ; Continuation
  ;; MakeRef
  push word g23
  mov ax, sp
  ;; MakeRef-done
  mov [2], ax
  push word [bp+10]
  push word 0
  mov [4], sp
  push word [4]
  push word 0
  push word [2]
  push word 0
  mov [6], sp
  ;; MakeRef
  push word [6]
  mov ax, sp
  ;; MakeRef-done
  mov [8], ax
  push word [8]
  push word [bp+8]
  push word 0
  mov [10], sp
  push word [10]
  push word [bp+6]
  push word [bp+4]
  push word L435
  mov [12], sp
  push word [10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L971
  mov cx, sp
  ;; (259'7) Tail: loop (t6) @ 101
  mov bp, [12]
  mov dx, 101
  mov ax, [bp]
  jmp ax

L973: ; Continuation
  mov ax, 512
  call Bare_make_bytes
  mov [2], ax
  push word [2]
  push word dx
  push word L153
  mov [4], sp
  push word [2]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L972
  mov cx, sp
  ;; (122'7) Tail: loop (t2) @ 0
  mov bp, [4]
  mov dx, 0
  mov ax, [bp]
  jmp ax

L974: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L973
  mov cx, sp
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [2], ax
  ;; (139'43) Return: x (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L975: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L974
  mov cx, sp
  ;; (75'29) Tail: put_chars (g8) @ app_75'38 (arg)
  mov bp, g8
  mov dx, dx
  mov ax, [bp]
  jmp ax

L976: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L975
  mov cx, sp
  ;; (75'38) Tail: explode (f3) @ s (arg)
  mov bp, [bp+6]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L977: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L976
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L978: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L977
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f5) @ app_33'25 (arg)
  mov bp, [bp+10]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L979: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L978
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f6)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  mov ax, [bp]
  jmp ax

L980: ; Continuation
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L979
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g19)
  mov bp, g3
  mov dx, g19
  mov ax, [bp]
  jmp ax

L981: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L980
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L982: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L981
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f5)
  mov dx, [bp+10]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L983: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L982
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_107'45 (g18)
  mov bp, [bp+6]
  mov dx, g18
  mov ax, [bp]
  jmp ax

L984: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L983
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L985: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L984
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f5) @ app_33'25 (arg)
  mov bp, [bp+10]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L986: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L985
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f6)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  mov ax, [bp]
  jmp ax

L987: ; Continuation
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L986
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g17)
  mov bp, g3
  mov dx, g17
  mov ax, [bp]
  jmp ax

L988: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L987
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L989: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L988
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ lit_107'61 (g16)
  mov bp, [bp+6]
  mov dx, g16
  mov ax, [bp]
  jmp ax

L990: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L989
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ m (arg)
  mov bp, [bp+6]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L991: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L990
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L992: ; Continuation
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L991
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f4) @ app_33'25 (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L993: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L992
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f6)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  mov ax, [bp]
  jmp ax

L994: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L993
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g15)
  mov bp, g3
  mov dx, g15
  mov ax, [bp]
  jmp ax

L995: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L994
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L996: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L995
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ s2 (f5)
  mov dx, [bp+10]
  mov bp, [bp+6]
  mov ax, [bp]
  jmp ax

L997: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L996
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ lit_158'21 (g14)
  mov bp, [bp+6]
  mov dx, g14
  mov ax, [bp]
  jmp ax

L998: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L997
  mov cx, sp
  ;; (57'10) Tail: implode (f2) @ app_35'28 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L999: ; Continuation
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L998
  mov cx, sp
  ;; (35'28) Tail: app_35'25 (f4) @ app_33'25 (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L1000: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L999
  mov cx, sp
  ;; (33'25) Tail: app_33'22 (arg) @ xs (f6)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+12]
  mov ax, [bp]
  jmp ax

L1001: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1000
  mov cx, sp
  ;; (33'22) Tail: rev_onto (g3) @ con_33'22 (g13)
  mov bp, g3
  mov dx, g13
  mov ax, [bp]
  jmp ax

L1002: ; Continuation
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1001
  mov cx, sp
  ;; (35'25) Tail: rev_onto (g3) @ ys (arg)
  mov bp, g3
  mov dx, dx
  mov ax, [bp]
  jmp ax

L1003: ; Continuation
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1002
  mov cx, sp
  ;; (57'32) Tail: explode (f3) @ lit_158'50 (g12)
  mov bp, [bp+6]
  mov dx, g12
  mov ax, [bp]
  jmp ax

L1004: ; Continuation
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1003
  mov cx, sp
  ;; (57'19) Tail: explode (f3) @ s1 (arg)
  mov bp, [bp+6]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L1005: ; Continuation
  mov ax, 16384
  call Bare_make_bytes
  mov [2], ax
  push word [2]
  push word 0
  mov [4], sp
  push word g11
  push word '0'
  push word 1
  mov [6], sp
  push word [4]
  push word dx
  push word [bp+4]
  push word cx
  push word L1004
  mov cx, sp
  ;; (96'21) Tail: implode (f2) @ con_89'17 (t3)
  mov bp, [bp+4]
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L1006: ; Continuation
  push word dx
  push word cx
  push word L1005
  mov cx, sp
  ;; (49'23) Tail: block (g1) @ lam_49'28 (g7)
  mov bp, g1
  mov dx, g7
  mov ax, [bp]
  jmp ax

L1007: ; Start
  push word cx
  push word L1006
  mov cx, sp
  ;; (9'17) Tail: block (g1) @ lam_39'31 (g5)
  mov bp, g1
  mov dx, g5
  mov ax, [bp]
  jmp ax

g1: dw L2
g2: dw L5
g3: dw L9
g4: dw 0
g5: dw L17
g6: dw 0
g7: dw L23
g8: dw L29
g9: dw 0
g11: dw 0
g12: dw 11, ' ', ' ', ' ', '*', '*', 'S', 'L', 'O', 'W', '*', '*'
g13: dw 0
g14: dw 12, 'r', 'e', 'a', 'd', '_', 's', 'e', 'c', 't', 'o', 'r', ' '
g15: dw 0
g16: dw 1, `\n`
g17: dw 0
g18: dw 7, 't', 'r', 'a', 'c', 'e', ':', ' '
g19: dw 0
g20: dw 0
g21: dw 1
g22: dw 0
g23: dw 0
g24: dw 0
g25: dw 0
g26: dw 1
g27: dw 0
g28: dw 1
g29: dw L33
g30: dw 0
g31: dw 0
g32: dw 12, 'w', 'r', 'i', 't', 'e', '_', 'b', 'l', 'o', 'c', 'k', ' '
g33: dw 0
g34: dw 1, `\n`
g35: dw 0
g36: dw 7, 'e', 'r', 'r', 'o', 'r', ':', ' '
g37: dw 0
g38: dw 0
g39: dw L37
g40: dw 0
g41: dw 0
g42: dw L41
g43: dw 0
g44: dw 0
g45: dw 1, ']'
g46: dw 0
g47: dw 1, '['
g48: dw 0
g49: dw 0
g50: dw 12, 'w', 'r', 'i', 't', 'e', '_', 'b', 'l', 'o', 'c', 'k', ' '
g51: dw 0
g52: dw L45
g53: dw 0
g54: dw 0
g55: dw L49
g56: dw 0
g57: dw 0
g58: dw L53
g59: dw 0
g60: dw 6, ',', ' ', 'l', 'e', 'n', '='
g61: dw 0
g62: dw 0
g63: dw 9, ',', ' ', 'o', 'f', 'f', 's', 'e', 't', '='
g64: dw 0
g65: dw 0
g66: dw 21, 'u', 'p', 'd', 'a', 't', 'e', '_', 's', 'e', 'c', 't', 'o', 'r', 'C', '1', ' ', 's', 'e', 'c', 'i', '='
g67: dw 0
g68: dw 0
g69: dw 1
g70: dw 0
g71: dw 1
g72: dw 1
g73: dw 0
g74: dw 1
g75: dw L57
g76: dw 0
g77: dw 0
g78: dw 13, 'w', 'r', 'i', 't', 'e', '_', 's', 'e', 'c', 't', 'o', 'r', ' '
g79: dw 0
g80: dw 1, `\n`
g81: dw 0
g82: dw 7, 'e', 'r', 'r', 'o', 'r', ':', ' '
g83: dw 0
g84: dw 0
g85: dw L61
g86: dw 0
g87: dw 0
g88: dw 11, ' ', ' ', ' ', '*', '*', 'S', 'L', 'O', 'W', '*', '*'
g89: dw 0
g90: dw 13, 'w', 'r', 'i', 't', 'e', '_', 's', 'e', 'c', 't', 'o', 'r', ' '
g91: dw 0
g92: dw 1, `\n`
g93: dw 0
g94: dw 7, 't', 'r', 'a', 'c', 'e', ':', ' '
g95: dw 0
g96: dw 0
g97: dw 1
g98: dw 0
g99: dw 0
g100: dw 1
g101: dw 0
g102: dw 1
g103: dw L65
g104: dw 0
g105: dw 0
g106: dw 12, 'r', 'e', 'a', 'd', '_', 's', 'e', 'c', 't', 'o', 'r', ' '
g107: dw 0
g108: dw 1, `\n`
g109: dw 0
g110: dw 7, 'e', 'r', 'r', 'o', 'r', ':', ' '
g111: dw 0
g112: dw 0
g113: dw L69
g114: dw 0
g115: dw 0
g116: dw 11, ' ', ' ', ' ', '*', '*', 'S', 'L', 'O', 'W', '*', '*'
g117: dw 0
g118: dw 12, 'r', 'e', 'a', 'd', '_', 's', 'e', 'c', 't', 'o', 'r', ' '
g119: dw 0
g120: dw 1, `\n`
g121: dw 0
g122: dw 7, 't', 'r', 'a', 'c', 'e', ':', ' '
g123: dw 0
g124: dw 0
g125: dw 1
g126: dw 0
g127: dw 0
g128: dw 1
g129: dw 0
g130: dw 1
g131: dw 0
g132: dw L73
g133: dw 0
g134: dw 1
g135: dw 0
g136: dw 1
g137: dw L77
g138: dw 0
g139: dw 0
g140: dw 12, 'w', 'r', 'i', 't', 'e', '_', 'b', 'l', 'o', 'c', 'k', ' '
g141: dw 0
g142: dw 1, `\n`
g143: dw 0
g144: dw 7, 'e', 'r', 'r', 'o', 'r', ':', ' '
g145: dw 0
g146: dw 0
g147: dw L81
g148: dw 0
g149: dw 0
g150: dw L85
g151: dw 0
g152: dw 0
g153: dw 1, ']'
g154: dw 0
g155: dw 1, '['
g156: dw 0
g157: dw 0
g158: dw 12, 'w', 'r', 'i', 't', 'e', '_', 'b', 'l', 'o', 'c', 'k', ' '
g159: dw 0
g160: dw L89
g161: dw 0
g162: dw 0
g163: dw L93
g164: dw 0
g165: dw 0
g166: dw L97
g167: dw 0
g168: dw 6, ',', ' ', 'l', 'e', 'n', '='
g169: dw 0
g170: dw 0
g171: dw 9, ',', ' ', 'o', 'f', 'f', 's', 'e', 't', '='
g172: dw 0
g173: dw 0
g174: dw 21, 'u', 'p', 'd', 'a', 't', 'e', '_', 's', 'e', 'c', 't', 'o', 'r', 'C', '1', ' ', 's', 'e', 'c', 'i', '='
g175: dw 0
g176: dw 0
g177: dw 1
g178: dw 0
g179: dw 1
g180: dw 1
g181: dw 0
g182: dw 1
g183: dw L101
g184: dw 0
g185: dw 0
g186: dw 13, 'w', 'r', 'i', 't', 'e', '_', 's', 'e', 'c', 't', 'o', 'r', ' '
g187: dw 0
g188: dw 1, `\n`
g189: dw 0
g190: dw 7, 'e', 'r', 'r', 'o', 'r', ':', ' '
g191: dw 0
g192: dw 0
g193: dw L105
g194: dw 0
g195: dw 0
g196: dw 11, ' ', ' ', ' ', '*', '*', 'S', 'L', 'O', 'W', '*', '*'
g197: dw 0
g198: dw 13, 'w', 'r', 'i', 't', 'e', '_', 's', 'e', 'c', 't', 'o', 'r', ' '
g199: dw 0
g200: dw 1, `\n`
g201: dw 0
g202: dw 7, 't', 'r', 'a', 'c', 'e', ':', ' '
g203: dw 0
g204: dw 0
g205: dw 1
g206: dw 0
g207: dw 0
g208: dw 1
g209: dw 0
g210: dw 1
g211: dw L109
g212: dw 0
g213: dw 0
g214: dw 12, 'r', 'e', 'a', 'd', '_', 's', 'e', 'c', 't', 'o', 'r', ' '
g215: dw 0
g216: dw 1, `\n`
g217: dw 0
g218: dw 7, 'e', 'r', 'r', 'o', 'r', ':', ' '
g219: dw 0
g220: dw 0
g221: dw L113
g222: dw 0
g223: dw 0
g224: dw 11, ' ', ' ', ' ', '*', '*', 'S', 'L', 'O', 'W', '*', '*'
g225: dw 0
g226: dw 12, 'r', 'e', 'a', 'd', '_', 's', 'e', 'c', 't', 'o', 'r', ' '
g227: dw 0
g228: dw 1, `\n`
g229: dw 0
g230: dw 7, 't', 'r', 'a', 'c', 'e', ':', ' '
g231: dw 0
g232: dw 0
g233: dw 1
g234: dw 0
g235: dw 0
g236: dw 1
g237: dw 0
g238: dw 1
g239: dw 0
g240: dw 1
g241: dw 0
g242: dw 1
g243: dw L117
g244: dw 0
g245: dw 0
g246: dw 11, 'r', 'e', 'a', 'd', '_', 'b', 'l', 'o', 'c', 'k', ' '
g247: dw 0
g248: dw 1, `\n`
g249: dw 0
g250: dw 7, 'e', 'r', 'r', 'o', 'r', ':', ' '
g251: dw 0
g252: dw 0
g253: dw L121
g254: dw 0
g255: dw 0
g256: dw L125
g257: dw 0
g258: dw 0
g259: dw 1, ']'
g260: dw 0
g261: dw 1, '['
g262: dw 0
g263: dw 0
g264: dw 11, 'r', 'e', 'a', 'd', '_', 'b', 'l', 'o', 'c', 'k', ' '
g265: dw 0
g266: dw L129
g267: dw 0
g268: dw 0
g269: dw 19, 'r', 'e', 'a', 'd', '_', 's', 'e', 'c', 't', 'o', 'r', 'C', '1', ' ', 's', 'e', 'c', 'i', '='
g270: dw 0
g271: dw 1
g272: dw 0
g273: dw 1
g274: dw L133
g275: dw 0
g276: dw 0
g277: dw 13, 'w', 'r', 'i', 't', 'e', '_', 's', 'e', 'c', 't', 'o', 'r', ' '
g278: dw 0
g279: dw 1, `\n`
g280: dw 0
g281: dw 7, 'e', 'r', 'r', 'o', 'r', ':', ' '
g282: dw 0
g283: dw 0
g284: dw L137
g285: dw 0
g286: dw 0
g287: dw 11, ' ', ' ', ' ', '*', '*', 'S', 'L', 'O', 'W', '*', '*'
g288: dw 0
g289: dw 13, 'w', 'r', 'i', 't', 'e', '_', 's', 'e', 'c', 't', 'o', 'r', ' '
g290: dw 0
g291: dw 1, `\n`
g292: dw 0
g293: dw 7, 't', 'r', 'a', 'c', 'e', ':', ' '
g294: dw 0
g295: dw 0
g296: dw 1
g297: dw 0
g298: dw 0
g299: dw 1
g300: dw 0
g301: dw 1
g302: dw L141
g303: dw 0
g304: dw 0
g305: dw 12, 'r', 'e', 'a', 'd', '_', 's', 'e', 'c', 't', 'o', 'r', ' '
g306: dw 0
g307: dw 1, `\n`
g308: dw 0
g309: dw 7, 'e', 'r', 'r', 'o', 'r', ':', ' '
g310: dw 0
g311: dw 0
g312: dw L145
g313: dw 0
g314: dw 0
g315: dw 11, ' ', ' ', ' ', '*', '*', 'S', 'L', 'O', 'W', '*', '*'
g316: dw 0
g317: dw 12, 'r', 'e', 'a', 'd', '_', 's', 'e', 'c', 't', 'o', 'r', ' '
g318: dw 0
g319: dw 1, `\n`
g320: dw 0
g321: dw 7, 't', 'r', 'a', 'c', 'e', ':', ' '
g322: dw 0
g323: dw 0
g324: dw 1
g325: dw 0
g326: dw 0
g327: dw 0
g328: dw 1
g329: dw 0
g330: dw L149
g331: dw 0
g332: dw 0
g333: dw 3, ' ', ':', ' '
g334: dw 0
g335: dw 0
g336: dw 0

bare_start: jmp L1007
