L1: ; Arm: 21'7
  mov dx, g2
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L2: ; Function: (put_chars,g1)
  Bare_enter_check(0)
  mov bx, dx
  cmp word [bx], 1
  jz L1
  mov si, [bx+2]
  mov di, [bx+4]
  mov ax, si
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov bp, g1
  mov dx, di
  jmp [bp]

L3: ; Arm: 31'11
  mov dx, dx
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L4: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, dx
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L5: ; Continuation
  Bare_enter_check(8)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 5
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  push word dx
  push word cx
  push word L4
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g3
  mov dx, si
  jmp [bp]

L6: ; Function: (fib,g3)
  Bare_enter_check(8)
  mov ax, dx
  cmp word ax, 5
  call Bare_make_bool_from_n
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L3
  mov ax, dx
  shr ax, 1
  mov bx, 3
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov di, ax
  push word dx
  push word cx
  push word L5
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g3
  mov dx, di
  jmp [bp]

L7: ; Arm: 5'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L8: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L9: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L7
  mov ax, g5
  mov bx, dx
  shr bx, 1
  call Bare_get_bytes
  mov di, ax
  push word [bp+2]
  push word di
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L8
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g4
  mov dx, [Temps+6]
  jmp [bp]

L10: ; Function: (explode_loop,g4)
  Bare_enter_check(6)
  push word dx
  push word L9
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L11: ; Arm: 5'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L12: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L13: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L11
  mov ax, g9
  mov bx, dx
  shr bx, 1
  call Bare_get_bytes
  mov di, ax
  push word [bp+2]
  push word di
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L12
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g8
  mov dx, [Temps+6]
  jmp [bp]

L14: ; Function: (explode_loop,g8)
  Bare_enter_check(6)
  push word dx
  push word L13
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L15: ; Arm: 14'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L16: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L17: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L15
  mov ax, dx
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov di, dx
  pop word dx ;; restore
  mov ax, 97
  shr ax, 1
  mov bx, di
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  shr ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L16
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g11
  mov dx, [Temps+10]
  jmp [bp]

L18: ; Function: (loop,g11)
  Bare_enter_check(6)
  push word dx
  push word L17
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L19: ; Arm: 5'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L20: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L21: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L19
  mov ax, g15
  mov bx, dx
  shr bx, 1
  call Bare_get_bytes
  mov di, ax
  push word [bp+2]
  push word di
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L20
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g14
  mov dx, [Temps+6]
  jmp [bp]

L22: ; Function: (explode_loop,g14)
  Bare_enter_check(6)
  push word dx
  push word L21
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L23: ; Arm: 14'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L24: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L25: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L23
  mov ax, dx
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov di, dx
  pop word dx ;; restore
  mov ax, 97
  shr ax, 1
  mov bx, di
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  shr ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L24
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g17
  mov dx, [Temps+10]
  jmp [bp]

L26: ; Function: (loop,g17)
  Bare_enter_check(6)
  push word dx
  push word L25
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L27: ; Arm: 5'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L28: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L29: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L27
  mov ax, g21
  mov bx, dx
  shr bx, 1
  call Bare_get_bytes
  mov di, ax
  push word [bp+2]
  push word di
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L28
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g20
  mov dx, [Temps+6]
  jmp [bp]

L30: ; Function: (explode_loop,g20)
  Bare_enter_check(6)
  push word dx
  push word L29
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L31: ; Arm: 14'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L32: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L33: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L31
  mov ax, dx
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov di, dx
  pop word dx ;; restore
  mov ax, 97
  shr ax, 1
  mov bx, di
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  shr ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L32
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g24
  mov dx, [Temps+10]
  jmp [bp]

L34: ; Function: (loop,g24)
  Bare_enter_check(6)
  push word dx
  push word L33
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L35: ; Arm: 5'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L36: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L37: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L35
  mov ax, g28
  mov bx, dx
  shr bx, 1
  call Bare_get_bytes
  mov di, ax
  push word [bp+2]
  push word di
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L36
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g27
  mov dx, [Temps+6]
  jmp [bp]

L38: ; Function: (explode_loop,g27)
  Bare_enter_check(6)
  push word dx
  push word L37
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L39: ; Continuation
  Bare_enter_check(0)
  mov ax, `\n`
  call Bare_put_char
  mov si, Bare_unit
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov di, ax
  mov bp, g7
  mov dx, di
  jmp [bp]

L40: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L39
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g1
  mov dx, dx
  jmp [bp]

L41: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L40
  mov cx, sp
  push word 6 ;; scanned
  mov bp, dx
  mov dx, 1
  jmp [bp]

L42: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L41
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g27
  mov dx, g29
  jmp [bp]

L43: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L42
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g1
  mov dx, dx
  jmp [bp]

L44: ; Arm: 17'11
  push word g25
  push word `0`
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L45: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L46: ; Continuation
  Bare_enter_check(16)
  mov ax, g23
  call Bare_free_words
  shl ax, 1
  add ax, 1
  mov si, ax
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov di, ax
  push word [bp+4]
  push word cx
  push word L43
  mov cx, sp
  push word 6 ;; scanned
  mov bx, di
  cmp word [bx], 3
  jz L44
  push word si
  push word cx
  push word L45
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g24
  mov dx, g26
  jmp [bp]

L47: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L46
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g1
  mov dx, dx
  jmp [bp]

L48: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L47
  mov cx, sp
  push word 6 ;; scanned
  mov bp, dx
  mov dx, 15
  jmp [bp]

L49: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L48
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g20
  mov dx, g22
  jmp [bp]

L50: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L49
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g1
  mov dx, dx
  jmp [bp]

L51: ; Arm: 17'11
  push word g18
  push word `0`
  push word 3
  mov di, sp
  push word 6 ;; scanned
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L52: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L53: ; Continuation
  Bare_enter_check(16)
  mov ax, [bp+6]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  push word [bp+4]
  push word cx
  push word L50
  mov cx, sp
  push word 6 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L51
  push word [bp+6]
  push word cx
  push word L52
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g17
  mov dx, g19
  jmp [bp]

L54: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L53
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g1
  mov dx, dx
  jmp [bp]

L55: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L54
  mov cx, sp
  push word 8 ;; scanned
  mov bp, dx
  mov dx, 9
  jmp [bp]

L56: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L55
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g14
  mov dx, g16
  jmp [bp]

L57: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L56
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g1
  mov dx, dx
  jmp [bp]

L58: ; Arm: 17'11
  push word g12
  push word `0`
  push word 3
  mov di, sp
  push word 6 ;; scanned
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L59: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L60: ; Continuation
  Bare_enter_check(18)
  mov ax, [bp+4]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L57
  mov cx, sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L58
  push word [bp+4]
  push word cx
  push word L59
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g11
  mov dx, g13
  jmp [bp]

L61: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L60
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g1
  mov dx, dx
  jmp [bp]

L62: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L61
  mov cx, sp
  push word 8 ;; scanned
  mov bp, dx
  mov dx, 7
  jmp [bp]

L63: ; Continuation
  Bare_enter_check(10)
  push word dx
  push word [bp+4]
  push word cx
  push word L62
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g8
  mov dx, g10
  jmp [bp]

L64: ; Function: (loop,g7)
  Bare_enter_check(8)
  push word dx
  push word cx
  push word L63
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L65: ; Continuation
  Bare_enter_check(0)
  mov bp, g7
  mov dx, 1
  jmp [bp]

L66: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L65
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g1
  mov dx, dx
  jmp [bp]

L67: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L66
  mov cx, sp
  push word 4 ;; scanned
  mov bp, dx
  mov dx, 29
  jmp [bp]

L68: ; Start
  Bare_enter_check(6)
  push word cx
  push word L67
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g4
  mov dx, g6
  jmp [bp]

g1:
  dw L2
g2:
  dw 1
g3:
  dw L6
g4:
  dw L10
g5:
  dw 31
  db `Fib-forever...\n`
g6:
  dw 1
g7:
  dw L64
g8:
  dw L14
g9:
  dw 9
  db `fib `
g10:
  dw 1
g11:
  dw L18
g12:
  dw 1
g13:
  dw 1
g14:
  dw L22
g15:
  dw 11
  db ` --> `
g16:
  dw 1
g17:
  dw L26
g18:
  dw 1
g19:
  dw 1
g20:
  dw L30
g21:
  dw 17
  db ` (space=`
g22:
  dw 1
g23:
  dw 1
g24:
  dw L34
g25:
  dw 1
g26:
  dw 1
g27:
  dw L38
g28:
  dw 3
  db `)`
g29:
  dw 1

bare_start: jmp L68
