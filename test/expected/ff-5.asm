L1: ; Arm: 21'7
  mov si, g2
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L2: ; Function: (put_chars,g1)
  Bare_enter_check(0)
  mov bx, si
  cmp word [bx], 1
  jz L1
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov di, [Temps+4]
  mov bp, g1
  mov si, di
  jmp [bp]

L3: ; Arm: 31'11
  mov si, si
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L4: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, si
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L5: ; Continuation
  Bare_enter_check(8)
  mov ax, [bp+4]
  mov bx, 5
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  push word si
  push word [CurrentCont]
  push word L4
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [Temps+2]
  mov bp, g3
  mov si, di
  jmp [bp]

L6: ; Function: (fib,g3)
  Bare_enter_check(8)
  mov ax, si
  cmp word ax, 5
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L3
  mov ax, si
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+4], ax
  push word si
  push word [CurrentCont]
  push word L5
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [Temps+4]
  mov bp, g3
  mov si, di
  jmp [bp]

L7: ; Arm: 5'13
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L8: ; Continuation
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  mov si, di
  jmp [bp]

L9: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L7
  mov ax, g5
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
  push word L8
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [Temps+8]
  mov bp, g4
  mov si, di
  jmp [bp]

L10: ; Function: (explode_loop,g4)
  Bare_enter_check(6)
  push word si
  push word L9
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L11: ; Arm: 5'13
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
  mov ax, g9
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
  mov bp, g8
  mov si, di
  jmp [bp]

L14: ; Function: (explode_loop,g8)
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

L15: ; Arm: 14'13
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L16: ; Continuation
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  mov si, di
  jmp [bp]

L17: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L15
  mov ax, si
  sar ax, 1
  mov bx, 21
  sar bx, 1
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+4], dx
  mov ax, 97
  mov bx, [Temps+4]
  add ax, bx
  sub ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  mov ax, si
  sar ax, 1
  mov bx, 21
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+10], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+12], sp
  push word 6 ;; scanned
  push word [Temps+10]
  push word [CurrentCont]
  push word L16
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [Temps+12]
  mov bp, g11
  mov si, di
  jmp [bp]

L18: ; Function: (loop,g11)
  Bare_enter_check(6)
  push word si
  push word L17
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L19: ; Arm: 5'13
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L20: ; Continuation
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  mov si, di
  jmp [bp]

L21: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L19
  mov ax, g15
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
  push word L20
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [Temps+8]
  mov bp, g14
  mov si, di
  jmp [bp]

L22: ; Function: (explode_loop,g14)
  Bare_enter_check(6)
  push word si
  push word L21
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L23: ; Arm: 14'13
  mov si, [bp+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L24: ; Continuation
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  mov si, di
  jmp [bp]

L25: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L23
  mov ax, si
  sar ax, 1
  mov bx, 21
  sar bx, 1
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+4], dx
  mov ax, 97
  mov bx, [Temps+4]
  add ax, bx
  sub ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  mov ax, si
  sar ax, 1
  mov bx, 21
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+10], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+12], sp
  push word 6 ;; scanned
  push word [Temps+10]
  push word [CurrentCont]
  push word L24
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, [Temps+12]
  mov bp, g17
  mov si, di
  jmp [bp]

L26: ; Function: (loop,g17)
  Bare_enter_check(6)
  push word si
  push word L25
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L27: ; Continuation
  Bare_enter_check(0)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, [bp+4]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+4], ax
  mov di, [Temps+4]
  mov bp, g7
  mov si, di
  jmp [bp]

L28: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L27
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, si
  mov bp, g1
  mov si, di
  jmp [bp]

L29: ; Arm: 17'11
  push word g18
  push word `0`
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  mov si, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L30: ; Continuation
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  mov si, di
  jmp [bp]

L31: ; Continuation
  Bare_enter_check(16)
  mov ax, [bp+6]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  push word [bp+4]
  push word [CurrentCont]
  push word L28
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L29
  push word [bp+6]
  push word [CurrentCont]
  push word L30
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g19
  mov bp, g17
  mov si, di
  jmp [bp]

L32: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L31
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, si
  mov bp, g1
  mov si, di
  jmp [bp]

L33: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L32
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, 9
  mov bp, si
  mov si, di
  jmp [bp]

L34: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L33
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, g16
  mov bp, g14
  mov si, di
  jmp [bp]

L35: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L34
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, si
  mov bp, g1
  mov si, di
  jmp [bp]

L36: ; Arm: 17'11
  push word g12
  push word `0`
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  mov si, [Temps+4]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L37: ; Continuation
  Bare_enter_check(0)
  mov di, [bp+4]
  mov bp, si
  mov si, di
  jmp [bp]

L38: ; Continuation
  Bare_enter_check(18)
  mov ax, [bp+4]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L35
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L36
  push word [bp+4]
  push word [CurrentCont]
  push word L37
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, g13
  mov bp, g11
  mov si, di
  jmp [bp]

L39: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L38
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, si
  mov bp, g1
  mov si, di
  jmp [bp]

L40: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L39
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, 7
  mov bp, si
  mov si, di
  jmp [bp]

L41: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word [CurrentCont]
  push word L40
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov di, g10
  mov bp, g8
  mov si, di
  jmp [bp]

L42: ; Function: (loop,g7)
  Bare_enter_check(8)
  push word si
  push word [CurrentCont]
  push word L41
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov di, si
  mov bp, g3
  mov si, di
  jmp [bp]

L43: ; Continuation
  Bare_enter_check(0)
  mov di, 1
  mov bp, g7
  mov si, di
  jmp [bp]

L44: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L43
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, si
  mov bp, g1
  mov si, di
  jmp [bp]

L45: ; Continuation
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L44
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, 29
  mov bp, si
  mov si, di
  jmp [bp]

L46: ; Start
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L45
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, g6
  mov bp, g4
  mov si, di
  jmp [bp]

g1:
  dw L2
g2:
  dw 1
g3:
  dw L6
g4:
  dw L10
g5:
  dw 31
  db `Fib-forever...\n`
g6:
  dw 1
g7:
  dw L42
g8:
  dw L14
g9:
  dw 9
  db `fib `
g10:
  dw 1
g11:
  dw L18
g12:
  dw 1
g13:
  dw 1
g14:
  dw L22
g15:
  dw 11
  db ` --> `
g16:
  dw 1
g17:
  dw L26
g18:
  dw 1
g19:
  dw 1

bare_start: jmp L46
