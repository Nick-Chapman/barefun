L1: ; Arm: 17'7
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

L4: ; Arm: 22'7
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

L10: ; Arm: 27'7
  mov si, g5
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L11: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L12: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L11
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g4
  jmp [bp]

L13: ; Function: (lam,t1)
  Bare_enter_check(10)
  mov bx, si
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
  mov bp, [bp+2]
  mov si, [Temps+2]
  jmp [bp]

L14: ; Function: (iter,g4)
  Bare_enter_check(6)
  push word si
  push word L13
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L15: ; Arm: 32'7
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L16: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L17: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L16
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L18: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L17
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L19: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word si
  push word [CurrentCont]
  push word L18
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L20: ; Function: (lam,t1)
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L15
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L19
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov si, [bp+2]
  mov bp, g6
  jmp [bp]

L21: ; Function: (lam,t1)
  Bare_enter_check(8)
  push word si
  push word [bp+2]
  push word L20
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L22: ; Function: (fold_left,g6)
  Bare_enter_check(6)
  push word si
  push word L21
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L23: ; Arm: 37'7
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L24: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L25: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov bx, si
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
  mov bp, g7
  mov si, [Temps+6]
  jmp [bp]

L26: ; Function: (rev_onto,g7)
  Bare_enter_check(6)
  push word si
  push word L25
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L27: ; Arm: 50'9
  mov si, g8
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L28: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L29: ; Function: (lam,t1)
  Bare_enter_check(8)
  mov bx, si
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
  mov bp, [bp+6]
  mov si, [Temps+8]
  jmp [bp]

L30: ; Function: (loop,t2)
  Bare_enter_check(10)
  push word bp
  push word si
  push word [bp+2]
  push word L29
  mov [Temps+2], sp
  push word 8 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L31: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L32: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L31
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L33: ; Continuation
  Bare_enter_check(600)
  mov ax, si
  call Bare_make_bytes
  mov [Temps+2], ax
  push word [Temps+2]
  push word L30
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word [bp+4]
  push word [CurrentCont]
  push word L32
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [Temps+4]
  mov si, 1
  jmp [bp]

L34: ; Function: (lam,g9)
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L33
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g1
  mov si, si
  jmp [bp]

L35: ; Arm: 61'9
  mov si, g10
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L36: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L37: ; Function: (lam,t1)
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 1
  jz L35
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
  push word L36
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+8]
  jmp [bp]

L38: ; Function: (loop,t2)
  Bare_enter_check(10)
  push word bp
  push word si
  push word [bp+2]
  push word L37
  mov [Temps+2], sp
  push word 8 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L39: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L40: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L39
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L41: ; Continuation
  Bare_enter_check(600)
  mov ax, si
  call Bare_make_bytes
  mov [Temps+2], ax
  push word [Temps+2]
  push word L38
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
  push word L40
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [Temps+4]
  mov si, [Temps+6]
  jmp [bp]

L42: ; Function: (lam,g11)
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L41
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g1
  mov si, si
  jmp [bp]

L43: ; Arm: 69'13
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L44: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L45: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L43
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
  push word L44
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+6]
  jmp [bp]

L46: ; Function: (explode_loop,t1)
  Bare_enter_check(10)
  push word bp
  push word si
  push word [bp+2]
  push word L45
  mov [Temps+2], sp
  push word 8 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L47: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L48: ; Function: (lam,g13)
  Bare_enter_check(14)
  push word si
  push word L46
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov bx, si
  mov ax, [bx]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [CurrentCont]
  push word L47
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [Temps+2]
  mov si, g12
  jmp [bp]

L49: ; Arm: 77'19
  mov si, g16
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L50: ; Arm: 79'15
  mov si, g17
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L51: ; Arm: 82'31
  mov si, g20
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L52: ; Continuation
  Bare_enter_check(0)
  mov bx, si
  cmp word [bx], 3
  jz L51
  mov ax, [bp+4]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  mov bp, [bp+6]
  mov si, [Temps+2]
  jmp [bp]

L53: ; Arm: 6'9
  mov si, g18
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L54: ; Function: (loop,t1)
  Bare_enter_check(10)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L50
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
  push word L52
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L53
  mov si, g19
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L55: ; Continuation
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 3
  jz L49
  push word [bp+6]
  push word [bp+4]
  push word L54
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

L56: ; Arm: 6'9
  mov si, g14
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L57: ; Function: (lam,t1)
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
  push word L55
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L56
  mov si, g15
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L58: ; Function: (lam,g21)
  Bare_enter_check(6)
  push word si
  push word L57
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L59: ; Arm: 107'7
  mov si, g25
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L60: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, g24
  jmp [bp]

L61: ; Arm: 100'19
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov si, [Temps+10]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L62: ; Arm: 101'22
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov si, [Temps+12]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L63: ; Arm: 102'16
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+14], ax
  mov si, [Temps+14]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L64: ; Function: (put_chars,g24)
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 1
  jz L59
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
  push word L60
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L61
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L62
  mov ax, 53
  cmp word ax, [Temps+6]
  call Bare_make_bool_from_n
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L63
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

L65: ; Arm: 347'11
  mov si, si
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L66: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, si
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L67: ; Continuation
  Bare_enter_check(8)
  mov ax, [bp+4]
  mov bx, 5
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  push word si
  push word [CurrentCont]
  push word L66
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g54
  mov si, [Temps+2]
  jmp [bp]

L68: ; Function: (fib,g54)
  Bare_enter_check(8)
  mov ax, si
  cmp word ax, 5
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L65
  mov ax, si
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+4], ax
  push word si
  push word [CurrentCont]
  push word L67
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g54
  mov si, [Temps+4]
  jmp [bp]

L69: ; Function: (lam,g123)
  Bare_enter_check(0)
  mov bx, si
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L70: ; Arm: 369'9
  push word [bp+2]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L71: ; Arm: 372'15
  mov si, g188
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L72: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L73: ; Continuation
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 1
  jz L71
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
  push word L72
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g181
  mov si, [Temps+6]
  jmp [bp]

L74: ; Arm: 364'27
  push word [bp+4]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L75: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L74
  mov si, g186
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L76: ; Arm: 6'9
  mov si, g184
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L77: ; Arm: 364'12
  mov ax, 19
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+8]
  push word [CurrentCont]
  push word L75
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L76
  mov si, g185
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L78: ; Continuation
  Bare_enter_check(18)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L73
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L77
  mov si, g187
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L79: ; Arm: 6'9
  mov si, g182
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L80: ; Function: (lam,t1)
  Bare_enter_check(12)
  mov bx, si
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
  push word L78
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L79
  mov si, g183
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L81: ; Function: (loop,g181)
  Bare_enter_check(6)
  push word si
  push word L80
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L82: ; Arm: 116'13
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L83: ; Continuation
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

L84: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L82
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
  push word L83
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g192
  mov si, [Temps+10]
  jmp [bp]

L85: ; Function: (loop,g192)
  Bare_enter_check(6)
  push word si
  push word L84
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L86: ; Arm: 116'13
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L87: ; Continuation
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

L88: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L86
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
  push word L87
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g195
  mov si, [Temps+10]
  jmp [bp]

L89: ; Function: (loop,g195)
  Bare_enter_check(6)
  push word si
  push word L88
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L90: ; Arm: 116'13
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L91: ; Continuation
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

L92: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L90
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
  push word L91
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g199
  mov si, [Temps+10]
  jmp [bp]

L93: ; Function: (loop,g199)
  Bare_enter_check(6)
  push word si
  push word L92
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L94: ; Arm: 116'13
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L95: ; Continuation
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

L96: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L94
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
  push word L95
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g202
  mov si, [Temps+10]
  jmp [bp]

L97: ; Function: (loop,g202)
  Bare_enter_check(6)
  push word si
  push word L96
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L98: ; Arm: 116'13
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L99: ; Continuation
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

L100: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L98
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
  push word L99
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g208
  mov si, [Temps+10]
  jmp [bp]

L101: ; Function: (loop,g208)
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

L102: ; Arm: 116'13
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L103: ; Continuation
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

L104: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L102
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
  push word L103
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g211
  mov si, [Temps+10]
  jmp [bp]

L105: ; Function: (loop,g211)
  Bare_enter_check(6)
  push word si
  push word L104
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L106: ; Continuation
  Bare_enter_check(0)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L107: ; Continuation
  Bare_enter_check(8)
  push word si
  push word `-`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, g24
  mov si, [Temps+2]
  jmp [bp]

L108: ; Arm: 119'11
  push word g209
  push word `0`
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  mov si, [Temps+10]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L109: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L110: ; Arm: 123'2
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
  push word L107
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L108
  push word [Temps+6]
  push word [CurrentCont]
  push word L109
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g208
  mov si, g210
  jmp [bp]

L111: ; Continuation
  Bare_enter_check(0)
  mov bp, g24
  mov si, si
  jmp [bp]

L112: ; Arm: 119'11
  push word g212
  push word `0`
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  mov si, [Temps+8]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L113: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L114: ; Function: (lam,t1)
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
  push word L106
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L110
  mov ax, [Temps+2]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word [CurrentCont]
  push word L111
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L112
  push word [Temps+2]
  push word [CurrentCont]
  push word L113
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g211
  mov si, g213
  jmp [bp]

L115: ; Function: (lam,g214)
  Bare_enter_check(6)
  push word si
  push word L114
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L116: ; Arm: 91'7
  mov si, g22
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L117: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L118: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L117
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L119: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L118
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+8]
  jmp [bp]

L120: ; Continuation
  Bare_enter_check(12)
  push word [bp+6]
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L119
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g7
  mov si, g23
  jmp [bp]

L121: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L120
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g7
  mov si, si
  jmp [bp]

L122: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L121
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L123: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L122
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L124: ; Function: (concat,t5)
  Bare_enter_check(12)
  mov bx, si
  cmp word [bx], 1
  jz L116
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+2]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L123
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, bp
  mov si, [Temps+4]
  jmp [bp]

L125: ; Continuation
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

L126: ; Arm: 168'11
  push word [bp+6]
  push word [CurrentCont]
  push word L125
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+10]
  mov bp, [bp+2]
  jmp [bp]

L127: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L128: ; Continuation
  Bare_enter_check(16)
  push word [bp+6]
  push word si
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word [CurrentCont]
  push word L127
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov si, [Temps+2]
  jmp [bp]

L129: ; Arm: 170'26
  push word [Temps+4]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L128
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+10]
  mov bp, [bp+2]
  jmp [bp]

L130: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L131: ; Continuation
  Bare_enter_check(16)
  push word [bp+4]
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word [CurrentCont]
  push word L130
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L132: ; Function: (lam,t1)
  Bare_enter_check(12)
  mov bx, si
  cmp word [bx], 1
  jz L126
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
  jz L129
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+10]
  push word [CurrentCont]
  push word L131
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+6]
  mov bp, [bp+8]
  jmp [bp]

L133: ; Function: (lam,t1)
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L132
  mov [Temps+2], sp
  push word 12 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L134: ; Function: (have_letter,t1)
  Bare_enter_check(12)
  push word bp
  push word si
  push word [bp+4]
  push word [bp+2]
  push word L133
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L135: ; Arm: 175'9
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L136: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L137: ; Arm: 177'24
  push word [Temps+4]
  push word [CurrentCont]
  push word L136
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+2]
  mov bp, [bp+4]
  jmp [bp]

L138: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L139: ; Continuation
  Bare_enter_check(16)
  push word g27
  push word [bp+4]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+6]
  push word [CurrentCont]
  push word L138
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L140: ; Function: (lam,t2)
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 1
  jz L135
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
  jz L137
  push word [Temps+4]
  push word [Temps+2]
  push word [CurrentCont]
  push word L139
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+2]
  mov bp, [bp+6]
  jmp [bp]

L141: ; Function: (at_word_start,t1)
  Bare_enter_check(18)
  push word bp
  push word [bp+2]
  push word L134
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word bp
  push word si
  push word L140
  mov [Temps+4], sp
  push word 8 ;; scanned
  mov si, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L142: ; Arm: 144'22
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov bp, [bp+2]
  mov si, si
  jmp [bp]

L143: ; Arm: 145'28
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

L144: ; Arm: 146'19
  mov bp, bp
  mov si, si
  jmp [bp]

L145: ; Arm: 149'17
  mov bp, bp
  mov si, si
  jmp [bp]

L146: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L147: ; Arm: 153'28
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

L148: ; Arm: 154'29
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

L149: ; Arm: 155'32
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

L150: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L146
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L147
  mov ax, [bp+8]
  cmp word ax, 65
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L148
  mov ax, 253
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L149
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

L151: ; Arm: 6'9
  mov si, g31
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L152: ; Arm: 147'21
  mov bx, si
  cmp word [bx], 1
  jz L145
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
  push word L150
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+20]
  cmp word [bx], 3
  jz L151
  mov si, g32
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L153: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+2]
  jmp [bp]

L154: ; Arm: 100'19
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+18], ax
  mov si, [Temps+18]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L155: ; Arm: 101'22
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+20], ax
  mov si, [Temps+20]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L156: ; Arm: 102'16
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+22], ax
  mov si, [Temps+22]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L157: ; Function: (readloop,t1)
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
  jz L142
  mov ax, [Temps+2]
  cmp word ax, `\x04`
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L143
  mov ax, 255
  cmp word ax, [Temps+4]
  call Bare_make_bool_from_n
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L144
  mov ax, [Temps+4]
  cmp word ax, 255
  call Bare_make_bool_from_z
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L152
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
  push word L153
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+16]
  cmp word [bx], 3
  jz L154
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+18], ax
  mov bx, [Temps+18]
  cmp word [bx], 3
  jz L155
  mov ax, 53
  cmp word ax, [Temps+14]
  call Bare_make_bool_from_n
  mov [Temps+20], ax
  mov bx, [Temps+20]
  cmp word [bx], 3
  jz L156
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

L158: ; Arm: 231'36
  mov si, g34
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L159: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L160: ; Arm: 223'7
  mov si, [bp+10]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L161: ; Arm: 194'9
  mov si, g37
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L162: ; Arm: 198'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L163: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L162
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L164: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L163
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L165: ; Function: (loop,t3)
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L161
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
  push word L164
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov si, [Temps+6]
  jmp [bp]

L166: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L167: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L166
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g24
  mov si, si
  jmp [bp]

L168: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L167
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L169: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L168
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L170: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L169
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov si, si
  jmp [bp]

L171: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L170
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+12]
  jmp [bp]

L172: ; Continuation
  Bare_enter_check(16)
  push word [bp+10]
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L171
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g7
  mov si, g45
  jmp [bp]

L173: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L172
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g7
  mov si, si
  jmp [bp]

L174: ; Continuation
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L173
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov si, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L175: ; Continuation
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L174
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov si, g44
  jmp [bp]

L176: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L175
  mov [CurrentCont], sp
  push word 10 ;; scanned
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
  mov bp, [bp+10]
  mov si, si
  jmp [bp]

L178: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L177
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+12]
  jmp [bp]

L179: ; Continuation
  Bare_enter_check(16)
  push word [bp+10]
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L178
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g7
  mov si, g43
  jmp [bp]

L180: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L179
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g7
  mov si, si
  jmp [bp]

L181: ; Continuation
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L180
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov si, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L182: ; Continuation
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L181
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov si, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L183: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L182
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L184: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L183
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+10]
  mov si, si
  jmp [bp]

L185: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L184
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+14]
  jmp [bp]

L186: ; Continuation
  Bare_enter_check(18)
  push word [bp+12]
  push word [bp+10]
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L185
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, g7
  mov si, g42
  jmp [bp]

L187: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L186
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g7
  mov si, si
  jmp [bp]

L188: ; Continuation
  Bare_enter_check(16)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L187
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov si, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L189: ; Continuation
  Bare_enter_check(16)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L188
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov si, g41
  jmp [bp]

L190: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L189
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L191: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L190
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+10]
  mov si, si
  jmp [bp]

L192: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L191
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+14]
  jmp [bp]

L193: ; Continuation
  Bare_enter_check(18)
  push word [bp+12]
  push word [bp+10]
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L192
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, g7
  mov si, g40
  jmp [bp]

L194: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L193
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g7
  mov si, si
  jmp [bp]

L195: ; Continuation
  Bare_enter_check(16)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L194
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov si, g39
  jmp [bp]

L196: ; Arm: 215'9
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L195
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov si, g38
  jmp [bp]

L197: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L198: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L197
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g24
  mov si, si
  jmp [bp]

L199: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L198
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L200: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L199
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L201: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L200
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov si, si
  jmp [bp]

L202: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L201
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+12]
  jmp [bp]

L203: ; Continuation
  Bare_enter_check(16)
  push word [bp+10]
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L202
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g7
  mov si, g53
  jmp [bp]

L204: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L203
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g7
  mov si, si
  jmp [bp]

L205: ; Continuation
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L204
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov si, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L206: ; Continuation
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L205
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov si, g52
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
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L208: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L207
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov si, si
  jmp [bp]

L209: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L208
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+12]
  jmp [bp]

L210: ; Continuation
  Bare_enter_check(16)
  push word [bp+10]
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L209
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g7
  mov si, g51
  jmp [bp]

L211: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L210
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g7
  mov si, si
  jmp [bp]

L212: ; Continuation
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L211
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov si, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L213: ; Continuation
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L212
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov si, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L214: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L213
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L215: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L214
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov si, si
  jmp [bp]

L216: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L215
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+14]
  jmp [bp]

L217: ; Continuation
  Bare_enter_check(18)
  push word [bp+12]
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L216
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, g7
  mov si, g50
  jmp [bp]

L218: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L217
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g7
  mov si, si
  jmp [bp]

L219: ; Continuation
  Bare_enter_check(16)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L218
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov si, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L220: ; Continuation
  Bare_enter_check(16)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L219
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov si, g49
  jmp [bp]

L221: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L220
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L222: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L221
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+10]
  mov si, si
  jmp [bp]

L223: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L222
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+14]
  jmp [bp]

L224: ; Continuation
  Bare_enter_check(18)
  push word [bp+12]
  push word [bp+10]
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L223
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, g7
  mov si, g48
  jmp [bp]

L225: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L224
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g7
  mov si, si
  jmp [bp]

L226: ; Continuation
  Bare_enter_check(16)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L225
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov si, g47
  jmp [bp]

L227: ; Arm: 218'14
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L226
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov si, g46
  jmp [bp]

L228: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L229: ; Continuation
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L196
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L227
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [bp+12]
  push word [CurrentCont]
  push word L228
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+8]
  mov bp, [Temps+6]
  jmp [bp]

L230: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L229
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, [bp+14]
  mov si, si
  jmp [bp]

L231: ; Continuation
  Bare_enter_check(34)
  push word [bp+12]
  push word [CurrentCont]
  push word L159
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, si
  cmp word [bx], 1
  jz L160
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+2]
  push word [bp+8]
  push word L165
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L230
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bx, [bp+10]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov si, [Temps+8]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L232: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L231
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+14]
  jmp [bp]

L233: ; Continuation
  Bare_enter_check(18)
  push word si
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L232
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, g7
  mov si, g36
  jmp [bp]

L234: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L233
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, [bp+14]
  mov si, si
  jmp [bp]

L235: ; Continuation
  Bare_enter_check(18)
  push word si
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L234
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov si, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L236: ; Continuation
  Bare_enter_check(18)
  mov bx, si
  cmp word [bx], 3
  jz L158
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L235
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, [bp+10]
  mov si, g35
  jmp [bp]

L237: ; Continuation
  Bare_enter_check(20)
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L236
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+16]
  jmp [bp]

L238: ; Continuation
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
  push word L237
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L239: ; Continuation
  Bare_enter_check(26)
  push word [bp+6]
  push word L157
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word si
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L238
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, [Temps+2]
  mov si, g33
  jmp [bp]

L240: ; Continuation
  Bare_enter_check(28)
  push word g29
  push word `\x04`
  push word 3
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
  push word L239
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, [bp+4]
  mov si, [Temps+2]
  jmp [bp]

L241: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L240
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, g24
  mov si, si
  jmp [bp]

L242: ; Function: (mainloop,t2)
  Bare_enter_check(20)
  push word bp
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L241
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, [bp+6]
  mov si, g28
  jmp [bp]

L243: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L244: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L243
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g24
  mov si, si
  jmp [bp]

L245: ; Arm: 252'7
  push word [bp+8]
  push word [CurrentCont]
  push word L244
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov si, g62
  jmp [bp]

L246: ; Arm: 194'9
  mov si, g63
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L247: ; Arm: 198'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L248: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L247
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L249: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L248
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L250: ; Function: (loop,t3)
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L246
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
  push word L249
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov si, [Temps+6]
  jmp [bp]

L251: ; Arm: 194'9
  mov si, g72
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L252: ; Arm: 198'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L253: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L252
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L254: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L253
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L255: ; Function: (loop,t1)
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L251
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
  push word L254
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov si, [Temps+6]
  jmp [bp]

L256: ; Continuation
  Bare_enter_check(0)
  mov bp, g24
  mov si, si
  jmp [bp]

L257: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L256
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L258: ; Arm: 245'11
  push word g76
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g73
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L257
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+4]
  jmp [bp]

L259: ; Continuation
  Bare_enter_check(0)
  mov bp, g24
  mov si, si
  jmp [bp]

L260: ; Arm: 248'16
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L259
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, [Temps+4]
  jmp [bp]

L261: ; Continuation
  Bare_enter_check(0)
  mov bp, g24
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
  Bare_enter_check(24)
  mov bx, si
  cmp word [bx], 1
  jz L258
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L260
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word g80
  push word [bp+8]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [Temps+8]
  push word g77
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L262
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+10]
  jmp [bp]

L264: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L263
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov si, si
  jmp [bp]

L265: ; Function: (lam,t1)
  Bare_enter_check(22)
  push word si
  push word [bp+4]
  push word L255
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word si
  push word [bp+6]
  push word [bp+2]
  push word [CurrentCont]
  push word L264
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov si, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L266: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L267: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L266
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L268: ; Continuation
  Bare_enter_check(22)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L265
  mov [Temps+2], sp
  push word 10 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word [CurrentCont]
  push word L267
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g4
  mov si, [Temps+2]
  jmp [bp]

L269: ; Continuation
  Bare_enter_check(0)
  mov bp, g24
  mov si, si
  jmp [bp]

L270: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L269
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L271: ; Arm: 245'11
  push word g67
  push word [bp+12]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g64
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L270
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+8]
  mov si, [Temps+4]
  jmp [bp]

L272: ; Continuation
  Bare_enter_check(0)
  mov bp, g24
  mov si, si
  jmp [bp]

L273: ; Arm: 248'16
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L272
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, [Temps+4]
  jmp [bp]

L274: ; Continuation
  Bare_enter_check(0)
  mov bp, g24
  mov si, si
  jmp [bp]

L275: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L274
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L276: ; Continuation
  Bare_enter_check(40)
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L268
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, si
  cmp word [bx], 1
  jz L271
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L273
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word g71
  push word [bp+12]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [Temps+8]
  push word g68
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L275
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+8]
  mov si, [Temps+10]
  jmp [bp]

L277: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L276
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, [bp+16]
  mov si, si
  jmp [bp]

L278: ; Function: (lam,t1)
  Bare_enter_check(28)
  mov bx, si
  cmp word [bx], 1
  jz L245
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+2]
  push word [bp+4]
  push word L250
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L277
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov si, [Temps+8]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L279: ; Function: (lam,t1)
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L278
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L280: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L281: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L280
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g24
  mov si, si
  jmp [bp]

L282: ; Arm: 289'7
  push word [bp+8]
  push word [CurrentCont]
  push word L281
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov si, g83
  jmp [bp]

L283: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L284: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L283
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g24
  mov si, si
  jmp [bp]

L285: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L284
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L286: ; Arm: 292'10
  push word g87
  push word [Temps+2]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word g84
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word [bp+2]
  push word [CurrentCont]
  push word L285
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+8]
  jmp [bp]

L287: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L288: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L287
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g24
  mov si, si
  jmp [bp]

L289: ; Arm: 295'12
  mov ax, [bx+2]
  mov [Temps+10], ax
  mov ax, [bx+4]
  mov [Temps+12], ax
  push word [bp+8]
  push word [CurrentCont]
  push word L288
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov si, g88
  jmp [bp]

L290: ; Arm: 194'9
  mov si, g89
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L291: ; Arm: 198'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L292: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L291
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L293: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L292
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L294: ; Function: (loop,t5)
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L290
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
  push word L293
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov si, [Temps+6]
  jmp [bp]

L295: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L296: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L295
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g24
  mov si, si
  jmp [bp]

L297: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L296
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L298: ; Arm: 298'15
  push word g93
  push word [bp+10]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g90
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L297
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+4]
  jmp [bp]

L299: ; Continuation
  Bare_enter_check(22)
  push word [bp+6]
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word si
  push word [Temps+2]
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [Temps+4]
  push word 1
  mov [Temps+6], sp
  push word 4 ;; scanned
  mov si, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L300: ; Continuation
  Bare_enter_check(26)
  mov bx, si
  cmp word [bx], 1
  jz L298
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [bp+12]
  push word [CurrentCont]
  push word L299
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov si, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L301: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L300
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, [bp+14]
  mov si, si
  jmp [bp]

L302: ; Function: (lam,t1)
  Bare_enter_check(26)
  mov bx, si
  cmp word [bx], 1
  jz L282
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 1
  jz L286
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L289
  push word [Temps+2]
  push word [bp+4]
  push word L294
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [Temps+10]
  push word [Temps+6]
  push word [Temps+2]
  push word [bp+8]
  push word [bp+6]
  push word [bp+2]
  push word [CurrentCont]
  push word L301
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+12], ax
  mov si, [Temps+12]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L303: ; Function: (lam,t4)
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L302
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L304: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L305: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L304
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g24
  mov si, si
  jmp [bp]

L306: ; Arm: 332'7
  push word [bp+14]
  push word [CurrentCont]
  push word L305
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, g96
  jmp [bp]

L307: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L308: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L307
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g24
  mov si, si
  jmp [bp]

L309: ; Arm: 335'12
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [bp+14]
  push word [CurrentCont]
  push word L308
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, g97
  jmp [bp]

L310: ; Arm: 144'22
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov bp, [bp+2]
  mov si, si
  jmp [bp]

L311: ; Arm: 145'28
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

L312: ; Arm: 146'19
  mov bp, bp
  mov si, si
  jmp [bp]

L313: ; Arm: 149'17
  mov bp, bp
  mov si, si
  jmp [bp]

L314: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L315: ; Arm: 153'28
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

L316: ; Arm: 154'29
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

L317: ; Arm: 155'32
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

L318: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L314
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L315
  mov ax, [bp+8]
  cmp word ax, 65
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L316
  mov ax, 253
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L317
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

L319: ; Arm: 6'9
  mov si, g100
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L320: ; Arm: 147'21
  mov bx, si
  cmp word [bx], 1
  jz L313
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
  push word L318
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+20]
  cmp word [bx], 3
  jz L319
  mov si, g101
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L321: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+2]
  jmp [bp]

L322: ; Arm: 100'19
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+18], ax
  mov si, [Temps+18]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L323: ; Arm: 101'22
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+20], ax
  mov si, [Temps+20]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L324: ; Arm: 102'16
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+22], ax
  mov si, [Temps+22]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L325: ; Function: (readloop,t1)
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
  jz L310
  mov ax, [Temps+2]
  cmp word ax, `\x04`
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L311
  mov ax, 255
  cmp word ax, [Temps+4]
  call Bare_make_bool_from_n
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L312
  mov ax, [Temps+4]
  cmp word ax, 255
  call Bare_make_bool_from_z
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L320
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
  push word L321
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+16]
  cmp word [bx], 3
  jz L322
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+18], ax
  mov bx, [Temps+18]
  cmp word [bx], 3
  jz L323
  mov ax, 53
  cmp word ax, [Temps+14]
  call Bare_make_bool_from_n
  mov [Temps+20], ax
  mov bx, [Temps+20]
  cmp word [bx], 3
  jz L324
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

L326: ; Continuation
  Bare_enter_check(0)
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
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L328: ; Arm: 340'44
  push word [bp+10]
  push word [bp+8]
  push word [CurrentCont]
  push word L327
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g7
  mov si, g103
  jmp [bp]

L329: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word si
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+2]
  jmp [bp]

L330: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L329
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L331: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L330
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov si, si
  jmp [bp]

L332: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L331
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+12]
  jmp [bp]

L333: ; Continuation
  Bare_enter_check(16)
  push word [bp+10]
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L332
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g7
  mov si, g105
  jmp [bp]

L334: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L333
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g7
  mov si, si
  jmp [bp]

L335: ; Continuation
  Bare_enter_check(14)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L334
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov si, g104
  jmp [bp]

L336: ; Continuation
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 3
  jz L328
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L335
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov si, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L337: ; Continuation
  Bare_enter_check(18)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L336
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+10]
  jmp [bp]

L338: ; Continuation
  Bare_enter_check(20)
  push word si
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L337
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L339: ; Function: (loop,t1)
  Bare_enter_check(26)
  push word [bp+4]
  push word L325
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word bp
  push word si
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+2]
  push word [CurrentCont]
  push word L338
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, [Temps+2]
  mov si, g102
  jmp [bp]

L340: ; Continuation
  Bare_enter_check(28)
  push word [bp+6]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word [bp+4]
  push word 1
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word si
  push word [Temps+4]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word 1
  mov [Temps+8], sp
  push word 4 ;; scanned
  mov si, [Temps+8]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L341: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+6]
  push word [CurrentCont]
  push word L340
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

L342: ; Continuation
  Bare_enter_check(26)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L339
  mov [Temps+2], sp
  push word 14 ;; scanned
  push word [bp+18]
  push word [bp+16]
  push word [CurrentCont]
  push word L341
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [Temps+2]
  mov si, g106
  jmp [bp]

L343: ; Continuation
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
  push word L342
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov bp, g24
  mov si, si
  jmp [bp]

L344: ; Function: (lam,t1)
  Bare_enter_check(22)
  mov bx, si
  cmp word [bx], 1
  jz L306
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L309
  push word [Temps+2]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L343
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov bp, [bp+6]
  mov si, g98
  jmp [bp]

L345: ; Function: (lam,t7)
  Bare_enter_check(18)
  push word si
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L344
  mov [Temps+2], sp
  push word 16 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L346: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L347: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L346
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g24
  mov si, si
  jmp [bp]

L348: ; Arm: 327'7
  push word [bp+8]
  push word [CurrentCont]
  push word L347
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov si, g109
  jmp [bp]

L349: ; Arm: 194'9
  mov si, g110
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L350: ; Arm: 198'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L351: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L350
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L352: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L351
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L353: ; Function: (loop,t1)
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L349
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
  push word L352
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov si, [Temps+6]
  jmp [bp]

L354: ; Continuation
  Bare_enter_check(0)
  mov bp, g24
  mov si, si
  jmp [bp]

L355: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L354
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L356: ; Arm: 320'11
  push word g113
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L355
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+2]
  jmp [bp]

L357: ; Continuation
  Bare_enter_check(0)
  mov bp, g24
  mov si, si
  jmp [bp]

L358: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L357
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L359: ; Arm: 323'16
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word g116
  push word [bp+8]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L358
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+6]
  jmp [bp]

L360: ; Continuation
  Bare_enter_check(0)
  mov bp, g24
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
  Bare_enter_check(16)
  mov bx, si
  cmp word [bx], 1
  jz L356
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L359
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word g119
  push word [bp+8]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L361
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+8]
  jmp [bp]

L363: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L362
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov si, si
  jmp [bp]

L364: ; Function: (lam,t3)
  Bare_enter_check(22)
  push word si
  push word [bp+4]
  push word L353
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word si
  push word [bp+6]
  push word [bp+2]
  push word [CurrentCont]
  push word L363
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov si, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L365: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L366: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L365
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L367: ; Function: (lam,t1)
  Bare_enter_check(22)
  mov bx, si
  cmp word [bx], 1
  jz L348
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L364
  mov [Temps+6], sp
  push word 10 ;; scanned
  push word si
  push word [bp+8]
  push word [CurrentCont]
  push word L366
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g4
  mov si, [Temps+6]
  jmp [bp]

L368: ; Function: (lam,t10)
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L367
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L369: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L370: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L369
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g24
  mov si, si
  jmp [bp]

L371: ; Arm: 237'9
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [bp+4]
  push word [CurrentCont]
  push word L370
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov si, g122
  jmp [bp]

L372: ; Arm: 205'9
  mov si, g124
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L373: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L374: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L373
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g24
  mov si, si
  jmp [bp]

L375: ; Function: (loop,t1)
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 1
  jz L372
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, ` `
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  push word [Temps+4]
  push word bp
  push word [CurrentCont]
  push word L374
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+2]
  mov si, [Temps+2]
  jmp [bp]

L376: ; Continuation
  Bare_enter_check(0)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L377: ; Arm: 209'9
  mov si, g125
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L378: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L379: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L378
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g24
  mov si, si
  jmp [bp]

L380: ; Continuation
  Bare_enter_check(24)
  push word [bp+4]
  push word L375
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+6]
  push word [CurrentCont]
  push word L376
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, si
  cmp word [bx], 1
  jz L377
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [Temps+6]
  push word [Temps+2]
  push word [CurrentCont]
  push word L379
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov si, [Temps+4]
  jmp [bp]

L381: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L380
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L382: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L381
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

L383: ; Function: (lam,t1)
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 3
  jz L371
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L382
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g2
  mov si, g123
  jmp [bp]

L384: ; Function: (lam,t13)
  Bare_enter_check(8)
  push word si
  push word [bp+2]
  push word L383
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L385: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L386: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L385
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g24
  mov si, si
  jmp [bp]

L387: ; Arm: 266'7
  push word [bp+8]
  push word [CurrentCont]
  push word L386
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov si, g128
  jmp [bp]

L388: ; Arm: 194'9
  mov si, g129
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L389: ; Arm: 198'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L390: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L389
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L391: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L390
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L392: ; Function: (loop,t3)
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L388
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
  push word L391
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov si, [Temps+6]
  jmp [bp]

L393: ; Arm: 194'9
  mov si, g138
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L394: ; Arm: 198'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L395: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L394
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L396: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L395
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L397: ; Function: (loop,t1)
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L393
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
  push word L396
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov si, [Temps+6]
  jmp [bp]

L398: ; Continuation
  Bare_enter_check(0)
  mov bp, g24
  mov si, si
  jmp [bp]

L399: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L398
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L400: ; Arm: 259'11
  push word g142
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g139
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L399
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+4]
  jmp [bp]

L401: ; Continuation
  Bare_enter_check(0)
  mov bp, g24
  mov si, si
  jmp [bp]

L402: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L401
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L403: ; Arm: 262'16
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word g146
  push word [bp+8]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word g143
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L402
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+8]
  jmp [bp]

L404: ; Continuation
  Bare_enter_check(0)
  mov bp, g24
  mov si, si
  jmp [bp]

L405: ; Continuation
  Bare_enter_check(24)
  mov bx, si
  cmp word [bx], 1
  jz L400
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L403
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [CurrentCont]
  push word L404
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, [Temps+4]
  jmp [bp]

L406: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L405
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov si, si
  jmp [bp]

L407: ; Function: (lam,t1)
  Bare_enter_check(22)
  push word si
  push word [bp+4]
  push word L397
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word si
  push word [bp+6]
  push word [bp+2]
  push word [CurrentCont]
  push word L406
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov si, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L408: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L409: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L408
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L410: ; Continuation
  Bare_enter_check(22)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L407
  mov [Temps+2], sp
  push word 10 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word [CurrentCont]
  push word L409
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g4
  mov si, [Temps+2]
  jmp [bp]

L411: ; Continuation
  Bare_enter_check(0)
  mov bp, g24
  mov si, si
  jmp [bp]

L412: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L411
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L413: ; Arm: 259'11
  push word g133
  push word [bp+12]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g130
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L412
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+8]
  mov si, [Temps+4]
  jmp [bp]

L414: ; Continuation
  Bare_enter_check(0)
  mov bp, g24
  mov si, si
  jmp [bp]

L415: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L414
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L416: ; Arm: 262'16
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word g137
  push word [bp+12]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word g134
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L415
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+8]
  mov si, [Temps+8]
  jmp [bp]

L417: ; Continuation
  Bare_enter_check(0)
  mov bp, g24
  mov si, si
  jmp [bp]

L418: ; Continuation
  Bare_enter_check(40)
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L410
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, si
  cmp word [bx], 1
  jz L413
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L416
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [CurrentCont]
  push word L417
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, [Temps+4]
  jmp [bp]

L419: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L418
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, [bp+16]
  mov si, si
  jmp [bp]

L420: ; Function: (lam,t1)
  Bare_enter_check(28)
  mov bx, si
  cmp word [bx], 1
  jz L387
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+2]
  push word [bp+4]
  push word L392
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L419
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov si, [Temps+8]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L421: ; Function: (lam,t16)
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L420
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L422: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L423: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L422
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g24
  mov si, si
  jmp [bp]

L424: ; Arm: 304'7
  push word [bp+8]
  push word [CurrentCont]
  push word L423
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov si, g149
  jmp [bp]

L425: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L426: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L425
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g24
  mov si, si
  jmp [bp]

L427: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L426
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L428: ; Arm: 307'10
  push word g153
  push word [Temps+2]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word g150
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word [bp+2]
  push word [CurrentCont]
  push word L427
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+8]
  jmp [bp]

L429: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L430: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L429
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g24
  mov si, si
  jmp [bp]

L431: ; Arm: 310'12
  mov ax, [bx+2]
  mov [Temps+10], ax
  mov ax, [bx+4]
  mov [Temps+12], ax
  push word [bp+8]
  push word [CurrentCont]
  push word L430
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov si, g154
  jmp [bp]

L432: ; Arm: 194'9
  mov si, g155
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L433: ; Arm: 198'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L434: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L433
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L435: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L434
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L436: ; Function: (loop,t5)
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L432
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
  push word L435
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov si, [Temps+6]
  jmp [bp]

L437: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L438: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L437
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g24
  mov si, si
  jmp [bp]

L439: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L438
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L440: ; Arm: 313'15
  push word g159
  push word [bp+12]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g156
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+10]
  push word [bp+4]
  push word [CurrentCont]
  push word L439
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, [Temps+4]
  jmp [bp]

L441: ; Continuation
  Bare_enter_check(0)
  mov si, g164
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L442: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L441
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g24
  mov si, si
  jmp [bp]

L443: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L442
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L444: ; Arm: 272'9
  push word g163
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g160
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+2]
  push word [CurrentCont]
  push word L443
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+4]
  jmp [bp]

L445: ; Arm: 277'35
  mov si, [bp+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L446: ; Continuation
  Bare_enter_check(16)
  push word [bp+6]
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word si
  push word [Temps+2]
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  mov si, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L447: ; Continuation
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 3
  jz L445
  push word [bp+10]
  push word [bp+8]
  push word [CurrentCont]
  push word L446
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L448: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L447
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L449: ; Function: (loop,t2)
  Bare_enter_check(24)
  mov bx, si
  cmp word [bx], 1
  jz L444
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
  push word [bp+8]
  push word [CurrentCont]
  push word L448
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov si, [Temps+6]
  jmp [bp]

L450: ; Continuation
  Bare_enter_check(22)
  push word [bp+6]
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word si
  push word [Temps+2]
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [Temps+4]
  push word 1
  mov [Temps+6], sp
  push word 4 ;; scanned
  mov si, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L451: ; Continuation
  Bare_enter_check(16)
  push word si
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L450
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov si, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L452: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L451
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L453: ; Continuation
  Bare_enter_check(26)
  mov bx, si
  cmp word [bx], 1
  jz L440
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L449
  mov [Temps+4], sp
  push word 10 ;; scanned
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+14]
  push word [CurrentCont]
  push word L452
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [bp+10]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov si, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L454: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L453
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, [bp+16]
  mov si, si
  jmp [bp]

L455: ; Function: (lam,t1)
  Bare_enter_check(28)
  mov bx, si
  cmp word [bx], 1
  jz L424
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 1
  jz L428
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L431
  push word [Temps+2]
  push word [bp+4]
  push word L436
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [Temps+10]
  push word [Temps+6]
  push word [Temps+2]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L454
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+12], ax
  mov si, [Temps+12]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L456: ; Function: (lam,t19)
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L455
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L457: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L458: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L457
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g24
  mov si, si
  jmp [bp]

L459: ; Arm: 284'7
  push word [bp+8]
  push word [CurrentCont]
  push word L458
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov si, g167
  jmp [bp]

L460: ; Continuation
  Bare_enter_check(0)
  mov si, g172
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L461: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L460
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g24
  mov si, si
  jmp [bp]

L462: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L461
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L463: ; Arm: 272'9
  push word g171
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g168
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+2]
  push word [CurrentCont]
  push word L462
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+4]
  jmp [bp]

L464: ; Arm: 277'35
  mov si, [bp+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L465: ; Continuation
  Bare_enter_check(16)
  push word [bp+6]
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word si
  push word [Temps+2]
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  mov si, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L466: ; Continuation
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 3
  jz L464
  push word [bp+10]
  push word [bp+8]
  push word [CurrentCont]
  push word L465
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L467: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L466
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L468: ; Function: (loop,t1)
  Bare_enter_check(24)
  mov bx, si
  cmp word [bx], 1
  jz L463
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
  push word [bp+8]
  push word [CurrentCont]
  push word L467
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov si, [Temps+6]
  jmp [bp]

L469: ; Continuation
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

L470: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L469
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L471: ; Function: (lam,t1)
  Bare_enter_check(20)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L468
  mov [Temps+2], sp
  push word 10 ;; scanned
  push word [Temps+2]
  push word [CurrentCont]
  push word L470
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov si, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L472: ; Function: (lam,t3)
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L471
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L473: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L474: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L473
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L475: ; Function: (lam,t1)
  Bare_enter_check(20)
  mov bx, si
  cmp word [bx], 1
  jz L459
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L472
  mov [Temps+6], sp
  push word 8 ;; scanned
  push word si
  push word [bp+8]
  push word [CurrentCont]
  push word L474
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g6
  mov si, [Temps+6]
  jmp [bp]

L476: ; Function: (lam,t22)
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L475
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L477: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L478: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L477
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g24
  mov si, si
  jmp [bp]

L479: ; Arm: 379'7
  push word [bp+4]
  push word [CurrentCont]
  push word L478
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov si, g179
  jmp [bp]

L480: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L481: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L480
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g24
  mov si, si
  jmp [bp]

L482: ; Arm: 382'12
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [bp+4]
  push word [CurrentCont]
  push word L481
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov si, g180
  jmp [bp]

L483: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L484: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L483
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g24
  mov si, si
  jmp [bp]

L485: ; Arm: 385'15
  push word [bp+6]
  push word [CurrentCont]
  push word L484
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov si, g189
  jmp [bp]

L486: ; Arm: 351'13
  mov si, g190
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L487: ; Continuation
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
  mov bp, [bp+6]
  mov si, [Temps+4]
  jmp [bp]

L488: ; Continuation
  Bare_enter_check(8)
  push word si
  push word `-`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, g24
  mov si, [Temps+2]
  jmp [bp]

L489: ; Arm: 119'11
  push word g200
  push word `0`
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  mov si, [Temps+8]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L490: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L491: ; Arm: 123'2
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
  push word L488
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L489
  push word [Temps+4]
  push word [CurrentCont]
  push word L490
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g199
  mov si, g201
  jmp [bp]

L492: ; Continuation
  Bare_enter_check(0)
  mov bp, g24
  mov si, si
  jmp [bp]

L493: ; Arm: 119'11
  push word g203
  push word `0`
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  mov si, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L494: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L495: ; Continuation
  Bare_enter_check(24)
  mov ax, [bp+8]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L487
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L491
  mov ax, [bp+8]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L492
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L493
  push word [bp+8]
  push word [CurrentCont]
  push word L494
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g202
  mov si, g204
  jmp [bp]

L496: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L495
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g24
  mov si, si
  jmp [bp]

L497: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L496
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov si, g198
  jmp [bp]

L498: ; Continuation
  Bare_enter_check(8)
  push word si
  push word `-`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, g24
  mov si, [Temps+2]
  jmp [bp]

L499: ; Arm: 119'11
  push word g193
  push word `0`
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  mov si, [Temps+8]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L500: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L501: ; Arm: 123'2
  mov ax, 1
  mov bx, [bp+6]
  sub ax, bx
  add ax, 1
  mov [Temps+4], ax
  mov ax, [Temps+4]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word [CurrentCont]
  push word L498
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L499
  push word [Temps+4]
  push word [CurrentCont]
  push word L500
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g192
  mov si, g194
  jmp [bp]

L502: ; Continuation
  Bare_enter_check(0)
  mov bp, g24
  mov si, si
  jmp [bp]

L503: ; Arm: 119'11
  push word g196
  push word `0`
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  mov si, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L504: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L505: ; Continuation
  Bare_enter_check(28)
  mov ax, [bp+6]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L497
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L501
  mov ax, [bp+6]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L502
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L503
  push word [bp+6]
  push word [CurrentCont]
  push word L504
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g195
  mov si, g197
  jmp [bp]

L506: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L505
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g24
  mov si, si
  jmp [bp]

L507: ; Continuation
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L506
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov si, g191
  jmp [bp]

L508: ; Function: (loop,t2)
  Bare_enter_check(12)
  mov ax, [bp+4]
  cmp word ax, si
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L486
  push word bp
  push word si
  push word [bp+2]
  push word [CurrentCont]
  push word L507
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g54
  mov si, si
  jmp [bp]

L509: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L510: ; Continuation
  Bare_enter_check(16)
  mov bx, si
  cmp word [bx], 1
  jz L485
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [bp+4]
  push word L508
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+6]
  push word [CurrentCont]
  push word L509
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [Temps+4]
  mov si, 1
  jmp [bp]

L511: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L510
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+8]
  jmp [bp]

L512: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L511
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g181
  mov si, 1
  jmp [bp]

L513: ; Function: (lam,t1)
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 1
  jz L479
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L482
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L512
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+2]
  mov si, [Temps+2]
  jmp [bp]

L514: ; Function: (lam,t25)
  Bare_enter_check(8)
  push word si
  push word [bp+2]
  push word L513
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L515: ; Continuation
  Bare_enter_check(326)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L279
  mov [Temps+2], sp
  push word 8 ;; scanned
  push word [Temps+2]
  push word g61
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [Temps+4]
  push word g60
  push word 1
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L303
  mov [Temps+8], sp
  push word 8 ;; scanned
  push word [Temps+8]
  push word g82
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [Temps+10]
  push word g81
  push word 1
  mov [Temps+12], sp
  push word 6 ;; scanned
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L345
  mov [Temps+14], sp
  push word 14 ;; scanned
  push word [Temps+14]
  push word g95
  push word 3
  mov [Temps+16], sp
  push word 6 ;; scanned
  push word [Temps+16]
  push word g94
  push word 1
  mov [Temps+18], sp
  push word 6 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L368
  mov [Temps+20], sp
  push word 8 ;; scanned
  push word [Temps+20]
  push word g108
  push word 3
  mov [Temps+22], sp
  push word 6 ;; scanned
  push word [Temps+22]
  push word g107
  push word 1
  mov [Temps+24], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word L384
  mov [Temps+26], sp
  push word 4 ;; scanned
  push word [Temps+26]
  push word g121
  push word 3
  mov [Temps+28], sp
  push word 6 ;; scanned
  push word [Temps+28]
  push word g120
  push word 1
  mov [Temps+30], sp
  push word 6 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L421
  mov [Temps+32], sp
  push word 8 ;; scanned
  push word [Temps+32]
  push word g127
  push word 3
  mov [Temps+34], sp
  push word 6 ;; scanned
  push word [Temps+34]
  push word g126
  push word 1
  mov [Temps+36], sp
  push word 6 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L456
  mov [Temps+38], sp
  push word 8 ;; scanned
  push word [Temps+38]
  push word g148
  push word 3
  mov [Temps+40], sp
  push word 6 ;; scanned
  push word [Temps+40]
  push word g147
  push word 1
  mov [Temps+42], sp
  push word 6 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L476
  mov [Temps+44], sp
  push word 8 ;; scanned
  push word [Temps+44]
  push word g166
  push word 3
  mov [Temps+46], sp
  push word 6 ;; scanned
  push word [Temps+46]
  push word g165
  push word 1
  mov [Temps+48], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word L514
  mov [Temps+50], sp
  push word 4 ;; scanned
  push word [Temps+50]
  push word g178
  push word 3
  mov [Temps+52], sp
  push word 6 ;; scanned
  push word [Temps+52]
  push word g177
  push word 1
  mov [Temps+54], sp
  push word 6 ;; scanned
  push word g218
  push word [Temps+54]
  push word 3
  mov [Temps+56], sp
  push word 6 ;; scanned
  push word [Temps+56]
  push word g176
  push word 3
  mov [Temps+58], sp
  push word 6 ;; scanned
  push word [Temps+58]
  push word [Temps+48]
  push word 3
  mov [Temps+60], sp
  push word 6 ;; scanned
  push word [Temps+60]
  push word [Temps+42]
  push word 3
  mov [Temps+62], sp
  push word 6 ;; scanned
  push word [Temps+62]
  push word [Temps+36]
  push word 3
  mov [Temps+64], sp
  push word 6 ;; scanned
  push word [Temps+64]
  push word [Temps+30]
  push word 3
  mov [Temps+66], sp
  push word 6 ;; scanned
  push word [Temps+66]
  push word [Temps+24]
  push word 3
  mov [Temps+68], sp
  push word 6 ;; scanned
  push word [Temps+68]
  push word [Temps+18]
  push word 3
  mov [Temps+70], sp
  push word 6 ;; scanned
  push word [Temps+70]
  push word [Temps+12]
  push word 3
  mov [Temps+72], sp
  push word 6 ;; scanned
  push word [Temps+72]
  push word [Temps+6]
  push word 3
  mov [Temps+74], sp
  push word 6 ;; scanned
  push word [Temps+74]
  push word g59
  push word 3
  mov [Temps+76], sp
  push word 6 ;; scanned
  push word [Temps+76]
  push word 1
  mov [Temps+78], sp
  push word 4 ;; scanned
  mov bp, [bp+16]
  mov si, [Temps+78]
  jmp [bp]

L516: ; Continuation
  Bare_enter_check(20)
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
  push word 18 ;; scanned
  mov bp, g24
  mov si, si
  jmp [bp]

L517: ; Continuation
  Bare_enter_check(40)
  push word [bp+6]
  push word L141
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L242
  mov [Temps+4], sp
  push word 12 ;; scanned
  push word [Temps+4]
  push word si
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L516
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, [bp+8]
  mov si, g55
  jmp [bp]

L518: ; Start
  Bare_enter_check(32)
  mov ax, g9
  mov [Temps+2], ax
  mov ax, g11
  mov [Temps+4], ax
  mov ax, g13
  mov [Temps+6], ax
  mov ax, g21
  mov [Temps+8], ax
  push word [Temps+6]
  push word [Temps+2]
  push word L124
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word g26
  push word `\x04`
  push word 3
  mov [Temps+12], sp
  push word 6 ;; scanned
  push word [Temps+10]
  push word [Temps+8]
  push word [Temps+6]
  push word [Temps+4]
  push word [Temps+2]
  push word [CurrentCont]
  push word L517
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, [Temps+2]
  mov si, [Temps+12]
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
  dw L34
g10:
  dw 1
g11:
  dw L42
g12:
  dw 1
g13:
  dw L48
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
  dw L58
g22:
  dw 1
  db ``
g23:
  dw 1
g24:
  dw L64
g25:
  dw 1
g26:
  dw 1
g27:
  dw 1
g28:
  dw 5
  db `% `
g29:
  dw 1
g30:
  dw 1
g31:
  dw 1
g32:
  dw 3
g33:
  dw 1
g34:
  dw 1
g35:
  dw 1
g36:
  dw 1
g37:
  dw 1
g38:
  dw 35
  db `command not found`
g39:
  dw 3
  db `\n`
g40:
  dw 1
g41:
  dw 5
  db `: `
g42:
  dw 1
g43:
  dw 1
g44:
  dw 13
  db `sham: `
g45:
  dw 1
g46:
  dw 35
  db `Permission denied`
g47:
  dw 3
  db `\n`
g48:
  dw 1
g49:
  dw 5
  db `: `
g50:
  dw 1
g51:
  dw 1
g52:
  dw 13
  db `sham: `
g53:
  dw 1
g54:
  dw L68
g55:
  dw 103
  db `Sham: In-memory file-system. Consider typing "ls".\n`
g56:
  dw 13
  db `readme`
g57:
  dw 165
  db `Welcome to sham; please try all the commands!\nCan you find the hidden Easter Egg?\n`
g58:
  dw 1, g57
g59:
  dw 1, g56, g58
g60:
  dw 7
  db `cat`
g61:
  dw 115
  db `cat - concatenate files and print on the standard output\n`
g62:
  dw 67
  db `cat: takes at least one argument\n`
g63:
  dw 1
g64:
  dw 11
  db `cat: `
g65:
  dw 59
  db ` : No such file or directory\n`
g66:
  dw 1
g67:
  dw 3, g65, g66
g68:
  dw 11
  db `cat: `
g69:
  dw 39
  db ` : Not a data file\n`
g70:
  dw 1
g71:
  dw 3, g69, g70
g72:
  dw 1
g73:
  dw 11
  db `cat: `
g74:
  dw 59
  db ` : No such file or directory\n`
g75:
  dw 1
g76:
  dw 3, g74, g75
g77:
  dw 11
  db `cat: `
g78:
  dw 39
  db ` : Not a data file\n`
g79:
  dw 1
g80:
  dw 3, g78, g79
g81:
  dw 5
  db `cp`
g82:
  dw 65
  db `cp - copy files and directories\n`
g83:
  dw 51
  db `cp: missing file operand\n`
g84:
  dw 89
  db `cp: missing destination file operand after '`
g85:
  dw 5
  db `'\n`
g86:
  dw 1
g87:
  dw 3, g85, g86
g88:
  dw 61
  db `cp: unexpected extra operands\n`
g89:
  dw 1
g90:
  dw 35
  db `cp: cannot stat '`
g91:
  dw 59
  db `': No such file or directory\n`
g92:
  dw 1
g93:
  dw 3, g91, g92
g94:
  dw 13
  db `create`
g95:
  dw 55
  db `create - create a new file\n`
g96:
  dw 53
  db `create: missing file name\n`
g97:
  dw 69
  db `create: unexpected extra operands\n`
g98:
  dw 69
  db `(to finish type ^D on a new line)\n`
g99:
  dw 1
g100:
  dw 1
g101:
  dw 3
g102:
  dw 1
g103:
  dw 1
g104:
  dw 3
  db `\n`
g105:
  dw 1
g106:
  dw 1
g107:
  dw 9
  db `file`
g108:
  dw 55
  db `file - determine file type\n`
g109:
  dw 69
  db `file: takes at least one argument\n`
g110:
  dw 1
g111:
  dw 59
  db ` : No such file or directory\n`
g112:
  dw 1
g113:
  dw 3, g111, g112
g114:
  dw 27
  db `: ASCII text\n`
g115:
  dw 1
g116:
  dw 3, g114, g115
g117:
  dw 27
  db `: executable\n`
g118:
  dw 1
g119:
  dw 3, g117, g118
g120:
  dw 5
  db `ls`
g121:
  dw 59
  db `ls - list directory contents\n`
g122:
  dw 47
  db `ls: takes no arguments\n`
g123:
  dw L69
g124:
  dw 1
g125:
  dw 1
g126:
  dw 7
  db `man`
g127:
  dw 103
  db `man - an interface to the system reference manuals\n`
g128:
  dw 61
  db `What manual page do you want?\n`
g129:
  dw 1
g130:
  dw 41
  db `No manual entry for `
g131:
  dw 3
  db `\n`
g132:
  dw 1
g133:
  dw 3, g131, g132
g134:
  dw 41
  db `No manual entry for `
g135:
  dw 3
  db `\n`
g136:
  dw 1
g137:
  dw 3, g135, g136
g138:
  dw 1
g139:
  dw 41
  db `No manual entry for `
g140:
  dw 3
  db `\n`
g141:
  dw 1
g142:
  dw 3, g140, g141
g143:
  dw 41
  db `No manual entry for `
g144:
  dw 3
  db `\n`
g145:
  dw 1
g146:
  dw 3, g144, g145
g147:
  dw 5
  db `mv`
g148:
  dw 51
  db `mv - move (rename) files\n`
g149:
  dw 51
  db `mv: missing file operand\n`
g150:
  dw 89
  db `mv: missing destination file operand after '`
g151:
  dw 5
  db `'\n`
g152:
  dw 1
g153:
  dw 3, g151, g152
g154:
  dw 61
  db `mv: unexpected extra operands\n`
g155:
  dw 1
g156:
  dw 35
  db `mv: cannot stat '`
g157:
  dw 59
  db `': No such file or directory\n`
g158:
  dw 1
g159:
  dw 3, g157, g158
g160:
  dw 39
  db `rm: cannot remove '`
g161:
  dw 59
  db `': No such file or directory\n`
g162:
  dw 1
g163:
  dw 3, g161, g162
g164:
  dw 1
g165:
  dw 5
  db `rm`
g166:
  dw 133
  db `rm - remove files or directories (directories not supported yet!)\n`
g167:
  dw 41
  db `rm: missing operand\n`
g168:
  dw 39
  db `rm: cannot remove '`
g169:
  dw 59
  db `': No such file or directory\n`
g170:
  dw 1
g171:
  dw 3, g169, g170
g172:
  dw 1
g173:
  dw 7
  db `cat`
g174:
  dw 439
  db `I have a little shadow that goes in and out with me,\nAnd what can be the use of him is more than I can see.\nHe is very, very like me from the heels up to the head;\nAnd I see him jump before me, when I jump into my bed.\n`
g175:
  dw 1, g174
g176:
  dw 1, g173, g175
g177:
  dw 7
  db `fib`
g178:
  dw 101
  db `fib - naive fib computation upto the given number\n`
g179:
  dw 45
  db `fib: missing argument\n`
g180:
  dw 69
  db `create: unexpected extra argument\n`
g181:
  dw L81
g182:
  dw 1
g183:
  dw 3
g184:
  dw 1
g185:
  dw 3
g186:
  dw 1
g187:
  dw 1
g188:
  dw 1
g189:
  dw 63
  db `fib: expected numeric argument\n`
g190:
  dw 1
g191:
  dw 9
  db `fib `
g192:
  dw L85
g193:
  dw 1
g194:
  dw 1
g195:
  dw L89
g196:
  dw 1
g197:
  dw 1
g198:
  dw 11
  db ` --> `
g199:
  dw L93
g200:
  dw 1
g201:
  dw 1
g202:
  dw L97
g203:
  dw 1
g204:
  dw 1
g205:
  dw 11
  db `space`
g206:
  dw 95
  db `space - where is the stack-pointer? (in words)\n`
g207:
  dw 1
g208:
  dw L101
g209:
  dw 1
g210:
  dw 1
g211:
  dw L105
g212:
  dw 1
g213:
  dw 1
g214:
  dw L115
g215:
  dw 3, g206, g214
g216:
  dw 1, g205, g215
g217:
  dw 1
g218:
  dw 3, g216, g217

bare_start: jmp L518
