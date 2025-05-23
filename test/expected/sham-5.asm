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

L30: ; Function: (loop,t1)
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
  Bare_enter_check(16)
  push word si
  push word L30
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L32
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [Temps+2]
  mov si, 1
  jmp [bp]

L34: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L33
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, si
  jmp Bare_make_bytes_jump

L35: ; Function: (implode,g9)
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L34
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g1
  mov si, si
  jmp [bp]

L36: ; Arm: 61'9
  mov si, g10
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L37: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L38: ; Function: (lam,t1)
  Bare_enter_check(8)
  mov bx, si
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
  mov bp, [bp+6]
  mov si, [Temps+8]
  jmp [bp]

L39: ; Function: (loop,t1)
  Bare_enter_check(10)
  push word bp
  push word si
  push word [bp+2]
  push word L38
  mov [Temps+2], sp
  push word 8 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L40: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L41: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L40
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L42: ; Continuation
  Bare_enter_check(16)
  push word si
  push word L39
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
  push word L41
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [Temps+2]
  mov si, [Temps+4]
  jmp [bp]

L43: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L42
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, si
  jmp Bare_make_bytes_jump

L44: ; Function: (rev_implode,g11)
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L43
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g1
  mov si, si
  jmp [bp]

L45: ; Arm: 69'13
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L46: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L47: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L45
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
  push word L46
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+6]
  jmp [bp]

L48: ; Function: (explode_loop,t1)
  Bare_enter_check(10)
  push word bp
  push word si
  push word [bp+2]
  push word L47
  mov [Temps+2], sp
  push word 8 ;; scanned
  mov si, [Temps+2]
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

L50: ; Function: (explode,g13)
  Bare_enter_check(14)
  push word si
  push word L48
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov bx, si
  mov ax, [bx]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [CurrentCont]
  push word L49
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [Temps+2]
  mov si, g12
  jmp [bp]

L51: ; Arm: 77'19
  mov si, g16
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L52: ; Arm: 79'15
  mov si, g17
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L53: ; Arm: 82'31
  mov si, g20
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L54: ; Continuation
  Bare_enter_check(0)
  mov bx, si
  cmp word [bx], 3
  jz L53
  mov ax, [bp+4]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  mov bp, [bp+6]
  mov si, [Temps+2]
  jmp [bp]

L55: ; Arm: 6'9
  mov si, g18
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L56: ; Function: (loop,t1)
  Bare_enter_check(10)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L52
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
  push word L54
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L55
  mov si, g19
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L57: ; Continuation
  Bare_enter_check(8)
  mov bx, si
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
  mov bp, [Temps+2]
  mov si, [Temps+4]
  jmp [bp]

L58: ; Arm: 6'9
  mov si, g14
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L59: ; Function: (lam,t1)
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
  push word L57
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L58
  mov si, g15
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L60: ; Function: (eq_string,g21)
  Bare_enter_check(6)
  push word si
  push word L59
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L61: ; Arm: 91'7
  mov si, g23
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L62: ; Continuation
  Bare_enter_check(0)
  mov bp, g9
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
  mov bp, g7
  mov si, g24
  jmp [bp]

L66: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L65
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g7
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
  mov bp, g13
  jmp [bp]

L68: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L67
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g13
  jmp [bp]

L69: ; Function: (concat,g22)
  Bare_enter_check(8)
  mov bx, si
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
  mov bp, g22
  mov si, [Temps+4]
  jmp [bp]

L70: ; Arm: 107'7
  mov si, g26
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L71: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, g25
  jmp [bp]

L72: ; Arm: 100'19
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov si, [Temps+10]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L73: ; Arm: 101'22
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov si, [Temps+12]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L74: ; Arm: 102'16
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+14], ax
  mov si, [Temps+14]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L75: ; Function: (put_chars,g25)
  Bare_enter_check(8)
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
  mov si, [Temps+22]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L76: ; Continuation
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

L77: ; Arm: 168'11
  push word [bp+2]
  push word [CurrentCont]
  push word L76
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g11
  jmp [bp]

L78: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L79: ; Continuation
  Bare_enter_check(16)
  push word [bp+4]
  push word si
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+6]
  push word [CurrentCont]
  push word L78
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g28
  mov si, [Temps+2]
  jmp [bp]

L80: ; Arm: 170'26
  push word [Temps+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L79
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+4]
  mov bp, g11
  jmp [bp]

L81: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L82: ; Continuation
  Bare_enter_check(16)
  push word [bp+4]
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word [CurrentCont]
  push word L81
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L83: ; Function: (lam,t1)
  Bare_enter_check(12)
  mov bx, si
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
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+4]
  push word [CurrentCont]
  push word L82
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+2]
  mov bp, g29
  jmp [bp]

L84: ; Function: (lam,t1)
  Bare_enter_check(8)
  push word si
  push word [bp+2]
  push word L83
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L85: ; Function: (have_letter,g29)
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

L86: ; Arm: 175'9
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L87: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L88: ; Arm: 177'24
  push word [Temps+4]
  push word [CurrentCont]
  push word L87
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+2]
  mov bp, g28
  jmp [bp]

L89: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L90: ; Continuation
  Bare_enter_check(16)
  push word g30
  push word [bp+4]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+6]
  push word [CurrentCont]
  push word L89
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L91: ; Function: (lam,t1)
  Bare_enter_check(10)
  mov bx, si
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
  push word [Temps+4]
  push word [Temps+2]
  push word [CurrentCont]
  push word L90
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+2]
  mov bp, g29
  jmp [bp]

L92: ; Function: (at_word_start,g28)
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

L93: ; Arm: 144'22
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov bp, g11
  mov si, si
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
  push word si
  push word `\x04`
  push word 3
  mov [Temps+16], sp
  push word 6 ;; scanned
  mov bp, g11
  mov si, [Temps+16]
  jmp [bp]

L95: ; Arm: 146'19
  mov bp, g34
  mov si, si
  jmp [bp]

L96: ; Arm: 149'17
  mov bp, g34
  mov si, si
  jmp [bp]

L97: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
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
  mov si, [Temps+12]
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
  mov si, [Temps+20]
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
  mov si, [Temps+22]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L101: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L97
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, si
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
  mov si, [Temps+10]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L102: ; Arm: 6'9
  mov si, g36
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L103: ; Arm: 147'21
  mov bx, si
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
  mov si, g37
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L104: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, g34
  mov si, [Temps+2]
  jmp [bp]

L105: ; Arm: 100'19
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+18], ax
  mov si, [Temps+18]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L106: ; Arm: 101'22
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+20], ax
  mov si, [Temps+20]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L107: ; Arm: 102'16
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+22], ax
  mov si, [Temps+22]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L108: ; Function: (readloop,g34)
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
  push word si
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
  mov si, [Temps+30]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L109: ; Arm: 231'36
  mov si, g39
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L110: ; Continuation
  Bare_enter_check(0)
  mov bp, g31
  mov si, si
  jmp [bp]

L111: ; Arm: 223'7
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L112: ; Arm: 194'9
  mov si, g42
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L113: ; Arm: 198'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L114: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L113
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L115: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L114
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L116: ; Function: (loop,t3)
  Bare_enter_check(14)
  mov bx, si
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
  mov bp, g21
  mov si, [Temps+6]
  jmp [bp]

L117: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L118: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L117
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L119: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L118
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, si
  jmp [bp]

L120: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L119
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g9
  mov si, si
  jmp [bp]

L121: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L120
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L122: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L121
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+8]
  jmp [bp]

L123: ; Continuation
  Bare_enter_check(12)
  push word [bp+6]
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L122
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g7
  mov si, g50
  jmp [bp]

L124: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L123
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g7
  mov si, si
  jmp [bp]

L125: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L124
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+6]
  mov bp, g13
  jmp [bp]

L126: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L125
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g13
  mov si, g49
  jmp [bp]

L127: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L126
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g9
  mov si, si
  jmp [bp]

L128: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L127
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L129: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L128
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+8]
  jmp [bp]

L130: ; Continuation
  Bare_enter_check(12)
  push word [bp+6]
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L129
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g7
  mov si, g48
  jmp [bp]

L131: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L130
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g7
  mov si, si
  jmp [bp]

L132: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L131
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+6]
  mov bp, g13
  jmp [bp]

L133: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L132
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+6]
  mov bp, g13
  jmp [bp]

L134: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L133
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g9
  mov si, si
  jmp [bp]

L135: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L134
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L136: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L135
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+10]
  jmp [bp]

L137: ; Continuation
  Bare_enter_check(14)
  push word [bp+8]
  push word [bp+6]
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L136
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g7
  mov si, g47
  jmp [bp]

L138: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L137
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g7
  mov si, si
  jmp [bp]

L139: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L138
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+8]
  mov bp, g13
  jmp [bp]

L140: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L139
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g13
  mov si, g46
  jmp [bp]

L141: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L140
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g9
  mov si, si
  jmp [bp]

L142: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L141
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L143: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L142
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+10]
  jmp [bp]

L144: ; Continuation
  Bare_enter_check(14)
  push word [bp+8]
  push word [bp+6]
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L143
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g7
  mov si, g45
  jmp [bp]

L145: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L144
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g7
  mov si, si
  jmp [bp]

L146: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L145
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g13
  mov si, g44
  jmp [bp]

L147: ; Arm: 215'9
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L146
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g13
  mov si, g43
  jmp [bp]

L148: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L149: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L148
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L150: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L149
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, si
  jmp [bp]

L151: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L150
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g9
  mov si, si
  jmp [bp]

L152: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L151
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L153: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L152
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+8]
  jmp [bp]

L154: ; Continuation
  Bare_enter_check(12)
  push word [bp+6]
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L153
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g7
  mov si, g58
  jmp [bp]

L155: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L154
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g7
  mov si, si
  jmp [bp]

L156: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L155
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+6]
  mov bp, g13
  jmp [bp]

L157: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L156
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g13
  mov si, g57
  jmp [bp]

L158: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L157
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g9
  mov si, si
  jmp [bp]

L159: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L158
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L160: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L159
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+8]
  jmp [bp]

L161: ; Continuation
  Bare_enter_check(12)
  push word [bp+6]
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L160
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g7
  mov si, g56
  jmp [bp]

L162: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L161
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g7
  mov si, si
  jmp [bp]

L163: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L162
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+6]
  mov bp, g13
  jmp [bp]

L164: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L163
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+6]
  mov bp, g13
  jmp [bp]

L165: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L164
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g9
  mov si, si
  jmp [bp]

L166: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L165
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L167: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L166
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+10]
  jmp [bp]

L168: ; Continuation
  Bare_enter_check(14)
  push word [bp+8]
  push word [bp+6]
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L167
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g7
  mov si, g55
  jmp [bp]

L169: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L168
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g7
  mov si, si
  jmp [bp]

L170: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L169
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+8]
  mov bp, g13
  jmp [bp]

L171: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L170
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g13
  mov si, g54
  jmp [bp]

L172: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L171
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g9
  mov si, si
  jmp [bp]

L173: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L172
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L174: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L173
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+10]
  jmp [bp]

L175: ; Continuation
  Bare_enter_check(14)
  push word [bp+8]
  push word [bp+6]
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L174
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g7
  mov si, g53
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
  mov bp, g7
  mov si, si
  jmp [bp]

L177: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L176
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g13
  mov si, g52
  jmp [bp]

L178: ; Arm: 218'14
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L177
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g13
  mov si, g51
  jmp [bp]

L179: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L180: ; Continuation
  Bare_enter_check(10)
  mov bx, si
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
  mov si, [bp+4]
  mov bp, [Temps+6]
  jmp [bp]

L181: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L180
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov si, si
  jmp [bp]

L182: ; Continuation
  Bare_enter_check(26)
  push word [CurrentCont]
  push word L110
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, si
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
  push word [Temps+6]
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+4]
  push word [CurrentCont]
  push word L181
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov si, [Temps+8]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L183: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L182
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L184: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L183
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g7
  mov si, g41
  jmp [bp]

L185: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L184
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L186: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L185
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+6]
  mov bp, g13
  jmp [bp]

L187: ; Continuation
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 3
  jz L109
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L186
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g28
  mov si, g40
  jmp [bp]

L188: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L187
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L189: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L188
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g21
  mov si, si
  jmp [bp]

L190: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L189
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g34
  mov si, g38
  jmp [bp]

L191: ; Continuation
  Bare_enter_check(16)
  push word g33
  push word `\x04`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L190
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g9
  mov si, [Temps+2]
  jmp [bp]

L192: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L191
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L193: ; Function: (mainloop,g31)
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L192
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, g32
  jmp [bp]

L194: ; Arm: 347'11
  mov si, si
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L195: ; Continuation
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

L196: ; Continuation
  Bare_enter_check(8)
  mov ax, [bp+4]
  mov bx, 5
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  push word si
  push word [CurrentCont]
  push word L195
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g59
  mov si, [Temps+2]
  jmp [bp]

L197: ; Function: (fib,g59)
  Bare_enter_check(8)
  mov ax, si
  cmp word ax, 5
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L194
  mov ax, si
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+4], ax
  push word si
  push word [CurrentCont]
  push word L196
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g59
  mov si, [Temps+4]
  jmp [bp]

L198: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L199: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L198
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L200: ; Arm: 252'7
  push word [bp+2]
  push word [CurrentCont]
  push word L199
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, g67
  jmp [bp]

L201: ; Arm: 194'9
  mov si, g68
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L202: ; Arm: 198'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L203: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L202
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L204: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L203
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L205: ; Function: (loop,t3)
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L201
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
  push word L204
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g21
  mov si, [Temps+6]
  jmp [bp]

L206: ; Arm: 194'9
  mov si, g77
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L207: ; Arm: 198'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L208: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L207
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L209: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L208
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L210: ; Function: (loop,t1)
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L206
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
  push word L209
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g21
  mov si, [Temps+6]
  jmp [bp]

L211: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L212: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L211
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g13
  mov si, si
  jmp [bp]

L213: ; Arm: 245'11
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
  push word L212
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, [Temps+4]
  jmp [bp]

L214: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L215: ; Arm: 248'16
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L214
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g13
  mov si, [Temps+4]
  jmp [bp]

L216: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L217: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L216
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g13
  mov si, si
  jmp [bp]

L218: ; Continuation
  Bare_enter_check(22)
  mov bx, si
  cmp word [bx], 1
  jz L213
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L215
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
  push word L217
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, [Temps+10]
  jmp [bp]

L219: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L218
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L220: ; Function: (lam,t1)
  Bare_enter_check(16)
  push word si
  push word L210
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word si
  push word [CurrentCont]
  push word L219
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [bp+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov si, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L221: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L222: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L221
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L223: ; Continuation
  Bare_enter_check(16)
  push word [bp+4]
  push word L220
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L222
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g4
  mov si, [Temps+2]
  jmp [bp]

L224: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L225: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L224
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g13
  mov si, si
  jmp [bp]

L226: ; Arm: 245'11
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
  push word L225
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, [Temps+4]
  jmp [bp]

L227: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L228: ; Arm: 248'16
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L227
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g13
  mov si, [Temps+4]
  jmp [bp]

L229: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L230: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L229
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g13
  mov si, si
  jmp [bp]

L231: ; Continuation
  Bare_enter_check(32)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L223
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 1
  jz L226
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L228
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
  push word L230
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, [Temps+10]
  jmp [bp]

L232: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L231
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov si, si
  jmp [bp]

L233: ; Function: (lam,t1)
  Bare_enter_check(20)
  mov bx, si
  cmp word [bx], 1
  jz L200
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+2]
  push word L205
  mov [Temps+6], sp
  push word 4 ;; scanned
  push word [Temps+6]
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+2]
  push word [CurrentCont]
  push word L232
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, [bp+2]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov si, [Temps+8]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L234: ; Function: (lam,g86)
  Bare_enter_check(6)
  push word si
  push word L233
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L235: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L236: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L235
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L237: ; Arm: 289'7
  push word [bp+2]
  push word [CurrentCont]
  push word L236
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, g91
  jmp [bp]

L238: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L239: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L238
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L240: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L239
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, si
  jmp [bp]

L241: ; Arm: 292'10
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
  push word L240
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g22
  mov si, [Temps+8]
  jmp [bp]

L242: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L243: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L242
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L244: ; Arm: 295'12
  mov ax, [bx+2]
  mov [Temps+10], ax
  mov ax, [bx+4]
  mov [Temps+12], ax
  push word [bp+2]
  push word [CurrentCont]
  push word L243
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, g96
  jmp [bp]

L245: ; Arm: 194'9
  mov si, g97
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L246: ; Arm: 198'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L247: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L246
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L248: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L247
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L249: ; Function: (loop,t5)
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L245
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
  push word L248
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g21
  mov si, [Temps+6]
  jmp [bp]

L250: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L251: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L250
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L252: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L251
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, si
  jmp [bp]

L253: ; Arm: 298'15
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
  push word L252
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g22
  mov si, [Temps+4]
  jmp [bp]

L254: ; Continuation
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

L255: ; Continuation
  Bare_enter_check(24)
  mov bx, si
  cmp word [bx], 1
  jz L253
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [bp+8]
  push word [CurrentCont]
  push word L254
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov si, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L256: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L255
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov si, si
  jmp [bp]

L257: ; Function: (lam,t1)
  Bare_enter_check(24)
  mov bx, si
  cmp word [bx], 1
  jz L237
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 1
  jz L241
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L244
  push word [Temps+2]
  push word L249
  mov [Temps+10], sp
  push word 4 ;; scanned
  push word [Temps+10]
  push word [Temps+6]
  push word [Temps+2]
  push word [bp+2]
  push word [CurrentCont]
  push word L256
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, [bp+2]
  mov ax, [bx+2]
  mov [Temps+12], ax
  mov si, [Temps+12]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L258: ; Function: (lam,g102)
  Bare_enter_check(6)
  push word si
  push word L257
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L259: ; Arm: 144'22
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov bp, g11
  mov si, si
  jmp [bp]

L260: ; Arm: 145'28
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
  mov bp, g11
  mov si, [Temps+16]
  jmp [bp]

L261: ; Arm: 146'19
  mov bp, g110
  mov si, si
  jmp [bp]

L262: ; Arm: 149'17
  mov bp, g110
  mov si, si
  jmp [bp]

L263: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, g110
  jmp [bp]

L264: ; Arm: 153'28
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

L265: ; Arm: 154'29
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

L266: ; Arm: 155'32
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

L267: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L263
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L264
  mov ax, [bp+6]
  cmp word ax, 65
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L265
  mov ax, 253
  cmp word ax, [bp+6]
  call Bare_make_bool_from_n
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L266
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

L268: ; Arm: 6'9
  mov si, g112
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L269: ; Arm: 147'21
  mov bx, si
  cmp word [bx], 1
  jz L262
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
  push word L267
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+20]
  cmp word [bx], 3
  jz L268
  mov si, g113
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L270: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, g110
  mov si, [Temps+2]
  jmp [bp]

L271: ; Arm: 100'19
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+18], ax
  mov si, [Temps+18]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L272: ; Arm: 101'22
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+20], ax
  mov si, [Temps+20]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L273: ; Arm: 102'16
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+22], ax
  mov si, [Temps+22]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L274: ; Function: (readloop,g110)
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
  jz L259
  mov ax, [Temps+2]
  cmp word ax, `\x04`
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L260
  mov ax, 255
  cmp word ax, [Temps+4]
  call Bare_make_bool_from_n
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L261
  mov ax, [Temps+4]
  cmp word ax, 255
  call Bare_make_bool_from_z
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L269
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
  push word L270
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+16]
  cmp word [bx], 3
  jz L271
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+18], ax
  mov bx, [Temps+18]
  cmp word [bx], 3
  jz L272
  mov ax, 53
  cmp word ax, [Temps+14]
  call Bare_make_bool_from_n
  mov [Temps+20], ax
  mov bx, [Temps+20]
  cmp word [bx], 3
  jz L273
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

L275: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L276: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L275
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L277: ; Arm: 327'7
  push word [bp+2]
  push word [CurrentCont]
  push word L276
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, g121
  jmp [bp]

L278: ; Arm: 194'9
  mov si, g122
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L279: ; Arm: 198'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L280: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L279
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L281: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L280
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L282: ; Function: (loop,t1)
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L278
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
  push word L281
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g21
  mov si, [Temps+6]
  jmp [bp]

L283: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L284: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L283
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g13
  mov si, si
  jmp [bp]

L285: ; Arm: 320'11
  push word g125
  push word [bp+4]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L284
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, [Temps+2]
  jmp [bp]

L286: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L287: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L286
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g13
  mov si, si
  jmp [bp]

L288: ; Arm: 323'16
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word g128
  push word [bp+4]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L287
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, [Temps+6]
  jmp [bp]

L289: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L290: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L289
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g13
  mov si, si
  jmp [bp]

L291: ; Continuation
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L285
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L288
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
  push word L290
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, [Temps+8]
  jmp [bp]

L292: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L291
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L293: ; Function: (lam,t3)
  Bare_enter_check(16)
  push word si
  push word L282
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word si
  push word [CurrentCont]
  push word L292
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [bp+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov si, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L294: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L295: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L294
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L296: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov bx, si
  cmp word [bx], 1
  jz L277
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [bp+2]
  push word L293
  mov [Temps+6], sp
  push word 4 ;; scanned
  push word si
  push word [bp+2]
  push word [CurrentCont]
  push word L295
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g4
  mov si, [Temps+6]
  jmp [bp]

L297: ; Function: (lam,g132)
  Bare_enter_check(6)
  push word si
  push word L296
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L298: ; Function: (lam,g138)
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

L299: ; Arm: 205'9
  mov si, g140
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L300: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, g139
  jmp [bp]

L301: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L300
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L302: ; Function: (loop,g139)
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 1
  jz L299
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
  push word L301
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, [Temps+2]
  jmp [bp]

L303: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L304: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L303
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L305: ; Arm: 237'9
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [bp+2]
  push word [CurrentCont]
  push word L304
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, g137
  jmp [bp]

L306: ; Continuation
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

L307: ; Arm: 209'9
  mov si, g141
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L308: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, g139
  jmp [bp]

L309: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L308
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L310: ; Continuation
  Bare_enter_check(16)
  push word [bp+4]
  push word [CurrentCont]
  push word L306
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, si
  cmp word [bx], 1
  jz L307
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [CurrentCont]
  push word L309
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, [Temps+2]
  jmp [bp]

L311: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L310
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L312: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L311
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

L313: ; Function: (lam,t1)
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 3
  jz L305
  push word [bp+2]
  push word [CurrentCont]
  push word L312
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g2
  mov si, g138
  jmp [bp]

L314: ; Function: (lam,g142)
  Bare_enter_check(6)
  push word si
  push word L313
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L315: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L316: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L315
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L317: ; Arm: 266'7
  push word [bp+2]
  push word [CurrentCont]
  push word L316
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, g147
  jmp [bp]

L318: ; Arm: 194'9
  mov si, g148
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L319: ; Arm: 198'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L320: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L319
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L321: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L320
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L322: ; Function: (loop,t3)
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L318
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
  push word L321
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g21
  mov si, [Temps+6]
  jmp [bp]

L323: ; Arm: 194'9
  mov si, g157
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L324: ; Arm: 198'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L325: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L324
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L326: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L325
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L327: ; Function: (loop,t1)
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L323
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
  push word L326
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g21
  mov si, [Temps+6]
  jmp [bp]

L328: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L329: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L328
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g13
  mov si, si
  jmp [bp]

L330: ; Arm: 259'11
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
  push word L329
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, [Temps+4]
  jmp [bp]

L331: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L332: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L331
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g13
  mov si, si
  jmp [bp]

L333: ; Arm: 262'16
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
  push word L332
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, [Temps+8]
  jmp [bp]

L334: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L335: ; Continuation
  Bare_enter_check(22)
  mov bx, si
  cmp word [bx], 1
  jz L330
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L333
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [CurrentCont]
  push word L334
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g13
  mov si, [Temps+4]
  jmp [bp]

L336: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L335
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L337: ; Function: (lam,t1)
  Bare_enter_check(16)
  push word si
  push word L327
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word si
  push word [CurrentCont]
  push word L336
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [bp+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov si, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L338: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L339: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L338
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L340: ; Continuation
  Bare_enter_check(16)
  push word [bp+4]
  push word L337
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L339
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g4
  mov si, [Temps+2]
  jmp [bp]

L341: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L342: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L341
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g13
  mov si, si
  jmp [bp]

L343: ; Arm: 259'11
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
  push word L342
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, [Temps+4]
  jmp [bp]

L344: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L345: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L344
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g13
  mov si, si
  jmp [bp]

L346: ; Arm: 262'16
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
  push word L345
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, [Temps+8]
  jmp [bp]

L347: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L348: ; Continuation
  Bare_enter_check(32)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L340
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 1
  jz L343
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L346
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [CurrentCont]
  push word L347
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g13
  mov si, [Temps+4]
  jmp [bp]

L349: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L348
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov si, si
  jmp [bp]

L350: ; Function: (lam,t1)
  Bare_enter_check(20)
  mov bx, si
  cmp word [bx], 1
  jz L317
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+2]
  push word L322
  mov [Temps+6], sp
  push word 4 ;; scanned
  push word [Temps+6]
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+2]
  push word [CurrentCont]
  push word L349
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, [bp+2]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov si, [Temps+8]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L351: ; Function: (lam,g166)
  Bare_enter_check(6)
  push word si
  push word L350
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L352: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L353: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L352
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L354: ; Arm: 304'7
  push word [bp+2]
  push word [CurrentCont]
  push word L353
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, g171
  jmp [bp]

L355: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L356: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L355
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L357: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L356
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, si
  jmp [bp]

L358: ; Arm: 307'10
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
  push word L357
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g22
  mov si, [Temps+8]
  jmp [bp]

L359: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L360: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L359
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L361: ; Arm: 310'12
  mov ax, [bx+2]
  mov [Temps+10], ax
  mov ax, [bx+4]
  mov [Temps+12], ax
  push word [bp+2]
  push word [CurrentCont]
  push word L360
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, g176
  jmp [bp]

L362: ; Arm: 194'9
  mov si, g177
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L363: ; Arm: 198'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L364: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L363
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L365: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L364
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L366: ; Function: (loop,t5)
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L362
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
  push word L365
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g21
  mov si, [Temps+6]
  jmp [bp]

L367: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L368: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L367
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L369: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L368
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, si
  jmp [bp]

L370: ; Arm: 313'15
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
  push word L369
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g22
  mov si, [Temps+4]
  jmp [bp]

L371: ; Continuation
  Bare_enter_check(0)
  mov si, g186
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L372: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L371
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L373: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L372
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g13
  mov si, si
  jmp [bp]

L374: ; Arm: 272'9
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
  push word L373
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, [Temps+4]
  jmp [bp]

L375: ; Arm: 277'35
  mov si, [bp+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L376: ; Continuation
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

L377: ; Continuation
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 3
  jz L375
  push word [bp+10]
  push word [bp+8]
  push word [CurrentCont]
  push word L376
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L378: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L377
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L379: ; Function: (loop,t2)
  Bare_enter_check(22)
  mov bx, si
  cmp word [bx], 1
  jz L374
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
  push word L378
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g21
  mov si, [Temps+6]
  jmp [bp]

L380: ; Continuation
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

L381: ; Continuation
  Bare_enter_check(16)
  push word si
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L380
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

L382: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L381
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L383: ; Continuation
  Bare_enter_check(24)
  mov bx, si
  cmp word [bx], 1
  jz L370
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [bp+6]
  push word L379
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+8]
  push word [CurrentCont]
  push word L382
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov si, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L384: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L383
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov si, si
  jmp [bp]

L385: ; Function: (lam,t1)
  Bare_enter_check(24)
  mov bx, si
  cmp word [bx], 1
  jz L354
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 1
  jz L358
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L361
  push word [Temps+2]
  push word L366
  mov [Temps+10], sp
  push word 4 ;; scanned
  push word [Temps+10]
  push word [Temps+6]
  push word [Temps+2]
  push word [bp+2]
  push word [CurrentCont]
  push word L384
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, [bp+2]
  mov ax, [bx+2]
  mov [Temps+12], ax
  mov si, [Temps+12]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L386: ; Function: (lam,g187)
  Bare_enter_check(6)
  push word si
  push word L385
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L387: ; Continuation
  Bare_enter_check(0)
  mov si, g197
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L388: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L387
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L389: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L388
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g13
  mov si, si
  jmp [bp]

L390: ; Arm: 272'9
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
  push word L389
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, [Temps+4]
  jmp [bp]

L391: ; Arm: 277'35
  mov si, [bp+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L392: ; Continuation
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

L393: ; Continuation
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 3
  jz L391
  push word [bp+10]
  push word [bp+8]
  push word [CurrentCont]
  push word L392
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L394: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L393
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L395: ; Function: (loop,t1)
  Bare_enter_check(22)
  mov bx, si
  cmp word [bx], 1
  jz L390
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
  push word L394
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g21
  mov si, [Temps+6]
  jmp [bp]

L396: ; Continuation
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

L397: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L396
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L398: ; Function: (lam,t1)
  Bare_enter_check(14)
  push word si
  push word L395
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word [CurrentCont]
  push word L397
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [bp+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov si, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L399: ; Function: (lam,g198)
  Bare_enter_check(6)
  push word si
  push word L398
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L400: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L401: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L400
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L402: ; Arm: 284'7
  push word [bp+2]
  push word [CurrentCont]
  push word L401
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, g192
  jmp [bp]

L403: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L404: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L403
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L405: ; Function: (lam,t1)
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 1
  jz L402
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word si
  push word [bp+2]
  push word [CurrentCont]
  push word L404
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g6
  mov si, g198
  jmp [bp]

L406: ; Function: (lam,g199)
  Bare_enter_check(6)
  push word si
  push word L405
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L407: ; Arm: 369'9
  push word [bp+2]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L408: ; Arm: 372'15
  mov si, g217
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L409: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L410: ; Continuation
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 1
  jz L408
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
  push word L409
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g210
  mov si, [Temps+6]
  jmp [bp]

L411: ; Arm: 364'27
  push word [bp+4]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L412: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L411
  mov si, g215
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L413: ; Arm: 6'9
  mov si, g213
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L414: ; Arm: 364'12
  mov ax, 19
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+8]
  push word [CurrentCont]
  push word L412
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L413
  mov si, g214
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L415: ; Continuation
  Bare_enter_check(18)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L410
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L414
  mov si, g216
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L416: ; Arm: 6'9
  mov si, g211
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L417: ; Function: (lam,t1)
  Bare_enter_check(12)
  mov bx, si
  cmp word [bx], 1
  jz L407
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
  push word L415
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L416
  mov si, g212
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L418: ; Function: (loop,g210)
  Bare_enter_check(6)
  push word si
  push word L417
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L419: ; Arm: 116'13
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L420: ; Continuation
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

L421: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L419
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
  push word L420
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g221
  mov si, [Temps+10]
  jmp [bp]

L422: ; Function: (loop,g221)
  Bare_enter_check(6)
  push word si
  push word L421
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L423: ; Arm: 116'13
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L424: ; Continuation
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

L425: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L423
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
  push word L424
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g224
  mov si, [Temps+10]
  jmp [bp]

L426: ; Function: (loop,g224)
  Bare_enter_check(6)
  push word si
  push word L425
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L427: ; Arm: 116'13
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L428: ; Continuation
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

L429: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L427
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
  push word L428
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g228
  mov si, [Temps+10]
  jmp [bp]

L430: ; Function: (loop,g228)
  Bare_enter_check(6)
  push word si
  push word L429
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L431: ; Arm: 116'13
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L432: ; Continuation
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

L433: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L431
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
  push word L432
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g231
  mov si, [Temps+10]
  jmp [bp]

L434: ; Function: (loop,g231)
  Bare_enter_check(6)
  push word si
  push word L433
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L435: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L436: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L435
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L437: ; Arm: 379'7
  push word [bp+2]
  push word [CurrentCont]
  push word L436
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, g208
  jmp [bp]

L438: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L439: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L438
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L440: ; Arm: 382'12
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [bp+2]
  push word [CurrentCont]
  push word L439
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, g209
  jmp [bp]

L441: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L442: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L441
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L443: ; Arm: 385'15
  push word [bp+4]
  push word [CurrentCont]
  push word L442
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, g218
  jmp [bp]

L444: ; Arm: 351'13
  mov si, g219
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L445: ; Continuation
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

L446: ; Continuation
  Bare_enter_check(8)
  push word si
  push word `-`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, [Temps+2]
  jmp [bp]

L447: ; Arm: 119'11
  push word g229
  push word `0`
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  mov si, [Temps+8]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L448: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L449: ; Arm: 123'2
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
  push word L446
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L447
  push word [Temps+4]
  push word [CurrentCont]
  push word L448
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g228
  mov si, g230
  jmp [bp]

L450: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L451: ; Arm: 119'11
  push word g232
  push word `0`
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  mov si, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L452: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L453: ; Continuation
  Bare_enter_check(24)
  mov ax, [bp+8]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L445
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L449
  mov ax, [bp+8]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L450
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L451
  push word [bp+8]
  push word [CurrentCont]
  push word L452
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g231
  mov si, g233
  jmp [bp]

L454: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L453
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L455: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L454
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g13
  mov si, g227
  jmp [bp]

L456: ; Continuation
  Bare_enter_check(8)
  push word si
  push word `-`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, [Temps+2]
  jmp [bp]

L457: ; Arm: 119'11
  push word g222
  push word `0`
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  mov si, [Temps+8]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L458: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L459: ; Arm: 123'2
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
  push word L456
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L457
  push word [Temps+4]
  push word [CurrentCont]
  push word L458
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g221
  mov si, g223
  jmp [bp]

L460: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L461: ; Arm: 119'11
  push word g225
  push word `0`
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  mov si, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L462: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L463: ; Continuation
  Bare_enter_check(26)
  mov ax, [bp+4]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L455
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L459
  mov ax, [bp+4]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L460
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L461
  push word [bp+4]
  push word [CurrentCont]
  push word L462
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g224
  mov si, g226
  jmp [bp]

L464: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L463
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L465: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L464
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g13
  mov si, g220
  jmp [bp]

L466: ; Function: (loop,t2)
  Bare_enter_check(10)
  mov ax, [bp+2]
  cmp word ax, si
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L444
  push word bp
  push word si
  push word [CurrentCont]
  push word L465
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g59
  mov si, si
  jmp [bp]

L467: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L468: ; Continuation
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L443
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word L466
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L467
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [Temps+4]
  mov si, 1
  jmp [bp]

L469: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L468
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L470: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L469
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g210
  mov si, 1
  jmp [bp]

L471: ; Function: (lam,t1)
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 1
  jz L437
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L440
  push word [bp+2]
  push word [CurrentCont]
  push word L470
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, [Temps+2]
  jmp [bp]

L472: ; Function: (lam,g234)
  Bare_enter_check(6)
  push word si
  push word L471
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L473: ; Arm: 116'13
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L474: ; Continuation
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

L475: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L473
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
  push word L474
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g240
  mov si, [Temps+10]
  jmp [bp]

L476: ; Function: (loop,g240)
  Bare_enter_check(6)
  push word si
  push word L475
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L477: ; Arm: 116'13
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L478: ; Continuation
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

L479: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L477
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
  push word L478
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g243
  mov si, [Temps+10]
  jmp [bp]

L480: ; Function: (loop,g243)
  Bare_enter_check(6)
  push word si
  push word L479
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L481: ; Continuation
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

L482: ; Continuation
  Bare_enter_check(8)
  push word si
  push word `-`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, [Temps+2]
  jmp [bp]

L483: ; Arm: 119'11
  push word g241
  push word `0`
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  mov si, [Temps+10]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L484: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L485: ; Arm: 123'2
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
  push word L482
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L483
  push word [Temps+6]
  push word [CurrentCont]
  push word L484
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g240
  mov si, g242
  jmp [bp]

L486: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L487: ; Arm: 119'11
  push word g244
  push word `0`
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  mov si, [Temps+8]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L488: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L489: ; Function: (lam,t1)
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
  push word L481
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L485
  mov ax, [Temps+2]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word [CurrentCont]
  push word L486
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L487
  push word [Temps+2]
  push word [CurrentCont]
  push word L488
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g243
  mov si, g245
  jmp [bp]

L490: ; Function: (lam,g246)
  Bare_enter_check(6)
  push word si
  push word L489
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L491: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L492: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L491
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L493: ; Arm: 332'7
  push word [bp+4]
  push word [CurrentCont]
  push word L492
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, g107
  jmp [bp]

L494: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L495: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L494
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L496: ; Arm: 335'12
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [bp+4]
  push word [CurrentCont]
  push word L495
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, g108
  jmp [bp]

L497: ; Continuation
  Bare_enter_check(0)
  mov bp, g22
  mov si, si
  jmp [bp]

L498: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L497
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L499: ; Arm: 340'44
  push word [bp+4]
  push word [CurrentCont]
  push word L498
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g7
  mov si, g115
  jmp [bp]

L500: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word si
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+2]
  jmp [bp]

L501: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L500
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g9
  mov si, si
  jmp [bp]

L502: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L501
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L503: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L502
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+10]
  jmp [bp]

L504: ; Continuation
  Bare_enter_check(14)
  push word [bp+8]
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L503
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g7
  mov si, g117
  jmp [bp]

L505: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L504
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g7
  mov si, si
  jmp [bp]

L506: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L505
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g13
  mov si, g116
  jmp [bp]

L507: ; Continuation
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 3
  jz L499
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L506
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+8]
  mov bp, g13
  jmp [bp]

L508: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L507
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L509: ; Continuation
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L508
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g21
  mov si, si
  jmp [bp]

L510: ; Function: (loop,t1)
  Bare_enter_check(12)
  push word bp
  push word si
  push word [bp+2]
  push word [CurrentCont]
  push word L509
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g110
  mov si, g114
  jmp [bp]

L511: ; Continuation
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

L512: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+6]
  push word [CurrentCont]
  push word L511
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

L513: ; Continuation
  Bare_enter_check(16)
  push word [bp+4]
  push word L510
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L512
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [Temps+2]
  mov si, g118
  jmp [bp]

L514: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L513
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L515: ; Function: (lam,t1)
  Bare_enter_check(12)
  mov bx, si
  cmp word [bx], 1
  jz L493
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L496
  push word [Temps+2]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L514
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g13
  mov si, g109
  jmp [bp]

L516: ; Function: (lam,t1)
  Bare_enter_check(8)
  push word si
  push word [bp+2]
  push word L515
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L517: ; Continuation
  Bare_enter_check(60)
  push word [bp+4]
  push word L516
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
  push word [Temps+14]
  push word 1
  mov [Temps+16], sp
  push word 4 ;; scanned
  mov bp, g31
  mov si, [Temps+16]
  jmp [bp]

L518: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L517
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L519: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L518
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, g60
  jmp [bp]

L520: ; Start
  Bare_enter_check(14)
  push word g27
  push word `\x04`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L519
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g9
  mov si, [Temps+2]
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
  dw L193
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
  dw L197
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
  dw L234
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
  dw L258
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
  dw L274
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
  dw L297
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
  dw L298
g139:
  dw L302
g140:
  dw 1
g141:
  dw 1
g142:
  dw L314
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
  dw L351
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
  dw L386
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
  dw L399
g199:
  dw L406
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
  dw L418
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
  dw L422
g222:
  dw 1
g223:
  dw 1
g224:
  dw L426
g225:
  dw 1
g226:
  dw 1
g227:
  dw 11
  db ` --> `
g228:
  dw L430
g229:
  dw 1
g230:
  dw 1
g231:
  dw L434
g232:
  dw 1
g233:
  dw 1
g234:
  dw L472
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
  dw L476
g241:
  dw 1
g242:
  dw 1
g243:
  dw L480
g244:
  dw 1
g245:
  dw 1
g246:
  dw L490
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

bare_start: jmp L520
