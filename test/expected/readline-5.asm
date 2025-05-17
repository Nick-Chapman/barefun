L1: ; Arm: 15'7
  mov si, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L2: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
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
  push word cx
  push word L2
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g1
  mov si, [Temps+6]
  jmp [bp]

L4: ; Function: (rev_onto,g1)
  Bare_enter_check(6)
  push word si
  push word L3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L5: ; Arm: 38'7
  mov si, g3
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L6: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov bp, g2
  jmp [bp]

L7: ; Arm: 31'19
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov si, [Temps+10]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L8: ; Arm: 32'22
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov si, [Temps+12]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L9: ; Arm: 33'16
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+14], ax
  mov si, [Temps+14]
  mov bp, cx
  mov cx, [bp+2]
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
  push word cx
  push word L6
  mov cx, sp
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
  sar ax, 1
  mov bx, [Temps+6]
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+16], ax
  mov ax, [Temps+16]
  sar ax, 1
  mov bx, 3
  sar bx, 1
  sub ax, bx
  shl ax, 1
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
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L11: ; Arm: 71'25
  call Bare_get_keyboard_last_scancode
  mov [Temps+6], ax
  mov si, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L12: ; Function: (get_scan,g4)
  Bare_enter_check(0)
  hlt
  mov ax, Bare_unit
  mov [Temps+2], ax
  call Bare_is_keyboard_ready
  call Bare_make_bool_from_nz
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L11
  mov bp, g4
  mov si, g8
  jmp [bp]

L13: ; Arm: 57'13
  mov si, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L14: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L15: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L13
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
  sar ax, 1
  mov bx, [Temps+4]
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word si
  push word cx
  push word L14
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g21
  mov si, [Temps+10]
  jmp [bp]

L16: ; Function: (loop,g21)
  Bare_enter_check(6)
  push word si
  push word L15
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L17: ; Arm: 57'13
  mov si, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L18: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L19: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L17
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
  sar ax, 1
  mov bx, [Temps+4]
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word si
  push word cx
  push word L18
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g24
  mov si, [Temps+10]
  jmp [bp]

L20: ; Function: (loop,g24)
  Bare_enter_check(6)
  push word si
  push word L19
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L21: ; Arm: 57'13
  mov si, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L22: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L23: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L21
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
  sar ax, 1
  mov bx, [Temps+4]
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word si
  push word cx
  push word L22
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g29
  mov si, [Temps+10]
  jmp [bp]

L24: ; Function: (loop,g29)
  Bare_enter_check(6)
  push word si
  push word L23
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L25: ; Arm: 57'13
  mov si, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L26: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L27: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L25
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
  sar ax, 1
  mov bx, [Temps+4]
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word si
  push word cx
  push word L26
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g32
  mov si, [Temps+10]
  jmp [bp]

L28: ; Function: (loop,g32)
  Bare_enter_check(6)
  push word si
  push word L27
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L29: ; Arm: 57'13
  mov si, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L30: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L31: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L29
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
  sar ax, 1
  mov bx, [Temps+4]
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word si
  push word cx
  push word L30
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g35
  mov si, [Temps+10]
  jmp [bp]

L32: ; Function: (loop,g35)
  Bare_enter_check(6)
  push word si
  push word L31
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L33: ; Arm: 57'13
  mov si, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L34: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L35: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L33
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
  sar ax, 1
  mov bx, [Temps+4]
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word si
  push word cx
  push word L34
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g38
  mov si, [Temps+10]
  jmp [bp]

L36: ; Function: (loop,g38)
  Bare_enter_check(6)
  push word si
  push word L35
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L37: ; Arm: 22'13
  mov si, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L38: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  sar ax, 1
  mov bx, 3
  sar bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L39: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L37
  mov ax, g42
  mov bx, si
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+4], ax
  push word [bp+2]
  push word [Temps+4]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word si
  push word cx
  push word L38
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g41
  mov si, [Temps+6]
  jmp [bp]

L40: ; Function: (explode_loop,g41)
  Bare_enter_check(6)
  push word si
  push word L39
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L41: ; Arm: 22'13
  mov si, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L42: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  sar ax, 1
  mov bx, 3
  sar bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L43: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L41
  mov ax, g54
  mov bx, si
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+4], ax
  push word [bp+2]
  push word [Temps+4]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word si
  push word cx
  push word L42
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g53
  mov si, [Temps+6]
  jmp [bp]

L44: ; Function: (explode_loop,g53)
  Bare_enter_check(6)
  push word si
  push word L43
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L45: ; Continuation
  Bare_enter_check(0)
  mov bp, si
  mov si, g14
  jmp [bp]

L46: ; Arm: 97'23
  push word cx
  push word L45
  mov cx, sp
  push word 4 ;; scanned
  mov si, [bp+8]
  mov bp, [bp+10]
  jmp [bp]

L47: ; Continuation
  Bare_enter_check(0)
  mov bp, si
  mov si, g15
  jmp [bp]

L48: ; Arm: 98'26
  push word cx
  push word L47
  mov cx, sp
  push word 4 ;; scanned
  mov si, [bp+8]
  mov bp, [bp+10]
  jmp [bp]

L49: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L50: ; Arm: 99'25
  push word [bp+12]
  push word cx
  push word L49
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+10]
  mov si, g16
  jmp [bp]

L51: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L52: ; Arm: 100'28
  push word [bp+12]
  push word cx
  push word L51
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+10]
  mov si, g17
  jmp [bp]

L53: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L54: ; Arm: 101'32
  push word [bp+12]
  push word cx
  push word L53
  mov cx, sp
  push word 6 ;; scanned
  mov si, [bp+8]
  mov bp, [bp+10]
  jmp [bp]

L55: ; Arm: 102'24
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
  mov si, `\x7f`
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L56: ; Arm: 103'26
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
  mov si, ` `
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L57: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L58: ; Continuation
  Bare_enter_check(8)
  mov ax, `}`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  push word [bp+8]
  push word cx
  push word L57
  mov cx, sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, [bp+6]
  jmp [bp]

L59: ; Continuation
  Bare_enter_check(8)
  push word si
  push word `-`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, g2
  mov si, [Temps+2]
  jmp [bp]

L60: ; Arm: 60'11
  push word g22
  push word `0`
  push word 3
  mov [Temps+14], sp
  push word 6 ;; scanned
  mov si, [Temps+14]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L61: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L62: ; Arm: 64'2
  mov ax, 1
  sar ax, 1
  mov bx, [bp+14]
  sar bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+10], ax
  mov ax, [Temps+10]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+12], ax
  push word cx
  push word L59
  mov cx, sp
  push word 4 ;; scanned
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L60
  push word [Temps+10]
  push word cx
  push word L61
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g21
  mov si, g23
  jmp [bp]

L63: ; Continuation
  Bare_enter_check(0)
  mov bp, g2
  mov si, si
  jmp [bp]

L64: ; Arm: 60'11
  push word g25
  push word `0`
  push word 3
  mov [Temps+12], sp
  push word 6 ;; scanned
  mov si, [Temps+12]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L65: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L66: ; Arm: 106'27
  mov ax, `{`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, [bp+14]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+8], ax
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word cx
  push word L58
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L62
  mov ax, [bp+14]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  push word cx
  push word L63
  mov cx, sp
  push word 4 ;; scanned
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L64
  push word [bp+14]
  push word cx
  push word L65
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g24
  mov si, g26
  jmp [bp]

L67: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L68: ; Continuation
  Bare_enter_check(8)
  mov ax, `}`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  push word [bp+8]
  push word cx
  push word L67
  mov cx, sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, [bp+6]
  jmp [bp]

L69: ; Continuation
  Bare_enter_check(8)
  push word si
  push word `-`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, g2
  mov si, [Temps+2]
  jmp [bp]

L70: ; Arm: 60'11
  push word g30
  push word `0`
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  mov si, [Temps+10]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L71: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L72: ; Arm: 64'2
  mov ax, 1
  sar ax, 1
  mov bx, [bp+14]
  sar bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  push word cx
  push word L69
  mov cx, sp
  push word 4 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L70
  push word [Temps+6]
  push word cx
  push word L71
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g29
  mov si, g31
  jmp [bp]

L73: ; Continuation
  Bare_enter_check(0)
  mov bp, g2
  mov si, si
  jmp [bp]

L74: ; Arm: 60'11
  push word g33
  push word `0`
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  mov si, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L75: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L76: ; Arm: 107'32
  mov ax, `{`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, [bp+14]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+4], ax
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word cx
  push word L68
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L72
  mov ax, [bp+14]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word cx
  push word L73
  mov cx, sp
  push word 4 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L74
  push word [bp+14]
  push word cx
  push word L75
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g32
  mov si, g34
  jmp [bp]

L77: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L78: ; Continuation
  Bare_enter_check(8)
  mov ax, `}`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  push word [bp+8]
  push word cx
  push word L77
  mov cx, sp
  push word 6 ;; scanned
  mov si, [bp+4]
  mov bp, [bp+6]
  jmp [bp]

L79: ; Continuation
  Bare_enter_check(8)
  push word si
  push word `-`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, g2
  mov si, [Temps+2]
  jmp [bp]

L80: ; Arm: 60'11
  push word g36
  push word `0`
  push word 3
  mov [Temps+14], sp
  push word 6 ;; scanned
  mov si, [Temps+14]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L81: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L82: ; Arm: 64'2
  mov ax, 1
  sar ax, 1
  mov bx, [bp+14]
  sar bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+10], ax
  mov ax, [Temps+10]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+12], ax
  push word cx
  push word L79
  mov cx, sp
  push word 4 ;; scanned
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L80
  push word [Temps+10]
  push word cx
  push word L81
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g35
  mov si, g37
  jmp [bp]

L83: ; Continuation
  Bare_enter_check(0)
  mov bp, g2
  mov si, si
  jmp [bp]

L84: ; Arm: 60'11
  push word g39
  push word `0`
  push word 3
  mov [Temps+12], sp
  push word 6 ;; scanned
  mov si, [Temps+12]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L85: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L86: ; Arm: 110'22
  mov ax, `{`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, [bp+14]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+8], ax
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word cx
  push word L78
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L82
  mov ax, [bp+14]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  push word cx
  push word L83
  mov cx, sp
  push word 4 ;; scanned
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L84
  push word [bp+14]
  push word cx
  push word L85
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g38
  mov si, g40
  jmp [bp]

L87: ; Arm: 113'24
  mov ax, [Temps+2]
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  sar ax, 1
  mov bx, 129
  sar bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+8], ax
  mov ax, [Temps+8]
  sar ax, 1
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
  mov si, [Temps+10]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L88: ; Continuation
  Bare_enter_check(26)
  mov bx, si
  cmp word [bx], 3
  jz L76
  mov ax, [bp+16]
  mov bx, [bp+14]
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+2], ax
  mov ax, [Temps+2]
  cmp word ax, ` `
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L86
  mov bx, [bp+12]
  cmp word [bx], 3
  jz L87
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
  mov si, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L89: ; Arm: 6'9
  mov si, g27
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L90: ; Continuation
  Bare_enter_check(26)
  mov bx, si
  mov ax, [bx]
  mov [Temps+2], ax
  mov ax, [bp+14]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L66
  mov ax, [bp+14]
  cmp word ax, [Temps+2]
  call Bare_make_bool_from_n
  mov [Temps+6], ax
  push word si
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L88
  mov cx, sp
  push word 18 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L89
  mov si, g28
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L91: ; Arm: 104'44
  mov si, g18
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L92: ; Arm: 104'72
  mov si, g19
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L93: ; Continuation
  Bare_enter_check(18)
  mov ax, 257
  cmp word ax, [bp+14]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov ax, [bp+14]
  cmp word ax, 59
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  mov ax, [bp+14]
  cmp word ax, 315
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L46
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L48
  mov bx, [bp+16]
  cmp word [bx], 3
  jz L50
  mov bx, si
  cmp word [bx], 3
  jz L52
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L54
  mov ax, [bp+14]
  cmp word ax, 29
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L55
  mov ax, [bp+14]
  cmp word ax, 115
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L56
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L90
  mov cx, sp
  push word 16 ;; scanned
  mov bx, [bp+12]
  cmp word [bx], 3
  jz L91
  mov bx, [bp+8]
  cmp word [bx], 3
  jz L92
  mov si, g20
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L94: ; Arm: 90'38
  mov si, g13
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L95: ; Continuation
  Bare_enter_check(20)
  mov ax, [bp+14]
  cmp word ax, 341
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  push word si
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L93
  mov cx, sp
  push word 18 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L94
  mov ax, [bp+14]
  cmp word ax, 365
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  mov si, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L96: ; Arm: 89'36
  mov si, g12
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L97: ; Continuation
  Bare_enter_check(18)
  mov ax, si
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov ax, [Temps+2]
  cmp word ax, 85
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  push word [Temps+2]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L95
  mov cx, sp
  push word 16 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L96
  mov ax, [Temps+2]
  cmp word ax, 109
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov si, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L98: ; Function: (lam,t1)
  Bare_enter_check(16)
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L97
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g4
  mov si, g11
  jmp [bp]

L99: ; Function: (loop,t3)
  Bare_enter_check(12)
  push word bp
  push word si
  push word [bp+4]
  push word [bp+2]
  push word L98
  mov [Temps+2], sp
  push word 10 ;; scanned
  mov si, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L100: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, si
  mov si, [bx+4]
  jmp [bp]

L101: ; Arm: 125'22
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  push word [bp+4]
  push word cx
  push word L100
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g1
  mov si, g44
  jmp [bp]

L102: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word `\x04`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L103: ; Arm: 126'28
  mov ax, `^`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov ax, `D`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  push word [bp+4]
  push word cx
  push word L102
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g1
  mov si, g45
  jmp [bp]

L104: ; Arm: 127'19
  mov si, [bp+4]
  mov bp, [bp+6]
  jmp [bp]

L105: ; Arm: 130'17
  mov si, [bp+4]
  mov bp, [bp+6]
  jmp [bp]

L106: ; Continuation
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
  mov si, [bp+6]
  mov bp, [bp+4]
  jmp [bp]

L107: ; Arm: 132'31
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
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L108: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L106
  mov cx, sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L107
  mov si, g48
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L109: ; Arm: 6'9
  mov si, g46
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L110: ; Arm: 128'21
  mov bx, [bp+4]
  cmp word [bx], 1
  jz L105
  mov ax, [bx+2]
  mov [Temps+12], ax
  mov ax, [bx+4]
  mov [Temps+14], ax
  mov ax, [Temps+12]
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+16], ax
  mov ax, 53
  cmp word ax, [Temps+16]
  call Bare_make_bool_from_n
  mov [Temps+18], ax
  push word [Temps+14]
  push word [bp+6]
  push word cx
  push word L108
  mov cx, sp
  push word 8 ;; scanned
  mov bx, [Temps+18]
  cmp word [bx], 3
  jz L109
  mov si, g47
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L111: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+2]
  jmp [bp]

L112: ; Arm: 31'19
  mov ax, si
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+16], ax
  mov si, [Temps+16]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L113: ; Arm: 32'22
  mov ax, si
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+18], ax
  mov si, [Temps+18]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L114: ; Arm: 33'16
  mov ax, si
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+20], ax
  mov si, [Temps+20]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L115: ; Continuation
  Bare_enter_check(12)
  mov ax, si
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov ax, si
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L101
  mov ax, si
  cmp word ax, `\x04`
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L103
  mov ax, 255
  cmp word ax, [Temps+2]
  call Bare_make_bool_from_n
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L104
  mov ax, [Temps+2]
  cmp word ax, 255
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L110
  mov ax, si
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+12], ax
  mov ax, [Temps+12]
  cmp word ax, 17
  call Bare_make_bool_from_z
  mov [Temps+14], ax
  push word si
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L111
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [Temps+14]
  cmp word [bx], 3
  jz L112
  mov ax, si
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+16], ax
  mov bx, [Temps+16]
  cmp word [bx], 3
  jz L113
  mov ax, 53
  cmp word ax, [Temps+12]
  call Bare_make_bool_from_n
  mov [Temps+18], ax
  mov bx, [Temps+18]
  cmp word [bx], 3
  jz L114
  mov ax, `^`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+20], ax
  mov ax, 131
  sar ax, 1
  mov bx, [Temps+12]
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+22], ax
  mov ax, [Temps+22]
  sar ax, 1
  mov bx, 3
  sar bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+24], ax
  mov ax, [Temps+24]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+26], ax
  mov ax, [Temps+26]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+28], ax
  mov si, [Temps+28]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L116: ; Continuation
  Bare_enter_check(10)
  mov bx, [bp+4]
  mov ax, [bx]
  mov [Temps+2], ax
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L115
  mov cx, sp
  push word 8 ;; scanned
  mov bp, si
  mov si, [Temps+2]
  jmp [bp]

L117: ; Function: (readloop,t1)
  Bare_enter_check(12)
  mov bx, [bp+2]
  mov ax, [bx]
  mov [Temps+2], ax
  push word bp
  push word si
  push word [bp+4]
  push word cx
  push word L116
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov si, [Temps+2]
  jmp [bp]

L118: ; Arm: 148'29
  mov si, g51
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L119: ; Continuation
  Bare_enter_check(0)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov bp, [bp+4]
  mov si, g52
  jmp [bp]

L120: ; Continuation
  Bare_enter_check(8)
  mov bx, si
  cmp word [bx], 3
  jz L118
  push word [bp+4]
  push word cx
  push word L119
  mov cx, sp
  push word 6 ;; scanned
  mov si, [bp+6]
  mov bp, g2
  jmp [bp]

L121: ; Arm: 142'7
  mov si, g50
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L122: ; Continuation
  Bare_enter_check(10)
  push word si
  push word [bp+4]
  push word cx
  push word L120
  mov cx, sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 1
  jz L121
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [Temps+2]
  cmp word ax, `\x04`
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov si, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L123: ; Continuation
  Bare_enter_check(18)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L117
  mov [Temps+2], sp
  push word 8 ;; scanned
  push word [bp+10]
  push word cx
  push word L122
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [Temps+2]
  mov si, g49
  jmp [bp]

L124: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L123
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g2
  mov si, si
  jmp [bp]

L125: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L124
  mov cx, sp
  push word 12 ;; scanned
  mov bp, si
  mov si, 3
  jmp [bp]

L126: ; Function: (mainloop,t4)
  Bare_enter_check(14)
  push word bp
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L125
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g41
  mov si, g43
  jmp [bp]

L127: ; Continuation
  Bare_enter_check(0)
  mov bp, [bp+4]
  mov si, g56
  jmp [bp]

L128: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L127
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g2
  mov si, si
  jmp [bp]

L129: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L128
  mov cx, sp
  push word 6 ;; scanned
  mov bp, si
  mov si, 89
  jmp [bp]

L130: ; Start
  Bare_enter_check(34)
  push word g9
  mov [Temps+2], sp
  push word 2 ;; scanned
  push word g10
  mov [Temps+4], sp
  push word 2 ;; scanned
  push word [Temps+4]
  push word [Temps+2]
  push word L99
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word [Temps+4]
  push word [Temps+2]
  push word L126
  mov [Temps+8], sp
  push word 8 ;; scanned
  push word [Temps+8]
  push word cx
  push word L129
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g53
  mov si, g55
  jmp [bp]

g1:
  dw L4
g2:
  dw L10
g3:
  dw 1
g4:
  dw L12
g5:
  dw 1
g6:
  dw 1
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
  dw 3
g13:
  dw 3
g14:
  dw 3
g15:
  dw 1
g16:
  dw 3
g17:
  dw 1
g18:
  dw 103
  db `   @            QWERTYUIOP    ASDFGHJKL     ZXCVBNM`
g19:
  dw 109
  db `  !@#$%^&*()_+ \x09QWERTYUIOP{}\n ASDFGHJKL:"~ |ZXCVBNM<>?`
g20:
  dw 109
  db `  1234567890-= \x09qwertyuiop[]\n asdfghjkl;'\` \\zxcvbnm,./`
g21:
  dw L16
g22:
  dw 1
g23:
  dw 1
g24:
  dw L20
g25:
  dw 1
g26:
  dw 1
g27:
  dw 1
g28:
  dw 3
g29:
  dw L24
g30:
  dw 1
g31:
  dw 1
g32:
  dw L28
g33:
  dw 1
g34:
  dw 1
g35:
  dw L32
g36:
  dw 1
g37:
  dw 1
g38:
  dw L36
g39:
  dw 1
g40:
  dw 1
g41:
  dw L40
g42:
  dw 5
  db `% `
g43:
  dw 1
g44:
  dw 1
g45:
  dw 1
g46:
  dw 1
g47:
  dw 3
g48:
  dw 1
g49:
  dw 1
g50:
  dw 1
g51:
  dw 1
g52:
  dw 1
g53:
  dw L44
g54:
  dw 91
  db `Readline: edit with backspace; exit with ^D.\n`
g55:
  dw 1
g56:
  dw 1

bare_start: jmp L130
