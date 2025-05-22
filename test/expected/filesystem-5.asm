L1: ; Arm: 23'7
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

L4: ; Arm: 28'7
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

L10: ; Arm: 33'7
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

L13: ; Arm: 34'20
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

L18: ; Arm: 38'7
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

L26: ; Arm: 43'7
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

L31: ; Arm: 47'11
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

L36: ; Arm: 50'12
  mov si, g14
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L37: ; Arm: 52'9
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

L41: ; Arm: 12'9
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

L44: ; Arm: 63'7
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

L48: ; Arm: 81'13
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

L53: ; Function: (explode,g22)
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

L54: ; Arm: 90'9
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

L61: ; Function: (implode,g24)
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L60
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g1
  mov si, si
  jmp [bp]

L62: ; Continuation
  Bare_enter_check(0)
  mov bp, g24
  mov si, si
  jmp [bp]

L63: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L62
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L64: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L63
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L65: ; Continuation
  Bare_enter_check(10)
  push word [bp+4]
  push word si
  push word [CurrentCont]
  push word L64
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g20
  mov si, g25
  jmp [bp]

L66: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L65
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g20
  mov si, si
  jmp [bp]

L67: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L66
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g22
  jmp [bp]

L68: ; Function: (lam,t1)
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L67
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+2]
  mov bp, g22
  jmp [bp]

L69: ; Function: (^,g26)
  Bare_enter_check(6)
  push word si
  push word L68
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L70: ; Arm: 108'13
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L71: ; Continuation
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

L72: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L70
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
  push word L71
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g27
  mov si, [Temps+10]
  jmp [bp]

L73: ; Function: (loop,g27)
  Bare_enter_check(6)
  push word si
  push word L72
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L74: ; Continuation
  Bare_enter_check(0)
  mov bp, g24
  mov si, si
  jmp [bp]

L75: ; Arm: 111'11
  push word g28
  push word `0`
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  mov si, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L76: ; Continuation
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

L77: ; Continuation
  Bare_enter_check(6)
  mov ax, 1
  mov bx, [bp+4]
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  push word [CurrentCont]
  push word L76
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L78: ; Arm: 112'13
  push word si
  push word [CurrentCont]
  push word L77
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g27
  mov si, g29
  jmp [bp]

L79: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L80: ; Function: (sofi,g31)
  Bare_enter_check(14)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  push word [CurrentCont]
  push word L74
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L75
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L78
  push word si
  push word [CurrentCont]
  push word L79
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g27
  mov si, g30
  jmp [bp]

L81: ; Arm: 124'9
  push word [bp+2]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L82: ; Arm: 127'15
  mov si, g39
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L83: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L84: ; Continuation
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 1
  jz L82
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
  push word L83
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g32
  mov si, [Temps+6]
  jmp [bp]

L85: ; Arm: 119'27
  push word [bp+4]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L86: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L85
  mov si, g37
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L87: ; Arm: 12'9
  mov si, g35
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L88: ; Arm: 119'12
  mov ax, 19
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+8]
  push word [CurrentCont]
  push word L86
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L87
  mov si, g36
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L89: ; Continuation
  Bare_enter_check(18)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L84
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L88
  mov si, g38
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L90: ; Arm: 12'9
  mov si, g33
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L91: ; Function: (lam,t1)
  Bare_enter_check(12)
  mov bx, si
  cmp word [bx], 1
  jz L81
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
  push word L89
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L90
  mov si, g34
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L92: ; Function: (loop,g32)
  Bare_enter_check(6)
  push word si
  push word L91
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L93: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L94: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L93
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g22
  jmp [bp]

L95: ; Function: (parse_num,g40)
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L94
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g32
  mov si, 1
  jmp [bp]

L96: ; Arm: 144'7
  mov si, g42
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L97: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, g41
  jmp [bp]

L98: ; Arm: 137'19
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov si, [Temps+10]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L99: ; Arm: 138'22
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov si, [Temps+12]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L100: ; Arm: 139'16
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+14], ax
  mov si, [Temps+14]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L101: ; Function: (put_chars,g41)
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 1
  jz L96
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
  push word L97
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L98
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L99
  mov ax, 53
  cmp word ax, [Temps+6]
  call Bare_make_bool_from_n
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L100
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

L102: ; Arm: 165'9
  mov si, g47
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L103: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L104: ; Function: (lam,t1)
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 1
  jz L102
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
  push word L103
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+8]
  jmp [bp]

L105: ; Function: (loop,t2)
  Bare_enter_check(10)
  push word bp
  push word si
  push word [bp+2]
  push word L104
  mov [Temps+2], sp
  push word 8 ;; scanned
  mov si, [Temps+2]
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

L107: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L106
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L108: ; Continuation
  Bare_enter_check(600)
  mov ax, si
  call Bare_make_bytes
  mov [Temps+2], ax
  push word [Temps+2]
  push word L105
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
  push word L107
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [Temps+4]
  mov si, [Temps+6]
  jmp [bp]

L109: ; Function: (rev_implode,g48)
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L108
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g1
  mov si, si
  jmp [bp]

L110: ; Arm: 174'19
  mov si, g51
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L111: ; Arm: 176'15
  mov si, g52
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L112: ; Arm: 179'31
  mov si, g55
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L113: ; Continuation
  Bare_enter_check(0)
  mov bx, si
  cmp word [bx], 3
  jz L112
  mov ax, [bp+4]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  mov bp, [bp+6]
  mov si, [Temps+2]
  jmp [bp]

L114: ; Arm: 12'9
  mov si, g53
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L115: ; Function: (loop,t1)
  Bare_enter_check(10)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L111
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
  push word L113
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L114
  mov si, g54
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L116: ; Continuation
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 3
  jz L110
  push word [bp+6]
  push word [bp+4]
  push word L115
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

L117: ; Arm: 12'9
  mov si, g49
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L118: ; Function: (lam,t1)
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
  push word L116
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L117
  mov si, g50
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L119: ; Function: (eq_string,g56)
  Bare_enter_check(6)
  push word si
  push word L118
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L120: ; Arm: 187'9
  mov si, [bp+4]
  mov bp, g24
  jmp [bp]

L121: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L122: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L121
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L123: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L122
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L124: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L123
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+10]
  jmp [bp]

L125: ; Continuation
  Bare_enter_check(14)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word si
  push word [CurrentCont]
  push word L124
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g20
  mov si, g58
  jmp [bp]

L126: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L125
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g20
  mov si, si
  jmp [bp]

L127: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L126
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L128: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L127
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L129: ; Continuation
  Bare_enter_check(16)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word si
  push word [CurrentCont]
  push word L128
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g20
  mov si, g57
  jmp [bp]

L130: ; Continuation
  Bare_enter_check(14)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L129
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov si, [bp+6]
  mov bp, g20
  jmp [bp]

L131: ; Function: (lam,t1)
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L120
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L130
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g22
  mov si, [Temps+2]
  jmp [bp]

L132: ; Function: (collect,t1)
  Bare_enter_check(10)
  push word bp
  push word si
  push word [bp+2]
  push word L131
  mov [Temps+2], sp
  push word 8 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L133: ; Arm: 192'7
  mov si, g60
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L134: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L135: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L134
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L136: ; Continuation
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 1
  jz L133
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [bp+4]
  push word [CurrentCont]
  push word L135
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g22
  mov si, [Temps+2]
  jmp [bp]

L137: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L136
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L138: ; Function: (lam,t2)
  Bare_enter_check(10)
  push word si
  push word [bp+2]
  push word [CurrentCont]
  push word L137
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g20
  mov si, g59
  jmp [bp]

L139: ; Continuation
  Bare_enter_check(12)
  push word si
  push word L132
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word L138
  mov [Temps+4], sp
  push word 4 ;; scanned
  mov si, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L140: ; Function: (concat,g61)
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L139
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L141: ; Continuation
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

L142: ; Arm: 208'11
  push word [bp+2]
  push word [CurrentCont]
  push word L141
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g48
  jmp [bp]

L143: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L144: ; Continuation
  Bare_enter_check(16)
  push word [bp+4]
  push word si
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+6]
  push word [CurrentCont]
  push word L143
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g62
  mov si, [Temps+2]
  jmp [bp]

L145: ; Arm: 210'26
  push word [Temps+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L144
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+4]
  mov bp, g48
  jmp [bp]

L146: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L147: ; Continuation
  Bare_enter_check(16)
  push word [bp+4]
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word [CurrentCont]
  push word L146
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L148: ; Function: (lam,t1)
  Bare_enter_check(12)
  mov bx, si
  cmp word [bx], 1
  jz L142
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
  jz L145
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+4]
  push word [CurrentCont]
  push word L147
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+2]
  mov bp, g63
  jmp [bp]

L149: ; Function: (lam,t1)
  Bare_enter_check(8)
  push word si
  push word [bp+2]
  push word L148
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L150: ; Function: (have_letter,g63)
  Bare_enter_check(6)
  push word si
  push word L149
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L151: ; Arm: 215'9
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L152: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L153: ; Arm: 217'24
  push word [Temps+4]
  push word [CurrentCont]
  push word L152
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+2]
  mov bp, g62
  jmp [bp]

L154: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L155: ; Continuation
  Bare_enter_check(16)
  push word g64
  push word [bp+4]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+6]
  push word [CurrentCont]
  push word L154
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L156: ; Function: (lam,t1)
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 1
  jz L151
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
  jz L153
  push word [Temps+4]
  push word [Temps+2]
  push word [CurrentCont]
  push word L155
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+2]
  mov bp, g63
  jmp [bp]

L157: ; Function: (at_word_start,g62)
  Bare_enter_check(6)
  push word si
  push word L156
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L158: ; Arm: 229'16
  mov si, g67
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L159: ; Continuation
  Bare_enter_check(0)
  mov bx, si
  cmp word [bx], 3
  jz L158
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

L160: ; Arm: 12'9
  mov si, g65
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L161: ; Function: (loop,t2)
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
  push word L159
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L160
  mov si, g66
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L162: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L163: ; Function: (lam,t1)
  Bare_enter_check(600)
  mov ax, si
  call Bare_make_bytes
  mov [Temps+2], ax
  push word [Temps+2]
  push word si
  push word [bp+4]
  push word [bp+2]
  push word L161
  mov [Temps+4], sp
  push word 10 ;; scanned
  push word [Temps+2]
  push word [CurrentCont]
  push word L162
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [Temps+4]
  mov si, 1
  jmp [bp]

L164: ; Function: (lam,t1)
  Bare_enter_check(8)
  push word si
  push word [bp+2]
  push word L163
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L165: ; Function: (substr,g68)
  Bare_enter_check(6)
  push word si
  push word L164
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L166: ; Arm: 243'17
  mov si, g71
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L167: ; Continuation
  Bare_enter_check(0)
  mov bx, si
  cmp word [bx], 3
  jz L166
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

L168: ; Arm: 12'9
  mov si, g69
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L169: ; Function: (loop,t2)
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
  push word L167
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L168
  mov si, g70
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L170: ; Function: (lam,t1)
  Bare_enter_check(12)
  mov bx, si
  mov ax, [bx]
  mov [Temps+2], ax
  push word [Temps+2]
  push word si
  push word [bp+4]
  push word [bp+2]
  push word L169
  mov [Temps+4], sp
  push word 10 ;; scanned
  mov bp, [Temps+4]
  mov si, 1
  jmp [bp]

L171: ; Function: (lam,t1)
  Bare_enter_check(8)
  push word si
  push word [bp+2]
  push word L170
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L172: ; Function: (mod_substr,g72)
  Bare_enter_check(6)
  push word si
  push word L171
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L173: ; Arm: 283'22
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov bp, g48
  mov si, si
  jmp [bp]

L174: ; Arm: 284'28
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
  mov bp, g48
  mov si, [Temps+16]
  jmp [bp]

L175: ; Arm: 285'19
  mov bp, g74
  mov si, si
  jmp [bp]

L176: ; Arm: 288'17
  mov bp, g74
  mov si, si
  jmp [bp]

L177: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, g74
  jmp [bp]

L178: ; Arm: 292'28
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

L179: ; Arm: 293'29
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

L180: ; Arm: 294'32
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

L181: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L177
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L178
  mov ax, [bp+6]
  cmp word ax, 65
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L179
  mov ax, 253
  cmp word ax, [bp+6]
  call Bare_make_bool_from_n
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L180
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

L182: ; Arm: 12'9
  mov si, g76
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L183: ; Arm: 286'21
  mov bx, si
  cmp word [bx], 1
  jz L176
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
  push word [CurrentCont]
  push word L181
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+20]
  cmp word [bx], 3
  jz L182
  mov si, g77
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L184: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, g74
  mov si, [Temps+2]
  jmp [bp]

L185: ; Arm: 137'19
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+18], ax
  mov si, [Temps+18]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L186: ; Arm: 138'22
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+20], ax
  mov si, [Temps+20]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L187: ; Arm: 139'16
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+22], ax
  mov si, [Temps+22]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L188: ; Function: (readloop,g74)
  Bare_enter_check(10)
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
  jz L173
  mov ax, [Temps+2]
  cmp word ax, `\x04`
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L174
  mov ax, 255
  cmp word ax, [Temps+4]
  call Bare_make_bool_from_n
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L175
  mov ax, [Temps+4]
  cmp word ax, 255
  call Bare_make_bool_from_z
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L183
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
  push word si
  push word [CurrentCont]
  push word L184
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+16]
  cmp word [bx], 3
  jz L185
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+18], ax
  mov bx, [Temps+18]
  cmp word [bx], 3
  jz L186
  mov ax, 53
  cmp word ax, [Temps+14]
  call Bare_make_bool_from_n
  mov [Temps+20], ax
  mov bx, [Temps+20]
  cmp word [bx], 3
  jz L187
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

L189: ; Function: (read_line,g79)
  Bare_enter_check(0)
  mov bp, g74
  mov si, g78
  jmp [bp]

L190: ; Continuation
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

L191: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L190
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L192: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L191
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L193: ; Continuation
  Bare_enter_check(600)
  mov ax, 1025
  call Bare_make_bytes
  mov [Temps+2], ax
  mov ax, [bp+4]
  sar ax, 1
  mov bx, [Temps+2]
  call Bare_load_sector
  mov ax, Bare_unit
  mov [Temps+4], ax
  push word [Temps+2]
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L192
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g72
  mov si, [Temps+2]
  jmp [bp]

L194: ; Continuation
  Bare_enter_check(10)
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
  push word [CurrentCont]
  push word L193
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov si, [Temps+8]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L195: ; Function: (lam,t1)
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L194
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [bp+2]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L196: ; Function: (store_block,g83)
  Bare_enter_check(6)
  push word si
  push word L195
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L197: ; Continuation
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

L198: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L197
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, si
  mov si, 129
  jmp [bp]

L199: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L198
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L200: ; Continuation
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
  push word L199
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g68
  mov si, [Temps+10]
  jmp [bp]

L201: ; Function: (load_block,g84)
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L200
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

L202: ; Continuation
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

L203: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L202
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g83
  jmp [bp]

L204: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L203
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L205: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L204
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L206: ; Continuation
  Bare_enter_check(14)
  mov [Temps+2], si
  push word [Temps+2]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L205
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g72
  mov si, [Temps+2]
  jmp [bp]

L207: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L206
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

L208: ; Function: (lam,t1)
  Bare_enter_check(12)
  push word si
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L207
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+2]
  mov bp, g84
  jmp [bp]

L209: ; Function: (lam,t1)
  Bare_enter_check(8)
  push word si
  push word [bp+2]
  push word L208
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L210: ; Function: (update_block,g85)
  Bare_enter_check(6)
  push word si
  push word L209
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L211: ; Function: (lam,g90)
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

L212: ; Arm: 458'9
  mov si, g88
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L213: ; Arm: 460'14
  mov si, g89
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L214: ; Continuation
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

L215: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L214
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L216: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L215
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L217: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L216
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L218: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L217
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, si
  mov si, 13
  jmp [bp]

L219: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L218
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, si
  mov si, 5
  jmp [bp]

L220: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L219
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+6]
  mov bp, g68
  jmp [bp]

L221: ; Continuation
  Bare_enter_check(12)
  push word [bp+6]
  push word [bp+4]
  push word si
  push word [CurrentCont]
  push word L220
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g2
  mov si, g90
  jmp [bp]

L222: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L221
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g11
  mov si, si
  jmp [bp]

L223: ; Arm: 451'14
  mov si, 1
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L224: ; Continuation
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 1
  jz L212
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L213
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
  push word [bp+4]
  push word [CurrentCont]
  push word L222
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L223
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

L225: ; Arm: 417'32
  mov si, g87
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L226: ; Continuation
  Bare_enter_check(22)
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
  push word [CurrentCont]
  push word L224
  mov [CurrentCont], sp
  push word 6 ;; scanned
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
  jz L225
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

L227: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L226
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, si
  mov si, 17
  jmp [bp]

L228: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L227
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L229: ; Continuation
  Bare_enter_check(8)
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
  push word [CurrentCont]
  push word L228
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g68
  jmp [bp]

L230: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L229
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

L231: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L230
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

L232: ; Continuation
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
  push word [bp+4]
  push word [CurrentCont]
  push word L231
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g84
  mov si, [Temps+6]
  jmp [bp]

L233: ; Function: (lam,g91)
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L232
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

L234: ; Function: (loadI,g92)
  Bare_enter_check(0)
  mov si, g91
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L235: ; Arm: 581'7
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L236: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L237: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L236
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g93
  mov si, si
  jmp [bp]

L238: ; Function: (lam,t1)
  Bare_enter_check(26)
  mov bx, si
  cmp word [bx], 1
  jz L235
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [CurrentCont]
  push word L237
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

L239: ; Function: (giveup_blocks,g93)
  Bare_enter_check(6)
  push word si
  push word L238
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L240: ; Continuation
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

L241: ; Function: (lam,g94)
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L240
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

L242: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L243: ; Arm: 737'9
  push word [bp+2]
  push word [CurrentCont]
  push word L242
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g20
  mov si, g97
  jmp [bp]

L244: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L245: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov bx, si
  cmp word [bx], 1
  jz L243
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
  push word L244
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g96
  mov si, [Temps+10]
  jmp [bp]

L246: ; Function: (loop,g96)
  Bare_enter_check(6)
  push word si
  push word L245
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L247: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L248: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L247
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L249: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L248
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L250: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L249
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g101
  jmp [bp]

L251: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L250
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g26
  jmp [bp]

L252: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L251
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g100
  jmp [bp]

L253: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L252
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L254: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L253
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g99
  jmp [bp]

L255: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L254
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g26
  jmp [bp]

L256: ; Arm: 761'21
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [bp+2]
  push word [CurrentCont]
  push word L255
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g98
  jmp [bp]

L257: ; Function: (lam,t1)
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 3
  jz L256
  mov bp, [bp+4]
  mov si, g102
  jmp [bp]

L258: ; Function: (lam,t1)
  Bare_enter_check(22)
  push word si
  push word [bp+2]
  push word L257
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [Temps+4]
  push word [bp+2]
  push word 1
  mov [Temps+6], sp
  push word 6 ;; scanned
  mov si, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L259: ; Function: (mk_com0,g103)
  Bare_enter_check(6)
  push word si
  push word L258
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L260: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L261: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L260
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L262: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L261
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L263: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L262
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g107
  jmp [bp]

L264: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L263
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g26
  jmp [bp]

L265: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L264
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g106
  jmp [bp]

L266: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L265
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L267: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L266
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g105
  jmp [bp]

L268: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L267
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g26
  jmp [bp]

L269: ; Arm: 770'17
  push word [bp+2]
  push word [CurrentCont]
  push word L268
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g104
  jmp [bp]

L270: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L271: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L270
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L272: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L271
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L273: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L272
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g111
  jmp [bp]

L274: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L273
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g26
  jmp [bp]

L275: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L274
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g110
  jmp [bp]

L276: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L275
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L277: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L276
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g109
  jmp [bp]

L278: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L277
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g26
  jmp [bp]

L279: ; Arm: 773'24
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [bp+2]
  push word [CurrentCont]
  push word L278
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g108
  jmp [bp]

L280: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L281: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L280
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L282: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L281
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L283: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L282
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g115
  jmp [bp]

L284: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L283
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g26
  jmp [bp]

L285: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L284
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g114
  jmp [bp]

L286: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L285
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L287: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L286
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g113
  jmp [bp]

L288: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L287
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g26
  jmp [bp]

L289: ; Arm: 776'25
  push word [bp+4]
  push word [CurrentCont]
  push word L288
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g112
  jmp [bp]

L290: ; Continuation
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 1
  jz L289
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bp, [bp+6]
  mov si, [Temps+2]
  jmp [bp]

L291: ; Function: (lam,t1)
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 1
  jz L269
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L279
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L290
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g40
  mov si, [Temps+2]
  jmp [bp]

L292: ; Function: (lam,t1)
  Bare_enter_check(22)
  push word si
  push word [bp+2]
  push word L291
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [Temps+4]
  push word [bp+2]
  push word 1
  mov [Temps+6], sp
  push word 6 ;; scanned
  mov si, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L293: ; Function: (mk_comI,g116)
  Bare_enter_check(6)
  push word si
  push word L292
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L294: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L295: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L294
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L296: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L295
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L297: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L296
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g120
  jmp [bp]

L298: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L297
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g26
  jmp [bp]

L299: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L298
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g119
  jmp [bp]

L300: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L299
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L301: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L300
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g118
  jmp [bp]

L302: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L301
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g26
  jmp [bp]

L303: ; Arm: 785'17
  push word [bp+2]
  push word [CurrentCont]
  push word L302
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g117
  jmp [bp]

L304: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L305: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L304
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L306: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L305
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L307: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L306
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g124
  jmp [bp]

L308: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L307
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g26
  jmp [bp]

L309: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L308
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g123
  jmp [bp]

L310: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L309
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L311: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L310
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g122
  jmp [bp]

L312: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L311
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g26
  jmp [bp]

L313: ; Arm: 788'20
  push word [bp+2]
  push word [CurrentCont]
  push word L312
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g121
  jmp [bp]

L314: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L315: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L314
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L316: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L315
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L317: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L316
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g128
  jmp [bp]

L318: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L317
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g26
  jmp [bp]

L319: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L318
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g127
  jmp [bp]

L320: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L319
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L321: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L320
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g126
  jmp [bp]

L322: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L321
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g26
  jmp [bp]

L323: ; Arm: 791'27
  mov ax, [bx+2]
  mov [Temps+10], ax
  mov ax, [bx+4]
  mov [Temps+12], ax
  push word [bp+2]
  push word [CurrentCont]
  push word L322
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g125
  jmp [bp]

L324: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L325: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L324
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L326: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L325
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L327: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L326
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g132
  jmp [bp]

L328: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L327
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g26
  jmp [bp]

L329: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L328
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g131
  jmp [bp]

L330: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L329
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L331: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L330
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g130
  jmp [bp]

L332: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L331
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g26
  jmp [bp]

L333: ; Arm: 794'28
  push word [bp+4]
  push word [CurrentCont]
  push word L332
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g129
  jmp [bp]

L334: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L335: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L334
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L336: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L335
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L337: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L336
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g136
  jmp [bp]

L338: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L337
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g26
  jmp [bp]

L339: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L338
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g135
  jmp [bp]

L340: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L339
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L341: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L340
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g134
  jmp [bp]

L342: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L341
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g26
  jmp [bp]

L343: ; Arm: 797'31
  push word [bp+4]
  push word [CurrentCont]
  push word L342
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g133
  jmp [bp]

L344: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L345: ; Continuation
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 1
  jz L343
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [CurrentCont]
  push word L344
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L346: ; Continuation
  Bare_enter_check(12)
  mov bx, si
  cmp word [bx], 1
  jz L333
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L345
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+8]
  mov bp, g40
  jmp [bp]

L347: ; Function: (lam,t1)
  Bare_enter_check(12)
  mov bx, si
  cmp word [bx], 1
  jz L303
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 1
  jz L313
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L323
  push word [Temps+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L346
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g40
  mov si, [Temps+2]
  jmp [bp]

L348: ; Function: (lam,t1)
  Bare_enter_check(22)
  push word si
  push word [bp+2]
  push word L347
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [Temps+4]
  push word [bp+2]
  push word 1
  mov [Temps+6], sp
  push word 6 ;; scanned
  mov si, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L349: ; Function: (mk_comII,g137)
  Bare_enter_check(6)
  push word si
  push word L348
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L350: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L351: ; Arm: 260'27
  push word [bp+2]
  push word [CurrentCont]
  push word L350
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g20
  mov si, g157
  jmp [bp]

L352: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L353: ; Continuation
  Bare_enter_check(16)
  push word [bp+4]
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word si
  push word [CurrentCont]
  push word L352
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g156
  mov si, [Temps+2]
  jmp [bp]

L354: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, 129
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L355: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L354
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, 129
  jmp [bp]

L356: ; Arm: 254'21
  push word [bp+8]
  push word [CurrentCont]
  push word L355
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+6]
  mov bp, g68
  jmp [bp]

L357: ; Continuation
  Bare_enter_check(18)
  mov ax, 129
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L353
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L356
  mov si, g158
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L358: ; Continuation
  Bare_enter_check(0)
  mov bp, si
  mov si, 129
  jmp [bp]

L359: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L358
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, si
  mov si, 1
  jmp [bp]

L360: ; Arm: 253'21
  push word [CurrentCont]
  push word L359
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g68
  mov si, si
  jmp [bp]

L361: ; Function: (lam,t1)
  Bare_enter_check(18)
  mov bx, si
  mov ax, [bx]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L351
  mov bx, si
  mov ax, [bx]
  mov [Temps+6], ax
  mov ax, 129
  cmp word ax, [Temps+6]
  call Bare_make_bool_from_n
  mov [Temps+8], ax
  push word [Temps+6]
  push word si
  push word [bp+2]
  push word [CurrentCont]
  push word L357
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L360
  mov si, si
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L362: ; Function: (loop,g156)
  Bare_enter_check(6)
  push word si
  push word L361
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L363: ; Arm: 198'14
  mov si, g173
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L364: ; Continuation
  Bare_enter_check(0)
  mov bx, si
  cmp word [bx], 3
  jz L363
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

L365: ; Arm: 12'9
  mov si, g171
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L366: ; Function: (loop,t2)
  Bare_enter_check(12)
  mov ax, si
  cmp word ax, 1025
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word si
  push word [bp+2]
  push word [CurrentCont]
  push word L364
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L365
  mov si, g172
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L367: ; Arm: 806'32
  mov si, g176
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L368: ; Continuation
  Bare_enter_check(0)
  mov bx, si
  cmp word [bx], 3
  jz L367
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

L369: ; Arm: 12'9
  mov si, g174
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L370: ; Function: (loop,t2)
  Bare_enter_check(12)
  mov ax, si
  cmp word ax, 7
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word si
  push word [bp+2]
  push word [CurrentCont]
  push word L368
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L369
  mov si, g175
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L371: ; Continuation
  Bare_enter_check(6)
  mov ax, [bp+4]
  mov [Temps+2], ax
  push word [Temps+2]
  push word L370
  mov [Temps+4], sp
  push word 4 ;; scanned
  mov bp, [Temps+4]
  mov si, 1
  jmp [bp]

L372: ; Function: (lam,g177)
  Bare_enter_check(600)
  mov ax, 1025
  call Bare_make_bytes
  mov [Temps+2], ax
  push word [Temps+2]
  push word L366
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word [CurrentCont]
  push word L371
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [Temps+4]
  mov si, 1
  jmp [bp]

L373: ; Arm: 815'32
  mov si, g182
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L374: ; Arm: 324'16
  mov si, g185
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L375: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov bp, [bp+6]
  mov si, [Temps+2]
  jmp [bp]

L376: ; Arm: 327'21
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov si, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L377: ; Continuation
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
  push word L375
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L376
  mov si, g187
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L378: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L379: ; Arm: 326'24
  push word [CurrentCont]
  push word L378
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, g186
  jmp [bp]

L380: ; Arm: 137'19
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov si, [Temps+10]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L381: ; Arm: 138'22
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov si, [Temps+12]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L382: ; Arm: 139'16
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+14], ax
  mov si, [Temps+14]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L383: ; Continuation
  Bare_enter_check(16)
  mov bx, si
  cmp word [bx], 3
  jz L374
  mov ax, [bp+4]
  mov bx, [bp+6]
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+2], ax
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L377
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L379
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
  jz L380
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L381
  mov ax, 53
  cmp word ax, [Temps+6]
  call Bare_make_bool_from_n
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L382
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

L384: ; Arm: 12'9
  mov si, g183
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L385: ; Function: (loop,t4)
  Bare_enter_check(12)
  mov ax, si
  cmp word ax, 1025
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word si
  push word [bp+2]
  push word [CurrentCont]
  push word L383
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L384
  mov si, g184
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L386: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov bp, g179
  mov si, [Temps+2]
  jmp [bp]

L387: ; Continuation
  Bare_enter_check(600)
  mov bx, si
  cmp word [bx], 3
  jz L373
  mov ax, 1025
  call Bare_make_bytes
  mov [Temps+2], ax
  mov ax, [bp+4]
  sar ax, 1
  mov bx, [Temps+2]
  call Bare_load_sector
  mov ax, Bare_unit
  mov [Temps+4], ax
  mov ax, [Temps+2]
  mov [Temps+6], ax
  push word [Temps+6]
  push word L385
  mov [Temps+8], sp
  push word 4 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L386
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [Temps+8]
  mov si, 1
  jmp [bp]

L388: ; Arm: 12'9
  mov si, g180
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L389: ; Function: (loop,g179)
  Bare_enter_check(8)
  mov ax, si
  cmp word ax, 7
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word si
  push word [CurrentCont]
  push word L387
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L388
  mov si, g181
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L390: ; Function: (lam,g188)
  Bare_enter_check(0)
  mov bp, g179
  mov si, 1
  jmp [bp]

L391: ; Arm: 12'9
  mov si, g206
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L392: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  cmp word ax, si
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L391
  mov si, g207
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L393: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L392
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

L394: ; Function: (lam,t1)
  Bare_enter_check(8)
  push word [bp+2]
  push word [CurrentCont]
  push word L393
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

L395: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L396: ; Function: (lam,t1)
  Bare_enter_check(14)
  push word si
  push word L394
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+2]
  push word [CurrentCont]
  push word L395
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g4
  mov si, [Temps+2]
  jmp [bp]

L397: ; Function: (lam,g208)
  Bare_enter_check(6)
  push word si
  push word L396
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L398: ; Function: (lam,g209)
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

L399: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L400: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L399
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g31
  mov si, si
  jmp [bp]

L401: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L400
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

L402: ; Function: (lam,g231)
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L401
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g230
  jmp [bp]

L403: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L404: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L403
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g31
  mov si, si
  jmp [bp]

L405: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L404
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

L406: ; Function: (lam,g236)
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L405
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g235
  jmp [bp]

L407: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L408: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L407
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g31
  mov si, si
  jmp [bp]

L409: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L408
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

L410: ; Function: (lam,g249)
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L409
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g248
  jmp [bp]

L411: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L412: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L411
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L413: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L412
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L414: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L413
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g45
  jmp [bp]

L415: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L414
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g26
  jmp [bp]

L416: ; Arm: 154'45
  push word si
  push word [CurrentCont]
  push word L415
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g44
  jmp [bp]

L417: ; Function: (_trace,t2)
  Bare_enter_check(8)
  mov bx, [bp+2]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L416
  mov si, g46
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L418: ; Continuation
  Bare_enter_check(6)
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L419: ; Continuation
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
  push word [bp+4]
  push word [CurrentCont]
  push word L418
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g83
  mov si, [Temps+6]
  jmp [bp]

L420: ; Continuation
  Bare_enter_check(8)
  mov ax, [bp+6]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [CurrentCont]
  push word L419
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov si, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L421: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L420
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L422: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L421
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+8]
  jmp [bp]

L423: ; Continuation
  Bare_enter_check(14)
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
  mov ax, [bp+6]
  mov [Temps+6], ax
  push word [Temps+6]
  push word [Temps+4]
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L422
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g72
  mov si, [Temps+6]
  jmp [bp]

L424: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L423
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L425: ; Arm: 590'11
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L426: ; Continuation
  Bare_enter_check(16)
  push word si
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word [bp+4]
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  mov bp, g24
  mov si, [Temps+4]
  jmp [bp]

L427: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L426
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L428: ; Continuation
  Bare_enter_check(22)
  push word si
  push word [bp+6]
  push word [CurrentCont]
  push word L424
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [bp+8]
  cmp word [bx], 1
  jz L425
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
  push word [CurrentCont]
  push word L427
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g2
  mov si, g94
  jmp [bp]

L429: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L428
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

L430: ; Continuation
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
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L429
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g84
  mov si, [Temps+6]
  jmp [bp]

L431: ; Function: (lam,t1)
  Bare_enter_check(12)
  push word si
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L430
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L432: ; Function: (lam,t1)
  Bare_enter_check(8)
  push word si
  push word [bp+2]
  push word L431
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L433: ; Function: (storeI,t1)
  Bare_enter_check(6)
  push word [bp+2]
  push word L432
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L434: ; Arm: 893'10
  mov si, g169
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L435: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, [bp+6]
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L436: ; Continuation
  Bare_enter_check(10)
  mov bx, [bp+10]
  cmp word [bx], 3
  jz L434
  mov bx, [bp+12]
  mov ax, [bx]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [bp+8]
  push word [CurrentCont]
  push word L435
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+4]
  mov bp, [bp+6]
  jmp [bp]

L437: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L438: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L437
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L439: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L438
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L440: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L439
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g143
  jmp [bp]

L441: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L440
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g142
  jmp [bp]

L442: ; Arm: 669'9
  push word [CurrentCont]
  push word L441
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g26
  mov si, g141
  jmp [bp]

L443: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L444: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L443
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L445: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L444
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L446: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L445
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g146
  jmp [bp]

L447: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L446
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g145
  jmp [bp]

L448: ; Arm: 673'12
  push word [CurrentCont]
  push word L447
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g26
  mov si, g144
  jmp [bp]

L449: ; Continuation
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

L450: ; Continuation
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
  push word L449
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, [Temps+4]
  jmp [bp]

L451: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L450
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L452: ; Continuation
  Bare_enter_check(16)
  push word si
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L451
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov si, [bp+10]
  mov bp, [bp+4]
  jmp [bp]

L453: ; Continuation
  Bare_enter_check(18)
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L452
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, [bp+14]
  mov si, si
  jmp [bp]

L454: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L453
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+18]
  jmp [bp]

L455: ; Continuation
  Bare_enter_check(22)
  push word [bp+16]
  push word [bp+14]
  push word si
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L454
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov bp, g20
  mov si, g148
  jmp [bp]

L456: ; Continuation
  Bare_enter_check(20)
  push word si
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L455
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov si, [bp+16]
  mov bp, g20
  jmp [bp]

L457: ; Continuation
  Bare_enter_check(20)
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L456
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+16]
  jmp [bp]

L458: ; Arm: 682'15
  push word [bp+18]
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L457
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov bp, g20
  mov si, g147
  jmp [bp]

L459: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L460: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L459
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, 1
  jmp [bp]

L461: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L460
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L462: ; Continuation
  Bare_enter_check(18)
  push word [bp+4]
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+10]
  push word [bp+6]
  push word [CurrentCont]
  push word L461
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L463: ; Continuation
  Bare_enter_check(14)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [CurrentCont]
  push word L462
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov si, [bp+4]
  mov bp, [bp+6]
  jmp [bp]

L464: ; Continuation
  Bare_enter_check(18)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L463
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+10]
  jmp [bp]

L465: ; Continuation
  Bare_enter_check(20)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L464
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+10]
  jmp [bp]

L466: ; Arm: 688'22
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [Temps+8]
  push word [Temps+6]
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+20]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [CurrentCont]
  push word L465
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov bp, g85
  mov si, [Temps+6]
  jmp [bp]

L467: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L468: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L467
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L469: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L468
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L470: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L469
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g152
  jmp [bp]

L471: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L470
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g151
  jmp [bp]

L472: ; Arm: 693'22
  push word [CurrentCont]
  push word L471
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g26
  mov si, g150
  jmp [bp]

L473: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L474: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L473
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, 1
  jmp [bp]

L475: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L474
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g153
  jmp [bp]

L476: ; Continuation
  Bare_enter_check(16)
  push word [bp+4]
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+6]
  push word [CurrentCont]
  push word L475
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L477: ; Continuation
  Bare_enter_check(12)
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L476
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+10]
  mov bp, [bp+4]
  jmp [bp]

L478: ; Continuation
  Bare_enter_check(16)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L477
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+8]
  jmp [bp]

L479: ; Continuation
  Bare_enter_check(18)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L478
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+8]
  jmp [bp]

L480: ; Continuation
  Bare_enter_check(20)
  mov bx, si
  cmp word [bx], 1
  jz L472
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
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L479
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, g85
  mov si, [Temps+6]
  jmp [bp]

L481: ; Arm: 565'10
  mov si, g149
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L482: ; Function: (lam,t1)
  Bare_enter_check(40)
  mov bx, si
  cmp word [bx], 1
  jz L458
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [bp+18]
  cmp word [bx], 3
  jz L466
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+20]
  push word [bp+16]
  push word [bp+14]
  push word [CurrentCont]
  push word L480
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, [bp+12]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov ax, [bx+6]
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 1
  jz L481
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

L483: ; Function: (lam,t1)
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
  push word L482
  mov [Temps+2], sp
  push word 22 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L484: ; Function: (lam,t1)
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
  push word L483
  mov [Temps+2], sp
  push word 20 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L485: ; Function: (lam,t1)
  Bare_enter_check(20)
  push word si
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L484
  mov [Temps+2], sp
  push word 18 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L486: ; Function: (loop,t1)
  Bare_enter_check(18)
  push word bp
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L485
  mov [Temps+2], sp
  push word 16 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L487: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L488: ; Continuation
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
  push word L487
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L489: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L488
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+8]
  jmp [bp]

L490: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L489
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+8]
  jmp [bp]

L491: ; Arm: 708'10
  push word si
  push word [bp+14]
  push word [bp+6]
  push word [bp+2]
  push word [CurrentCont]
  push word L490
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov si, [bp+12]
  mov bp, [bp+4]
  jmp [bp]

L492: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L493: ; Continuation
  Bare_enter_check(16)
  push word [bp+4]
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word [CurrentCont]
  push word L492
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L494: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L493
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L495: ; Arm: 711'22
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  mov ax, [bp+8]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+8], ax
  push word [Temps+6]
  push word [Temps+4]
  push word [bp+14]
  push word [bp+12]
  push word [CurrentCont]
  push word L494
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+10]
  mov si, [Temps+8]
  jmp [bp]

L496: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L497: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L496
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L498: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L497
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L499: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L498
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g163
  jmp [bp]

L500: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L499
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g162
  jmp [bp]

L501: ; Arm: 714'22
  push word [CurrentCont]
  push word L500
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g26
  mov si, g161
  jmp [bp]

L502: ; Arm: 198'14
  mov si, g166
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L503: ; Continuation
  Bare_enter_check(0)
  mov bx, si
  cmp word [bx], 3
  jz L502
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

L504: ; Arm: 12'9
  mov si, g164
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L505: ; Function: (loop,t5)
  Bare_enter_check(12)
  mov ax, si
  cmp word ax, 129
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word si
  push word [bp+2]
  push word [CurrentCont]
  push word L503
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L504
  mov si, g165
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L506: ; Continuation
  Bare_enter_check(0)
  mov bp, si
  mov si, g167
  jmp [bp]

L507: ; Continuation
  Bare_enter_check(14)
  push word [bp+4]
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L506
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L508: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L507
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L509: ; Continuation
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
  push word L508
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+2]
  jmp [bp]

L510: ; Continuation
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
  push word L509
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L511: ; Continuation
  Bare_enter_check(18)
  mov ax, [bp+14]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L510
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov si, [bp+12]
  mov bp, g83
  jmp [bp]

L512: ; Continuation
  Bare_enter_check(600)
  mov bx, si
  cmp word [bx], 1
  jz L501
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
  push word L505
  mov [Temps+10], sp
  push word 4 ;; scanned
  push word [Temps+8]
  push word [Temps+6]
  push word [Temps+4]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L511
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, [Temps+10]
  mov si, 1
  jmp [bp]

L513: ; Arm: 565'10
  mov si, g160
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L514: ; Function: (lam,t1)
  Bare_enter_check(36)
  mov ax, [bp+8]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L491
  mov bx, si
  cmp word [bx], 3
  jz L495
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [CurrentCont]
  push word L512
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [bp+12]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  mov ax, [bx+6]
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 1
  jz L513
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

L515: ; Function: (lam,t1)
  Bare_enter_check(18)
  push word si
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L514
  mov [Temps+2], sp
  push word 16 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L516: ; Function: (lam,t1)
  Bare_enter_check(16)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L515
  mov [Temps+2], sp
  push word 14 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L517: ; Function: (skip_loop,t1)
  Bare_enter_check(14)
  push word bp
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L516
  mov [Temps+2], sp
  push word 12 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L518: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L519: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L518
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g168
  jmp [bp]

L520: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L519
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L521: ; Continuation
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
  push word L520
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, [Temps+2]
  jmp [bp]

L522: ; Continuation
  Bare_enter_check(22)
  push word si
  push word [bp+10]
  push word [bp+4]
  push word L517
  mov [Temps+2], sp
  push word 8 ;; scanned
  push word [Temps+2]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L521
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  mov si, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L523: ; Arm: 702'40
  mov si, g154
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L524: ; Continuation
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

L525: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L524
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L526: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L525
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g156
  mov si, g159
  jmp [bp]

L527: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+6]
  mov bx, [bp+4]
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L528: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L527
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L529: ; Arm: 254'21
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L528
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+4]
  mov bp, g68
  jmp [bp]

L530: ; Continuation
  Bare_enter_check(18)
  mov ax, [bp+6]
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word si
  push word [CurrentCont]
  push word L526
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L529
  mov si, g155
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L531: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L532: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L531
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, 1
  jmp [bp]

L533: ; Arm: 253'21
  push word [Temps+6]
  push word [CurrentCont]
  push word L532
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+12]
  mov bp, g68
  jmp [bp]

L534: ; Continuation
  Bare_enter_check(48)
  push word si
  push word [bp+16]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L486
  mov [Temps+2], sp
  push word 12 ;; scanned
  mov ax, [bp+10]
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
  mov bx, [bp+12]
  mov ax, [bx]
  mov [Temps+8], ax
  mov ax, [Temps+8]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  push word [Temps+2]
  push word [bp+18]
  push word [bp+14]
  push word [bp+10]
  push word [CurrentCont]
  push word L522
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L523
  mov bx, [bp+12]
  mov ax, [bx]
  mov [Temps+12], ax
  mov ax, [Temps+6]
  cmp word ax, [Temps+12]
  call Bare_make_bool_from_n
  mov [Temps+14], ax
  push word [Temps+12]
  push word [Temps+6]
  push word [bp+12]
  push word [CurrentCont]
  push word L530
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+14]
  cmp word [bx], 3
  jz L533
  mov si, [bp+12]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L535: ; Arm: 102'23
  mov si, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L536: ; Continuation
  Bare_enter_check(22)
  mov bx, [bp+12]
  mov ax, [bx]
  mov [Temps+2], ax
  mov ax, [bp+10]
  mov bx, [Temps+2]
  add ax, bx
  sub ax, 1
  mov [Temps+4], ax
  mov ax, si
  cmp word ax, [Temps+4]
  call Bare_make_bool_from_n
  mov [Temps+6], ax
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L534
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L535
  mov si, si
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L537: ; Continuation
  Bare_enter_check(22)
  mov bx, si
  cmp word [bx], 1
  jz L448
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L536
  mov [CurrentCont], sp
  push word 20 ;; scanned
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

L538: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L537
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+8]
  jmp [bp]

L539: ; Continuation
  Bare_enter_check(20)
  push word si
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L538
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, g92
  mov si, si
  jmp [bp]

L540: ; Continuation
  Bare_enter_check(34)
  mov bx, [bp+6]
  mov ax, [bx]
  mov [Temps+2], ax
  push word si
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [CurrentCont]
  push word L436
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L442
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [Temps+4]
  push word si
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L539
  mov [CurrentCont], sp
  push word 16 ;; scanned
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

L541: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L542: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L541
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, 1
  jmp [bp]

L543: ; Arm: 891'21
  push word [bp+16]
  push word [CurrentCont]
  push word L542
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+14]
  mov bp, g68
  jmp [bp]

L544: ; Continuation
  Bare_enter_check(0)
  mov bp, si
  mov si, g140
  jmp [bp]

L545: ; Continuation
  Bare_enter_check(26)
  push word si
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L540
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L543
  push word [CurrentCont]
  push word L544
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov si, [bp+14]
  mov bp, g26
  jmp [bp]

L546: ; Arm: 890'22
  mov si, g139
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L547: ; Continuation
  Bare_enter_check(20)
  mov bx, si
  mov ax, [bx]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  cmp word ax, 3
  call Bare_make_bool_from_n
  mov [Temps+4], ax
  push word [Temps+2]
  push word si
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L545
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L546
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

L548: ; Function: (lam,t1)
  Bare_enter_check(16)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L547
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g79
  mov si, g138
  jmp [bp]

L549: ; Function: (write_to_file,t3)
  Bare_enter_check(12)
  push word bp
  push word si
  push word [bp+4]
  push word [bp+2]
  push word L548
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L550: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L551: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L550
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L552: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L551
  mov [CurrentCont], sp
  push word 4 ;; scanned
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
  mov si, g192
  jmp [bp]

L554: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L553
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g191
  jmp [bp]

L555: ; Arm: 824'11
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L554
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g26
  mov si, g190
  jmp [bp]

L556: ; Continuation
  Bare_enter_check(0)
  mov bp, si
  mov si, g195
  jmp [bp]

L557: ; Continuation
  Bare_enter_check(12)
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [CurrentCont]
  push word L556
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L558: ; Function: (lam,t1)
  Bare_enter_check(18)
  push word 49
  push word 7
  push word 49
  push word 1
  mov [Temps+2], sp
  push word 8 ;; scanned
  push word si
  push word [CurrentCont]
  push word L557
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov si, [Temps+2]
  jmp [bp]

L559: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L560: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L559
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, 47
  jmp [bp]

L561: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L560
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g9
  mov si, 1
  jmp [bp]

L562: ; Continuation
  Bare_enter_check(12)
  push word [bp+4]
  push word L558
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [CurrentCont]
  push word L561
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g7
  mov si, [Temps+2]
  jmp [bp]

L563: ; Continuation
  Bare_enter_check(14)
  push word si
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L562
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+2]
  jmp [bp]

L564: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L563
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L565: ; Continuation
  Bare_enter_check(36)
  push word g194
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
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L564
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g24
  mov si, [Temps+6]
  jmp [bp]

L566: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L565
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g26
  mov si, g193
  jmp [bp]

L567: ; Function: (lam,t1)
  Bare_enter_check(14)
  mov bx, [bp+4]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L555
  push word 1
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [bp+2]
  push word [CurrentCont]
  push word L566
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g83
  mov si, [Temps+4]
  jmp [bp]

L568: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L569: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L568
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L570: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L569
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L571: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L570
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g199
  jmp [bp]

L572: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L571
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g198
  jmp [bp]

L573: ; Arm: 835'11
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L572
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g26
  mov si, g197
  jmp [bp]

L574: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L575: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L574
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L576: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L575
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L577: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L576
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g213
  jmp [bp]

L578: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L577
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g212
  jmp [bp]

L579: ; Arm: 838'12
  push word [CurrentCont]
  push word L578
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g26
  mov si, g211
  jmp [bp]

L580: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 1
  jz L579
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word 3
  mov [Temps+4], sp
  push word 4 ;; scanned
  mov bx, [bp+4]
  mov ax, [Temps+4]
  mov [bx], ax
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov si, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L581: ; Arm: 533'9
  mov si, g204
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L582: ; Continuation
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

L583: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L582
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+8]
  jmp [bp]

L584: ; Arm: 539'10
  push word [bp+10]
  push word [bp+6]
  push word [bp+2]
  push word [CurrentCont]
  push word L583
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g20
  mov si, g205
  jmp [bp]

L585: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L586: ; Continuation
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
  push word L585
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, [Temps+4]
  jmp [bp]

L587: ; Arm: 543'19
  push word [bp+10]
  push word [bp+8]
  push word [CurrentCont]
  push word L586
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+4]
  mov bp, [bp+6]
  jmp [bp]

L588: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L589: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L588
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L590: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L589
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L591: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L590
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+10]
  jmp [bp]

L592: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L591
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L593: ; Continuation
  Bare_enter_check(16)
  mov bx, si
  cmp word [bx], 1
  jz L587
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
  push word L592
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g6
  mov si, g208
  jmp [bp]

L594: ; Continuation
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
  push word L593
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L595: ; Function: (lam,t1)
  Bare_enter_check(14)
  mov ax, si
  cmp word ax, [bp+4]
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L584
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L594
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov si, [bp+2]
  mov bp, g92
  jmp [bp]

L596: ; Function: (lam,t1)
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L595
  mov [Temps+2], sp
  push word 12 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L597: ; Function: (loop,t5)
  Bare_enter_check(12)
  push word bp
  push word si
  push word [bp+4]
  push word [bp+2]
  push word L596
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L598: ; Continuation
  Bare_enter_check(0)
  mov bp, si
  mov si, 1
  jmp [bp]

L599: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L598
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, si
  mov si, g210
  jmp [bp]

L600: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L599
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L601: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L600
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L602: ; Continuation
  Bare_enter_check(10)
  mov ax, [bp+4]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L601
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L603: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L602
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+8]
  mov bp, g9
  jmp [bp]

L604: ; Continuation
  Bare_enter_check(28)
  push word [bp+4]
  push word [CurrentCont]
  push word L580
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, si
  cmp word [bx], 1
  jz L581
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
  push word L597
  mov [Temps+10], sp
  push word 6 ;; scanned
  mov ax, 3
  mov bx, [Temps+6]
  add ax, bx
  sub ax, 1
  mov [Temps+12], ax
  push word [Temps+12]
  push word [Temps+10]
  push word [Temps+4]
  push word [CurrentCont]
  push word L603
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g2
  mov si, g209
  jmp [bp]

L605: ; Arm: 496'49
  mov si, g203
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L606: ; Continuation
  Bare_enter_check(24)
  push word [bp+4]
  push word [CurrentCont]
  push word L604
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L605
  mov ax, [bp+6]
  mov bx, 9
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+2], ax
  mov ax, [bp+6]
  mov bx, 11
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+4], ax
  mov ax, [bp+6]
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

L607: ; Arm: 12'9
  mov si, g201
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L608: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L606
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L607
  mov si, g202
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L609: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L608
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, g200
  jmp [bp]

L610: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L609
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g56
  mov si, si
  jmp [bp]

L611: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L610
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, 9
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
  mov si, 1
  jmp [bp]

L613: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L612
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g68
  mov si, si
  jmp [bp]

L614: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L613
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

L615: ; Function: (lam,t1)
  Bare_enter_check(14)
  mov bx, [bp+2]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L573
  push word 1
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [bp+2]
  push word [CurrentCont]
  push word L614
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g84
  mov si, [Temps+4]
  jmp [bp]

L616: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L617: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L616
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L618: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L617
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L619: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L618
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g217
  jmp [bp]

L620: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L619
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g216
  jmp [bp]

L621: ; Arm: 845'9
  push word [CurrentCont]
  push word L620
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g26
  mov si, g215
  jmp [bp]

L622: ; Function: (lam,t1)
  Bare_enter_check(6)
  mov bx, [bp+2]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L621
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov bx, [bp+2]
  mov ax, g218
  mov [bx], ax
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov si, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L623: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L624: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L623
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L625: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L624
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L626: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L625
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g222
  jmp [bp]

L627: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L626
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g221
  jmp [bp]

L628: ; Arm: 851'9
  push word [CurrentCont]
  push word L627
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g26
  mov si, g220
  jmp [bp]

L629: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L630: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L629
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
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
  mov bp, si
  mov si, g251
  jmp [bp]

L635: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L634
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g26
  mov si, si
  jmp [bp]

L636: ; Arm: 434'9
  mov si, g244
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L637: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L638: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L637
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L639: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L638
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L640: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L639
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, si
  mov si, g250
  jmp [bp]

L641: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L640
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g26
  mov si, si
  jmp [bp]

L642: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L641
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov si, si
  jmp [bp]

L643: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L642
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L644: ; Continuation
  Bare_enter_check(16)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L643
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g2
  mov si, g249
  jmp [bp]

L645: ; Continuation
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L644
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g61
  mov si, g247
  jmp [bp]

L646: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L645
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g26
  mov si, g246
  jmp [bp]

L647: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L646
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g26
  mov si, si
  jmp [bp]

L648: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+6]
  push word [CurrentCont]
  push word L647
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+4]
  mov bp, g31
  jmp [bp]

L649: ; Continuation
  Bare_enter_check(22)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L635
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [bp+4]
  cmp word [bx], 1
  jz L636
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [Temps+6]
  push word [Temps+4]
  push word [CurrentCont]
  push word L648
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g26
  mov si, g245
  jmp [bp]

L650: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L649
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g26
  mov si, g243
  jmp [bp]

L651: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L650
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g26
  mov si, si
  jmp [bp]

L652: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L651
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L653: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L652
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+4]
  mov bp, g31
  jmp [bp]

L654: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L653
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g26
  mov si, g242
  jmp [bp]

L655: ; Arm: 865'25
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L654
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g26
  mov si, g241
  jmp [bp]

L656: ; Continuation
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 3
  jz L655
  mov si, g252
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L657: ; Arm: 6'36
  mov si, g239
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L658: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L656
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 1
  jz L657
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov si, g240
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L659: ; Continuation
  Bare_enter_check(14)
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L658
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L660: ; Function: (lam,t1)
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L659
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+2]
  mov bp, g92
  jmp [bp]

L661: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L662: ; Continuation
  Bare_enter_check(8)
  mov ax, [bp+4]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  push word [bp+6]
  push word [CurrentCont]
  push word L661
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L663: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L662
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g9
  mov si, 1
  jmp [bp]

L664: ; Continuation
  Bare_enter_check(14)
  push word [bp+4]
  push word L660
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word si
  push word [CurrentCont]
  push word L663
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g7
  mov si, [Temps+2]
  jmp [bp]

L665: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L664
  mov [CurrentCont], sp
  push word 6 ;; scanned
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

L666: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L665
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [bp+4]
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

L667: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L666
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g41
  mov si, si
  jmp [bp]

L668: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L667
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g22
  mov si, g238
  jmp [bp]

L669: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L668
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g41
  mov si, si
  jmp [bp]

L670: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L669
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L671: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L670
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L672: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L671
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, g237
  jmp [bp]

L673: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L672
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g26
  mov si, si
  jmp [bp]

L674: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L673
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L675: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L674
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L676: ; Continuation
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L675
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g2
  mov si, g236
  jmp [bp]

L677: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L676
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g61
  mov si, g234
  jmp [bp]

L678: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L677
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g26
  mov si, g233
  jmp [bp]

L679: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L678
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g41
  mov si, si
  jmp [bp]

L680: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L679
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L681: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L680
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L682: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L681
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, si
  mov si, g232
  jmp [bp]

L683: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L682
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g26
  mov si, si
  jmp [bp]

L684: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L683
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov si, si
  jmp [bp]

L685: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L684
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+8]
  jmp [bp]

L686: ; Continuation
  Bare_enter_check(16)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L685
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g2
  mov si, g231
  jmp [bp]

L687: ; Continuation
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L686
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g61
  mov si, g229
  jmp [bp]

L688: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L687
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g26
  mov si, g228
  jmp [bp]

L689: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L688
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g41
  mov si, si
  jmp [bp]

L690: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L689
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L691: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L690
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov si, si
  jmp [bp]

L692: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L691
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, si
  mov si, g227
  jmp [bp]

L693: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L692
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g26
  mov si, si
  jmp [bp]

L694: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L695: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L694
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L696: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L695
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L697: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L696
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov si, si
  jmp [bp]

L698: ; Continuation
  Bare_enter_check(14)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L697
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov si, [bp+4]
  mov bp, g31
  jmp [bp]

L699: ; Continuation
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L698
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g26
  mov si, g226
  jmp [bp]

L700: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L699
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g26
  mov si, si
  jmp [bp]

L701: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L700
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+4]
  mov bp, g31
  jmp [bp]

L702: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L701
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g26
  mov si, g225
  jmp [bp]

L703: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L702
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g26
  mov si, si
  jmp [bp]

L704: ; Continuation
  Bare_enter_check(24)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L693
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, [bp+6]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [bx+6]
  mov [Temps+6], ax
  push word [Temps+6]
  push word [Temps+4]
  push word [CurrentCont]
  push word L703
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g31
  mov si, [Temps+2]
  jmp [bp]

L705: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L704
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g26
  mov si, g224
  jmp [bp]

L706: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L705
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g41
  mov si, si
  jmp [bp]

L707: ; Function: (lam,t1)
  Bare_enter_check(14)
  mov bx, [bp+2]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L628
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
  push word [CurrentCont]
  push word L706
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g22
  mov si, g223
  jmp [bp]

L708: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L709: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L708
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L710: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L709
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L711: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L710
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g256
  jmp [bp]

L712: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L711
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g255
  jmp [bp]

L713: ; Arm: 872'9
  push word [CurrentCont]
  push word L712
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g26
  mov si, g254
  jmp [bp]

L714: ; Arm: 881'17
  mov si, g257
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L715: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L716: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L715
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L717: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L716
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L718: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L717
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L719: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L718
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L720: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L719
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, si
  mov si, g260
  jmp [bp]

L721: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L720
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g26
  mov si, si
  jmp [bp]

L722: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L721
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g31
  mov si, si
  jmp [bp]

L723: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L722
  mov [CurrentCont], sp
  push word 10 ;; scanned
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

L724: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L723
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g26
  mov si, g259
  jmp [bp]

L725: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L724
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g26
  mov si, si
  jmp [bp]

L726: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+6]
  push word [CurrentCont]
  push word L725
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+4]
  mov bp, g31
  jmp [bp]

L727: ; Continuation
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 1
  jz L714
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [bp+4]
  push word [CurrentCont]
  push word L726
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g26
  mov si, g258
  jmp [bp]

L728: ; Continuation
  Bare_enter_check(14)
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L727
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L729: ; Function: (lam,t1)
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L728
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+2]
  mov bp, g92
  jmp [bp]

L730: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L731: ; Continuation
  Bare_enter_check(8)
  mov ax, [bp+4]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  push word [bp+6]
  push word [CurrentCont]
  push word L730
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L732: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L731
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g9
  mov si, 1
  jmp [bp]

L733: ; Continuation
  Bare_enter_check(14)
  push word [bp+4]
  push word L729
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word si
  push word [CurrentCont]
  push word L732
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g7
  mov si, [Temps+2]
  jmp [bp]

L734: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L733
  mov [CurrentCont], sp
  push word 6 ;; scanned
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

L735: ; Function: (lam,t1)
  Bare_enter_check(6)
  mov bx, [bp+2]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L713
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov ax, [bx+6]
  mov [Temps+10], ax
  push word [CurrentCont]
  push word L734
  mov [CurrentCont], sp
  push word 4 ;; scanned
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

L736: ; Arm: 898'9
  mov si, g272
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L737: ; Continuation
  Bare_enter_check(0)
  mov bp, si
  mov si, 1
  jmp [bp]

L738: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L737
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L739: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L738
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g41
  mov si, si
  jmp [bp]

L740: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L739
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L741: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L740
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L742: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L741
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, si
  mov si, g274
  jmp [bp]

L743: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L742
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g26
  mov si, si
  jmp [bp]

L744: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L743
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g31
  mov si, si
  jmp [bp]

L745: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L744
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [bp+6]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L746: ; Continuation
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 1
  jz L736
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [bp+4]
  push word [CurrentCont]
  push word L745
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g26
  mov si, g273
  jmp [bp]

L747: ; Continuation
  Bare_enter_check(0)
  mov si, g265
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L748: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L747
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g41
  mov si, si
  jmp [bp]

L749: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L748
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L750: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L749
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L751: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L750
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g264
  jmp [bp]

L752: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L751
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g263
  jmp [bp]

L753: ; Arm: 611'9
  push word [CurrentCont]
  push word L752
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g26
  mov si, g262
  jmp [bp]

L754: ; Continuation
  Bare_enter_check(0)
  mov si, g270
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L755: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L754
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g41
  mov si, si
  jmp [bp]

L756: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L755
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L757: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L756
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L758: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L757
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g269
  jmp [bp]

L759: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L758
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g268
  jmp [bp]

L760: ; Arm: 614'12
  push word [CurrentCont]
  push word L759
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g26
  mov si, g267
  jmp [bp]

L761: ; Continuation
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

L762: ; Continuation
  Bare_enter_check(26)
  push word g271
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
  push word L761
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, si
  mov si, [Temps+4]
  jmp [bp]

L763: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L762
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+8]
  jmp [bp]

L764: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L763
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L765: ; Continuation
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L760
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [Temps+6]
  push word [Temps+4]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L764
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

L766: ; Arm: 557'10
  mov si, g266
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L767: ; Function: (lam,t1)
  Bare_enter_check(42)
  mov bx, [bp+4]
  mov ax, [bx]
  mov [Temps+2], ax
  push word [bp+6]
  push word [CurrentCont]
  push word L746
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L753
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L765
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+4]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov ax, [bx+6]
  mov [Temps+10], ax
  mov bx, [Temps+8]
  cmp word [bx], 1
  jz L766
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

L768: ; Arm: 908'9
  mov si, g286
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L769: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L770: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L769
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

L771: ; Continuation
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L768
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [bp+6]
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word [CurrentCont]
  push word L770
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov si, [Temps+4]
  jmp [bp]

L772: ; Continuation
  Bare_enter_check(0)
  mov si, g281
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L773: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L772
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g41
  mov si, si
  jmp [bp]

L774: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L773
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L775: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L774
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L776: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L775
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g280
  jmp [bp]

L777: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L776
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g279
  jmp [bp]

L778: ; Arm: 627'9
  push word [CurrentCont]
  push word L777
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g26
  mov si, g278
  jmp [bp]

L779: ; Continuation
  Bare_enter_check(0)
  mov si, g285
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L780: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L779
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g41
  mov si, si
  jmp [bp]

L781: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L780
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L782: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L781
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L783: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L782
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g284
  jmp [bp]

L784: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L783
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g283
  jmp [bp]

L785: ; Arm: 631'12
  push word [CurrentCont]
  push word L784
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g26
  mov si, g282
  jmp [bp]

L786: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 1
  jz L785
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

L787: ; Continuation
  Bare_enter_check(12)
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [CurrentCont]
  push word L786
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L788: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L787
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g92
  mov si, si
  jmp [bp]

L789: ; Continuation
  Bare_enter_check(18)
  mov bx, [bp+4]
  mov ax, [bx]
  mov [Temps+2], ax
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L771
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L778
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [bp+8]
  push word [CurrentCont]
  push word L788
  mov [CurrentCont], sp
  push word 6 ;; scanned
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

L790: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L789
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g41
  mov si, si
  jmp [bp]

L791: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L790
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L792: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L791
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov si, si
  jmp [bp]

L793: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L792
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, si
  mov si, g277
  jmp [bp]

L794: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L793
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g26
  mov si, si
  jmp [bp]

L795: ; Continuation
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L794
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov si, [bp+8]
  mov bp, g31
  jmp [bp]

L796: ; Function: (lam,t1)
  Bare_enter_check(12)
  push word si
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L795
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g26
  mov si, g276
  jmp [bp]

L797: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L798: ; Continuation
  Bare_enter_check(14)
  push word [bp+6]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+8]
  push word [CurrentCont]
  push word L797
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov si, [Temps+2]
  jmp [bp]

L799: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L798
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g41
  mov si, si
  jmp [bp]

L800: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L799
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L801: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L800
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov si, si
  jmp [bp]

L802: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L801
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov si, si
  jmp [bp]

L803: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L802
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, [bp+14]
  mov si, si
  jmp [bp]

L804: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L803
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, si
  mov si, g290
  jmp [bp]

L805: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L804
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, g26
  mov si, si
  jmp [bp]

L806: ; Continuation
  Bare_enter_check(18)
  push word si
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L805
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov si, [bp+8]
  mov bp, g31
  jmp [bp]

L807: ; Continuation
  Bare_enter_check(16)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L806
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g26
  mov si, g289
  jmp [bp]

L808: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L807
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g26
  mov si, si
  jmp [bp]

L809: ; Continuation
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L808
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov si, [bp+6]
  mov bp, g31
  jmp [bp]

L810: ; Function: (lam,t1)
  Bare_enter_check(12)
  push word si
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L809
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g26
  mov si, g288
  jmp [bp]

L811: ; Function: (lam,t1)
  Bare_enter_check(8)
  push word si
  push word [bp+2]
  push word L810
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L812: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L813: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L812
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L814: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L813
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L815: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L814
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g294
  jmp [bp]

L816: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L815
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g293
  jmp [bp]

L817: ; Arm: 921'9
  push word [CurrentCont]
  push word L816
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g26
  mov si, g292
  jmp [bp]

L818: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L819: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L818
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L820: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L819
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L821: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L820
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g297
  jmp [bp]

L822: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L821
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g296
  jmp [bp]

L823: ; Arm: 925'12
  push word [CurrentCont]
  push word L822
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g26
  mov si, g295
  jmp [bp]

L824: ; Continuation
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
  mov si, g299
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L825: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L824
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, g298
  jmp [bp]

L826: ; Continuation
  Bare_enter_check(16)
  push word [bp+6]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L825
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L827: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L826
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+10]
  mov bp, [bp+4]
  jmp [bp]

L828: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L827
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+12]
  jmp [bp]

L829: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L828
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g93
  mov si, si
  jmp [bp]

L830: ; Continuation
  Bare_enter_check(40)
  mov bx, si
  cmp word [bx], 1
  jz L823
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [Temps+6]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L829
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, [bp+10]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov ax, [bx+4]
  mov [Temps+10], ax
  mov ax, [bx+6]
  mov [Temps+12], ax
  push word [bp+8]
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

L831: ; Continuation
  Bare_enter_check(22)
  push word [bp+8]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L830
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L832: ; Continuation
  Bare_enter_check(16)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L831
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g92
  mov si, si
  jmp [bp]

L833: ; Function: (lam,t1)
  Bare_enter_check(14)
  mov bx, [bp+4]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L817
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [Temps+4]
  push word si
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L832
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

L834: ; Arm: 942'18
  mov si, g311
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L835: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, [bp+8]
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov bp, [bp+6]
  mov si, [Temps+2]
  jmp [bp]

L836: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L837: ; Arm: 945'6
  push word [CurrentCont]
  push word L836
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, [Temps+4]
  jmp [bp]

L838: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L839: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L838
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L840: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L839
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L841: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L840
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, 1
  jmp [bp]

L842: ; Continuation
  Bare_enter_check(20)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L834
  mov ax, [bp+4]
  mov [Temps+4], ax
  mov ax, si
  cmp word ax, 129
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L835
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L837
  push word si
  push word [CurrentCont]
  push word L841
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g68
  mov si, [Temps+4]
  jmp [bp]

L843: ; Continuation
  Bare_enter_check(0)
  mov si, 1
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L844: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L843
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g41
  mov si, si
  jmp [bp]

L845: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L844
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
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
  mov bp, si
  mov si, g303
  jmp [bp]

L848: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L847
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g302
  jmp [bp]

L849: ; Arm: 638'9
  push word [CurrentCont]
  push word L848
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g26
  mov si, g301
  jmp [bp]

L850: ; Continuation
  Bare_enter_check(0)
  mov si, 1
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L851: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L850
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g41
  mov si, si
  jmp [bp]

L852: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L851
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L853: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L852
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L854: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L853
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g306
  jmp [bp]

L855: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L854
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g305
  jmp [bp]

L856: ; Arm: 642'12
  push word [CurrentCont]
  push word L855
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g26
  mov si, g304
  jmp [bp]

L857: ; Arm: 646'33
  mov si, 1
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L858: ; Arm: 648'17
  mov si, 1
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L859: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, 129
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L860: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L859
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L861: ; Arm: 651'15
  push word [bp+10]
  push word [bp+8]
  push word [CurrentCont]
  push word L860
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L862: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L863: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L862
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L864: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L863
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, 1
  jmp [bp]

L865: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+6]
  push word [CurrentCont]
  push word L864
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+4]
  mov bp, g72
  jmp [bp]

L866: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L865
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L867: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L866
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L868: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L867
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g68
  mov si, si
  jmp [bp]

L869: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L868
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

L870: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L869
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+8]
  mov bp, g84
  jmp [bp]

L871: ; Arm: 101'23
  mov si, 129
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L872: ; Continuation
  Bare_enter_check(12)
  mov ax, 129
  cmp word ax, si
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L870
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L871
  mov si, si
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L873: ; Arm: 101'23
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L874: ; Continuation
  Bare_enter_check(12)
  mov bx, si
  cmp word [bx], 3
  jz L861
  mov ax, 129
  mov bx, [bp+10]
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  mov ax, [Temps+2]
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov [Temps+4], ax
  push word [bp+12]
  push word [bp+10]
  push word [bp+4]
  push word [CurrentCont]
  push word L872
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L873
  mov si, [bp+8]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L875: ; Arm: 12'9
  mov si, g309
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L876: ; Continuation
  Bare_enter_check(18)
  mov bx, si
  cmp word [bx], 3
  jz L857
  mov bx, [bp+6]
  cmp word [bx], 1
  jz L858
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [bp+12]
  cmp word ax, 129
  call Bare_make_bool_from_n
  mov [Temps+6], ax
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L874
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L875
  mov si, g310
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L877: ; Arm: 12'9
  mov si, g307
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L878: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, 1
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L876
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L877
  mov si, g308
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L879: ; Function: (lam,t1)
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L878
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L880: ; Function: (loop,t2)
  Bare_enter_check(10)
  push word bp
  push word si
  push word [bp+2]
  push word L879
  mov [Temps+2], sp
  push word 8 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L881: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L882: ; Continuation
  Bare_enter_check(8)
  mov ax, [bp+6]
  mov bx, [bp+4]
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  push word [bp+4]
  push word [CurrentCont]
  push word L881
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L883: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L882
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L884: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L883
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [bp+6]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L885: ; Continuation
  Bare_enter_check(18)
  mov bx, si
  cmp word [bx], 1
  jz L856
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [bp+4]
  push word L880
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+6]
  push word [CurrentCont]
  push word L884
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov si, [Temps+8]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L886: ; Continuation
  Bare_enter_check(16)
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L885
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L887: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L886
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g92
  mov si, si
  jmp [bp]

L888: ; Function: (loop,t2)
  Bare_enter_check(24)
  mov bx, [bp+2]
  mov ax, [bx]
  mov [Temps+2], ax
  push word bp
  push word si
  push word [bp+6]
  push word [CurrentCont]
  push word L842
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L849
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L887
  mov [CurrentCont], sp
  push word 10 ;; scanned
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

L889: ; Function: (lam,t1)
  Bare_enter_check(600)
  mov ax, 129
  call Bare_make_bytes
  mov [Temps+2], ax
  push word [Temps+2]
  push word si
  push word [bp+2]
  push word L888
  mov [Temps+4], sp
  push word 8 ;; scanned
  mov bp, [Temps+4]
  mov si, 1
  jmp [bp]

L890: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L891: ; Arm: 986'36
  push word [CurrentCont]
  push word L890
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, g315
  jmp [bp]

L892: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov bp, [bp+6]
  mov si, [Temps+2]
  jmp [bp]

L893: ; Arm: 970'7
  mov si, g318
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L894: ; Arm: 747'9
  mov si, g319
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L895: ; Arm: 751'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L896: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L895
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L897: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L896
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L898: ; Function: (loop,t3)
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L894
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
  push word [bp+2]
  push word [CurrentCont]
  push word L897
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g56
  mov si, [Temps+6]
  jmp [bp]

L899: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L900: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L899
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L901: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L900
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L902: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L901
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g322
  jmp [bp]

L903: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L902
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g26
  jmp [bp]

L904: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L903
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g321
  jmp [bp]

L905: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L904
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, si
  mov si, g320
  jmp [bp]

L906: ; Arm: 973'12
  push word [CurrentCont]
  push word L905
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov si, [bp+4]
  mov bp, g26
  jmp [bp]

L907: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 1
  jz L906
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov si, [bp+6]
  mov bp, [Temps+4]
  jmp [bp]

L908: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L907
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L909: ; Continuation
  Bare_enter_check(28)
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L892
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 1
  jz L893
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+2]
  push word L898
  mov [Temps+6], sp
  push word 4 ;; scanned
  push word [Temps+6]
  push word [Temps+4]
  push word [Temps+2]
  push word [CurrentCont]
  push word L908
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov si, [Temps+8]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L910: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L909
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+10]
  jmp [bp]

L911: ; Continuation
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L910
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g20
  mov si, g317
  jmp [bp]

L912: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L911
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov si, si
  jmp [bp]

L913: ; Continuation
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L912
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov si, [bp+10]
  mov bp, g22
  jmp [bp]

L914: ; Continuation
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 3
  jz L891
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L913
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g62
  mov si, g316
  jmp [bp]

L915: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L914
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L916: ; Continuation
  Bare_enter_check(16)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L915
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g56
  mov si, si
  jmp [bp]

L917: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L916
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g79
  mov si, g314
  jmp [bp]

L918: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L917
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g41
  mov si, si
  jmp [bp]

L919: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L918
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L920: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L919
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, si
  mov si, g313
  jmp [bp]

L921: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L920
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g26
  mov si, si
  jmp [bp]

L922: ; Function: (repl,t14)
  Bare_enter_check(14)
  push word bp
  push word si
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L921
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g31
  mov si, si
  jmp [bp]

L923: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, 3
  jmp [bp]

L924: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L923
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g41
  mov si, si
  jmp [bp]

L925: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L924
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L926: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L925
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L927: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L926
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, g327
  jmp [bp]

L928: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L927
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g26
  mov si, si
  jmp [bp]

L929: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L928
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L930: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L929
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g61
  mov si, g326
  jmp [bp]

L931: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L930
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g26
  mov si, g325
  jmp [bp]

L932: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L931
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g41
  mov si, si
  jmp [bp]

L933: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L932
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g22
  mov si, g324
  jmp [bp]

L934: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L933
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L935: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+6]
  push word [CurrentCont]
  push word L934
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

L936: ; Continuation
  Bare_enter_check(120)
  push word g312
  push word si
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word [bp+26]
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [Temps+4]
  push word [bp+24]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word [bp+22]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [Temps+8]
  push word [bp+20]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [Temps+10]
  push word [bp+18]
  push word 3
  mov [Temps+12], sp
  push word 6 ;; scanned
  push word [Temps+12]
  push word [bp+16]
  push word 3
  mov [Temps+14], sp
  push word 6 ;; scanned
  push word [Temps+14]
  push word [bp+14]
  push word 3
  mov [Temps+16], sp
  push word 6 ;; scanned
  push word [Temps+16]
  push word [bp+12]
  push word 3
  mov [Temps+18], sp
  push word 6 ;; scanned
  push word [Temps+18]
  push word [bp+10]
  push word 3
  mov [Temps+20], sp
  push word 6 ;; scanned
  push word [Temps+20]
  push word [bp+8]
  push word 3
  mov [Temps+22], sp
  push word 6 ;; scanned
  push word [Temps+22]
  push word [bp+6]
  push word 3
  mov [Temps+24], sp
  push word 6 ;; scanned
  push word [Temps+24]
  push word 1
  mov [Temps+26], sp
  push word 4 ;; scanned
  push word [Temps+26]
  push word [bp+4]
  push word L922
  mov [Temps+28], sp
  push word 6 ;; scanned
  push word [Temps+28]
  push word [Temps+26]
  push word [CurrentCont]
  push word L935
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g96
  mov si, g323
  jmp [bp]

L937: ; Continuation
  Bare_enter_check(36)
  push word [bp+6]
  push word L889
  mov [Temps+2], sp
  push word 4 ;; scanned
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
  push word [bp+4]
  push word [CurrentCont]
  push word L936
  mov [CurrentCont], sp
  push word 28 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L938: ; Continuation
  Bare_enter_check(32)
  push word si
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
  push word L937
  mov [CurrentCont], sp
  push word 30 ;; scanned
  mov bp, g116
  mov si, g300
  jmp [bp]

L939: ; Continuation
  Bare_enter_check(38)
  push word [bp+8]
  push word [bp+6]
  push word L833
  mov [Temps+2], sp
  push word 6 ;; scanned
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
  push word [bp+4]
  push word [CurrentCont]
  push word L938
  mov [CurrentCont], sp
  push word 28 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L940: ; Continuation
  Bare_enter_check(32)
  push word si
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
  push word L939
  mov [CurrentCont], sp
  push word 30 ;; scanned
  mov bp, g116
  mov si, g291
  jmp [bp]

L941: ; Continuation
  Bare_enter_check(36)
  push word [bp+10]
  push word L811
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L940
  mov [CurrentCont], sp
  push word 28 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L942: ; Continuation
  Bare_enter_check(32)
  push word si
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
  push word L941
  mov [CurrentCont], sp
  push word 30 ;; scanned
  mov bp, g137
  mov si, g287
  jmp [bp]

L943: ; Continuation
  Bare_enter_check(38)
  push word [bp+10]
  push word [bp+8]
  push word L796
  mov [Temps+2], sp
  push word 6 ;; scanned
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
  push word L942
  mov [CurrentCont], sp
  push word 28 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L944: ; Continuation
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
  push word [CurrentCont]
  push word L943
  mov [CurrentCont], sp
  push word 28 ;; scanned
  mov bp, g116
  mov si, g275
  jmp [bp]

L945: ; Continuation
  Bare_enter_check(38)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word L767
  mov [Temps+2], sp
  push word 8 ;; scanned
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
  push word L944
  mov [CurrentCont], sp
  push word 26 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L946: ; Continuation
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
  push word [CurrentCont]
  push word L945
  mov [CurrentCont], sp
  push word 26 ;; scanned
  mov bp, g103
  mov si, g261
  jmp [bp]

L947: ; Continuation
  Bare_enter_check(32)
  push word [bp+8]
  push word L735
  mov [Temps+2], sp
  push word 4 ;; scanned
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
  push word L946
  mov [CurrentCont], sp
  push word 24 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L948: ; Continuation
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
  push word [CurrentCont]
  push word L947
  mov [CurrentCont], sp
  push word 24 ;; scanned
  mov bp, g103
  mov si, g253
  jmp [bp]

L949: ; Continuation
  Bare_enter_check(30)
  push word [bp+8]
  push word L707
  mov [Temps+2], sp
  push word 4 ;; scanned
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
  push word L948
  mov [CurrentCont], sp
  push word 22 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L950: ; Continuation
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
  push word L949
  mov [CurrentCont], sp
  push word 22 ;; scanned
  mov bp, g103
  mov si, g219
  jmp [bp]

L951: ; Continuation
  Bare_enter_check(28)
  push word [bp+8]
  push word L622
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L950
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L952: ; Continuation
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
  push word L951
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov bp, g103
  mov si, g214
  jmp [bp]

L953: ; Continuation
  Bare_enter_check(26)
  push word [bp+8]
  push word L615
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
  push word L952
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L954: ; Continuation
  Bare_enter_check(20)
  push word si
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L953
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, g103
  mov si, g196
  jmp [bp]

L955: ; Continuation
  Bare_enter_check(26)
  push word [bp+8]
  push word [bp+6]
  push word L567
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L954
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L956: ; Continuation
  Bare_enter_check(18)
  push word si
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L955
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, g103
  mov si, g189
  jmp [bp]

L957: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L956
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, si
  mov si, g188
  jmp [bp]

L958: ; Continuation
  Bare_enter_check(16)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L957
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g103
  mov si, g178
  jmp [bp]

L959: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L958
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, si
  mov si, g177
  jmp [bp]

L960: ; Continuation
  Bare_enter_check(32)
  push word si
  push word L433
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word g95
  mov [Temps+4], sp
  push word 2 ;; scanned
  push word [Temps+4]
  push word [Temps+2]
  push word L549
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+4]
  push word [CurrentCont]
  push word L959
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g103
  mov si, g170
  jmp [bp]

L961: ; Continuation
  Bare_enter_check(24)
  push word g86
  push word `\x00`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word `\x00`
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word si
  push word [CurrentCont]
  push word L960
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g24
  mov si, [Temps+4]
  jmp [bp]

L962: ; Start
  Bare_enter_check(24)
  push word g43
  mov [Temps+2], sp
  push word 2 ;; scanned
  push word [Temps+2]
  push word L417
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word g73
  push word `\x04`
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L961
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g24
  mov si, [Temps+6]
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
  dw L69
g27:
  dw L73
g28:
  dw 1
g29:
  dw 1
g30:
  dw 1
g31:
  dw L80
g32:
  dw L92
g33:
  dw 1
g34:
  dw 3
g35:
  dw 1
g36:
  dw 3
g37:
  dw 1
g38:
  dw 1
g39:
  dw 1
g40:
  dw L95
g41:
  dw L101
g42:
  dw 1
g43:
  dw 1
g44:
  dw 15
  db `trace: `
g45:
  dw 3
  db `\n`
g46:
  dw 1
g47:
  dw 1
g48:
  dw L109
g49:
  dw 1
g50:
  dw 3
g51:
  dw 1
g52:
  dw 3
g53:
  dw 1
g54:
  dw 3
g55:
  dw 1
g56:
  dw L119
g57:
  dw 1
g58:
  dw 1
g59:
  dw 1
g60:
  dw 1
  db ``
g61:
  dw L140
g62:
  dw L157
g63:
  dw L150
g64:
  dw 1
g65:
  dw 1
g66:
  dw 3
g67:
  dw 1
g68:
  dw L165
g69:
  dw 1
g70:
  dw 3
g71:
  dw 1
g72:
  dw L172
g73:
  dw 1
g74:
  dw L188
g75:
  dw 1
g76:
  dw 1
g77:
  dw 3
g78:
  dw 1
g79:
  dw L189
g80:
  dw 3
  db `[`
g81:
  dw 3
  db `]`
g83:
  dw L196
g84:
  dw L201
g85:
  dw L210
g86:
  dw 1
g87:
  dw 1
g88:
  dw 1
g89:
  dw 1
g90:
  dw L211
g91:
  dw L233
g92:
  dw L234
g93:
  dw L239
g94:
  dw L241
g95:
  dw 1
g96:
  dw L246
g97:
  dw 1
g98:
  dw 15
  db `usage: `
g99:
  dw 21
  db ` [no args]`
g100:
  dw 15
  db `Error: `
g101:
  dw 3
  db `\n`
g102:
  dw 1
g103:
  dw L259
g104:
  dw 15
  db `usage: `
g105:
  dw 13
  db ` [int]`
g106:
  dw 15
  db `Error: `
g107:
  dw 3
  db `\n`
g108:
  dw 15
  db `usage: `
g109:
  dw 13
  db ` [int]`
g110:
  dw 15
  db `Error: `
g111:
  dw 3
  db `\n`
g112:
  dw 15
  db `usage: `
g113:
  dw 13
  db ` [int]`
g114:
  dw 15
  db `Error: `
g115:
  dw 3
  db `\n`
g116:
  dw L293
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
  dw 15
  db `usage: `
g122:
  dw 25
  db ` [int] [int]`
g123:
  dw 15
  db `Error: `
g124:
  dw 3
  db `\n`
g125:
  dw 15
  db `usage: `
g126:
  dw 25
  db ` [int] [int]`
g127:
  dw 15
  db `Error: `
g128:
  dw 3
  db `\n`
g129:
  dw 15
  db `usage: `
g130:
  dw 25
  db ` [int] [int]`
g131:
  dw 15
  db `Error: `
g132:
  dw 3
  db `\n`
g133:
  dw 15
  db `usage: `
g134:
  dw 25
  db ` [int] [int]`
g135:
  dw 15
  db `Error: `
g136:
  dw 3
  db `\n`
g137:
  dw L349
g138:
  dw 1
g139:
  dw 1
g140:
  dw 3
  db `\n`
g141:
  dw 15
  db `Error: `
g142:
  dw 65
  db `no filesystem mounted; try mount`
g143:
  dw 3
  db `\n`
g144:
  dw 15
  db `Error: `
g145:
  dw 75
  db `inode is not allocated (no such file)`
g146:
  dw 3
  db `\n`
g147:
  dw 1
g148:
  dw 1
g149:
  dw 1
g150:
  dw 15
  db `Error: `
g151:
  dw 69
  db `no blocks available (disk is full)`
g152:
  dw 3
  db `\n`
g153:
  dw 1
g154:
  dw 1
g155:
  dw 1
  db ``
g156:
  dw L362
g157:
  dw 1
g158:
  dw 1
  db ``
g159:
  dw 1
g160:
  dw 1
g161:
  dw 15
  db `Error: `
g162:
  dw 69
  db `no blocks available (disk is full)`
g163:
  dw 3
  db `\n`
g164:
  dw 1
g165:
  dw 3
g166:
  dw 1
g167:
  dw 1
g168:
  dw 1
g169:
  dw 1
g170:
  dw 9
  db `wipe`
g171:
  dw 1
g172:
  dw 3
g173:
  dw 1
g174:
  dw 1
g175:
  dw 3
g176:
  dw 1
g177:
  dw L372
g178:
  dw 9
  db `dump`
g179:
  dw L389
g180:
  dw 1
g181:
  dw 3
g182:
  dw 1
g183:
  dw 1
g184:
  dw 3
g185:
  dw 1
g186:
  dw 5
  db `\\n`
g187:
  dw 1
g188:
  dw L390
g189:
  dw 13
  db `format`
g190:
  dw 15
  db `Error: `
g191:
  dw 95
  db `cannot format a mounted filesystem; try unmount`
g192:
  dw 3
  db `\n`
g193:
  dw 9
  db `BARE`
g194:
  dw 1
g195:
  dw 1
g196:
  dw 11
  db `mount`
g197:
  dw 15
  db `Error: `
g198:
  dw 53
  db `filesystem already mounted`
g199:
  dw 3
  db `\n`
g200:
  dw 9
  db `BARE`
g201:
  dw 1
g202:
  dw 3
g203:
  dw 1
g204:
  dw 1
g205:
  dw 1
g206:
  dw 1
g207:
  dw 3
g208:
  dw L397
g209:
  dw L398
g210:
  dw 1
g211:
  dw 15
  db `Error: `
g212:
  dw 63
  db `no filesystem found; try format`
g213:
  dw 3
  db `\n`
g214:
  dw 15
  db `unmount`
g215:
  dw 15
  db `Error: `
g216:
  dw 65
  db `no filesystem mounted; try mount`
g217:
  dw 3
  db `\n`
g218:
  dw 1
g219:
  dw 11
  db `debug`
g220:
  dw 15
  db `Error: `
g221:
  dw 65
  db `no filesystem mounted; try mount`
g222:
  dw 3
  db `\n`
g223:
  dw 37
  db `Filesystem found:\n`
g224:
  dw 19
  db `- super: `
g225:
  dw 3
  db `/`
g226:
  dw 3
  db `/`
g227:
  dw 3
  db `\n`
g228:
  dw 33
  db `- free blocks = `
g229:
  dw 3
  db `,`
g230:
  dw 3
  db `B`
g231:
  dw L402
g232:
  dw 3
  db `\n`
g233:
  dw 33
  db `- free inodes = `
g234:
  dw 3
  db `,`
g235:
  dw 3
  db `I`
g236:
  dw L406
g237:
  dw 3
  db `\n`
g238:
  dw 21
  db `- inodes:\n`
g239:
  dw 1
g240:
  dw 3
g241:
  dw 5
  db `- `
g242:
  dw 3
  db `I`
g243:
  dw 7
  db ` : `
g244:
  dw 23
  db `unallocated`
g245:
  dw 25
  db `Inode: size=`
g246:
  dw 21
  db `, blocks=[`
g247:
  dw 3
  db `,`
g248:
  dw 3
  db `B`
g249:
  dw L410
g250:
  dw 3
  db `]`
g251:
  dw 3
  db `\n`
g252:
  dw 1
g253:
  dw 5
  db `ls`
g254:
  dw 15
  db `Error: `
g255:
  dw 65
  db `no filesystem mounted; try mount`
g256:
  dw 3
  db `\n`
g257:
  dw 1
g258:
  dw 11
  db `file#`
g259:
  dw 7
  db ` : `
g260:
  dw 3
  db `\n`
g261:
  dw 13
  db `create`
g262:
  dw 15
  db `Error: `
g263:
  dw 65
  db `no filesystem mounted; try mount`
g264:
  dw 3
  db `\n`
g265:
  dw 1
g266:
  dw 1
g267:
  dw 15
  db `Error: `
g268:
  dw 73
  db `no inodes available (too many files)`
g269:
  dw 3
  db `\n`
g270:
  dw 1
g271:
  dw 1
g272:
  dw 1
g273:
  dw 29
  db `Creating file#`
g274:
  dw 45
  db `; (to finish type ^D)\n`
g275:
  dw 13
  db `append`
g276:
  dw 37
  db `Appending to file#`
g277:
  dw 45
  db `; (to finish type ^D)\n`
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
  dw 1
g282:
  dw 15
  db `Error: `
g283:
  dw 75
  db `inode is not allocated (no such file)`
g284:
  dw 3
  db `\n`
g285:
  dw 1
g286:
  dw 1
g287:
  dw 11
  db `splat`
g288:
  dw 35
  db `Overwriting file#`
g289:
  dw 27
  db ` from offset `
g290:
  dw 45
  db `; (to finish type ^D)\n`
g291:
  dw 5
  db `rm`
g292:
  dw 15
  db `Error: `
g293:
  dw 65
  db `no filesystem mounted; try mount`
g294:
  dw 3
  db `\n`
g295:
  dw 15
  db `Error: `
g296:
  dw 75
  db `inode is not allocated (no such file)`
g297:
  dw 3
  db `\n`
g298:
  dw 1
g299:
  dw 1
g300:
  dw 7
  db `cat`
g301:
  dw 15
  db `Error: `
g302:
  dw 65
  db `no filesystem mounted; try mount`
g303:
  dw 3
  db `\n`
g304:
  dw 15
  db `Error: `
g305:
  dw 75
  db `inode is not allocated (no such file)`
g306:
  dw 3
  db `\n`
g307:
  dw 1
g308:
  dw 3
g309:
  dw 1
g310:
  dw 3
g311:
  dw 1
g312:
  dw 1
g313:
  dw 5
  db `> `
g314:
  dw 1
g315:
  dw 17
  db `exiting\n`
g316:
  dw 1
g317:
  dw 1
g318:
  dw 1
g319:
  dw 1
g320:
  dw 41
  db ` : command not found`
g321:
  dw 15
  db `Error: `
g322:
  dw 3
  db `\n`
g323:
  dw 1
g324:
  dw 41
  db `Filesystem explorer\n`
g325:
  dw 21
  db `Commands: `
g326:
  dw 3
  db ` `
g327:
  dw 3
  db `\n`

bare_start: jmp L962
