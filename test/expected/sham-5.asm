L1: ; Function: (lam,t1)
  Bare_enter_check(0)
  mov bp, [bp+2]
  mov si, si
  jmp [bp]

L2: ; Function: (block,g1)
  Bare_enter_check(6)
  push word si
  push word L1
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L3: ; Arm: 22'7
  mov si, 1
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L4: ; Continuation
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

L5: ; Function: (length,g2)
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 1
  jz L3
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L4
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g2
  mov si, [Temps+4]
  jmp [bp]

L6: ; Arm: 27'7
  mov si, g4
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L7: ; Continuation
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

L8: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L7
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L9: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+6]
  push word [CurrentCont]
  push word L8
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+4]
  mov bp, g3
  jmp [bp]

L10: ; Function: (lam,t1)
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 1
  jz L6
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L9
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+2]
  mov si, [Temps+2]
  jmp [bp]

L11: ; Function: (map,g3)
  Bare_enter_check(6)
  push word si
  push word L10
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L12: ; Arm: 32'7
  mov si, g6
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L13: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L14: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L13
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g5
  jmp [bp]

L15: ; Function: (lam,t1)
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 1
  jz L12
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L14
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+2]
  mov si, [Temps+2]
  jmp [bp]

L16: ; Function: (iter,g5)
  Bare_enter_check(6)
  push word si
  push word L15
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L17: ; Arm: 37'7
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L18: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L19: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L18
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L20: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L19
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L21: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word si
  push word [CurrentCont]
  push word L20
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L22: ; Function: (lam,t1)
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L17
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L21
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov si, [bp+2]
  mov bp, g7
  jmp [bp]

L23: ; Function: (lam,t1)
  Bare_enter_check(8)
  push word si
  push word [bp+2]
  push word L22
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L24: ; Function: (fold_left,g7)
  Bare_enter_check(6)
  push word si
  push word L23
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L25: ; Arm: 42'7
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L26: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L27: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov bx, si
  cmp word [bx], 1
  jz L25
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
  push word L26
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g8
  mov si, [Temps+6]
  jmp [bp]

L28: ; Function: (rev_onto,g8)
  Bare_enter_check(6)
  push word si
  push word L27
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L29: ; Arm: 55'9
  mov si, g9
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L30: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L31: ; Function: (lam,t1)
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 1
  jz L29
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
  push word L30
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+8]
  jmp [bp]

L32: ; Function: (loop,t2)
  Bare_enter_check(10)
  push word bp
  push word si
  push word [bp+2]
  push word L31
  mov [Temps+2], sp
  push word 8 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L33: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L34: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L33
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L35: ; Continuation
  Bare_enter_check(600)
  mov ax, si
  call Bare_make_bytes
  mov [Temps+2], ax
  push word [Temps+2]
  push word L32
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word [bp+4]
  push word [CurrentCont]
  push word L34
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [Temps+4]
  mov si, 1
  jmp [bp]

L36: ; Function: (lam,g10)
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L35
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g2
  mov si, si
  jmp [bp]

L37: ; Arm: 66'9
  mov si, g11
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L38: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L39: ; Function: (lam,t1)
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 1
  jz L37
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
  push word L38
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+8]
  jmp [bp]

L40: ; Function: (loop,t2)
  Bare_enter_check(10)
  push word bp
  push word si
  push word [bp+2]
  push word L39
  mov [Temps+2], sp
  push word 8 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L41: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L42: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L41
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L43: ; Continuation
  Bare_enter_check(600)
  mov ax, si
  call Bare_make_bytes
  mov [Temps+2], ax
  push word [Temps+2]
  push word L40
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
  push word L42
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [Temps+4]
  mov si, [Temps+6]
  jmp [bp]

L44: ; Function: (lam,g12)
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L43
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g2
  mov si, si
  jmp [bp]

L45: ; Arm: 74'13
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

L50: ; Function: (lam,g14)
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
  mov si, g13
  jmp [bp]

L51: ; Arm: 82'19
  mov si, g17
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L52: ; Arm: 84'15
  mov si, g18
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L53: ; Arm: 87'31
  mov si, g21
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

L55: ; Arm: 8'9
  mov si, g19
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
  mov si, g20
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

L58: ; Arm: 8'9
  mov si, g15
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
  mov si, g16
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L60: ; Function: (lam,g22)
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

L61: ; Arm: 112'7
  mov si, g26
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L62: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, g25
  jmp [bp]

L63: ; Arm: 105'19
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov si, [Temps+10]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L64: ; Arm: 106'22
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov si, [Temps+12]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L65: ; Arm: 107'16
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+14], ax
  mov si, [Temps+14]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L66: ; Function: (put_chars,g25)
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 1
  jz L61
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
  push word L62
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L63
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L64
  mov ax, 53
  cmp word ax, [Temps+6]
  call Bare_make_bool_from_n
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L65
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

L67: ; Arm: 352'11
  mov si, si
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L68: ; Continuation
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

L69: ; Continuation
  Bare_enter_check(8)
  mov ax, [bp+4]
  mov bx, 5
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  push word si
  push word [CurrentCont]
  push word L68
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g55
  mov si, [Temps+2]
  jmp [bp]

L70: ; Function: (fib,g55)
  Bare_enter_check(8)
  mov ax, si
  cmp word ax, 5
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L67
  mov ax, si
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+4], ax
  push word si
  push word [CurrentCont]
  push word L69
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g55
  mov si, [Temps+4]
  jmp [bp]

L71: ; Function: (lam,g124)
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

L72: ; Arm: 374'9
  push word [bp+2]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L73: ; Arm: 377'15
  mov si, g189
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L74: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L75: ; Continuation
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 1
  jz L73
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
  push word L74
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g182
  mov si, [Temps+6]
  jmp [bp]

L76: ; Arm: 369'27
  push word [bp+4]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L77: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L76
  mov si, g187
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L78: ; Arm: 8'9
  mov si, g185
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L79: ; Arm: 369'12
  mov ax, 19
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+8]
  push word [CurrentCont]
  push word L77
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L78
  mov si, g186
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L80: ; Continuation
  Bare_enter_check(18)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L75
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L79
  mov si, g188
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L81: ; Arm: 8'9
  mov si, g183
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L82: ; Function: (lam,t1)
  Bare_enter_check(12)
  mov bx, si
  cmp word [bx], 1
  jz L72
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
  push word L80
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L81
  mov si, g184
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L83: ; Function: (loop,g182)
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

L84: ; Arm: 121'13
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L85: ; Continuation
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

L86: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L84
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
  push word L85
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g193
  mov si, [Temps+10]
  jmp [bp]

L87: ; Function: (loop,g193)
  Bare_enter_check(6)
  push word si
  push word L86
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L88: ; Arm: 121'13
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L89: ; Continuation
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

L90: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L88
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
  push word L89
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g196
  mov si, [Temps+10]
  jmp [bp]

L91: ; Function: (loop,g196)
  Bare_enter_check(6)
  push word si
  push word L90
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L92: ; Arm: 121'13
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L93: ; Continuation
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

L94: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L92
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
  push word L93
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g200
  mov si, [Temps+10]
  jmp [bp]

L95: ; Function: (loop,g200)
  Bare_enter_check(6)
  push word si
  push word L94
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L96: ; Arm: 121'13
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L97: ; Continuation
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

L98: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L96
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
  push word L97
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g203
  mov si, [Temps+10]
  jmp [bp]

L99: ; Function: (loop,g203)
  Bare_enter_check(6)
  push word si
  push word L98
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L100: ; Arm: 121'13
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L101: ; Continuation
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

L102: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L100
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
  push word L101
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g209
  mov si, [Temps+10]
  jmp [bp]

L103: ; Function: (loop,g209)
  Bare_enter_check(6)
  push word si
  push word L102
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L104: ; Arm: 121'13
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L105: ; Continuation
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

L106: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L104
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
  push word L105
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g212
  mov si, [Temps+10]
  jmp [bp]

L107: ; Function: (loop,g212)
  Bare_enter_check(6)
  push word si
  push word L106
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L108: ; Continuation
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

L109: ; Continuation
  Bare_enter_check(8)
  push word si
  push word `-`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, [Temps+2]
  jmp [bp]

L110: ; Arm: 124'11
  push word g210
  push word `0`
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  mov si, [Temps+10]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L111: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L112: ; Arm: 128'2
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
  push word L109
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L110
  push word [Temps+6]
  push word [CurrentCont]
  push word L111
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g209
  mov si, g211
  jmp [bp]

L113: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L114: ; Arm: 124'11
  push word g213
  push word `0`
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  mov si, [Temps+8]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L115: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L116: ; Function: (lam,t1)
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
  push word L108
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L112
  mov ax, [Temps+2]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word [CurrentCont]
  push word L113
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L114
  push word [Temps+2]
  push word [CurrentCont]
  push word L115
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g212
  mov si, g214
  jmp [bp]

L117: ; Function: (lam,g215)
  Bare_enter_check(6)
  push word si
  push word L116
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L118: ; Arm: 96'7
  mov si, g23
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L119: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L120: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L119
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, si
  jmp [bp]

L121: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L120
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+8]
  jmp [bp]

L122: ; Continuation
  Bare_enter_check(12)
  push word [bp+6]
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L121
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g8
  mov si, g24
  jmp [bp]

L123: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L122
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g8
  mov si, si
  jmp [bp]

L124: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L123
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L125: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L124
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L126: ; Function: (concat,t1)
  Bare_enter_check(12)
  mov bx, si
  cmp word [bx], 1
  jz L118
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+2]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L125
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, bp
  mov si, [Temps+4]
  jmp [bp]

L127: ; Continuation
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

L128: ; Arm: 173'11
  push word [bp+6]
  push word [CurrentCont]
  push word L127
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+10]
  mov bp, [bp+2]
  jmp [bp]

L129: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L130: ; Continuation
  Bare_enter_check(16)
  push word [bp+6]
  push word si
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word [CurrentCont]
  push word L129
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov si, [Temps+2]
  jmp [bp]

L131: ; Arm: 175'26
  push word [Temps+4]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L130
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+10]
  mov bp, [bp+2]
  jmp [bp]

L132: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L133: ; Continuation
  Bare_enter_check(16)
  push word [bp+4]
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word [CurrentCont]
  push word L132
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L134: ; Function: (lam,t1)
  Bare_enter_check(12)
  mov bx, si
  cmp word [bx], 1
  jz L128
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
  jz L131
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+10]
  push word [CurrentCont]
  push word L133
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov si, [bp+6]
  mov bp, [bp+8]
  jmp [bp]

L135: ; Function: (lam,t1)
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L134
  mov [Temps+2], sp
  push word 12 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L136: ; Function: (have_letter,t1)
  Bare_enter_check(12)
  push word bp
  push word si
  push word [bp+4]
  push word [bp+2]
  push word L135
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L137: ; Arm: 180'9
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L138: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L139: ; Arm: 182'24
  push word [Temps+4]
  push word [CurrentCont]
  push word L138
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+2]
  mov bp, [bp+4]
  jmp [bp]

L140: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L141: ; Continuation
  Bare_enter_check(16)
  push word g28
  push word [bp+4]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+6]
  push word [CurrentCont]
  push word L140
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L142: ; Function: (lam,t2)
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 1
  jz L137
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
  jz L139
  push word [Temps+4]
  push word [Temps+2]
  push word [CurrentCont]
  push word L141
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+2]
  mov bp, [bp+6]
  jmp [bp]

L143: ; Function: (at_word_start,t1)
  Bare_enter_check(18)
  push word bp
  push word [bp+2]
  push word L136
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word bp
  push word si
  push word L142
  mov [Temps+4], sp
  push word 8 ;; scanned
  mov si, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L144: ; Arm: 149'22
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov bp, [bp+2]
  mov si, si
  jmp [bp]

L145: ; Arm: 150'28
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

L146: ; Arm: 151'19
  mov bp, bp
  mov si, si
  jmp [bp]

L147: ; Arm: 154'17
  mov bp, bp
  mov si, si
  jmp [bp]

L148: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L149: ; Arm: 158'28
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

L150: ; Arm: 159'29
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

L151: ; Arm: 160'32
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

L152: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L148
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L149
  mov ax, [bp+8]
  cmp word ax, 65
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L150
  mov ax, 253
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L151
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

L153: ; Arm: 8'9
  mov si, g32
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L154: ; Arm: 152'21
  mov bx, si
  cmp word [bx], 1
  jz L147
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
  push word L152
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+20]
  cmp word [bx], 3
  jz L153
  mov si, g33
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L155: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+2]
  jmp [bp]

L156: ; Arm: 105'19
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+18], ax
  mov si, [Temps+18]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L157: ; Arm: 106'22
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+20], ax
  mov si, [Temps+20]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L158: ; Arm: 107'16
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+22], ax
  mov si, [Temps+22]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L159: ; Function: (readloop,t1)
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
  jz L144
  mov ax, [Temps+2]
  cmp word ax, `\x04`
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L145
  mov ax, 255
  cmp word ax, [Temps+4]
  call Bare_make_bool_from_n
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L146
  mov ax, [Temps+4]
  cmp word ax, 255
  call Bare_make_bool_from_z
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L154
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
  push word L155
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+16]
  cmp word [bx], 3
  jz L156
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+18], ax
  mov bx, [Temps+18]
  cmp word [bx], 3
  jz L157
  mov ax, 53
  cmp word ax, [Temps+14]
  call Bare_make_bool_from_n
  mov [Temps+20], ax
  mov bx, [Temps+20]
  cmp word [bx], 3
  jz L158
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

L160: ; Arm: 236'36
  mov si, g35
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L161: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L162: ; Arm: 228'7
  mov si, [bp+10]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L163: ; Arm: 199'9
  mov si, g38
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L164: ; Arm: 203'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L165: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L164
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L166: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L165
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L167: ; Function: (loop,t3)
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L163
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
  push word L166
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov si, [Temps+6]
  jmp [bp]

L168: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L169: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L168
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L170: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L169
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L171: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L170
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+4]
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
  mov bp, [bp+10]
  mov si, si
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
  mov bx, bp
  mov bp, si
  mov si, [bx+12]
  jmp [bp]

L174: ; Continuation
  Bare_enter_check(16)
  push word [bp+10]
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L173
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g8
  mov si, g46
  jmp [bp]

L175: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L174
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g8
  mov si, si
  jmp [bp]

L176: ; Continuation
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L175
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov si, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L177: ; Continuation
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L176
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov si, g45
  jmp [bp]

L178: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L177
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov si, si
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
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L179
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+12]
  jmp [bp]

L181: ; Continuation
  Bare_enter_check(16)
  push word [bp+10]
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L180
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g8
  mov si, g44
  jmp [bp]

L182: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L181
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g8
  mov si, si
  jmp [bp]

L183: ; Continuation
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L182
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov si, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L184: ; Continuation
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L183
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov si, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L185: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L184
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L186: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L185
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+10]
  mov si, si
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
  mov bx, bp
  mov bp, si
  mov si, [bx+14]
  jmp [bp]

L188: ; Continuation
  Bare_enter_check(18)
  push word [bp+12]
  push word [bp+10]
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L187
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, g8
  mov si, g43
  jmp [bp]

L189: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L188
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g8
  mov si, si
  jmp [bp]

L190: ; Continuation
  Bare_enter_check(16)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L189
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov si, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L191: ; Continuation
  Bare_enter_check(16)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L190
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov si, g42
  jmp [bp]

L192: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L191
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L193: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L192
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+10]
  mov si, si
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
  mov bx, bp
  mov bp, si
  mov si, [bx+14]
  jmp [bp]

L195: ; Continuation
  Bare_enter_check(18)
  push word [bp+12]
  push word [bp+10]
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L194
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, g8
  mov si, g41
  jmp [bp]

L196: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L195
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g8
  mov si, si
  jmp [bp]

L197: ; Continuation
  Bare_enter_check(16)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L196
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov si, g40
  jmp [bp]

L198: ; Arm: 220'9
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L197
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov si, g39
  jmp [bp]

L199: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L200: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L199
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L201: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L200
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L202: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L201
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L203: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L202
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov si, si
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
  mov bx, bp
  mov bp, si
  mov si, [bx+12]
  jmp [bp]

L205: ; Continuation
  Bare_enter_check(16)
  push word [bp+10]
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L204
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g8
  mov si, g54
  jmp [bp]

L206: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L205
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g8
  mov si, si
  jmp [bp]

L207: ; Continuation
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L206
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov si, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L208: ; Continuation
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L207
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov si, g53
  jmp [bp]

L209: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L208
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L210: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L209
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov si, si
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
  mov bx, bp
  mov bp, si
  mov si, [bx+12]
  jmp [bp]

L212: ; Continuation
  Bare_enter_check(16)
  push word [bp+10]
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L211
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g8
  mov si, g52
  jmp [bp]

L213: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L212
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g8
  mov si, si
  jmp [bp]

L214: ; Continuation
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L213
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov si, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L215: ; Continuation
  Bare_enter_check(14)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L214
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov si, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L216: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L215
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L217: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L216
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+10]
  mov si, si
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
  mov bx, bp
  mov bp, si
  mov si, [bx+14]
  jmp [bp]

L219: ; Continuation
  Bare_enter_check(18)
  push word [bp+12]
  push word [bp+10]
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L218
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, g8
  mov si, g51
  jmp [bp]

L220: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L219
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g8
  mov si, si
  jmp [bp]

L221: ; Continuation
  Bare_enter_check(16)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L220
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov si, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L222: ; Continuation
  Bare_enter_check(16)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L221
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov si, g50
  jmp [bp]

L223: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L222
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L224: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L223
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+10]
  mov si, si
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
  mov bx, bp
  mov bp, si
  mov si, [bx+14]
  jmp [bp]

L226: ; Continuation
  Bare_enter_check(18)
  push word [bp+12]
  push word [bp+10]
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L225
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, g8
  mov si, g49
  jmp [bp]

L227: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L226
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g8
  mov si, si
  jmp [bp]

L228: ; Continuation
  Bare_enter_check(16)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L227
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov si, g48
  jmp [bp]

L229: ; Arm: 223'14
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L228
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov si, g47
  jmp [bp]

L230: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L231: ; Continuation
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L198
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L229
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [bp+12]
  push word [CurrentCont]
  push word L230
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+8]
  mov bp, [Temps+6]
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
  mov bp, [bp+14]
  mov si, si
  jmp [bp]

L233: ; Continuation
  Bare_enter_check(34)
  push word [bp+12]
  push word [CurrentCont]
  push word L161
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, si
  cmp word [bx], 1
  jz L162
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+2]
  push word [bp+8]
  push word L167
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L232
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
  mov bx, bp
  mov bp, si
  mov si, [bx+14]
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
  mov bp, g8
  mov si, g37
  jmp [bp]

L236: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L235
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, [bp+14]
  mov si, si
  jmp [bp]

L237: ; Continuation
  Bare_enter_check(18)
  push word si
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L236
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov si, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L238: ; Continuation
  Bare_enter_check(18)
  mov bx, si
  cmp word [bx], 3
  jz L160
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L237
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, [bp+10]
  mov si, g36
  jmp [bp]

L239: ; Continuation
  Bare_enter_check(20)
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L238
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+16]
  jmp [bp]

L240: ; Continuation
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
  push word L239
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L241: ; Continuation
  Bare_enter_check(26)
  push word [bp+6]
  push word L159
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
  push word L240
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, [Temps+2]
  mov si, g34
  jmp [bp]

L242: ; Continuation
  Bare_enter_check(28)
  push word g30
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
  push word L241
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, [bp+4]
  mov si, [Temps+2]
  jmp [bp]

L243: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L242
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L244: ; Function: (mainloop,t2)
  Bare_enter_check(20)
  push word bp
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L243
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, [bp+6]
  mov si, g29
  jmp [bp]

L245: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L246: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L245
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L247: ; Arm: 257'7
  push word [bp+8]
  push word [CurrentCont]
  push word L246
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov si, g63
  jmp [bp]

L248: ; Arm: 199'9
  mov si, g64
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L249: ; Arm: 203'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L250: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L249
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L251: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L250
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L252: ; Function: (loop,t3)
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L248
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
  push word L251
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov si, [Temps+6]
  jmp [bp]

L253: ; Arm: 199'9
  mov si, g73
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L254: ; Arm: 203'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L255: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L254
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L256: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L255
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L257: ; Function: (loop,t1)
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L253
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
  push word L256
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov si, [Temps+6]
  jmp [bp]

L258: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L259: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L258
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L260: ; Arm: 250'11
  push word g77
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g74
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L259
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+4]
  jmp [bp]

L261: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L262: ; Arm: 253'16
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L261
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, [Temps+4]
  jmp [bp]

L263: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
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
  Bare_enter_check(24)
  mov bx, si
  cmp word [bx], 1
  jz L260
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L262
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word g81
  push word [bp+8]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [Temps+8]
  push word g78
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L264
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+10]
  jmp [bp]

L266: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L265
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov si, si
  jmp [bp]

L267: ; Function: (lam,t1)
  Bare_enter_check(22)
  push word si
  push word [bp+4]
  push word L257
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word si
  push word [bp+6]
  push word [bp+2]
  push word [CurrentCont]
  push word L266
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

L268: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L269: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L268
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L270: ; Continuation
  Bare_enter_check(22)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L267
  mov [Temps+2], sp
  push word 10 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word [CurrentCont]
  push word L269
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g5
  mov si, [Temps+2]
  jmp [bp]

L271: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
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

L273: ; Arm: 250'11
  push word g68
  push word [bp+12]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g65
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L272
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+8]
  mov si, [Temps+4]
  jmp [bp]

L274: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L275: ; Arm: 253'16
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L274
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, [Temps+4]
  jmp [bp]

L276: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
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
  Bare_enter_check(40)
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L270
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, si
  cmp word [bx], 1
  jz L273
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L275
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word g72
  push word [bp+12]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [Temps+8]
  push word g69
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L277
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+8]
  mov si, [Temps+10]
  jmp [bp]

L279: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L278
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, [bp+16]
  mov si, si
  jmp [bp]

L280: ; Function: (lam,t1)
  Bare_enter_check(28)
  mov bx, si
  cmp word [bx], 1
  jz L247
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+2]
  push word [bp+4]
  push word L252
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
  push word L279
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

L281: ; Function: (lam,t1)
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L280
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L282: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L283: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L282
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L284: ; Arm: 294'7
  push word [bp+8]
  push word [CurrentCont]
  push word L283
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov si, g84
  jmp [bp]

L285: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L286: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L285
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L287: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L286
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L288: ; Arm: 297'10
  push word g88
  push word [Temps+2]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word g85
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word [bp+2]
  push word [CurrentCont]
  push word L287
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+8]
  jmp [bp]

L289: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L290: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L289
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L291: ; Arm: 300'12
  mov ax, [bx+2]
  mov [Temps+10], ax
  mov ax, [bx+4]
  mov [Temps+12], ax
  push word [bp+8]
  push word [CurrentCont]
  push word L290
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov si, g89
  jmp [bp]

L292: ; Arm: 199'9
  mov si, g90
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L293: ; Arm: 203'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L294: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L293
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L295: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L294
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L296: ; Function: (loop,t5)
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L292
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
  push word L295
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov si, [Temps+6]
  jmp [bp]

L297: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L298: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L297
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L299: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L298
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L300: ; Arm: 303'15
  push word g94
  push word [bp+10]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g91
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L299
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+4]
  jmp [bp]

L301: ; Continuation
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

L302: ; Continuation
  Bare_enter_check(26)
  mov bx, si
  cmp word [bx], 1
  jz L300
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [bp+12]
  push word [CurrentCont]
  push word L301
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

L303: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L302
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, [bp+14]
  mov si, si
  jmp [bp]

L304: ; Function: (lam,t1)
  Bare_enter_check(26)
  mov bx, si
  cmp word [bx], 1
  jz L284
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 1
  jz L288
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L291
  push word [Temps+2]
  push word [bp+4]
  push word L296
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [Temps+10]
  push word [Temps+6]
  push word [Temps+2]
  push word [bp+8]
  push word [bp+6]
  push word [bp+2]
  push word [CurrentCont]
  push word L303
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

L305: ; Function: (lam,t4)
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L304
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L306: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
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

L308: ; Arm: 337'7
  push word [bp+14]
  push word [CurrentCont]
  push word L307
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, g97
  jmp [bp]

L309: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L310: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L309
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L311: ; Arm: 340'12
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [bp+14]
  push word [CurrentCont]
  push word L310
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, g98
  jmp [bp]

L312: ; Arm: 149'22
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov bp, [bp+2]
  mov si, si
  jmp [bp]

L313: ; Arm: 150'28
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

L314: ; Arm: 151'19
  mov bp, bp
  mov si, si
  jmp [bp]

L315: ; Arm: 154'17
  mov bp, bp
  mov si, si
  jmp [bp]

L316: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L317: ; Arm: 158'28
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

L318: ; Arm: 159'29
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

L319: ; Arm: 160'32
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

L320: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L316
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L317
  mov ax, [bp+8]
  cmp word ax, 65
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L318
  mov ax, 253
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L319
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

L321: ; Arm: 8'9
  mov si, g101
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L322: ; Arm: 152'21
  mov bx, si
  cmp word [bx], 1
  jz L315
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
  push word L320
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+20]
  cmp word [bx], 3
  jz L321
  mov si, g102
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L323: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+2]
  jmp [bp]

L324: ; Arm: 105'19
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+18], ax
  mov si, [Temps+18]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L325: ; Arm: 106'22
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+20], ax
  mov si, [Temps+20]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L326: ; Arm: 107'16
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+22], ax
  mov si, [Temps+22]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L327: ; Function: (readloop,t1)
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
  jz L312
  mov ax, [Temps+2]
  cmp word ax, `\x04`
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L313
  mov ax, 255
  cmp word ax, [Temps+4]
  call Bare_make_bool_from_n
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L314
  mov ax, [Temps+4]
  cmp word ax, 255
  call Bare_make_bool_from_z
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L322
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
  push word L323
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+16]
  cmp word [bx], 3
  jz L324
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+18], ax
  mov bx, [Temps+18]
  cmp word [bx], 3
  jz L325
  mov ax, 53
  cmp word ax, [Temps+14]
  call Bare_make_bool_from_n
  mov [Temps+20], ax
  mov bx, [Temps+20]
  cmp word [bx], 3
  jz L326
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

L328: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L329: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L328
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L330: ; Arm: 345'44
  push word [bp+10]
  push word [bp+8]
  push word [CurrentCont]
  push word L329
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g8
  mov si, g104
  jmp [bp]

L331: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word si
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+2]
  jmp [bp]

L332: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L331
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+4]
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
  mov bp, [bp+10]
  mov si, si
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
  mov bx, bp
  mov bp, si
  mov si, [bx+12]
  jmp [bp]

L335: ; Continuation
  Bare_enter_check(16)
  push word [bp+10]
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L334
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, g8
  mov si, g106
  jmp [bp]

L336: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L335
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g8
  mov si, si
  jmp [bp]

L337: ; Continuation
  Bare_enter_check(14)
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L336
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov si, g105
  jmp [bp]

L338: ; Continuation
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 3
  jz L330
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L337
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov si, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L339: ; Continuation
  Bare_enter_check(18)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L338
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+10]
  jmp [bp]

L340: ; Continuation
  Bare_enter_check(20)
  push word si
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L339
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L341: ; Function: (loop,t1)
  Bare_enter_check(26)
  push word [bp+4]
  push word L327
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
  push word L340
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, [Temps+2]
  mov si, g103
  jmp [bp]

L342: ; Continuation
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

L343: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+6]
  push word [CurrentCont]
  push word L342
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

L344: ; Continuation
  Bare_enter_check(26)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L341
  mov [Temps+2], sp
  push word 14 ;; scanned
  push word [bp+18]
  push word [bp+16]
  push word [CurrentCont]
  push word L343
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [Temps+2]
  mov si, g107
  jmp [bp]

L345: ; Continuation
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
  push word L344
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L346: ; Function: (lam,t1)
  Bare_enter_check(22)
  mov bx, si
  cmp word [bx], 1
  jz L308
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L311
  push word [Temps+2]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L345
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov bp, [bp+6]
  mov si, g99
  jmp [bp]

L347: ; Function: (lam,t7)
  Bare_enter_check(18)
  push word si
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L346
  mov [Temps+2], sp
  push word 16 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L348: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L349: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L348
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L350: ; Arm: 332'7
  push word [bp+8]
  push word [CurrentCont]
  push word L349
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov si, g110
  jmp [bp]

L351: ; Arm: 199'9
  mov si, g111
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L352: ; Arm: 203'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L353: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L352
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L354: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L353
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L355: ; Function: (loop,t1)
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L351
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
  push word L354
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov si, [Temps+6]
  jmp [bp]

L356: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L357: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L356
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L358: ; Arm: 325'11
  push word g114
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L357
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+2]
  jmp [bp]

L359: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L360: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L359
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L361: ; Arm: 328'16
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word g117
  push word [bp+8]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L360
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+6]
  jmp [bp]

L362: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L363: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L362
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L364: ; Continuation
  Bare_enter_check(16)
  mov bx, si
  cmp word [bx], 1
  jz L358
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L361
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word g120
  push word [bp+8]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L363
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+8]
  jmp [bp]

L365: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L364
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov si, si
  jmp [bp]

L366: ; Function: (lam,t3)
  Bare_enter_check(22)
  push word si
  push word [bp+4]
  push word L355
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word si
  push word [bp+6]
  push word [bp+2]
  push word [CurrentCont]
  push word L365
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
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L369: ; Function: (lam,t1)
  Bare_enter_check(22)
  mov bx, si
  cmp word [bx], 1
  jz L350
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L366
  mov [Temps+6], sp
  push word 10 ;; scanned
  push word si
  push word [bp+8]
  push word [CurrentCont]
  push word L368
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g5
  mov si, [Temps+6]
  jmp [bp]

L370: ; Function: (lam,t10)
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L369
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L371: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L372: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L371
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L373: ; Arm: 242'9
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [bp+4]
  push word [CurrentCont]
  push word L372
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov si, g123
  jmp [bp]

L374: ; Arm: 210'9
  mov si, g125
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L375: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L376: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L375
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L377: ; Function: (loop,t1)
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 1
  jz L374
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
  push word L376
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+2]
  mov si, [Temps+2]
  jmp [bp]

L378: ; Continuation
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

L379: ; Arm: 214'9
  mov si, g126
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L380: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L381: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L380
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L382: ; Continuation
  Bare_enter_check(24)
  push word [bp+4]
  push word L377
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+6]
  push word [CurrentCont]
  push word L378
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, si
  cmp word [bx], 1
  jz L379
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [Temps+6]
  push word [Temps+2]
  push word [CurrentCont]
  push word L381
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov si, [Temps+4]
  jmp [bp]

L383: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L382
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L384: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L383
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

L385: ; Function: (lam,t1)
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 3
  jz L373
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L384
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g3
  mov si, g124
  jmp [bp]

L386: ; Function: (lam,t13)
  Bare_enter_check(8)
  push word si
  push word [bp+2]
  push word L385
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L387: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L388: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L387
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L389: ; Arm: 271'7
  push word [bp+8]
  push word [CurrentCont]
  push word L388
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov si, g129
  jmp [bp]

L390: ; Arm: 199'9
  mov si, g130
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L391: ; Arm: 203'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L392: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L391
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L393: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L392
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L394: ; Function: (loop,t3)
  Bare_enter_check(14)
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
  push word [Temps+4]
  push word bp
  push word [bp+4]
  push word [CurrentCont]
  push word L393
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov si, [Temps+6]
  jmp [bp]

L395: ; Arm: 199'9
  mov si, g139
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L396: ; Arm: 203'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L397: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L396
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L398: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L397
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L399: ; Function: (loop,t1)
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L395
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
  push word L398
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov si, [Temps+6]
  jmp [bp]

L400: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L401: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L400
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L402: ; Arm: 264'11
  push word g143
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g140
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L401
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+4]
  jmp [bp]

L403: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L404: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L403
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L405: ; Arm: 267'16
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word g147
  push word [bp+8]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word g144
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L404
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+8]
  jmp [bp]

L406: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L407: ; Continuation
  Bare_enter_check(24)
  mov bx, si
  cmp word [bx], 1
  jz L402
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L405
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [CurrentCont]
  push word L406
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, [Temps+4]
  jmp [bp]

L408: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L407
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov si, si
  jmp [bp]

L409: ; Function: (lam,t1)
  Bare_enter_check(22)
  push word si
  push word [bp+4]
  push word L399
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word si
  push word [bp+6]
  push word [bp+2]
  push word [CurrentCont]
  push word L408
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

L410: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L411: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L410
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+6]
  jmp [bp]

L412: ; Continuation
  Bare_enter_check(22)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L409
  mov [Temps+2], sp
  push word 10 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word [CurrentCont]
  push word L411
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g5
  mov si, [Temps+2]
  jmp [bp]

L413: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L414: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L413
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L415: ; Arm: 264'11
  push word g134
  push word [bp+12]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g131
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L414
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+8]
  mov si, [Temps+4]
  jmp [bp]

L416: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L417: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L416
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L418: ; Arm: 267'16
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word g138
  push word [bp+12]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word g135
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L417
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+8]
  mov si, [Temps+8]
  jmp [bp]

L419: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L420: ; Continuation
  Bare_enter_check(40)
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L412
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, si
  cmp word [bx], 1
  jz L415
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L418
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [CurrentCont]
  push word L419
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, [Temps+4]
  jmp [bp]

L421: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L420
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, [bp+16]
  mov si, si
  jmp [bp]

L422: ; Function: (lam,t1)
  Bare_enter_check(28)
  mov bx, si
  cmp word [bx], 1
  jz L389
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+2]
  push word [bp+4]
  push word L394
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
  push word L421
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

L423: ; Function: (lam,t16)
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L422
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L424: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L425: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L424
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L426: ; Arm: 309'7
  push word [bp+8]
  push word [CurrentCont]
  push word L425
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov si, g150
  jmp [bp]

L427: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L428: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L427
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L429: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L428
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L430: ; Arm: 312'10
  push word g154
  push word [Temps+2]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word g151
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word [bp+2]
  push word [CurrentCont]
  push word L429
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+8]
  jmp [bp]

L431: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L432: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L431
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L433: ; Arm: 315'12
  mov ax, [bx+2]
  mov [Temps+10], ax
  mov ax, [bx+4]
  mov [Temps+12], ax
  push word [bp+8]
  push word [CurrentCont]
  push word L432
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov si, g155
  jmp [bp]

L434: ; Arm: 199'9
  mov si, g156
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L435: ; Arm: 203'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L436: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L435
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L437: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L436
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L438: ; Function: (loop,t5)
  Bare_enter_check(14)
  mov bx, si
  cmp word [bx], 1
  jz L434
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
  push word L437
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, [bp+2]
  mov si, [Temps+6]
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

L441: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L440
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L442: ; Arm: 318'15
  push word g160
  push word [bp+12]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g157
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+10]
  push word [bp+4]
  push word [CurrentCont]
  push word L441
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, [Temps+4]
  jmp [bp]

L443: ; Continuation
  Bare_enter_check(0)
  mov si, g165
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L444: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L443
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g25
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

L446: ; Arm: 277'9
  push word g164
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g161
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+2]
  push word [CurrentCont]
  push word L445
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+4]
  jmp [bp]

L447: ; Arm: 282'35
  mov si, [bp+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L448: ; Continuation
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

L449: ; Continuation
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 3
  jz L447
  push word [bp+10]
  push word [bp+8]
  push word [CurrentCont]
  push word L448
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L450: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L449
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L451: ; Function: (loop,t2)
  Bare_enter_check(24)
  mov bx, si
  cmp word [bx], 1
  jz L446
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
  push word L450
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov si, [Temps+6]
  jmp [bp]

L452: ; Continuation
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

L453: ; Continuation
  Bare_enter_check(16)
  push word si
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L452
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

L454: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L453
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov si, si
  jmp [bp]

L455: ; Continuation
  Bare_enter_check(26)
  mov bx, si
  cmp word [bx], 1
  jz L442
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L451
  mov [Temps+4], sp
  push word 10 ;; scanned
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+14]
  push word [CurrentCont]
  push word L454
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

L456: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L455
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bp, [bp+16]
  mov si, si
  jmp [bp]

L457: ; Function: (lam,t1)
  Bare_enter_check(28)
  mov bx, si
  cmp word [bx], 1
  jz L426
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 1
  jz L430
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L433
  push word [Temps+2]
  push word [bp+4]
  push word L438
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
  push word L456
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

L458: ; Function: (lam,t19)
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L457
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L459: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L460: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L459
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L461: ; Arm: 289'7
  push word [bp+8]
  push word [CurrentCont]
  push word L460
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov si, g168
  jmp [bp]

L462: ; Continuation
  Bare_enter_check(0)
  mov si, g173
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L463: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L462
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L464: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L463
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L465: ; Arm: 277'9
  push word g172
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g169
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+2]
  push word [CurrentCont]
  push word L464
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+4]
  jmp [bp]

L466: ; Arm: 282'35
  mov si, [bp+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L467: ; Continuation
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

L468: ; Continuation
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 3
  jz L466
  push word [bp+10]
  push word [bp+8]
  push word [CurrentCont]
  push word L467
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L469: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L468
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L470: ; Function: (loop,t1)
  Bare_enter_check(24)
  mov bx, si
  cmp word [bx], 1
  jz L465
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
  push word L469
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov si, [Temps+6]
  jmp [bp]

L471: ; Continuation
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

L472: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L471
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L473: ; Function: (lam,t1)
  Bare_enter_check(20)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L470
  mov [Temps+2], sp
  push word 10 ;; scanned
  push word [Temps+2]
  push word [CurrentCont]
  push word L472
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

L474: ; Function: (lam,t3)
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L473
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L475: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L476: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L475
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L477: ; Function: (lam,t1)
  Bare_enter_check(20)
  mov bx, si
  cmp word [bx], 1
  jz L461
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L474
  mov [Temps+6], sp
  push word 8 ;; scanned
  push word si
  push word [bp+8]
  push word [CurrentCont]
  push word L476
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g7
  mov si, [Temps+6]
  jmp [bp]

L478: ; Function: (lam,t22)
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L477
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L479: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L480: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L479
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L481: ; Arm: 384'7
  push word [bp+4]
  push word [CurrentCont]
  push word L480
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov si, g180
  jmp [bp]

L482: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L483: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L482
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L484: ; Arm: 387'12
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [bp+4]
  push word [CurrentCont]
  push word L483
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+2]
  mov si, g181
  jmp [bp]

L485: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L486: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L485
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L487: ; Arm: 390'15
  push word [bp+6]
  push word [CurrentCont]
  push word L486
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov si, g190
  jmp [bp]

L488: ; Arm: 356'13
  mov si, g191
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L489: ; Continuation
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

L490: ; Continuation
  Bare_enter_check(8)
  push word si
  push word `-`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, [Temps+2]
  jmp [bp]

L491: ; Arm: 124'11
  push word g201
  push word `0`
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  mov si, [Temps+8]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L492: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L493: ; Arm: 128'2
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
  push word L490
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L491
  push word [Temps+4]
  push word [CurrentCont]
  push word L492
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g200
  mov si, g202
  jmp [bp]

L494: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L495: ; Arm: 124'11
  push word g204
  push word `0`
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  mov si, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L496: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L497: ; Continuation
  Bare_enter_check(24)
  mov ax, [bp+8]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L489
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L493
  mov ax, [bp+8]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L494
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L495
  push word [bp+8]
  push word [CurrentCont]
  push word L496
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g203
  mov si, g205
  jmp [bp]

L498: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L497
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L499: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L498
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov si, g199
  jmp [bp]

L500: ; Continuation
  Bare_enter_check(8)
  push word si
  push word `-`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, g25
  mov si, [Temps+2]
  jmp [bp]

L501: ; Arm: 124'11
  push word g194
  push word `0`
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  mov si, [Temps+8]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L502: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L503: ; Arm: 128'2
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
  push word L500
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L501
  push word [Temps+4]
  push word [CurrentCont]
  push word L502
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g193
  mov si, g195
  jmp [bp]

L504: ; Continuation
  Bare_enter_check(0)
  mov bp, g25
  mov si, si
  jmp [bp]

L505: ; Arm: 124'11
  push word g197
  push word `0`
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  mov si, [Temps+6]
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
  push word L499
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L503
  mov ax, [bp+6]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L504
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L505
  push word [bp+6]
  push word [CurrentCont]
  push word L506
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g196
  mov si, g198
  jmp [bp]

L508: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L507
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bp, g25
  mov si, si
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
  mov bp, [bp+4]
  mov si, g192
  jmp [bp]

L510: ; Function: (loop,t2)
  Bare_enter_check(12)
  mov ax, [bp+4]
  cmp word ax, si
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L488
  push word bp
  push word si
  push word [bp+2]
  push word [CurrentCont]
  push word L509
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g55
  mov si, si
  jmp [bp]

L511: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L512: ; Continuation
  Bare_enter_check(16)
  mov bx, si
  cmp word [bx], 1
  jz L487
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [bp+4]
  push word L510
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+6]
  push word [CurrentCont]
  push word L511
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [Temps+4]
  mov si, 1
  jmp [bp]

L513: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L512
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+8]
  jmp [bp]

L514: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L513
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g182
  mov si, 1
  jmp [bp]

L515: ; Function: (lam,t1)
  Bare_enter_check(10)
  mov bx, si
  cmp word [bx], 1
  jz L481
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L484
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L514
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+2]
  mov si, [Temps+2]
  jmp [bp]

L516: ; Function: (lam,t25)
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
  Bare_enter_check(326)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L281
  mov [Temps+2], sp
  push word 8 ;; scanned
  push word [Temps+2]
  push word g62
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [Temps+4]
  push word g61
  push word 1
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L305
  mov [Temps+8], sp
  push word 8 ;; scanned
  push word [Temps+8]
  push word g83
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [Temps+10]
  push word g82
  push word 1
  mov [Temps+12], sp
  push word 6 ;; scanned
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L347
  mov [Temps+14], sp
  push word 14 ;; scanned
  push word [Temps+14]
  push word g96
  push word 3
  mov [Temps+16], sp
  push word 6 ;; scanned
  push word [Temps+16]
  push word g95
  push word 1
  mov [Temps+18], sp
  push word 6 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L370
  mov [Temps+20], sp
  push word 8 ;; scanned
  push word [Temps+20]
  push word g109
  push word 3
  mov [Temps+22], sp
  push word 6 ;; scanned
  push word [Temps+22]
  push word g108
  push word 1
  mov [Temps+24], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word L386
  mov [Temps+26], sp
  push word 4 ;; scanned
  push word [Temps+26]
  push word g122
  push word 3
  mov [Temps+28], sp
  push word 6 ;; scanned
  push word [Temps+28]
  push word g121
  push word 1
  mov [Temps+30], sp
  push word 6 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L423
  mov [Temps+32], sp
  push word 8 ;; scanned
  push word [Temps+32]
  push word g128
  push word 3
  mov [Temps+34], sp
  push word 6 ;; scanned
  push word [Temps+34]
  push word g127
  push word 1
  mov [Temps+36], sp
  push word 6 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L458
  mov [Temps+38], sp
  push word 8 ;; scanned
  push word [Temps+38]
  push word g149
  push word 3
  mov [Temps+40], sp
  push word 6 ;; scanned
  push word [Temps+40]
  push word g148
  push word 1
  mov [Temps+42], sp
  push word 6 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word L478
  mov [Temps+44], sp
  push word 8 ;; scanned
  push word [Temps+44]
  push word g167
  push word 3
  mov [Temps+46], sp
  push word 6 ;; scanned
  push word [Temps+46]
  push word g166
  push word 1
  mov [Temps+48], sp
  push word 6 ;; scanned
  push word [bp+8]
  push word L516
  mov [Temps+50], sp
  push word 4 ;; scanned
  push word [Temps+50]
  push word g179
  push word 3
  mov [Temps+52], sp
  push word 6 ;; scanned
  push word [Temps+52]
  push word g178
  push word 1
  mov [Temps+54], sp
  push word 6 ;; scanned
  push word g219
  push word [Temps+54]
  push word 3
  mov [Temps+56], sp
  push word 6 ;; scanned
  push word [Temps+56]
  push word g177
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
  push word g60
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

L518: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L517
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, g25
  mov si, si
  jmp [bp]

L519: ; Continuation
  Bare_enter_check(40)
  push word [bp+6]
  push word L143
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L244
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
  push word L518
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bp, [bp+8]
  mov si, g56
  jmp [bp]

L520: ; Continuation
  Bare_enter_check(32)
  push word [bp+8]
  push word [bp+4]
  push word L126
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word g27
  push word `\x04`
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L519
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov si, [Temps+4]
  jmp [bp]

L521: ; Continuation
  Bare_enter_check(12)
  push word si
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L520
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bp, g1
  mov si, g22
  jmp [bp]

L522: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L521
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g1
  mov si, g14
  jmp [bp]

L523: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L522
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g1
  mov si, g12
  jmp [bp]

L524: ; Start
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L523
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g1
  mov si, g10
  jmp [bp]

g1:
  dw L2
g2:
  dw L5
g3:
  dw L11
g4:
  dw 1
g5:
  dw L16
g6:
  dw 1
g7:
  dw L24
g8:
  dw L28
g9:
  dw 1
g10:
  dw L36
g11:
  dw 1
g12:
  dw L44
g13:
  dw 1
g14:
  dw L50
g15:
  dw 1
g16:
  dw 3
g17:
  dw 1
g18:
  dw 3
g19:
  dw 1
g20:
  dw 3
g21:
  dw 1
g22:
  dw L60
g23:
  dw 1
  db ``
g24:
  dw 1
g25:
  dw L66
g26:
  dw 1
g27:
  dw 1
g28:
  dw 1
g29:
  dw 5
  db `% `
g30:
  dw 1
g31:
  dw 1
g32:
  dw 1
g33:
  dw 3
g34:
  dw 1
g35:
  dw 1
g36:
  dw 1
g37:
  dw 1
g38:
  dw 1
g39:
  dw 35
  db `command not found`
g40:
  dw 3
  db `\n`
g41:
  dw 1
g42:
  dw 5
  db `: `
g43:
  dw 1
g44:
  dw 1
g45:
  dw 13
  db `sham: `
g46:
  dw 1
g47:
  dw 35
  db `Permission denied`
g48:
  dw 3
  db `\n`
g49:
  dw 1
g50:
  dw 5
  db `: `
g51:
  dw 1
g52:
  dw 1
g53:
  dw 13
  db `sham: `
g54:
  dw 1
g55:
  dw L70
g56:
  dw 103
  db `Sham: In-memory file-system. Consider typing "ls".\n`
g57:
  dw 13
  db `readme`
g58:
  dw 165
  db `Welcome to sham; please try all the commands!\nCan you find the hidden Easter Egg?\n`
g59:
  dw 1, g58
g60:
  dw 1, g57, g59
g61:
  dw 7
  db `cat`
g62:
  dw 115
  db `cat - concatenate files and print on the standard output\n`
g63:
  dw 67
  db `cat: takes at least one argument\n`
g64:
  dw 1
g65:
  dw 11
  db `cat: `
g66:
  dw 59
  db ` : No such file or directory\n`
g67:
  dw 1
g68:
  dw 3, g66, g67
g69:
  dw 11
  db `cat: `
g70:
  dw 39
  db ` : Not a data file\n`
g71:
  dw 1
g72:
  dw 3, g70, g71
g73:
  dw 1
g74:
  dw 11
  db `cat: `
g75:
  dw 59
  db ` : No such file or directory\n`
g76:
  dw 1
g77:
  dw 3, g75, g76
g78:
  dw 11
  db `cat: `
g79:
  dw 39
  db ` : Not a data file\n`
g80:
  dw 1
g81:
  dw 3, g79, g80
g82:
  dw 5
  db `cp`
g83:
  dw 65
  db `cp - copy files and directories\n`
g84:
  dw 51
  db `cp: missing file operand\n`
g85:
  dw 89
  db `cp: missing destination file operand after '`
g86:
  dw 5
  db `'\n`
g87:
  dw 1
g88:
  dw 3, g86, g87
g89:
  dw 61
  db `cp: unexpected extra operands\n`
g90:
  dw 1
g91:
  dw 35
  db `cp: cannot stat '`
g92:
  dw 59
  db `': No such file or directory\n`
g93:
  dw 1
g94:
  dw 3, g92, g93
g95:
  dw 13
  db `create`
g96:
  dw 55
  db `create - create a new file\n`
g97:
  dw 53
  db `create: missing file name\n`
g98:
  dw 69
  db `create: unexpected extra operands\n`
g99:
  dw 69
  db `(to finish type ^D on a new line)\n`
g100:
  dw 1
g101:
  dw 1
g102:
  dw 3
g103:
  dw 1
g104:
  dw 1
g105:
  dw 3
  db `\n`
g106:
  dw 1
g107:
  dw 1
g108:
  dw 9
  db `file`
g109:
  dw 55
  db `file - determine file type\n`
g110:
  dw 69
  db `file: takes at least one argument\n`
g111:
  dw 1
g112:
  dw 59
  db ` : No such file or directory\n`
g113:
  dw 1
g114:
  dw 3, g112, g113
g115:
  dw 27
  db `: ASCII text\n`
g116:
  dw 1
g117:
  dw 3, g115, g116
g118:
  dw 27
  db `: executable\n`
g119:
  dw 1
g120:
  dw 3, g118, g119
g121:
  dw 5
  db `ls`
g122:
  dw 59
  db `ls - list directory contents\n`
g123:
  dw 47
  db `ls: takes no arguments\n`
g124:
  dw L71
g125:
  dw 1
g126:
  dw 1
g127:
  dw 7
  db `man`
g128:
  dw 103
  db `man - an interface to the system reference manuals\n`
g129:
  dw 61
  db `What manual page do you want?\n`
g130:
  dw 1
g131:
  dw 41
  db `No manual entry for `
g132:
  dw 3
  db `\n`
g133:
  dw 1
g134:
  dw 3, g132, g133
g135:
  dw 41
  db `No manual entry for `
g136:
  dw 3
  db `\n`
g137:
  dw 1
g138:
  dw 3, g136, g137
g139:
  dw 1
g140:
  dw 41
  db `No manual entry for `
g141:
  dw 3
  db `\n`
g142:
  dw 1
g143:
  dw 3, g141, g142
g144:
  dw 41
  db `No manual entry for `
g145:
  dw 3
  db `\n`
g146:
  dw 1
g147:
  dw 3, g145, g146
g148:
  dw 5
  db `mv`
g149:
  dw 51
  db `mv - move (rename) files\n`
g150:
  dw 51
  db `mv: missing file operand\n`
g151:
  dw 89
  db `mv: missing destination file operand after '`
g152:
  dw 5
  db `'\n`
g153:
  dw 1
g154:
  dw 3, g152, g153
g155:
  dw 61
  db `mv: unexpected extra operands\n`
g156:
  dw 1
g157:
  dw 35
  db `mv: cannot stat '`
g158:
  dw 59
  db `': No such file or directory\n`
g159:
  dw 1
g160:
  dw 3, g158, g159
g161:
  dw 39
  db `rm: cannot remove '`
g162:
  dw 59
  db `': No such file or directory\n`
g163:
  dw 1
g164:
  dw 3, g162, g163
g165:
  dw 1
g166:
  dw 5
  db `rm`
g167:
  dw 133
  db `rm - remove files or directories (directories not supported yet!)\n`
g168:
  dw 41
  db `rm: missing operand\n`
g169:
  dw 39
  db `rm: cannot remove '`
g170:
  dw 59
  db `': No such file or directory\n`
g171:
  dw 1
g172:
  dw 3, g170, g171
g173:
  dw 1
g174:
  dw 7
  db `cat`
g175:
  dw 439
  db `I have a little shadow that goes in and out with me,\nAnd what can be the use of him is more than I can see.\nHe is very, very like me from the heels up to the head;\nAnd I see him jump before me, when I jump into my bed.\n`
g176:
  dw 1, g175
g177:
  dw 1, g174, g176
g178:
  dw 7
  db `fib`
g179:
  dw 101
  db `fib - naive fib computation upto the given number\n`
g180:
  dw 45
  db `fib: missing argument\n`
g181:
  dw 69
  db `create: unexpected extra argument\n`
g182:
  dw L83
g183:
  dw 1
g184:
  dw 3
g185:
  dw 1
g186:
  dw 3
g187:
  dw 1
g188:
  dw 1
g189:
  dw 1
g190:
  dw 63
  db `fib: expected numeric argument\n`
g191:
  dw 1
g192:
  dw 9
  db `fib `
g193:
  dw L87
g194:
  dw 1
g195:
  dw 1
g196:
  dw L91
g197:
  dw 1
g198:
  dw 1
g199:
  dw 11
  db ` --> `
g200:
  dw L95
g201:
  dw 1
g202:
  dw 1
g203:
  dw L99
g204:
  dw 1
g205:
  dw 1
g206:
  dw 11
  db `space`
g207:
  dw 95
  db `space - where is the stack-pointer? (in words)\n`
g208:
  dw 1
g209:
  dw L103
g210:
  dw 1
g211:
  dw 1
g212:
  dw L107
g213:
  dw 1
g214:
  dw 1
g215:
  dw L117
g216:
  dw 3, g207, g215
g217:
  dw 1, g206, g216
g218:
  dw 1
g219:
  dw 3, g217, g218

bare_start: jmp L524
