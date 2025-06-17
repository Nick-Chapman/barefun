L1: ; Function: (decrease,g1)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(0)
  mov ax, [si+2]
  mov bx, [si]
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

L2: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, [bp+4]
  mov ax, 1
  jmp [bp]

L3: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L2
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, [bp+4]
  mov ax, 1
  jmp [bp]

L4: ; Function: (thriceA,g2)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L3
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si+2]
  mov [di], ax
  mov bp, [si]
  mov ax, 1
  jmp [bp]

L5: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, [bp+4]
  mov ax, 1
  jmp [bp]

L6: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L5
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, [bp+4]
  mov ax, 1
  jmp [bp]

L7: ; Function: (thriceB,g3)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L6
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si+2]
  mov [di], ax
  mov bp, [si]
  mov ax, 1
  jmp [bp]

L8: ; Continuation
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

L9: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L8
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g3
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov ax, 185
  mov [di+4], ax
  mov bp, g2
  mov ax, 3
  jmp [bp]

L10: ; Start
  xchg si, di
  Bare_arg_check(0)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L9
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, 3
  mov [di], ax
  mov bp, g1
  mov ax, 1
  jmp [bp]

g1:
  dw L1
g2:
  dw L4
g3:
  dw L7

bare_start: jmp L10
