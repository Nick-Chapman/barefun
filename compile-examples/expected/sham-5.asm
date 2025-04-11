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
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L3: ; Arm: 16'7
  ;; (0'0) Return: lit_16'10 (g3)
  mov dx, 103
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L4: ; Continuation
  mov ax, 104
  add ax, dx
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
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
  mov bp, 102
  mov dx, 2
  mov ax, [bp]
  jmp [ax]

L6: ; Arm: 21'7
  ;; (0'0) Return: con_21'10 (g6)
  mov dx, 106
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
  mov dx, 1
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
  ;; (22'24) Tail: map (g5) @ f (f2)
  mov dx, [bp+2]
  mov bp, 105
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
  push 2
  push [bp+1]
  push cx
  push #L9
  mov cx, sp
  ;; (22'15) Tail: f (f1) @ x (t1)
  mov bp, [bp+1]
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L11: ; Function: g5
  push dx
  push #L10
  mov 1, sp
  ;; (0'0) Return: lam_19'14 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L12: ; Arm: 26'7
  ;; (0'0) Return: con_26'10 (g8)
  mov dx, 108
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
  ;; (27'23) Tail: iter (g7) @ f (f2)
  mov dx, [bp+2]
  mov bp, 107
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
  push 2
  push [bp+1]
  push cx
  push #L14
  mov cx, sp
  ;; (27'15) Tail: f (f1) @ x (t1)
  mov bp, [bp+1]
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L16: ; Function: g7
  push dx
  push #L15
  mov 1, sp
  ;; (0'0) Return: lam_24'15 (t1)
  mov dx, 1
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
  mov dx, 1
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
  push 1
  push dx
  push cx
  push #L19
  mov cx, sp
  ;; (32'25) Tail: append (g9) @ xs (t2)
  mov bp, 109
  mov dx, 2
  mov ax, [bp]
  jmp [ax]

L21: ; Function: g9
  push dx
  push #L20
  mov 1, sp
  ;; (0'0) Return: lam_29'18 (t1)
  mov dx, 1
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
  push 1
  push #1
  mov 3, sp
  push 2
  push cx
  push #L23
  mov cx, sp
  ;; (38'23) Tail: revloop (g10) @ con_0'0 (t3)
  mov bp, 110
  mov dx, 3
  mov ax, [bp]
  jmp [ax]

L25: ; Function: g10
  push dx
  push #L24
  mov 1, sp
  ;; (0'0) Return: lam_35'22 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L26: ; Arm: 44'30
  ;; (0'0) Return: con_44'33 (g12)
  mov dx, 112
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L27: ; Arm: 44'7
  mov bx, dx
  cmp [bx], #0
  bz L26
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  ;; (0'0) Return: con_44'48 (g13)
  mov dx, 113
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L28: ; Arm: 47'10
  ;; (0'0) Return: con_47'13 (g14)
  mov dx, 114
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L29: ; Continuation
  ;; (49'37) Tail: app_49'34 (arg) @ ys (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L30: ; Continuation
  push [bp+3]
  push cx
  push #L29
  mov cx, sp
  ;; (49'34) Tail: app_49'31 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L31: ; Arm: 49'18
  push [bp+4]
  push [bp+3]
  push cx
  push #L30
  mov cx, sp
  ;; (49'31) Tail: eq_list (g11) @ eq (f2)
  mov dx, [bp+2]
  mov bp, 111
  mov ax, [bp]
  jmp [ax]

L32: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L31
  ;; (0'0) Return: con_49'45 (g15)
  mov dx, 115
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L33: ; Continuation
  push [bp+5]
  push [bp+3]
  push [bp+2]
  push cx
  push #L32
  mov cx, sp
  ;; (49'16) Tail: app_49'14 (arg) @ y (f4)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+4]
  mov ax, [bp]
  jmp [ax]

L34: ; Function: t1
  mov bx, [bp+2]
  cmp [bx], #0
  bz L27
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov bx, dx
  cmp [bx], #0
  bz L28
  mov ax, [bx+1]
  mov 3, ax
  mov ax, [bx+2]
  mov 4, ax
  push 4
  push 3
  push 2
  push [bp+1]
  push cx
  push #L33
  mov cx, sp
  ;; (49'14) Tail: eq (f1) @ x (t1)
  mov bp, [bp+1]
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L35: ; Function: t1
  push dx
  push [bp+1]
  push #L34
  mov 1, sp
  ;; (0'0) Return: lam_42'22 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L36: ; Function: g11
  push dx
  push #L35
  mov 1, sp
  ;; (0'0) Return: lam_42'19 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L37: ; Arm: 59'9
  ;; (0'0) Return: con_59'12 (g16)
  mov dx, 116
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L38: ; Continuation
  ;; (60'43) Tail: app_60'37 (arg) @ xs (f2)
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
  mov si, 1
  call bios_set_bytes
  mov 3, ax
  mov ax, [bp+2]
  add ax, 117
  mov 4, ax
  push 2
  push cx
  push #L38
  mov cx, sp
  ;; (60'37) Tail: loop (f3) @ prim_0'0 (t4)
  mov bp, [bp+3]
  mov dx, 4
  mov ax, [bp]
  jmp [ax]

L40: ; Function: t2
  push bp
  push dx
  push [bp+1]
  push #L39
  mov 1, sp
  ;; (0'0) Return: lam_57'17 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L41: ; Continuation
  mov ax, [bp+2]
  call bios_freeze_bytes
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L42: ; Continuation
  push [bp+3]
  push cx
  push #L41
  mov cx, sp
  ;; (62'9) Tail: app_62'7 (arg) @ xs (f2)
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
  push 1
  push #L40
  mov 2, sp
  push 1
  push [bp+2]
  push cx
  push #L42
  mov cx, sp
  ;; (62'7) Tail: loop (t2) @ lit_62'7 (g18)
  mov bp, 2
  mov dx, 118
  mov ax, [bp]
  jmp [ax]

L44: ; Function: g19
  push dx
  push cx
  push #L43
  mov cx, sp
  ;; (56'29) Tail: length (g2) @ xs (arg)
  mov bp, 102
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L45: ; Arm: 69'13
  ;; (68'23) Return: acc (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L46: ; Continuation
  mov ax, [bp+2]
  sub ax, 121
  mov 1, ax
  ;; (70'45) Tail: app_70'19 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L47: ; Function: t1
  mov ax, dx
  cmp ax, 120
  call bios_make_bool_from_n
  mov 1, ax
  mov bx, 1
  cmp [bx], #1
  bz L45
  mov ax, [bp+1]
  mov bx, dx
  call bios_string_index
  mov 2, ax
  push [bp+2]
  push 2
  push #1
  mov 3, sp
  push dx
  push cx
  push #L46
  mov cx, sp
  ;; (70'19) Tail: explode_loop (f3) @ con_0'0 (t3)
  mov bp, [bp+3]
  mov dx, 3
  mov ax, [bp]
  jmp [ax]

L48: ; Function: t1
  push bp
  push dx
  push [bp+1]
  push #L47
  mov 1, sp
  ;; (0'0) Return: lam_68'27 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L49: ; Continuation
  mov ax, [bp+2]
  sub ax, 123
  mov 1, ax
  ;; (72'18) Tail: app_72'15 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L50: ; Function: g24
  push dx
  push #L48
  mov 1, sp
  mov ax, dx
  call bios_string_length
  mov 2, ax
  push 2
  push cx
  push #L49
  mov cx, sp
  ;; (72'15) Tail: explode_loop (t1) @ con_72'15 (g22)
  mov bp, 1
  mov dx, 122
  mov ax, [bp]
  jmp [ax]

L51: ; Arm: 91'7
  ;; (0'0) Return: con_91'10 (g27)
  mov dx, 127
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L52: ; Function: g26
  mov bx, dx
  cmp [bx], #0
  bz L51
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov ax, 1
  call bios_put_char
  mov 3, ax
  ;; (92'35) Tail: put_chars (g26) @ xs (t2)
  mov bp, 126
  mov dx, 2
  mov ax, [bp]
  jmp [ax]

L53: ; Function: t1
  mov ax, [bp+1]
  cmp ax, dx
  call bios_make_bool_from_z
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L54: ; Function: g59
  push dx
  push #L53
  mov 1, sp
  ;; (0'0) Return: lam_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L55: ; Function: t1
  mov ax, [bp+1]
  cmp ax, dx
  call bios_make_bool_from_z
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L56: ; Function: g64
  push dx
  push #L55
  mov 1, sp
  ;; (0'0) Return: lam_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L57: ; Function: g89
  mov bx, dx
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  ;; (202'44) Return: name (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L58: ; Function: t1
  mov ax, [bp+1]
  cmp ax, dx
  call bios_make_bool_from_z
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L59: ; Function: g98
  push dx
  push #L58
  mov 1, sp
  ;; (0'0) Return: lam_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L60: ; Function: t1
  mov ax, [bp+1]
  cmp ax, dx
  call bios_make_bool_from_z
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L61: ; Function: g108
  push dx
  push #L60
  mov 1, sp
  ;; (0'0) Return: lam_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L62: ; Function: t1
  mov ax, [bp+1]
  cmp ax, dx
  call bios_make_bool_from_z
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L63: ; Function: g121
  push dx
  push #L62
  mov 1, sp
  ;; (0'0) Return: lam_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L64: ; Function: t1
  mov ax, [bp+1]
  cmp ax, dx
  call bios_make_bool_from_z
  mov 1, ax
  ;; (0'0) Return: prim_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L65: ; Function: g131
  push dx
  push #L64
  mov 1, sp
  ;; (0'0) Return: lam_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L66: ; Arm: 84'7
  ;; (0'0) Return: lit_84'10 (g25)
  mov dx, 125
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L67: ; Continuation
  ;; (80'34) Tail: implode (f2) @ app_80'55 (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L68: ; Continuation
  push [bp+3]
  push cx
  push #L67
  mov cx, sp
  ;; (80'55) Tail: app_80'42 (f2) @ app_80'64 (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L69: ; Continuation
  push [bp+2]
  push dx
  push cx
  push #L68
  mov cx, sp
  ;; (80'64) Tail: explode (f3) @ s2 (f4)
  mov dx, [bp+4]
  mov bp, [bp+3]
  mov ax, [bp]
  jmp [ax]

L70: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L69
  mov cx, sp
  ;; (80'42) Tail: append (g9) @ app_80'51 (arg)
  mov bp, 109
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L71: ; Continuation
  push dx
  push [bp+3]
  push [bp+2]
  push cx
  push #L70
  mov cx, sp
  ;; (80'51) Tail: explode (f3) @ x (f4)
  mov dx, [bp+4]
  mov bp, [bp+3]
  mov ax, [bp]
  jmp [ax]

L72: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L66
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push 1
  push [bp+2]
  push [bp+1]
  push cx
  push #L71
  mov cx, sp
  ;; (85'37) Tail: concat (me) @ xs (t2)
  mov bp, bp
  mov dx, 2
  mov ax, [bp]
  jmp [ax]

L73: ; Continuation
  push [bp+2]
  push dx
  push #1
  mov 1, sp
  ;; (0'0) Return: con_0'0 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L74: ; Continuation
  push [bp+3]
  push cx
  push #L73
  mov cx, sp
  ;; (76'33) Tail: implode (f2) @ app_40'23 (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L75: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L74
  mov cx, sp
  ;; (40'23) Tail: app_40'20 (arg) @ accCs (f4)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+4]
  mov ax, [bp]
  jmp [ax]

L76: ; Arm: 131'11
  push [bp+5]
  push [bp+3]
  push [bp+1]
  push cx
  push #L75
  mov cx, sp
  ;; (40'20) Tail: revloop (g10) @ con_40'20 (g28)
  mov bp, 110
  mov dx, 128
  mov ax, [bp]
  jmp [ax]

L77: ; Continuation
  ;; (133'78) Tail: app_133'45 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L78: ; Continuation
  push [bp+3]
  push dx
  push #1
  mov 1, sp
  push [bp+4]
  push cx
  push #L77
  mov cx, sp
  ;; (133'45) Tail: at_word_start (f2) @ con_0'0 (t1)
  mov bp, [bp+2]
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L79: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push cx
  push #L78
  mov cx, sp
  ;; (76'33) Tail: implode (f2) @ app_40'23 (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L80: ; Continuation
  push [bp+6]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L79
  mov cx, sp
  ;; (40'23) Tail: app_40'20 (arg) @ accCs (f5)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+5]
  mov ax, [bp]
  jmp [ax]

L81: ; Arm: 133'26
  push 2
  push [bp+5]
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push cx
  push #L80
  mov cx, sp
  ;; (40'20) Tail: revloop (g10) @ con_40'20 (g30)
  mov bp, 110
  mov dx, 130
  mov ax, [bp]
  jmp [ax]

L82: ; Continuation
  ;; (134'43) Tail: app_134'32 (arg) @ xs (f2)
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
  ;; (134'32) Tail: app_134'26 (arg) @ con_0'0 (t1)
  mov bp, dx
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L84: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L76
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov ax, 1
  cmp ax, 129
  call bios_make_bool_from_z
  mov 3, ax
  mov bx, 3
  cmp [bx], #1
  bz L81
  push 2
  push 1
  push [bp+5]
  push cx
  push #L83
  mov cx, sp
  ;; (134'26) Tail: have_letter (f4) @ accWs (f3)
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
  ;; (0'0) Return: lam_129'36 (t1)
  mov dx, 1
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
  ;; (0'0) Return: lam_129'30 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L87: ; Arm: 138'9
  ;; (128'24) Return: accWs (f1)
  mov dx, [bp+1]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L88: ; Continuation
  ;; (140'49) Tail: app_140'43 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L89: ; Arm: 140'24
  push 2
  push cx
  push #L88
  mov cx, sp
  ;; (140'43) Tail: at_word_start (f2) @ accWs (f1)
  mov dx, [bp+1]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L90: ; Continuation
  ;; (141'31) Tail: app_141'27 (arg) @ xs (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L91: ; Continuation
  push 132
  push [bp+2]
  push #1
  mov 1, sp
  push [bp+3]
  push cx
  push #L90
  mov cx, sp
  ;; (141'27) Tail: app_141'21 (arg) @ con_141'28 (t1)
  mov bp, dx
  mov dx, 1
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
  mov ax, 1
  cmp ax, 131
  call bios_make_bool_from_z
  mov 3, ax
  mov bx, 3
  cmp [bx], #1
  bz L89
  push 2
  push 1
  push cx
  push #L91
  mov cx, sp
  ;; (141'21) Tail: have_letter (f3) @ accWs (f1)
  mov dx, [bp+1]
  mov bp, [bp+3]
  mov ax, [bp]
  jmp [ax]

L93: ; Function: t2
  push bp
  push [bp+1]
  push #L86
  mov 1, sp
  push 1
  push bp
  push dx
  push #L92
  mov 2, sp
  ;; (0'0) Return: lam_136'8 (t2)
  mov dx, 2
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L94: ; Continuation
  ;; (76'33) Tail: implode (f2) @ app_40'23 (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L95: ; Continuation
  push [bp+2]
  push cx
  push #L94
  mov cx, sp
  ;; (40'23) Tail: app_40'20 (arg) @ acc (f3)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+3]
  mov ax, [bp]
  jmp [ax]

L96: ; Arm: 112'22
  mov ax, 139
  call bios_put_char
  mov 4, ax
  push dx
  push [bp+1]
  push cx
  push #L95
  mov cx, sp
  ;; (40'20) Tail: revloop (g10) @ con_40'20 (g40)
  mov bp, 110
  mov dx, 140
  mov ax, [bp]
  jmp [ax]

L97: ; Continuation
  ;; (76'33) Tail: implode (f2) @ app_40'23 (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L98: ; Continuation
  push [bp+3]
  push 145
  push #1
  mov 1, sp
  push [bp+2]
  push cx
  push #L97
  mov cx, sp
  ;; (40'23) Tail: app_40'20 (arg) @ con_0'0 (t1)
  mov bp, dx
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L99: ; Arm: 113'28
  mov ax, 142
  call bios_put_char
  mov 5, ax
  mov ax, 143
  call bios_put_char
  mov 6, ax
  push dx
  push [bp+1]
  push cx
  push #L98
  mov cx, sp
  ;; (40'20) Tail: revloop (g10) @ con_40'20 (g44)
  mov bp, 110
  mov dx, 144
  mov ax, [bp]
  jmp [ax]

L100: ; Arm: 114'19
  ;; (114'33) Tail: readloop (me) @ acc (arg)
  mov bp, bp
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L101: ; Arm: 117'17
  ;; (117'29) Tail: readloop (me) @ acc (arg)
  mov bp, bp
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L102: ; Continuation
  mov ax, 155
  call bios_put_char
  mov 1, ax
  mov ax, 156
  call bios_put_char
  mov 2, ax
  mov ax, 157
  call bios_put_char
  mov 3, ax
  ;; (121'24) Tail: readloop (f2) @ tail (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L103: ; Arm: 119'31
  mov ax, 151
  call bios_put_char
  mov 1, ax
  mov ax, 152
  call bios_put_char
  mov 2, ax
  mov ax, 153
  call bios_put_char
  mov 3, ax
  ;; (0'0) Return: prim_0'0 (t3)
  mov dx, 3
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L104: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L102
  mov cx, sp
  mov bx, dx
  cmp [bx], #1
  bz L103
  ;; (0'0) Return: con_119'55 (g54)
  mov dx, 154
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L105: ; Arm: 4'9
  ;; (0'0) Return: con_4'12 (g49)
  mov dx, 149
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L106: ; Arm: 115'21
  mov bx, dx
  cmp [bx], #0
  bz L101
  mov ax, [bx+1]
  mov 7, ax
  mov ax, [bx+2]
  mov 8, ax
  mov ax, 7
  call bios_char_to_num
  mov 9, ax
  mov ax, 148
  cmp ax, 9
  call bios_make_bool_from_n
  mov 10, ax
  push 8
  push bp
  push cx
  push #L104
  mov cx, sp
  mov bx, 10
  cmp [bx], #1
  bz L105
  ;; (0'0) Return: con_5'13 (g50)
  mov dx, 150
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L107: ; Function: t1
  call bios_get_char
  mov 1, ax
  mov ax, 1
  call bios_char_to_num
  mov 2, ax
  mov ax, 1
  cmp ax, 138
  call bios_make_bool_from_z
  mov 3, ax
  mov bx, 3
  cmp [bx], #1
  bz L96
  mov ax, 1
  cmp ax, 141
  call bios_make_bool_from_z
  mov 4, ax
  mov bx, 4
  cmp [bx], #1
  bz L99
  mov ax, 146
  cmp ax, 2
  call bios_make_bool_from_n
  mov 5, ax
  mov bx, 5
  cmp [bx], #1
  bz L100
  mov ax, 2
  cmp ax, 147
  call bios_make_bool_from_z
  mov 6, ax
  mov bx, 6
  cmp [bx], #1
  bz L106
  mov ax, 1
  call bios_put_char
  mov 7, ax
  push dx
  push 1
  push #1
  mov 8, sp
  ;; (123'34) Tail: readloop (me) @ con_0'0 (t8)
  mov bp, bp
  mov dx, 8
  mov ax, [bp]
  jmp [ax]

L108: ; Arm: 193'36
  ;; (0'0) Return: con_193'41 (g60)
  mov dx, 160
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L109: ; Continuation
  ;; (195'13) Tail: mainloop (f2) @ fs (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L110: ; Arm: 186'7
  ;; (189'17) Return: fs (f4)
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L111: ; Arm: 157'9
  ;; (0'0) Return: con_157'12 (g63)
  mov dx, 163
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L112: ; Arm: 161'35
  push [bp+4]
  push #1
  mov 1, sp
  ;; (0'0) Return: con_161'40 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L113: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L112
  ;; (161'61) Tail: loop (f2) @ ps (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L114: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L113
  mov cx, sp
  ;; (51'44) Tail: app_51'41 (arg) @ ys (f5)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+5]
  mov ax, [bp]
  jmp [ax]

L115: ; Continuation
  push [bp+6]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L114
  mov cx, sp
  ;; (51'41) Tail: app_51'33 (arg) @ xs (f5)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+5]
  mov ax, [bp]
  jmp [ax]

L116: ; Continuation
  push dx
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L115
  mov cx, sp
  ;; (51'33) Tail: eq_list (g11) @ lam_0'0 (g64)
  mov bp, 111
  mov dx, 164
  mov ax, [bp]
  jmp [ax]

L117: ; Continuation
  push dx
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push cx
  push #L116
  mov cx, sp
  ;; (78'57) Tail: explode (f2) @ command (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L118: ; Function: t3
  mov bx, dx
  cmp [bx], #0
  bz L111
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov bx, 1
  mov ax, [bx+1]
  mov 3, ax
  mov ax, [bx+2]
  mov 4, ax
  push 4
  push 2
  push bp
  push [bp+2]
  push [bp+1]
  push cx
  push #L117
  mov cx, sp
  ;; (78'44) Tail: explode (f1) @ name (t3)
  mov bp, [bp+1]
  mov dx, 3
  mov ax, [bp]
  jmp [ax]

L119: ; Continuation
  ;; (189'17) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L120: ; Continuation
  push [bp+2]
  push cx
  push #L119
  mov cx, sp
  ;; (94'29) Tail: put_chars (g26) @ app_94'38 (arg)
  mov bp, 126
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L121: ; Continuation
  push [bp+3]
  push cx
  push #L120
  mov cx, sp
  ;; (94'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L122: ; Arm: 178'9
  push 172
  push [bp+5]
  push #1
  mov 1, sp
  push 1
  push 165
  push #1
  mov 2, sp
  push [bp+4]
  push [bp+2]
  push cx
  push #L121
  mov cx, sp
  ;; (176'33) Tail: concat (f3) @ con_176'34 (t2)
  mov bp, [bp+3]
  mov dx, 2
  mov ax, [bp]
  jmp [ax]

L123: ; Continuation
  ;; (189'17) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L124: ; Continuation
  push [bp+2]
  push cx
  push #L123
  mov cx, sp
  ;; (94'29) Tail: put_chars (g26) @ app_94'38 (arg)
  mov bp, 126
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L125: ; Continuation
  push [bp+3]
  push cx
  push #L124
  mov cx, sp
  ;; (94'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L126: ; Arm: 181'14
  mov ax, [bx+1]
  mov 2, ax
  push 180
  push [bp+5]
  push #1
  mov 3, sp
  push 3
  push 173
  push #1
  mov 4, sp
  push [bp+4]
  push [bp+2]
  push cx
  push #L125
  mov cx, sp
  ;; (176'33) Tail: concat (f3) @ con_176'34 (t4)
  mov bp, [bp+3]
  mov dx, 4
  mov ax, [bp]
  jmp [ax]

L127: ; Continuation
  ;; (182'32) Tail: app_182'29 (arg) @ args (f2)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+2]
  mov ax, [bp]
  jmp [ax]

L128: ; Continuation
  mov bx, dx
  cmp [bx], #0
  bz L122
  mov ax, [bx+1]
  mov 1, ax
  mov bx, 1
  cmp [bx], #0
  bz L126
  mov ax, [bx+1]
  mov 2, ax
  mov ax, [bx+2]
  mov 3, ax
  push [bp+6]
  push cx
  push #L127
  mov cx, sp
  ;; (182'29) Tail: f (t3) @ fs (f4)
  mov dx, [bp+4]
  mov bp, 3
  mov ax, [bp]
  jmp [ax]

L129: ; Continuation
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L128
  mov cx, sp
  ;; (163'17) Tail: loop (f7) @ case_152'18 (arg)
  mov bp, [bp+7]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L130: ; Continuation
  push [bp+5]
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
  push 1
  push [bp+2]
  push #L118
  mov 3, sp
  push 3
  push 2
  push 1
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L129
  mov cx, sp
  mov bx, [bp+4]
  mov ax, [bx+1]
  mov 4, ax
  ;; (152'43) Return: ps (t4)
  mov dx, 4
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L131: ; Continuation
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L130
  mov cx, sp
  ;; (40'23) Tail: app_40'20 (arg) @ xs (f6)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+6]
  mov ax, [bp]
  jmp [ax]

L132: ; Continuation
  push dx
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L131
  mov cx, sp
  ;; (40'20) Tail: revloop (g10) @ con_40'20 (g62)
  mov bp, 110
  mov dx, 162
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
  ;; (144'37) Tail: app_144'34 (f6) @ app_144'46 (arg)
  mov bp, [bp+6]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L134: ; Continuation
  push dx
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L133
  mov cx, sp
  ;; (144'46) Tail: explode (f2) @ line (f6)
  mov dx, [bp+6]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L135: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L108
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+3]
  push [bp+2]
  push cx
  push #L134
  mov cx, sp
  ;; (144'34) Tail: at_word_start (f4) @ con_144'34 (g61)
  mov bp, [bp+4]
  mov dx, 161
  mov ax, [bp]
  jmp [ax]

L136: ; Continuation
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L135
  mov cx, sp
  ;; (51'44) Tail: app_51'41 (arg) @ ys (f8)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+8]
  mov ax, [bp]
  jmp [ax]

L137: ; Continuation
  push [bp+9]
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L136
  mov cx, sp
  ;; (51'41) Tail: app_51'33 (arg) @ xs (f8)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+8]
  mov ax, [bp]
  jmp [ax]

L138: ; Continuation
  push dx
  push [bp+8]
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L137
  mov cx, sp
  ;; (51'33) Tail: eq_list (g11) @ lam_0'0 (g59)
  mov bp, 111
  mov dx, 159
  mov ax, [bp]
  jmp [ax]

L139: ; Continuation
  push dx
  push [bp+8]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L138
  mov cx, sp
  ;; (78'57) Tail: explode (f2) @ single_controlD (f7)
  mov dx, [bp+7]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L140: ; Continuation
  push dx
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L139
  mov cx, sp
  ;; (78'44) Tail: explode (f2) @ line (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L141: ; Continuation
  push [bp+2]
  push #L107
  mov 1, sp
  push dx
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push cx
  push #L140
  mov cx, sp
  ;; (125'11) Tail: readloop (t1) @ con_125'11 (g58)
  mov bp, 1
  mov dx, 158
  mov ax, [bp]
  jmp [ax]

L142: ; Continuation
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L141
  mov cx, sp
  ;; (191'32) Tail: implode (f2) @ con_0'0 (g36)
  mov bp, [bp+2]
  mov dx, 136
  mov ax, [bp]
  jmp [ax]

L143: ; Continuation
  push [bp+7]
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L142
  mov cx, sp
  ;; (94'29) Tail: put_chars (g26) @ app_94'38 (arg)
  mov bp, 126
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L144: ; Function: t3
  push bp
  push dx
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push cx
  push #L143
  mov cx, sp
  ;; (94'38) Tail: explode (f2) @ lit_190'13 (g33)
  mov bp, [bp+2]
  mov dx, 133
  mov ax, [bp]
  jmp [ax]

L145: ; Continuation
  ;; (197'17) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L146: ; Continuation
  push [bp+2]
  push cx
  push #L145
  mov cx, sp
  ;; (94'29) Tail: put_chars (g26) @ app_94'38 (arg)
  mov bp, 126
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L147: ; Arm: 199'9
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push [bp+2]
  push cx
  push #L146
  mov cx, sp
  ;; (94'38) Tail: explode (f1) @ lit_199'23 (g88)
  mov bp, [bp+1]
  mov dx, 188
  mov ax, [bp]
  jmp [ax]

L148: ; Arm: 168'9
  ;; (0'0) Return: con_168'12 (g90)
  mov dx, 190
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L149: ; Continuation
  ;; (169'48) Tail: loop (f2) @ xs (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L150: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L149
  mov cx, sp
  ;; (94'29) Tail: put_chars (g26) @ app_94'38 (arg)
  mov bp, 126
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L151: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L148
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov ax, 191
  call bios_put_char
  mov 3, ax
  push 2
  push bp
  push cx
  push #L150
  mov cx, sp
  ;; (94'38) Tail: explode (f1) @ x (t1)
  mov bp, [bp+1]
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L152: ; Continuation
  mov ax, 193
  call bios_put_char
  mov 1, ax
  ;; (197'17) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L153: ; Arm: 172'9
  ;; (0'0) Return: con_172'12 (g92)
  mov dx, 192
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L154: ; Continuation
  ;; (173'34) Tail: loop (f2) @ xs (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L155: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L154
  mov cx, sp
  ;; (94'29) Tail: put_chars (g26) @ app_94'38 (arg)
  mov bp, 126
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L156: ; Continuation
  push [bp+2]
  push #L151
  mov 1, sp
  push [bp+3]
  push cx
  push #L152
  mov cx, sp
  mov bx, dx
  cmp [bx], #0
  bz L153
  mov ax, [bx+1]
  mov 2, ax
  mov ax, [bx+2]
  mov 3, ax
  push 3
  push 1
  push cx
  push #L155
  mov cx, sp
  ;; (94'38) Tail: explode (f2) @ x (t2)
  mov bp, [bp+2]
  mov dx, 2
  mov ax, [bp]
  jmp [ax]

L157: ; Continuation
  push [bp+3]
  push [bp+2]
  push cx
  push #L156
  mov cx, sp
  ;; (203'43) Tail: app_203'33 (f4) @ case_152'18 (arg)
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L158: ; Continuation
  push dx
  push [bp+3]
  push [bp+2]
  push cx
  push #L157
  mov cx, sp
  mov bx, [bp+3]
  mov ax, [bx+1]
  mov 1, ax
  ;; (152'43) Return: ps (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L159: ; Function: t1
  mov bx, dx
  cmp [bx], #1
  bz L147
  push [bp+2]
  push [bp+1]
  push cx
  push #L158
  mov cx, sp
  ;; (203'33) Tail: map (g5) @ lam_202'19 (g89)
  mov bp, 105
  mov dx, 189
  mov ax, [bp]
  jmp [ax]

L160: ; Function: t1
  push dx
  push [bp+1]
  push #L159
  mov 1, sp
  ;; (0'0) Return: lam_197'20 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L161: ; Continuation
  ;; (205'18) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L162: ; Continuation
  push [bp+2]
  push cx
  push #L161
  mov cx, sp
  ;; (94'29) Tail: put_chars (g26) @ app_94'38 (arg)
  mov bp, 126
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L163: ; Arm: 215'7
  push [bp+3]
  push cx
  push #L162
  mov cx, sp
  ;; (94'38) Tail: explode (f1) @ lit_215'22 (g96)
  mov bp, [bp+1]
  mov dx, 196
  mov ax, [bp]
  jmp [ax]

L164: ; Arm: 157'9
  ;; (0'0) Return: con_157'12 (g97)
  mov dx, 197
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L165: ; Arm: 161'35
  push [bp+4]
  push #1
  mov 1, sp
  ;; (0'0) Return: con_161'40 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L166: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L165
  ;; (161'61) Tail: loop (f2) @ ps (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L167: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L166
  mov cx, sp
  ;; (51'44) Tail: app_51'41 (arg) @ ys (f5)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+5]
  mov ax, [bp]
  jmp [ax]

L168: ; Continuation
  push [bp+6]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L167
  mov cx, sp
  ;; (51'41) Tail: app_51'33 (arg) @ xs (f5)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+5]
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
  ;; (51'33) Tail: eq_list (g11) @ lam_0'0 (g98)
  mov bp, 111
  mov dx, 198
  mov ax, [bp]
  jmp [ax]

L170: ; Continuation
  push dx
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push cx
  push #L169
  mov cx, sp
  ;; (78'57) Tail: explode (f2) @ x (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L171: ; Function: t3
  mov bx, dx
  cmp [bx], #0
  bz L164
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov bx, 1
  mov ax, [bx+1]
  mov 3, ax
  mov ax, [bx+2]
  mov 4, ax
  push 4
  push 2
  push bp
  push [bp+2]
  push [bp+1]
  push cx
  push #L170
  mov cx, sp
  ;; (78'44) Tail: explode (f1) @ name (t3)
  mov bp, [bp+1]
  mov dx, 3
  mov ax, [bp]
  jmp [ax]

L172: ; Arm: 157'9
  ;; (0'0) Return: con_157'12 (g107)
  mov dx, 207
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L173: ; Arm: 161'35
  push [bp+4]
  push #1
  mov 1, sp
  ;; (0'0) Return: con_161'40 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L174: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L173
  ;; (161'61) Tail: loop (f2) @ ps (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L175: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L174
  mov cx, sp
  ;; (51'44) Tail: app_51'41 (arg) @ ys (f5)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+5]
  mov ax, [bp]
  jmp [ax]

L176: ; Continuation
  push [bp+6]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L175
  mov cx, sp
  ;; (51'41) Tail: app_51'33 (arg) @ xs (f5)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+5]
  mov ax, [bp]
  jmp [ax]

L177: ; Continuation
  push dx
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L176
  mov cx, sp
  ;; (51'33) Tail: eq_list (g11) @ lam_0'0 (g108)
  mov bp, 111
  mov dx, 208
  mov ax, [bp]
  jmp [ax]

L178: ; Continuation
  push dx
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push cx
  push #L177
  mov cx, sp
  ;; (78'57) Tail: explode (f2) @ x (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L179: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L172
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov bx, 1
  mov ax, [bx+1]
  mov 3, ax
  mov ax, [bx+2]
  mov 4, ax
  push 4
  push 2
  push bp
  push [bp+2]
  push [bp+1]
  push cx
  push #L178
  mov cx, sp
  ;; (78'44) Tail: explode (f1) @ name (t3)
  mov bp, [bp+1]
  mov dx, 3
  mov ax, [bp]
  jmp [ax]

L180: ; Continuation
  ;; (94'29) Tail: put_chars (g26) @ app_94'38 (arg)
  mov bp, 126
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L181: ; Continuation
  push cx
  push #L180
  mov cx, sp
  ;; (94'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L182: ; Arm: 208'11
  push 212
  push [bp+4]
  push #1
  mov 1, sp
  push 1
  push 209
  push #1
  mov 2, sp
  push [bp+2]
  push cx
  push #L181
  mov cx, sp
  ;; (208'33) Tail: concat (f3) @ con_208'34 (t2)
  mov bp, [bp+3]
  mov dx, 2
  mov ax, [bp]
  jmp [ax]

L183: ; Continuation
  ;; (94'29) Tail: put_chars (g26) @ app_94'38 (arg)
  mov bp, 126
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L184: ; Arm: 211'16
  mov ax, [bx+1]
  mov 2, ax
  push cx
  push #L183
  mov cx, sp
  ;; (94'38) Tail: explode (f2) @ s (t2)
  mov bp, [bp+2]
  mov dx, 2
  mov ax, [bp]
  jmp [ax]

L185: ; Continuation
  ;; (94'29) Tail: put_chars (g26) @ app_94'38 (arg)
  mov bp, 126
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L186: ; Continuation
  push cx
  push #L185
  mov cx, sp
  ;; (94'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L187: ; Continuation
  mov bx, dx
  cmp [bx], #0
  bz L182
  mov ax, [bx+1]
  mov 1, ax
  mov bx, 1
  cmp [bx], #0
  bz L184
  mov ax, [bx+1]
  mov 2, ax
  mov ax, [bx+2]
  mov 3, ax
  push 216
  push [bp+4]
  push #1
  mov 4, sp
  push 4
  push 213
  push #1
  mov 5, sp
  push [bp+2]
  push cx
  push #L186
  mov cx, sp
  ;; (212'48) Tail: concat (f3) @ con_212'49 (t5)
  mov bp, [bp+3]
  mov dx, 5
  mov ax, [bp]
  jmp [ax]

L188: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L187
  mov cx, sp
  ;; (163'17) Tail: loop (f5) @ case_152'18 (arg)
  mov bp, [bp+5]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L189: ; Function: t1
  push dx
  push [bp+1]
  push #L179
  mov 1, sp
  push 1
  push dx
  push [bp+2]
  push [bp+1]
  push cx
  push #L188
  mov cx, sp
  mov bx, [bp+3]
  mov ax, [bx+1]
  mov 2, ax
  ;; (152'43) Return: ps (t2)
  mov dx, 2
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L190: ; Continuation
  ;; (205'18) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L191: ; Continuation
  push [bp+2]
  push cx
  push #L190
  mov cx, sp
  ;; (216'32) Tail: app_216'27 (arg) @ xs (f3)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+3]
  mov ax, [bp]
  jmp [ax]

L192: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push #L189
  mov 1, sp
  push [bp+5]
  push [bp+4]
  push cx
  push #L191
  mov cx, sp
  ;; (216'27) Tail: iter (g7) @ lam_206'11 (t1)
  mov bp, 107
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L193: ; Continuation
  ;; (94'29) Tail: put_chars (g26) @ app_94'38 (arg)
  mov bp, 126
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L194: ; Continuation
  push cx
  push #L193
  mov cx, sp
  ;; (94'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L195: ; Arm: 208'11
  push 202
  push [bp+5]
  push #1
  mov 1, sp
  push 1
  push 199
  push #1
  mov 2, sp
  push [bp+2]
  push cx
  push #L194
  mov cx, sp
  ;; (208'33) Tail: concat (f3) @ con_208'34 (t2)
  mov bp, [bp+3]
  mov dx, 2
  mov ax, [bp]
  jmp [ax]

L196: ; Continuation
  ;; (94'29) Tail: put_chars (g26) @ app_94'38 (arg)
  mov bp, 126
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L197: ; Arm: 211'16
  mov ax, [bx+1]
  mov 2, ax
  push cx
  push #L196
  mov cx, sp
  ;; (94'38) Tail: explode (f2) @ s (t2)
  mov bp, [bp+2]
  mov dx, 2
  mov ax, [bp]
  jmp [ax]

L198: ; Continuation
  ;; (94'29) Tail: put_chars (g26) @ app_94'38 (arg)
  mov bp, 126
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L199: ; Continuation
  push cx
  push #L198
  mov cx, sp
  ;; (94'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L200: ; Continuation
  push [bp+6]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L192
  mov cx, sp
  mov bx, dx
  cmp [bx], #0
  bz L195
  mov ax, [bx+1]
  mov 1, ax
  mov bx, 1
  cmp [bx], #0
  bz L197
  mov ax, [bx+1]
  mov 2, ax
  mov ax, [bx+2]
  mov 3, ax
  push 206
  push [bp+5]
  push #1
  mov 4, sp
  push 4
  push 203
  push #1
  mov 5, sp
  push [bp+2]
  push cx
  push #L199
  mov cx, sp
  ;; (212'48) Tail: concat (f3) @ con_212'49 (t5)
  mov bp, [bp+3]
  mov dx, 5
  mov ax, [bp]
  jmp [ax]

L201: ; Continuation
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L200
  mov cx, sp
  ;; (163'17) Tail: loop (f7) @ case_152'18 (arg)
  mov bp, [bp+7]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L202: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L163
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push 1
  push [bp+1]
  push #L171
  mov 3, sp
  push 3
  push 2
  push 1
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push cx
  push #L201
  mov cx, sp
  mov bx, [bp+3]
  mov ax, [bx+1]
  mov 4, ax
  ;; (152'43) Return: ps (t4)
  mov dx, 4
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L203: ; Function: t4
  push dx
  push [bp+2]
  push [bp+1]
  push #L202
  mov 1, sp
  ;; (0'0) Return: lam_205'21 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L204: ; Continuation
  ;; (218'18) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L205: ; Continuation
  push [bp+2]
  push cx
  push #L204
  mov cx, sp
  ;; (94'29) Tail: put_chars (g26) @ app_94'38 (arg)
  mov bp, 126
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L206: ; Arm: 229'7
  push [bp+3]
  push cx
  push #L205
  mov cx, sp
  ;; (94'38) Tail: explode (f1) @ lit_229'22 (g119)
  mov bp, [bp+1]
  mov dx, 219
  mov ax, [bp]
  jmp [ax]

L207: ; Arm: 157'9
  ;; (0'0) Return: con_157'12 (g120)
  mov dx, 220
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L208: ; Arm: 161'35
  push [bp+4]
  push #1
  mov 1, sp
  ;; (0'0) Return: con_161'40 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L209: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L208
  ;; (161'61) Tail: loop (f2) @ ps (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L210: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L209
  mov cx, sp
  ;; (51'44) Tail: app_51'41 (arg) @ ys (f5)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+5]
  mov ax, [bp]
  jmp [ax]

L211: ; Continuation
  push [bp+6]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L210
  mov cx, sp
  ;; (51'41) Tail: app_51'33 (arg) @ xs (f5)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+5]
  mov ax, [bp]
  jmp [ax]

L212: ; Continuation
  push dx
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L211
  mov cx, sp
  ;; (51'33) Tail: eq_list (g11) @ lam_0'0 (g121)
  mov bp, 111
  mov dx, 221
  mov ax, [bp]
  jmp [ax]

L213: ; Continuation
  push dx
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push cx
  push #L212
  mov cx, sp
  ;; (78'57) Tail: explode (f2) @ x (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L214: ; Function: t3
  mov bx, dx
  cmp [bx], #0
  bz L207
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov bx, 1
  mov ax, [bx+1]
  mov 3, ax
  mov ax, [bx+2]
  mov 4, ax
  push 4
  push 2
  push bp
  push [bp+2]
  push [bp+1]
  push cx
  push #L213
  mov cx, sp
  ;; (78'44) Tail: explode (f1) @ name (t3)
  mov bp, [bp+1]
  mov dx, 3
  mov ax, [bp]
  jmp [ax]

L215: ; Arm: 157'9
  ;; (0'0) Return: con_157'12 (g130)
  mov dx, 230
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L216: ; Arm: 161'35
  push [bp+4]
  push #1
  mov 1, sp
  ;; (0'0) Return: con_161'40 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L217: ; Continuation
  mov bx, dx
  cmp [bx], #1
  bz L216
  ;; (161'61) Tail: loop (f2) @ ps (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L218: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L217
  mov cx, sp
  ;; (51'44) Tail: app_51'41 (arg) @ ys (f5)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+5]
  mov ax, [bp]
  jmp [ax]

L219: ; Continuation
  push [bp+6]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L218
  mov cx, sp
  ;; (51'41) Tail: app_51'33 (arg) @ xs (f5)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+5]
  mov ax, [bp]
  jmp [ax]

L220: ; Continuation
  push dx
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L219
  mov cx, sp
  ;; (51'33) Tail: eq_list (g11) @ lam_0'0 (g131)
  mov bp, 111
  mov dx, 231
  mov ax, [bp]
  jmp [ax]

L221: ; Continuation
  push dx
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push cx
  push #L220
  mov cx, sp
  ;; (78'57) Tail: explode (f2) @ name (f3)
  mov dx, [bp+3]
  mov bp, [bp+2]
  mov ax, [bp]
  jmp [ax]

L222: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L215
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  mov bx, 1
  mov ax, [bx+1]
  mov 3, ax
  mov ax, [bx+2]
  mov 4, ax
  push 4
  push 2
  push bp
  push [bp+2]
  push [bp+1]
  push cx
  push #L221
  mov cx, sp
  ;; (78'44) Tail: explode (f1) @ name (t3)
  mov bp, [bp+1]
  mov dx, 3
  mov ax, [bp]
  jmp [ax]

L223: ; Continuation
  ;; (94'29) Tail: put_chars (g26) @ app_94'38 (arg)
  mov bp, 126
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L224: ; Continuation
  push cx
  push #L223
  mov cx, sp
  ;; (94'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L225: ; Arm: 222'11
  push 235
  push [bp+4]
  push #1
  mov 1, sp
  push 1
  push 232
  push #1
  mov 2, sp
  push [bp+2]
  push cx
  push #L224
  mov cx, sp
  ;; (220'35) Tail: concat (f3) @ con_220'36 (t2)
  mov bp, [bp+3]
  mov dx, 2
  mov ax, [bp]
  jmp [ax]

L226: ; Continuation
  ;; (94'29) Tail: put_chars (g26) @ app_94'38 (arg)
  mov bp, 126
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L227: ; Continuation
  push cx
  push #L226
  mov cx, sp
  ;; (94'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L228: ; Arm: 225'16
  mov ax, [bx+1]
  mov 2, ax
  push 239
  push [bp+4]
  push #1
  mov 3, sp
  push 3
  push 236
  push #1
  mov 4, sp
  push [bp+2]
  push cx
  push #L227
  mov cx, sp
  ;; (220'35) Tail: concat (f3) @ con_220'36 (t4)
  mov bp, [bp+3]
  mov dx, 4
  mov ax, [bp]
  jmp [ax]

L229: ; Continuation
  ;; (94'29) Tail: put_chars (g26) @ app_94'38 (arg)
  mov bp, 126
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L230: ; Continuation
  mov bx, dx
  cmp [bx], #0
  bz L225
  mov ax, [bx+1]
  mov 1, ax
  mov bx, 1
  cmp [bx], #0
  bz L228
  mov ax, [bx+1]
  mov 2, ax
  mov ax, [bx+2]
  mov 3, ax
  push cx
  push #L229
  mov cx, sp
  ;; (94'38) Tail: explode (f2) @ meta (t2)
  mov bp, [bp+2]
  mov dx, 2
  mov ax, [bp]
  jmp [ax]

L231: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L230
  mov cx, sp
  ;; (163'17) Tail: loop (f5) @ case_152'18 (arg)
  mov bp, [bp+5]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L232: ; Function: t1
  push dx
  push [bp+1]
  push #L222
  mov 1, sp
  push 1
  push dx
  push [bp+2]
  push [bp+1]
  push cx
  push #L231
  mov cx, sp
  mov bx, [bp+3]
  mov ax, [bx+1]
  mov 2, ax
  ;; (152'43) Return: ps (t2)
  mov dx, 2
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L233: ; Continuation
  ;; (218'18) Return: fs (f2)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L234: ; Continuation
  push [bp+2]
  push cx
  push #L233
  mov cx, sp
  ;; (230'32) Tail: app_230'27 (arg) @ xs (f3)
  ;; use temp ax while setting up bp/dx
  mov ax, bp
  mov bp, dx
  mov dx, [ax+3]
  mov ax, [bp]
  jmp [ax]

L235: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push #L232
  mov 1, sp
  push [bp+5]
  push [bp+4]
  push cx
  push #L234
  mov cx, sp
  ;; (230'27) Tail: iter (g7) @ lam_219'11 (t1)
  mov bp, 107
  mov dx, 1
  mov ax, [bp]
  jmp [ax]

L236: ; Continuation
  ;; (94'29) Tail: put_chars (g26) @ app_94'38 (arg)
  mov bp, 126
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L237: ; Continuation
  push cx
  push #L236
  mov cx, sp
  ;; (94'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L238: ; Arm: 222'11
  push 225
  push [bp+5]
  push #1
  mov 1, sp
  push 1
  push 222
  push #1
  mov 2, sp
  push [bp+2]
  push cx
  push #L237
  mov cx, sp
  ;; (220'35) Tail: concat (f3) @ con_220'36 (t2)
  mov bp, [bp+3]
  mov dx, 2
  mov ax, [bp]
  jmp [ax]

L239: ; Continuation
  ;; (94'29) Tail: put_chars (g26) @ app_94'38 (arg)
  mov bp, 126
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L240: ; Continuation
  push cx
  push #L239
  mov cx, sp
  ;; (94'38) Tail: explode (f2) @ s (arg)
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L241: ; Arm: 225'16
  mov ax, [bx+1]
  mov 2, ax
  push 229
  push [bp+5]
  push #1
  mov 3, sp
  push 3
  push 226
  push #1
  mov 4, sp
  push [bp+2]
  push cx
  push #L240
  mov cx, sp
  ;; (220'35) Tail: concat (f3) @ con_220'36 (t4)
  mov bp, [bp+3]
  mov dx, 4
  mov ax, [bp]
  jmp [ax]

L242: ; Continuation
  ;; (94'29) Tail: put_chars (g26) @ app_94'38 (arg)
  mov bp, 126
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L243: ; Continuation
  push [bp+6]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L235
  mov cx, sp
  mov bx, dx
  cmp [bx], #0
  bz L238
  mov ax, [bx+1]
  mov 1, ax
  mov bx, 1
  cmp [bx], #0
  bz L241
  mov ax, [bx+1]
  mov 2, ax
  mov ax, [bx+2]
  mov 3, ax
  push cx
  push #L242
  mov cx, sp
  ;; (94'38) Tail: explode (f2) @ meta (t2)
  mov bp, [bp+2]
  mov dx, 2
  mov ax, [bp]
  jmp [ax]

L244: ; Continuation
  push [bp+6]
  push [bp+5]
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L243
  mov cx, sp
  ;; (163'17) Tail: loop (f7) @ case_152'18 (arg)
  mov bp, [bp+7]
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L245: ; Function: t1
  mov bx, dx
  cmp [bx], #0
  bz L206
  mov ax, [bx+1]
  mov 1, ax
  mov ax, [bx+2]
  mov 2, ax
  push 1
  push [bp+1]
  push #L214
  mov 3, sp
  push 3
  push 2
  push 1
  push [bp+3]
  push [bp+2]
  push [bp+1]
  push cx
  push #L244
  mov cx, sp
  mov bx, [bp+3]
  mov ax, [bx+1]
  mov 4, ax
  ;; (152'43) Return: ps (t4)
  mov dx, 4
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L246: ; Function: t7
  push dx
  push [bp+2]
  push [bp+1]
  push #L245
  mov 1, sp
  ;; (0'0) Return: lam_218'21 (t1)
  mov dx, 1
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

L247: ; Continuation
  push [bp+2]
  push #L160
  mov 1, sp
  push 1
  push 187
  push #1
  mov 2, sp
  push 2
  push 186
  push #0
  mov 3, sp
  push [bp+3]
  push [bp+2]
  push #L203
  mov 4, sp
  push 4
  push 195
  push #1
  mov 5, sp
  push 5
  push 194
  push #0
  mov 6, sp
  push [bp+3]
  push [bp+2]
  push #L246
  mov 7, sp
  push 7
  push 218
  push #1
  mov 8, sp
  push 8
  push 217
  push #0
  mov 9, sp
  push 240
  push 9
  push #1
  mov 10, sp
  push 10
  push 6
  push #1
  mov 11, sp
  push 11
  push 3
  push #1
  mov 12, sp
  push 12
  push 185
  push #1
  mov 13, sp
  push 13
  push #0
  mov 14, sp
  ;; (247'11) Tail: mainloop (f4) @ con_237'13 (t14)
  mov bp, [bp+4]
  mov dx, 14
  mov ax, [bp]
  jmp [ax]

L248: ; Continuation
  push [bp+4]
  push [bp+3]
  push [bp+2]
  push cx
  push #L247
  mov cx, sp
  ;; (94'29) Tail: put_chars (g26) @ app_94'38 (arg)
  mov bp, 126
  mov dx, dx
  mov ax, [bp]
  jmp [ax]

L249: ; Continuation
  push dx
  push [bp+2]
  push #L72
  mov 1, sp
  push [bp+2]
  push #L93
  mov 2, sp
  push 2
  push 1
  push dx
  push [bp+2]
  push #L144
  mov 3, sp
  push 3
  push 1
  push dx
  push cx
  push #L248
  mov cx, sp
  ;; (94'38) Tail: explode (arg) @ lit_246'13 (g81)
  mov bp, dx
  mov dx, 181
  mov ax, [bp]
  jmp [ax]

L250: ; Continuation
  push dx
  push cx
  push #L249
  mov cx, sp
  ;; (74'23) Tail: block (g1) @ lam_67'12 (g24)
  mov bp, 101
  mov dx, 124
  mov ax, [bp]
  jmp [ax]

L251: ; Start
  push #L2
  mov 101, sp
  mov ax, #0
  mov 103, ax
  mov ax, #1
  mov 104, ax
  push #L5
  mov 102, sp
  push #0
  mov 106, sp
  push #L11
  mov 105, sp
  push #0
  mov 108, sp
  push #L16
  mov 107, sp
  push #L21
  mov 109, sp
  push #L25
  mov 110, sp
  push #1
  mov 112, sp
  push #0
  mov 113, sp
  push #0
  mov 114, sp
  push #0
  mov 115, sp
  push #L36
  mov 111, sp
  push #0
  mov 116, sp
  mov ax, #1
  mov 117, ax
  mov ax, #0
  mov 118, ax
  push #L44
  mov 119, sp
  mov ax, #0
  mov 120, ax
  mov ax, #1
  mov 121, ax
  push #0
  mov 122, sp
  mov ax, #1
  mov 123, ax
  push #L50
  mov 124, sp
  push #0
  mov ax, sp
  mov 125, ax
  push #0
  mov 127, sp
  push #L52
  mov 126, sp
  push #0
  mov 128, sp
  mov ax, #' '
  mov 129, ax
  push #0
  mov 130, sp
  mov ax, #' '
  mov 131, ax
  push #0
  mov 132, sp
  push #0
  push sp
  push #' '
  push #1
  push sp
  push #'%'
  push #1
  mov ax, sp
  mov 133, ax
  mov ax, #'\EOT'
  mov 134, ax
  push #0
  mov 135, sp
  push 135
  push 134
  push #1
  mov 136, sp
  push #0
  mov 137, sp
  mov ax, #'\n'
  mov 138, ax
  mov ax, #'\n'
  mov 139, ax
  push #0
  mov 140, sp
  mov ax, #'\EOT'
  mov 141, ax
  mov ax, #'\EOT'
  mov 142, ax
  mov ax, #'\n'
  mov 143, ax
  push #0
  mov 144, sp
  mov ax, #'\EOT'
  mov 145, ax
  mov ax, #127
  mov 146, ax
  mov ax, #127
  mov 147, ax
  mov ax, #26
  mov 148, ax
  push #0
  mov 149, sp
  push #1
  mov 150, sp
  mov ax, #'\b'
  mov 151, ax
  mov ax, #' '
  mov 152, ax
  mov ax, #'\b'
  mov 153, ax
  push #0
  mov 154, sp
  mov ax, #'\b'
  mov 155, ax
  mov ax, #' '
  mov 156, ax
  mov ax, #'\b'
  mov 157, ax
  push #0
  mov 158, sp
  push #L54
  mov 159, sp
  push #0
  mov 160, sp
  push #0
  mov 161, sp
  push #0
  mov 162, sp
  push #0
  mov 163, sp
  push #L56
  mov 164, sp
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
  mov 165, ax
  push #0
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  mov ax, sp
  mov 166, ax
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
  mov 167, ax
  push #0
  push sp
  push #'\n'
  push #1
  mov ax, sp
  mov 168, ax
  push #0
  mov 169, sp
  push 169
  push 168
  push #1
  mov 170, sp
  push 170
  push 167
  push #1
  mov 171, sp
  push 171
  push 166
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
  mov 173, ax
  push #0
  push sp
  push #' '
  push #1
  push sp
  push #':'
  push #1
  mov ax, sp
  mov 174, ax
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
  mov 175, ax
  push #0
  push sp
  push #'\n'
  push #1
  mov ax, sp
  mov 176, ax
  push #0
  mov 177, sp
  push 177
  push 176
  push #1
  mov 178, sp
  push 178
  push 175
  push #1
  mov 179, sp
  push 179
  push 174
  push #1
  mov 180, sp
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
  mov 181, ax
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
  mov 182, ax
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
  mov 183, ax
  push 183
  push #0
  mov 184, sp
  push 184
  push 182
  push #0
  mov 185, sp
  push #0
  push sp
  push #'s'
  push #1
  push sp
  push #'l'
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
  mov 187, ax
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
  mov 188, ax
  push #L57
  mov 189, sp
  push #0
  mov 190, sp
  mov ax, #' '
  mov 191, ax
  push #0
  mov 192, sp
  mov ax, #'\n'
  mov 193, ax
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
  mov 194, ax
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
  mov 195, ax
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
  mov 196, ax
  push #0
  mov 197, sp
  push #L59
  mov 198, sp
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
  mov 199, ax
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
  mov 200, ax
  push #0
  mov 201, sp
  push 201
  push 200
  push #1
  mov 202, sp
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
  mov 203, ax
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
  mov 204, ax
  push #0
  mov 205, sp
  push 205
  push 204
  push #1
  mov 206, sp
  push #0
  mov 207, sp
  push #L61
  mov 208, sp
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
  mov 209, ax
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
  mov 210, ax
  push #0
  mov 211, sp
  push 211
  push 210
  push #1
  mov 212, sp
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
  mov 213, ax
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
  mov 214, ax
  push #0
  mov 215, sp
  push 215
  push 214
  push #1
  mov 216, sp
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
  mov 217, ax
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
  mov 218, ax
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
  mov 219, ax
  push #0
  mov 220, sp
  push #L63
  mov 221, sp
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
  mov 222, ax
  push #0
  push sp
  push #'\n'
  push #1
  mov ax, sp
  mov 223, ax
  push #0
  mov 224, sp
  push 224
  push 223
  push #1
  mov 225, sp
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
  mov 226, ax
  push #0
  push sp
  push #'\n'
  push #1
  mov ax, sp
  mov 227, ax
  push #0
  mov 228, sp
  push 228
  push 227
  push #1
  mov 229, sp
  push #0
  mov 230, sp
  push #L65
  mov 231, sp
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
  mov 232, ax
  push #0
  push sp
  push #'\n'
  push #1
  mov ax, sp
  mov 233, ax
  push #0
  mov 234, sp
  push 234
  push 233
  push #1
  mov 235, sp
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
  mov 236, ax
  push #0
  push sp
  push #'\n'
  push #1
  mov ax, sp
  mov 237, ax
  push #0
  mov 238, sp
  push 238
  push 237
  push #1
  mov 239, sp
  push #0
  mov 240, sp
  push cx
  push #L250
  mov cx, sp
  ;; (65'23) Tail: block (g1) @ lam_55'12 (g19)
  mov bp, 101
  mov dx, 119
  mov ax, [bp]
  jmp [ax]


