L1: ; Arm: 5'7
  mov si, 1
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L2: ; Continuation
  Bare_enter_check(0)
  mov ax, 3
  mov bx, si
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L3: ; Function: (length,g1)
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 1
  jz L1
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L2
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g1
  mov si, [Temps+4]
  jmp [bp]

L4: ; Arm: 12'9
  mov si, g2
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L5: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L6: ; Function: (lam,t1)
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 1
  jz L4
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [bp+2]
  mov bx, [bp+4]
  mov dx, [Temps+2]
  sar bx, 1
  call Bare_set_bytes
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, [bp+4]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+8], ax
  push word [Temps+4]
  push word [CurrentCont]
  push word L5
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+8]
  jmp [bp]

L7: ; Function: (loop,t2)
  Bare_enter_check(10)
  push word bp
  push word si
  push word [bp+2]
  push word L6
  mov [Temps+2], sp
  push word 8 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L8: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L9: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L8
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L10: ; Continuation
  Bare_enter_check(600)
  mov ax, si
  call Bare_make_bytes
  mov [Temps+2], ax
  push word [Temps+2]
  push word L7
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word [bp+4]
  push word [CurrentCont]
  push word L9
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [Temps+4]
  mov si, 1
  jmp [bp]

L11: ; Function: (lam,g3)
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L10
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g1
  mov si, si
  jmp [bp]

L12: ; Arm: 20'13
  mov si, [bp+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L13: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L14: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L12
  mov ax, [bp+2]
  mov bx, si
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+4], ax
  push word [bp+4]
  push word [Temps+4]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word si
  push word [CurrentCont]
  push word L13
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+6]
  jmp [bp]

L15: ; Function: (explode_loop,t1)
  Bare_enter_check(10)
  push word bp
  push word si
  push word [bp+2]
  push word L14
  mov [Temps+2], sp
  push word 8 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L16: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L17: ; Function: (lam,g5)
  Bare_enter_check(14)
  push word si
  push word L15
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov bx, si
  mov ax, [bx]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [CurrentCont]
  push word L16
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [Temps+2]
  mov si, g4
  jmp [bp]

L18: ; Arm: 27'7
  mov si, g7
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L19: ; Function: (put_chars,g6)
  Bare_enter_check(0)
  mov bx, si
  cmp word [bx], 1
  jz L18
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov bp, g6
  mov si, [Temps+4]
  jmp [bp]

L20: ; Continuation
  Bare_enter_check(0)
  mov bp, g6
  mov si, si
  jmp [bp]

L21: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L20
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov si, si
  jmp [bp]

L22: ; Continuation
  Bare_enter_check(40)
  push word g9
  push word `\n`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word `o`
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [Temps+4]
  push word `w`
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word `T`
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [bp+6]
  push word [CurrentCont]
  push word L21
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov si, [Temps+8]
  jmp [bp]

L23: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L22
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g6
  mov si, si
  jmp [bp]

L24: ; Continuation
  Bare_enter_check(600)
  mov ax, 11
  call Bare_make_bytes
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [Temps+4], ax
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L23
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+4]
  jmp [bp]

L25: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L24
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, g6
  mov si, si
  jmp [bp]

L26: ; Start
  Bare_enter_check(10)
  mov ax, g3
  mov [Temps+2], ax
  mov ax, g5
  mov [Temps+4], ax
  push word [Temps+4]
  push word [Temps+2]
  push word [CurrentCont]
  push word L25
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [Temps+4]
  mov si, g8
  jmp [bp]

g1:
  dw L3
g2:
  dw 1
g3:
  dw L11
g4:
  dw 1
g5:
  dw L17
g6:
  dw L19
g7:
  dw 1
g8:
  dw 9
  db `One\n`
g9:
  dw 1

bare_start: jmp L26
