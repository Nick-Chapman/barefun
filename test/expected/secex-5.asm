L1: ; Function: (lam,t1)
  Bare_enter_check(0)
  mov bp, [bp+2]
  mov si, si
  jmp [bp]

L2: ; Function: (block,g1)
  Bare_enter_check(6)
  push word si
  push word L1
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L3: ; Arm: 51'16
  mov si, g4
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L4: ; Continuation
  Bare_enter_check(0)
  mov bx, si
  cmp word [bx], 3
  jz L3
  mov ax, [bp+6]
  mov bx, [bp+8]
  mov dx, [bp+4]
  sar bx, 1
  call Bare_set_bytes
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, [bp+8]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+4], ax
  mov bp, [bp+10]
  mov si, [Temps+4]
  jmp [bp]

L5: ; Arm: 8'9
  mov si, g2
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L6: ; Function: (loop,t2)
  Bare_enter_check(14)
  mov ax, si
  cmp word ax, 1025
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word si
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L4
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L5
  mov si, g3
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L7: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L8: ; Function: (lam,g5)
  Bare_enter_check(600)
  mov ax, 1025
  call Bare_make_bytes
  mov [Temps+2], ax
  push word [Temps+2]
  push word si
  push word L6
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word [CurrentCont]
  push word L7
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [Temps+4]
  mov si, 1
  jmp [bp]

L9: ; Arm: 16'14
  mov si, g20
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L10: ; Continuation
  Bare_enter_check(0)
  mov bx, si
  cmp word [bx], 3
  jz L9
  mov ax, g21
  mov bx, [bp+4]
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+2], ax
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+4], ax
  mov ax, [bp+4]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+6], ax
  mov bp, g17
  mov si, [Temps+6]
  jmp [bp]

L11: ; Arm: 8'9
  mov si, g18
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L12: ; Function: (loop,g17)
  Bare_enter_check(8)
  mov ax, si
  cmp word ax, 37
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word si
  push word [CurrentCont]
  push word L10
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L11
  mov si, g19
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L13: ; Arm: 16'14
  mov si, g26
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L14: ; Continuation
  Bare_enter_check(0)
  mov bx, si
  cmp word [bx], 3
  jz L13
  mov ax, g27
  mov bx, [bp+4]
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+2], ax
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+4], ax
  mov ax, [bp+4]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+6], ax
  mov bp, g23
  mov si, [Temps+6]
  jmp [bp]

L15: ; Arm: 8'9
  mov si, g24
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L16: ; Function: (loop,g23)
  Bare_enter_check(8)
  mov ax, si
  cmp word ax, 57
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word si
  push word [CurrentCont]
  push word L14
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L15
  mov si, g25
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L17: ; Arm: 41'16
  mov si, g11
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L18: ; Continuation
  Bare_enter_check(0)
  mov ax, si
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, [bp+4]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+4], ax
  mov bp, [bp+6]
  mov si, [Temps+4]
  jmp [bp]

L19: ; Arm: 43'32
  mov si, [bp+8]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L20: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L18
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L19
  mov si, `.`
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L21: ; Arm: 36'12
  mov si, g12
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L22: ; Continuation
  Bare_enter_check(12)
  mov bx, si
  cmp word [bx], 3
  jz L17
  mov ax, [bp+4]
  mov bx, [bp+6]
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+2], ax
  mov ax, [Temps+2]
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+4], ax
  mov ax, [Temps+4]
  cmp word ax, 65
  call Bare_make_bool_from_n
  mov [Temps+6], ax
  push word [Temps+2]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L20
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L21
  mov ax, [Temps+4]
  cmp word ax, 255
  call Bare_make_bool_from_n
  mov [Temps+8], ax
  mov si, [Temps+8]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L23: ; Arm: 8'9
  mov si, g9
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L24: ; Continuation
  Bare_enter_check(12)
  mov ax, [bp+6]
  cmp word ax, 1025
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L22
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L23
  mov si, g10
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L25: ; Arm: 40'19
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov si, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L26: ; Function: (loop,t13)
  Bare_enter_check(12)
  mov ax, si
  sar ax, 1
  mov bx, 129
  sar bx, 1
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+2], dx
  mov ax, [Temps+2]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  push word bp
  push word si
  push word [bp+2]
  push word [CurrentCont]
  push word L24
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L25
  mov si, g8
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L27: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, g13
  jmp [bp]

L28: ; Arm: 78'19
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
  mov bx, 97
  sub ax, bx
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
  sar ax, 1
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
  push word [CurrentCont]
  push word L27
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [Temps+26]
  mov si, 1
  jmp [bp]

L29: ; Continuation
  Bare_enter_check(0)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, [bp+6]
  sar ax, 1
  mov bx, si
  call Bare_store_sector
  mov ax, Bare_unit
  mov [Temps+4], ax
  mov bp, [bp+4]
  mov si, g16
  jmp [bp]

L30: ; Arm: 79'21
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
  mov bx, 97
  sub ax, bx
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
  push word [CurrentCont]
  push word L29
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bp, [bp+2]
  mov si, [Temps+20]
  jmp [bp]

L31: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, g22
  jmp [bp]

L32: ; Function: (xloop,t1)
  Bare_enter_check(600)
  mov ax, `>`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  call Bare_get_char
  mov [Temps+4], ax
  mov ax, [Temps+4]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, [Temps+4]
  cmp word ax, `r`
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L28
  mov ax, [Temps+4]
  cmp word ax, `w`
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L30
  push word bp
  push word [CurrentCont]
  push word L31
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g17
  mov si, 1
  jmp [bp]

L33: ; Arm: 41'16
  mov si, g31
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L34: ; Continuation
  Bare_enter_check(0)
  mov ax, si
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, [bp+4]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+4], ax
  mov bp, [bp+6]
  mov si, [Temps+4]
  jmp [bp]

L35: ; Arm: 43'32
  mov si, [bp+8]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L36: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L34
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L35
  mov si, `.`
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L37: ; Arm: 36'12
  mov si, g32
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L38: ; Continuation
  Bare_enter_check(12)
  mov bx, si
  cmp word [bx], 3
  jz L33
  mov ax, [bp+4]
  mov bx, [bp+6]
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+2], ax
  mov ax, [Temps+2]
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+4], ax
  mov ax, [Temps+4]
  cmp word ax, 65
  call Bare_make_bool_from_n
  mov [Temps+6], ax
  push word [Temps+2]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L36
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L37
  mov ax, [Temps+4]
  cmp word ax, 255
  call Bare_make_bool_from_n
  mov [Temps+8], ax
  mov si, [Temps+8]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L39: ; Arm: 8'9
  mov si, g29
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L40: ; Continuation
  Bare_enter_check(12)
  mov ax, [bp+6]
  cmp word ax, 1025
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L38
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L39
  mov si, g30
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L41: ; Arm: 40'19
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov si, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L42: ; Function: (loop,t4)
  Bare_enter_check(12)
  mov ax, si
  sar ax, 1
  mov bx, 129
  sar bx, 1
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+2], dx
  mov ax, [Temps+2]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  push word bp
  push word si
  push word [bp+2]
  push word [CurrentCont]
  push word L40
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L41
  mov si, g28
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L43: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, g33
  jmp [bp]

L44: ; Continuation
  Bare_enter_check(600)
  mov ax, 1025
  call Bare_make_bytes
  mov [Temps+2], ax
  mov ax, 5
  sar ax, 1
  mov bx, [Temps+2]
  call Bare_load_sector
  mov ax, Bare_unit
  mov [Temps+4], ax
  mov ax, [Temps+2]
  mov [Temps+6], ax
  push word [Temps+6]
  push word L42
  mov [Temps+8], sp
  push word 4 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L43
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, [Temps+8]
  mov si, 1
  jmp [bp]

L45: ; Continuation
  Bare_enter_check(14)
  push word si
  push word L32
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word [CurrentCont]
  push word L44
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bp, g23
  mov si, 1
  jmp [bp]

L46: ; Start
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L45
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bp, g1
  mov si, g5
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
g29:
  dw 1
g30:
  dw 3
g31:
  dw 1
g32:
  dw 1
g33:
  dw 1

bare_start: jmp L46
