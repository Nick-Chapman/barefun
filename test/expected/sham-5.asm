L1: ; Arm: 17'7
  mov ax, 1
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L2: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, 3
  mov bx, [si]
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L3: ; Function: (length,g1)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  mov bx, [si]
  cmp word [bx], 1
  jz L1
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L2
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g1
  mov ax, 1
  jmp [bp]

L4: ; Arm: 22'7
  mov ax, g3
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L5: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [si]
  push word [bp+4]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L6: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L5
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov ax, [bp+6]
  mov [di+2], ax
  mov bp, g2
  mov ax, 2
  jmp [bp]

L7: ; Function: (map,g2)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(10)
  mov bx, [si+2]
  cmp word [bx], 1
  jz L4
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [si]
  push word [CurrentCont]
  push word L6
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [si]
  mov ax, 1
  jmp [bp]

L8: ; Arm: 27'7
  mov ax, g5
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L9: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov ax, [bp+6]
  mov [di+2], ax
  mov bp, g4
  mov ax, 2
  jmp [bp]

L10: ; Function: (iter,g4)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(10)
  mov bx, [si+2]
  cmp word [bx], 1
  jz L8
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [si]
  push word [CurrentCont]
  push word L9
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [si]
  mov ax, 1
  jmp [bp]

L11: ; Arm: 32'7
  mov ax, [si+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L12: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov ax, [bp+6]
  mov [di+4], ax
  mov bp, g6
  mov ax, 3
  jmp [bp]

L13: ; Function: (fold_left,g6)[arg0,arg1,arg2]
  xchg si, di
  Bare_arg_check(3)
  Bare_heap_check(10)
  mov bx, [si+4]
  cmp word [bx], 1
  jz L11
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [si]
  push word [CurrentCont]
  push word L12
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si+2]
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov bp, [si]
  mov ax, 2
  jmp [bp]

L14: ; Arm: 37'7
  mov ax, [si]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L15: ; Function: (rev_onto,g7)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(8)
  mov bx, [si+2]
  cmp word [bx], 1
  jz L14
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [si]
  push word [Temps+2]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov ax, [Temps+4]
  mov [di+2], ax
  mov bp, g7
  mov ax, 2
  jmp [bp]

L16: ; Arm: 50'9
  mov ax, g8
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L17: ; Function: (loop,t1)
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(0)
  mov bx, [si+2]
  cmp word [bx], 1
  jz L16
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [bp+2]
  mov bx, [si]
  mov dx, [Temps+2]
  sar bx, 1
  call Bare_set_bytes
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, [si]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+8], ax
  mov ax, [Temps+8]
  mov [di], ax
  mov ax, [Temps+4]
  mov [di+2], ax
  mov bp, bp
  mov ax, 2
  jmp [bp]

L18: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L19: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [si]
  push word L17
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [si]
  push word [CurrentCont]
  push word L18
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, 1
  mov [di], ax
  mov ax, [bp+4]
  mov [di+2], ax
  mov bp, [Temps+2]
  mov ax, 2
  jmp [bp]

L20: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L19
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, 1
  jmp AllocBare_make_bytes

L21: ; Function: (implode,g9)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L20
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g1
  mov ax, 1
  jmp [bp]

L22: ; Arm: 61'9
  mov ax, g10
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L23: ; Function: (loop,t1)
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(0)
  mov bx, [si+2]
  cmp word [bx], 1
  jz L22
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [bp+2]
  mov bx, [si]
  mov dx, [Temps+2]
  sar bx, 1
  call Bare_set_bytes
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, [si]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+8], ax
  mov ax, [Temps+8]
  mov [di], ax
  mov ax, [Temps+4]
  mov [di+2], ax
  mov bp, bp
  mov ax, 2
  jmp [bp]

L24: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L25: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [si]
  push word L23
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [bp+6]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+4], ax
  push word [si]
  push word [CurrentCont]
  push word L24
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov ax, [bp+4]
  mov [di+2], ax
  mov bp, [Temps+2]
  mov ax, 2
  jmp [bp]

L26: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L25
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, 1
  jmp AllocBare_make_bytes

L27: ; Function: (rev_implode,g11)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L26
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g1
  mov ax, 1
  jmp [bp]

L28: ; Arm: 69'13
  mov ax, [si]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L29: ; Function: (explode_loop,t1)
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(8)
  mov ax, [si+2]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L28
  mov ax, [bp+2]
  mov bx, [si+2]
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+4], ax
  mov ax, [si+2]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+6], ax
  push word [si]
  push word [Temps+4]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  mov ax, [Temps+8]
  mov [di], ax
  mov ax, [Temps+6]
  mov [di+2], ax
  mov bp, bp
  mov ax, 2
  jmp [bp]

L30: ; Function: (explode,g13)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [si]
  push word L29
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov bx, [si]
  mov ax, [bx]
  mov [Temps+4], ax
  mov ax, [Temps+4]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+6], ax
  mov ax, g12
  mov [di], ax
  mov ax, [Temps+6]
  mov [di+2], ax
  mov bp, [Temps+2]
  mov ax, 2
  jmp [bp]

L31: ; Arm: 77'19
  mov ax, g16
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L32: ; Arm: 79'15
  mov ax, g17
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L33: ; Arm: 82'31
  mov ax, g20
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L34: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov bx, [si]
  cmp word [bx], 3
  jz L33
  mov ax, [bp+4]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [bp+6]
  mov ax, 1
  jmp [bp]

L35: ; Arm: 6'9
  mov ax, g18
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L36: ; Function: (loop,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  mov ax, [si]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L32
  mov ax, [bp+2]
  mov bx, [si]
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+4], ax
  mov ax, [bp+4]
  mov bx, [si]
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+6], ax
  mov ax, [Temps+4]
  cmp word ax, [Temps+6]
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  push word bp
  push word [si]
  push word [CurrentCont]
  push word L34
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L35
  mov ax, g19
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L37: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  mov bx, [si]
  cmp word [bx], 3
  jz L31
  push word [bp+6]
  push word [bp+4]
  push word L36
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov ax, [bp+8]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+4], ax
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [Temps+2]
  mov ax, 1
  jmp [bp]

L38: ; Arm: 6'9
  mov ax, g14
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L39: ; Function: (eq_string,g21)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(12)
  mov bx, [si]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [si+2]
  mov ax, [bx]
  mov [Temps+4], ax
  mov ax, [Temps+2]
  cmp word ax, [Temps+4]
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word [Temps+2]
  push word [si+2]
  push word [si]
  push word [CurrentCont]
  push word L37
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L38
  mov ax, g15
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L40: ; Arm: 91'7
  mov ax, g23
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L41: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g9
  mov ax, 1
  jmp [bp]

L42: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L41
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g7
  mov ax, 2
  jmp [bp]

L43: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L42
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g24
  mov [di], ax
  mov ax, [bp+4]
  mov [di+2], ax
  mov bp, g7
  mov ax, 2
  jmp [bp]

L44: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L43
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L45: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L44
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L46: ; Function: (concat,g22)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  mov bx, [si]
  cmp word [bx], 1
  jz L40
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+2]
  push word [CurrentCont]
  push word L45
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L47: ; Arm: 107'7
  mov ax, g26
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L48: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L49: ; Arm: 100'19
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov ax, [Temps+10]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L50: ; Arm: 101'22
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov ax, [Temps+12]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L51: ; Arm: 102'16
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+14], ax
  mov ax, [Temps+14]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L52: ; Function: (put_chars,g25)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  mov bx, [si]
  cmp word [bx], 1
  jz L47
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
  push word L48
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L49
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L50
  mov ax, 53
  cmp word ax, [Temps+6]
  call Bare_make_bool_from_n
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L51
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
  mov ax, [Temps+22]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L53: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [si]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L54: ; Arm: 168'11
  push word [si]
  push word [CurrentCont]
  push word L53
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si+2]
  mov [di], ax
  mov bp, g11
  mov ax, 1
  jmp [bp]

L55: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [si]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov ax, [bp+6]
  mov [di+2], ax
  mov bp, g28
  mov ax, 2
  jmp [bp]

L56: ; Arm: 170'26
  push word [Temps+4]
  push word [si]
  push word [CurrentCont]
  push word L55
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si+2]
  mov [di], ax
  mov bp, g11
  mov ax, 1
  jmp [bp]

L57: ; Function: (have_letter,g29)[arg0,arg1,arg2]
  xchg si, di
  Bare_arg_check(3)
  Bare_heap_check(10)
  mov bx, [si+4]
  cmp word [bx], 1
  jz L54
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [Temps+2]
  cmp word ax, ` `
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L56
  push word [si+2]
  push word [Temps+2]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, [Temps+8]
  mov [di+2], ax
  mov ax, [Temps+4]
  mov [di+4], ax
  mov bp, g29
  mov ax, 3
  jmp [bp]

L58: ; Arm: 175'9
  mov ax, [bp+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L59: ; Arm: 177'24
  mov ax, [bp+2]
  mov [di], ax
  mov ax, [Temps+4]
  mov [di+2], ax
  mov bp, g28
  mov ax, 2
  jmp [bp]

L60: ; Function: (lamN,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  mov bx, [si]
  cmp word [bx], 1
  jz L58
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [Temps+2]
  cmp word ax, ` `
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L59
  push word g30
  push word [Temps+2]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  mov ax, [bp+2]
  mov [di], ax
  mov ax, [Temps+8]
  mov [di+2], ax
  mov ax, [Temps+4]
  mov [di+4], ax
  mov bp, g29
  mov ax, 3
  jmp [bp]

L61: ; Function: (at_word_start,g28)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [si]
  push word L60
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L62: ; Arm: 144'22
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov ax, [si]
  mov [di], ax
  mov bp, g11
  mov ax, 1
  jmp [bp]

L63: ; Arm: 145'28
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
  push word [si]
  push word `\x04`
  push word 3
  mov [Temps+16], sp
  push word 6 ;; scanned
  mov ax, [Temps+16]
  mov [di], ax
  mov bp, g11
  mov ax, 1
  jmp [bp]

L64: ; Arm: 146'19
  mov ax, [si]
  mov [di], ax
  mov bp, g34
  mov ax, 1
  jmp [bp]

L65: ; Arm: 149'17
  mov ax, [si]
  mov [di], ax
  mov bp, g34
  mov ax, 1
  jmp [bp]

L66: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g34
  mov ax, 1
  jmp [bp]

L67: ; Arm: 153'28
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
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov ax, ` `
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov ax, [Temps+12]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L68: ; Arm: 154'29
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+4], ax
  mov ax, ` `
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov ax, ` `
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+14], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+16], ax
  mov ax, ` `
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+18], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+20], ax
  mov ax, [Temps+20]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L69: ; Arm: 155'32
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, ` `
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov ax, ` `
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+14], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+16], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+18], ax
  mov ax, ` `
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+20], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+22], ax
  mov ax, [Temps+22]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L70: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L66
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [si]
  cmp word [bx], 3
  jz L67
  mov ax, [bp+6]
  cmp word ax, 65
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L68
  mov ax, 253
  cmp word ax, [bp+6]
  call Bare_make_bool_from_n
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L69
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, ` `
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov ax, [Temps+10]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L71: ; Arm: 6'9
  mov ax, g36
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L72: ; Arm: 147'21
  mov bx, [si]
  cmp word [bx], 1
  jz L65
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
  push word [Temps+18]
  push word [Temps+16]
  push word [CurrentCont]
  push word L70
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+20]
  cmp word [bx], 3
  jz L71
  mov ax, g37
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L73: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g34
  mov ax, 1
  jmp [bp]

L74: ; Arm: 100'19
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+18], ax
  mov ax, [Temps+18]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L75: ; Arm: 101'22
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+20], ax
  mov ax, [Temps+20]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L76: ; Arm: 102'16
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+22], ax
  mov ax, [Temps+22]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L77: ; Function: (readloop,g34)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
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
  jz L62
  mov ax, [Temps+2]
  cmp word ax, `\x04`
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L63
  mov ax, 255
  cmp word ax, [Temps+4]
  call Bare_make_bool_from_n
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L64
  mov ax, [Temps+4]
  cmp word ax, 255
  call Bare_make_bool_from_z
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L72
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
  push word [si]
  push word [CurrentCont]
  push word L73
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+16]
  cmp word [bx], 3
  jz L74
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+18], ax
  mov bx, [Temps+18]
  cmp word [bx], 3
  jz L75
  mov ax, 53
  cmp word ax, [Temps+14]
  call Bare_make_bool_from_n
  mov [Temps+20], ax
  mov bx, [Temps+20]
  cmp word [bx], 3
  jz L76
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
  mov ax, [Temps+30]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L78: ; Arm: 229'36
  mov ax, g39
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L79: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g31
  mov ax, 1
  jmp [bp]

L80: ; Arm: 221'7
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L81: ; Arm: 192'9
  mov ax, g42
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L82: ; Arm: 196'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L83: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  mov bx, [si]
  cmp word [bx], 3
  jz L82
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [bp+4]
  mov ax, 1
  jmp [bp]

L84: ; Function: (loop,t3)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  mov bx, [si]
  cmp word [bx], 1
  jz L81
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [Temps+8]
  push word [Temps+4]
  push word bp
  push word [CurrentCont]
  push word L83
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov ax, [bp+2]
  mov [di+2], ax
  mov bp, g21
  mov ax, 2
  jmp [bp]

L85: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L86: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L85
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L87: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L86
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L88: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L87
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g9
  mov ax, 1
  jmp [bp]

L89: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L88
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g7
  mov ax, 2
  jmp [bp]

L90: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L89
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g50
  mov [di], ax
  mov ax, [bp+6]
  mov [di+2], ax
  mov bp, g7
  mov ax, 2
  jmp [bp]

L91: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L90
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L92: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L91
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g49
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L93: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L92
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g9
  mov ax, 1
  jmp [bp]

L94: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L93
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g7
  mov ax, 2
  jmp [bp]

L95: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L94
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g48
  mov [di], ax
  mov ax, [bp+6]
  mov [di+2], ax
  mov bp, g7
  mov ax, 2
  jmp [bp]

L96: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L95
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L97: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L96
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L98: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L97
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g9
  mov ax, 1
  jmp [bp]

L99: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L98
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g7
  mov ax, 2
  jmp [bp]

L100: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L99
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g47
  mov [di], ax
  mov ax, [bp+8]
  mov [di+2], ax
  mov bp, g7
  mov ax, 2
  jmp [bp]

L101: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L100
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L102: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L101
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g46
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L103: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L102
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g9
  mov ax, 1
  jmp [bp]

L104: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L103
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g7
  mov ax, 2
  jmp [bp]

L105: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L104
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g45
  mov [di], ax
  mov ax, [bp+8]
  mov [di+2], ax
  mov bp, g7
  mov ax, 2
  jmp [bp]

L106: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L105
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g44
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L107: ; Arm: 213'9
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L106
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g43
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L108: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L109: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L108
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L110: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L109
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L111: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L110
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g9
  mov ax, 1
  jmp [bp]

L112: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L111
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g7
  mov ax, 2
  jmp [bp]

L113: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L112
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g58
  mov [di], ax
  mov ax, [bp+6]
  mov [di+2], ax
  mov bp, g7
  mov ax, 2
  jmp [bp]

L114: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L113
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L115: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L114
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g57
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L116: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L115
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g9
  mov ax, 1
  jmp [bp]

L117: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L116
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g7
  mov ax, 2
  jmp [bp]

L118: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L117
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g56
  mov [di], ax
  mov ax, [bp+6]
  mov [di+2], ax
  mov bp, g7
  mov ax, 2
  jmp [bp]

L119: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L118
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L120: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L119
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L121: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L120
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g9
  mov ax, 1
  jmp [bp]

L122: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L121
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g7
  mov ax, 2
  jmp [bp]

L123: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L122
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g55
  mov [di], ax
  mov ax, [bp+8]
  mov [di+2], ax
  mov bp, g7
  mov ax, 2
  jmp [bp]

L124: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L123
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L125: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L124
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g54
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L126: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L125
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g9
  mov ax, 1
  jmp [bp]

L127: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L126
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g7
  mov ax, 2
  jmp [bp]

L128: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L127
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g53
  mov [di], ax
  mov ax, [bp+8]
  mov [di+2], ax
  mov bp, g7
  mov ax, 2
  jmp [bp]

L129: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L128
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g52
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L130: ; Arm: 216'14
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L129
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g51
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L131: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  mov bx, [si]
  cmp word [bx], 1
  jz L107
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L130
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  mov ax, [bp+4]
  mov [di], ax
  mov ax, [bp+8]
  mov [di+2], ax
  mov bp, [Temps+6]
  mov ax, 2
  jmp [bp]

L132: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(24)
  push word [CurrentCont]
  push word L79
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [si]
  cmp word [bx], 1
  jz L80
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+2]
  push word L84
  mov [Temps+6], sp
  push word 4 ;; scanned
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+4]
  push word [CurrentCont]
  push word L131
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [Temps+6]
  mov ax, 1
  jmp [bp]

L133: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L132
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g41
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g7
  mov ax, 2
  jmp [bp]

L134: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L133
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g40
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g28
  mov ax, 2
  jmp [bp]

L135: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  mov bx, [si]
  cmp word [bx], 3
  jz L78
  push word [bp+4]
  push word [CurrentCont]
  push word L134
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L136: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L135
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, [bp+6]
  mov [di+2], ax
  mov bp, g21
  mov ax, 2
  jmp [bp]

L137: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L136
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g38
  mov [di], ax
  mov bp, g34
  mov ax, 1
  jmp [bp]

L138: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(16)
  push word g33
  push word `\x04`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L137
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g9
  mov ax, 1
  jmp [bp]

L139: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L138
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L140: ; Function: (mainloop,g31)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L139
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g32
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L141: ; Arm: 345'11
  mov ax, [si]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L142: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov bx, [si]
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L143: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  mov ax, [bp+4]
  mov bx, 5
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  push word [si]
  push word [CurrentCont]
  push word L142
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g59
  mov ax, 1
  jmp [bp]

L144: ; Function: (fib,g59)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  mov ax, [si]
  cmp word ax, 5
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L141
  mov ax, [si]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+4], ax
  push word [si]
  push word [CurrentCont]
  push word L143
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g59
  mov ax, 1
  jmp [bp]

L145: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L146: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L145
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L147: ; Arm: 250'7
  push word [si]
  push word [CurrentCont]
  push word L146
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g67
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L148: ; Arm: 192'9
  mov ax, g68
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L149: ; Arm: 196'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L150: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  mov bx, [si]
  cmp word [bx], 3
  jz L149
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [bp+4]
  mov ax, 1
  jmp [bp]

L151: ; Function: (loop,t3)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  mov bx, [si]
  cmp word [bx], 1
  jz L148
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [Temps+8]
  push word [Temps+4]
  push word bp
  push word [CurrentCont]
  push word L150
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov ax, [bp+2]
  mov [di+2], ax
  mov bp, g21
  mov ax, 2
  jmp [bp]

L152: ; Arm: 192'9
  mov ax, g77
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L153: ; Arm: 196'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L154: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  mov bx, [si]
  cmp word [bx], 3
  jz L153
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [bp+4]
  mov ax, 1
  jmp [bp]

L155: ; Function: (loop,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  mov bx, [si]
  cmp word [bx], 1
  jz L152
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [Temps+8]
  push word [Temps+4]
  push word bp
  push word [CurrentCont]
  push word L154
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov ax, [bp+2]
  mov [di+2], ax
  mov bp, g21
  mov ax, 2
  jmp [bp]

L156: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L157: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L156
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L158: ; Arm: 243'11
  push word g81
  push word [bp+4]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g78
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L157
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L159: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L160: ; Arm: 246'16
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L159
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L161: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L162: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L161
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L163: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(22)
  mov bx, [si]
  cmp word [bx], 1
  jz L158
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L160
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word g85
  push word [bp+4]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [Temps+8]
  push word g82
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L162
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+10]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L164: ; Function: (lamN,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [si]
  push word L155
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [si]
  push word [CurrentCont]
  push word L163
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+2]
  mov [di], ax
  mov bp, [Temps+2]
  mov ax, 1
  jmp [bp]

L165: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L166: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [bp+4]
  push word L164
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L165
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov ax, [bp+6]
  mov [di+2], ax
  mov bp, g4
  mov ax, 2
  jmp [bp]

L167: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L168: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L167
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L169: ; Arm: 243'11
  push word g72
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g69
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L168
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L170: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L171: ; Arm: 246'16
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L170
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L172: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L173: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L172
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L174: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(32)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L166
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [si]
  cmp word [bx], 1
  jz L169
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L171
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word g76
  push word [bp+6]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [Temps+8]
  push word g73
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L173
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+10]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L175: ; Function: (lamN,g86)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(18)
  mov bx, [si+2]
  cmp word [bx], 1
  jz L147
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+2]
  push word L151
  mov [Temps+6], sp
  push word 4 ;; scanned
  push word [Temps+4]
  push word [Temps+2]
  push word [si]
  push word [CurrentCont]
  push word L174
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, [Temps+6]
  mov ax, 1
  jmp [bp]

L176: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L177: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L176
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L178: ; Arm: 287'7
  push word [si]
  push word [CurrentCont]
  push word L177
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g91
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L179: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L180: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L179
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L181: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L180
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L182: ; Arm: 290'10
  push word g95
  push word [Temps+2]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word g92
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [si]
  push word [CurrentCont]
  push word L181
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L183: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L184: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L183
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L185: ; Arm: 293'12
  mov ax, [bx+2]
  mov [Temps+10], ax
  mov ax, [bx+4]
  mov [Temps+12], ax
  push word [si]
  push word [CurrentCont]
  push word L184
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g96
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L186: ; Arm: 192'9
  mov ax, g97
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L187: ; Arm: 196'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L188: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  mov bx, [si]
  cmp word [bx], 3
  jz L187
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [bp+4]
  mov ax, 1
  jmp [bp]

L189: ; Function: (loop,t5)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  mov bx, [si]
  cmp word [bx], 1
  jz L186
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [Temps+8]
  push word [Temps+4]
  push word bp
  push word [CurrentCont]
  push word L188
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov ax, [bp+2]
  mov [di+2], ax
  mov bp, g21
  mov ax, 2
  jmp [bp]

L190: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L191: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L190
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L192: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L191
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L193: ; Arm: 296'15
  push word g101
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g98
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L192
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L194: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(24)
  mov bx, [si]
  cmp word [bx], 1
  jz L193
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [bp+8]
  push word 1
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word [Temps+4]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L195: ; Function: (lamN,g102)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(24)
  mov bx, [si+2]
  cmp word [bx], 1
  jz L178
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 1
  jz L182
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L185
  push word [Temps+2]
  push word L189
  mov [Temps+10], sp
  push word 4 ;; scanned
  push word [Temps+6]
  push word [Temps+2]
  push word [si]
  push word [CurrentCont]
  push word L194
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, [Temps+10]
  mov ax, 1
  jmp [bp]

L196: ; Arm: 144'22
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov ax, [si]
  mov [di], ax
  mov bp, g11
  mov ax, 1
  jmp [bp]

L197: ; Arm: 145'28
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
  push word [si]
  push word `\x04`
  push word 3
  mov [Temps+16], sp
  push word 6 ;; scanned
  mov ax, [Temps+16]
  mov [di], ax
  mov bp, g11
  mov ax, 1
  jmp [bp]

L198: ; Arm: 146'19
  mov ax, [si]
  mov [di], ax
  mov bp, g110
  mov ax, 1
  jmp [bp]

L199: ; Arm: 149'17
  mov ax, [si]
  mov [di], ax
  mov bp, g110
  mov ax, 1
  jmp [bp]

L200: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g110
  mov ax, 1
  jmp [bp]

L201: ; Arm: 153'28
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
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov ax, ` `
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov ax, [Temps+12]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L202: ; Arm: 154'29
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+4], ax
  mov ax, ` `
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov ax, ` `
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+14], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+16], ax
  mov ax, ` `
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+18], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+20], ax
  mov ax, [Temps+20]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L203: ; Arm: 155'32
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, ` `
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov ax, ` `
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+14], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+16], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+18], ax
  mov ax, ` `
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+20], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+22], ax
  mov ax, [Temps+22]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L204: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L200
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [si]
  cmp word [bx], 3
  jz L201
  mov ax, [bp+6]
  cmp word ax, 65
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L202
  mov ax, 253
  cmp word ax, [bp+6]
  call Bare_make_bool_from_n
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L203
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, ` `
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov ax, `\x08`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov ax, [Temps+10]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L205: ; Arm: 6'9
  mov ax, g112
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L206: ; Arm: 147'21
  mov bx, [si]
  cmp word [bx], 1
  jz L199
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
  push word [Temps+18]
  push word [Temps+16]
  push word [CurrentCont]
  push word L204
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+20]
  cmp word [bx], 3
  jz L205
  mov ax, g113
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L207: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g110
  mov ax, 1
  jmp [bp]

L208: ; Arm: 100'19
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+18], ax
  mov ax, [Temps+18]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L209: ; Arm: 101'22
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+20], ax
  mov ax, [Temps+20]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L210: ; Arm: 102'16
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+22], ax
  mov ax, [Temps+22]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L211: ; Function: (readloop,g110)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
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
  jz L196
  mov ax, [Temps+2]
  cmp word ax, `\x04`
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L197
  mov ax, 255
  cmp word ax, [Temps+4]
  call Bare_make_bool_from_n
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L198
  mov ax, [Temps+4]
  cmp word ax, 255
  call Bare_make_bool_from_z
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L206
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
  push word [si]
  push word [CurrentCont]
  push word L207
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+16]
  cmp word [bx], 3
  jz L208
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+18], ax
  mov bx, [Temps+18]
  cmp word [bx], 3
  jz L209
  mov ax, 53
  cmp word ax, [Temps+14]
  call Bare_make_bool_from_n
  mov [Temps+20], ax
  mov bx, [Temps+20]
  cmp word [bx], 3
  jz L210
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
  mov ax, [Temps+30]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L212: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L213: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L212
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L214: ; Arm: 325'7
  push word [si]
  push word [CurrentCont]
  push word L213
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g121
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L215: ; Arm: 192'9
  mov ax, g122
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L216: ; Arm: 196'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L217: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  mov bx, [si]
  cmp word [bx], 3
  jz L216
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [bp+4]
  mov ax, 1
  jmp [bp]

L218: ; Function: (loop,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  mov bx, [si]
  cmp word [bx], 1
  jz L215
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [Temps+8]
  push word [Temps+4]
  push word bp
  push word [CurrentCont]
  push word L217
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov ax, [bp+2]
  mov [di+2], ax
  mov bp, g21
  mov ax, 2
  jmp [bp]

L219: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L220: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L219
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L221: ; Arm: 318'11
  push word g125
  push word [bp+4]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L220
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L222: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L223: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L222
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L224: ; Arm: 321'16
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word g128
  push word [bp+4]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L223
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L225: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L226: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L225
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L227: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  mov bx, [si]
  cmp word [bx], 1
  jz L221
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L224
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word g131
  push word [bp+4]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L226
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L228: ; Function: (lamN,t3)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [si]
  push word L218
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [si]
  push word [CurrentCont]
  push word L227
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+2]
  mov [di], ax
  mov bp, [Temps+2]
  mov ax, 1
  jmp [bp]

L229: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L230: ; Function: (lamN,g132)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(14)
  mov bx, [si+2]
  cmp word [bx], 1
  jz L214
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [si]
  push word L228
  mov [Temps+6], sp
  push word 4 ;; scanned
  push word [si]
  push word [CurrentCont]
  push word L229
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov ax, [si+2]
  mov [di+2], ax
  mov bp, g4
  mov ax, 2
  jmp [bp]

L231: ; Function: (lamN,g138)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov bx, [si]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L232: ; Arm: 203'9
  mov ax, g140
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L233: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g139
  mov ax, 1
  jmp [bp]

L234: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L233
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L235: ; Function: (loop,g139)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  mov bx, [si]
  cmp word [bx], 1
  jz L232
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, ` `
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  push word [Temps+4]
  push word [CurrentCont]
  push word L234
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L236: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L237: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L236
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L238: ; Arm: 235'9
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [si]
  push word [CurrentCont]
  push word L237
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g137
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L239: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L240: ; Arm: 207'9
  mov ax, g141
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L241: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g139
  mov ax, 1
  jmp [bp]

L242: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L241
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L243: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(16)
  push word [bp+4]
  push word [CurrentCont]
  push word L239
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [si]
  cmp word [bx], 1
  jz L240
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [CurrentCont]
  push word L242
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L244: ; Function: (lamN,g142)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(8)
  mov bx, [si+2]
  cmp word [bx], 3
  jz L238
  push word [si]
  push word [CurrentCont]
  push word L243
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g138
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g2
  mov ax, 2
  jmp [bp]

L245: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L246: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L245
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L247: ; Arm: 264'7
  push word [si]
  push word [CurrentCont]
  push word L246
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g147
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L248: ; Arm: 192'9
  mov ax, g148
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L249: ; Arm: 196'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L250: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  mov bx, [si]
  cmp word [bx], 3
  jz L249
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [bp+4]
  mov ax, 1
  jmp [bp]

L251: ; Function: (loop,t3)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  mov bx, [si]
  cmp word [bx], 1
  jz L248
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [Temps+8]
  push word [Temps+4]
  push word bp
  push word [CurrentCont]
  push word L250
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov ax, [bp+2]
  mov [di+2], ax
  mov bp, g21
  mov ax, 2
  jmp [bp]

L252: ; Arm: 192'9
  mov ax, g157
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L253: ; Arm: 196'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L254: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  mov bx, [si]
  cmp word [bx], 3
  jz L253
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [bp+4]
  mov ax, 1
  jmp [bp]

L255: ; Function: (loop,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  mov bx, [si]
  cmp word [bx], 1
  jz L252
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [Temps+8]
  push word [Temps+4]
  push word bp
  push word [CurrentCont]
  push word L254
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov ax, [bp+2]
  mov [di+2], ax
  mov bp, g21
  mov ax, 2
  jmp [bp]

L256: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L257: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L256
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L258: ; Arm: 257'11
  push word g161
  push word [bp+4]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g158
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L257
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L259: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L260: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L259
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L261: ; Arm: 260'16
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word g165
  push word [bp+4]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word g162
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L260
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L262: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L263: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(22)
  mov bx, [si]
  cmp word [bx], 1
  jz L258
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L261
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [CurrentCont]
  push word L262
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L264: ; Function: (lamN,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [si]
  push word L255
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [si]
  push word [CurrentCont]
  push word L263
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+2]
  mov [di], ax
  mov bp, [Temps+2]
  mov ax, 1
  jmp [bp]

L265: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L266: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [bp+4]
  push word L264
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L265
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov ax, [bp+6]
  mov [di+2], ax
  mov bp, g4
  mov ax, 2
  jmp [bp]

L267: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L268: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L267
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L269: ; Arm: 257'11
  push word g152
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g149
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L268
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L270: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L271: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L270
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L272: ; Arm: 260'16
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word g156
  push word [bp+6]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word g153
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L271
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L273: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L274: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(32)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L266
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [si]
  cmp word [bx], 1
  jz L269
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L272
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [CurrentCont]
  push word L273
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L275: ; Function: (lamN,g166)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(18)
  mov bx, [si+2]
  cmp word [bx], 1
  jz L247
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+2]
  push word L251
  mov [Temps+6], sp
  push word 4 ;; scanned
  push word [Temps+4]
  push word [Temps+2]
  push word [si]
  push word [CurrentCont]
  push word L274
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, [Temps+6]
  mov ax, 1
  jmp [bp]

L276: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L277: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L276
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L278: ; Arm: 302'7
  push word [si]
  push word [CurrentCont]
  push word L277
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g171
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L279: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L280: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L279
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L281: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L280
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L282: ; Arm: 305'10
  push word g175
  push word [Temps+2]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word g172
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [si]
  push word [CurrentCont]
  push word L281
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L283: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L284: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L283
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L285: ; Arm: 308'12
  mov ax, [bx+2]
  mov [Temps+10], ax
  mov ax, [bx+4]
  mov [Temps+12], ax
  push word [si]
  push word [CurrentCont]
  push word L284
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g176
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L286: ; Arm: 192'9
  mov ax, g177
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L287: ; Arm: 196'35
  push word [bp+8]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L288: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  mov bx, [si]
  cmp word [bx], 3
  jz L287
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [bp+4]
  mov ax, 1
  jmp [bp]

L289: ; Function: (loop,t5)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  mov bx, [si]
  cmp word [bx], 1
  jz L286
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [Temps+8]
  push word [Temps+4]
  push word bp
  push word [CurrentCont]
  push word L288
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov ax, [bp+2]
  mov [di+2], ax
  mov bp, g21
  mov ax, 2
  jmp [bp]

L290: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L291: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L290
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L292: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L291
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L293: ; Arm: 311'15
  push word g181
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g178
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L292
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L294: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, g186
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L295: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L294
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L296: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L295
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L297: ; Arm: 270'9
  push word g185
  push word [bp+2]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g182
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L296
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L298: ; Arm: 275'35
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L299: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(16)
  push word [bp+6]
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [si]
  push word [Temps+2]
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L300: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  mov bx, [si]
  cmp word [bx], 3
  jz L298
  push word [bp+10]
  push word [bp+8]
  push word [CurrentCont]
  push word L299
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [bp+4]
  mov ax, 1
  jmp [bp]

L301: ; Function: (loop,t2)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(22)
  mov bx, [si]
  cmp word [bx], 1
  jz L297
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [Temps+8]
  push word [Temps+6]
  push word [Temps+4]
  push word bp
  push word [CurrentCont]
  push word L300
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov ax, [bp+2]
  mov [di+2], ax
  mov bp, g21
  mov ax, 2
  jmp [bp]

L302: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(16)
  push word [bp+6]
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [si]
  push word [Temps+2]
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L303: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(24)
  mov bx, [si]
  cmp word [bx], 1
  jz L293
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [bp+6]
  push word L301
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word [bp+8]
  push word [CurrentCont]
  push word L302
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [Temps+4]
  mov ax, 1
  jmp [bp]

L304: ; Function: (lamN,g187)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(24)
  mov bx, [si+2]
  cmp word [bx], 1
  jz L278
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 1
  jz L282
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L285
  push word [Temps+2]
  push word L289
  mov [Temps+10], sp
  push word 4 ;; scanned
  push word [Temps+6]
  push word [Temps+2]
  push word [si]
  push word [CurrentCont]
  push word L303
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, [Temps+10]
  mov ax, 1
  jmp [bp]

L305: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, g197
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L306: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L305
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L307: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L306
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L308: ; Arm: 270'9
  push word g196
  push word [bp+2]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word g193
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L307
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L309: ; Arm: 275'35
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L310: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(16)
  push word [bp+6]
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [si]
  push word [Temps+2]
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L311: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  mov bx, [si]
  cmp word [bx], 3
  jz L309
  push word [bp+10]
  push word [bp+8]
  push word [CurrentCont]
  push word L310
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [bp+4]
  mov ax, 1
  jmp [bp]

L312: ; Function: (loop,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(22)
  mov bx, [si]
  cmp word [bx], 1
  jz L308
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [Temps+8]
  push word [Temps+6]
  push word [Temps+4]
  push word bp
  push word [CurrentCont]
  push word L311
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov ax, [bp+2]
  mov [di+2], ax
  mov bp, g21
  mov ax, 2
  jmp [bp]

L313: ; Function: (lamN,g198)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(6)
  push word [si+2]
  push word L312
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, [Temps+2]
  mov ax, 1
  jmp [bp]

L314: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L315: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L314
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L316: ; Arm: 282'7
  push word [si]
  push word [CurrentCont]
  push word L315
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g192
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L317: ; Function: (lamN,g199)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(8)
  mov bx, [si+2]
  cmp word [bx], 1
  jz L316
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, g198
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov ax, [si+2]
  mov [di+4], ax
  mov bp, g6
  mov ax, 3
  jmp [bp]

L318: ; Arm: 367'9
  push word [si]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L319: ; Arm: 370'15
  mov ax, g217
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L320: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov bx, [si]
  cmp word [bx], 1
  jz L319
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, 21
  sar ax, 1
  mov bx, [bp+4]
  sar bx, 1
  mul bx
  shl ax, 1
  add ax, 1
  mov [Temps+4], ax
  mov ax, [Temps+4]
  mov bx, [Temps+2]
  add ax, bx
  sub ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  mov [di], ax
  mov ax, [bp+6]
  mov [di+2], ax
  mov bp, g210
  mov ax, 2
  jmp [bp]

L321: ; Arm: 362'27
  push word [bp+4]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L322: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  mov bx, [si]
  cmp word [bx], 3
  jz L321
  mov ax, g215
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L323: ; Arm: 6'9
  mov ax, g213
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L324: ; Arm: 362'12
  mov ax, 19
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+8]
  push word [CurrentCont]
  push word L322
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L323
  mov ax, g214
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L325: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(18)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L320
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [si]
  cmp word [bx], 3
  jz L324
  mov ax, g216
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L326: ; Arm: 6'9
  mov ax, g211
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L327: ; Function: (loop,g210)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(12)
  mov bx, [si+2]
  cmp word [bx], 1
  jz L318
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
  mov bx, 97
  sub ax, bx
  add ax, 1
  mov [Temps+8], ax
  mov ax, [Temps+8]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+10], ax
  push word [Temps+8]
  push word [Temps+4]
  push word [si]
  push word [CurrentCont]
  push word L325
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L326
  mov ax, g212
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L328: ; Arm: 116'13
  mov ax, [si]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L329: ; Function: (loop,g221)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(8)
  mov ax, [si+2]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L328
  mov ax, [si+2]
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
  mov ax, [si+2]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+10], ax
  push word [si]
  push word [Temps+8]
  push word 3
  mov [Temps+12], sp
  push word 6 ;; scanned
  mov ax, [Temps+12]
  mov [di], ax
  mov ax, [Temps+10]
  mov [di+2], ax
  mov bp, g221
  mov ax, 2
  jmp [bp]

L330: ; Arm: 116'13
  mov ax, [si]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L331: ; Function: (loop,g224)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(8)
  mov ax, [si+2]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L330
  mov ax, [si+2]
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
  mov ax, [si+2]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+10], ax
  push word [si]
  push word [Temps+8]
  push word 3
  mov [Temps+12], sp
  push word 6 ;; scanned
  mov ax, [Temps+12]
  mov [di], ax
  mov ax, [Temps+10]
  mov [di+2], ax
  mov bp, g224
  mov ax, 2
  jmp [bp]

L332: ; Arm: 116'13
  mov ax, [si]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L333: ; Function: (loop,g228)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(8)
  mov ax, [si+2]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L332
  mov ax, [si+2]
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
  mov ax, [si+2]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+10], ax
  push word [si]
  push word [Temps+8]
  push word 3
  mov [Temps+12], sp
  push word 6 ;; scanned
  mov ax, [Temps+12]
  mov [di], ax
  mov ax, [Temps+10]
  mov [di+2], ax
  mov bp, g228
  mov ax, 2
  jmp [bp]

L334: ; Arm: 116'13
  mov ax, [si]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L335: ; Function: (loop,g231)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(8)
  mov ax, [si+2]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L334
  mov ax, [si+2]
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
  mov ax, [si+2]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+10], ax
  push word [si]
  push word [Temps+8]
  push word 3
  mov [Temps+12], sp
  push word 6 ;; scanned
  mov ax, [Temps+12]
  mov [di], ax
  mov ax, [Temps+10]
  mov [di+2], ax
  mov bp, g231
  mov ax, 2
  jmp [bp]

L336: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L337: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L336
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L338: ; Arm: 377'7
  push word [si]
  push word [CurrentCont]
  push word L337
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g208
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L339: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L340: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L339
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L341: ; Arm: 380'12
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [si]
  push word [CurrentCont]
  push word L340
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g209
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L342: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L343: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L342
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L344: ; Arm: 383'15
  push word [bp+4]
  push word [CurrentCont]
  push word L343
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g218
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L345: ; Arm: 349'13
  mov ax, g219
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L346: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, [bp+4]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+4], ax
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [bp+6]
  mov ax, 1
  jmp [bp]

L347: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [si]
  push word `-`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L348: ; Arm: 119'11
  push word g229
  push word `0`
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L349: ; Arm: 123'2
  mov ax, 1
  mov bx, [bp+8]
  sub ax, bx
  add ax, 1
  mov [Temps+4], ax
  mov ax, [Temps+4]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word [CurrentCont]
  push word L347
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L348
  mov ax, g230
  mov [di], ax
  mov ax, [Temps+4]
  mov [di+2], ax
  mov bp, g228
  mov ax, 2
  jmp [bp]

L350: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L351: ; Arm: 119'11
  push word g232
  push word `0`
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L352: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(24)
  mov ax, [bp+8]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L346
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L349
  mov ax, [bp+8]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L350
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L351
  mov ax, g233
  mov [di], ax
  mov ax, [bp+8]
  mov [di+2], ax
  mov bp, g231
  mov ax, 2
  jmp [bp]

L353: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L352
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L354: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L353
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g227
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L355: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [si]
  push word `-`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L356: ; Arm: 119'11
  push word g222
  push word `0`
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L357: ; Arm: 123'2
  mov ax, 1
  mov bx, [bp+4]
  sub ax, bx
  add ax, 1
  mov [Temps+4], ax
  mov ax, [Temps+4]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word [CurrentCont]
  push word L355
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L356
  mov ax, g223
  mov [di], ax
  mov ax, [Temps+4]
  mov [di+2], ax
  mov bp, g221
  mov ax, 2
  jmp [bp]

L358: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L359: ; Arm: 119'11
  push word g225
  push word `0`
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L360: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(26)
  mov ax, [bp+4]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L354
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L357
  mov ax, [bp+4]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L358
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L359
  mov ax, g226
  mov [di], ax
  mov ax, [bp+4]
  mov [di+2], ax
  mov bp, g224
  mov ax, 2
  jmp [bp]

L361: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L360
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L362: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L361
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g220
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L363: ; Function: (loop,t2)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  mov ax, [bp+2]
  cmp word ax, [si]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L345
  push word bp
  push word [si]
  push word [CurrentCont]
  push word L362
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g59
  mov ax, 1
  jmp [bp]

L364: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L365: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  mov bx, [si]
  cmp word [bx], 1
  jz L344
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word L363
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L364
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, 1
  mov [di], ax
  mov bp, [Temps+4]
  mov ax, 1
  jmp [bp]

L366: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L365
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, 1
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g210
  mov ax, 2
  jmp [bp]

L367: ; Function: (lamN,g234)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(8)
  mov bx, [si+2]
  cmp word [bx], 1
  jz L338
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L341
  push word [si]
  push word [CurrentCont]
  push word L366
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L368: ; Arm: 116'13
  mov ax, [si]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L369: ; Function: (loop,g240)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(8)
  mov ax, [si+2]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L368
  mov ax, [si+2]
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
  mov ax, [si+2]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+10], ax
  push word [si]
  push word [Temps+8]
  push word 3
  mov [Temps+12], sp
  push word 6 ;; scanned
  mov ax, [Temps+12]
  mov [di], ax
  mov ax, [Temps+10]
  mov [di+2], ax
  mov bp, g240
  mov ax, 2
  jmp [bp]

L370: ; Arm: 116'13
  mov ax, [si]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L371: ; Function: (loop,g243)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(8)
  mov ax, [si+2]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L370
  mov ax, [si+2]
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
  mov ax, [si+2]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+10], ax
  push word [si]
  push word [Temps+8]
  push word 3
  mov [Temps+12], sp
  push word 6 ;; scanned
  mov ax, [Temps+12]
  mov [di], ax
  mov ax, [Temps+10]
  mov [di+2], ax
  mov bp, g243
  mov ax, 2
  jmp [bp]

L372: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L373: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [si]
  push word `-`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L374: ; Arm: 119'11
  push word g241
  push word `0`
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  mov ax, [Temps+10]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L375: ; Arm: 123'2
  mov ax, 1
  mov bx, [Temps+2]
  sub ax, bx
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  push word [CurrentCont]
  push word L373
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L374
  mov ax, g242
  mov [di], ax
  mov ax, [Temps+6]
  mov [di+2], ax
  mov bp, g240
  mov ax, 2
  jmp [bp]

L376: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L377: ; Arm: 119'11
  push word g244
  push word `0`
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L378: ; Function: (lamN,g246)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(22)
  call Bare_free_words
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov ax, [Temps+2]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+4], ax
  push word [si]
  push word [CurrentCont]
  push word L372
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L375
  mov ax, [Temps+2]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word [CurrentCont]
  push word L376
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L377
  mov ax, g245
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov bp, g243
  mov ax, 2
  jmp [bp]

L379: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L380: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L379
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L381: ; Arm: 330'7
  push word [si]
  push word [CurrentCont]
  push word L380
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g107
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L382: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L383: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L382
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L384: ; Arm: 333'12
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [si]
  push word [CurrentCont]
  push word L383
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g108
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L385: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L386: ; Arm: 338'44
  push word [CurrentCont]
  push word L385
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g115
  mov [di], ax
  mov ax, [bp+4]
  mov [di+2], ax
  mov bp, g7
  mov ax, 2
  jmp [bp]

L387: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [si]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [bp+6]
  mov ax, 1
  jmp [bp]

L388: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L387
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g9
  mov ax, 1
  jmp [bp]

L389: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L388
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g7
  mov ax, 2
  jmp [bp]

L390: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L389
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g117
  mov [di], ax
  mov ax, [bp+8]
  mov [di+2], ax
  mov bp, g7
  mov ax, 2
  jmp [bp]

L391: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L390
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g116
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L392: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  mov bx, [si]
  cmp word [bx], 3
  jz L386
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L391
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L393: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [si]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L392
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, [bp+4]
  mov [di+2], ax
  mov bp, g21
  mov ax, 2
  jmp [bp]

L394: ; Function: (loop,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word bp
  push word [si]
  push word [bp+2]
  push word [CurrentCont]
  push word L393
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g114
  mov [di], ax
  mov bp, g110
  mov ax, 1
  jmp [bp]

L395: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(22)
  push word [si]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word [bp+6]
  push word 1
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word [Temps+4]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L396: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(16)
  push word [bp+4]
  push word L394
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L395
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g118
  mov [di], ax
  mov bp, [Temps+2]
  mov ax, 1
  jmp [bp]

L397: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L396
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L398: ; Function: (lamN,t1)
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(12)
  mov bx, [si+2]
  cmp word [bx], 1
  jz L381
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L384
  push word [Temps+2]
  push word [si]
  push word [bp+2]
  push word [CurrentCont]
  push word L397
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g109
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L399: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(54)
  push word [bp+4]
  push word L398
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word g106
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [Temps+4]
  push word g105
  push word 1
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word g257
  push word [Temps+6]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [Temps+8]
  push word g104
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [Temps+10]
  push word g88
  push word 3
  mov [Temps+12], sp
  push word 6 ;; scanned
  push word [Temps+12]
  push word g64
  push word 3
  mov [Temps+14], sp
  push word 6 ;; scanned
  mov ax, [Temps+14]
  mov [di], ax
  mov bp, g31
  mov ax, 1
  jmp [bp]

L400: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L399
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g25
  mov ax, 1
  jmp [bp]

L401: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L400
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g60
  mov [di], ax
  mov bp, g13
  mov ax, 1
  jmp [bp]

L402: ; Start
  xchg si, di
  Bare_arg_check(0)
  Bare_heap_check(14)
  push word g27
  push word `\x04`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L401
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g9
  mov ax, 1
  jmp [bp]

g1:
  dw L3
g2:
  dw L7
g3:
  dw 1
g4:
  dw L10
g5:
  dw 1
g6:
  dw L13
g7:
  dw L15
g8:
  dw 1
g9:
  dw L21
g10:
  dw 1
g11:
  dw L27
g12:
  dw 1
g13:
  dw L30
g14:
  dw 1
g15:
  dw 3
g16:
  dw 1
g17:
  dw 3
g18:
  dw 1
g19:
  dw 3
g20:
  dw 1
g21:
  dw L39
g22:
  dw L46
g23:
  dw 1
  db ``
g24:
  dw 1
g25:
  dw L52
g26:
  dw 1
g27:
  dw 1
g28:
  dw L61
g29:
  dw L57
g30:
  dw 1
g31:
  dw L140
g32:
  dw 5
  db `% `
g33:
  dw 1
g34:
  dw L77
g35:
  dw 1
g36:
  dw 1
g37:
  dw 3
g38:
  dw 1
g39:
  dw 1
g40:
  dw 1
g41:
  dw 1
g42:
  dw 1
g43:
  dw 35
  db `command not found`
g44:
  dw 3
  db `\n`
g45:
  dw 1
g46:
  dw 5
  db `: `
g47:
  dw 1
g48:
  dw 1
g49:
  dw 13
  db `sham: `
g50:
  dw 1
g51:
  dw 35
  db `Permission denied`
g52:
  dw 3
  db `\n`
g53:
  dw 1
g54:
  dw 5
  db `: `
g55:
  dw 1
g56:
  dw 1
g57:
  dw 13
  db `sham: `
g58:
  dw 1
g59:
  dw L144
g60:
  dw 103
  db `Sham: In-memory file-system. Consider typing "ls".\n`
g61:
  dw 13
  db `readme`
g62:
  dw 165
  db `Welcome to sham; please try all the commands!\nCan you find the hidden Easter Egg?\n`
g63:
  dw 1, g62
g64:
  dw 1, g61, g63
g65:
  dw 7
  db `cat`
g66:
  dw 115
  db `cat - concatenate files and print on the standard output\n`
g67:
  dw 67
  db `cat: takes at least one argument\n`
g68:
  dw 1
g69:
  dw 11
  db `cat: `
g70:
  dw 59
  db ` : No such file or directory\n`
g71:
  dw 1
g72:
  dw 3, g70, g71
g73:
  dw 11
  db `cat: `
g74:
  dw 39
  db ` : Not a data file\n`
g75:
  dw 1
g76:
  dw 3, g74, g75
g77:
  dw 1
g78:
  dw 11
  db `cat: `
g79:
  dw 59
  db ` : No such file or directory\n`
g80:
  dw 1
g81:
  dw 3, g79, g80
g82:
  dw 11
  db `cat: `
g83:
  dw 39
  db ` : Not a data file\n`
g84:
  dw 1
g85:
  dw 3, g83, g84
g86:
  dw L175
g87:
  dw 3, g66, g86
g88:
  dw 1, g65, g87
g89:
  dw 5
  db `cp`
g90:
  dw 65
  db `cp - copy files and directories\n`
g91:
  dw 51
  db `cp: missing file operand\n`
g92:
  dw 89
  db `cp: missing destination file operand after '`
g93:
  dw 5
  db `'\n`
g94:
  dw 1
g95:
  dw 3, g93, g94
g96:
  dw 61
  db `cp: unexpected extra operands\n`
g97:
  dw 1
g98:
  dw 35
  db `cp: cannot stat '`
g99:
  dw 59
  db `': No such file or directory\n`
g100:
  dw 1
g101:
  dw 3, g99, g100
g102:
  dw L195
g103:
  dw 3, g90, g102
g104:
  dw 1, g89, g103
g105:
  dw 13
  db `create`
g106:
  dw 55
  db `create - create a new file\n`
g107:
  dw 53
  db `create: missing file name\n`
g108:
  dw 69
  db `create: unexpected extra operands\n`
g109:
  dw 69
  db `(to finish type ^D on a new line)\n`
g110:
  dw L211
g111:
  dw 1
g112:
  dw 1
g113:
  dw 3
g114:
  dw 1
g115:
  dw 1
g116:
  dw 3
  db `\n`
g117:
  dw 1
g118:
  dw 1
g119:
  dw 9
  db `file`
g120:
  dw 55
  db `file - determine file type\n`
g121:
  dw 69
  db `file: takes at least one argument\n`
g122:
  dw 1
g123:
  dw 59
  db ` : No such file or directory\n`
g124:
  dw 1
g125:
  dw 3, g123, g124
g126:
  dw 27
  db `: ASCII text\n`
g127:
  dw 1
g128:
  dw 3, g126, g127
g129:
  dw 27
  db `: executable\n`
g130:
  dw 1
g131:
  dw 3, g129, g130
g132:
  dw L230
g133:
  dw 3, g120, g132
g134:
  dw 1, g119, g133
g135:
  dw 5
  db `ls`
g136:
  dw 59
  db `ls - list directory contents\n`
g137:
  dw 47
  db `ls: takes no arguments\n`
g138:
  dw L231
g139:
  dw L235
g140:
  dw 1
g141:
  dw 1
g142:
  dw L244
g143:
  dw 3, g136, g142
g144:
  dw 1, g135, g143
g145:
  dw 7
  db `man`
g146:
  dw 103
  db `man - an interface to the system reference manuals\n`
g147:
  dw 61
  db `What manual page do you want?\n`
g148:
  dw 1
g149:
  dw 41
  db `No manual entry for `
g150:
  dw 3
  db `\n`
g151:
  dw 1
g152:
  dw 3, g150, g151
g153:
  dw 41
  db `No manual entry for `
g154:
  dw 3
  db `\n`
g155:
  dw 1
g156:
  dw 3, g154, g155
g157:
  dw 1
g158:
  dw 41
  db `No manual entry for `
g159:
  dw 3
  db `\n`
g160:
  dw 1
g161:
  dw 3, g159, g160
g162:
  dw 41
  db `No manual entry for `
g163:
  dw 3
  db `\n`
g164:
  dw 1
g165:
  dw 3, g163, g164
g166:
  dw L275
g167:
  dw 3, g146, g166
g168:
  dw 1, g145, g167
g169:
  dw 5
  db `mv`
g170:
  dw 51
  db `mv - move (rename) files\n`
g171:
  dw 51
  db `mv: missing file operand\n`
g172:
  dw 89
  db `mv: missing destination file operand after '`
g173:
  dw 5
  db `'\n`
g174:
  dw 1
g175:
  dw 3, g173, g174
g176:
  dw 61
  db `mv: unexpected extra operands\n`
g177:
  dw 1
g178:
  dw 35
  db `mv: cannot stat '`
g179:
  dw 59
  db `': No such file or directory\n`
g180:
  dw 1
g181:
  dw 3, g179, g180
g182:
  dw 39
  db `rm: cannot remove '`
g183:
  dw 59
  db `': No such file or directory\n`
g184:
  dw 1
g185:
  dw 3, g183, g184
g186:
  dw 1
g187:
  dw L304
g188:
  dw 3, g170, g187
g189:
  dw 1, g169, g188
g190:
  dw 5
  db `rm`
g191:
  dw 133
  db `rm - remove files or directories (directories not supported yet!)\n`
g192:
  dw 41
  db `rm: missing operand\n`
g193:
  dw 39
  db `rm: cannot remove '`
g194:
  dw 59
  db `': No such file or directory\n`
g195:
  dw 1
g196:
  dw 3, g194, g195
g197:
  dw 1
g198:
  dw L313
g199:
  dw L317
g200:
  dw 3, g191, g199
g201:
  dw 1, g190, g200
g202:
  dw 7
  db `cat`
g203:
  dw 439
  db `I have a little shadow that goes in and out with me,\nAnd what can be the use of him is more than I can see.\nHe is very, very like me from the heels up to the head;\nAnd I see him jump before me, when I jump into my bed.\n`
g204:
  dw 1, g203
g205:
  dw 1, g202, g204
g206:
  dw 7
  db `fib`
g207:
  dw 101
  db `fib - naive fib computation upto the given number\n`
g208:
  dw 45
  db `fib: missing argument\n`
g209:
  dw 69
  db `create: unexpected extra argument\n`
g210:
  dw L327
g211:
  dw 1
g212:
  dw 3
g213:
  dw 1
g214:
  dw 3
g215:
  dw 1
g216:
  dw 1
g217:
  dw 1
g218:
  dw 63
  db `fib: expected numeric argument\n`
g219:
  dw 1
g220:
  dw 9
  db `fib `
g221:
  dw L329
g222:
  dw 1
g223:
  dw 1
g224:
  dw L331
g225:
  dw 1
g226:
  dw 1
g227:
  dw 11
  db ` --> `
g228:
  dw L333
g229:
  dw 1
g230:
  dw 1
g231:
  dw L335
g232:
  dw 1
g233:
  dw 1
g234:
  dw L367
g235:
  dw 3, g207, g234
g236:
  dw 1, g206, g235
g237:
  dw 11
  db `space`
g238:
  dw 95
  db `space - where is the stack-pointer? (in words)\n`
g239:
  dw 1
g240:
  dw L369
g241:
  dw 1
g242:
  dw 1
g243:
  dw L371
g244:
  dw 1
g245:
  dw 1
g246:
  dw L378
g247:
  dw 3, g238, g246
g248:
  dw 1, g237, g247
g249:
  dw 1
g250:
  dw 3, g248, g249
g251:
  dw 3, g236, g250
g252:
  dw 3, g205, g251
g253:
  dw 3, g201, g252
g254:
  dw 3, g189, g253
g255:
  dw 3, g168, g254
g256:
  dw 3, g144, g255
g257:
  dw 3, g134, g256

bare_start: jmp L402
