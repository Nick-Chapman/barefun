L1: ; Arm: 6'13
  mov di, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L2: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L3: ; Function: (lam,t1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L1
  mov ax, si
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
  mov ax, si
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
  push word L2
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [Temps+12]
  mov bp, g1
  jmp [bp]

L4: ; Function: (loop,g1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word si
  push word L3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L5: ; Arm: 13'7
  mov di, g3
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L6: ; Function: (put_chars,g2)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov bx, si
  cmp word [bx], 1
  jz L5
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov di, [Temps+4]
  mov bp, g2
  jmp [bp]

L7: ; Arm: 22'10
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L8: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, si
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L9: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L8
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+4]
  mov bp, g4
  jmp [bp]

L10: ; Arm: 23'15
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [CurrentCont]
  push word L9
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [Temps+2]
  mov bp, g4
  jmp [bp]

L11: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, si
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L12: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L11
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+4]
  mov bp, g4
  jmp [bp]

L13: ; Arm: 24'15
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [CurrentCont]
  push word L12
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [Temps+2]
  mov bp, g4
  jmp [bp]

L14: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov ax, [bp+4]
  sar ax, 1
  sar si, 1
  mul si
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L15: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L14
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [bp+4]
  mov bp, g4
  jmp [bp]

L16: ; Function: (eval,g4)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 1
  jz L7
  cmp word [bx], 3
  jz L10
  cmp word [bx], 5
  jz L13
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [CurrentCont]
  push word L15
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [Temps+2]
  mov bp, g4
  jmp [bp]

L17: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, si
  mov bp, g2
  jmp [bp]

L18: ; Arm: 9'20
  push word g5
  push word `0`
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  mov di, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L19: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L20: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(14)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  push word [CurrentCont]
  push word L17
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L18
  push word si
  push word [CurrentCont]
  push word L19
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g6
  mov bp, g1
  jmp [bp]

L21: ; Start
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(54)
  push word 2001
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word 21
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word 7
  push word 1
  mov [Temps+6], sp
  push word 4 ;; scanned
  push word [Temps+6]
  push word [Temps+4]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word 35
  push word 1
  mov [Temps+10], sp
  push word 4 ;; scanned
  push word [Temps+10]
  push word [Temps+8]
  push word 7
  mov [Temps+12], sp
  push word 6 ;; scanned
  push word [Temps+12]
  push word [Temps+2]
  push word 5
  mov [Temps+14], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L20
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [Temps+14]
  mov bp, g4
  jmp [bp]

g1:
  dw L4
g2:
  dw L6
g3:
  dw 1
g4:
  dw L16
g5:
  dw 1
g6:
  dw 1

bare_start: jmp L21
