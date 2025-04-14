(*Stage5 (ASM)*)
L1: ; Function: t1
  ;; (10'54) Tail: f (f1) @ a (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L2: ; Function: g1
  push dx
  push #L1
  mov 1, sp
  ;; (0'0) Return: lam_10'31 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L3: ; Arm: 16'7
  ;; (16'10) Return: 0
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
  ;; (17'27) Tail: length (g2) @ xs (t2)
  mov bp, [102]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L6: ; Arm: 21'7
  ;; (0'0) Return: con_21'10 (g4)
  mov dx, [104]
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
  ;; (22'26) Tail: app_22'24 (arg) @ xs (f2)
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
  ;; (22'24) Tail: map (g3) @ f (f2)
  mov dx, [bp+2]
  mov bp, [103]
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
  ;; (22'15) Tail: f (f1) @ x (t1)
  mov bp, [bp+1]
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L11: ; Function: g3
  push dx
  push #L10
  mov 1, sp
  ;; (0'0) Return: lam_19'14 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L12: ; Arm: 26'7
  ;; (0'0) Return: con_26'10 (g6)
  mov dx, [106]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L13: ; Continuation
  ;; (27'25) Tail: app_27'23 (arg) @ xs (f2)
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
  ;; (27'23) Tail: iter (g5) @ f (f2)
  mov dx, [bp+2]
  mov bp, [105]
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
  ;; (27'15) Tail: f (f1) @ x (t1)
  mov bp, [bp+1]
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L16: ; Function: g5
  push dx
  push #L15
  mov 1, sp
  ;; (0'0) Return: lam_24'15 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L17: ; Arm: 31'7
  ;; (29'20) Return: b (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L18: ; Continuation
  ;; (32'33) Tail: app_32'25 (arg) @ xs (f2)
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
  ;; (32'25) Tail: app_32'23 (f2) @ app_32'30 (arg)
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
  ;; (32'30) Tail: app_32'28 (arg) @ x (f3)
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
  ;; (32'28) Tail: f (f2) @ b (f3)
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
  ;; (32'23) Tail: fold_left (g7) @ f (f1)
  mov dx, [bp+1]
  mov bp, [107]
  mov ax, [bp]
  jmp [ax]

L23: ; Function: t1
  push dx
  push [bp+1]
  push #L22
  mov 1, sp
  ;; (0'0) Return: lam_29'22 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L24: ; Function: g7
  push dx
  push #L23
  mov 1, sp
  ;; (0'0) Return: lam_29'20 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L25: ; Arm: 36'7
  ;; (34'18) Return: ys (arg)
  mov dx, dx
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L26: ; Continuation
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

L27: ; Continuation
  push [bp+3]
  push cx
  push #L26
  mov cx, sp
  ;; (37'28) Tail: app_37'25 (arg) @ ys (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L28: ; Function: t1
  mov bx, [bp+1]
  cmp [bx], #0
  bz L25
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push [1]
  push dx
  push cx
  push #L27
  mov cx, sp
  ;; (37'25) Tail: append (g8) @ xs (t2)
  mov bp, [108]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L29: ; Function: g8
  push dx
  push #L28
  mov 1, sp
  ;; (0'0) Return: lam_34'18 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L30: ; Arm: 42'9
  ;; (40'18) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L31: ; Continuation
  ;; (43'34) Tail: app_43'23 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L32: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L30
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
  push #L31
  mov cx, sp
  ;; (43'23) Tail: revloop (g9) @ con_0'0 (t3)
  mov bp, [109]
  mov dx, [3]
  mov ax, [bp]
  jmp [ax]

L33: ; Function: g9
  push dx
  push #L32
  mov 1, sp
  ;; (0'0) Return: lam_40'22 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L34: ; Arm: 53'9
  ;; (0'0) Return: con_53'12 (g10)
  mov dx, [110]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L35: ; Continuation
  ;; (54'43) Tail: app_54'37 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L36: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L34
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
  push #L35
  mov cx, sp
  ;; (54'37) Tail: loop (f3) @ prim_0'0 (t4)
  mov bp, [bp+3]
  mov dx, [4]
  mov ax, [bp]
  jmp [ax]

L37: ; Function: t2
  push bp
  push dx
  push [bp+1]
  push #L36
  mov 1, sp
  ;; (0'0) Return: lam_51'17 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L38: ; Continuation
  mov ax, [bp+2]
  call bios_freeze_bytes
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L39: ; Continuation
  push [bp+3]
  push cx
  push #L38
  mov cx, sp
  ;; (56'9) Tail: app_56'7 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L40: ; Continuation
  mov ax, dx
  call bios_make_bytes
  mov 1, ax
  push [1]
  push #L37
  mov 2, sp
  push [1]
  push [bp+2]
  push cx
  push #L39
  mov cx, sp
  ;; (56'7) Tail: loop (t2) @ 0
  mov bp, [2]
  mov dx, #0
  mov ax, [bp]
  jmp [ax]

L41: ; Function: g11
  push dx
  push cx
  push #L40
  mov cx, sp
  ;; (50'29) Tail: length (g2) @ xs (arg)
  mov bp, [102]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L42: ; Arm: 64'9
  ;; (0'0) Return: con_64'12 (g12)
  mov dx, [112]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L43: ; Continuation
  ;; (65'43) Tail: app_65'37 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L44: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L42
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
  push #L43
  mov cx, sp
  ;; (65'37) Tail: loop (f3) @ prim_0'0 (t4)
  mov bp, [bp+3]
  mov dx, [4]
  mov ax, [bp]
  jmp [ax]

L45: ; Function: t2
  push bp
  push dx
  push [bp+1]
  push #L44
  mov 1, sp
  ;; (0'0) Return: lam_62'17 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L46: ; Continuation
  mov ax, [bp+2]
  call bios_freeze_bytes
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L47: ; Continuation
  push [bp+3]
  push cx
  push #L46
  mov cx, sp
  ;; (67'13) Tail: app_67'7 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L48: ; Continuation
  mov ax, dx
  call bios_make_bytes
  mov 1, ax
  push [1]
  push #L45
  mov 2, sp
  mov ax, dx
  sub ax, #1
  mov 3, ax
  push [1]
  push [bp+2]
  push cx
  push #L47
  mov cx, sp
  ;; (67'7) Tail: loop (t2) @ prim_0'0 (t3)
  mov bp, [2]
  mov dx, [3]
  mov ax, [bp]
  jmp [ax]

L49: ; Function: g13
  push dx
  push cx
  push #L48
  mov cx, sp
  ;; (60'17) Tail: length (g2) @ xs (arg)
  mov bp, [102]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L50: ; Arm: 72'13
  ;; (71'23) Return: acc (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L51: ; Continuation
  mov ax, [bp+2]
  sub ax, #1
  mov 1, ax
  ;; (73'45) Tail: app_73'19 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L52: ; Function: t1
  mov ax, dx
  cmp ax, #0
  call bios_make_bool_from_n
  mov 1, ax
  mov bx, [1]
  cmp [bx], #1
  bz L50
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
  push #L51
  mov cx, sp
  ;; (73'19) Tail: explode_loop (f3) @ con_0'0 (t3)
  mov bp, [bp+3]
  mov dx, [3]
  mov ax, [bp]
  jmp [ax]

L53: ; Function: t1
  push bp
  push dx
  push [bp+1]
  push #L52
  mov 1, sp
  ;; (0'0) Return: lam_71'27 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L54: ; Continuation
  mov ax, [bp+2]
  sub ax, #1
  mov 1, ax
  ;; (75'18) Tail: app_75'15 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L55: ; Function: g15
  push dx
  push #L53
  mov 1, sp
  mov ax, dx
  call bios_string_length
  mov 2, ax
  push [2]
  push cx
  push #L54
  mov cx, sp
  ;; (75'15) Tail: explode_loop (t1) @ con_75'15 (g14)
  mov bp, [1]
  mov dx, [114]
  mov ax, [bp]
  jmp [ax]

L56: ; Arm: 80'19
  ;; (0'0) Return: con_80'24 (g18)
  mov dx, [118]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L57: ; Arm: 82'15
  ;; (0'0) Return: con_82'20 (g19)
  mov dx, [119]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L58: ; Arm: 85'31
  ;; (0'0) Return: con_85'36 (g22)
  mov dx, [122]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L59: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L58
  mov ax, [bp+2]
  sub ax, #1
  mov 1, ax
  ;; (85'52) Tail: loop (f3) @ prim_0'0 (t1)
  mov bp, [bp+3]
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L60: ; Arm: 4'9
  ;; (0'0) Return: con_4'12 (g20)
  mov dx, [120]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L61: ; Function: t1
  mov ax, dx
  cmp ax, #0
  call bios_make_bool_from_n
  mov 1, ax
  mov bx, [1]
  cmp [bx], #1
  bz L57
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
  push #L59
  mov cx, sp
  mov bx, [4]
  cmp [bx], #1
  bz L60
  ;; (0'0) Return: con_5'13 (g21)
  mov dx, [121]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L62: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L56
  push [bp+3]
  push [bp+2]
  push #L61
  mov 1, sp
  mov ax, [bp+4]
  sub ax, #1
  mov 2, ax
  ;; (87'9) Tail: loop (t1) @ prim_0'0 (t2)
  mov bp, [1]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L63: ; Arm: 4'9
  ;; (0'0) Return: con_4'12 (g16)
  mov dx, [116]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L64: ; Function: t1
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
  push #L62
  mov cx, sp
  mov bx, [3]
  cmp [bx], #1
  bz L63
  ;; (0'0) Return: con_5'13 (g17)
  mov dx, [117]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L65: ; Function: g23
  push dx
  push #L64
  mov 1, sp
  ;; (0'0) Return: lam_77'33 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L66: ; Arm: 100'7
  ;; (0'0) Return: con_100'10 (g26)
  mov dx, [126]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L67: ; Function: g25
  mov bx, dx
  cmp [bx], #0
  bz L66
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov ax, [1]
  call bios_put_char
  mov 3, ax
  ;; (101'35) Tail: put_chars (g25) @ xs (t2)
  mov bp, [125]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L68: ; Function: g63
  mov bx, dx
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  ;; (211'44) Return: name (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L69: ; Arm: 93'7
  ;; (0'0) Return: lit_93'10 (g24)
  mov dx, [124]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L70: ; Continuation
  ;; (89'34) Tail: implode (f2) @ app_89'55 (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L71: ; Continuation
  push [bp+2]
  push cx
  push #L70
  mov cx, sp
  ;; (89'55) Tail: app_89'42 (f3) @ app_89'64 (arg)
  mov bp, [bp+3]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L72: ; Continuation
  push dx
  push [bp+2]
  push cx
  push #L71
  mov cx, sp
  ;; (89'64) Tail: explode (f3) @ s2 (f4)
  mov dx, [bp+4]
  mov bp, [bp+3]
  mov ax, [bp]
  jmp [ax]

L73: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L72
  mov cx, sp
  ;; (89'42) Tail: append (g8) @ app_89'51 (arg)
  mov bp, [108]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L74: ; Continuation
  push dx
  push [bp+3]
  push [bp+2]
  push cx
  push #L73
  mov cx, sp
  ;; (89'51) Tail: explode (f3) @ x (f4)
  mov dx, [bp+4]
  mov bp, [bp+3]
  mov ax, [bp]
  jmp [ax]

L75: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L69
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push [1]
  push [bp+2]
  push [bp+1]
  push cx
  push #L74
  mov cx, sp
  ;; (94'37) Tail: concat (me) @ xs (t2)
  mov bp, bp
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L76: ; Continuation
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

L77: ; Arm: 140'11
  push [bp+3]
  push cx
  push #L76
  mov cx, sp
  ;; (140'30) Tail: reverse_implode (f1) @ accCs (f5)
  mov dx, [bp+5]
  mov bp, [bp+1]
  mov ax, [bp]
  jmp [ax]

L78: ; Continuation
  ;; (142'78) Tail: app_142'45 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L79: ; Continuation
  push [bp+3]
  push dx
  push #1
  mov 1, sp
  push [bp+4]
  push cx
  push #L78
  mov cx, sp
  ;; (142'45) Tail: at_word_start (f2) @ con_0'0 (t1)
  mov bp, [bp+2]
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L80: ; Arm: 142'26
  push [2]
  push [bp+3]
  push [bp+2]
  push cx
  push #L79
  mov cx, sp
  ;; (142'62) Tail: reverse_implode (f1) @ accCs (f5)
  mov dx, [bp+5]
  mov bp, [bp+1]
  mov ax, [bp]
  jmp [ax]

L81: ; Continuation
  ;; (143'43) Tail: app_143'32 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L82: ; Continuation
  push [bp+2]
  push [bp+3]
  push #1
  mov 1, sp
  push [bp+4]
  push cx
  push #L81
  mov cx, sp
  ;; (143'32) Tail: app_143'26 (arg) @ con_0'0 (t1)
  mov bp, dx
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L83: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L77
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
  bz L80
  push [2]
  push [1]
  push [bp+5]
  push cx
  push #L82
  mov cx, sp
  ;; (143'26) Tail: have_letter (f4) @ accWs (f3)
  mov dx, [bp+3]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp [ax]

L84: ; Function: t1
  push dx
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push #L83
  mov 1, sp
  ;; (0'0) Return: lam_138'36 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L85: ; Function: t1
  push bp
  push dx
  push [bp+2]
  push [bp+1]
  push #L84
  mov 1, sp
  ;; (0'0) Return: lam_138'30 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L86: ; Arm: 147'9
  ;; (137'24) Return: accWs (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L87: ; Continuation
  ;; (149'49) Tail: app_149'43 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L88: ; Arm: 149'24
  push [2]
  push cx
  push #L87
  mov cx, sp
  ;; (149'43) Tail: at_word_start (f2) @ accWs (f1)
  mov dx, [bp+1]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L89: ; Continuation
  ;; (150'31) Tail: app_150'27 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L90: ; Continuation
  push [127]
  push [bp+2]
  push #1
  mov 1, sp
  push [bp+3]
  push cx
  push #L89
  mov cx, sp
  ;; (150'27) Tail: app_150'21 (arg) @ con_150'28 (t1)
  mov bp, dx
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L91: ; Function: t2
  mov bx, dx
  cmp [bx], #0
  bz L86
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
  bz L88
  push [2]
  push [1]
  push cx
  push #L90
  mov cx, sp
  ;; (150'21) Tail: have_letter (f3) @ accWs (f1)
  mov dx, [bp+1]
  mov bp, [bp+3]
  mov ax, [bp]
  jmp [ax]

L92: ; Function: t2
  push bp
  push [bp+1]
  push #L85
  mov 1, sp
  push [1]
  push bp
  push dx
  push #L91
  mov 2, sp
  ;; (0'0) Return: lam_145'8 (t2)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L93: ; Arm: 121'22
  mov ax, #'\n'
  call bios_put_char
  mov 4, ax
  ;; (121'55) Tail: reverse_implode (f1) @ acc (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L94: ; Arm: 122'28
  mov ax, #'\EOT'
  call bios_put_char
  mov 5, ax
  mov ax, #'\n'
  call bios_put_char
  mov 6, ax
  push dx
  push #'\EOT'
  push #1
  mov 7, sp
  ;; (122'80) Tail: reverse_implode (f1) @ con_0'0 (t7)
  mov bp, [bp+1]
  mov dx, [7]
  mov ax, [bp]
  jmp [ax]

L95: ; Arm: 123'19
  ;; (123'33) Tail: readloop (me) @ acc (arg)
  mov bp, bp
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L96: ; Arm: 126'17
  ;; (126'29) Tail: readloop (me) @ acc (arg)
  mov bp, bp
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L97: ; Continuation
  mov ax, #'\b'
  call bios_put_char
  mov 1, ax
  mov ax, #' '
  call bios_put_char
  mov 2, ax
  mov ax, #'\b'
  call bios_put_char
  mov 3, ax
  ;; (130'24) Tail: readloop (f2) @ tail (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L98: ; Arm: 128'31
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

L99: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L97
  mov cx, sp
  mov bx, dx
  cmp [bx], #1
  bz L98
  ;; (0'0) Return: con_128'55 (g33)
  mov dx, [133]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L100: ; Arm: 4'9
  ;; (0'0) Return: con_4'12 (g31)
  mov dx, [131]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L101: ; Arm: 124'21
  mov bx, dx
  cmp [bx], #0
  bz L96
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
  push #L99
  mov cx, sp
  mov bx, [10]
  cmp [bx], #1
  bz L100
  ;; (0'0) Return: con_5'13 (g32)
  mov dx, [132]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L102: ; Function: t1
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
  bz L93
  mov ax, [1]
  cmp ax, #'\EOT'
  call bios_make_bool_from_z
  mov 4, ax
  mov bx, [4]
  cmp [bx], #1
  bz L94
  mov ax, #127
  cmp ax, [2]
  call bios_make_bool_from_n
  mov 5, ax
  mov bx, [5]
  cmp [bx], #1
  bz L95
  mov ax, [2]
  cmp ax, #127
  call bios_make_bool_from_z
  mov 6, ax
  mov bx, [6]
  cmp [bx], #1
  bz L101
  mov ax, [1]
  call bios_put_char
  mov 7, ax
  push dx
  push [1]
  push #1
  mov 8, sp
  ;; (132'34) Tail: readloop (me) @ con_0'0 (t8)
  mov bp, bp
  mov dx, [8]
  mov ax, [bp]
  jmp [ax]

L103: ; Arm: 202'36
  ;; (0'0) Return: con_202'41 (g35)
  mov dx, [135]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L104: ; Continuation
  ;; (204'13) Tail: mainloop (f2) @ fs (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L105: ; Arm: 195'7
  ;; (198'17) Return: fs (f5)
  mov dx, [bp+5]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L106: ; Arm: 166'9
  ;; (0'0) Return: con_166'12 (g38)
  mov dx, [138]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L107: ; Arm: 170'35
  push [bp+4]
  push #1
  mov 1, sp
  ;; (0'0) Return: con_170'40 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L108: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L107
  ;; (170'60) Tail: loop (f2) @ ps (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L109: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push cx
  push #L108
  mov cx, sp
  ;; (170'28) Tail: app_170'23 (arg) @ command (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L110: ; Function: t3
  mov bx, dx
  cmp [bx], #0
  bz L106
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
  push #L109
  mov cx, sp
  ;; (170'23) Tail: eq_string (f1) @ name (t3)
  mov bp, [bp+1]
  mov dx, [3]
  mov ax, [bp]
  jmp [ax]

L111: ; Continuation
  ;; (198'17) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L112: ; Continuation
  push [bp+2]
  push cx
  push #L111
  mov cx, sp
  ;; (103'29) Tail: put_chars (g25) @ app_103'38 (arg)
  mov bp, [125]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L113: ; Continuation
  push [bp+3]
  push cx
  push #L112
  mov cx, sp
  ;; (103'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L114: ; Arm: 187'9
  push [146]
  push [bp+5]
  push #1
  mov 1, sp
  push [1]
  push [139]
  push #1
  mov 2, sp
  push [bp+4]
  push [bp+2]
  push cx
  push #L113
  mov cx, sp
  ;; (185'33) Tail: concat (f3) @ con_185'34 (t2)
  mov bp, [bp+3]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L115: ; Continuation
  ;; (198'17) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L116: ; Continuation
  push [bp+2]
  push cx
  push #L115
  mov cx, sp
  ;; (103'29) Tail: put_chars (g25) @ app_103'38 (arg)
  mov bp, [125]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L117: ; Continuation
  push [bp+3]
  push cx
  push #L116
  mov cx, sp
  ;; (103'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L118: ; Arm: 190'14
  mov ax, [bx+1]
  mov 2, ax
  push [154]
  push [bp+5]
  push #1
  mov 3, sp
  push [3]
  push [147]
  push #1
  mov 4, sp
  push [bp+4]
  push [bp+2]
  push cx
  push #L117
  mov cx, sp
  ;; (185'33) Tail: concat (f3) @ con_185'34 (t4)
  mov bp, [bp+3]
  mov dx, [4]
  mov ax, [bp]
  jmp [ax]

L119: ; Continuation
  ;; (191'32) Tail: app_191'29 (arg) @ args (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L120: ; Continuation
  mov bx, dx
  cmp [bx], #0
  bz L114
  mov ax, [bx+1]
  mov 1, ax
  mov bx, [1]
  cmp [bx], #0
  bz L118
  mov ax, [bx+1]
  mov 2, ax
  mov ax, [bx+2]
  mov 3, ax
  push [bp+6]
  push cx
  push #L119
  mov cx, sp
  ;; (191'29) Tail: f (t3) @ fs (f4)
  mov dx, [bp+4]
  mov bp, [3]
  mov ax, [bp]
  jmp [ax]

L121: ; Continuation
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L120
  mov cx, sp
  ;; (172'17) Tail: loop (f7) @ case_161'18 (arg)
  mov bp, [bp+7]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L122: ; Continuation
  push [bp+6]
  push cx
  push #L104
  mov cx, sp
  mov bx, dx
  cmp [bx], #0
  bz L105
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push [1]
  push [bp+3]
  push #L110
  mov 3, sp
  push [3]
  push [2]
  push [1]
  push [bp+5]
  push [bp+4]
  push [bp+2]
  push cx
  push #L121
  mov cx, sp
  mov bx, [bp+5]
  mov ax, [bx+1]
  mov 4, ax
  ;; (161'43) Return: ps (t4)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L123: ; Continuation
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L122
  mov cx, sp
  ;; (45'23) Tail: app_45'20 (arg) @ xs (f7)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+7]
  mov ax, [bp]
  jmp [ax]

L124: ; Continuation
  push dx
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L123
  mov cx, sp
  ;; (45'20) Tail: revloop (g9) @ con_45'20 (g37)
  mov bp, [109]
  mov dx, [137]
  mov ax, [bp]
  jmp [ax]

L125: ; Continuation
  push [bp+7]
  push [bp+6]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L124
  mov cx, sp
  ;; (153'37) Tail: app_153'34 (f5) @ app_153'46 (arg)
  mov bp, [bp+5]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L126: ; Continuation
  push [bp+6]
  push [bp+5]
  push dx
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L125
  mov cx, sp
  ;; (153'46) Tail: explode (f2) @ line (f7)
  mov dx, [bp+7]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L127: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L103
  push [bp+8]
  push [bp+7]
  push [bp+6]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L126
  mov cx, sp
  ;; (153'34) Tail: at_word_start (f5) @ con_153'34 (g36)
  mov bp, [bp+5]
  mov dx, [136]
  mov ax, [bp]
  jmp [ax]

L128: ; Continuation
  push [bp+9]
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L127
  mov cx, sp
  ;; (202'20) Tail: app_202'15 (arg) @ single_controlD (f8)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+8]
  mov ax, [bp]
  jmp [ax]

L129: ; Continuation
  push dx
  push [bp+8]
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L128
  mov cx, sp
  ;; (202'15) Tail: eq_string (f3) @ line (arg)
  mov bp, [bp+3]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L130: ; Continuation
  push [bp+2]
  push #L102
  mov 1, sp
  push dx
  push [bp+8]
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push cx
  push #L129
  mov cx, sp
  ;; (134'11) Tail: readloop (t1) @ con_134'11 (g34)
  mov bp, [1]
  mov dx, [134]
  mov ax, [bp]
  jmp [ax]

L131: ; Continuation
  push [129]
  push #'\EOT'
  push #1
  mov 1, sp
  push [bp+9]
  push [bp+8]
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push cx
  push #L130
  mov cx, sp
  ;; (200'32) Tail: implode (f2) @ con_0'0 (t1)
  mov bp, [bp+2]
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L132: ; Continuation
  push [bp+9]
  push [bp+8]
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L131
  mov cx, sp
  ;; (103'29) Tail: put_chars (g25) @ app_103'38 (arg)
  mov bp, [125]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L133: ; Function: t3
  push bp
  push dx
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push cx
  push #L132
  mov cx, sp
  ;; (103'38) Tail: explode (f3) @ lit_199'13 (g28)
  mov bp, [bp+3]
  mov dx, [128]
  mov ax, [bp]
  jmp [ax]

L134: ; Continuation
  ;; (206'17) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L135: ; Continuation
  push [bp+2]
  push cx
  push #L134
  mov cx, sp
  ;; (103'29) Tail: put_chars (g25) @ app_103'38 (arg)
  mov bp, [125]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L136: ; Arm: 208'9
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push [bp+2]
  push cx
  push #L135
  mov cx, sp
  ;; (103'38) Tail: explode (f1) @ lit_208'23 (g62)
  mov bp, [bp+1]
  mov dx, [162]
  mov ax, [bp]
  jmp [ax]

L137: ; Arm: 177'9
  ;; (0'0) Return: con_177'12 (g64)
  mov dx, [164]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L138: ; Continuation
  ;; (178'48) Tail: loop (f2) @ xs (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L139: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L138
  mov cx, sp
  ;; (103'29) Tail: put_chars (g25) @ app_103'38 (arg)
  mov bp, [125]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L140: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L137
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
  push #L139
  mov cx, sp
  ;; (103'38) Tail: explode (f1) @ x (t1)
  mov bp, [bp+1]
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L141: ; Continuation
  mov ax, #'\n'
  call bios_put_char
  mov 1, ax
  ;; (206'17) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L142: ; Arm: 181'9
  ;; (0'0) Return: con_181'12 (g65)
  mov dx, [165]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L143: ; Continuation
  ;; (182'34) Tail: loop (f2) @ xs (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L144: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L143
  mov cx, sp
  ;; (103'29) Tail: put_chars (g25) @ app_103'38 (arg)
  mov bp, [125]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L145: ; Continuation
  push [bp+2]
  push #L140
  mov 1, sp
  push [bp+3]
  push cx
  push #L141
  mov cx, sp
  mov bx, dx
  cmp [bx], #0
  bz L142
  mov ax, [bx+1]
  mov 2, ax
  mov ax, [bx+2]
  mov 3, ax
  push [3]
  push [1]
  push cx
  push #L144
  mov cx, sp
  ;; (103'38) Tail: explode (f2) @ x (t2)
  mov bp, [bp+2]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L146: ; Continuation
  push [bp+4]
  push [bp+2]
  push cx
  push #L145
  mov cx, sp
  ;; (212'43) Tail: app_212'33 (f3) @ case_161'18 (arg)
  mov bp, [bp+3]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L147: ; Continuation
  push [bp+3]
  push dx
  push [bp+2]
  push cx
  push #L146
  mov cx, sp
  mov bx, [bp+3]
  mov ax, [bx+1]
  mov 1, ax
  ;; (161'43) Return: ps (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L148: ; Function: t1
  mov bx, dx
  cmp [bx], #1
  bz L136
  push [bp+2]
  push [bp+1]
  push cx
  push #L147
  mov cx, sp
  ;; (212'33) Tail: map (g3) @ lam_211'19 (g63)
  mov bp, [103]
  mov dx, [163]
  mov ax, [bp]
  jmp [ax]

L149: ; Function: t1
  push dx
  push [bp+1]
  push #L148
  mov 1, sp
  ;; (0'0) Return: lam_206'20 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L150: ; Continuation
  ;; (214'18) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L151: ; Continuation
  push [bp+2]
  push cx
  push #L150
  mov cx, sp
  ;; (103'29) Tail: put_chars (g25) @ app_103'38 (arg)
  mov bp, [125]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L152: ; Arm: 224'7
  push [bp+4]
  push cx
  push #L151
  mov cx, sp
  ;; (103'38) Tail: explode (f1) @ lit_224'22 (g68)
  mov bp, [bp+1]
  mov dx, [168]
  mov ax, [bp]
  jmp [ax]

L153: ; Arm: 166'9
  ;; (0'0) Return: con_166'12 (g69)
  mov dx, [169]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L154: ; Arm: 170'35
  push [bp+4]
  push #1
  mov 1, sp
  ;; (0'0) Return: con_170'40 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L155: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L154
  ;; (170'60) Tail: loop (f2) @ ps (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L156: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push cx
  push #L155
  mov cx, sp
  ;; (170'28) Tail: app_170'23 (arg) @ x (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L157: ; Function: t3
  mov bx, dx
  cmp [bx], #0
  bz L153
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
  push #L156
  mov cx, sp
  ;; (170'23) Tail: eq_string (f1) @ name (t3)
  mov bp, [bp+1]
  mov dx, [3]
  mov ax, [bp]
  jmp [ax]

L158: ; Arm: 166'9
  ;; (0'0) Return: con_166'12 (g78)
  mov dx, [178]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L159: ; Arm: 170'35
  push [bp+4]
  push #1
  mov 1, sp
  ;; (0'0) Return: con_170'40 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L160: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L159
  ;; (170'60) Tail: loop (f2) @ ps (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L161: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push cx
  push #L160
  mov cx, sp
  ;; (170'28) Tail: app_170'23 (arg) @ x (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L162: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L158
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
  push #L161
  mov cx, sp
  ;; (170'23) Tail: eq_string (f1) @ name (t3)
  mov bp, [bp+1]
  mov dx, [3]
  mov ax, [bp]
  jmp [ax]

L163: ; Continuation
  ;; (103'29) Tail: put_chars (g25) @ app_103'38 (arg)
  mov bp, [125]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L164: ; Continuation
  push cx
  push #L163
  mov cx, sp
  ;; (103'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L165: ; Arm: 217'11
  push [182]
  push [bp+4]
  push #1
  mov 1, sp
  push [1]
  push [179]
  push #1
  mov 2, sp
  push [bp+2]
  push cx
  push #L164
  mov cx, sp
  ;; (217'33) Tail: concat (f3) @ con_217'34 (t2)
  mov bp, [bp+3]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L166: ; Continuation
  ;; (103'29) Tail: put_chars (g25) @ app_103'38 (arg)
  mov bp, [125]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L167: ; Arm: 220'16
  mov ax, [bx+1]
  mov 2, ax
  push cx
  push #L166
  mov cx, sp
  ;; (103'38) Tail: explode (f2) @ s (t2)
  mov bp, [bp+2]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L168: ; Continuation
  ;; (103'29) Tail: put_chars (g25) @ app_103'38 (arg)
  mov bp, [125]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L169: ; Continuation
  push cx
  push #L168
  mov cx, sp
  ;; (103'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L170: ; Continuation
  mov bx, dx
  cmp [bx], #0
  bz L165
  mov ax, [bx+1]
  mov 1, ax
  mov bx, [1]
  cmp [bx], #0
  bz L167
  mov ax, [bx+1]
  mov 2, ax
  mov ax, [bx+2]
  mov 3, ax
  push [186]
  push [bp+4]
  push #1
  mov 4, sp
  push [4]
  push [183]
  push #1
  mov 5, sp
  push [bp+2]
  push cx
  push #L169
  mov cx, sp
  ;; (221'48) Tail: concat (f3) @ con_221'49 (t5)
  mov bp, [bp+3]
  mov dx, [5]
  mov ax, [bp]
  jmp [ax]

L171: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L170
  mov cx, sp
  ;; (172'17) Tail: loop (f5) @ case_161'18 (arg)
  mov bp, [bp+5]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L172: ; Function: t1
  push dx
  push [bp+2]
  push #L162
  mov 1, sp
  push [1]
  push dx
  push [bp+3]
  push [bp+1]
  push cx
  push #L171
  mov cx, sp
  mov bx, [bp+4]
  mov ax, [bx+1]
  mov 2, ax
  ;; (161'43) Return: ps (t2)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L173: ; Continuation
  ;; (214'18) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L174: ; Continuation
  push [bp+2]
  push cx
  push #L173
  mov cx, sp
  ;; (225'32) Tail: app_225'27 (arg) @ xs (f3)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+3]
  mov ax, [bp]
  jmp [ax]

L175: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push #L172
  mov 1, sp
  push [bp+6]
  push [bp+5]
  push cx
  push #L174
  mov cx, sp
  ;; (225'27) Tail: iter (g5) @ lam_215'11 (t1)
  mov bp, [105]
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L176: ; Continuation
  ;; (103'29) Tail: put_chars (g25) @ app_103'38 (arg)
  mov bp, [125]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L177: ; Continuation
  push cx
  push #L176
  mov cx, sp
  ;; (103'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L178: ; Arm: 217'11
  push [173]
  push [bp+6]
  push #1
  mov 1, sp
  push [1]
  push [170]
  push #1
  mov 2, sp
  push [bp+2]
  push cx
  push #L177
  mov cx, sp
  ;; (217'33) Tail: concat (f4) @ con_217'34 (t2)
  mov bp, [bp+4]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L179: ; Continuation
  ;; (103'29) Tail: put_chars (g25) @ app_103'38 (arg)
  mov bp, [125]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L180: ; Arm: 220'16
  mov ax, [bx+1]
  mov 2, ax
  push cx
  push #L179
  mov cx, sp
  ;; (103'38) Tail: explode (f2) @ s (t2)
  mov bp, [bp+2]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L181: ; Continuation
  ;; (103'29) Tail: put_chars (g25) @ app_103'38 (arg)
  mov bp, [125]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L182: ; Continuation
  push cx
  push #L181
  mov cx, sp
  ;; (103'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L183: ; Continuation
  push [bp+7]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L175
  mov cx, sp
  mov bx, dx
  cmp [bx], #0
  bz L178
  mov ax, [bx+1]
  mov 1, ax
  mov bx, [1]
  cmp [bx], #0
  bz L180
  mov ax, [bx+1]
  mov 2, ax
  mov ax, [bx+2]
  mov 3, ax
  push [177]
  push [bp+6]
  push #1
  mov 4, sp
  push [4]
  push [174]
  push #1
  mov 5, sp
  push [bp+2]
  push cx
  push #L182
  mov cx, sp
  ;; (221'48) Tail: concat (f4) @ con_221'49 (t5)
  mov bp, [bp+4]
  mov dx, [5]
  mov ax, [bp]
  jmp [ax]

L184: ; Continuation
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L183
  mov cx, sp
  ;; (172'17) Tail: loop (f8) @ case_161'18 (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L185: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L152
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push [1]
  push [bp+2]
  push #L157
  mov 3, sp
  push [3]
  push [2]
  push [1]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push cx
  push #L184
  mov cx, sp
  mov bx, [bp+4]
  mov ax, [bx+1]
  mov 4, ax
  ;; (161'43) Return: ps (t4)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L186: ; Function: t4
  push dx
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push #L185
  mov 1, sp
  ;; (0'0) Return: lam_214'21 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L187: ; Continuation
  ;; (227'18) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L188: ; Continuation
  push [bp+2]
  push cx
  push #L187
  mov cx, sp
  ;; (103'29) Tail: put_chars (g25) @ app_103'38 (arg)
  mov bp, [125]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L189: ; Arm: 238'7
  push [bp+4]
  push cx
  push #L188
  mov cx, sp
  ;; (103'38) Tail: explode (f1) @ lit_238'22 (g89)
  mov bp, [bp+1]
  mov dx, [189]
  mov ax, [bp]
  jmp [ax]

L190: ; Arm: 166'9
  ;; (0'0) Return: con_166'12 (g90)
  mov dx, [190]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L191: ; Arm: 170'35
  push [bp+4]
  push #1
  mov 1, sp
  ;; (0'0) Return: con_170'40 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L192: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L191
  ;; (170'60) Tail: loop (f2) @ ps (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L193: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push cx
  push #L192
  mov cx, sp
  ;; (170'28) Tail: app_170'23 (arg) @ x (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L194: ; Function: t3
  mov bx, dx
  cmp [bx], #0
  bz L190
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
  push #L193
  mov cx, sp
  ;; (170'23) Tail: eq_string (f1) @ name (t3)
  mov bp, [bp+1]
  mov dx, [3]
  mov ax, [bp]
  jmp [ax]

L195: ; Arm: 166'9
  ;; (0'0) Return: con_166'12 (g99)
  mov dx, [199]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L196: ; Arm: 170'35
  push [bp+4]
  push #1
  mov 1, sp
  ;; (0'0) Return: con_170'40 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L197: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L196
  ;; (170'60) Tail: loop (f2) @ ps (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L198: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push cx
  push #L197
  mov cx, sp
  ;; (170'28) Tail: app_170'23 (arg) @ name (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L199: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L195
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
  push #L198
  mov cx, sp
  ;; (170'23) Tail: eq_string (f1) @ name (t3)
  mov bp, [bp+1]
  mov dx, [3]
  mov ax, [bp]
  jmp [ax]

L200: ; Continuation
  ;; (103'29) Tail: put_chars (g25) @ app_103'38 (arg)
  mov bp, [125]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L201: ; Continuation
  push cx
  push #L200
  mov cx, sp
  ;; (103'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L202: ; Arm: 231'11
  push [203]
  push [bp+4]
  push #1
  mov 1, sp
  push [1]
  push [200]
  push #1
  mov 2, sp
  push [bp+2]
  push cx
  push #L201
  mov cx, sp
  ;; (229'35) Tail: concat (f3) @ con_229'36 (t2)
  mov bp, [bp+3]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L203: ; Continuation
  ;; (103'29) Tail: put_chars (g25) @ app_103'38 (arg)
  mov bp, [125]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L204: ; Continuation
  push cx
  push #L203
  mov cx, sp
  ;; (103'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L205: ; Arm: 234'16
  mov ax, [bx+1]
  mov 2, ax
  push [207]
  push [bp+4]
  push #1
  mov 3, sp
  push [3]
  push [204]
  push #1
  mov 4, sp
  push [bp+2]
  push cx
  push #L204
  mov cx, sp
  ;; (229'35) Tail: concat (f3) @ con_229'36 (t4)
  mov bp, [bp+3]
  mov dx, [4]
  mov ax, [bp]
  jmp [ax]

L206: ; Continuation
  ;; (103'29) Tail: put_chars (g25) @ app_103'38 (arg)
  mov bp, [125]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L207: ; Continuation
  mov bx, dx
  cmp [bx], #0
  bz L202
  mov ax, [bx+1]
  mov 1, ax
  mov bx, [1]
  cmp [bx], #0
  bz L205
  mov ax, [bx+1]
  mov 2, ax
  mov ax, [bx+2]
  mov 3, ax
  push cx
  push #L206
  mov cx, sp
  ;; (103'38) Tail: explode (f2) @ meta (t2)
  mov bp, [bp+2]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L208: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L207
  mov cx, sp
  ;; (172'17) Tail: loop (f5) @ case_161'18 (arg)
  mov bp, [bp+5]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L209: ; Function: t1
  push dx
  push [bp+2]
  push #L199
  mov 1, sp
  push [1]
  push dx
  push [bp+3]
  push [bp+1]
  push cx
  push #L208
  mov cx, sp
  mov bx, [bp+4]
  mov ax, [bx+1]
  mov 2, ax
  ;; (161'43) Return: ps (t2)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L210: ; Continuation
  ;; (227'18) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L211: ; Continuation
  push [bp+2]
  push cx
  push #L210
  mov cx, sp
  ;; (239'32) Tail: app_239'27 (arg) @ xs (f3)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+3]
  mov ax, [bp]
  jmp [ax]

L212: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push #L209
  mov 1, sp
  push [bp+6]
  push [bp+5]
  push cx
  push #L211
  mov cx, sp
  ;; (239'27) Tail: iter (g5) @ lam_228'11 (t1)
  mov bp, [105]
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L213: ; Continuation
  ;; (103'29) Tail: put_chars (g25) @ app_103'38 (arg)
  mov bp, [125]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L214: ; Continuation
  push cx
  push #L213
  mov cx, sp
  ;; (103'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L215: ; Arm: 231'11
  push [194]
  push [bp+6]
  push #1
  mov 1, sp
  push [1]
  push [191]
  push #1
  mov 2, sp
  push [bp+2]
  push cx
  push #L214
  mov cx, sp
  ;; (229'35) Tail: concat (f4) @ con_229'36 (t2)
  mov bp, [bp+4]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L216: ; Continuation
  ;; (103'29) Tail: put_chars (g25) @ app_103'38 (arg)
  mov bp, [125]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L217: ; Continuation
  push cx
  push #L216
  mov cx, sp
  ;; (103'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L218: ; Arm: 234'16
  mov ax, [bx+1]
  mov 2, ax
  push [198]
  push [bp+6]
  push #1
  mov 3, sp
  push [3]
  push [195]
  push #1
  mov 4, sp
  push [bp+2]
  push cx
  push #L217
  mov cx, sp
  ;; (229'35) Tail: concat (f4) @ con_229'36 (t4)
  mov bp, [bp+4]
  mov dx, [4]
  mov ax, [bp]
  jmp [ax]

L219: ; Continuation
  ;; (103'29) Tail: put_chars (g25) @ app_103'38 (arg)
  mov bp, [125]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L220: ; Continuation
  push [bp+7]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L212
  mov cx, sp
  mov bx, dx
  cmp [bx], #0
  bz L215
  mov ax, [bx+1]
  mov 1, ax
  mov bx, [1]
  cmp [bx], #0
  bz L218
  mov ax, [bx+1]
  mov 2, ax
  mov ax, [bx+2]
  mov 3, ax
  push cx
  push #L219
  mov cx, sp
  ;; (103'38) Tail: explode (f2) @ meta (t2)
  mov bp, [bp+2]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L221: ; Continuation
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L220
  mov cx, sp
  ;; (172'17) Tail: loop (f8) @ case_161'18 (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L222: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L189
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push [1]
  push [bp+2]
  push #L194
  mov 3, sp
  push [3]
  push [2]
  push [1]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push cx
  push #L221
  mov cx, sp
  mov bx, [bp+4]
  mov ax, [bx+1]
  mov 4, ax
  ;; (161'43) Return: ps (t4)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L223: ; Function: t7
  push dx
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push #L222
  mov 1, sp
  ;; (0'0) Return: lam_227'21 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L224: ; Continuation
  ;; (254'6) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L225: ; Continuation
  push [bp+2]
  push cx
  push #L224
  mov cx, sp
  ;; (103'29) Tail: put_chars (g25) @ app_103'38 (arg)
  mov bp, [125]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L226: ; Arm: 256'7
  push [bp+4]
  push cx
  push #L225
  mov cx, sp
  ;; (103'38) Tail: explode (f1) @ lit_256'22 (g110)
  mov bp, [bp+1]
  mov dx, [210]
  mov ax, [bp]
  jmp [ax]

L227: ; Continuation
  ;; (0'0) Return: con_245'92 (g115)
  mov dx, [215]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L228: ; Continuation
  push cx
  push #L227
  mov cx, sp
  ;; (103'29) Tail: put_chars (g25) @ app_103'38 (arg)
  mov bp, [125]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L229: ; Continuation
  push cx
  push #L228
  mov cx, sp
  ;; (103'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L230: ; Arm: 244'9
  push [214]
  push [bp+4]
  push #1
  mov 1, sp
  push [1]
  push [211]
  push #1
  mov 2, sp
  push [bp+1]
  push cx
  push #L229
  mov cx, sp
  ;; (245'26) Tail: concat (f3) @ con_245'27 (t2)
  mov bp, [bp+3]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L231: ; Arm: 249'35
  ;; (246'10) Return: ps (f3)
  mov dx, [bp+3]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L232: ; Continuation
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

L233: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L231
  push [bp+5]
  push [bp+4]
  push cx
  push #L232
  mov cx, sp
  ;; (249'73) Tail: loop (f2) @ ps (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L234: ; Continuation
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push cx
  push #L233
  mov cx, sp
  ;; (249'28) Tail: app_249'23 (arg) @ sought (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L235: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L230
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
  push #L234
  mov cx, sp
  ;; (249'23) Tail: eq_string (f2) @ name (t3)
  mov bp, [bp+2]
  mov dx, [3]
  mov ax, [bp]
  jmp [ax]

L236: ; Continuation
  push dx
  push #0
  mov 1, sp
  ;; (0'0) Return: con_251'2 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L237: ; Continuation
  push cx
  push #L236
  mov cx, sp
  ;; (251'17) Tail: loop (f2) @ case_161'18 (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L238: ; Function: t1
  push dx
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push #L235
  mov 1, sp
  push [1]
  push cx
  push #L237
  mov cx, sp
  mov bx, [bp+4]
  mov ax, [bx+1]
  mov 2, ax
  ;; (161'43) Return: ps (t2)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L239: ; Function: t3
  push dx
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push #L238
  mov 1, sp
  ;; (0'0) Return: lam_241'11 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L240: ; Continuation
  ;; (257'29) Tail: app_257'26 (arg) @ args (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L241: ; Continuation
  push [bp+3]
  push cx
  push #L240
  mov cx, sp
  ;; (257'26) Tail: app_257'22 (arg) @ fs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L242: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L226
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push #L239
  mov 3, sp
  push dx
  push [bp+4]
  push cx
  push #L241
  mov cx, sp
  ;; (257'22) Tail: fold_left (g7) @ lam_241'8 (t3)
  mov bp, [107]
  mov dx, [3]
  mov ax, [bp]
  jmp [ax]

L243: ; Function: t10
  push dx
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push #L242
  mov 1, sp
  ;; (0'0) Return: lam_254'9 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L244: ; Continuation
  ;; (259'17) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L245: ; Continuation
  push [bp+2]
  push cx
  push #L244
  mov cx, sp
  ;; (103'29) Tail: put_chars (g25) @ app_103'38 (arg)
  mov bp, [125]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L246: ; Arm: 261'7
  push [bp+4]
  push cx
  push #L245
  mov cx, sp
  ;; (103'38) Tail: explode (f1) @ lit_261'22 (g118)
  mov bp, [bp+1]
  mov dx, [218]
  mov ax, [bp]
  jmp [ax]

L247: ; Continuation
  ;; (259'17) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L248: ; Continuation
  push [bp+2]
  push cx
  push #L247
  mov cx, sp
  ;; (103'29) Tail: put_chars (g25) @ app_103'38 (arg)
  mov bp, [125]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L249: ; Continuation
  push [bp+3]
  push cx
  push #L248
  mov cx, sp
  ;; (103'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L250: ; Arm: 264'10
  push [222]
  push [1]
  push #1
  mov 3, sp
  push [3]
  push [219]
  push #1
  mov 4, sp
  push [bp+4]
  push [bp+1]
  push cx
  push #L249
  mov cx, sp
  ;; (264'33) Tail: concat (f3) @ con_264'34 (t4)
  mov bp, [bp+3]
  mov dx, [4]
  mov ax, [bp]
  jmp [ax]

L251: ; Continuation
  ;; (259'17) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L252: ; Continuation
  push [bp+2]
  push cx
  push #L251
  mov cx, sp
  ;; (103'29) Tail: put_chars (g25) @ app_103'38 (arg)
  mov bp, [125]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L253: ; Arm: 267'12
  mov ax, [bx+1]
  mov 5, ax
  mov ax, [bx+2]
  mov 6, ax
  push [bp+4]
  push cx
  push #L252
  mov cx, sp
  ;; (103'38) Tail: explode (f1) @ lit_267'27 (g123)
  mov bp, [bp+1]
  mov dx, [223]
  mov ax, [bp]
  jmp [ax]

L254: ; Arm: 166'9
  ;; (0'0) Return: con_166'12 (g124)
  mov dx, [224]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L255: ; Arm: 170'35
  push [bp+4]
  push #1
  mov 1, sp
  ;; (0'0) Return: con_170'40 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L256: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L255
  ;; (170'60) Tail: loop (f2) @ ps (f3)
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
  ;; (170'28) Tail: app_170'23 (arg) @ source (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L258: ; Function: t5
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
  ;; (170'23) Tail: eq_string (f1) @ name (t3)
  mov bp, [bp+1]
  mov dx, [3]
  mov ax, [bp]
  jmp [ax]

L259: ; Continuation
  ;; (259'17) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L260: ; Continuation
  push [bp+2]
  push cx
  push #L259
  mov cx, sp
  ;; (103'29) Tail: put_chars (g25) @ app_103'38 (arg)
  mov bp, [125]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L261: ; Continuation
  push [bp+3]
  push cx
  push #L260
  mov cx, sp
  ;; (103'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L262: ; Arm: 270'15
  push [228]
  push [bp+5]
  push #1
  mov 1, sp
  push [1]
  push [225]
  push #1
  mov 2, sp
  push [bp+4]
  push [bp+2]
  push cx
  push #L261
  mov cx, sp
  ;; (270'38) Tail: concat (f3) @ con_270'39 (t2)
  mov bp, [bp+3]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L263: ; Continuation
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
  ;; (0'0) Return: con_272'11 (t3)
  mov dx, [3]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L264: ; Continuation
  mov bx, dx
  cmp [bx], #0
  bz L262
  mov ax, [bx+1]
  mov 1, ax
  push [1]
  push [bp+6]
  push cx
  push #L263
  mov cx, sp
  mov bx, [bp+4]
  mov ax, [bx+1]
  mov 2, ax
  ;; (161'43) Return: ps (t2)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L265: ; Continuation
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L264
  mov cx, sp
  ;; (172'17) Tail: loop (f7) @ case_161'18 (arg)
  mov bp, [bp+7]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L266: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L246
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov bx, [2]
  cmp [bx], #0
  bz L250
  mov ax, [bx+1]
  mov 3, ax
  mov ax, [bx+2]
  mov 4, ax
  mov bx, [4]
  cmp [bx], #1
  bz L253
  push [1]
  push [bp+2]
  push #L258
  mov 5, sp
  push [5]
  push [3]
  push [1]
  push [bp+4]
  push [bp+3]
  push [bp+1]
  push cx
  push #L265
  mov cx, sp
  mov bx, [bp+4]
  mov ax, [bx+1]
  mov 6, ax
  ;; (161'43) Return: ps (t6)
  mov dx, [6]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L267: ; Function: t13
  push dx
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push #L266
  mov 1, sp
  ;; (0'0) Return: lam_259'20 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L268: ; Continuation
  ;; (274'17) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L269: ; Continuation
  push [bp+2]
  push cx
  push #L268
  mov cx, sp
  ;; (103'29) Tail: put_chars (g25) @ app_103'38 (arg)
  mov bp, [125]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L270: ; Arm: 276'7
  push [bp+4]
  push cx
  push #L269
  mov cx, sp
  ;; (103'38) Tail: explode (f1) @ lit_276'22 (g131)
  mov bp, [bp+1]
  mov dx, [231]
  mov ax, [bp]
  jmp [ax]

L271: ; Continuation
  ;; (274'17) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L272: ; Continuation
  push [bp+2]
  push cx
  push #L271
  mov cx, sp
  ;; (103'29) Tail: put_chars (g25) @ app_103'38 (arg)
  mov bp, [125]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L273: ; Continuation
  push [bp+3]
  push cx
  push #L272
  mov cx, sp
  ;; (103'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L274: ; Arm: 279'10
  push [235]
  push [1]
  push #1
  mov 3, sp
  push [3]
  push [232]
  push #1
  mov 4, sp
  push [bp+4]
  push [bp+1]
  push cx
  push #L273
  mov cx, sp
  ;; (279'33) Tail: concat (f3) @ con_279'34 (t4)
  mov bp, [bp+3]
  mov dx, [4]
  mov ax, [bp]
  jmp [ax]

L275: ; Continuation
  ;; (274'17) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L276: ; Continuation
  push [bp+2]
  push cx
  push #L275
  mov cx, sp
  ;; (103'29) Tail: put_chars (g25) @ app_103'38 (arg)
  mov bp, [125]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L277: ; Arm: 282'12
  mov ax, [bx+1]
  mov 5, ax
  mov ax, [bx+2]
  mov 6, ax
  push [bp+4]
  push cx
  push #L276
  mov cx, sp
  ;; (103'38) Tail: explode (f1) @ lit_282'27 (g136)
  mov bp, [bp+1]
  mov dx, [236]
  mov ax, [bp]
  jmp [ax]

L278: ; Arm: 166'9
  ;; (0'0) Return: con_166'12 (g137)
  mov dx, [237]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L279: ; Arm: 170'35
  push [bp+4]
  push #1
  mov 1, sp
  ;; (0'0) Return: con_170'40 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L280: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L279
  ;; (170'60) Tail: loop (f2) @ ps (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L281: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push cx
  push #L280
  mov cx, sp
  ;; (170'28) Tail: app_170'23 (arg) @ source (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L282: ; Function: t5
  mov bx, dx
  cmp [bx], #0
  bz L278
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
  push #L281
  mov cx, sp
  ;; (170'23) Tail: eq_string (f1) @ name (t3)
  mov bp, [bp+1]
  mov dx, [3]
  mov ax, [bp]
  jmp [ax]

L283: ; Continuation
  ;; (274'17) Return: fs (f2)
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
  ;; (103'29) Tail: put_chars (g25) @ app_103'38 (arg)
  mov bp, [125]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L285: ; Continuation
  push [bp+3]
  push cx
  push #L284
  mov cx, sp
  ;; (103'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L286: ; Arm: 285'15
  push [241]
  push [bp+6]
  push #1
  mov 1, sp
  push [1]
  push [238]
  push #1
  mov 2, sp
  push [bp+5]
  push [bp+2]
  push cx
  push #L285
  mov cx, sp
  ;; (285'38) Tail: concat (f4) @ con_285'39 (t2)
  mov bp, [bp+4]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L287: ; Continuation
  ;; (0'0) Return: con_245'92 (g146)
  mov dx, [246]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L288: ; Continuation
  push cx
  push #L287
  mov cx, sp
  ;; (103'29) Tail: put_chars (g25) @ app_103'38 (arg)
  mov bp, [125]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L289: ; Continuation
  push cx
  push #L288
  mov cx, sp
  ;; (103'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L290: ; Arm: 244'9
  push [245]
  push [bp+4]
  push #1
  mov 1, sp
  push [1]
  push [242]
  push #1
  mov 2, sp
  push [bp+1]
  push cx
  push #L289
  mov cx, sp
  ;; (245'26) Tail: concat (f3) @ con_245'27 (t2)
  mov bp, [bp+3]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L291: ; Arm: 249'35
  ;; (246'10) Return: ps (f3)
  mov dx, [bp+3]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L292: ; Continuation
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

L293: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L291
  push [bp+5]
  push [bp+4]
  push cx
  push #L292
  mov cx, sp
  ;; (249'73) Tail: loop (f2) @ ps (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L294: ; Continuation
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push cx
  push #L293
  mov cx, sp
  ;; (249'28) Tail: app_249'23 (arg) @ source (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L295: ; Function: t2
  mov bx, dx
  cmp [bx], #0
  bz L290
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
  push #L294
  mov cx, sp
  ;; (249'23) Tail: eq_string (f2) @ name (t3)
  mov bp, [bp+2]
  mov dx, [3]
  mov ax, [bp]
  jmp [ax]

L296: ; Continuation
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
  ;; (0'0) Return: con_287'11 (t3)
  mov dx, [3]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L297: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L296
  mov cx, sp
  ;; (251'17) Tail: loop (f4) @ case_161'18 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L298: ; Continuation
  mov bx, dx
  cmp [bx], #0
  bz L286
  mov ax, [bx+1]
  mov 1, ax
  push [bp+6]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push #L295
  mov 2, sp
  push [2]
  push [1]
  push [bp+7]
  push cx
  push #L297
  mov cx, sp
  mov bx, [bp+5]
  mov ax, [bx+1]
  mov 3, ax
  ;; (161'43) Return: ps (t3)
  mov dx, [3]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L299: ; Continuation
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L298
  mov cx, sp
  ;; (172'17) Tail: loop (f8) @ case_161'18 (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L300: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L270
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov bx, [2]
  cmp [bx], #0
  bz L274
  mov ax, [bx+1]
  mov 3, ax
  mov ax, [bx+2]
  mov 4, ax
  mov bx, [4]
  cmp [bx], #1
  bz L277
  push [1]
  push [bp+2]
  push #L282
  mov 5, sp
  push [5]
  push [3]
  push [1]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push cx
  push #L299
  mov cx, sp
  mov bx, [bp+4]
  mov ax, [bx+1]
  mov 6, ax
  ;; (161'43) Return: ps (t6)
  mov dx, [6]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L301: ; Function: t16
  push dx
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push #L300
  mov 1, sp
  ;; (0'0) Return: lam_274'20 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L302: ; Continuation
  push [bp+2]
  push #L149
  mov 1, sp
  push [1]
  push [161]
  push #1
  mov 2, sp
  push [2]
  push [160]
  push #0
  mov 3, sp
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push #L186
  mov 4, sp
  push [4]
  push [167]
  push #1
  mov 5, sp
  push [5]
  push [166]
  push #0
  mov 6, sp
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push #L223
  mov 7, sp
  push [7]
  push [188]
  push #1
  mov 8, sp
  push [8]
  push [187]
  push #0
  mov 9, sp
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push #L243
  mov 10, sp
  push [10]
  push [209]
  push #1
  mov 11, sp
  push [11]
  push [208]
  push #0
  mov 12, sp
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push #L267
  mov 13, sp
  push [13]
  push [217]
  push #1
  mov 14, sp
  push [14]
  push [216]
  push #0
  mov 15, sp
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push #L301
  mov 16, sp
  push [16]
  push [230]
  push #1
  mov 17, sp
  push [17]
  push [229]
  push #0
  mov 18, sp
  push [247]
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
  push [159]
  push #1
  mov 25, sp
  push [25]
  push #0
  mov 26, sp
  ;; (310'11) Tail: mainloop (f5) @ con_297'13 (t26)
  mov bp, [bp+5]
  mov dx, [26]
  mov ax, [bp]
  jmp [ax]

L303: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L302
  mov cx, sp
  ;; (103'29) Tail: put_chars (g25) @ app_103'38 (arg)
  mov bp, [125]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L304: ; Continuation
  push [bp+4]
  push [bp+2]
  push #L75
  mov 1, sp
  push [bp+3]
  push #L92
  mov 2, sp
  push [2]
  push [1]
  push dx
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push #L133
  mov 3, sp
  push [3]
  push [1]
  push dx
  push [bp+4]
  push cx
  push #L303
  mov cx, sp
  ;; (103'38) Tail: explode (f4) @ lit_309'13 (g55)
  mov bp, [bp+4]
  mov dx, [155]
  mov ax, [bp]
  jmp [ax]

L305: ; Continuation
  push dx
  push [bp+3]
  push [bp+2]
  push cx
  push #L304
  mov cx, sp
  ;; (77'25) Tail: block (g1) @ lam_77'30 (g23)
  mov bp, [101]
  mov dx, [123]
  mov ax, [bp]
  jmp [ax]

L306: ; Continuation
  push dx
  push [bp+2]
  push cx
  push #L305
  mov cx, sp
  ;; (70'23) Tail: block (g1) @ lam_70'28 (g15)
  mov bp, [101]
  mov dx, [115]
  mov ax, [bp]
  jmp [ax]

L307: ; Continuation
  push dx
  push cx
  push #L306
  mov cx, sp
  ;; (59'30) Tail: block (g1) @ lam_59'35 (g13)
  mov bp, [101]
  mov dx, [113]
  mov ax, [bp]
  jmp [ax]

L308: ; Start
  push #L2
  mov 101, sp
  push #L5
  mov 102, sp
  push #0
  mov 104, sp
  push #L11
  mov 103, sp
  push #0
  mov 106, sp
  push #L16
  mov 105, sp
  push #L24
  mov 107, sp
  push #L29
  mov 108, sp
  push #L33
  mov 109, sp
  push #0
  mov 110, sp
  push #L41
  mov 111, sp
  push #0
  mov 112, sp
  push #L49
  mov 113, sp
  push #0
  mov 114, sp
  push #L55
  mov 115, sp
  push #0
  mov 116, sp
  push #1
  mov 117, sp
  push #0
  mov 118, sp
  push #1
  mov 119, sp
  push #0
  mov 120, sp
  push #1
  mov 121, sp
  push #0
  mov 122, sp
  push #L65
  mov 123, sp
  push #0
  mov 124, sp
  push #0
  mov 126, sp
  push #L67
  mov 125, sp
  push #0
  mov 127, sp
  push #0
  push sp
  push #' '
  push #1
  push sp
  push #'%'
  push #1
  mov 128, sp
  push #0
  mov 129, sp
  push #0
  mov 130, sp
  push #0
  mov 131, sp
  push #1
  mov 132, sp
  push #0
  mov 133, sp
  push #0
  mov 134, sp
  push #0
  mov 135, sp
  push #0
  mov 136, sp
  push #0
  mov 137, sp
  push #0
  mov 138, sp
  push #0
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'h'
  push #1
  push sp
  push #'s'
  push #1
  mov 139, sp
  push #0
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  mov 140, sp
  push #0
  push sp
  push #'d'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'u'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'f'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'c'
  push #1
  mov 141, sp
  push #0
  push sp
  push #'\n'
  push #1
  mov 142, sp
  push #0
  mov 143, sp
  push [143]
  push [142]
  push #1
  mov 144, sp
  push [144]
  push [141]
  push #1
  mov 145, sp
  push [145]
  push [140]
  push #1
  mov 146, sp
  push #0
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'h'
  push #1
  push sp
  push #'s'
  push #1
  mov 147, sp
  push #0
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  mov 148, sp
  push #0
  push sp
  push #'d'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'P'
  push #1
  mov 149, sp
  push #0
  push sp
  push #'\n'
  push #1
  mov 150, sp
  push #0
  mov 151, sp
  push [151]
  push [150]
  push #1
  mov 152, sp
  push [152]
  push [149]
  push #1
  mov 153, sp
  push [153]
  push [148]
  push #1
  mov 154, sp
  push #0
  push sp
  push #'\n'
  push #1
  push sp
  push #'.'
  push #1
  push sp
  push #'"'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'l'
  push #1
  push sp
  push #'"'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'g'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'p'
  push #1
  push sp
  push #'y'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'C'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'.'
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'y'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'-'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'l'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'f'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'y'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #'-'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'I'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'h'
  push #1
  push sp
  push #'S'
  push #1
  mov 155, sp
  push #0
  push sp
  push #'e'
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'r'
  push #1
  mov 156, sp
  push #0
  push sp
  push #'\n'
  push #1
  push sp
  push #'?'
  push #1
  push sp
  push #'g'
  push #1
  push sp
  push #'g'
  push #1
  push sp
  push #'E'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'E'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'h'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'h'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'f'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'u'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'y'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'C'
  push #1
  push sp
  push #'\n'
  push #1
  push sp
  push #'!'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'c'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'h'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'l'
  push #1
  push sp
  push #'l'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'y'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'l'
  push #1
  push sp
  push #'p'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #';'
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'h'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'c'
  push #1
  push sp
  push #'l'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'W'
  push #1
  mov 157, sp
  push [157]
  push #0
  mov 158, sp
  push [158]
  push [156]
  push #0
  mov 159, sp
  push #0
  push sp
  push #'s'
  push #1
  push sp
  push #'l'
  push #1
  mov 160, sp
  push #0
  push sp
  push #'\n'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'c'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'y'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'c'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'l'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'-'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'l'
  push #1
  mov 161, sp
  push #0
  push sp
  push #'\n'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #'u'
  push #1
  push sp
  push #'g'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'k'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'l'
  push #1
  mov 162, sp
  push #L68
  mov 163, sp
  push #0
  mov 164, sp
  push #0
  mov 165, sp
  push #0
  push sp
  push #'t'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'c'
  push #1
  mov 166, sp
  push #0
  push sp
  push #'\n'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'u'
  push #1
  push sp
  push #'p'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'u'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'h'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'p'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'l'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'f'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'c'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'c'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'-'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'c'
  push #1
  mov 167, sp
  push #0
  push sp
  push #'\n'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #'u'
  push #1
  push sp
  push #'g'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'l'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'k'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'c'
  push #1
  mov 168, sp
  push #0
  mov 169, sp
  push #0
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'c'
  push #1
  mov 170, sp
  push #0
  push sp
  push #'\n'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'l'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'f'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'h'
  push #1
  push sp
  push #'c'
  push #1
  push sp
  push #'u'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'N'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  push sp
  push #' '
  push #1
  mov 171, sp
  push #0
  mov 172, sp
  push [172]
  push [171]
  push #1
  mov 173, sp
  push #0
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'c'
  push #1
  mov 174, sp
  push #0
  push sp
  push #'\n'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'l'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'f'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'N'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  push sp
  push #' '
  push #1
  mov 175, sp
  push #0
  mov 176, sp
  push [176]
  push [175]
  push #1
  mov 177, sp
  push #0
  mov 178, sp
  push #0
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'c'
  push #1
  mov 179, sp
  push #0
  push sp
  push #'\n'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'l'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'f'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'h'
  push #1
  push sp
  push #'c'
  push #1
  push sp
  push #'u'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'N'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  push sp
  push #' '
  push #1
  mov 180, sp
  push #0
  mov 181, sp
  push [181]
  push [180]
  push #1
  mov 182, sp
  push #0
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'c'
  push #1
  mov 183, sp
  push #0
  push sp
  push #'\n'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'l'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'f'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'N'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  push sp
  push #' '
  push #1
  mov 184, sp
  push #0
  mov 185, sp
  push [185]
  push [184]
  push #1
  mov 186, sp
  push #0
  push sp
  push #'n'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'m'
  push #1
  mov 187, sp
  push #0
  push sp
  push #'\n'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'l'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'u'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'c'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'f'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'y'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'h'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'c'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'f'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'-'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'m'
  push #1
  mov 188, sp
  push #0
  push sp
  push #'\n'
  push #1
  push sp
  push #'?'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'w'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'u'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'y'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'g'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'p'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'l'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'u'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'h'
  push #1
  push sp
  push #'W'
  push #1
  mov 189, sp
  push #0
  mov 190, sp
  push #0
  push sp
  push #' '
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'f'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'y'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'l'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'u'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'N'
  push #1
  mov 191, sp
  push #0
  push sp
  push #'\n'
  push #1
  mov 192, sp
  push #0
  mov 193, sp
  push [193]
  push [192]
  push #1
  mov 194, sp
  push #0
  push sp
  push #' '
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'f'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'y'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'l'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'u'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'N'
  push #1
  mov 195, sp
  push #0
  push sp
  push #'\n'
  push #1
  mov 196, sp
  push #0
  mov 197, sp
  push [197]
  push [196]
  push #1
  mov 198, sp
  push #0
  mov 199, sp
  push #0
  push sp
  push #' '
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'f'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'y'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'l'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'u'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'N'
  push #1
  mov 200, sp
  push #0
  push sp
  push #'\n'
  push #1
  mov 201, sp
  push #0
  mov 202, sp
  push [202]
  push [201]
  push #1
  mov 203, sp
  push #0
  push sp
  push #' '
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'f'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'y'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'l'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'u'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'N'
  push #1
  mov 204, sp
  push #0
  push sp
  push #'\n'
  push #1
  mov 205, sp
  push #0
  mov 206, sp
  push [206]
  push [205]
  push #1
  mov 207, sp
  push #0
  push sp
  push #'m'
  push #1
  push sp
  push #'r'
  push #1
  mov 208, sp
  push #0
  push sp
  push #'\n'
  push #1
  push sp
  push #')'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'c'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'p'
  push #1
  push sp
  push #'p'
  push #1
  push sp
  push #'u'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  push sp
  push #'O'
  push #1
  push sp
  push #'D'
  push #1
  push sp
  push #'O'
  push #1
  push sp
  push #'T'
  push #1
  push sp
  push #'('
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'c'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'l'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'f'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'v'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'-'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #'r'
  push #1
  mov 209, sp
  push #0
  push sp
  push #'\n'
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'p'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'g'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #'r'
  push #1
  mov 210, sp
  push #0
  push sp
  push #'\''
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'v'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'c'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #'r'
  push #1
  mov 211, sp
  push #0
  push sp
  push #'\n'
  push #1
  push sp
  push #'y'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'c'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'l'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'f'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'h'
  push #1
  push sp
  push #'c'
  push #1
  push sp
  push #'u'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'N'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  push sp
  push #'\''
  push #1
  mov 212, sp
  push #0
  mov 213, sp
  push [213]
  push [212]
  push #1
  mov 214, sp
  push #0
  mov 215, sp
  push #0
  push sp
  push #'p'
  push #1
  push sp
  push #'c'
  push #1
  mov 216, sp
  push #0
  push sp
  push #'\n'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'c'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'l'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'f'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'y'
  push #1
  push sp
  push #'p'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'c'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'-'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'p'
  push #1
  push sp
  push #'c'
  push #1
  mov 217, sp
  push #0
  push sp
  push #'\n'
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'p'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'l'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'f'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'g'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  push sp
  push #'p'
  push #1
  push sp
  push #'c'
  push #1
  mov 218, sp
  push #0
  push sp
  push #'\''
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'f'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'p'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'l'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'f'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'g'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  push sp
  push #'p'
  push #1
  push sp
  push #'c'
  push #1
  mov 219, sp
  push #0
  push sp
  push #'\n'
  push #1
  push sp
  push #'\''
  push #1
  mov 220, sp
  push #0
  mov 221, sp
  push [221]
  push [220]
  push #1
  mov 222, sp
  push #0
  push sp
  push #'\n'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'p'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'x'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'c'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'p'
  push #1
  push sp
  push #'x'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'u'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  push sp
  push #'p'
  push #1
  push sp
  push #'c'
  push #1
  mov 223, sp
  push #0
  mov 224, sp
  push #0
  push sp
  push #'\''
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'c'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  push sp
  push #'p'
  push #1
  push sp
  push #'c'
  push #1
  mov 225, sp
  push #0
  push sp
  push #'\n'
  push #1
  push sp
  push #'y'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'c'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'l'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'f'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'h'
  push #1
  push sp
  push #'c'
  push #1
  push sp
  push #'u'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'N'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  push sp
  push #'\''
  push #1
  mov 226, sp
  push #0
  mov 227, sp
  push [227]
  push [226]
  push #1
  mov 228, sp
  push #0
  push sp
  push #'v'
  push #1
  push sp
  push #'m'
  push #1
  mov 229, sp
  push #0
  push sp
  push #'\n'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'l'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'f'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #')'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'('
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'v'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'-'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'v'
  push #1
  push sp
  push #'m'
  push #1
  mov 230, sp
  push #0
  push sp
  push #'\n'
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'p'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'l'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'f'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'g'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  push sp
  push #'v'
  push #1
  push sp
  push #'m'
  push #1
  mov 231, sp
  push #0
  push sp
  push #'\''
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'f'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'p'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'l'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'f'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'g'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  push sp
  push #'v'
  push #1
  push sp
  push #'m'
  push #1
  mov 232, sp
  push #0
  push sp
  push #'\n'
  push #1
  push sp
  push #'\''
  push #1
  mov 233, sp
  push #0
  mov 234, sp
  push [234]
  push [233]
  push #1
  mov 235, sp
  push #0
  push sp
  push #'\n'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'p'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'x'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'c'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'p'
  push #1
  push sp
  push #'x'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'u'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  push sp
  push #'v'
  push #1
  push sp
  push #'m'
  push #1
  mov 236, sp
  push #0
  mov 237, sp
  push #0
  push sp
  push #'\''
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'c'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  push sp
  push #'v'
  push #1
  push sp
  push #'m'
  push #1
  mov 238, sp
  push #0
  push sp
  push #'\n'
  push #1
  push sp
  push #'y'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'c'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'l'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'f'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'h'
  push #1
  push sp
  push #'c'
  push #1
  push sp
  push #'u'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'N'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  push sp
  push #'\''
  push #1
  mov 239, sp
  push #0
  mov 240, sp
  push [240]
  push [239]
  push #1
  mov 241, sp
  push #0
  push sp
  push #'\''
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'v'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'n'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'c'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  push sp
  push #'m'
  push #1
  push sp
  push #'r'
  push #1
  mov 242, sp
  push #0
  push sp
  push #'\n'
  push #1
  push sp
  push #'y'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'t'
  push #1
  push sp
  push #'c'
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'d'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'r'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'e'
  push #1
  push sp
  push #'l'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'f'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'h'
  push #1
  push sp
  push #'c'
  push #1
  push sp
  push #'u'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'N'
  push #1
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  push sp
  push #'\''
  push #1
  mov 243, sp
  push #0
  mov 244, sp
  push [244]
  push [243]
  push #1
  mov 245, sp
  push #0
  mov 246, sp
  push #0
  mov 247, sp
  push cx
  push #L307
  mov cx, sp
  ;; (49'23) Tail: block (g1) @ lam_49'28 (g11)
  mov bp, [101]
  mov dx, [111]
  mov ax, [bp]
  jmp [ax]


