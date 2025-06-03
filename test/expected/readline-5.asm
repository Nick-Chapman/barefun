L1: ; Arm: 14'7
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L2: ; Continuation
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  mov si, di
  jmp [bp]

L3: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov bx, si
  cmp word [bx], 1
  jz L1
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [bp+2]
  push word [Temps+2]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+4]
  push word [CurrentCont]
  push word L2
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [Temps+6]
  mov bp, g1
  mov si, di
  jmp [bp]

L4: ; Function: (rev_onto,g1)
  Bare_enter_check(6)
  push word si
  push word L3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L5: ; Arm: 37'7
  mov si, g3
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L6: ; Continuation
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, g2
  mov si, di
  jmp [bp]

L7: ; Arm: 30'19
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov si, [Temps+10]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L8: ; Arm: 31'22
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov si, [Temps+12]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L9: ; Arm: 32'16
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+14], ax
  mov si, [Temps+14]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L10: ; Function: (put_chars,g2)
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 1
  jz L5
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [Temps+2]
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  cmp word ax, 17
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  push word [Temps+4]
  push word [CurrentCont]
  push word L6
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L7
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L8
  mov ax, 53
  cmp word ax, [Temps+6]
  call Bare_make_bool_from_n
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L9
  mov ax, `^`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+14], ax
  mov ax, 131
  mov bx, [Temps+6]
  add ax, bx
  sub ax, 1
  mov [Temps+16], ax
  mov ax, [Temps+16]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+18], ax
  mov ax, [Temps+18]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+20], ax
  mov ax, [Temps+20]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+22], ax
  mov si, [Temps+22]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L11: ; Arm: 21'13
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L12: ; Continuation
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  mov si, di
  jmp [bp]

L13: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L11
  mov ax, g6
  mov bx, si
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+4], ax
  mov ax, si
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+6], ax
  push word [bp+2]
  push word [Temps+4]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word [CurrentCont]
  push word L12
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [Temps+8]
  mov bp, g5
  mov si, di
  jmp [bp]

L14: ; Function: (explode_loop,g5)
  Bare_enter_check(6)
  push word si
  push word L13
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L15: ; Continuation
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  mov si, di
  jmp [bp]

L16: ; Arm: 56'22
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  push word si
  push word [CurrentCont]
  push word L15
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g10
  mov bp, g1
  mov si, di
  jmp [bp]

L17: ; Continuation
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  mov si, di
  jmp [bp]

L18: ; Arm: 57'28
  mov ax, `^`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov ax, `D`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+14], ax
  push word si
  push word `\x04`
  push word 3
  mov [Temps+16], sp
  push word 6 ;; scanned
  push word [Temps+16]
  push word [CurrentCont]
  push word L17
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g11
  mov bp, g1
  mov si, di
  jmp [bp]

L19: ; Arm: 58'19
  mov di, si
  mov bp, g8
  mov si, di
  jmp [bp]

L20: ; Arm: 61'17
  mov di, si
  mov bp, g8
  mov si, di
  jmp [bp]

L21: ; Continuation
  Bare_enter_check(0)
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, ` `
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+4], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov di, [bp+4]
  mov bp, g8
  mov si, di
  jmp [bp]

L22: ; Arm: 63'31
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, ` `
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+4], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov si, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L23: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L21
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L22
  mov si, g14
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L24: ; Arm: 6'9
  mov si, g12
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L25: ; Arm: 59'21
  mov bx, si
  cmp word [bx], 1
  jz L20
  mov ax, [bx+2]
  mov [Temps+14], ax
  mov ax, [bx+4]
  mov [Temps+16], ax
  mov ax, [Temps+14]
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+18], ax
  mov ax, 53
  cmp word ax, [Temps+18]
  call Bare_make_bool_from_n
  mov [Temps+20], ax
  push word [Temps+16]
  push word [CurrentCont]
  push word L23
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+20]
  cmp word [bx], 3
  jz L24
  mov si, g13
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L26: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov di, [Temps+2]
  mov bp, g8
  mov si, di
  jmp [bp]

L27: ; Arm: 30'19
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+18], ax
  mov si, [Temps+18]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L28: ; Arm: 31'22
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+20], ax
  mov si, [Temps+20]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L29: ; Arm: 32'16
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+22], ax
  mov si, [Temps+22]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L30: ; Function: (readloop,g8)
  Bare_enter_check(16)
  call Bare_get_char
  mov [Temps+2], ax
  mov ax, [Temps+2]
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+4], ax
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L16
  mov ax, [Temps+2]
  cmp word ax, `\x04`
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L18
  mov ax, 255
  cmp word ax, [Temps+4]
  call Bare_make_bool_from_n
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L19
  mov ax, [Temps+4]
  cmp word ax, 255
  call Bare_make_bool_from_z
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L25
  mov ax, [Temps+2]
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+14], ax
  mov ax, [Temps+14]
  cmp word ax, 17
  call Bare_make_bool_from_z
  mov [Temps+16], ax
  push word [Temps+2]
  push word si
  push word [CurrentCont]
  push word L26
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+16]
  cmp word [bx], 3
  jz L27
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+18], ax
  mov bx, [Temps+18]
  cmp word [bx], 3
  jz L28
  mov ax, 53
  cmp word ax, [Temps+14]
  call Bare_make_bool_from_n
  mov [Temps+20], ax
  mov bx, [Temps+20]
  cmp word [bx], 3
  jz L29
  mov ax, `^`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+22], ax
  mov ax, 131
  mov bx, [Temps+14]
  add ax, bx
  sub ax, 1
  mov [Temps+24], ax
  mov ax, [Temps+24]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+26], ax
  mov ax, [Temps+26]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+28], ax
  mov ax, [Temps+28]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+30], ax
  mov si, [Temps+30]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L31: ; Arm: 79'29
  mov si, g17
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L32: ; Continuation
  Bare_enter_check(0)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov di, g18
  mov bp, g4
  mov si, di
  jmp [bp]

L33: ; Continuation
  Bare_enter_check(6)
  mov bx, si
  cmp word [bx], 3
  jz L31
  push word [CurrentCont]
  push word L32
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, [bp+4]
  mov bp, g2
  mov si, di
  jmp [bp]

L34: ; Arm: 73'7
  mov si, g16
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L35: ; Continuation
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L33
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, si
  cmp word [bx], 1
  jz L34
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [Temps+2]
  cmp word ax, `\x04`
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov si, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L36: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L35
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g15
  mov bp, g8
  mov si, di
  jmp [bp]

L37: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L36
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g2
  mov si, di
  jmp [bp]

L38: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L37
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, 3
  mov bp, si
  mov si, di
  jmp [bp]

L39: ; Function: (mainloop,g4)
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L38
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g7
  mov bp, g5
  mov si, di
  jmp [bp]

L40: ; Arm: 21'13
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L41: ; Continuation
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  mov si, di
  jmp [bp]

L42: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L40
  mov ax, g20
  mov bx, si
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+4], ax
  mov ax, si
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+6], ax
  push word [bp+2]
  push word [Temps+4]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word [CurrentCont]
  push word L41
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [Temps+8]
  mov bp, g19
  mov si, di
  jmp [bp]

L43: ; Function: (explode_loop,g19)
  Bare_enter_check(6)
  push word si
  push word L42
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L44: ; Continuation
  Bare_enter_check(0)
  mov di, g22
  mov bp, g4
  mov si, di
  jmp [bp]

L45: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L44
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g2
  mov si, di
  jmp [bp]

L46: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L45
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, 89
  mov bp, si
  mov si, di
  jmp [bp]

L47: ; Start
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L46
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g21
  mov bp, g19
  mov si, di
  jmp [bp]

g1:
  dw L4
g2:
  dw L10
g3:
  dw 1
g4:
  dw L39
g5:
  dw L14
g6:
  dw 5
  db `% `
g7:
  dw 1
g8:
  dw L30
g9:
  dw 1
g10:
  dw 1
g11:
  dw 1
g12:
  dw 1
g13:
  dw 3
g14:
  dw 1
g15:
  dw 1
g16:
  dw 1
g17:
  dw 1
g18:
  dw 1
g19:
  dw L43
g20:
  dw 91
  db `Readline: edit with backspace; exit with ^D.\n`
g21:
  dw 1
g22:
  dw 1

bare_start: jmp L47
