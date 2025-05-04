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

L3: ; Arm: 25'7
  mov dx, 1
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L4: ; Continuation
  Bare_enter_check(0)
  mov ax, 3
  shr ax, 1
  mov bx, dx
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L5: ; Function: (length,g2)
  Bare_enter_check(6)
  mov bx, dx
  cmp word [bx], 1
  jz L3
  mov si, [bx+2]
  mov di, [bx+4]
  push word cx
  push word L4
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g2
  mov dx, di
  jmp [bp]

L6: ; Arm: 30'7
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L7: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L8: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov bx, dx
  cmp word [bx], 1
  jz L6
  mov si, [bx+2]
  mov di, [bx+4]
  push word [bp+2]
  push word si
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word di
  push word cx
  push word L7
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g3
  mov dx, [Temps+6]
  jmp [bp]

L9: ; Function: (rev_onto,g3)
  Bare_enter_check(6)
  push word dx
  push word L8
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L10: ; Arm: 43'9
  mov dx, g4
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L11: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L12: ; Function: (lam,t1)
  Bare_enter_check(8)
  mov bx, dx
  cmp word [bx], 1
  jz L10
  mov si, [bx+2]
  mov di, [bx+4]
  mov ax, [bp+2]
  mov bx, si
  push word si ;; save
  mov si, [bp+4]
  shr si, 1
  call Bare_set_bytes
  pop word si ;; restore
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+8], ax
  push word di
  push word cx
  push word L11
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+8]
  jmp [bp]

L13: ; Function: (loop,t2)
  Bare_enter_check(10)
  push word bp
  push word dx
  push word [bp+2]
  push word L12
  mov si, sp
  push word 8 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L14: ; Continuation
  Bare_enter_check(0)
  mov si, [bp+4]
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L15: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L14
  mov cx, sp
  push word 6 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L16: ; Continuation
  Bare_enter_check(100)
  mov ax, dx
  call Bare_make_bytes
  mov si, ax
  push word si
  push word L13
  mov di, sp
  push word 4 ;; scanned
  push word si
  push word [bp+4]
  push word cx
  push word L15
  mov cx, sp
  push word 8 ;; scanned
  mov bp, di
  mov dx, 1
  jmp [bp]

L17: ; Function: (lam,g5)
  Bare_enter_check(8)
  push word dx
  push word cx
  push word L16
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g2
  mov dx, dx
  jmp [bp]

L18: ; Arm: 51'13
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L19: ; Continuation
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

L20: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L18
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
  push word L19
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, [Temps+6]
  jmp [bp]

L21: ; Function: (explode_loop,t1)
  Bare_enter_check(10)
  push word bp
  push word dx
  push word [bp+2]
  push word L20
  mov si, sp
  push word 8 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L22: ; Continuation
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

L23: ; Function: (lam,g7)
  Bare_enter_check(14)
  push word dx
  push word L21
  mov si, sp
  push word 4 ;; scanned
  mov bx, dx
  mov di, [bx]
  push word di
  push word cx
  push word L22
  mov cx, sp
  push word 6 ;; scanned
  mov bp, si
  mov dx, g6
  jmp [bp]

L24: ; Arm: 72'7
  mov dx, g9
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L25: ; Continuation
  Bare_enter_check(0)
  mov dx, [bp+4]
  mov bp, g8
  jmp [bp]

L26: ; Arm: 65'19
  mov ax, si
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov dx, [Temps+10]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L27: ; Arm: 66'22
  mov ax, si
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov dx, [Temps+12]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L28: ; Arm: 67'16
  mov ax, si
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+14], ax
  mov dx, [Temps+14]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L29: ; Function: (put_chars,g8)
  Bare_enter_check(8)
  mov bx, dx
  cmp word [bx], 1
  jz L24
  mov si, [bx+2]
  mov di, [bx+4]
  mov ax, si
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  cmp word ax, 17
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  push word di
  push word cx
  push word L25
  mov cx, sp
  push word 6 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L26
  mov ax, si
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L27
  mov ax, 53
  cmp word ax, [Temps+6]
  call Bare_make_bool_from_n
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L28
  mov ax, `^`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+14], ax
  mov ax, 131
  shr ax, 1
  mov bx, [Temps+6]
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+16], ax
  mov ax, [Temps+16]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+18], ax
  mov ax, [Temps+18]
  shr ax, 1
  call Bare_num_to_char
  mov [Temps+20], ax
  mov ax, [Temps+20]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+22], ax
  mov dx, [Temps+22]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L30: ; Arm: 85'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L31: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L32: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L30
  mov ax, dx
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov di, dx
  pop word dx ;; restore
  mov ax, 97
  shr ax, 1
  mov bx, di
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  shr ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L31
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g29
  mov dx, [Temps+10]
  jmp [bp]

L33: ; Function: (loop,g29)
  Bare_enter_check(6)
  push word dx
  push word L32
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L34: ; Arm: 85'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L35: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L36: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L34
  mov ax, dx
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov di, dx
  pop word dx ;; restore
  mov ax, 97
  shr ax, 1
  mov bx, di
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  shr ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L35
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g40
  mov dx, [Temps+10]
  jmp [bp]

L37: ; Function: (loop,g40)
  Bare_enter_check(6)
  push word dx
  push word L36
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L38: ; Arm: 85'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L39: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L40: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L38
  mov ax, dx
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov di, dx
  pop word dx ;; restore
  mov ax, 97
  shr ax, 1
  mov bx, di
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  shr ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L39
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g44
  mov dx, [Temps+10]
  jmp [bp]

L41: ; Function: (loop,g44)
  Bare_enter_check(6)
  push word dx
  push word L40
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L42: ; Arm: 85'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L43: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L44: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L42
  mov ax, dx
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov di, dx
  pop word dx ;; restore
  mov ax, 97
  shr ax, 1
  mov bx, di
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  shr ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L43
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g55
  mov dx, [Temps+10]
  jmp [bp]

L45: ; Function: (loop,g55)
  Bare_enter_check(6)
  push word dx
  push word L44
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L46: ; Arm: 85'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L47: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L48: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L46
  mov ax, dx
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov di, dx
  pop word dx ;; restore
  mov ax, 97
  shr ax, 1
  mov bx, di
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  shr ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L47
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g59
  mov dx, [Temps+10]
  jmp [bp]

L49: ; Function: (loop,g59)
  Bare_enter_check(6)
  push word dx
  push word L48
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L50: ; Arm: 85'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L51: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L52: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L50
  mov ax, dx
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov di, dx
  pop word dx ;; restore
  mov ax, 97
  shr ax, 1
  mov bx, di
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  shr ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L51
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g63
  mov dx, [Temps+10]
  jmp [bp]

L53: ; Function: (loop,g63)
  Bare_enter_check(6)
  push word dx
  push word L52
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L54: ; Arm: 85'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L55: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L56: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L54
  mov ax, dx
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov di, dx
  pop word dx ;; restore
  mov ax, 97
  shr ax, 1
  mov bx, di
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  shr ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L55
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g80
  mov dx, [Temps+10]
  jmp [bp]

L57: ; Function: (loop,g80)
  Bare_enter_check(6)
  push word dx
  push word L56
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L58: ; Arm: 85'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L59: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L60: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L58
  mov ax, dx
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov di, dx
  pop word dx ;; restore
  mov ax, 97
  shr ax, 1
  mov bx, di
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  shr ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L59
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g91
  mov dx, [Temps+10]
  jmp [bp]

L61: ; Function: (loop,g91)
  Bare_enter_check(6)
  push word dx
  push word L60
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L62: ; Arm: 85'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L63: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L64: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L62
  mov ax, dx
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov di, dx
  pop word dx ;; restore
  mov ax, 97
  shr ax, 1
  mov bx, di
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  shr ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L63
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g110
  mov dx, [Temps+10]
  jmp [bp]

L65: ; Function: (loop,g110)
  Bare_enter_check(6)
  push word dx
  push word L64
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L66: ; Arm: 85'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L67: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L68: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L66
  mov ax, dx
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov di, dx
  pop word dx ;; restore
  mov ax, 97
  shr ax, 1
  mov bx, di
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  shr ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L67
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g121
  mov dx, [Temps+10]
  jmp [bp]

L69: ; Function: (loop,g121)
  Bare_enter_check(6)
  push word dx
  push word L68
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L70: ; Arm: 100'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L71: ; Continuation
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

L72: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L70
  push word [bp+2]
  push word `-`
  push word 3
  mov di, sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L71
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g141
  mov dx, di
  jmp [bp]

L73: ; Function: (loop,g141)
  Bare_enter_check(6)
  push word dx
  push word L72
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L74: ; Arm: 85'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L75: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L76: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L74
  mov ax, dx
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov di, dx
  pop word dx ;; restore
  mov ax, 97
  shr ax, 1
  mov bx, di
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  shr ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L75
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g146
  mov dx, [Temps+10]
  jmp [bp]

L77: ; Function: (loop,g146)
  Bare_enter_check(6)
  push word dx
  push word L76
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L78: ; Arm: 85'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L79: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L80: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L78
  mov ax, dx
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov di, dx
  pop word dx ;; restore
  mov ax, 97
  shr ax, 1
  mov bx, di
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  shr ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L79
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g157
  mov dx, [Temps+10]
  jmp [bp]

L81: ; Function: (loop,g157)
  Bare_enter_check(6)
  push word dx
  push word L80
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L82: ; Arm: 85'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L83: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L84: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L82
  mov ax, dx
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov di, dx
  pop word dx ;; restore
  mov ax, 97
  shr ax, 1
  mov bx, di
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  shr ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L83
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g161
  mov dx, [Temps+10]
  jmp [bp]

L85: ; Function: (loop,g161)
  Bare_enter_check(6)
  push word dx
  push word L84
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L86: ; Arm: 85'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L87: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L88: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L86
  mov ax, dx
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov di, dx
  pop word dx ;; restore
  mov ax, 97
  shr ax, 1
  mov bx, di
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  shr ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L87
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g172
  mov dx, [Temps+10]
  jmp [bp]

L89: ; Function: (loop,g172)
  Bare_enter_check(6)
  push word dx
  push word L88
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L90: ; Arm: 85'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L91: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L92: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L90
  mov ax, dx
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov di, dx
  pop word dx ;; restore
  mov ax, 97
  shr ax, 1
  mov bx, di
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  shr ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L91
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g176
  mov dx, [Temps+10]
  jmp [bp]

L93: ; Function: (loop,g176)
  Bare_enter_check(6)
  push word dx
  push word L92
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L94: ; Arm: 85'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L95: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L96: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L94
  mov ax, dx
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov di, dx
  pop word dx ;; restore
  mov ax, 97
  shr ax, 1
  mov bx, di
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  shr ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L95
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g180
  mov dx, [Temps+10]
  jmp [bp]

L97: ; Function: (loop,g180)
  Bare_enter_check(6)
  push word dx
  push word L96
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L98: ; Arm: 85'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L99: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L100: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L98
  mov ax, dx
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov di, dx
  pop word dx ;; restore
  mov ax, 97
  shr ax, 1
  mov bx, di
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  shr ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L99
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g197
  mov dx, [Temps+10]
  jmp [bp]

L101: ; Function: (loop,g197)
  Bare_enter_check(6)
  push word dx
  push word L100
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L102: ; Arm: 85'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L103: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L104: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L102
  mov ax, dx
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov di, dx
  pop word dx ;; restore
  mov ax, 97
  shr ax, 1
  mov bx, di
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  shr ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L103
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g208
  mov dx, [Temps+10]
  jmp [bp]

L105: ; Function: (loop,g208)
  Bare_enter_check(6)
  push word dx
  push word L104
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L106: ; Arm: 85'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L107: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L108: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L106
  mov ax, dx
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov di, dx
  pop word dx ;; restore
  mov ax, 97
  shr ax, 1
  mov bx, di
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  shr ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L107
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g227
  mov dx, [Temps+10]
  jmp [bp]

L109: ; Function: (loop,g227)
  Bare_enter_check(6)
  push word dx
  push word L108
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L110: ; Arm: 85'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L111: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L112: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L110
  mov ax, dx
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov di, dx
  pop word dx ;; restore
  mov ax, 97
  shr ax, 1
  mov bx, di
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  shr ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L111
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g238
  mov dx, [Temps+10]
  jmp [bp]

L113: ; Function: (loop,g238)
  Bare_enter_check(6)
  push word dx
  push word L112
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L114: ; Arm: 85'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L115: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L116: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L114
  mov ax, dx
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov di, dx
  pop word dx ;; restore
  mov ax, 97
  shr ax, 1
  mov bx, di
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  shr ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L115
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g261
  mov dx, [Temps+10]
  jmp [bp]

L117: ; Function: (loop,g261)
  Bare_enter_check(6)
  push word dx
  push word L116
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L118: ; Arm: 85'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L119: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L120: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L118
  mov ax, dx
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov di, dx
  pop word dx ;; restore
  mov ax, 97
  shr ax, 1
  mov bx, di
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  shr ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L119
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g272
  mov dx, [Temps+10]
  jmp [bp]

L121: ; Function: (loop,g272)
  Bare_enter_check(6)
  push word dx
  push word L120
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L122: ; Arm: 85'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L123: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L124: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L122
  mov ax, dx
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov di, dx
  pop word dx ;; restore
  mov ax, 97
  shr ax, 1
  mov bx, di
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  shr ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L123
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g276
  mov dx, [Temps+10]
  jmp [bp]

L125: ; Function: (loop,g276)
  Bare_enter_check(6)
  push word dx
  push word L124
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L126: ; Arm: 85'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L127: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L128: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L126
  mov ax, dx
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov di, dx
  pop word dx ;; restore
  mov ax, 97
  shr ax, 1
  mov bx, di
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  shr ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L127
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g287
  mov dx, [Temps+10]
  jmp [bp]

L129: ; Function: (loop,g287)
  Bare_enter_check(6)
  push word dx
  push word L128
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L130: ; Arm: 85'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L131: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L132: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L130
  mov ax, dx
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov di, dx
  pop word dx ;; restore
  mov ax, 97
  shr ax, 1
  mov bx, di
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  shr ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L131
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g296
  mov dx, [Temps+10]
  jmp [bp]

L133: ; Function: (loop,g296)
  Bare_enter_check(6)
  push word dx
  push word L132
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L134: ; Arm: 85'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L135: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L136: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L134
  mov ax, dx
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov di, dx
  pop word dx ;; restore
  mov ax, 97
  shr ax, 1
  mov bx, di
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  shr ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L135
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g307
  mov dx, [Temps+10]
  jmp [bp]

L137: ; Function: (loop,g307)
  Bare_enter_check(6)
  push word dx
  push word L136
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L138: ; Arm: 85'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L139: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L140: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L138
  mov ax, dx
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov di, dx
  pop word dx ;; restore
  mov ax, 97
  shr ax, 1
  mov bx, di
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  shr ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L139
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g326
  mov dx, [Temps+10]
  jmp [bp]

L141: ; Function: (loop,g326)
  Bare_enter_check(6)
  push word dx
  push word L140
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L142: ; Arm: 85'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L143: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L144: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L142
  mov ax, dx
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov di, dx
  pop word dx ;; restore
  mov ax, 97
  shr ax, 1
  mov bx, di
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  shr ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L143
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g337
  mov dx, [Temps+10]
  jmp [bp]

L145: ; Function: (loop,g337)
  Bare_enter_check(6)
  push word dx
  push word L144
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L146: ; Arm: 85'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L147: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L148: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L146
  mov ax, dx
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov di, dx
  pop word dx ;; restore
  mov ax, 97
  shr ax, 1
  mov bx, di
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  shr ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L147
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g356
  mov dx, [Temps+10]
  jmp [bp]

L149: ; Function: (loop,g356)
  Bare_enter_check(6)
  push word dx
  push word L148
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L150: ; Arm: 117'16
  mov dx, g22
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L151: ; Continuation
  Bare_enter_check(0)
  mov bx, dx
  cmp word [bx], 3
  jz L150
  mov ax, 1
  shr ax, 1
  mov bx, [bp+8]
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  mov ax, [bp+4]
  mov bx, si
  shr bx, 1
  call Bare_get_bytes
  mov di, ax
  mov ax, [bp+6]
  mov bx, di
  push word si ;; save
  mov si, [bp+8]
  shr si, 1
  call Bare_set_bytes
  pop word si ;; restore
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, [bp+8]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+8], ax
  mov bp, [bp+10]
  mov dx, [Temps+8]
  jmp [bp]

L152: ; Arm: 13'9
  mov dx, g20
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L153: ; Function: (loop,t2)
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
  push word L151
  mov cx, sp
  push word 12 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L152
  mov dx, g21
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L154: ; Arm: 254'16
  mov dx, g24
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L155: ; Arm: 100'13
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L156: ; Continuation
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

L157: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L155
  push word [bp+4]
  push word [bp+2]
  push word 3
  mov di, sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L156
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+6]
  mov dx, di
  jmp [bp]

L158: ; Function: (loop,t5)
  Bare_enter_check(10)
  push word bp
  push word dx
  push word [bp+2]
  push word L157
  mov si, sp
  push word 8 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L159: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, [bp+6]
  mov dx, si
  jmp [bp]

L160: ; Continuation
  Bare_enter_check(0)
  call Bare_crash
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L161: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L160
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L162: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L161
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L163: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L162
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L164: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L163
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L165: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L164
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L166: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L165
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g3
  mov dx, g38
  jmp [bp]

L167: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L166
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L168: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L167
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L169: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L168
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g37
  jmp [bp]

L170: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L169
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L171: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L170
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L172: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L171
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L173: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L172
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g3
  mov dx, g36
  jmp [bp]

L174: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L173
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L175: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L174
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g35
  jmp [bp]

L176: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L175
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L177: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L176
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L178: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L177
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L179: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L178
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L180: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L179
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g3
  mov dx, g34
  jmp [bp]

L181: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L180
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L182: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L181
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L183: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L182
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g33
  jmp [bp]

L184: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L183
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L185: ; Arm: 88'11
  push word g30
  push word `0`
  push word 3
  mov di, sp
  push word 6 ;; scanned
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L186: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L187: ; Continuation
  Bare_enter_check(6)
  mov ax, 1
  shr ax, 1
  mov bx, [bp+4]
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  push word cx
  push word L186
  mov cx, sp
  push word 4 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L188: ; Arm: 89'13
  push word [bp+10]
  push word cx
  push word L187
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g29
  mov dx, g31
  jmp [bp]

L189: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L190: ; Arm: 243'23
  mov ax, [bp+10]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L184
  mov cx, sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L185
  mov ax, [bp+10]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov di, ax
  mov bx, di
  cmp word [bx], 3
  jz L188
  push word [bp+10]
  push word cx
  push word L189
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g29
  mov dx, g32
  jmp [bp]

L191: ; Arm: 128'16
  mov dx, g75
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L192: ; Continuation
  Bare_enter_check(0)
  mov bx, dx
  cmp word [bx], 3
  jz L191
  mov ax, [bp+6]
  mov bx, [bp+10]
  shr bx, 1
  call Bare_get_bytes
  mov si, ax
  mov ax, [bp+4]
  shr ax, 1
  mov bx, [bp+10]
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov di, ax
  mov ax, [bp+8]
  mov bx, si
  push word si ;; save
  mov si, di
  shr si, 1
  call Bare_set_bytes
  pop word si ;; restore
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, [bp+10]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+8], ax
  mov bp, [bp+12]
  mov dx, [Temps+8]
  jmp [bp]

L193: ; Arm: 13'9
  mov dx, g73
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L194: ; Function: (loop,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 129
  call Bare_make_bool_from_n
  mov si, ax
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L192
  mov cx, sp
  push word 14 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L193
  mov dx, g74
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L195: ; Continuation
  Bare_enter_check(0)
  mov bx, [bp+4]
  mov ax, g76
  mov [bx], ax
  mov si, Bare_unit
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L196: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word L194
  mov si, sp
  push word 8 ;; scanned
  push word [bp+8]
  push word cx
  push word L195
  mov cx, sp
  push word 6 ;; scanned
  mov bp, si
  mov dx, 1
  jmp [bp]

L197: ; Arm: 205'23
  push word [Temps+8]
  push word [bp+14]
  push word [bp+12]
  push word cx
  push word L196
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [Temps+12]
  mov ax, [bx+2]
  mov [Temps+16], ax
  mov dx, [Temps+16]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L198: ; Arm: 128'16
  mov dx, g138
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L199: ; Continuation
  Bare_enter_check(0)
  mov bx, dx
  cmp word [bx], 3
  jz L198
  mov ax, [bp+6]
  mov bx, [bp+10]
  shr bx, 1
  call Bare_get_bytes
  mov si, ax
  mov ax, [bp+4]
  shr ax, 1
  mov bx, [bp+10]
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov di, ax
  mov ax, [bp+8]
  mov bx, si
  push word si ;; save
  mov si, di
  shr si, 1
  call Bare_set_bytes
  pop word si ;; restore
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, [bp+10]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+8], ax
  mov bp, [bp+12]
  mov dx, [Temps+8]
  jmp [bp]

L200: ; Arm: 13'9
  mov dx, g136
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L201: ; Function: (loop,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 129
  call Bare_make_bool_from_n
  mov si, ax
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L199
  mov cx, sp
  push word 14 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L200
  mov dx, g137
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L202: ; Continuation
  Bare_enter_check(14)
  push word g139
  mov si, sp
  push word 2 ;; scanned
  push word [bp+8]
  push word [bp+4]
  push word si
  push word 1
  mov di, sp
  push word 8 ;; scanned
  mov bx, [bp+6]
  mov ax, di
  mov [bx], ax
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L203: ; Continuation
  Bare_enter_check(22)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word L201
  mov si, sp
  push word 8 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word [bp+4]
  push word cx
  push word L202
  mov cx, sp
  push word 10 ;; scanned
  mov bp, si
  mov dx, 1
  jmp [bp]

L204: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L203
  mov cx, sp
  push word 14 ;; scanned
  mov bx, dx
  mov si, [bx+2]
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L205: ; Continuation
  Bare_enter_check(0)
  call Bare_crash
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L206: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L205
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L207: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L206
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L208: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L207
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L209: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L208
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L210: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L209
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L211: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L210
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g3
  mov dx, g119
  jmp [bp]

L212: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L211
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L213: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L212
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L214: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L213
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g118
  jmp [bp]

L215: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L214
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L216: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L215
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L217: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L216
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L218: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L217
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g3
  mov dx, g117
  jmp [bp]

L219: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L218
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L220: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L219
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g116
  jmp [bp]

L221: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L220
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L222: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L221
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L223: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L222
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L224: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L223
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L225: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L224
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g3
  mov dx, g115
  jmp [bp]

L226: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L225
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L227: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L226
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L228: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L227
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g114
  jmp [bp]

L229: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L228
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L230: ; Arm: 88'11
  push word g111
  push word `0`
  push word 3
  mov di, sp
  push word 6 ;; scanned
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L231: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L232: ; Continuation
  Bare_enter_check(6)
  mov ax, 1
  shr ax, 1
  mov bx, [bp+4]
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  push word cx
  push word L231
  mov cx, sp
  push word 4 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L233: ; Arm: 89'13
  push word [bp+8]
  push word cx
  push word L232
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g110
  mov dx, g112
  jmp [bp]

L234: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L235: ; Arm: 157'27
  mov ax, [bp+8]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L229
  mov cx, sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L230
  mov ax, [bp+8]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov di, ax
  mov bx, di
  cmp word [bx], 3
  jz L233
  push word [bp+8]
  push word cx
  push word L234
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g110
  mov dx, g113
  jmp [bp]

L236: ; Arm: 117'16
  mov dx, g135
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L237: ; Continuation
  Bare_enter_check(0)
  mov bx, dx
  cmp word [bx], 3
  jz L236
  mov ax, [bp+6]
  shr ax, 1
  mov bx, [bp+10]
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  mov ax, [bp+4]
  mov bx, si
  shr bx, 1
  call Bare_get_bytes
  mov di, ax
  mov ax, [bp+8]
  mov bx, di
  push word si ;; save
  mov si, [bp+10]
  shr si, 1
  call Bare_set_bytes
  pop word si ;; restore
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, [bp+10]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+8], ax
  mov bp, [bp+12]
  mov dx, [Temps+8]
  jmp [bp]

L238: ; Arm: 13'9
  mov dx, g133
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L239: ; Function: (loop,t3)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1025
  call Bare_make_bool_from_n
  mov si, ax
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L237
  mov cx, sp
  push word 14 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L238
  mov dx, g134
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L240: ; Continuation
  Bare_enter_check(6)
  push word [bp+4]
  push word 1
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L241: ; Continuation
  Bare_enter_check(100)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 1025
  shr bx, 1
  mul bx
  shl ax, 1
  add ax, 1
  mov si, ax
  mov ax, 1025
  call Bare_make_bytes
  mov di, ax
  push word di
  push word si
  push word dx
  push word L239
  mov [Temps+6], sp
  push word 8 ;; scanned
  push word di
  push word cx
  push word L240
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [Temps+6]
  mov dx, 1
  jmp [bp]

L242: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L241
  mov cx, sp
  push word 6 ;; scanned
  mov bx, [bp+6]
  mov si, [bx+2]
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L243: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L242
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L244: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L243
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L245: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L244
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L246: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L245
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L247: ; Continuation
  Bare_enter_check(16)
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L246
  mov cx, sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+12]
  jmp [bp]

L248: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L247
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g3
  mov dx, g132
  jmp [bp]

L249: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L248
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L250: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L249
  mov cx, sp
  push word 14 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L251: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L250
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, g131
  jmp [bp]

L252: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L251
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L253: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L252
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L254: ; Continuation
  Bare_enter_check(16)
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L253
  mov cx, sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+12]
  jmp [bp]

L255: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L254
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g3
  mov dx, g130
  jmp [bp]

L256: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L255
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L257: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L256
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, g129
  jmp [bp]

L258: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L257
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L259: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L258
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L260: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L259
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L261: ; Continuation
  Bare_enter_check(16)
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L260
  mov cx, sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+12]
  jmp [bp]

L262: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L261
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g3
  mov dx, g128
  jmp [bp]

L263: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L262
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L264: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L263
  mov cx, sp
  push word 14 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L265: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L264
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, g127
  jmp [bp]

L266: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L265
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L267: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L266
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L268: ; Continuation
  Bare_enter_check(16)
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L267
  mov cx, sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+12]
  jmp [bp]

L269: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L268
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g3
  mov dx, g126
  jmp [bp]

L270: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L269
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L271: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L270
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, g125
  jmp [bp]

L272: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L271
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L273: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L272
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L274: ; Arm: 88'11
  push word g122
  push word `0`
  push word 3
  mov di, sp
  push word 6 ;; scanned
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L275: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L276: ; Continuation
  Bare_enter_check(6)
  mov ax, 1
  shr ax, 1
  mov bx, [bp+4]
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  push word cx
  push word L275
  mov cx, sp
  push word 4 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L277: ; Arm: 89'13
  push word [bp+8]
  push word cx
  push word L276
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g121
  mov dx, g123
  jmp [bp]

L278: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L279: ; Continuation
  Bare_enter_check(36)
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word cx
  push word L204
  mov cx, sp
  push word 12 ;; scanned
  mov bx, dx
  cmp word [bx], 3
  jz L235
  mov ax, [bp+8]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  push word [bp+14]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L273
  mov cx, sp
  push word 12 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L274
  mov ax, [bp+8]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov di, ax
  mov bx, di
  cmp word [bx], 3
  jz L277
  push word [bp+8]
  push word cx
  push word L278
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g121
  mov dx, g124
  jmp [bp]

L280: ; Arm: 153'34
  mov dx, g107
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L281: ; Arm: 13'9
  mov dx, g108
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L282: ; Continuation
  Bare_enter_check(20)
  mov ax, [bp+8]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov si, ax
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L279
  mov cx, sp
  push word 18 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L280
  mov ax, [bp+8]
  cmp word ax, 65
  call Bare_make_bool_from_n
  mov di, ax
  mov bx, di
  cmp word [bx], 3
  jz L281
  mov dx, g109
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L283: ; Continuation
  Bare_enter_check(0)
  call Bare_crash
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L284: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L283
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L285: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L284
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L286: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L285
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L287: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L286
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L288: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L287
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L289: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L288
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g3
  mov dx, g89
  jmp [bp]

L290: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L289
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L291: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L290
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L292: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L291
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g88
  jmp [bp]

L293: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L292
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L294: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L293
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L295: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L294
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L296: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L295
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g3
  mov dx, g87
  jmp [bp]

L297: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L296
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L298: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L297
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g86
  jmp [bp]

L299: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L298
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L300: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L299
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L301: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L300
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L302: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L301
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L303: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L302
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g3
  mov dx, g85
  jmp [bp]

L304: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L303
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L305: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L304
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L306: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L305
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g84
  jmp [bp]

L307: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L306
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L308: ; Arm: 88'11
  push word g81
  push word `0`
  push word 3
  mov di, sp
  push word 6 ;; scanned
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L309: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L310: ; Continuation
  Bare_enter_check(6)
  mov ax, 1
  shr ax, 1
  mov bx, [bp+4]
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  push word cx
  push word L309
  mov cx, sp
  push word 4 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L311: ; Arm: 89'13
  push word [bp+10]
  push word cx
  push word L310
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g80
  mov dx, g82
  jmp [bp]

L312: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L313: ; Arm: 163'27
  mov ax, [bp+10]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L307
  mov cx, sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L308
  mov ax, [bp+10]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov di, ax
  mov bx, di
  cmp word [bx], 3
  jz L311
  push word [bp+10]
  push word cx
  push word L312
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g80
  mov dx, g83
  jmp [bp]

L314: ; Arm: 128'16
  mov dx, g105
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L315: ; Continuation
  Bare_enter_check(0)
  mov bx, dx
  cmp word [bx], 3
  jz L314
  mov ax, [bp+8]
  mov bx, [bp+10]
  shr bx, 1
  call Bare_get_bytes
  mov si, ax
  mov ax, [bp+6]
  shr ax, 1
  mov bx, [bp+10]
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov di, ax
  mov ax, [bp+4]
  mov bx, si
  push word si ;; save
  mov si, di
  shr si, 1
  call Bare_set_bytes
  pop word si ;; restore
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, [bp+10]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+8], ax
  mov bp, [bp+12]
  mov dx, [Temps+8]
  jmp [bp]

L316: ; Arm: 13'9
  mov dx, g103
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L317: ; Function: (loop,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1025
  call Bare_make_bool_from_n
  mov si, ax
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L315
  mov cx, sp
  push word 14 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L316
  mov dx, g104
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L318: ; Continuation
  Bare_enter_check(10)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word L317
  mov si, sp
  push word 8 ;; scanned
  mov bp, si
  mov dx, 1
  jmp [bp]

L319: ; Continuation
  Bare_enter_check(10)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 1025
  shr bx, 1
  mul bx
  shl ax, 1
  add ax, 1
  mov si, ax
  push word si
  push word dx
  push word cx
  push word L318
  mov cx, sp
  push word 8 ;; scanned
  mov bx, [bp+6]
  mov di, [bx+2]
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L320: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L319
  mov cx, sp
  push word 8 ;; scanned
  mov bx, [bp+4]
  mov si, [bx+2]
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L321: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L320
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L322: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L321
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L323: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L322
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L324: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L323
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L325: ; Continuation
  Bare_enter_check(18)
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L324
  mov cx, sp
  push word 16 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+14]
  jmp [bp]

L326: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L325
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g3
  mov dx, g102
  jmp [bp]

L327: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L326
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L328: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L327
  mov cx, sp
  push word 16 ;; scanned
  mov dx, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L329: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L328
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+6]
  mov dx, g101
  jmp [bp]

L330: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L329
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L331: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L330
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L332: ; Continuation
  Bare_enter_check(18)
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L331
  mov cx, sp
  push word 16 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+14]
  jmp [bp]

L333: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L332
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g3
  mov dx, g100
  jmp [bp]

L334: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L333
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L335: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L334
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+6]
  mov dx, g99
  jmp [bp]

L336: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L335
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L337: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L336
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L338: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L337
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L339: ; Continuation
  Bare_enter_check(18)
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L338
  mov cx, sp
  push word 16 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+14]
  jmp [bp]

L340: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L339
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g3
  mov dx, g98
  jmp [bp]

L341: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L340
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L342: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L341
  mov cx, sp
  push word 16 ;; scanned
  mov dx, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L343: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L342
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+6]
  mov dx, g97
  jmp [bp]

L344: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L343
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L345: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L344
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L346: ; Continuation
  Bare_enter_check(18)
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L345
  mov cx, sp
  push word 16 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+14]
  jmp [bp]

L347: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L346
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g3
  mov dx, g96
  jmp [bp]

L348: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L347
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L349: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L348
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+6]
  mov dx, g95
  jmp [bp]

L350: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L349
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L351: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L350
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L352: ; Arm: 88'11
  push word g92
  push word `0`
  push word 3
  mov di, sp
  push word 6 ;; scanned
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L353: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L354: ; Continuation
  Bare_enter_check(6)
  mov ax, 1
  shr ax, 1
  mov bx, [bp+4]
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  push word cx
  push word L353
  mov cx, sp
  push word 4 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L355: ; Arm: 89'13
  push word [bp+10]
  push word cx
  push word L354
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g91
  mov dx, g93
  jmp [bp]

L356: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L357: ; Continuation
  Bare_enter_check(24)
  mov bx, dx
  cmp word [bx], 3
  jz L313
  mov ax, [bp+10]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L351
  mov cx, sp
  push word 14 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L352
  mov ax, [bp+10]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov di, ax
  mov bx, di
  cmp word [bx], 3
  jz L355
  push word [bp+10]
  push word cx
  push word L356
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g91
  mov dx, g94
  jmp [bp]

L358: ; Arm: 153'34
  mov dx, g77
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L359: ; Arm: 13'9
  mov dx, g78
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L360: ; Arm: 209'29
  mov ax, [Temps+10]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+18], ax
  push word [Temps+12]
  push word [Temps+10]
  push word si
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L357
  mov cx, sp
  push word 14 ;; scanned
  mov bx, [Temps+18]
  cmp word [bx], 3
  jz L358
  mov ax, [Temps+10]
  cmp word ax, 65
  call Bare_make_bool_from_n
  mov [Temps+20], ax
  mov bx, [Temps+20]
  cmp word [bx], 3
  jz L359
  mov dx, g79
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L361: ; Continuation
  Bare_enter_check(36)
  mov bx, [bp+8]
  mov si, [bx+2]
  mov di, [bx+4]
  mov bx, di
  mov ax, [bx]
  mov [Temps+6], ax
  mov bx, [Temps+6]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov ax, [bx+4]
  mov [Temps+10], ax
  mov ax, [bx+6]
  mov [Temps+12], ax
  mov ax, [bp+10]
  cmp word ax, [Temps+10]
  call Bare_make_bool_from_z
  mov [Temps+14], ax
  mov bx, [Temps+14]
  cmp word [bx], 3
  jz L197
  mov bx, [Temps+8]
  mov ax, [bx]
  mov [Temps+16], ax
  push word di
  push word si
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L282
  mov cx, sp
  push word 18 ;; scanned
  mov bx, [Temps+16]
  cmp word [bx], 3
  jz L360
  mov dx, g106
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L362: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L361
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L363: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L362
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+16]
  mov dx, dx
  jmp [bp]

L364: ; Continuation
  Bare_enter_check(20)
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L363
  mov cx, sp
  push word 18 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+16]
  jmp [bp]

L365: ; Continuation
  Bare_enter_check(22)
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L364
  mov cx, sp
  push word 20 ;; scanned
  mov bp, g3
  mov dx, g72
  jmp [bp]

L366: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L365
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L367: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L366
  mov cx, sp
  push word 18 ;; scanned
  mov dx, [bp+16]
  mov bp, [bp+6]
  jmp [bp]

L368: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L367
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+6]
  mov dx, g71
  jmp [bp]

L369: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L368
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L370: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L369
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+16]
  mov dx, dx
  jmp [bp]

L371: ; Continuation
  Bare_enter_check(20)
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L370
  mov cx, sp
  push word 18 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+16]
  jmp [bp]

L372: ; Continuation
  Bare_enter_check(22)
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L371
  mov cx, sp
  push word 20 ;; scanned
  mov bp, g3
  mov dx, g70
  jmp [bp]

L373: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L372
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L374: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L373
  mov cx, sp
  push word 18 ;; scanned
  mov dx, [bp+16]
  mov bp, [bp+6]
  jmp [bp]

L375: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L374
  mov cx, sp
  push word 18 ;; scanned
  mov dx, [bp+16]
  mov bp, [bp+6]
  jmp [bp]

L376: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L375
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L377: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L376
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+18]
  mov dx, dx
  jmp [bp]

L378: ; Continuation
  Bare_enter_check(22)
  push word [bp+20]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L377
  mov cx, sp
  push word 20 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+18]
  jmp [bp]

L379: ; Continuation
  Bare_enter_check(24)
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L378
  mov cx, sp
  push word 22 ;; scanned
  mov bp, g3
  mov dx, g69
  jmp [bp]

L380: ; Continuation
  Bare_enter_check(22)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L379
  mov cx, sp
  push word 20 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L381: ; Continuation
  Bare_enter_check(22)
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L380
  mov cx, sp
  push word 20 ;; scanned
  mov dx, [bp+18]
  mov bp, [bp+6]
  jmp [bp]

L382: ; Continuation
  Bare_enter_check(22)
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L381
  mov cx, sp
  push word 20 ;; scanned
  mov bp, [bp+6]
  mov dx, g68
  jmp [bp]

L383: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L382
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L384: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L383
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+18]
  mov dx, dx
  jmp [bp]

L385: ; Continuation
  Bare_enter_check(22)
  push word [bp+20]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L384
  mov cx, sp
  push word 20 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+18]
  jmp [bp]

L386: ; Continuation
  Bare_enter_check(24)
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L385
  mov cx, sp
  push word 22 ;; scanned
  mov bp, g3
  mov dx, g67
  jmp [bp]

L387: ; Continuation
  Bare_enter_check(22)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L386
  mov cx, sp
  push word 20 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L388: ; Continuation
  Bare_enter_check(22)
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L387
  mov cx, sp
  push word 20 ;; scanned
  mov dx, [bp+18]
  mov bp, [bp+6]
  jmp [bp]

L389: ; Continuation
  Bare_enter_check(22)
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L388
  mov cx, sp
  push word 20 ;; scanned
  mov dx, [bp+18]
  mov bp, [bp+6]
  jmp [bp]

L390: ; Continuation
  Bare_enter_check(22)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L389
  mov cx, sp
  push word 20 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L391: ; Continuation
  Bare_enter_check(22)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L390
  mov cx, sp
  push word 20 ;; scanned
  mov bp, [bp+20]
  mov dx, dx
  jmp [bp]

L392: ; Continuation
  Bare_enter_check(24)
  push word [bp+22]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L391
  mov cx, sp
  push word 22 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+20]
  jmp [bp]

L393: ; Continuation
  Bare_enter_check(26)
  push word dx
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L392
  mov cx, sp
  push word 24 ;; scanned
  mov bp, g3
  mov dx, g66
  jmp [bp]

L394: ; Continuation
  Bare_enter_check(24)
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L393
  mov cx, sp
  push word 22 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L395: ; Continuation
  Bare_enter_check(24)
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L394
  mov cx, sp
  push word 22 ;; scanned
  mov dx, [bp+20]
  mov bp, [bp+6]
  jmp [bp]

L396: ; Continuation
  Bare_enter_check(24)
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L395
  mov cx, sp
  push word 22 ;; scanned
  mov bp, [bp+6]
  mov dx, g65
  jmp [bp]

L397: ; Continuation
  Bare_enter_check(22)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L396
  mov cx, sp
  push word 20 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L398: ; Continuation
  Bare_enter_check(22)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L397
  mov cx, sp
  push word 20 ;; scanned
  mov bp, dx
  mov dx, 129
  jmp [bp]

L399: ; Continuation
  Bare_enter_check(22)
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L398
  mov cx, sp
  push word 20 ;; scanned
  mov bp, g63
  mov dx, g64
  jmp [bp]

L400: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L399
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L401: ; Arm: 88'11
  push word g60
  push word `0`
  push word 3
  mov di, sp
  push word 6 ;; scanned
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L402: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L403: ; Continuation
  Bare_enter_check(6)
  mov ax, 1
  shr ax, 1
  mov bx, [bp+4]
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  push word cx
  push word L402
  mov cx, sp
  push word 4 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L404: ; Arm: 89'13
  push word [bp+12]
  push word cx
  push word L403
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g59
  mov dx, g61
  jmp [bp]

L405: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L406: ; Continuation
  Bare_enter_check(28)
  mov ax, [bp+12]
  cmp word ax, 1
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
  push word L400
  mov cx, sp
  push word 18 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L401
  mov ax, [bp+12]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov di, ax
  mov bx, di
  cmp word [bx], 3
  jz L404
  push word [bp+12]
  push word cx
  push word L405
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g59
  mov dx, g62
  jmp [bp]

L407: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L406
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L408: ; Arm: 88'11
  push word g56
  push word `0`
  push word 3
  mov di, sp
  push word 6 ;; scanned
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L409: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L410: ; Continuation
  Bare_enter_check(6)
  mov ax, 1
  shr ax, 1
  mov bx, [bp+4]
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  push word cx
  push word L409
  mov cx, sp
  push word 4 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L411: ; Arm: 89'13
  push word [bp+10]
  push word cx
  push word L410
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g55
  mov dx, g57
  jmp [bp]

L412: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L413: ; Continuation
  Bare_enter_check(26)
  mov ax, [bp+10]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L407
  mov cx, sp
  push word 16 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L408
  mov ax, [bp+10]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov di, ax
  mov bx, di
  cmp word [bx], 3
  jz L411
  push word [bp+10]
  push word cx
  push word L412
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g55
  mov dx, g58
  jmp [bp]

L414: ; Continuation
  Bare_enter_check(16)
  mov ax, [bp+10]
  shr ax, 1
  mov bx, 17
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov si, dx
  pop word dx ;; restore
  mov ax, 129
  shr ax, 1
  shr si, 1
  mul si
  shl ax, 1
  add ax, 1
  mov di, ax
  push word di
  push word [bp+14]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L413
  mov cx, sp
  push word 14 ;; scanned
  mov bx, [bp+12]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L415: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L414
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L416: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L415
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+16]
  mov dx, dx
  jmp [bp]

L417: ; Continuation
  Bare_enter_check(20)
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L416
  mov cx, sp
  push word 18 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+16]
  jmp [bp]

L418: ; Continuation
  Bare_enter_check(22)
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L417
  mov cx, sp
  push word 20 ;; scanned
  mov bp, g3
  mov dx, g54
  jmp [bp]

L419: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L418
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L420: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L419
  mov cx, sp
  push word 18 ;; scanned
  mov dx, [bp+16]
  mov bp, [bp+6]
  jmp [bp]

L421: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L420
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+6]
  mov dx, g53
  jmp [bp]

L422: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L421
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L423: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L422
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+16]
  mov dx, dx
  jmp [bp]

L424: ; Continuation
  Bare_enter_check(20)
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L423
  mov cx, sp
  push word 18 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+16]
  jmp [bp]

L425: ; Continuation
  Bare_enter_check(22)
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L424
  mov cx, sp
  push word 20 ;; scanned
  mov bp, g3
  mov dx, g52
  jmp [bp]

L426: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L425
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L427: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L426
  mov cx, sp
  push word 18 ;; scanned
  mov dx, [bp+16]
  mov bp, [bp+6]
  jmp [bp]

L428: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L427
  mov cx, sp
  push word 18 ;; scanned
  mov dx, [bp+16]
  mov bp, [bp+6]
  jmp [bp]

L429: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L428
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L430: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L429
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+18]
  mov dx, dx
  jmp [bp]

L431: ; Continuation
  Bare_enter_check(22)
  push word [bp+20]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L430
  mov cx, sp
  push word 20 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+18]
  jmp [bp]

L432: ; Continuation
  Bare_enter_check(24)
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L431
  mov cx, sp
  push word 22 ;; scanned
  mov bp, g3
  mov dx, g51
  jmp [bp]

L433: ; Continuation
  Bare_enter_check(22)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L432
  mov cx, sp
  push word 20 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L434: ; Continuation
  Bare_enter_check(22)
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L433
  mov cx, sp
  push word 20 ;; scanned
  mov dx, [bp+18]
  mov bp, [bp+6]
  jmp [bp]

L435: ; Continuation
  Bare_enter_check(22)
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L434
  mov cx, sp
  push word 20 ;; scanned
  mov bp, [bp+6]
  mov dx, g50
  jmp [bp]

L436: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L435
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L437: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L436
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+18]
  mov dx, dx
  jmp [bp]

L438: ; Continuation
  Bare_enter_check(22)
  push word [bp+20]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L437
  mov cx, sp
  push word 20 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+18]
  jmp [bp]

L439: ; Continuation
  Bare_enter_check(24)
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L438
  mov cx, sp
  push word 22 ;; scanned
  mov bp, g3
  mov dx, g49
  jmp [bp]

L440: ; Continuation
  Bare_enter_check(22)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L439
  mov cx, sp
  push word 20 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L441: ; Continuation
  Bare_enter_check(22)
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L440
  mov cx, sp
  push word 20 ;; scanned
  mov bp, [bp+6]
  mov dx, g48
  jmp [bp]

L442: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L441
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L443: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L442
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L444: ; Arm: 88'11
  push word g45
  push word `0`
  push word 3
  mov di, sp
  push word 6 ;; scanned
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L445: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L446: ; Continuation
  Bare_enter_check(6)
  mov ax, 1
  shr ax, 1
  mov bx, [bp+4]
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  push word cx
  push word L445
  mov cx, sp
  push word 4 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L447: ; Arm: 89'13
  push word [bp+14]
  push word cx
  push word L446
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g44
  mov dx, g46
  jmp [bp]

L448: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L449: ; Continuation
  Bare_enter_check(28)
  mov ax, [bp+14]
  cmp word ax, 1
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
  push word L443
  mov cx, sp
  push word 18 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L444
  mov ax, [bp+14]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov di, ax
  mov bx, di
  cmp word [bx], 3
  jz L447
  push word [bp+14]
  push word cx
  push word L448
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g44
  mov dx, g47
  jmp [bp]

L450: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L449
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L451: ; Arm: 88'11
  push word g41
  push word `0`
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L452: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L453: ; Continuation
  Bare_enter_check(6)
  mov ax, 1
  shr ax, 1
  mov bx, [bp+4]
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  push word cx
  push word L452
  mov cx, sp
  push word 4 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L454: ; Arm: 89'13
  push word [bp+10]
  push word cx
  push word L453
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g40
  mov dx, g42
  jmp [bp]

L455: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L456: ; Continuation
  Bare_enter_check(36)
  push word [bp+12]
  push word [bp+10]
  push word cx
  push word L159
  mov cx, sp
  push word 8 ;; scanned
  mov bx, dx
  cmp word [bx], 3
  jz L190
  mov ax, [bp+10]
  shr ax, 1
  mov bx, 17
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov si, ax
  mov ax, [bp+10]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov di, ax
  push word si
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L450
  mov cx, sp
  push word 16 ;; scanned
  mov bx, di
  cmp word [bx], 3
  jz L451
  mov ax, [bp+10]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+6], ax
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L454
  push word [bp+10]
  push word cx
  push word L455
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g40
  mov dx, g43
  jmp [bp]

L457: ; Arm: 228'33
  mov dx, g26
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L458: ; Arm: 13'9
  mov dx, g27
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L459: ; Continuation
  Bare_enter_check(24)
  mov si, dx
  push word si
  push word 1
  mov di, sp
  push word 4 ;; scanned
  mov ax, [bp+10]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+6], ax
  push word di
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L456
  mov cx, sp
  push word 16 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L457
  mov ax, [bp+10]
  cmp word ax, 513
  call Bare_make_bool_from_n
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L458
  mov dx, g28
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L460: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L459
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L461: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L460
  mov cx, sp
  push word 14 ;; scanned
  mov bp, dx
  mov dx, 129
  jmp [bp]

L462: ; Function: (loop,t6)
  Bare_enter_check(22)
  mov ax, 249
  cmp word ax, dx
  call Bare_make_bool_from_n
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L154
  mov ax, dx
  shr ax, 1
  mov bx, 21
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov di, dx
  pop word dx ;; restore
  mov ax, 97
  shr ax, 1
  mov bx, di
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  shr ax, 1
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [Temps+8]
  push word L158
  mov [Temps+10], sp
  push word 4 ;; scanned
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L461
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [Temps+10]
  mov dx, g25
  jmp [bp]

L463: ; Arm: 263'16
  mov dx, g140
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L464: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  mov bp, [bp+6]
  mov dx, si
  jmp [bp]

L465: ; Continuation
  Bare_enter_check(0)
  call Bare_crash
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L466: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L465
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L467: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L466
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L468: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L467
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L469: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L468
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L470: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L469
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L471: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L470
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g3
  mov dx, g155
  jmp [bp]

L472: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L471
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L473: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L472
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L474: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L473
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g154
  jmp [bp]

L475: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L474
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L476: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L475
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L477: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L476
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L478: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L477
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g3
  mov dx, g153
  jmp [bp]

L479: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L478
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L480: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L479
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g152
  jmp [bp]

L481: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L480
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L482: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L481
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L483: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L482
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L484: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L483
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L485: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L484
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g3
  mov dx, g151
  jmp [bp]

L486: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L485
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L487: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L486
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L488: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L487
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g150
  jmp [bp]

L489: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L488
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L490: ; Arm: 88'11
  push word g147
  push word `0`
  push word 3
  mov di, sp
  push word 6 ;; scanned
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L491: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L492: ; Continuation
  Bare_enter_check(6)
  mov ax, 1
  shr ax, 1
  mov bx, [bp+4]
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  push word cx
  push word L491
  mov cx, sp
  push word 4 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L493: ; Arm: 89'13
  push word [bp+10]
  push word cx
  push word L492
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g146
  mov dx, g148
  jmp [bp]

L494: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L495: ; Arm: 243'23
  mov ax, [bp+10]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L489
  mov cx, sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L490
  mov ax, [bp+10]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov di, ax
  mov bx, di
  cmp word [bx], 3
  jz L493
  push word [bp+10]
  push word cx
  push word L494
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g146
  mov dx, g149
  jmp [bp]

L496: ; Arm: 128'16
  mov dx, g192
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L497: ; Continuation
  Bare_enter_check(0)
  mov bx, dx
  cmp word [bx], 3
  jz L496
  mov ax, [bp+6]
  mov bx, [bp+10]
  shr bx, 1
  call Bare_get_bytes
  mov si, ax
  mov ax, [bp+4]
  shr ax, 1
  mov bx, [bp+10]
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov di, ax
  mov ax, [bp+8]
  mov bx, si
  push word si ;; save
  mov si, di
  shr si, 1
  call Bare_set_bytes
  pop word si ;; restore
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, [bp+10]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+8], ax
  mov bp, [bp+12]
  mov dx, [Temps+8]
  jmp [bp]

L498: ; Arm: 13'9
  mov dx, g190
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L499: ; Function: (loop,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 129
  call Bare_make_bool_from_n
  mov si, ax
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L497
  mov cx, sp
  push word 14 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L498
  mov dx, g191
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L500: ; Continuation
  Bare_enter_check(0)
  mov bx, [bp+4]
  mov ax, g193
  mov [bx], ax
  mov si, Bare_unit
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L501: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word L499
  mov si, sp
  push word 8 ;; scanned
  push word [bp+8]
  push word cx
  push word L500
  mov cx, sp
  push word 6 ;; scanned
  mov bp, si
  mov dx, 1
  jmp [bp]

L502: ; Arm: 205'23
  push word [Temps+8]
  push word [bp+14]
  push word [bp+12]
  push word cx
  push word L501
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [Temps+12]
  mov ax, [bx+2]
  mov [Temps+16], ax
  mov dx, [Temps+16]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L503: ; Arm: 128'16
  mov dx, g255
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L504: ; Continuation
  Bare_enter_check(0)
  mov bx, dx
  cmp word [bx], 3
  jz L503
  mov ax, [bp+6]
  mov bx, [bp+10]
  shr bx, 1
  call Bare_get_bytes
  mov si, ax
  mov ax, [bp+4]
  shr ax, 1
  mov bx, [bp+10]
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov di, ax
  mov ax, [bp+8]
  mov bx, si
  push word si ;; save
  mov si, di
  shr si, 1
  call Bare_set_bytes
  pop word si ;; restore
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, [bp+10]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+8], ax
  mov bp, [bp+12]
  mov dx, [Temps+8]
  jmp [bp]

L505: ; Arm: 13'9
  mov dx, g253
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L506: ; Function: (loop,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 129
  call Bare_make_bool_from_n
  mov si, ax
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L504
  mov cx, sp
  push word 14 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L505
  mov dx, g254
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L507: ; Continuation
  Bare_enter_check(14)
  push word g256
  mov si, sp
  push word 2 ;; scanned
  push word [bp+8]
  push word [bp+4]
  push word si
  push word 1
  mov di, sp
  push word 8 ;; scanned
  mov bx, [bp+6]
  mov ax, di
  mov [bx], ax
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L508: ; Continuation
  Bare_enter_check(22)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word L506
  mov si, sp
  push word 8 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word [bp+4]
  push word cx
  push word L507
  mov cx, sp
  push word 10 ;; scanned
  mov bp, si
  mov dx, 1
  jmp [bp]

L509: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L508
  mov cx, sp
  push word 14 ;; scanned
  mov bx, dx
  mov si, [bx+2]
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L510: ; Continuation
  Bare_enter_check(0)
  call Bare_crash
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L511: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L510
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L512: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L511
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L513: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L512
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L514: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L513
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L515: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L514
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L516: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L515
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g3
  mov dx, g236
  jmp [bp]

L517: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L516
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L518: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L517
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L519: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L518
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g235
  jmp [bp]

L520: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L519
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L521: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L520
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L522: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L521
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L523: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L522
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g3
  mov dx, g234
  jmp [bp]

L524: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L523
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L525: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L524
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g233
  jmp [bp]

L526: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L525
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L527: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L526
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L528: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L527
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L529: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L528
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L530: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L529
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g3
  mov dx, g232
  jmp [bp]

L531: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L530
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L532: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L531
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L533: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L532
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g231
  jmp [bp]

L534: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L533
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L535: ; Arm: 88'11
  push word g228
  push word `0`
  push word 3
  mov di, sp
  push word 6 ;; scanned
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L536: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L537: ; Continuation
  Bare_enter_check(6)
  mov ax, 1
  shr ax, 1
  mov bx, [bp+4]
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  push word cx
  push word L536
  mov cx, sp
  push word 4 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L538: ; Arm: 89'13
  push word [bp+8]
  push word cx
  push word L537
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g227
  mov dx, g229
  jmp [bp]

L539: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L540: ; Arm: 157'27
  mov ax, [bp+8]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L534
  mov cx, sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L535
  mov ax, [bp+8]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov di, ax
  mov bx, di
  cmp word [bx], 3
  jz L538
  push word [bp+8]
  push word cx
  push word L539
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g227
  mov dx, g230
  jmp [bp]

L541: ; Arm: 117'16
  mov dx, g252
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L542: ; Continuation
  Bare_enter_check(0)
  mov bx, dx
  cmp word [bx], 3
  jz L541
  mov ax, [bp+6]
  shr ax, 1
  mov bx, [bp+10]
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  mov ax, [bp+4]
  mov bx, si
  shr bx, 1
  call Bare_get_bytes
  mov di, ax
  mov ax, [bp+8]
  mov bx, di
  push word si ;; save
  mov si, [bp+10]
  shr si, 1
  call Bare_set_bytes
  pop word si ;; restore
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, [bp+10]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+8], ax
  mov bp, [bp+12]
  mov dx, [Temps+8]
  jmp [bp]

L543: ; Arm: 13'9
  mov dx, g250
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L544: ; Function: (loop,t3)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1025
  call Bare_make_bool_from_n
  mov si, ax
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L542
  mov cx, sp
  push word 14 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L543
  mov dx, g251
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L545: ; Continuation
  Bare_enter_check(6)
  push word [bp+4]
  push word 1
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L546: ; Continuation
  Bare_enter_check(100)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 1025
  shr bx, 1
  mul bx
  shl ax, 1
  add ax, 1
  mov si, ax
  mov ax, 1025
  call Bare_make_bytes
  mov di, ax
  push word di
  push word si
  push word dx
  push word L544
  mov [Temps+6], sp
  push word 8 ;; scanned
  push word di
  push word cx
  push word L545
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [Temps+6]
  mov dx, 1
  jmp [bp]

L547: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L546
  mov cx, sp
  push word 6 ;; scanned
  mov bx, [bp+6]
  mov si, [bx+2]
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L548: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L547
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L549: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L548
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L550: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L549
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L551: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L550
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L552: ; Continuation
  Bare_enter_check(16)
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L551
  mov cx, sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+12]
  jmp [bp]

L553: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L552
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g3
  mov dx, g249
  jmp [bp]

L554: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L553
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L555: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L554
  mov cx, sp
  push word 14 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L556: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L555
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, g248
  jmp [bp]

L557: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L556
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L558: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L557
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L559: ; Continuation
  Bare_enter_check(16)
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L558
  mov cx, sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+12]
  jmp [bp]

L560: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L559
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g3
  mov dx, g247
  jmp [bp]

L561: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L560
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L562: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L561
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, g246
  jmp [bp]

L563: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L562
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L564: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L563
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L565: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L564
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L566: ; Continuation
  Bare_enter_check(16)
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L565
  mov cx, sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+12]
  jmp [bp]

L567: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L566
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g3
  mov dx, g245
  jmp [bp]

L568: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L567
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L569: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L568
  mov cx, sp
  push word 14 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L570: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L569
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, g244
  jmp [bp]

L571: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L570
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L572: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L571
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L573: ; Continuation
  Bare_enter_check(16)
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L572
  mov cx, sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+12]
  jmp [bp]

L574: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L573
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g3
  mov dx, g243
  jmp [bp]

L575: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L574
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L576: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L575
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, g242
  jmp [bp]

L577: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L576
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L578: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L577
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L579: ; Arm: 88'11
  push word g239
  push word `0`
  push word 3
  mov di, sp
  push word 6 ;; scanned
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L580: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L581: ; Continuation
  Bare_enter_check(6)
  mov ax, 1
  shr ax, 1
  mov bx, [bp+4]
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  push word cx
  push word L580
  mov cx, sp
  push word 4 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L582: ; Arm: 89'13
  push word [bp+8]
  push word cx
  push word L581
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g238
  mov dx, g240
  jmp [bp]

L583: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L584: ; Continuation
  Bare_enter_check(36)
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word cx
  push word L509
  mov cx, sp
  push word 12 ;; scanned
  mov bx, dx
  cmp word [bx], 3
  jz L540
  mov ax, [bp+8]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  push word [bp+14]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L578
  mov cx, sp
  push word 12 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L579
  mov ax, [bp+8]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov di, ax
  mov bx, di
  cmp word [bx], 3
  jz L582
  push word [bp+8]
  push word cx
  push word L583
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g238
  mov dx, g241
  jmp [bp]

L585: ; Arm: 153'34
  mov dx, g224
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L586: ; Arm: 13'9
  mov dx, g225
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L587: ; Continuation
  Bare_enter_check(20)
  mov ax, [bp+8]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov si, ax
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L584
  mov cx, sp
  push word 18 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L585
  mov ax, [bp+8]
  cmp word ax, 65
  call Bare_make_bool_from_n
  mov di, ax
  mov bx, di
  cmp word [bx], 3
  jz L586
  mov dx, g226
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L588: ; Continuation
  Bare_enter_check(0)
  call Bare_crash
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L589: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L588
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L590: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L589
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L591: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L590
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L592: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L591
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L593: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L592
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L594: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L593
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g3
  mov dx, g206
  jmp [bp]

L595: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L594
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L596: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L595
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L597: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L596
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g205
  jmp [bp]

L598: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L597
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L599: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L598
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L600: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L599
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L601: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L600
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g3
  mov dx, g204
  jmp [bp]

L602: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L601
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L603: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L602
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g203
  jmp [bp]

L604: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L603
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L605: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L604
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L606: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L605
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L607: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L606
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L608: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L607
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g3
  mov dx, g202
  jmp [bp]

L609: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L608
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L610: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L609
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L611: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L610
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g201
  jmp [bp]

L612: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L611
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L613: ; Arm: 88'11
  push word g198
  push word `0`
  push word 3
  mov di, sp
  push word 6 ;; scanned
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L614: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L615: ; Continuation
  Bare_enter_check(6)
  mov ax, 1
  shr ax, 1
  mov bx, [bp+4]
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  push word cx
  push word L614
  mov cx, sp
  push word 4 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L616: ; Arm: 89'13
  push word [bp+10]
  push word cx
  push word L615
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g197
  mov dx, g199
  jmp [bp]

L617: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L618: ; Arm: 163'27
  mov ax, [bp+10]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L612
  mov cx, sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L613
  mov ax, [bp+10]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov di, ax
  mov bx, di
  cmp word [bx], 3
  jz L616
  push word [bp+10]
  push word cx
  push word L617
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g197
  mov dx, g200
  jmp [bp]

L619: ; Arm: 128'16
  mov dx, g222
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L620: ; Continuation
  Bare_enter_check(0)
  mov bx, dx
  cmp word [bx], 3
  jz L619
  mov ax, [bp+8]
  mov bx, [bp+10]
  shr bx, 1
  call Bare_get_bytes
  mov si, ax
  mov ax, [bp+6]
  shr ax, 1
  mov bx, [bp+10]
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov di, ax
  mov ax, [bp+4]
  mov bx, si
  push word si ;; save
  mov si, di
  shr si, 1
  call Bare_set_bytes
  pop word si ;; restore
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, [bp+10]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+8], ax
  mov bp, [bp+12]
  mov dx, [Temps+8]
  jmp [bp]

L621: ; Arm: 13'9
  mov dx, g220
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L622: ; Function: (loop,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1025
  call Bare_make_bool_from_n
  mov si, ax
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L620
  mov cx, sp
  push word 14 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L621
  mov dx, g221
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L623: ; Continuation
  Bare_enter_check(10)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word L622
  mov si, sp
  push word 8 ;; scanned
  mov bp, si
  mov dx, 1
  jmp [bp]

L624: ; Continuation
  Bare_enter_check(10)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 1025
  shr bx, 1
  mul bx
  shl ax, 1
  add ax, 1
  mov si, ax
  push word si
  push word dx
  push word cx
  push word L623
  mov cx, sp
  push word 8 ;; scanned
  mov bx, [bp+6]
  mov di, [bx+2]
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L625: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L624
  mov cx, sp
  push word 8 ;; scanned
  mov bx, [bp+4]
  mov si, [bx+2]
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L626: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L625
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L627: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L626
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L628: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L627
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L629: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L628
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L630: ; Continuation
  Bare_enter_check(18)
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L629
  mov cx, sp
  push word 16 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+14]
  jmp [bp]

L631: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L630
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g3
  mov dx, g219
  jmp [bp]

L632: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L631
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L633: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L632
  mov cx, sp
  push word 16 ;; scanned
  mov dx, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L634: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L633
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+6]
  mov dx, g218
  jmp [bp]

L635: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L634
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L636: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L635
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L637: ; Continuation
  Bare_enter_check(18)
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L636
  mov cx, sp
  push word 16 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+14]
  jmp [bp]

L638: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L637
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g3
  mov dx, g217
  jmp [bp]

L639: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L638
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L640: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L639
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+6]
  mov dx, g216
  jmp [bp]

L641: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L640
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L642: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L641
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L643: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L642
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L644: ; Continuation
  Bare_enter_check(18)
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L643
  mov cx, sp
  push word 16 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+14]
  jmp [bp]

L645: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L644
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g3
  mov dx, g215
  jmp [bp]

L646: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L645
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L647: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L646
  mov cx, sp
  push word 16 ;; scanned
  mov dx, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L648: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L647
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+6]
  mov dx, g214
  jmp [bp]

L649: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L648
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L650: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L649
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L651: ; Continuation
  Bare_enter_check(18)
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L650
  mov cx, sp
  push word 16 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+14]
  jmp [bp]

L652: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L651
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g3
  mov dx, g213
  jmp [bp]

L653: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L652
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L654: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L653
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+6]
  mov dx, g212
  jmp [bp]

L655: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L654
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L656: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L655
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L657: ; Arm: 88'11
  push word g209
  push word `0`
  push word 3
  mov di, sp
  push word 6 ;; scanned
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L658: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L659: ; Continuation
  Bare_enter_check(6)
  mov ax, 1
  shr ax, 1
  mov bx, [bp+4]
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  push word cx
  push word L658
  mov cx, sp
  push word 4 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L660: ; Arm: 89'13
  push word [bp+10]
  push word cx
  push word L659
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g208
  mov dx, g210
  jmp [bp]

L661: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L662: ; Continuation
  Bare_enter_check(24)
  mov bx, dx
  cmp word [bx], 3
  jz L618
  mov ax, [bp+10]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L656
  mov cx, sp
  push word 14 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L657
  mov ax, [bp+10]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov di, ax
  mov bx, di
  cmp word [bx], 3
  jz L660
  push word [bp+10]
  push word cx
  push word L661
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g208
  mov dx, g211
  jmp [bp]

L663: ; Arm: 153'34
  mov dx, g194
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L664: ; Arm: 13'9
  mov dx, g195
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L665: ; Arm: 209'29
  mov ax, [Temps+10]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+18], ax
  push word [Temps+12]
  push word [Temps+10]
  push word si
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L662
  mov cx, sp
  push word 14 ;; scanned
  mov bx, [Temps+18]
  cmp word [bx], 3
  jz L663
  mov ax, [Temps+10]
  cmp word ax, 65
  call Bare_make_bool_from_n
  mov [Temps+20], ax
  mov bx, [Temps+20]
  cmp word [bx], 3
  jz L664
  mov dx, g196
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L666: ; Continuation
  Bare_enter_check(36)
  mov bx, [bp+8]
  mov si, [bx+2]
  mov di, [bx+4]
  mov bx, di
  mov ax, [bx]
  mov [Temps+6], ax
  mov bx, [Temps+6]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov ax, [bx+4]
  mov [Temps+10], ax
  mov ax, [bx+6]
  mov [Temps+12], ax
  mov ax, [bp+10]
  cmp word ax, [Temps+10]
  call Bare_make_bool_from_z
  mov [Temps+14], ax
  mov bx, [Temps+14]
  cmp word [bx], 3
  jz L502
  mov bx, [Temps+8]
  mov ax, [bx]
  mov [Temps+16], ax
  push word di
  push word si
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L587
  mov cx, sp
  push word 18 ;; scanned
  mov bx, [Temps+16]
  cmp word [bx], 3
  jz L665
  mov dx, g223
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L667: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L666
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L668: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L667
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+16]
  mov dx, dx
  jmp [bp]

L669: ; Continuation
  Bare_enter_check(20)
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L668
  mov cx, sp
  push word 18 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+16]
  jmp [bp]

L670: ; Continuation
  Bare_enter_check(22)
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L669
  mov cx, sp
  push word 20 ;; scanned
  mov bp, g3
  mov dx, g189
  jmp [bp]

L671: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L670
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L672: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L671
  mov cx, sp
  push word 18 ;; scanned
  mov dx, [bp+16]
  mov bp, [bp+6]
  jmp [bp]

L673: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L672
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+6]
  mov dx, g188
  jmp [bp]

L674: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L673
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L675: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L674
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+16]
  mov dx, dx
  jmp [bp]

L676: ; Continuation
  Bare_enter_check(20)
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L675
  mov cx, sp
  push word 18 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+16]
  jmp [bp]

L677: ; Continuation
  Bare_enter_check(22)
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L676
  mov cx, sp
  push word 20 ;; scanned
  mov bp, g3
  mov dx, g187
  jmp [bp]

L678: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L677
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L679: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L678
  mov cx, sp
  push word 18 ;; scanned
  mov dx, [bp+16]
  mov bp, [bp+6]
  jmp [bp]

L680: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L679
  mov cx, sp
  push word 18 ;; scanned
  mov dx, [bp+16]
  mov bp, [bp+6]
  jmp [bp]

L681: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L680
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L682: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L681
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+18]
  mov dx, dx
  jmp [bp]

L683: ; Continuation
  Bare_enter_check(22)
  push word [bp+20]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L682
  mov cx, sp
  push word 20 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+18]
  jmp [bp]

L684: ; Continuation
  Bare_enter_check(24)
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L683
  mov cx, sp
  push word 22 ;; scanned
  mov bp, g3
  mov dx, g186
  jmp [bp]

L685: ; Continuation
  Bare_enter_check(22)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L684
  mov cx, sp
  push word 20 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L686: ; Continuation
  Bare_enter_check(22)
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L685
  mov cx, sp
  push word 20 ;; scanned
  mov dx, [bp+18]
  mov bp, [bp+6]
  jmp [bp]

L687: ; Continuation
  Bare_enter_check(22)
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L686
  mov cx, sp
  push word 20 ;; scanned
  mov bp, [bp+6]
  mov dx, g185
  jmp [bp]

L688: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L687
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L689: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L688
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+18]
  mov dx, dx
  jmp [bp]

L690: ; Continuation
  Bare_enter_check(22)
  push word [bp+20]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L689
  mov cx, sp
  push word 20 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+18]
  jmp [bp]

L691: ; Continuation
  Bare_enter_check(24)
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L690
  mov cx, sp
  push word 22 ;; scanned
  mov bp, g3
  mov dx, g184
  jmp [bp]

L692: ; Continuation
  Bare_enter_check(22)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L691
  mov cx, sp
  push word 20 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L693: ; Continuation
  Bare_enter_check(22)
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L692
  mov cx, sp
  push word 20 ;; scanned
  mov dx, [bp+18]
  mov bp, [bp+6]
  jmp [bp]

L694: ; Continuation
  Bare_enter_check(22)
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L693
  mov cx, sp
  push word 20 ;; scanned
  mov dx, [bp+18]
  mov bp, [bp+6]
  jmp [bp]

L695: ; Continuation
  Bare_enter_check(22)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L694
  mov cx, sp
  push word 20 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L696: ; Continuation
  Bare_enter_check(22)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L695
  mov cx, sp
  push word 20 ;; scanned
  mov bp, [bp+20]
  mov dx, dx
  jmp [bp]

L697: ; Continuation
  Bare_enter_check(24)
  push word [bp+22]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L696
  mov cx, sp
  push word 22 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+20]
  jmp [bp]

L698: ; Continuation
  Bare_enter_check(26)
  push word dx
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L697
  mov cx, sp
  push word 24 ;; scanned
  mov bp, g3
  mov dx, g183
  jmp [bp]

L699: ; Continuation
  Bare_enter_check(24)
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L698
  mov cx, sp
  push word 22 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L700: ; Continuation
  Bare_enter_check(24)
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L699
  mov cx, sp
  push word 22 ;; scanned
  mov dx, [bp+20]
  mov bp, [bp+6]
  jmp [bp]

L701: ; Continuation
  Bare_enter_check(24)
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L700
  mov cx, sp
  push word 22 ;; scanned
  mov bp, [bp+6]
  mov dx, g182
  jmp [bp]

L702: ; Continuation
  Bare_enter_check(22)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L701
  mov cx, sp
  push word 20 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L703: ; Continuation
  Bare_enter_check(22)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L702
  mov cx, sp
  push word 20 ;; scanned
  mov bp, dx
  mov dx, 129
  jmp [bp]

L704: ; Continuation
  Bare_enter_check(22)
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L703
  mov cx, sp
  push word 20 ;; scanned
  mov bp, g180
  mov dx, g181
  jmp [bp]

L705: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L704
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L706: ; Arm: 88'11
  push word g177
  push word `0`
  push word 3
  mov di, sp
  push word 6 ;; scanned
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L707: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L708: ; Continuation
  Bare_enter_check(6)
  mov ax, 1
  shr ax, 1
  mov bx, [bp+4]
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  push word cx
  push word L707
  mov cx, sp
  push word 4 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L709: ; Arm: 89'13
  push word [bp+12]
  push word cx
  push word L708
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g176
  mov dx, g178
  jmp [bp]

L710: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L711: ; Continuation
  Bare_enter_check(28)
  mov ax, [bp+12]
  cmp word ax, 1
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
  push word L705
  mov cx, sp
  push word 18 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L706
  mov ax, [bp+12]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov di, ax
  mov bx, di
  cmp word [bx], 3
  jz L709
  push word [bp+12]
  push word cx
  push word L710
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g176
  mov dx, g179
  jmp [bp]

L712: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L711
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L713: ; Arm: 88'11
  push word g173
  push word `0`
  push word 3
  mov di, sp
  push word 6 ;; scanned
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L714: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L715: ; Continuation
  Bare_enter_check(6)
  mov ax, 1
  shr ax, 1
  mov bx, [bp+4]
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  push word cx
  push word L714
  mov cx, sp
  push word 4 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L716: ; Arm: 89'13
  push word [bp+10]
  push word cx
  push word L715
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g172
  mov dx, g174
  jmp [bp]

L717: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L718: ; Continuation
  Bare_enter_check(26)
  mov ax, [bp+10]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L712
  mov cx, sp
  push word 16 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L713
  mov ax, [bp+10]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov di, ax
  mov bx, di
  cmp word [bx], 3
  jz L716
  push word [bp+10]
  push word cx
  push word L717
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g172
  mov dx, g175
  jmp [bp]

L719: ; Continuation
  Bare_enter_check(16)
  mov ax, [bp+10]
  shr ax, 1
  mov bx, 17
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov si, dx
  pop word dx ;; restore
  mov ax, 129
  shr ax, 1
  shr si, 1
  mul si
  shl ax, 1
  add ax, 1
  mov di, ax
  push word di
  push word [bp+14]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L718
  mov cx, sp
  push word 14 ;; scanned
  mov bx, [bp+12]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L720: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L719
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L721: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L720
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+16]
  mov dx, dx
  jmp [bp]

L722: ; Continuation
  Bare_enter_check(20)
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L721
  mov cx, sp
  push word 18 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+16]
  jmp [bp]

L723: ; Continuation
  Bare_enter_check(22)
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L722
  mov cx, sp
  push word 20 ;; scanned
  mov bp, g3
  mov dx, g171
  jmp [bp]

L724: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L723
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L725: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L724
  mov cx, sp
  push word 18 ;; scanned
  mov dx, [bp+16]
  mov bp, [bp+6]
  jmp [bp]

L726: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L725
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+6]
  mov dx, g170
  jmp [bp]

L727: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L726
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L728: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L727
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+16]
  mov dx, dx
  jmp [bp]

L729: ; Continuation
  Bare_enter_check(20)
  push word [bp+18]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L728
  mov cx, sp
  push word 18 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+16]
  jmp [bp]

L730: ; Continuation
  Bare_enter_check(22)
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L729
  mov cx, sp
  push word 20 ;; scanned
  mov bp, g3
  mov dx, g169
  jmp [bp]

L731: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L730
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L732: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L731
  mov cx, sp
  push word 18 ;; scanned
  mov dx, [bp+16]
  mov bp, [bp+6]
  jmp [bp]

L733: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L732
  mov cx, sp
  push word 18 ;; scanned
  mov dx, [bp+16]
  mov bp, [bp+6]
  jmp [bp]

L734: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L733
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L735: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L734
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+18]
  mov dx, dx
  jmp [bp]

L736: ; Continuation
  Bare_enter_check(22)
  push word [bp+20]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L735
  mov cx, sp
  push word 20 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+18]
  jmp [bp]

L737: ; Continuation
  Bare_enter_check(24)
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L736
  mov cx, sp
  push word 22 ;; scanned
  mov bp, g3
  mov dx, g168
  jmp [bp]

L738: ; Continuation
  Bare_enter_check(22)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L737
  mov cx, sp
  push word 20 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L739: ; Continuation
  Bare_enter_check(22)
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L738
  mov cx, sp
  push word 20 ;; scanned
  mov dx, [bp+18]
  mov bp, [bp+6]
  jmp [bp]

L740: ; Continuation
  Bare_enter_check(22)
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L739
  mov cx, sp
  push word 20 ;; scanned
  mov bp, [bp+6]
  mov dx, g167
  jmp [bp]

L741: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L740
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L742: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L741
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+18]
  mov dx, dx
  jmp [bp]

L743: ; Continuation
  Bare_enter_check(22)
  push word [bp+20]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L742
  mov cx, sp
  push word 20 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+18]
  jmp [bp]

L744: ; Continuation
  Bare_enter_check(24)
  push word dx
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L743
  mov cx, sp
  push word 22 ;; scanned
  mov bp, g3
  mov dx, g166
  jmp [bp]

L745: ; Continuation
  Bare_enter_check(22)
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L744
  mov cx, sp
  push word 20 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L746: ; Continuation
  Bare_enter_check(22)
  push word dx
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L745
  mov cx, sp
  push word 20 ;; scanned
  mov bp, [bp+6]
  mov dx, g165
  jmp [bp]

L747: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L746
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L748: ; Continuation
  Bare_enter_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L747
  mov cx, sp
  push word 18 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L749: ; Arm: 88'11
  push word g162
  push word `0`
  push word 3
  mov di, sp
  push word 6 ;; scanned
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L750: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L751: ; Continuation
  Bare_enter_check(6)
  mov ax, 1
  shr ax, 1
  mov bx, [bp+4]
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  push word cx
  push word L750
  mov cx, sp
  push word 4 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L752: ; Arm: 89'13
  push word [bp+14]
  push word cx
  push word L751
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g161
  mov dx, g163
  jmp [bp]

L753: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L754: ; Continuation
  Bare_enter_check(28)
  mov ax, [bp+14]
  cmp word ax, 1
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
  push word L748
  mov cx, sp
  push word 18 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L749
  mov ax, [bp+14]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov di, ax
  mov bx, di
  cmp word [bx], 3
  jz L752
  push word [bp+14]
  push word cx
  push word L753
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g161
  mov dx, g164
  jmp [bp]

L755: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L754
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L756: ; Arm: 88'11
  push word g158
  push word `0`
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L757: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L758: ; Continuation
  Bare_enter_check(6)
  mov ax, 1
  shr ax, 1
  mov bx, [bp+4]
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  push word cx
  push word L757
  mov cx, sp
  push word 4 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L759: ; Arm: 89'13
  push word [bp+10]
  push word cx
  push word L758
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g157
  mov dx, g159
  jmp [bp]

L760: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L761: ; Continuation
  Bare_enter_check(36)
  push word [bp+12]
  push word [bp+10]
  push word cx
  push word L464
  mov cx, sp
  push word 8 ;; scanned
  mov bx, dx
  cmp word [bx], 3
  jz L495
  mov ax, [bp+10]
  shr ax, 1
  mov bx, 17
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov si, ax
  mov ax, [bp+10]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov di, ax
  push word si
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L755
  mov cx, sp
  push word 16 ;; scanned
  mov bx, di
  cmp word [bx], 3
  jz L756
  mov ax, [bp+10]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+6], ax
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L759
  push word [bp+10]
  push word cx
  push word L760
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g157
  mov dx, g160
  jmp [bp]

L762: ; Arm: 228'33
  mov dx, g143
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L763: ; Arm: 13'9
  mov dx, g144
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L764: ; Continuation
  Bare_enter_check(24)
  mov si, dx
  push word si
  push word 1
  mov di, sp
  push word 4 ;; scanned
  mov ax, [bp+10]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+6], ax
  push word di
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L761
  mov cx, sp
  push word 16 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L762
  mov ax, [bp+10]
  cmp word ax, 513
  call Bare_make_bool_from_n
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L763
  mov dx, g145
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L765: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L764
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L766: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L765
  mov cx, sp
  push word 14 ;; scanned
  mov bp, dx
  mov dx, 129
  jmp [bp]

L767: ; Function: (loop,t1)
  Bare_enter_check(16)
  mov ax, 239
  cmp word ax, dx
  call Bare_make_bool_from_n
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L463
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L766
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g141
  mov dx, g142
  jmp [bp]

L768: ; Arm: 272'16
  mov dx, g257
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L769: ; Continuation
  Bare_enter_check(0)
  mov ax, `\n`
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

L770: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L769
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L771: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L770
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L772: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L771
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L773: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L772
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L774: ; Continuation
  Bare_enter_check(16)
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L773
  mov cx, sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+12]
  jmp [bp]

L775: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L774
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g3
  mov dx, g362
  jmp [bp]

L776: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L775
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L777: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L776
  mov cx, sp
  push word 14 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L778: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L777
  mov cx, sp
  push word 14 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L779: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L778
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L780: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L779
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L781: ; Continuation
  Bare_enter_check(18)
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L780
  mov cx, sp
  push word 16 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+14]
  jmp [bp]

L782: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L781
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g3
  mov dx, g361
  jmp [bp]

L783: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L782
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L784: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L783
  mov cx, sp
  push word 16 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L785: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L784
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+6]
  mov dx, g360
  jmp [bp]

L786: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L785
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L787: ; Arm: 88'11
  push word g357
  push word `0`
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L788: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L789: ; Continuation
  Bare_enter_check(6)
  mov ax, 1
  shr ax, 1
  mov bx, [bp+4]
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  push word cx
  push word L788
  mov cx, sp
  push word 4 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L790: ; Arm: 89'13
  push word [bp+8]
  push word cx
  push word L789
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g356
  mov dx, g358
  jmp [bp]

L791: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L792: ; Continuation
  Bare_enter_check(24)
  mov si, dx
  mov ax, [bp+8]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov di, ax
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L786
  mov cx, sp
  push word 14 ;; scanned
  mov bx, di
  cmp word [bx], 3
  jz L787
  mov ax, [bp+8]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+6], ax
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L790
  push word [bp+8]
  push word cx
  push word L791
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g356
  mov dx, g359
  jmp [bp]

L793: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L792
  mov cx, sp
  push word 12 ;; scanned
  mov bx, dx
  mov si, [bx+2]
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L794: ; Continuation
  Bare_enter_check(0)
  call Bare_crash
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L795: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L794
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L796: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L795
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L797: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L796
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L798: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L797
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L799: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L798
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L800: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L799
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g3
  mov dx, g270
  jmp [bp]

L801: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L800
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L802: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L801
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L803: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L802
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g269
  jmp [bp]

L804: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L803
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L805: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L804
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L806: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L805
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L807: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L806
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g3
  mov dx, g268
  jmp [bp]

L808: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L807
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L809: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L808
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g267
  jmp [bp]

L810: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L809
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L811: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L810
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L812: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L811
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L813: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L812
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L814: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L813
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g3
  mov dx, g266
  jmp [bp]

L815: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L814
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L816: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L815
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L817: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L816
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g265
  jmp [bp]

L818: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L817
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L819: ; Arm: 88'11
  push word g262
  push word `0`
  push word 3
  mov di, sp
  push word 6 ;; scanned
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L820: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L821: ; Continuation
  Bare_enter_check(6)
  mov ax, 1
  shr ax, 1
  mov bx, [bp+4]
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  push word cx
  push word L820
  mov cx, sp
  push word 4 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L822: ; Arm: 89'13
  push word [bp+10]
  push word cx
  push word L821
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g261
  mov dx, g263
  jmp [bp]

L823: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L824: ; Arm: 234'23
  mov ax, [bp+10]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L818
  mov cx, sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L819
  mov ax, [bp+10]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov di, ax
  mov bx, di
  cmp word [bx], 3
  jz L822
  push word [bp+10]
  push word cx
  push word L823
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g261
  mov dx, g264
  jmp [bp]

L825: ; Arm: 117'16
  mov dx, g355
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L826: ; Continuation
  Bare_enter_check(0)
  mov bx, dx
  cmp word [bx], 3
  jz L825
  mov ax, [bp+4]
  shr ax, 1
  mov bx, [bp+10]
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  mov ax, [bp+6]
  mov bx, si
  shr bx, 1
  call Bare_get_bytes
  mov di, ax
  mov ax, [bp+8]
  mov bx, di
  push word si ;; save
  mov si, [bp+10]
  shr si, 1
  call Bare_set_bytes
  pop word si ;; restore
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, [bp+10]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+8], ax
  mov bp, [bp+12]
  mov dx, [Temps+8]
  jmp [bp]

L827: ; Arm: 13'9
  mov dx, g353
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L828: ; Function: (loop,t2)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 129
  call Bare_make_bool_from_n
  mov si, ax
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L826
  mov cx, sp
  push word 14 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L827
  mov dx, g354
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L829: ; Continuation
  Bare_enter_check(6)
  push word [bp+4]
  push word 1
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L830: ; Continuation
  Bare_enter_check(100)
  mov ax, 129
  call Bare_make_bytes
  mov si, ax
  push word si
  push word dx
  push word [bp+4]
  push word L828
  mov di, sp
  push word 8 ;; scanned
  push word si
  push word cx
  push word L829
  mov cx, sp
  push word 6 ;; scanned
  mov bp, di
  mov dx, 1
  jmp [bp]

L831: ; Continuation
  Bare_enter_check(8)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 17
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  shl dx, 1
  add dx, 1
  mov si, dx
  pop word dx ;; restore
  mov ax, 129
  shr ax, 1
  shr si, 1
  mul si
  shl ax, 1
  add ax, 1
  mov di, ax
  push word di
  push word cx
  push word L830
  mov cx, sp
  push word 6 ;; scanned
  mov bx, dx
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L832: ; Arm: 189'23
  mov dx, [Temps+12]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L833: ; Continuation
  Bare_enter_check(14)
  push word g352
  mov si, sp
  push word 2 ;; scanned
  push word dx
  push word [bp+4]
  push word si
  push word 1
  mov di, sp
  push word 8 ;; scanned
  mov bx, [bp+6]
  mov ax, di
  mov [bx], ax
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov dx, dx
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L834: ; Continuation
  Bare_enter_check(0)
  call Bare_crash
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L835: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L834
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L836: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L835
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L837: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L836
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L838: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L837
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L839: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L838
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L840: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L839
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g3
  mov dx, g335
  jmp [bp]

L841: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L840
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L842: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L841
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L843: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L842
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g334
  jmp [bp]

L844: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L843
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L845: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L844
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L846: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L845
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L847: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L846
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g3
  mov dx, g333
  jmp [bp]

L848: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L847
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L849: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L848
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g332
  jmp [bp]

L850: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L849
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L851: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L850
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L852: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L851
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L853: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L852
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L854: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L853
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g3
  mov dx, g331
  jmp [bp]

L855: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L854
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L856: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L855
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L857: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L856
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g330
  jmp [bp]

L858: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L857
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L859: ; Arm: 88'11
  push word g327
  push word `0`
  push word 3
  mov di, sp
  push word 6 ;; scanned
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L860: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L861: ; Continuation
  Bare_enter_check(6)
  mov ax, 1
  shr ax, 1
  mov bx, [bp+4]
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  push word cx
  push word L860
  mov cx, sp
  push word 4 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L862: ; Arm: 89'13
  push word [bp+8]
  push word cx
  push word L861
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g326
  mov dx, g328
  jmp [bp]

L863: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L864: ; Arm: 157'27
  mov ax, [bp+8]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L858
  mov cx, sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L859
  mov ax, [bp+8]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov di, ax
  mov bx, di
  cmp word [bx], 3
  jz L862
  push word [bp+8]
  push word cx
  push word L863
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g326
  mov dx, g329
  jmp [bp]

L865: ; Arm: 117'16
  mov dx, g351
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L866: ; Continuation
  Bare_enter_check(0)
  mov bx, dx
  cmp word [bx], 3
  jz L865
  mov ax, [bp+6]
  shr ax, 1
  mov bx, [bp+10]
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  mov ax, [bp+4]
  mov bx, si
  shr bx, 1
  call Bare_get_bytes
  mov di, ax
  mov ax, [bp+8]
  mov bx, di
  push word si ;; save
  mov si, [bp+10]
  shr si, 1
  call Bare_set_bytes
  pop word si ;; restore
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, [bp+10]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+8], ax
  mov bp, [bp+12]
  mov dx, [Temps+8]
  jmp [bp]

L867: ; Arm: 13'9
  mov dx, g349
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L868: ; Function: (loop,t3)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1025
  call Bare_make_bool_from_n
  mov si, ax
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L866
  mov cx, sp
  push word 14 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L867
  mov dx, g350
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L869: ; Continuation
  Bare_enter_check(6)
  push word [bp+4]
  push word 1
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L870: ; Continuation
  Bare_enter_check(100)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 1025
  shr bx, 1
  mul bx
  shl ax, 1
  add ax, 1
  mov si, ax
  mov ax, 1025
  call Bare_make_bytes
  mov di, ax
  push word di
  push word si
  push word dx
  push word L868
  mov [Temps+6], sp
  push word 8 ;; scanned
  push word di
  push word cx
  push word L869
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [Temps+6]
  mov dx, 1
  jmp [bp]

L871: ; Continuation
  Bare_enter_check(8)
  push word [bp+4]
  push word cx
  push word L870
  mov cx, sp
  push word 6 ;; scanned
  mov bx, [bp+6]
  mov si, [bx+2]
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L872: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L871
  mov cx, sp
  push word 8 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L873: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L872
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L874: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L873
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L875: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L874
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L876: ; Continuation
  Bare_enter_check(16)
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L875
  mov cx, sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+12]
  jmp [bp]

L877: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L876
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g3
  mov dx, g348
  jmp [bp]

L878: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L877
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L879: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L878
  mov cx, sp
  push word 14 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L880: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L879
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, g347
  jmp [bp]

L881: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L880
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L882: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L881
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L883: ; Continuation
  Bare_enter_check(16)
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L882
  mov cx, sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+12]
  jmp [bp]

L884: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L883
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g3
  mov dx, g346
  jmp [bp]

L885: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L884
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L886: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L885
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, g345
  jmp [bp]

L887: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L886
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L888: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L887
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L889: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L888
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L890: ; Continuation
  Bare_enter_check(16)
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L889
  mov cx, sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+12]
  jmp [bp]

L891: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L890
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g3
  mov dx, g344
  jmp [bp]

L892: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L891
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L893: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L892
  mov cx, sp
  push word 14 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L894: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L893
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, g343
  jmp [bp]

L895: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L894
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L896: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L895
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L897: ; Continuation
  Bare_enter_check(16)
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L896
  mov cx, sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+12]
  jmp [bp]

L898: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L897
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g3
  mov dx, g342
  jmp [bp]

L899: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L898
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L900: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L899
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, g341
  jmp [bp]

L901: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L900
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L902: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L901
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L903: ; Arm: 88'11
  push word g338
  push word `0`
  push word 3
  mov di, sp
  push word 6 ;; scanned
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L904: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L905: ; Continuation
  Bare_enter_check(6)
  mov ax, 1
  shr ax, 1
  mov bx, [bp+4]
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  push word cx
  push word L904
  mov cx, sp
  push word 4 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L906: ; Arm: 89'13
  push word [bp+8]
  push word cx
  push word L905
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g337
  mov dx, g339
  jmp [bp]

L907: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L908: ; Continuation
  Bare_enter_check(32)
  push word [bp+12]
  push word [bp+8]
  push word cx
  push word L833
  mov cx, sp
  push word 8 ;; scanned
  mov bx, dx
  cmp word [bx], 3
  jz L864
  mov ax, [bp+8]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L902
  mov cx, sp
  push word 12 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L903
  mov ax, [bp+8]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov di, ax
  mov bx, di
  cmp word [bx], 3
  jz L906
  push word [bp+8]
  push word cx
  push word L907
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g337
  mov dx, g340
  jmp [bp]

L909: ; Arm: 153'34
  mov dx, g323
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L910: ; Arm: 13'9
  mov dx, g324
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L911: ; Continuation
  Bare_enter_check(16)
  mov ax, [bp+8]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov si, ax
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L908
  mov cx, sp
  push word 14 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L909
  mov ax, [bp+8]
  cmp word ax, 65
  call Bare_make_bool_from_n
  mov di, ax
  mov bx, di
  cmp word [bx], 3
  jz L910
  mov dx, g325
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L912: ; Continuation
  Bare_enter_check(0)
  call Bare_crash
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L913: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L912
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L914: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L913
  mov cx, sp
  push word 4 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L915: ; Continuation
  Bare_enter_check(8)
  push word [bp+6]
  push word cx
  push word L914
  mov cx, sp
  push word 6 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L916: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L915
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L917: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L916
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L918: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L917
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g3
  mov dx, g305
  jmp [bp]

L919: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L918
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L920: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L919
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L921: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L920
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g304
  jmp [bp]

L922: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L921
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L923: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L922
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L924: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L923
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L925: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L924
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g3
  mov dx, g303
  jmp [bp]

L926: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L925
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L927: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L926
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g302
  jmp [bp]

L928: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L927
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L929: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L928
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L930: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L929
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L931: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L930
  mov cx, sp
  push word 10 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+8]
  jmp [bp]

L932: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L931
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g3
  mov dx, g301
  jmp [bp]

L933: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L932
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L934: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L933
  mov cx, sp
  push word 10 ;; scanned
  mov dx, [bp+8]
  mov bp, [bp+6]
  jmp [bp]

L935: ; Continuation
  Bare_enter_check(12)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L934
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, g300
  jmp [bp]

L936: ; Continuation
  Bare_enter_check(10)
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L935
  mov cx, sp
  push word 8 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L937: ; Arm: 88'11
  push word g297
  push word `0`
  push word 3
  mov di, sp
  push word 6 ;; scanned
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L938: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L939: ; Continuation
  Bare_enter_check(6)
  mov ax, 1
  shr ax, 1
  mov bx, [bp+4]
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  push word cx
  push word L938
  mov cx, sp
  push word 4 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L940: ; Arm: 89'13
  push word [bp+10]
  push word cx
  push word L939
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g296
  mov dx, g298
  jmp [bp]

L941: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L942: ; Arm: 163'27
  mov ax, [bp+10]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L936
  mov cx, sp
  push word 8 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L937
  mov ax, [bp+10]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov di, ax
  mov bx, di
  cmp word [bx], 3
  jz L940
  push word [bp+10]
  push word cx
  push word L941
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g296
  mov dx, g299
  jmp [bp]

L943: ; Arm: 128'16
  mov dx, g321
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L944: ; Continuation
  Bare_enter_check(0)
  mov bx, dx
  cmp word [bx], 3
  jz L943
  mov ax, [bp+8]
  mov bx, [bp+10]
  shr bx, 1
  call Bare_get_bytes
  mov si, ax
  mov ax, [bp+6]
  shr ax, 1
  mov bx, [bp+10]
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov di, ax
  mov ax, [bp+4]
  mov bx, si
  push word si ;; save
  mov si, di
  shr si, 1
  call Bare_set_bytes
  pop word si ;; restore
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, [bp+10]
  shr ax, 1
  mov bx, 3
  shr bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+8], ax
  mov bp, [bp+12]
  mov dx, [Temps+8]
  jmp [bp]

L945: ; Arm: 13'9
  mov dx, g319
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L946: ; Function: (loop,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1025
  call Bare_make_bool_from_n
  mov si, ax
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L944
  mov cx, sp
  push word 14 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L945
  mov dx, g320
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L947: ; Continuation
  Bare_enter_check(10)
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word L946
  mov si, sp
  push word 8 ;; scanned
  mov bp, si
  mov dx, 1
  jmp [bp]

L948: ; Continuation
  Bare_enter_check(10)
  mov ax, [bp+4]
  shr ax, 1
  mov bx, 1025
  shr bx, 1
  mul bx
  shl ax, 1
  add ax, 1
  mov si, ax
  push word si
  push word dx
  push word cx
  push word L947
  mov cx, sp
  push word 8 ;; scanned
  mov bx, [bp+6]
  mov di, [bx+2]
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L949: ; Continuation
  Bare_enter_check(10)
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L948
  mov cx, sp
  push word 8 ;; scanned
  mov bx, [bp+4]
  mov si, [bx+2]
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L950: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L949
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L951: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L950
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L952: ; Continuation
  Bare_enter_check(14)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L951
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L953: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L952
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L954: ; Continuation
  Bare_enter_check(18)
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L953
  mov cx, sp
  push word 16 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+14]
  jmp [bp]

L955: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L954
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g3
  mov dx, g318
  jmp [bp]

L956: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L955
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L957: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L956
  mov cx, sp
  push word 16 ;; scanned
  mov dx, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L958: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L957
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+6]
  mov dx, g317
  jmp [bp]

L959: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L958
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L960: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L959
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L961: ; Continuation
  Bare_enter_check(18)
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L960
  mov cx, sp
  push word 16 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+14]
  jmp [bp]

L962: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L961
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g3
  mov dx, g316
  jmp [bp]

L963: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L962
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L964: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L963
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+6]
  mov dx, g315
  jmp [bp]

L965: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L964
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L966: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L965
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L967: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L966
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L968: ; Continuation
  Bare_enter_check(18)
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L967
  mov cx, sp
  push word 16 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+14]
  jmp [bp]

L969: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L968
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g3
  mov dx, g314
  jmp [bp]

L970: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L969
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L971: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L970
  mov cx, sp
  push word 16 ;; scanned
  mov dx, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L972: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L971
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+6]
  mov dx, g313
  jmp [bp]

L973: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L972
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L974: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L973
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L975: ; Continuation
  Bare_enter_check(18)
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L974
  mov cx, sp
  push word 16 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+14]
  jmp [bp]

L976: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L975
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g3
  mov dx, g312
  jmp [bp]

L977: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L976
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L978: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L977
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+6]
  mov dx, g311
  jmp [bp]

L979: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L978
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L980: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L979
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L981: ; Arm: 88'11
  push word g308
  push word `0`
  push word 3
  mov di, sp
  push word 6 ;; scanned
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L982: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L983: ; Continuation
  Bare_enter_check(6)
  mov ax, 1
  shr ax, 1
  mov bx, [bp+4]
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  push word cx
  push word L982
  mov cx, sp
  push word 4 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L984: ; Arm: 89'13
  push word [bp+10]
  push word cx
  push word L983
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g307
  mov dx, g309
  jmp [bp]

L985: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L986: ; Continuation
  Bare_enter_check(24)
  mov bx, dx
  cmp word [bx], 3
  jz L942
  mov ax, [bp+10]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L980
  mov cx, sp
  push word 14 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L981
  mov ax, [bp+10]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov di, ax
  mov bx, di
  cmp word [bx], 3
  jz L984
  push word [bp+10]
  push word cx
  push word L985
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g307
  mov dx, g310
  jmp [bp]

L987: ; Arm: 153'34
  mov dx, g293
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L988: ; Arm: 13'9
  mov dx, g294
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L989: ; Arm: 191'29
  mov ax, [Temps+10]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+18], ax
  push word [Temps+12]
  push word [Temps+10]
  push word si
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L986
  mov cx, sp
  push word 14 ;; scanned
  mov bx, [Temps+18]
  cmp word [bx], 3
  jz L987
  mov ax, [Temps+10]
  cmp word ax, 65
  call Bare_make_bool_from_n
  mov [Temps+20], ax
  mov bx, [Temps+20]
  cmp word [bx], 3
  jz L988
  mov dx, g295
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L990: ; Continuation
  Bare_enter_check(40)
  push word [bp+10]
  push word cx
  push word L831
  mov cx, sp
  push word 6 ;; scanned
  mov bx, [bp+8]
  mov si, [bx+2]
  mov di, [bx+4]
  mov bx, di
  mov ax, [bx]
  mov [Temps+6], ax
  mov bx, [Temps+6]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov ax, [bx+4]
  mov [Temps+10], ax
  mov ax, [bx+6]
  mov [Temps+12], ax
  mov ax, [bp+12]
  cmp word ax, [Temps+10]
  call Bare_make_bool_from_z
  mov [Temps+14], ax
  mov bx, [Temps+14]
  cmp word [bx], 3
  jz L832
  mov bx, [Temps+8]
  mov ax, [bx]
  mov [Temps+16], ax
  push word di
  push word si
  push word [bp+12]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L911
  mov cx, sp
  push word 14 ;; scanned
  mov bx, [Temps+16]
  cmp word [bx], 3
  jz L989
  mov dx, g322
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L991: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L990
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L992: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L991
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L993: ; Continuation
  Bare_enter_check(18)
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L992
  mov cx, sp
  push word 16 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+14]
  jmp [bp]

L994: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L993
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g3
  mov dx, g292
  jmp [bp]

L995: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L994
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L996: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L995
  mov cx, sp
  push word 16 ;; scanned
  mov dx, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L997: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L996
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+6]
  mov dx, g291
  jmp [bp]

L998: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L997
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L999: ; Arm: 88'11
  push word g288
  push word `0`
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1000: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1001: ; Continuation
  Bare_enter_check(6)
  mov ax, 1
  shr ax, 1
  mov bx, [bp+4]
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  push word cx
  push word L1000
  mov cx, sp
  push word 4 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L1002: ; Arm: 89'13
  push word si
  push word cx
  push word L1001
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g287
  mov dx, g289
  jmp [bp]

L1003: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L1004: ; Continuation
  Bare_enter_check(24)
  mov ax, [bp+10]
  shr ax, 1
  mov bx, 17
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov si, ax
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov di, ax
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L998
  mov cx, sp
  push word 14 ;; scanned
  mov bx, di
  cmp word [bx], 3
  jz L999
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+6], ax
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L1002
  push word si
  push word cx
  push word L1003
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g287
  mov dx, g290
  jmp [bp]

L1005: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1004
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1006: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1005
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L1007: ; Continuation
  Bare_enter_check(16)
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1006
  mov cx, sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+12]
  jmp [bp]

L1008: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1007
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g3
  mov dx, g286
  jmp [bp]

L1009: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1008
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L1010: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1009
  mov cx, sp
  push word 14 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L1011: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1010
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, g285
  jmp [bp]

L1012: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1011
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1013: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1012
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+12]
  mov dx, dx
  jmp [bp]

L1014: ; Continuation
  Bare_enter_check(16)
  push word [bp+14]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1013
  mov cx, sp
  push word 14 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+12]
  jmp [bp]

L1015: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1014
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g3
  mov dx, g284
  jmp [bp]

L1016: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1015
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L1017: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1016
  mov cx, sp
  push word 14 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L1018: ; Continuation
  Bare_enter_check(16)
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1017
  mov cx, sp
  push word 14 ;; scanned
  mov dx, [bp+12]
  mov bp, [bp+6]
  jmp [bp]

L1019: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1018
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1020: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1019
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L1021: ; Continuation
  Bare_enter_check(18)
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1020
  mov cx, sp
  push word 16 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+14]
  jmp [bp]

L1022: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1021
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g3
  mov dx, g283
  jmp [bp]

L1023: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1022
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L1024: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1023
  mov cx, sp
  push word 16 ;; scanned
  mov dx, [bp+14]
  mov bp, [bp+6]
  jmp [bp]

L1025: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1024
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+6]
  mov dx, g282
  jmp [bp]

L1026: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1025
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1027: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1026
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+14]
  mov dx, dx
  jmp [bp]

L1028: ; Continuation
  Bare_enter_check(18)
  push word [bp+16]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1027
  mov cx, sp
  push word 16 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+14]
  jmp [bp]

L1029: ; Continuation
  Bare_enter_check(20)
  push word dx
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1028
  mov cx, sp
  push word 18 ;; scanned
  mov bp, g3
  mov dx, g281
  jmp [bp]

L1030: ; Continuation
  Bare_enter_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1029
  mov cx, sp
  push word 16 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L1031: ; Continuation
  Bare_enter_check(18)
  push word dx
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1030
  mov cx, sp
  push word 16 ;; scanned
  mov bp, [bp+6]
  mov dx, g280
  jmp [bp]

L1032: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1031
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L1033: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1032
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1034: ; Arm: 88'11
  push word g277
  push word `0`
  push word 3
  mov di, sp
  push word 6 ;; scanned
  mov dx, di
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1035: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1036: ; Continuation
  Bare_enter_check(6)
  mov ax, 1
  shr ax, 1
  mov bx, [bp+4]
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  push word cx
  push word L1035
  mov cx, sp
  push word 4 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L1037: ; Arm: 89'13
  push word [bp+12]
  push word cx
  push word L1036
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g276
  mov dx, g278
  jmp [bp]

L1038: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L1039: ; Continuation
  Bare_enter_check(24)
  mov ax, [bp+12]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov si, ax
  push word dx
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1033
  mov cx, sp
  push word 14 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L1034
  mov ax, [bp+12]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov di, ax
  mov bx, di
  cmp word [bx], 3
  jz L1037
  push word [bp+12]
  push word cx
  push word L1038
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g276
  mov dx, g279
  jmp [bp]

L1040: ; Continuation
  Bare_enter_check(16)
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1039
  mov cx, sp
  push word 14 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1041: ; Arm: 88'11
  push word g273
  push word `0`
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1042: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word `-`
  push word 3
  mov si, sp
  push word 6 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1043: ; Continuation
  Bare_enter_check(6)
  mov ax, 1
  shr ax, 1
  mov bx, [bp+4]
  shr bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov si, ax
  push word cx
  push word L1042
  mov cx, sp
  push word 4 ;; scanned
  mov bp, dx
  mov dx, si
  jmp [bp]

L1044: ; Arm: 89'13
  push word [bp+10]
  push word cx
  push word L1043
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g272
  mov dx, g274
  jmp [bp]

L1045: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L1046: ; Continuation
  Bare_enter_check(38)
  push word [bp+12]
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L793
  mov cx, sp
  push word 12 ;; scanned
  mov bx, dx
  cmp word [bx], 3
  jz L824
  mov ax, [bp+10]
  shr ax, 1
  mov bx, 17
  shr bx, 1
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov si, ax
  mov ax, [bp+10]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov di, ax
  push word si
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1040
  mov cx, sp
  push word 14 ;; scanned
  mov bx, di
  cmp word [bx], 3
  jz L1041
  mov ax, [bp+10]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+6], ax
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L1044
  push word [bp+10]
  push word cx
  push word L1045
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g272
  mov dx, g275
  jmp [bp]

L1047: ; Arm: 228'33
  mov dx, g258
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1048: ; Arm: 13'9
  mov dx, g259
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1049: ; Function: (loop,t1)
  Bare_enter_check(16)
  mov ax, 251
  cmp word ax, dx
  call Bare_make_bool_from_n
  mov si, ax
  mov bx, si
  cmp word [bx], 3
  jz L768
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov di, ax
  push word bp
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L1046
  mov cx, sp
  push word 14 ;; scanned
  mov bx, di
  cmp word [bx], 3
  jz L1047
  mov ax, dx
  cmp word ax, 513
  call Bare_make_bool_from_n
  mov [Temps+6], ax
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L1048
  mov dx, g260
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1050: ; Continuation
  Bare_enter_check(0)
  mov dx, g363
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1051: ; Continuation
  Bare_enter_check(16)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L1049
  mov si, sp
  push word 8 ;; scanned
  push word cx
  push word L1050
  mov cx, sp
  push word 4 ;; scanned
  mov bp, si
  mov dx, 201
  jmp [bp]

L1052: ; Continuation
  Bare_enter_check(22)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L767
  mov si, sp
  push word 8 ;; scanned
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1051
  mov cx, sp
  push word 10 ;; scanned
  mov bp, si
  mov dx, 229
  jmp [bp]

L1053: ; Continuation
  Bare_enter_check(54)
  push word g23
  mov si, sp
  push word 2 ;; scanned
  push word [bp+10]
  push word 1
  mov di, sp
  push word 4 ;; scanned
  push word di
  push word 1
  push word si
  push word 1
  mov [Temps+6], sp
  push word 8 ;; scanned
  push word [Temps+6]
  mov [Temps+8], sp
  push word 2 ;; scanned
  push word [Temps+8]
  push word [bp+8]
  push word 1
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [Temps+10]
  push word [bp+6]
  push word [bp+4]
  push word L462
  mov [Temps+12], sp
  push word 8 ;; scanned
  push word [Temps+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1052
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [Temps+12]
  mov dx, 203
  jmp [bp]

L1054: ; Continuation
  Bare_enter_check(100)
  mov ax, 1025
  call Bare_make_bytes
  mov si, ax
  push word si
  push word dx
  push word L153
  mov di, sp
  push word 6 ;; scanned
  push word si
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1053
  mov cx, sp
  push word 12 ;; scanned
  mov bp, di
  mov dx, 1
  jmp [bp]

L1055: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1054
  mov cx, sp
  push word 10 ;; scanned
  mov bx, [bp+8]
  mov si, [bx+2]
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L1056: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1055
  mov cx, sp
  push word 10 ;; scanned
  mov bp, g8
  mov dx, dx
  jmp [bp]

L1057: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1056
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L1058: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1057
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1059: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1058
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L1060: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1059
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+12]
  jmp [bp]

L1061: ; Continuation
  Bare_enter_check(16)
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1060
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g3
  mov dx, g19
  jmp [bp]

L1062: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1061
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L1063: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1062
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L1064: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1063
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, g18
  jmp [bp]

L1065: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1064
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1066: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1065
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+10]
  mov dx, dx
  jmp [bp]

L1067: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1066
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+12]
  jmp [bp]

L1068: ; Continuation
  Bare_enter_check(16)
  push word [bp+10]
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1067
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g3
  mov dx, g17
  jmp [bp]

L1069: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1068
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L1070: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1069
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, g16
  jmp [bp]

L1071: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1070
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L1072: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1071
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1073: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1072
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L1074: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1073
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+12]
  jmp [bp]

L1075: ; Continuation
  Bare_enter_check(16)
  push word [bp+10]
  push word [bp+8]
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1074
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g3
  mov dx, g15
  jmp [bp]

L1076: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1075
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L1077: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1076
  mov cx, sp
  push word 12 ;; scanned
  mov dx, [bp+10]
  mov bp, [bp+6]
  jmp [bp]

L1078: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1077
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, g14
  jmp [bp]

L1079: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1078
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L1080: ; Continuation
  Bare_enter_check(12)
  push word [bp+10]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1079
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+8]
  mov dx, dx
  jmp [bp]

L1081: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1080
  mov cx, sp
  push word 12 ;; scanned
  mov bx, bp
  mov bp, dx
  mov dx, [bx+12]
  jmp [bp]

L1082: ; Continuation
  Bare_enter_check(16)
  push word [bp+10]
  push word [bp+8]
  push word dx
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1081
  mov cx, sp
  push word 14 ;; scanned
  mov bp, g3
  mov dx, g13
  jmp [bp]

L1083: ; Continuation
  Bare_enter_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1082
  mov cx, sp
  push word 12 ;; scanned
  mov bp, g3
  mov dx, dx
  jmp [bp]

L1084: ; Continuation
  Bare_enter_check(14)
  push word dx
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1083
  mov cx, sp
  push word 12 ;; scanned
  mov bp, [bp+6]
  mov dx, g12
  jmp [bp]

L1085: ; Continuation
  Bare_enter_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L1084
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+6]
  mov dx, dx
  jmp [bp]

L1086: ; Continuation
  Bare_enter_check(100)
  mov ax, 32769
  call Bare_make_bytes
  mov si, ax
  push word si
  push word 1
  mov di, sp
  push word 4 ;; scanned
  push word g11
  push word `0`
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word di
  push word dx
  push word [bp+4]
  push word cx
  push word L1085
  mov cx, sp
  push word 10 ;; scanned
  mov bp, [bp+4]
  mov dx, [Temps+6]
  jmp [bp]

L1087: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word cx
  push word L1086
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g1
  mov dx, g7
  jmp [bp]

L1088: ; Start
  Bare_enter_check(6)
  push word cx
  push word L1087
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g1
  mov dx, g5
  jmp [bp]

g1:
  dw L2
g2:
  dw L5
g3:
  dw L9
g4:
  dw 1
g5:
  dw L17
g6:
  dw 1
g7:
  dw L23
g8:
  dw L29
g9:
  dw 1
g11:
  dw 1
g12:
  dw 23
  db `   **SLOW**`
g13:
  dw 1
g14:
  dw 25
  db `read_sector `
g15:
  dw 1
g16:
  dw 3
  db `\n`
g17:
  dw 1
g18:
  dw 15
  db `trace: `
g19:
  dw 1
g20:
  dw 1
g21:
  dw 3
g22:
  dw 1
g23:
  dw 1
g24:
  dw 1
g25:
  dw 1
g26:
  dw 3
g27:
  dw 1
g28:
  dw 3
g29:
  dw L33
g30:
  dw 1
g31:
  dw 1
g32:
  dw 1
g33:
  dw 25
  db `write_block `
g34:
  dw 1
g35:
  dw 3
  db `\n`
g36:
  dw 1
g37:
  dw 15
  db `error: `
g38:
  dw 1
g39:
  dw 1
g40:
  dw L37
g41:
  dw 1
g42:
  dw 1
g43:
  dw 1
g44:
  dw L41
g45:
  dw 1
g46:
  dw 1
g47:
  dw 1
g48:
  dw 3
  db `]`
g49:
  dw 1
g50:
  dw 3
  db `[`
g51:
  dw 1
g52:
  dw 1
g53:
  dw 25
  db `write_block `
g54:
  dw 1
g55:
  dw L45
g56:
  dw 1
g57:
  dw 1
g58:
  dw 1
g59:
  dw L49
g60:
  dw 1
g61:
  dw 1
g62:
  dw 1
g63:
  dw L53
g64:
  dw 1
g65:
  dw 13
  db `, len=`
g66:
  dw 1
g67:
  dw 1
g68:
  dw 19
  db `, offset=`
g69:
  dw 1
g70:
  dw 1
g71:
  dw 43
  db `update_sectorC1 seci=`
g72:
  dw 1
g73:
  dw 1
g74:
  dw 3
g75:
  dw 1
g76:
  dw 3
g77:
  dw 3
g78:
  dw 1
g79:
  dw 3
g80:
  dw L57
g81:
  dw 1
g82:
  dw 1
g83:
  dw 1
g84:
  dw 27
  db `write_sector `
g85:
  dw 1
g86:
  dw 3
  db `\n`
g87:
  dw 1
g88:
  dw 15
  db `error: `
g89:
  dw 1
g90:
  dw 1
g91:
  dw L61
g92:
  dw 1
g93:
  dw 1
g94:
  dw 1
g95:
  dw 23
  db `   **SLOW**`
g96:
  dw 1
g97:
  dw 27
  db `write_sector `
g98:
  dw 1
g99:
  dw 3
  db `\n`
g100:
  dw 1
g101:
  dw 15
  db `trace: `
g102:
  dw 1
g103:
  dw 1
g104:
  dw 3
g105:
  dw 1
g106:
  dw 1
g107:
  dw 3
g108:
  dw 1
g109:
  dw 3
g110:
  dw L65
g111:
  dw 1
g112:
  dw 1
g113:
  dw 1
g114:
  dw 25
  db `read_sector `
g115:
  dw 1
g116:
  dw 3
  db `\n`
g117:
  dw 1
g118:
  dw 15
  db `error: `
g119:
  dw 1
g120:
  dw 1
g121:
  dw L69
g122:
  dw 1
g123:
  dw 1
g124:
  dw 1
g125:
  dw 23
  db `   **SLOW**`
g126:
  dw 1
g127:
  dw 25
  db `read_sector `
g128:
  dw 1
g129:
  dw 3
  db `\n`
g130:
  dw 1
g131:
  dw 15
  db `trace: `
g132:
  dw 1
g133:
  dw 1
g134:
  dw 3
g135:
  dw 1
g136:
  dw 1
g137:
  dw 3
g138:
  dw 1
g139:
  dw 3
g140:
  dw 1
g141:
  dw L73
g142:
  dw 1
g143:
  dw 3
g144:
  dw 1
g145:
  dw 3
g146:
  dw L77
g147:
  dw 1
g148:
  dw 1
g149:
  dw 1
g150:
  dw 25
  db `write_block `
g151:
  dw 1
g152:
  dw 3
  db `\n`
g153:
  dw 1
g154:
  dw 15
  db `error: `
g155:
  dw 1
g156:
  dw 1
g157:
  dw L81
g158:
  dw 1
g159:
  dw 1
g160:
  dw 1
g161:
  dw L85
g162:
  dw 1
g163:
  dw 1
g164:
  dw 1
g165:
  dw 3
  db `]`
g166:
  dw 1
g167:
  dw 3
  db `[`
g168:
  dw 1
g169:
  dw 1
g170:
  dw 25
  db `write_block `
g171:
  dw 1
g172:
  dw L89
g173:
  dw 1
g174:
  dw 1
g175:
  dw 1
g176:
  dw L93
g177:
  dw 1
g178:
  dw 1
g179:
  dw 1
g180:
  dw L97
g181:
  dw 1
g182:
  dw 13
  db `, len=`
g183:
  dw 1
g184:
  dw 1
g185:
  dw 19
  db `, offset=`
g186:
  dw 1
g187:
  dw 1
g188:
  dw 43
  db `update_sectorC1 seci=`
g189:
  dw 1
g190:
  dw 1
g191:
  dw 3
g192:
  dw 1
g193:
  dw 3
g194:
  dw 3
g195:
  dw 1
g196:
  dw 3
g197:
  dw L101
g198:
  dw 1
g199:
  dw 1
g200:
  dw 1
g201:
  dw 27
  db `write_sector `
g202:
  dw 1
g203:
  dw 3
  db `\n`
g204:
  dw 1
g205:
  dw 15
  db `error: `
g206:
  dw 1
g207:
  dw 1
g208:
  dw L105
g209:
  dw 1
g210:
  dw 1
g211:
  dw 1
g212:
  dw 23
  db `   **SLOW**`
g213:
  dw 1
g214:
  dw 27
  db `write_sector `
g215:
  dw 1
g216:
  dw 3
  db `\n`
g217:
  dw 1
g218:
  dw 15
  db `trace: `
g219:
  dw 1
g220:
  dw 1
g221:
  dw 3
g222:
  dw 1
g223:
  dw 1
g224:
  dw 3
g225:
  dw 1
g226:
  dw 3
g227:
  dw L109
g228:
  dw 1
g229:
  dw 1
g230:
  dw 1
g231:
  dw 25
  db `read_sector `
g232:
  dw 1
g233:
  dw 3
  db `\n`
g234:
  dw 1
g235:
  dw 15
  db `error: `
g236:
  dw 1
g237:
  dw 1
g238:
  dw L113
g239:
  dw 1
g240:
  dw 1
g241:
  dw 1
g242:
  dw 23
  db `   **SLOW**`
g243:
  dw 1
g244:
  dw 25
  db `read_sector `
g245:
  dw 1
g246:
  dw 3
  db `\n`
g247:
  dw 1
g248:
  dw 15
  db `trace: `
g249:
  dw 1
g250:
  dw 1
g251:
  dw 3
g252:
  dw 1
g253:
  dw 1
g254:
  dw 3
g255:
  dw 1
g256:
  dw 3
g257:
  dw 1
g258:
  dw 3
g259:
  dw 1
g260:
  dw 3
g261:
  dw L117
g262:
  dw 1
g263:
  dw 1
g264:
  dw 1
g265:
  dw 23
  db `read_block `
g266:
  dw 1
g267:
  dw 3
  db `\n`
g268:
  dw 1
g269:
  dw 15
  db `error: `
g270:
  dw 1
g271:
  dw 1
g272:
  dw L121
g273:
  dw 1
g274:
  dw 1
g275:
  dw 1
g276:
  dw L125
g277:
  dw 1
g278:
  dw 1
g279:
  dw 1
g280:
  dw 3
  db `]`
g281:
  dw 1
g282:
  dw 3
  db `[`
g283:
  dw 1
g284:
  dw 1
g285:
  dw 23
  db `read_block `
g286:
  dw 1
g287:
  dw L129
g288:
  dw 1
g289:
  dw 1
g290:
  dw 1
g291:
  dw 39
  db `read_sectorC1 seci=`
g292:
  dw 1
g293:
  dw 3
g294:
  dw 1
g295:
  dw 3
g296:
  dw L133
g297:
  dw 1
g298:
  dw 1
g299:
  dw 1
g300:
  dw 27
  db `write_sector `
g301:
  dw 1
g302:
  dw 3
  db `\n`
g303:
  dw 1
g304:
  dw 15
  db `error: `
g305:
  dw 1
g306:
  dw 1
g307:
  dw L137
g308:
  dw 1
g309:
  dw 1
g310:
  dw 1
g311:
  dw 23
  db `   **SLOW**`
g312:
  dw 1
g313:
  dw 27
  db `write_sector `
g314:
  dw 1
g315:
  dw 3
  db `\n`
g316:
  dw 1
g317:
  dw 15
  db `trace: `
g318:
  dw 1
g319:
  dw 1
g320:
  dw 3
g321:
  dw 1
g322:
  dw 1
g323:
  dw 3
g324:
  dw 1
g325:
  dw 3
g326:
  dw L141
g327:
  dw 1
g328:
  dw 1
g329:
  dw 1
g330:
  dw 25
  db `read_sector `
g331:
  dw 1
g332:
  dw 3
  db `\n`
g333:
  dw 1
g334:
  dw 15
  db `error: `
g335:
  dw 1
g336:
  dw 1
g337:
  dw L145
g338:
  dw 1
g339:
  dw 1
g340:
  dw 1
g341:
  dw 23
  db `   **SLOW**`
g342:
  dw 1
g343:
  dw 25
  db `read_sector `
g344:
  dw 1
g345:
  dw 3
  db `\n`
g346:
  dw 1
g347:
  dw 15
  db `trace: `
g348:
  dw 1
g349:
  dw 1
g350:
  dw 3
g351:
  dw 1
g352:
  dw 1
g353:
  dw 1
g354:
  dw 3
g355:
  dw 1
g356:
  dw L149
g357:
  dw 1
g358:
  dw 1
g359:
  dw 1
g360:
  dw 7
  db ` : `
g361:
  dw 1
g362:
  dw 1
g363:
  dw 1

bare_start: jmp L1088
