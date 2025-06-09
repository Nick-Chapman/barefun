L1: ; Arm: 5'7
  mov ax, 1
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L2: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, 3
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

L3: ; Function: (length,g1)
  xchg si, di
  Bare_enter_check(6)
  mov bx, [si]
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
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g1
  jmp [bp]

L4: ; Arm: 12'9
  mov ax, g2
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L5: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L6: ; Function: (lam,t1)
  xchg si, di
  Bare_enter_check(8)
  mov bx, [si]
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
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, [bp+6]
  jmp [bp]

L7: ; Function: (loop,t1)
  xchg si, di
  Bare_enter_check(10)
  push word bp
  push word [si]
  push word [bp+2]
  push word L6
  mov [Temps+2], sp
  push word 8 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L8: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L9: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L8
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L10: ; Continuation
  xchg si, di
  Bare_enter_check(16)
  push word [si]
  push word L7
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L9
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, 1
  mov [di], ax
  mov bp, [Temps+2]
  jmp [bp]

L11: ; Continuation
  xchg si, di
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L10
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  jmp AllocBare_make_bytes

L12: ; Function: (implode,g3)
  xchg si, di
  Bare_enter_check(8)
  push word [si]
  push word [CurrentCont]
  push word L11
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g1
  jmp [bp]

L13: ; Arm: 20'13
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L14: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L15: ; Function: (lam,t1)
  xchg si, di
  Bare_enter_check(16)
  mov ax, [si]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L13
  mov ax, [bp+2]
  mov bx, [si]
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+4], ax
  mov ax, [si]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+6], ax
  push word [bp+4]
  push word [Temps+4]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word [CurrentCont]
  push word L14
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, [bp+6]
  jmp [bp]

L16: ; Function: (explode_loop,t1)
  xchg si, di
  Bare_enter_check(10)
  push word bp
  push word [si]
  push word [bp+2]
  push word L15
  mov [Temps+2], sp
  push word 8 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L17: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [si]
  jmp [bp]

L18: ; Function: (explode,g5)
  xchg si, di
  Bare_enter_check(14)
  push word [si]
  push word L16
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov bx, [si]
  mov ax, [bx]
  mov [Temps+4], ax
  mov ax, [Temps+4]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+6], ax
  push word [Temps+6]
  push word [CurrentCont]
  push word L17
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g4
  mov [di], ax
  mov bp, [Temps+2]
  jmp [bp]

L19: ; Arm: 27'7
  mov ax, g7
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L20: ; Function: (put_chars,g6)
  xchg si, di
  Bare_enter_check(0)
  mov bx, [si]
  cmp word [bx], 1
  jz L19
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
  mov bp, g6
  jmp [bp]

L21: ; Continuation
  xchg si, di
  Bare_enter_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g6
  jmp [bp]

L22: ; Continuation
  xchg si, di
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L21
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g5
  jmp [bp]

L23: ; Continuation
  xchg si, di
  Bare_enter_check(38)
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
  push word [CurrentCont]
  push word L22
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, g3
  jmp [bp]

L24: ; Continuation
  xchg si, di
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L23
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g6
  jmp [bp]

L25: ; Continuation
  xchg si, di
  Bare_enter_check(6)
  mov ax, [si]
  mov [Temps+2], ax
  push word [CurrentCont]
  push word L24
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g5
  jmp [bp]

L26: ; Continuation
  xchg si, di
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L25
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, 11
  mov [di], ax
  jmp AllocBare_make_bytes

L27: ; Continuation
  xchg si, di
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L26
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g6
  jmp [bp]

L28: ; Start
  xchg si, di
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L27
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g8
  mov [di], ax
  mov bp, g5
  jmp [bp]

g1:
  dw L3
g2:
  dw 1
g3:
  dw L12
g4:
  dw 1
g5:
  dw L18
g6:
  dw L20
g7:
  dw 1
g8:
  dw 9
  db `One\n`
g9:
  dw 1

bare_start: jmp L28
