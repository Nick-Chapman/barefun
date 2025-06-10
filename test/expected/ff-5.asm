L1: ; Arm: 21'7
  mov ax, g2
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L2: ; Function: (put_chars,g1)
  xchg si, di
  Bare_heap_check(0)
  mov bx, [si]
  cmp word [bx], 1
  jz L1
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g1
  jmp [bp]

L3: ; Arm: 31'11
  mov ax, [si]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L4: ; Continuation
  xchg si, di
  Bare_heap_check(0)
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

L5: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  mov ax, [bp+4]
  mov bx, 5
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  push word [si]
  push word [CurrentCont]
  push word L4
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g3
  jmp [bp]

L6: ; Function: (fib,g3)
  xchg si, di
  Bare_heap_check(8)
  mov ax, [si]
  cmp word ax, 5
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L3
  mov ax, [si]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+4], ax
  push word [si]
  push word [CurrentCont]
  push word L5
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g3
  jmp [bp]

L7: ; Arm: 5'13
  mov ax, [bp+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L8: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L9: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(16)
  mov ax, [si]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L7
  mov ax, g5
  mov bx, [si]
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+4], ax
  mov ax, [si]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+6], ax
  push word [bp+2]
  push word [Temps+4]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word [CurrentCont]
  push word L8
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, g4
  jmp [bp]

L10: ; Function: (explode_loop,g4)
  xchg si, di
  Bare_heap_check(6)
  push word [si]
  push word L9
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L11: ; Arm: 5'13
  mov ax, [bp+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L12: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L13: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(16)
  mov ax, [si]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L11
  mov ax, g9
  mov bx, [si]
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+4], ax
  mov ax, [si]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+6], ax
  push word [bp+2]
  push word [Temps+4]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word [CurrentCont]
  push word L12
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, g8
  jmp [bp]

L14: ; Function: (explode_loop,g8)
  xchg si, di
  Bare_heap_check(6)
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

L15: ; Arm: 14'13
  mov ax, [bp+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L16: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L17: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(16)
  mov ax, [si]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L15
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
  push word L16
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+12]
  mov [di], ax
  mov bp, g11
  jmp [bp]

L18: ; Function: (loop,g11)
  xchg si, di
  Bare_heap_check(6)
  push word [si]
  push word L17
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L19: ; Arm: 5'13
  mov ax, [bp+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L20: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L21: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(16)
  mov ax, [si]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L19
  mov ax, g15
  mov bx, [si]
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+4], ax
  mov ax, [si]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+6], ax
  push word [bp+2]
  push word [Temps+4]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word [CurrentCont]
  push word L20
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, g14
  jmp [bp]

L22: ; Function: (explode_loop,g14)
  xchg si, di
  Bare_heap_check(6)
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

L23: ; Arm: 14'13
  mov ax, [bp+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L24: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L25: ; Function: (lam,t1)
  xchg si, di
  Bare_heap_check(16)
  mov ax, [si]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L23
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
  push word L24
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+12]
  mov [di], ax
  mov bp, g17
  jmp [bp]

L26: ; Function: (loop,g17)
  xchg si, di
  Bare_heap_check(6)
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

L27: ; Continuation
  xchg si, di
  Bare_heap_check(0)
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
  mov bp, g7
  jmp [bp]

L28: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L27
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g1
  jmp [bp]

L29: ; Arm: 17'11
  push word g18
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

L30: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L31: ; Continuation
  xchg si, di
  Bare_heap_check(16)
  mov ax, [bp+6]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  push word [bp+4]
  push word [CurrentCont]
  push word L28
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L29
  push word [bp+6]
  push word [CurrentCont]
  push word L30
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g19
  mov [di], ax
  mov bp, g17
  jmp [bp]

L32: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L31
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g1
  jmp [bp]

L33: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L32
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, 9
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L34: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L33
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g16
  mov [di], ax
  mov bp, g14
  jmp [bp]

L35: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L34
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g1
  jmp [bp]

L36: ; Arm: 17'11
  push word g12
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

L37: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L38: ; Continuation
  xchg si, di
  Bare_heap_check(18)
  mov ax, [bp+4]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L35
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L36
  push word [bp+4]
  push word [CurrentCont]
  push word L37
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g13
  mov [di], ax
  mov bp, g11
  jmp [bp]

L39: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L38
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g1
  jmp [bp]

L40: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L39
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, 7
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L41: ; Continuation
  xchg si, di
  Bare_heap_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L40
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g10
  mov [di], ax
  mov bp, g8
  jmp [bp]

L42: ; Function: (loop,g7)
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L41
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g3
  jmp [bp]

L43: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, 1
  mov [di], ax
  mov bp, g7
  jmp [bp]

L44: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L43
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g1
  jmp [bp]

L45: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L44
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, 29
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L46: ; Start
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L45
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g6
  mov [di], ax
  mov bp, g4
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
  dw L42
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

bare_start: jmp L46
