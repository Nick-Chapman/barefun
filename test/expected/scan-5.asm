L1: ; Function: (lam,t1)
  Bare_enter_check(0)
  mov bp, [bp+2]
  mov dx, dx
  jmp [bp]

L2: ; Function: (block,g1)
  Bare_enter_check(6)
  push word dx
  push word L1
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L3: ; Arm: 15'13
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L4: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L5: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L3
  mov ax, [bp+2]
  mov bx, dx
  shr bx, 1
  call Bare_get_bytes
  mov di, ax
  push word [bp+4]
  push word di
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L4
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+6]
  jmp [bp]

L6: ; Function: (explode_loop,t1)
  Bare_enter_check(10)
  push word bp
  push word dx
  push word [bp+2]
  push word L5
  mov si, sp
  push word 8 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L7: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L8: ; Function: (lam,g3)
  Bare_enter_check(14)
  push word dx
  push word L6
  mov si, sp
  push word 4 ;; scanned
  mov bx, dx
  mov di, [bx]
  push word di
  push word cx
  push word L7
  mov cx, sp
  push word 6 ;; scanned
  mov bp, si
  mov dx, g2
  jmp [bp]

L9: ; Arm: 22'7
  mov dx, g5
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L10: ; Function: (put_chars,g4)
  Bare_enter_check(0)
  mov bx, dx
  cmp word [bx], 1
  jz L9
  mov si, [bx+2]
  mov di, [bx+4]
  mov ax, si
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov bp, g4
  mov dx, di
  jmp [bp]

L11: ; Arm: 41'25
  call Bare_get_keyboard_last_scancode
  mov [Temps+6], ax
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L12: ; Function: (get_scan,g6)
  Bare_enter_check(0)
  hlt
  mov si, Bare_unit
  call Bare_is_keyboard_ready
  call Bare_make_bool_from_nz
  mov di, ax
  mov bx, di
  cmp word [bx], 3
  jz L11
  mov bp, g6
  mov dx, g10
  jmp [bp]

L13: ; Continuation
  Bare_enter_check(0)
  mov bp, g12
  mov dx, g18
  jmp [bp]

L14: ; Arm: 58'19
  mov dx, g17
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L15: ; Continuation
  Bare_enter_check(6)
  mov ax, dx
  cmp word ax, `?`
  call Bare_make_bool_from_z
  mov si, ax
  push word cx
  push word L13
  mov cx, sp
  push word 4 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L14
  mov ax, dx
  call Bare_put_char
  mov di, Bare_unit
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L16: ; Arm: 52'11
  mov dx, `?`
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L17: ; Arm: 53'16
  mov dx, `?`
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L18: ; Continuation
  Bare_enter_check(0)
  mov bx, dx
  cmp word [bx], 3
  jz L17
  mov ax, g16
  mov bx, [bp+4]
  shr bx, 1
  call Bare_get_bytes
  mov si, ax
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L19: ; Arm: 6'9
  mov dx, g14
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L20: ; Continuation
  Bare_enter_check(14)
  mov ax, dx
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov si, ax
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov di, ax
  push word cx
  push word L15
  mov cx, sp
  push word 4 ;; scanned
  mov bx, di
  cmp word [bx], 3
  jz L16
  mov ax, si
  cmp word ax, 117
  call Bare_make_bool_from_n
  mov [Temps+6], ax
  push word si
  push word cx
  push word L18
  mov cx, sp
  push word 6 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L19
  mov dx, g15
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L21: ; Function: (loop,g12)
  Bare_enter_check(6)
  push word cx
  push word L20
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g6
  mov dx, g13
  jmp [bp]

L22: ; Continuation
  Bare_enter_check(0)
  mov bp, g12
  mov dx, g19
  jmp [bp]

L23: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L22
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g4
  mov dx, dx
  jmp [bp]

L24: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L23
  mov cx, sp
  push word 4 ;; scanned
  mov bp, dx
  mov dx, g11
  jmp [bp]

L25: ; Start
  Bare_enter_check(6)
  push word cx
  push word L24
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g1
  mov dx, g3
  jmp [bp]

g1:
  dw L2
g2:
  dw 1
g3:
  dw L8
g4:
  dw L10
g5:
  dw 1
g6:
  dw L12
g7:
  dw 1
g8:
  dw 1
g9:
  dw 1
g10:
  dw 1
g11:
  dw 25
  db `[Scan test]\n`
g12:
  dw L21
g13:
  dw 1
g14:
  dw 1
g15:
  dw 3
g16:
  dw 117
  db `??1234567890-=\x08\x09qwertyuiop[]\n?asdfghjkl;'\`??zxcvbnm,./??? `
g17:
  dw 1
g18:
  dw 1
g19:
  dw 1

bare_start: jmp L25
