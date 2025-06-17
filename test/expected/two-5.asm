L1: ; Function: (two,g1)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(0)
  mov ax, [si]
  mov bx, [si+2]
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L2: ; Function: (numA,g2)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, 121
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L3: ; Function: (numB,g3)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, 11
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L4: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L5: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L4
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g1
  mov ax, 2
  jmp [bp]

L6: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L5
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g5
  mov [di], ax
  mov bp, g3
  mov ax, 1
  jmp [bp]

L7: ; Function: (call_two,g6)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L6
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g4
  mov [di], ax
  mov bp, g2
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

L9: ; Start
  xchg si, di
  Bare_arg_check(0)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L8
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g7
  mov [di], ax
  mov bp, g6
  mov ax, 1
  jmp [bp]

g1:
  dw L1
g2:
  dw L2
g3:
  dw L3
g4:
  dw 1
g5:
  dw 1
g6:
  dw L7
g7:
  dw 1

bare_start: jmp L9
