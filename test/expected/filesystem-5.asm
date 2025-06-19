L1: ; Arm: 21'7
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

L4: ; Arm: 26'7
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

L8: ; Arm: 31'7
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

L10: ; Arm: 32'20
  push word [bp+6]
  push word [CurrentCont]
  push word L9
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov ax, [bp+8]
  mov [di+2], ax
  mov bp, g4
  mov ax, 2
  jmp [bp]

L11: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  mov bx, [si]
  cmp word [bx], 3
  jz L10
  mov ax, [bp+4]
  mov [di], ax
  mov ax, [bp+8]
  mov [di+2], ax
  mov bp, g4
  mov ax, 2
  jmp [bp]

L12: ; Function: (filter,g4)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(12)
  mov bx, [si+2]
  cmp word [bx], 1
  jz L8
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [Temps+2]
  push word [si]
  push word [CurrentCont]
  push word L11
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [si]
  mov ax, 1
  jmp [bp]

L13: ; Arm: 36'7
  mov ax, [si+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L14: ; Continuation
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

L15: ; Function: (foldl,g6)[arg0,arg1,arg2]
  xchg si, di
  Bare_arg_check(3)
  Bare_heap_check(10)
  mov bx, [si+4]
  cmp word [bx], 1
  jz L13
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [si]
  push word [CurrentCont]
  push word L14
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si+2]
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov bp, [si]
  mov ax, 2
  jmp [bp]

L16: ; Arm: 41'7
  mov ax, g8
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L17: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov ax, [bp+6]
  mov [di+2], ax
  mov bp, g7
  mov ax, 2
  jmp [bp]

L18: ; Function: (iter,g7)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(10)
  mov bx, [si+2]
  cmp word [bx], 1
  jz L16
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [si]
  push word [CurrentCont]
  push word L17
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [si]
  mov ax, 1
  jmp [bp]

L19: ; Arm: 45'11
  mov ax, g10
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L20: ; Continuation
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

L21: ; Function: (upto,g9)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(8)
  mov ax, [si+2]
  cmp word ax, [si]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L19
  mov ax, [si]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+4], ax
  push word [si]
  push word [CurrentCont]
  push word L20
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov ax, [si+2]
  mov [di+2], ax
  mov bp, g9
  mov ax, 2
  jmp [bp]

L22: ; Arm: 48'12
  mov ax, g14
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L23: ; Arm: 50'9
  mov ax, g15
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L24: ; Continuation
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

L25: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  mov bx, [si]
  cmp word [bx], 3
  jz L22
  mov bx, [bp+6]
  cmp word [bx], 1
  jz L23
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [bp+4]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+6], ax
  push word [Temps+2]
  push word [CurrentCont]
  push word L24
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov ax, [Temps+4]
  mov [di+2], ax
  mov bp, g11
  mov ax, 2
  jmp [bp]

L26: ; Arm: 10'9
  mov ax, g12
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L27: ; Function: (take,g11)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(10)
  mov ax, 1
  cmp word ax, [si]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [si+2]
  push word [si]
  push word [CurrentCont]
  push word L25
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L26
  mov ax, g13
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L28: ; Arm: 61'7
  mov ax, [si]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L29: ; Function: (rev_onto,g20)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(8)
  mov bx, [si+2]
  cmp word [bx], 1
  jz L28
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
  mov bp, g20
  mov ax, 2
  jmp [bp]

L30: ; Arm: 79'13
  mov ax, [si]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L31: ; Function: (explode_loop,t1)
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(8)
  mov ax, [si+2]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L30
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

L32: ; Function: (explode,g22)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [si]
  push word L31
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
  mov ax, g21
  mov [di], ax
  mov ax, [Temps+6]
  mov [di+2], ax
  mov bp, [Temps+2]
  mov ax, 2
  jmp [bp]

L33: ; Arm: 88'9
  mov ax, g23
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L34: ; Function: (loop,t1)
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(0)
  mov bx, [si+2]
  cmp word [bx], 1
  jz L33
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

L35: ; Continuation
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

L36: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [si]
  push word L34
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [si]
  push word [CurrentCont]
  push word L35
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, 1
  mov [di], ax
  mov ax, [bp+4]
  mov [di+2], ax
  mov bp, [Temps+2]
  mov ax, 2
  jmp [bp]

L37: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L36
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, 1
  jmp AllocBare_make_bytes

L38: ; Function: (implode,g24)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L37
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g1
  mov ax, 1
  jmp [bp]

L39: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g24
  mov ax, 1
  jmp [bp]

L40: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L39
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g20
  mov ax, 2
  jmp [bp]

L41: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L40
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g25
  mov [di], ax
  mov ax, [bp+4]
  mov [di+2], ax
  mov bp, g20
  mov ax, 2
  jmp [bp]

L42: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L41
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L43: ; Function: (^,g26)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(8)
  push word [si+2]
  push word [CurrentCont]
  push word L42
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L44: ; Arm: 106'13
  mov ax, [si]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L45: ; Function: (loop,g27)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(8)
  mov ax, [si+2]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L44
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
  mov bp, g27
  mov ax, 2
  jmp [bp]

L46: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g24
  mov ax, 1
  jmp [bp]

L47: ; Arm: 109'11
  push word g28
  push word `0`
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

L48: ; Continuation
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
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L49: ; Arm: 110'13
  mov ax, 1
  mov bx, [si]
  sub ax, bx
  add ax, 1
  mov [Temps+6], ax
  push word [CurrentCont]
  push word L48
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g29
  mov [di], ax
  mov ax, [Temps+6]
  mov [di+2], ax
  mov bp, g27
  mov ax, 2
  jmp [bp]

L50: ; Function: (sofi,g31)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  mov ax, [si]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  push word [CurrentCont]
  push word L46
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L47
  mov ax, [si]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L49
  mov ax, g30
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g27
  mov ax, 2
  jmp [bp]

L51: ; Arm: 122'9
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

L52: ; Arm: 125'15
  mov ax, g39
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L53: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov bx, [si]
  cmp word [bx], 1
  jz L52
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
  mov bp, g32
  mov ax, 2
  jmp [bp]

L54: ; Arm: 117'27
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

L55: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  mov bx, [si]
  cmp word [bx], 3
  jz L54
  mov ax, g37
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L56: ; Arm: 10'9
  mov ax, g35
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L57: ; Arm: 117'12
  mov ax, 19
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+8]
  push word [CurrentCont]
  push word L55
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L56
  mov ax, g36
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L58: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(18)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L53
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [si]
  cmp word [bx], 3
  jz L57
  mov ax, g38
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L59: ; Arm: 10'9
  mov ax, g33
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L60: ; Function: (loop,g32)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(12)
  mov bx, [si+2]
  cmp word [bx], 1
  jz L51
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
  push word L58
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L59
  mov ax, g34
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L61: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, 1
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g32
  mov ax, 2
  jmp [bp]

L62: ; Function: (parse_num,g40)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L61
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L63: ; Arm: 142'7
  mov ax, g42
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L64: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L65: ; Arm: 135'19
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

L66: ; Arm: 136'22
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

L67: ; Arm: 137'16
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

L68: ; Function: (put_chars,g41)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  mov bx, [si]
  cmp word [bx], 1
  jz L63
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
  push word L64
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L65
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L66
  mov ax, 53
  cmp word ax, [Temps+6]
  call Bare_make_bool_from_n
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L67
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

L69: ; Arm: 165'9
  mov ax, g47
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L70: ; Function: (loop,t1)
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(0)
  mov bx, [si+2]
  cmp word [bx], 1
  jz L69
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

L71: ; Continuation
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

L72: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [si]
  push word L70
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [bp+6]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+4], ax
  push word [si]
  push word [CurrentCont]
  push word L71
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov ax, [bp+4]
  mov [di+2], ax
  mov bp, [Temps+2]
  mov ax, 2
  jmp [bp]

L73: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L72
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, 1
  jmp AllocBare_make_bytes

L74: ; Function: (rev_implode,g48)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L73
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g1
  mov ax, 1
  jmp [bp]

L75: ; Arm: 174'19
  mov ax, g51
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L76: ; Arm: 176'15
  mov ax, g52
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L77: ; Arm: 179'31
  mov ax, g55
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L78: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov bx, [si]
  cmp word [bx], 3
  jz L77
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

L79: ; Arm: 10'9
  mov ax, g53
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L80: ; Function: (loop,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  mov ax, [si]
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L76
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
  push word L78
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L79
  mov ax, g54
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L81: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  mov bx, [si]
  cmp word [bx], 3
  jz L75
  push word [bp+6]
  push word [bp+4]
  push word L80
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

L82: ; Arm: 10'9
  mov ax, g49
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L83: ; Function: (eq_string,g56)[arg0,arg1]
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
  push word L81
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L82
  mov ax, g50
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L84: ; Arm: 187'9
  mov ax, [si]
  mov [di], ax
  mov bp, g24
  mov ax, 1
  jmp [bp]

L85: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov ax, [bp+6]
  mov [di+2], ax
  mov bp, [bp+4]
  mov ax, 2
  jmp [bp]

L86: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L85
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g20
  mov ax, 2
  jmp [bp]

L87: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L86
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g58
  mov [di], ax
  mov ax, [bp+8]
  mov [di+2], ax
  mov bp, g20
  mov ax, 2
  jmp [bp]

L88: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L87
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g20
  mov ax, 2
  jmp [bp]

L89: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [si]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L88
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, g57
  mov [di], ax
  mov ax, [bp+4]
  mov [di+2], ax
  mov bp, g20
  mov ax, 2
  jmp [bp]

L90: ; Function: (collect,t1)
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(14)
  mov bx, [si+2]
  cmp word [bx], 1
  jz L84
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word bp
  push word [si]
  push word [bp+2]
  push word [CurrentCont]
  push word L89
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L91: ; Arm: 192'7
  mov ax, g60
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L92: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov ax, [bp+6]
  mov [di+2], ax
  mov bp, [bp+4]
  mov ax, 2
  jmp [bp]

L93: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  mov bx, [si]
  cmp word [bx], 1
  jz L91
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [bp+4]
  push word [CurrentCont]
  push word L92
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L94: ; Function: (lamN,t2)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+2]
  push word [CurrentCont]
  push word L93
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g59
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g20
  mov ax, 2
  jmp [bp]

L95: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [si]
  push word L90
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [Temps+2]
  push word L94
  mov [Temps+4], sp
  push word 4 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L96: ; Function: (concat,g61)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L95
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L97: ; Continuation
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

L98: ; Arm: 208'11
  push word [si]
  push word [CurrentCont]
  push word L97
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si+2]
  mov [di], ax
  mov bp, g48
  mov ax, 1
  jmp [bp]

L99: ; Continuation
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
  mov bp, g62
  mov ax, 2
  jmp [bp]

L100: ; Arm: 210'26
  push word [Temps+4]
  push word [si]
  push word [CurrentCont]
  push word L99
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si+2]
  mov [di], ax
  mov bp, g48
  mov ax, 1
  jmp [bp]

L101: ; Function: (have_letter,g63)[arg0,arg1,arg2]
  xchg si, di
  Bare_arg_check(3)
  Bare_heap_check(10)
  mov bx, [si+4]
  cmp word [bx], 1
  jz L98
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
  jz L100
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
  mov bp, g63
  mov ax, 3
  jmp [bp]

L102: ; Arm: 215'9
  mov ax, [bp+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L103: ; Arm: 217'24
  mov ax, [bp+2]
  mov [di], ax
  mov ax, [Temps+4]
  mov [di+2], ax
  mov bp, g62
  mov ax, 2
  jmp [bp]

L104: ; Function: (lamN,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  mov bx, [si]
  cmp word [bx], 1
  jz L102
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
  jz L103
  push word g64
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
  mov bp, g63
  mov ax, 3
  jmp [bp]

L105: ; Function: (at_word_start,g62)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [si]
  push word L104
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L106: ; Arm: 229'16
  mov ax, g67
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L107: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov bx, [si]
  cmp word [bx], 3
  jz L106
  mov ax, [bp+6]
  mov bx, [bp+10]
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov ax, [bp+4]
  mov bx, [Temps+2]
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+4], ax
  mov ax, [bp+8]
  mov bx, [bp+10]
  mov dx, [Temps+4]
  sar bx, 1
  call Bare_set_bytes
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, [bp+10]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+8], ax
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, [bp+12]
  mov ax, 1
  jmp [bp]

L108: ; Arm: 10'9
  mov ax, g65
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L109: ; Function: (loop,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(16)
  mov ax, [si]
  cmp word ax, [bp+6]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word [si]
  push word [bp+8]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L107
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L108
  mov ax, g66
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L110: ; Continuation
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

L111: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(20)
  push word [si]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L109
  mov [Temps+2], sp
  push word 10 ;; scanned
  push word [si]
  push word [CurrentCont]
  push word L110
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, 1
  mov [di], ax
  mov bp, [Temps+2]
  mov ax, 1
  jmp [bp]

L112: ; Function: (substr,g68)[arg0,arg1,arg2]
  xchg si, di
  Bare_arg_check(3)
  Bare_heap_check(12)
  push word [si+4]
  push word [si+2]
  push word [si]
  push word [CurrentCont]
  push word L111
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si+4]
  mov [di], ax
  mov ax, 1
  jmp AllocBare_make_bytes

L113: ; Arm: 243'17
  mov ax, g71
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L114: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov bx, [si]
  cmp word [bx], 3
  jz L113
  mov ax, [bp+8]
  mov bx, [bp+10]
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+2], ax
  mov ax, [bp+6]
  mov bx, [bp+10]
  add ax, bx
  sub ax, 1
  mov [Temps+4], ax
  mov ax, [bp+4]
  mov bx, [Temps+4]
  mov dx, [Temps+2]
  sar bx, 1
  call Bare_set_bytes
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, [bp+10]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+8], ax
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, [bp+12]
  mov ax, 1
  jmp [bp]

L115: ; Arm: 10'9
  mov ax, g69
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L116: ; Function: (loop,t2)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(16)
  mov ax, [si]
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L114
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L115
  mov ax, g70
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L117: ; Function: (mod_substr,g72)[arg0,arg1,arg2]
  xchg si, di
  Bare_arg_check(3)
  Bare_heap_check(12)
  mov bx, [si+4]
  mov ax, [bx]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [si+4]
  push word [si+2]
  push word [si]
  push word L116
  mov [Temps+4], sp
  push word 10 ;; scanned
  mov ax, 1
  mov [di], ax
  mov bp, [Temps+4]
  mov ax, 1
  jmp [bp]

L118: ; Arm: 283'22
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov ax, [si]
  mov [di], ax
  mov bp, g48
  mov ax, 1
  jmp [bp]

L119: ; Arm: 284'28
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
  mov bp, g48
  mov ax, 1
  jmp [bp]

L120: ; Arm: 285'19
  mov ax, [si]
  mov [di], ax
  mov bp, g74
  mov ax, 1
  jmp [bp]

L121: ; Arm: 288'17
  mov ax, [si]
  mov [di], ax
  mov bp, g74
  mov ax, 1
  jmp [bp]

L122: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g74
  mov ax, 1
  jmp [bp]

L123: ; Arm: 292'28
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

L124: ; Arm: 293'29
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

L125: ; Arm: 294'32
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

L126: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L122
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [si]
  cmp word [bx], 3
  jz L123
  mov ax, [bp+6]
  cmp word ax, 65
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L124
  mov ax, 253
  cmp word ax, [bp+6]
  call Bare_make_bool_from_n
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L125
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

L127: ; Arm: 10'9
  mov ax, g76
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L128: ; Arm: 286'21
  mov bx, [si]
  cmp word [bx], 1
  jz L121
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
  push word L126
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+20]
  cmp word [bx], 3
  jz L127
  mov ax, g77
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L129: ; Continuation
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
  mov bp, g74
  mov ax, 1
  jmp [bp]

L130: ; Arm: 135'19
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

L131: ; Arm: 136'22
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

L132: ; Arm: 137'16
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

L133: ; Function: (readloop,g74)[arg0]
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
  jz L118
  mov ax, [Temps+2]
  cmp word ax, `\x04`
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L119
  mov ax, 255
  cmp word ax, [Temps+4]
  call Bare_make_bool_from_n
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L120
  mov ax, [Temps+4]
  cmp word ax, 255
  call Bare_make_bool_from_z
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L128
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
  push word L129
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+16]
  cmp word [bx], 3
  jz L130
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+18], ax
  mov bx, [Temps+18]
  cmp word [bx], 3
  jz L131
  mov ax, 53
  cmp word ax, [Temps+14]
  call Bare_make_bool_from_n
  mov [Temps+20], ax
  mov bx, [Temps+20]
  cmp word [bx], 3
  jz L132
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

L134: ; Function: (read_line,g79)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, g78
  mov [di], ax
  mov bp, g74
  mov ax, 1
  jmp [bp]

L135: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+6]
  mov [Temps+2], ax
  mov dx, [bp+4]
  sar dx, 1
  mov bx, [Temps+2]
  call Bare_store_sector
  mov ax, Bare_unit
  mov [Temps+4], ax
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L136: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  mov dx, [bp+4]
  sar dx, 1
  mov bx, [si]
  call Bare_load_sector
  mov ax, Bare_unit
  mov [Temps+2], ax
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
  mov ax, [bp+8]
  mov [di+4], ax
  mov bp, g72
  mov ax, 3
  jmp [bp]

L137: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L136
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, 1025
  mov [di], ax
  mov ax, 1
  jmp AllocBare_make_bytes

L138: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  mov ax, [si]
  sar ax, 1
  mov bx, 9
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov ax, [si]
  sar ax, 1
  mov bx, 9
  sar bx, 1
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+4], dx
  mov ax, 257
  sar ax, 1
  mov bx, [Temps+4]
  sar bx, 1
  mul bx
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  push word [Temps+6]
  push word [Temps+2]
  push word [CurrentCont]
  push word L137
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L139: ; Function: (store_block,g83)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(8)
  push word [si+2]
  push word [CurrentCont]
  push word L138
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [si]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L140: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [si]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L141: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  mov dx, [bp+6]
  sar dx, 1
  mov bx, [si]
  call Bare_load_sector
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, [si]
  mov [Temps+4], ax
  mov ax, [bp+4]
  sar ax, 1
  mov bx, 9
  sar bx, 1
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+6], dx
  mov ax, 257
  sar ax, 1
  mov bx, [Temps+6]
  sar bx, 1
  mul bx
  shl ax, 1
  add ax, 1
  mov [Temps+8], ax
  push word [CurrentCont]
  push word L140
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov ax, [Temps+8]
  mov [di+2], ax
  mov ax, 257
  mov [di+4], ax
  mov bp, g68
  mov ax, 3
  jmp [bp]

L142: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  mov ax, [si]
  sar ax, 1
  mov bx, 9
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov ax, [si]
  sar ax, 1
  mov bx, 9
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+4], ax
  push word [Temps+4]
  push word [si]
  push word [CurrentCont]
  push word L141
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, 1025
  mov [di], ax
  mov ax, 1
  jmp AllocBare_make_bytes

L143: ; Function: (load_block,g84)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L142
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [si]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L144: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  mov ax, [bp+6]
  mov [Temps+2], ax
  push word [Temps+2]
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov ax, [Temps+4]
  mov [di+2], ax
  mov bp, g83
  mov ax, 2
  jmp [bp]

L145: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  mov ax, [si]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [bp+4]
  push word [CurrentCont]
  push word L144
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov ax, [bp+6]
  mov [di+2], ax
  mov ax, [bp+8]
  mov [di+4], ax
  mov bp, g72
  mov ax, 3
  jmp [bp]

L146: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L145
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [si]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L147: ; Function: (update_block,g85)[arg0,arg1,arg2]
  xchg si, di
  Bare_arg_check(3)
  Bare_heap_check(12)
  push word [si+4]
  push word [si+2]
  push word [si]
  push word [CurrentCont]
  push word L146
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g84
  mov ax, 1
  jmp [bp]

L148: ; Function: (lamN,g96)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  mov ax, [si]
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  push word [Temps+2]
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L149: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, g92
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
  push word [CurrentCont]
  push word L149
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L151: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L150
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L152: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L151
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g91
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L153: ; Arm: 525'2
  push word [CurrentCont]
  push word L152
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g90
  mov [di], ax
  mov ax, g89
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L154: ; Arm: 450'9
  mov ax, g94
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L155: ; Arm: 452'14
  mov ax, g95
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L156: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [si]
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word 3
  mov [Temps+4], sp
  push word 4 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L157: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L156
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g11
  mov ax, 2
  jmp [bp]

L158: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L157
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g96
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g2
  mov ax, 2
  jmp [bp]

L159: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L158
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L160: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [si]
  push word [bp+6]
  push word [CurrentCont]
  push word L159
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov ax, 5
  mov [di+2], ax
  mov ax, 13
  mov [di+4], ax
  mov bp, g68
  mov ax, 3
  jmp [bp]

L161: ; Arm: 443'14
  mov ax, 1
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L162: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  mov bx, [si]
  cmp word [bx], 1
  jz L154
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L155
  mov ax, [Temps+2]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  push word [Temps+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L160
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L161
  mov ax, [Temps+6]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+10], ax
  mov ax, [Temps+10]
  sar ax, 1
  mov bx, 257
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+12], ax
  mov ax, 3
  mov bx, [Temps+12]
  add ax, bx
  sub ax, 1
  mov [Temps+14], ax
  mov ax, [Temps+14]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L163: ; Arm: 409'32
  mov ax, g93
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L164: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(22)
  mov ax, [si]
  mov bx, 1
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+2], ax
  mov ax, [si]
  mov bx, 3
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+4], ax
  push word [Temps+4]
  push word [Temps+2]
  push word 1
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [si]
  push word [CurrentCont]
  push word L162
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+6]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov ax, [bx+4]
  mov [Temps+10], ax
  mov ax, [Temps+10]
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+12], ax
  mov ax, [Temps+8]
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+14], ax
  mov ax, 7
  cmp word ax, [Temps+12]
  call Bare_make_bool_from_n
  mov [Temps+16], ax
  mov bx, [Temps+16]
  cmp word [bx], 3
  jz L163
  mov ax, 513
  sar ax, 1
  mov bx, [Temps+12]
  sar bx, 1
  mul bx
  shl ax, 1
  add ax, 1
  mov [Temps+18], ax
  mov ax, [Temps+18]
  mov bx, [Temps+14]
  add ax, bx
  sub ax, 1
  mov [Temps+20], ax
  push word [Temps+20]
  push word 3
  mov [Temps+22], sp
  push word 4 ;; scanned
  mov ax, [Temps+22]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L165: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  mov ax, [si]
  sar ax, 1
  mov bx, 33
  sar bx, 1
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+2], dx
  mov ax, [Temps+2]
  sar ax, 1
  mov bx, 17
  sar bx, 1
  mul bx
  shl ax, 1
  add ax, 1
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L164
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov ax, [Temps+4]
  mov [di+2], ax
  mov ax, 17
  mov [di+4], ax
  mov bp, g68
  mov ax, 3
  jmp [bp]

L166: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L165
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L167: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L166
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [si]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L168: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  mov ax, [si]
  sar ax, 1
  mov bx, 33
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+4], ax
  push word [Temps+4]
  push word 1
  mov [Temps+6], sp
  push word 4 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L167
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, g84
  mov ax, 1
  jmp [bp]

L169: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  mov bx, [si]
  cmp word [bx], 3
  jz L153
  push word [bp+4]
  push word [CurrentCont]
  push word L168
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L170: ; Arm: 10'9
  mov ax, g87
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L171: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  mov ax, [bp+6]
  cmp word ax, [si]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+4]
  push word [CurrentCont]
  push word L169
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L170
  mov ax, g88
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L172: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [si]
  push word [bp+6]
  push word [CurrentCont]
  push word L171
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [bx+6]
  mov [Temps+6], ax
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L173: ; Function: (loadI,g97)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(10)
  push word [si+2]
  push word [si]
  push word [CurrentCont]
  push word L172
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [si+2]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L174: ; Arm: 10'9
  mov ax, g104
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L175: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  cmp word ax, [si]
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L174
  mov ax, g105
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L176: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L175
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L177: ; Function: (lamN,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+2]
  push word [CurrentCont]
  push word L176
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [si]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L178: ; Function: (lamN,g106)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(6)
  push word [si+2]
  push word L177
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g4
  mov ax, 2
  jmp [bp]

L179: ; Function: (lamN,g107)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [si]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L180: ; Arm: 537'9
  mov ax, g102
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L181: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(16)
  push word [bp+6]
  push word [si]
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 8 ;; scanned
  push word [Temps+2]
  push word 3
  mov [Temps+4], sp
  push word 4 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L182: ; Arm: 543'10
  push word [si]
  push word [bp+2]
  push word [CurrentCont]
  push word L181
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g103
  mov [di], ax
  mov ax, [si+2]
  mov [di+2], ax
  mov bp, g20
  mov ax, 2
  jmp [bp]

L183: ; Arm: 547'19
  mov ax, [bp+10]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  push word [bp+10]
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [bp+8]
  push word [Temps+4]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov ax, [Temps+6]
  mov [di+2], ax
  mov ax, [Temps+2]
  mov [di+4], ax
  mov bp, [bp+6]
  mov ax, 3
  jmp [bp]

L184: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov ax, [bp+8]
  mov [di+2], ax
  mov ax, [bp+4]
  mov [di+4], ax
  mov bp, [bp+6]
  mov ax, 3
  jmp [bp]

L185: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  mov bx, [si]
  cmp word [bx], 1
  jz L183
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  mov ax, [bp+10]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+8], ax
  push word [bp+8]
  push word [bp+6]
  push word [Temps+8]
  push word [CurrentCont]
  push word L184
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g106
  mov [di], ax
  mov ax, [bp+4]
  mov [di+2], ax
  mov ax, [Temps+6]
  mov [di+4], ax
  mov bp, g6
  mov ax, 3
  jmp [bp]

L186: ; Function: (loop,t5)
  xchg si, di
  Bare_arg_check(3)
  Bare_heap_check(20)
  mov ax, [si+4]
  cmp word ax, [bp+4]
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L182
  push word [si+4]
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [si+4]
  push word [si+2]
  push word bp
  push word [si]
  push word [CurrentCont]
  push word L185
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [bp+2]
  mov [di], ax
  mov ax, [Temps+4]
  mov [di+2], ax
  mov bp, g97
  mov ax, 2
  jmp [bp]

L187: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov ax, g108
  mov [di+2], ax
  mov ax, 1
  mov [di+4], ax
  mov bp, [bp+4]
  mov ax, 3
  jmp [bp]

L188: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L187
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g107
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g2
  mov ax, 2
  jmp [bp]

L189: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(16)
  mov bx, [si]
  cmp word [bx], 1
  jz L180
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  mov ax, [bx+6]
  mov [Temps+8], ax
  push word [Temps+8]
  push word [Temps+2]
  push word L186
  mov [Temps+10], sp
  push word 6 ;; scanned
  mov ax, 3
  mov bx, [Temps+6]
  add ax, bx
  sub ax, 1
  mov [Temps+12], ax
  mov ax, [Temps+4]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+14], ax
  push word [Temps+10]
  push word [CurrentCont]
  push word L188
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+12]
  mov [di], ax
  mov ax, [Temps+14]
  mov [di+2], ax
  mov bp, g9
  mov ax, 2
  jmp [bp]

L190: ; Arm: 489'49
  mov ax, g101
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L191: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(22)
  push word [CurrentCont]
  push word L189
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [si]
  cmp word [bx], 3
  jz L190
  mov ax, [bp+4]
  mov bx, 9
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+2], ax
  mov ax, [bp+4]
  mov bx, 11
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+4], ax
  mov ax, [bp+4]
  mov bx, 13
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+6], ax
  mov ax, [Temps+2]
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+8], ax
  mov ax, [Temps+4]
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+10], ax
  mov ax, [Temps+6]
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+12], ax
  push word [Temps+12]
  push word [Temps+10]
  push word [Temps+8]
  push word 1
  mov [Temps+14], sp
  push word 8 ;; scanned
  push word [Temps+14]
  push word 3
  mov [Temps+16], sp
  push word 4 ;; scanned
  mov ax, [Temps+16]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L192: ; Arm: 10'9
  mov ax, g99
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L193: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L191
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [si]
  cmp word [bx], 3
  jz L192
  mov ax, g100
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L194: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L193
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, g98
  mov [di+2], ax
  mov bp, g56
  mov ax, 2
  jmp [bp]

L195: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L194
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, 1
  mov [di+2], ax
  mov ax, 9
  mov [di+4], ax
  mov bp, g68
  mov ax, 3
  jmp [bp]

L196: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L195
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [si]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L197: ; Function: (fsck,g109)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word 1
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [CurrentCont]
  push word L196
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g84
  mov ax, 1
  jmp [bp]

L198: ; Arm: 584'7
  mov ax, [si]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L199: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov ax, [bp+4]
  mov [di+2], ax
  mov bp, g110
  mov ax, 2
  jmp [bp]

L200: ; Function: (giveup_blocks,g110)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(26)
  mov bx, [si+2]
  cmp word [bx], 1
  jz L198
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [CurrentCont]
  push word L199
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [si]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov ax, [bx+6]
  mov [Temps+10], ax
  push word [Temps+10]
  push word [Temps+2]
  push word 3
  mov [Temps+12], sp
  push word 6 ;; scanned
  push word [Temps+12]
  push word [Temps+8]
  push word [Temps+6]
  push word 1
  mov [Temps+14], sp
  push word 8 ;; scanned
  mov ax, [Temps+14]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L201: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L202: ; Function: (lamN,g111)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L201
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [si]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L203: ; Arm: 733'9
  mov ax, g114
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g20
  mov ax, 2
  jmp [bp]

L204: ; Function: (loop,g113)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(8)
  mov bx, [si+2]
  cmp word [bx], 1
  jz L203
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [si]
  push word [Temps+6]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  mov ax, [Temps+10]
  mov [di], ax
  mov ax, [Temps+4]
  mov [di+2], ax
  mov bp, g113
  mov ax, 2
  jmp [bp]

L205: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L206: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L205
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L207: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L206
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g118
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L208: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L207
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, g117
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L209: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L208
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g116
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L210: ; Arm: 757'21
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L209
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+2]
  mov [di], ax
  mov ax, g115
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L211: ; Function: (lamN,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  mov bx, [si]
  cmp word [bx], 3
  jz L210
  mov ax, g119
  mov [di], ax
  mov bp, [bp+4]
  mov ax, 1
  jmp [bp]

L212: ; Function: (mk_com0,g120)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(22)
  push word [si+2]
  push word [si]
  push word L211
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [Temps+4]
  push word [si]
  push word 1
  mov [Temps+6], sp
  push word 6 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L213: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L214: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L213
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L215: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L214
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g124
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L216: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L215
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, g123
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L217: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L216
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g122
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L218: ; Arm: 766'17
  push word [CurrentCont]
  push word L217
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+2]
  mov [di], ax
  mov ax, g121
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L219: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
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
  mov bp, g22
  mov ax, 1
  jmp [bp]

L221: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L220
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g128
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L222: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L221
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, g127
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L223: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L222
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g126
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L224: ; Arm: 769'24
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [CurrentCont]
  push word L223
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+2]
  mov [di], ax
  mov ax, g125
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L225: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
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
  mov bp, g22
  mov ax, 1
  jmp [bp]

L227: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L226
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g132
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L228: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L227
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, g131
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L229: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L228
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g130
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L230: ; Arm: 772'25
  push word [CurrentCont]
  push word L229
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov ax, g129
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L231: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  mov bx, [si]
  cmp word [bx], 1
  jz L230
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [bp+6]
  mov ax, 1
  jmp [bp]

L232: ; Function: (lamN,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  mov bx, [si]
  cmp word [bx], 1
  jz L218
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L224
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L231
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g40
  mov ax, 1
  jmp [bp]

L233: ; Function: (mk_comI,g133)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(22)
  push word [si+2]
  push word [si]
  push word L232
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [Temps+4]
  push word [si]
  push word 1
  mov [Temps+6], sp
  push word 6 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L234: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L235: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L234
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L236: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L235
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g137
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L237: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L236
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, g136
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L238: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L237
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g135
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L239: ; Arm: 781'17
  push word [CurrentCont]
  push word L238
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+2]
  mov [di], ax
  mov ax, g134
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L240: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L241: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L240
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L242: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L241
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g141
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L243: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L242
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, g140
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L244: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L243
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g139
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L245: ; Arm: 784'20
  push word [CurrentCont]
  push word L244
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+2]
  mov [di], ax
  mov ax, g138
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L246: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L247: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L246
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L248: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L247
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g145
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L249: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L248
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, g144
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L250: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L249
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g143
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L251: ; Arm: 787'27
  mov ax, [bx+2]
  mov [Temps+10], ax
  mov ax, [bx+4]
  mov [Temps+12], ax
  push word [CurrentCont]
  push word L250
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+2]
  mov [di], ax
  mov ax, g142
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L252: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L253: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L252
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L254: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L253
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g149
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L255: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L254
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, g148
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L256: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L255
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g147
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L257: ; Arm: 790'28
  push word [CurrentCont]
  push word L256
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov ax, g146
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L258: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L259: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L258
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
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
  mov ax, g153
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L261: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L260
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, g152
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L262: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L261
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g151
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L263: ; Arm: 793'31
  push word [CurrentCont]
  push word L262
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov ax, g150
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L264: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  mov bx, [si]
  cmp word [bx], 1
  jz L263
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bp+8]
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov bp, [bp+6]
  mov ax, 2
  jmp [bp]

L265: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  mov bx, [si]
  cmp word [bx], 1
  jz L257
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L264
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov bp, g40
  mov ax, 1
  jmp [bp]

L266: ; Function: (lamN,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  mov bx, [si]
  cmp word [bx], 1
  jz L239
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 1
  jz L245
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L251
  push word [Temps+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L265
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g40
  mov ax, 1
  jmp [bp]

L267: ; Function: (mk_comII,g154)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(22)
  push word [si+2]
  push word [si]
  push word L266
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [Temps+4]
  push word [si]
  push word 1
  mov [Temps+6], sp
  push word 6 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L268: ; Arm: 260'27
  mov ax, g188
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g20
  mov ax, 2
  jmp [bp]

L269: ; Continuation
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
  mov ax, [si]
  mov [di+2], ax
  mov bp, g187
  mov ax, 2
  jmp [bp]

L270: ; Arm: 254'21
  mov ax, [bp+8]
  mov bx, 257
  sub ax, bx
  add ax, 1
  mov [Temps+4], ax
  mov ax, [bp+6]
  mov [di], ax
  mov ax, 257
  mov [di+2], ax
  mov ax, [Temps+4]
  mov [di+4], ax
  mov bp, g68
  mov ax, 3
  jmp [bp]

L271: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  mov ax, 257
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L269
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L270
  mov ax, g189
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L272: ; Arm: 253'21
  mov ax, [si+2]
  mov [di], ax
  mov ax, 1
  mov [di+2], ax
  mov ax, 257
  mov [di+4], ax
  mov bp, g68
  mov ax, 3
  jmp [bp]

L273: ; Function: (loop,g187)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(12)
  mov bx, [si+2]
  mov ax, [bx]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L268
  mov bx, [si+2]
  mov ax, [bx]
  mov [Temps+6], ax
  mov ax, 257
  cmp word ax, [Temps+6]
  call Bare_make_bool_from_n
  mov [Temps+8], ax
  push word [Temps+6]
  push word [si+2]
  push word [si]
  push word [CurrentCont]
  push word L271
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L272
  mov ax, [si+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L274: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L275: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L274
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L276: ; Function: (lamN,g230)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L275
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L277: ; Function: (lamN,g231)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, g230
  mov [di], ax
  mov ax, g229
  mov [di+2], ax
  mov bp, g7
  mov ax, 2
  jmp [bp]

L278: ; Arm: 811'32
  mov ax, g236
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L279: ; Arm: 322'24
  mov ax, g239
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L280: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [bp+6]
  mov ax, 1
  jmp [bp]

L281: ; Arm: 325'32
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L282: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  mov ax, [bp+4]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov ax, [Temps+2]
  sar ax, 1
  mov bx, 257
  sar bx, 1
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+4], dx
  mov ax, [Temps+4]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L280
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L281
  mov ax, g241
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L283: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L284: ; Arm: 324'24
  push word [CurrentCont]
  push word L283
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g240
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L285: ; Arm: 135'19
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

L286: ; Arm: 136'22
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

L287: ; Arm: 137'16
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

L288: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(16)
  mov bx, [si]
  cmp word [bx], 3
  jz L279
  mov ax, [bp+4]
  mov bx, [bp+6]
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+2], ax
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L282
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L284
  mov ax, [Temps+2]
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  cmp word ax, 17
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L285
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L286
  mov ax, 53
  cmp word ax, [Temps+6]
  call Bare_make_bool_from_n
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L287
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

L289: ; Arm: 10'9
  mov ax, g237
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L290: ; Function: (loop,t3)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  mov ax, [si]
  cmp word ax, 1025
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word [si]
  push word [bp+2]
  push word [CurrentCont]
  push word L288
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L289
  mov ax, g238
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L291: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g233
  mov ax, 1
  jmp [bp]

L292: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  mov dx, [bp+4]
  sar dx, 1
  mov bx, [si]
  call Bare_load_sector
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, [si]
  mov [Temps+4], ax
  push word [Temps+4]
  push word L290
  mov [Temps+6], sp
  push word 4 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L291
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, 1
  mov [di], ax
  mov bp, [Temps+6]
  mov ax, 1
  jmp [bp]

L293: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  mov bx, [si]
  cmp word [bx], 3
  jz L278
  push word [bp+4]
  push word [CurrentCont]
  push word L292
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, 1025
  mov [di], ax
  mov ax, 1
  jmp AllocBare_make_bytes

L294: ; Arm: 10'9
  mov ax, g234
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L295: ; Function: (loop,g233)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  mov ax, [si]
  cmp word ax, 21
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [si]
  push word [CurrentCont]
  push word L293
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L294
  mov ax, g235
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L296: ; Function: (lamN,g242)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, 1
  mov [di], ax
  mov bp, g233
  mov ax, 1
  jmp [bp]

L297: ; Arm: 322'24
  mov ax, g246
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L298: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [bp+6]
  mov ax, 1
  jmp [bp]

L299: ; Arm: 325'32
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov ax, [Temps+8]
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
  mov ax, [bp+4]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov ax, [Temps+2]
  sar ax, 1
  mov bx, 257
  sar bx, 1
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+4], dx
  mov ax, [Temps+4]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L298
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L299
  mov ax, g248
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L301: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L302: ; Arm: 324'24
  push word [CurrentCont]
  push word L301
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g247
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L303: ; Arm: 135'19
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

L304: ; Arm: 136'22
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

L305: ; Arm: 137'16
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

L306: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(16)
  mov bx, [si]
  cmp word [bx], 3
  jz L297
  mov ax, [bp+4]
  mov bx, [bp+6]
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+2], ax
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L300
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L302
  mov ax, [Temps+2]
  call Bare_char_to_num
  shl ax, 1
  add ax, 1
  mov [Temps+6], ax
  mov ax, [Temps+6]
  cmp word ax, 17
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L303
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L304
  mov ax, 53
  cmp word ax, [Temps+6]
  call Bare_make_bool_from_n
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L305
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

L307: ; Arm: 10'9
  mov ax, g244
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L308: ; Function: (loop,t3)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  mov ax, [si]
  cmp word ax, 1025
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word [si]
  push word [bp+2]
  push word [CurrentCont]
  push word L306
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L307
  mov ax, g245
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L309: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  mov dx, [bp+4]
  sar dx, 1
  mov bx, [si]
  call Bare_load_sector
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, [si]
  mov [Temps+4], ax
  push word [Temps+4]
  push word L308
  mov [Temps+6], sp
  push word 4 ;; scanned
  mov ax, 1
  mov [di], ax
  mov bp, [Temps+6]
  mov ax, 1
  jmp [bp]

L310: ; Function: (lamN,g249)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L309
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, 1025
  mov [di], ax
  mov ax, 1
  jmp AllocBare_make_bytes

L311: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, g285
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L312: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L311
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g31
  mov ax, 1
  jmp [bp]

L313: ; Function: (lamN,g286)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L312
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [si]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L314: ; Arm: 198'14
  mov ax, g346
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L315: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov bx, [si]
  cmp word [bx], 3
  jz L314
  mov ax, [bp+4]
  mov bx, [bp+6]
  mov dx, `,`
  sar bx, 1
  call Bare_set_bytes
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, [bp+6]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+4], ax
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [bp+8]
  mov ax, 1
  jmp [bp]

L316: ; Arm: 10'9
  mov ax, g344
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L317: ; Function: (loop,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  mov ax, [si]
  cmp word ax, 1025
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word [si]
  push word [bp+2]
  push word [CurrentCont]
  push word L315
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L316
  mov ax, g345
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L318: ; Arm: 802'32
  mov ax, g349
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L319: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov bx, [si]
  cmp word [bx], 3
  jz L318
  mov dx, [bp+6]
  sar dx, 1
  mov bx, [bp+4]
  call Bare_store_sector
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, [bp+6]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+4], ax
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [bp+8]
  mov ax, 1
  jmp [bp]

L320: ; Arm: 10'9
  mov ax, g347
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L321: ; Function: (loop,t2)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  mov ax, [si]
  cmp word ax, 21
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word [si]
  push word [bp+2]
  push word [CurrentCont]
  push word L319
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L320
  mov ax, g348
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
  mov ax, [bp+4]
  mov [Temps+2], ax
  push word [Temps+2]
  push word L321
  mov [Temps+4], sp
  push word 4 ;; scanned
  mov ax, 1
  mov [di], ax
  mov bp, [Temps+4]
  mov ax, 1
  jmp [bp]

L323: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [si]
  push word L317
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [si]
  push word [CurrentCont]
  push word L322
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, 1
  mov [di], ax
  mov bp, [Temps+2]
  mov ax, 1
  jmp [bp]

L324: ; Function: (lamN,g350)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L323
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, 1025
  mov [di], ax
  mov ax, 1
  jmp AllocBare_make_bytes

L325: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L326: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L325
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L327: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L326
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g45
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L328: ; Arm: 154'45
  push word [CurrentCont]
  push word L327
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, g44
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L329: ; Function: (_trace,t2)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  mov bx, [bp+2]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L328
  mov ax, g46
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L330: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  mov ax, [si]
  sar ax, 1
  mov bx, 33
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  push word [bp+4]
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+6], ax
  push word [Temps+6]
  push word 1
  mov [Temps+8], sp
  push word 4 ;; scanned
  mov ax, [Temps+8]
  mov [di], ax
  mov ax, [Temps+4]
  mov [di+2], ax
  mov bp, g83
  mov ax, 2
  jmp [bp]

L331: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  mov ax, [bp+6]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [CurrentCont]
  push word L330
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L332: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  mov ax, [si]
  sar ax, 1
  mov bx, 33
  sar bx, 1
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+2], dx
  mov ax, [Temps+2]
  sar ax, 1
  mov bx, 17
  sar bx, 1
  mul bx
  shl ax, 1
  add ax, 1
  mov [Temps+4], ax
  mov ax, [bp+6]
  mov [Temps+6], ax
  push word [Temps+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L331
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov ax, [Temps+4]
  mov [di+2], ax
  mov ax, [bp+8]
  mov [di+4], ax
  mov bp, g72
  mov ax, 3
  jmp [bp]

L333: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L332
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L334: ; Arm: 593'11
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L335: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(16)
  push word [si]
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word [bp+4]
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g24
  mov ax, 1
  jmp [bp]

L336: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(20)
  push word [si]
  push word [bp+6]
  push word [CurrentCont]
  push word L333
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [bp+8]
  cmp word [bx], 1
  jz L334
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  mov ax, 3
  mov bx, [Temps+4]
  add ax, bx
  sub ax, 1
  mov [Temps+8], ax
  mov ax, [Temps+8]
  sar ax, 1
  mov bx, 513
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+10], ax
  mov ax, [Temps+8]
  sar ax, 1
  mov bx, 513
  sar bx, 1
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+12], dx
  mov ax, [Temps+12]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+14], ax
  mov ax, [Temps+10]
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+16], ax
  push word [Temps+16]
  push word [Temps+14]
  push word [CurrentCont]
  push word L335
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g111
  mov [di], ax
  mov ax, [Temps+6]
  mov [di+2], ax
  mov bp, g2
  mov ax, 2
  jmp [bp]

L337: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L336
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [si]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L338: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(18)
  mov ax, [si]
  sar ax, 1
  mov bx, 33
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+4], ax
  push word [Temps+4]
  push word 1
  mov [Temps+6], sp
  push word 4 ;; scanned
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L337
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, g84
  mov ax, 1
  jmp [bp]

L339: ; Function: (storeI,t1)
  xchg si, di
  Bare_arg_check(3)
  Bare_heap_check(12)
  push word [si+4]
  push word [si+2]
  push word [bp+2]
  push word [CurrentCont]
  push word L338
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [si+2]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L340: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L341: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L340
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L342: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L341
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g157
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L343: ; Arm: 831'11
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L342
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g156
  mov [di], ax
  mov ax, g155
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L344: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L345: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L344
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L346: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L345
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g161
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L347: ; Arm: 834'12
  push word [CurrentCont]
  push word L346
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g160
  mov [di], ax
  mov ax, g159
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L348: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  mov bx, [si]
  cmp word [bx], 1
  jz L347
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word 3
  mov [Temps+4], sp
  push word 4 ;; scanned
  mov bx, [bp+4]
  mov ax, [Temps+4]
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

L349: ; Function: (command_mount,t3)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  mov bx, [bp+2]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L343
  push word [bp+2]
  push word [CurrentCont]
  push word L348
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g158
  mov [di], ax
  mov bp, g109
  mov ax, 1
  jmp [bp]

L350: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L351: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L350
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L352: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L351
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g164
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L353: ; Arm: 869'9
  push word [CurrentCont]
  push word L352
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g163
  mov [di], ax
  mov ax, g162
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L354: ; Arm: 878'17
  mov ax, g165
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L355: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L356: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L355
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L357: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L356
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g168
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L358: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L357
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, [bp+4]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L359: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L358
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g31
  mov ax, 1
  jmp [bp]

L360: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L359
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g167
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L361: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L360
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, g166
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L362: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L361
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g31
  mov ax, 1
  jmp [bp]

L363: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  mov bx, [si]
  cmp word [bx], 1
  jz L354
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [bp+4]
  push word [CurrentCont]
  push word L362
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L364: ; Function: (lamN,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [si]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [si]
  push word [CurrentCont]
  push word L363
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+2]
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov bp, g97
  mov ax, 2
  jmp [bp]

L365: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [bp+4]
  push word L364
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g7
  mov ax, 2
  jmp [bp]

L366: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  mov ax, [si]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  push word [bp+4]
  push word [CurrentCont]
  push word L365
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, 1
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov bp, g9
  mov ax, 2
  jmp [bp]

L367: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L366
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [si]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [bx+6]
  mov [Temps+6], ax
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L368: ; Function: (command_list,t4)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  mov bx, [bp+2]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L353
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov ax, [bx+6]
  mov [Temps+10], ax
  push word [CurrentCont]
  push word L367
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+4]
  mov ax, [bx+2]
  mov [Temps+12], ax
  mov ax, [bx+4]
  mov [Temps+14], ax
  mov ax, [bx+6]
  mov [Temps+16], ax
  mov ax, [Temps+12]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L369: ; Arm: 890'10
  mov ax, g200
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L370: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov bx, [bp+10]
  cmp word [bx], 3
  jz L369
  mov bx, [bp+12]
  mov ax, [bx]
  mov [Temps+2], ax
  mov ax, [bp+8]
  mov bx, [Temps+2]
  add ax, bx
  sub ax, 1
  mov [Temps+4], ax
  mov ax, [bp+4]
  mov [di], ax
  mov ax, [Temps+4]
  mov [di+2], ax
  mov bp, [bp+6]
  mov ax, 2
  jmp [bp]

L371: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L372: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L371
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L373: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L372
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g174
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L374: ; Arm: 665'9
  push word [CurrentCont]
  push word L373
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g173
  mov [di], ax
  mov ax, g172
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L375: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L376: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L375
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L377: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L376
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g177
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L378: ; Arm: 669'12
  push word [CurrentCont]
  push word L377
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g176
  mov [di], ax
  mov ax, g175
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L379: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov bx, [bp+4]
  mov ax, [Temps+2]
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

L380: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(24)
  push word [si]
  push word [bp+12]
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word 3
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [bp+14]
  push word [bp+6]
  push word [CurrentCont]
  push word L379
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+10]
  mov [di], ax
  mov ax, [bp+8]
  mov [di+2], ax
  mov ax, [Temps+4]
  mov [di+4], ax
  mov bp, [bp+4]
  mov ax, 3
  jmp [bp]

L381: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(18)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L380
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov ax, [bp+16]
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g20
  mov ax, 2
  jmp [bp]

L382: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(20)
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L381
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov ax, g179
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g20
  mov ax, 2
  jmp [bp]

L383: ; Arm: 678'15
  push word [si+4]
  push word [si]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L382
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov ax, g178
  mov [di], ax
  mov ax, [si+2]
  mov [di+2], ax
  mov bp, g20
  mov ax, 2
  jmp [bp]

L384: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+8]
  push word [bp+12]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov ax, [bp+14]
  mov [di+4], ax
  mov ax, 1
  mov [di+6], ax
  mov ax, [bp+10]
  mov [di+8], ax
  mov bp, [bp+6]
  mov ax, 5
  jmp [bp]

L385: ; Arm: 684'22
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [Temps+8]
  push word [Temps+6]
  push word [Temps+4]
  push word [si+2]
  push word bp
  push word [si]
  push word [CurrentCont]
  push word L384
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov ax, [si+6]
  mov [di+2], ax
  mov ax, [Temps+2]
  mov [di+4], ax
  mov bp, g85
  mov ax, 3
  jmp [bp]

L386: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L387: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L386
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L388: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L387
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g183
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L389: ; Arm: 689'22
  push word [CurrentCont]
  push word L388
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g182
  mov [di], ax
  mov ax, g181
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L390: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+6]
  push word [bp+12]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov ax, [bp+10]
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov ax, g184
  mov [di+4], ax
  mov ax, 1
  mov [di+6], ax
  mov ax, [bp+8]
  mov [di+8], ax
  mov bp, [bp+4]
  mov ax, 5
  jmp [bp]

L391: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(16)
  mov bx, [si]
  cmp word [bx], 1
  jz L389
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [Temps+6]
  push word [Temps+4]
  push word [bp+12]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L390
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov ax, [bp+8]
  mov [di+2], ax
  mov ax, [bp+10]
  mov [di+4], ax
  mov bp, g85
  mov ax, 3
  jmp [bp]

L392: ; Arm: 569'10
  mov ax, g180
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L393: ; Function: (loop,t1)
  xchg si, di
  Bare_arg_check(5)
  Bare_heap_check(40)
  mov bx, [si+8]
  cmp word [bx], 1
  jz L383
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [si+4]
  cmp word [bx], 3
  jz L385
  push word [Temps+4]
  push word [Temps+2]
  push word [si+6]
  push word [si+2]
  push word bp
  push word [CurrentCont]
  push word L391
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, [si]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov ax, [bx+6]
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 1
  jz L392
  mov ax, [bx+2]
  mov [Temps+12], ax
  mov ax, [bx+4]
  mov [Temps+14], ax
  push word [Temps+14]
  push word [Temps+8]
  push word [Temps+6]
  push word 1
  mov [Temps+16], sp
  push word 8 ;; scanned
  push word [Temps+12]
  push word [Temps+16]
  push word 1
  mov [Temps+18], sp
  push word 6 ;; scanned
  push word [Temps+18]
  push word 3
  mov [Temps+20], sp
  push word 4 ;; scanned
  mov ax, [Temps+20]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L394: ; Arm: 704'10
  mov ax, [bp+2]
  sar ax, 1
  mov bx, 257
  sar bx, 1
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+4], dx
  mov ax, [si+2]
  mov [di], ax
  mov ax, [si+4]
  mov [di+2], ax
  mov ax, [si+6]
  mov [di+4], ax
  mov ax, [Temps+4]
  mov [di+6], ax
  mov ax, [bp+6]
  mov [di+8], ax
  mov bp, [bp+4]
  mov ax, 5
  jmp [bp]

L395: ; Arm: 707'22
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [si+4]
  push word [Temps+4]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+10], ax
  mov ax, [Temps+10]
  mov [di], ax
  mov ax, [si+2]
  mov [di+2], ax
  mov ax, [Temps+8]
  mov [di+4], ax
  mov ax, [Temps+6]
  mov [di+6], ax
  mov bp, bp
  mov ax, 4
  jmp [bp]

L396: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L397: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L396
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L398: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L397
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g194
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L399: ; Arm: 710'22
  push word [CurrentCont]
  push word L398
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g193
  mov [di], ax
  mov ax, g192
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L400: ; Arm: 198'14
  mov ax, g197
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L401: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov bx, [si]
  cmp word [bx], 3
  jz L400
  mov ax, [bp+4]
  mov bx, [bp+6]
  mov dx, `\x00`
  sar bx, 1
  call Bare_set_bytes
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, [bp+6]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+4], ax
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [bp+8]
  mov ax, 1
  jmp [bp]

L402: ; Arm: 10'9
  mov ax, g195
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L403: ; Function: (loop,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  mov ax, [si]
  cmp word ax, 257
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word [si]
  push word [bp+2]
  push word [CurrentCont]
  push word L401
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L402
  mov ax, g196
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L404: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+8]
  push word [bp+12]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+4], ax
  mov ax, [Temps+4]
  mov [di], ax
  mov ax, [bp+10]
  mov [di+2], ax
  mov ax, [Temps+2]
  mov [di+4], ax
  mov ax, g198
  mov [di+6], ax
  mov bp, [bp+6]
  mov ax, 4
  jmp [bp]

L405: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(22)
  mov ax, [bp+14]
  mov [Temps+2], ax
  push word [Temps+2]
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L404
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov ax, [bp+12]
  mov [di], ax
  mov ax, [Temps+4]
  mov [di+2], ax
  mov bp, g83
  mov ax, 2
  jmp [bp]

L406: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(24)
  push word [si]
  push word L403
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [si]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L405
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov ax, 1
  mov [di], ax
  mov bp, [Temps+2]
  mov ax, 1
  jmp [bp]

L407: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(16)
  mov bx, [si]
  cmp word [bx], 1
  jz L399
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [Temps+6]
  push word [Temps+4]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L406
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov ax, 257
  mov [di], ax
  mov ax, 1
  jmp AllocBare_make_bytes

L408: ; Arm: 569'10
  mov ax, g191
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L409: ; Function: (skip_loop,t1)
  xchg si, di
  Bare_arg_check(4)
  Bare_heap_check(36)
  mov ax, [si]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L394
  mov bx, [si+6]
  cmp word [bx], 3
  jz L395
  push word [si+4]
  push word bp
  push word [si]
  push word [CurrentCont]
  push word L407
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [si+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  mov ax, [bx+6]
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 1
  jz L408
  mov ax, [bx+2]
  mov [Temps+10], ax
  mov ax, [bx+4]
  mov [Temps+12], ax
  push word [Temps+12]
  push word [Temps+6]
  push word [Temps+4]
  push word 1
  mov [Temps+14], sp
  push word 8 ;; scanned
  push word [Temps+10]
  push word [Temps+14]
  push word 1
  mov [Temps+16], sp
  push word 6 ;; scanned
  push word [Temps+16]
  push word 3
  mov [Temps+18], sp
  push word 4 ;; scanned
  mov ax, [Temps+18]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L410: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  sar ax, 1
  mov bx, 257
  sar bx, 1
  mov dx, 0
  Div bx
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov ax, [bp+6]
  mov [di+2], ax
  mov ax, g199
  mov [di+4], ax
  mov ax, [si]
  mov [di+6], ax
  mov bp, [bp+8]
  mov ax, 4
  jmp [bp]

L411: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(22)
  push word [si]
  push word [bp+10]
  push word [bp+4]
  push word L409
  mov [Temps+2], sp
  push word 8 ;; scanned
  push word [Temps+2]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L410
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [bp+8]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L412: ; Arm: 698'40
  mov ax, g185
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L413: ; Continuation
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

L414: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L413
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g190
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g187
  mov ax, 2
  jmp [bp]

L415: ; Arm: 254'21
  mov ax, [bp+8]
  mov bx, [bp+6]
  sub ax, bx
  add ax, 1
  mov [Temps+4], ax
  mov ax, [bp+4]
  mov [di], ax
  mov ax, [bp+6]
  mov [di+2], ax
  mov ax, [Temps+4]
  mov [di+4], ax
  mov bp, g68
  mov ax, 3
  jmp [bp]

L416: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  mov ax, [bp+6]
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [si]
  push word [CurrentCont]
  push word L414
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L415
  mov ax, g186
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L417: ; Arm: 253'21
  mov ax, [bp+12]
  mov [di], ax
  mov ax, 1
  mov [di+2], ax
  mov ax, [Temps+6]
  mov [di+4], ax
  mov bp, g68
  mov ax, 3
  jmp [bp]

L418: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(40)
  push word [si]
  push word [bp+16]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L393
  mov [Temps+2], sp
  push word 12 ;; scanned
  mov ax, [bp+10]
  sar ax, 1
  mov bx, 257
  sar bx, 1
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+4], dx
  mov ax, 257
  mov bx, [Temps+4]
  sub ax, bx
  add ax, 1
  mov [Temps+6], ax
  mov bx, [bp+12]
  mov ax, [bx]
  mov [Temps+8], ax
  mov ax, [Temps+8]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  push word [Temps+2]
  push word [bp+18]
  push word [bp+14]
  push word [bp+10]
  push word [CurrentCont]
  push word L411
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L412
  mov bx, [bp+12]
  mov ax, [bx]
  mov [Temps+12], ax
  mov ax, [Temps+6]
  cmp word ax, [Temps+12]
  call Bare_make_bool_from_n
  mov [Temps+14], ax
  push word [Temps+12]
  push word [Temps+6]
  push word [bp+12]
  push word [CurrentCont]
  push word L416
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+14]
  cmp word [bx], 3
  jz L417
  mov ax, [bp+12]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L419: ; Arm: 100'23
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L420: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(22)
  mov bx, [bp+12]
  mov ax, [bx]
  mov [Temps+2], ax
  mov ax, [bp+10]
  mov bx, [Temps+2]
  add ax, bx
  sub ax, 1
  mov [Temps+4], ax
  mov ax, [si]
  cmp word ax, [Temps+4]
  call Bare_make_bool_from_n
  mov [Temps+6], ax
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L418
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L419
  mov ax, [si]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L421: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(22)
  mov bx, [si]
  cmp word [bx], 1
  jz L378
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L420
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L422: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(20)
  push word [si]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L421
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, [bp+8]
  mov [di+2], ax
  mov bp, g97
  mov ax, 2
  jmp [bp]

L423: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(34)
  mov bx, [bp+6]
  mov ax, [bx]
  mov [Temps+2], ax
  push word [si]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [CurrentCont]
  push word L370
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L374
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [si]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L422
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bx, [Temps+4]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov ax, [bx+6]
  mov [Temps+10], ax
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L424: ; Arm: 888'21
  mov ax, [bp+16]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  mov ax, [bp+14]
  mov [di], ax
  mov ax, 1
  mov [di+2], ax
  mov ax, [Temps+2]
  mov [di+4], ax
  mov bp, g68
  mov ax, 3
  jmp [bp]

L425: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(18)
  push word [si]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L423
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bx, [si]
  cmp word [bx], 3
  jz L424
  mov ax, [bp+14]
  mov [di], ax
  mov ax, g171
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L426: ; Arm: 887'22
  mov ax, [Temps+2]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+6], ax
  mov ax, [si]
  mov bx, [Temps+6]
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+8], ax
  mov ax, [Temps+8]
  cmp word ax, `\x04`
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov ax, [Temps+10]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L427: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(20)
  mov bx, [si]
  mov ax, [bx]
  mov [Temps+2], ax
  mov ax, 1
  cmp word ax, [Temps+2]
  call Bare_make_bool_from_n
  mov [Temps+4], ax
  push word [Temps+2]
  push word [si]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L425
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L426
  mov ax, g170
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L428: ; Function: (write_to_file,t5)
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(16)
  push word [si+2]
  push word bp
  push word [si]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L427
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov ax, g169
  mov [di], ax
  mov bp, g79
  mov ax, 1
  jmp [bp]

L429: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L430: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L429
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L431: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L430
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g253
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L432: ; Arm: 820'11
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L431
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g252
  mov [di], ax
  mov ax, g251
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L433: ; Function: (lamN,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(16)
  push word [si]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word 161
  push word 11
  push word 81
  push word 1
  mov [Temps+4], sp
  push word 8 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov ax, g256
  mov [di+4], ax
  mov bp, [bp+2]
  mov ax, 3
  jmp [bp]

L434: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [bp+4]
  push word L433
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g7
  mov ax, 2
  jmp [bp]

L435: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L434
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, 1
  mov [di], ax
  mov ax, 159
  mov [di+2], ax
  mov bp, g9
  mov ax, 2
  jmp [bp]

L436: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(20)
  push word [si]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word 1
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L435
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov bp, g83
  mov ax, 2
  jmp [bp]

L437: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L436
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g255
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L438: ; Function: (lamN,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(32)
  mov bx, [bp+4]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L432
  push word g254
  push word `P`
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [Temps+4]
  push word `\x05`
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word `(`
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [bp+2]
  push word [CurrentCont]
  push word L437
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, g24
  mov ax, 1
  jmp [bp]

L439: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L440: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L439
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L441: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L440
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g261
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L442: ; Arm: 841'9
  push word [CurrentCont]
  push word L441
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g260
  mov [di], ax
  mov ax, g259
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L443: ; Function: (lamN,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  mov bx, [bp+2]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L442
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov bx, [bp+2]
  mov ax, g262
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

L444: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L445: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L444
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L446: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L445
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g266
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L447: ; Arm: 847'9
  push word [CurrentCont]
  push word L446
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g265
  mov [di], ax
  mov ax, g264
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L448: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L449: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L448
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L450: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L449
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g276
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L451: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L450
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, g275
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L452: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L451
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g31
  mov ax, 1
  jmp [bp]

L453: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L452
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g1
  mov ax, 1
  jmp [bp]

L454: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L453
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L455: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L454
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L456: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L455
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g274
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L457: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L456
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, g273
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L458: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L457
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g31
  mov ax, 1
  jmp [bp]

L459: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L458
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, g1
  mov ax, 1
  jmp [bp]

L460: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L459
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L461: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L460
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L462: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L461
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g272
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L463: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L462
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, g268
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L464: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, g271
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L465: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L464
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, [bp+4]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L466: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L465
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g31
  mov ax, 1
  jmp [bp]

L467: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L466
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g270
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L468: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L467
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, [bp+4]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L469: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+4]
  push word [si]
  push word [CurrentCont]
  push word L468
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, g31
  mov ax, 1
  jmp [bp]

L470: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L469
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g269
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L471: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(20)
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L463
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [bx+6]
  mov [Temps+6], ax
  push word [Temps+4]
  push word [Temps+2]
  push word [CurrentCont]
  push word L470
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, g31
  mov ax, 1
  jmp [bp]

L472: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L471
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L473: ; Function: (lamN,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  mov bx, [bp+2]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L447
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov ax, [bx+6]
  mov [Temps+10], ax
  push word [Temps+10]
  push word [Temps+8]
  push word [Temps+6]
  push word [CurrentCont]
  push word L472
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g267
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L474: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L475: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L474
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L476: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L475
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g281
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L477: ; Arm: 859'9
  push word [CurrentCont]
  push word L476
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g280
  mov [di], ax
  mov ax, g279
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L478: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L479: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L478
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L480: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L479
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, [bp+4]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L481: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L480
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g291
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L482: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L481
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g31
  mov ax, 1
  jmp [bp]

L483: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L482
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g290
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L484: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L483
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, g282
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L485: ; Arm: 426'9
  mov ax, g283
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L486: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, g289
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L487: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L486
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, [bp+4]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L488: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L487
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g31
  mov ax, 1
  jmp [bp]

L489: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L488
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g288
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L490: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L489
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, g284
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L491: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L490
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g287
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g61
  mov ax, 2
  jmp [bp]

L492: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(16)
  push word [bp+4]
  push word [CurrentCont]
  push word L484
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [si]
  cmp word [bx], 1
  jz L485
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [Temps+4]
  push word [CurrentCont]
  push word L491
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g286
  mov [di], ax
  mov ax, [Temps+6]
  mov [di+2], ax
  mov bp, g2
  mov ax, 2
  jmp [bp]

L493: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L492
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov bp, g97
  mov ax, 2
  jmp [bp]

L494: ; Function: (lamN,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  mov bx, [bp+2]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L477
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [si]
  push word [CurrentCont]
  push word L493
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+4]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov ax, [bx+6]
  mov [Temps+10], ax
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L495: ; Arm: 939'18
  mov ax, g303
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L496: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov bx, [bp+8]
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [bp+6]
  mov ax, 1
  jmp [bp]

L497: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L498: ; Arm: 942'6
  push word [CurrentCont]
  push word L497
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L499: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L500: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L499
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L501: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(18)
  mov ax, [si]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L495
  mov ax, [bp+4]
  mov [Temps+4], ax
  mov ax, [si]
  cmp word ax, 257
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word [si]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L496
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L498
  push word [CurrentCont]
  push word L500
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov ax, 1
  mov [di+2], ax
  mov ax, [si]
  mov [di+4], ax
  mov bp, g68
  mov ax, 3
  jmp [bp]

L502: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, 1
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L503: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L502
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L504: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L503
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L505: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L504
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g295
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L506: ; Arm: 634'9
  push word [CurrentCont]
  push word L505
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g294
  mov [di], ax
  mov ax, g293
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L507: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, 1
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L508: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L507
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L509: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L508
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L510: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L509
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g298
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L511: ; Arm: 638'12
  push word [CurrentCont]
  push word L510
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g297
  mov [di], ax
  mov ax, g296
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L512: ; Arm: 642'33
  mov ax, 1
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L513: ; Arm: 644'17
  mov ax, 1
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L514: ; Arm: 647'15
  mov ax, [bp+10]
  mov bx, 257
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  mov ax, [bp+14]
  mov [di], ax
  mov ax, [bp+8]
  mov [di+2], ax
  mov ax, [Temps+2]
  mov [di+4], ax
  mov bp, [bp+6]
  mov ax, 3
  jmp [bp]

L515: ; Continuation
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

L516: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L515
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov ax, 1
  mov [di+2], ax
  mov ax, [si]
  mov [di+4], ax
  mov bp, g72
  mov ax, 3
  jmp [bp]

L517: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L516
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, [bp+6]
  mov [di+2], ax
  mov ax, [bp+8]
  mov [di+4], ax
  mov bp, g68
  mov ax, 3
  jmp [bp]

L518: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L517
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [si]
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L519: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L518
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov bp, g84
  mov ax, 1
  jmp [bp]

L520: ; Arm: 99'23
  mov ax, 257
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L521: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  mov ax, 257
  cmp word ax, [si]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L519
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L520
  mov ax, [si]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L522: ; Arm: 99'23
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L523: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  mov bx, [si]
  cmp word [bx], 3
  jz L514
  mov ax, 257
  mov bx, [bp+10]
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  mov ax, [Temps+2]
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov [Temps+4], ax
  push word [bp+12]
  push word [bp+10]
  push word [bp+4]
  push word [CurrentCont]
  push word L521
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L522
  mov ax, [bp+8]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L524: ; Arm: 10'9
  mov ax, g301
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L525: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(18)
  mov bx, [si]
  cmp word [bx], 3
  jz L512
  mov bx, [bp+6]
  cmp word [bx], 1
  jz L513
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [bp+12]
  cmp word ax, 257
  call Bare_make_bool_from_n
  mov [Temps+6], ax
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L523
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L524
  mov ax, g302
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L526: ; Arm: 10'9
  mov ax, g299
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L527: ; Function: (loop,t2)
  xchg si, di
  Bare_arg_check(3)
  Bare_heap_check(16)
  mov ax, 1
  cmp word ax, [si+2]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [si+4]
  push word [si+2]
  push word bp
  push word [si]
  push word [bp+2]
  push word [CurrentCont]
  push word L525
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L526
  mov ax, g300
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L528: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov bx, [bp+4]
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  mov ax, [bp+8]
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov ax, [bp+4]
  mov [di+4], ax
  mov bp, [bp+6]
  mov ax, 3
  jmp [bp]

L529: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [si]
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L528
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [bp+6]
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

L530: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(18)
  mov bx, [si]
  cmp word [bx], 1
  jz L511
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [bp+4]
  push word L527
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+6]
  push word [CurrentCont]
  push word L529
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L531: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(16)
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L530
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov bp, g97
  mov ax, 2
  jmp [bp]

L532: ; Function: (loop,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(24)
  mov bx, [bp+2]
  mov ax, [bx]
  mov [Temps+2], ax
  push word bp
  push word [si]
  push word [bp+6]
  push word [CurrentCont]
  push word L501
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L506
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L531
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+4]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov ax, [bx+6]
  mov [Temps+10], ax
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L533: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word L532
  mov [Temps+2], sp
  push word 8 ;; scanned
  mov ax, 1
  mov [di], ax
  mov bp, [Temps+2]
  mov ax, 1
  jmp [bp]

L534: ; Function: (lamN,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [si]
  push word [bp+2]
  push word [CurrentCont]
  push word L533
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, 257
  mov [di], ax
  mov ax, 1
  jmp AllocBare_make_bytes

L535: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L536: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L535
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L537: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L536
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g307
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L538: ; Arm: 918'9
  push word [CurrentCont]
  push word L537
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g306
  mov [di], ax
  mov ax, g305
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L539: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L540: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L539
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L541: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L540
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g310
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L542: ; Arm: 922'12
  push word [CurrentCont]
  push word L541
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g309
  mov [di], ax
  mov ax, g308
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L543: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov bx, [bp+4]
  mov ax, [Temps+2]
  mov [bx], ax
  mov ax, Bare_unit
  mov [Temps+4], ax
  mov ax, g312
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L544: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(16)
  push word [bp+8]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [si]
  push word [bp+6]
  push word [CurrentCont]
  push word L543
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+10]
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov ax, g311
  mov [di+4], ax
  mov bp, [bp+4]
  mov ax, 3
  jmp [bp]

L545: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L544
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, [bp+12]
  mov [di+2], ax
  mov bp, g110
  mov ax, 2
  jmp [bp]

L546: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(40)
  mov bx, [si]
  cmp word [bx], 1
  jz L542
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [Temps+6]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L545
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, [bp+10]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov ax, [bx+4]
  mov [Temps+10], ax
  mov ax, [bx+6]
  mov [Temps+12], ax
  push word [bp+8]
  push word 1
  mov [Temps+14], sp
  push word 4 ;; scanned
  push word [Temps+10]
  push word [Temps+14]
  push word 3
  mov [Temps+16], sp
  push word 6 ;; scanned
  push word [Temps+12]
  push word [Temps+16]
  push word [Temps+8]
  push word 1
  mov [Temps+18], sp
  push word 8 ;; scanned
  mov ax, [Temps+18]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L547: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(22)
  push word [bp+8]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [si]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L546
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov bp, g97
  mov ax, 2
  jmp [bp]

L548: ; Function: (lamN,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  mov bx, [bp+4]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L538
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [si]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L547
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, [Temps+4]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov ax, [bx+6]
  mov [Temps+10], ax
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L549: ; Arm: 895'9
  mov ax, g324
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L550: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+6]
  mov [di], ax
  mov ax, 1
  mov [di+2], ax
  mov bp, [bp+4]
  mov ax, 2
  jmp [bp]

L551: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L550
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L552: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L551
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L553: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L552
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g326
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L554: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L553
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, g325
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L555: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L554
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g31
  mov ax, 1
  jmp [bp]

L556: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  mov bx, [si]
  cmp word [bx], 1
  jz L549
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [bp+4]
  push word [CurrentCont]
  push word L555
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L557: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, g317
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L558: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L557
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L559: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L558
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L560: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L559
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g316
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L561: ; Arm: 607'9
  push word [CurrentCont]
  push word L560
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g315
  mov [di], ax
  mov ax, g314
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L562: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, g322
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L563: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L562
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L564: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L563
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L565: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L564
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g321
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L566: ; Arm: 610'12
  push word [CurrentCont]
  push word L565
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g320
  mov [di], ax
  mov ax, g319
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L567: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [bp+6]
  push word 3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov bx, [bp+4]
  mov ax, [Temps+2]
  mov [bx], ax
  mov ax, Bare_unit
  mov [Temps+4], ax
  push word [bp+8]
  push word 3
  mov [Temps+6], sp
  push word 4 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L568: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(26)
  push word g323
  push word 1
  push word 1
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word 3
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L567
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, [bp+10]
  mov [di+2], ax
  mov ax, [Temps+4]
  mov [di+4], ax
  mov bp, [bp+4]
  mov ax, 3
  jmp [bp]

L569: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  mov bx, [si]
  cmp word [bx], 1
  jz L566
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [Temps+6]
  push word [Temps+4]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L568
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, [Temps+4]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov ax, [bx+4]
  mov [Temps+10], ax
  mov ax, [bx+6]
  mov [Temps+12], ax
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L570: ; Arm: 561'10
  mov ax, g318
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L571: ; Function: (lamN,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(42)
  mov bx, [bp+4]
  mov ax, [bx]
  mov [Temps+2], ax
  push word [bp+6]
  push word [CurrentCont]
  push word L556
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L561
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L569
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+4]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov ax, [bx+6]
  mov [Temps+10], ax
  mov bx, [Temps+8]
  cmp word [bx], 1
  jz L570
  mov ax, [bx+2]
  mov [Temps+12], ax
  mov ax, [bx+4]
  mov [Temps+14], ax
  push word [Temps+10]
  push word [Temps+14]
  push word [Temps+6]
  push word 1
  mov [Temps+16], sp
  push word 8 ;; scanned
  push word [Temps+12]
  push word [Temps+16]
  push word 1
  mov [Temps+18], sp
  push word 6 ;; scanned
  push word [Temps+18]
  push word 3
  mov [Temps+20], sp
  push word 4 ;; scanned
  mov ax, [Temps+20]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L572: ; Arm: 905'9
  mov ax, g338
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L573: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [bp+6]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, [bp+4]
  mov ax, 2
  jmp [bp]

L574: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  mov bx, [si]
  cmp word [bx], 1
  jz L572
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L573
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L575: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, g333
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L576: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L575
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L577: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L576
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L578: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L577
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g332
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L579: ; Arm: 623'9
  push word [CurrentCont]
  push word L578
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g331
  mov [di], ax
  mov ax, g330
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L580: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, g337
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L581: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L580
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L582: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L581
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L583: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L582
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g336
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L584: ; Arm: 627'12
  push word [CurrentCont]
  push word L583
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g335
  mov [di], ax
  mov ax, g334
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L585: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  mov bx, [si]
  cmp word [bx], 1
  jz L584
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word 3
  mov [Temps+4], sp
  push word 4 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L586: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [CurrentCont]
  push word L585
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov bp, g97
  mov ax, 2
  jmp [bp]

L587: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(18)
  mov bx, [bp+4]
  mov ax, [bx]
  mov [Temps+2], ax
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L574
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L579
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [bp+8]
  push word [CurrentCont]
  push word L586
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+4]
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov ax, [bx+6]
  mov [Temps+10], ax
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L588: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L587
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L589: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L588
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L590: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L589
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g329
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L591: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L590
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, g328
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L592: ; Function: (lamN,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [si]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L591
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g31
  mov ax, 1
  jmp [bp]

L593: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [bp+6]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov ax, [bp+8]
  mov [di+2], ax
  mov bp, [bp+4]
  mov ax, 2
  jmp [bp]

L594: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L593
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L595: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L594
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L596: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L595
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g342
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L597: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L596
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, [bp+10]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L598: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [si]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L597
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, g31
  mov ax, 1
  jmp [bp]

L599: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L598
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g341
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L600: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L599
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, g340
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L601: ; Function: (lamN,t1)
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(12)
  push word [si+2]
  push word [si]
  push word [bp+2]
  push word [CurrentCont]
  push word L600
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si+2]
  mov [di], ax
  mov bp, g31
  mov ax, 1
  jmp [bp]

L602: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L603: ; Arm: 1006'36
  push word [CurrentCont]
  push word L602
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g355
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L604: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov bx, 3
  add ax, bx
  sub ax, 1
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [bp+6]
  mov ax, 1
  jmp [bp]

L605: ; Arm: 990'7
  mov ax, g358
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L606: ; Arm: 743'9
  mov ax, g359
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L607: ; Arm: 747'35
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

L608: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  mov bx, [si]
  cmp word [bx], 3
  jz L607
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [bp+4]
  mov ax, 1
  jmp [bp]

L609: ; Function: (loop,t3)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  mov bx, [si]
  cmp word [bx], 1
  jz L606
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
  push word L608
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov ax, [bp+2]
  mov [di+2], ax
  mov bp, g56
  mov ax, 2
  jmp [bp]

L610: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L611: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L610
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L612: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L611
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g362
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L613: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L612
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, g361
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L614: ; Arm: 993'12
  push word [CurrentCont]
  push word L613
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov ax, g360
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L615: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  mov bx, [si]
  cmp word [bx], 1
  jz L614
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [Temps+4]
  mov ax, 1
  jmp [bp]

L616: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L615
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, [bp+8]
  mov ax, 1
  jmp [bp]

L617: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(28)
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L604
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [si]
  cmp word [bx], 1
  jz L605
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+2]
  push word L609
  mov [Temps+6], sp
  push word 4 ;; scanned
  push word [Temps+6]
  push word [Temps+4]
  push word [Temps+2]
  push word [CurrentCont]
  push word L616
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [bp+4]
  mov ax, [bx+2]
  mov [Temps+8], ax
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L618: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L617
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g357
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g20
  mov ax, 2
  jmp [bp]

L619: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L618
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g356
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g62
  mov ax, 2
  jmp [bp]

L620: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  mov bx, [si]
  cmp word [bx], 3
  jz L603
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L619
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+10]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L621: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [si]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L620
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, [bp+4]
  mov [di+2], ax
  mov bp, g56
  mov ax, 2
  jmp [bp]

L622: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L621
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, g354
  mov [di], ax
  mov bp, g79
  mov ax, 1
  jmp [bp]

L623: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L622
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L624: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L623
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L625: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L624
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, g353
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L626: ; Function: (repl,t17)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word bp
  push word [si]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L625
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g31
  mov ax, 1
  jmp [bp]

L627: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, 3
  mov [di], ax
  mov bp, [bp+4]
  mov ax, 1
  jmp [bp]

L628: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L627
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g375
  mov [di], ax
  mov bp, [bp+4]
  mov ax, 1
  jmp [bp]

L629: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L628
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g374
  mov [di], ax
  mov bp, [bp+4]
  mov ax, 1
  jmp [bp]

L630: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L629
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L631: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L630
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L632: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L631
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g373
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L633: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L632
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, g371
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L634: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L633
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g372
  mov [di], ax
  mov ax, [bp+10]
  mov [di+2], ax
  mov bp, g61
  mov ax, 2
  jmp [bp]

L635: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L634
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L636: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L635
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L637: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L636
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, g370
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L638: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L637
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, 1537
  mov [di], ax
  mov bp, g31
  mov ax, 1
  jmp [bp]

L639: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L638
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L640: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L639
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L641: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L640
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, g369
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L642: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L641
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, 81
  mov [di], ax
  mov bp, g31
  mov ax, 1
  jmp [bp]

L643: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L642
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L644: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L643
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L645: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L644
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, g368
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L646: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L645
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, 257
  mov [di], ax
  mov bp, g31
  mov ax, 1
  jmp [bp]

L647: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L646
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L648: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L647
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L649: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L648
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, g367
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L650: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L649
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, 10241
  mov [di], ax
  mov bp, g31
  mov ax, 1
  jmp [bp]

L651: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L650
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L652: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L651
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L653: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L652
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, g366
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L654: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L653
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, 21
  mov [di], ax
  mov bp, g31
  mov ax, 1
  jmp [bp]

L655: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L654
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L656: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L655
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L657: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L656
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, g365
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L658: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L657
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, 1025
  mov [di], ax
  mov bp, g31
  mov ax, 1
  jmp [bp]

L659: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L658
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L660: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [si]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L659
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, g364
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L661: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L660
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g363
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g113
  mov ax, 2
  jmp [bp]

L662: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(146)
  push word g352
  push word [si]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word [bp+36]
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [Temps+4]
  push word [bp+34]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word [bp+32]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [Temps+8]
  push word [bp+30]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [Temps+10]
  push word [bp+28]
  push word 3
  mov [Temps+12], sp
  push word 6 ;; scanned
  push word [Temps+12]
  push word [bp+26]
  push word 3
  mov [Temps+14], sp
  push word 6 ;; scanned
  push word [Temps+14]
  push word [bp+24]
  push word 3
  mov [Temps+16], sp
  push word 6 ;; scanned
  push word [Temps+16]
  push word [bp+22]
  push word 3
  mov [Temps+18], sp
  push word 6 ;; scanned
  push word [Temps+18]
  push word [bp+20]
  push word 3
  mov [Temps+20], sp
  push word 6 ;; scanned
  push word [Temps+20]
  push word [bp+18]
  push word 3
  mov [Temps+22], sp
  push word 6 ;; scanned
  push word [Temps+22]
  push word [bp+16]
  push word 3
  mov [Temps+24], sp
  push word 6 ;; scanned
  push word [Temps+24]
  push word [bp+14]
  push word 3
  mov [Temps+26], sp
  push word 6 ;; scanned
  push word [Temps+26]
  push word [bp+10]
  push word 3
  mov [Temps+28], sp
  push word 6 ;; scanned
  push word [Temps+28]
  push word [bp+6]
  push word 3
  mov [Temps+30], sp
  push word 6 ;; scanned
  push word [Temps+30]
  push word 1
  mov [Temps+32], sp
  push word 4 ;; scanned
  push word [Temps+32]
  push word [bp+4]
  push word L626
  mov [Temps+34], sp
  push word 6 ;; scanned
  push word [Temps+34]
  push word [bp+12]
  push word [bp+8]
  push word [CurrentCont]
  push word L661
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+32]
  mov ax, [bx+2]
  mov [Temps+36], ax
  mov ax, [Temps+36]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L663: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(40)
  push word [si]
  push word [bp+34]
  push word [bp+32]
  push word [bp+30]
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L662
  mov [CurrentCont], sp
  push word 38 ;; scanned
  mov ax, g351
  mov [di], ax
  mov ax, g350
  mov [di+2], ax
  mov bp, g120
  mov ax, 2
  jmp [bp]

L664: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(44)
  push word [bp+24]
  push word L601
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [si]
  push word [bp+34]
  push word [bp+32]
  push word [bp+30]
  push word [bp+28]
  push word [bp+26]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L663
  mov [CurrentCont], sp
  push word 36 ;; scanned
  mov ax, g343
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov bp, g154
  mov ax, 2
  jmp [bp]

L665: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(46)
  push word [bp+26]
  push word [bp+6]
  push word L592
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [si]
  push word [bp+34]
  push word [bp+32]
  push word [bp+30]
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L664
  mov [CurrentCont], sp
  push word 36 ;; scanned
  mov ax, g339
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov bp, g133
  mov ax, 2
  jmp [bp]

L666: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(48)
  push word [bp+28]
  push word [bp+8]
  push word [bp+6]
  push word L571
  mov [Temps+2], sp
  push word 8 ;; scanned
  push word [si]
  push word [bp+34]
  push word [bp+32]
  push word [bp+30]
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L665
  mov [CurrentCont], sp
  push word 36 ;; scanned
  mov ax, g327
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov bp, g120
  mov ax, 2
  jmp [bp]

L667: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(46)
  push word [bp+8]
  push word [bp+6]
  push word L548
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [si]
  push word [bp+32]
  push word [bp+30]
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L666
  mov [CurrentCont], sp
  push word 36 ;; scanned
  mov ax, g313
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov bp, g133
  mov ax, 2
  jmp [bp]

L668: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(42)
  push word [bp+8]
  push word L534
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [si]
  push word [bp+30]
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L667
  mov [CurrentCont], sp
  push word 34 ;; scanned
  mov ax, g304
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov bp, g133
  mov ax, 2
  jmp [bp]

L669: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(40)
  push word [bp+8]
  push word L494
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [si]
  push word [bp+28]
  push word [bp+26]
  push word [bp+24]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L668
  mov [CurrentCont], sp
  push word 32 ;; scanned
  mov ax, g292
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov bp, g133
  mov ax, 2
  jmp [bp]

L670: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(32)
  push word [bp+26]
  push word [si]
  push word [bp+24]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L669
  mov [CurrentCont], sp
  push word 30 ;; scanned
  mov ax, g278
  mov [di], ax
  mov ax, [bp+16]
  mov [di+2], ax
  mov bp, g120
  mov ax, 2
  jmp [bp]

L671: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(36)
  push word [bp+8]
  push word L473
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+24]
  push word [si]
  push word [bp+22]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L670
  mov [CurrentCont], sp
  push word 28 ;; scanned
  mov ax, g277
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov bp, g120
  mov ax, 2
  jmp [bp]

L672: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(34)
  push word [bp+8]
  push word L443
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+22]
  push word [si]
  push word [bp+20]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L671
  mov [CurrentCont], sp
  push word 26 ;; scanned
  mov ax, g263
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov bp, g120
  mov ax, 2
  jmp [bp]

L673: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(26)
  push word [bp+20]
  push word [si]
  push word [bp+18]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L672
  mov [CurrentCont], sp
  push word 24 ;; scanned
  mov ax, g258
  mov [di], ax
  mov ax, [bp+12]
  mov [di+2], ax
  mov bp, g120
  mov ax, 2
  jmp [bp]

L674: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(32)
  push word [bp+8]
  push word [bp+6]
  push word L438
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+18]
  push word [si]
  push word [bp+16]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L673
  mov [CurrentCont], sp
  push word 22 ;; scanned
  mov ax, g257
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov bp, g120
  mov ax, 2
  jmp [bp]

L675: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(22)
  push word [bp+16]
  push word [bp+14]
  push word [si]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L674
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov ax, g250
  mov [di], ax
  mov ax, g249
  mov [di+2], ax
  mov bp, g133
  mov ax, 2
  jmp [bp]

L676: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(20)
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [si]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L675
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov ax, g243
  mov [di], ax
  mov ax, g242
  mov [di+2], ax
  mov bp, g120
  mov ax, 2
  jmp [bp]

L677: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(48)
  push word [si]
  push word L339
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word g112
  mov [Temps+4], sp
  push word 2 ;; scanned
  push word [Temps+4]
  push word L349
  mov [Temps+6], sp
  push word 4 ;; scanned
  push word [Temps+4]
  push word L368
  mov [Temps+8], sp
  push word 4 ;; scanned
  push word [Temps+4]
  push word [Temps+2]
  push word L428
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [Temps+10]
  push word [Temps+8]
  push word [Temps+6]
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+4]
  push word [CurrentCont]
  push word L676
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov ax, g232
  mov [di], ax
  mov ax, g231
  mov [di+2], ax
  mov bp, g120
  mov ax, 2
  jmp [bp]

L678: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(24)
  push word g86
  push word `\x00`
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word `\x00`
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [si]
  push word [CurrentCont]
  push word L677
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g24
  mov ax, 1
  jmp [bp]

L679: ; Start
  xchg si, di
  Bare_arg_check(0)
  Bare_heap_check(24)
  push word g43
  mov [Temps+2], sp
  push word 2 ;; scanned
  push word [Temps+2]
  push word L329
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word g73
  push word `\x04`
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L678
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, g24
  mov ax, 1
  jmp [bp]

g1:
  dw L3
g2:
  dw L7
g3:
  dw 1
g4:
  dw L12
g5:
  dw 1
g6:
  dw L15
g7:
  dw L18
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
  dw 3
g14:
  dw 1
g15:
  dw 1
g17:
  dw 1
g18:
  dw 3
g19:
  dw 1
g20:
  dw L29
g21:
  dw 1
g22:
  dw L32
g23:
  dw 1
g24:
  dw L38
g25:
  dw 1
g26:
  dw L43
g27:
  dw L45
g28:
  dw 1
g29:
  dw 1
g30:
  dw 1
g31:
  dw L50
g32:
  dw L60
g33:
  dw 1
g34:
  dw 3
g35:
  dw 1
g36:
  dw 3
g37:
  dw 1
g38:
  dw 1
g39:
  dw 1
g40:
  dw L62
g41:
  dw L68
g42:
  dw 1
g43:
  dw 1
g44:
  dw 3
  db `\n`
g45:
  dw 15
  db `trace: `
g46:
  dw 1
g47:
  dw 1
g48:
  dw L74
g49:
  dw 1
g50:
  dw 3
g51:
  dw 1
g52:
  dw 3
g53:
  dw 1
g54:
  dw 3
g55:
  dw 1
g56:
  dw L83
g57:
  dw 1
g58:
  dw 1
g59:
  dw 1
g60:
  dw 1
  db ``
g61:
  dw L96
g62:
  dw L105
g63:
  dw L101
g64:
  dw 1
g65:
  dw 1
g66:
  dw 3
g67:
  dw 1
g68:
  dw L112
g69:
  dw 1
g70:
  dw 3
g71:
  dw 1
g72:
  dw L117
g73:
  dw 1
g74:
  dw L133
g75:
  dw 1
g76:
  dw 1
g77:
  dw 3
g78:
  dw 1
g79:
  dw L134
g80:
  dw 3
  db `]`
g81:
  dw 3
  db `[`
g83:
  dw L139
g84:
  dw L143
g85:
  dw L147
g86:
  dw 1
g87:
  dw 1
g88:
  dw 3
g89:
  dw 3
  db `\n`
g90:
  dw 27
  db `no such inode`
g91:
  dw 15
  db `Error: `
g92:
  dw 1
g93:
  dw 1
g94:
  dw 1
g95:
  dw 1
g96:
  dw L148
g97:
  dw L173
g98:
  dw 9
  db `BARE`
g99:
  dw 1
g100:
  dw 3
g101:
  dw 1
g102:
  dw 1
g103:
  dw 1
g104:
  dw 1
g105:
  dw 3
g106:
  dw L178
g107:
  dw L179
g108:
  dw 1
g109:
  dw L197
g110:
  dw L200
g111:
  dw L202
g112:
  dw 1
g113:
  dw L204
g114:
  dw 1
g115:
  dw 21
  db ` [no args]`
g116:
  dw 15
  db `usage: `
g117:
  dw 3
  db `\n`
g118:
  dw 15
  db `Error: `
g119:
  dw 1
g120:
  dw L212
g121:
  dw 13
  db ` [int]`
g122:
  dw 15
  db `usage: `
g123:
  dw 3
  db `\n`
g124:
  dw 15
  db `Error: `
g125:
  dw 13
  db ` [int]`
g126:
  dw 15
  db `usage: `
g127:
  dw 3
  db `\n`
g128:
  dw 15
  db `Error: `
g129:
  dw 13
  db ` [int]`
g130:
  dw 15
  db `usage: `
g131:
  dw 3
  db `\n`
g132:
  dw 15
  db `Error: `
g133:
  dw L233
g134:
  dw 25
  db ` [int] [int]`
g135:
  dw 15
  db `usage: `
g136:
  dw 3
  db `\n`
g137:
  dw 15
  db `Error: `
g138:
  dw 25
  db ` [int] [int]`
g139:
  dw 15
  db `usage: `
g140:
  dw 3
  db `\n`
g141:
  dw 15
  db `Error: `
g142:
  dw 25
  db ` [int] [int]`
g143:
  dw 15
  db `usage: `
g144:
  dw 3
  db `\n`
g145:
  dw 15
  db `Error: `
g146:
  dw 25
  db ` [int] [int]`
g147:
  dw 15
  db `usage: `
g148:
  dw 3
  db `\n`
g149:
  dw 15
  db `Error: `
g150:
  dw 25
  db ` [int] [int]`
g151:
  dw 15
  db `usage: `
g152:
  dw 3
  db `\n`
g153:
  dw 15
  db `Error: `
g154:
  dw L267
g155:
  dw 3
  db `\n`
g156:
  dw 53
  db `filesystem already mounted`
g157:
  dw 15
  db `Error: `
g158:
  dw 1
g159:
  dw 3
  db `\n`
g160:
  dw 63
  db `no filesystem found; try format`
g161:
  dw 15
  db `Error: `
g162:
  dw 3
  db `\n`
g163:
  dw 65
  db `no filesystem mounted; try mount`
g164:
  dw 15
  db `Error: `
g165:
  dw 1
g166:
  dw 3
  db `\n`
g167:
  dw 7
  db ` : `
g168:
  dw 11
  db `file `
g169:
  dw 1
g170:
  dw 1
g171:
  dw 3
  db `\n`
g172:
  dw 3
  db `\n`
g173:
  dw 65
  db `no filesystem mounted; try mount`
g174:
  dw 15
  db `Error: `
g175:
  dw 3
  db `\n`
g176:
  dw 75
  db `inode is not allocated (no such file)`
g177:
  dw 15
  db `Error: `
g178:
  dw 1
g179:
  dw 1
g180:
  dw 1
g181:
  dw 3
  db `\n`
g182:
  dw 69
  db `no blocks available (disk is full)`
g183:
  dw 15
  db `Error: `
g184:
  dw 1
g185:
  dw 1
g186:
  dw 1
  db ``
g187:
  dw L273
g188:
  dw 1
g189:
  dw 1
  db ``
g190:
  dw 1
g191:
  dw 1
g192:
  dw 3
  db `\n`
g193:
  dw 69
  db `no blocks available (disk is full)`
g194:
  dw 15
  db `Error: `
g195:
  dw 1
g196:
  dw 3
g197:
  dw 1
g198:
  dw 1
g199:
  dw 1
g200:
  dw 1
g201:
  dw 83
  db `dump      : Display the raw data on disk.`
g202:
  dw 101
  db `sector I  : Display the raw data in disk sector I.`
g203:
  dw 157
  db `format    : Prepare disk with an empty filesystem; trashing existing contents.`
g204:
  dw 145
  db `mount     : Discover an existing filesystem; allow files to be accessed.`
g205:
  dw 137
  db `unmount   : Unmount the existing filesystem; required before format.`
g206:
  dw 137
  db `debug     : Display internal information about a mounted filesystem.`
g207:
  dw 107
  db `ls        : List all files together with their sizes.`
g208:
  dw 123
  db `stat I    : Display internal information about inode(file) I.`
g209:
  dw 87
  db `cat I     : Display the contents of file I.`
g210:
  dw 115
  db `rm I      : Remove file F; returning resources for reuse.`
g211:
  dw 103
  db `create    : Create new file; lines read from input.`
g212:
  dw 123
  db `append I  : Append to existing file I; lines read from input.`
g213:
  dw 151
  db `splat I N : Overwrite existing file I from offset N; lines read from input.`
g214:
  dw 87
  db `wipe      : Wipe disk; fill it with commas.`
g215:
  dw 1
g216:
  dw 3, g214, g215
g217:
  dw 3, g213, g216
g218:
  dw 3, g212, g217
g219:
  dw 3, g211, g218
g220:
  dw 3, g210, g219
g221:
  dw 3, g209, g220
g222:
  dw 3, g208, g221
g223:
  dw 3, g207, g222
g224:
  dw 3, g206, g223
g225:
  dw 3, g205, g224
g226:
  dw 3, g204, g225
g227:
  dw 3, g203, g226
g228:
  dw 3, g202, g227
g229:
  dw 3, g201, g228
g230:
  dw L276
g231:
  dw L277
g232:
  dw 9
  db `help`
g233:
  dw L295
g234:
  dw 1
g235:
  dw 3
g236:
  dw 1
g237:
  dw 1
g238:
  dw 3
g239:
  dw 1
g240:
  dw 5
  db `\\n`
g241:
  dw 1
g242:
  dw L296
g243:
  dw 9
  db `dump`
g244:
  dw 1
g245:
  dw 3
g246:
  dw 1
g247:
  dw 5
  db `\\n`
g248:
  dw 1
g249:
  dw L310
g250:
  dw 13
  db `sector`
g251:
  dw 3
  db `\n`
g252:
  dw 95
  db `cannot format a mounted filesystem; try unmount`
g253:
  dw 15
  db `Error: `
g254:
  dw 1
g255:
  dw 9
  db `BARE`
g256:
  dw 1
g257:
  dw 13
  db `format`
g258:
  dw 11
  db `mount`
g259:
  dw 3
  db `\n`
g260:
  dw 65
  db `no filesystem mounted; try mount`
g261:
  dw 15
  db `Error: `
g262:
  dw 1
g263:
  dw 15
  db `unmount`
g264:
  dw 3
  db `\n`
g265:
  dw 65
  db `no filesystem mounted; try mount`
g266:
  dw 15
  db `Error: `
g267:
  dw 37
  db `Filesystem found:\n`
g268:
  dw 3
  db `\n`
g269:
  dw 21
  db `, #inodes=`
g270:
  dw 37
  db `, #admin-blocks=1+`
g271:
  dw 17
  db `#blocks=`
g272:
  dw 29
  db `- superblock: `
g273:
  dw 3
  db `\n`
g274:
  dw 35
  db `- #free-blocks = `
g275:
  dw 3
  db `\n`
g276:
  dw 35
  db `- #free-inodes = `
g277:
  dw 11
  db `debug`
g278:
  dw 5
  db `ls`
g279:
  dw 3
  db `\n`
g280:
  dw 65
  db `no filesystem mounted; try mount`
g281:
  dw 15
  db `Error: `
g282:
  dw 3
  db `\n`
g283:
  dw 23
  db `unallocated`
g284:
  dw 3
  db `]`
g285:
  dw 3
  db `B`
g286:
  dw L313
g287:
  dw 3
  db `,`
g288:
  dw 21
  db `, blocks=[`
g289:
  dw 25
  db `Inode: size=`
g290:
  dw 7
  db ` : `
g291:
  dw 3
  db `I`
g292:
  dw 9
  db `stat`
g293:
  dw 3
  db `\n`
g294:
  dw 65
  db `no filesystem mounted; try mount`
g295:
  dw 15
  db `Error: `
g296:
  dw 3
  db `\n`
g297:
  dw 75
  db `inode is not allocated (no such file)`
g298:
  dw 15
  db `Error: `
g299:
  dw 1
g300:
  dw 3
g301:
  dw 1
g302:
  dw 3
g303:
  dw 1
g304:
  dw 7
  db `cat`
g305:
  dw 3
  db `\n`
g306:
  dw 65
  db `no filesystem mounted; try mount`
g307:
  dw 15
  db `Error: `
g308:
  dw 3
  db `\n`
g309:
  dw 75
  db `inode is not allocated (no such file)`
g310:
  dw 15
  db `Error: `
g311:
  dw 1
g312:
  dw 1
g313:
  dw 5
  db `rm`
g314:
  dw 3
  db `\n`
g315:
  dw 65
  db `no filesystem mounted; try mount`
g316:
  dw 15
  db `Error: `
g317:
  dw 1
g318:
  dw 1
g319:
  dw 3
  db `\n`
g320:
  dw 73
  db `no inodes available (too many files)`
g321:
  dw 15
  db `Error: `
g322:
  dw 1
g323:
  dw 1
g324:
  dw 1
g325:
  dw 45
  db `; (to finish type ^D)\n`
g326:
  dw 29
  db `Creating file `
g327:
  dw 13
  db `create`
g328:
  dw 45
  db `; (to finish type ^D)\n`
g329:
  dw 37
  db `Appending to file `
g330:
  dw 3
  db `\n`
g331:
  dw 65
  db `no filesystem mounted; try mount`
g332:
  dw 15
  db `Error: `
g333:
  dw 1
g334:
  dw 3
  db `\n`
g335:
  dw 75
  db `inode is not allocated (no such file)`
g336:
  dw 15
  db `Error: `
g337:
  dw 1
g338:
  dw 1
g339:
  dw 13
  db `append`
g340:
  dw 45
  db `; (to finish type ^D)\n`
g341:
  dw 27
  db ` from offset `
g342:
  dw 35
  db `Overwriting file `
g343:
  dw 11
  db `splat`
g344:
  dw 1
g345:
  dw 3
g346:
  dw 1
g347:
  dw 1
g348:
  dw 3
g349:
  dw 1
g350:
  dw L324
g351:
  dw 9
  db `wipe`
g352:
  dw 1
g353:
  dw 5
  db `> `
g354:
  dw 1
g355:
  dw 17
  db `exiting\n`
g356:
  dw 1
g357:
  dw 1
g358:
  dw 1
g359:
  dw 1
g360:
  dw 41
  db ` : command not found`
g361:
  dw 3
  db `\n`
g362:
  dw 15
  db `Error: `
g363:
  dw 1
g364:
  dw 39
  db `Filesystem explorer`
g365:
  dw 31
  db `- sector_size: `
g366:
  dw 41
  db `- #sectors_on_disk: `
g367:
  dw 41
  db `- addressable disk: `
g368:
  dw 29
  db `- block_size: `
g369:
  dw 39
  db `- #blocks_on_disk: `
g370:
  dw 57
  db `- max_file_size (6 blocks): `
g371:
  dw 3
  db `\n`
g372:
  dw 3
  db ` `
g373:
  dw 11
  db `Try: `
g374:
  dw 1
g375:
  dw 1

bare_start: jmp L679
