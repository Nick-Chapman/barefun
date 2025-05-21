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

L34: ; Function: (implode,g9)
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

L42: ; Function: (rev_implode,g11)
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

L48: ; Function: (explode,g13)
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

L58: ; Function: (eq_string,g21)
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

L59: ; Arm: 91'7
  mov si, g23
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L60: ; Continuation
  Bare_enter_check(0)
  mov bp, g9
  mov si, si
  jmp [bp]

L61: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L60
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L62: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L61
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L63: ; Continuation
  Bare_enter_check(10)
  push word [bp+4]
  push word si
  push word [CurrentCont]
  push word L62
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g7
  mov si, g24
  jmp [bp]

L64: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L63
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g7
  mov si, si
  jmp [bp]

L65: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L64
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g13
  jmp [bp]

L66: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L65
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g13
  jmp [bp]

L67: ; Function: (concat,g22)
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 1
  jz L59
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+2]
  push word [CurrentCont]
  push word L66
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g22
  mov si, [Temps+4]
  jmp [bp]

L68: ; Arm: 107'7
  mov si, g26
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L69: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, g25
  jmp [bp]

L70: ; Arm: 100'19
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov si, [Temps+10]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L71: ; Arm: 101'22
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov si, [Temps+12]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L72: ; Arm: 102'16
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+14], ax
  mov si, [Temps+14]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L73: ; Function: (put_chars,g25)
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 1
  jz L68
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
  push word L69
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L70
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L71
  mov ax, 53
  cmp word ax, [Temps+6]
  call Bare_make_bool_from_n
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L72
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

L74: ; Continuation
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

L75: ; Arm: 168'11
  push word [bp+2]
  push word [CurrentCont]
  push word L74
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g11
  jmp [bp]

L76: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L77: ; Continuation
  Bare_enter_check(16)
  push word [bp+4]
  push word si
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+6]
  push word [CurrentCont]
  push word L76
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g28
  mov si, [Temps+2]
  jmp [bp]

L78: ; Arm: 170'26
  push word [Temps+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L77
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+4]
  mov bp, g11
  jmp [bp]

L79: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L80: ; Continuation
  Bare_enter_check(16)
  push word [bp+4]
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word [CurrentCont]
  push word L79
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L81: ; Function: (lam,t1)
  Bare_enter_check(12)
  mov bx, si
  cmp word [bx], 1
  jz L75
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
  jz L78
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+4]
  push word [CurrentCont]
  push word L80
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+2]
  mov bp, g29
  jmp [bp]

L82: ; Function: (lam,t1)
  Bare_enter_check(8)
  push word si
  push word [bp+2]
  push word L81
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L83: ; Function: (have_letter,g29)
  Bare_enter_check(6)
  push word si
  push word L82
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L84: ; Arm: 175'9
  mov si, [bp+2]
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

L86: ; Arm: 177'24
  push word [Temps+4]
  push word [CurrentCont]
  push word L85
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+2]
  mov bp, g28
  jmp [bp]

L87: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L88: ; Continuation
  Bare_enter_check(16)
  push word g30
  push word [bp+4]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+6]
  push word [CurrentCont]
  push word L87
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L89: ; Function: (lam,t1)
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 1
  jz L84
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
  jz L86
  push word [Temps+4]
  push word [Temps+2]
  push word [CurrentCont]
  push word L88
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+2]
  mov bp, g29
  jmp [bp]

L90: ; Function: (at_word_start,g28)
  Bare_enter_check(6)
  push word si
  push word L89
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L91: ; Arm: 144'22
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov bp, g11
  mov si, si
  jmp [bp]

L92: ; Arm: 145'28
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

L93: ; Arm: 146'19
  mov bp, g34
  mov si, si
  jmp [bp]

L94: ; Arm: 149'17
  mov bp, g34
  mov si, si
  jmp [bp]

L95: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, g34
  jmp [bp]

L96: ; Arm: 153'28
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

L97: ; Arm: 154'29
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

L98: ; Arm: 155'32
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

L99: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L95
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L96
  mov ax, [bp+6]
  cmp word ax, 65
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L97
  mov ax, 253
  cmp word ax, [bp+6]
  call Bare_make_bool_from_n
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L98
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

L100: ; Arm: 6'9
  mov si, g36
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L101: ; Arm: 147'21
  mov bx, si
  cmp word [bx], 1
  jz L94
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
  push word L99
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+20]
  cmp word [bx], 3
  jz L100
  mov si, g37
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L102: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, g34
  mov si, [Temps+2]
  jmp [bp]

L103: ; Arm: 100'19
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+18], ax
  mov si, [Temps+18]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L104: ; Arm: 101'22
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+20], ax
  mov si, [Temps+20]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L105: ; Arm: 102'16
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+22], ax
  mov si, [Temps+22]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L106: ; Function: (readloop,g34)
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
  jz L91
  mov ax, [Temps+2]
  cmp word ax, `\x04`
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L92
  mov ax, 255
  cmp word ax, [Temps+4]
  call Bare_make_bool_from_n
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L93
  mov ax, [Temps+4]
  cmp word ax, 255
  call Bare_make_bool_from_z
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L101
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
  push word L102
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+16]
  cmp word [bx], 3
  jz L103
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+18], ax
  mov bx, [Temps+18]
  cmp word [bx], 3
  jz L104
  mov ax, 53
  cmp word ax, [Temps+14]
  call Bare_make_bool_from_n
  mov [Temps+20], ax
  mov bx, [Temps+20]
  cmp word [bx], 3
  jz L105
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

L107: ; Arm: 231'36
  mov si, g39
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L108: ; Continuation
  Bare_enter_check(0)
  mov bp, g31
  mov si, si
  jmp [bp]

L109: ; Arm: 223'7
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L110: ; Arm: 194'9
  mov si, g42
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L111: ; Arm: 198'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L112: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L111
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L113: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L112
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L114: ; Function: (loop,t3)
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L110
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
  push word L113
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g21
  mov si, [Temps+6]
  jmp [bp]

L115: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L116: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L115
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L117: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L116
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, si
  jmp [bp]

L118: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L117
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g9
  mov si, si
  jmp [bp]

L119: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L118
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L120: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L119
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+8]
  jmp [bp]

L121: ; Continuation
  Bare_enter_check(12)
  push word [bp+6]
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L120
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g7
  mov si, g50
  jmp [bp]

L122: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L121
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g7
  mov si, si
  jmp [bp]

L123: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L122
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+6]
  mov bp, g13
  jmp [bp]

L124: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L123
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g13
  mov si, g49
  jmp [bp]

L125: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L124
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g9
  mov si, si
  jmp [bp]

L126: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L125
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L127: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L126
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+8]
  jmp [bp]

L128: ; Continuation
  Bare_enter_check(12)
  push word [bp+6]
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L127
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g7
  mov si, g48
  jmp [bp]

L129: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L128
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g7
  mov si, si
  jmp [bp]

L130: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L129
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+6]
  mov bp, g13
  jmp [bp]

L131: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L130
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+6]
  mov bp, g13
  jmp [bp]

L132: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L131
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g9
  mov si, si
  jmp [bp]

L133: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L132
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L134: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L133
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+10]
  jmp [bp]

L135: ; Continuation
  Bare_enter_check(14)
  push word [bp+8]
  push word [bp+6]
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L134
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g7
  mov si, g47
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
  mov bp, g7
  mov si, si
  jmp [bp]

L137: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L136
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+8]
  mov bp, g13
  jmp [bp]

L138: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L137
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g13
  mov si, g46
  jmp [bp]

L139: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L138
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g9
  mov si, si
  jmp [bp]

L140: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L139
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L141: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L140
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+10]
  jmp [bp]

L142: ; Continuation
  Bare_enter_check(14)
  push word [bp+8]
  push word [bp+6]
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L141
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g7
  mov si, g45
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
  mov bp, g7
  mov si, si
  jmp [bp]

L144: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L143
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g13
  mov si, g44
  jmp [bp]

L145: ; Arm: 215'9
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L144
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g13
  mov si, g43
  jmp [bp]

L146: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L147: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L146
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L148: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L147
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, si
  jmp [bp]

L149: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L148
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g9
  mov si, si
  jmp [bp]

L150: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L149
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L151: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L150
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+8]
  jmp [bp]

L152: ; Continuation
  Bare_enter_check(12)
  push word [bp+6]
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L151
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g7
  mov si, g58
  jmp [bp]

L153: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L152
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g7
  mov si, si
  jmp [bp]

L154: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L153
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+6]
  mov bp, g13
  jmp [bp]

L155: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L154
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g13
  mov si, g57
  jmp [bp]

L156: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L155
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g9
  mov si, si
  jmp [bp]

L157: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L156
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L158: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L157
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+8]
  jmp [bp]

L159: ; Continuation
  Bare_enter_check(12)
  push word [bp+6]
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L158
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g7
  mov si, g56
  jmp [bp]

L160: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L159
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g7
  mov si, si
  jmp [bp]

L161: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L160
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+6]
  mov bp, g13
  jmp [bp]

L162: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L161
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+6]
  mov bp, g13
  jmp [bp]

L163: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L162
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g9
  mov si, si
  jmp [bp]

L164: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L163
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L165: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L164
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+10]
  jmp [bp]

L166: ; Continuation
  Bare_enter_check(14)
  push word [bp+8]
  push word [bp+6]
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L165
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g7
  mov si, g55
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
  mov bp, g7
  mov si, si
  jmp [bp]

L168: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L167
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+8]
  mov bp, g13
  jmp [bp]

L169: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L168
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g13
  mov si, g54
  jmp [bp]

L170: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L169
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g9
  mov si, si
  jmp [bp]

L171: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L170
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L172: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L171
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+10]
  jmp [bp]

L173: ; Continuation
  Bare_enter_check(14)
  push word [bp+8]
  push word [bp+6]
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L172
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g7
  mov si, g53
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
  mov bp, g7
  mov si, si
  jmp [bp]

L175: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L174
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g13
  mov si, g52
  jmp [bp]

L176: ; Arm: 218'14
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L175
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g13
  mov si, g51
  jmp [bp]

L177: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L178: ; Continuation
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 1
  jz L145
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L176
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [bp+8]
  push word [CurrentCont]
  push word L177
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, [Temps+6]
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
  mov bp, [bp+10]
  mov si, si
  jmp [bp]

L180: ; Continuation
  Bare_enter_check(26)
  push word [CurrentCont]
  push word L108
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, si
  cmp word [bx], 1
  jz L109
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+2]
  push word L114
  mov [Temps+6], sp
  push word 4 ;; scanned
  push word [Temps+6]
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+4]
  push word [CurrentCont]
  push word L179
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

L181: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L180
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L182: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L181
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g7
  mov si, g41
  jmp [bp]

L183: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L182
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L184: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L183
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+6]
  mov bp, g13
  jmp [bp]

L185: ; Continuation
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 3
  jz L107
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L184
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g28
  mov si, g40
  jmp [bp]

L186: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L185
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L187: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L186
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g21
  mov si, si
  jmp [bp]

L188: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L187
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g34
  mov si, g38
  jmp [bp]

L189: ; Continuation
  Bare_enter_check(16)
  push word g33
  push word `\x04`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L188
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g9
  mov si, [Temps+2]
  jmp [bp]

L190: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L189
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L191: ; Function: (mainloop,g31)
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L190
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, g32
  jmp [bp]

L192: ; Arm: 347'11
  mov si, si
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L193: ; Continuation
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

L194: ; Continuation
  Bare_enter_check(8)
  mov ax, [bp+4]
  mov bx, 5
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  push word si
  push word [CurrentCont]
  push word L193
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g59
  mov si, [Temps+2]
  jmp [bp]

L195: ; Function: (fib,g59)
  Bare_enter_check(8)
  mov ax, si
  cmp word ax, 5
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L192
  mov ax, si
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+4], ax
  push word si
  push word [CurrentCont]
  push word L194
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g59
  mov si, [Temps+4]
  jmp [bp]

L196: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L197: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L196
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L198: ; Arm: 252'7
  push word [bp+2]
  push word [CurrentCont]
  push word L197
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, g67
  jmp [bp]

L199: ; Arm: 194'9
  mov si, g68
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L200: ; Arm: 198'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L201: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L200
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L202: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L201
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L203: ; Function: (loop,t3)
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L199
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
  push word L202
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g21
  mov si, [Temps+6]
  jmp [bp]

L204: ; Arm: 194'9
  mov si, g77
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L205: ; Arm: 198'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L206: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L205
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L207: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L206
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L208: ; Function: (loop,t1)
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L204
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
  push word L207
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g21
  mov si, [Temps+6]
  jmp [bp]

L209: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L210: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L209
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g13
  mov si, si
  jmp [bp]

L211: ; Arm: 245'11
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
  push word L210
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, [Temps+4]
  jmp [bp]

L212: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L213: ; Arm: 248'16
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L212
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g13
  mov si, [Temps+4]
  jmp [bp]

L214: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L215: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L214
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g13
  mov si, si
  jmp [bp]

L216: ; Continuation
  Bare_enter_check(22)
  mov bx, si
  cmp word [bx], 1
  jz L211
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L213
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
  push word L215
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, [Temps+10]
  jmp [bp]

L217: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L216
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L218: ; Function: (lam,t1)
  Bare_enter_check(16)
  push word si
  push word L208
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word si
  push word [CurrentCont]
  push word L217
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

L219: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L220: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L219
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L221: ; Continuation
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
  mov bp, g4
  mov si, [Temps+2]
  jmp [bp]

L222: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L223: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L222
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g13
  mov si, si
  jmp [bp]

L224: ; Arm: 245'11
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
  mov bp, g22
  mov si, [Temps+4]
  jmp [bp]

L225: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L226: ; Arm: 248'16
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L225
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g13
  mov si, [Temps+4]
  jmp [bp]

L227: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L228: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L227
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g13
  mov si, si
  jmp [bp]

L229: ; Continuation
  Bare_enter_check(32)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L221
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, si
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
  mov bp, g22
  mov si, [Temps+10]
  jmp [bp]

L230: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L229
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov si, si
  jmp [bp]

L231: ; Function: (lam,t1)
  Bare_enter_check(20)
  mov bx, si
  cmp word [bx], 1
  jz L198
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+2]
  push word L203
  mov [Temps+6], sp
  push word 4 ;; scanned
  push word [Temps+6]
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+2]
  push word [CurrentCont]
  push word L230
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

L232: ; Function: (lam,g86)
  Bare_enter_check(6)
  push word si
  push word L231
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L233: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L234: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L233
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L235: ; Arm: 289'7
  push word [bp+2]
  push word [CurrentCont]
  push word L234
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, g91
  jmp [bp]

L236: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L237: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L236
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L238: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L237
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, si
  jmp [bp]

L239: ; Arm: 292'10
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
  push word L238
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g22
  mov si, [Temps+8]
  jmp [bp]

L240: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L241: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L240
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L242: ; Arm: 295'12
  mov ax, [bx+2]
  mov [Temps+10], ax
  mov ax, [bx+4]
  mov [Temps+12], ax
  push word [bp+2]
  push word [CurrentCont]
  push word L241
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, g96
  jmp [bp]

L243: ; Arm: 194'9
  mov si, g97
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L244: ; Arm: 198'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L245: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L244
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L246: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L245
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L247: ; Function: (loop,t5)
  Bare_enter_check(14)
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
  push word [Temps+8]
  push word [Temps+4]
  push word bp
  push word [bp+2]
  push word [CurrentCont]
  push word L246
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g21
  mov si, [Temps+6]
  jmp [bp]

L248: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L249: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L248
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L250: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L249
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, si
  jmp [bp]

L251: ; Arm: 298'15
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
  push word L250
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g22
  mov si, [Temps+4]
  jmp [bp]

L252: ; Continuation
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

L253: ; Continuation
  Bare_enter_check(24)
  mov bx, si
  cmp word [bx], 1
  jz L251
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [bp+8]
  push word [CurrentCont]
  push word L252
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

L254: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L253
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov si, si
  jmp [bp]

L255: ; Function: (lam,t1)
  Bare_enter_check(24)
  mov bx, si
  cmp word [bx], 1
  jz L235
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 1
  jz L239
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L242
  push word [Temps+2]
  push word L247
  mov [Temps+10], sp
  push word 4 ;; scanned
  push word [Temps+10]
  push word [Temps+6]
  push word [Temps+2]
  push word [bp+2]
  push word [CurrentCont]
  push word L254
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

L256: ; Function: (lam,g102)
  Bare_enter_check(6)
  push word si
  push word L255
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L257: ; Arm: 144'22
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov bp, g11
  mov si, si
  jmp [bp]

L258: ; Arm: 145'28
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

L259: ; Arm: 146'19
  mov bp, g110
  mov si, si
  jmp [bp]

L260: ; Arm: 149'17
  mov bp, g110
  mov si, si
  jmp [bp]

L261: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, g110
  jmp [bp]

L262: ; Arm: 153'28
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

L263: ; Arm: 154'29
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

L264: ; Arm: 155'32
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

L265: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L261
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L262
  mov ax, [bp+6]
  cmp word ax, 65
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L263
  mov ax, 253
  cmp word ax, [bp+6]
  call Bare_make_bool_from_n
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L264
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

L266: ; Arm: 6'9
  mov si, g112
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L267: ; Arm: 147'21
  mov bx, si
  cmp word [bx], 1
  jz L260
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
  push word L265
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+20]
  cmp word [bx], 3
  jz L266
  mov si, g113
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L268: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, g110
  mov si, [Temps+2]
  jmp [bp]

L269: ; Arm: 100'19
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+18], ax
  mov si, [Temps+18]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L270: ; Arm: 101'22
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+20], ax
  mov si, [Temps+20]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L271: ; Arm: 102'16
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+22], ax
  mov si, [Temps+22]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L272: ; Function: (readloop,g110)
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
  jz L257
  mov ax, [Temps+2]
  cmp word ax, `\x04`
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L258
  mov ax, 255
  cmp word ax, [Temps+4]
  call Bare_make_bool_from_n
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L259
  mov ax, [Temps+4]
  cmp word ax, 255
  call Bare_make_bool_from_z
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L267
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
  push word L268
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+16]
  cmp word [bx], 3
  jz L269
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+18], ax
  mov bx, [Temps+18]
  cmp word [bx], 3
  jz L270
  mov ax, 53
  cmp word ax, [Temps+14]
  call Bare_make_bool_from_n
  mov [Temps+20], ax
  mov bx, [Temps+20]
  cmp word [bx], 3
  jz L271
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

L273: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L274: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L273
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L275: ; Arm: 327'7
  push word [bp+2]
  push word [CurrentCont]
  push word L274
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, g121
  jmp [bp]

L276: ; Arm: 194'9
  mov si, g122
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L277: ; Arm: 198'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L278: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L277
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L279: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L278
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L280: ; Function: (loop,t1)
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L276
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
  push word L279
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g21
  mov si, [Temps+6]
  jmp [bp]

L281: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L282: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L281
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g13
  mov si, si
  jmp [bp]

L283: ; Arm: 320'11
  push word g125
  push word [bp+4]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L282
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, [Temps+2]
  jmp [bp]

L284: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L285: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L284
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g13
  mov si, si
  jmp [bp]

L286: ; Arm: 323'16
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word g128
  push word [bp+4]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L285
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, [Temps+6]
  jmp [bp]

L287: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L288: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L287
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g13
  mov si, si
  jmp [bp]

L289: ; Continuation
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L283
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L286
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
  push word L288
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, [Temps+8]
  jmp [bp]

L290: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L289
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L291: ; Function: (lam,t3)
  Bare_enter_check(16)
  push word si
  push word L280
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word si
  push word [CurrentCont]
  push word L290
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

L292: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L293: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L292
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L294: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov bx, si
  cmp word [bx], 1
  jz L275
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [bp+2]
  push word L291
  mov [Temps+6], sp
  push word 4 ;; scanned
  push word si
  push word [bp+2]
  push word [CurrentCont]
  push word L293
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g4
  mov si, [Temps+6]
  jmp [bp]

L295: ; Function: (lam,g132)
  Bare_enter_check(6)
  push word si
  push word L294
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L296: ; Function: (lam,g138)
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

L297: ; Arm: 205'9
  mov si, g140
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L298: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, g139
  jmp [bp]

L299: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L298
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L300: ; Function: (loop,g139)
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 1
  jz L297
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
  push word L299
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, [Temps+2]
  jmp [bp]

L301: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L302: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L301
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L303: ; Arm: 237'9
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [bp+2]
  push word [CurrentCont]
  push word L302
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, g137
  jmp [bp]

L304: ; Continuation
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

L305: ; Arm: 209'9
  mov si, g141
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L306: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, g139
  jmp [bp]

L307: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L306
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L308: ; Continuation
  Bare_enter_check(16)
  push word [bp+4]
  push word [CurrentCont]
  push word L304
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, si
  cmp word [bx], 1
  jz L305
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [CurrentCont]
  push word L307
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, [Temps+2]
  jmp [bp]

L309: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L308
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L310: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L309
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

L311: ; Function: (lam,t1)
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 3
  jz L303
  push word [bp+2]
  push word [CurrentCont]
  push word L310
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g2
  mov si, g138
  jmp [bp]

L312: ; Function: (lam,g142)
  Bare_enter_check(6)
  push word si
  push word L311
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L313: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L314: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L313
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L315: ; Arm: 266'7
  push word [bp+2]
  push word [CurrentCont]
  push word L314
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, g147
  jmp [bp]

L316: ; Arm: 194'9
  mov si, g148
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L317: ; Arm: 198'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L318: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L317
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L319: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L318
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L320: ; Function: (loop,t3)
  Bare_enter_check(14)
  mov bx, si
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
  mov bp, g21
  mov si, [Temps+6]
  jmp [bp]

L321: ; Arm: 194'9
  mov si, g157
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L322: ; Arm: 198'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L323: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L322
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L324: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L323
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L325: ; Function: (loop,t1)
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L321
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
  push word L324
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g21
  mov si, [Temps+6]
  jmp [bp]

L326: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L327: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L326
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g13
  mov si, si
  jmp [bp]

L328: ; Arm: 259'11
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
  push word L327
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, [Temps+4]
  jmp [bp]

L329: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L330: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L329
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g13
  mov si, si
  jmp [bp]

L331: ; Arm: 262'16
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
  push word L330
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, [Temps+8]
  jmp [bp]

L332: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L333: ; Continuation
  Bare_enter_check(22)
  mov bx, si
  cmp word [bx], 1
  jz L328
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L331
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [CurrentCont]
  push word L332
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g13
  mov si, [Temps+4]
  jmp [bp]

L334: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L333
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L335: ; Function: (lam,t1)
  Bare_enter_check(16)
  push word si
  push word L325
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word si
  push word [CurrentCont]
  push word L334
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

L336: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L337: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L336
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L338: ; Continuation
  Bare_enter_check(16)
  push word [bp+4]
  push word L335
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L337
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g4
  mov si, [Temps+2]
  jmp [bp]

L339: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L340: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L339
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g13
  mov si, si
  jmp [bp]

L341: ; Arm: 259'11
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
  push word L340
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, [Temps+4]
  jmp [bp]

L342: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L343: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L342
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g13
  mov si, si
  jmp [bp]

L344: ; Arm: 262'16
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
  push word L343
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, [Temps+8]
  jmp [bp]

L345: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L346: ; Continuation
  Bare_enter_check(32)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L338
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 1
  jz L341
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L344
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [CurrentCont]
  push word L345
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g13
  mov si, [Temps+4]
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
  mov bp, [bp+10]
  mov si, si
  jmp [bp]

L348: ; Function: (lam,t1)
  Bare_enter_check(20)
  mov bx, si
  cmp word [bx], 1
  jz L315
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+2]
  push word L320
  mov [Temps+6], sp
  push word 4 ;; scanned
  push word [Temps+6]
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+2]
  push word [CurrentCont]
  push word L347
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

L349: ; Function: (lam,g166)
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
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L351: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L350
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L352: ; Arm: 304'7
  push word [bp+2]
  push word [CurrentCont]
  push word L351
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, g171
  jmp [bp]

L353: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L354: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L353
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L355: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L354
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, si
  jmp [bp]

L356: ; Arm: 307'10
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
  push word L355
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g22
  mov si, [Temps+8]
  jmp [bp]

L357: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L358: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L357
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L359: ; Arm: 310'12
  mov ax, [bx+2]
  mov [Temps+10], ax
  mov ax, [bx+4]
  mov [Temps+12], ax
  push word [bp+2]
  push word [CurrentCont]
  push word L358
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, g176
  jmp [bp]

L360: ; Arm: 194'9
  mov si, g177
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L361: ; Arm: 198'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L362: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L361
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L363: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L362
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L364: ; Function: (loop,t5)
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L360
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
  push word L363
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g21
  mov si, [Temps+6]
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
  mov bp, g25
  mov si, si
  jmp [bp]

L367: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L366
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, si
  jmp [bp]

L368: ; Arm: 313'15
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
  push word L367
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g22
  mov si, [Temps+4]
  jmp [bp]

L369: ; Continuation
  Bare_enter_check(0)
  mov si, g186
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L370: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L369
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L371: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L370
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g13
  mov si, si
  jmp [bp]

L372: ; Arm: 272'9
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
  push word L371
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, [Temps+4]
  jmp [bp]

L373: ; Arm: 277'35
  mov si, [bp+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L374: ; Continuation
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

L375: ; Continuation
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 3
  jz L373
  push word [bp+10]
  push word [bp+8]
  push word [CurrentCont]
  push word L374
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L376: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L375
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L377: ; Function: (loop,t2)
  Bare_enter_check(22)
  mov bx, si
  cmp word [bx], 1
  jz L372
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
  push word L376
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g21
  mov si, [Temps+6]
  jmp [bp]

L378: ; Continuation
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

L379: ; Continuation
  Bare_enter_check(16)
  push word si
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L378
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

L380: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L379
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L381: ; Continuation
  Bare_enter_check(24)
  mov bx, si
  cmp word [bx], 1
  jz L368
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [bp+6]
  push word L377
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+8]
  push word [CurrentCont]
  push word L380
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

L382: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L381
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov si, si
  jmp [bp]

L383: ; Function: (lam,t1)
  Bare_enter_check(24)
  mov bx, si
  cmp word [bx], 1
  jz L352
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 1
  jz L356
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L359
  push word [Temps+2]
  push word L364
  mov [Temps+10], sp
  push word 4 ;; scanned
  push word [Temps+10]
  push word [Temps+6]
  push word [Temps+2]
  push word [bp+2]
  push word [CurrentCont]
  push word L382
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

L384: ; Function: (lam,g187)
  Bare_enter_check(6)
  push word si
  push word L383
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L385: ; Continuation
  Bare_enter_check(0)
  mov si, g197
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L386: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L385
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L387: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L386
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g13
  mov si, si
  jmp [bp]

L388: ; Arm: 272'9
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
  push word L387
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g22
  mov si, [Temps+4]
  jmp [bp]

L389: ; Arm: 277'35
  mov si, [bp+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L390: ; Continuation
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

L391: ; Continuation
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 3
  jz L389
  push word [bp+10]
  push word [bp+8]
  push word [CurrentCont]
  push word L390
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L392: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L391
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L393: ; Function: (loop,t1)
  Bare_enter_check(22)
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
  push word [Temps+6]
  push word [Temps+4]
  push word bp
  push word [bp+2]
  push word [CurrentCont]
  push word L392
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g21
  mov si, [Temps+6]
  jmp [bp]

L394: ; Continuation
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

L395: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L394
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L396: ; Function: (lam,t1)
  Bare_enter_check(14)
  push word si
  push word L393
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word [CurrentCont]
  push word L395
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

L397: ; Function: (lam,g198)
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

L398: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L399: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L398
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L400: ; Arm: 284'7
  push word [bp+2]
  push word [CurrentCont]
  push word L399
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, g192
  jmp [bp]

L401: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L402: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L401
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L403: ; Function: (lam,t1)
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 1
  jz L400
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word si
  push word [bp+2]
  push word [CurrentCont]
  push word L402
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g6
  mov si, g198
  jmp [bp]

L404: ; Function: (lam,g199)
  Bare_enter_check(6)
  push word si
  push word L403
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L405: ; Arm: 369'9
  push word [bp+2]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L406: ; Arm: 372'15
  mov si, g217
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L407: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L408: ; Continuation
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 1
  jz L406
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
  push word L407
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g210
  mov si, [Temps+6]
  jmp [bp]

L409: ; Arm: 364'27
  push word [bp+4]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L410: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L409
  mov si, g215
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L411: ; Arm: 6'9
  mov si, g213
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L412: ; Arm: 364'12
  mov ax, 19
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+8]
  push word [CurrentCont]
  push word L410
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L411
  mov si, g214
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L413: ; Continuation
  Bare_enter_check(18)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L408
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L412
  mov si, g216
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L414: ; Arm: 6'9
  mov si, g211
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L415: ; Function: (lam,t1)
  Bare_enter_check(12)
  mov bx, si
  cmp word [bx], 1
  jz L405
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
  push word L413
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L414
  mov si, g212
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L416: ; Function: (loop,g210)
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

L417: ; Arm: 116'13
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L418: ; Continuation
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

L419: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L417
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
  push word L418
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g221
  mov si, [Temps+10]
  jmp [bp]

L420: ; Function: (loop,g221)
  Bare_enter_check(6)
  push word si
  push word L419
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L421: ; Arm: 116'13
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L422: ; Continuation
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

L423: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L421
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
  push word L422
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g224
  mov si, [Temps+10]
  jmp [bp]

L424: ; Function: (loop,g224)
  Bare_enter_check(6)
  push word si
  push word L423
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L425: ; Arm: 116'13
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L426: ; Continuation
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

L427: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L425
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
  push word L426
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g228
  mov si, [Temps+10]
  jmp [bp]

L428: ; Function: (loop,g228)
  Bare_enter_check(6)
  push word si
  push word L427
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L429: ; Arm: 116'13
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L430: ; Continuation
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

L431: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L429
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
  push word L430
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g231
  mov si, [Temps+10]
  jmp [bp]

L432: ; Function: (loop,g231)
  Bare_enter_check(6)
  push word si
  push word L431
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L433: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L434: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L433
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L435: ; Arm: 379'7
  push word [bp+2]
  push word [CurrentCont]
  push word L434
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, g208
  jmp [bp]

L436: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L437: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L436
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L438: ; Arm: 382'12
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [bp+2]
  push word [CurrentCont]
  push word L437
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, g209
  jmp [bp]

L439: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L440: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L439
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L441: ; Arm: 385'15
  push word [bp+4]
  push word [CurrentCont]
  push word L440
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, g218
  jmp [bp]

L442: ; Arm: 351'13
  mov si, g219
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L443: ; Continuation
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

L444: ; Continuation
  Bare_enter_check(8)
  push word si
  push word `-`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, [Temps+2]
  jmp [bp]

L445: ; Arm: 119'11
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

L446: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L447: ; Arm: 123'2
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
  push word L444
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L445
  push word [Temps+4]
  push word [CurrentCont]
  push word L446
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g228
  mov si, g230
  jmp [bp]

L448: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L449: ; Arm: 119'11
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

L450: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L451: ; Continuation
  Bare_enter_check(24)
  mov ax, [bp+8]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L443
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L447
  mov ax, [bp+8]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L448
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L449
  push word [bp+8]
  push word [CurrentCont]
  push word L450
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g231
  mov si, g233
  jmp [bp]

L452: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L451
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L453: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L452
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g13
  mov si, g227
  jmp [bp]

L454: ; Continuation
  Bare_enter_check(8)
  push word si
  push word `-`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, [Temps+2]
  jmp [bp]

L455: ; Arm: 119'11
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

L456: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L457: ; Arm: 123'2
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
  push word L454
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L455
  push word [Temps+4]
  push word [CurrentCont]
  push word L456
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g221
  mov si, g223
  jmp [bp]

L458: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L459: ; Arm: 119'11
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

L460: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L461: ; Continuation
  Bare_enter_check(26)
  mov ax, [bp+4]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L453
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L457
  mov ax, [bp+4]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L458
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L459
  push word [bp+4]
  push word [CurrentCont]
  push word L460
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g224
  mov si, g226
  jmp [bp]

L462: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L461
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L463: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L462
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g13
  mov si, g220
  jmp [bp]

L464: ; Function: (loop,t2)
  Bare_enter_check(10)
  mov ax, [bp+2]
  cmp word ax, si
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L442
  push word bp
  push word si
  push word [CurrentCont]
  push word L463
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g59
  mov si, si
  jmp [bp]

L465: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L466: ; Continuation
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L441
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word L464
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L465
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [Temps+4]
  mov si, 1
  jmp [bp]

L467: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L466
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L468: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L467
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g210
  mov si, 1
  jmp [bp]

L469: ; Function: (lam,t1)
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 1
  jz L435
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L438
  push word [bp+2]
  push word [CurrentCont]
  push word L468
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, [Temps+2]
  jmp [bp]

L470: ; Function: (lam,g234)
  Bare_enter_check(6)
  push word si
  push word L469
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L471: ; Arm: 116'13
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L472: ; Continuation
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

L473: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L471
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
  push word L472
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g240
  mov si, [Temps+10]
  jmp [bp]

L474: ; Function: (loop,g240)
  Bare_enter_check(6)
  push word si
  push word L473
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L475: ; Arm: 116'13
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L476: ; Continuation
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

L477: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L475
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
  push word L476
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g243
  mov si, [Temps+10]
  jmp [bp]

L478: ; Function: (loop,g243)
  Bare_enter_check(6)
  push word si
  push word L477
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L479: ; Continuation
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

L480: ; Continuation
  Bare_enter_check(8)
  push word si
  push word `-`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, [Temps+2]
  jmp [bp]

L481: ; Arm: 119'11
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

L482: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L483: ; Arm: 123'2
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
  push word L480
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L481
  push word [Temps+6]
  push word [CurrentCont]
  push word L482
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g240
  mov si, g242
  jmp [bp]

L484: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L485: ; Arm: 119'11
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

L486: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L487: ; Function: (lam,t1)
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
  push word L479
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L483
  mov ax, [Temps+2]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word [CurrentCont]
  push word L484
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L485
  push word [Temps+2]
  push word [CurrentCont]
  push word L486
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g243
  mov si, g245
  jmp [bp]

L488: ; Function: (lam,g246)
  Bare_enter_check(6)
  push word si
  push word L487
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L489: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L490: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L489
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L491: ; Arm: 332'7
  push word [bp+4]
  push word [CurrentCont]
  push word L490
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, g107
  jmp [bp]

L492: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L493: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L492
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L494: ; Arm: 335'12
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [bp+4]
  push word [CurrentCont]
  push word L493
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, g108
  jmp [bp]

L495: ; Continuation
  Bare_enter_check(0)
  mov bp, g22
  mov si, si
  jmp [bp]

L496: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L495
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L497: ; Arm: 340'44
  push word [bp+4]
  push word [CurrentCont]
  push word L496
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g7
  mov si, g115
  jmp [bp]

L498: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word si
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+2]
  jmp [bp]

L499: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L498
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g9
  mov si, si
  jmp [bp]

L500: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L499
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L501: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L500
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+10]
  jmp [bp]

L502: ; Continuation
  Bare_enter_check(14)
  push word [bp+8]
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L501
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g7
  mov si, g117
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
  mov bp, g7
  mov si, si
  jmp [bp]

L504: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L503
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g13
  mov si, g116
  jmp [bp]

L505: ; Continuation
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 3
  jz L497
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L504
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+8]
  mov bp, g13
  jmp [bp]

L506: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L505
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
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
  mov bp, g21
  mov si, si
  jmp [bp]

L508: ; Function: (loop,t1)
  Bare_enter_check(12)
  push word bp
  push word si
  push word [bp+2]
  push word [CurrentCont]
  push word L507
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g110
  mov si, g114
  jmp [bp]

L509: ; Continuation
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

L510: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+6]
  push word [CurrentCont]
  push word L509
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

L511: ; Continuation
  Bare_enter_check(16)
  push word [bp+4]
  push word L508
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L510
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [Temps+2]
  mov si, g118
  jmp [bp]

L512: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L511
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L513: ; Function: (lam,t1)
  Bare_enter_check(12)
  mov bx, si
  cmp word [bx], 1
  jz L491
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L494
  push word [Temps+2]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L512
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g13
  mov si, g109
  jmp [bp]

L514: ; Function: (lam,t1)
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
  Bare_enter_check(60)
  push word [bp+4]
  push word L514
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

L516: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L515
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L517: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L516
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g13
  mov si, g60
  jmp [bp]

L518: ; Start
  Bare_enter_check(14)
  push word g27
  push word `\x04`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L517
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
  dw L67
g23:
  dw 1
  db ``
g24:
  dw 1
g25:
  dw L73
g26:
  dw 1
g27:
  dw 1
g28:
  dw L90
g29:
  dw L83
g30:
  dw 1
g31:
  dw L191
g32:
  dw 5
  db `% `
g33:
  dw 1
g34:
  dw L106
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
  dw L195
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
  dw L232
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
  dw L256
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
  dw L272
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
  dw L295
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
  dw L296
g139:
  dw L300
g140:
  dw 1
g141:
  dw 1
g142:
  dw L312
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
  dw L349
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
  dw L384
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
  dw L397
g199:
  dw L404
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
  dw L416
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
  dw L420
g222:
  dw 1
g223:
  dw 1
g224:
  dw L424
g225:
  dw 1
g226:
  dw 1
g227:
  dw 11
  db ` --> `
g228:
  dw L428
g229:
  dw 1
g230:
  dw 1
g231:
  dw L432
g232:
  dw 1
g233:
  dw 1
g234:
  dw L470
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
  dw L474
g241:
  dw 1
g242:
  dw 1
g243:
  dw L478
g244:
  dw 1
g245:
  dw 1
g246:
  dw L488
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

bare_start: jmp L518
