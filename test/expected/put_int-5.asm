L1: ; Arm: 13'7
  mov di, g2
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L2: ; Function: (put_chars,g1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov bx, si
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
  mov di, [Temps+4]
  mov bp, g1
  jmp [bp]

L3: ; Arm: 6'13
  mov di, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L4: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  jmp [bp]

L5: ; Function: (lam,t1)
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
  jz L3
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
  push word L4
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [Temps+12]
  mov bp, g3
  jmp [bp]

L6: ; Function: (loop,g3)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word si
  push word L5
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L7: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, si
  mov bp, g1
  jmp [bp]

L8: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L7
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, 85
  mov bp, si
  jmp [bp]

L9: ; Start
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L8
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g4
  mov bp, g3
  jmp [bp]

g1:
  dw L2
g2:
  dw 1
g3:
  dw L6
g4:
  dw 1

bare_start: jmp L9
