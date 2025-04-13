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
  ;; (29'18) Return: ys (arg)
  mov dx, dx
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L18: ; Continuation
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

L19: ; Continuation
  push [bp+3]
  push cx
  push #L18
  mov cx, sp
  ;; (32'28) Tail: app_32'25 (arg) @ ys (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L20: ; Function: t1
  mov bx, [bp+1]
  cmp [bx], #0
  bz L17
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push [1]
  push dx
  push cx
  push #L19
  mov cx, sp
  ;; (32'25) Tail: append (g7) @ xs (t2)
  mov bp, [107]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L21: ; Function: g7
  push dx
  push #L20
  mov 1, sp
  ;; (0'0) Return: lam_29'18 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L22: ; Arm: 37'9
  ;; (35'18) Return: acc (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L23: ; Continuation
  ;; (38'34) Tail: app_38'23 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L24: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L22
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
  push #L23
  mov cx, sp
  ;; (38'23) Tail: revloop (g8) @ con_0'0 (t3)
  mov bp, [108]
  mov dx, [3]
  mov ax, [bp]
  jmp [ax]

L25: ; Function: g8
  push dx
  push #L24
  mov 1, sp
  ;; (0'0) Return: lam_35'22 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L26: ; Arm: 48'9
  ;; (0'0) Return: con_48'12 (g9)
  mov dx, [109]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L27: ; Continuation
  ;; (49'43) Tail: app_49'37 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L28: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L26
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
  push #L27
  mov cx, sp
  ;; (49'37) Tail: loop (f3) @ prim_0'0 (t4)
  mov bp, [bp+3]
  mov dx, [4]
  mov ax, [bp]
  jmp [ax]

L29: ; Function: t2
  push bp
  push dx
  push [bp+1]
  push #L28
  mov 1, sp
  ;; (0'0) Return: lam_46'17 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L30: ; Continuation
  mov ax, [bp+2]
  call bios_freeze_bytes
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L31: ; Continuation
  push [bp+3]
  push cx
  push #L30
  mov cx, sp
  ;; (51'9) Tail: app_51'7 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L32: ; Continuation
  mov ax, dx
  call bios_make_bytes
  mov 1, ax
  push [1]
  push #L29
  mov 2, sp
  push [1]
  push [bp+2]
  push cx
  push #L31
  mov cx, sp
  ;; (51'7) Tail: loop (t2) @ 0
  mov bp, [2]
  mov dx, #0
  mov ax, [bp]
  jmp [ax]

L33: ; Function: g10
  push dx
  push cx
  push #L32
  mov cx, sp
  ;; (45'29) Tail: length (g2) @ xs (arg)
  mov bp, [102]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L34: ; Arm: 59'9
  ;; (0'0) Return: con_59'12 (g11)
  mov dx, [111]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L35: ; Continuation
  ;; (60'43) Tail: app_60'37 (arg) @ xs (f2)
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
  sub ax, #1
  mov 4, ax
  push [2]
  push cx
  push #L35
  mov cx, sp
  ;; (60'37) Tail: loop (f3) @ prim_0'0 (t4)
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
  ;; (0'0) Return: lam_57'17 (t1)
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
  ;; (62'13) Tail: app_62'7 (arg) @ xs (f2)
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
  mov ax, dx
  sub ax, #1
  mov 3, ax
  push [1]
  push [bp+2]
  push cx
  push #L39
  mov cx, sp
  ;; (62'7) Tail: loop (t2) @ prim_0'0 (t3)
  mov bp, [2]
  mov dx, [3]
  mov ax, [bp]
  jmp [ax]

L41: ; Function: g12
  push dx
  push cx
  push #L40
  mov cx, sp
  ;; (55'17) Tail: length (g2) @ xs (arg)
  mov bp, [102]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L42: ; Arm: 67'13
  ;; (66'23) Return: acc (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L43: ; Continuation
  mov ax, [bp+2]
  sub ax, #1
  mov 1, ax
  ;; (68'45) Tail: app_68'19 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L44: ; Function: t1
  mov ax, dx
  cmp ax, #0
  call bios_make_bool_from_n
  mov 1, ax
  mov bx, [1]
  cmp [bx], #1
  bz L42
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
  push #L43
  mov cx, sp
  ;; (68'19) Tail: explode_loop (f3) @ con_0'0 (t3)
  mov bp, [bp+3]
  mov dx, [3]
  mov ax, [bp]
  jmp [ax]

L45: ; Function: t1
  push bp
  push dx
  push [bp+1]
  push #L44
  mov 1, sp
  ;; (0'0) Return: lam_66'27 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L46: ; Continuation
  mov ax, [bp+2]
  sub ax, #1
  mov 1, ax
  ;; (70'18) Tail: app_70'15 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L47: ; Function: g14
  push dx
  push #L45
  mov 1, sp
  mov ax, dx
  call bios_string_length
  mov 2, ax
  push [2]
  push cx
  push #L46
  mov cx, sp
  ;; (70'15) Tail: explode_loop (t1) @ con_70'15 (g13)
  mov bp, [1]
  mov dx, [113]
  mov ax, [bp]
  jmp [ax]

L48: ; Arm: 75'19
  ;; (0'0) Return: con_75'24 (g17)
  mov dx, [117]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L49: ; Arm: 77'15
  ;; (0'0) Return: con_77'20 (g18)
  mov dx, [118]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L50: ; Arm: 80'31
  ;; (0'0) Return: con_80'36 (g21)
  mov dx, [121]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L51: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L50
  mov ax, [bp+2]
  sub ax, #1
  mov 1, ax
  ;; (80'52) Tail: loop (f3) @ prim_0'0 (t1)
  mov bp, [bp+3]
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L52: ; Arm: 4'9
  ;; (0'0) Return: con_4'12 (g19)
  mov dx, [119]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L53: ; Function: t1
  mov ax, dx
  cmp ax, #0
  call bios_make_bool_from_n
  mov 1, ax
  mov bx, [1]
  cmp [bx], #1
  bz L49
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
  push #L51
  mov cx, sp
  mov bx, [4]
  cmp [bx], #1
  bz L52
  ;; (0'0) Return: con_5'13 (g20)
  mov dx, [120]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L54: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L48
  push [bp+3]
  push [bp+2]
  push #L53
  mov 1, sp
  mov ax, [bp+4]
  sub ax, #1
  mov 2, ax
  ;; (82'9) Tail: loop (t1) @ prim_0'0 (t2)
  mov bp, [1]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L55: ; Arm: 4'9
  ;; (0'0) Return: con_4'12 (g15)
  mov dx, [115]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L56: ; Function: t1
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
  push #L54
  mov cx, sp
  mov bx, [3]
  cmp [bx], #1
  bz L55
  ;; (0'0) Return: con_5'13 (g16)
  mov dx, [116]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L57: ; Function: g22
  push dx
  push #L56
  mov 1, sp
  ;; (0'0) Return: lam_72'33 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L58: ; Arm: 95'7
  ;; (0'0) Return: con_95'10 (g25)
  mov dx, [125]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L59: ; Function: g24
  mov bx, dx
  cmp [bx], #0
  bz L58
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov ax, [1]
  call bios_put_char
  mov 3, ax
  ;; (96'35) Tail: put_chars (g24) @ xs (t2)
  mov bp, [124]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L60: ; Function: g62
  mov bx, dx
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  ;; (206'44) Return: name (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L61: ; Arm: 88'7
  ;; (0'0) Return: lit_88'10 (g23)
  mov dx, [123]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L62: ; Continuation
  ;; (84'34) Tail: implode (f2) @ app_84'55 (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L63: ; Continuation
  push [bp+2]
  push cx
  push #L62
  mov cx, sp
  ;; (84'55) Tail: app_84'42 (f3) @ app_84'64 (arg)
  mov bp, [bp+3]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L64: ; Continuation
  push dx
  push [bp+2]
  push cx
  push #L63
  mov cx, sp
  ;; (84'64) Tail: explode (f3) @ s2 (f4)
  mov dx, [bp+4]
  mov bp, [bp+3]
  mov ax, [bp]
  jmp [ax]

L65: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L64
  mov cx, sp
  ;; (84'42) Tail: append (g7) @ app_84'51 (arg)
  mov bp, [107]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L66: ; Continuation
  push dx
  push [bp+3]
  push [bp+2]
  push cx
  push #L65
  mov cx, sp
  ;; (84'51) Tail: explode (f3) @ x (f4)
  mov dx, [bp+4]
  mov bp, [bp+3]
  mov ax, [bp]
  jmp [ax]

L67: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L61
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push [1]
  push [bp+2]
  push [bp+1]
  push cx
  push #L66
  mov cx, sp
  ;; (89'37) Tail: concat (me) @ xs (t2)
  mov bp, bp
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L68: ; Continuation
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

L69: ; Arm: 135'11
  push [bp+3]
  push cx
  push #L68
  mov cx, sp
  ;; (135'30) Tail: reverse_implode (f1) @ accCs (f5)
  mov dx, [bp+5]
  mov bp, [bp+1]
  mov ax, [bp]
  jmp [ax]

L70: ; Continuation
  ;; (137'78) Tail: app_137'45 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L71: ; Continuation
  push [bp+3]
  push dx
  push #1
  mov 1, sp
  push [bp+4]
  push cx
  push #L70
  mov cx, sp
  ;; (137'45) Tail: at_word_start (f2) @ con_0'0 (t1)
  mov bp, [bp+2]
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L72: ; Arm: 137'26
  push [2]
  push [bp+3]
  push [bp+2]
  push cx
  push #L71
  mov cx, sp
  ;; (137'62) Tail: reverse_implode (f1) @ accCs (f5)
  mov dx, [bp+5]
  mov bp, [bp+1]
  mov ax, [bp]
  jmp [ax]

L73: ; Continuation
  ;; (138'43) Tail: app_138'32 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L74: ; Continuation
  push [bp+2]
  push [bp+3]
  push #1
  mov 1, sp
  push [bp+4]
  push cx
  push #L73
  mov cx, sp
  ;; (138'32) Tail: app_138'26 (arg) @ con_0'0 (t1)
  mov bp, dx
  mov dx, [1]
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
  mov ax, [1]
  cmp ax, #' '
  call bios_make_bool_from_z
  mov 3, ax
  mov bx, [3]
  cmp [bx], #1
  bz L72
  push [2]
  push [1]
  push [bp+5]
  push cx
  push #L74
  mov cx, sp
  ;; (138'26) Tail: have_letter (f4) @ accWs (f3)
  mov dx, [bp+3]
  mov bp, [bp+4]
  mov ax, [bp]
  jmp [ax]

L76: ; Function: t1
  push dx
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push #L75
  mov 1, sp
  ;; (0'0) Return: lam_133'36 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L77: ; Function: t1
  push bp
  push dx
  push [bp+2]
  push [bp+1]
  push #L76
  mov 1, sp
  ;; (0'0) Return: lam_133'30 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L78: ; Arm: 142'9
  ;; (132'24) Return: accWs (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L79: ; Continuation
  ;; (144'49) Tail: app_144'43 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L80: ; Arm: 144'24
  push [2]
  push cx
  push #L79
  mov cx, sp
  ;; (144'43) Tail: at_word_start (f2) @ accWs (f1)
  mov dx, [bp+1]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L81: ; Continuation
  ;; (145'31) Tail: app_145'27 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L82: ; Continuation
  push [126]
  push [bp+2]
  push #1
  mov 1, sp
  push [bp+3]
  push cx
  push #L81
  mov cx, sp
  ;; (145'27) Tail: app_145'21 (arg) @ con_145'28 (t1)
  mov bp, dx
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L83: ; Function: t2
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
  bz L80
  push [2]
  push [1]
  push cx
  push #L82
  mov cx, sp
  ;; (145'21) Tail: have_letter (f3) @ accWs (f1)
  mov dx, [bp+1]
  mov bp, [bp+3]
  mov ax, [bp]
  jmp [ax]

L84: ; Function: t2
  push bp
  push [bp+1]
  push #L77
  mov 1, sp
  push [1]
  push bp
  push dx
  push #L83
  mov 2, sp
  ;; (0'0) Return: lam_140'8 (t2)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L85: ; Arm: 116'22
  mov ax, #'\n'
  call bios_put_char
  mov 4, ax
  ;; (116'55) Tail: reverse_implode (f1) @ acc (arg)
  mov bp, [bp+1]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L86: ; Arm: 117'28
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
  ;; (117'80) Tail: reverse_implode (f1) @ con_0'0 (t7)
  mov bp, [bp+1]
  mov dx, [7]
  mov ax, [bp]
  jmp [ax]

L87: ; Arm: 118'19
  ;; (118'33) Tail: readloop (me) @ acc (arg)
  mov bp, bp
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L88: ; Arm: 121'17
  ;; (121'29) Tail: readloop (me) @ acc (arg)
  mov bp, bp
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L89: ; Continuation
  mov ax, #'\b'
  call bios_put_char
  mov 1, ax
  mov ax, #' '
  call bios_put_char
  mov 2, ax
  mov ax, #'\b'
  call bios_put_char
  mov 3, ax
  ;; (125'24) Tail: readloop (f2) @ tail (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L90: ; Arm: 123'31
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

L91: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L89
  mov cx, sp
  mov bx, dx
  cmp [bx], #1
  bz L90
  ;; (0'0) Return: con_123'55 (g32)
  mov dx, [132]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L92: ; Arm: 4'9
  ;; (0'0) Return: con_4'12 (g30)
  mov dx, [130]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L93: ; Arm: 119'21
  mov bx, dx
  cmp [bx], #0
  bz L88
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
  push #L91
  mov cx, sp
  mov bx, [10]
  cmp [bx], #1
  bz L92
  ;; (0'0) Return: con_5'13 (g31)
  mov dx, [131]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L94: ; Function: t1
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
  bz L85
  mov ax, [1]
  cmp ax, #'\EOT'
  call bios_make_bool_from_z
  mov 4, ax
  mov bx, [4]
  cmp [bx], #1
  bz L86
  mov ax, #127
  cmp ax, [2]
  call bios_make_bool_from_n
  mov 5, ax
  mov bx, [5]
  cmp [bx], #1
  bz L87
  mov ax, [2]
  cmp ax, #127
  call bios_make_bool_from_z
  mov 6, ax
  mov bx, [6]
  cmp [bx], #1
  bz L93
  mov ax, [1]
  call bios_put_char
  mov 7, ax
  push dx
  push [1]
  push #1
  mov 8, sp
  ;; (127'34) Tail: readloop (me) @ con_0'0 (t8)
  mov bp, bp
  mov dx, [8]
  mov ax, [bp]
  jmp [ax]

L95: ; Arm: 197'36
  ;; (0'0) Return: con_197'41 (g34)
  mov dx, [134]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L96: ; Continuation
  ;; (199'13) Tail: mainloop (f2) @ fs (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L97: ; Arm: 190'7
  ;; (193'17) Return: fs (f5)
  mov dx, [bp+5]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L98: ; Arm: 161'9
  ;; (0'0) Return: con_161'12 (g37)
  mov dx, [137]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L99: ; Arm: 165'35
  push [bp+4]
  push #1
  mov 1, sp
  ;; (0'0) Return: con_165'40 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L100: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L99
  ;; (165'60) Tail: loop (f2) @ ps (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L101: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push cx
  push #L100
  mov cx, sp
  ;; (165'28) Tail: app_165'23 (arg) @ command (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L102: ; Function: t3
  mov bx, dx
  cmp [bx], #0
  bz L98
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
  push #L101
  mov cx, sp
  ;; (165'23) Tail: eq_string (f1) @ name (t3)
  mov bp, [bp+1]
  mov dx, [3]
  mov ax, [bp]
  jmp [ax]

L103: ; Continuation
  ;; (193'17) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L104: ; Continuation
  push [bp+2]
  push cx
  push #L103
  mov cx, sp
  ;; (98'29) Tail: put_chars (g24) @ app_98'38 (arg)
  mov bp, [124]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L105: ; Continuation
  push [bp+3]
  push cx
  push #L104
  mov cx, sp
  ;; (98'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L106: ; Arm: 182'9
  push [145]
  push [bp+5]
  push #1
  mov 1, sp
  push [1]
  push [138]
  push #1
  mov 2, sp
  push [bp+4]
  push [bp+2]
  push cx
  push #L105
  mov cx, sp
  ;; (180'33) Tail: concat (f3) @ con_180'34 (t2)
  mov bp, [bp+3]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L107: ; Continuation
  ;; (193'17) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L108: ; Continuation
  push [bp+2]
  push cx
  push #L107
  mov cx, sp
  ;; (98'29) Tail: put_chars (g24) @ app_98'38 (arg)
  mov bp, [124]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L109: ; Continuation
  push [bp+3]
  push cx
  push #L108
  mov cx, sp
  ;; (98'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L110: ; Arm: 185'14
  mov ax, [bx+1]
  mov 2, ax
  push [153]
  push [bp+5]
  push #1
  mov 3, sp
  push [3]
  push [146]
  push #1
  mov 4, sp
  push [bp+4]
  push [bp+2]
  push cx
  push #L109
  mov cx, sp
  ;; (180'33) Tail: concat (f3) @ con_180'34 (t4)
  mov bp, [bp+3]
  mov dx, [4]
  mov ax, [bp]
  jmp [ax]

L111: ; Continuation
  ;; (186'32) Tail: app_186'29 (arg) @ args (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L112: ; Continuation
  mov bx, dx
  cmp [bx], #0
  bz L106
  mov ax, [bx+1]
  mov 1, ax
  mov bx, [1]
  cmp [bx], #0
  bz L110
  mov ax, [bx+1]
  mov 2, ax
  mov ax, [bx+2]
  mov 3, ax
  push [bp+6]
  push cx
  push #L111
  mov cx, sp
  ;; (186'29) Tail: f (t3) @ fs (f4)
  mov dx, [bp+4]
  mov bp, [3]
  mov ax, [bp]
  jmp [ax]

L113: ; Continuation
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L112
  mov cx, sp
  ;; (167'17) Tail: loop (f7) @ case_156'18 (arg)
  mov bp, [bp+7]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L114: ; Continuation
  push [bp+6]
  push cx
  push #L96
  mov cx, sp
  mov bx, dx
  cmp [bx], #0
  bz L97
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push [1]
  push [bp+3]
  push #L102
  mov 3, sp
  push [3]
  push [2]
  push [1]
  push [bp+5]
  push [bp+4]
  push [bp+2]
  push cx
  push #L113
  mov cx, sp
  mov bx, [bp+5]
  mov ax, [bx+1]
  mov 4, ax
  ;; (156'43) Return: ps (t4)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L115: ; Continuation
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L114
  mov cx, sp
  ;; (40'23) Tail: app_40'20 (arg) @ xs (f7)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+7]
  mov ax, [bp]
  jmp [ax]

L116: ; Continuation
  push dx
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L115
  mov cx, sp
  ;; (40'20) Tail: revloop (g8) @ con_40'20 (g36)
  mov bp, [108]
  mov dx, [136]
  mov ax, [bp]
  jmp [ax]

L117: ; Continuation
  push [bp+7]
  push [bp+6]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L116
  mov cx, sp
  ;; (148'37) Tail: app_148'34 (f5) @ app_148'46 (arg)
  mov bp, [bp+5]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L118: ; Continuation
  push [bp+6]
  push [bp+5]
  push dx
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L117
  mov cx, sp
  ;; (148'46) Tail: explode (f2) @ line (f7)
  mov dx, [bp+7]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L119: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L95
  push [bp+8]
  push [bp+7]
  push [bp+6]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L118
  mov cx, sp
  ;; (148'34) Tail: at_word_start (f5) @ con_148'34 (g35)
  mov bp, [bp+5]
  mov dx, [135]
  mov ax, [bp]
  jmp [ax]

L120: ; Continuation
  push [bp+9]
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L119
  mov cx, sp
  ;; (197'20) Tail: app_197'15 (arg) @ single_controlD (f8)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+8]
  mov ax, [bp]
  jmp [ax]

L121: ; Continuation
  push dx
  push [bp+8]
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L120
  mov cx, sp
  ;; (197'15) Tail: eq_string (f3) @ line (arg)
  mov bp, [bp+3]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L122: ; Continuation
  push [bp+2]
  push #L94
  mov 1, sp
  push dx
  push [bp+8]
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push cx
  push #L121
  mov cx, sp
  ;; (129'11) Tail: readloop (t1) @ con_129'11 (g33)
  mov bp, [1]
  mov dx, [133]
  mov ax, [bp]
  jmp [ax]

L123: ; Continuation
  push [128]
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
  push #L122
  mov cx, sp
  ;; (195'32) Tail: implode (f2) @ con_0'0 (t1)
  mov bp, [bp+2]
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L124: ; Continuation
  push [bp+9]
  push [bp+8]
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L123
  mov cx, sp
  ;; (98'29) Tail: put_chars (g24) @ app_98'38 (arg)
  mov bp, [124]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L125: ; Function: t3
  push bp
  push dx
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push cx
  push #L124
  mov cx, sp
  ;; (98'38) Tail: explode (f3) @ lit_194'13 (g27)
  mov bp, [bp+3]
  mov dx, [127]
  mov ax, [bp]
  jmp [ax]

L126: ; Continuation
  ;; (201'17) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L127: ; Continuation
  push [bp+2]
  push cx
  push #L126
  mov cx, sp
  ;; (98'29) Tail: put_chars (g24) @ app_98'38 (arg)
  mov bp, [124]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L128: ; Arm: 203'9
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push [bp+2]
  push cx
  push #L127
  mov cx, sp
  ;; (98'38) Tail: explode (f1) @ lit_203'23 (g61)
  mov bp, [bp+1]
  mov dx, [161]
  mov ax, [bp]
  jmp [ax]

L129: ; Arm: 172'9
  ;; (0'0) Return: con_172'12 (g63)
  mov dx, [163]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L130: ; Continuation
  ;; (173'48) Tail: loop (f2) @ xs (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L131: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L130
  mov cx, sp
  ;; (98'29) Tail: put_chars (g24) @ app_98'38 (arg)
  mov bp, [124]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L132: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L129
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
  push #L131
  mov cx, sp
  ;; (98'38) Tail: explode (f1) @ x (t1)
  mov bp, [bp+1]
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L133: ; Continuation
  mov ax, #'\n'
  call bios_put_char
  mov 1, ax
  ;; (201'17) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L134: ; Arm: 176'9
  ;; (0'0) Return: con_176'12 (g64)
  mov dx, [164]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L135: ; Continuation
  ;; (177'34) Tail: loop (f2) @ xs (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L136: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L135
  mov cx, sp
  ;; (98'29) Tail: put_chars (g24) @ app_98'38 (arg)
  mov bp, [124]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L137: ; Continuation
  push [bp+2]
  push #L132
  mov 1, sp
  push [bp+3]
  push cx
  push #L133
  mov cx, sp
  mov bx, dx
  cmp [bx], #0
  bz L134
  mov ax, [bx+1]
  mov 2, ax
  mov ax, [bx+2]
  mov 3, ax
  push [3]
  push [1]
  push cx
  push #L136
  mov cx, sp
  ;; (98'38) Tail: explode (f2) @ x (t2)
  mov bp, [bp+2]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L138: ; Continuation
  push [bp+4]
  push [bp+2]
  push cx
  push #L137
  mov cx, sp
  ;; (207'43) Tail: app_207'33 (f3) @ case_156'18 (arg)
  mov bp, [bp+3]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L139: ; Continuation
  push [bp+3]
  push dx
  push [bp+2]
  push cx
  push #L138
  mov cx, sp
  mov bx, [bp+3]
  mov ax, [bx+1]
  mov 1, ax
  ;; (156'43) Return: ps (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L140: ; Function: t1
  mov bx, dx
  cmp [bx], #1
  bz L128
  push [bp+2]
  push [bp+1]
  push cx
  push #L139
  mov cx, sp
  ;; (207'33) Tail: map (g3) @ lam_206'19 (g62)
  mov bp, [103]
  mov dx, [162]
  mov ax, [bp]
  jmp [ax]

L141: ; Function: t1
  push dx
  push [bp+1]
  push #L140
  mov 1, sp
  ;; (0'0) Return: lam_201'20 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L142: ; Continuation
  ;; (209'18) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L143: ; Continuation
  push [bp+2]
  push cx
  push #L142
  mov cx, sp
  ;; (98'29) Tail: put_chars (g24) @ app_98'38 (arg)
  mov bp, [124]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L144: ; Arm: 219'7
  push [bp+4]
  push cx
  push #L143
  mov cx, sp
  ;; (98'38) Tail: explode (f1) @ lit_219'22 (g67)
  mov bp, [bp+1]
  mov dx, [167]
  mov ax, [bp]
  jmp [ax]

L145: ; Arm: 161'9
  ;; (0'0) Return: con_161'12 (g68)
  mov dx, [168]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L146: ; Arm: 165'35
  push [bp+4]
  push #1
  mov 1, sp
  ;; (0'0) Return: con_165'40 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L147: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L146
  ;; (165'60) Tail: loop (f2) @ ps (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L148: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push cx
  push #L147
  mov cx, sp
  ;; (165'28) Tail: app_165'23 (arg) @ x (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L149: ; Function: t3
  mov bx, dx
  cmp [bx], #0
  bz L145
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
  push #L148
  mov cx, sp
  ;; (165'23) Tail: eq_string (f1) @ name (t3)
  mov bp, [bp+1]
  mov dx, [3]
  mov ax, [bp]
  jmp [ax]

L150: ; Arm: 161'9
  ;; (0'0) Return: con_161'12 (g77)
  mov dx, [177]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L151: ; Arm: 165'35
  push [bp+4]
  push #1
  mov 1, sp
  ;; (0'0) Return: con_165'40 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L152: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L151
  ;; (165'60) Tail: loop (f2) @ ps (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L153: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push cx
  push #L152
  mov cx, sp
  ;; (165'28) Tail: app_165'23 (arg) @ x (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L154: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L150
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
  push #L153
  mov cx, sp
  ;; (165'23) Tail: eq_string (f1) @ name (t3)
  mov bp, [bp+1]
  mov dx, [3]
  mov ax, [bp]
  jmp [ax]

L155: ; Continuation
  ;; (98'29) Tail: put_chars (g24) @ app_98'38 (arg)
  mov bp, [124]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L156: ; Continuation
  push cx
  push #L155
  mov cx, sp
  ;; (98'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L157: ; Arm: 212'11
  push [181]
  push [bp+4]
  push #1
  mov 1, sp
  push [1]
  push [178]
  push #1
  mov 2, sp
  push [bp+2]
  push cx
  push #L156
  mov cx, sp
  ;; (212'33) Tail: concat (f3) @ con_212'34 (t2)
  mov bp, [bp+3]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L158: ; Continuation
  ;; (98'29) Tail: put_chars (g24) @ app_98'38 (arg)
  mov bp, [124]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L159: ; Arm: 215'16
  mov ax, [bx+1]
  mov 2, ax
  push cx
  push #L158
  mov cx, sp
  ;; (98'38) Tail: explode (f2) @ s (t2)
  mov bp, [bp+2]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L160: ; Continuation
  ;; (98'29) Tail: put_chars (g24) @ app_98'38 (arg)
  mov bp, [124]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L161: ; Continuation
  push cx
  push #L160
  mov cx, sp
  ;; (98'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L162: ; Continuation
  mov bx, dx
  cmp [bx], #0
  bz L157
  mov ax, [bx+1]
  mov 1, ax
  mov bx, [1]
  cmp [bx], #0
  bz L159
  mov ax, [bx+1]
  mov 2, ax
  mov ax, [bx+2]
  mov 3, ax
  push [185]
  push [bp+4]
  push #1
  mov 4, sp
  push [4]
  push [182]
  push #1
  mov 5, sp
  push [bp+2]
  push cx
  push #L161
  mov cx, sp
  ;; (216'48) Tail: concat (f3) @ con_216'49 (t5)
  mov bp, [bp+3]
  mov dx, [5]
  mov ax, [bp]
  jmp [ax]

L163: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L162
  mov cx, sp
  ;; (167'17) Tail: loop (f5) @ case_156'18 (arg)
  mov bp, [bp+5]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L164: ; Function: t1
  push dx
  push [bp+2]
  push #L154
  mov 1, sp
  push [1]
  push dx
  push [bp+3]
  push [bp+1]
  push cx
  push #L163
  mov cx, sp
  mov bx, [bp+4]
  mov ax, [bx+1]
  mov 2, ax
  ;; (156'43) Return: ps (t2)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L165: ; Continuation
  ;; (209'18) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L166: ; Continuation
  push [bp+2]
  push cx
  push #L165
  mov cx, sp
  ;; (220'32) Tail: app_220'27 (arg) @ xs (f3)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+3]
  mov ax, [bp]
  jmp [ax]

L167: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push #L164
  mov 1, sp
  push [bp+6]
  push [bp+5]
  push cx
  push #L166
  mov cx, sp
  ;; (220'27) Tail: iter (g5) @ lam_210'11 (t1)
  mov bp, [105]
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L168: ; Continuation
  ;; (98'29) Tail: put_chars (g24) @ app_98'38 (arg)
  mov bp, [124]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L169: ; Continuation
  push cx
  push #L168
  mov cx, sp
  ;; (98'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L170: ; Arm: 212'11
  push [172]
  push [bp+6]
  push #1
  mov 1, sp
  push [1]
  push [169]
  push #1
  mov 2, sp
  push [bp+2]
  push cx
  push #L169
  mov cx, sp
  ;; (212'33) Tail: concat (f4) @ con_212'34 (t2)
  mov bp, [bp+4]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L171: ; Continuation
  ;; (98'29) Tail: put_chars (g24) @ app_98'38 (arg)
  mov bp, [124]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L172: ; Arm: 215'16
  mov ax, [bx+1]
  mov 2, ax
  push cx
  push #L171
  mov cx, sp
  ;; (98'38) Tail: explode (f2) @ s (t2)
  mov bp, [bp+2]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L173: ; Continuation
  ;; (98'29) Tail: put_chars (g24) @ app_98'38 (arg)
  mov bp, [124]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L174: ; Continuation
  push cx
  push #L173
  mov cx, sp
  ;; (98'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L175: ; Continuation
  push [bp+7]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L167
  mov cx, sp
  mov bx, dx
  cmp [bx], #0
  bz L170
  mov ax, [bx+1]
  mov 1, ax
  mov bx, [1]
  cmp [bx], #0
  bz L172
  mov ax, [bx+1]
  mov 2, ax
  mov ax, [bx+2]
  mov 3, ax
  push [176]
  push [bp+6]
  push #1
  mov 4, sp
  push [4]
  push [173]
  push #1
  mov 5, sp
  push [bp+2]
  push cx
  push #L174
  mov cx, sp
  ;; (216'48) Tail: concat (f4) @ con_216'49 (t5)
  mov bp, [bp+4]
  mov dx, [5]
  mov ax, [bp]
  jmp [ax]

L176: ; Continuation
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L175
  mov cx, sp
  ;; (167'17) Tail: loop (f8) @ case_156'18 (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L177: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L144
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push [1]
  push [bp+2]
  push #L149
  mov 3, sp
  push [3]
  push [2]
  push [1]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push cx
  push #L176
  mov cx, sp
  mov bx, [bp+4]
  mov ax, [bx+1]
  mov 4, ax
  ;; (156'43) Return: ps (t4)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L178: ; Function: t4
  push dx
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push #L177
  mov 1, sp
  ;; (0'0) Return: lam_209'21 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L179: ; Continuation
  ;; (222'18) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L180: ; Continuation
  push [bp+2]
  push cx
  push #L179
  mov cx, sp
  ;; (98'29) Tail: put_chars (g24) @ app_98'38 (arg)
  mov bp, [124]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L181: ; Arm: 233'7
  push [bp+4]
  push cx
  push #L180
  mov cx, sp
  ;; (98'38) Tail: explode (f1) @ lit_233'22 (g88)
  mov bp, [bp+1]
  mov dx, [188]
  mov ax, [bp]
  jmp [ax]

L182: ; Arm: 161'9
  ;; (0'0) Return: con_161'12 (g89)
  mov dx, [189]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L183: ; Arm: 165'35
  push [bp+4]
  push #1
  mov 1, sp
  ;; (0'0) Return: con_165'40 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L184: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L183
  ;; (165'60) Tail: loop (f2) @ ps (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L185: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push cx
  push #L184
  mov cx, sp
  ;; (165'28) Tail: app_165'23 (arg) @ x (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L186: ; Function: t3
  mov bx, dx
  cmp [bx], #0
  bz L182
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
  push #L185
  mov cx, sp
  ;; (165'23) Tail: eq_string (f1) @ name (t3)
  mov bp, [bp+1]
  mov dx, [3]
  mov ax, [bp]
  jmp [ax]

L187: ; Arm: 161'9
  ;; (0'0) Return: con_161'12 (g98)
  mov dx, [198]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L188: ; Arm: 165'35
  push [bp+4]
  push #1
  mov 1, sp
  ;; (0'0) Return: con_165'40 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L189: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L188
  ;; (165'60) Tail: loop (f2) @ ps (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L190: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push cx
  push #L189
  mov cx, sp
  ;; (165'28) Tail: app_165'23 (arg) @ name (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L191: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L187
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
  push #L190
  mov cx, sp
  ;; (165'23) Tail: eq_string (f1) @ name (t3)
  mov bp, [bp+1]
  mov dx, [3]
  mov ax, [bp]
  jmp [ax]

L192: ; Continuation
  ;; (98'29) Tail: put_chars (g24) @ app_98'38 (arg)
  mov bp, [124]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L193: ; Continuation
  push cx
  push #L192
  mov cx, sp
  ;; (98'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L194: ; Arm: 226'11
  push [202]
  push [bp+4]
  push #1
  mov 1, sp
  push [1]
  push [199]
  push #1
  mov 2, sp
  push [bp+2]
  push cx
  push #L193
  mov cx, sp
  ;; (224'35) Tail: concat (f3) @ con_224'36 (t2)
  mov bp, [bp+3]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L195: ; Continuation
  ;; (98'29) Tail: put_chars (g24) @ app_98'38 (arg)
  mov bp, [124]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L196: ; Continuation
  push cx
  push #L195
  mov cx, sp
  ;; (98'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L197: ; Arm: 229'16
  mov ax, [bx+1]
  mov 2, ax
  push [206]
  push [bp+4]
  push #1
  mov 3, sp
  push [3]
  push [203]
  push #1
  mov 4, sp
  push [bp+2]
  push cx
  push #L196
  mov cx, sp
  ;; (224'35) Tail: concat (f3) @ con_224'36 (t4)
  mov bp, [bp+3]
  mov dx, [4]
  mov ax, [bp]
  jmp [ax]

L198: ; Continuation
  ;; (98'29) Tail: put_chars (g24) @ app_98'38 (arg)
  mov bp, [124]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L199: ; Continuation
  mov bx, dx
  cmp [bx], #0
  bz L194
  mov ax, [bx+1]
  mov 1, ax
  mov bx, [1]
  cmp [bx], #0
  bz L197
  mov ax, [bx+1]
  mov 2, ax
  mov ax, [bx+2]
  mov 3, ax
  push cx
  push #L198
  mov cx, sp
  ;; (98'38) Tail: explode (f2) @ meta (t2)
  mov bp, [bp+2]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L200: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L199
  mov cx, sp
  ;; (167'17) Tail: loop (f5) @ case_156'18 (arg)
  mov bp, [bp+5]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L201: ; Function: t1
  push dx
  push [bp+2]
  push #L191
  mov 1, sp
  push [1]
  push dx
  push [bp+3]
  push [bp+1]
  push cx
  push #L200
  mov cx, sp
  mov bx, [bp+4]
  mov ax, [bx+1]
  mov 2, ax
  ;; (156'43) Return: ps (t2)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L202: ; Continuation
  ;; (222'18) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L203: ; Continuation
  push [bp+2]
  push cx
  push #L202
  mov cx, sp
  ;; (234'32) Tail: app_234'27 (arg) @ xs (f3)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+3]
  mov ax, [bp]
  jmp [ax]

L204: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push #L201
  mov 1, sp
  push [bp+6]
  push [bp+5]
  push cx
  push #L203
  mov cx, sp
  ;; (234'27) Tail: iter (g5) @ lam_223'11 (t1)
  mov bp, [105]
  mov dx, [1]
  mov ax, [bp]
  jmp [ax]

L205: ; Continuation
  ;; (98'29) Tail: put_chars (g24) @ app_98'38 (arg)
  mov bp, [124]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L206: ; Continuation
  push cx
  push #L205
  mov cx, sp
  ;; (98'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L207: ; Arm: 226'11
  push [193]
  push [bp+6]
  push #1
  mov 1, sp
  push [1]
  push [190]
  push #1
  mov 2, sp
  push [bp+2]
  push cx
  push #L206
  mov cx, sp
  ;; (224'35) Tail: concat (f4) @ con_224'36 (t2)
  mov bp, [bp+4]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L208: ; Continuation
  ;; (98'29) Tail: put_chars (g24) @ app_98'38 (arg)
  mov bp, [124]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L209: ; Continuation
  push cx
  push #L208
  mov cx, sp
  ;; (98'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L210: ; Arm: 229'16
  mov ax, [bx+1]
  mov 2, ax
  push [197]
  push [bp+6]
  push #1
  mov 3, sp
  push [3]
  push [194]
  push #1
  mov 4, sp
  push [bp+2]
  push cx
  push #L209
  mov cx, sp
  ;; (224'35) Tail: concat (f4) @ con_224'36 (t4)
  mov bp, [bp+4]
  mov dx, [4]
  mov ax, [bp]
  jmp [ax]

L211: ; Continuation
  ;; (98'29) Tail: put_chars (g24) @ app_98'38 (arg)
  mov bp, [124]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L212: ; Continuation
  push [bp+7]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L204
  mov cx, sp
  mov bx, dx
  cmp [bx], #0
  bz L207
  mov ax, [bx+1]
  mov 1, ax
  mov bx, [1]
  cmp [bx], #0
  bz L210
  mov ax, [bx+1]
  mov 2, ax
  mov ax, [bx+2]
  mov 3, ax
  push cx
  push #L211
  mov cx, sp
  ;; (98'38) Tail: explode (f2) @ meta (t2)
  mov bp, [bp+2]
  mov dx, [2]
  mov ax, [bp]
  jmp [ax]

L213: ; Continuation
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L212
  mov cx, sp
  ;; (167'17) Tail: loop (f8) @ case_156'18 (arg)
  mov bp, [bp+8]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L214: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L181
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push [1]
  push [bp+2]
  push #L186
  mov 3, sp
  push [3]
  push [2]
  push [1]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push cx
  push #L213
  mov cx, sp
  mov bx, [bp+4]
  mov ax, [bx+1]
  mov 4, ax
  ;; (156'43) Return: ps (t4)
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L215: ; Function: t7
  push dx
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push #L214
  mov 1, sp
  ;; (0'0) Return: lam_222'21 (t1)
  mov dx, [1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L216: ; Continuation
  push [bp+2]
  push #L141
  mov 1, sp
  push [1]
  push [160]
  push #1
  mov 2, sp
  push [2]
  push [159]
  push #0
  mov 3, sp
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push #L178
  mov 4, sp
  push [4]
  push [166]
  push #1
  mov 5, sp
  push [5]
  push [165]
  push #0
  mov 6, sp
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push #L215
  mov 7, sp
  push [7]
  push [187]
  push #1
  mov 8, sp
  push [8]
  push [186]
  push #0
  mov 9, sp
  push [207]
  push [9]
  push #1
  mov 10, sp
  push [10]
  push [6]
  push #1
  mov 11, sp
  push [11]
  push [3]
  push #1
  mov 12, sp
  push [12]
  push [158]
  push #1
  mov 13, sp
  push [13]
  push #0
  mov 14, sp
  ;; (251'11) Tail: mainloop (f5) @ con_241'13 (t14)
  mov bp, [bp+5]
  mov dx, [14]
  mov ax, [bp]
  jmp [ax]

L217: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L216
  mov cx, sp
  ;; (98'29) Tail: put_chars (g24) @ app_98'38 (arg)
  mov bp, [124]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L218: ; Continuation
  push [bp+4]
  push [bp+2]
  push #L67
  mov 1, sp
  push [bp+3]
  push #L84
  mov 2, sp
  push [2]
  push [1]
  push dx
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push #L125
  mov 3, sp
  push [3]
  push [1]
  push dx
  push [bp+4]
  push cx
  push #L217
  mov cx, sp
  ;; (98'38) Tail: explode (f4) @ lit_250'13 (g54)
  mov bp, [bp+4]
  mov dx, [154]
  mov ax, [bp]
  jmp [ax]

L219: ; Continuation
  push dx
  push [bp+3]
  push [bp+2]
  push cx
  push #L218
  mov cx, sp
  ;; (72'25) Tail: block (g1) @ lam_72'30 (g22)
  mov bp, [101]
  mov dx, [122]
  mov ax, [bp]
  jmp [ax]

L220: ; Continuation
  push dx
  push [bp+2]
  push cx
  push #L219
  mov cx, sp
  ;; (65'23) Tail: block (g1) @ lam_65'28 (g14)
  mov bp, [101]
  mov dx, [114]
  mov ax, [bp]
  jmp [ax]

L221: ; Continuation
  push dx
  push cx
  push #L220
  mov cx, sp
  ;; (54'30) Tail: block (g1) @ lam_54'35 (g12)
  mov bp, [101]
  mov dx, [112]
  mov ax, [bp]
  jmp [ax]

L222: ; Start
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
  push #L21
  mov 107, sp
  push #L25
  mov 108, sp
  push #0
  mov 109, sp
  push #L33
  mov 110, sp
  push #0
  mov 111, sp
  push #L41
  mov 112, sp
  push #0
  mov 113, sp
  push #L47
  mov 114, sp
  push #0
  mov 115, sp
  push #1
  mov 116, sp
  push #0
  mov 117, sp
  push #1
  mov 118, sp
  push #0
  mov 119, sp
  push #1
  mov 120, sp
  push #0
  mov 121, sp
  push #L57
  mov 122, sp
  push #0
  mov ax, sp
  mov 123, ax
  push #0
  mov 125, sp
  push #L59
  mov 124, sp
  push #0
  mov 126, sp
  push #0
  push sp
  push #' '
  push #1
  push sp
  push #'%'
  push #1
  mov ax, sp
  mov 127, ax
  push #0
  mov 128, sp
  push #0
  mov 129, sp
  push #0
  mov 130, sp
  push #1
  mov 131, sp
  push #0
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
  mov ax, sp
  mov 138, ax
  push #0
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  mov ax, sp
  mov 139, ax
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
  mov ax, sp
  mov 140, ax
  push #0
  push sp
  push #'\n'
  push #1
  mov ax, sp
  mov 141, ax
  push #0
  mov 142, sp
  push [142]
  push [141]
  push #1
  mov 143, sp
  push [143]
  push [140]
  push #1
  mov 144, sp
  push [144]
  push [139]
  push #1
  mov 145, sp
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
  mov ax, sp
  mov 146, ax
  push #0
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  mov ax, sp
  mov 147, ax
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
  mov ax, sp
  mov 148, ax
  push #0
  push sp
  push #'\n'
  push #1
  mov ax, sp
  mov 149, ax
  push #0
  mov 150, sp
  push [150]
  push [149]
  push #1
  mov 151, sp
  push [151]
  push [148]
  push #1
  mov 152, sp
  push [152]
  push [147]
  push #1
  mov 153, sp
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
  mov ax, sp
  mov 154, ax
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
  mov ax, sp
  mov 155, ax
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
  mov ax, sp
  mov 156, ax
  push [156]
  push #0
  mov 157, sp
  push [157]
  push [155]
  push #0
  mov 158, sp
  push #0
  push sp
  push #'s'
  push #1
  push sp
  push #'l'
  push #1
  mov ax, sp
  mov 159, ax
  push #0
  push sp
  push #'\n'
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
  push #'t'
  push #1
  push sp
  push #'s'
  push #1
  push sp
  push #'i'
  push #1
  push sp
  push #'L'
  push #1
  mov ax, sp
  mov 160, ax
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
  mov ax, sp
  mov 161, ax
  push #L60
  mov 162, sp
  push #0
  mov 163, sp
  push #0
  mov 164, sp
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
  mov ax, sp
  mov 165, ax
  push #0
  push sp
  push #'\n'
  push #1
  push sp
  push #'.'
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
  push #'f'
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
  push #'w'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'h'
  push #1
  push sp
  push #'S'
  push #1
  mov ax, sp
  mov 166, ax
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
  mov ax, sp
  mov 167, ax
  push #0
  mov 168, sp
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
  mov ax, sp
  mov 169, ax
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
  mov ax, sp
  mov 170, ax
  push #0
  mov 171, sp
  push [171]
  push [170]
  push #1
  mov 172, sp
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
  mov ax, sp
  mov 173, ax
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
  mov ax, sp
  mov 174, ax
  push #0
  mov 175, sp
  push [175]
  push [174]
  push #1
  mov 176, sp
  push #0
  mov 177, sp
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
  mov ax, sp
  mov 178, ax
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
  mov ax, sp
  mov 179, ax
  push #0
  mov 180, sp
  push [180]
  push [179]
  push #1
  mov 181, sp
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
  mov ax, sp
  mov 182, ax
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
  mov ax, sp
  mov 183, ax
  push #0
  mov 184, sp
  push [184]
  push [183]
  push #1
  mov 185, sp
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
  mov ax, sp
  mov 186, ax
  push #0
  push sp
  push #'\n'
  push #1
  push sp
  push #'.'
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
  push #'a'
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
  push #'f'
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
  push #'w'
  push #1
  push sp
  push #'o'
  push #1
  push sp
  push #'h'
  push #1
  push sp
  push #'S'
  push #1
  mov ax, sp
  mov 187, ax
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
  push #'n'
  push #1
  push sp
  push #'a'
  push #1
  push sp
  push #'m'
  push #1
  mov ax, sp
  mov 188, ax
  push #0
  mov 189, sp
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
  mov ax, sp
  mov 190, ax
  push #0
  push sp
  push #'\n'
  push #1
  mov ax, sp
  mov 191, ax
  push #0
  mov 192, sp
  push [192]
  push [191]
  push #1
  mov 193, sp
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
  mov ax, sp
  mov 194, ax
  push #0
  push sp
  push #'\n'
  push #1
  mov ax, sp
  mov 195, ax
  push #0
  mov 196, sp
  push [196]
  push [195]
  push #1
  mov 197, sp
  push #0
  mov 198, sp
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
  mov ax, sp
  mov 199, ax
  push #0
  push sp
  push #'\n'
  push #1
  mov ax, sp
  mov 200, ax
  push #0
  mov 201, sp
  push [201]
  push [200]
  push #1
  mov 202, sp
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
  mov ax, sp
  mov 203, ax
  push #0
  push sp
  push #'\n'
  push #1
  mov ax, sp
  mov 204, ax
  push #0
  mov 205, sp
  push [205]
  push [204]
  push #1
  mov 206, sp
  push #0
  mov 207, sp
  push cx
  push #L221
  mov cx, sp
  ;; (44'23) Tail: block (g1) @ lam_44'28 (g10)
  mov bp, [101]
  mov dx, [110]
  mov ax, [bp]
  jmp [ax]


