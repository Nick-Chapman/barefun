L1: ; Function: (lam,t1)
  call Bare_enter_check
  mov bp, [bp+2]
  mov dx, dx
  jmp [bp]

L2: ; Function: (block,g1)
  call Bare_enter_check
  push word dx
  push word L1
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L3: ; Arm: 7'7
  mov dx, 0
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L4: ; Continuation
  call Bare_enter_check
  mov ax, 1
  add ax, dx
  mov si, ax
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L5: ; Function: (length,g2)
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 0
  jz L3
  mov si, [bx+2]
  mov di, [bx+4]
  push word cx
  push word L4
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g2
  mov dx, di
  jmp [bp]

L6: ; Arm: 14'9
  mov dx, g3
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L7: ; Continuation
  call Bare_enter_check
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L8: ; Function: (lam,t1)
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 0
  jz L6
  mov si, [bx+2]
  mov di, [bx+4]
  mov ax, [bp+2]
  mov bx, si
  push word si ;; save
  mov si, [bp+4]
  call Bare_set_bytes
  pop word si ;; restore
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, [bp+4]
  add ax, 1
  mov [Temps+8], ax
  push word di
  push word cx
  push word L7
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+8]
  jmp [bp]

L9: ; Function: (loop,t2)
  call Bare_enter_check
  push word bp
  push word dx
  push word [bp+2]
  push word L8
  mov si, sp
  push word 8 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L10: ; Continuation
  call Bare_enter_check
  mov si, [bp+4]
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L11: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word cx
  push word L10
  mov cx, sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L12: ; Continuation
  call Bare_enter_check
  mov ax, dx
  call Bare_make_bytes
  mov si, ax
  push word si
  push word L9
  mov di, sp
  push word 4 ;; scanned
  push word si
  push word [bp+4]
  push word cx
  push word L11
  mov cx, sp
  push word 8 ;; scanned
  mov bp, di
  mov dx, 0
  jmp [bp]

L13: ; Function: (lam,g4)
  call Bare_enter_check
  push word dx
  push word cx
  push word L12
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g2
  mov dx, dx
  jmp [bp]

L14: ; Arm: 24'13
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L15: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  sub ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L16: ; Function: (lam,t1)
  call Bare_enter_check
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov si, ax
  mov bx, si
  cmp word [bx], 1
  jz L14
  mov ax, [bp+2]
  mov bx, dx
  call Bare_get_bytes
  mov di, ax
  push word [bp+4]
  push word di
  push word 1
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L15
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+6]
  jmp [bp]

L17: ; Function: (explode_loop,t1)
  call Bare_enter_check
  push word bp
  push word dx
  push word [bp+2]
  push word L16
  mov si, sp
  push word 8 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L18: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  sub ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L19: ; Function: (lam,g6)
  call Bare_enter_check
  push word dx
  push word L17
  mov si, sp
  push word 4 ;; scanned
  mov bx, dx
  mov di, [bx]
  push word di
  push word cx
  push word L18
  mov cx, sp
  push word 6 ;; scanned
  mov bp, si
  mov dx, g5
  jmp [bp]

L20: ; Arm: 33'7
  mov dx, g8
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L21: ; Function: (put_chars,g7)
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 0
  jz L20
  mov si, [bx+2]
  mov di, [bx+4]
  mov ax, si
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov bp, g7
  mov dx, di
  jmp [bp]

L22: ; Continuation
  call Bare_enter_check
  mov bp, g7
  mov dx, dx
  jmp [bp]

L23: ; Continuation
  call Bare_enter_check
  push word cx
  push word L22
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L24: ; Continuation
  call Bare_enter_check
  push word g10
  push word `\n`
  push word 1
  mov si, sp
  push word 6 ;; scanned
  push word si
  push word `o`
  push word 1
  mov di, sp
  push word 6 ;; scanned
  push word di
  push word `w`
  push word 1
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word `T`
  push word 1
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [bp+6]
  push word cx
  push word L23
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, [Temps+8]
  jmp [bp]

L25: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L24
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L26: ; Continuation
  call Bare_enter_check
  mov ax, 5
  call Bare_make_bytes
  mov si, ax
  mov di, si
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L25
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, di
  jmp [bp]

L27: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L26
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g7
  mov dx, dx
  jmp [bp]

L28: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+4]
  push word cx
  push word L27
  mov cx, sp
  push word 8 ;; scanned
  mov bp, dx
  mov dx, g9
  jmp [bp]

L29: ; Continuation
  call Bare_enter_check
  push word dx
  push word cx
  push word L28
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g1
  mov dx, g6
  jmp [bp]

L30: ; Start
  call Bare_enter_check
  push word cx
  push word L29
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g1
  mov dx, g4
  jmp [bp]

g1:
  dw L2
g2:
  dw L5
g3:
  dw 0
g4:
  dw L13
g5:
  dw 0
g6:
  dw L19
g7:
  dw L21
g8:
  dw 0
g9:
  dw 4
  db `One\n`
g10:
  dw 0

bare_start: jmp L30
