L1: ; Arm: 49'16
  mov di, g3
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L2: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov bx, si
  cmp word [bx], 3
  jz L1
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
  mov di, [Temps+4]
  mov bp, [bp+10]
  jmp [bp]

L3: ; Arm: 6'9
  mov di, g1
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L4: ; Function: (loop,t1)
  mov ax, di
  mov di, si
  mov si, ax
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
  push word L2
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L3
  mov di, g2
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L5: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov [Temps+2], ax
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L6: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(16)
  push word si
  push word [bp+4]
  push word L4
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word si
  push word [CurrentCont]
  push word L5
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, 1
  mov bp, [Temps+2]
  jmp [bp]

L7: ; Function: (make_sector,g4)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L6
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, 1025
  jmp AllocBare_make_bytes

L8: ; Arm: 14'14
  mov di, g20
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L9: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov bx, si
  cmp word [bx], 3
  jz L8
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
  mov di, [Temps+6]
  mov bp, g17
  jmp [bp]

L10: ; Arm: 6'9
  mov di, g18
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L11: ; Function: (loop,g17)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  mov ax, si
  cmp word ax, 37
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word si
  push word [CurrentCont]
  push word L9
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L10
  mov di, g19
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L12: ; Arm: 39'16
  mov di, g11
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L13: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
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
  mov di, [Temps+4]
  mov bp, [bp+6]
  jmp [bp]

L14: ; Arm: 41'32
  mov di, [bp+8]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L15: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L13
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L14
  mov di, `.`
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L16: ; Arm: 34'12
  mov di, g12
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L17: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  mov bx, si
  cmp word [bx], 3
  jz L12
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
  push word L15
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L16
  mov ax, [Temps+4]
  cmp word ax, 255
  call Bare_make_bool_from_n
  mov [Temps+8], ax
  mov di, [Temps+8]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L18: ; Arm: 6'9
  mov di, g9
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L19: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  mov ax, [bp+6]
  cmp word ax, 1025
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L17
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L18
  mov di, g10
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L20: ; Arm: 38'19
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov di, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L21: ; Function: (loop,t3)
  mov ax, di
  mov di, si
  mov si, ax
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
  push word L19
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L20
  mov di, g8
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L22: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, g13
  mov bp, g5
  jmp [bp]

L23: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  mov dx, [bp+4]
  sar dx, 1
  mov bx, si
  call Bare_load_sector
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov [Temps+4], si
  push word [Temps+4]
  push word L21
  mov [Temps+6], sp
  push word 4 ;; scanned
  push word [CurrentCont]
  push word L22
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, 1
  mov bp, [Temps+6]
  jmp [bp]

L24: ; Arm: 76'19
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
  push word [Temps+16]
  push word [CurrentCont]
  push word L23
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, 1025
  jmp AllocBare_make_bytes

L25: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov dx, [bp+4]
  sar dx, 1
  mov bx, si
  call Bare_store_sector
  mov ax, Bare_unit
  mov [Temps+4], ax
  mov di, g16
  mov bp, g5
  jmp [bp]

L26: ; Arm: 77'21
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
  push word [CurrentCont]
  push word L25
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [Temps+20]
  mov bp, g4
  jmp [bp]

L27: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, g22
  mov bp, g5
  jmp [bp]

L28: ; Function: (xloop,g5)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
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
  jz L24
  mov ax, [Temps+4]
  cmp word ax, `w`
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L26
  push word [CurrentCont]
  push word L27
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, 1
  mov bp, g17
  jmp [bp]

L29: ; Arm: 14'14
  mov di, g26
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L30: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov bx, si
  cmp word [bx], 3
  jz L29
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
  mov di, [Temps+6]
  mov bp, g23
  jmp [bp]

L31: ; Arm: 6'9
  mov di, g24
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L32: ; Function: (loop,g23)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(8)
  mov ax, si
  cmp word ax, 57
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word si
  push word [CurrentCont]
  push word L30
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L31
  mov di, g25
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L33: ; Arm: 39'16
  mov di, g31
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L34: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
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
  mov di, [Temps+4]
  mov bp, [bp+6]
  jmp [bp]

L35: ; Arm: 41'32
  mov di, [bp+8]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L36: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
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
  mov di, `.`
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L37: ; Arm: 34'12
  mov di, g32
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L38: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
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
  mov di, [Temps+8]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L39: ; Arm: 6'9
  mov di, g29
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L40: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
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
  mov di, g30
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L41: ; Arm: 38'19
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov di, [Temps+6]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L42: ; Function: (loop,t3)
  mov ax, di
  mov di, si
  mov si, ax
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
  mov di, g28
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L43: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov di, g33
  mov bp, g5
  jmp [bp]

L44: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(12)
  mov dx, 5
  sar dx, 1
  mov bx, si
  call Bare_load_sector
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov [Temps+4], si
  push word [Temps+4]
  push word L42
  mov [Temps+6], sp
  push word 4 ;; scanned
  push word [CurrentCont]
  push word L43
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, 1
  mov bp, [Temps+6]
  jmp [bp]

L45: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L44
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, 1025
  jmp AllocBare_make_bytes

L46: ; Start
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L45
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, 1
  mov bp, g23
  jmp [bp]

g1:
  dw 1
g2:
  dw 3
g3:
  dw 1
g4:
  dw L7
g5:
  dw L28
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
  dw L11
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
  dw L32
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
