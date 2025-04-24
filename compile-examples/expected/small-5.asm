L1: ; Arm: 11'7
  ;; (0'0) Return: con_11'10 (g2)
  mov dx, g2
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L2: ; Function: g1
  mov bx, dx
  cmp word [bx], 0
  jz L1
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov ax, [2]
  call Bare_put_char
  mov [6], ax
  ;; (12'39) Tail: put_chars (g1) @ xsMore (t2)
  mov bp, g1
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L3: ; Arm: 4'13
  ;; (3'23) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L4: ; Continuation
  mov ax, [bp+4]
  sub ax, 1
  mov [2], ax
  ;; (5'45) Tail: app_5'19 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L5: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L3
  mov ax, g4
  mov bx, dx
  call Bare_get_bytes
  mov [4], ax
  push word [bp+2]
  push word [4]
  push word 1
  mov [6], sp
  push word dx
  push word cx
  push word L4
  mov cx, sp
  ;; (5'19) Tail: explode_loop (g3) @ con_0'0 (t3)
  mov bp, g3
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L6: ; Function: g3
  push word dx
  push word L5
  mov [2], sp
  ;; (0'0) Return: lam_3'27 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L7: ; Arm: 4'13
  ;; (3'23) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L8: ; Continuation
  mov ax, [bp+4]
  sub ax, 1
  mov [2], ax
  ;; (5'45) Tail: app_5'19 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L9: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L7
  mov ax, g8
  mov bx, dx
  call Bare_get_bytes
  mov [4], ax
  push word [bp+2]
  push word [4]
  push word 1
  mov [6], sp
  push word dx
  push word cx
  push word L8
  mov cx, sp
  ;; (5'19) Tail: explode_loop (g7) @ con_0'0 (t3)
  mov bp, g7
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L10: ; Function: g7
  push word dx
  push word L9
  mov [2], sp
  ;; (0'0) Return: lam_3'27 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L11: ; Arm: 19'9
  ;; (17'18) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L12: ; Continuation
  ;; (20'38) Tail: app_20'27 (arg) @ ysMore (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L13: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L11
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
  push word L12
  mov cx, sp
  ;; (20'27) Tail: revloop (g12) @ con_0'0 (t3)
  mov bp, g12
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L14: ; Function: g12
  push word dx
  push word L13
  mov [2], sp
  ;; (0'0) Return: lam_17'22 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L15: ; Continuation
  ;; (22'13) Tail: app_22'10 (arg) @ sofar (f2)
  ;; use temp di while setting up bp/dx
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L16: ; Arm: 30'27
  mov ax, `\n`
  call Bare_put_char
  mov [6], ax
  push word dx
  push word cx
  push word L15
  mov cx, sp
  ;; (22'10) Tail: revloop (g12) @ con_22'10 (g13)
  mov bp, g12
  mov dx, g13
  mov ax, [bp]
  jmp ax

L17: ; Function: g10
  call Bare_get_char
  mov [2], ax
  mov ax, [2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [4], ax
  mov bx, [4]
  cmp word [bx], 1
  jz L16
  mov ax, [2]
  call Bare_put_char
  mov [6], ax
  push word dx
  push word [2]
  push word 1
  mov [8], sp
  ;; (31'33) Tail: readloop (g10) @ con_0'0 (t4)
  mov bp, g10
  mov dx, [8]
  mov ax, [bp]
  jmp ax

L18: ; Continuation
  mov ax, `\n`
  call Bare_put_char
  mov [2], ax
  ;; (41'10) Tail: mainloop (g6) @ con_41'10 (g15)
  mov bp, g6
  mov dx, g15
  mov ax, [bp]
  jmp ax

L19: ; Continuation
  push word cx
  push word L18
  mov cx, sp
  ;; (39'12) Tail: put_chars (g1) @ app_33'11 (arg)
  mov bp, g1
  mov dx, dx
  mov ax, [bp]
  jmp ax

L20: ; Continuation
  push word cx
  push word L19
  mov cx, sp
  ;; (33'11) Tail: readloop (g10) @ con_33'11 (g14)
  mov bp, g10
  mov dx, g14
  mov ax, [bp]
  jmp ax

L21: ; Continuation
  push word cx
  push word L20
  mov cx, sp
  ;; (14'29) Tail: put_chars (g1) @ app_7'18 (arg)
  mov bp, g1
  mov dx, dx
  mov ax, [bp]
  jmp ax

L22: ; Continuation
  push word cx
  push word L21
  mov cx, sp
  ;; (7'18) Tail: app_7'15 (arg) @ 1
  mov bp, dx
  mov dx, 1
  mov ax, [bp]
  jmp ax

L23: ; Function: g6
  push word cx
  push word L22
  mov cx, sp
  ;; (7'15) Tail: explode_loop (g7) @ con_7'15 (g9)
  mov bp, g7
  mov dx, g9
  mov ax, [bp]
  jmp ax

L24: ; Arm: 4'13
  ;; (3'23) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L25: ; Continuation
  mov ax, [bp+4]
  sub ax, 1
  mov [2], ax
  ;; (5'45) Tail: app_5'19 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L26: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L24
  mov ax, g17
  mov bx, dx
  call Bare_get_bytes
  mov [4], ax
  push word [bp+2]
  push word [4]
  push word 1
  mov [6], sp
  push word dx
  push word cx
  push word L25
  mov cx, sp
  ;; (5'19) Tail: explode_loop (g16) @ con_0'0 (t3)
  mov bp, g16
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L27: ; Function: g16
  push word dx
  push word L26
  mov [2], sp
  ;; (0'0) Return: lam_3'27 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L28: ; Arm: 4'13
  ;; (3'23) Return: acc (f1)
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L29: ; Continuation
  mov ax, [bp+4]
  sub ax, 1
  mov [2], ax
  ;; (5'45) Tail: app_5'19 (arg) @ prim_0'0 (t1)
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L30: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L28
  mov ax, g21
  mov bx, dx
  call Bare_get_bytes
  mov [4], ax
  push word [bp+2]
  push word [4]
  push word 1
  mov [6], sp
  push word dx
  push word cx
  push word L29
  mov cx, sp
  ;; (5'19) Tail: explode_loop (g20) @ con_0'0 (t3)
  mov bp, g20
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L31: ; Function: g20
  push word dx
  push word L30
  mov [2], sp
  ;; (0'0) Return: lam_3'27 (t1)
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L32: ; Continuation
  ;; (14'29) Tail: put_chars (g1) @ app_7'18 (arg)
  mov bp, g1
  mov dx, dx
  mov ax, [bp]
  jmp ax

L33: ; Continuation
  push word cx
  push word L32
  mov cx, sp
  ;; (7'18) Tail: app_7'15 (arg) @ 5
  mov bp, dx
  mov dx, 5
  mov ax, [bp]
  jmp ax

L34: ; Continuation
  push word cx
  push word L33
  mov cx, sp
  ;; (7'15) Tail: explode_loop (g20) @ con_7'15 (g22)
  mov bp, g20
  mov dx, g22
  mov ax, [bp]
  jmp ax

L35: ; Continuation
  push word cx
  push word L34
  mov cx, sp
  ;; (45'20) Tail: mainloop (g6) @ con_45'20 (g19)
  mov bp, g6
  mov dx, g19
  mov ax, [bp]
  jmp ax

L36: ; Continuation
  push word cx
  push word L35
  mov cx, sp
  ;; (14'29) Tail: put_chars (g1) @ app_7'18 (arg)
  mov bp, g1
  mov dx, dx
  mov ax, [bp]
  jmp ax

L37: ; Continuation
  push word cx
  push word L36
  mov cx, sp
  ;; (7'18) Tail: app_7'15 (arg) @ 3
  mov bp, dx
  mov dx, 3
  mov ax, [bp]
  jmp ax

L38: ; Continuation
  push word cx
  push word L37
  mov cx, sp
  ;; (7'15) Tail: explode_loop (g16) @ con_7'15 (g18)
  mov bp, g16
  mov dx, g18
  mov ax, [bp]
  jmp ax

L39: ; Continuation
  push word cx
  push word L38
  mov cx, sp
  ;; (14'29) Tail: put_chars (g1) @ app_7'18 (arg)
  mov bp, g1
  mov dx, dx
  mov ax, [bp]
  jmp ax

L40: ; Continuation
  push word cx
  push word L39
  mov cx, sp
  ;; (7'18) Tail: app_7'15 (arg) @ 4
  mov bp, dx
  mov dx, 4
  mov ax, [bp]
  jmp ax

L41: ; Start
  push word cx
  push word L40
  mov cx, sp
  ;; (7'15) Tail: explode_loop (g3) @ con_7'15 (g5)
  mov bp, g3
  mov dx, g5
  mov ax, [bp]
  jmp ax

g1: dw L2
g2: dw 0
g3: dw L6
g4: dw 5, 'L', 'O', 'A', 'D', `\n`
g5: dw 0
g6: dw L23
g7: dw L10
g8: dw 2, '>', ' '
g9: dw 0
g10: dw L17
g11: dw 0
g12: dw L14
g13: dw 0
g14: dw 0
g15: dw 0
g16: dw L27
g17: dw 4, 'R', 'U', 'N', `\n`
g18: dw 0
g19: dw 0
g20: dw L31
g21: dw 6, 'N', 'E', 'V', 'E', 'R', `\n`
g22: dw 0

bare_start: jmp L41
