L1: ; Arm: 11'13
  mov ax, [si]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L2: ; Function: (explode_loop,t1)
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(8)
  mov ax, [si+2]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L1
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

L3: ; Function: (explode,g2)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [si]
  push word L2
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
  mov ax, g1
  mov [di], ax
  mov ax, [Temps+6]
  mov [di+2], ax
  mov bp, [Temps+2]
  mov ax, 2
  jmp [bp]

L4: ; Arm: 18'7
  mov ax, g4
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L5: ; Function: (put_chars,g3)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov bx, [si]
  cmp word [bx], 1
  jz L4
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g3
  mov ax, 1
  jmp [bp]

L6: ; Arm: 27'13
  mov ax, [si]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L7: ; Function: (loop,g5)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(8)
  mov ax, [si+2]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L6
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
  mov bp, g5
  mov ax, 2
  jmp [bp]

L8: ; Arm: 27'13
  mov ax, [si]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L9: ; Function: (loop,g8)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(8)
  mov ax, [si+2]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L8
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
  mov bp, g8
  mov ax, 2
  jmp [bp]

L10: ; Continuation
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
  mov bp, g3
  mov ax, 1
  jmp [bp]

L11: ; Arm: 30'11
  push word g6
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

L12: ; Arm: 34'2
  mov ax, 1
  mov bx, [si]
  sub ax, bx
  add ax, 1
  mov [Temps+4], ax
  mov ax, [Temps+4]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word [CurrentCont]
  push word L10
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L11
  mov ax, g7
  mov [di], ax
  mov ax, [Temps+4]
  mov [di+2], ax
  mov bp, g5
  mov ax, 2
  jmp [bp]

L13: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g3
  mov ax, 1
  jmp [bp]

L14: ; Arm: 30'11
  push word g9
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

L15: ; Function: (put_int,g11)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  mov ax, [si]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L12
  mov ax, [si]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L13
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L14
  mov ax, g10
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g8
  mov ax, 2
  jmp [bp]

L16: ; Arm: 77'11
  mov ax, [si+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L17: ; Arm: 79'7
  mov ax, g13
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L18: ; Function: (drop,g12)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(0)
  mov ax, [si]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L16
  mov bx, [si+2]
  cmp word [bx], 1
  jz L17
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  mov ax, [si]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+8], ax
  mov ax, [Temps+8]
  mov [di], ax
  mov ax, [Temps+6]
  mov [di+2], ax
  mov bp, g12
  mov ax, 2
  jmp [bp]

L19: ; Arm: 89'13
  mov bx, [bp+2]
  mov ax, [si+2]
  mov [bx], ax
  mov ax, Bare_unit
  mov [Temps+4], ax
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L20: ; Arm: 90'15
  mov bx, [bp+4]
  mov ax, [si+2]
  mov [bx], ax
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L21: ; Function: (local_at_put,t5)
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(0)
  mov ax, [si]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L19
  mov ax, [si]
  cmp word ax, 3
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L20
  mov bx, g14
  call Bare_crash
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L22: ; Arm: 94'13
  mov bx, [bp+2]
  mov ax, [bx]
  mov [Temps+4], ax
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L23: ; Arm: 95'15
  mov bx, [bp+4]
  mov ax, [bx]
  mov [Temps+6], ax
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L24: ; Function: (local_at,t6)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L22
  mov ax, [si]
  cmp word ax, 3
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L23
  mov bx, g15
  call Bare_crash
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L25: ; Arm: 101'9
  mov bx, g16
  call Bare_crash
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L26: ; Arm: 104'26
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov bx, [bp+6]
  mov ax, [Temps+6]
  mov [bx], ax
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, bp
  mov ax, 1
  jmp [bp]

L27: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [bp+4]
  mov ax, 1
  jmp [bp]

L28: ; Arm: 105'23
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov bx, [bp+6]
  mov ax, [bx]
  mov [Temps+8], ax
  push word [Temps+4]
  push word bp
  push word [CurrentCont]
  push word L27
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov ax, [Temps+8]
  mov [di+2], ax
  mov bp, [bp+2]
  mov ax, 2
  jmp [bp]

L29: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov bx, [bp+4]
  mov ax, [si]
  mov [bx], ax
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, [bp+8]
  mov [di], ax
  mov bp, [bp+6]
  mov ax, 1
  jmp [bp]

L30: ; Arm: 106'22
  mov ax, [bx+2]
  mov [Temps+6], ax
  push word [Temps+4]
  push word bp
  push word [bp+6]
  push word [CurrentCont]
  push word L29
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, [bp+4]
  mov ax, 1
  jmp [bp]

L31: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  mov ax, [bp+10]
  mov bx, [si]
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  push word [Temps+2]
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  mov bx, [bp+4]
  mov ax, [Temps+4]
  mov [bx], ax
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, [bp+8]
  mov [di], ax
  mov bp, [bp+6]
  mov ax, 1
  jmp [bp]

L32: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [si]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L31
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, [bp+10]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L33: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [si]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L32
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, [bp+10]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L34: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [si]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L33
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [bp+12]
  mov [di], ax
  mov bp, [bp+4]
  mov ax, 1
  jmp [bp]

L35: ; Arm: 107'19
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [Temps+8]
  push word [Temps+4]
  push word bp
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L34
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, [bp+4]
  mov ax, 1
  jmp [bp]

L36: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  mov ax, [si]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  push word [Temps+2]
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  mov bx, [bp+4]
  mov ax, [Temps+4]
  mov [bx], ax
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, [bp+8]
  mov [di], ax
  mov bp, [bp+6]
  mov ax, 1
  jmp [bp]

L37: ; Arm: 108'13
  mov bx, [bp+6]
  mov ax, [bx]
  mov [Temps+6], ax
  push word [Temps+4]
  push word bp
  push word [bp+6]
  push word [CurrentCont]
  push word L36
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+6]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L38: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [bp+4]
  mov ax, 1
  jmp [bp]

L39: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L38
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g11
  mov ax, 1
  jmp [bp]

L40: ; Arm: 109'16
  mov bx, [bp+6]
  mov ax, [bx]
  mov [Temps+6], ax
  push word [Temps+4]
  push word bp
  push word [CurrentCont]
  push word L39
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+6]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov ax, [Temps+8]
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
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [bp+4]
  mov ax, 1
  jmp [bp]

L42: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L41
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g3
  mov ax, 1
  jmp [bp]

L43: ; Arm: 110'17
  mov ax, [bx+2]
  mov [Temps+6], ax
  push word [Temps+4]
  push word bp
  push word [CurrentCont]
  push word L42
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, g2
  mov ax, 1
  jmp [bp]

L44: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, [bp+4]
  mov ax, 1
  jmp [bp]

L45: ; Arm: 113'10
  push word 1
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word 1
  push word 3
  mov [Temps+6], sp
  push word 4 ;; scanned
  push word 21
  push word 1
  mov [Temps+8], sp
  push word 4 ;; scanned
  push word [Temps+8]
  push word 1
  mov [Temps+10], sp
  push word 4 ;; scanned
  push word 3
  push word 3
  mov [Temps+12], sp
  push word 4 ;; scanned
  push word 3
  push word 1
  push word 7
  mov [Temps+14], sp
  push word 6 ;; scanned
  push word 1
  push word 3
  mov [Temps+16], sp
  push word 4 ;; scanned
  push word 3
  push word 5
  mov [Temps+18], sp
  push word 4 ;; scanned
  push word 3
  push word 3
  mov [Temps+20], sp
  push word 4 ;; scanned
  push word 9
  push word 15
  mov [Temps+22], sp
  push word 4 ;; scanned
  push word 1
  push word 5
  mov [Temps+24], sp
  push word 4 ;; scanned
  push word g29
  push word [Temps+24]
  push word 3
  mov [Temps+26], sp
  push word 6 ;; scanned
  push word [Temps+26]
  push word g21
  push word 3
  mov [Temps+28], sp
  push word 6 ;; scanned
  push word [Temps+28]
  push word [Temps+22]
  push word 3
  mov [Temps+30], sp
  push word 6 ;; scanned
  push word [Temps+30]
  push word [Temps+20]
  push word 3
  mov [Temps+32], sp
  push word 6 ;; scanned
  push word [Temps+32]
  push word g19
  push word 3
  mov [Temps+34], sp
  push word 6 ;; scanned
  push word [Temps+34]
  push word [Temps+18]
  push word 3
  mov [Temps+36], sp
  push word 6 ;; scanned
  push word [Temps+36]
  push word [Temps+16]
  push word 3
  mov [Temps+38], sp
  push word 6 ;; scanned
  push word [Temps+38]
  push word [Temps+14]
  push word 3
  mov [Temps+40], sp
  push word 6 ;; scanned
  push word [Temps+40]
  push word [Temps+12]
  push word 3
  mov [Temps+42], sp
  push word 6 ;; scanned
  push word [Temps+42]
  push word [Temps+10]
  push word 3
  mov [Temps+44], sp
  push word 6 ;; scanned
  push word [Temps+44]
  push word [Temps+6]
  push word 3
  mov [Temps+46], sp
  push word 6 ;; scanned
  push word [Temps+46]
  push word [Temps+4]
  push word 3
  mov [Temps+48], sp
  push word 6 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L44
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov ax, [Temps+48]
  mov [di+2], ax
  mov bp, g12
  mov ax, 2
  jmp [bp]

L46: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(178)
  mov bx, [si]
  cmp word [bx], 3
  jz L45
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [bp+4]
  mov ax, 1
  jmp [bp]

L47: ; Arm: 6'9
  mov ax, g17
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L48: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  mov ax, [si]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L46
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L47
  mov ax, g18
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L49: ; Arm: 111'23
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov bx, [bp+6]
  mov ax, [bx]
  mov [Temps+8], ax
  push word [Temps+6]
  push word [Temps+4]
  push word bp
  push word [CurrentCont]
  push word L48
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+8]
  mov ax, [bx+2]
  mov [Temps+10], ax
  mov ax, [Temps+10]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L50: ; Function: (loop,t9)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(16)
  mov bx, [si]
  cmp word [bx], 1
  jz L25
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L26
  cmp word [bx], 3
  jz L28
  cmp word [bx], 5
  jz L30
  cmp word [bx], 7
  jz L35
  cmp word [bx], 9
  jz L37
  cmp word [bx], 13
  jz L40
  cmp word [bx], 11
  jz L43
  cmp word [bx], 15
  jz L49
  mov ax, g30
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L51: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, g42
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L52: ; Start
  xchg si, di
  Bare_arg_check(0)
  Bare_heap_check(232)
  push word 1
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
  mov [Temps+4], sp
  push word 2 ;; scanned
  push word 1
  push word 1
  mov [Temps+6], sp
  push word 4 ;; scanned
  push word [Temps+6]
  mov [Temps+8], sp
  push word 2 ;; scanned
  push word [Temps+8]
  push word [Temps+4]
  push word L21
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [Temps+8]
  push word [Temps+4]
  push word L24
  mov [Temps+12], sp
  push word 6 ;; scanned
  push word 1
  push word 1
  mov [Temps+14], sp
  push word 4 ;; scanned
  push word [Temps+14]
  mov [Temps+16], sp
  push word 2 ;; scanned
  push word [Temps+16]
  push word [Temps+12]
  push word [Temps+10]
  push word L50
  mov [Temps+18], sp
  push word 8 ;; scanned
  push word 1
  push word 1
  mov [Temps+20], sp
  push word 4 ;; scanned
  push word [Temps+20]
  push word 1
  mov [Temps+22], sp
  push word 4 ;; scanned
  push word 1
  push word 3
  mov [Temps+24], sp
  push word 4 ;; scanned
  push word 21
  push word 1
  mov [Temps+26], sp
  push word 4 ;; scanned
  push word [Temps+26]
  push word 1
  mov [Temps+28], sp
  push word 4 ;; scanned
  push word 3
  push word 3
  mov [Temps+30], sp
  push word 4 ;; scanned
  push word 3
  push word 1
  push word 7
  mov [Temps+32], sp
  push word 6 ;; scanned
  push word 1
  push word 3
  mov [Temps+34], sp
  push word 4 ;; scanned
  push word 3
  push word 5
  mov [Temps+36], sp
  push word 4 ;; scanned
  push word 3
  push word 3
  mov [Temps+38], sp
  push word 4 ;; scanned
  push word 9
  push word 15
  mov [Temps+40], sp
  push word 4 ;; scanned
  push word 1
  push word 5
  mov [Temps+42], sp
  push word 4 ;; scanned
  push word g41
  push word [Temps+42]
  push word 3
  mov [Temps+44], sp
  push word 6 ;; scanned
  push word [Temps+44]
  push word g33
  push word 3
  mov [Temps+46], sp
  push word 6 ;; scanned
  push word [Temps+46]
  push word [Temps+40]
  push word 3
  mov [Temps+48], sp
  push word 6 ;; scanned
  push word [Temps+48]
  push word [Temps+38]
  push word 3
  mov [Temps+50], sp
  push word 6 ;; scanned
  push word [Temps+50]
  push word g31
  push word 3
  mov [Temps+52], sp
  push word 6 ;; scanned
  push word [Temps+52]
  push word [Temps+36]
  push word 3
  mov [Temps+54], sp
  push word 6 ;; scanned
  push word [Temps+54]
  push word [Temps+34]
  push word 3
  mov [Temps+56], sp
  push word 6 ;; scanned
  push word [Temps+56]
  push word [Temps+32]
  push word 3
  mov [Temps+58], sp
  push word 6 ;; scanned
  push word [Temps+58]
  push word [Temps+30]
  push word 3
  mov [Temps+60], sp
  push word 6 ;; scanned
  push word [Temps+60]
  push word [Temps+28]
  push word 3
  mov [Temps+62], sp
  push word 6 ;; scanned
  push word [Temps+62]
  push word [Temps+24]
  push word 3
  mov [Temps+64], sp
  push word 6 ;; scanned
  push word [Temps+64]
  push word [Temps+22]
  push word 3
  mov [Temps+66], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L51
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+66]
  mov [di], ax
  mov bp, [Temps+18]
  mov ax, 1
  jmp [bp]

g1:
  dw 1
g2:
  dw L3
g3:
  dw L5
g4:
  dw 1
g5:
  dw L7
g6:
  dw 1
g7:
  dw 1
g8:
  dw L9
g9:
  dw 1
g10:
  dw 1
g11:
  dw L15
g12:
  dw L18
g13:
  dw 1
g14:
  dw 25
  db `local_at_put`
g15:
  dw 17
  db `local_at`
g16:
  dw 47
  db `run out of instructions`
g17:
  dw 1
g18:
  dw 3
g19:
  dw 9
g20:
  dw 31
  db `(Ocaml)Result: `
g21:
  dw 11, g20
g22:
  dw 13
g23:
  dw 3
  db `\n`
g24:
  dw 11, g23
g25:
  dw 17
g26:
  dw 1
g27:
  dw 3, g25, g26
g28:
  dw 3, g24, g27
g29:
  dw 3, g22, g28
g30:
  dw 1
g31:
  dw 9
g32:
  dw 31
  db `(Ocaml)Result: `
g33:
  dw 11, g32
g34:
  dw 13
g35:
  dw 3
  db `\n`
g36:
  dw 11, g35
g37:
  dw 17
g38:
  dw 1
g39:
  dw 3, g37, g38
g40:
  dw 3, g36, g39
g41:
  dw 3, g34, g40
g42:
  dw 1

bare_start: jmp L52
