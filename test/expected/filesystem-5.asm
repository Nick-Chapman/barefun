L1: ; Arm: 21'7
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

L4: ; Arm: 26'7
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

L10: ; Arm: 31'7
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

L13: ; Arm: 32'20
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

L18: ; Arm: 36'7
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

L26: ; Arm: 41'7
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

L31: ; Arm: 45'11
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

L36: ; Arm: 48'12
  mov si, g14
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L37: ; Arm: 50'9
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

L41: ; Arm: 10'9
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

L44: ; Arm: 61'7
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

L48: ; Arm: 79'13
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

L54: ; Arm: 88'9
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
  Bare_enter_check(532)
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

L70: ; Arm: 106'13
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

L75: ; Arm: 109'11
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

L78: ; Arm: 110'13
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

L81: ; Arm: 122'9
  push word [bp+2]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L82: ; Arm: 125'15
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

L85: ; Arm: 117'27
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

L87: ; Arm: 10'9
  mov si, g35
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L88: ; Arm: 117'12
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

L90: ; Arm: 10'9
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

L96: ; Arm: 142'7
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

L98: ; Arm: 135'19
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov si, [Temps+10]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L99: ; Arm: 136'22
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov si, [Temps+12]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L100: ; Arm: 137'16
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
  Bare_enter_check(532)
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

L114: ; Arm: 10'9
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

L117: ; Arm: 10'9
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

L160: ; Arm: 10'9
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
  Bare_enter_check(536)
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

L168: ; Arm: 10'9
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

L182: ; Arm: 10'9
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

L185: ; Arm: 135'19
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+18], ax
  mov si, [Temps+18]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L186: ; Arm: 136'22
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+20], ax
  mov si, [Temps+20]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L187: ; Arm: 137'16
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
  Bare_enter_check(530)
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
  mov bx, 9
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov ax, si
  sar ax, 1
  mov bx, 9
  sar bx, 1
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+4], dx
  mov ax, 257
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
  mov si, 257
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
  Bare_enter_check(524)
  mov ax, si
  sar ax, 1
  mov bx, 9
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov ax, si
  sar ax, 1
  mov bx, 9
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
  mov bx, 9
  sar bx, 1
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+12], dx
  mov ax, 257
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

L211: ; Function: (lam,g96)
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

L212: ; Continuation
  Bare_enter_check(0)
  mov si, g92
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L213: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L212
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g41
  mov si, si
  jmp [bp]

L214: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L213
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L215: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L214
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L216: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L215
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g91
  jmp [bp]

L217: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L216
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g90
  jmp [bp]

L218: ; Arm: 525'2
  push word [CurrentCont]
  push word L217
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g26
  mov si, g89
  jmp [bp]

L219: ; Arm: 450'9
  mov si, g94
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L220: ; Arm: 452'14
  mov si, g95
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L221: ; Continuation
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

L222: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L221
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L223: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L222
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L224: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L223
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L225: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L224
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, si
  mov si, 13
  jmp [bp]

L226: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L225
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, si
  mov si, 5
  jmp [bp]

L227: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L226
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+6]
  mov bp, g68
  jmp [bp]

L228: ; Continuation
  Bare_enter_check(12)
  push word [bp+6]
  push word [bp+4]
  push word si
  push word [CurrentCont]
  push word L227
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g2
  mov si, g96
  jmp [bp]

L229: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L228
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g11
  mov si, si
  jmp [bp]

L230: ; Arm: 443'14
  mov si, 1
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L231: ; Continuation
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 1
  jz L219
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L220
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
  push word L229
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L230
  mov ax, [Temps+6]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+10], ax
  mov ax, [Temps+10]
  sar ax, 1
  mov bx, 257
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

L232: ; Arm: 409'32
  mov si, g93
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L233: ; Continuation
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
  push word L231
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
  mov ax, 7
  cmp word ax, [Temps+12]
  call Bare_make_bool_from_n
  mov [Temps+16], ax
  mov bx, [Temps+16]
  cmp word [bx], 3
  jz L232
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

L234: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L233
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, si
  mov si, 17
  jmp [bp]

L235: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L234
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L236: ; Continuation
  Bare_enter_check(8)
  mov ax, si
  sar ax, 1
  mov bx, 33
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
  push word L235
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g68
  jmp [bp]

L237: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L236
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

L238: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L237
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

L239: ; Continuation
  Bare_enter_check(14)
  mov ax, si
  sar ax, 1
  mov bx, 33
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
  push word L238
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g84
  mov si, [Temps+6]
  jmp [bp]

L240: ; Continuation
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 3
  jz L218
  push word [bp+4]
  push word [CurrentCont]
  push word L239
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

L241: ; Arm: 10'9
  mov si, g87
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L242: ; Continuation
  Bare_enter_check(8)
  mov ax, [bp+6]
  cmp word ax, si
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+4]
  push word [CurrentCont]
  push word L240
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L241
  mov si, g88
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L243: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+6]
  push word [CurrentCont]
  push word L242
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [bp+4]
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

L244: ; Function: (lam,t1)
  Bare_enter_check(10)
  push word si
  push word [bp+2]
  push word [CurrentCont]
  push word L243
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, si
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L245: ; Function: (loadI,g97)
  Bare_enter_check(6)
  push word si
  push word L244
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L246: ; Arm: 585'7
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L247: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L248: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L247
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g98
  mov si, si
  jmp [bp]

L249: ; Function: (lam,t1)
  Bare_enter_check(26)
  mov bx, si
  cmp word [bx], 1
  jz L246
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [CurrentCont]
  push word L248
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

L250: ; Function: (giveup_blocks,g98)
  Bare_enter_check(6)
  push word si
  push word L249
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L251: ; Continuation
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

L252: ; Function: (lam,g99)
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L251
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

L253: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L254: ; Arm: 734'9
  push word [bp+2]
  push word [CurrentCont]
  push word L253
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g20
  mov si, g102
  jmp [bp]

L255: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L256: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov bx, si
  cmp word [bx], 1
  jz L254
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
  push word L255
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g101
  mov si, [Temps+10]
  jmp [bp]

L257: ; Function: (loop,g101)
  Bare_enter_check(6)
  push word si
  push word L256
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L258: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L259: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L258
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L260: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L259
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L261: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L260
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g106
  jmp [bp]

L262: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L261
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g26
  jmp [bp]

L263: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L262
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g105
  jmp [bp]

L264: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L263
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L265: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L264
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g104
  jmp [bp]

L266: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L265
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g26
  jmp [bp]

L267: ; Arm: 758'21
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [bp+2]
  push word [CurrentCont]
  push word L266
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g103
  jmp [bp]

L268: ; Function: (lam,t1)
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 3
  jz L267
  mov bp, [bp+4]
  mov si, g107
  jmp [bp]

L269: ; Function: (lam,t1)
  Bare_enter_check(22)
  push word si
  push word [bp+2]
  push word L268
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

L270: ; Function: (mk_com0,g108)
  Bare_enter_check(6)
  push word si
  push word L269
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L271: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L272: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L271
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L273: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L272
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L274: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L273
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g112
  jmp [bp]

L275: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L274
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g26
  jmp [bp]

L276: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L275
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g111
  jmp [bp]

L277: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L276
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L278: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L277
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g110
  jmp [bp]

L279: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L278
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g26
  jmp [bp]

L280: ; Arm: 767'17
  push word [bp+2]
  push word [CurrentCont]
  push word L279
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g109
  jmp [bp]

L281: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L282: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L281
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L283: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L282
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L284: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L283
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g116
  jmp [bp]

L285: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L284
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g26
  jmp [bp]

L286: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L285
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g115
  jmp [bp]

L287: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L286
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L288: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L287
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g114
  jmp [bp]

L289: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L288
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g26
  jmp [bp]

L290: ; Arm: 770'24
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [bp+2]
  push word [CurrentCont]
  push word L289
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g113
  jmp [bp]

L291: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L292: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L291
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L293: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L292
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L294: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L293
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g120
  jmp [bp]

L295: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L294
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g26
  jmp [bp]

L296: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L295
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g119
  jmp [bp]

L297: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L296
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L298: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L297
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g118
  jmp [bp]

L299: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L298
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g26
  jmp [bp]

L300: ; Arm: 773'25
  push word [bp+4]
  push word [CurrentCont]
  push word L299
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g117
  jmp [bp]

L301: ; Continuation
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 1
  jz L300
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bp, [bp+6]
  mov si, [Temps+2]
  jmp [bp]

L302: ; Function: (lam,t1)
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 1
  jz L280
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L290
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L301
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g40
  mov si, [Temps+2]
  jmp [bp]

L303: ; Function: (lam,t1)
  Bare_enter_check(22)
  push word si
  push word [bp+2]
  push word L302
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

L304: ; Function: (mk_comI,g121)
  Bare_enter_check(6)
  push word si
  push word L303
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L305: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L306: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L305
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
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
  mov bp, si
  mov si, g125
  jmp [bp]

L309: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L308
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g26
  jmp [bp]

L310: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L309
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g124
  jmp [bp]

L311: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L310
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L312: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L311
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g123
  jmp [bp]

L313: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L312
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g26
  jmp [bp]

L314: ; Arm: 782'17
  push word [bp+2]
  push word [CurrentCont]
  push word L313
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g122
  jmp [bp]

L315: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L316: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L315
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
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
  mov bp, si
  mov si, g129
  jmp [bp]

L319: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L318
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g26
  jmp [bp]

L320: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L319
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g128
  jmp [bp]

L321: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L320
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L322: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L321
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g127
  jmp [bp]

L323: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L322
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g26
  jmp [bp]

L324: ; Arm: 785'20
  push word [bp+2]
  push word [CurrentCont]
  push word L323
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g126
  jmp [bp]

L325: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L326: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L325
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
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
  mov bp, si
  mov si, g133
  jmp [bp]

L329: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L328
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g26
  jmp [bp]

L330: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L329
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g132
  jmp [bp]

L331: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L330
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L332: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L331
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g131
  jmp [bp]

L333: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L332
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g26
  jmp [bp]

L334: ; Arm: 788'27
  mov ax, [bx+2]
  mov [Temps+10], ax
  mov ax, [bx+4]
  mov [Temps+12], ax
  push word [bp+2]
  push word [CurrentCont]
  push word L333
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g130
  jmp [bp]

L335: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L336: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L335
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L337: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L336
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L338: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L337
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g137
  jmp [bp]

L339: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L338
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g26
  jmp [bp]

L340: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L339
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g136
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
  mov bp, si
  mov si, g135
  jmp [bp]

L343: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L342
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g26
  jmp [bp]

L344: ; Arm: 791'28
  push word [bp+4]
  push word [CurrentCont]
  push word L343
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g134
  jmp [bp]

L345: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L346: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L345
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L347: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L346
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L348: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L347
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g141
  jmp [bp]

L349: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L348
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g26
  jmp [bp]

L350: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L349
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g140
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
  mov bp, si
  mov si, g139
  jmp [bp]

L353: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L352
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g26
  jmp [bp]

L354: ; Arm: 794'31
  push word [bp+4]
  push word [CurrentCont]
  push word L353
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g138
  jmp [bp]

L355: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L356: ; Continuation
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 1
  jz L354
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [CurrentCont]
  push word L355
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L357: ; Continuation
  Bare_enter_check(12)
  mov bx, si
  cmp word [bx], 1
  jz L344
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L356
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+8]
  mov bp, g40
  jmp [bp]

L358: ; Function: (lam,t1)
  Bare_enter_check(12)
  mov bx, si
  cmp word [bx], 1
  jz L314
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 1
  jz L324
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L334
  push word [Temps+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L357
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g40
  mov si, [Temps+2]
  jmp [bp]

L359: ; Function: (lam,t1)
  Bare_enter_check(22)
  push word si
  push word [bp+2]
  push word L358
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

L360: ; Function: (mk_comII,g142)
  Bare_enter_check(6)
  push word si
  push word L359
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L361: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L362: ; Arm: 260'27
  push word [bp+2]
  push word [CurrentCont]
  push word L361
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g20
  mov si, g162
  jmp [bp]

L363: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L364: ; Continuation
  Bare_enter_check(16)
  push word [bp+4]
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word si
  push word [CurrentCont]
  push word L363
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g161
  mov si, [Temps+2]
  jmp [bp]

L365: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, 257
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L366: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L365
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, 257
  jmp [bp]

L367: ; Arm: 254'21
  push word [bp+8]
  push word [CurrentCont]
  push word L366
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+6]
  mov bp, g68
  jmp [bp]

L368: ; Continuation
  Bare_enter_check(18)
  mov ax, 257
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L364
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L367
  mov si, g163
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L369: ; Continuation
  Bare_enter_check(0)
  mov bp, si
  mov si, 257
  jmp [bp]

L370: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L369
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, si
  mov si, 1
  jmp [bp]

L371: ; Arm: 253'21
  push word [CurrentCont]
  push word L370
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g68
  mov si, si
  jmp [bp]

L372: ; Function: (lam,t1)
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
  jz L362
  mov bx, si
  mov ax, [bx]
  mov [Temps+6], ax
  mov ax, 257
  cmp word ax, [Temps+6]
  call Bare_make_bool_from_n
  mov [Temps+8], ax
  push word [Temps+6]
  push word si
  push word [bp+2]
  push word [CurrentCont]
  push word L368
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L371
  mov si, si
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L373: ; Function: (loop,g161)
  Bare_enter_check(6)
  push word si
  push word L372
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L374: ; Continuation
  Bare_enter_check(0)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L375: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L374
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g41
  mov si, si
  jmp [bp]

L376: ; Function: (lam,g176)
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L375
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L377: ; Continuation
  Bare_enter_check(0)
  mov bp, si
  mov si, g205
  jmp [bp]

L378: ; Function: (lam,g206)
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L377
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g7
  mov si, g176
  jmp [bp]

L379: ; Arm: 812'32
  mov si, g211
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L380: ; Arm: 322'24
  mov si, g214
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L381: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov bp, [bp+6]
  mov si, [Temps+2]
  jmp [bp]

L382: ; Arm: 325'32
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov si, [Temps+8]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L383: ; Continuation
  Bare_enter_check(10)
  mov ax, [bp+4]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov ax, [Temps+2]
  sar ax, 1
  mov bx, 257
  sar bx, 1
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+4], dx
  mov ax, [Temps+4]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L381
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L382
  mov si, g216
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L384: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L385: ; Arm: 324'24
  push word [CurrentCont]
  push word L384
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, g215
  jmp [bp]

L386: ; Arm: 135'19
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov si, [Temps+10]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L387: ; Arm: 136'22
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov si, [Temps+12]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L388: ; Arm: 137'16
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+14], ax
  mov si, [Temps+14]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L389: ; Continuation
  Bare_enter_check(16)
  mov bx, si
  cmp word [bx], 3
  jz L380
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
  push word L383
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L385
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
  jz L386
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L387
  mov ax, 53
  cmp word ax, [Temps+6]
  call Bare_make_bool_from_n
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L388
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

L390: ; Arm: 10'9
  mov si, g212
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L391: ; Function: (loop,t4)
  Bare_enter_check(12)
  mov ax, si
  cmp word ax, 1025
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word si
  push word [bp+2]
  push word [CurrentCont]
  push word L389
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L390
  mov si, g213
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L392: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov bp, g208
  mov si, [Temps+2]
  jmp [bp]

L393: ; Continuation
  Bare_enter_check(530)
  mov bx, si
  cmp word [bx], 3
  jz L379
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
  push word L391
  mov [Temps+8], sp
  push word 4 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L392
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [Temps+8]
  mov si, 1
  jmp [bp]

L394: ; Arm: 10'9
  mov si, g209
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L395: ; Function: (loop,g208)
  Bare_enter_check(8)
  mov ax, si
  cmp word ax, 21
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word si
  push word [CurrentCont]
  push word L393
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L394
  mov si, g210
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L396: ; Function: (lam,g217)
  Bare_enter_check(0)
  mov bp, g208
  mov si, 1
  jmp [bp]

L397: ; Arm: 322'24
  mov si, g221
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L398: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov bp, [bp+6]
  mov si, [Temps+2]
  jmp [bp]

L399: ; Arm: 325'32
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov si, [Temps+8]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L400: ; Continuation
  Bare_enter_check(10)
  mov ax, [bp+4]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov ax, [Temps+2]
  sar ax, 1
  mov bx, 257
  sar bx, 1
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+4], dx
  mov ax, [Temps+4]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L398
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L399
  mov si, g223
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L401: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L402: ; Arm: 324'24
  push word [CurrentCont]
  push word L401
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, g222
  jmp [bp]

L403: ; Arm: 135'19
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov si, [Temps+10]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L404: ; Arm: 136'22
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov si, [Temps+12]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L405: ; Arm: 137'16
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+14], ax
  mov si, [Temps+14]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L406: ; Continuation
  Bare_enter_check(16)
  mov bx, si
  cmp word [bx], 3
  jz L397
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
  push word L400
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L402
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
  jz L403
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L404
  mov ax, 53
  cmp word ax, [Temps+6]
  call Bare_make_bool_from_n
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L405
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

L407: ; Arm: 10'9
  mov si, g219
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L408: ; Function: (loop,t4)
  Bare_enter_check(12)
  mov ax, si
  cmp word ax, 1025
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word si
  push word [bp+2]
  push word [CurrentCont]
  push word L406
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L407
  mov si, g220
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L409: ; Function: (lam,g224)
  Bare_enter_check(522)
  mov ax, 1025
  call Bare_make_bytes
  mov [Temps+2], ax
  mov ax, si
  sar ax, 1
  mov bx, [Temps+2]
  call Bare_load_sector
  mov ax, Bare_unit
  mov [Temps+4], ax
  mov ax, [Temps+2]
  mov [Temps+6], ax
  push word [Temps+6]
  push word L408
  mov [Temps+8], sp
  push word 4 ;; scanned
  mov bp, [Temps+8]
  mov si, 1
  jmp [bp]

L410: ; Arm: 10'9
  mov si, g242
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L411: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  cmp word ax, si
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L410
  mov si, g243
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L412: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L411
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

L413: ; Function: (lam,t1)
  Bare_enter_check(8)
  push word [bp+2]
  push word [CurrentCont]
  push word L412
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

L414: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L415: ; Function: (lam,t1)
  Bare_enter_check(14)
  push word si
  push word L413
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+2]
  push word [CurrentCont]
  push word L414
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g4
  mov si, [Temps+2]
  jmp [bp]

L416: ; Function: (lam,g244)
  Bare_enter_check(6)
  push word si
  push word L415
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L417: ; Function: (lam,g245)
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

L418: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L419: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L418
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g31
  mov si, si
  jmp [bp]

L420: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L419
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

L421: ; Function: (lam,g288)
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L420
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g287
  jmp [bp]

L422: ; Arm: 198'14
  mov si, g345
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L423: ; Continuation
  Bare_enter_check(0)
  mov bx, si
  cmp word [bx], 3
  jz L422
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

L424: ; Arm: 10'9
  mov si, g343
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L425: ; Function: (loop,t2)
  Bare_enter_check(12)
  mov ax, si
  cmp word ax, 1025
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word si
  push word [bp+2]
  push word [CurrentCont]
  push word L423
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L424
  mov si, g344
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L426: ; Arm: 803'32
  mov si, g348
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L427: ; Continuation
  Bare_enter_check(0)
  mov bx, si
  cmp word [bx], 3
  jz L426
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

L428: ; Arm: 10'9
  mov si, g346
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L429: ; Function: (loop,t2)
  Bare_enter_check(12)
  mov ax, si
  cmp word ax, 21
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word si
  push word [bp+2]
  push word [CurrentCont]
  push word L427
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L428
  mov si, g347
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L430: ; Continuation
  Bare_enter_check(6)
  mov ax, [bp+4]
  mov [Temps+2], ax
  push word [Temps+2]
  push word L429
  mov [Temps+4], sp
  push word 4 ;; scanned
  mov bp, [Temps+4]
  mov si, 1
  jmp [bp]

L431: ; Function: (lam,g349)
  Bare_enter_check(530)
  mov ax, 1025
  call Bare_make_bytes
  mov [Temps+2], ax
  push word [Temps+2]
  push word L425
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word [CurrentCont]
  push word L430
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [Temps+4]
  mov si, 1
  jmp [bp]

L432: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L433: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L432
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L434: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L433
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L435: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L434
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g45
  jmp [bp]

L436: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L435
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g26
  jmp [bp]

L437: ; Arm: 154'45
  push word si
  push word [CurrentCont]
  push word L436
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g44
  jmp [bp]

L438: ; Function: (_trace,t2)
  Bare_enter_check(8)
  mov bx, [bp+2]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L437
  mov si, g46
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L439: ; Continuation
  Bare_enter_check(6)
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L440: ; Continuation
  Bare_enter_check(14)
  mov ax, si
  sar ax, 1
  mov bx, 33
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
  push word L439
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g83
  mov si, [Temps+6]
  jmp [bp]

L441: ; Continuation
  Bare_enter_check(8)
  mov ax, [bp+6]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [CurrentCont]
  push word L440
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

L442: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L441
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L443: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L442
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+8]
  jmp [bp]

L444: ; Continuation
  Bare_enter_check(14)
  mov ax, si
  sar ax, 1
  mov bx, 33
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
  push word L443
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g72
  mov si, [Temps+6]
  jmp [bp]

L445: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L444
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

L446: ; Arm: 594'11
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L447: ; Continuation
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

L448: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L447
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L449: ; Continuation
  Bare_enter_check(22)
  push word si
  push word [bp+6]
  push word [CurrentCont]
  push word L445
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [bp+8]
  cmp word [bx], 1
  jz L446
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
  push word L448
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g2
  mov si, g99
  jmp [bp]

L450: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L449
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

L451: ; Continuation
  Bare_enter_check(18)
  mov ax, si
  sar ax, 1
  mov bx, 33
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
  push word L450
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g84
  mov si, [Temps+6]
  jmp [bp]

L452: ; Function: (lam,t1)
  Bare_enter_check(12)
  push word si
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L451
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

L453: ; Function: (lam,t1)
  Bare_enter_check(8)
  push word si
  push word [bp+2]
  push word L452
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L454: ; Function: (storeI,t1)
  Bare_enter_check(6)
  push word [bp+2]
  push word L453
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L455: ; Arm: 891'10
  mov si, g174
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L456: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, [bp+6]
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L457: ; Continuation
  Bare_enter_check(10)
  mov bx, [bp+10]
  cmp word [bx], 3
  jz L455
  mov bx, [bp+12]
  mov ax, [bx]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [bp+8]
  push word [CurrentCont]
  push word L456
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+4]
  mov bp, [bp+6]
  jmp [bp]

L458: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L459: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L458
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L460: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L459
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L461: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L460
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g148
  jmp [bp]

L462: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L461
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g147
  jmp [bp]

L463: ; Arm: 666'9
  push word [CurrentCont]
  push word L462
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g26
  mov si, g146
  jmp [bp]

L464: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L465: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L464
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L466: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L465
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L467: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L466
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g151
  jmp [bp]

L468: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L467
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g150
  jmp [bp]

L469: ; Arm: 670'12
  push word [CurrentCont]
  push word L468
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g26
  mov si, g149
  jmp [bp]

L470: ; Continuation
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

L471: ; Continuation
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
  push word L470
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, [Temps+4]
  jmp [bp]

L472: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L471
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L473: ; Continuation
  Bare_enter_check(16)
  push word si
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L472
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov si, [bp+10]
  mov bp, [bp+4]
  jmp [bp]

L474: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L473
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, [bp+16]
  mov si, si
  jmp [bp]

L475: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L474
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+18]
  jmp [bp]

L476: ; Continuation
  Bare_enter_check(22)
  push word [bp+16]
  push word si
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L475
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov bp, g20
  mov si, g153
  jmp [bp]

L477: ; Continuation
  Bare_enter_check(20)
  push word si
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L476
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov si, [bp+16]
  mov bp, g20
  jmp [bp]

L478: ; Continuation
  Bare_enter_check(20)
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L477
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+16]
  jmp [bp]

L479: ; Arm: 679'15
  push word [bp+18]
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L478
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov bp, g20
  mov si, g152
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
  mov si, 1
  jmp [bp]

L482: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L481
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L483: ; Continuation
  Bare_enter_check(18)
  push word [bp+4]
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+10]
  push word [bp+6]
  push word [CurrentCont]
  push word L482
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L484: ; Continuation
  Bare_enter_check(14)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [CurrentCont]
  push word L483
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov si, [bp+4]
  mov bp, [bp+6]
  jmp [bp]

L485: ; Continuation
  Bare_enter_check(18)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L484
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+10]
  jmp [bp]

L486: ; Continuation
  Bare_enter_check(20)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L485
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+10]
  jmp [bp]

L487: ; Arm: 685'22
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
  push word L486
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov bp, g85
  mov si, [Temps+6]
  jmp [bp]

L488: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L489: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L488
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L490: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L489
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L491: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L490
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g157
  jmp [bp]

L492: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L491
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g156
  jmp [bp]

L493: ; Arm: 690'22
  push word [CurrentCont]
  push word L492
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g26
  mov si, g155
  jmp [bp]

L494: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L495: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L494
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, 1
  jmp [bp]

L496: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L495
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g158
  jmp [bp]

L497: ; Continuation
  Bare_enter_check(16)
  push word [bp+4]
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+6]
  push word [CurrentCont]
  push word L496
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L498: ; Continuation
  Bare_enter_check(12)
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L497
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+10]
  mov bp, [bp+4]
  jmp [bp]

L499: ; Continuation
  Bare_enter_check(16)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L498
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+8]
  jmp [bp]

L500: ; Continuation
  Bare_enter_check(18)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L499
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+8]
  jmp [bp]

L501: ; Continuation
  Bare_enter_check(20)
  mov bx, si
  cmp word [bx], 1
  jz L493
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
  push word L500
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, g85
  mov si, [Temps+6]
  jmp [bp]

L502: ; Arm: 569'10
  mov si, g154
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L503: ; Function: (lam,t1)
  Bare_enter_check(40)
  mov bx, si
  cmp word [bx], 1
  jz L479
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [bp+18]
  cmp word [bx], 3
  jz L487
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+20]
  push word [bp+16]
  push word [bp+14]
  push word [CurrentCont]
  push word L501
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
  jz L502
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

L504: ; Function: (lam,t1)
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
  push word L503
  mov [Temps+2], sp
  push word 22 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L505: ; Function: (lam,t1)
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
  push word L504
  mov [Temps+2], sp
  push word 20 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L506: ; Function: (lam,t1)
  Bare_enter_check(20)
  push word si
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L505
  mov [Temps+2], sp
  push word 18 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L507: ; Function: (loop,t1)
  Bare_enter_check(18)
  push word bp
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L506
  mov [Temps+2], sp
  push word 16 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L508: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L509: ; Continuation
  Bare_enter_check(8)
  mov ax, [bp+4]
  sar ax, 1
  mov bx, 257
  sar bx, 1
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+2], dx
  push word [bp+6]
  push word [CurrentCont]
  push word L508
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L510: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L509
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+8]
  jmp [bp]

L511: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L510
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+8]
  jmp [bp]

L512: ; Arm: 705'10
  push word si
  push word [bp+14]
  push word [bp+6]
  push word [bp+2]
  push word [CurrentCont]
  push word L511
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov si, [bp+12]
  mov bp, [bp+4]
  jmp [bp]

L513: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L514: ; Continuation
  Bare_enter_check(16)
  push word [bp+4]
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word [CurrentCont]
  push word L513
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L515: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L514
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L516: ; Arm: 708'22
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
  push word L515
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+10]
  mov si, [Temps+8]
  jmp [bp]

L517: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L518: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L517
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L519: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L518
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L520: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L519
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g168
  jmp [bp]

L521: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L520
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g167
  jmp [bp]

L522: ; Arm: 711'22
  push word [CurrentCont]
  push word L521
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g26
  mov si, g166
  jmp [bp]

L523: ; Arm: 198'14
  mov si, g171
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L524: ; Continuation
  Bare_enter_check(0)
  mov bx, si
  cmp word [bx], 3
  jz L523
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

L525: ; Arm: 10'9
  mov si, g169
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L526: ; Function: (loop,t5)
  Bare_enter_check(12)
  mov ax, si
  cmp word ax, 257
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word si
  push word [bp+2]
  push word [CurrentCont]
  push word L524
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L525
  mov si, g170
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L527: ; Continuation
  Bare_enter_check(0)
  mov bp, si
  mov si, g172
  jmp [bp]

L528: ; Continuation
  Bare_enter_check(14)
  push word [bp+4]
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L527
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L529: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L528
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L530: ; Continuation
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
  push word L529
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+2]
  jmp [bp]

L531: ; Continuation
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
  push word L530
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L532: ; Continuation
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
  push word L531
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov si, [bp+12]
  mov bp, g83
  jmp [bp]

L533: ; Continuation
  Bare_enter_check(540)
  mov bx, si
  cmp word [bx], 1
  jz L522
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  mov ax, 257
  call Bare_make_bytes
  mov [Temps+8], ax
  push word [Temps+8]
  push word L526
  mov [Temps+10], sp
  push word 4 ;; scanned
  push word [Temps+8]
  push word [Temps+6]
  push word [Temps+4]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L532
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, [Temps+10]
  mov si, 1
  jmp [bp]

L534: ; Arm: 569'10
  mov si, g165
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L535: ; Function: (lam,t1)
  Bare_enter_check(36)
  mov ax, [bp+8]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L512
  mov bx, si
  cmp word [bx], 3
  jz L516
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [CurrentCont]
  push word L533
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
  jz L534
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

L536: ; Function: (lam,t1)
  Bare_enter_check(18)
  push word si
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L535
  mov [Temps+2], sp
  push word 16 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L537: ; Function: (lam,t1)
  Bare_enter_check(16)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L536
  mov [Temps+2], sp
  push word 14 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L538: ; Function: (skip_loop,t1)
  Bare_enter_check(14)
  push word bp
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L537
  mov [Temps+2], sp
  push word 12 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L539: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L540: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L539
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g173
  jmp [bp]

L541: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L540
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L542: ; Continuation
  Bare_enter_check(10)
  mov ax, [bp+4]
  sar ax, 1
  mov bx, 257
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  push word si
  push word [bp+6]
  push word [CurrentCont]
  push word L541
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, [Temps+2]
  jmp [bp]

L543: ; Continuation
  Bare_enter_check(22)
  push word si
  push word [bp+10]
  push word [bp+4]
  push word L538
  mov [Temps+2], sp
  push word 8 ;; scanned
  push word [Temps+2]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L542
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

L544: ; Arm: 699'40
  mov si, g159
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L545: ; Continuation
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

L546: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L545
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L547: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L546
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g161
  mov si, g164
  jmp [bp]

L548: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+6]
  mov bx, [bp+4]
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L549: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L548
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L550: ; Arm: 254'21
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L549
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+4]
  mov bp, g68
  jmp [bp]

L551: ; Continuation
  Bare_enter_check(18)
  mov ax, [bp+6]
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word si
  push word [CurrentCont]
  push word L547
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L550
  mov si, g160
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L552: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L553: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L552
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, 1
  jmp [bp]

L554: ; Arm: 253'21
  push word [Temps+6]
  push word [CurrentCont]
  push word L553
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+12]
  mov bp, g68
  jmp [bp]

L555: ; Continuation
  Bare_enter_check(48)
  push word si
  push word [bp+16]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L507
  mov [Temps+2], sp
  push word 12 ;; scanned
  mov ax, [bp+10]
  sar ax, 1
  mov bx, 257
  sar bx, 1
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+4], dx
  mov ax, 257
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
  push word L543
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L544
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
  push word L551
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+14]
  cmp word [bx], 3
  jz L554
  mov si, [bp+12]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L556: ; Arm: 100'23
  mov si, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L557: ; Continuation
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
  push word L555
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L556
  mov si, si
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L558: ; Continuation
  Bare_enter_check(22)
  mov bx, si
  cmp word [bx], 1
  jz L469
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
  push word L557
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

L559: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L558
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+8]
  jmp [bp]

L560: ; Continuation
  Bare_enter_check(20)
  push word si
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L559
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, g97
  mov si, si
  jmp [bp]

L561: ; Continuation
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
  push word L457
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L463
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [Temps+4]
  push word si
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L560
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

L562: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L563: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L562
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, 1
  jmp [bp]

L564: ; Arm: 889'21
  push word [bp+16]
  push word [CurrentCont]
  push word L563
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+14]
  mov bp, g68
  jmp [bp]

L565: ; Continuation
  Bare_enter_check(0)
  mov bp, si
  mov si, g145
  jmp [bp]

L566: ; Continuation
  Bare_enter_check(26)
  push word si
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L561
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L564
  push word [CurrentCont]
  push word L565
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov si, [bp+14]
  mov bp, g26
  jmp [bp]

L567: ; Arm: 888'22
  mov si, g144
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L568: ; Continuation
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
  push word L566
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L567
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

L569: ; Function: (lam,t1)
  Bare_enter_check(16)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L568
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g79
  mov si, g143
  jmp [bp]

L570: ; Function: (write_to_file,t3)
  Bare_enter_check(12)
  push word bp
  push word si
  push word [bp+4]
  push word [bp+2]
  push word L569
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L571: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L572: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L571
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L573: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L572
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L574: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L573
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g228
  jmp [bp]

L575: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L574
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g227
  jmp [bp]

L576: ; Arm: 821'11
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L575
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g26
  mov si, g226
  jmp [bp]

L577: ; Continuation
  Bare_enter_check(0)
  mov bp, si
  mov si, g231
  jmp [bp]

L578: ; Continuation
  Bare_enter_check(12)
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [CurrentCont]
  push word L577
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L579: ; Function: (lam,t1)
  Bare_enter_check(18)
  push word 161
  push word 11
  push word 81
  push word 1
  mov [Temps+2], sp
  push word 8 ;; scanned
  push word si
  push word [CurrentCont]
  push word L578
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov si, [Temps+2]
  jmp [bp]

L580: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L581: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L580
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, 159
  jmp [bp]

L582: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L581
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g9
  mov si, 1
  jmp [bp]

L583: ; Continuation
  Bare_enter_check(12)
  push word [bp+4]
  push word L579
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [CurrentCont]
  push word L582
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g7
  mov si, [Temps+2]
  jmp [bp]

L584: ; Continuation
  Bare_enter_check(14)
  push word si
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L583
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+2]
  jmp [bp]

L585: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L584
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L586: ; Continuation
  Bare_enter_check(36)
  push word g230
  push word `P`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word `\x05`
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [Temps+4]
  push word `(`
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L585
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g24
  mov si, [Temps+6]
  jmp [bp]

L587: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L586
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g26
  mov si, g229
  jmp [bp]

L588: ; Function: (lam,t1)
  Bare_enter_check(14)
  mov bx, [bp+4]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L576
  push word 1
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [bp+2]
  push word [CurrentCont]
  push word L587
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g83
  mov si, [Temps+4]
  jmp [bp]

L589: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L590: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L589
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L591: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L590
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L592: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L591
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g235
  jmp [bp]

L593: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L592
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g234
  jmp [bp]

L594: ; Arm: 832'11
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L593
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g26
  mov si, g233
  jmp [bp]

L595: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L596: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L595
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L597: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L596
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L598: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L597
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g249
  jmp [bp]

L599: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L598
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g248
  jmp [bp]

L600: ; Arm: 835'12
  push word [CurrentCont]
  push word L599
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g26
  mov si, g247
  jmp [bp]

L601: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 1
  jz L600
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

L602: ; Arm: 537'9
  mov si, g240
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L603: ; Continuation
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

L604: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L603
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+8]
  jmp [bp]

L605: ; Arm: 543'10
  push word [bp+10]
  push word [bp+6]
  push word [bp+2]
  push word [CurrentCont]
  push word L604
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g20
  mov si, g241
  jmp [bp]

L606: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L607: ; Continuation
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
  push word L606
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, [Temps+4]
  jmp [bp]

L608: ; Arm: 547'19
  push word [bp+10]
  push word [bp+8]
  push word [CurrentCont]
  push word L607
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+4]
  mov bp, [bp+6]
  jmp [bp]

L609: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L610: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L609
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L611: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L610
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L612: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L611
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+10]
  jmp [bp]

L613: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L612
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L614: ; Continuation
  Bare_enter_check(16)
  mov bx, si
  cmp word [bx], 1
  jz L608
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
  push word L613
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g6
  mov si, g244
  jmp [bp]

L615: ; Continuation
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
  push word L614
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L616: ; Function: (lam,t1)
  Bare_enter_check(14)
  mov ax, si
  cmp word ax, [bp+4]
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L605
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L615
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov si, [bp+2]
  mov bp, g97
  jmp [bp]

L617: ; Function: (lam,t1)
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L616
  mov [Temps+2], sp
  push word 12 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L618: ; Function: (loop,t5)
  Bare_enter_check(12)
  push word bp
  push word si
  push word [bp+4]
  push word [bp+2]
  push word L617
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L619: ; Continuation
  Bare_enter_check(0)
  mov bp, si
  mov si, 1
  jmp [bp]

L620: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L619
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, si
  mov si, g246
  jmp [bp]

L621: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L620
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L622: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L621
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L623: ; Continuation
  Bare_enter_check(10)
  mov ax, [bp+4]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L622
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L624: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L623
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+8]
  mov bp, g9
  jmp [bp]

L625: ; Continuation
  Bare_enter_check(28)
  push word [bp+4]
  push word [CurrentCont]
  push word L601
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, si
  cmp word [bx], 1
  jz L602
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
  push word L618
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
  push word L624
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g2
  mov si, g245
  jmp [bp]

L626: ; Arm: 489'49
  mov si, g239
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L627: ; Continuation
  Bare_enter_check(24)
  push word [bp+4]
  push word [CurrentCont]
  push word L625
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L626
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

L628: ; Arm: 10'9
  mov si, g237
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L629: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L627
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L628
  mov si, g238
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L630: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L629
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, g236
  jmp [bp]

L631: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L630
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g56
  mov si, si
  jmp [bp]

L632: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L631
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, 9
  jmp [bp]

L633: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L632
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, 1
  jmp [bp]

L634: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L633
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g68
  mov si, si
  jmp [bp]

L635: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L634
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

L636: ; Function: (lam,t1)
  Bare_enter_check(14)
  mov bx, [bp+2]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L594
  push word 1
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [bp+2]
  push word [CurrentCont]
  push word L635
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g84
  mov si, [Temps+4]
  jmp [bp]

L637: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L638: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L637
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L639: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L638
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L640: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L639
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g253
  jmp [bp]

L641: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L640
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g252
  jmp [bp]

L642: ; Arm: 842'9
  push word [CurrentCont]
  push word L641
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g26
  mov si, g251
  jmp [bp]

L643: ; Function: (lam,t1)
  Bare_enter_check(6)
  mov bx, [bp+2]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L642
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov bx, [bp+2]
  mov ax, g254
  mov [bx], ax
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov si, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L644: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L645: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L644
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L646: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L645
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L647: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L646
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g258
  jmp [bp]

L648: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L647
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g257
  jmp [bp]

L649: ; Arm: 848'9
  push word [CurrentCont]
  push word L648
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g26
  mov si, g256
  jmp [bp]

L650: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L651: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L650
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L652: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L651
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L653: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L652
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g268
  jmp [bp]

L654: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L653
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, si
  jmp [bp]

L655: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L654
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g31
  mov si, si
  jmp [bp]

L656: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L655
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g1
  jmp [bp]

L657: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L656
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g267
  jmp [bp]

L658: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L657
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g41
  mov si, si
  jmp [bp]

L659: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L658
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L660: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L659
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L661: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L660
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, g266
  jmp [bp]

L662: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L661
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g26
  mov si, si
  jmp [bp]

L663: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L662
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g31
  mov si, si
  jmp [bp]

L664: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L663
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+6]
  mov bp, g1
  jmp [bp]

L665: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L664
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g26
  mov si, g265
  jmp [bp]

L666: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L665
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g41
  mov si, si
  jmp [bp]

L667: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L666
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L668: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L667
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L669: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L668
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, si
  mov si, g264
  jmp [bp]

L670: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L669
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g26
  mov si, si
  jmp [bp]

L671: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L672: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L671
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L673: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L672
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L674: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L673
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov si, si
  jmp [bp]

L675: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L674
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov si, si
  jmp [bp]

L676: ; Continuation
  Bare_enter_check(16)
  push word si
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L675
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov si, [bp+4]
  mov bp, g31
  jmp [bp]

L677: ; Continuation
  Bare_enter_check(16)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L676
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g26
  mov si, g263
  jmp [bp]

L678: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L677
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g26
  mov si, si
  jmp [bp]

L679: ; Continuation
  Bare_enter_check(14)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L678
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov si, [bp+4]
  mov bp, g31
  jmp [bp]

L680: ; Continuation
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L679
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g26
  mov si, g262
  jmp [bp]

L681: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L680
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g26
  mov si, si
  jmp [bp]

L682: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L681
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+4]
  mov bp, g31
  jmp [bp]

L683: ; Continuation
  Bare_enter_check(24)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L670
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [bx+6]
  mov [Temps+6], ax
  push word [Temps+6]
  push word [Temps+4]
  push word [Temps+2]
  push word [CurrentCont]
  push word L682
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g26
  mov si, g261
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
  mov bp, g26
  mov si, g260
  jmp [bp]

L685: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L684
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g41
  mov si, si
  jmp [bp]

L686: ; Function: (lam,t1)
  Bare_enter_check(12)
  mov bx, [bp+2]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L649
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
  push word [CurrentCont]
  push word L685
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g22
  mov si, g259
  jmp [bp]

L687: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L688: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L687
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L689: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L688
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L690: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L689
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g272
  jmp [bp]

L691: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L690
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g271
  jmp [bp]

L692: ; Arm: 870'9
  push word [CurrentCont]
  push word L691
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g26
  mov si, g270
  jmp [bp]

L693: ; Arm: 879'17
  mov si, g273
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L694: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L695: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L694
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L696: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L695
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L697: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L696
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L698: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L697
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L699: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L698
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, si
  mov si, g276
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
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L700
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g31
  mov si, si
  jmp [bp]

L702: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L701
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

L703: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L702
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g26
  mov si, g275
  jmp [bp]

L704: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L703
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g26
  mov si, si
  jmp [bp]

L705: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+6]
  push word [CurrentCont]
  push word L704
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+4]
  mov bp, g31
  jmp [bp]

L706: ; Continuation
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 1
  jz L693
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [bp+4]
  push word [CurrentCont]
  push word L705
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g26
  mov si, g274
  jmp [bp]

L707: ; Continuation
  Bare_enter_check(14)
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L706
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L708: ; Function: (lam,t1)
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L707
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+2]
  mov bp, g97
  jmp [bp]

L709: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L710: ; Continuation
  Bare_enter_check(8)
  mov ax, [bp+4]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  push word [bp+6]
  push word [CurrentCont]
  push word L709
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L711: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L710
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g9
  mov si, 1
  jmp [bp]

L712: ; Continuation
  Bare_enter_check(14)
  push word [bp+4]
  push word L708
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word si
  push word [CurrentCont]
  push word L711
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g7
  mov si, [Temps+2]
  jmp [bp]

L713: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L712
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

L714: ; Function: (lam,t1)
  Bare_enter_check(6)
  mov bx, [bp+2]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L692
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
  push word L713
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
  mov bp, si
  mov si, g280
  jmp [bp]

L719: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L718
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g279
  jmp [bp]

L720: ; Arm: 860'9
  push word [CurrentCont]
  push word L719
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g26
  mov si, g278
  jmp [bp]

L721: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L722: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L721
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L723: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L722
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L724: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L723
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L725: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L724
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, g290
  jmp [bp]

L726: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L725
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g26
  mov si, si
  jmp [bp]

L727: ; Arm: 426'9
  mov si, g283
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L728: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L729: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L728
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L730: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L729
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L731: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L730
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, si
  mov si, g289
  jmp [bp]

L732: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L731
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g26
  mov si, si
  jmp [bp]

L733: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L732
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov si, si
  jmp [bp]

L734: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L733
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L735: ; Continuation
  Bare_enter_check(16)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L734
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g2
  mov si, g288
  jmp [bp]

L736: ; Continuation
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L735
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g61
  mov si, g286
  jmp [bp]

L737: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L736
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g26
  mov si, g285
  jmp [bp]

L738: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L737
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g26
  mov si, si
  jmp [bp]

L739: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+6]
  push word [CurrentCont]
  push word L738
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+4]
  mov bp, g31
  jmp [bp]

L740: ; Continuation
  Bare_enter_check(20)
  push word si
  push word [bp+6]
  push word [CurrentCont]
  push word L726
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [bp+4]
  cmp word [bx], 1
  jz L727
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
  push word L739
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g26
  mov si, g284
  jmp [bp]

L741: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L740
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g26
  mov si, g282
  jmp [bp]

L742: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L741
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, si
  jmp [bp]

L743: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L742
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L744: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+6]
  push word [CurrentCont]
  push word L743
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+4]
  mov bp, g31
  jmp [bp]

L745: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L744
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g26
  mov si, g281
  jmp [bp]

L746: ; Continuation
  Bare_enter_check(14)
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L745
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L747: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L746
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g97
  mov si, si
  jmp [bp]

L748: ; Function: (lam,t1)
  Bare_enter_check(8)
  mov bx, [bp+2]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L720
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word si
  push word [CurrentCont]
  push word L747
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

L749: ; Arm: 940'18
  mov si, g302
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L750: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, [bp+8]
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov bp, [bp+6]
  mov si, [Temps+2]
  jmp [bp]

L751: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L752: ; Arm: 943'6
  push word [CurrentCont]
  push word L751
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, [Temps+4]
  jmp [bp]

L753: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L754: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L753
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L755: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L754
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L756: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L755
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, 1
  jmp [bp]

L757: ; Continuation
  Bare_enter_check(20)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L749
  mov ax, [bp+4]
  mov [Temps+4], ax
  mov ax, si
  cmp word ax, 257
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L750
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L752
  push word si
  push word [CurrentCont]
  push word L756
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g68
  mov si, [Temps+4]
  jmp [bp]

L758: ; Continuation
  Bare_enter_check(0)
  mov si, 1
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L759: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L758
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g41
  mov si, si
  jmp [bp]

L760: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L759
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
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
  mov bp, si
  mov si, g294
  jmp [bp]

L763: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L762
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g293
  jmp [bp]

L764: ; Arm: 635'9
  push word [CurrentCont]
  push word L763
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g26
  mov si, g292
  jmp [bp]

L765: ; Continuation
  Bare_enter_check(0)
  mov si, 1
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L766: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L765
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g41
  mov si, si
  jmp [bp]

L767: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L766
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L768: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L767
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L769: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L768
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g297
  jmp [bp]

L770: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L769
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g296
  jmp [bp]

L771: ; Arm: 639'12
  push word [CurrentCont]
  push word L770
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g26
  mov si, g295
  jmp [bp]

L772: ; Arm: 643'33
  mov si, 1
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L773: ; Arm: 645'17
  mov si, 1
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L774: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, 257
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L775: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L774
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L776: ; Arm: 648'15
  push word [bp+10]
  push word [bp+8]
  push word [CurrentCont]
  push word L775
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L777: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L778: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L777
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L779: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L778
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, 1
  jmp [bp]

L780: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+6]
  push word [CurrentCont]
  push word L779
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+4]
  mov bp, g72
  jmp [bp]

L781: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L780
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L782: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L781
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L783: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L782
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g68
  mov si, si
  jmp [bp]

L784: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L783
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

L785: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L784
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+8]
  mov bp, g84
  jmp [bp]

L786: ; Arm: 99'23
  mov si, 257
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L787: ; Continuation
  Bare_enter_check(12)
  mov ax, 257
  cmp word ax, si
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L785
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L786
  mov si, si
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L788: ; Arm: 99'23
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L789: ; Continuation
  Bare_enter_check(12)
  mov bx, si
  cmp word [bx], 3
  jz L776
  mov ax, 257
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
  push word L787
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L788
  mov si, [bp+8]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L790: ; Arm: 10'9
  mov si, g300
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L791: ; Continuation
  Bare_enter_check(18)
  mov bx, si
  cmp word [bx], 3
  jz L772
  mov bx, [bp+6]
  cmp word [bx], 1
  jz L773
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [bp+12]
  cmp word ax, 257
  call Bare_make_bool_from_n
  mov [Temps+6], ax
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L789
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L790
  mov si, g301
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L792: ; Arm: 10'9
  mov si, g298
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L793: ; Function: (lam,t1)
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
  push word L791
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L792
  mov si, g299
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L794: ; Function: (lam,t1)
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L793
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L795: ; Function: (loop,t2)
  Bare_enter_check(10)
  push word bp
  push word si
  push word [bp+2]
  push word L794
  mov [Temps+2], sp
  push word 8 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L796: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L797: ; Continuation
  Bare_enter_check(8)
  mov ax, [bp+6]
  mov bx, [bp+4]
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  push word [bp+4]
  push word [CurrentCont]
  push word L796
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L798: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L797
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L799: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L798
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

L800: ; Continuation
  Bare_enter_check(18)
  mov bx, si
  cmp word [bx], 1
  jz L771
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [bp+4]
  push word L795
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+6]
  push word [CurrentCont]
  push word L799
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

L801: ; Continuation
  Bare_enter_check(16)
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L800
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L802: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L801
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g97
  mov si, si
  jmp [bp]

L803: ; Function: (loop,t2)
  Bare_enter_check(24)
  mov bx, [bp+2]
  mov ax, [bx]
  mov [Temps+2], ax
  push word bp
  push word si
  push word [bp+6]
  push word [CurrentCont]
  push word L757
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L764
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L802
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

L804: ; Function: (lam,t1)
  Bare_enter_check(526)
  mov ax, 257
  call Bare_make_bytes
  mov [Temps+2], ax
  push word [Temps+2]
  push word si
  push word [bp+2]
  push word L803
  mov [Temps+4], sp
  push word 8 ;; scanned
  mov bp, [Temps+4]
  mov si, 1
  jmp [bp]

L805: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L806: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L805
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L807: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L806
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L808: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L807
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g306
  jmp [bp]

L809: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L808
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g305
  jmp [bp]

L810: ; Arm: 919'9
  push word [CurrentCont]
  push word L809
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g26
  mov si, g304
  jmp [bp]

L811: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L812: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L811
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L813: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L812
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L814: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L813
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g309
  jmp [bp]

L815: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L814
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g308
  jmp [bp]

L816: ; Arm: 923'12
  push word [CurrentCont]
  push word L815
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g26
  mov si, g307
  jmp [bp]

L817: ; Continuation
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
  mov si, g311
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L818: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L817
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, g310
  jmp [bp]

L819: ; Continuation
  Bare_enter_check(16)
  push word [bp+6]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L818
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L820: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L819
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+10]
  mov bp, [bp+4]
  jmp [bp]

L821: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L820
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+12]
  jmp [bp]

L822: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L821
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g98
  mov si, si
  jmp [bp]

L823: ; Continuation
  Bare_enter_check(40)
  mov bx, si
  cmp word [bx], 1
  jz L816
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
  push word L822
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

L824: ; Continuation
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
  push word L823
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L825: ; Continuation
  Bare_enter_check(16)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L824
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g97
  mov si, si
  jmp [bp]

L826: ; Function: (lam,t1)
  Bare_enter_check(14)
  mov bx, [bp+4]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L810
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [Temps+4]
  push word si
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L825
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

L827: ; Arm: 896'9
  mov si, g323
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L828: ; Continuation
  Bare_enter_check(0)
  mov bp, si
  mov si, 1
  jmp [bp]

L829: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L828
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L830: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L829
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g41
  mov si, si
  jmp [bp]

L831: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L830
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L832: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L831
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L833: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L832
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, si
  mov si, g325
  jmp [bp]

L834: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L833
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g26
  mov si, si
  jmp [bp]

L835: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L834
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g31
  mov si, si
  jmp [bp]

L836: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L835
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

L837: ; Continuation
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 1
  jz L827
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [bp+4]
  push word [CurrentCont]
  push word L836
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g26
  mov si, g324
  jmp [bp]

L838: ; Continuation
  Bare_enter_check(0)
  mov si, g316
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L839: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L838
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g41
  mov si, si
  jmp [bp]

L840: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L839
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L841: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L840
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L842: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L841
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g315
  jmp [bp]

L843: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L842
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g314
  jmp [bp]

L844: ; Arm: 608'9
  push word [CurrentCont]
  push word L843
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g26
  mov si, g313
  jmp [bp]

L845: ; Continuation
  Bare_enter_check(0)
  mov si, g321
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L846: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L845
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g41
  mov si, si
  jmp [bp]

L847: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L846
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L848: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L847
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L849: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L848
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g320
  jmp [bp]

L850: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L849
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g319
  jmp [bp]

L851: ; Arm: 611'12
  push word [CurrentCont]
  push word L850
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g26
  mov si, g318
  jmp [bp]

L852: ; Continuation
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

L853: ; Continuation
  Bare_enter_check(26)
  push word g322
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
  push word L852
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, si
  mov si, [Temps+4]
  jmp [bp]

L854: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L853
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+8]
  jmp [bp]

L855: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L854
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L856: ; Continuation
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L851
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
  push word L855
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

L857: ; Arm: 561'10
  mov si, g317
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L858: ; Function: (lam,t1)
  Bare_enter_check(42)
  mov bx, [bp+4]
  mov ax, [bx]
  mov [Temps+2], ax
  push word [bp+6]
  push word [CurrentCont]
  push word L837
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L844
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L856
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
  jz L857
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

L859: ; Arm: 906'9
  mov si, g337
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L860: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L861: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L860
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

L862: ; Continuation
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L859
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [bp+6]
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word [CurrentCont]
  push word L861
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov si, [Temps+4]
  jmp [bp]

L863: ; Continuation
  Bare_enter_check(0)
  mov si, g332
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L864: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L863
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g41
  mov si, si
  jmp [bp]

L865: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L864
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L866: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L865
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L867: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L866
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g331
  jmp [bp]

L868: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L867
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g330
  jmp [bp]

L869: ; Arm: 624'9
  push word [CurrentCont]
  push word L868
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g26
  mov si, g329
  jmp [bp]

L870: ; Continuation
  Bare_enter_check(0)
  mov si, g336
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L871: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L870
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g41
  mov si, si
  jmp [bp]

L872: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L871
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L873: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L872
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L874: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L873
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g335
  jmp [bp]

L875: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L874
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g334
  jmp [bp]

L876: ; Arm: 628'12
  push word [CurrentCont]
  push word L875
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g26
  mov si, g333
  jmp [bp]

L877: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 1
  jz L876
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

L878: ; Continuation
  Bare_enter_check(12)
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [CurrentCont]
  push word L877
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L879: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L878
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g97
  mov si, si
  jmp [bp]

L880: ; Continuation
  Bare_enter_check(18)
  mov bx, [bp+4]
  mov ax, [bx]
  mov [Temps+2], ax
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L862
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L869
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [bp+8]
  push word [CurrentCont]
  push word L879
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

L881: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L880
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g41
  mov si, si
  jmp [bp]

L882: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L881
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L883: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L882
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov si, si
  jmp [bp]

L884: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L883
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, si
  mov si, g328
  jmp [bp]

L885: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L884
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g26
  mov si, si
  jmp [bp]

L886: ; Continuation
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L885
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov si, [bp+8]
  mov bp, g31
  jmp [bp]

L887: ; Function: (lam,t1)
  Bare_enter_check(12)
  push word si
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L886
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g26
  mov si, g327
  jmp [bp]

L888: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L889: ; Continuation
  Bare_enter_check(14)
  push word [bp+6]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+8]
  push word [CurrentCont]
  push word L888
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov si, [Temps+2]
  jmp [bp]

L890: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L889
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g41
  mov si, si
  jmp [bp]

L891: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L890
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L892: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L891
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov si, si
  jmp [bp]

L893: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L892
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov si, si
  jmp [bp]

L894: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L893
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, [bp+14]
  mov si, si
  jmp [bp]

L895: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L894
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, si
  mov si, g341
  jmp [bp]

L896: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L895
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, g26
  mov si, si
  jmp [bp]

L897: ; Continuation
  Bare_enter_check(18)
  push word si
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L896
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov si, [bp+8]
  mov bp, g31
  jmp [bp]

L898: ; Continuation
  Bare_enter_check(16)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L897
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g26
  mov si, g340
  jmp [bp]

L899: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L898
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g26
  mov si, si
  jmp [bp]

L900: ; Continuation
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L899
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov si, [bp+6]
  mov bp, g31
  jmp [bp]

L901: ; Function: (lam,t1)
  Bare_enter_check(12)
  push word si
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L900
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g26
  mov si, g339
  jmp [bp]

L902: ; Function: (lam,t1)
  Bare_enter_check(8)
  push word si
  push word [bp+2]
  push word L901
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L903: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L904: ; Arm: 1007'36
  push word [CurrentCont]
  push word L903
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, g353
  jmp [bp]

L905: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov bp, [bp+6]
  mov si, [Temps+2]
  jmp [bp]

L906: ; Arm: 991'7
  mov si, g356
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L907: ; Arm: 744'9
  mov si, g357
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L908: ; Arm: 748'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L909: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L908
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L910: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L909
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L911: ; Function: (loop,t3)
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L907
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
  push word L910
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g56
  mov si, [Temps+6]
  jmp [bp]

L912: ; Continuation
  Bare_enter_check(0)
  mov bp, g41
  mov si, si
  jmp [bp]

L913: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L912
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L914: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L913
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L915: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L914
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, g360
  jmp [bp]

L916: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L915
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g26
  jmp [bp]

L917: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L916
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g26
  mov si, g359
  jmp [bp]

L918: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L917
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, si
  mov si, g358
  jmp [bp]

L919: ; Arm: 994'12
  push word [CurrentCont]
  push word L918
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov si, [bp+4]
  mov bp, g26
  jmp [bp]

L920: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 1
  jz L919
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov si, [bp+6]
  mov bp, [Temps+4]
  jmp [bp]

L921: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L920
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L922: ; Continuation
  Bare_enter_check(28)
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L905
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 1
  jz L906
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+2]
  push word L911
  mov [Temps+6], sp
  push word 4 ;; scanned
  push word [Temps+6]
  push word [Temps+4]
  push word [Temps+2]
  push word [CurrentCont]
  push word L921
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

L923: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L922
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+10]
  jmp [bp]

L924: ; Continuation
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L923
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g20
  mov si, g355
  jmp [bp]

L925: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L924
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov si, si
  jmp [bp]

L926: ; Continuation
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L925
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov si, [bp+10]
  mov bp, g22
  jmp [bp]

L927: ; Continuation
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 3
  jz L904
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L926
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g62
  mov si, g354
  jmp [bp]

L928: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L927
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L929: ; Continuation
  Bare_enter_check(16)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L928
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g56
  mov si, si
  jmp [bp]

L930: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L929
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g79
  mov si, g352
  jmp [bp]

L931: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L930
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g41
  mov si, si
  jmp [bp]

L932: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L931
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L933: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L932
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, si
  mov si, g351
  jmp [bp]

L934: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L933
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g26
  mov si, si
  jmp [bp]

L935: ; Function: (repl,t17)
  Bare_enter_check(14)
  push word bp
  push word si
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L934
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g31
  mov si, si
  jmp [bp]

L936: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, 3
  jmp [bp]

L937: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L936
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g41
  mov si, si
  jmp [bp]

L938: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L937
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L939: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L938
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L940: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L939
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, si
  mov si, g371
  jmp [bp]

L941: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L940
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g26
  mov si, si
  jmp [bp]

L942: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L941
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L943: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L942
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g61
  mov si, g370
  jmp [bp]

L944: ; Continuation
  Bare_enter_check(10)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L943
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g26
  mov si, g369
  jmp [bp]

L945: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L944
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g41
  mov si, si
  jmp [bp]

L946: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L945
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L947: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L946
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L948: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L947
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g31
  mov si, 1537
  jmp [bp]

L949: ; Continuation
  Bare_enter_check(10)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L948
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g26
  mov si, g368
  jmp [bp]

L950: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L949
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g41
  mov si, si
  jmp [bp]

L951: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L950
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L952: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L951
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L953: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L952
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g31
  mov si, 81
  jmp [bp]

L954: ; Continuation
  Bare_enter_check(10)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L953
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g26
  mov si, g367
  jmp [bp]

L955: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L954
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g41
  mov si, si
  jmp [bp]

L956: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L955
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L957: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L956
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L958: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L957
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g31
  mov si, 257
  jmp [bp]

L959: ; Continuation
  Bare_enter_check(10)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L958
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g26
  mov si, g366
  jmp [bp]

L960: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L959
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g41
  mov si, si
  jmp [bp]

L961: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L960
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L962: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L961
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L963: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L962
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g31
  mov si, 10241
  jmp [bp]

L964: ; Continuation
  Bare_enter_check(10)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L963
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g26
  mov si, g365
  jmp [bp]

L965: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L964
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g41
  mov si, si
  jmp [bp]

L966: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L965
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L967: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L966
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L968: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L967
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g31
  mov si, 21
  jmp [bp]

L969: ; Continuation
  Bare_enter_check(10)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L968
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g26
  mov si, g364
  jmp [bp]

L970: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L969
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g41
  mov si, si
  jmp [bp]

L971: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L970
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g22
  mov si, si
  jmp [bp]

L972: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L971
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L973: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L972
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g31
  mov si, 1025
  jmp [bp]

L974: ; Continuation
  Bare_enter_check(10)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L973
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g26
  mov si, g363
  jmp [bp]

L975: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L974
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g41
  mov si, si
  jmp [bp]

L976: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L975
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g22
  mov si, g362
  jmp [bp]

L977: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L976
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L978: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+6]
  push word [CurrentCont]
  push word L977
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

L979: ; Continuation
  Bare_enter_check(144)
  push word g350
  push word si
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word [bp+32]
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [Temps+4]
  push word [bp+30]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word [bp+28]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [Temps+8]
  push word [bp+26]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [Temps+10]
  push word [bp+24]
  push word 3
  mov [Temps+12], sp
  push word 6 ;; scanned
  push word [Temps+12]
  push word [bp+22]
  push word 3
  mov [Temps+14], sp
  push word 6 ;; scanned
  push word [Temps+14]
  push word [bp+20]
  push word 3
  mov [Temps+16], sp
  push word 6 ;; scanned
  push word [Temps+16]
  push word [bp+18]
  push word 3
  mov [Temps+18], sp
  push word 6 ;; scanned
  push word [Temps+18]
  push word [bp+16]
  push word 3
  mov [Temps+20], sp
  push word 6 ;; scanned
  push word [Temps+20]
  push word [bp+14]
  push word 3
  mov [Temps+22], sp
  push word 6 ;; scanned
  push word [Temps+22]
  push word [bp+12]
  push word 3
  mov [Temps+24], sp
  push word 6 ;; scanned
  push word [Temps+24]
  push word [bp+10]
  push word 3
  mov [Temps+26], sp
  push word 6 ;; scanned
  push word [Temps+26]
  push word [bp+8]
  push word 3
  mov [Temps+28], sp
  push word 6 ;; scanned
  push word [Temps+28]
  push word [bp+6]
  push word 3
  mov [Temps+30], sp
  push word 6 ;; scanned
  push word [Temps+30]
  push word 1
  mov [Temps+32], sp
  push word 4 ;; scanned
  push word [Temps+32]
  push word [bp+4]
  push word L935
  mov [Temps+34], sp
  push word 6 ;; scanned
  push word [Temps+34]
  push word [Temps+32]
  push word [CurrentCont]
  push word L978
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g101
  mov si, g361
  jmp [bp]

L980: ; Continuation
  Bare_enter_check(36)
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
  push word L979
  mov [CurrentCont], sp
  push word 34 ;; scanned
  mov bp, si
  mov si, g349
  jmp [bp]

L981: ; Continuation
  Bare_enter_check(36)
  push word si
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
  push word L980
  mov [CurrentCont], sp
  push word 34 ;; scanned
  mov bp, g108
  mov si, g342
  jmp [bp]

L982: ; Continuation
  Bare_enter_check(40)
  push word [bp+6]
  push word L902
  mov [Temps+2], sp
  push word 4 ;; scanned
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
  push word [bp+4]
  push word [CurrentCont]
  push word L981
  mov [CurrentCont], sp
  push word 32 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L983: ; Continuation
  Bare_enter_check(36)
  push word si
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
  push word L982
  mov [CurrentCont], sp
  push word 34 ;; scanned
  mov bp, g142
  mov si, g338
  jmp [bp]

L984: ; Continuation
  Bare_enter_check(42)
  push word [bp+8]
  push word [bp+6]
  push word L887
  mov [Temps+2], sp
  push word 6 ;; scanned
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
  push word [bp+4]
  push word [CurrentCont]
  push word L983
  mov [CurrentCont], sp
  push word 32 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L985: ; Continuation
  Bare_enter_check(36)
  push word si
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
  push word L984
  mov [CurrentCont], sp
  push word 34 ;; scanned
  mov bp, g121
  mov si, g326
  jmp [bp]

L986: ; Continuation
  Bare_enter_check(44)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word L858
  mov [Temps+2], sp
  push word 8 ;; scanned
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
  push word [bp+4]
  push word [CurrentCont]
  push word L985
  mov [CurrentCont], sp
  push word 32 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L987: ; Continuation
  Bare_enter_check(36)
  push word si
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
  push word L986
  mov [CurrentCont], sp
  push word 34 ;; scanned
  mov bp, g108
  mov si, g312
  jmp [bp]

L988: ; Continuation
  Bare_enter_check(42)
  push word [bp+8]
  push word [bp+6]
  push word L826
  mov [Temps+2], sp
  push word 6 ;; scanned
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
  push word L987
  mov [CurrentCont], sp
  push word 32 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L989: ; Continuation
  Bare_enter_check(34)
  push word si
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
  push word L988
  mov [CurrentCont], sp
  push word 32 ;; scanned
  mov bp, g121
  mov si, g303
  jmp [bp]

L990: ; Continuation
  Bare_enter_check(38)
  push word [bp+8]
  push word L804
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
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L989
  mov [CurrentCont], sp
  push word 30 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L991: ; Continuation
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
  push word L990
  mov [CurrentCont], sp
  push word 30 ;; scanned
  mov bp, g121
  mov si, g291
  jmp [bp]

L992: ; Continuation
  Bare_enter_check(36)
  push word [bp+8]
  push word L748
  mov [Temps+2], sp
  push word 4 ;; scanned
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
  push word L991
  mov [CurrentCont], sp
  push word 28 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L993: ; Continuation
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
  push word L992
  mov [CurrentCont], sp
  push word 28 ;; scanned
  mov bp, g121
  mov si, g277
  jmp [bp]

L994: ; Continuation
  Bare_enter_check(34)
  push word [bp+8]
  push word L714
  mov [Temps+2], sp
  push word 4 ;; scanned
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
  push word L993
  mov [CurrentCont], sp
  push word 26 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L995: ; Continuation
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
  push word L994
  mov [CurrentCont], sp
  push word 26 ;; scanned
  mov bp, g108
  mov si, g269
  jmp [bp]

L996: ; Continuation
  Bare_enter_check(32)
  push word [bp+8]
  push word L686
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
  push word L995
  mov [CurrentCont], sp
  push word 24 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L997: ; Continuation
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
  push word L996
  mov [CurrentCont], sp
  push word 24 ;; scanned
  mov bp, g108
  mov si, g255
  jmp [bp]

L998: ; Continuation
  Bare_enter_check(30)
  push word [bp+8]
  push word L643
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
  push word L997
  mov [CurrentCont], sp
  push word 22 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L999: ; Continuation
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
  push word L998
  mov [CurrentCont], sp
  push word 22 ;; scanned
  mov bp, g108
  mov si, g250
  jmp [bp]

L1000: ; Continuation
  Bare_enter_check(28)
  push word [bp+8]
  push word L636
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
  push word L999
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L1001: ; Continuation
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
  push word L1000
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov bp, g108
  mov si, g232
  jmp [bp]

L1002: ; Continuation
  Bare_enter_check(28)
  push word [bp+8]
  push word [bp+6]
  push word L588
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L1001
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L1003: ; Continuation
  Bare_enter_check(20)
  push word si
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L1002
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, g108
  mov si, g225
  jmp [bp]

L1004: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L1003
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, si
  mov si, g224
  jmp [bp]

L1005: ; Continuation
  Bare_enter_check(18)
  push word si
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L1004
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, g121
  mov si, g218
  jmp [bp]

L1006: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L1005
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, si
  mov si, g217
  jmp [bp]

L1007: ; Continuation
  Bare_enter_check(16)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L1006
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g108
  mov si, g207
  jmp [bp]

L1008: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L1007
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, si
  mov si, g206
  jmp [bp]

L1009: ; Continuation
  Bare_enter_check(32)
  push word si
  push word L454
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word g100
  mov [Temps+4], sp
  push word 2 ;; scanned
  push word [Temps+4]
  push word [Temps+2]
  push word L570
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+4]
  push word [CurrentCont]
  push word L1008
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g108
  mov si, g175
  jmp [bp]

L1010: ; Continuation
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
  push word L1009
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g24
  mov si, [Temps+4]
  jmp [bp]

L1011: ; Start
  Bare_enter_check(24)
  push word g43
  mov [Temps+2], sp
  push word 2 ;; scanned
  push word [Temps+2]
  push word L438
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word g73
  push word `\x04`
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L1010
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
  dw 3
g89:
  dw 15
  db `Error: `
g90:
  dw 27
  db `no such inode`
g91:
  dw 3
  db `\n`
g92:
  dw 1
g93:
  dw 1
g94:
  dw 1
g95:
  dw 1
g96:
  dw L211
g97:
  dw L245
g98:
  dw L250
g99:
  dw L252
g100:
  dw 1
g101:
  dw L257
g102:
  dw 1
g103:
  dw 15
  db `usage: `
g104:
  dw 21
  db ` [no args]`
g105:
  dw 15
  db `Error: `
g106:
  dw 3
  db `\n`
g107:
  dw 1
g108:
  dw L270
g109:
  dw 15
  db `usage: `
g110:
  dw 13
  db ` [int]`
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
  dw 13
  db ` [int]`
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
  dw 13
  db ` [int]`
g119:
  dw 15
  db `Error: `
g120:
  dw 3
  db `\n`
g121:
  dw L304
g122:
  dw 15
  db `usage: `
g123:
  dw 25
  db ` [int] [int]`
g124:
  dw 15
  db `Error: `
g125:
  dw 3
  db `\n`
g126:
  dw 15
  db `usage: `
g127:
  dw 25
  db ` [int] [int]`
g128:
  dw 15
  db `Error: `
g129:
  dw 3
  db `\n`
g130:
  dw 15
  db `usage: `
g131:
  dw 25
  db ` [int] [int]`
g132:
  dw 15
  db `Error: `
g133:
  dw 3
  db `\n`
g134:
  dw 15
  db `usage: `
g135:
  dw 25
  db ` [int] [int]`
g136:
  dw 15
  db `Error: `
g137:
  dw 3
  db `\n`
g138:
  dw 15
  db `usage: `
g139:
  dw 25
  db ` [int] [int]`
g140:
  dw 15
  db `Error: `
g141:
  dw 3
  db `\n`
g142:
  dw L360
g143:
  dw 1
g144:
  dw 1
g145:
  dw 3
  db `\n`
g146:
  dw 15
  db `Error: `
g147:
  dw 65
  db `no filesystem mounted; try mount`
g148:
  dw 3
  db `\n`
g149:
  dw 15
  db `Error: `
g150:
  dw 75
  db `inode is not allocated (no such file)`
g151:
  dw 3
  db `\n`
g152:
  dw 1
g153:
  dw 1
g154:
  dw 1
g155:
  dw 15
  db `Error: `
g156:
  dw 69
  db `no blocks available (disk is full)`
g157:
  dw 3
  db `\n`
g158:
  dw 1
g159:
  dw 1
g160:
  dw 1
  db ``
g161:
  dw L373
g162:
  dw 1
g163:
  dw 1
  db ``
g164:
  dw 1
g165:
  dw 1
g166:
  dw 15
  db `Error: `
g167:
  dw 69
  db `no blocks available (disk is full)`
g168:
  dw 3
  db `\n`
g169:
  dw 1
g170:
  dw 3
g171:
  dw 1
g172:
  dw 1
g173:
  dw 1
g174:
  dw 1
g175:
  dw 9
  db `help`
g176:
  dw L376
g177:
  dw 83
  db `dump      : Display the raw data on disk.`
g178:
  dw 101
  db `sector I  : Display the raw data in disk sector I.`
g179:
  dw 157
  db `format    : Prepare disk with an empty filesystem; trashing existing contents.`
g180:
  dw 145
  db `mount     : Discover an existing filesystem; allow files to be accessed.`
g181:
  dw 137
  db `unmount   : Unmount the existing filesystem; required before format.`
g182:
  dw 137
  db `debug     : Display internal information about a mounted filesystem.`
g183:
  dw 107
  db `ls        : List all files together with their sizes.`
g184:
  dw 123
  db `stat I    : Display internal information about inode(file) I.`
g185:
  dw 87
  db `cat I     : Display the contents of file I.`
g186:
  dw 115
  db `rm I      : Remove file F; returning resources for reuse.`
g187:
  dw 103
  db `create    : Create new file; lines read from input.`
g188:
  dw 123
  db `append I  : Append to existing file I; lines read from input.`
g189:
  dw 151
  db `splat I N : Overwrite existing file I from offset N; lines read from input.`
g190:
  dw 87
  db `wipe      : Wipe disk; fill it with commas.`
g191:
  dw 1
g192:
  dw 3, g190, g191
g193:
  dw 3, g189, g192
g194:
  dw 3, g188, g193
g195:
  dw 3, g187, g194
g196:
  dw 3, g186, g195
g197:
  dw 3, g185, g196
g198:
  dw 3, g184, g197
g199:
  dw 3, g183, g198
g200:
  dw 3, g182, g199
g201:
  dw 3, g181, g200
g202:
  dw 3, g180, g201
g203:
  dw 3, g179, g202
g204:
  dw 3, g178, g203
g205:
  dw 3, g177, g204
g206:
  dw L378
g207:
  dw 9
  db `dump`
g208:
  dw L395
g209:
  dw 1
g210:
  dw 3
g211:
  dw 1
g212:
  dw 1
g213:
  dw 3
g214:
  dw 1
g215:
  dw 5
  db `\\n`
g216:
  dw 1
g217:
  dw L396
g218:
  dw 13
  db `sector`
g219:
  dw 1
g220:
  dw 3
g221:
  dw 1
g222:
  dw 5
  db `\\n`
g223:
  dw 1
g224:
  dw L409
g225:
  dw 13
  db `format`
g226:
  dw 15
  db `Error: `
g227:
  dw 95
  db `cannot format a mounted filesystem; try unmount`
g228:
  dw 3
  db `\n`
g229:
  dw 9
  db `BARE`
g230:
  dw 1
g231:
  dw 1
g232:
  dw 11
  db `mount`
g233:
  dw 15
  db `Error: `
g234:
  dw 53
  db `filesystem already mounted`
g235:
  dw 3
  db `\n`
g236:
  dw 9
  db `BARE`
g237:
  dw 1
g238:
  dw 3
g239:
  dw 1
g240:
  dw 1
g241:
  dw 1
g242:
  dw 1
g243:
  dw 3
g244:
  dw L416
g245:
  dw L417
g246:
  dw 1
g247:
  dw 15
  db `Error: `
g248:
  dw 63
  db `no filesystem found; try format`
g249:
  dw 3
  db `\n`
g250:
  dw 15
  db `unmount`
g251:
  dw 15
  db `Error: `
g252:
  dw 65
  db `no filesystem mounted; try mount`
g253:
  dw 3
  db `\n`
g254:
  dw 1
g255:
  dw 11
  db `debug`
g256:
  dw 15
  db `Error: `
g257:
  dw 65
  db `no filesystem mounted; try mount`
g258:
  dw 3
  db `\n`
g259:
  dw 37
  db `Filesystem found:\n`
g260:
  dw 29
  db `- superblock: `
g261:
  dw 17
  db `#blocks=`
g262:
  dw 37
  db `, #admin-blocks=1+`
g263:
  dw 21
  db `, #inodes=`
g264:
  dw 3
  db `\n`
g265:
  dw 35
  db `- #free-blocks = `
g266:
  dw 3
  db `\n`
g267:
  dw 35
  db `- #free-inodes = `
g268:
  dw 3
  db `\n`
g269:
  dw 5
  db `ls`
g270:
  dw 15
  db `Error: `
g271:
  dw 65
  db `no filesystem mounted; try mount`
g272:
  dw 3
  db `\n`
g273:
  dw 1
g274:
  dw 11
  db `file `
g275:
  dw 7
  db ` : `
g276:
  dw 3
  db `\n`
g277:
  dw 9
  db `stat`
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
  dw 3
  db `I`
g282:
  dw 7
  db ` : `
g283:
  dw 23
  db `unallocated`
g284:
  dw 25
  db `Inode: size=`
g285:
  dw 21
  db `, blocks=[`
g286:
  dw 3
  db `,`
g287:
  dw 3
  db `B`
g288:
  dw L421
g289:
  dw 3
  db `]`
g290:
  dw 3
  db `\n`
g291:
  dw 7
  db `cat`
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
  dw 3
g300:
  dw 1
g301:
  dw 3
g302:
  dw 1
g303:
  dw 5
  db `rm`
g304:
  dw 15
  db `Error: `
g305:
  dw 65
  db `no filesystem mounted; try mount`
g306:
  dw 3
  db `\n`
g307:
  dw 15
  db `Error: `
g308:
  dw 75
  db `inode is not allocated (no such file)`
g309:
  dw 3
  db `\n`
g310:
  dw 1
g311:
  dw 1
g312:
  dw 13
  db `create`
g313:
  dw 15
  db `Error: `
g314:
  dw 65
  db `no filesystem mounted; try mount`
g315:
  dw 3
  db `\n`
g316:
  dw 1
g317:
  dw 1
g318:
  dw 15
  db `Error: `
g319:
  dw 73
  db `no inodes available (too many files)`
g320:
  dw 3
  db `\n`
g321:
  dw 1
g322:
  dw 1
g323:
  dw 1
g324:
  dw 29
  db `Creating file `
g325:
  dw 45
  db `; (to finish type ^D)\n`
g326:
  dw 13
  db `append`
g327:
  dw 37
  db `Appending to file `
g328:
  dw 45
  db `; (to finish type ^D)\n`
g329:
  dw 15
  db `Error: `
g330:
  dw 65
  db `no filesystem mounted; try mount`
g331:
  dw 3
  db `\n`
g332:
  dw 1
g333:
  dw 15
  db `Error: `
g334:
  dw 75
  db `inode is not allocated (no such file)`
g335:
  dw 3
  db `\n`
g336:
  dw 1
g337:
  dw 1
g338:
  dw 11
  db `splat`
g339:
  dw 35
  db `Overwriting file `
g340:
  dw 27
  db ` from offset `
g341:
  dw 45
  db `; (to finish type ^D)\n`
g342:
  dw 9
  db `wipe`
g343:
  dw 1
g344:
  dw 3
g345:
  dw 1
g346:
  dw 1
g347:
  dw 3
g348:
  dw 1
g349:
  dw L431
g350:
  dw 1
g351:
  dw 5
  db `> `
g352:
  dw 1
g353:
  dw 17
  db `exiting\n`
g354:
  dw 1
g355:
  dw 1
g356:
  dw 1
g357:
  dw 1
g358:
  dw 41
  db ` : command not found`
g359:
  dw 15
  db `Error: `
g360:
  dw 3
  db `\n`
g361:
  dw 1
g362:
  dw 39
  db `Filesystem explorer`
g363:
  dw 31
  db `- sector_size: `
g364:
  dw 41
  db `- #sectors_on_disk: `
g365:
  dw 41
  db `- addressable disk: `
g366:
  dw 29
  db `- block_size: `
g367:
  dw 39
  db `- #blocks_on_disk: `
g368:
  dw 57
  db `- max_file_size (6 blocks): `
g369:
  dw 11
  db `Try: `
g370:
  dw 3
  db ` `
g371:
  dw 3
  db `\n`

bare_start: jmp L1011
