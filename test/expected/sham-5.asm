L1: ; Arm: 17'7
  mov ax, 1
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L2: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, 3
  mov bx, [si]
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L3: ; Function: (length,g1)
  xchg si, di
  Bare_enter_check(6)
  mov bx, [si]
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
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g1
  jmp [bp]

L4: ; Arm: 22'7
  mov ax, g3
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L5: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [si]
  push word [bp+4]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L6: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L5
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L7: ; Continuation
  xchg si, di
  Bare_enter_check(10)
  push word [si]
  push word [bp+6]
  push word [CurrentCont]
  push word L6
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g2
  jmp [bp]

L8: ; Function: (lam,t1)
  xchg si, di
  Bare_enter_check(10)
  mov bx, [si]
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
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [bp+2]
  jmp [bp]

L9: ; Function: (map,g2)
  xchg si, di
  Bare_enter_check(6)
  push word [si]
  push word L8
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L10: ; Arm: 27'7
  mov ax, g5
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L11: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L12: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L11
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g4
  jmp [bp]

L13: ; Function: (lam,t1)
  xchg si, di
  Bare_enter_check(10)
  mov bx, [si]
  cmp word [bx], 1
  jz L10
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L12
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [bp+2]
  jmp [bp]

L14: ; Function: (iter,g4)
  xchg si, di
  Bare_enter_check(6)
  push word [si]
  push word L13
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L15: ; Arm: 32'7
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L16: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L17: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L16
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L18: ; Continuation
  xchg si, di
  Bare_enter_check(10)
  push word [bp+6]
  push word [si]
  push word [CurrentCont]
  push word L17
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g6
  jmp [bp]

L19: ; Continuation
  xchg si, di
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L18
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L20: ; Function: (lam,t1)
  xchg si, di
  Bare_enter_check(12)
  mov bx, [si]
  cmp word [bx], 1
  jz L15
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+2]
  push word [CurrentCont]
  push word L19
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [bp+2]
  jmp [bp]

L21: ; Function: (lam,t1)
  xchg si, di
  Bare_enter_check(8)
  push word [si]
  push word [bp+2]
  push word L20
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L22: ; Function: (fold_left,g6)
  xchg si, di
  Bare_enter_check(6)
  push word [si]
  push word L21
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L23: ; Arm: 37'7
  mov ax, [bp+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L24: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L25: ; Function: (lam,t1)
  xchg si, di
  Bare_enter_check(16)
  mov bx, [si]
  cmp word [bx], 1
  jz L23
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
  push word L24
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, g7
  jmp [bp]

L26: ; Function: (rev_onto,g7)
  xchg si, di
  Bare_enter_check(6)
  push word [si]
  push word L25
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L27: ; Arm: 50'9
  mov ax, g8
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L28: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L29: ; Function: (lam,t1)
  xchg si, di
  Bare_enter_check(8)
  mov bx, [si]
  cmp word [bx], 1
  jz L27
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
  push word L28
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, [bp+6]
  jmp [bp]

L30: ; Function: (loop,t1)
  xchg si, di
  Bare_enter_check(10)
  push word bp
  push word [si]
  push word [bp+2]
  push word L29
  mov [Temps+2], sp
  push word 8 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L31: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L32: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L31
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L33: ; Continuation
  xchg si, di
  Bare_enter_check(16)
  push word [si]
  push word L30
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L32
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, 1
  mov [di], ax
  mov bp, [Temps+2]
  jmp [bp]

L34: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L33
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  jmp AllocBare_make_bytes

L35: ; Function: (implode,g9)
  xchg si, di
  Bare_enter_check(8)
  push word [si]
  push word [CurrentCont]
  push word L34
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g1
  jmp [bp]

L36: ; Arm: 61'9
  mov ax, g10
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L37: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L38: ; Function: (lam,t1)
  xchg si, di
  Bare_enter_check(8)
  mov bx, [si]
  cmp word [bx], 1
  jz L36
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
  push word L37
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, [bp+6]
  jmp [bp]

L39: ; Function: (loop,t1)
  xchg si, di
  Bare_enter_check(10)
  push word bp
  push word [si]
  push word [bp+2]
  push word L38
  mov [Temps+2], sp
  push word 8 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L40: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L41: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L40
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L42: ; Continuation
  xchg si, di
  Bare_enter_check(16)
  push word [si]
  push word L39
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [bp+6]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+4], ax
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L41
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [Temps+2]
  jmp [bp]

L43: ; Continuation
  xchg si, di
  Bare_enter_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L42
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  jmp AllocBare_make_bytes

L44: ; Function: (rev_implode,g11)
  xchg si, di
  Bare_enter_check(8)
  push word [si]
  push word [CurrentCont]
  push word L43
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g1
  jmp [bp]

L45: ; Arm: 69'13
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L46: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L47: ; Function: (lam,t1)
  xchg si, di
  Bare_enter_check(16)
  mov ax, [si]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L45
  mov ax, [bp+2]
  mov bx, [si]
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+4], ax
  mov ax, [si]
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
  push word L46
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, [bp+6]
  jmp [bp]

L48: ; Function: (explode_loop,t1)
  xchg si, di
  Bare_enter_check(10)
  push word bp
  push word [si]
  push word [bp+2]
  push word L47
  mov [Temps+2], sp
  push word 8 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L49: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L50: ; Function: (explode,g13)
  xchg si, di
  Bare_enter_check(14)
  push word [si]
  push word L48
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov bx, [si]
  mov ax, [bx]
  mov [Temps+4], ax
  mov ax, [Temps+4]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+6], ax
  push word [Temps+6]
  push word [CurrentCont]
  push word L49
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g12
  mov [di], ax
  mov bp, [Temps+2]
  jmp [bp]

L51: ; Arm: 77'19
  mov ax, g16
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L52: ; Arm: 79'15
  mov ax, g17
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L53: ; Arm: 82'31
  mov ax, g20
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L54: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov bx, [si]
  cmp word [bx], 3
  jz L53
  mov ax, [bp+4]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [bp+6]
  jmp [bp]

L55: ; Arm: 6'9
  mov ax, g18
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L56: ; Function: (loop,t1)
  xchg si, di
  Bare_enter_check(10)
  mov ax, [si]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L52
  mov ax, [bp+2]
  mov bx, [si]
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+4], ax
  mov ax, [bp+4]
  mov bx, [si]
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+6], ax
  mov ax, [Temps+4]
  cmp word ax, [Temps+6]
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  push word bp
  push word [si]
  push word [CurrentCont]
  push word L54
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L55
  mov ax, g19
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L57: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  mov bx, [si]
  cmp word [bx], 3
  jz L51
  push word [bp+6]
  push word [bp+4]
  push word L56
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov ax, [bp+8]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+4], ax
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [Temps+2]
  jmp [bp]

L58: ; Arm: 6'9
  mov ax, g14
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L59: ; Function: (lam,t1)
  xchg si, di
  Bare_enter_check(12)
  mov bx, [bp+2]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [si]
  mov ax, [bx]
  mov [Temps+4], ax
  mov ax, [Temps+2]
  cmp word ax, [Temps+4]
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word [Temps+2]
  push word [si]
  push word [bp+2]
  push word [CurrentCont]
  push word L57
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L58
  mov ax, g15
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L60: ; Function: (eq_string,g21)
  xchg si, di
  Bare_enter_check(6)
  push word [si]
  push word L59
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L61: ; Arm: 91'7
  mov ax, g23
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L62: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g9
  jmp [bp]

L63: ; Continuation
  xchg si, di
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L62
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L64: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [si]
  push word [CurrentCont]
  push word L63
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g7
  jmp [bp]

L65: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L64
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L66: ; Continuation
  xchg si, di
  Bare_enter_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L65
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g24
  mov [di], ax
  mov bp, g7
  jmp [bp]

L67: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [si]
  push word [CurrentCont]
  push word L66
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g13
  jmp [bp]

L68: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [si]
  push word [CurrentCont]
  push word L67
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g13
  jmp [bp]

L69: ; Function: (concat,g22)
  xchg si, di
  Bare_enter_check(8)
  mov bx, [si]
  cmp word [bx], 1
  jz L61
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+2]
  push word [CurrentCont]
  push word L68
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L70: ; Arm: 107'7
  mov ax, g26
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L71: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L72: ; Arm: 100'19
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov ax, [Temps+10]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L73: ; Arm: 101'22
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov ax, [Temps+12]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L74: ; Arm: 102'16
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+14], ax
  mov ax, [Temps+14]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L75: ; Function: (put_chars,g25)
  xchg si, di
  Bare_enter_check(8)
  mov bx, [si]
  cmp word [bx], 1
  jz L70
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
  push word L71
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L72
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L73
  mov ax, 53
  cmp word ax, [Temps+6]
  call Bare_make_bool_from_n
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L74
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
  mov ax, [Temps+22]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L76: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [si]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L77: ; Arm: 168'11
  push word [bp+2]
  push word [CurrentCont]
  push word L76
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g11
  jmp [bp]

L78: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L79: ; Continuation
  xchg si, di
  Bare_enter_check(16)
  push word [bp+4]
  push word [si]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+6]
  push word [CurrentCont]
  push word L78
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g28
  jmp [bp]

L80: ; Arm: 170'26
  push word [Temps+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L79
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g11
  jmp [bp]

L81: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L82: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L81
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L83: ; Function: (lam,t1)
  xchg si, di
  Bare_enter_check(18)
  mov bx, [si]
  cmp word [bx], 1
  jz L77
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
  jz L80
  push word [bp+4]
  push word [Temps+2]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [Temps+4]
  push word [Temps+8]
  push word [CurrentCont]
  push word L82
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+2]
  mov [di], ax
  mov bp, g29
  jmp [bp]

L84: ; Function: (lam,t1)
  xchg si, di
  Bare_enter_check(8)
  push word [si]
  push word [bp+2]
  push word L83
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L85: ; Function: (have_letter,g29)
  xchg si, di
  Bare_enter_check(6)
  push word [si]
  push word L84
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L86: ; Arm: 175'9
  mov ax, [bp+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L87: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L88: ; Arm: 177'24
  push word [Temps+4]
  push word [CurrentCont]
  push word L87
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+2]
  mov [di], ax
  mov bp, g28
  jmp [bp]

L89: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L90: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L89
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L91: ; Function: (lam,t1)
  xchg si, di
  Bare_enter_check(18)
  mov bx, [si]
  cmp word [bx], 1
  jz L86
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
  jz L88
  push word g30
  push word [Temps+2]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [Temps+4]
  push word [Temps+8]
  push word [CurrentCont]
  push word L90
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+2]
  mov [di], ax
  mov bp, g29
  jmp [bp]

L92: ; Function: (at_word_start,g28)
  xchg si, di
  Bare_enter_check(6)
  push word [si]
  push word L91
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L93: ; Arm: 144'22
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov ax, [si]
  mov [di], ax
  mov bp, g11
  jmp [bp]

L94: ; Arm: 145'28
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
  push word [si]
  push word `\x04`
  push word 3
  mov [Temps+16], sp
  push word 6 ;; scanned
  mov ax, [Temps+16]
  mov [di], ax
  mov bp, g11
  jmp [bp]

L95: ; Arm: 146'19
  mov ax, [si]
  mov [di], ax
  mov bp, g34
  jmp [bp]

L96: ; Arm: 149'17
  mov ax, [si]
  mov [di], ax
  mov bp, g34
  jmp [bp]

L97: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g34
  jmp [bp]

L98: ; Arm: 153'28
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
  mov ax, [Temps+12]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L99: ; Arm: 154'29
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
  mov ax, [Temps+20]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L100: ; Arm: 155'32
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
  mov ax, [Temps+22]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L101: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L97
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [si]
  cmp word [bx], 3
  jz L98
  mov ax, [bp+6]
  cmp word ax, 65
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L99
  mov ax, 253
  cmp word ax, [bp+6]
  call Bare_make_bool_from_n
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L100
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
  mov ax, [Temps+10]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L102: ; Arm: 6'9
  mov ax, g36
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L103: ; Arm: 147'21
  mov bx, [si]
  cmp word [bx], 1
  jz L96
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
  push word L101
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+20]
  cmp word [bx], 3
  jz L102
  mov ax, g37
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L104: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g34
  jmp [bp]

L105: ; Arm: 100'19
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+18], ax
  mov ax, [Temps+18]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L106: ; Arm: 101'22
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+20], ax
  mov ax, [Temps+20]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L107: ; Arm: 102'16
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+22], ax
  mov ax, [Temps+22]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L108: ; Function: (readloop,g34)
  xchg si, di
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
  jz L93
  mov ax, [Temps+2]
  cmp word ax, `\x04`
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L94
  mov ax, 255
  cmp word ax, [Temps+4]
  call Bare_make_bool_from_n
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L95
  mov ax, [Temps+4]
  cmp word ax, 255
  call Bare_make_bool_from_z
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L103
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
  push word [si]
  push word [CurrentCont]
  push word L104
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+16]
  cmp word [bx], 3
  jz L105
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+18], ax
  mov bx, [Temps+18]
  cmp word [bx], 3
  jz L106
  mov ax, 53
  cmp word ax, [Temps+14]
  call Bare_make_bool_from_n
  mov [Temps+20], ax
  mov bx, [Temps+20]
  cmp word [bx], 3
  jz L107
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
  mov ax, [Temps+30]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L109: ; Arm: 229'36
  mov ax, g39
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L110: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g31
  jmp [bp]

L111: ; Arm: 221'7
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L112: ; Arm: 192'9
  mov ax, g42
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L113: ; Arm: 196'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L114: ; Continuation
  xchg si, di
  Bare_enter_check(6)
  mov bx, [si]
  cmp word [bx], 3
  jz L113
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [bp+4]
  jmp [bp]

L115: ; Continuation
  xchg si, di
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L114
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L116: ; Function: (loop,t3)
  xchg si, di
  Bare_enter_check(14)
  mov bx, [si]
  cmp word [bx], 1
  jz L112
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
  push word L115
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, g21
  jmp [bp]

L117: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L118: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L117
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L119: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L118
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g13
  jmp [bp]

L120: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L119
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g9
  jmp [bp]

L121: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L120
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L122: ; Continuation
  xchg si, di
  Bare_enter_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L121
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, g7
  jmp [bp]

L123: ; Continuation
  xchg si, di
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L122
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L124: ; Continuation
  xchg si, di
  Bare_enter_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L123
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g50
  mov [di], ax
  mov bp, g7
  jmp [bp]

L125: ; Continuation
  xchg si, di
  Bare_enter_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L124
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, g13
  jmp [bp]

L126: ; Continuation
  xchg si, di
  Bare_enter_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L125
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g49
  mov [di], ax
  mov bp, g13
  jmp [bp]

L127: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L126
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g9
  jmp [bp]

L128: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L127
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L129: ; Continuation
  xchg si, di
  Bare_enter_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L128
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, g7
  jmp [bp]

L130: ; Continuation
  xchg si, di
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L129
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L131: ; Continuation
  xchg si, di
  Bare_enter_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L130
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g48
  mov [di], ax
  mov bp, g7
  jmp [bp]

L132: ; Continuation
  xchg si, di
  Bare_enter_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L131
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, g13
  jmp [bp]

L133: ; Continuation
  xchg si, di
  Bare_enter_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L132
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, g13
  jmp [bp]

L134: ; Continuation
  xchg si, di
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L133
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g9
  jmp [bp]

L135: ; Continuation
  xchg si, di
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L134
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L136: ; Continuation
  xchg si, di
  Bare_enter_check(12)
  push word [bp+6]
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L135
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov bp, g7
  jmp [bp]

L137: ; Continuation
  xchg si, di
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L136
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L138: ; Continuation
  xchg si, di
  Bare_enter_check(14)
  push word [si]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L137
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, g47
  mov [di], ax
  mov bp, g7
  jmp [bp]

L139: ; Continuation
  xchg si, di
  Bare_enter_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L138
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov bp, g13
  jmp [bp]

L140: ; Continuation
  xchg si, di
  Bare_enter_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L139
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g46
  mov [di], ax
  mov bp, g13
  jmp [bp]

L141: ; Continuation
  xchg si, di
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L140
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g9
  jmp [bp]

L142: ; Continuation
  xchg si, di
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L141
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L143: ; Continuation
  xchg si, di
  Bare_enter_check(12)
  push word [bp+6]
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L142
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov bp, g7
  jmp [bp]

L144: ; Continuation
  xchg si, di
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L143
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L145: ; Continuation
  xchg si, di
  Bare_enter_check(14)
  push word [si]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L144
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, g45
  mov [di], ax
  mov bp, g7
  jmp [bp]

L146: ; Continuation
  xchg si, di
  Bare_enter_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L145
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g44
  mov [di], ax
  mov bp, g13
  jmp [bp]

L147: ; Arm: 213'9
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L146
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g43
  mov [di], ax
  mov bp, g13
  jmp [bp]

L148: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L149: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L148
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L150: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L149
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g13
  jmp [bp]

L151: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L150
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g9
  jmp [bp]

L152: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L151
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L153: ; Continuation
  xchg si, di
  Bare_enter_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L152
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, g7
  jmp [bp]

L154: ; Continuation
  xchg si, di
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L153
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L155: ; Continuation
  xchg si, di
  Bare_enter_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L154
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g58
  mov [di], ax
  mov bp, g7
  jmp [bp]

L156: ; Continuation
  xchg si, di
  Bare_enter_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L155
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, g13
  jmp [bp]

L157: ; Continuation
  xchg si, di
  Bare_enter_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L156
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g57
  mov [di], ax
  mov bp, g13
  jmp [bp]

L158: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L157
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g9
  jmp [bp]

L159: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L158
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L160: ; Continuation
  xchg si, di
  Bare_enter_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L159
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, g7
  jmp [bp]

L161: ; Continuation
  xchg si, di
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L160
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L162: ; Continuation
  xchg si, di
  Bare_enter_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L161
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g56
  mov [di], ax
  mov bp, g7
  jmp [bp]

L163: ; Continuation
  xchg si, di
  Bare_enter_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L162
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, g13
  jmp [bp]

L164: ; Continuation
  xchg si, di
  Bare_enter_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L163
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, g13
  jmp [bp]

L165: ; Continuation
  xchg si, di
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L164
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g9
  jmp [bp]

L166: ; Continuation
  xchg si, di
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L165
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L167: ; Continuation
  xchg si, di
  Bare_enter_check(12)
  push word [bp+6]
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L166
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov bp, g7
  jmp [bp]

L168: ; Continuation
  xchg si, di
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L167
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L169: ; Continuation
  xchg si, di
  Bare_enter_check(14)
  push word [si]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L168
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, g55
  mov [di], ax
  mov bp, g7
  jmp [bp]

L170: ; Continuation
  xchg si, di
  Bare_enter_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L169
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov bp, g13
  jmp [bp]

L171: ; Continuation
  xchg si, di
  Bare_enter_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L170
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g54
  mov [di], ax
  mov bp, g13
  jmp [bp]

L172: ; Continuation
  xchg si, di
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L171
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g9
  jmp [bp]

L173: ; Continuation
  xchg si, di
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L172
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L174: ; Continuation
  xchg si, di
  Bare_enter_check(12)
  push word [bp+6]
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L173
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov bp, g7
  jmp [bp]

L175: ; Continuation
  xchg si, di
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L174
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L176: ; Continuation
  xchg si, di
  Bare_enter_check(14)
  push word [si]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L175
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, g53
  mov [di], ax
  mov bp, g7
  jmp [bp]

L177: ; Continuation
  xchg si, di
  Bare_enter_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L176
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g52
  mov [di], ax
  mov bp, g13
  jmp [bp]

L178: ; Arm: 216'14
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L177
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g51
  mov [di], ax
  mov bp, g13
  jmp [bp]

L179: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L180: ; Continuation
  xchg si, di
  Bare_enter_check(10)
  mov bx, [si]
  cmp word [bx], 1
  jz L147
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L178
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [bp+8]
  push word [CurrentCont]
  push word L179
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [Temps+6]
  jmp [bp]

L181: ; Continuation
  xchg si, di
  Bare_enter_check(24)
  push word [CurrentCont]
  push word L110
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [si]
  cmp word [bx], 1
  jz L111
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+2]
  push word L116
  mov [Temps+6], sp
  push word 4 ;; scanned
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+4]
  push word [CurrentCont]
  push word L180
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [Temps+6]
  jmp [bp]

L182: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L181
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L183: ; Continuation
  xchg si, di
  Bare_enter_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L182
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g41
  mov [di], ax
  mov bp, g7
  jmp [bp]

L184: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L183
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L185: ; Continuation
  xchg si, di
  Bare_enter_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L184
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g40
  mov [di], ax
  mov bp, g28
  jmp [bp]

L186: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  mov bx, [si]
  cmp word [bx], 3
  jz L109
  push word [bp+4]
  push word [CurrentCont]
  push word L185
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, g13
  jmp [bp]

L187: ; Continuation
  xchg si, di
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L186
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L188: ; Continuation
  xchg si, di
  Bare_enter_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L187
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g21
  jmp [bp]

L189: ; Continuation
  xchg si, di
  Bare_enter_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L188
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g38
  mov [di], ax
  mov bp, g34
  jmp [bp]

L190: ; Continuation
  xchg si, di
  Bare_enter_check(16)
  push word g33
  push word `\x04`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L189
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g9
  jmp [bp]

L191: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L190
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L192: ; Function: (mainloop,g31)
  xchg si, di
  Bare_enter_check(8)
  push word [si]
  push word [CurrentCont]
  push word L191
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g32
  mov [di], ax
  mov bp, g13
  jmp [bp]

L193: ; Arm: 345'11
  mov ax, [si]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L194: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, [si]
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L195: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  mov ax, [bp+4]
  mov bx, 5
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  push word [si]
  push word [CurrentCont]
  push word L194
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g59
  jmp [bp]

L196: ; Function: (fib,g59)
  xchg si, di
  Bare_enter_check(8)
  mov ax, [si]
  cmp word ax, 5
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L193
  mov ax, [si]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+4], ax
  push word [si]
  push word [CurrentCont]
  push word L195
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g59
  jmp [bp]

L197: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L198: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L197
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L199: ; Arm: 250'7
  push word [bp+2]
  push word [CurrentCont]
  push word L198
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g67
  mov [di], ax
  mov bp, g13
  jmp [bp]

L200: ; Arm: 192'9
  mov ax, g68
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L201: ; Arm: 196'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L202: ; Continuation
  xchg si, di
  Bare_enter_check(6)
  mov bx, [si]
  cmp word [bx], 3
  jz L201
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [bp+4]
  jmp [bp]

L203: ; Continuation
  xchg si, di
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L202
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L204: ; Function: (loop,t3)
  xchg si, di
  Bare_enter_check(14)
  mov bx, [si]
  cmp word [bx], 1
  jz L200
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
  push word L203
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, g21
  jmp [bp]

L205: ; Arm: 192'9
  mov ax, g77
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L206: ; Arm: 196'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L207: ; Continuation
  xchg si, di
  Bare_enter_check(6)
  mov bx, [si]
  cmp word [bx], 3
  jz L206
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [bp+4]
  jmp [bp]

L208: ; Continuation
  xchg si, di
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L207
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L209: ; Function: (loop,t1)
  xchg si, di
  Bare_enter_check(14)
  mov bx, [si]
  cmp word [bx], 1
  jz L205
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
  push word L208
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, g21
  jmp [bp]

L210: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L211: ; Continuation
  xchg si, di
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L210
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g13
  jmp [bp]

L212: ; Arm: 243'11
  push word g81
  push word [bp+4]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g78
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L211
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L213: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L214: ; Arm: 246'16
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L213
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g13
  jmp [bp]

L215: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L216: ; Continuation
  xchg si, di
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L215
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g13
  jmp [bp]

L217: ; Continuation
  xchg si, di
  Bare_enter_check(22)
  mov bx, [si]
  cmp word [bx], 1
  jz L212
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L214
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word g85
  push word [bp+4]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [Temps+8]
  push word g82
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L216
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+10]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L218: ; Function: (lam,t1)
  xchg si, di
  Bare_enter_check(14)
  push word [si]
  push word L209
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [si]
  push word [CurrentCont]
  push word L217
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+2]
  mov [di], ax
  mov bp, [Temps+2]
  jmp [bp]

L219: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L220: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L219
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L221: ; Continuation
  xchg si, di
  Bare_enter_check(16)
  push word [bp+4]
  push word L218
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L220
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g4
  jmp [bp]

L222: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L223: ; Continuation
  xchg si, di
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L222
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g13
  jmp [bp]

L224: ; Arm: 243'11
  push word g72
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g69
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L223
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L225: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L226: ; Arm: 246'16
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L225
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g13
  jmp [bp]

L227: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L228: ; Continuation
  xchg si, di
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L227
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g13
  jmp [bp]

L229: ; Continuation
  xchg si, di
  Bare_enter_check(32)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L221
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [si]
  cmp word [bx], 1
  jz L224
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L226
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word g76
  push word [bp+6]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [Temps+8]
  push word g73
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L228
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+10]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L230: ; Function: (lam,t1)
  xchg si, di
  Bare_enter_check(18)
  mov bx, [si]
  cmp word [bx], 1
  jz L199
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+2]
  push word L204
  mov [Temps+6], sp
  push word 4 ;; scanned
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+2]
  push word [CurrentCont]
  push word L229
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+2]
  mov [di], ax
  mov bp, [Temps+6]
  jmp [bp]

L231: ; Function: (lam,g86)
  xchg si, di
  Bare_enter_check(6)
  push word [si]
  push word L230
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L232: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L233: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L232
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L234: ; Arm: 287'7
  push word [bp+2]
  push word [CurrentCont]
  push word L233
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g91
  mov [di], ax
  mov bp, g13
  jmp [bp]

L235: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L236: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L235
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L237: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L236
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g13
  jmp [bp]

L238: ; Arm: 290'10
  push word g95
  push word [Temps+2]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word g92
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [bp+2]
  push word [CurrentCont]
  push word L237
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L239: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L240: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L239
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L241: ; Arm: 293'12
  mov ax, [bx+2]
  mov [Temps+10], ax
  mov ax, [bx+4]
  mov [Temps+12], ax
  push word [bp+2]
  push word [CurrentCont]
  push word L240
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g96
  mov [di], ax
  mov bp, g13
  jmp [bp]

L242: ; Arm: 192'9
  mov ax, g97
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L243: ; Arm: 196'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L244: ; Continuation
  xchg si, di
  Bare_enter_check(6)
  mov bx, [si]
  cmp word [bx], 3
  jz L243
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [bp+4]
  jmp [bp]

L245: ; Continuation
  xchg si, di
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L244
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L246: ; Function: (loop,t5)
  xchg si, di
  Bare_enter_check(14)
  mov bx, [si]
  cmp word [bx], 1
  jz L242
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
  push word L245
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, g21
  jmp [bp]

L247: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L248: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L247
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L249: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L248
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g13
  jmp [bp]

L250: ; Arm: 296'15
  push word g101
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g98
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L249
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L251: ; Continuation
  xchg si, di
  Bare_enter_check(24)
  mov bx, [si]
  cmp word [bx], 1
  jz L250
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [bp+8]
  push word 1
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word [Temps+4]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L252: ; Function: (lam,t1)
  xchg si, di
  Bare_enter_check(24)
  mov bx, [si]
  cmp word [bx], 1
  jz L234
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 1
  jz L238
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L241
  push word [Temps+2]
  push word L246
  mov [Temps+10], sp
  push word 4 ;; scanned
  push word [Temps+6]
  push word [Temps+2]
  push word [bp+2]
  push word [CurrentCont]
  push word L251
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+2]
  mov [di], ax
  mov bp, [Temps+10]
  jmp [bp]

L253: ; Function: (lam,g102)
  xchg si, di
  Bare_enter_check(6)
  push word [si]
  push word L252
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L254: ; Arm: 144'22
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov ax, [si]
  mov [di], ax
  mov bp, g11
  jmp [bp]

L255: ; Arm: 145'28
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
  push word [si]
  push word `\x04`
  push word 3
  mov [Temps+16], sp
  push word 6 ;; scanned
  mov ax, [Temps+16]
  mov [di], ax
  mov bp, g11
  jmp [bp]

L256: ; Arm: 146'19
  mov ax, [si]
  mov [di], ax
  mov bp, g110
  jmp [bp]

L257: ; Arm: 149'17
  mov ax, [si]
  mov [di], ax
  mov bp, g110
  jmp [bp]

L258: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g110
  jmp [bp]

L259: ; Arm: 153'28
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
  mov ax, [Temps+12]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L260: ; Arm: 154'29
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
  mov ax, [Temps+20]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L261: ; Arm: 155'32
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
  mov ax, [Temps+22]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L262: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L258
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [si]
  cmp word [bx], 3
  jz L259
  mov ax, [bp+6]
  cmp word ax, 65
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L260
  mov ax, 253
  cmp word ax, [bp+6]
  call Bare_make_bool_from_n
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L261
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
  mov ax, [Temps+10]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L263: ; Arm: 6'9
  mov ax, g112
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L264: ; Arm: 147'21
  mov bx, [si]
  cmp word [bx], 1
  jz L257
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
  push word L262
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+20]
  cmp word [bx], 3
  jz L263
  mov ax, g113
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L265: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g110
  jmp [bp]

L266: ; Arm: 100'19
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+18], ax
  mov ax, [Temps+18]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L267: ; Arm: 101'22
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+20], ax
  mov ax, [Temps+20]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L268: ; Arm: 102'16
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+22], ax
  mov ax, [Temps+22]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L269: ; Function: (readloop,g110)
  xchg si, di
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
  jz L254
  mov ax, [Temps+2]
  cmp word ax, `\x04`
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L255
  mov ax, 255
  cmp word ax, [Temps+4]
  call Bare_make_bool_from_n
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L256
  mov ax, [Temps+4]
  cmp word ax, 255
  call Bare_make_bool_from_z
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L264
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
  push word [si]
  push word [CurrentCont]
  push word L265
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+16]
  cmp word [bx], 3
  jz L266
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+18], ax
  mov bx, [Temps+18]
  cmp word [bx], 3
  jz L267
  mov ax, 53
  cmp word ax, [Temps+14]
  call Bare_make_bool_from_n
  mov [Temps+20], ax
  mov bx, [Temps+20]
  cmp word [bx], 3
  jz L268
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
  mov ax, [Temps+30]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L270: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L271: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L270
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L272: ; Arm: 325'7
  push word [bp+2]
  push word [CurrentCont]
  push word L271
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g121
  mov [di], ax
  mov bp, g13
  jmp [bp]

L273: ; Arm: 192'9
  mov ax, g122
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L274: ; Arm: 196'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L275: ; Continuation
  xchg si, di
  Bare_enter_check(6)
  mov bx, [si]
  cmp word [bx], 3
  jz L274
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [bp+4]
  jmp [bp]

L276: ; Continuation
  xchg si, di
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L275
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L277: ; Function: (loop,t1)
  xchg si, di
  Bare_enter_check(14)
  mov bx, [si]
  cmp word [bx], 1
  jz L273
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
  push word L276
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, g21
  jmp [bp]

L278: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L279: ; Continuation
  xchg si, di
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L278
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g13
  jmp [bp]

L280: ; Arm: 318'11
  push word g125
  push word [bp+4]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L279
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L281: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L282: ; Continuation
  xchg si, di
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L281
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g13
  jmp [bp]

L283: ; Arm: 321'16
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word g128
  push word [bp+4]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L282
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L284: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L285: ; Continuation
  xchg si, di
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L284
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g13
  jmp [bp]

L286: ; Continuation
  xchg si, di
  Bare_enter_check(14)
  mov bx, [si]
  cmp word [bx], 1
  jz L280
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L283
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word g131
  push word [bp+4]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L285
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L287: ; Function: (lam,t3)
  xchg si, di
  Bare_enter_check(14)
  push word [si]
  push word L277
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [si]
  push word [CurrentCont]
  push word L286
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+2]
  mov [di], ax
  mov bp, [Temps+2]
  jmp [bp]

L288: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L289: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L288
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L290: ; Function: (lam,t1)
  xchg si, di
  Bare_enter_check(16)
  mov bx, [si]
  cmp word [bx], 1
  jz L272
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [bp+2]
  push word L287
  mov [Temps+6], sp
  push word 4 ;; scanned
  push word [si]
  push word [bp+2]
  push word [CurrentCont]
  push word L289
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, g4
  jmp [bp]

L291: ; Function: (lam,g132)
  xchg si, di
  Bare_enter_check(6)
  push word [si]
  push word L290
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L292: ; Function: (lam,g138)
  xchg si, di
  Bare_enter_check(0)
  mov bx, [si]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L293: ; Arm: 203'9
  mov ax, g140
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L294: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g139
  jmp [bp]

L295: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L294
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L296: ; Function: (loop,g139)
  xchg si, di
  Bare_enter_check(8)
  mov bx, [si]
  cmp word [bx], 1
  jz L293
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, ` `
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  push word [Temps+4]
  push word [CurrentCont]
  push word L295
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g13
  jmp [bp]

L297: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L298: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L297
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L299: ; Arm: 235'9
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [bp+2]
  push word [CurrentCont]
  push word L298
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g137
  mov [di], ax
  mov bp, g13
  jmp [bp]

L300: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L301: ; Arm: 207'9
  mov ax, g141
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L302: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g139
  jmp [bp]

L303: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L302
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L304: ; Continuation
  xchg si, di
  Bare_enter_check(16)
  push word [bp+4]
  push word [CurrentCont]
  push word L300
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [si]
  cmp word [bx], 1
  jz L301
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [CurrentCont]
  push word L303
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g13
  jmp [bp]

L305: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L304
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L306: ; Function: (lam,t1)
  xchg si, di
  Bare_enter_check(8)
  mov bx, [si]
  cmp word [bx], 3
  jz L299
  push word [bp+2]
  push word [CurrentCont]
  push word L305
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g138
  mov [di], ax
  mov bp, g2
  jmp [bp]

L307: ; Function: (lam,g142)
  xchg si, di
  Bare_enter_check(6)
  push word [si]
  push word L306
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L308: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L309: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L308
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L310: ; Arm: 264'7
  push word [bp+2]
  push word [CurrentCont]
  push word L309
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g147
  mov [di], ax
  mov bp, g13
  jmp [bp]

L311: ; Arm: 192'9
  mov ax, g148
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L312: ; Arm: 196'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L313: ; Continuation
  xchg si, di
  Bare_enter_check(6)
  mov bx, [si]
  cmp word [bx], 3
  jz L312
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [bp+4]
  jmp [bp]

L314: ; Continuation
  xchg si, di
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L313
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L315: ; Function: (loop,t3)
  xchg si, di
  Bare_enter_check(14)
  mov bx, [si]
  cmp word [bx], 1
  jz L311
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
  push word L314
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, g21
  jmp [bp]

L316: ; Arm: 192'9
  mov ax, g157
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L317: ; Arm: 196'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L318: ; Continuation
  xchg si, di
  Bare_enter_check(6)
  mov bx, [si]
  cmp word [bx], 3
  jz L317
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [bp+4]
  jmp [bp]

L319: ; Continuation
  xchg si, di
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L318
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L320: ; Function: (loop,t1)
  xchg si, di
  Bare_enter_check(14)
  mov bx, [si]
  cmp word [bx], 1
  jz L316
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
  push word L319
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, g21
  jmp [bp]

L321: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L322: ; Continuation
  xchg si, di
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L321
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g13
  jmp [bp]

L323: ; Arm: 257'11
  push word g161
  push word [bp+4]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g158
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L322
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L324: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L325: ; Continuation
  xchg si, di
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L324
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g13
  jmp [bp]

L326: ; Arm: 260'16
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word g165
  push word [bp+4]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word g162
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L325
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L327: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L328: ; Continuation
  xchg si, di
  Bare_enter_check(22)
  mov bx, [si]
  cmp word [bx], 1
  jz L323
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L326
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [CurrentCont]
  push word L327
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g13
  jmp [bp]

L329: ; Function: (lam,t1)
  xchg si, di
  Bare_enter_check(14)
  push word [si]
  push word L320
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [si]
  push word [CurrentCont]
  push word L328
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+2]
  mov [di], ax
  mov bp, [Temps+2]
  jmp [bp]

L330: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L331: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L330
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L332: ; Continuation
  xchg si, di
  Bare_enter_check(16)
  push word [bp+4]
  push word L329
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L331
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g4
  jmp [bp]

L333: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L334: ; Continuation
  xchg si, di
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L333
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g13
  jmp [bp]

L335: ; Arm: 257'11
  push word g152
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g149
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L334
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L336: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L337: ; Continuation
  xchg si, di
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L336
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g13
  jmp [bp]

L338: ; Arm: 260'16
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word g156
  push word [bp+6]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word g153
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L337
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L339: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L340: ; Continuation
  xchg si, di
  Bare_enter_check(32)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L332
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [si]
  cmp word [bx], 1
  jz L335
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L338
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [CurrentCont]
  push word L339
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g13
  jmp [bp]

L341: ; Function: (lam,t1)
  xchg si, di
  Bare_enter_check(18)
  mov bx, [si]
  cmp word [bx], 1
  jz L310
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+2]
  push word L315
  mov [Temps+6], sp
  push word 4 ;; scanned
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+2]
  push word [CurrentCont]
  push word L340
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+2]
  mov [di], ax
  mov bp, [Temps+6]
  jmp [bp]

L342: ; Function: (lam,g166)
  xchg si, di
  Bare_enter_check(6)
  push word [si]
  push word L341
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L343: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L344: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L343
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L345: ; Arm: 302'7
  push word [bp+2]
  push word [CurrentCont]
  push word L344
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g171
  mov [di], ax
  mov bp, g13
  jmp [bp]

L346: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L347: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L346
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L348: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L347
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g13
  jmp [bp]

L349: ; Arm: 305'10
  push word g175
  push word [Temps+2]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word g172
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [bp+2]
  push word [CurrentCont]
  push word L348
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L350: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L351: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L350
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L352: ; Arm: 308'12
  mov ax, [bx+2]
  mov [Temps+10], ax
  mov ax, [bx+4]
  mov [Temps+12], ax
  push word [bp+2]
  push word [CurrentCont]
  push word L351
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g176
  mov [di], ax
  mov bp, g13
  jmp [bp]

L353: ; Arm: 192'9
  mov ax, g177
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L354: ; Arm: 196'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L355: ; Continuation
  xchg si, di
  Bare_enter_check(6)
  mov bx, [si]
  cmp word [bx], 3
  jz L354
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [bp+4]
  jmp [bp]

L356: ; Continuation
  xchg si, di
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L355
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L357: ; Function: (loop,t5)
  xchg si, di
  Bare_enter_check(14)
  mov bx, [si]
  cmp word [bx], 1
  jz L353
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
  push word L356
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, g21
  jmp [bp]

L358: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L359: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L358
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L360: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L359
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g13
  jmp [bp]

L361: ; Arm: 311'15
  push word g181
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g178
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L360
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L362: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, g186
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L363: ; Continuation
  xchg si, di
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L362
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L364: ; Continuation
  xchg si, di
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L363
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g13
  jmp [bp]

L365: ; Arm: 270'9
  push word g185
  push word [bp+2]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g182
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L364
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L366: ; Arm: 275'35
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L367: ; Continuation
  xchg si, di
  Bare_enter_check(16)
  push word [bp+6]
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [si]
  push word [Temps+2]
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L368: ; Continuation
  xchg si, di
  Bare_enter_check(10)
  mov bx, [si]
  cmp word [bx], 3
  jz L366
  push word [bp+10]
  push word [bp+8]
  push word [CurrentCont]
  push word L367
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [bp+4]
  jmp [bp]

L369: ; Continuation
  xchg si, di
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L368
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L370: ; Function: (loop,t2)
  xchg si, di
  Bare_enter_check(22)
  mov bx, [si]
  cmp word [bx], 1
  jz L365
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
  push word [Temps+6]
  push word [Temps+4]
  push word bp
  push word [bp+2]
  push word [CurrentCont]
  push word L369
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, g21
  jmp [bp]

L371: ; Continuation
  xchg si, di
  Bare_enter_check(16)
  push word [bp+6]
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [si]
  push word [Temps+2]
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L372: ; Continuation
  xchg si, di
  Bare_enter_check(24)
  mov bx, [si]
  cmp word [bx], 1
  jz L361
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [bp+6]
  push word L370
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word [bp+8]
  push word [CurrentCont]
  push word L371
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [Temps+4]
  jmp [bp]

L373: ; Function: (lam,t1)
  xchg si, di
  Bare_enter_check(24)
  mov bx, [si]
  cmp word [bx], 1
  jz L345
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 1
  jz L349
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L352
  push word [Temps+2]
  push word L357
  mov [Temps+10], sp
  push word 4 ;; scanned
  push word [Temps+6]
  push word [Temps+2]
  push word [bp+2]
  push word [CurrentCont]
  push word L372
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+2]
  mov [di], ax
  mov bp, [Temps+10]
  jmp [bp]

L374: ; Function: (lam,g187)
  xchg si, di
  Bare_enter_check(6)
  push word [si]
  push word L373
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L375: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, g197
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L376: ; Continuation
  xchg si, di
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L375
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L377: ; Continuation
  xchg si, di
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L376
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g13
  jmp [bp]

L378: ; Arm: 270'9
  push word g196
  push word [bp+2]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g193
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L377
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L379: ; Arm: 275'35
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L380: ; Continuation
  xchg si, di
  Bare_enter_check(16)
  push word [bp+6]
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [si]
  push word [Temps+2]
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L381: ; Continuation
  xchg si, di
  Bare_enter_check(10)
  mov bx, [si]
  cmp word [bx], 3
  jz L379
  push word [bp+10]
  push word [bp+8]
  push word [CurrentCont]
  push word L380
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [bp+4]
  jmp [bp]

L382: ; Continuation
  xchg si, di
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L381
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L383: ; Function: (loop,t1)
  xchg si, di
  Bare_enter_check(22)
  mov bx, [si]
  cmp word [bx], 1
  jz L378
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
  push word [Temps+6]
  push word [Temps+4]
  push word bp
  push word [bp+2]
  push word [CurrentCont]
  push word L382
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, g21
  jmp [bp]

L384: ; Function: (lam,t1)
  xchg si, di
  Bare_enter_check(6)
  push word [si]
  push word L383
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [bp+2]
  mov [di], ax
  mov bp, [Temps+2]
  jmp [bp]

L385: ; Function: (lam,g198)
  xchg si, di
  Bare_enter_check(6)
  push word [si]
  push word L384
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L386: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L387: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L386
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L388: ; Arm: 282'7
  push word [bp+2]
  push word [CurrentCont]
  push word L387
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g192
  mov [di], ax
  mov bp, g13
  jmp [bp]

L389: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L390: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L389
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L391: ; Function: (lam,t1)
  xchg si, di
  Bare_enter_check(10)
  mov bx, [si]
  cmp word [bx], 1
  jz L388
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [si]
  push word [bp+2]
  push word [CurrentCont]
  push word L390
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g198
  mov [di], ax
  mov bp, g6
  jmp [bp]

L392: ; Function: (lam,g199)
  xchg si, di
  Bare_enter_check(6)
  push word [si]
  push word L391
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L393: ; Arm: 367'9
  push word [bp+2]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L394: ; Arm: 370'15
  mov ax, g217
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L395: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L396: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  mov bx, [si]
  cmp word [bx], 1
  jz L394
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
  push word L395
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, g210
  jmp [bp]

L397: ; Arm: 362'27
  push word [bp+4]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L398: ; Continuation
  xchg si, di
  Bare_enter_check(6)
  mov bx, [si]
  cmp word [bx], 3
  jz L397
  mov ax, g215
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L399: ; Arm: 6'9
  mov ax, g213
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L400: ; Arm: 362'12
  mov ax, 19
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+8]
  push word [CurrentCont]
  push word L398
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L399
  mov ax, g214
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L401: ; Continuation
  xchg si, di
  Bare_enter_check(18)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L396
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [si]
  cmp word [bx], 3
  jz L400
  mov ax, g216
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L402: ; Arm: 6'9
  mov ax, g211
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L403: ; Function: (lam,t1)
  xchg si, di
  Bare_enter_check(12)
  mov bx, [si]
  cmp word [bx], 1
  jz L393
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
  push word L401
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L402
  mov ax, g212
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L404: ; Function: (loop,g210)
  xchg si, di
  Bare_enter_check(6)
  push word [si]
  push word L403
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L405: ; Arm: 116'13
  mov ax, [bp+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L406: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L407: ; Function: (lam,t1)
  xchg si, di
  Bare_enter_check(16)
  mov ax, [si]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L405
  mov ax, [si]
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
  mov ax, [si]
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
  push word L406
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+12]
  mov [di], ax
  mov bp, g221
  jmp [bp]

L408: ; Function: (loop,g221)
  xchg si, di
  Bare_enter_check(6)
  push word [si]
  push word L407
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L409: ; Arm: 116'13
  mov ax, [bp+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L410: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L411: ; Function: (lam,t1)
  xchg si, di
  Bare_enter_check(16)
  mov ax, [si]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L409
  mov ax, [si]
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
  mov ax, [si]
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
  push word L410
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+12]
  mov [di], ax
  mov bp, g224
  jmp [bp]

L412: ; Function: (loop,g224)
  xchg si, di
  Bare_enter_check(6)
  push word [si]
  push word L411
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L413: ; Arm: 116'13
  mov ax, [bp+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L414: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L415: ; Function: (lam,t1)
  xchg si, di
  Bare_enter_check(16)
  mov ax, [si]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L413
  mov ax, [si]
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
  mov ax, [si]
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
  push word L414
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+12]
  mov [di], ax
  mov bp, g228
  jmp [bp]

L416: ; Function: (loop,g228)
  xchg si, di
  Bare_enter_check(6)
  push word [si]
  push word L415
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L417: ; Arm: 116'13
  mov ax, [bp+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L418: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L419: ; Function: (lam,t1)
  xchg si, di
  Bare_enter_check(16)
  mov ax, [si]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L417
  mov ax, [si]
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
  mov ax, [si]
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
  push word L418
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+12]
  mov [di], ax
  mov bp, g231
  jmp [bp]

L420: ; Function: (loop,g231)
  xchg si, di
  Bare_enter_check(6)
  push word [si]
  push word L419
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L421: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L422: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L421
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L423: ; Arm: 377'7
  push word [bp+2]
  push word [CurrentCont]
  push word L422
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g208
  mov [di], ax
  mov bp, g13
  jmp [bp]

L424: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L425: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L424
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L426: ; Arm: 380'12
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [bp+2]
  push word [CurrentCont]
  push word L425
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g209
  mov [di], ax
  mov bp, g13
  jmp [bp]

L427: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L428: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L427
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L429: ; Arm: 383'15
  push word [bp+4]
  push word [CurrentCont]
  push word L428
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g218
  mov [di], ax
  mov bp, g13
  jmp [bp]

L430: ; Arm: 349'13
  mov ax, g219
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L431: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, [bp+4]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+4], ax
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [bp+6]
  jmp [bp]

L432: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [si]
  push word `-`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L433: ; Arm: 119'11
  push word g229
  push word `0`
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L434: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L435: ; Arm: 123'2
  mov ax, 1
  mov bx, [bp+8]
  sub ax, bx
  add ax, 1
  mov [Temps+4], ax
  mov ax, [Temps+4]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word [CurrentCont]
  push word L432
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L433
  push word [Temps+4]
  push word [CurrentCont]
  push word L434
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g230
  mov [di], ax
  mov bp, g228
  jmp [bp]

L436: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L437: ; Arm: 119'11
  push word g232
  push word `0`
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L438: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L439: ; Continuation
  xchg si, di
  Bare_enter_check(24)
  mov ax, [bp+8]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L431
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L435
  mov ax, [bp+8]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L436
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L437
  push word [bp+8]
  push word [CurrentCont]
  push word L438
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g233
  mov [di], ax
  mov bp, g231
  jmp [bp]

L440: ; Continuation
  xchg si, di
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L439
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L441: ; Continuation
  xchg si, di
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L440
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g227
  mov [di], ax
  mov bp, g13
  jmp [bp]

L442: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [si]
  push word `-`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L443: ; Arm: 119'11
  push word g222
  push word `0`
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L444: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L445: ; Arm: 123'2
  mov ax, 1
  mov bx, [bp+4]
  sub ax, bx
  add ax, 1
  mov [Temps+4], ax
  mov ax, [Temps+4]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word [CurrentCont]
  push word L442
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L443
  push word [Temps+4]
  push word [CurrentCont]
  push word L444
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g223
  mov [di], ax
  mov bp, g221
  jmp [bp]

L446: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L447: ; Arm: 119'11
  push word g225
  push word `0`
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L448: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L449: ; Continuation
  xchg si, di
  Bare_enter_check(26)
  mov ax, [bp+4]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L441
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L445
  mov ax, [bp+4]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L446
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L447
  push word [bp+4]
  push word [CurrentCont]
  push word L448
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g226
  mov [di], ax
  mov bp, g224
  jmp [bp]

L450: ; Continuation
  xchg si, di
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L449
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L451: ; Continuation
  xchg si, di
  Bare_enter_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L450
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g220
  mov [di], ax
  mov bp, g13
  jmp [bp]

L452: ; Function: (loop,t2)
  xchg si, di
  Bare_enter_check(10)
  mov ax, [bp+2]
  cmp word ax, [si]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L430
  push word bp
  push word [si]
  push word [CurrentCont]
  push word L451
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g59
  jmp [bp]

L453: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L454: ; Continuation
  xchg si, di
  Bare_enter_check(14)
  mov bx, [si]
  cmp word [bx], 1
  jz L429
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word L452
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L453
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, 1
  mov [di], ax
  mov bp, [Temps+4]
  jmp [bp]

L455: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L454
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L456: ; Continuation
  xchg si, di
  Bare_enter_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L455
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, 1
  mov [di], ax
  mov bp, g210
  jmp [bp]

L457: ; Function: (lam,t1)
  xchg si, di
  Bare_enter_check(8)
  mov bx, [si]
  cmp word [bx], 1
  jz L423
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L426
  push word [bp+2]
  push word [CurrentCont]
  push word L456
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g13
  jmp [bp]

L458: ; Function: (lam,g234)
  xchg si, di
  Bare_enter_check(6)
  push word [si]
  push word L457
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L459: ; Arm: 116'13
  mov ax, [bp+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L460: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L461: ; Function: (lam,t1)
  xchg si, di
  Bare_enter_check(16)
  mov ax, [si]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L459
  mov ax, [si]
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
  mov ax, [si]
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
  push word L460
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+12]
  mov [di], ax
  mov bp, g240
  jmp [bp]

L462: ; Function: (loop,g240)
  xchg si, di
  Bare_enter_check(6)
  push word [si]
  push word L461
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L463: ; Arm: 116'13
  mov ax, [bp+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L464: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L465: ; Function: (lam,t1)
  xchg si, di
  Bare_enter_check(16)
  mov ax, [si]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L463
  mov ax, [si]
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
  mov ax, [si]
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
  push word L464
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+12]
  mov [di], ax
  mov bp, g243
  jmp [bp]

L466: ; Function: (loop,g243)
  xchg si, di
  Bare_enter_check(6)
  push word [si]
  push word L465
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L467: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L468: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [si]
  push word `-`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L469: ; Arm: 119'11
  push word g241
  push word `0`
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  mov ax, [Temps+10]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L470: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L471: ; Arm: 123'2
  mov ax, 1
  mov bx, [Temps+2]
  sub ax, bx
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  push word [CurrentCont]
  push word L468
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L469
  push word [Temps+6]
  push word [CurrentCont]
  push word L470
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g242
  mov [di], ax
  mov bp, g240
  jmp [bp]

L472: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L473: ; Arm: 119'11
  push word g244
  push word `0`
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L474: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L475: ; Function: (lam,t1)
  xchg si, di
  Bare_enter_check(22)
  call Bare_free_words
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov ax, [Temps+2]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+4], ax
  push word [bp+2]
  push word [CurrentCont]
  push word L467
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L471
  mov ax, [Temps+2]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word [CurrentCont]
  push word L472
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L473
  push word [Temps+2]
  push word [CurrentCont]
  push word L474
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g245
  mov [di], ax
  mov bp, g243
  jmp [bp]

L476: ; Function: (lam,g246)
  xchg si, di
  Bare_enter_check(6)
  push word [si]
  push word L475
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L477: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L478: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L477
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L479: ; Arm: 330'7
  push word [bp+4]
  push word [CurrentCont]
  push word L478
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g107
  mov [di], ax
  mov bp, g13
  jmp [bp]

L480: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L481: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L480
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L482: ; Arm: 333'12
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [bp+4]
  push word [CurrentCont]
  push word L481
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g108
  mov [di], ax
  mov bp, g13
  jmp [bp]

L483: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L484: ; Continuation
  xchg si, di
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L483
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L485: ; Arm: 338'44
  push word [bp+4]
  push word [CurrentCont]
  push word L484
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g115
  mov [di], ax
  mov bp, g7
  jmp [bp]

L486: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [si]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [bp+6]
  jmp [bp]

L487: ; Continuation
  xchg si, di
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L486
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g9
  jmp [bp]

L488: ; Continuation
  xchg si, di
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L487
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L489: ; Continuation
  xchg si, di
  Bare_enter_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L488
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov bp, g7
  jmp [bp]

L490: ; Continuation
  xchg si, di
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L489
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L491: ; Continuation
  xchg si, di
  Bare_enter_check(14)
  push word [si]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L490
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, g117
  mov [di], ax
  mov bp, g7
  jmp [bp]

L492: ; Continuation
  xchg si, di
  Bare_enter_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L491
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g116
  mov [di], ax
  mov bp, g13
  jmp [bp]

L493: ; Continuation
  xchg si, di
  Bare_enter_check(10)
  mov bx, [si]
  cmp word [bx], 3
  jz L485
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L492
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov bp, g13
  jmp [bp]

L494: ; Continuation
  xchg si, di
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L493
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L495: ; Continuation
  xchg si, di
  Bare_enter_check(14)
  push word [si]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L494
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g21
  jmp [bp]

L496: ; Function: (loop,t1)
  xchg si, di
  Bare_enter_check(12)
  push word bp
  push word [si]
  push word [bp+2]
  push word [CurrentCont]
  push word L495
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g114
  mov [di], ax
  mov bp, g110
  jmp [bp]

L497: ; Continuation
  xchg si, di
  Bare_enter_check(22)
  push word [si]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word [bp+6]
  push word 1
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word [Temps+4]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L498: ; Continuation
  xchg si, di
  Bare_enter_check(16)
  push word [bp+4]
  push word L496
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L497
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g118
  mov [di], ax
  mov bp, [Temps+2]
  jmp [bp]

L499: ; Continuation
  xchg si, di
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L498
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L500: ; Function: (lam,t1)
  xchg si, di
  Bare_enter_check(12)
  mov bx, [si]
  cmp word [bx], 1
  jz L479
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L482
  push word [Temps+2]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L499
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g109
  mov [di], ax
  mov bp, g13
  jmp [bp]

L501: ; Function: (lam,t1)
  xchg si, di
  Bare_enter_check(8)
  push word [si]
  push word [bp+2]
  push word L500
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L502: ; Continuation
  xchg si, di
  Bare_enter_check(54)
  push word [bp+4]
  push word L501
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word g106
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [Temps+4]
  push word g105
  push word 1
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word g257
  push word [Temps+6]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [Temps+8]
  push word g104
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [Temps+10]
  push word g88
  push word 3
  mov [Temps+12], sp
  push word 6 ;; scanned
  push word [Temps+12]
  push word g64
  push word 3
  mov [Temps+14], sp
  push word 6 ;; scanned
  mov ax, [Temps+14]
  mov [di], ax
  mov bp, g31
  jmp [bp]

L503: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L502
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  jmp [bp]

L504: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [si]
  push word [CurrentCont]
  push word L503
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g60
  mov [di], ax
  mov bp, g13
  jmp [bp]

L505: ; Start
  xchg si, di
  Bare_enter_check(14)
  push word g27
  push word `\x04`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L504
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g9
  jmp [bp]

g1:
  dw L3
g2:
  dw L9
g3:
  dw 1
g4:
  dw L14
g5:
  dw 1
g6:
  dw L22
g7:
  dw L26
g8:
  dw 1
g9:
  dw L35
g10:
  dw 1
g11:
  dw L44
g12:
  dw 1
g13:
  dw L50
g14:
  dw 1
g15:
  dw 3
g16:
  dw 1
g17:
  dw 3
g18:
  dw 1
g19:
  dw 3
g20:
  dw 1
g21:
  dw L60
g22:
  dw L69
g23:
  dw 1
  db ``
g24:
  dw 1
g25:
  dw L75
g26:
  dw 1
g27:
  dw 1
g28:
  dw L92
g29:
  dw L85
g30:
  dw 1
g31:
  dw L192
g32:
  dw 5
  db `% `
g33:
  dw 1
g34:
  dw L108
g35:
  dw 1
g36:
  dw 1
g37:
  dw 3
g38:
  dw 1
g39:
  dw 1
g40:
  dw 1
g41:
  dw 1
g42:
  dw 1
g43:
  dw 35
  db `command not found`
g44:
  dw 3
  db `\n`
g45:
  dw 1
g46:
  dw 5
  db `: `
g47:
  dw 1
g48:
  dw 1
g49:
  dw 13
  db `sham: `
g50:
  dw 1
g51:
  dw 35
  db `Permission denied`
g52:
  dw 3
  db `\n`
g53:
  dw 1
g54:
  dw 5
  db `: `
g55:
  dw 1
g56:
  dw 1
g57:
  dw 13
  db `sham: `
g58:
  dw 1
g59:
  dw L196
g60:
  dw 103
  db `Sham: In-memory file-system. Consider typing "ls".\n`
g61:
  dw 13
  db `readme`
g62:
  dw 165
  db `Welcome to sham; please try all the commands!\nCan you find the hidden Easter Egg?\n`
g63:
  dw 1, g62
g64:
  dw 1, g61, g63
g65:
  dw 7
  db `cat`
g66:
  dw 115
  db `cat - concatenate files and print on the standard output\n`
g67:
  dw 67
  db `cat: takes at least one argument\n`
g68:
  dw 1
g69:
  dw 11
  db `cat: `
g70:
  dw 59
  db ` : No such file or directory\n`
g71:
  dw 1
g72:
  dw 3, g70, g71
g73:
  dw 11
  db `cat: `
g74:
  dw 39
  db ` : Not a data file\n`
g75:
  dw 1
g76:
  dw 3, g74, g75
g77:
  dw 1
g78:
  dw 11
  db `cat: `
g79:
  dw 59
  db ` : No such file or directory\n`
g80:
  dw 1
g81:
  dw 3, g79, g80
g82:
  dw 11
  db `cat: `
g83:
  dw 39
  db ` : Not a data file\n`
g84:
  dw 1
g85:
  dw 3, g83, g84
g86:
  dw L231
g87:
  dw 3, g66, g86
g88:
  dw 1, g65, g87
g89:
  dw 5
  db `cp`
g90:
  dw 65
  db `cp - copy files and directories\n`
g91:
  dw 51
  db `cp: missing file operand\n`
g92:
  dw 89
  db `cp: missing destination file operand after '`
g93:
  dw 5
  db `'\n`
g94:
  dw 1
g95:
  dw 3, g93, g94
g96:
  dw 61
  db `cp: unexpected extra operands\n`
g97:
  dw 1
g98:
  dw 35
  db `cp: cannot stat '`
g99:
  dw 59
  db `': No such file or directory\n`
g100:
  dw 1
g101:
  dw 3, g99, g100
g102:
  dw L253
g103:
  dw 3, g90, g102
g104:
  dw 1, g89, g103
g105:
  dw 13
  db `create`
g106:
  dw 55
  db `create - create a new file\n`
g107:
  dw 53
  db `create: missing file name\n`
g108:
  dw 69
  db `create: unexpected extra operands\n`
g109:
  dw 69
  db `(to finish type ^D on a new line)\n`
g110:
  dw L269
g111:
  dw 1
g112:
  dw 1
g113:
  dw 3
g114:
  dw 1
g115:
  dw 1
g116:
  dw 3
  db `\n`
g117:
  dw 1
g118:
  dw 1
g119:
  dw 9
  db `file`
g120:
  dw 55
  db `file - determine file type\n`
g121:
  dw 69
  db `file: takes at least one argument\n`
g122:
  dw 1
g123:
  dw 59
  db ` : No such file or directory\n`
g124:
  dw 1
g125:
  dw 3, g123, g124
g126:
  dw 27
  db `: ASCII text\n`
g127:
  dw 1
g128:
  dw 3, g126, g127
g129:
  dw 27
  db `: executable\n`
g130:
  dw 1
g131:
  dw 3, g129, g130
g132:
  dw L291
g133:
  dw 3, g120, g132
g134:
  dw 1, g119, g133
g135:
  dw 5
  db `ls`
g136:
  dw 59
  db `ls - list directory contents\n`
g137:
  dw 47
  db `ls: takes no arguments\n`
g138:
  dw L292
g139:
  dw L296
g140:
  dw 1
g141:
  dw 1
g142:
  dw L307
g143:
  dw 3, g136, g142
g144:
  dw 1, g135, g143
g145:
  dw 7
  db `man`
g146:
  dw 103
  db `man - an interface to the system reference manuals\n`
g147:
  dw 61
  db `What manual page do you want?\n`
g148:
  dw 1
g149:
  dw 41
  db `No manual entry for `
g150:
  dw 3
  db `\n`
g151:
  dw 1
g152:
  dw 3, g150, g151
g153:
  dw 41
  db `No manual entry for `
g154:
  dw 3
  db `\n`
g155:
  dw 1
g156:
  dw 3, g154, g155
g157:
  dw 1
g158:
  dw 41
  db `No manual entry for `
g159:
  dw 3
  db `\n`
g160:
  dw 1
g161:
  dw 3, g159, g160
g162:
  dw 41
  db `No manual entry for `
g163:
  dw 3
  db `\n`
g164:
  dw 1
g165:
  dw 3, g163, g164
g166:
  dw L342
g167:
  dw 3, g146, g166
g168:
  dw 1, g145, g167
g169:
  dw 5
  db `mv`
g170:
  dw 51
  db `mv - move (rename) files\n`
g171:
  dw 51
  db `mv: missing file operand\n`
g172:
  dw 89
  db `mv: missing destination file operand after '`
g173:
  dw 5
  db `'\n`
g174:
  dw 1
g175:
  dw 3, g173, g174
g176:
  dw 61
  db `mv: unexpected extra operands\n`
g177:
  dw 1
g178:
  dw 35
  db `mv: cannot stat '`
g179:
  dw 59
  db `': No such file or directory\n`
g180:
  dw 1
g181:
  dw 3, g179, g180
g182:
  dw 39
  db `rm: cannot remove '`
g183:
  dw 59
  db `': No such file or directory\n`
g184:
  dw 1
g185:
  dw 3, g183, g184
g186:
  dw 1
g187:
  dw L374
g188:
  dw 3, g170, g187
g189:
  dw 1, g169, g188
g190:
  dw 5
  db `rm`
g191:
  dw 133
  db `rm - remove files or directories (directories not supported yet!)\n`
g192:
  dw 41
  db `rm: missing operand\n`
g193:
  dw 39
  db `rm: cannot remove '`
g194:
  dw 59
  db `': No such file or directory\n`
g195:
  dw 1
g196:
  dw 3, g194, g195
g197:
  dw 1
g198:
  dw L385
g199:
  dw L392
g200:
  dw 3, g191, g199
g201:
  dw 1, g190, g200
g202:
  dw 7
  db `cat`
g203:
  dw 439
  db `I have a little shadow that goes in and out with me,\nAnd what can be the use of him is more than I can see.\nHe is very, very like me from the heels up to the head;\nAnd I see him jump before me, when I jump into my bed.\n`
g204:
  dw 1, g203
g205:
  dw 1, g202, g204
g206:
  dw 7
  db `fib`
g207:
  dw 101
  db `fib - naive fib computation upto the given number\n`
g208:
  dw 45
  db `fib: missing argument\n`
g209:
  dw 69
  db `create: unexpected extra argument\n`
g210:
  dw L404
g211:
  dw 1
g212:
  dw 3
g213:
  dw 1
g214:
  dw 3
g215:
  dw 1
g216:
  dw 1
g217:
  dw 1
g218:
  dw 63
  db `fib: expected numeric argument\n`
g219:
  dw 1
g220:
  dw 9
  db `fib `
g221:
  dw L408
g222:
  dw 1
g223:
  dw 1
g224:
  dw L412
g225:
  dw 1
g226:
  dw 1
g227:
  dw 11
  db ` --> `
g228:
  dw L416
g229:
  dw 1
g230:
  dw 1
g231:
  dw L420
g232:
  dw 1
g233:
  dw 1
g234:
  dw L458
g235:
  dw 3, g207, g234
g236:
  dw 1, g206, g235
g237:
  dw 11
  db `space`
g238:
  dw 95
  db `space - where is the stack-pointer? (in words)\n`
g239:
  dw 1
g240:
  dw L462
g241:
  dw 1
g242:
  dw 1
g243:
  dw L466
g244:
  dw 1
g245:
  dw 1
g246:
  dw L476
g247:
  dw 3, g238, g246
g248:
  dw 1, g237, g247
g249:
  dw 1
g250:
  dw 3, g248, g249
g251:
  dw 3, g236, g250
g252:
  dw 3, g205, g251
g253:
  dw 3, g201, g252
g254:
  dw 3, g189, g253
g255:
  dw 3, g168, g254
g256:
  dw 3, g144, g255
g257:
  dw 3, g134, g256

bare_start: jmp L505
