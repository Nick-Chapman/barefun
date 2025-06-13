L1: ; Function: (lam,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov bx, [bp+2]
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L2: ; Function: (decrease,g1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [si]
  push word L1
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L3: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, [bp+4]
  mov ax, 1
  jmp [bp]

L4: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L3
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, [bp+4]
  mov ax, 1
  jmp [bp]

L5: ; Function: (lam,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+2]
  push word [CurrentCont]
  push word L4
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, [bp+2]
  mov ax, 1
  jmp [bp]

L6: ; Function: (thriceA,g2)
  xchg si, di
  Bare_arg_check(1)
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
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, [bp+4]
  mov ax, 1
  jmp [bp]

L8: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L7
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, [bp+4]
  mov ax, 1
  jmp [bp]

L9: ; Function: (lam,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+2]
  push word [CurrentCont]
  push word L8
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, [bp+2]
  mov ax, 1
  jmp [bp]

L10: ; Function: (thriceB,g3)
  xchg si, di
  Bare_arg_check(1)
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
  mov ax, 1
  jmp [bp]

L11: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+2], ax
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+4], ax
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L12: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L11
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, 185
  mov [di], ax
  mov bp, [si]
  mov ax, 1
  jmp [bp]

L13: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L12
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  mov ax, 1
  jmp [bp]

L14: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L13
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g3
  mov [di], ax
  mov bp, g2
  mov ax, 1
  jmp [bp]

L15: ; Start
  xchg si, di
  Bare_arg_check(0)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L14
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, 3
  mov [di], ax
  mov bp, g1
  mov ax, 1
  jmp [bp]

g1:
  dw L2
g2:
  dw L6
g3:
  dw L10

bare_start: jmp L15
