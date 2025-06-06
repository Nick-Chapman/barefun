L1: ; Arm: 21'7
  mov di, 1
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L2: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov ax, 3
  mov bx, si
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L3: ; Function: (length,g1)
  mov ax, di
  mov di, si
  mov si, ax
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
  mov di, [Temps+4]
  mov bp, g1
  jmp [bp]

L4: ; Arm: 26'7
  mov di, g3
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L5: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [bp+4]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L6: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L5
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L7: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word si
  push word [bp+6]
  push word [CurrentCont]
  push word L6
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [bp+4]
  mov bp, g2
  jmp [bp]

L8: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
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
  mov di, [Temps+2]
  mov bp, [bp+2]
  jmp [bp]

L9: ; Function: (map,g2)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word si
  push word L8
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L10: ; Arm: 31'7
  mov di, g5
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L11: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [bp+4]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L12: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L11
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+6]
  mov bp, si
  jmp [bp]

L13: ; Arm: 32'20
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L12
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [bp+4]
  mov bp, g4
  jmp [bp]

L14: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L15: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 3
  jz L13
  push word [bp+8]
  push word [CurrentCont]
  push word L14
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+4]
  mov bp, g4
  jmp [bp]

L16: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
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
  mov di, [Temps+2]
  mov bp, [bp+2]
  jmp [bp]

L17: ; Function: (filter,g4)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word si
  push word L16
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L18: ; Arm: 36'7
  mov di, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L19: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L20: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L19
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L21: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word si
  push word [CurrentCont]
  push word L20
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [bp+4]
  mov bp, g6
  jmp [bp]

L22: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L21
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [bp+6]
  mov bp, si
  jmp [bp]

L23: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  mov bx, si
  cmp word [bx], 1
  jz L18
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+2]
  push word [CurrentCont]
  push word L22
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, [bp+4]
  mov bp, [bp+2]
  jmp [bp]

L24: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [bp+2]
  push word L23
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L25: ; Function: (foldl,g6)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word si
  push word L24
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L26: ; Arm: 41'7
  mov di, g8
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L27: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L28: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L27
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+4]
  mov bp, g7
  jmp [bp]

L29: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
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
  mov di, [Temps+2]
  mov bp, [bp+2]
  jmp [bp]

L30: ; Function: (iter,g7)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word si
  push word L29
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L31: ; Arm: 45'11
  mov di, g10
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L32: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [bp+4]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L33: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L32
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+6]
  mov bp, si
  jmp [bp]

L34: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
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
  mov di, [Temps+4]
  mov bp, g9
  jmp [bp]

L35: ; Function: (upto,g9)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word si
  push word L34
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L36: ; Arm: 48'12
  mov di, g14
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L37: ; Arm: 50'9
  mov di, g15
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L38: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [bp+4]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L39: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L38
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+6]
  mov bp, si
  jmp [bp]

L40: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
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
  mov di, [Temps+6]
  mov bp, g11
  jmp [bp]

L41: ; Arm: 10'9
  mov di, g12
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L42: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
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
  mov di, g13
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L43: ; Function: (take,g11)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word si
  push word L42
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L44: ; Arm: 61'7
  mov di, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L45: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L46: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
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
  mov di, [Temps+6]
  mov bp, g20
  jmp [bp]

L47: ; Function: (rev_onto,g20)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word si
  push word L46
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L48: ; Arm: 79'13
  mov di, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L49: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L50: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
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
  mov ax, si
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+6], ax
  push word [bp+4]
  push word [Temps+4]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word [CurrentCont]
  push word L49
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [Temps+8]
  mov bp, [bp+6]
  jmp [bp]

L51: ; Function: (explode_loop,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word bp
  push word si
  push word [bp+2]
  push word L50
  mov [Temps+2], sp
  push word 8 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L52: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L53: ; Function: (explode,g22)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(14)
  push word si
  push word L51
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov bx, si
  mov ax, [bx]
  mov [Temps+4], ax
  mov ax, [Temps+4]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+6], ax
  push word [Temps+6]
  push word [CurrentCont]
  push word L52
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g21
  mov bp, [Temps+2]
  jmp [bp]

L54: ; Arm: 88'9
  mov di, g23
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L55: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L56: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
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
  mov di, [Temps+8]
  mov bp, [bp+6]
  jmp [bp]

L57: ; Function: (loop,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word bp
  push word si
  push word [bp+2]
  push word L56
  mov [Temps+2], sp
  push word 8 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L58: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [Temps+2], ax
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L59: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L58
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L60: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(16)
  push word si
  push word L57
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L59
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, 1
  mov bp, [Temps+2]
  jmp [bp]

L61: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L60
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, si
  jmp AllocBare_make_bytes

L62: ; Function: (implode,g24)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L61
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, si
  mov bp, g1
  jmp [bp]

L63: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, si
  mov bp, g24
  jmp [bp]

L64: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L63
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L65: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L64
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+4]
  mov bp, g20
  jmp [bp]

L66: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L65
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L67: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L66
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, g25
  mov bp, g20
  jmp [bp]

L68: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L67
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+4]
  mov bp, g22
  jmp [bp]

L69: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L68
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+2]
  mov bp, g22
  jmp [bp]

L70: ; Function: (^,g26)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word si
  push word L69
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L71: ; Arm: 106'13
  mov di, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L72: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L73: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L71
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
  mov ax, si
  sar ax, 1
  mov bx, 21
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+10], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+12], sp
  push word 6 ;; scanned
  push word [Temps+10]
  push word [CurrentCont]
  push word L72
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [Temps+12]
  mov bp, g27
  jmp [bp]

L74: ; Function: (loop,g27)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word si
  push word L73
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L75: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, si
  mov bp, g24
  jmp [bp]

L76: ; Arm: 109'11
  push word g28
  push word `0`
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  mov di, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L77: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word `-`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L78: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L77
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L79: ; Arm: 110'13
  mov ax, 1
  mov bx, si
  sub ax, bx
  add ax, 1
  mov [Temps+6], ax
  push word [Temps+6]
  push word [CurrentCont]
  push word L78
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g29
  mov bp, g27
  jmp [bp]

L80: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L81: ; Function: (sofi,g31)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(14)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  push word [CurrentCont]
  push word L75
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L76
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L79
  push word si
  push word [CurrentCont]
  push word L80
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g30
  mov bp, g27
  jmp [bp]

L82: ; Arm: 122'9
  push word [bp+2]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L83: ; Arm: 125'15
  mov di, g39
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L84: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L85: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 1
  jz L83
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
  push word L84
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [Temps+6]
  mov bp, g32
  jmp [bp]

L86: ; Arm: 117'27
  push word [bp+4]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L87: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L86
  mov di, g37
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L88: ; Arm: 10'9
  mov di, g35
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L89: ; Arm: 117'12
  mov ax, 19
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+8]
  push word [CurrentCont]
  push word L87
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L88
  mov di, g36
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L90: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(18)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L85
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L89
  mov di, g38
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L91: ; Arm: 10'9
  mov di, g33
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L92: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  mov bx, si
  cmp word [bx], 1
  jz L82
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
  push word L90
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L91
  mov di, g34
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L93: ; Function: (loop,g32)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word si
  push word L92
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L94: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L95: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L94
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, 1
  mov bp, g32
  jmp [bp]

L96: ; Function: (parse_num,g40)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L95
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L97: ; Arm: 142'7
  mov di, g42
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L98: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, g41
  jmp [bp]

L99: ; Arm: 135'19
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov di, [Temps+10]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L100: ; Arm: 136'22
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov di, [Temps+12]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L101: ; Arm: 137'16
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+14], ax
  mov di, [Temps+14]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L102: ; Function: (put_chars,g41)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 1
  jz L97
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
  push word L98
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L99
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L100
  mov ax, 53
  cmp word ax, [Temps+6]
  call Bare_make_bool_from_n
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L101
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
  mov di, [Temps+22]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L103: ; Arm: 165'9
  mov di, g47
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L104: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L105: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 1
  jz L103
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
  push word L104
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [Temps+8]
  mov bp, [bp+6]
  jmp [bp]

L106: ; Function: (loop,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word bp
  push word si
  push word [bp+2]
  push word L105
  mov [Temps+2], sp
  push word 8 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L107: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [Temps+2], ax
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L108: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L107
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L109: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(16)
  push word si
  push word L106
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [bp+6]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+4], ax
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L108
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [Temps+4]
  mov bp, [Temps+2]
  jmp [bp]

L110: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L109
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, si
  jmp AllocBare_make_bytes

L111: ; Function: (rev_implode,g48)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L110
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, si
  mov bp, g1
  jmp [bp]

L112: ; Arm: 174'19
  mov di, g51
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L113: ; Arm: 176'15
  mov di, g52
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L114: ; Arm: 179'31
  mov di, g55
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L115: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov bx, si
  cmp word [bx], 3
  jz L114
  mov ax, [bp+4]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  mov di, [Temps+2]
  mov bp, [bp+6]
  jmp [bp]

L116: ; Arm: 10'9
  mov di, g53
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L117: ; Function: (loop,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L113
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
  push word L115
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L116
  mov di, g54
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L118: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 3
  jz L112
  push word [bp+6]
  push word [bp+4]
  push word L117
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov ax, [bp+8]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+4], ax
  mov di, [Temps+4]
  mov bp, [Temps+2]
  jmp [bp]

L119: ; Arm: 10'9
  mov di, g49
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L120: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
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
  push word L118
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L119
  mov di, g50
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L121: ; Function: (eq_string,g56)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word si
  push word L120
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L122: ; Arm: 187'9
  mov di, [bp+4]
  mov bp, g24
  jmp [bp]

L123: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L124: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L123
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, si
  mov bp, [bp+4]
  jmp [bp]

L125: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L124
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L126: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word [bp+6]
  push word [bp+4]
  push word si
  push word [CurrentCont]
  push word L125
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, [bp+8]
  mov bp, g20
  jmp [bp]

L127: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L126
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, [bp+8]
  mov bp, si
  jmp [bp]

L128: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L127
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov di, g58
  mov bp, g20
  jmp [bp]

L129: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L128
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L130: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word si
  push word [CurrentCont]
  push word L129
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov di, [bp+4]
  mov bp, g20
  jmp [bp]

L131: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L130
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L132: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(16)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L131
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov di, g57
  mov bp, g20
  jmp [bp]

L133: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L122
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L132
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov di, [Temps+2]
  mov bp, g22
  jmp [bp]

L134: ; Function: (collect,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word bp
  push word si
  push word [bp+2]
  push word L133
  mov [Temps+2], sp
  push word 8 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L135: ; Arm: 192'7
  mov di, g60
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L136: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L137: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L136
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, si
  mov bp, [bp+4]
  jmp [bp]

L138: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 1
  jz L135
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [bp+4]
  push word [CurrentCont]
  push word L137
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [Temps+2]
  mov bp, g22
  jmp [bp]

L139: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L138
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+6]
  mov bp, si
  jmp [bp]

L140: ; Function: (lam,t2)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word si
  push word [bp+2]
  push word [CurrentCont]
  push word L139
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, g59
  mov bp, g20
  jmp [bp]

L141: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word si
  push word L134
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word L140
  mov [Temps+4], sp
  push word 4 ;; scanned
  mov di, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L142: ; Function: (concat,g61)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L141
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L143: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word si
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L144: ; Arm: 208'11
  push word [bp+2]
  push word [CurrentCont]
  push word L143
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+4]
  mov bp, g48
  jmp [bp]

L145: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L146: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(16)
  push word [bp+4]
  push word si
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+6]
  push word [CurrentCont]
  push word L145
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [Temps+2]
  mov bp, g62
  jmp [bp]

L147: ; Arm: 210'26
  push word [Temps+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L146
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [bp+4]
  mov bp, g48
  jmp [bp]

L148: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L149: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L148
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L150: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(18)
  mov bx, si
  cmp word [bx], 1
  jz L144
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
  jz L147
  push word [bp+4]
  push word [Temps+2]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [Temps+4]
  push word [Temps+8]
  push word [CurrentCont]
  push word L149
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [bp+2]
  mov bp, g63
  jmp [bp]

L151: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [bp+2]
  push word L150
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L152: ; Function: (have_letter,g63)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word si
  push word L151
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L153: ; Arm: 215'9
  mov di, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L154: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L155: ; Arm: 217'24
  push word [Temps+4]
  push word [CurrentCont]
  push word L154
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+2]
  mov bp, g62
  jmp [bp]

L156: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L157: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L156
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L158: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(18)
  mov bx, si
  cmp word [bx], 1
  jz L153
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
  jz L155
  push word g64
  push word [Temps+2]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [Temps+4]
  push word [Temps+8]
  push word [CurrentCont]
  push word L157
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [bp+2]
  mov bp, g63
  jmp [bp]

L159: ; Function: (at_word_start,g62)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word si
  push word L158
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L160: ; Arm: 229'16
  mov di, g67
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L161: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov bx, si
  cmp word [bx], 3
  jz L160
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
  mov di, [Temps+8]
  mov bp, [bp+12]
  jmp [bp]

L162: ; Arm: 10'9
  mov di, g65
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L163: ; Function: (loop,t1)
  mov ax, di
  mov di, si
  mov si, ax
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
  push word L161
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L162
  mov di, g66
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L164: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [Temps+2], ax
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L165: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(20)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L163
  mov [Temps+2], sp
  push word 10 ;; scanned
  push word si
  push word [CurrentCont]
  push word L164
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, 1
  mov bp, [Temps+2]
  jmp [bp]

L166: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word si
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L165
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, si
  jmp AllocBare_make_bytes

L167: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [bp+2]
  push word L166
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L168: ; Function: (substr,g68)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word si
  push word L167
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L169: ; Arm: 243'17
  mov di, g71
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L170: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov bx, si
  cmp word [bx], 3
  jz L169
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
  mov di, [Temps+8]
  mov bp, [bp+12]
  jmp [bp]

L171: ; Arm: 10'9
  mov di, g69
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L172: ; Function: (loop,t2)
  mov ax, di
  mov di, si
  mov si, ax
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
  push word L170
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L171
  mov di, g70
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L173: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  mov bx, si
  mov ax, [bx]
  mov [Temps+2], ax
  push word [Temps+2]
  push word si
  push word [bp+4]
  push word [bp+2]
  push word L172
  mov [Temps+4], sp
  push word 10 ;; scanned
  mov di, 1
  mov bp, [Temps+4]
  jmp [bp]

L174: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [bp+2]
  push word L173
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L175: ; Function: (mod_substr,g72)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word si
  push word L174
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L176: ; Arm: 283'22
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov di, si
  mov bp, g48
  jmp [bp]

L177: ; Arm: 284'28
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
  mov di, [Temps+16]
  mov bp, g48
  jmp [bp]

L178: ; Arm: 285'19
  mov di, si
  mov bp, g74
  jmp [bp]

L179: ; Arm: 288'17
  mov di, si
  mov bp, g74
  jmp [bp]

L180: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, g74
  jmp [bp]

L181: ; Arm: 292'28
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
  mov di, [Temps+12]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L182: ; Arm: 293'29
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
  mov di, [Temps+20]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L183: ; Arm: 294'32
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
  mov di, [Temps+22]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L184: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L180
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L181
  mov ax, [bp+6]
  cmp word ax, 65
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L182
  mov ax, 253
  cmp word ax, [bp+6]
  call Bare_make_bool_from_n
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L183
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
  mov di, [Temps+10]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L185: ; Arm: 10'9
  mov di, g76
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L186: ; Arm: 286'21
  mov bx, si
  cmp word [bx], 1
  jz L179
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
  push word L184
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+20]
  cmp word [bx], 3
  jz L185
  mov di, g77
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L187: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov di, [Temps+2]
  mov bp, g74
  jmp [bp]

L188: ; Arm: 135'19
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+18], ax
  mov di, [Temps+18]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L189: ; Arm: 136'22
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+20], ax
  mov di, [Temps+20]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L190: ; Arm: 137'16
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+22], ax
  mov di, [Temps+22]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L191: ; Function: (readloop,g74)
  mov ax, di
  mov di, si
  mov si, ax
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
  jz L176
  mov ax, [Temps+2]
  cmp word ax, `\x04`
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L177
  mov ax, 255
  cmp word ax, [Temps+4]
  call Bare_make_bool_from_n
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L178
  mov ax, [Temps+4]
  cmp word ax, 255
  call Bare_make_bool_from_z
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L186
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
  push word L187
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+16]
  cmp word [bx], 3
  jz L188
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+18], ax
  mov bx, [Temps+18]
  cmp word [bx], 3
  jz L189
  mov ax, 53
  cmp word ax, [Temps+14]
  call Bare_make_bool_from_n
  mov [Temps+20], ax
  mov bx, [Temps+20]
  cmp word [bx], 3
  jz L190
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
  mov di, [Temps+30]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L192: ; Function: (read_line,g79)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, g78
  mov bp, g74
  jmp [bp]

L193: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov ax, [bp+6]
  mov [Temps+2], ax
  mov dx, [bp+4]
  sar dx, 1
  mov bx, [Temps+2]
  call Bare_store_sector
  mov ax, Bare_unit
  mov [Temps+4], ax
  mov di, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L194: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L193
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [bp+6]
  mov bp, si
  jmp [bp]

L195: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L194
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, [bp+6]
  mov bp, si
  jmp [bp]

L196: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(14)
  mov dx, [bp+4]
  sar dx, 1
  mov bx, si
  call Bare_load_sector
  mov ax, Bare_unit
  mov [Temps+2], ax
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L195
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov di, si
  mov bp, g72
  jmp [bp]

L197: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L196
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, 1025
  jmp AllocBare_make_bytes

L198: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
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
  push word L197
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov di, [Temps+8]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L199: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L198
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [bp+2]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L200: ; Function: (store_block,g83)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word si
  push word L199
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L201: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word si
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L202: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L201
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, 257
  mov bp, si
  jmp [bp]

L203: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L202
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L204: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  mov dx, [bp+6]
  sar dx, 1
  mov bx, si
  call Bare_load_sector
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov [Temps+4], si
  mov ax, [bp+4]
  sar ax, 1
  mov bx, 9
  sar bx, 1
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+6], dx
  mov ax, 257
  sar ax, 1
  mov bx, [Temps+6]
  sar bx, 1
  mul bx
  shl ax, 1
  add ax, 1
  mov [Temps+8], ax
  push word [Temps+8]
  push word [CurrentCont]
  push word L203
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [Temps+4]
  mov bp, g68
  jmp [bp]

L205: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
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
  shl ax, 1
  add ax, 1
  mov [Temps+4], ax
  push word [Temps+4]
  push word si
  push word [CurrentCont]
  push word L204
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, 1025
  jmp AllocBare_make_bytes

L206: ; Function: (load_block,g84)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L205
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, si
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L207: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L208: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(14)
  mov ax, [bp+6]
  mov [Temps+2], ax
  push word [Temps+2]
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [Temps+4]
  push word [CurrentCont]
  push word L207
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+4]
  mov bp, g83
  jmp [bp]

L209: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L208
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [bp+6]
  mov bp, si
  jmp [bp]

L210: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L209
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, [bp+6]
  mov bp, si
  jmp [bp]

L211: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(14)
  mov [Temps+2], si
  push word [Temps+2]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L210
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov di, [Temps+2]
  mov bp, g72
  jmp [bp]

L212: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L211
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, si
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L213: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word si
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L212
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, [bp+2]
  mov bp, g84
  jmp [bp]

L214: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [bp+2]
  push word L213
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L215: ; Function: (update_block,g85)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word si
  push word L214
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L216: ; Function: (lam,g96)
  mov ax, di
  mov di, si
  mov si, ax
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
  mov di, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L217: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, g92
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L218: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L217
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g41
  jmp [bp]

L219: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L218
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L220: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L219
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L221: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L220
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g91
  mov bp, g26
  jmp [bp]

L222: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L221
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g89
  mov bp, si
  jmp [bp]

L223: ; Arm: 525'2
  push word [CurrentCont]
  push word L222
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g90
  mov bp, g26
  jmp [bp]

L224: ; Arm: 450'9
  mov di, g94
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L225: ; Arm: 452'14
  mov di, g95
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L226: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
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
  mov di, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L227: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L226
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L228: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+4]
  push word si
  push word [CurrentCont]
  push word L227
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [bp+6]
  mov bp, g11
  jmp [bp]

L229: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L228
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L230: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word [bp+6]
  push word [bp+4]
  push word si
  push word [CurrentCont]
  push word L229
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, g96
  mov bp, g2
  jmp [bp]

L231: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L230
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L232: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L231
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, 13
  mov bp, si
  jmp [bp]

L233: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L232
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, 5
  mov bp, si
  jmp [bp]

L234: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word si
  push word [bp+6]
  push word [CurrentCont]
  push word L233
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [bp+4]
  mov bp, g68
  jmp [bp]

L235: ; Arm: 443'14
  mov di, 1
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L236: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 1
  jz L224
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L225
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
  push word L234
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L235
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
  mov di, [Temps+14]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L237: ; Arm: 409'32
  mov di, g93
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L238: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
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
  push word L236
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
  jz L237
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
  mov di, [Temps+22]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L239: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L238
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, 17
  mov bp, si
  jmp [bp]

L240: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L239
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L241: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
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
  push word L240
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+4]
  mov bp, g68
  jmp [bp]

L242: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L241
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L243: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L242
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, si
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L244: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
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
  push word L243
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [Temps+6]
  mov bp, g84
  jmp [bp]

L245: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 3
  jz L223
  push word [bp+4]
  push word [CurrentCont]
  push word L244
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L246: ; Arm: 10'9
  mov di, g87
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L247: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  mov ax, [bp+6]
  cmp word ax, si
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+4]
  push word [CurrentCont]
  push word L245
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L246
  mov di, g88
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L248: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word si
  push word [bp+6]
  push word [CurrentCont]
  push word L247
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [bx+6]
  mov [Temps+6], ax
  mov di, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L249: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word si
  push word [bp+2]
  push word [CurrentCont]
  push word L248
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, si
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L250: ; Function: (loadI,g97)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word si
  push word L249
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L251: ; Arm: 584'7
  mov di, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L252: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L253: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L252
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, si
  mov bp, g98
  jmp [bp]

L254: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(26)
  mov bx, si
  cmp word [bx], 1
  jz L251
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [CurrentCont]
  push word L253
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
  mov di, [Temps+14]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L255: ; Function: (giveup_blocks,g98)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word si
  push word L254
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L256: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov ax, si
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+2], ax
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L257: ; Function: (lam,g99)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L256
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, si
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L258: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L259: ; Arm: 733'9
  push word [bp+2]
  push word [CurrentCont]
  push word L258
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g102
  mov bp, g20
  jmp [bp]

L260: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L261: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(16)
  mov bx, si
  cmp word [bx], 1
  jz L259
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
  push word L260
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [Temps+10]
  mov bp, g101
  jmp [bp]

L262: ; Function: (loop,g101)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word si
  push word L261
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L263: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, si
  mov bp, g41
  jmp [bp]

L264: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L263
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L265: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L264
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L266: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L265
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g106
  mov bp, g26
  jmp [bp]

L267: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L266
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g105
  mov bp, si
  jmp [bp]

L268: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L267
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g26
  jmp [bp]

L269: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L268
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L270: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L269
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g104
  mov bp, g26
  jmp [bp]

L271: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L270
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g103
  mov bp, si
  jmp [bp]

L272: ; Arm: 757'21
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L271
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+2]
  mov bp, g26
  jmp [bp]

L273: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L272
  mov di, g107
  mov bp, [bp+4]
  jmp [bp]

L274: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(22)
  push word si
  push word [bp+2]
  push word L273
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
  mov di, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L275: ; Function: (mk_com0,g108)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word si
  push word L274
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L276: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, si
  mov bp, g41
  jmp [bp]

L277: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L276
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L278: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L277
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L279: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L278
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g112
  mov bp, g26
  jmp [bp]

L280: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L279
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g111
  mov bp, si
  jmp [bp]

L281: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L280
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g26
  jmp [bp]

L282: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L281
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L283: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L282
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g110
  mov bp, g26
  jmp [bp]

L284: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L283
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g109
  mov bp, si
  jmp [bp]

L285: ; Arm: 766'17
  push word [CurrentCont]
  push word L284
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+2]
  mov bp, g26
  jmp [bp]

L286: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, si
  mov bp, g41
  jmp [bp]

L287: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L286
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L288: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L287
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L289: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L288
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g116
  mov bp, g26
  jmp [bp]

L290: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L289
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g115
  mov bp, si
  jmp [bp]

L291: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L290
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g26
  jmp [bp]

L292: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L291
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L293: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L292
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g114
  mov bp, g26
  jmp [bp]

L294: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L293
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g113
  mov bp, si
  jmp [bp]

L295: ; Arm: 769'24
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [CurrentCont]
  push word L294
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+2]
  mov bp, g26
  jmp [bp]

L296: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, si
  mov bp, g41
  jmp [bp]

L297: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L296
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L298: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L297
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L299: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L298
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g120
  mov bp, g26
  jmp [bp]

L300: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L299
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g119
  mov bp, si
  jmp [bp]

L301: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L300
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g26
  jmp [bp]

L302: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L301
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L303: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L302
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g118
  mov bp, g26
  jmp [bp]

L304: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L303
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g117
  mov bp, si
  jmp [bp]

L305: ; Arm: 772'25
  push word [CurrentCont]
  push word L304
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, g26
  jmp [bp]

L306: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 1
  jz L305
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov di, [Temps+2]
  mov bp, [bp+6]
  jmp [bp]

L307: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 1
  jz L285
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L295
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L306
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [Temps+2]
  mov bp, g40
  jmp [bp]

L308: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(22)
  push word si
  push word [bp+2]
  push word L307
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
  mov di, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L309: ; Function: (mk_comI,g121)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word si
  push word L308
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L310: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, si
  mov bp, g41
  jmp [bp]

L311: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L310
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L312: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L311
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L313: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L312
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g125
  mov bp, g26
  jmp [bp]

L314: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L313
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g124
  mov bp, si
  jmp [bp]

L315: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L314
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g26
  jmp [bp]

L316: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L315
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L317: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L316
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g123
  mov bp, g26
  jmp [bp]

L318: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L317
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g122
  mov bp, si
  jmp [bp]

L319: ; Arm: 781'17
  push word [CurrentCont]
  push word L318
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+2]
  mov bp, g26
  jmp [bp]

L320: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, si
  mov bp, g41
  jmp [bp]

L321: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L320
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L322: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L321
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L323: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L322
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g129
  mov bp, g26
  jmp [bp]

L324: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L323
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g128
  mov bp, si
  jmp [bp]

L325: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L324
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g26
  jmp [bp]

L326: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L325
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L327: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L326
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g127
  mov bp, g26
  jmp [bp]

L328: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L327
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g126
  mov bp, si
  jmp [bp]

L329: ; Arm: 784'20
  push word [CurrentCont]
  push word L328
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+2]
  mov bp, g26
  jmp [bp]

L330: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, si
  mov bp, g41
  jmp [bp]

L331: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L330
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L332: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L331
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L333: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L332
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g133
  mov bp, g26
  jmp [bp]

L334: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L333
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g132
  mov bp, si
  jmp [bp]

L335: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L334
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g26
  jmp [bp]

L336: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L335
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L337: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L336
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g131
  mov bp, g26
  jmp [bp]

L338: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L337
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g130
  mov bp, si
  jmp [bp]

L339: ; Arm: 787'27
  mov ax, [bx+2]
  mov [Temps+10], ax
  mov ax, [bx+4]
  mov [Temps+12], ax
  push word [CurrentCont]
  push word L338
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+2]
  mov bp, g26
  jmp [bp]

L340: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, si
  mov bp, g41
  jmp [bp]

L341: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L340
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L342: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L341
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L343: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L342
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g137
  mov bp, g26
  jmp [bp]

L344: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L343
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g136
  mov bp, si
  jmp [bp]

L345: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L344
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g26
  jmp [bp]

L346: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L345
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L347: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L346
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g135
  mov bp, g26
  jmp [bp]

L348: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L347
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g134
  mov bp, si
  jmp [bp]

L349: ; Arm: 790'28
  push word [CurrentCont]
  push word L348
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, g26
  jmp [bp]

L350: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, si
  mov bp, g41
  jmp [bp]

L351: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L350
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L352: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L351
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L353: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L352
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g141
  mov bp, g26
  jmp [bp]

L354: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L353
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g140
  mov bp, si
  jmp [bp]

L355: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L354
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g26
  jmp [bp]

L356: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L355
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L357: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L356
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g139
  mov bp, g26
  jmp [bp]

L358: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L357
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g138
  mov bp, si
  jmp [bp]

L359: ; Arm: 793'31
  push word [CurrentCont]
  push word L358
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, g26
  jmp [bp]

L360: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L361: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 1
  jz L359
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [CurrentCont]
  push word L360
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L362: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  mov bx, si
  cmp word [bx], 1
  jz L349
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L361
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, [bp+8]
  mov bp, g40
  jmp [bp]

L363: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  mov bx, si
  cmp word [bx], 1
  jz L319
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 1
  jz L329
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L339
  push word [Temps+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L362
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, [Temps+2]
  mov bp, g40
  jmp [bp]

L364: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(22)
  push word si
  push word [bp+2]
  push word L363
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
  mov di, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L365: ; Function: (mk_comII,g142)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word si
  push word L364
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L366: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L367: ; Arm: 260'27
  push word [bp+2]
  push word [CurrentCont]
  push word L366
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g162
  mov bp, g20
  jmp [bp]

L368: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L369: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(16)
  push word [bp+4]
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word si
  push word [CurrentCont]
  push word L368
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [Temps+2]
  mov bp, g161
  jmp [bp]

L370: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L371: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L370
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, 257
  mov bp, si
  jmp [bp]

L372: ; Arm: 254'21
  mov ax, [bp+8]
  mov bx, 257
  sub ax, bx
  add ax, 1
  mov [Temps+4], ax
  push word [Temps+4]
  push word [CurrentCont]
  push word L371
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+6]
  mov bp, g68
  jmp [bp]

L373: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(18)
  mov ax, 257
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L369
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L372
  mov di, g163
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L374: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, 257
  mov bp, si
  jmp [bp]

L375: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L374
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, 1
  mov bp, si
  jmp [bp]

L376: ; Arm: 253'21
  push word [CurrentCont]
  push word L375
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g68
  jmp [bp]

L377: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
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
  jz L367
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
  push word L373
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L376
  mov di, si
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L378: ; Function: (loop,g161)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word si
  push word L377
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L379: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L380: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L379
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g41
  jmp [bp]

L381: ; Function: (lam,g204)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L380
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L382: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, g203
  mov bp, si
  jmp [bp]

L383: ; Function: (lam,g205)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L382
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g204
  mov bp, g7
  jmp [bp]

L384: ; Arm: 811'32
  mov di, g210
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L385: ; Arm: 322'24
  mov di, g213
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L386: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov di, [Temps+2]
  mov bp, [bp+6]
  jmp [bp]

L387: ; Arm: 325'32
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov di, [Temps+8]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L388: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
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
  push word L386
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L387
  mov di, g215
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L389: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, si
  mov bp, g41
  jmp [bp]

L390: ; Arm: 324'24
  push word [CurrentCont]
  push word L389
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g214
  mov bp, g22
  jmp [bp]

L391: ; Arm: 135'19
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov di, [Temps+10]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L392: ; Arm: 136'22
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov di, [Temps+12]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L393: ; Arm: 137'16
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+14], ax
  mov di, [Temps+14]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L394: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(16)
  mov bx, si
  cmp word [bx], 3
  jz L385
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
  push word L388
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L390
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
  jz L391
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L392
  mov ax, 53
  cmp word ax, [Temps+6]
  call Bare_make_bool_from_n
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L393
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
  mov di, [Temps+22]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L395: ; Arm: 10'9
  mov di, g211
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L396: ; Function: (loop,t3)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  mov ax, si
  cmp word ax, 1025
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word si
  push word [bp+2]
  push word [CurrentCont]
  push word L394
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L395
  mov di, g212
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L397: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov di, [Temps+2]
  mov bp, g207
  jmp [bp]

L398: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(14)
  mov dx, [bp+4]
  sar dx, 1
  mov bx, si
  call Bare_load_sector
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov [Temps+4], si
  push word [Temps+4]
  push word L396
  mov [Temps+6], sp
  push word 4 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L397
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, 1
  mov bp, [Temps+6]
  jmp [bp]

L399: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 3
  jz L384
  push word [bp+4]
  push word [CurrentCont]
  push word L398
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, 1025
  jmp AllocBare_make_bytes

L400: ; Arm: 10'9
  mov di, g208
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L401: ; Function: (loop,g207)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  mov ax, si
  cmp word ax, 21
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word si
  push word [CurrentCont]
  push word L399
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L400
  mov di, g209
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L402: ; Function: (lam,g216)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, 1
  mov bp, g207
  jmp [bp]

L403: ; Arm: 322'24
  mov di, g220
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L404: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov di, [Temps+2]
  mov bp, [bp+6]
  jmp [bp]

L405: ; Arm: 325'32
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov di, [Temps+8]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L406: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
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
  push word L404
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L405
  mov di, g222
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L407: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, si
  mov bp, g41
  jmp [bp]

L408: ; Arm: 324'24
  push word [CurrentCont]
  push word L407
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g221
  mov bp, g22
  jmp [bp]

L409: ; Arm: 135'19
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov di, [Temps+10]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L410: ; Arm: 136'22
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov di, [Temps+12]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L411: ; Arm: 137'16
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+14], ax
  mov di, [Temps+14]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L412: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(16)
  mov bx, si
  cmp word [bx], 3
  jz L403
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
  push word L406
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L408
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
  jz L409
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L410
  mov ax, 53
  cmp word ax, [Temps+6]
  call Bare_make_bool_from_n
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L411
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
  mov di, [Temps+22]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L413: ; Arm: 10'9
  mov di, g218
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L414: ; Function: (loop,t3)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  mov ax, si
  cmp word ax, 1025
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word si
  push word [bp+2]
  push word [CurrentCont]
  push word L412
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L413
  mov di, g219
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L415: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  mov dx, [bp+4]
  sar dx, 1
  mov bx, si
  call Bare_load_sector
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov [Temps+4], si
  push word [Temps+4]
  push word L414
  mov [Temps+6], sp
  push word 4 ;; scanned
  mov di, 1
  mov bp, [Temps+6]
  jmp [bp]

L416: ; Function: (lam,g223)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L415
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, 1025
  jmp AllocBare_make_bytes

L417: ; Arm: 10'9
  mov di, g241
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L418: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov ax, [bp+4]
  cmp word ax, si
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L417
  mov di, g242
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L419: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L418
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L420: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+2]
  push word [CurrentCont]
  push word L419
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, si
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L421: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L422: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(14)
  push word si
  push word L420
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+2]
  push word [CurrentCont]
  push word L421
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [Temps+2]
  mov bp, g4
  jmp [bp]

L423: ; Function: (lam,g243)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word si
  push word L422
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L424: ; Function: (lam,g244)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word si
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L425: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L426: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L425
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g283
  mov bp, g26
  jmp [bp]

L427: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L426
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g31
  jmp [bp]

L428: ; Function: (lam,g284)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L427
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, si
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L429: ; Arm: 198'14
  mov di, g344
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L430: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov bx, si
  cmp word [bx], 3
  jz L429
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
  mov di, [Temps+4]
  mov bp, [bp+8]
  jmp [bp]

L431: ; Arm: 10'9
  mov di, g342
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L432: ; Function: (loop,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  mov ax, si
  cmp word ax, 1025
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word si
  push word [bp+2]
  push word [CurrentCont]
  push word L430
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L431
  mov di, g343
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L433: ; Arm: 802'32
  mov di, g347
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L434: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov bx, si
  cmp word [bx], 3
  jz L433
  mov dx, [bp+6]
  sar dx, 1
  mov bx, [bp+4]
  call Bare_store_sector
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, [bp+6]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+4], ax
  mov di, [Temps+4]
  mov bp, [bp+8]
  jmp [bp]

L435: ; Arm: 10'9
  mov di, g345
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L436: ; Function: (loop,t2)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  mov ax, si
  cmp word ax, 21
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word si
  push word [bp+2]
  push word [CurrentCont]
  push word L434
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L435
  mov di, g346
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L437: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  mov ax, [bp+4]
  mov [Temps+2], ax
  push word [Temps+2]
  push word L436
  mov [Temps+4], sp
  push word 4 ;; scanned
  mov di, 1
  mov bp, [Temps+4]
  jmp [bp]

L438: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(14)
  push word si
  push word L432
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word si
  push word [CurrentCont]
  push word L437
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, 1
  mov bp, [Temps+2]
  jmp [bp]

L439: ; Function: (lam,g348)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L438
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, 1025
  jmp AllocBare_make_bytes

L440: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, si
  mov bp, g41
  jmp [bp]

L441: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L440
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L442: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L441
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L443: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L442
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g45
  mov bp, g26
  jmp [bp]

L444: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L443
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g44
  mov bp, si
  jmp [bp]

L445: ; Arm: 154'45
  push word [CurrentCont]
  push word L444
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g26
  jmp [bp]

L446: ; Function: (_trace,t2)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  mov bx, [bp+2]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L445
  mov di, g46
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L447: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L448: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(20)
  mov ax, si
  sar ax, 1
  mov bx, 33
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  push word [bp+4]
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+6], ax
  push word [Temps+6]
  push word 1
  mov [Temps+8], sp
  push word 4 ;; scanned
  push word [Temps+4]
  push word [CurrentCont]
  push word L447
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [Temps+8]
  mov bp, g83
  jmp [bp]

L449: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  mov ax, [bp+6]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [CurrentCont]
  push word L448
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov di, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L450: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L449
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [bp+6]
  mov bp, si
  jmp [bp]

L451: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L450
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, [bp+8]
  mov bp, si
  jmp [bp]

L452: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
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
  push word L451
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov di, [Temps+6]
  mov bp, g72
  jmp [bp]

L453: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L452
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L454: ; Arm: 593'11
  mov di, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L455: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
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
  mov di, [Temps+4]
  mov bp, g24
  jmp [bp]

L456: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L455
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L457: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(22)
  push word si
  push word [bp+6]
  push word [CurrentCont]
  push word L453
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [bp+8]
  cmp word [bx], 1
  jz L454
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
  push word L456
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, g99
  mov bp, g2
  jmp [bp]

L458: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L457
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, si
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L459: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
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
  push word L458
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, [Temps+6]
  mov bp, g84
  jmp [bp]

L460: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word si
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L459
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L461: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [bp+2]
  push word L460
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L462: ; Function: (storeI,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [bp+2]
  push word L461
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L463: ; Arm: 890'10
  mov di, g174
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L464: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L465: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  mov bx, [bp+10]
  cmp word [bx], 3
  jz L463
  mov bx, [bp+12]
  mov ax, [bx]
  mov [Temps+2], ax
  mov ax, [bp+8]
  mov bx, [Temps+2]
  add ax, bx
  sub ax, 1
  mov [Temps+4], ax
  push word [Temps+4]
  push word [CurrentCont]
  push word L464
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+4]
  mov bp, [bp+6]
  jmp [bp]

L466: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, si
  mov bp, g41
  jmp [bp]

L467: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L466
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L468: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L467
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L469: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L468
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g148
  mov bp, g26
  jmp [bp]

L470: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L469
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g146
  mov bp, si
  jmp [bp]

L471: ; Arm: 665'9
  push word [CurrentCont]
  push word L470
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g147
  mov bp, g26
  jmp [bp]

L472: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, si
  mov bp, g41
  jmp [bp]

L473: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L472
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L474: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L473
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L475: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L474
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g151
  mov bp, g26
  jmp [bp]

L476: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L475
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g149
  mov bp, si
  jmp [bp]

L477: ; Arm: 669'12
  push word [CurrentCont]
  push word L476
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g150
  mov bp, g26
  jmp [bp]

L478: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
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
  mov di, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L479: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L478
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [bp+8]
  mov bp, si
  jmp [bp]

L480: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L479
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, [bp+6]
  mov bp, si
  jmp [bp]

L481: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(28)
  push word si
  push word [bp+12]
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word 3
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [Temps+4]
  push word [bp+14]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L480
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov di, [bp+10]
  mov bp, [bp+4]
  jmp [bp]

L482: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L481
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov di, [bp+16]
  mov bp, si
  jmp [bp]

L483: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(20)
  push word si
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L482
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov di, [bp+16]
  mov bp, g20
  jmp [bp]

L484: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L483
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov di, [bp+18]
  mov bp, si
  jmp [bp]

L485: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
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
  push word L484
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov di, g153
  mov bp, g20
  jmp [bp]

L486: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(20)
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L485
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov di, [bp+16]
  mov bp, si
  jmp [bp]

L487: ; Arm: 678'15
  push word [bp+18]
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L486
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov di, g152
  mov bp, g20
  jmp [bp]

L488: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L489: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L488
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, 1
  mov bp, si
  jmp [bp]

L490: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L489
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+6]
  mov bp, si
  jmp [bp]

L491: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L490
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [bp+8]
  mov bp, si
  jmp [bp]

L492: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(20)
  push word [bp+8]
  push word [bp+12]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word [bp+14]
  push word [bp+10]
  push word [CurrentCont]
  push word L491
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, [bp+4]
  mov bp, [bp+6]
  jmp [bp]

L493: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(18)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L492
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov di, [bp+10]
  mov bp, si
  jmp [bp]

L494: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(20)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L493
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov di, [bp+10]
  mov bp, si
  jmp [bp]

L495: ; Arm: 684'22
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
  push word L494
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov di, [Temps+6]
  mov bp, g85
  jmp [bp]

L496: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, si
  mov bp, g41
  jmp [bp]

L497: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L496
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L498: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L497
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L499: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L498
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g157
  mov bp, g26
  jmp [bp]

L500: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L499
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g155
  mov bp, si
  jmp [bp]

L501: ; Arm: 689'22
  push word [CurrentCont]
  push word L500
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g156
  mov bp, g26
  jmp [bp]

L502: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L503: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L502
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, 1
  mov bp, si
  jmp [bp]

L504: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L503
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g158
  mov bp, si
  jmp [bp]

L505: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L504
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+6]
  mov bp, si
  jmp [bp]

L506: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(18)
  push word [bp+6]
  push word [bp+12]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word [bp+8]
  push word [CurrentCont]
  push word L505
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [bp+10]
  mov bp, [bp+4]
  jmp [bp]

L507: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(16)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L506
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov di, [bp+8]
  mov bp, si
  jmp [bp]

L508: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(18)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L507
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov di, [bp+8]
  mov bp, si
  jmp [bp]

L509: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(20)
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
  push word [Temps+6]
  push word [Temps+4]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L508
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov di, [Temps+6]
  mov bp, g85
  jmp [bp]

L510: ; Arm: 569'10
  mov di, g154
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L511: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(40)
  mov bx, si
  cmp word [bx], 1
  jz L487
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [bp+18]
  cmp word [bx], 3
  jz L495
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+20]
  push word [bp+16]
  push word [bp+14]
  push word [CurrentCont]
  push word L509
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
  jz L510
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
  mov di, [Temps+20]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L512: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
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
  push word L511
  mov [Temps+2], sp
  push word 22 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L513: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
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
  push word L512
  mov [Temps+2], sp
  push word 20 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L514: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(20)
  push word si
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L513
  mov [Temps+2], sp
  push word 18 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L515: ; Function: (loop,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(18)
  push word bp
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L514
  mov [Temps+2], sp
  push word 16 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L516: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L517: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L516
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+6]
  mov bp, si
  jmp [bp]

L518: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L517
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [bp+6]
  mov bp, si
  jmp [bp]

L519: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L518
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, [bp+6]
  mov bp, si
  jmp [bp]

L520: ; Arm: 704'10
  mov ax, [bp+2]
  sar ax, 1
  mov bx, 257
  sar bx, 1
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+4], dx
  push word [Temps+4]
  push word si
  push word [bp+14]
  push word [bp+6]
  push word [CurrentCont]
  push word L519
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov di, [bp+12]
  mov bp, [bp+4]
  jmp [bp]

L521: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L522: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L521
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+6]
  mov bp, si
  jmp [bp]

L523: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L522
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L524: ; Arm: 707'22
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [bp+14]
  push word [Temps+4]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  mov ax, [bp+8]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+10], ax
  push word [Temps+8]
  push word [Temps+6]
  push word [bp+12]
  push word [CurrentCont]
  push word L523
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, [Temps+10]
  mov bp, [bp+10]
  jmp [bp]

L525: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, si
  mov bp, g41
  jmp [bp]

L526: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L525
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L527: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L526
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L528: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L527
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g168
  mov bp, g26
  jmp [bp]

L529: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L528
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g166
  mov bp, si
  jmp [bp]

L530: ; Arm: 710'22
  push word [CurrentCont]
  push word L529
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g167
  mov bp, g26
  jmp [bp]

L531: ; Arm: 198'14
  mov di, g171
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L532: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov bx, si
  cmp word [bx], 3
  jz L531
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
  mov di, [Temps+4]
  mov bp, [bp+8]
  jmp [bp]

L533: ; Arm: 10'9
  mov di, g169
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L534: ; Function: (loop,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  mov ax, si
  cmp word ax, 257
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word si
  push word [bp+2]
  push word [CurrentCont]
  push word L532
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L533
  mov di, g170
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L535: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, g172
  mov bp, si
  jmp [bp]

L536: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L535
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L537: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L536
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L538: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(18)
  push word [bp+8]
  push word [bp+12]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+4], ax
  push word [Temps+2]
  push word [bp+10]
  push word [CurrentCont]
  push word L537
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [Temps+4]
  mov bp, [bp+6]
  jmp [bp]

L539: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L538
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov di, [bp+14]
  mov bp, si
  jmp [bp]

L540: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(24)
  mov ax, [bp+14]
  mov [Temps+2], ax
  push word [Temps+2]
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [Temps+4]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L539
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov di, [bp+12]
  mov bp, g83
  jmp [bp]

L541: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(24)
  push word si
  push word L534
  mov [Temps+2], sp
  push word 4 ;; scanned
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
  mov di, 1
  mov bp, [Temps+2]
  jmp [bp]

L542: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(16)
  mov bx, si
  cmp word [bx], 1
  jz L530
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [Temps+6]
  push word [Temps+4]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L541
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov di, 257
  jmp AllocBare_make_bytes

L543: ; Arm: 569'10
  mov di, g165
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L544: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(36)
  mov ax, [bp+8]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L520
  mov bx, si
  cmp word [bx], 3
  jz L524
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [CurrentCont]
  push word L542
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
  jz L543
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
  mov di, [Temps+18]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L545: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(18)
  push word si
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L544
  mov [Temps+2], sp
  push word 16 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L546: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(16)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L545
  mov [Temps+2], sp
  push word 14 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L547: ; Function: (skip_loop,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(14)
  push word bp
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L546
  mov [Temps+2], sp
  push word 12 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L548: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L549: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L548
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g173
  mov bp, si
  jmp [bp]

L550: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L549
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L551: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
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
  push word L550
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [Temps+2]
  mov bp, [bp+8]
  jmp [bp]

L552: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(22)
  push word si
  push word [bp+10]
  push word [bp+4]
  push word L547
  mov [Temps+2], sp
  push word 8 ;; scanned
  push word [Temps+2]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L551
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  mov di, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L553: ; Arm: 698'40
  mov di, g159
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L554: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [bp+4]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L555: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L554
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+6]
  mov bp, si
  jmp [bp]

L556: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L555
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, g164
  mov bp, g161
  jmp [bp]

L557: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L558: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L557
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L559: ; Arm: 254'21
  mov ax, [bp+8]
  mov bx, [bp+6]
  sub ax, bx
  add ax, 1
  mov [Temps+4], ax
  push word [Temps+4]
  push word [bp+6]
  push word [CurrentCont]
  push word L558
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [bp+4]
  mov bp, g68
  jmp [bp]

L560: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(18)
  mov ax, [bp+6]
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word si
  push word [CurrentCont]
  push word L556
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L559
  mov di, g160
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L561: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L562: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L561
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, 1
  mov bp, si
  jmp [bp]

L563: ; Arm: 253'21
  push word [Temps+6]
  push word [CurrentCont]
  push word L562
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+12]
  mov bp, g68
  jmp [bp]

L564: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(48)
  push word si
  push word [bp+16]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L515
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
  push word L552
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L553
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
  push word L560
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+14]
  cmp word [bx], 3
  jz L563
  mov di, [bp+12]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L565: ; Arm: 100'23
  mov di, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L566: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
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
  push word L564
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L565
  mov di, si
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L567: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(22)
  mov bx, si
  cmp word [bx], 1
  jz L477
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
  push word L566
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  mov di, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L568: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L567
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov di, [bp+8]
  mov bp, si
  jmp [bp]

L569: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(20)
  push word si
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L568
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov di, si
  mov bp, g97
  jmp [bp]

L570: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
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
  push word L465
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L471
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [Temps+4]
  push word si
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L569
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bx, [Temps+4]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov ax, [bx+6]
  mov [Temps+10], ax
  mov di, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L571: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L572: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L571
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, 1
  mov bp, si
  jmp [bp]

L573: ; Arm: 888'21
  mov ax, [bp+16]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  push word [Temps+2]
  push word [CurrentCont]
  push word L572
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+14]
  mov bp, g68
  jmp [bp]

L574: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, g145
  mov bp, si
  jmp [bp]

L575: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(26)
  push word si
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L570
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L573
  push word [CurrentCont]
  push word L574
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+14]
  mov bp, g26
  jmp [bp]

L576: ; Arm: 887'22
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
  mov di, [Temps+10]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L577: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(20)
  mov bx, si
  mov ax, [bx]
  mov [Temps+2], ax
  mov ax, 1
  cmp word ax, [Temps+2]
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
  push word L575
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L576
  mov di, g144
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L578: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(16)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L577
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov di, g143
  mov bp, g79
  jmp [bp]

L579: ; Function: (write_to_file,t3)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word bp
  push word si
  push word [bp+4]
  push word [bp+2]
  push word L578
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L580: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, si
  mov bp, g41
  jmp [bp]

L581: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L580
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L582: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L581
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L583: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L582
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g227
  mov bp, g26
  jmp [bp]

L584: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L583
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g225
  mov bp, si
  jmp [bp]

L585: ; Arm: 820'11
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L584
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g226
  mov bp, g26
  jmp [bp]

L586: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, g230
  mov bp, si
  jmp [bp]

L587: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L586
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L588: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(24)
  push word si
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word 161
  push word 11
  push word 81
  push word 1
  mov [Temps+4], sp
  push word 8 ;; scanned
  push word [Temps+2]
  push word [CurrentCont]
  push word L587
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [Temps+4]
  mov bp, [bp+2]
  jmp [bp]

L589: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L590: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(14)
  push word [bp+4]
  push word L588
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word si
  push word [CurrentCont]
  push word L589
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [Temps+2]
  mov bp, g7
  jmp [bp]

L591: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L590
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, 159
  mov bp, si
  jmp [bp]

L592: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L591
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, 1
  mov bp, g9
  jmp [bp]

L593: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L592
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+6]
  mov bp, si
  jmp [bp]

L594: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(22)
  push word si
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word 1
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word [bp+4]
  push word [CurrentCont]
  push word L593
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [Temps+4]
  mov bp, g83
  jmp [bp]

L595: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L594
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+6]
  mov bp, si
  jmp [bp]

L596: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L595
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, g229
  mov bp, g26
  jmp [bp]

L597: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(32)
  mov bx, [bp+4]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L585
  push word g228
  push word `P`
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [Temps+4]
  push word `\x05`
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word `(`
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [bp+2]
  push word [CurrentCont]
  push word L596
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [Temps+8]
  mov bp, g24
  jmp [bp]

L598: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, si
  mov bp, g41
  jmp [bp]

L599: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L598
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L600: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L599
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L601: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L600
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g234
  mov bp, g26
  jmp [bp]

L602: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L601
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g232
  mov bp, si
  jmp [bp]

L603: ; Arm: 831'11
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L602
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g233
  mov bp, g26
  jmp [bp]

L604: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, si
  mov bp, g41
  jmp [bp]

L605: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L604
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L606: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L605
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L607: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L606
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g248
  mov bp, g26
  jmp [bp]

L608: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L607
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g246
  mov bp, si
  jmp [bp]

L609: ; Arm: 834'12
  push word [CurrentCont]
  push word L608
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g247
  mov bp, g26
  jmp [bp]

L610: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 1
  jz L609
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
  mov di, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L611: ; Arm: 537'9
  mov di, g239
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L612: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
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
  mov di, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L613: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L612
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [bp+8]
  mov bp, si
  jmp [bp]

L614: ; Arm: 543'10
  push word [bp+10]
  push word [bp+6]
  push word [bp+2]
  push word [CurrentCont]
  push word L613
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, g240
  mov bp, g20
  jmp [bp]

L615: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L616: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L615
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+6]
  mov bp, si
  jmp [bp]

L617: ; Arm: 547'19
  mov ax, [bp+10]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  push word [bp+10]
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [bp+8]
  push word [Temps+4]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word [Temps+2]
  push word [CurrentCont]
  push word L616
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [bp+4]
  mov bp, [bp+6]
  jmp [bp]

L618: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L619: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L618
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L620: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L619
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, si
  mov bp, [bp+4]
  jmp [bp]

L621: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L620
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, [bp+8]
  mov bp, si
  jmp [bp]

L622: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L621
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L623: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(24)
  mov bx, si
  cmp word [bx], 1
  jz L617
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  mov ax, [bp+10]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+8], ax
  push word [Temps+8]
  push word [Temps+6]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L622
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov di, g243
  mov bp, g6
  jmp [bp]

L624: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L623
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov di, [bp+12]
  mov bp, si
  jmp [bp]

L625: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(22)
  mov ax, si
  cmp word ax, [bp+4]
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L614
  push word si
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [Temps+4]
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L624
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov di, [bp+2]
  mov bp, g97
  jmp [bp]

L626: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L625
  mov [Temps+2], sp
  push word 12 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L627: ; Function: (loop,t5)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word bp
  push word si
  push word [bp+4]
  push word [bp+2]
  push word L626
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L628: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, 1
  mov bp, si
  jmp [bp]

L629: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L628
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g245
  mov bp, si
  jmp [bp]

L630: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L629
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, [bp+4]
  jmp [bp]

L631: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L630
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+6]
  mov bp, si
  jmp [bp]

L632: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L631
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, g244
  mov bp, g2
  jmp [bp]

L633: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L632
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+6]
  mov bp, si
  jmp [bp]

L634: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(26)
  push word [bp+4]
  push word [CurrentCont]
  push word L610
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, si
  cmp word [bx], 1
  jz L611
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
  push word L627
  mov [Temps+10], sp
  push word 6 ;; scanned
  mov ax, 3
  mov bx, [Temps+6]
  add ax, bx
  sub ax, 1
  mov [Temps+12], ax
  mov ax, [Temps+4]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+14], ax
  push word [Temps+14]
  push word [Temps+10]
  push word [CurrentCont]
  push word L633
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [Temps+12]
  mov bp, g9
  jmp [bp]

L635: ; Arm: 489'49
  mov di, g238
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L636: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(24)
  push word [bp+4]
  push word [CurrentCont]
  push word L634
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L635
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
  mov di, [Temps+16]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L637: ; Arm: 10'9
  mov di, g236
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L638: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L636
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L637
  mov di, g237
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L639: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L638
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, g235
  mov bp, si
  jmp [bp]

L640: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L639
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, si
  mov bp, g56
  jmp [bp]

L641: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L640
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, 9
  mov bp, si
  jmp [bp]

L642: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L641
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, 1
  mov bp, si
  jmp [bp]

L643: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L642
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, si
  mov bp, g68
  jmp [bp]

L644: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L643
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, si
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L645: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(14)
  mov bx, [bp+2]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L603
  push word 1
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [bp+2]
  push word [CurrentCont]
  push word L644
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [Temps+4]
  mov bp, g84
  jmp [bp]

L646: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, si
  mov bp, g41
  jmp [bp]

L647: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L646
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L648: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L647
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L649: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L648
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g252
  mov bp, g26
  jmp [bp]

L650: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L649
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g250
  mov bp, si
  jmp [bp]

L651: ; Arm: 841'9
  push word [CurrentCont]
  push word L650
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g251
  mov bp, g26
  jmp [bp]

L652: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  mov bx, [bp+2]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L651
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov bx, [bp+2]
  mov ax, g253
  mov [bx], ax
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov di, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L653: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, si
  mov bp, g41
  jmp [bp]

L654: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L653
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L655: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L654
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L656: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L655
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g257
  mov bp, g26
  jmp [bp]

L657: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L656
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g255
  mov bp, si
  jmp [bp]

L658: ; Arm: 847'9
  push word [CurrentCont]
  push word L657
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g256
  mov bp, g26
  jmp [bp]

L659: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, si
  mov bp, g41
  jmp [bp]

L660: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L659
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L661: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L660
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L662: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L661
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g267
  mov bp, g26
  jmp [bp]

L663: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L662
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g266
  mov bp, si
  jmp [bp]

L664: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L663
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g26
  jmp [bp]

L665: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L664
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g31
  jmp [bp]

L666: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L665
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, g1
  jmp [bp]

L667: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L666
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, si
  mov bp, g41
  jmp [bp]

L668: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L667
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L669: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L668
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+6]
  mov bp, si
  jmp [bp]

L670: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L669
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, g265
  mov bp, g26
  jmp [bp]

L671: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L670
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g264
  mov bp, si
  jmp [bp]

L672: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L671
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, si
  mov bp, g26
  jmp [bp]

L673: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L672
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, si
  mov bp, g31
  jmp [bp]

L674: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L673
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+6]
  mov bp, g1
  jmp [bp]

L675: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L674
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, si
  mov bp, g41
  jmp [bp]

L676: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L675
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L677: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L676
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [bp+8]
  mov bp, si
  jmp [bp]

L678: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L677
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, g263
  mov bp, g26
  jmp [bp]

L679: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L678
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, g259
  mov bp, si
  jmp [bp]

L680: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L679
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, si
  mov bp, g26
  jmp [bp]

L681: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L682: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L681
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g262
  mov bp, g26
  jmp [bp]

L683: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L682
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L684: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L683
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, si
  mov bp, g26
  jmp [bp]

L685: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L684
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+4]
  mov bp, g31
  jmp [bp]

L686: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L685
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+6]
  mov bp, si
  jmp [bp]

L687: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L686
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, g261
  mov bp, g26
  jmp [bp]

L688: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L687
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+6]
  mov bp, si
  jmp [bp]

L689: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L688
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, si
  mov bp, g26
  jmp [bp]

L690: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L689
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [bp+6]
  mov bp, g31
  jmp [bp]

L691: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L690
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [bp+8]
  mov bp, si
  jmp [bp]

L692: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L691
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, g260
  mov bp, g26
  jmp [bp]

L693: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(20)
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L680
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [bx+6]
  mov [Temps+6], ax
  push word [Temps+4]
  push word [Temps+2]
  push word [CurrentCont]
  push word L692
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [Temps+6]
  mov bp, g31
  jmp [bp]

L694: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L693
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, si
  mov bp, g41
  jmp [bp]

L695: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  mov bx, [bp+2]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L658
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
  push word L694
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, g258
  mov bp, g22
  jmp [bp]

L696: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, si
  mov bp, g41
  jmp [bp]

L697: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L696
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L698: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L697
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L699: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L698
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g271
  mov bp, g26
  jmp [bp]

L700: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L699
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g269
  mov bp, si
  jmp [bp]

L701: ; Arm: 869'9
  push word [CurrentCont]
  push word L700
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g270
  mov bp, g26
  jmp [bp]

L702: ; Arm: 878'17
  mov di, g272
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L703: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, si
  mov bp, g41
  jmp [bp]

L704: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L703
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L705: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L704
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L706: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L705
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g275
  mov bp, g26
  jmp [bp]

L707: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L706
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L708: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L707
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, si
  mov bp, g26
  jmp [bp]

L709: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L708
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+4]
  mov bp, g31
  jmp [bp]

L710: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L709
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+6]
  mov bp, si
  jmp [bp]

L711: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L710
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, g274
  mov bp, g26
  jmp [bp]

L712: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L711
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g273
  mov bp, si
  jmp [bp]

L713: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L712
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, si
  mov bp, g26
  jmp [bp]

L714: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L713
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, si
  mov bp, g31
  jmp [bp]

L715: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 1
  jz L702
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [bp+4]
  push word [CurrentCont]
  push word L714
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  mov di, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L716: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L715
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+6]
  mov bp, si
  jmp [bp]

L717: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(16)
  push word si
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word si
  push word [CurrentCont]
  push word L716
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [bp+2]
  mov bp, g97
  jmp [bp]

L718: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L719: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(14)
  push word [bp+4]
  push word L717
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word si
  push word [CurrentCont]
  push word L718
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [Temps+2]
  mov bp, g7
  jmp [bp]

L720: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L719
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+6]
  mov bp, si
  jmp [bp]

L721: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  mov ax, si
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  push word [Temps+2]
  push word [bp+4]
  push word [CurrentCont]
  push word L720
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, 1
  mov bp, g9
  jmp [bp]

L722: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L721
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, si
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [bx+6]
  mov [Temps+6], ax
  mov di, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L723: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  mov bx, [bp+2]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L701
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
  push word L722
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+4]
  mov ax, [bx+2]
  mov [Temps+12], ax
  mov ax, [bx+4]
  mov [Temps+14], ax
  mov ax, [bx+6]
  mov [Temps+16], ax
  mov di, [Temps+12]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L724: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, si
  mov bp, g41
  jmp [bp]

L725: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L724
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L726: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L725
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L727: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L726
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g279
  mov bp, g26
  jmp [bp]

L728: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L727
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g277
  mov bp, si
  jmp [bp]

L729: ; Arm: 859'9
  push word [CurrentCont]
  push word L728
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g278
  mov bp, g26
  jmp [bp]

L730: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, si
  mov bp, g41
  jmp [bp]

L731: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L730
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L732: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L731
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L733: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L732
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, si
  mov bp, g26
  jmp [bp]

L734: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L733
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+6]
  mov bp, si
  jmp [bp]

L735: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L734
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, g289
  mov bp, g26
  jmp [bp]

L736: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L735
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+4]
  mov bp, g31
  jmp [bp]

L737: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L736
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+6]
  mov bp, si
  jmp [bp]

L738: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L737
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, g288
  mov bp, g26
  jmp [bp]

L739: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L738
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g280
  mov bp, si
  jmp [bp]

L740: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L739
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, si
  mov bp, g26
  jmp [bp]

L741: ; Arm: 426'9
  mov di, g281
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L742: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L743: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L742
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g287
  mov bp, g26
  jmp [bp]

L744: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L743
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L745: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L744
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, si
  mov bp, g26
  jmp [bp]

L746: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L745
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+4]
  mov bp, g31
  jmp [bp]

L747: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L746
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+6]
  mov bp, si
  jmp [bp]

L748: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L747
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, g286
  mov bp, g26
  jmp [bp]

L749: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L748
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g282
  mov bp, si
  jmp [bp]

L750: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L749
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, si
  mov bp, g26
  jmp [bp]

L751: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L750
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+6]
  mov bp, si
  jmp [bp]

L752: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L751
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, g285
  mov bp, g61
  jmp [bp]

L753: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L752
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+6]
  mov bp, si
  jmp [bp]

L754: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(18)
  push word [bp+4]
  push word [CurrentCont]
  push word L740
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, si
  cmp word [bx], 1
  jz L741
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
  push word L753
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, g284
  mov bp, g2
  jmp [bp]

L755: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L754
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+6]
  mov bp, si
  jmp [bp]

L756: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(16)
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word [bp+4]
  push word [CurrentCont]
  push word L755
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, si
  mov bp, g97
  jmp [bp]

L757: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  mov bx, [bp+2]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L729
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word si
  push word [CurrentCont]
  push word L756
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+4]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov ax, [bx+6]
  mov [Temps+10], ax
  mov di, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L758: ; Arm: 939'18
  mov di, g301
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L759: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, [bp+8]
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov di, [Temps+2]
  mov bp, [bp+6]
  jmp [bp]

L760: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, si
  mov bp, g41
  jmp [bp]

L761: ; Arm: 942'6
  push word [CurrentCont]
  push word L760
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [Temps+4]
  mov bp, g22
  jmp [bp]

L762: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, si
  mov bp, g41
  jmp [bp]

L763: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L762
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L764: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L763
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L765: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L764
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, 1
  mov bp, si
  jmp [bp]

L766: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(20)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L758
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
  push word L759
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L761
  push word si
  push word [CurrentCont]
  push word L765
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [Temps+4]
  mov bp, g68
  jmp [bp]

L767: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, 1
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L768: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L767
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g41
  jmp [bp]

L769: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L768
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L770: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L769
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L771: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L770
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g293
  mov bp, g26
  jmp [bp]

L772: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L771
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g291
  mov bp, si
  jmp [bp]

L773: ; Arm: 634'9
  push word [CurrentCont]
  push word L772
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g292
  mov bp, g26
  jmp [bp]

L774: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, 1
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L775: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L774
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g41
  jmp [bp]

L776: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L775
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L777: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L776
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L778: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L777
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g296
  mov bp, g26
  jmp [bp]

L779: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L778
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g294
  mov bp, si
  jmp [bp]

L780: ; Arm: 638'12
  push word [CurrentCont]
  push word L779
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g295
  mov bp, g26
  jmp [bp]

L781: ; Arm: 642'33
  mov di, 1
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L782: ; Arm: 644'17
  mov di, 1
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L783: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L784: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L783
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L785: ; Arm: 647'15
  mov ax, [bp+10]
  mov bx, 257
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  push word [Temps+2]
  push word [bp+8]
  push word [CurrentCont]
  push word L784
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L786: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L787: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L786
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+6]
  mov bp, si
  jmp [bp]

L788: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L787
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, 1
  mov bp, si
  jmp [bp]

L789: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word si
  push word [bp+6]
  push word [CurrentCont]
  push word L788
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [bp+4]
  mov bp, g72
  jmp [bp]

L790: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L789
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [bp+6]
  mov bp, si
  jmp [bp]

L791: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L790
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [bp+6]
  mov bp, si
  jmp [bp]

L792: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L791
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, si
  mov bp, g68
  jmp [bp]

L793: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L792
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, si
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L794: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L793
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, [bp+8]
  mov bp, g84
  jmp [bp]

L795: ; Arm: 99'23
  mov di, 257
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L796: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  mov ax, 257
  cmp word ax, si
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L794
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L795
  mov di, si
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L797: ; Arm: 99'23
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L798: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  mov bx, si
  cmp word [bx], 3
  jz L785
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
  push word L796
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L797
  mov di, [bp+8]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L799: ; Arm: 10'9
  mov di, g299
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L800: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(18)
  mov bx, si
  cmp word [bx], 3
  jz L781
  mov bx, [bp+6]
  cmp word [bx], 1
  jz L782
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
  push word L798
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L799
  mov di, g300
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L801: ; Arm: 10'9
  mov di, g297
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L802: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
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
  push word L800
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L801
  mov di, g298
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L803: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L802
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L804: ; Function: (loop,t2)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word bp
  push word si
  push word [bp+2]
  push word L803
  mov [Temps+2], sp
  push word 8 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L805: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L806: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L805
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+6]
  mov bp, si
  jmp [bp]

L807: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  mov ax, si
  mov bx, [bp+4]
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  push word [Temps+2]
  push word [bp+4]
  push word [CurrentCont]
  push word L806
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L808: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word si
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L807
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [bp+6]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L809: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(18)
  mov bx, si
  cmp word [bx], 1
  jz L780
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [bp+4]
  push word L804
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+6]
  push word [CurrentCont]
  push word L808
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov di, [Temps+8]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L810: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L809
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [bp+8]
  mov bp, si
  jmp [bp]

L811: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(18)
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L810
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, si
  mov bp, g97
  jmp [bp]

L812: ; Function: (loop,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(24)
  mov bx, [bp+2]
  mov ax, [bx]
  mov [Temps+2], ax
  push word bp
  push word si
  push word [bp+6]
  push word [CurrentCont]
  push word L766
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L773
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L811
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+4]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov ax, [bx+6]
  mov [Temps+10], ax
  mov di, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L813: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word L812
  mov [Temps+2], sp
  push word 8 ;; scanned
  mov di, 1
  mov bp, [Temps+2]
  jmp [bp]

L814: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word si
  push word [bp+2]
  push word [CurrentCont]
  push word L813
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, 257
  jmp AllocBare_make_bytes

L815: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, si
  mov bp, g41
  jmp [bp]

L816: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L815
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L817: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L816
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L818: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L817
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g305
  mov bp, g26
  jmp [bp]

L819: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L818
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g303
  mov bp, si
  jmp [bp]

L820: ; Arm: 918'9
  push word [CurrentCont]
  push word L819
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g304
  mov bp, g26
  jmp [bp]

L821: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, si
  mov bp, g41
  jmp [bp]

L822: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L821
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L823: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L822
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L824: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L823
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g308
  mov bp, g26
  jmp [bp]

L825: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L824
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g306
  mov bp, si
  jmp [bp]

L826: ; Arm: 922'12
  push word [CurrentCont]
  push word L825
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g307
  mov bp, g26
  jmp [bp]

L827: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
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
  mov di, g310
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L828: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L827
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, g309
  mov bp, si
  jmp [bp]

L829: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L828
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [bp+8]
  mov bp, si
  jmp [bp]

L830: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(18)
  push word [bp+8]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word si
  push word [bp+6]
  push word [CurrentCont]
  push word L829
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, [bp+10]
  mov bp, [bp+4]
  jmp [bp]

L831: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L830
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov di, [bp+12]
  mov bp, si
  jmp [bp]

L832: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L831
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov di, si
  mov bp, g98
  jmp [bp]

L833: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(40)
  mov bx, si
  cmp word [bx], 1
  jz L826
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
  push word L832
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
  mov di, [Temps+18]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L834: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
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
  mov di, [bp+14]
  mov bp, si
  jmp [bp]

L835: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(24)
  push word [bp+8]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L834
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov di, si
  mov bp, g97
  jmp [bp]

L836: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(14)
  mov bx, [bp+4]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L820
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [Temps+4]
  push word si
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L835
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, [Temps+4]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov ax, [bx+6]
  mov [Temps+10], ax
  mov di, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L837: ; Arm: 895'9
  mov di, g322
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L838: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, 1
  mov bp, si
  jmp [bp]

L839: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L838
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L840: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L839
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, si
  mov bp, g41
  jmp [bp]

L841: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L840
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L842: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L841
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [bp+8]
  mov bp, si
  jmp [bp]

L843: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L842
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, g324
  mov bp, g26
  jmp [bp]

L844: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L843
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, g323
  mov bp, si
  jmp [bp]

L845: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L844
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, si
  mov bp, g26
  jmp [bp]

L846: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L845
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, si
  mov bp, g31
  jmp [bp]

L847: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 1
  jz L837
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [bp+4]
  push word [CurrentCont]
  push word L846
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov di, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L848: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, g315
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L849: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L848
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g41
  jmp [bp]

L850: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L849
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L851: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L850
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L852: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L851
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g314
  mov bp, g26
  jmp [bp]

L853: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L852
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g312
  mov bp, si
  jmp [bp]

L854: ; Arm: 607'9
  push word [CurrentCont]
  push word L853
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g313
  mov bp, g26
  jmp [bp]

L855: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, g320
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L856: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L855
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g41
  jmp [bp]

L857: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L856
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L858: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L857
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L859: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L858
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g319
  mov bp, g26
  jmp [bp]

L860: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L859
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g317
  mov bp, si
  jmp [bp]

L861: ; Arm: 610'12
  push word [CurrentCont]
  push word L860
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g318
  mov bp, g26
  jmp [bp]

L862: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
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
  mov di, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L863: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L862
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, [bp+10]
  mov bp, si
  jmp [bp]

L864: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L863
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov di, [bp+8]
  mov bp, si
  jmp [bp]

L865: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(28)
  push word g321
  push word 1
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word 3
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [Temps+4]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L864
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov di, si
  mov bp, [bp+4]
  jmp [bp]

L866: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L861
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
  push word L865
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, [Temps+4]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov ax, [bx+4]
  mov [Temps+10], ax
  mov ax, [bx+6]
  mov [Temps+12], ax
  mov di, [Temps+8]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L867: ; Arm: 561'10
  mov di, g316
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L868: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(42)
  mov bx, [bp+4]
  mov ax, [bx]
  mov [Temps+2], ax
  push word [bp+6]
  push word [CurrentCont]
  push word L847
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L854
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L866
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
  jz L867
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
  mov di, [Temps+20]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L869: ; Arm: 905'9
  mov di, g336
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L870: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L871: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(14)
  push word [bp+6]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word si
  push word [CurrentCont]
  push word L870
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [Temps+2]
  mov bp, [bp+4]
  jmp [bp]

L872: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 1
  jz L869
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L871
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  mov di, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L873: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, g331
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L874: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L873
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g41
  jmp [bp]

L875: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L874
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L876: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L875
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L877: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L876
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g330
  mov bp, g26
  jmp [bp]

L878: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L877
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g328
  mov bp, si
  jmp [bp]

L879: ; Arm: 623'9
  push word [CurrentCont]
  push word L878
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g329
  mov bp, g26
  jmp [bp]

L880: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, g335
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L881: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L880
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g41
  jmp [bp]

L882: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L881
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L883: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L882
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L884: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L883
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g334
  mov bp, g26
  jmp [bp]

L885: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L884
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g332
  mov bp, si
  jmp [bp]

L886: ; Arm: 627'12
  push word [CurrentCont]
  push word L885
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g333
  mov bp, g26
  jmp [bp]

L887: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 1
  jz L886
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word 3
  mov [Temps+4], sp
  push word 4 ;; scanned
  mov di, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L888: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L887
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L889: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(14)
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word [CurrentCont]
  push word L888
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, si
  mov bp, g97
  jmp [bp]

L890: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(18)
  mov bx, [bp+4]
  mov ax, [bx]
  mov [Temps+2], ax
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L872
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L879
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [bp+8]
  push word [CurrentCont]
  push word L889
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+4]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov ax, [bx+6]
  mov [Temps+10], ax
  mov di, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L891: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L890
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, si
  mov bp, g41
  jmp [bp]

L892: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L891
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L893: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L892
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, [bp+10]
  mov bp, si
  jmp [bp]

L894: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L893
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov di, g327
  mov bp, g26
  jmp [bp]

L895: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L894
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, g326
  mov bp, si
  jmp [bp]

L896: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L895
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, si
  mov bp, g26
  jmp [bp]

L897: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word si
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L896
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, si
  mov bp, g31
  jmp [bp]

L898: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L899: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(14)
  push word [bp+6]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+8]
  push word [CurrentCont]
  push word L898
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [Temps+2]
  mov bp, [bp+4]
  jmp [bp]

L900: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L899
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, si
  mov bp, g41
  jmp [bp]

L901: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L900
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L902: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L901
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, [bp+10]
  mov bp, si
  jmp [bp]

L903: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L902
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov di, g340
  mov bp, g26
  jmp [bp]

L904: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L903
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, [bp+10]
  mov bp, si
  jmp [bp]

L905: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L904
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov di, si
  mov bp, g26
  jmp [bp]

L906: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L905
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov di, [bp+6]
  mov bp, g31
  jmp [bp]

L907: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L906
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, [bp+10]
  mov bp, si
  jmp [bp]

L908: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L907
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov di, g339
  mov bp, g26
  jmp [bp]

L909: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L908
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, g338
  mov bp, si
  jmp [bp]

L910: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L909
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, si
  mov bp, g26
  jmp [bp]

L911: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word si
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L910
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, si
  mov bp, g31
  jmp [bp]

L912: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [bp+2]
  push word L911
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L913: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, si
  mov bp, g41
  jmp [bp]

L914: ; Arm: 1006'36
  push word [CurrentCont]
  push word L913
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g353
  mov bp, g22
  jmp [bp]

L915: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov di, [Temps+2]
  mov bp, [bp+6]
  jmp [bp]

L916: ; Arm: 990'7
  mov di, g356
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L917: ; Arm: 743'9
  mov di, g357
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L918: ; Arm: 747'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L919: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L918
  mov di, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L920: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L919
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L921: ; Function: (loop,t3)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L917
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
  push word L920
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov di, [Temps+6]
  mov bp, g56
  jmp [bp]

L922: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, si
  mov bp, g41
  jmp [bp]

L923: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L922
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L924: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L923
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L925: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L924
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g360
  mov bp, g26
  jmp [bp]

L926: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L925
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g359
  mov bp, si
  jmp [bp]

L927: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L926
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g26
  jmp [bp]

L928: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L927
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g358
  mov bp, si
  jmp [bp]

L929: ; Arm: 993'12
  push word [CurrentCont]
  push word L928
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, g26
  jmp [bp]

L930: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 1
  jz L929
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov di, [bp+6]
  mov bp, [Temps+4]
  jmp [bp]

L931: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L930
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, si
  mov bp, [bp+8]
  jmp [bp]

L932: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(28)
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L915
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 1
  jz L916
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+2]
  push word L921
  mov [Temps+6], sp
  push word 4 ;; scanned
  push word [Temps+6]
  push word [Temps+4]
  push word [Temps+2]
  push word [CurrentCont]
  push word L931
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov di, [Temps+8]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L933: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L932
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, [bp+10]
  mov bp, si
  jmp [bp]

L934: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L933
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov di, g355
  mov bp, g20
  jmp [bp]

L935: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L934
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, [bp+10]
  mov bp, si
  jmp [bp]

L936: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L935
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov di, g354
  mov bp, g62
  jmp [bp]

L937: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  mov bx, si
  cmp word [bx], 3
  jz L914
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L936
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, [bp+10]
  mov bp, g22
  jmp [bp]

L938: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L937
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L939: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(16)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L938
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov di, si
  mov bp, g56
  jmp [bp]

L940: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L939
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov di, g352
  mov bp, g79
  jmp [bp]

L941: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L940
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov di, si
  mov bp, g41
  jmp [bp]

L942: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L941
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L943: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L942
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov di, g351
  mov bp, si
  jmp [bp]

L944: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L943
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov di, si
  mov bp, g26
  jmp [bp]

L945: ; Function: (repl,t17)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(14)
  push word bp
  push word si
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L944
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov di, si
  mov bp, g31
  jmp [bp]

L946: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, 3
  mov bp, [bp+4]
  jmp [bp]

L947: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L946
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, si
  mov bp, g41
  jmp [bp]

L948: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L947
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L949: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L948
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+6]
  mov bp, si
  jmp [bp]

L950: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L949
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, g371
  mov bp, g26
  jmp [bp]

L951: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L950
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g369
  mov bp, si
  jmp [bp]

L952: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L951
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, si
  mov bp, g26
  jmp [bp]

L953: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L952
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+6]
  mov bp, si
  jmp [bp]

L954: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
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
  mov di, g370
  mov bp, g61
  jmp [bp]

L955: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L954
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, si
  mov bp, g41
  jmp [bp]

L956: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L955
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L957: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L956
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [bp+8]
  mov bp, si
  jmp [bp]

L958: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L957
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, g368
  mov bp, g26
  jmp [bp]

L959: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
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
  mov di, 1537
  mov bp, g31
  jmp [bp]

L960: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L959
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, si
  mov bp, g41
  jmp [bp]

L961: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L960
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L962: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L961
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [bp+8]
  mov bp, si
  jmp [bp]

L963: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L962
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, g367
  mov bp, g26
  jmp [bp]

L964: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
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
  mov di, 81
  mov bp, g31
  jmp [bp]

L965: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L964
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, si
  mov bp, g41
  jmp [bp]

L966: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L965
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L967: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L966
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [bp+8]
  mov bp, si
  jmp [bp]

L968: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L967
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, g366
  mov bp, g26
  jmp [bp]

L969: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
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
  mov di, 257
  mov bp, g31
  jmp [bp]

L970: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L969
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, si
  mov bp, g41
  jmp [bp]

L971: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L970
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L972: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L971
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [bp+8]
  mov bp, si
  jmp [bp]

L973: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L972
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, g365
  mov bp, g26
  jmp [bp]

L974: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
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
  mov di, 10241
  mov bp, g31
  jmp [bp]

L975: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L974
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, si
  mov bp, g41
  jmp [bp]

L976: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L975
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L977: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L976
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [bp+8]
  mov bp, si
  jmp [bp]

L978: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L977
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, g364
  mov bp, g26
  jmp [bp]

L979: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L978
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, 21
  mov bp, g31
  jmp [bp]

L980: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L979
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, si
  mov bp, g41
  jmp [bp]

L981: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L980
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, si
  mov bp, g22
  jmp [bp]

L982: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L981
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, [bp+8]
  mov bp, si
  jmp [bp]

L983: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L982
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov di, g363
  mov bp, g26
  jmp [bp]

L984: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L983
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, 1025
  mov bp, g31
  jmp [bp]

L985: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L984
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, si
  mov bp, g41
  jmp [bp]

L986: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L985
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, g362
  mov bp, g22
  jmp [bp]

L987: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L986
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+6]
  mov bp, si
  jmp [bp]

L988: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L987
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, g361
  mov bp, g101
  jmp [bp]

L989: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(142)
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
  push word L945
  mov [Temps+34], sp
  push word 6 ;; scanned
  push word [Temps+34]
  push word [CurrentCont]
  push word L988
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+32]
  mov ax, [bx+2]
  mov [Temps+36], ax
  mov di, [Temps+36]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L990: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
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
  push word L989
  mov [CurrentCont], sp
  push word 34 ;; scanned
  mov di, g348
  mov bp, si
  jmp [bp]

L991: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
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
  push word L990
  mov [CurrentCont], sp
  push word 34 ;; scanned
  mov di, g349
  mov bp, g108
  jmp [bp]

L992: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(34)
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
  push word L991
  mov [CurrentCont], sp
  push word 32 ;; scanned
  mov di, [bp+32]
  mov bp, si
  jmp [bp]

L993: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(42)
  push word [bp+6]
  push word L912
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
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
  push word [bp+4]
  push word [CurrentCont]
  push word L992
  mov [CurrentCont], sp
  push word 34 ;; scanned
  mov di, g341
  mov bp, g142
  jmp [bp]

L994: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(34)
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
  push word L993
  mov [CurrentCont], sp
  push word 32 ;; scanned
  mov di, [bp+32]
  mov bp, si
  jmp [bp]

L995: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(44)
  push word [bp+8]
  push word [bp+6]
  push word L897
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
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
  push word [bp+4]
  push word [CurrentCont]
  push word L994
  mov [CurrentCont], sp
  push word 34 ;; scanned
  mov di, g337
  mov bp, g121
  jmp [bp]

L996: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(34)
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
  push word L995
  mov [CurrentCont], sp
  push word 32 ;; scanned
  mov di, [bp+32]
  mov bp, si
  jmp [bp]

L997: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(46)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word L868
  mov [Temps+2], sp
  push word 8 ;; scanned
  push word [Temps+2]
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
  push word [bp+4]
  push word [CurrentCont]
  push word L996
  mov [CurrentCont], sp
  push word 34 ;; scanned
  mov di, g325
  mov bp, g108
  jmp [bp]

L998: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(34)
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
  push word L997
  mov [CurrentCont], sp
  push word 32 ;; scanned
  mov di, [bp+32]
  mov bp, si
  jmp [bp]

L999: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(44)
  push word [bp+8]
  push word [bp+6]
  push word L836
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
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
  push word L998
  mov [CurrentCont], sp
  push word 34 ;; scanned
  mov di, g311
  mov bp, g121
  jmp [bp]

L1000: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(32)
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
  push word L999
  mov [CurrentCont], sp
  push word 30 ;; scanned
  mov di, [bp+30]
  mov bp, si
  jmp [bp]

L1001: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(40)
  push word [bp+8]
  push word L814
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
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
  push word L1000
  mov [CurrentCont], sp
  push word 32 ;; scanned
  mov di, g302
  mov bp, g121
  jmp [bp]

L1002: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
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
  push word L1001
  mov [CurrentCont], sp
  push word 28 ;; scanned
  mov di, [bp+28]
  mov bp, si
  jmp [bp]

L1003: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(38)
  push word [bp+8]
  push word L757
  mov [Temps+2], sp
  push word 4 ;; scanned
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
  push word L1002
  mov [CurrentCont], sp
  push word 30 ;; scanned
  mov di, g290
  mov bp, g121
  jmp [bp]

L1004: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(28)
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
  push word L1003
  mov [CurrentCont], sp
  push word 26 ;; scanned
  mov di, [bp+26]
  mov bp, si
  jmp [bp]

L1005: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(36)
  push word [bp+8]
  push word L723
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
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
  push word L1004
  mov [CurrentCont], sp
  push word 28 ;; scanned
  mov di, g276
  mov bp, g108
  jmp [bp]

L1006: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(26)
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
  push word L1005
  mov [CurrentCont], sp
  push word 24 ;; scanned
  mov di, [bp+24]
  mov bp, si
  jmp [bp]

L1007: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(34)
  push word [bp+8]
  push word L695
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
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
  push word L1006
  mov [CurrentCont], sp
  push word 26 ;; scanned
  mov di, g268
  mov bp, g108
  jmp [bp]

L1008: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
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
  push word L1007
  mov [CurrentCont], sp
  push word 22 ;; scanned
  mov di, [bp+22]
  mov bp, si
  jmp [bp]

L1009: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(32)
  push word [bp+8]
  push word L652
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
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
  push word L1008
  mov [CurrentCont], sp
  push word 24 ;; scanned
  mov di, g254
  mov bp, g108
  jmp [bp]

L1010: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
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
  push word L1009
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov di, [bp+20]
  mov bp, si
  jmp [bp]

L1011: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(30)
  push word [bp+8]
  push word L645
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word si
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L1010
  mov [CurrentCont], sp
  push word 22 ;; scanned
  mov di, g249
  mov bp, g108
  jmp [bp]

L1012: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L1011
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov di, [bp+18]
  mov bp, si
  jmp [bp]

L1013: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(30)
  push word [bp+8]
  push word [bp+6]
  push word L597
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word si
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L1012
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov di, g231
  mov bp, g108
  jmp [bp]

L1014: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L1013
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov di, g223
  mov bp, si
  jmp [bp]

L1015: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(18)
  push word si
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L1014
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov di, g224
  mov bp, g121
  jmp [bp]

L1016: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L1015
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov di, g216
  mov bp, si
  jmp [bp]

L1017: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(16)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L1016
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov di, g217
  mov bp, g108
  jmp [bp]

L1018: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L1017
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov di, g205
  mov bp, si
  jmp [bp]

L1019: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(32)
  push word si
  push word L462
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word g100
  mov [Temps+4], sp
  push word 2 ;; scanned
  push word [Temps+4]
  push word [Temps+2]
  push word L579
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+4]
  push word [CurrentCont]
  push word L1018
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov di, g206
  mov bp, g108
  jmp [bp]

L1020: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
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
  push word L1019
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [Temps+4]
  mov bp, g24
  jmp [bp]

L1021: ; Start
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(24)
  push word g43
  mov [Temps+2], sp
  push word 2 ;; scanned
  push word [Temps+2]
  push word L446
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word g73
  push word `\x04`
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L1020
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [Temps+6]
  mov bp, g24
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
  dw L62
g25:
  dw 1
g26:
  dw L70
g27:
  dw L74
g28:
  dw 1
g29:
  dw 1
g30:
  dw 1
g31:
  dw L81
g32:
  dw L93
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
  dw L96
g41:
  dw L102
g42:
  dw 1
g43:
  dw 1
g44:
  dw 3
  db `\n`
g45:
  dw 15
  db `trace: `
g46:
  dw 1
g47:
  dw 1
g48:
  dw L111
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
  dw L121
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
  dw L142
g62:
  dw L159
g63:
  dw L152
g64:
  dw 1
g65:
  dw 1
g66:
  dw 3
g67:
  dw 1
g68:
  dw L168
g69:
  dw 1
g70:
  dw 3
g71:
  dw 1
g72:
  dw L175
g73:
  dw 1
g74:
  dw L191
g75:
  dw 1
g76:
  dw 1
g77:
  dw 3
g78:
  dw 1
g79:
  dw L192
g80:
  dw 3
  db `]`
g81:
  dw 3
  db `[`
g83:
  dw L200
g84:
  dw L206
g85:
  dw L215
g86:
  dw 1
g87:
  dw 1
g88:
  dw 3
g89:
  dw 3
  db `\n`
g90:
  dw 27
  db `no such inode`
g91:
  dw 15
  db `Error: `
g92:
  dw 1
g93:
  dw 1
g94:
  dw 1
g95:
  dw 1
g96:
  dw L216
g97:
  dw L250
g98:
  dw L255
g99:
  dw L257
g100:
  dw 1
g101:
  dw L262
g102:
  dw 1
g103:
  dw 21
  db ` [no args]`
g104:
  dw 15
  db `usage: `
g105:
  dw 3
  db `\n`
g106:
  dw 15
  db `Error: `
g107:
  dw 1
g108:
  dw L275
g109:
  dw 13
  db ` [int]`
g110:
  dw 15
  db `usage: `
g111:
  dw 3
  db `\n`
g112:
  dw 15
  db `Error: `
g113:
  dw 13
  db ` [int]`
g114:
  dw 15
  db `usage: `
g115:
  dw 3
  db `\n`
g116:
  dw 15
  db `Error: `
g117:
  dw 13
  db ` [int]`
g118:
  dw 15
  db `usage: `
g119:
  dw 3
  db `\n`
g120:
  dw 15
  db `Error: `
g121:
  dw L309
g122:
  dw 25
  db ` [int] [int]`
g123:
  dw 15
  db `usage: `
g124:
  dw 3
  db `\n`
g125:
  dw 15
  db `Error: `
g126:
  dw 25
  db ` [int] [int]`
g127:
  dw 15
  db `usage: `
g128:
  dw 3
  db `\n`
g129:
  dw 15
  db `Error: `
g130:
  dw 25
  db ` [int] [int]`
g131:
  dw 15
  db `usage: `
g132:
  dw 3
  db `\n`
g133:
  dw 15
  db `Error: `
g134:
  dw 25
  db ` [int] [int]`
g135:
  dw 15
  db `usage: `
g136:
  dw 3
  db `\n`
g137:
  dw 15
  db `Error: `
g138:
  dw 25
  db ` [int] [int]`
g139:
  dw 15
  db `usage: `
g140:
  dw 3
  db `\n`
g141:
  dw 15
  db `Error: `
g142:
  dw L365
g143:
  dw 1
g144:
  dw 1
g145:
  dw 3
  db `\n`
g146:
  dw 3
  db `\n`
g147:
  dw 65
  db `no filesystem mounted; try mount`
g148:
  dw 15
  db `Error: `
g149:
  dw 3
  db `\n`
g150:
  dw 75
  db `inode is not allocated (no such file)`
g151:
  dw 15
  db `Error: `
g152:
  dw 1
g153:
  dw 1
g154:
  dw 1
g155:
  dw 3
  db `\n`
g156:
  dw 69
  db `no blocks available (disk is full)`
g157:
  dw 15
  db `Error: `
g158:
  dw 1
g159:
  dw 1
g160:
  dw 1
  db ``
g161:
  dw L378
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
  dw 3
  db `\n`
g167:
  dw 69
  db `no blocks available (disk is full)`
g168:
  dw 15
  db `Error: `
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
  dw 83
  db `dump      : Display the raw data on disk.`
g176:
  dw 101
  db `sector I  : Display the raw data in disk sector I.`
g177:
  dw 157
  db `format    : Prepare disk with an empty filesystem; trashing existing contents.`
g178:
  dw 145
  db `mount     : Discover an existing filesystem; allow files to be accessed.`
g179:
  dw 137
  db `unmount   : Unmount the existing filesystem; required before format.`
g180:
  dw 137
  db `debug     : Display internal information about a mounted filesystem.`
g181:
  dw 107
  db `ls        : List all files together with their sizes.`
g182:
  dw 123
  db `stat I    : Display internal information about inode(file) I.`
g183:
  dw 87
  db `cat I     : Display the contents of file I.`
g184:
  dw 115
  db `rm I      : Remove file F; returning resources for reuse.`
g185:
  dw 103
  db `create    : Create new file; lines read from input.`
g186:
  dw 123
  db `append I  : Append to existing file I; lines read from input.`
g187:
  dw 151
  db `splat I N : Overwrite existing file I from offset N; lines read from input.`
g188:
  dw 87
  db `wipe      : Wipe disk; fill it with commas.`
g189:
  dw 1
g190:
  dw 3, g188, g189
g191:
  dw 3, g187, g190
g192:
  dw 3, g186, g191
g193:
  dw 3, g185, g192
g194:
  dw 3, g184, g193
g195:
  dw 3, g183, g194
g196:
  dw 3, g182, g195
g197:
  dw 3, g181, g196
g198:
  dw 3, g180, g197
g199:
  dw 3, g179, g198
g200:
  dw 3, g178, g199
g201:
  dw 3, g177, g200
g202:
  dw 3, g176, g201
g203:
  dw 3, g175, g202
g204:
  dw L381
g205:
  dw L383
g206:
  dw 9
  db `help`
g207:
  dw L401
g208:
  dw 1
g209:
  dw 3
g210:
  dw 1
g211:
  dw 1
g212:
  dw 3
g213:
  dw 1
g214:
  dw 5
  db `\\n`
g215:
  dw 1
g216:
  dw L402
g217:
  dw 9
  db `dump`
g218:
  dw 1
g219:
  dw 3
g220:
  dw 1
g221:
  dw 5
  db `\\n`
g222:
  dw 1
g223:
  dw L416
g224:
  dw 13
  db `sector`
g225:
  dw 3
  db `\n`
g226:
  dw 95
  db `cannot format a mounted filesystem; try unmount`
g227:
  dw 15
  db `Error: `
g228:
  dw 1
g229:
  dw 9
  db `BARE`
g230:
  dw 1
g231:
  dw 13
  db `format`
g232:
  dw 3
  db `\n`
g233:
  dw 53
  db `filesystem already mounted`
g234:
  dw 15
  db `Error: `
g235:
  dw 9
  db `BARE`
g236:
  dw 1
g237:
  dw 3
g238:
  dw 1
g239:
  dw 1
g240:
  dw 1
g241:
  dw 1
g242:
  dw 3
g243:
  dw L423
g244:
  dw L424
g245:
  dw 1
g246:
  dw 3
  db `\n`
g247:
  dw 63
  db `no filesystem found; try format`
g248:
  dw 15
  db `Error: `
g249:
  dw 11
  db `mount`
g250:
  dw 3
  db `\n`
g251:
  dw 65
  db `no filesystem mounted; try mount`
g252:
  dw 15
  db `Error: `
g253:
  dw 1
g254:
  dw 15
  db `unmount`
g255:
  dw 3
  db `\n`
g256:
  dw 65
  db `no filesystem mounted; try mount`
g257:
  dw 15
  db `Error: `
g258:
  dw 37
  db `Filesystem found:\n`
g259:
  dw 3
  db `\n`
g260:
  dw 21
  db `, #inodes=`
g261:
  dw 37
  db `, #admin-blocks=1+`
g262:
  dw 17
  db `#blocks=`
g263:
  dw 29
  db `- superblock: `
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
  dw 11
  db `debug`
g269:
  dw 3
  db `\n`
g270:
  dw 65
  db `no filesystem mounted; try mount`
g271:
  dw 15
  db `Error: `
g272:
  dw 1
g273:
  dw 3
  db `\n`
g274:
  dw 7
  db ` : `
g275:
  dw 11
  db `file `
g276:
  dw 5
  db `ls`
g277:
  dw 3
  db `\n`
g278:
  dw 65
  db `no filesystem mounted; try mount`
g279:
  dw 15
  db `Error: `
g280:
  dw 3
  db `\n`
g281:
  dw 23
  db `unallocated`
g282:
  dw 3
  db `]`
g283:
  dw 3
  db `B`
g284:
  dw L428
g285:
  dw 3
  db `,`
g286:
  dw 21
  db `, blocks=[`
g287:
  dw 25
  db `Inode: size=`
g288:
  dw 7
  db ` : `
g289:
  dw 3
  db `I`
g290:
  dw 9
  db `stat`
g291:
  dw 3
  db `\n`
g292:
  dw 65
  db `no filesystem mounted; try mount`
g293:
  dw 15
  db `Error: `
g294:
  dw 3
  db `\n`
g295:
  dw 75
  db `inode is not allocated (no such file)`
g296:
  dw 15
  db `Error: `
g297:
  dw 1
g298:
  dw 3
g299:
  dw 1
g300:
  dw 3
g301:
  dw 1
g302:
  dw 7
  db `cat`
g303:
  dw 3
  db `\n`
g304:
  dw 65
  db `no filesystem mounted; try mount`
g305:
  dw 15
  db `Error: `
g306:
  dw 3
  db `\n`
g307:
  dw 75
  db `inode is not allocated (no such file)`
g308:
  dw 15
  db `Error: `
g309:
  dw 1
g310:
  dw 1
g311:
  dw 5
  db `rm`
g312:
  dw 3
  db `\n`
g313:
  dw 65
  db `no filesystem mounted; try mount`
g314:
  dw 15
  db `Error: `
g315:
  dw 1
g316:
  dw 1
g317:
  dw 3
  db `\n`
g318:
  dw 73
  db `no inodes available (too many files)`
g319:
  dw 15
  db `Error: `
g320:
  dw 1
g321:
  dw 1
g322:
  dw 1
g323:
  dw 45
  db `; (to finish type ^D)\n`
g324:
  dw 29
  db `Creating file `
g325:
  dw 13
  db `create`
g326:
  dw 45
  db `; (to finish type ^D)\n`
g327:
  dw 37
  db `Appending to file `
g328:
  dw 3
  db `\n`
g329:
  dw 65
  db `no filesystem mounted; try mount`
g330:
  dw 15
  db `Error: `
g331:
  dw 1
g332:
  dw 3
  db `\n`
g333:
  dw 75
  db `inode is not allocated (no such file)`
g334:
  dw 15
  db `Error: `
g335:
  dw 1
g336:
  dw 1
g337:
  dw 13
  db `append`
g338:
  dw 45
  db `; (to finish type ^D)\n`
g339:
  dw 27
  db ` from offset `
g340:
  dw 35
  db `Overwriting file `
g341:
  dw 11
  db `splat`
g342:
  dw 1
g343:
  dw 3
g344:
  dw 1
g345:
  dw 1
g346:
  dw 3
g347:
  dw 1
g348:
  dw L439
g349:
  dw 9
  db `wipe`
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
  dw 3
  db `\n`
g360:
  dw 15
  db `Error: `
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
  dw 3
  db `\n`
g370:
  dw 3
  db ` `
g371:
  dw 11
  db `Try: `

bare_start: jmp L1021
