L1: ; Arm: 21'7
  mov ax, 1
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L2: ; Continuation
  xchg si, di
  Bare_heap_check(0)
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
  Bare_heap_check(6)
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

L4: ; Arm: 26'7
  mov ax, g3
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L5: ; Continuation
  xchg si, di
  Bare_heap_check(8)
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
  Bare_heap_check(8)
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
  Bare_heap_check(10)
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
  Bare_heap_check(10)
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
  Bare_heap_check(6)
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

L10: ; Arm: 31'7
  mov ax, g5
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L11: ; Continuation
  xchg si, di
  Bare_heap_check(8)
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

L12: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L11
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L13: ; Arm: 32'20
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L12
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g4
  jmp [bp]

L14: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L15: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  mov bx, [si]
  cmp word [bx], 3
  jz L13
  push word [bp+8]
  push word [CurrentCont]
  push word L14
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g4
  jmp [bp]

L16: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(12)
  mov bx, [si]
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
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [bp+2]
  jmp [bp]

L17: ; Function: (filter,g4)
  xchg si, di
  Bare_heap_check(6)
  push word [si]
  push word L16
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L18: ; Arm: 36'7
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L19: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L20: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L19
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L21: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [si]
  push word [CurrentCont]
  push word L20
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g6
  jmp [bp]

L22: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L21
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L23: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(12)
  mov bx, [si]
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
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [bp+2]
  jmp [bp]

L24: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [bp+2]
  push word L23
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L25: ; Function: (foldl,g6)
  xchg si, di
  Bare_heap_check(6)
  push word [si]
  push word L24
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L26: ; Arm: 41'7
  mov ax, g8
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L27: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L28: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L27
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g7
  jmp [bp]

L29: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(10)
  mov bx, [si]
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
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [bp+2]
  jmp [bp]

L30: ; Function: (iter,g7)
  xchg si, di
  Bare_heap_check(6)
  push word [si]
  push word L29
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L31: ; Arm: 45'11
  mov ax, g10
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L32: ; Continuation
  xchg si, di
  Bare_heap_check(8)
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

L33: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L32
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L34: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(10)
  mov ax, [si]
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
  push word [si]
  push word [bp+2]
  push word [CurrentCont]
  push word L33
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g9
  jmp [bp]

L35: ; Function: (upto,g9)
  xchg si, di
  Bare_heap_check(6)
  push word [si]
  push word L34
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L36: ; Arm: 48'12
  mov ax, g14
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L37: ; Arm: 50'9
  mov ax, g15
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L38: ; Continuation
  xchg si, di
  Bare_heap_check(8)
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

L39: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L38
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L40: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  mov bx, [si]
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
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, g11
  jmp [bp]

L41: ; Arm: 10'9
  mov ax, g12
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L42: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(10)
  mov ax, 1
  cmp word ax, [bp+2]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [si]
  push word [bp+2]
  push word [CurrentCont]
  push word L40
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L41
  mov ax, g13
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L43: ; Function: (take,g11)
  xchg si, di
  Bare_heap_check(6)
  push word [si]
  push word L42
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L44: ; Arm: 61'7
  mov ax, [bp+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L45: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L46: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(16)
  mov bx, [si]
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
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, g20
  jmp [bp]

L47: ; Function: (rev_onto,g20)
  xchg si, di
  Bare_heap_check(6)
  push word [si]
  push word L46
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L48: ; Arm: 79'13
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L49: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L50: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(16)
  mov ax, [si]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L48
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
  push word L49
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, [bp+6]
  jmp [bp]

L51: ; Function: (explode_loop,t1)
  xchg si, di
  Bare_heap_check(10)
  push word bp
  push word [si]
  push word [bp+2]
  push word L50
  mov [Temps+2], sp
  push word 8 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L52: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L53: ; Function: (explode,g22)
  xchg si, di
  Bare_heap_check(14)
  push word [si]
  push word L51
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
  push word L52
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g21
  mov [di], ax
  mov bp, [Temps+2]
  jmp [bp]

L54: ; Arm: 88'9
  mov ax, g23
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L55: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L56: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(8)
  mov bx, [si]
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
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, [bp+6]
  jmp [bp]

L57: ; Function: (loop,t1)
  xchg si, di
  Bare_heap_check(10)
  push word bp
  push word [si]
  push word [bp+2]
  push word L56
  mov [Temps+2], sp
  push word 8 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L58: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L59: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L58
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L60: ; Continuation
  xchg si, di
  Bare_heap_check(16)
  push word [si]
  push word L57
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L59
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, 1
  mov [di], ax
  mov bp, [Temps+2]
  jmp [bp]

L61: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L60
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  jmp AllocBare_make_bytes

L62: ; Function: (implode,g24)
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L61
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g1
  jmp [bp]

L63: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g24
  jmp [bp]

L64: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L63
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L65: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L64
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g20
  jmp [bp]

L66: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L65
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L67: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L66
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g25
  mov [di], ax
  mov bp, g20
  jmp [bp]

L68: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L67
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L69: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L68
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+2]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L70: ; Function: (^,g26)
  xchg si, di
  Bare_heap_check(6)
  push word [si]
  push word L69
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L71: ; Arm: 106'13
  mov ax, [bp+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L72: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L73: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(16)
  mov ax, [si]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L71
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
  push word L72
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+12]
  mov [di], ax
  mov bp, g27
  jmp [bp]

L74: ; Function: (loop,g27)
  xchg si, di
  Bare_heap_check(6)
  push word [si]
  push word L73
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L75: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g24
  jmp [bp]

L76: ; Arm: 109'11
  push word g28
  push word `0`
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L77: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word `-`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L78: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L77
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L79: ; Arm: 110'13
  mov ax, 1
  mov bx, [si]
  sub ax, bx
  add ax, 1
  mov [Temps+6], ax
  push word [Temps+6]
  push word [CurrentCont]
  push word L78
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g29
  mov [di], ax
  mov bp, g27
  jmp [bp]

L80: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L81: ; Function: (sofi,g31)
  xchg si, di
  Bare_heap_check(14)
  mov ax, [si]
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
  mov ax, [si]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L79
  push word [si]
  push word [CurrentCont]
  push word L80
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g30
  mov [di], ax
  mov bp, g27
  jmp [bp]

L82: ; Arm: 122'9
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

L83: ; Arm: 125'15
  mov ax, g39
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L84: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L85: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  mov bx, [si]
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
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, g32
  jmp [bp]

L86: ; Arm: 117'27
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

L87: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  mov bx, [si]
  cmp word [bx], 3
  jz L86
  mov ax, g37
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L88: ; Arm: 10'9
  mov ax, g35
  mov [di], ax
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
  mov ax, g36
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L90: ; Continuation
  xchg si, di
  Bare_heap_check(18)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L85
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [si]
  cmp word [bx], 3
  jz L89
  mov ax, g38
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L91: ; Arm: 10'9
  mov ax, g33
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L92: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(12)
  mov bx, [si]
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
  mov ax, g34
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L93: ; Function: (loop,g32)
  xchg si, di
  Bare_heap_check(6)
  push word [si]
  push word L92
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L94: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L95: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L94
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, 1
  mov [di], ax
  mov bp, g32
  jmp [bp]

L96: ; Function: (parse_num,g40)
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L95
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L97: ; Arm: 142'7
  mov ax, g42
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L98: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L99: ; Arm: 135'19
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

L100: ; Arm: 136'22
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

L101: ; Arm: 137'16
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

L102: ; Function: (put_chars,g41)
  xchg si, di
  Bare_heap_check(8)
  mov bx, [si]
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
  mov ax, [Temps+22]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L103: ; Arm: 165'9
  mov ax, g47
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L104: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L105: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(8)
  mov bx, [si]
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
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, [bp+6]
  jmp [bp]

L106: ; Function: (loop,t1)
  xchg si, di
  Bare_heap_check(10)
  push word bp
  push word [si]
  push word [bp+2]
  push word L105
  mov [Temps+2], sp
  push word 8 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L107: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L108: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L107
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L109: ; Continuation
  xchg si, di
  Bare_heap_check(16)
  push word [si]
  push word L106
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
  push word L108
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [Temps+2]
  jmp [bp]

L110: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L109
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  jmp AllocBare_make_bytes

L111: ; Function: (rev_implode,g48)
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L110
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g1
  jmp [bp]

L112: ; Arm: 174'19
  mov ax, g51
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L113: ; Arm: 176'15
  mov ax, g52
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L114: ; Arm: 179'31
  mov ax, g55
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L115: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov bx, [si]
  cmp word [bx], 3
  jz L114
  mov ax, [bp+4]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [bp+6]
  jmp [bp]

L116: ; Arm: 10'9
  mov ax, g53
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L117: ; Function: (loop,t1)
  xchg si, di
  Bare_heap_check(10)
  mov ax, [si]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L113
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
  push word L115
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L116
  mov ax, g54
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L118: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  mov bx, [si]
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
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [Temps+2]
  jmp [bp]

L119: ; Arm: 10'9
  mov ax, g49
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L120: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(12)
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
  push word L118
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L119
  mov ax, g50
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L121: ; Function: (eq_string,g56)
  xchg si, di
  Bare_heap_check(6)
  push word [si]
  push word L120
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L122: ; Arm: 187'9
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g24
  jmp [bp]

L123: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L124: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L123
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, [bp+4]
  jmp [bp]

L125: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L124
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L126: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [bp+6]
  push word [bp+4]
  push word [si]
  push word [CurrentCont]
  push word L125
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov bp, g20
  jmp [bp]

L127: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L126
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L128: ; Continuation
  xchg si, di
  Bare_heap_check(14)
  push word [si]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L127
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, g58
  mov [di], ax
  mov bp, g20
  jmp [bp]

L129: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L128
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L130: ; Continuation
  xchg si, di
  Bare_heap_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [si]
  push word [CurrentCont]
  push word L129
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g20
  jmp [bp]

L131: ; Continuation
  xchg si, di
  Bare_heap_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L130
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L132: ; Continuation
  xchg si, di
  Bare_heap_check(16)
  push word [si]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L131
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov ax, g57
  mov [di], ax
  mov bp, g20
  jmp [bp]

L133: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(14)
  mov bx, [si]
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
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L134: ; Function: (collect,t1)
  xchg si, di
  Bare_heap_check(10)
  push word bp
  push word [si]
  push word [bp+2]
  push word L133
  mov [Temps+2], sp
  push word 8 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L135: ; Arm: 192'7
  mov ax, g60
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L136: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L137: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L136
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, [bp+4]
  jmp [bp]

L138: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  mov bx, [si]
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
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L139: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L138
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L140: ; Function: (lam,t2)
  xchg si, di
  Bare_heap_check(10)
  push word [si]
  push word [bp+2]
  push word [CurrentCont]
  push word L139
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g59
  mov [di], ax
  mov bp, g20
  jmp [bp]

L141: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [si]
  push word L134
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word L140
  mov [Temps+4], sp
  push word 4 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L142: ; Function: (concat,g61)
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L141
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L143: ; Continuation
  xchg si, di
  Bare_heap_check(8)
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

L144: ; Arm: 208'11
  push word [bp+2]
  push word [CurrentCont]
  push word L143
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g48
  jmp [bp]

L145: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L146: ; Continuation
  xchg si, di
  Bare_heap_check(16)
  push word [bp+4]
  push word [si]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+6]
  push word [CurrentCont]
  push word L145
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g62
  jmp [bp]

L147: ; Arm: 210'26
  push word [Temps+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L146
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g48
  jmp [bp]

L148: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L149: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L148
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L150: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(18)
  mov bx, [si]
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
  mov ax, [bp+2]
  mov [di], ax
  mov bp, g63
  jmp [bp]

L151: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [bp+2]
  push word L150
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L152: ; Function: (have_letter,g63)
  xchg si, di
  Bare_heap_check(6)
  push word [si]
  push word L151
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L153: ; Arm: 215'9
  mov ax, [bp+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L154: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L155: ; Arm: 217'24
  push word [Temps+4]
  push word [CurrentCont]
  push word L154
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+2]
  mov [di], ax
  mov bp, g62
  jmp [bp]

L156: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L157: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L156
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L158: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(18)
  mov bx, [si]
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
  mov ax, [bp+2]
  mov [di], ax
  mov bp, g63
  jmp [bp]

L159: ; Function: (at_word_start,g62)
  xchg si, di
  Bare_heap_check(6)
  push word [si]
  push word L158
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L160: ; Arm: 229'16
  mov ax, g67
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L161: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov bx, [si]
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
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, [bp+12]
  jmp [bp]

L162: ; Arm: 10'9
  mov ax, g65
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L163: ; Function: (loop,t1)
  xchg si, di
  Bare_heap_check(16)
  mov ax, [si]
  cmp word ax, [bp+6]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word [si]
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
  mov ax, g66
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L164: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L165: ; Continuation
  xchg si, di
  Bare_heap_check(20)
  push word [si]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L163
  mov [Temps+2], sp
  push word 10 ;; scanned
  push word [si]
  push word [CurrentCont]
  push word L164
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, 1
  mov [di], ax
  mov bp, [Temps+2]
  jmp [bp]

L166: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(12)
  push word [si]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L165
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si]
  mov [di], ax
  jmp AllocBare_make_bytes

L167: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [bp+2]
  push word L166
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L168: ; Function: (substr,g68)
  xchg si, di
  Bare_heap_check(6)
  push word [si]
  push word L167
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L169: ; Arm: 243'17
  mov ax, g71
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L170: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov bx, [si]
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
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, [bp+12]
  jmp [bp]

L171: ; Arm: 10'9
  mov ax, g69
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L172: ; Function: (loop,t2)
  xchg si, di
  Bare_heap_check(16)
  mov ax, [si]
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word [si]
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
  mov ax, g70
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L173: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(12)
  mov bx, [si]
  mov ax, [bx]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [si]
  push word [bp+4]
  push word [bp+2]
  push word L172
  mov [Temps+4], sp
  push word 10 ;; scanned
  mov ax, 1
  mov [di], ax
  mov bp, [Temps+4]
  jmp [bp]

L174: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [bp+2]
  push word L173
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L175: ; Function: (mod_substr,g72)
  xchg si, di
  Bare_heap_check(6)
  push word [si]
  push word L174
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L176: ; Arm: 283'22
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov ax, [si]
  mov [di], ax
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
  push word [si]
  push word `\x04`
  push word 3
  mov [Temps+16], sp
  push word 6 ;; scanned
  mov ax, [Temps+16]
  mov [di], ax
  mov bp, g48
  jmp [bp]

L178: ; Arm: 285'19
  mov ax, [si]
  mov [di], ax
  mov bp, g74
  jmp [bp]

L179: ; Arm: 288'17
  mov ax, [si]
  mov [di], ax
  mov bp, g74
  jmp [bp]

L180: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
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
  mov ax, [Temps+12]
  mov [di], ax
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
  mov ax, [Temps+20]
  mov [di], ax
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
  mov ax, [Temps+22]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L184: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L180
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [si]
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
  mov ax, [Temps+10]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L185: ; Arm: 10'9
  mov ax, g76
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L186: ; Arm: 286'21
  mov bx, [si]
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
  mov ax, g77
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L187: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g74
  jmp [bp]

L188: ; Arm: 135'19
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

L189: ; Arm: 136'22
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

L190: ; Arm: 137'16
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

L191: ; Function: (readloop,g74)
  xchg si, di
  Bare_heap_check(10)
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
  push word [si]
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
  mov ax, [Temps+30]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L192: ; Function: (read_line,g79)
  xchg si, di
  Bare_heap_check(0)
  mov ax, g78
  mov [di], ax
  mov bp, g74
  jmp [bp]

L193: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+6]
  mov [Temps+2], ax
  mov dx, [bp+4]
  sar dx, 1
  mov bx, [Temps+2]
  call Bare_store_sector
  mov ax, Bare_unit
  mov [Temps+4], ax
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L194: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L193
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L195: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L194
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L196: ; Continuation
  xchg si, di
  Bare_heap_check(14)
  mov dx, [bp+4]
  sar dx, 1
  mov bx, [si]
  call Bare_load_sector
  mov ax, Bare_unit
  mov [Temps+2], ax
  push word [si]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L195
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g72
  jmp [bp]

L197: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L196
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, 1025
  mov [di], ax
  jmp AllocBare_make_bytes

L198: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  mov ax, [si]
  sar ax, 1
  mov bx, 9
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov ax, [si]
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
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L199: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L198
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [bp+2]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L200: ; Function: (store_block,g83)
  xchg si, di
  Bare_heap_check(6)
  push word [si]
  push word L199
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L201: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [si]
  push word 1
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
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L201
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, 257
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L203: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L202
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L204: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  mov dx, [bp+6]
  sar dx, 1
  mov bx, [si]
  call Bare_load_sector
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, [si]
  mov [Temps+4], ax
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
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g68
  jmp [bp]

L205: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  mov ax, [si]
  sar ax, 1
  mov bx, 9
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov ax, [si]
  sar ax, 1
  mov bx, 9
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+4], ax
  push word [Temps+4]
  push word [si]
  push word [CurrentCont]
  push word L204
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, 1025
  mov [di], ax
  jmp AllocBare_make_bytes

L206: ; Function: (load_block,g84)
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L205
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [si]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L207: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L208: ; Continuation
  xchg si, di
  Bare_heap_check(14)
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
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g83
  jmp [bp]

L209: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L208
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L210: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L209
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L211: ; Continuation
  xchg si, di
  Bare_heap_check(14)
  mov ax, [si]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L210
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g72
  jmp [bp]

L212: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L211
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [si]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L213: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(12)
  push word [si]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L212
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+2]
  mov [di], ax
  mov bp, g84
  jmp [bp]

L214: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [bp+2]
  push word L213
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L215: ; Function: (update_block,g85)
  xchg si, di
  Bare_heap_check(6)
  push word [si]
  push word L214
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L216: ; Function: (lam,g96)
  xchg si, di
  Bare_heap_check(6)
  mov ax, [si]
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  push word [Temps+2]
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L217: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, g92
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L218: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L217
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L219: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L218
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L220: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L219
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L221: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L220
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g91
  mov [di], ax
  mov bp, g26
  jmp [bp]

L222: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L221
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g89
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L223: ; Arm: 525'2
  push word [CurrentCont]
  push word L222
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g90
  mov [di], ax
  mov bp, g26
  jmp [bp]

L224: ; Arm: 450'9
  mov ax, g94
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L225: ; Arm: 452'14
  mov ax, g95
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L226: ; Continuation
  xchg si, di
  Bare_heap_check(14)
  push word [si]
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word 3
  mov [Temps+4], sp
  push word 4 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L227: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L226
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L228: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+4]
  push word [si]
  push word [CurrentCont]
  push word L227
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, g11
  jmp [bp]

L229: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L228
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L230: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [bp+6]
  push word [bp+4]
  push word [si]
  push word [CurrentCont]
  push word L229
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g96
  mov [di], ax
  mov bp, g2
  jmp [bp]

L231: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L230
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L232: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L231
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, 13
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L233: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L232
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, 5
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L234: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [si]
  push word [bp+6]
  push word [CurrentCont]
  push word L233
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g68
  jmp [bp]

L235: ; Arm: 443'14
  mov ax, 1
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L236: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  mov bx, [si]
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
  mov ax, [Temps+14]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L237: ; Arm: 409'32
  mov ax, g93
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L238: ; Continuation
  xchg si, di
  Bare_heap_check(22)
  mov ax, [si]
  mov bx, 1
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+2], ax
  mov ax, [si]
  mov bx, 3
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+4], ax
  push word [Temps+4]
  push word [Temps+2]
  push word 1
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [si]
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
  mov ax, [Temps+22]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L239: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L238
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, 17
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L240: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L239
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L241: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  mov ax, [si]
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
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g68
  jmp [bp]

L242: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L241
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L243: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L242
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [si]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L244: ; Continuation
  xchg si, di
  Bare_heap_check(14)
  mov ax, [si]
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
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, g84
  jmp [bp]

L245: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  mov bx, [si]
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
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L246: ; Arm: 10'9
  mov ax, g87
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L247: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  mov ax, [bp+6]
  cmp word ax, [si]
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
  mov ax, g88
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L248: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [si]
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
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L249: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(10)
  push word [si]
  push word [bp+2]
  push word [CurrentCont]
  push word L248
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [si]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L250: ; Function: (loadI,g97)
  xchg si, di
  Bare_heap_check(6)
  push word [si]
  push word L249
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L251: ; Arm: 584'7
  mov ax, [bp+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L252: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L253: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L252
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g98
  jmp [bp]

L254: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(26)
  mov bx, [si]
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
  mov ax, [Temps+14]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L255: ; Function: (giveup_blocks,g98)
  xchg si, di
  Bare_heap_check(6)
  push word [si]
  push word L254
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L256: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [si]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L257: ; Function: (lam,g99)
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L256
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [si]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L258: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L259: ; Arm: 733'9
  push word [bp+2]
  push word [CurrentCont]
  push word L258
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g102
  mov [di], ax
  mov bp, g20
  jmp [bp]

L260: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L261: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(16)
  mov bx, [si]
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
  mov ax, [Temps+10]
  mov [di], ax
  mov bp, g101
  jmp [bp]

L262: ; Function: (loop,g101)
  xchg si, di
  Bare_heap_check(6)
  push word [si]
  push word L261
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L263: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L264: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L263
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L265: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L264
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L266: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L265
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g106
  mov [di], ax
  mov bp, g26
  jmp [bp]

L267: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L266
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g105
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L268: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L267
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g26
  jmp [bp]

L269: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L268
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L270: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L269
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g104
  mov [di], ax
  mov bp, g26
  jmp [bp]

L271: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L270
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g103
  mov [di], ax
  mov bp, [si]
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
  mov ax, [bp+2]
  mov [di], ax
  mov bp, g26
  jmp [bp]

L273: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(6)
  mov bx, [si]
  cmp word [bx], 3
  jz L272
  mov ax, g107
  mov [di], ax
  mov bp, [bp+4]
  jmp [bp]

L274: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(22)
  push word [si]
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
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L275: ; Function: (mk_com0,g108)
  xchg si, di
  Bare_heap_check(6)
  push word [si]
  push word L274
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L276: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L277: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L276
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L278: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L277
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L279: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L278
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g112
  mov [di], ax
  mov bp, g26
  jmp [bp]

L280: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L279
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g111
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L281: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L280
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g26
  jmp [bp]

L282: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L281
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L283: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L282
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g110
  mov [di], ax
  mov bp, g26
  jmp [bp]

L284: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L283
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g109
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L285: ; Arm: 766'17
  push word [CurrentCont]
  push word L284
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+2]
  mov [di], ax
  mov bp, g26
  jmp [bp]

L286: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L287: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L286
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L288: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L287
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L289: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L288
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g116
  mov [di], ax
  mov bp, g26
  jmp [bp]

L290: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L289
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g115
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L291: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L290
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g26
  jmp [bp]

L292: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L291
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L293: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L292
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g114
  mov [di], ax
  mov bp, g26
  jmp [bp]

L294: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L293
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g113
  mov [di], ax
  mov bp, [si]
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
  mov ax, [bp+2]
  mov [di], ax
  mov bp, g26
  jmp [bp]

L296: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L297: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L296
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L298: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L297
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L299: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L298
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g120
  mov [di], ax
  mov bp, g26
  jmp [bp]

L300: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L299
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g119
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L301: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L300
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g26
  jmp [bp]

L302: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L301
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L303: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L302
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g118
  mov [di], ax
  mov bp, g26
  jmp [bp]

L304: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L303
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g117
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L305: ; Arm: 772'25
  push word [CurrentCont]
  push word L304
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g26
  jmp [bp]

L306: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  mov bx, [si]
  cmp word [bx], 1
  jz L305
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [bp+6]
  jmp [bp]

L307: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(10)
  mov bx, [si]
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
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g40
  jmp [bp]

L308: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(22)
  push word [si]
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
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L309: ; Function: (mk_comI,g121)
  xchg si, di
  Bare_heap_check(6)
  push word [si]
  push word L308
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L310: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L311: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L310
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L312: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L311
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L313: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L312
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g125
  mov [di], ax
  mov bp, g26
  jmp [bp]

L314: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L313
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g124
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L315: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L314
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g26
  jmp [bp]

L316: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L315
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L317: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L316
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g123
  mov [di], ax
  mov bp, g26
  jmp [bp]

L318: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L317
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g122
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L319: ; Arm: 781'17
  push word [CurrentCont]
  push word L318
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+2]
  mov [di], ax
  mov bp, g26
  jmp [bp]

L320: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L321: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L320
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L322: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L321
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L323: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L322
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g129
  mov [di], ax
  mov bp, g26
  jmp [bp]

L324: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L323
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g128
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L325: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L324
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g26
  jmp [bp]

L326: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L325
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L327: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L326
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g127
  mov [di], ax
  mov bp, g26
  jmp [bp]

L328: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L327
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g126
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L329: ; Arm: 784'20
  push word [CurrentCont]
  push word L328
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+2]
  mov [di], ax
  mov bp, g26
  jmp [bp]

L330: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L331: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L330
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L332: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L331
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L333: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L332
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g133
  mov [di], ax
  mov bp, g26
  jmp [bp]

L334: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L333
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g132
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L335: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L334
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g26
  jmp [bp]

L336: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L335
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L337: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L336
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g131
  mov [di], ax
  mov bp, g26
  jmp [bp]

L338: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L337
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g130
  mov [di], ax
  mov bp, [si]
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
  mov ax, [bp+2]
  mov [di], ax
  mov bp, g26
  jmp [bp]

L340: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L341: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L340
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L342: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L341
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L343: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L342
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g137
  mov [di], ax
  mov bp, g26
  jmp [bp]

L344: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L343
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g136
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L345: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L344
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g26
  jmp [bp]

L346: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L345
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L347: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L346
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g135
  mov [di], ax
  mov bp, g26
  jmp [bp]

L348: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L347
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g134
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L349: ; Arm: 790'28
  push word [CurrentCont]
  push word L348
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g26
  jmp [bp]

L350: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L351: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L350
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L352: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L351
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L353: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L352
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g141
  mov [di], ax
  mov bp, g26
  jmp [bp]

L354: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L353
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g140
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L355: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L354
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g26
  jmp [bp]

L356: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L355
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L357: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L356
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g139
  mov [di], ax
  mov bp, g26
  jmp [bp]

L358: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L357
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g138
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L359: ; Arm: 793'31
  push word [CurrentCont]
  push word L358
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g26
  jmp [bp]

L360: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L361: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  mov bx, [si]
  cmp word [bx], 1
  jz L359
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [CurrentCont]
  push word L360
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov bp, [bp+6]
  jmp [bp]

L362: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  mov bx, [si]
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
  mov ax, [bp+8]
  mov [di], ax
  mov bp, g40
  jmp [bp]

L363: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(12)
  mov bx, [si]
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
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g40
  jmp [bp]

L364: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(22)
  push word [si]
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
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L365: ; Function: (mk_comII,g142)
  xchg si, di
  Bare_heap_check(6)
  push word [si]
  push word L364
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L366: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L367: ; Arm: 260'27
  push word [bp+2]
  push word [CurrentCont]
  push word L366
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g162
  mov [di], ax
  mov bp, g20
  jmp [bp]

L368: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L369: ; Continuation
  xchg si, di
  Bare_heap_check(16)
  push word [bp+4]
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [si]
  push word [CurrentCont]
  push word L368
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g161
  jmp [bp]

L370: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L371: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L370
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, 257
  mov [di], ax
  mov bp, [si]
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
  mov ax, [bp+6]
  mov [di], ax
  mov bp, g68
  jmp [bp]

L373: ; Continuation
  xchg si, di
  Bare_heap_check(18)
  mov ax, 257
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L369
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L372
  mov ax, g163
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L374: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, 257
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L375: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L374
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, 1
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L376: ; Arm: 253'21
  push word [CurrentCont]
  push word L375
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g68
  jmp [bp]

L377: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(18)
  mov bx, [si]
  mov ax, [bx]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L367
  mov bx, [si]
  mov ax, [bx]
  mov [Temps+6], ax
  mov ax, 257
  cmp word ax, [Temps+6]
  call Bare_make_bool_from_n
  mov [Temps+8], ax
  push word [Temps+6]
  push word [si]
  push word [bp+2]
  push word [CurrentCont]
  push word L373
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L376
  mov ax, [si]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L378: ; Function: (loop,g161)
  xchg si, di
  Bare_heap_check(6)
  push word [si]
  push word L377
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L379: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L380: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L379
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L381: ; Function: (lam,g204)
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L380
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L382: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, g203
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L383: ; Function: (lam,g205)
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L382
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g204
  mov [di], ax
  mov bp, g7
  jmp [bp]

L384: ; Arm: 811'32
  mov ax, g210
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L385: ; Arm: 322'24
  mov ax, g213
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L386: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [bp+6]
  jmp [bp]

L387: ; Arm: 325'32
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L388: ; Continuation
  xchg si, di
  Bare_heap_check(10)
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
  mov ax, g215
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L389: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L390: ; Arm: 324'24
  push word [CurrentCont]
  push word L389
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g214
  mov [di], ax
  mov bp, g22
  jmp [bp]

L391: ; Arm: 135'19
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

L392: ; Arm: 136'22
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

L393: ; Arm: 137'16
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

L394: ; Continuation
  xchg si, di
  Bare_heap_check(16)
  mov bx, [si]
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
  mov ax, [Temps+22]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L395: ; Arm: 10'9
  mov ax, g211
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L396: ; Function: (loop,t3)
  xchg si, di
  Bare_heap_check(12)
  mov ax, [si]
  cmp word ax, 1025
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word [si]
  push word [bp+2]
  push word [CurrentCont]
  push word L394
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L395
  mov ax, g212
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L397: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g207
  jmp [bp]

L398: ; Continuation
  xchg si, di
  Bare_heap_check(14)
  mov dx, [bp+4]
  sar dx, 1
  mov bx, [si]
  call Bare_load_sector
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, [si]
  mov [Temps+4], ax
  push word [Temps+4]
  push word L396
  mov [Temps+6], sp
  push word 4 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L397
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, 1
  mov [di], ax
  mov bp, [Temps+6]
  jmp [bp]

L399: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  mov bx, [si]
  cmp word [bx], 3
  jz L384
  push word [bp+4]
  push word [CurrentCont]
  push word L398
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, 1025
  mov [di], ax
  jmp AllocBare_make_bytes

L400: ; Arm: 10'9
  mov ax, g208
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L401: ; Function: (loop,g207)
  xchg si, di
  Bare_heap_check(8)
  mov ax, [si]
  cmp word ax, 21
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [si]
  push word [CurrentCont]
  push word L399
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L400
  mov ax, g209
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L402: ; Function: (lam,g216)
  xchg si, di
  Bare_heap_check(0)
  mov ax, 1
  mov [di], ax
  mov bp, g207
  jmp [bp]

L403: ; Arm: 322'24
  mov ax, g220
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L404: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [bp+6]
  jmp [bp]

L405: ; Arm: 325'32
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L406: ; Continuation
  xchg si, di
  Bare_heap_check(10)
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
  mov ax, g222
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L407: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L408: ; Arm: 324'24
  push word [CurrentCont]
  push word L407
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g221
  mov [di], ax
  mov bp, g22
  jmp [bp]

L409: ; Arm: 135'19
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

L410: ; Arm: 136'22
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

L411: ; Arm: 137'16
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

L412: ; Continuation
  xchg si, di
  Bare_heap_check(16)
  mov bx, [si]
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
  mov ax, [Temps+22]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L413: ; Arm: 10'9
  mov ax, g218
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L414: ; Function: (loop,t3)
  xchg si, di
  Bare_heap_check(12)
  mov ax, [si]
  cmp word ax, 1025
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word [si]
  push word [bp+2]
  push word [CurrentCont]
  push word L412
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L413
  mov ax, g219
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L415: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  mov dx, [bp+4]
  sar dx, 1
  mov bx, [si]
  call Bare_load_sector
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, [si]
  mov [Temps+4], ax
  push word [Temps+4]
  push word L414
  mov [Temps+6], sp
  push word 4 ;; scanned
  mov ax, 1
  mov [di], ax
  mov bp, [Temps+6]
  jmp [bp]

L416: ; Function: (lam,g223)
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L415
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, 1025
  mov [di], ax
  jmp AllocBare_make_bytes

L417: ; Arm: 10'9
  mov ax, g241
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L418: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  cmp word ax, [si]
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L417
  mov ax, g242
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L419: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L418
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L420: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(8)
  push word [bp+2]
  push word [CurrentCont]
  push word L419
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [si]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L421: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L422: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(14)
  push word [si]
  push word L420
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+2]
  push word [CurrentCont]
  push word L421
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g4
  jmp [bp]

L423: ; Function: (lam,g243)
  xchg si, di
  Bare_heap_check(6)
  push word [si]
  push word L422
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L424: ; Function: (lam,g244)
  xchg si, di
  Bare_heap_check(6)
  push word [si]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L425: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L426: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L425
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g283
  mov [di], ax
  mov bp, g26
  jmp [bp]

L427: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L426
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g31
  jmp [bp]

L428: ; Function: (lam,g284)
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L427
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [si]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L429: ; Arm: 198'14
  mov ax, g344
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L430: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov bx, [si]
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
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [bp+8]
  jmp [bp]

L431: ; Arm: 10'9
  mov ax, g342
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L432: ; Function: (loop,t1)
  xchg si, di
  Bare_heap_check(12)
  mov ax, [si]
  cmp word ax, 1025
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word [si]
  push word [bp+2]
  push word [CurrentCont]
  push word L430
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L431
  mov ax, g343
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L433: ; Arm: 802'32
  mov ax, g347
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L434: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov bx, [si]
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
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [bp+8]
  jmp [bp]

L435: ; Arm: 10'9
  mov ax, g345
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L436: ; Function: (loop,t2)
  xchg si, di
  Bare_heap_check(12)
  mov ax, [si]
  cmp word ax, 21
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word [si]
  push word [bp+2]
  push word [CurrentCont]
  push word L434
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L435
  mov ax, g346
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L437: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  mov ax, [bp+4]
  mov [Temps+2], ax
  push word [Temps+2]
  push word L436
  mov [Temps+4], sp
  push word 4 ;; scanned
  mov ax, 1
  mov [di], ax
  mov bp, [Temps+4]
  jmp [bp]

L438: ; Continuation
  xchg si, di
  Bare_heap_check(14)
  push word [si]
  push word L432
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [si]
  push word [CurrentCont]
  push word L437
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, 1
  mov [di], ax
  mov bp, [Temps+2]
  jmp [bp]

L439: ; Function: (lam,g348)
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L438
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, 1025
  mov [di], ax
  jmp AllocBare_make_bytes

L440: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L441: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L440
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L442: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L441
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L443: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L442
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g45
  mov [di], ax
  mov bp, g26
  jmp [bp]

L444: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L443
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g44
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L445: ; Arm: 154'45
  push word [CurrentCont]
  push word L444
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g26
  jmp [bp]

L446: ; Function: (_trace,t2)
  xchg si, di
  Bare_heap_check(6)
  mov bx, [bp+2]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L445
  mov ax, g46
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L447: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L448: ; Continuation
  xchg si, di
  Bare_heap_check(20)
  mov ax, [si]
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
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, g83
  jmp [bp]

L449: ; Continuation
  xchg si, di
  Bare_heap_check(8)
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
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L450: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L449
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L451: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L450
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L452: ; Continuation
  xchg si, di
  Bare_heap_check(14)
  mov ax, [si]
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
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, g72
  jmp [bp]

L453: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L452
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L454: ; Arm: 593'11
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L455: ; Continuation
  xchg si, di
  Bare_heap_check(16)
  push word [si]
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word [bp+4]
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g24
  jmp [bp]

L456: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L455
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L457: ; Continuation
  xchg si, di
  Bare_heap_check(22)
  push word [si]
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
  mov ax, g99
  mov [di], ax
  mov bp, g2
  jmp [bp]

L458: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L457
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [si]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L459: ; Continuation
  xchg si, di
  Bare_heap_check(18)
  mov ax, [si]
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
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, g84
  jmp [bp]

L460: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(12)
  push word [si]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L459
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L461: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [bp+2]
  push word L460
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L462: ; Function: (storeI,t1)
  xchg si, di
  Bare_heap_check(6)
  push word [bp+2]
  push word L461
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L463: ; Arm: 890'10
  mov ax, g174
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L464: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L465: ; Continuation
  xchg si, di
  Bare_heap_check(8)
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
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [bp+6]
  jmp [bp]

L466: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L467: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L466
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L468: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L467
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L469: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L468
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g148
  mov [di], ax
  mov bp, g26
  jmp [bp]

L470: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L469
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g146
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L471: ; Arm: 665'9
  push word [CurrentCont]
  push word L470
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g147
  mov [di], ax
  mov bp, g26
  jmp [bp]

L472: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L473: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L472
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L474: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L473
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L475: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L474
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g151
  mov [di], ax
  mov bp, g26
  jmp [bp]

L476: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L475
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g149
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L477: ; Arm: 669'12
  push word [CurrentCont]
  push word L476
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g150
  mov [di], ax
  mov bp, g26
  jmp [bp]

L478: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov bx, [bp+4]
  mov ax, [Temps+2]
  mov [bx], ax
  mov ax, Bare_unit
  mov [Temps+4], ax
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L479: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L478
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L480: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L479
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L481: ; Continuation
  xchg si, di
  Bare_heap_check(28)
  push word [si]
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
  mov ax, [bp+10]
  mov [di], ax
  mov bp, [bp+4]
  jmp [bp]

L482: ; Continuation
  xchg si, di
  Bare_heap_check(18)
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
  mov ax, [bp+16]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L483: ; Continuation
  xchg si, di
  Bare_heap_check(20)
  push word [si]
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
  mov ax, [bp+16]
  mov [di], ax
  mov bp, g20
  jmp [bp]

L484: ; Continuation
  xchg si, di
  Bare_heap_check(20)
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
  mov ax, [bp+18]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L485: ; Continuation
  xchg si, di
  Bare_heap_check(22)
  push word [si]
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
  mov ax, g153
  mov [di], ax
  mov bp, g20
  jmp [bp]

L486: ; Continuation
  xchg si, di
  Bare_heap_check(20)
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
  mov ax, [bp+16]
  mov [di], ax
  mov bp, [si]
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
  mov ax, g152
  mov [di], ax
  mov bp, g20
  jmp [bp]

L488: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L489: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L488
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, 1
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L490: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L489
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L491: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L490
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L492: ; Continuation
  xchg si, di
  Bare_heap_check(20)
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
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [bp+6]
  jmp [bp]

L493: ; Continuation
  xchg si, di
  Bare_heap_check(18)
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
  mov ax, [bp+10]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L494: ; Continuation
  xchg si, di
  Bare_heap_check(20)
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
  mov ax, [bp+10]
  mov [di], ax
  mov bp, [si]
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
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, g85
  jmp [bp]

L496: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L497: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L496
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L498: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L497
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L499: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L498
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g157
  mov [di], ax
  mov bp, g26
  jmp [bp]

L500: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L499
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g155
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L501: ; Arm: 689'22
  push word [CurrentCont]
  push word L500
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g156
  mov [di], ax
  mov bp, g26
  jmp [bp]

L502: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L503: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L502
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, 1
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L504: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L503
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g158
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L505: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L504
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L506: ; Continuation
  xchg si, di
  Bare_heap_check(18)
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
  mov ax, [bp+10]
  mov [di], ax
  mov bp, [bp+4]
  jmp [bp]

L507: ; Continuation
  xchg si, di
  Bare_heap_check(16)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L506
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L508: ; Continuation
  xchg si, di
  Bare_heap_check(18)
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
  mov ax, [bp+8]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L509: ; Continuation
  xchg si, di
  Bare_heap_check(20)
  mov bx, [si]
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
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, g85
  jmp [bp]

L510: ; Arm: 569'10
  mov ax, g154
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L511: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(40)
  mov bx, [si]
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
  mov ax, [Temps+20]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L512: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(24)
  push word [si]
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
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L513: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(22)
  push word [si]
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
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L514: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(20)
  push word [si]
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
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L515: ; Function: (loop,t1)
  xchg si, di
  Bare_heap_check(18)
  push word bp
  push word [si]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L514
  mov [Temps+2], sp
  push word 16 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L516: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L517: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L516
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L518: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L517
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L519: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L518
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
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
  push word [si]
  push word [bp+14]
  push word [bp+6]
  push word [CurrentCont]
  push word L519
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [bp+12]
  mov [di], ax
  mov bp, [bp+4]
  jmp [bp]

L521: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L522: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L521
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L523: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L522
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
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
  mov ax, [Temps+10]
  mov [di], ax
  mov bp, [bp+10]
  jmp [bp]

L525: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L526: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L525
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L527: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L526
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L528: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L527
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g168
  mov [di], ax
  mov bp, g26
  jmp [bp]

L529: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L528
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g166
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L530: ; Arm: 710'22
  push word [CurrentCont]
  push word L529
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g167
  mov [di], ax
  mov bp, g26
  jmp [bp]

L531: ; Arm: 198'14
  mov ax, g171
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L532: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov bx, [si]
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
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [bp+8]
  jmp [bp]

L533: ; Arm: 10'9
  mov ax, g169
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L534: ; Function: (loop,t1)
  xchg si, di
  Bare_heap_check(12)
  mov ax, [si]
  cmp word ax, 257
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word [si]
  push word [bp+2]
  push word [CurrentCont]
  push word L532
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L533
  mov ax, g170
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L535: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, g172
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L536: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L535
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L537: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L536
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L538: ; Continuation
  xchg si, di
  Bare_heap_check(18)
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
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [bp+6]
  jmp [bp]

L539: ; Continuation
  xchg si, di
  Bare_heap_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L538
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov ax, [bp+14]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L540: ; Continuation
  xchg si, di
  Bare_heap_check(24)
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
  mov ax, [bp+12]
  mov [di], ax
  mov bp, g83
  jmp [bp]

L541: ; Continuation
  xchg si, di
  Bare_heap_check(24)
  push word [si]
  push word L534
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [si]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L540
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov ax, 1
  mov [di], ax
  mov bp, [Temps+2]
  jmp [bp]

L542: ; Continuation
  xchg si, di
  Bare_heap_check(16)
  mov bx, [si]
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
  mov ax, 257
  mov [di], ax
  jmp AllocBare_make_bytes

L543: ; Arm: 569'10
  mov ax, g165
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L544: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(36)
  mov ax, [bp+8]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L520
  mov bx, [si]
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
  mov ax, [Temps+18]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L545: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(18)
  push word [si]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L544
  mov [Temps+2], sp
  push word 16 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L546: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(16)
  push word [si]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L545
  mov [Temps+2], sp
  push word 14 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L547: ; Function: (skip_loop,t1)
  xchg si, di
  Bare_heap_check(14)
  push word bp
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L546
  mov [Temps+2], sp
  push word 12 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L548: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L549: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L548
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g173
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L550: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L549
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L551: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  mov ax, [bp+4]
  sar ax, 1
  mov bx, 257
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  push word [si]
  push word [bp+6]
  push word [CurrentCont]
  push word L550
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [bp+8]
  jmp [bp]

L552: ; Continuation
  xchg si, di
  Bare_heap_check(22)
  push word [si]
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
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L553: ; Arm: 698'40
  mov ax, g159
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L554: ; Continuation
  xchg si, di
  Bare_heap_check(8)
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

L555: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L554
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L556: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L555
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g164
  mov [di], ax
  mov bp, g161
  jmp [bp]

L557: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L558: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L557
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
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
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g68
  jmp [bp]

L560: ; Continuation
  xchg si, di
  Bare_heap_check(18)
  mov ax, [bp+6]
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [si]
  push word [CurrentCont]
  push word L556
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L559
  mov ax, g160
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L561: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L562: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L561
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, 1
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L563: ; Arm: 253'21
  push word [Temps+6]
  push word [CurrentCont]
  push word L562
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+12]
  mov [di], ax
  mov bp, g68
  jmp [bp]

L564: ; Continuation
  xchg si, di
  Bare_heap_check(48)
  push word [si]
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
  mov ax, [bp+12]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L565: ; Arm: 100'23
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L566: ; Continuation
  xchg si, di
  Bare_heap_check(22)
  mov bx, [bp+12]
  mov ax, [bx]
  mov [Temps+2], ax
  mov ax, [bp+10]
  mov bx, [Temps+2]
  add ax, bx
  sub ax, 1
  mov [Temps+4], ax
  mov ax, [si]
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
  mov ax, [si]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L567: ; Continuation
  xchg si, di
  Bare_heap_check(22)
  mov bx, [si]
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
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L568: ; Continuation
  xchg si, di
  Bare_heap_check(20)
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
  mov ax, [bp+8]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L569: ; Continuation
  xchg si, di
  Bare_heap_check(20)
  push word [si]
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
  mov ax, [si]
  mov [di], ax
  mov bp, g97
  jmp [bp]

L570: ; Continuation
  xchg si, di
  Bare_heap_check(34)
  mov bx, [bp+6]
  mov ax, [bx]
  mov [Temps+2], ax
  push word [si]
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
  push word [si]
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
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L571: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L572: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L571
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, 1
  mov [di], ax
  mov bp, [si]
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
  mov ax, [bp+14]
  mov [di], ax
  mov bp, g68
  jmp [bp]

L574: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, g145
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L575: ; Continuation
  xchg si, di
  Bare_heap_check(26)
  push word [si]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L570
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bx, [si]
  cmp word [bx], 3
  jz L573
  push word [CurrentCont]
  push word L574
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+14]
  mov [di], ax
  mov bp, g26
  jmp [bp]

L576: ; Arm: 887'22
  mov ax, [Temps+2]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+6], ax
  mov ax, [si]
  mov bx, [Temps+6]
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+8], ax
  mov ax, [Temps+8]
  cmp word ax, `\x04`
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov ax, [Temps+10]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L577: ; Continuation
  xchg si, di
  Bare_heap_check(20)
  mov bx, [si]
  mov ax, [bx]
  mov [Temps+2], ax
  mov ax, 1
  cmp word ax, [Temps+2]
  call Bare_make_bool_from_n
  mov [Temps+4], ax
  push word [Temps+2]
  push word [si]
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
  mov ax, g144
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L578: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(16)
  push word [si]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L577
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov ax, g143
  mov [di], ax
  mov bp, g79
  jmp [bp]

L579: ; Function: (write_to_file,t3)
  xchg si, di
  Bare_heap_check(12)
  push word bp
  push word [si]
  push word [bp+4]
  push word [bp+2]
  push word L578
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L580: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L581: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L580
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L582: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L581
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L583: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L582
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g227
  mov [di], ax
  mov bp, g26
  jmp [bp]

L584: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L583
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g225
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L585: ; Arm: 820'11
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L584
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g226
  mov [di], ax
  mov bp, g26
  jmp [bp]

L586: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, g230
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L587: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L586
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L588: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(24)
  push word [si]
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
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [bp+2]
  jmp [bp]

L589: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L590: ; Continuation
  xchg si, di
  Bare_heap_check(14)
  push word [bp+4]
  push word L588
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [si]
  push word [CurrentCont]
  push word L589
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g7
  jmp [bp]

L591: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L590
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, 159
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L592: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L591
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, 1
  mov [di], ax
  mov bp, g9
  jmp [bp]

L593: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L592
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L594: ; Continuation
  xchg si, di
  Bare_heap_check(22)
  push word [si]
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
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g83
  jmp [bp]

L595: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L594
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L596: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L595
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g229
  mov [di], ax
  mov bp, g26
  jmp [bp]

L597: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(32)
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
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, g24
  jmp [bp]

L598: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L599: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L598
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L600: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L599
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L601: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L600
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g234
  mov [di], ax
  mov bp, g26
  jmp [bp]

L602: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L601
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g232
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L603: ; Arm: 831'11
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L602
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g233
  mov [di], ax
  mov bp, g26
  jmp [bp]

L604: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L605: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L604
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L606: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L605
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L607: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L606
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g248
  mov [di], ax
  mov bp, g26
  jmp [bp]

L608: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L607
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g246
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L609: ; Arm: 834'12
  push word [CurrentCont]
  push word L608
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g247
  mov [di], ax
  mov bp, g26
  jmp [bp]

L610: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  mov bx, [si]
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
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L611: ; Arm: 537'9
  mov ax, g239
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L612: ; Continuation
  xchg si, di
  Bare_heap_check(16)
  push word [bp+6]
  push word [si]
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 8 ;; scanned
  push word [Temps+2]
  push word 3
  mov [Temps+4], sp
  push word 4 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L613: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L612
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L614: ; Arm: 543'10
  push word [bp+10]
  push word [bp+6]
  push word [bp+2]
  push word [CurrentCont]
  push word L613
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g240
  mov [di], ax
  mov bp, g20
  jmp [bp]

L615: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L616: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L615
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
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
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [bp+6]
  jmp [bp]

L618: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L619: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L618
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L620: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L619
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, [bp+4]
  jmp [bp]

L621: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L620
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L622: ; Continuation
  xchg si, di
  Bare_heap_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L621
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L623: ; Continuation
  xchg si, di
  Bare_heap_check(24)
  mov bx, [si]
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
  mov ax, g243
  mov [di], ax
  mov bp, g6
  jmp [bp]

L624: ; Continuation
  xchg si, di
  Bare_heap_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L623
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [bp+12]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L625: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(22)
  mov ax, [si]
  cmp word ax, [bp+4]
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L614
  push word [si]
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [Temps+4]
  push word [si]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L624
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov ax, [bp+2]
  mov [di], ax
  mov bp, g97
  jmp [bp]

L626: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(14)
  push word [si]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L625
  mov [Temps+2], sp
  push word 12 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L627: ; Function: (loop,t5)
  xchg si, di
  Bare_heap_check(12)
  push word bp
  push word [si]
  push word [bp+4]
  push word [bp+2]
  push word L626
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L628: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, 1
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L629: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L628
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g245
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L630: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L629
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, [bp+4]
  jmp [bp]

L631: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L630
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L632: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L631
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g244
  mov [di], ax
  mov bp, g2
  jmp [bp]

L633: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L632
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L634: ; Continuation
  xchg si, di
  Bare_heap_check(26)
  push word [bp+4]
  push word [CurrentCont]
  push word L610
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [si]
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
  mov ax, [Temps+12]
  mov [di], ax
  mov bp, g9
  jmp [bp]

L635: ; Arm: 489'49
  mov ax, g238
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L636: ; Continuation
  xchg si, di
  Bare_heap_check(24)
  push word [bp+4]
  push word [CurrentCont]
  push word L634
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [si]
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
  mov ax, [Temps+16]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L637: ; Arm: 10'9
  mov ax, g236
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L638: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L636
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [si]
  cmp word [bx], 3
  jz L637
  mov ax, g237
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L639: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L638
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g235
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L640: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L639
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g56
  jmp [bp]

L641: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L640
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, 9
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L642: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L641
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, 1
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L643: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L642
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g68
  jmp [bp]

L644: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L643
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [si]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L645: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(14)
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
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g84
  jmp [bp]

L646: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L647: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L646
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L648: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L647
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L649: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L648
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g252
  mov [di], ax
  mov bp, g26
  jmp [bp]

L650: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L649
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g250
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L651: ; Arm: 841'9
  push word [CurrentCont]
  push word L650
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g251
  mov [di], ax
  mov bp, g26
  jmp [bp]

L652: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(6)
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
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L653: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L654: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L653
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L655: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L654
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L656: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L655
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g257
  mov [di], ax
  mov bp, g26
  jmp [bp]

L657: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L656
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g255
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L658: ; Arm: 847'9
  push word [CurrentCont]
  push word L657
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g256
  mov [di], ax
  mov bp, g26
  jmp [bp]

L659: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L660: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L659
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L661: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L660
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L662: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L661
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g267
  mov [di], ax
  mov bp, g26
  jmp [bp]

L663: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L662
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g266
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L664: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L663
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g26
  jmp [bp]

L665: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L664
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g31
  jmp [bp]

L666: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L665
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g1
  jmp [bp]

L667: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L666
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L668: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L667
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L669: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L668
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L670: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L669
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g265
  mov [di], ax
  mov bp, g26
  jmp [bp]

L671: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L670
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g264
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L672: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L671
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g26
  jmp [bp]

L673: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L672
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g31
  jmp [bp]

L674: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L673
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, g1
  jmp [bp]

L675: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L674
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L676: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L675
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L677: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L676
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L678: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L677
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g263
  mov [di], ax
  mov bp, g26
  jmp [bp]

L679: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L678
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g259
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L680: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L679
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g26
  jmp [bp]

L681: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L682: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L681
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g262
  mov [di], ax
  mov bp, g26
  jmp [bp]

L683: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L682
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L684: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L683
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g26
  jmp [bp]

L685: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L684
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g31
  jmp [bp]

L686: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L685
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L687: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L686
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g261
  mov [di], ax
  mov bp, g26
  jmp [bp]

L688: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L687
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L689: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L688
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g26
  jmp [bp]

L690: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L689
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, g31
  jmp [bp]

L691: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L690
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L692: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L691
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g260
  mov [di], ax
  mov bp, g26
  jmp [bp]

L693: ; Continuation
  xchg si, di
  Bare_heap_check(20)
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
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, g31
  jmp [bp]

L694: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L693
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L695: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(12)
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
  mov ax, g258
  mov [di], ax
  mov bp, g22
  jmp [bp]

L696: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L697: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L696
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L698: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L697
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L699: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L698
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g271
  mov [di], ax
  mov bp, g26
  jmp [bp]

L700: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L699
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g269
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L701: ; Arm: 869'9
  push word [CurrentCont]
  push word L700
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g270
  mov [di], ax
  mov bp, g26
  jmp [bp]

L702: ; Arm: 878'17
  mov ax, g272
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L703: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L704: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L703
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L705: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L704
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L706: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L705
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g275
  mov [di], ax
  mov bp, g26
  jmp [bp]

L707: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L706
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L708: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L707
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g26
  jmp [bp]

L709: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L708
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g31
  jmp [bp]

L710: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L709
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L711: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L710
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g274
  mov [di], ax
  mov bp, g26
  jmp [bp]

L712: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L711
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g273
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L713: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L712
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g26
  jmp [bp]

L714: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L713
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g31
  jmp [bp]

L715: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  mov bx, [si]
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
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L716: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L715
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L717: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(16)
  push word [si]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word [si]
  push word [CurrentCont]
  push word L716
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+2]
  mov [di], ax
  mov bp, g97
  jmp [bp]

L718: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L719: ; Continuation
  xchg si, di
  Bare_heap_check(14)
  push word [bp+4]
  push word L717
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [si]
  push word [CurrentCont]
  push word L718
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g7
  jmp [bp]

L720: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L719
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L721: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  mov ax, [si]
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
  mov ax, 1
  mov [di], ax
  mov bp, g9
  jmp [bp]

L722: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L721
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [si]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [bx+6]
  mov [Temps+6], ax
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L723: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(6)
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
  mov ax, [Temps+12]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L724: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L725: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L724
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L726: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L725
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L727: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L726
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g279
  mov [di], ax
  mov bp, g26
  jmp [bp]

L728: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L727
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g277
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L729: ; Arm: 859'9
  push word [CurrentCont]
  push word L728
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g278
  mov [di], ax
  mov bp, g26
  jmp [bp]

L730: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L731: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L730
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L732: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L731
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L733: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L732
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g26
  jmp [bp]

L734: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L733
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L735: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L734
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g289
  mov [di], ax
  mov bp, g26
  jmp [bp]

L736: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L735
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g31
  jmp [bp]

L737: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L736
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L738: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L737
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g288
  mov [di], ax
  mov bp, g26
  jmp [bp]

L739: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L738
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g280
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L740: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L739
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g26
  jmp [bp]

L741: ; Arm: 426'9
  mov ax, g281
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L742: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L743: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L742
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g287
  mov [di], ax
  mov bp, g26
  jmp [bp]

L744: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L743
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L745: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L744
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g26
  jmp [bp]

L746: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L745
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g31
  jmp [bp]

L747: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L746
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L748: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L747
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g286
  mov [di], ax
  mov bp, g26
  jmp [bp]

L749: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L748
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g282
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L750: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L749
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g26
  jmp [bp]

L751: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L750
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L752: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L751
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g285
  mov [di], ax
  mov bp, g61
  jmp [bp]

L753: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L752
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L754: ; Continuation
  xchg si, di
  Bare_heap_check(18)
  push word [bp+4]
  push word [CurrentCont]
  push word L740
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [si]
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
  mov ax, g284
  mov [di], ax
  mov bp, g2
  jmp [bp]

L755: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L754
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L756: ; Continuation
  xchg si, di
  Bare_heap_check(16)
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
  mov ax, [si]
  mov [di], ax
  mov bp, g97
  jmp [bp]

L757: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(8)
  mov bx, [bp+2]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L729
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [si]
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
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L758: ; Arm: 939'18
  mov ax, g301
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L759: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov bx, [bp+8]
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [bp+6]
  jmp [bp]

L760: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L761: ; Arm: 942'6
  push word [CurrentCont]
  push word L760
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L762: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L763: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L762
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L764: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L763
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L765: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L764
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, 1
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L766: ; Continuation
  xchg si, di
  Bare_heap_check(20)
  mov ax, [si]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L758
  mov ax, [bp+4]
  mov [Temps+4], ax
  mov ax, [si]
  cmp word ax, 257
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word [si]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L759
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L761
  push word [si]
  push word [CurrentCont]
  push word L765
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g68
  jmp [bp]

L767: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, 1
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L768: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L767
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L769: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L768
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L770: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L769
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L771: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L770
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g293
  mov [di], ax
  mov bp, g26
  jmp [bp]

L772: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L771
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g291
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L773: ; Arm: 634'9
  push word [CurrentCont]
  push word L772
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g292
  mov [di], ax
  mov bp, g26
  jmp [bp]

L774: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, 1
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L775: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L774
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L776: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L775
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L777: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L776
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L778: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L777
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g296
  mov [di], ax
  mov bp, g26
  jmp [bp]

L779: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L778
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g294
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L780: ; Arm: 638'12
  push word [CurrentCont]
  push word L779
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g295
  mov [di], ax
  mov bp, g26
  jmp [bp]

L781: ; Arm: 642'33
  mov ax, 1
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L782: ; Arm: 644'17
  mov ax, 1
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L783: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L784: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L783
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
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
  mov ax, [bp+14]
  mov [di], ax
  mov bp, [bp+6]
  jmp [bp]

L786: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L787: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L786
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L788: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L787
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, 1
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L789: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [si]
  push word [bp+6]
  push word [CurrentCont]
  push word L788
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g72
  jmp [bp]

L790: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L789
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L791: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L790
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L792: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L791
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g68
  jmp [bp]

L793: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L792
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [si]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L794: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L793
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov bp, g84
  jmp [bp]

L795: ; Arm: 99'23
  mov ax, 257
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L796: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  mov ax, 257
  cmp word ax, [si]
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
  mov ax, [si]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L797: ; Arm: 99'23
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L798: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  mov bx, [si]
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
  mov ax, [bp+8]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L799: ; Arm: 10'9
  mov ax, g299
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L800: ; Continuation
  xchg si, di
  Bare_heap_check(18)
  mov bx, [si]
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
  mov ax, g300
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L801: ; Arm: 10'9
  mov ax, g297
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L802: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(16)
  mov ax, 1
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [si]
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
  mov ax, g298
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L803: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word L802
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L804: ; Function: (loop,t2)
  xchg si, di
  Bare_heap_check(10)
  push word bp
  push word [si]
  push word [bp+2]
  push word L803
  mov [Temps+2], sp
  push word 8 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L805: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L806: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L805
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L807: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  mov ax, [si]
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
  mov ax, [bp+8]
  mov [di], ax
  mov bp, [bp+6]
  jmp [bp]

L808: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [si]
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
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L809: ; Continuation
  xchg si, di
  Bare_heap_check(18)
  mov bx, [si]
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
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L810: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L809
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L811: ; Continuation
  xchg si, di
  Bare_heap_check(18)
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
  mov ax, [si]
  mov [di], ax
  mov bp, g97
  jmp [bp]

L812: ; Function: (loop,t1)
  xchg si, di
  Bare_heap_check(24)
  mov bx, [bp+2]
  mov ax, [bx]
  mov [Temps+2], ax
  push word bp
  push word [si]
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
  push word [si]
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
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L813: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word L812
  mov [Temps+2], sp
  push word 8 ;; scanned
  mov ax, 1
  mov [di], ax
  mov bp, [Temps+2]
  jmp [bp]

L814: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(10)
  push word [si]
  push word [bp+2]
  push word [CurrentCont]
  push word L813
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, 257
  mov [di], ax
  jmp AllocBare_make_bytes

L815: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L816: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L815
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L817: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L816
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L818: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L817
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g305
  mov [di], ax
  mov bp, g26
  jmp [bp]

L819: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L818
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g303
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L820: ; Arm: 918'9
  push word [CurrentCont]
  push word L819
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g304
  mov [di], ax
  mov bp, g26
  jmp [bp]

L821: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L822: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L821
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L823: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L822
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L824: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L823
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g308
  mov [di], ax
  mov bp, g26
  jmp [bp]

L825: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L824
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g306
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L826: ; Arm: 922'12
  push word [CurrentCont]
  push word L825
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g307
  mov [di], ax
  mov bp, g26
  jmp [bp]

L827: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov bx, [bp+4]
  mov ax, [Temps+2]
  mov [bx], ax
  mov ax, Bare_unit
  mov [Temps+4], ax
  mov ax, g310
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L828: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L827
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g309
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L829: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L828
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L830: ; Continuation
  xchg si, di
  Bare_heap_check(18)
  push word [bp+8]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word [si]
  push word [bp+6]
  push word [CurrentCont]
  push word L829
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+10]
  mov [di], ax
  mov bp, [bp+4]
  jmp [bp]

L831: ; Continuation
  xchg si, di
  Bare_heap_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L830
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [bp+12]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L832: ; Continuation
  xchg si, di
  Bare_heap_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L831
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g98
  jmp [bp]

L833: ; Continuation
  xchg si, di
  Bare_heap_check(40)
  mov bx, [si]
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
  mov ax, [Temps+18]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L834: ; Continuation
  xchg si, di
  Bare_heap_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L833
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov ax, [bp+14]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L835: ; Continuation
  xchg si, di
  Bare_heap_check(24)
  push word [bp+8]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word [si]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L834
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g97
  jmp [bp]

L836: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(14)
  mov bx, [bp+4]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L820
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [si]
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
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L837: ; Arm: 895'9
  mov ax, g322
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L838: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, 1
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L839: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L838
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [bp+4]
  jmp [bp]

L840: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L839
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L841: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L840
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L842: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L841
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L843: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L842
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g324
  mov [di], ax
  mov bp, g26
  jmp [bp]

L844: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L843
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g323
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L845: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L844
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g26
  jmp [bp]

L846: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L845
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g31
  jmp [bp]

L847: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  mov bx, [si]
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
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L848: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, g315
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L849: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L848
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L850: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L849
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L851: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L850
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L852: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L851
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g314
  mov [di], ax
  mov bp, g26
  jmp [bp]

L853: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L852
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g312
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L854: ; Arm: 607'9
  push word [CurrentCont]
  push word L853
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g313
  mov [di], ax
  mov bp, g26
  jmp [bp]

L855: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, g320
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L856: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L855
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L857: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L856
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L858: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L857
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L859: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L858
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g319
  mov [di], ax
  mov bp, g26
  jmp [bp]

L860: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L859
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g317
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L861: ; Arm: 610'12
  push word [CurrentCont]
  push word L860
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g318
  mov [di], ax
  mov bp, g26
  jmp [bp]

L862: ; Continuation
  xchg si, di
  Bare_heap_check(12)
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
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L863: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L862
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+10]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L864: ; Continuation
  xchg si, di
  Bare_heap_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L863
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L865: ; Continuation
  xchg si, di
  Bare_heap_check(28)
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
  mov ax, [si]
  mov [di], ax
  mov bp, [bp+4]
  jmp [bp]

L866: ; Continuation
  xchg si, di
  Bare_heap_check(14)
  mov bx, [si]
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
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L867: ; Arm: 561'10
  mov ax, g316
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L868: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(42)
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
  mov ax, [Temps+20]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L869: ; Arm: 905'9
  mov ax, g336
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L870: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L871: ; Continuation
  xchg si, di
  Bare_heap_check(14)
  push word [bp+6]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [si]
  push word [CurrentCont]
  push word L870
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [bp+4]
  jmp [bp]

L872: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  mov bx, [si]
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
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L873: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, g331
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L874: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L873
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L875: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L874
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L876: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L875
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L877: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L876
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g330
  mov [di], ax
  mov bp, g26
  jmp [bp]

L878: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L877
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g328
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L879: ; Arm: 623'9
  push word [CurrentCont]
  push word L878
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g329
  mov [di], ax
  mov bp, g26
  jmp [bp]

L880: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, g335
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L881: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L880
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L882: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L881
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L883: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L882
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L884: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L883
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g334
  mov [di], ax
  mov bp, g26
  jmp [bp]

L885: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L884
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g332
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L886: ; Arm: 627'12
  push word [CurrentCont]
  push word L885
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g333
  mov [di], ax
  mov bp, g26
  jmp [bp]

L887: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  mov bx, [si]
  cmp word [bx], 1
  jz L886
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word 3
  mov [Temps+4], sp
  push word 4 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L888: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L887
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L889: ; Continuation
  xchg si, di
  Bare_heap_check(14)
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word [CurrentCont]
  push word L888
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g97
  jmp [bp]

L890: ; Continuation
  xchg si, di
  Bare_heap_check(18)
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
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L891: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L890
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L892: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L891
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L893: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L892
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+10]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L894: ; Continuation
  xchg si, di
  Bare_heap_check(14)
  push word [si]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L893
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, g327
  mov [di], ax
  mov bp, g26
  jmp [bp]

L895: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L894
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g326
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L896: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L895
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g26
  jmp [bp]

L897: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(12)
  push word [si]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L896
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g31
  jmp [bp]

L898: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L899: ; Continuation
  xchg si, di
  Bare_heap_check(14)
  push word [bp+6]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+8]
  push word [CurrentCont]
  push word L898
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [bp+4]
  jmp [bp]

L900: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L899
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L901: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L900
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L902: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L901
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+10]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L903: ; Continuation
  xchg si, di
  Bare_heap_check(14)
  push word [si]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L902
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, g340
  mov [di], ax
  mov bp, g26
  jmp [bp]

L904: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L903
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+10]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L905: ; Continuation
  xchg si, di
  Bare_heap_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L904
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g26
  jmp [bp]

L906: ; Continuation
  xchg si, di
  Bare_heap_check(14)
  push word [si]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L905
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, g31
  jmp [bp]

L907: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L906
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+10]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L908: ; Continuation
  xchg si, di
  Bare_heap_check(14)
  push word [si]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L907
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, g339
  mov [di], ax
  mov bp, g26
  jmp [bp]

L909: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L908
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g338
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L910: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L909
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g26
  jmp [bp]

L911: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(12)
  push word [si]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L910
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g31
  jmp [bp]

L912: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [bp+2]
  push word L911
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L913: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L914: ; Arm: 1006'36
  push word [CurrentCont]
  push word L913
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g353
  mov [di], ax
  mov bp, g22
  jmp [bp]

L915: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [bp+6]
  jmp [bp]

L916: ; Arm: 990'7
  mov ax, g356
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L917: ; Arm: 743'9
  mov ax, g357
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L918: ; Arm: 747'35
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

L919: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  mov bx, [si]
  cmp word [bx], 3
  jz L918
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [bp+4]
  jmp [bp]

L920: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L919
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L921: ; Function: (loop,t3)
  xchg si, di
  Bare_heap_check(14)
  mov bx, [si]
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
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, g56
  jmp [bp]

L922: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L923: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L922
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L924: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L923
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L925: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L924
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g360
  mov [di], ax
  mov bp, g26
  jmp [bp]

L926: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L925
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g359
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L927: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L926
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g26
  jmp [bp]

L928: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L927
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g358
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L929: ; Arm: 993'12
  push word [CurrentCont]
  push word L928
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g26
  jmp [bp]

L930: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  mov bx, [si]
  cmp word [bx], 1
  jz L929
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [Temps+4]
  jmp [bp]

L931: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L930
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, [bp+8]
  jmp [bp]

L932: ; Continuation
  xchg si, di
  Bare_heap_check(28)
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L915
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [si]
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
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L933: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L932
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+10]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L934: ; Continuation
  xchg si, di
  Bare_heap_check(14)
  push word [si]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L933
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, g355
  mov [di], ax
  mov bp, g20
  jmp [bp]

L935: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L934
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+10]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L936: ; Continuation
  xchg si, di
  Bare_heap_check(14)
  push word [si]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L935
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, g354
  mov [di], ax
  mov bp, g62
  jmp [bp]

L937: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  mov bx, [si]
  cmp word [bx], 3
  jz L914
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L936
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+10]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L938: ; Continuation
  xchg si, di
  Bare_heap_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L937
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L939: ; Continuation
  xchg si, di
  Bare_heap_check(16)
  push word [si]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L938
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g56
  jmp [bp]

L940: ; Continuation
  xchg si, di
  Bare_heap_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L939
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, g352
  mov [di], ax
  mov bp, g79
  jmp [bp]

L941: ; Continuation
  xchg si, di
  Bare_heap_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L940
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L942: ; Continuation
  xchg si, di
  Bare_heap_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L941
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L943: ; Continuation
  xchg si, di
  Bare_heap_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L942
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, g351
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L944: ; Continuation
  xchg si, di
  Bare_heap_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L943
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g26
  jmp [bp]

L945: ; Function: (repl,t17)
  xchg si, di
  Bare_heap_check(14)
  push word bp
  push word [si]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L944
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g31
  jmp [bp]

L946: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, 3
  mov [di], ax
  mov bp, [bp+4]
  jmp [bp]

L947: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L946
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L948: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L947
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L949: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L948
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L950: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L949
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g371
  mov [di], ax
  mov bp, g26
  jmp [bp]

L951: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L950
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g369
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L952: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L951
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g26
  jmp [bp]

L953: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L952
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L954: ; Continuation
  xchg si, di
  Bare_heap_check(10)
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
  mov ax, g370
  mov [di], ax
  mov bp, g61
  jmp [bp]

L955: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L954
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L956: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L955
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L957: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L956
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L958: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L957
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g368
  mov [di], ax
  mov bp, g26
  jmp [bp]

L959: ; Continuation
  xchg si, di
  Bare_heap_check(10)
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
  mov ax, 1537
  mov [di], ax
  mov bp, g31
  jmp [bp]

L960: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L959
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L961: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L960
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L962: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L961
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L963: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L962
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g367
  mov [di], ax
  mov bp, g26
  jmp [bp]

L964: ; Continuation
  xchg si, di
  Bare_heap_check(10)
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
  mov ax, 81
  mov [di], ax
  mov bp, g31
  jmp [bp]

L965: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L964
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L966: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L965
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L967: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L966
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L968: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L967
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g366
  mov [di], ax
  mov bp, g26
  jmp [bp]

L969: ; Continuation
  xchg si, di
  Bare_heap_check(10)
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
  mov ax, 257
  mov [di], ax
  mov bp, g31
  jmp [bp]

L970: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L969
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L971: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L970
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L972: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L971
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L973: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L972
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g365
  mov [di], ax
  mov bp, g26
  jmp [bp]

L974: ; Continuation
  xchg si, di
  Bare_heap_check(10)
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
  mov ax, 10241
  mov [di], ax
  mov bp, g31
  jmp [bp]

L975: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L974
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L976: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L975
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L977: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L976
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L978: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L977
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g364
  mov [di], ax
  mov bp, g26
  jmp [bp]

L979: ; Continuation
  xchg si, di
  Bare_heap_check(10)
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
  mov ax, 21
  mov [di], ax
  mov bp, g31
  jmp [bp]

L980: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L979
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L981: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L980
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  jmp [bp]

L982: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L981
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L983: ; Continuation
  xchg si, di
  Bare_heap_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L982
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g363
  mov [di], ax
  mov bp, g26
  jmp [bp]

L984: ; Continuation
  xchg si, di
  Bare_heap_check(10)
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
  mov ax, 1025
  mov [di], ax
  mov bp, g31
  jmp [bp]

L985: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L984
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  jmp [bp]

L986: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L985
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g362
  mov [di], ax
  mov bp, g22
  jmp [bp]

L987: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L986
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L988: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L987
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g361
  mov [di], ax
  mov bp, g101
  jmp [bp]

L989: ; Continuation
  xchg si, di
  Bare_heap_check(142)
  push word g350
  push word [si]
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
  mov ax, [Temps+36]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L990: ; Continuation
  xchg si, di
  Bare_heap_check(36)
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
  mov ax, g348
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L991: ; Continuation
  xchg si, di
  Bare_heap_check(36)
  push word [si]
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
  mov ax, g349
  mov [di], ax
  mov bp, g108
  jmp [bp]

L992: ; Continuation
  xchg si, di
  Bare_heap_check(34)
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
  mov ax, [bp+32]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L993: ; Continuation
  xchg si, di
  Bare_heap_check(42)
  push word [bp+6]
  push word L912
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word [si]
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
  mov ax, g341
  mov [di], ax
  mov bp, g142
  jmp [bp]

L994: ; Continuation
  xchg si, di
  Bare_heap_check(34)
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
  mov ax, [bp+32]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L995: ; Continuation
  xchg si, di
  Bare_heap_check(44)
  push word [bp+8]
  push word [bp+6]
  push word L897
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word [si]
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
  mov ax, g337
  mov [di], ax
  mov bp, g121
  jmp [bp]

L996: ; Continuation
  xchg si, di
  Bare_heap_check(34)
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
  mov ax, [bp+32]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L997: ; Continuation
  xchg si, di
  Bare_heap_check(46)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word L868
  mov [Temps+2], sp
  push word 8 ;; scanned
  push word [Temps+2]
  push word [si]
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
  mov ax, g325
  mov [di], ax
  mov bp, g108
  jmp [bp]

L998: ; Continuation
  xchg si, di
  Bare_heap_check(34)
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
  mov ax, [bp+32]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L999: ; Continuation
  xchg si, di
  Bare_heap_check(44)
  push word [bp+8]
  push word [bp+6]
  push word L836
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word [si]
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
  mov ax, g311
  mov [di], ax
  mov bp, g121
  jmp [bp]

L1000: ; Continuation
  xchg si, di
  Bare_heap_check(32)
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
  mov ax, [bp+30]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L1001: ; Continuation
  xchg si, di
  Bare_heap_check(40)
  push word [bp+8]
  push word L814
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word [si]
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
  mov ax, g302
  mov [di], ax
  mov bp, g121
  jmp [bp]

L1002: ; Continuation
  xchg si, di
  Bare_heap_check(30)
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
  mov ax, [bp+28]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L1003: ; Continuation
  xchg si, di
  Bare_heap_check(38)
  push word [bp+8]
  push word L757
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word [si]
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
  mov ax, g290
  mov [di], ax
  mov bp, g121
  jmp [bp]

L1004: ; Continuation
  xchg si, di
  Bare_heap_check(28)
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
  mov ax, [bp+26]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L1005: ; Continuation
  xchg si, di
  Bare_heap_check(36)
  push word [bp+8]
  push word L723
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word [si]
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
  mov ax, g276
  mov [di], ax
  mov bp, g108
  jmp [bp]

L1006: ; Continuation
  xchg si, di
  Bare_heap_check(26)
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
  mov ax, [bp+24]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L1007: ; Continuation
  xchg si, di
  Bare_heap_check(34)
  push word [bp+8]
  push word L695
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word [si]
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
  mov ax, g268
  mov [di], ax
  mov bp, g108
  jmp [bp]

L1008: ; Continuation
  xchg si, di
  Bare_heap_check(24)
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
  mov ax, [bp+22]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L1009: ; Continuation
  xchg si, di
  Bare_heap_check(32)
  push word [bp+8]
  push word L652
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word [si]
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
  mov ax, g254
  mov [di], ax
  mov bp, g108
  jmp [bp]

L1010: ; Continuation
  xchg si, di
  Bare_heap_check(22)
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
  mov ax, [bp+20]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L1011: ; Continuation
  xchg si, di
  Bare_heap_check(30)
  push word [bp+8]
  push word L645
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word [si]
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
  mov ax, g249
  mov [di], ax
  mov bp, g108
  jmp [bp]

L1012: ; Continuation
  xchg si, di
  Bare_heap_check(20)
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
  mov ax, [bp+18]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L1013: ; Continuation
  xchg si, di
  Bare_heap_check(30)
  push word [bp+8]
  push word [bp+6]
  push word L597
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word [si]
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
  mov ax, g231
  mov [di], ax
  mov bp, g108
  jmp [bp]

L1014: ; Continuation
  xchg si, di
  Bare_heap_check(18)
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
  mov ax, g223
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L1015: ; Continuation
  xchg si, di
  Bare_heap_check(18)
  push word [si]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L1014
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov ax, g224
  mov [di], ax
  mov bp, g121
  jmp [bp]

L1016: ; Continuation
  xchg si, di
  Bare_heap_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L1015
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov ax, g216
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L1017: ; Continuation
  xchg si, di
  Bare_heap_check(16)
  push word [si]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L1016
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov ax, g217
  mov [di], ax
  mov bp, g108
  jmp [bp]

L1018: ; Continuation
  xchg si, di
  Bare_heap_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L1017
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, g205
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L1019: ; Continuation
  xchg si, di
  Bare_heap_check(32)
  push word [si]
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
  mov ax, g206
  mov [di], ax
  mov bp, g108
  jmp [bp]

L1020: ; Continuation
  xchg si, di
  Bare_heap_check(24)
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
  push word [si]
  push word [CurrentCont]
  push word L1019
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g24
  jmp [bp]

L1021: ; Start
  xchg si, di
  Bare_heap_check(24)
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
  mov ax, [Temps+6]
  mov [di], ax
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
