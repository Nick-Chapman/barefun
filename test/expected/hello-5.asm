L1: ; Arm: 11'7
  mov ax, g2
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L2: ; Function: (put_chars,g1)
  Bare_arg_check(1)
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
  mov ax, 1
  jmp [bp]

L3: ; Arm: 4'13
  mov ax, [bp+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L4: ; Continuation
  Bare_arg_check(1)
  xchg si, di
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  mov ax, 1
  jmp [bp]

L5: ; Function: (lam,t1)
  Bare_arg_check(1)
  xchg si, di
  Bare_heap_check(16)
  mov ax, [si]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L3
  mov ax, g4
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
  push word L4
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, g3
  mov ax, 1
  jmp [bp]

L6: ; Function: (explode_loop,g3)
  Bare_arg_check(1)
  xchg si, di
  Bare_heap_check(6)
  push word [si]
  push word L5
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L7: ; Continuation
  Bare_arg_check(1)
  xchg si, di
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g1
  mov ax, 1
  jmp [bp]

L8: ; Continuation
  Bare_arg_check(1)
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L7
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, 27
  mov [di], ax
  mov bp, [si]
  mov ax, 1
  jmp [bp]

L9: ; Start
  Bare_arg_check(0)
  xchg si, di
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L8
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g5
  mov [di], ax
  mov bp, g3
  mov ax, 1
  jmp [bp]

g1:
  dw L2
g2:
  dw 1
g3:
  dw L6
g4:
  dw 29
  db `Hello, world!\n`
g5:
  dw 1

bare_start: jmp L9
