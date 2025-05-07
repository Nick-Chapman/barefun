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

L3: ; Arm: 10'13
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

L9: ; Arm: 17'7
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

L11: ; Arm: 44'22
  mov dx, g10
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L12: ; Function: (wait,t3)
  Bare_enter_check(0)
  hlt
  mov si, Bare_unit
  call Bare_get_ticks
  shl ax, 1
  add ax, 1
  mov di, ax
  mov ax, di
  cmp word ax, [bp+2]
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L11
  mov bp, bp
  mov dx, g11
  jmp [bp]

L13: ; Arm: 51'25
  call Bare_get_keyboard_last_scancode
  mov di, ax
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L14: ; Continuation
  Bare_enter_check(0)
  call Bare_is_keyboard_ready
  call Bare_make_bool_from_nz
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L13
  mov bp, g6
  mov dx, g15
  jmp [bp]

L15: ; Function: (get_scan,g6)
  Bare_enter_check(12)
  call Bare_get_ticks
  shl ax, 1
  add ax, 1
  mov si, ax
  mov ax, 21
  shr ax, 1
  mov bx, si
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov di, ax
  push word di
  push word L12
  mov [Temps+6], sp
  push word 4 ;; scanned
  push word cx
  push word L14
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [Temps+6]
  mov dx, g12
  jmp [bp]

L16: ; Continuation
  Bare_enter_check(0)
  mov ax, ` `
  call Bare_put_char
  mov si, Bare_unit
  mov bp, [bp+4]
  mov dx, g30
  jmp [bp]

L17: ; Continuation
  Bare_enter_check(0)
  mov ax, `\n`
  call Bare_put_char
  mov si, Bare_unit
  call Bare_crash
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L18: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L17
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g4
  mov dx, dx
  jmp [bp]

L19: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L18
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, g25
  jmp [bp]

L20: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L19
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g4
  mov dx, dx
  jmp [bp]

L21: ; Arm: 25'11
  push word [bp+4]
  push word cx
  push word L20
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, g24
  jmp [bp]

L22: ; Continuation
  Bare_enter_check(0)
  mov ax, `\n`
  call Bare_put_char
  mov si, Bare_unit
  call Bare_crash
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
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
  mov bp, [bp+4]
  mov dx, g28
  jmp [bp]

L25: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L24
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g4
  mov dx, dx
  jmp [bp]

L26: ; Arm: 26'14
  push word [bp+4]
  push word cx
  push word L25
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, g27
  jmp [bp]

L27: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, dx
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  mov ax, si
  shr ax, 1
  call Bare_num_to_char
  mov di, ax
  mov ax, di
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L28: ; Arm: 27'26
  mov dx, 175
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L29: ; Continuation
  Bare_enter_check(16)
  mov ax, [bp+8]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov si, ax
  push word [bp+6]
  push word cx
  push word L16
  mov cx, sp
  push word 6 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L21
  mov ax, 31
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov di, ax
  mov bx, di
  cmp word [bx], 3
  jz L26
  mov ax, 19
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov [Temps+6], ax
  push word [bp+8]
  push word cx
  push word L27
  mov cx, sp
  push word 6 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L28
  mov dx, 97
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L30: ; Continuation
  Bare_enter_check(0)
  mov ax, `\n`
  call Bare_put_char
  mov si, Bare_unit
  call Bare_crash
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L31: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L30
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g4
  mov dx, dx
  jmp [bp]

L32: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L31
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, g19
  jmp [bp]

L33: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L32
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g4
  mov dx, dx
  jmp [bp]

L34: ; Arm: 25'11
  push word [bp+4]
  push word cx
  push word L33
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, g18
  jmp [bp]

L35: ; Continuation
  Bare_enter_check(0)
  mov ax, `\n`
  call Bare_put_char
  mov si, Bare_unit
  call Bare_crash
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L36: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L35
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g4
  mov dx, dx
  jmp [bp]

L37: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L36
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, g22
  jmp [bp]

L38: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L37
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g4
  mov dx, dx
  jmp [bp]

L39: ; Arm: 26'14
  push word [bp+4]
  push word cx
  push word L38
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, g21
  jmp [bp]

L40: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, dx
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  mov ax, si
  shr ax, 1
  call Bare_num_to_char
  mov di, ax
  mov ax, di
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L41: ; Arm: 27'26
  mov dx, 175
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L42: ; Continuation
  Bare_enter_check(20)
  mov ax, dx
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov si, ax
  mov ax, si
  shr ax, 1
  mov bx, 33
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov di, dx
  pop word dx ;; restore
  mov ax, si
  shr ax, 1
  mov bx, 33
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+8], ax
  push word di
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L29
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L34
  mov ax, 31
  cmp word ax, [Temps+6]
  call Bare_make_bool_from_n
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L39
  mov ax, 19
  cmp word ax, [Temps+6]
  call Bare_make_bool_from_n
  mov [Temps+12], ax
  push word [Temps+6]
  push word cx
  push word L40
  mov cx, sp
  push word 6 ;; scanned
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L41
  mov dx, 97
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L43: ; Function: (loop,t1)
  Bare_enter_check(10)
  push word bp
  push word [bp+2]
  push word cx
  push word L42
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g6
  mov dx, g17
  jmp [bp]

L44: ; Continuation
  Bare_enter_check(6)
  push word [bp+4]
  push word L43
  mov si, sp
  push word 4 ;; scanned
  mov bp, si
  mov dx, g31
  jmp [bp]

L45: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L44
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g4
  mov dx, dx
  jmp [bp]

L46: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word cx
  push word L45
  mov cx, sp
  push word 6 ;; scanned
  mov bp, dx
  mov dx, g16
  jmp [bp]

L47: ; Start
  Bare_enter_check(6)
  push word cx
  push word L46
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
  dw L15
g7:
  dw 1
g8:
  dw 1
g9:
  dw 1
g10:
  dw 1
g11:
  dw 1
g12:
  dw 1
g13:
  dw 1
g14:
  dw 1
g15:
  dw 1
g16:
  dw 25
  db `[Scan test]\n`
g17:
  dw 1
g18:
  dw 15
  db `error: `
g19:
  dw 33
  db `put_hex_nibble<0`
g20:
  dw 1
g21:
  dw 15
  db `error: `
g22:
  dw 35
  db `put_hex_nibble>15`
g23:
  dw 1
g24:
  dw 15
  db `error: `
g25:
  dw 33
  db `put_hex_nibble<0`
g26:
  dw 1
g27:
  dw 15
  db `error: `
g28:
  dw 35
  db `put_hex_nibble>15`
g29:
  dw 1
g30:
  dw 1
g31:
  dw 1

bare_start: jmp L47
