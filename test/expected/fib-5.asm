L1: ; Arm: 20'7
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

L3: ; Arm: 30'11
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

L7: ; Arm: 4'13
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

L11: ; Arm: 13'13
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
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L11
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
  push word L12
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+12]
  mov [di], ax
  mov bp, g7
  jmp [bp]

L14: ; Function: (loop,g7)
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

L15: ; Arm: 4'13
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
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L15
  mov ax, g10
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
  push word L16
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, g9
  jmp [bp]

L18: ; Function: (explode_loop,g9)
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

L19: ; Arm: 13'13
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
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L19
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
  push word L20
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+12]
  mov [di], ax
  mov bp, g12
  jmp [bp]

L22: ; Function: (loop,g12)
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

L23: ; Continuation
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

L24: ; Continuation
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L23
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g1
  jmp [bp]

L25: ; Arm: 16'11
  push word g13
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

L26: ; Continuation
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L27: ; Continuation
  xchg si, di
  Bare_heap_check(14)
  mov ax, [bp+4]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  push word [CurrentCont]
  push word L24
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L25
  push word [bp+4]
  push word [CurrentCont]
  push word L26
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g14
  mov [di], ax
  mov bp, g12
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

L29: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L28
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, 9
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L30: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L29
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g11
  mov [di], ax
  mov bp, g9
  jmp [bp]

L31: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L30
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g1
  jmp [bp]

L32: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L31
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, 21
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L33: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L32
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g8
  mov [di], ax
  mov bp, g7
  jmp [bp]

L34: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L33
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g1
  jmp [bp]

L35: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L34
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, 7
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L36: ; Continuation
  xchg si, di
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L35
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g6
  mov [di], ax
  mov bp, g4
  jmp [bp]

L37: ; Start
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L36
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, 21
  mov [di], ax
  mov bp, g3
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
  dw 9
  db `fib `
g6:
  dw 1
g7:
  dw L14
g8:
  dw 1
g9:
  dw L18
g10:
  dw 11
  db ` --> `
g11:
  dw 1
g12:
  dw L22
g13:
  dw 1
g14:
  dw 1

bare_start: jmp L37
