L1: ; Arm: 11'7
  mov dx, g2
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L2: ; Function: (put_chars,g1)
  Bare_enter_check(0)
  mov bx, dx
  cmp word [bx], 0
  jz L1
  mov si, [bx+2]
  mov di, [bx+4]
  mov ax, si
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov bp, g1
  mov dx, di
  jmp [bp]

L3: ; Arm: 4'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L4: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  sub ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L5: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov si, ax
  mov bx, si
  cmp word [bx], 1
  jz L3
  mov ax, g4
  mov bx, dx
  call Bare_get_bytes
  mov di, ax
  push word [bp+2]
  push word di
  push word 1
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L4
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g3
  mov dx, [Temps+6]
  jmp [bp]

L6: ; Function: (explode_loop,g3)
  Bare_enter_check(6)
  push word dx
  push word L5
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L7: ; Arm: 4'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L8: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  sub ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L9: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov si, ax
  mov bx, si
  cmp word [bx], 1
  jz L7
  mov ax, g8
  mov bx, dx
  call Bare_get_bytes
  mov di, ax
  push word [bp+2]
  push word di
  push word 1
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L8
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g7
  mov dx, [Temps+6]
  jmp [bp]

L10: ; Function: (explode_loop,g7)
  Bare_enter_check(6)
  push word dx
  push word L9
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L11: ; Arm: 19'9
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L12: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L13: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov bx, dx
  cmp word [bx], 0
  jz L11
  mov si, [bx+2]
  mov di, [bx+4]
  push word [bp+2]
  push word si
  push word 1
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word di
  push word cx
  push word L12
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g12
  mov dx, [Temps+6]
  jmp [bp]

L14: ; Function: (revloop,g12)
  Bare_enter_check(6)
  push word dx
  push word L13
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L15: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L16: ; Arm: 30'27
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  push word dx
  push word cx
  push word L15
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g12
  mov dx, g13
  jmp [bp]

L17: ; Function: (readloop,g10)
  Bare_enter_check(8)
  call Bare_get_char
  mov si, ax
  mov ax, si
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov di, ax
  mov bx, di
  cmp word [bx], 1
  jz L16
  mov ax, si
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  push word dx
  push word si
  push word 1
  mov [Temps+8], sp
  push word 6 ;; scanned
  mov bp, g10
  mov dx, [Temps+8]
  jmp [bp]

L18: ; Continuation
  Bare_enter_check(0)
  mov ax, `\n`
  call Bare_put_char
  mov si, Bare_unit
  mov bp, g6
  mov dx, g15
  jmp [bp]

L19: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L18
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g1
  mov dx, dx
  jmp [bp]

L20: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L19
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g10
  mov dx, g14
  jmp [bp]

L21: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L20
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g1
  mov dx, dx
  jmp [bp]

L22: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L21
  mov cx, sp
  push word 4 ;; scanned
  mov bp, dx
  mov dx, 1
  jmp [bp]

L23: ; Function: (mainloop,g6)
  Bare_enter_check(6)
  push word cx
  push word L22
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g7
  mov dx, g9
  jmp [bp]

L24: ; Arm: 4'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L25: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  sub ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L26: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov si, ax
  mov bx, si
  cmp word [bx], 1
  jz L24
  mov ax, g17
  mov bx, dx
  call Bare_get_bytes
  mov di, ax
  push word [bp+2]
  push word di
  push word 1
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L25
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g16
  mov dx, [Temps+6]
  jmp [bp]

L27: ; Function: (explode_loop,g16)
  Bare_enter_check(6)
  push word dx
  push word L26
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L28: ; Arm: 4'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L29: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  sub ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L30: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov si, ax
  mov bx, si
  cmp word [bx], 1
  jz L28
  mov ax, g21
  mov bx, dx
  call Bare_get_bytes
  mov di, ax
  push word [bp+2]
  push word di
  push word 1
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L29
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g20
  mov dx, [Temps+6]
  jmp [bp]

L31: ; Function: (explode_loop,g20)
  Bare_enter_check(6)
  push word dx
  push word L30
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L32: ; Continuation
  Bare_enter_check(0)
  mov bp, g1
  mov dx, dx
  jmp [bp]

L33: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L32
  mov cx, sp
  push word 4 ;; scanned
  mov bp, dx
  mov dx, 5
  jmp [bp]

L34: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L33
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g20
  mov dx, g22
  jmp [bp]

L35: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L34
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g6
  mov dx, g19
  jmp [bp]

L36: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L35
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g1
  mov dx, dx
  jmp [bp]

L37: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L36
  mov cx, sp
  push word 4 ;; scanned
  mov bp, dx
  mov dx, 34
  jmp [bp]

L38: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L37
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g16
  mov dx, g18
  jmp [bp]

L39: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L38
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g1
  mov dx, dx
  jmp [bp]

L40: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L39
  mov cx, sp
  push word 4 ;; scanned
  mov bp, dx
  mov dx, 4
  jmp [bp]

L41: ; Start
  Bare_enter_check(6)
  push word cx
  push word L40
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g3
  mov dx, g5
  jmp [bp]

g1:
  dw L2
g2:
  dw 0
g3:
  dw L6
g4:
  dw 5
  db `LOAD\n`
g5:
  dw 0
g6:
  dw L23
g7:
  dw L10
g8:
  dw 2
  db `> `
g9:
  dw 0
g10:
  dw L17
g11:
  dw 0
g12:
  dw L14
g13:
  dw 0
g14:
  dw 0
g15:
  dw 0
g16:
  dw L27
g17:
  dw 35
  db `Welcome to small: a proto readline\n`
g18:
  dw 0
g19:
  dw 0
g20:
  dw L31
g21:
  dw 6
  db `NEVER\n`
g22:
  dw 0

bare_start: jmp L41
