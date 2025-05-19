L1: ; Arm: 26'7
  mov si, 1
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L2: ; Continuation
  Bare_enter_check(0)
  mov ax, 3
  mov bx, si
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L3: ; Function: (length,g1)
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 1
  jz L1
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L2
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g1
  mov si, [Temps+4]
  jmp [bp]

L4: ; Arm: 31'7
  mov si, g3
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L5: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [bp+4]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L6: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L5
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L7: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+6]
  push word [CurrentCont]
  push word L6
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+4]
  mov bp, g2
  jmp [bp]

L8: ; Function: (lam,t1)
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 1
  jz L4
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L7
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+2]
  mov si, [Temps+2]
  jmp [bp]

L9: ; Function: (map,g2)
  Bare_enter_check(6)
  push word si
  push word L8
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L10: ; Arm: 36'7
  mov si, g5
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L11: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [bp+4]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L12: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L11
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L13: ; Arm: 37'20
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L12
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+4]
  mov bp, g4
  jmp [bp]

L14: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L15: ; Continuation
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 3
  jz L13
  push word [bp+8]
  push word [CurrentCont]
  push word L14
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g4
  jmp [bp]

L16: ; Function: (lam,t1)
  Bare_enter_check(12)
  mov bx, si
  cmp word [bx], 1
  jz L10
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+2]
  push word [CurrentCont]
  push word L15
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+2]
  mov si, [Temps+2]
  jmp [bp]

L17: ; Function: (filter,g4)
  Bare_enter_check(6)
  push word si
  push word L16
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L18: ; Arm: 41'7
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L19: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L20: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L19
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L21: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L20
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L22: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word si
  push word [CurrentCont]
  push word L21
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L23: ; Function: (lam,t1)
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L18
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L22
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov si, [bp+2]
  mov bp, g6
  jmp [bp]

L24: ; Function: (lam,t1)
  Bare_enter_check(8)
  push word si
  push word [bp+2]
  push word L23
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L25: ; Function: (foldl,g6)
  Bare_enter_check(6)
  push word si
  push word L24
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L26: ; Arm: 46'7
  mov si, g8
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L27: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L28: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L27
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g7
  jmp [bp]

L29: ; Function: (lam,t1)
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 1
  jz L26
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L28
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+2]
  mov si, [Temps+2]
  jmp [bp]

L30: ; Function: (iter,g7)
  Bare_enter_check(6)
  push word si
  push word L29
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L31: ; Arm: 50'11
  mov si, g10
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L32: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [bp+4]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L33: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L32
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L34: ; Function: (lam,t1)
  Bare_enter_check(10)
  mov ax, si
  cmp word ax, [bp+2]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L31
  mov ax, [bp+2]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+4], ax
  push word si
  push word [bp+2]
  push word [CurrentCont]
  push word L33
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g9
  mov si, [Temps+4]
  jmp [bp]

L35: ; Function: (upto,g9)
  Bare_enter_check(6)
  push word si
  push word L34
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L36: ; Arm: 53'12
  mov si, g14
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L37: ; Arm: 55'9
  mov si, g15
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L38: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [bp+4]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L39: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L38
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L40: ; Continuation
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 3
  jz L36
  mov bx, [bp+6]
  cmp word [bx], 1
  jz L37
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [bp+4]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+6], ax
  push word [Temps+4]
  push word [Temps+2]
  push word [CurrentCont]
  push word L39
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g11
  mov si, [Temps+6]
  jmp [bp]

L41: ; Arm: 15'9
  mov si, g12
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L42: ; Function: (lam,t1)
  Bare_enter_check(10)
  mov ax, 1
  cmp word ax, [bp+2]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word si
  push word [bp+2]
  push word [CurrentCont]
  push word L40
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L41
  mov si, g13
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L43: ; Function: (take,g11)
  Bare_enter_check(6)
  push word si
  push word L42
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L44: ; Arm: 66'7
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L45: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L46: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov bx, si
  cmp word [bx], 1
  jz L44
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [bp+2]
  push word [Temps+2]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+4]
  push word [CurrentCont]
  push word L45
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g20
  mov si, [Temps+6]
  jmp [bp]

L47: ; Function: (rev_onto,g20)
  Bare_enter_check(6)
  push word si
  push word L46
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L48: ; Arm: 84'13
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L49: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L50: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L48
  mov ax, [bp+2]
  mov bx, si
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+4], ax
  push word [bp+4]
  push word [Temps+4]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word si
  push word [CurrentCont]
  push word L49
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+6]
  jmp [bp]

L51: ; Function: (explode_loop,t1)
  Bare_enter_check(10)
  push word bp
  push word si
  push word [bp+2]
  push word L50
  mov [Temps+2], sp
  push word 8 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L52: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L53: ; Function: (lam,g22)
  Bare_enter_check(14)
  push word si
  push word L51
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov bx, si
  mov ax, [bx]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [CurrentCont]
  push word L52
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [Temps+2]
  mov si, g21
  jmp [bp]

L54: ; Arm: 93'9
  mov si, g23
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L55: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L56: ; Function: (lam,t1)
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 1
  jz L54
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [bp+2]
  mov bx, [bp+4]
  mov dx, [Temps+2]
  sar bx, 1
  call Bare_set_bytes
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, [bp+4]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+8], ax
  push word [Temps+4]
  push word [CurrentCont]
  push word L55
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+8]
  jmp [bp]

L57: ; Function: (loop,t2)
  Bare_enter_check(10)
  push word bp
  push word si
  push word [bp+2]
  push word L56
  mov [Temps+2], sp
  push word 8 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L58: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L59: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L58
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L60: ; Continuation
  Bare_enter_check(600)
  mov ax, si
  call Bare_make_bytes
  mov [Temps+2], ax
  push word [Temps+2]
  push word L57
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word [bp+4]
  push word [CurrentCont]
  push word L59
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [Temps+4]
  mov si, 1
  jmp [bp]

L61: ; Function: (lam,g24)
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L60
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g1
  mov si, si
  jmp [bp]

L62: ; Arm: 110'13
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L63: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L64: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L62
  mov ax, si
  sar ax, 1
  mov bx, 21
  sar bx, 1
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+4], dx
  mov ax, 97
  mov bx, [Temps+4]
  add ax, bx
  sub ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word si
  push word [CurrentCont]
  push word L63
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, [Temps+10]
  jmp [bp]

L65: ; Function: (loop,g26)
  Bare_enter_check(6)
  push word si
  push word L64
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L66: ; Arm: 126'9
  push word [bp+2]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L67: ; Arm: 129'15
  mov si, g37
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L68: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L69: ; Continuation
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 1
  jz L67
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, 21
  sar ax, 1
  mov bx, [bp+4]
  sar bx, 1
  mul bx
  shl ax, 1
  add ax, 1
  mov [Temps+4], ax
  mov ax, [Temps+4]
  mov bx, [Temps+2]
  add ax, bx
  sub ax, 1
  mov [Temps+6], ax
  push word [bp+6]
  push word [CurrentCont]
  push word L68
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g30
  mov si, [Temps+6]
  jmp [bp]

L70: ; Arm: 121'27
  push word [bp+4]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L71: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L70
  mov si, g35
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L72: ; Arm: 15'9
  mov si, g33
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L73: ; Arm: 121'12
  mov ax, 19
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+8]
  push word [CurrentCont]
  push word L71
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L72
  mov si, g34
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L74: ; Continuation
  Bare_enter_check(18)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L69
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L73
  mov si, g36
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L75: ; Arm: 15'9
  mov si, g31
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L76: ; Function: (lam,t1)
  Bare_enter_check(12)
  mov bx, si
  cmp word [bx], 1
  jz L66
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [Temps+2]
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  mov bx, 97
  sub ax, bx
  add ax, 1
  mov [Temps+8], ax
  mov ax, [Temps+8]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+10], ax
  push word [Temps+8]
  push word [Temps+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L74
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L75
  mov si, g32
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L77: ; Function: (loop,g30)
  Bare_enter_check(6)
  push word si
  push word L76
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L78: ; Arm: 146'7
  mov si, g39
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L79: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, g38
  jmp [bp]

L80: ; Arm: 139'19
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov si, [Temps+10]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L81: ; Arm: 140'22
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov si, [Temps+12]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L82: ; Arm: 141'16
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+14], ax
  mov si, [Temps+14]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L83: ; Function: (put_chars,g38)
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 1
  jz L78
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [Temps+2]
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  cmp word ax, 17
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  push word [Temps+4]
  push word [CurrentCont]
  push word L79
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L80
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L81
  mov ax, 53
  cmp word ax, [Temps+6]
  call Bare_make_bool_from_n
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L82
  mov ax, `^`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+14], ax
  mov ax, 131
  mov bx, [Temps+6]
  add ax, bx
  sub ax, 1
  mov [Temps+16], ax
  mov ax, [Temps+16]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+18], ax
  mov ax, [Temps+18]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+20], ax
  mov ax, [Temps+20]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+22], ax
  mov si, [Temps+22]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L84: ; Arm: 167'9
  mov si, g44
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L85: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L86: ; Function: (lam,t1)
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 1
  jz L84
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [bp+2]
  mov bx, [bp+4]
  mov dx, [Temps+2]
  sar bx, 1
  call Bare_set_bytes
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, [bp+4]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+8], ax
  push word [Temps+4]
  push word [CurrentCont]
  push word L85
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+8]
  jmp [bp]

L87: ; Function: (loop,t2)
  Bare_enter_check(10)
  push word bp
  push word si
  push word [bp+2]
  push word L86
  mov [Temps+2], sp
  push word 8 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L88: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L89: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L88
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L90: ; Continuation
  Bare_enter_check(600)
  mov ax, si
  call Bare_make_bytes
  mov [Temps+2], ax
  push word [Temps+2]
  push word L87
  mov [Temps+4], sp
  push word 4 ;; scanned
  mov ax, si
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+6], ax
  push word [Temps+2]
  push word [bp+4]
  push word [CurrentCont]
  push word L89
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [Temps+4]
  mov si, [Temps+6]
  jmp [bp]

L91: ; Function: (lam,g45)
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L90
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g1
  mov si, si
  jmp [bp]

L92: ; Arm: 176'19
  mov si, g48
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L93: ; Arm: 178'15
  mov si, g49
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L94: ; Arm: 181'31
  mov si, g52
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L95: ; Continuation
  Bare_enter_check(0)
  mov bx, si
  cmp word [bx], 3
  jz L94
  mov ax, [bp+4]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  mov bp, [bp+6]
  mov si, [Temps+2]
  jmp [bp]

L96: ; Arm: 15'9
  mov si, g50
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L97: ; Function: (loop,t1)
  Bare_enter_check(10)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L93
  mov ax, [bp+2]
  mov bx, si
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+4], ax
  mov ax, [bp+4]
  mov bx, si
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+6], ax
  mov ax, [Temps+4]
  cmp word ax, [Temps+6]
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  push word bp
  push word si
  push word [CurrentCont]
  push word L95
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L96
  mov si, g51
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L98: ; Continuation
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 3
  jz L92
  push word [bp+6]
  push word [bp+4]
  push word L97
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov ax, [bp+8]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+4], ax
  mov bp, [Temps+2]
  mov si, [Temps+4]
  jmp [bp]

L99: ; Arm: 15'9
  mov si, g46
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L100: ; Function: (lam,t1)
  Bare_enter_check(12)
  mov bx, [bp+2]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, si
  mov ax, [bx]
  mov [Temps+4], ax
  mov ax, [Temps+2]
  cmp word ax, [Temps+4]
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word [Temps+2]
  push word si
  push word [bp+2]
  push word [CurrentCont]
  push word L98
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L99
  mov si, g47
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L101: ; Function: (lam,g53)
  Bare_enter_check(6)
  push word si
  push word L100
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L102: ; Arm: 231'16
  mov si, g61
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L103: ; Continuation
  Bare_enter_check(0)
  mov bx, si
  cmp word [bx], 3
  jz L102
  mov ax, [bp+6]
  mov bx, [bp+10]
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov ax, [bp+4]
  mov bx, [Temps+2]
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+4], ax
  mov ax, [bp+8]
  mov bx, [bp+10]
  mov dx, [Temps+4]
  sar bx, 1
  call Bare_set_bytes
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, [bp+10]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+8], ax
  mov bp, [bp+12]
  mov si, [Temps+8]
  jmp [bp]

L104: ; Arm: 15'9
  mov si, g59
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L105: ; Function: (loop,t2)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, [bp+6]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word si
  push word [bp+8]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L103
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L104
  mov si, g60
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L106: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L107: ; Function: (lam,t1)
  Bare_enter_check(600)
  mov ax, si
  call Bare_make_bytes
  mov [Temps+2], ax
  push word [Temps+2]
  push word si
  push word [bp+4]
  push word [bp+2]
  push word L105
  mov [Temps+4], sp
  push word 10 ;; scanned
  push word [Temps+2]
  push word [CurrentCont]
  push word L106
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [Temps+4]
  mov si, 1
  jmp [bp]

L108: ; Function: (lam,t1)
  Bare_enter_check(8)
  push word si
  push word [bp+2]
  push word L107
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L109: ; Function: (lam,g62)
  Bare_enter_check(6)
  push word si
  push word L108
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L110: ; Arm: 245'17
  mov si, g65
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L111: ; Continuation
  Bare_enter_check(0)
  mov bx, si
  cmp word [bx], 3
  jz L110
  mov ax, [bp+8]
  mov bx, [bp+10]
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+2], ax
  mov ax, [bp+6]
  mov bx, [bp+10]
  add ax, bx
  sub ax, 1
  mov [Temps+4], ax
  mov ax, [bp+4]
  mov bx, [Temps+4]
  mov dx, [Temps+2]
  sar bx, 1
  call Bare_set_bytes
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, [bp+10]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+8], ax
  mov bp, [bp+12]
  mov si, [Temps+8]
  jmp [bp]

L112: ; Arm: 15'9
  mov si, g63
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L113: ; Function: (loop,t2)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L111
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L112
  mov si, g64
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L114: ; Function: (lam,t1)
  Bare_enter_check(12)
  mov bx, si
  mov ax, [bx]
  mov [Temps+2], ax
  push word [Temps+2]
  push word si
  push word [bp+4]
  push word [bp+2]
  push word L113
  mov [Temps+4], sp
  push word 10 ;; scanned
  mov bp, [Temps+4]
  mov si, 1
  jmp [bp]

L115: ; Function: (lam,t1)
  Bare_enter_check(8)
  push word si
  push word [bp+2]
  push word L114
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L116: ; Function: (lam,g66)
  Bare_enter_check(6)
  push word si
  push word L115
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L117: ; Function: (lam,g78)
  Bare_enter_check(6)
  mov ax, si
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  push word [Temps+2]
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  mov si, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L118: ; Arm: 583'7
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L119: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L120: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L119
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g79
  mov si, si
  jmp [bp]

L121: ; Function: (lam,t1)
  Bare_enter_check(26)
  mov bx, si
  cmp word [bx], 1
  jz L118
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [CurrentCont]
  push word L120
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [bp+2]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov ax, [bx+6]
  mov [Temps+10], ax
  push word [Temps+10]
  push word [Temps+2]
  push word 3
  mov [Temps+12], sp
  push word 6 ;; scanned
  push word [Temps+12]
  push word [Temps+8]
  push word [Temps+6]
  push word 1
  mov [Temps+14], sp
  push word 8 ;; scanned
  mov si, [Temps+14]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L122: ; Function: (giveup_blocks,g79)
  Bare_enter_check(6)
  push word si
  push word L121
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L123: ; Continuation
  Bare_enter_check(0)
  mov ax, si
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L124: ; Function: (lam,g80)
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L123
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, si
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L125: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L126: ; Arm: 708'9
  push word [bp+2]
  push word [CurrentCont]
  push word L125
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g20
  mov si, g83
  jmp [bp]

L127: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L128: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov bx, si
  cmp word [bx], 1
  jz L126
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+6]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [Temps+4]
  push word [CurrentCont]
  push word L127
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g82
  mov si, [Temps+10]
  jmp [bp]

L129: ; Function: (loop,g82)
  Bare_enter_check(6)
  push word si
  push word L128
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L130: ; Arm: 200'14
  mov si, g155
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L131: ; Continuation
  Bare_enter_check(0)
  mov bx, si
  cmp word [bx], 3
  jz L130
  mov ax, [bp+4]
  mov bx, [bp+6]
  mov dx, `,`
  sar bx, 1
  call Bare_set_bytes
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, [bp+6]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+4], ax
  mov bp, [bp+8]
  mov si, [Temps+4]
  jmp [bp]

L132: ; Arm: 15'9
  mov si, g153
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L133: ; Function: (loop,t2)
  Bare_enter_check(12)
  mov ax, si
  cmp word ax, 1025
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word si
  push word [bp+2]
  push word [CurrentCont]
  push word L131
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L132
  mov si, g154
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L134: ; Arm: 777'32
  mov si, g158
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L135: ; Continuation
  Bare_enter_check(0)
  mov bx, si
  cmp word [bx], 3
  jz L134
  mov ax, [bp+6]
  sar ax, 1
  mov bx, [bp+4]
  call Bare_store_sector
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, [bp+6]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+4], ax
  mov bp, [bp+8]
  mov si, [Temps+4]
  jmp [bp]

L136: ; Arm: 15'9
  mov si, g156
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L137: ; Function: (loop,t2)
  Bare_enter_check(12)
  mov ax, si
  cmp word ax, 7
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word si
  push word [bp+2]
  push word [CurrentCont]
  push word L135
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L136
  mov si, g157
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L138: ; Continuation
  Bare_enter_check(6)
  mov ax, [bp+4]
  mov [Temps+2], ax
  push word [Temps+2]
  push word L137
  mov [Temps+4], sp
  push word 4 ;; scanned
  mov bp, [Temps+4]
  mov si, 1
  jmp [bp]

L139: ; Function: (lam,g159)
  Bare_enter_check(600)
  mov ax, 1025
  call Bare_make_bytes
  mov [Temps+2], ax
  push word [Temps+2]
  push word L133
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word [CurrentCont]
  push word L138
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [Temps+4]
  mov si, 1
  jmp [bp]

L140: ; Arm: 15'9
  mov si, g186
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L141: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  cmp word ax, si
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L140
  mov si, g187
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L142: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L141
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L143: ; Function: (lam,t1)
  Bare_enter_check(8)
  push word [bp+2]
  push word [CurrentCont]
  push word L142
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, si
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L144: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L145: ; Function: (lam,t1)
  Bare_enter_check(14)
  push word si
  push word L143
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+2]
  push word [CurrentCont]
  push word L144
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g4
  mov si, [Temps+2]
  jmp [bp]

L146: ; Function: (lam,g188)
  Bare_enter_check(6)
  push word si
  push word L145
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L147: ; Function: (lam,g189)
  Bare_enter_check(6)
  push word si
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L148: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L149: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L148
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L150: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L149
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+8]
  jmp [bp]

L151: ; Continuation
  Bare_enter_check(12)
  push word [bp+6]
  push word [bp+4]
  push word si
  push word [CurrentCont]
  push word L150
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g20
  mov si, g25
  jmp [bp]

L152: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L151
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g20
  mov si, si
  jmp [bp]

L153: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+6]
  push word [CurrentCont]
  push word L152
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+8]
  mov bp, [bp+4]
  jmp [bp]

L154: ; Function: (lam,t1)
  Bare_enter_check(12)
  push word si
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L153
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+6]
  mov bp, [bp+2]
  jmp [bp]

L155: ; Function: (lam,t3)
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [bp+2]
  push word L154
  mov [Temps+2], sp
  push word 8 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L156: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L157: ; Arm: 113'11
  push word g27
  push word `0`
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  mov si, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L158: ; Continuation
  Bare_enter_check(8)
  push word si
  push word `-`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L159: ; Continuation
  Bare_enter_check(6)
  mov ax, 1
  mov bx, [bp+4]
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  push word [CurrentCont]
  push word L158
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L160: ; Arm: 114'13
  push word si
  push word [CurrentCont]
  push word L159
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g28
  jmp [bp]

L161: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L162: ; Function: (lam,t5)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  push word [bp+2]
  push word [CurrentCont]
  push word L156
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L157
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L160
  push word si
  push word [CurrentCont]
  push word L161
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g29
  jmp [bp]

L163: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L164: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L163
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L165: ; Function: (lam,t7)
  Bare_enter_check(10)
  push word si
  push word [bp+2]
  push word [CurrentCont]
  push word L164
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g30
  mov si, 1
  jmp [bp]

L166: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov si, si
  jmp [bp]

L167: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L166
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L168: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L167
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L169: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L168
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, g42
  jmp [bp]

L170: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L169
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L171: ; Arm: 156'45
  push word si
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L170
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov si, g41
  jmp [bp]

L172: ; Function: (lam,t10)
  Bare_enter_check(12)
  mov bx, [bp+6]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L171
  mov si, g43
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L173: ; Arm: 189'9
  mov si, [bp+8]
  mov bp, [bp+4]
  jmp [bp]

L174: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L175: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L174
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L176: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L175
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L177: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L176
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+10]
  jmp [bp]

L178: ; Continuation
  Bare_enter_check(14)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word si
  push word [CurrentCont]
  push word L177
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g20
  mov si, g55
  jmp [bp]

L179: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L178
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g20
  mov si, si
  jmp [bp]

L180: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L179
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L181: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L180
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L182: ; Continuation
  Bare_enter_check(16)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word si
  push word [CurrentCont]
  push word L181
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g20
  mov si, g54
  jmp [bp]

L183: ; Continuation
  Bare_enter_check(14)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L182
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov si, [bp+6]
  mov bp, g20
  jmp [bp]

L184: ; Function: (lam,t1)
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L173
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L183
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov si, [Temps+2]
  jmp [bp]

L185: ; Function: (collect,t1)
  Bare_enter_check(14)
  push word bp
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L184
  mov [Temps+2], sp
  push word 12 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L186: ; Arm: 194'7
  mov si, g57
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L187: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L188: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L187
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L189: ; Continuation
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 1
  jz L186
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [bp+6]
  push word [CurrentCont]
  push word L188
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov si, [Temps+2]
  jmp [bp]

L190: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L189
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+8]
  jmp [bp]

L191: ; Function: (lam,t2)
  Bare_enter_check(12)
  push word si
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L190
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g20
  mov si, g56
  jmp [bp]

L192: ; Continuation
  Bare_enter_check(18)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word L185
  mov [Temps+2], sp
  push word 8 ;; scanned
  push word [Temps+2]
  push word [bp+4]
  push word L191
  mov [Temps+4], sp
  push word 6 ;; scanned
  mov si, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L193: ; Function: (lam,t14)
  Bare_enter_check(10)
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L192
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+2]
  mov si, si
  jmp [bp]

L194: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word si
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L195: ; Arm: 210'11
  push word [bp+6]
  push word [CurrentCont]
  push word L194
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+10]
  mov bp, [bp+2]
  jmp [bp]

L196: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L197: ; Continuation
  Bare_enter_check(16)
  push word [bp+6]
  push word si
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word [CurrentCont]
  push word L196
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov si, [Temps+2]
  jmp [bp]

L198: ; Arm: 212'26
  push word [Temps+4]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L197
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+10]
  mov bp, [bp+2]
  jmp [bp]

L199: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L200: ; Continuation
  Bare_enter_check(16)
  push word [bp+4]
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word [CurrentCont]
  push word L199
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L201: ; Function: (lam,t1)
  Bare_enter_check(12)
  mov bx, si
  cmp word [bx], 1
  jz L195
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [Temps+2]
  cmp word ax, ` `
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L198
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+10]
  push word [CurrentCont]
  push word L200
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+6]
  mov bp, [bp+8]
  jmp [bp]

L202: ; Function: (lam,t1)
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L201
  mov [Temps+2], sp
  push word 12 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L203: ; Function: (have_letter,t1)
  Bare_enter_check(12)
  push word bp
  push word si
  push word [bp+4]
  push word [bp+2]
  push word L202
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L204: ; Arm: 217'9
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L205: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L206: ; Arm: 219'24
  push word [Temps+4]
  push word [CurrentCont]
  push word L205
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+2]
  mov bp, [bp+4]
  jmp [bp]

L207: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L208: ; Continuation
  Bare_enter_check(16)
  push word g58
  push word [bp+4]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+6]
  push word [CurrentCont]
  push word L207
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L209: ; Function: (lam,t2)
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 1
  jz L204
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [Temps+2]
  cmp word ax, ` `
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L206
  push word [Temps+4]
  push word [Temps+2]
  push word [CurrentCont]
  push word L208
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+2]
  mov bp, [bp+6]
  jmp [bp]

L210: ; Function: (at_word_start,t16)
  Bare_enter_check(18)
  push word bp
  push word [bp+2]
  push word L203
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word bp
  push word si
  push word L209
  mov [Temps+4], sp
  push word 8 ;; scanned
  mov si, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L211: ; Arm: 285'22
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov bp, [bp+2]
  mov si, si
  jmp [bp]

L212: ; Arm: 286'28
  mov ax, `^`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov ax, `D`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+14], ax
  push word si
  push word `\x04`
  push word 3
  mov [Temps+16], sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov si, [Temps+16]
  jmp [bp]

L213: ; Arm: 287'19
  mov bp, bp
  mov si, si
  jmp [bp]

L214: ; Arm: 290'17
  mov bp, bp
  mov si, si
  jmp [bp]

L215: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L216: ; Arm: 294'28
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, ` `
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+4], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov ax, ` `
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov si, [Temps+12]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L217: ; Arm: 295'29
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+4], ax
  mov ax, ` `
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov ax, ` `
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+14], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+16], ax
  mov ax, ` `
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+18], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+20], ax
  mov si, [Temps+20]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L218: ; Arm: 296'32
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, ` `
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov ax, ` `
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+14], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+16], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+18], ax
  mov ax, ` `
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+20], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+22], ax
  mov si, [Temps+22]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L219: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L215
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L216
  mov ax, [bp+8]
  cmp word ax, 65
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L217
  mov ax, 253
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L218
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, ` `
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov si, [Temps+10]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L220: ; Arm: 15'9
  mov si, g69
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L221: ; Arm: 288'21
  mov bx, si
  cmp word [bx], 1
  jz L214
  mov ax, [bx+2]
  mov [Temps+14], ax
  mov ax, [bx+4]
  mov [Temps+16], ax
  mov ax, [Temps+14]
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+18], ax
  mov ax, 53
  cmp word ax, [Temps+18]
  call Bare_make_bool_from_n
  mov [Temps+20], ax
  push word [Temps+18]
  push word [Temps+16]
  push word bp
  push word [CurrentCont]
  push word L219
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+20]
  cmp word [bx], 3
  jz L220
  mov si, g70
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L222: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+2]
  jmp [bp]

L223: ; Arm: 139'19
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+18], ax
  mov si, [Temps+18]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L224: ; Arm: 140'22
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+20], ax
  mov si, [Temps+20]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L225: ; Arm: 141'16
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+22], ax
  mov si, [Temps+22]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L226: ; Function: (readloop,t1)
  Bare_enter_check(12)
  call Bare_get_char
  mov [Temps+2], ax
  mov ax, [Temps+2]
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+4], ax
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L211
  mov ax, [Temps+2]
  cmp word ax, `\x04`
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L212
  mov ax, 255
  cmp word ax, [Temps+4]
  call Bare_make_bool_from_n
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L213
  mov ax, [Temps+4]
  cmp word ax, 255
  call Bare_make_bool_from_z
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L221
  mov ax, [Temps+2]
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+14], ax
  mov ax, [Temps+14]
  cmp word ax, 17
  call Bare_make_bool_from_z
  mov [Temps+16], ax
  push word [Temps+2]
  push word bp
  push word si
  push word [CurrentCont]
  push word L222
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+16]
  cmp word [bx], 3
  jz L223
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+18], ax
  mov bx, [Temps+18]
  cmp word [bx], 3
  jz L224
  mov ax, 53
  cmp word ax, [Temps+14]
  call Bare_make_bool_from_n
  mov [Temps+20], ax
  mov bx, [Temps+20]
  cmp word [bx], 3
  jz L225
  mov ax, `^`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+22], ax
  mov ax, 131
  mov bx, [Temps+14]
  add ax, bx
  sub ax, 1
  mov [Temps+24], ax
  mov ax, [Temps+24]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+26], ax
  mov ax, [Temps+26]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+28], ax
  mov ax, [Temps+28]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+30], ax
  mov si, [Temps+30]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L227: ; Function: (lam,t1)
  Bare_enter_check(6)
  push word [bp+2]
  push word L226
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov bp, [Temps+2]
  mov si, g71
  jmp [bp]

L228: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L229: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L228
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g73
  jmp [bp]

L230: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L229
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L231: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L230
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L232: ; Function: (lam,t3)
  Bare_enter_check(12)
  push word si
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L231
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+2]
  mov si, g72
  jmp [bp]

L233: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+6]
  mov [Temps+2], ax
  mov ax, [bp+4]
  sar ax, 1
  mov bx, [Temps+2]
  call Bare_store_sector
  mov ax, Bare_unit
  mov [Temps+4], ax
  mov si, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L234: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L233
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L235: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L234
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L236: ; Continuation
  Bare_enter_check(600)
  mov ax, 1025
  call Bare_make_bytes
  mov [Temps+2], ax
  mov ax, [bp+6]
  sar ax, 1
  mov bx, [Temps+2]
  call Bare_load_sector
  mov ax, Bare_unit
  mov [Temps+4], ax
  push word [Temps+2]
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L235
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov si, [Temps+2]
  jmp [bp]

L237: ; Continuation
  Bare_enter_check(12)
  mov ax, si
  sar ax, 1
  mov bx, 17
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov ax, si
  sar ax, 1
  mov bx, 17
  sar bx, 1
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+4], dx
  mov ax, 129
  sar ax, 1
  mov bx, [Temps+4]
  sar bx, 1
  mul bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  push word [Temps+6]
  push word [Temps+2]
  push word [bp+4]
  push word [CurrentCont]
  push word L236
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [bp+6]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov si, [Temps+8]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L238: ; Function: (lam,t1)
  Bare_enter_check(10)
  push word si
  push word [bp+2]
  push word [CurrentCont]
  push word L237
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L239: ; Function: (lam,t5)
  Bare_enter_check(8)
  push word si
  push word [bp+2]
  push word L238
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L240: ; Continuation
  Bare_enter_check(6)
  push word si
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L241: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L240
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, si
  mov si, 129
  jmp [bp]

L242: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L241
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L243: ; Continuation
  Bare_enter_check(600)
  mov ax, si
  sar ax, 1
  mov bx, 17
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov ax, si
  sar ax, 1
  mov bx, 17
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+4], ax
  mov ax, 1025
  call Bare_make_bytes
  mov [Temps+6], ax
  mov ax, [Temps+4]
  sar ax, 1
  mov bx, [Temps+6]
  call Bare_load_sector
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov ax, [Temps+6]
  mov [Temps+10], ax
  mov ax, si
  sar ax, 1
  mov bx, 17
  sar bx, 1
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+12], dx
  mov ax, 129
  sar ax, 1
  mov bx, [Temps+12]
  sar bx, 1
  mul bx
  shl ax, 1
  add ax, 1
  mov [Temps+14], ax
  push word [Temps+14]
  push word [CurrentCont]
  push word L242
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov si, [Temps+10]
  jmp [bp]

L244: ; Function: (lam,t7)
  Bare_enter_check(8)
  push word [bp+2]
  push word [CurrentCont]
  push word L243
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, si
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L245: ; Continuation
  Bare_enter_check(6)
  mov ax, [bp+4]
  mov [Temps+2], ax
  push word [Temps+2]
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  mov bp, si
  mov si, [Temps+4]
  jmp [bp]

L246: ; Continuation
  Bare_enter_check(8)
  push word [bp+8]
  push word [CurrentCont]
  push word L245
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L247: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L246
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+8]
  jmp [bp]

L248: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L247
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+8]
  jmp [bp]

L249: ; Continuation
  Bare_enter_check(16)
  mov [Temps+2], si
  push word [Temps+2]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L248
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov si, [Temps+2]
  jmp [bp]

L250: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L249
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, si
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L251: ; Function: (lam,t1)
  Bare_enter_check(16)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L250
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov si, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L252: ; Function: (lam,t1)
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L251
  mov [Temps+2], sp
  push word 12 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L253: ; Function: (lam,t9)
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L252
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L254: ; Arm: 460'9
  mov si, g76
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L255: ; Arm: 462'14
  mov si, g77
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L256: ; Continuation
  Bare_enter_check(14)
  push word si
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word 3
  mov [Temps+4], sp
  push word 4 ;; scanned
  mov si, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L257: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L256
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L258: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L257
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L259: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L258
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L260: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L259
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, si
  mov si, 13
  jmp [bp]

L261: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L260
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, si
  mov si, 5
  jmp [bp]

L262: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word si
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L261
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov si, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L263: ; Continuation
  Bare_enter_check(16)
  push word [bp+10]
  push word [bp+8]
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L262
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g2
  mov si, g78
  jmp [bp]

L264: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L263
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g11
  mov si, si
  jmp [bp]

L265: ; Arm: 453'14
  mov si, 1
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L266: ; Continuation
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L254
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L255
  mov ax, [Temps+2]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  push word [Temps+6]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L264
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L265
  mov ax, [Temps+6]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+10], ax
  mov ax, [Temps+10]
  sar ax, 1
  mov bx, 129
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+12], ax
  mov ax, 3
  mov bx, [Temps+12]
  add ax, bx
  sub ax, 1
  mov [Temps+14], ax
  mov si, [Temps+14]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L267: ; Arm: 419'32
  mov si, g75
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L268: ; Continuation
  Bare_enter_check(26)
  mov ax, si
  mov bx, 1
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+2], ax
  mov ax, si
  mov bx, 3
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+4], ax
  push word [Temps+4]
  push word [Temps+2]
  push word 1
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L266
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+6]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov ax, [bx+4]
  mov [Temps+10], ax
  mov ax, [Temps+10]
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+12], ax
  mov ax, [Temps+8]
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+14], ax
  mov ax, 3
  cmp word ax, [Temps+12]
  call Bare_make_bool_from_n
  mov [Temps+16], ax
  mov bx, [Temps+16]
  cmp word [bx], 3
  jz L267
  mov ax, 513
  sar ax, 1
  mov bx, [Temps+12]
  sar bx, 1
  mul bx
  shl ax, 1
  add ax, 1
  mov [Temps+18], ax
  mov ax, [Temps+18]
  mov bx, [Temps+14]
  add ax, bx
  sub ax, 1
  mov [Temps+20], ax
  push word [Temps+20]
  push word 3
  mov [Temps+22], sp
  push word 4 ;; scanned
  mov si, [Temps+22]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L269: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L268
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, 17
  jmp [bp]

L270: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L269
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+8]
  jmp [bp]

L271: ; Continuation
  Bare_enter_check(12)
  mov ax, si
  sar ax, 1
  mov bx, 17
  sar bx, 1
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+2], dx
  mov ax, [Temps+2]
  sar ax, 1
  mov bx, 17
  sar bx, 1
  mul bx
  shl ax, 1
  add ax, 1
  mov [Temps+4], ax
  push word [Temps+4]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L270
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L272: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L271
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L273: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L272
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, si
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L274: ; Continuation
  Bare_enter_check(18)
  mov ax, si
  sar ax, 1
  mov bx, 17
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+4], ax
  push word [Temps+4]
  push word 1
  mov [Temps+6], sp
  push word 4 ;; scanned
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L273
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+8]
  mov si, [Temps+6]
  jmp [bp]

L275: ; Function: (lam,t1)
  Bare_enter_check(14)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L274
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, si
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L276: ; Function: (lam,t1)
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L275
  mov [Temps+2], sp
  push word 8 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L277: ; Continuation
  Bare_enter_check(6)
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L278: ; Continuation
  Bare_enter_check(14)
  mov ax, si
  sar ax, 1
  mov bx, 17
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+4], ax
  push word [Temps+4]
  push word 1
  mov [Temps+6], sp
  push word 4 ;; scanned
  push word [bp+6]
  push word [CurrentCont]
  push word L277
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov si, [Temps+6]
  jmp [bp]

L279: ; Continuation
  Bare_enter_check(10)
  mov ax, [bp+8]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [bp+4]
  push word [CurrentCont]
  push word L278
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [bp+6]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov si, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L280: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L279
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+8]
  jmp [bp]

L281: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L280
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+10]
  jmp [bp]

L282: ; Continuation
  Bare_enter_check(16)
  mov ax, si
  sar ax, 1
  mov bx, 17
  sar bx, 1
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+2], dx
  mov ax, [Temps+2]
  sar ax, 1
  mov bx, 17
  sar bx, 1
  mul bx
  shl ax, 1
  add ax, 1
  mov [Temps+4], ax
  mov ax, [bp+10]
  mov [Temps+6], ax
  push word [Temps+6]
  push word [Temps+4]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L281
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov si, [Temps+6]
  jmp [bp]

L283: ; Continuation
  Bare_enter_check(16)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L282
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L284: ; Arm: 592'11
  mov si, [bp+10]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L285: ; Continuation
  Bare_enter_check(16)
  push word si
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word [bp+6]
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov si, [Temps+4]
  jmp [bp]

L286: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L285
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L287: ; Continuation
  Bare_enter_check(28)
  push word si
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L283
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, [bp+14]
  cmp word [bx], 1
  jz L284
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  mov ax, 3
  mov bx, [Temps+4]
  add ax, bx
  sub ax, 1
  mov [Temps+8], ax
  mov ax, [Temps+8]
  sar ax, 1
  mov bx, 513
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+10], ax
  mov ax, [Temps+8]
  sar ax, 1
  mov bx, 513
  sar bx, 1
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+12], dx
  mov ax, [Temps+12]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+14], ax
  mov ax, [Temps+10]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+16], ax
  push word [Temps+16]
  push word [Temps+14]
  push word [Temps+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L286
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g2
  mov si, g80
  jmp [bp]

L288: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L287
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bx, si
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L289: ; Continuation
  Bare_enter_check(24)
  mov ax, si
  sar ax, 1
  mov bx, 17
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+4], ax
  push word [Temps+4]
  push word 1
  mov [Temps+6], sp
  push word 4 ;; scanned
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L288
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, [bp+10]
  mov si, [Temps+6]
  jmp [bp]

L290: ; Function: (lam,t1)
  Bare_enter_check(20)
  push word si
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L289
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bx, [bp+12]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L291: ; Function: (lam,t1)
  Bare_enter_check(16)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L290
  mov [Temps+2], sp
  push word 14 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L292: ; Function: (lam,t3)
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L291
  mov [Temps+2], sp
  push word 12 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L293: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov si, si
  jmp [bp]

L294: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L293
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L295: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L294
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L296: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L295
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, g87
  jmp [bp]

L297: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L296
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L298: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L297
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov si, g86
  jmp [bp]

L299: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L298
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L300: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L299
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, si
  mov si, g85
  jmp [bp]

L301: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L300
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L302: ; Arm: 732'21
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L301
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov si, g84
  jmp [bp]

L303: ; Function: (lam,t1)
  Bare_enter_check(12)
  mov bx, si
  cmp word [bx], 3
  jz L302
  mov bp, [bp+8]
  mov si, g88
  jmp [bp]

L304: ; Function: (lam,t1)
  Bare_enter_check(26)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L303
  mov [Temps+2], sp
  push word 10 ;; scanned
  push word [Temps+2]
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [Temps+4]
  push word [bp+6]
  push word 1
  mov [Temps+6], sp
  push word 6 ;; scanned
  mov si, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L305: ; Function: (lam,t6)
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [bp+2]
  push word L304
  mov [Temps+2], sp
  push word 8 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L306: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov si, si
  jmp [bp]

L307: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L306
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L308: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L307
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L309: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L308
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, g92
  jmp [bp]

L310: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L309
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L311: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L310
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov si, g91
  jmp [bp]

L312: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L311
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L313: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L312
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, si
  mov si, g90
  jmp [bp]

L314: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L313
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L315: ; Arm: 741'17
  push word [bp+8]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L314
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov si, g89
  jmp [bp]

L316: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov si, si
  jmp [bp]

L317: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L316
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L318: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L317
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L319: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L318
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, g96
  jmp [bp]

L320: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L319
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L321: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L320
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov si, g95
  jmp [bp]

L322: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L321
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L323: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L322
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, si
  mov si, g94
  jmp [bp]

L324: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L323
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L325: ; Arm: 744'24
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [bp+8]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L324
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov si, g93
  jmp [bp]

L326: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov si, si
  jmp [bp]

L327: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L326
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L328: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L327
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L329: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L328
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, g100
  jmp [bp]

L330: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L329
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L331: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L330
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov si, g99
  jmp [bp]

L332: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L331
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L333: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L332
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, si
  mov si, g98
  jmp [bp]

L334: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L333
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L335: ; Arm: 747'25
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L334
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov si, g97
  jmp [bp]

L336: ; Continuation
  Bare_enter_check(12)
  mov bx, si
  cmp word [bx], 1
  jz L335
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bp, [bp+10]
  mov si, [Temps+2]
  jmp [bp]

L337: ; Function: (lam,t1)
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L315
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L325
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L336
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+2]
  jmp [bp]

L338: ; Function: (lam,t1)
  Bare_enter_check(28)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L337
  mov [Temps+2], sp
  push word 12 ;; scanned
  push word [Temps+2]
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [Temps+4]
  push word [bp+8]
  push word 1
  mov [Temps+6], sp
  push word 6 ;; scanned
  mov si, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L339: ; Function: (lam,t8)
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L338
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L340: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov si, si
  jmp [bp]

L341: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L340
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L342: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L341
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L343: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L342
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, g104
  jmp [bp]

L344: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L343
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L345: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L344
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov si, g103
  jmp [bp]

L346: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L345
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L347: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L346
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, si
  mov si, g102
  jmp [bp]

L348: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L347
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L349: ; Arm: 756'17
  push word [bp+8]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L348
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov si, g101
  jmp [bp]

L350: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov si, si
  jmp [bp]

L351: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L350
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L352: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L351
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L353: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L352
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, g108
  jmp [bp]

L354: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L353
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L355: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L354
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov si, g107
  jmp [bp]

L356: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L355
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L357: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L356
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, si
  mov si, g106
  jmp [bp]

L358: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L357
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L359: ; Arm: 759'20
  push word [bp+8]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L358
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov si, g105
  jmp [bp]

L360: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov si, si
  jmp [bp]

L361: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L360
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L362: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L361
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L363: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L362
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, g112
  jmp [bp]

L364: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L363
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L365: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L364
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov si, g111
  jmp [bp]

L366: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L365
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L367: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L366
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, si
  mov si, g110
  jmp [bp]

L368: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L367
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L369: ; Arm: 762'27
  mov ax, [bx+2]
  mov [Temps+10], ax
  mov ax, [bx+4]
  mov [Temps+12], ax
  push word [bp+8]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L368
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov si, g109
  jmp [bp]

L370: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov si, si
  jmp [bp]

L371: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L370
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L372: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L371
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L373: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L372
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, g116
  jmp [bp]

L374: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L373
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L375: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L374
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov si, g115
  jmp [bp]

L376: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L375
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L377: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L376
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, si
  mov si, g114
  jmp [bp]

L378: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L377
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L379: ; Arm: 765'28
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L378
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov si, g113
  jmp [bp]

L380: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov si, si
  jmp [bp]

L381: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L380
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L382: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L381
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L383: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L382
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, g120
  jmp [bp]

L384: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L383
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L385: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L384
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov si, g119
  jmp [bp]

L386: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L385
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L387: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L386
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, si
  mov si, g118
  jmp [bp]

L388: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L387
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L389: ; Arm: 768'31
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L388
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov si, g117
  jmp [bp]

L390: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L391: ; Continuation
  Bare_enter_check(12)
  mov bx, si
  cmp word [bx], 1
  jz L389
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [CurrentCont]
  push word L390
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+12]
  mov bp, [bp+10]
  jmp [bp]

L392: ; Continuation
  Bare_enter_check(16)
  mov bx, si
  cmp word [bx], 1
  jz L379
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L391
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov si, [bp+14]
  mov bp, [bp+8]
  jmp [bp]

L393: ; Function: (lam,t1)
  Bare_enter_check(18)
  mov bx, si
  cmp word [bx], 1
  jz L349
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 1
  jz L359
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L369
  push word [Temps+6]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L392
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+2]
  jmp [bp]

L394: ; Function: (lam,t1)
  Bare_enter_check(28)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L393
  mov [Temps+2], sp
  push word 12 ;; scanned
  push word [Temps+2]
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [Temps+4]
  push word [bp+8]
  push word 1
  mov [Temps+6], sp
  push word 6 ;; scanned
  mov si, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L395: ; Function: (lam,t10)
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L394
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L396: ; Arm: 864'10
  mov si, g151
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L397: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, [bp+6]
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L398: ; Continuation
  Bare_enter_check(10)
  mov bx, [bp+10]
  cmp word [bx], 3
  jz L396
  mov bx, [bp+12]
  mov ax, [bx]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [bp+8]
  push word [CurrentCont]
  push word L397
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+4]
  mov bp, [bp+6]
  jmp [bp]

L399: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov si, si
  jmp [bp]

L400: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L399
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L401: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L400
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L402: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L401
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, g126
  jmp [bp]

L403: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L402
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, g125
  jmp [bp]

L404: ; Arm: 640'9
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L403
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, g124
  jmp [bp]

L405: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov si, si
  jmp [bp]

L406: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L405
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L407: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L406
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L408: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L407
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, g129
  jmp [bp]

L409: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L408
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, g128
  jmp [bp]

L410: ; Arm: 644'12
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L409
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, g127
  jmp [bp]

L411: ; Continuation
  Bare_enter_check(6)
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov bx, [bp+4]
  mov ax, [Temps+2]
  mov [bx], ax
  mov ax, Bare_unit
  mov [Temps+4], ax
  mov si, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L412: ; Continuation
  Bare_enter_check(24)
  push word [bp+10]
  push word [bp+6]
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word 3
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L411
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, [Temps+4]
  jmp [bp]

L413: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L412
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L414: ; Continuation
  Bare_enter_check(16)
  push word si
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L413
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov si, [bp+10]
  mov bp, [bp+4]
  jmp [bp]

L415: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L414
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, [bp+16]
  mov si, si
  jmp [bp]

L416: ; Continuation
  Bare_enter_check(20)
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L415
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+16]
  jmp [bp]

L417: ; Continuation
  Bare_enter_check(22)
  push word si
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L416
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov bp, g20
  mov si, g131
  jmp [bp]

L418: ; Continuation
  Bare_enter_check(20)
  push word si
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L417
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov si, [bp+16]
  mov bp, g20
  jmp [bp]

L419: ; Continuation
  Bare_enter_check(20)
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L418
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+16]
  jmp [bp]

L420: ; Arm: 653'15
  push word [bp+24]
  push word [bp+22]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [CurrentCont]
  push word L419
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov bp, g20
  mov si, g130
  jmp [bp]

L421: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L422: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L421
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, 1
  jmp [bp]

L423: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L422
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L424: ; Continuation
  Bare_enter_check(18)
  push word [bp+4]
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+10]
  push word [bp+6]
  push word [CurrentCont]
  push word L423
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L425: ; Continuation
  Bare_enter_check(14)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [CurrentCont]
  push word L424
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov si, [bp+4]
  mov bp, [bp+6]
  jmp [bp]

L426: ; Continuation
  Bare_enter_check(18)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L425
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+10]
  jmp [bp]

L427: ; Continuation
  Bare_enter_check(20)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L426
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+10]
  jmp [bp]

L428: ; Arm: 659'22
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [Temps+8]
  push word [Temps+6]
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+26]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [CurrentCont]
  push word L427
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+6]
  jmp [bp]

L429: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov si, si
  jmp [bp]

L430: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L429
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L431: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L430
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L432: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L431
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, g135
  jmp [bp]

L433: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L432
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, g134
  jmp [bp]

L434: ; Arm: 664'22
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L433
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, g133
  jmp [bp]

L435: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L436: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L435
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, 1
  jmp [bp]

L437: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L436
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g136
  jmp [bp]

L438: ; Continuation
  Bare_enter_check(16)
  push word [bp+4]
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+6]
  push word [CurrentCont]
  push word L437
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L439: ; Continuation
  Bare_enter_check(12)
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L438
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+10]
  mov bp, [bp+4]
  jmp [bp]

L440: ; Continuation
  Bare_enter_check(16)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L439
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+8]
  jmp [bp]

L441: ; Continuation
  Bare_enter_check(18)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L440
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+8]
  jmp [bp]

L442: ; Continuation
  Bare_enter_check(20)
  mov bx, si
  cmp word [bx], 1
  jz L434
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [Temps+6]
  push word [Temps+4]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [CurrentCont]
  push word L441
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, [bp+8]
  mov si, [Temps+6]
  jmp [bp]

L443: ; Arm: 567'10
  mov si, g132
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L444: ; Function: (lam,t1)
  Bare_enter_check(46)
  mov bx, si
  cmp word [bx], 1
  jz L420
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [bp+24]
  cmp word [bx], 3
  jz L428
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+26]
  push word [bp+22]
  push word [bp+20]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L442
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov bx, [bp+18]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov ax, [bx+6]
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 1
  jz L443
  mov ax, [bx+2]
  mov [Temps+12], ax
  mov ax, [bx+4]
  mov [Temps+14], ax
  push word [Temps+14]
  push word [Temps+8]
  push word [Temps+6]
  push word 1
  mov [Temps+16], sp
  push word 8 ;; scanned
  push word [Temps+12]
  push word [Temps+16]
  push word 1
  mov [Temps+18], sp
  push word 6 ;; scanned
  push word [Temps+18]
  push word 3
  mov [Temps+20], sp
  push word 4 ;; scanned
  mov si, [Temps+20]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L445: ; Function: (lam,t1)
  Bare_enter_check(30)
  push word si
  push word [bp+24]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L444
  mov [Temps+2], sp
  push word 28 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L446: ; Function: (lam,t1)
  Bare_enter_check(28)
  push word si
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L445
  mov [Temps+2], sp
  push word 26 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L447: ; Function: (lam,t1)
  Bare_enter_check(26)
  push word si
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L446
  mov [Temps+2], sp
  push word 24 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L448: ; Function: (loop,t1)
  Bare_enter_check(24)
  push word bp
  push word si
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L447
  mov [Temps+2], sp
  push word 22 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L449: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L450: ; Continuation
  Bare_enter_check(8)
  mov ax, [bp+4]
  sar ax, 1
  mov bx, 129
  sar bx, 1
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+2], dx
  push word [bp+6]
  push word [CurrentCont]
  push word L449
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L451: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L450
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+8]
  jmp [bp]

L452: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L451
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+8]
  jmp [bp]

L453: ; Arm: 679'10
  push word si
  push word [bp+20]
  push word [bp+12]
  push word [bp+8]
  push word [CurrentCont]
  push word L452
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov si, [bp+18]
  mov bp, [bp+10]
  jmp [bp]

L454: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L455: ; Continuation
  Bare_enter_check(16)
  push word [bp+4]
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word [CurrentCont]
  push word L454
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L456: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L455
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L457: ; Arm: 682'22
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  mov ax, [bp+14]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+8], ax
  push word [Temps+6]
  push word [Temps+4]
  push word [bp+20]
  push word [bp+18]
  push word [CurrentCont]
  push word L456
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+16]
  mov si, [Temps+8]
  jmp [bp]

L458: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov si, si
  jmp [bp]

L459: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L458
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L460: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L459
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L461: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L460
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, g145
  jmp [bp]

L462: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L461
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, g144
  jmp [bp]

L463: ; Arm: 685'22
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L462
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, g143
  jmp [bp]

L464: ; Arm: 200'14
  mov si, g148
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L465: ; Continuation
  Bare_enter_check(0)
  mov bx, si
  cmp word [bx], 3
  jz L464
  mov ax, [bp+4]
  mov bx, [bp+6]
  mov dx, `\x00`
  sar bx, 1
  call Bare_set_bytes
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, [bp+6]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+4], ax
  mov bp, [bp+8]
  mov si, [Temps+4]
  jmp [bp]

L466: ; Arm: 15'9
  mov si, g146
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L467: ; Function: (loop,t5)
  Bare_enter_check(12)
  mov ax, si
  cmp word ax, 129
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word si
  push word [bp+2]
  push word [CurrentCont]
  push word L465
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L466
  mov si, g147
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L468: ; Continuation
  Bare_enter_check(0)
  mov bp, si
  mov si, g149
  jmp [bp]

L469: ; Continuation
  Bare_enter_check(14)
  push word [bp+4]
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L468
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L470: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L469
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L471: ; Continuation
  Bare_enter_check(12)
  mov ax, [bp+4]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [CurrentCont]
  push word L470
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+2]
  jmp [bp]

L472: ; Continuation
  Bare_enter_check(22)
  push word [bp+14]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L471
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L473: ; Continuation
  Bare_enter_check(18)
  mov ax, [bp+16]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L472
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov si, [bp+14]
  mov bp, [bp+4]
  jmp [bp]

L474: ; Continuation
  Bare_enter_check(600)
  mov bx, si
  cmp word [bx], 1
  jz L463
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  mov ax, 129
  call Bare_make_bytes
  mov [Temps+8], ax
  push word [Temps+8]
  push word L467
  mov [Temps+10], sp
  push word 4 ;; scanned
  push word [Temps+8]
  push word [Temps+6]
  push word [Temps+4]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [CurrentCont]
  push word L473
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, [Temps+10]
  mov si, 1
  jmp [bp]

L475: ; Arm: 567'10
  mov si, g142
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L476: ; Function: (lam,t1)
  Bare_enter_check(42)
  mov ax, [bp+14]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L453
  mov bx, si
  cmp word [bx], 3
  jz L457
  push word [bp+20]
  push word [bp+16]
  push word [bp+14]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L474
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bx, [bp+18]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  mov ax, [bx+6]
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 1
  jz L475
  mov ax, [bx+2]
  mov [Temps+10], ax
  mov ax, [bx+4]
  mov [Temps+12], ax
  push word [Temps+12]
  push word [Temps+6]
  push word [Temps+4]
  push word 1
  mov [Temps+14], sp
  push word 8 ;; scanned
  push word [Temps+10]
  push word [Temps+14]
  push word 1
  mov [Temps+16], sp
  push word 6 ;; scanned
  push word [Temps+16]
  push word 3
  mov [Temps+18], sp
  push word 4 ;; scanned
  mov si, [Temps+18]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L477: ; Function: (lam,t1)
  Bare_enter_check(24)
  push word si
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L476
  mov [Temps+2], sp
  push word 22 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L478: ; Function: (lam,t1)
  Bare_enter_check(22)
  push word si
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L477
  mov [Temps+2], sp
  push word 20 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L479: ; Function: (skip_loop,t1)
  Bare_enter_check(20)
  push word bp
  push word si
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L478
  mov [Temps+2], sp
  push word 18 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L480: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L481: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L480
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g150
  jmp [bp]

L482: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L481
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L483: ; Continuation
  Bare_enter_check(10)
  mov ax, [bp+4]
  sar ax, 1
  mov bx, 129
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  push word si
  push word [bp+6]
  push word [CurrentCont]
  push word L482
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, [Temps+2]
  jmp [bp]

L484: ; Continuation
  Bare_enter_check(28)
  push word si
  push word [bp+16]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L479
  mov [Temps+2], sp
  push word 14 ;; scanned
  push word [Temps+2]
  push word [bp+12]
  push word [bp+10]
  push word [CurrentCont]
  push word L483
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [bp+14]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  mov si, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L485: ; Arm: 673'40
  mov si, g137
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L486: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L487: ; Arm: 262'27
  push word [bp+4]
  push word [CurrentCont]
  push word L486
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g20
  mov si, g139
  jmp [bp]

L488: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L489: ; Continuation
  Bare_enter_check(16)
  push word [bp+4]
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word si
  push word [CurrentCont]
  push word L488
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+2]
  jmp [bp]

L490: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, 129
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L491: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L490
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, 129
  jmp [bp]

L492: ; Arm: 256'21
  push word [bp+12]
  push word [CurrentCont]
  push word L491
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+10]
  mov bp, [bp+4]
  jmp [bp]

L493: ; Continuation
  Bare_enter_check(20)
  mov ax, 129
  cmp word ax, [bp+12]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L489
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L492
  mov si, g140
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L494: ; Continuation
  Bare_enter_check(0)
  mov bp, si
  mov si, 129
  jmp [bp]

L495: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L494
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, si
  mov si, 1
  jmp [bp]

L496: ; Arm: 255'21
  push word [CurrentCont]
  push word L495
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+2]
  mov si, si
  jmp [bp]

L497: ; Function: (lam,t1)
  Bare_enter_check(22)
  mov bx, si
  mov ax, [bx]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L487
  mov bx, si
  mov ax, [bx]
  mov [Temps+6], ax
  mov ax, 129
  cmp word ax, [Temps+6]
  call Bare_make_bool_from_n
  mov [Temps+8], ax
  push word [Temps+6]
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L493
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L496
  mov si, si
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L498: ; Function: (loop,t1)
  Bare_enter_check(10)
  push word bp
  push word si
  push word [bp+2]
  push word L497
  mov [Temps+2], sp
  push word 8 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L499: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [bp+4]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L500: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L499
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L501: ; Continuation
  Bare_enter_check(16)
  push word [bp+4]
  push word L498
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word si
  push word [bp+6]
  push word [CurrentCont]
  push word L500
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [Temps+2]
  mov si, g141
  jmp [bp]

L502: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+6]
  mov bx, [bp+4]
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L503: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L502
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L504: ; Arm: 256'21
  push word [bp+10]
  push word [bp+8]
  push word [CurrentCont]
  push word L503
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L505: ; Continuation
  Bare_enter_check(20)
  mov ax, [bp+8]
  cmp word ax, [bp+10]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L501
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L504
  mov si, g138
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L506: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L507: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L506
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, 1
  jmp [bp]

L508: ; Arm: 255'21
  push word [Temps+6]
  push word [CurrentCont]
  push word L507
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+22]
  mov bp, [bp+8]
  jmp [bp]

L509: ; Continuation
  Bare_enter_check(62)
  push word si
  push word [bp+26]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+6]
  push word [bp+4]
  push word L448
  mov [Temps+2], sp
  push word 18 ;; scanned
  mov ax, [bp+20]
  sar ax, 1
  mov bx, 129
  sar bx, 1
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+4], dx
  mov ax, 129
  mov bx, [Temps+4]
  sub ax, bx
  add ax, 1
  mov [Temps+6], ax
  mov bx, [bp+22]
  mov ax, [bx]
  mov [Temps+8], ax
  mov ax, [Temps+8]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  push word [Temps+2]
  push word [bp+28]
  push word [bp+24]
  push word [bp+20]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L484
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L485
  mov bx, [bp+22]
  mov ax, [bx]
  mov [Temps+12], ax
  mov ax, [Temps+6]
  cmp word ax, [Temps+12]
  call Bare_make_bool_from_n
  mov [Temps+14], ax
  push word [Temps+12]
  push word [Temps+6]
  push word [bp+22]
  push word [bp+8]
  push word [CurrentCont]
  push word L505
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, [Temps+14]
  cmp word [bx], 3
  jz L508
  mov si, [bp+22]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L510: ; Arm: 104'23
  mov si, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L511: ; Continuation
  Bare_enter_check(32)
  mov bx, [bp+22]
  mov ax, [bx]
  mov [Temps+2], ax
  mov ax, [bp+20]
  mov bx, [Temps+2]
  add ax, bx
  sub ax, 1
  mov [Temps+4], ax
  mov ax, si
  cmp word ax, [Temps+4]
  call Bare_make_bool_from_n
  mov [Temps+6], ax
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L509
  mov [CurrentCont], sp
  push word 30 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L510
  mov si, si
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L512: ; Continuation
  Bare_enter_check(32)
  mov bx, si
  cmp word [bx], 1
  jz L410
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [bp+26]
  push word [bp+24]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L511
  mov [CurrentCont], sp
  push word 30 ;; scanned
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  mov si, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L513: ; Continuation
  Bare_enter_check(30)
  push word [bp+26]
  push word [bp+24]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L512
  mov [CurrentCont], sp
  push word 28 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+18]
  jmp [bp]

L514: ; Continuation
  Bare_enter_check(30)
  push word si
  push word [bp+26]
  push word [bp+24]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L513
  mov [CurrentCont], sp
  push word 28 ;; scanned
  mov bp, [bp+14]
  mov si, si
  jmp [bp]

L515: ; Continuation
  Bare_enter_check(46)
  mov bx, [bp+18]
  mov ax, [bx]
  mov [Temps+2], ax
  push word si
  push word [bp+26]
  push word [bp+24]
  push word [bp+22]
  push word [bp+20]
  push word [CurrentCont]
  push word L398
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L404
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [Temps+4]
  push word si
  push word [bp+24]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L514
  mov [CurrentCont], sp
  push word 28 ;; scanned
  mov bx, [Temps+4]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov ax, [bx+6]
  mov [Temps+10], ax
  mov si, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L516: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L517: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L516
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, 1
  jmp [bp]

L518: ; Arm: 862'21
  push word [bp+28]
  push word [CurrentCont]
  push word L517
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+26]
  mov bp, [bp+8]
  jmp [bp]

L519: ; Continuation
  Bare_enter_check(0)
  mov bp, si
  mov si, g123
  jmp [bp]

L520: ; Continuation
  Bare_enter_check(38)
  push word si
  push word [bp+24]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L515
  mov [CurrentCont], sp
  push word 28 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L518
  push word [CurrentCont]
  push word L519
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov si, [bp+26]
  mov bp, [bp+6]
  jmp [bp]

L521: ; Arm: 861'22
  mov si, g122
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L522: ; Continuation
  Bare_enter_check(32)
  mov bx, si
  mov ax, [bx]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  cmp word ax, 3
  call Bare_make_bool_from_n
  mov [Temps+4], ax
  push word [Temps+2]
  push word si
  push word [bp+24]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L520
  mov [CurrentCont], sp
  push word 30 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L521
  mov ax, [Temps+2]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+6], ax
  mov ax, si
  mov bx, [Temps+6]
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+8], ax
  mov ax, [Temps+8]
  cmp word ax, `\x04`
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov si, [Temps+10]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L523: ; Function: (lam,t1)
  Bare_enter_check(28)
  push word si
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L522
  mov [CurrentCont], sp
  push word 26 ;; scanned
  mov bp, [bp+8]
  mov si, g121
  jmp [bp]

L524: ; Function: (write_to_file,t12)
  Bare_enter_check(26)
  push word bp
  push word si
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L523
  mov [Temps+2], sp
  push word 24 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L525: ; Arm: 786'32
  mov si, g163
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L526: ; Arm: 326'16
  mov si, g166
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L527: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov bp, [bp+6]
  mov si, [Temps+2]
  jmp [bp]

L528: ; Arm: 329'21
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov si, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L529: ; Continuation
  Bare_enter_check(10)
  mov ax, [bp+4]
  sar ax, 1
  mov bx, 129
  sar bx, 1
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+2], dx
  mov ax, [Temps+2]
  cmp word ax, 127
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L527
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L528
  mov si, g168
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L530: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov si, si
  jmp [bp]

L531: ; Arm: 328'24
  push word [CurrentCont]
  push word L530
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, g167
  jmp [bp]

L532: ; Arm: 139'19
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov si, [Temps+10]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L533: ; Arm: 140'22
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov si, [Temps+12]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L534: ; Arm: 141'16
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+14], ax
  mov si, [Temps+14]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L535: ; Continuation
  Bare_enter_check(16)
  mov bx, si
  cmp word [bx], 3
  jz L526
  mov ax, [bp+6]
  mov bx, [bp+8]
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+2], ax
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  push word [bp+10]
  push word [bp+8]
  push word [CurrentCont]
  push word L529
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L531
  mov ax, [Temps+2]
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  cmp word ax, 17
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L532
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L533
  mov ax, 53
  cmp word ax, [Temps+6]
  call Bare_make_bool_from_n
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L534
  mov ax, `^`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+14], ax
  mov ax, 131
  mov bx, [Temps+6]
  add ax, bx
  sub ax, 1
  mov [Temps+16], ax
  mov ax, [Temps+16]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+18], ax
  mov ax, [Temps+18]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+20], ax
  mov ax, [Temps+20]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+22], ax
  mov si, [Temps+22]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L536: ; Arm: 15'9
  mov si, g164
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L537: ; Function: (loop,t4)
  Bare_enter_check(14)
  mov ax, si
  cmp word ax, 1025
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word si
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L535
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L536
  mov si, g165
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L538: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov bp, [bp+6]
  mov si, [Temps+2]
  jmp [bp]

L539: ; Continuation
  Bare_enter_check(600)
  mov bx, si
  cmp word [bx], 3
  jz L525
  mov ax, 1025
  call Bare_make_bytes
  mov [Temps+2], ax
  mov ax, [bp+6]
  sar ax, 1
  mov bx, [Temps+2]
  call Bare_load_sector
  mov ax, Bare_unit
  mov [Temps+4], ax
  mov ax, [Temps+2]
  mov [Temps+6], ax
  push word [Temps+6]
  push word [bp+4]
  push word L537
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L538
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [Temps+8]
  mov si, 1
  jmp [bp]

L540: ; Arm: 15'9
  mov si, g161
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L541: ; Function: (loop,t1)
  Bare_enter_check(12)
  mov ax, si
  cmp word ax, 7
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word si
  push word [bp+2]
  push word [CurrentCont]
  push word L539
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L540
  mov si, g162
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L542: ; Function: (lam,t1)
  Bare_enter_check(6)
  push word [bp+2]
  push word L541
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov bp, [Temps+2]
  mov si, 1
  jmp [bp]

L543: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov si, si
  jmp [bp]

L544: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L543
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L545: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L544
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L546: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L545
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, g172
  jmp [bp]

L547: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L546
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, g171
  jmp [bp]

L548: ; Arm: 795'11
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [bp+6]
  push word [bp+2]
  push word [CurrentCont]
  push word L547
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, g170
  jmp [bp]

L549: ; Continuation
  Bare_enter_check(0)
  mov bp, si
  mov si, g175
  jmp [bp]

L550: ; Continuation
  Bare_enter_check(12)
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [CurrentCont]
  push word L549
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L551: ; Function: (lam,t1)
  Bare_enter_check(18)
  push word 49
  push word 7
  push word 49
  push word 1
  mov [Temps+2], sp
  push word 8 ;; scanned
  push word si
  push word [CurrentCont]
  push word L550
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov si, [Temps+2]
  jmp [bp]

L552: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L553: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L552
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, 47
  jmp [bp]

L554: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L553
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g9
  mov si, 1
  jmp [bp]

L555: ; Continuation
  Bare_enter_check(12)
  push word [bp+4]
  push word L551
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [CurrentCont]
  push word L554
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g7
  mov si, [Temps+2]
  jmp [bp]

L556: ; Continuation
  Bare_enter_check(14)
  push word si
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L555
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+2]
  jmp [bp]

L557: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L556
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L558: ; Continuation
  Bare_enter_check(36)
  push word g174
  push word `\x18`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word `\x03`
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [Temps+4]
  push word `\x18`
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L557
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov si, [Temps+6]
  jmp [bp]

L559: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L558
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov si, g173
  jmp [bp]

L560: ; Function: (lam,t1)
  Bare_enter_check(18)
  mov bx, [bp+12]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L548
  push word 1
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L559
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+8]
  mov si, [Temps+4]
  jmp [bp]

L561: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov si, si
  jmp [bp]

L562: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L561
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L563: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L562
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L564: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L563
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, g179
  jmp [bp]

L565: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L564
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, g178
  jmp [bp]

L566: ; Arm: 806'11
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L565
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov si, g177
  jmp [bp]

L567: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov si, si
  jmp [bp]

L568: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L567
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L569: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L568
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L570: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L569
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, g193
  jmp [bp]

L571: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L570
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, g192
  jmp [bp]

L572: ; Arm: 809'12
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L571
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, g191
  jmp [bp]

L573: ; Continuation
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 1
  jz L572
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word 3
  mov [Temps+4], sp
  push word 4 ;; scanned
  mov bx, [bp+8]
  mov ax, [Temps+4]
  mov [bx], ax
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov si, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L574: ; Arm: 535'9
  mov si, g184
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L575: ; Continuation
  Bare_enter_check(16)
  push word [bp+6]
  push word si
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 8 ;; scanned
  push word [Temps+2]
  push word 3
  mov [Temps+4], sp
  push word 4 ;; scanned
  mov si, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L576: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L575
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+8]
  jmp [bp]

L577: ; Arm: 541'10
  push word [bp+12]
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L576
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g20
  mov si, g185
  jmp [bp]

L578: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L579: ; Continuation
  Bare_enter_check(22)
  push word [bp+6]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+4]
  push word [Temps+2]
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+6]
  push word [CurrentCont]
  push word L578
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, [Temps+4]
  jmp [bp]

L580: ; Arm: 545'19
  push word [bp+10]
  push word [bp+8]
  push word [CurrentCont]
  push word L579
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+4]
  mov bp, [bp+6]
  jmp [bp]

L581: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L582: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L581
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L583: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L582
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L584: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L583
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+10]
  jmp [bp]

L585: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L584
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L586: ; Continuation
  Bare_enter_check(16)
  mov bx, si
  cmp word [bx], 1
  jz L580
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [Temps+6]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L585
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g6
  mov si, g188
  jmp [bp]

L587: ; Continuation
  Bare_enter_check(20)
  push word [bp+10]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L586
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L588: ; Function: (lam,t1)
  Bare_enter_check(14)
  mov ax, si
  cmp word ax, [bp+6]
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L577
  push word si
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [CurrentCont]
  push word L587
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov si, [bp+4]
  mov bp, [bp+2]
  jmp [bp]

L589: ; Function: (lam,t1)
  Bare_enter_check(16)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L588
  mov [Temps+2], sp
  push word 14 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L590: ; Function: (loop,t5)
  Bare_enter_check(14)
  push word bp
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L589
  mov [Temps+2], sp
  push word 12 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L591: ; Continuation
  Bare_enter_check(0)
  mov bp, si
  mov si, 1
  jmp [bp]

L592: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L591
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, si
  mov si, g190
  jmp [bp]

L593: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L592
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L594: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L593
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L595: ; Continuation
  Bare_enter_check(10)
  mov ax, [bp+4]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L594
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L596: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L595
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+8]
  mov bp, g9
  jmp [bp]

L597: ; Continuation
  Bare_enter_check(34)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L573
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, si
  cmp word [bx], 1
  jz L574
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  mov ax, [bx+6]
  mov [Temps+8], ax
  push word [Temps+8]
  push word [Temps+2]
  push word [bp+8]
  push word L590
  mov [Temps+10], sp
  push word 8 ;; scanned
  mov ax, 3
  mov bx, [Temps+6]
  add ax, bx
  sub ax, 1
  mov [Temps+12], ax
  push word [Temps+12]
  push word [Temps+10]
  push word [Temps+4]
  push word [CurrentCont]
  push word L596
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g2
  mov si, g189
  jmp [bp]

L598: ; Arm: 498'49
  mov si, g183
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L599: ; Continuation
  Bare_enter_check(30)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L597
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L598
  mov ax, [bp+12]
  mov bx, 9
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+2], ax
  mov ax, [bp+12]
  mov bx, 11
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+4], ax
  mov ax, [bp+12]
  mov bx, 13
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+6], ax
  mov ax, [Temps+2]
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+8], ax
  mov ax, [Temps+4]
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+10], ax
  mov ax, [Temps+6]
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+12], ax
  push word [Temps+12]
  push word [Temps+10]
  push word [Temps+8]
  push word 1
  mov [Temps+14], sp
  push word 8 ;; scanned
  push word [Temps+14]
  push word 3
  mov [Temps+16], sp
  push word 4 ;; scanned
  mov si, [Temps+16]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L600: ; Arm: 15'9
  mov si, g181
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L601: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L599
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L600
  mov si, g182
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L602: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L601
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, si
  mov si, g180
  jmp [bp]

L603: ; Continuation
  Bare_enter_check(16)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L602
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L604: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L603
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, si
  mov si, 9
  jmp [bp]

L605: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L604
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, si
  mov si, 1
  jmp [bp]

L606: ; Continuation
  Bare_enter_check(18)
  push word si
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L605
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, [bp+10]
  mov si, si
  jmp [bp]

L607: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L606
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bx, si
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L608: ; Function: (lam,t1)
  Bare_enter_check(24)
  mov bx, [bp+14]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L566
  push word 1
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L607
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, [bp+10]
  mov si, [Temps+4]
  jmp [bp]

L609: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov si, si
  jmp [bp]

L610: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L609
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L611: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L610
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L612: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L611
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, g197
  jmp [bp]

L613: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L612
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, g196
  jmp [bp]

L614: ; Arm: 816'9
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L613
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov si, g195
  jmp [bp]

L615: ; Function: (lam,t1)
  Bare_enter_check(10)
  mov bx, [bp+6]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L614
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov bx, [bp+6]
  mov ax, g198
  mov [bx], ax
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov si, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L616: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov si, si
  jmp [bp]

L617: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L616
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L618: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L617
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L619: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L618
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, g202
  jmp [bp]

L620: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L619
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, g201
  jmp [bp]

L621: ; Arm: 822'9
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L620
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov si, g200
  jmp [bp]

L622: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L623: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L622
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L624: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L623
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [bp+6]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L625: ; Function: (lam,t1)
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L624
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+2]
  mov si, g210
  jmp [bp]

L626: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L627: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L626
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L628: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L627
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [bp+6]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L629: ; Function: (lam,t1)
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L628
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+2]
  mov si, g214
  jmp [bp]

L630: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov si, si
  jmp [bp]

L631: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L630
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L632: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L631
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L633: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L632
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L634: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L633
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov si, si
  jmp [bp]

L635: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L634
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, si
  mov si, g228
  jmp [bp]

L636: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L635
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L637: ; Arm: 436'9
  mov si, g222
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L638: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L639: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L638
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L640: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L639
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [bp+6]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L641: ; Function: (lam,t1)
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L640
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+2]
  mov si, g226
  jmp [bp]

L642: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L643: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L642
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L644: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L643
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L645: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L644
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, si
  mov si, g227
  jmp [bp]

L646: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L645
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L647: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L646
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov si, si
  jmp [bp]

L648: ; Continuation
  Bare_enter_check(16)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L647
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L649: ; Continuation
  Bare_enter_check(26)
  push word [bp+6]
  push word [bp+4]
  push word L641
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word si
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L648
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, g2
  mov si, [Temps+2]
  jmp [bp]

L650: ; Continuation
  Bare_enter_check(18)
  push word si
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L649
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, [bp+8]
  mov si, g225
  jmp [bp]

L651: ; Continuation
  Bare_enter_check(18)
  push word si
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L650
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, [bp+4]
  mov si, g224
  jmp [bp]

L652: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L651
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L653: ; Continuation
  Bare_enter_check(16)
  push word si
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L652
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov si, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L654: ; Continuation
  Bare_enter_check(32)
  push word si
  push word [bp+16]
  push word [bp+14]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L636
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, [bp+12]
  cmp word [bx], 1
  jz L637
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [Temps+6]
  push word [Temps+4]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L653
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov si, g223
  jmp [bp]

L655: ; Continuation
  Bare_enter_check(20)
  push word si
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L654
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, [bp+6]
  mov si, g221
  jmp [bp]

L656: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L655
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L657: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L656
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, [bp+16]
  mov si, si
  jmp [bp]

L658: ; Continuation
  Bare_enter_check(20)
  push word si
  push word [bp+16]
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L657
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov si, [bp+12]
  mov bp, [bp+8]
  jmp [bp]

L659: ; Continuation
  Bare_enter_check(20)
  push word si
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L658
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, [bp+6]
  mov si, g220
  jmp [bp]

L660: ; Arm: 836'25
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L659
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, [bp+6]
  mov si, g219
  jmp [bp]

L661: ; Continuation
  Bare_enter_check(18)
  mov bx, si
  cmp word [bx], 3
  jz L660
  mov si, g229
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L662: ; Arm: 9'36
  mov si, g217
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L663: ; Continuation
  Bare_enter_check(18)
  push word si
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L661
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bx, si
  cmp word [bx], 1
  jz L662
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov si, g218
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L664: ; Continuation
  Bare_enter_check(22)
  push word [bp+12]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L663
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L665: ; Function: (lam,t1)
  Bare_enter_check(16)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L664
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov si, [bp+12]
  mov bp, [bp+10]
  jmp [bp]

L666: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L667: ; Continuation
  Bare_enter_check(8)
  mov ax, [bp+4]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  push word [bp+6]
  push word [CurrentCont]
  push word L666
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L668: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L667
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g9
  mov si, 1
  jmp [bp]

L669: ; Continuation
  Bare_enter_check(24)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L665
  mov [Temps+2], sp
  push word 14 ;; scanned
  push word si
  push word [CurrentCont]
  push word L668
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g7
  mov si, [Temps+2]
  jmp [bp]

L670: ; Continuation
  Bare_enter_check(18)
  push word si
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L669
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bx, si
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [bx+6]
  mov [Temps+6], ax
  mov si, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L671: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L670
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, [bp+14]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [bx+6]
  mov [Temps+6], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L672: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L671
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, g38
  mov si, si
  jmp [bp]

L673: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L672
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, [bp+4]
  mov si, g216
  jmp [bp]

L674: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L673
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, g38
  mov si, si
  jmp [bp]

L675: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L674
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L676: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L675
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, [bp+16]
  mov si, si
  jmp [bp]

L677: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L676
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, si
  mov si, g215
  jmp [bp]

L678: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L677
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L679: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L678
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, [bp+18]
  mov si, si
  jmp [bp]

L680: ; Continuation
  Bare_enter_check(22)
  push word [bp+20]
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L679
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+16]
  jmp [bp]

L681: ; Continuation
  Bare_enter_check(32)
  push word [bp+8]
  push word [bp+6]
  push word L629
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word si
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L680
  mov [CurrentCont], sp
  push word 22 ;; scanned
  mov bp, g2
  mov si, [Temps+2]
  jmp [bp]

L682: ; Continuation
  Bare_enter_check(22)
  push word si
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L681
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov bp, [bp+10]
  mov si, g213
  jmp [bp]

L683: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L682
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, [bp+6]
  mov si, g212
  jmp [bp]

L684: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L683
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, g38
  mov si, si
  jmp [bp]

L685: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L684
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L686: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L685
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, [bp+18]
  mov si, si
  jmp [bp]

L687: ; Continuation
  Bare_enter_check(22)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L686
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov bp, si
  mov si, g211
  jmp [bp]

L688: ; Continuation
  Bare_enter_check(22)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L687
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L689: ; Continuation
  Bare_enter_check(22)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L688
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov bp, [bp+20]
  mov si, si
  jmp [bp]

L690: ; Continuation
  Bare_enter_check(24)
  push word [bp+22]
  push word [bp+20]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L689
  mov [CurrentCont], sp
  push word 22 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+18]
  jmp [bp]

L691: ; Continuation
  Bare_enter_check(34)
  push word [bp+8]
  push word [bp+6]
  push word L625
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word si
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L690
  mov [CurrentCont], sp
  push word 24 ;; scanned
  mov bp, g2
  mov si, [Temps+2]
  jmp [bp]

L692: ; Continuation
  Bare_enter_check(24)
  push word si
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L691
  mov [CurrentCont], sp
  push word 22 ;; scanned
  mov bp, [bp+10]
  mov si, g209
  jmp [bp]

L693: ; Continuation
  Bare_enter_check(22)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L692
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov bp, [bp+6]
  mov si, g208
  jmp [bp]

L694: ; Continuation
  Bare_enter_check(22)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L693
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov bp, g38
  mov si, si
  jmp [bp]

L695: ; Continuation
  Bare_enter_check(22)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L694
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L696: ; Continuation
  Bare_enter_check(22)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L695
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov bp, [bp+20]
  mov si, si
  jmp [bp]

L697: ; Continuation
  Bare_enter_check(24)
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L696
  mov [CurrentCont], sp
  push word 22 ;; scanned
  mov bp, si
  mov si, g207
  jmp [bp]

L698: ; Continuation
  Bare_enter_check(24)
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L697
  mov [CurrentCont], sp
  push word 22 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L699: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L700: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L699
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L701: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L700
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L702: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L701
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov si, si
  jmp [bp]

L703: ; Continuation
  Bare_enter_check(14)
  push word si
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [CurrentCont]
  push word L702
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L704: ; Continuation
  Bare_enter_check(16)
  push word si
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L703
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov si, g206
  jmp [bp]

L705: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L704
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L706: ; Continuation
  Bare_enter_check(16)
  push word si
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L705
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov si, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L707: ; Continuation
  Bare_enter_check(16)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L706
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov si, g205
  jmp [bp]

L708: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L707
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L709: ; Continuation
  Bare_enter_check(38)
  push word si
  push word [bp+20]
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L698
  mov [CurrentCont], sp
  push word 22 ;; scanned
  mov bx, [bp+16]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [bx+6]
  mov [Temps+6], ax
  push word [Temps+6]
  push word [Temps+4]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L708
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+8]
  mov si, [Temps+2]
  jmp [bp]

L710: ; Continuation
  Bare_enter_check(24)
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L709
  mov [CurrentCont], sp
  push word 22 ;; scanned
  mov bp, [bp+6]
  mov si, g204
  jmp [bp]

L711: ; Continuation
  Bare_enter_check(24)
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L710
  mov [CurrentCont], sp
  push word 22 ;; scanned
  mov bp, g38
  mov si, si
  jmp [bp]

L712: ; Function: (lam,t1)
  Bare_enter_check(24)
  mov bx, [bp+12]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L621
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov ax, [bx+6]
  mov [Temps+10], ax
  push word [Temps+10]
  push word [Temps+8]
  push word [Temps+6]
  push word [Temps+4]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L711
  mov [CurrentCont], sp
  push word 22 ;; scanned
  mov bp, [bp+2]
  mov si, g203
  jmp [bp]

L713: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov si, si
  jmp [bp]

L714: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L713
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L715: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L714
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L716: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L715
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, g233
  jmp [bp]

L717: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L716
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, g232
  jmp [bp]

L718: ; Arm: 843'9
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L717
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov si, g231
  jmp [bp]

L719: ; Arm: 852'17
  mov si, g234
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L720: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov si, si
  jmp [bp]

L721: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L720
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L722: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L721
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L723: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L722
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L724: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L723
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov si, si
  jmp [bp]

L725: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L724
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, si
  mov si, g237
  jmp [bp]

L726: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L725
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L727: ; Continuation
  Bare_enter_check(16)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L726
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L728: ; Continuation
  Bare_enter_check(18)
  push word si
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L727
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bx, [bp+10]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L729: ; Continuation
  Bare_enter_check(18)
  push word si
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L728
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, [bp+6]
  mov si, g236
  jmp [bp]

L730: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L729
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L731: ; Continuation
  Bare_enter_check(16)
  push word si
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L730
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov si, [bp+10]
  mov bp, [bp+8]
  jmp [bp]

L732: ; Continuation
  Bare_enter_check(16)
  mov bx, si
  cmp word [bx], 1
  jz L719
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L731
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov si, g235
  jmp [bp]

L733: ; Continuation
  Bare_enter_check(20)
  push word [bp+10]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L732
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L734: ; Function: (lam,t1)
  Bare_enter_check(14)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L733
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov si, [bp+10]
  mov bp, [bp+8]
  jmp [bp]

L735: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L736: ; Continuation
  Bare_enter_check(8)
  mov ax, [bp+4]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  push word [bp+6]
  push word [CurrentCont]
  push word L735
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L737: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L736
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g9
  mov si, 1
  jmp [bp]

L738: ; Continuation
  Bare_enter_check(22)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L734
  mov [Temps+2], sp
  push word 12 ;; scanned
  push word si
  push word [CurrentCont]
  push word L737
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g7
  mov si, [Temps+2]
  jmp [bp]

L739: ; Continuation
  Bare_enter_check(16)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L738
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, si
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [bx+6]
  mov [Temps+6], ax
  mov si, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L740: ; Function: (lam,t1)
  Bare_enter_check(14)
  mov bx, [bp+10]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L718
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov ax, [bx+6]
  mov [Temps+10], ax
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L739
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, [Temps+4]
  mov ax, [bx+2]
  mov [Temps+12], ax
  mov ax, [bx+4]
  mov [Temps+14], ax
  mov ax, [bx+6]
  mov [Temps+16], ax
  mov si, [Temps+12]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L741: ; Arm: 869'9
  mov si, g249
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L742: ; Continuation
  Bare_enter_check(0)
  mov bp, si
  mov si, 1
  jmp [bp]

L743: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L742
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L744: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L743
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g38
  mov si, si
  jmp [bp]

L745: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L744
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L746: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L745
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov si, si
  jmp [bp]

L747: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L746
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, si
  mov si, g251
  jmp [bp]

L748: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L747
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L749: ; Continuation
  Bare_enter_check(16)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L748
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L750: ; Continuation
  Bare_enter_check(18)
  push word si
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L749
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bx, [bp+12]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L751: ; Continuation
  Bare_enter_check(16)
  mov bx, si
  cmp word [bx], 1
  jz L741
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L750
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov si, g250
  jmp [bp]

L752: ; Continuation
  Bare_enter_check(0)
  mov si, g242
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L753: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L752
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g38
  mov si, si
  jmp [bp]

L754: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L753
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L755: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L754
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L756: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L755
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, g241
  jmp [bp]

L757: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L756
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, g240
  jmp [bp]

L758: ; Arm: 613'9
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L757
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov si, g239
  jmp [bp]

L759: ; Continuation
  Bare_enter_check(0)
  mov si, g247
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L760: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L759
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g38
  mov si, si
  jmp [bp]

L761: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L760
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L762: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L761
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L763: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L762
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, g246
  jmp [bp]

L764: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L763
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, g245
  jmp [bp]

L765: ; Arm: 616'12
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L764
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, g244
  jmp [bp]

L766: ; Continuation
  Bare_enter_check(12)
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov bx, [bp+4]
  mov ax, [Temps+2]
  mov [bx], ax
  mov ax, Bare_unit
  mov [Temps+4], ax
  push word [bp+8]
  push word 3
  mov [Temps+6], sp
  push word 4 ;; scanned
  mov si, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L767: ; Continuation
  Bare_enter_check(26)
  push word g248
  push word 1
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word 3
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L766
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, si
  mov si, [Temps+4]
  jmp [bp]

L768: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L767
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+8]
  jmp [bp]

L769: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L768
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L770: ; Continuation
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L765
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [Temps+6]
  push word [Temps+4]
  push word [bp+10]
  push word [bp+8]
  push word [CurrentCont]
  push word L769
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, [Temps+4]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov ax, [bx+4]
  mov [Temps+10], ax
  mov ax, [bx+6]
  mov [Temps+12], ax
  mov si, [Temps+8]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L771: ; Arm: 559'10
  mov si, g243
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L772: ; Function: (lam,t1)
  Bare_enter_check(52)
  mov bx, [bp+10]
  mov ax, [bx]
  mov [Temps+2], ax
  push word [bp+12]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L751
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L758
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L770
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, [Temps+4]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov ax, [bx+6]
  mov [Temps+10], ax
  mov bx, [Temps+8]
  cmp word [bx], 1
  jz L771
  mov ax, [bx+2]
  mov [Temps+12], ax
  mov ax, [bx+4]
  mov [Temps+14], ax
  push word [Temps+10]
  push word [Temps+14]
  push word [Temps+6]
  push word 1
  mov [Temps+16], sp
  push word 8 ;; scanned
  push word [Temps+12]
  push word [Temps+16]
  push word 1
  mov [Temps+18], sp
  push word 6 ;; scanned
  push word [Temps+18]
  push word 3
  mov [Temps+20], sp
  push word 4 ;; scanned
  mov si, [Temps+20]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L773: ; Arm: 879'9
  mov si, g263
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L774: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L775: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L774
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L776: ; Continuation
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L773
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [bp+6]
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word [CurrentCont]
  push word L775
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov si, [Temps+4]
  jmp [bp]

L777: ; Continuation
  Bare_enter_check(0)
  mov si, g258
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L778: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L777
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g38
  mov si, si
  jmp [bp]

L779: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L778
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L780: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L779
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L781: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L780
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, g257
  jmp [bp]

L782: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L781
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, g256
  jmp [bp]

L783: ; Arm: 629'9
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L782
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, g255
  jmp [bp]

L784: ; Continuation
  Bare_enter_check(0)
  mov si, g262
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L785: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L784
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g38
  mov si, si
  jmp [bp]

L786: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L785
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L787: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L786
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L788: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L787
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, g261
  jmp [bp]

L789: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L788
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, g260
  jmp [bp]

L790: ; Arm: 633'12
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L789
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, g259
  jmp [bp]

L791: ; Continuation
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 1
  jz L790
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word 3
  mov [Temps+4], sp
  push word 4 ;; scanned
  mov si, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L792: ; Continuation
  Bare_enter_check(16)
  push word [bp+8]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L791
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L793: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L792
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L794: ; Continuation
  Bare_enter_check(24)
  mov bx, [bp+10]
  mov ax, [bx]
  mov [Temps+2], ax
  push word [bp+14]
  push word [bp+12]
  push word [CurrentCont]
  push word L776
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L783
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [bp+14]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L793
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, [Temps+4]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov ax, [bx+6]
  mov [Temps+10], ax
  mov si, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L795: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L794
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, g38
  mov si, si
  jmp [bp]

L796: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L795
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L797: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L796
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, [bp+16]
  mov si, si
  jmp [bp]

L798: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L797
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, si
  mov si, g254
  jmp [bp]

L799: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L798
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L800: ; Continuation
  Bare_enter_check(20)
  push word si
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L799
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov si, [bp+16]
  mov bp, [bp+8]
  jmp [bp]

L801: ; Function: (lam,t1)
  Bare_enter_check(20)
  push word si
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L800
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, [bp+4]
  mov si, g253
  jmp [bp]

L802: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L803: ; Continuation
  Bare_enter_check(14)
  push word [bp+6]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+8]
  push word [CurrentCont]
  push word L802
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov si, [Temps+2]
  jmp [bp]

L804: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L803
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g38
  mov si, si
  jmp [bp]

L805: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L804
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L806: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L805
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov si, si
  jmp [bp]

L807: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L806
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, [bp+14]
  mov si, si
  jmp [bp]

L808: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L807
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, [bp+16]
  mov si, si
  jmp [bp]

L809: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L808
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, si
  mov si, g267
  jmp [bp]

L810: ; Continuation
  Bare_enter_check(20)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L809
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L811: ; Continuation
  Bare_enter_check(22)
  push word si
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L810
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov si, [bp+14]
  mov bp, [bp+8]
  jmp [bp]

L812: ; Continuation
  Bare_enter_check(22)
  push word si
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L811
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov bp, [bp+6]
  mov si, g266
  jmp [bp]

L813: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L812
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L814: ; Continuation
  Bare_enter_check(20)
  push word si
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L813
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov si, [bp+12]
  mov bp, [bp+8]
  jmp [bp]

L815: ; Function: (lam,t1)
  Bare_enter_check(18)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L814
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, [bp+4]
  mov si, g265
  jmp [bp]

L816: ; Function: (lam,t1)
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L815
  mov [Temps+2], sp
  push word 12 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L817: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov si, si
  jmp [bp]

L818: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L817
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L819: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L818
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L820: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L819
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, g271
  jmp [bp]

L821: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L820
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, g270
  jmp [bp]

L822: ; Arm: 892'9
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L821
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov si, g269
  jmp [bp]

L823: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov si, si
  jmp [bp]

L824: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L823
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L825: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L824
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L826: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L825
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, g274
  jmp [bp]

L827: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L826
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, g273
  jmp [bp]

L828: ; Arm: 896'12
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L827
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, g272
  jmp [bp]

L829: ; Continuation
  Bare_enter_check(6)
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov bx, [bp+4]
  mov ax, [Temps+2]
  mov [bx], ax
  mov ax, Bare_unit
  mov [Temps+4], ax
  mov si, g276
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L830: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L829
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, g275
  jmp [bp]

L831: ; Continuation
  Bare_enter_check(16)
  push word [bp+6]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L830
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L832: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L831
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+10]
  mov bp, [bp+4]
  jmp [bp]

L833: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L832
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+12]
  jmp [bp]

L834: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L833
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g79
  mov si, si
  jmp [bp]

L835: ; Continuation
  Bare_enter_check(40)
  mov bx, si
  cmp word [bx], 1
  jz L828
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [Temps+6]
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [CurrentCont]
  push word L834
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, [bp+14]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov ax, [bx+4]
  mov [Temps+10], ax
  mov ax, [bx+6]
  mov [Temps+12], ax
  push word [bp+12]
  push word 1
  mov [Temps+14], sp
  push word 4 ;; scanned
  push word [Temps+10]
  push word [Temps+14]
  push word 3
  mov [Temps+16], sp
  push word 6 ;; scanned
  push word [Temps+12]
  push word [Temps+16]
  push word [Temps+8]
  push word 1
  mov [Temps+18], sp
  push word 8 ;; scanned
  mov si, [Temps+18]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L836: ; Continuation
  Bare_enter_check(26)
  push word [bp+12]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L835
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L837: ; Continuation
  Bare_enter_check(20)
  push word si
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L836
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L838: ; Function: (lam,t1)
  Bare_enter_check(20)
  mov bx, [bp+10]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L822
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [Temps+4]
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L837
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bx, [Temps+4]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov ax, [bx+6]
  mov [Temps+10], ax
  mov si, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L839: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov si, si
  jmp [bp]

L840: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L839
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L841: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L840
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L842: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L841
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, g280
  jmp [bp]

L843: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L842
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, g279
  jmp [bp]

L844: ; Arm: 910'9
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L843
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov si, g278
  jmp [bp]

L845: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov si, si
  jmp [bp]

L846: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L845
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L847: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L846
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L848: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L847
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, g283
  jmp [bp]

L849: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L848
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, g282
  jmp [bp]

L850: ; Arm: 914'12
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L849
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, g281
  jmp [bp]

L851: ; Continuation
  Bare_enter_check(0)
  mov bx, si
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L852: ; Function: (lam,t1)
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L851
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+2]
  mov si, si
  jmp [bp]

L853: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov si, si
  jmp [bp]

L854: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L853
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L855: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L854
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L856: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L855
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, 1
  jmp [bp]

L857: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L856
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L858: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L857
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov si, si
  jmp [bp]

L859: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L858
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+10]
  jmp [bp]

L860: ; Continuation
  Bare_enter_check(22)
  push word [bp+8]
  push word L852
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word si
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L859
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g2
  mov si, [Temps+2]
  jmp [bp]

L861: ; Continuation
  Bare_enter_check(16)
  mov bx, si
  cmp word [bx], 1
  jz L850
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [Temps+6]
  push word [Temps+4]
  push word [bp+12]
  push word [bp+10]
  push word [bp+4]
  push word [CurrentCont]
  push word L860
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, [bp+8]
  mov si, g284
  jmp [bp]

L862: ; Continuation
  Bare_enter_check(22)
  push word [bp+14]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L861
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L863: ; Continuation
  Bare_enter_check(18)
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L862
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, [bp+14]
  mov si, si
  jmp [bp]

L864: ; Function: (lam,t1)
  Bare_enter_check(20)
  mov bx, [bp+14]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L844
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word si
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L863
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bx, [Temps+4]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov ax, [bx+6]
  mov [Temps+10], ax
  mov si, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L865: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov si, si
  jmp [bp]

L866: ; Arm: 958'36
  push word [CurrentCont]
  push word L865
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, g288
  jmp [bp]

L867: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov bp, [bp+6]
  mov si, [Temps+2]
  jmp [bp]

L868: ; Arm: 942'7
  mov si, g291
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L869: ; Arm: 718'9
  mov si, g292
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L870: ; Arm: 722'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L871: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L870
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L872: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L871
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L873: ; Function: (loop,t3)
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L869
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [Temps+8]
  push word [Temps+4]
  push word bp
  push word [bp+4]
  push word [CurrentCont]
  push word L872
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov si, [Temps+6]
  jmp [bp]

L874: ; Continuation
  Bare_enter_check(0)
  mov bp, g38
  mov si, si
  jmp [bp]

L875: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L874
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L876: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L875
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L877: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L876
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, g295
  jmp [bp]

L878: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L877
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L879: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L878
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov si, g294
  jmp [bp]

L880: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L879
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, g293
  jmp [bp]

L881: ; Arm: 945'12
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L880
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L882: ; Continuation
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 1
  jz L881
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov si, [bp+10]
  mov bp, [Temps+4]
  jmp [bp]

L883: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L882
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov si, si
  jmp [bp]

L884: ; Continuation
  Bare_enter_check(34)
  push word [bp+14]
  push word [bp+12]
  push word [CurrentCont]
  push word L867
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 1
  jz L868
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+2]
  push word [bp+8]
  push word L873
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L883
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, [bp+10]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov si, [Temps+8]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L885: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L884
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+16]
  jmp [bp]

L886: ; Continuation
  Bare_enter_check(20)
  push word si
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L885
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, g20
  mov si, g290
  jmp [bp]

L887: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L886
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, [bp+16]
  mov si, si
  jmp [bp]

L888: ; Continuation
  Bare_enter_check(20)
  push word si
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L887
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov si, [bp+16]
  mov bp, [bp+4]
  jmp [bp]

L889: ; Continuation
  Bare_enter_check(20)
  mov bx, si
  cmp word [bx], 3
  jz L866
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L888
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, [bp+10]
  mov si, g289
  jmp [bp]

L890: ; Continuation
  Bare_enter_check(22)
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L889
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+12]
  jmp [bp]

L891: ; Continuation
  Bare_enter_check(24)
  push word si
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L890
  mov [CurrentCont], sp
  push word 22 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L892: ; Continuation
  Bare_enter_check(22)
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L891
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov bp, [bp+14]
  mov si, g287
  jmp [bp]

L893: ; Continuation
  Bare_enter_check(24)
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L892
  mov [CurrentCont], sp
  push word 22 ;; scanned
  mov bp, g38
  mov si, si
  jmp [bp]

L894: ; Continuation
  Bare_enter_check(24)
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L893
  mov [CurrentCont], sp
  push word 22 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L895: ; Continuation
  Bare_enter_check(24)
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L894
  mov [CurrentCont], sp
  push word 22 ;; scanned
  mov bp, si
  mov si, g286
  jmp [bp]

L896: ; Continuation
  Bare_enter_check(24)
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L895
  mov [CurrentCont], sp
  push word 22 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L897: ; Function: (repl,t14)
  Bare_enter_check(24)
  push word bp
  push word si
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L896
  mov [CurrentCont], sp
  push word 22 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L898: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, 3
  jmp [bp]

L899: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L898
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g38
  mov si, si
  jmp [bp]

L900: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L899
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L901: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L900
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L902: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L901
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, si
  mov si, g300
  jmp [bp]

L903: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L902
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L904: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L903
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+10]
  jmp [bp]

L905: ; Continuation
  Bare_enter_check(16)
  push word si
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L904
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, [bp+8]
  mov si, g299
  jmp [bp]

L906: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L905
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov si, g298
  jmp [bp]

L907: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L906
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g38
  mov si, si
  jmp [bp]

L908: ; Continuation
  Bare_enter_check(16)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L907
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov si, g297
  jmp [bp]

L909: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L908
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov si, si
  jmp [bp]

L910: ; Continuation
  Bare_enter_check(16)
  push word si
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L909
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, [bp+10]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L911: ; Continuation
  Bare_enter_check(138)
  push word g285
  push word si
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word [bp+40]
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [Temps+4]
  push word [bp+38]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word [bp+36]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [Temps+8]
  push word [bp+34]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [Temps+10]
  push word [bp+32]
  push word 3
  mov [Temps+12], sp
  push word 6 ;; scanned
  push word [Temps+12]
  push word [bp+30]
  push word 3
  mov [Temps+14], sp
  push word 6 ;; scanned
  push word [Temps+14]
  push word [bp+28]
  push word 3
  mov [Temps+16], sp
  push word 6 ;; scanned
  push word [Temps+16]
  push word [bp+26]
  push word 3
  mov [Temps+18], sp
  push word 6 ;; scanned
  push word [Temps+18]
  push word [bp+24]
  push word 3
  mov [Temps+20], sp
  push word 6 ;; scanned
  push word [Temps+20]
  push word [bp+22]
  push word 3
  mov [Temps+22], sp
  push word 6 ;; scanned
  push word [Temps+22]
  push word [bp+20]
  push word 3
  mov [Temps+24], sp
  push word 6 ;; scanned
  push word [Temps+24]
  push word 1
  mov [Temps+26], sp
  push word 4 ;; scanned
  push word [Temps+26]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L897
  mov [Temps+28], sp
  push word 18 ;; scanned
  push word [Temps+28]
  push word [Temps+26]
  push word [bp+12]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L910
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g82
  mov si, g296
  jmp [bp]

L912: ; Continuation
  Bare_enter_check(62)
  push word [bp+26]
  push word [bp+24]
  push word [bp+22]
  push word [bp+16]
  push word [bp+12]
  push word [bp+6]
  push word [bp+4]
  push word L864
  mov [Temps+2], sp
  push word 16 ;; scanned
  push word [bp+48]
  push word [bp+46]
  push word [bp+44]
  push word [bp+42]
  push word [bp+40]
  push word [bp+38]
  push word [bp+36]
  push word [bp+34]
  push word [bp+32]
  push word [bp+30]
  push word [bp+28]
  push word [bp+20]
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L911
  mov [CurrentCont], sp
  push word 42 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L913: ; Continuation
  Bare_enter_check(52)
  push word si
  push word [bp+48]
  push word [bp+46]
  push word [bp+44]
  push word [bp+42]
  push word [bp+40]
  push word [bp+38]
  push word [bp+36]
  push word [bp+34]
  push word [bp+32]
  push word [bp+30]
  push word [bp+26]
  push word [bp+24]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L912
  mov [CurrentCont], sp
  push word 50 ;; scanned
  mov bp, [bp+28]
  mov si, g277
  jmp [bp]

L914: ; Continuation
  Bare_enter_check(66)
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
  push word [bp+6]
  push word [bp+4]
  push word L838
  mov [Temps+2], sp
  push word 12 ;; scanned
  push word [bp+50]
  push word [bp+48]
  push word [bp+46]
  push word [bp+44]
  push word [bp+42]
  push word [bp+40]
  push word [bp+38]
  push word [bp+36]
  push word [bp+34]
  push word [bp+32]
  push word [bp+30]
  push word [bp+28]
  push word [bp+24]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L913
  mov [CurrentCont], sp
  push word 50 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L915: ; Continuation
  Bare_enter_check(54)
  push word si
  push word [bp+48]
  push word [bp+46]
  push word [bp+44]
  push word [bp+42]
  push word [bp+40]
  push word [bp+38]
  push word [bp+36]
  push word [bp+34]
  push word [bp+32]
  push word [bp+30]
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L914
  mov [CurrentCont], sp
  push word 52 ;; scanned
  mov bp, [bp+30]
  mov si, g268
  jmp [bp]

L916: ; Continuation
  Bare_enter_check(64)
  push word [bp+32]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L816
  mov [Temps+2], sp
  push word 10 ;; scanned
  push word [bp+50]
  push word [bp+48]
  push word [bp+46]
  push word [bp+44]
  push word [bp+42]
  push word [bp+40]
  push word [bp+38]
  push word [bp+36]
  push word [bp+34]
  push word [bp+30]
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L915
  mov [CurrentCont], sp
  push word 50 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L917: ; Continuation
  Bare_enter_check(54)
  push word si
  push word [bp+50]
  push word [bp+48]
  push word [bp+46]
  push word [bp+44]
  push word [bp+42]
  push word [bp+40]
  push word [bp+38]
  push word [bp+36]
  push word [bp+34]
  push word [bp+30]
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L916
  mov [CurrentCont], sp
  push word 52 ;; scanned
  mov bp, [bp+32]
  mov si, g264
  jmp [bp]

L918: ; Continuation
  Bare_enter_check(70)
  push word [bp+34]
  push word [bp+28]
  push word [bp+24]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L801
  mov [Temps+2], sp
  push word 14 ;; scanned
  push word [bp+50]
  push word [bp+48]
  push word [bp+46]
  push word [bp+44]
  push word [bp+42]
  push word [bp+40]
  push word [bp+38]
  push word [bp+36]
  push word [bp+34]
  push word [bp+32]
  push word [bp+30]
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L917
  mov [CurrentCont], sp
  push word 52 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L919: ; Continuation
  Bare_enter_check(54)
  push word si
  push word [bp+48]
  push word [bp+46]
  push word [bp+44]
  push word [bp+42]
  push word [bp+40]
  push word [bp+38]
  push word [bp+36]
  push word [bp+34]
  push word [bp+32]
  push word [bp+30]
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L918
  mov [CurrentCont], sp
  push word 52 ;; scanned
  mov bp, [bp+30]
  mov si, g252
  jmp [bp]

L920: ; Continuation
  Bare_enter_check(68)
  push word [bp+34]
  push word [bp+28]
  push word [bp+26]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L772
  mov [Temps+2], sp
  push word 14 ;; scanned
  push word [bp+48]
  push word [bp+46]
  push word [bp+44]
  push word [bp+42]
  push word [bp+40]
  push word [bp+38]
  push word [bp+36]
  push word [bp+34]
  push word [bp+32]
  push word [bp+30]
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L919
  mov [CurrentCont], sp
  push word 50 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L921: ; Continuation
  Bare_enter_check(52)
  push word si
  push word [bp+48]
  push word [bp+46]
  push word [bp+44]
  push word [bp+42]
  push word [bp+40]
  push word [bp+38]
  push word [bp+36]
  push word [bp+34]
  push word [bp+32]
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L920
  mov [CurrentCont], sp
  push word 50 ;; scanned
  mov bp, [bp+30]
  mov si, g238
  jmp [bp]

L922: ; Continuation
  Bare_enter_check(66)
  push word [bp+28]
  push word [bp+24]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L740
  mov [Temps+2], sp
  push word 12 ;; scanned
  push word [bp+48]
  push word [bp+46]
  push word [bp+44]
  push word [bp+42]
  push word [bp+40]
  push word [bp+38]
  push word [bp+36]
  push word [bp+34]
  push word [bp+32]
  push word [bp+30]
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L921
  mov [CurrentCont], sp
  push word 50 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L923: ; Continuation
  Bare_enter_check(52)
  push word si
  push word [bp+46]
  push word [bp+44]
  push word [bp+42]
  push word [bp+40]
  push word [bp+38]
  push word [bp+36]
  push word [bp+34]
  push word [bp+32]
  push word [bp+30]
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L922
  mov [CurrentCont], sp
  push word 50 ;; scanned
  mov bp, [bp+30]
  mov si, g230
  jmp [bp]

L924: ; Continuation
  Bare_enter_check(66)
  push word [bp+28]
  push word [bp+24]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L712
  mov [Temps+2], sp
  push word 14 ;; scanned
  push word [bp+46]
  push word [bp+44]
  push word [bp+42]
  push word [bp+40]
  push word [bp+38]
  push word [bp+36]
  push word [bp+34]
  push word [bp+32]
  push word [bp+30]
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L923
  mov [CurrentCont], sp
  push word 48 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L925: ; Continuation
  Bare_enter_check(50)
  push word si
  push word [bp+44]
  push word [bp+42]
  push word [bp+40]
  push word [bp+38]
  push word [bp+36]
  push word [bp+34]
  push word [bp+32]
  push word [bp+30]
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L924
  mov [CurrentCont], sp
  push word 48 ;; scanned
  mov bp, [bp+30]
  mov si, g199
  jmp [bp]

L926: ; Continuation
  Bare_enter_check(58)
  push word [bp+28]
  push word [bp+6]
  push word [bp+4]
  push word L615
  mov [Temps+2], sp
  push word 8 ;; scanned
  push word [bp+44]
  push word [bp+42]
  push word [bp+40]
  push word [bp+38]
  push word [bp+36]
  push word [bp+34]
  push word [bp+32]
  push word [bp+30]
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L925
  mov [CurrentCont], sp
  push word 46 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L927: ; Continuation
  Bare_enter_check(48)
  push word si
  push word [bp+42]
  push word [bp+40]
  push word [bp+38]
  push word [bp+36]
  push word [bp+34]
  push word [bp+32]
  push word [bp+30]
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L926
  mov [CurrentCont], sp
  push word 46 ;; scanned
  mov bp, [bp+30]
  mov si, g194
  jmp [bp]

L928: ; Continuation
  Bare_enter_check(64)
  push word [bp+28]
  push word [bp+24]
  push word [bp+22]
  push word [bp+16]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word L608
  mov [Temps+2], sp
  push word 16 ;; scanned
  push word [bp+42]
  push word [bp+40]
  push word [bp+38]
  push word [bp+36]
  push word [bp+34]
  push word [bp+32]
  push word [bp+30]
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L927
  mov [CurrentCont], sp
  push word 44 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L929: ; Continuation
  Bare_enter_check(46)
  push word si
  push word [bp+40]
  push word [bp+38]
  push word [bp+36]
  push word [bp+34]
  push word [bp+32]
  push word [bp+30]
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L928
  mov [CurrentCont], sp
  push word 44 ;; scanned
  mov bp, [bp+30]
  mov si, g176
  jmp [bp]

L930: ; Continuation
  Bare_enter_check(60)
  push word [bp+32]
  push word [bp+30]
  push word [bp+24]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L560
  mov [Temps+2], sp
  push word 14 ;; scanned
  push word [bp+44]
  push word [bp+42]
  push word [bp+40]
  push word [bp+38]
  push word [bp+36]
  push word [bp+34]
  push word [bp+32]
  push word [bp+30]
  push word [bp+28]
  push word [bp+26]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L929
  mov [CurrentCont], sp
  push word 42 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L931: ; Continuation
  Bare_enter_check(48)
  push word si
  push word [bp+42]
  push word [bp+40]
  push word [bp+38]
  push word [bp+36]
  push word [bp+34]
  push word [bp+32]
  push word [bp+30]
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L930
  mov [CurrentCont], sp
  push word 46 ;; scanned
  mov bp, [bp+34]
  mov si, g169
  jmp [bp]

L932: ; Continuation
  Bare_enter_check(52)
  push word [bp+4]
  push word L542
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+42]
  push word [bp+40]
  push word [bp+38]
  push word [bp+36]
  push word [bp+34]
  push word [bp+32]
  push word [bp+30]
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L931
  mov [CurrentCont], sp
  push word 44 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L933: ; Continuation
  Bare_enter_check(46)
  push word si
  push word [bp+40]
  push word [bp+38]
  push word [bp+36]
  push word [bp+34]
  push word [bp+32]
  push word [bp+30]
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L932
  mov [CurrentCont], sp
  push word 44 ;; scanned
  mov bp, [bp+34]
  mov si, g160
  jmp [bp]

L934: ; Continuation
  Bare_enter_check(44)
  push word [bp+40]
  push word [bp+38]
  push word [bp+36]
  push word [bp+34]
  push word [bp+32]
  push word [bp+30]
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L933
  mov [CurrentCont], sp
  push word 42 ;; scanned
  mov bp, si
  mov si, g159
  jmp [bp]

L935: ; Continuation
  Bare_enter_check(122)
  push word [bp+30]
  push word [bp+20]
  push word [bp+4]
  push word L276
  mov [Temps+2], sp
  push word 8 ;; scanned
  mov ax, [Temps+2]
  mov [Temps+4], ax
  push word si
  push word [bp+30]
  push word [bp+28]
  push word [bp+22]
  push word [bp+6]
  push word L292
  mov [Temps+6], sp
  push word 12 ;; scanned
  mov ax, [Temps+6]
  mov [Temps+8], ax
  push word g81
  mov [Temps+10], sp
  push word 2 ;; scanned
  push word [bp+8]
  push word [bp+4]
  push word L305
  mov [Temps+12], sp
  push word 6 ;; scanned
  mov ax, [Temps+12]
  mov [Temps+14], ax
  push word [bp+12]
  push word [bp+8]
  push word [bp+4]
  push word L339
  mov [Temps+16], sp
  push word 8 ;; scanned
  mov ax, [Temps+16]
  mov [Temps+18], ax
  push word [bp+12]
  push word [bp+8]
  push word [bp+4]
  push word L395
  mov [Temps+20], sp
  push word 8 ;; scanned
  mov ax, [Temps+20]
  mov [Temps+22], ax
  push word [Temps+10]
  push word [Temps+8]
  push word [Temps+4]
  push word [bp+32]
  push word [bp+28]
  push word [bp+26]
  push word [bp+20]
  push word [bp+8]
  push word [bp+4]
  push word L524
  mov [Temps+24], sp
  push word 20 ;; scanned
  push word [Temps+24]
  push word [Temps+22]
  push word [Temps+18]
  push word [Temps+14]
  push word [Temps+10]
  push word [Temps+8]
  push word [Temps+4]
  push word [bp+30]
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L934
  mov [CurrentCont], sp
  push word 42 ;; scanned
  mov bp, [Temps+14]
  mov si, g152
  jmp [bp]

L936: ; Continuation
  Bare_enter_check(88)
  push word [bp+14]
  push word L227
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [Temps+4], ax
  push word [bp+10]
  push word [bp+8]
  push word L232
  mov [Temps+6], sp
  push word 6 ;; scanned
  mov ax, [Temps+6]
  mov [Temps+8], ax
  push word [bp+24]
  push word L239
  mov [Temps+10], sp
  push word 4 ;; scanned
  mov ax, [Temps+10]
  mov [Temps+12], ax
  push word [bp+22]
  push word L244
  mov [Temps+14], sp
  push word 4 ;; scanned
  mov ax, [Temps+14]
  mov [Temps+16], ax
  push word [Temps+16]
  push word [Temps+12]
  push word [bp+24]
  push word L253
  mov [Temps+18], sp
  push word 8 ;; scanned
  mov ax, [Temps+18]
  mov [Temps+20], ax
  push word g74
  push word `\x00`
  push word 3
  mov [Temps+22], sp
  push word 6 ;; scanned
  push word [Temps+22]
  push word `\x00`
  push word 3
  mov [Temps+24], sp
  push word 6 ;; scanned
  push word [Temps+20]
  push word [Temps+16]
  push word [Temps+12]
  push word [Temps+4]
  push word si
  push word [bp+24]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L935
  mov [CurrentCont], sp
  push word 34 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+24]
  jmp [bp]

L937: ; Start
  Bare_enter_check(84)
  mov ax, g22
  mov [Temps+2], ax
  mov ax, g24
  mov [Temps+4], ax
  push word [Temps+4]
  push word [Temps+2]
  push word L155
  mov [Temps+6], sp
  push word 6 ;; scanned
  mov ax, [Temps+6]
  mov [Temps+8], ax
  push word [Temps+4]
  push word L162
  mov [Temps+10], sp
  push word 4 ;; scanned
  mov ax, [Temps+10]
  mov [Temps+12], ax
  push word [Temps+2]
  push word L165
  mov [Temps+14], sp
  push word 4 ;; scanned
  mov ax, [Temps+14]
  mov [Temps+16], ax
  push word g40
  mov [Temps+18], sp
  push word 2 ;; scanned
  push word [Temps+18]
  push word [Temps+8]
  push word [Temps+2]
  push word L172
  mov [Temps+20], sp
  push word 8 ;; scanned
  mov ax, [Temps+20]
  mov [Temps+22], ax
  mov ax, g45
  mov [Temps+24], ax
  mov ax, g53
  mov [Temps+26], ax
  push word [Temps+4]
  push word [Temps+2]
  push word L193
  mov [Temps+28], sp
  push word 6 ;; scanned
  mov ax, [Temps+28]
  mov [Temps+30], ax
  push word [Temps+24]
  push word L210
  mov [Temps+32], sp
  push word 4 ;; scanned
  mov ax, g62
  mov [Temps+34], ax
  mov ax, g66
  mov [Temps+36], ax
  push word g67
  push word `\x04`
  push word 3
  mov [Temps+38], sp
  push word 6 ;; scanned
  push word [Temps+36]
  push word [Temps+34]
  push word [Temps+32]
  push word [Temps+30]
  push word [Temps+26]
  push word [Temps+24]
  push word [Temps+16]
  push word [Temps+12]
  push word [Temps+8]
  push word [Temps+4]
  push word [Temps+2]
  push word [CurrentCont]
  push word L936
  mov [CurrentCont], sp
  push word 26 ;; scanned
  mov bp, [Temps+4]
  mov si, [Temps+38]
  jmp [bp]

g1:
  dw L3
g2:
  dw L9
g3:
  dw 1
g4:
  dw L17
g5:
  dw 1
g6:
  dw L25
g7:
  dw L30
g8:
  dw 1
g9:
  dw L35
g10:
  dw 1
g11:
  dw L43
g12:
  dw 1
g13:
  dw 3
g14:
  dw 1
g15:
  dw 1
g17:
  dw 1
g18:
  dw 3
g19:
  dw 1
g20:
  dw L47
g21:
  dw 1
g22:
  dw L53
g23:
  dw 1
g24:
  dw L61
g25:
  dw 1
g26:
  dw L65
g27:
  dw 1
g28:
  dw 1
g29:
  dw 1
g30:
  dw L77
g31:
  dw 1
g32:
  dw 3
g33:
  dw 1
g34:
  dw 3
g35:
  dw 1
g36:
  dw 1
g37:
  dw 1
g38:
  dw L83
g39:
  dw 1
g40:
  dw 1
g41:
  dw 15
  db `trace: `
g42:
  dw 3
  db `\n`
g43:
  dw 1
g44:
  dw 1
g45:
  dw L91
g46:
  dw 1
g47:
  dw 3
g48:
  dw 1
g49:
  dw 3
g50:
  dw 1
g51:
  dw 3
g52:
  dw 1
g53:
  dw L101
g54:
  dw 1
g55:
  dw 1
g56:
  dw 1
g57:
  dw 1
  db ``
g58:
  dw 1
g59:
  dw 1
g60:
  dw 3
g61:
  dw 1
g62:
  dw L109
g63:
  dw 1
g64:
  dw 3
g65:
  dw 1
g66:
  dw L116
g67:
  dw 1
g68:
  dw 1
g69:
  dw 1
g70:
  dw 3
g71:
  dw 1
g72:
  dw 3
  db `[`
g73:
  dw 3
  db `]`
g74:
  dw 1
g75:
  dw 1
g76:
  dw 1
g77:
  dw 1
g78:
  dw L117
g79:
  dw L122
g80:
  dw L124
g81:
  dw 1
g82:
  dw L129
g83:
  dw 1
g84:
  dw 15
  db `usage: `
g85:
  dw 21
  db ` [no args]`
g86:
  dw 15
  db `Error: `
g87:
  dw 3
  db `\n`
g88:
  dw 1
g89:
  dw 15
  db `usage: `
g90:
  dw 13
  db ` [int]`
g91:
  dw 15
  db `Error: `
g92:
  dw 3
  db `\n`
g93:
  dw 15
  db `usage: `
g94:
  dw 13
  db ` [int]`
g95:
  dw 15
  db `Error: `
g96:
  dw 3
  db `\n`
g97:
  dw 15
  db `usage: `
g98:
  dw 13
  db ` [int]`
g99:
  dw 15
  db `Error: `
g100:
  dw 3
  db `\n`
g101:
  dw 15
  db `usage: `
g102:
  dw 25
  db ` [int] [int]`
g103:
  dw 15
  db `Error: `
g104:
  dw 3
  db `\n`
g105:
  dw 15
  db `usage: `
g106:
  dw 25
  db ` [int] [int]`
g107:
  dw 15
  db `Error: `
g108:
  dw 3
  db `\n`
g109:
  dw 15
  db `usage: `
g110:
  dw 25
  db ` [int] [int]`
g111:
  dw 15
  db `Error: `
g112:
  dw 3
  db `\n`
g113:
  dw 15
  db `usage: `
g114:
  dw 25
  db ` [int] [int]`
g115:
  dw 15
  db `Error: `
g116:
  dw 3
  db `\n`
g117:
  dw 15
  db `usage: `
g118:
  dw 25
  db ` [int] [int]`
g119:
  dw 15
  db `Error: `
g120:
  dw 3
  db `\n`
g121:
  dw 1
g122:
  dw 1
g123:
  dw 3
  db `\n`
g124:
  dw 15
  db `Error: `
g125:
  dw 65
  db `no filesystem mounted; try mount`
g126:
  dw 3
  db `\n`
g127:
  dw 15
  db `Error: `
g128:
  dw 75
  db `inode is not allocated (no such file)`
g129:
  dw 3
  db `\n`
g130:
  dw 1
g131:
  dw 1
g132:
  dw 1
g133:
  dw 15
  db `Error: `
g134:
  dw 69
  db `no blocks available (disk is full)`
g135:
  dw 3
  db `\n`
g136:
  dw 1
g137:
  dw 1
g138:
  dw 1
  db ``
g139:
  dw 1
g140:
  dw 1
  db ``
g141:
  dw 1
g142:
  dw 1
g143:
  dw 15
  db `Error: `
g144:
  dw 69
  db `no blocks available (disk is full)`
g145:
  dw 3
  db `\n`
g146:
  dw 1
g147:
  dw 3
g148:
  dw 1
g149:
  dw 1
g150:
  dw 1
g151:
  dw 1
g152:
  dw 9
  db `wipe`
g153:
  dw 1
g154:
  dw 3
g155:
  dw 1
g156:
  dw 1
g157:
  dw 3
g158:
  dw 1
g159:
  dw L139
g160:
  dw 9
  db `dump`
g161:
  dw 1
g162:
  dw 3
g163:
  dw 1
g164:
  dw 1
g165:
  dw 3
g166:
  dw 1
g167:
  dw 5
  db `\\n`
g168:
  dw 1
g169:
  dw 13
  db `format`
g170:
  dw 15
  db `Error: `
g171:
  dw 95
  db `cannot format a mounted filesystem; try unmount`
g172:
  dw 3
  db `\n`
g173:
  dw 9
  db `BARE`
g174:
  dw 1
g175:
  dw 1
g176:
  dw 11
  db `mount`
g177:
  dw 15
  db `Error: `
g178:
  dw 53
  db `filesystem already mounted`
g179:
  dw 3
  db `\n`
g180:
  dw 9
  db `BARE`
g181:
  dw 1
g182:
  dw 3
g183:
  dw 1
g184:
  dw 1
g185:
  dw 1
g186:
  dw 1
g187:
  dw 3
g188:
  dw L146
g189:
  dw L147
g190:
  dw 1
g191:
  dw 15
  db `Error: `
g192:
  dw 63
  db `no filesystem found; try format`
g193:
  dw 3
  db `\n`
g194:
  dw 15
  db `unmount`
g195:
  dw 15
  db `Error: `
g196:
  dw 65
  db `no filesystem mounted; try mount`
g197:
  dw 3
  db `\n`
g198:
  dw 1
g199:
  dw 11
  db `debug`
g200:
  dw 15
  db `Error: `
g201:
  dw 65
  db `no filesystem mounted; try mount`
g202:
  dw 3
  db `\n`
g203:
  dw 37
  db `Filesystem found:\n`
g204:
  dw 19
  db `- super: `
g205:
  dw 3
  db `/`
g206:
  dw 3
  db `/`
g207:
  dw 3
  db `\n`
g208:
  dw 33
  db `- free blocks = `
g209:
  dw 3
  db `,`
g210:
  dw 3
  db `B`
g211:
  dw 3
  db `\n`
g212:
  dw 33
  db `- free inodes = `
g213:
  dw 3
  db `,`
g214:
  dw 3
  db `I`
g215:
  dw 3
  db `\n`
g216:
  dw 21
  db `- inodes:\n`
g217:
  dw 1
g218:
  dw 3
g219:
  dw 5
  db `- `
g220:
  dw 3
  db `I`
g221:
  dw 7
  db ` : `
g222:
  dw 23
  db `unallocated`
g223:
  dw 25
  db `Inode: size=`
g224:
  dw 21
  db `, blocks=[`
g225:
  dw 3
  db `,`
g226:
  dw 3
  db `B`
g227:
  dw 3
  db `]`
g228:
  dw 3
  db `\n`
g229:
  dw 1
g230:
  dw 5
  db `ls`
g231:
  dw 15
  db `Error: `
g232:
  dw 65
  db `no filesystem mounted; try mount`
g233:
  dw 3
  db `\n`
g234:
  dw 1
g235:
  dw 11
  db `file#`
g236:
  dw 7
  db ` : `
g237:
  dw 3
  db `\n`
g238:
  dw 13
  db `create`
g239:
  dw 15
  db `Error: `
g240:
  dw 65
  db `no filesystem mounted; try mount`
g241:
  dw 3
  db `\n`
g242:
  dw 1
g243:
  dw 1
g244:
  dw 15
  db `Error: `
g245:
  dw 73
  db `no inodes available (too many files)`
g246:
  dw 3
  db `\n`
g247:
  dw 1
g248:
  dw 1
g249:
  dw 1
g250:
  dw 29
  db `Creating file#`
g251:
  dw 45
  db `; (to finish type ^D)\n`
g252:
  dw 13
  db `append`
g253:
  dw 37
  db `Appending to file#`
g254:
  dw 45
  db `; (to finish type ^D)\n`
g255:
  dw 15
  db `Error: `
g256:
  dw 65
  db `no filesystem mounted; try mount`
g257:
  dw 3
  db `\n`
g258:
  dw 1
g259:
  dw 15
  db `Error: `
g260:
  dw 75
  db `inode is not allocated (no such file)`
g261:
  dw 3
  db `\n`
g262:
  dw 1
g263:
  dw 1
g264:
  dw 11
  db `splat`
g265:
  dw 35
  db `Overwriting file#`
g266:
  dw 27
  db ` from offset `
g267:
  dw 45
  db `; (to finish type ^D)\n`
g268:
  dw 5
  db `rm`
g269:
  dw 15
  db `Error: `
g270:
  dw 65
  db `no filesystem mounted; try mount`
g271:
  dw 3
  db `\n`
g272:
  dw 15
  db `Error: `
g273:
  dw 75
  db `inode is not allocated (no such file)`
g274:
  dw 3
  db `\n`
g275:
  dw 1
g276:
  dw 1
g277:
  dw 7
  db `cat`
g278:
  dw 15
  db `Error: `
g279:
  dw 65
  db `no filesystem mounted; try mount`
g280:
  dw 3
  db `\n`
g281:
  dw 15
  db `Error: `
g282:
  dw 75
  db `inode is not allocated (no such file)`
g283:
  dw 3
  db `\n`
g284:
  dw 1
  db ``
g285:
  dw 1
g286:
  dw 5
  db `> `
g287:
  dw 1
g288:
  dw 17
  db `exiting\n`
g289:
  dw 1
g290:
  dw 1
g291:
  dw 1
g292:
  dw 1
g293:
  dw 41
  db ` : command not found`
g294:
  dw 15
  db `Error: `
g295:
  dw 3
  db `\n`
g296:
  dw 1
g297:
  dw 41
  db `Filesystem explorer\n`
g298:
  dw 21
  db `Commands: `
g299:
  dw 3
  db ` `
g300:
  dw 3
  db `\n`

bare_start: jmp L937
