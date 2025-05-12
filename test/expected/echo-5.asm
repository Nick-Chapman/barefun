L1: ; Arm: 6'25
  call Bare_get_keyboard_last_scancode
  mov [Temps+6], ax
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L2: ; Function: (get_scancode,g1)
  Bare_enter_check(0)
  hlt
  mov si, Bare_unit
  call Bare_is_keyboard_ready
  call Bare_make_bool_from_nz
  mov di, ax
  mov bx, di
  cmp word [bx], 3
  jz L1
  mov bp, g1
  mov dx, g5
  jmp [bp]

L3: ; Continuation
  Bare_enter_check(0)
  mov bp, dx
  mov dx, g11
  jmp [bp]

L4: ; Arm: 33'23
  push word cx
  push word L3
  mov cx, sp
  push word 4 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+10]
  jmp [bp]

L5: ; Continuation
  Bare_enter_check(0)
  mov bp, dx
  mov dx, g12
  jmp [bp]

L6: ; Arm: 34'26
  push word cx
  push word L5
  mov cx, sp
  push word 4 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+10]
  jmp [bp]

L7: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L8: ; Arm: 35'25
  push word [bp+12]
  push word cx
  push word L7
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+10]
  mov dx, g13
  jmp [bp]

L9: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L10: ; Arm: 36'28
  push word [bp+12]
  push word cx
  push word L9
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+10]
  mov dx, g14
  jmp [bp]

L11: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L12: ; Arm: 37'32
  push word [bp+12]
  push word cx
  push word L11
  mov cx, sp
  push word 6 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+10]
  jmp [bp]

L13: ; Arm: 38'24
  mov bx, [bp+4]
  mov ax, [bp+8]
  mov [bx], ax
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov bx, [bp+6]
  mov ax, [bp+12]
  mov [bx], ax
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov dx, `\x7f`
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L14: ; Arm: 39'26
  mov bx, [bp+4]
  mov ax, [bp+8]
  mov [bx], ax
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov bx, [bp+6]
  mov ax, [bp+12]
  mov [bx], ax
  mov ax, Bare_unit
  mov [Temps+14], ax
  mov dx, ` `
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L15: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L16: ; Arm: 42'27
  push word [bp+12]
  push word cx
  push word L15
  mov cx, sp
  push word 6 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+10]
  jmp [bp]

L17: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L18: ; Arm: 43'32
  push word [bp+12]
  push word cx
  push word L17
  mov cx, sp
  push word 6 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+10]
  jmp [bp]

L19: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L20: ; Arm: 46'22
  push word [bp+12]
  push word cx
  push word L19
  mov cx, sp
  push word 6 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+10]
  jmp [bp]

L21: ; Arm: 49'24
  mov ax, si
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  shr ax, 1
  mov bx, 129
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+8], ax
  mov ax, [Temps+8]
  shr ax, 1
  call Bare_num_to_char
  mov [Temps+10], ax
  mov bx, [bp+4]
  mov ax, [bp+8]
  mov [bx], ax
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov bx, [bp+6]
  mov ax, [bp+12]
  mov [bx], ax
  mov ax, Bare_unit
  mov [Temps+14], ax
  mov dx, [Temps+10]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L22: ; Continuation
  Bare_enter_check(8)
  mov bx, dx
  cmp word [bx], 3
  jz L18
  mov ax, [bp+16]
  mov bx, [bp+14]
  shr bx, 1
  call Bare_get_bytes
  mov si, ax
  mov ax, si
  cmp word ax, ` `
  call Bare_make_bool_from_z
  mov di, ax
  mov bx, di
  cmp word [bx], 3
  jz L20
  mov bx, [bp+12]
  cmp word [bx], 3
  jz L21
  mov bx, [bp+4]
  mov ax, [bp+8]
  mov [bx], ax
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov bx, [bp+6]
  mov ax, [bp+12]
  mov [bx], ax
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L23: ; Arm: 11'9
  mov dx, g18
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L24: ; Continuation
  Bare_enter_check(20)
  mov bx, dx
  mov si, [bx]
  mov ax, [bp+14]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov di, ax
  mov bx, di
  cmp word [bx], 3
  jz L16
  mov ax, [bp+14]
  cmp word ax, si
  call Bare_make_bool_from_n
  mov [Temps+6], ax
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L22
  mov cx, sp
  push word 18 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L23
  mov dx, g19
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L25: ; Arm: 40'44
  mov dx, g15
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L26: ; Arm: 40'72
  mov dx, g16
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L27: ; Continuation
  Bare_enter_check(18)
  mov ax, 257
  cmp word ax, [bp+14]
  call Bare_make_bool_from_n
  mov si, ax
  mov ax, [bp+14]
  cmp word ax, 59
  call Bare_make_bool_from_z
  mov di, ax
  mov ax, [bp+14]
  cmp word ax, 315
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov bx, di
  cmp word [bx], 3
  jz L4
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L6
  mov bx, [bp+16]
  cmp word [bx], 3
  jz L8
  mov bx, dx
  cmp word [bx], 3
  jz L10
  mov bx, si
  cmp word [bx], 3
  jz L12
  mov ax, [bp+14]
  cmp word ax, 29
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L13
  mov ax, [bp+14]
  cmp word ax, 115
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L14
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L24
  mov cx, sp
  push word 16 ;; scanned
  mov bx, [bp+12]
  cmp word [bx], 3
  jz L25
  mov bx, [bp+8]
  cmp word [bx], 3
  jz L26
  mov dx, g17
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L28: ; Arm: 27'38
  mov dx, g10
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L29: ; Continuation
  Bare_enter_check(20)
  mov ax, [bp+14]
  cmp word ax, 341
  call Bare_make_bool_from_z
  mov si, ax
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L27
  mov cx, sp
  push word 18 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L28
  mov ax, [bp+14]
  cmp word ax, 365
  call Bare_make_bool_from_z
  mov di, ax
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L30: ; Arm: 26'36
  mov dx, g9
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L31: ; Continuation
  Bare_enter_check(18)
  mov ax, dx
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov si, ax
  mov ax, si
  cmp word ax, 85
  call Bare_make_bool_from_z
  mov di, ax
  push word si
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L29
  mov cx, sp
  push word 16 ;; scanned
  mov bx, di
  cmp word [bx], 3
  jz L30
  mov ax, si
  cmp word ax, 109
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L32: ; Function: (lam,t1)
  Bare_enter_check(16)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L31
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g1
  mov dx, g8
  jmp [bp]

L33: ; Function: (loop,t3)
  Bare_enter_check(12)
  push word bp
  push word dx
  push word [bp+4]
  push word [bp+2]
  push word L32
  mov si, sp
  push word 10 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L34: ; Continuation
  Bare_enter_check(0)
  mov ax, dx
  call Bare_put_char
  mov si, Bare_unit
  mov bp, [bp+4]
  mov dx, g20
  jmp [bp]

L35: ; Continuation
  Bare_enter_check(8)
  mov bx, [bp+4]
  mov si, [bx]
  push word [bp+6]
  push word cx
  push word L34
  mov cx, sp
  push word 6 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L36: ; Function: (main,t4)
  Bare_enter_check(10)
  mov bx, [bp+2]
  mov si, [bx]
  push word bp
  push word [bp+4]
  push word cx
  push word L35
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, si
  jmp [bp]

L37: ; Start
  Bare_enter_check(26)
  push word g6
  mov si, sp
  push word 2 ;; scanned
  push word g7
  mov di, sp
  push word 2 ;; scanned
  push word di
  push word si
  push word L33
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word di
  push word si
  push word L36
  mov [Temps+8], sp
  push word 8 ;; scanned
  mov bp, [Temps+8]
  mov dx, g21
  jmp [bp]

g1:
  dw L2
g2:
  dw 1
g3:
  dw 1
g4:
  dw 1
g5:
  dw 1
g6:
  dw 1
g7:
  dw 1
g8:
  dw 1
g9:
  dw 3
g10:
  dw 3
g11:
  dw 3
g12:
  dw 1
g13:
  dw 3
g14:
  dw 1
g15:
  dw 103
  db `   @            QWERTYUIOP    ASDFGHJKL     ZXCVBNM`
g16:
  dw 109
  db `  !@#$%^&*()_+ \x09QWERTYUIOP{}\n ASDFGHJKL:"~ |ZXCVBNM<>?`
g17:
  dw 109
  db `  1234567890-= \x09qwertyuiop[]\n asdfghjkl;'\` \\zxcvbnm,./`
g18:
  dw 1
g19:
  dw 3
g20:
  dw 1
g21:
  dw 1

bare_start: jmp L37
