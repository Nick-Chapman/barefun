L1: ; Function: (lam,t1)
  Bare_enter_check(0)
  mov ax, [bp+2]
  mov bx, si
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L2: ; Function: (two,g1)
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

L3: ; Function: (numA,g2)
  Bare_enter_check(0)
  mov si, 121
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L4: ; Function: (numB,g3)
  Bare_enter_check(0)
  mov si, 11
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L5: ; Continuation
  Bare_enter_check(0)
  mov si, si
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L6: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L5
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L7: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L6
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, g1
  jmp [bp]

L8: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L7
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g3
  mov si, g5
  jmp [bp]

L9: ; Function: (call_two,g6)
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L8
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g2
  mov si, g4
  jmp [bp]

L10: ; Continuation
  Bare_enter_check(0)
  mov ax, si
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+2], ax
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+4], ax
  mov si, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L11: ; Start
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L10
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g6
  mov si, g7
  jmp [bp]

g1:
  dw L2
g2:
  dw L3
g3:
  dw L4
g4:
  dw 1
g5:
  dw 1
g6:
  dw L9
g7:
  dw 1

bare_start: jmp L11
