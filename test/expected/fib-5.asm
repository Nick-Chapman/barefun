L1: ; Arm: 20'7
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

L3: ; Arm: 30'11
  mov dx, dx
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L4: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  add ax, dx
  mov si, ax
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L5: ; Continuation
  Bare_enter_check(8)
  mov ax, [bp+4]
  sub ax, 2
  mov si, ax
  push word dx
  push word cx
  push word L4
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g3
  mov dx, si
  jmp [bp]

L6: ; Function: (fib,g3)
  Bare_enter_check(8)
  mov ax, dx
  cmp word ax, 2
  call Bare_make_bool_from_n
  mov si, ax
  mov bx, si
  cmp word [bx], 1
  jz L3
  mov ax, dx
  sub ax, 1
  mov di, ax
  push word dx
  push word cx
  push word L5
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g3
  mov dx, di
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
  mov ax, g5
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
  mov bp, g4
  mov dx, [Temps+6]
  jmp [bp]

L10: ; Function: (explode_loop,g4)
  Bare_enter_check(6)
  push word dx
  push word L9
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L11: ; Arm: 13'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L12: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, 10
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L13: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 1
  jz L11
  mov ax, dx
  mov bx, 10
  push word dx ;; save
  mov dx, 0
  div bx
  mov di, dx
  pop word dx ;; restore
  mov ax, 48
  add ax, di
  mov [Temps+6], ax
  mov ax, [Temps+6]
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 1
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L12
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g7
  mov dx, [Temps+10]
  jmp [bp]

L14: ; Function: (loop,g7)
  Bare_enter_check(6)
  push word dx
  push word L13
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L15: ; Arm: 4'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L16: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  sub ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L17: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov si, ax
  mov bx, si
  cmp word [bx], 1
  jz L15
  mov ax, g10
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
  push word L16
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g9
  mov dx, [Temps+6]
  jmp [bp]

L18: ; Function: (explode_loop,g9)
  Bare_enter_check(6)
  push word dx
  push word L17
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L19: ; Arm: 13'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L20: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, 10
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L21: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 1
  jz L19
  mov ax, dx
  mov bx, 10
  push word dx ;; save
  mov dx, 0
  div bx
  mov di, dx
  pop word dx ;; restore
  mov ax, 48
  add ax, di
  mov [Temps+6], ax
  mov ax, [Temps+6]
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 1
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L20
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g12
  mov dx, [Temps+10]
  jmp [bp]

L22: ; Function: (loop,g12)
  Bare_enter_check(6)
  push word dx
  push word L21
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L23: ; Continuation
  Bare_enter_check(0)
  mov ax, `\n`
  call Bare_put_char
  mov si, Bare_unit
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L24: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L23
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g1
  mov dx, dx
  jmp [bp]

L25: ; Arm: 16'11
  push word g13
  push word `0`
  push word 1
  mov di, sp
  push word 6 ;; scanned
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L26: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L27: ; Continuation
  Bare_enter_check(14)
  mov ax, [bp+4]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov si, ax
  push word cx
  push word L24
  mov cx, sp
  push word 4 ;; scanned
  mov bx, si
  cmp word [bx], 1
  jz L25
  push word [bp+4]
  push word cx
  push word L26
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g12
  mov dx, g14
  jmp [bp]

L28: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L27
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g1
  mov dx, dx
  jmp [bp]

L29: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L28
  mov cx, sp
  push word 6 ;; scanned
  mov bp, dx
  mov dx, 4
  jmp [bp]

L30: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L29
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g9
  mov dx, g11
  jmp [bp]

L31: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L30
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g1
  mov dx, dx
  jmp [bp]

L32: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L31
  mov cx, sp
  push word 6 ;; scanned
  mov bp, dx
  mov dx, 10
  jmp [bp]

L33: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L32
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g7
  mov dx, g8
  jmp [bp]

L34: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L33
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g1
  mov dx, dx
  jmp [bp]

L35: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L34
  mov cx, sp
  push word 6 ;; scanned
  mov bp, dx
  mov dx, 3
  jmp [bp]

L36: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word cx
  push word L35
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g4
  mov dx, g6
  jmp [bp]

L37: ; Start
  Bare_enter_check(6)
  push word cx
  push word L36
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g3
  mov dx, 10
  jmp [bp]

g1:
  dw L2
g2:
  dw 0
g3:
  dw L6
g4:
  dw L10
g5:
  dw 4
  db `fib `
g6:
  dw 0
g7:
  dw L14
g8:
  dw 0
g9:
  dw L18
g10:
  dw 5
  db ` --> `
g11:
  dw 0
g12:
  dw L22
g13:
  dw 0
g14:
  dw 0

bare_start: jmp L37
