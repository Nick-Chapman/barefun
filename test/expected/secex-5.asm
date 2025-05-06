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

L3: ; Arm: 52'16
  mov dx, g4
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L4: ; Continuation
  Bare_enter_check(0)
  mov bx, dx
  cmp word [bx], 3
  jz L3
  mov ax, [bp+6]
  mov bx, [bp+4]
  push word si ;; save
  mov si, [bp+8]
  shr si, 1
  call Bare_set_bytes
  pop word si ;; restore
  mov si, Bare_unit
  mov ax, [bp+8]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov di, ax
  mov bp, [bp+10]
  mov dx, di
  jmp [bp]

L5: ; Arm: 7'9
  mov dx, g2
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L6: ; Function: (loop,t2)
  Bare_enter_check(14)
  mov ax, dx
  cmp word ax, 1025
  call Bare_make_bool_from_n
  mov si, ax
  push word bp
  push word dx
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L4
  mov cx, sp
  push word 12 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L5
  mov dx, g3
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L7: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L8: ; Function: (lam,g5)
  Bare_enter_check(100)
  mov ax, 1025
  call Bare_make_bytes
  mov si, ax
  push word si
  push word dx
  push word L6
  mov di, sp
  push word 6 ;; scanned
  push word si
  push word cx
  push word L7
  mov cx, sp
  push word 6 ;; scanned
  mov bp, di
  mov dx, 1
  jmp [bp]

L9: ; Arm: 15'14
  mov dx, g20
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L10: ; Continuation
  Bare_enter_check(0)
  mov bx, dx
  cmp word [bx], 3
  jz L9
  mov ax, g21
  mov bx, [bp+4]
  shr bx, 1
  call Bare_get_bytes
  mov si, ax
  mov ax, si
  call Bare_put_char
  mov di, Bare_unit
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov bp, g17
  mov dx, [Temps+6]
  jmp [bp]

L11: ; Arm: 7'9
  mov dx, g18
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L12: ; Function: (loop,g17)
  Bare_enter_check(8)
  mov ax, dx
  cmp word ax, 37
  call Bare_make_bool_from_n
  mov si, ax
  push word dx
  push word cx
  push word L10
  mov cx, sp
  push word 6 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L11
  mov dx, g19
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L13: ; Arm: 15'14
  mov dx, g26
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L14: ; Continuation
  Bare_enter_check(0)
  mov bx, dx
  cmp word [bx], 3
  jz L13
  mov ax, g27
  mov bx, [bp+4]
  shr bx, 1
  call Bare_get_bytes
  mov si, ax
  mov ax, si
  call Bare_put_char
  mov di, Bare_unit
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov bp, g23
  mov dx, [Temps+6]
  jmp [bp]

L15: ; Arm: 7'9
  mov dx, g24
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L16: ; Function: (loop,g23)
  Bare_enter_check(8)
  mov ax, dx
  cmp word ax, 57
  call Bare_make_bool_from_n
  mov si, ax
  push word dx
  push word cx
  push word L14
  mov cx, sp
  push word 6 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L15
  mov dx, g25
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L17: ; Arm: 40'16
  mov dx, g11
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L18: ; Continuation
  Bare_enter_check(0)
  mov ax, dx
  call Bare_put_char
  mov si, Bare_unit
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov di, ax
  mov bp, [bp+6]
  mov dx, di
  jmp [bp]

L19: ; Arm: 42'32
  mov dx, [bp+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L20: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L18
  mov cx, sp
  push word 8 ;; scanned
  mov bx, dx
  cmp word [bx], 3
  jz L19
  mov dx, `.`
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L21: ; Arm: 35'12
  mov dx, g12
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L22: ; Continuation
  Bare_enter_check(12)
  mov bx, dx
  cmp word [bx], 3
  jz L17
  mov ax, [bp+4]
  mov bx, [bp+6]
  shr bx, 1
  call Bare_get_bytes
  mov si, ax
  mov ax, si
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov di, ax
  mov ax, di
  cmp word ax, 65
  call Bare_make_bool_from_n
  mov [Temps+6], ax
  push word si
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L20
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L21
  mov ax, di
  cmp word ax, 255
  call Bare_make_bool_from_n
  mov [Temps+8], ax
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L23: ; Arm: 7'9
  mov dx, g9
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L24: ; Continuation
  Bare_enter_check(12)
  mov ax, [bp+6]
  cmp word ax, 1025
  call Bare_make_bool_from_n
  mov si, ax
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L22
  mov cx, sp
  push word 10 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L23
  mov dx, g10
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L25: ; Arm: 39'19
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L26: ; Function: (loop,t13)
  Bare_enter_check(12)
  mov ax, dx
  shr ax, 1
  mov bx, 129
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov si, dx
  pop word dx ;; restore
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov di, ax
  push word bp
  push word dx
  push word [bp+2]
  push word cx
  push word L24
  mov cx, sp
  push word 10 ;; scanned
  mov bx, di
  cmp word [bx], 3
  jz L25
  mov dx, g8
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L27: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov dx, g13
  jmp [bp]

L28: ; Arm: 76'19
  call Bare_get_char
  mov [Temps+10], ax
  mov ax, [Temps+10]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov ax, [Temps+10]
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+14], ax
  mov ax, [Temps+14]
  shr ax, 1
  mov bx, 97
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+16], ax
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+18], ax
  mov ax, 1025
  call Bare_make_bytes
  mov [Temps+20], ax
  mov ax, [Temps+16]
  mov bx, [Temps+20]
  call Bare_load_sector
  mov ax, Bare_unit
  mov [Temps+22], ax
  mov ax, [Temps+20]
  mov [Temps+24], ax
  push word [Temps+24]
  push word L26
  mov [Temps+26], sp
  push word 4 ;; scanned
  push word bp
  push word cx
  push word L27
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [Temps+26]
  mov dx, 1
  jmp [bp]

L29: ; Continuation
  Bare_enter_check(0)
  mov ax, `\n`
  call Bare_put_char
  mov si, Bare_unit
  mov ax, [bp+6]
  mov bx, dx
  call Bare_store_sector
  mov di, Bare_unit
  mov bp, [bp+4]
  mov dx, g16
  jmp [bp]

L30: ; Arm: 77'21
  call Bare_get_char
  mov [Temps+12], ax
  mov ax, [Temps+12]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+14], ax
  mov ax, [Temps+12]
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+16], ax
  mov ax, [Temps+16]
  shr ax, 1
  mov bx, 97
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+18], ax
  call Bare_get_char
  mov [Temps+20], ax
  mov ax, [Temps+20]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+22], ax
  push word [Temps+18]
  push word bp
  push word cx
  push word L29
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+2]
  mov dx, [Temps+20]
  jmp [bp]

L31: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov dx, g22
  jmp [bp]

L32: ; Function: (xloop,t1)
  Bare_enter_check(100)
  mov ax, `>`
  call Bare_put_char
  mov si, Bare_unit
  call Bare_get_char
  mov di, ax
  mov ax, di
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, di
  cmp word ax, `r`
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L28
  mov ax, di
  cmp word ax, `w`
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L30
  push word bp
  push word cx
  push word L31
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g17
  mov dx, 1
  jmp [bp]

L33: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov dx, g28
  jmp [bp]

L34: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word L32
  mov si, sp
  push word 4 ;; scanned
  push word si
  push word cx
  push word L33
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g23
  mov dx, 1
  jmp [bp]

L35: ; Start
  Bare_enter_check(6)
  push word cx
  push word L34
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g1
  mov dx, g5
  jmp [bp]

g1:
  dw L2
g2:
  dw 1
g3:
  dw 3
g4:
  dw 1
g5:
  dw L8
g6:
  dw 1
g7:
  dw 1
g8:
  dw 1
g9:
  dw 1
g10:
  dw 3
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
  dw 1
g17:
  dw L12
g18:
  dw 1
g19:
  dw 3
g20:
  dw 1
g21:
  dw 37
  db `: unknown command\n`
g22:
  dw 1
g23:
  dw L16
g24:
  dw 1
g25:
  dw 3
g26:
  dw 1
g27:
  dw 57
  db `type r<num> or w<num><char>\n`
g28:
  dw 1

bare_start: jmp L35
