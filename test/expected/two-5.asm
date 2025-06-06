L1: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov ax, [bp+2]
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

L2: ; Function: (two,g1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [si]
  push word L1
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L3: ; Function: (numA,g2)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov ax, 121
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L4: ; Function: (numB,g3)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov ax, 11
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L5: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L6: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L5
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L7: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [si]
  push word [CurrentCont]
  push word L6
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g1
  jmp [bp]

L8: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word [si]
  push word [CurrentCont]
  push word L7
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g5
  mov [di], ax
  mov bp, g3
  jmp [bp]

L9: ; Function: (call_two,g6)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L8
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g4
  mov [di], ax
  mov bp, g2
  jmp [bp]

L10: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
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
  jmp [bp]

L11: ; Start
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L10
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g7
  mov [di], ax
  mov bp, g6
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
