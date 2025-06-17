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

L174: ; Arm: 584'7
  mov ax, [si]
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
  mov ax, [si]
  mov [di], ax
  mov ax, [bp+4]
  mov [di+2], ax
  mov bp, g98
  mov ax, 2
  jmp [bp]

L176: ; Function: (giveup_blocks,g98)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(26)
  mov bx, [si+2]
  cmp word [bx], 1
  jz L174
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [CurrentCont]
  push word L175
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

L177: ; Continuation
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

L178: ; Function: (lamN,g99)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L177
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

L179: ; Arm: 733'9
  mov ax, g102
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g20
  mov ax, 2
  jmp [bp]

L180: ; Function: (loop,g101)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(8)
  mov bx, [si+2]
  cmp word [bx], 1
  jz L179
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
  mov bp, g101
  mov ax, 2
  jmp [bp]

L181: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L182: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L181
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L183: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L182
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g106
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L184: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L183
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, g105
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L185: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L184
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g104
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L186: ; Arm: 757'21
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L185
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+2]
  mov [di], ax
  mov ax, g103
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L187: ; Function: (lamN,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  mov bx, [si]
  cmp word [bx], 3
  jz L186
  mov ax, g107
  mov [di], ax
  mov bp, [bp+4]
  mov ax, 1
  jmp [bp]

L188: ; Function: (mk_com0,g108)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(22)
  push word [si+2]
  push word [si]
  push word L187
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

L189: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L190: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L189
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L191: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L190
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g112
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L192: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L191
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, g111
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L193: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L192
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g110
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L194: ; Arm: 766'17
  push word [CurrentCont]
  push word L193
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+2]
  mov [di], ax
  mov ax, g109
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L195: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L196: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L195
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L197: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L196
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g116
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L198: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L197
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, g115
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L199: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L198
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g114
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L200: ; Arm: 769'24
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  push word [CurrentCont]
  push word L199
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+2]
  mov [di], ax
  mov ax, g113
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L201: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L202: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L201
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L203: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L202
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g120
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L204: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L203
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, g119
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L205: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L204
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g118
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L206: ; Arm: 772'25
  push word [CurrentCont]
  push word L205
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov ax, g117
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L207: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  mov bx, [si]
  cmp word [bx], 1
  jz L206
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [bp+6]
  mov ax, 1
  jmp [bp]

L208: ; Function: (lamN,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  mov bx, [si]
  cmp word [bx], 1
  jz L194
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L200
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L207
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g40
  mov ax, 1
  jmp [bp]

L209: ; Function: (mk_comI,g121)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(22)
  push word [si+2]
  push word [si]
  push word L208
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

L210: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L211: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L210
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L212: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L211
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g125
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L213: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L212
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, g124
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L214: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L213
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g123
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L215: ; Arm: 781'17
  push word [CurrentCont]
  push word L214
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+2]
  mov [di], ax
  mov ax, g122
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L216: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L217: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L216
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L218: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L217
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g129
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L219: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L218
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, g128
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L220: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L219
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g127
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L221: ; Arm: 784'20
  push word [CurrentCont]
  push word L220
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+2]
  mov [di], ax
  mov ax, g126
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L222: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
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
  mov bp, g22
  mov ax, 1
  jmp [bp]

L224: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L223
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g133
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L225: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L224
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, g132
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L226: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L225
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g131
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L227: ; Arm: 787'27
  mov ax, [bx+2]
  mov [Temps+10], ax
  mov ax, [bx+4]
  mov [Temps+12], ax
  push word [CurrentCont]
  push word L226
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+2]
  mov [di], ax
  mov ax, g130
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L228: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L229: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L228
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L230: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L229
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g137
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L231: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L230
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, g136
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L232: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L231
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g135
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L233: ; Arm: 790'28
  push word [CurrentCont]
  push word L232
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov ax, g134
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
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
  mov ax, g141
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
  mov ax, g140
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
  mov ax, g139
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L239: ; Arm: 793'31
  push word [CurrentCont]
  push word L238
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov ax, g138
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L240: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  mov bx, [si]
  cmp word [bx], 1
  jz L239
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bp+8]
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov bp, [bp+6]
  mov ax, 2
  jmp [bp]

L241: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  mov bx, [si]
  cmp word [bx], 1
  jz L233
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L240
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov bp, g40
  mov ax, 1
  jmp [bp]

L242: ; Function: (lamN,t1)
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
  mov bx, [Temps+4]
  cmp word [bx], 1
  jz L221
  mov ax, [bx+2]
  mov [Temps+6], ax
  mov ax, [bx+4]
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L227
  push word [Temps+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L241
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g40
  mov ax, 1
  jmp [bp]

L243: ; Function: (mk_comII,g142)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(22)
  push word [si+2]
  push word [si]
  push word L242
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

L244: ; Arm: 260'27
  mov ax, g162
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g20
  mov ax, 2
  jmp [bp]

L245: ; Continuation
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
  mov bp, g161
  mov ax, 2
  jmp [bp]

L246: ; Arm: 254'21
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

L247: ; Continuation
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
  push word L245
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L246
  mov ax, g163
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L248: ; Arm: 253'21
  mov ax, [si+2]
  mov [di], ax
  mov ax, 1
  mov [di+2], ax
  mov ax, 257
  mov [di+4], ax
  mov bp, g68
  mov ax, 3
  jmp [bp]

L249: ; Function: (loop,g161)[arg0,arg1]
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
  jz L244
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
  push word L247
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L248
  mov ax, [si+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L250: ; Continuation
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

L251: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L250
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L252: ; Function: (lamN,g204)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L251
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L253: ; Function: (lamN,g205)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, g204
  mov [di], ax
  mov ax, g203
  mov [di+2], ax
  mov bp, g7
  mov ax, 2
  jmp [bp]

L254: ; Arm: 811'32
  mov ax, g210
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L255: ; Arm: 322'24
  mov ax, g213
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L256: ; Continuation
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

L257: ; Arm: 325'32
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

L258: ; Continuation
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
  push word L256
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L257
  mov ax, g215
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L259: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L260: ; Arm: 324'24
  push word [CurrentCont]
  push word L259
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g214
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L261: ; Arm: 135'19
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

L262: ; Arm: 136'22
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

L263: ; Arm: 137'16
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

L264: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(16)
  mov bx, [si]
  cmp word [bx], 3
  jz L255
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
  push word L258
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L260
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
  jz L261
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L262
  mov ax, 53
  cmp word ax, [Temps+6]
  call Bare_make_bool_from_n
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L263
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

L265: ; Arm: 10'9
  mov ax, g211
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L266: ; Function: (loop,t3)
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
  push word L264
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L265
  mov ax, g212
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L267: ; Continuation
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
  mov bp, g207
  mov ax, 1
  jmp [bp]

L268: ; Continuation
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
  push word L266
  mov [Temps+6], sp
  push word 4 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L267
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, 1
  mov [di], ax
  mov bp, [Temps+6]
  mov ax, 1
  jmp [bp]

L269: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  mov bx, [si]
  cmp word [bx], 3
  jz L254
  push word [bp+4]
  push word [CurrentCont]
  push word L268
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, 1025
  mov [di], ax
  mov ax, 1
  jmp AllocBare_make_bytes

L270: ; Arm: 10'9
  mov ax, g208
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L271: ; Function: (loop,g207)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  mov ax, [si]
  cmp word ax, 21
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [si]
  push word [CurrentCont]
  push word L269
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L270
  mov ax, g209
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L272: ; Function: (lamN,g216)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, 1
  mov [di], ax
  mov bp, g207
  mov ax, 1
  jmp [bp]

L273: ; Arm: 322'24
  mov ax, g220
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

L275: ; Arm: 325'32
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

L276: ; Continuation
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
  push word L274
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L275
  mov ax, g222
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L277: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L278: ; Arm: 324'24
  push word [CurrentCont]
  push word L277
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g221
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L279: ; Arm: 135'19
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

L280: ; Arm: 136'22
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

L281: ; Arm: 137'16
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

L282: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(16)
  mov bx, [si]
  cmp word [bx], 3
  jz L273
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
  push word L276
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L278
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
  jz L279
  mov ax, [Temps+2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [Temps+10], ax
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L280
  mov ax, 53
  cmp word ax, [Temps+6]
  call Bare_make_bool_from_n
  mov [Temps+12], ax
  mov bx, [Temps+12]
  cmp word [bx], 3
  jz L281
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

L283: ; Arm: 10'9
  mov ax, g218
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L284: ; Function: (loop,t3)
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
  push word L282
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L283
  mov ax, g219
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L285: ; Continuation
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
  push word L284
  mov [Temps+6], sp
  push word 4 ;; scanned
  mov ax, 1
  mov [di], ax
  mov bp, [Temps+6]
  mov ax, 1
  jmp [bp]

L286: ; Function: (lamN,g223)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L285
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, 1025
  mov [di], ax
  mov ax, 1
  jmp AllocBare_make_bytes

L287: ; Arm: 10'9
  mov ax, g241
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L288: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  cmp word ax, [si]
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L287
  mov ax, g242
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L289: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L288
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

L290: ; Function: (lamN,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+2]
  push word [CurrentCont]
  push word L289
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

L291: ; Function: (lamN,g243)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(6)
  push word [si+2]
  push word L290
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g4
  mov ax, 2
  jmp [bp]

L292: ; Function: (lamN,g244)[arg0]
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

L293: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, g283
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L294: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L293
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g31
  mov ax, 1
  jmp [bp]

L295: ; Function: (lamN,g284)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L294
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

L296: ; Arm: 198'14
  mov ax, g344
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L297: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov bx, [si]
  cmp word [bx], 3
  jz L296
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

L298: ; Arm: 10'9
  mov ax, g342
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L299: ; Function: (loop,t1)
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
  push word L297
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L298
  mov ax, g343
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L300: ; Arm: 802'32
  mov ax, g347
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
  mov bx, [si]
  cmp word [bx], 3
  jz L300
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

L302: ; Arm: 10'9
  mov ax, g345
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L303: ; Function: (loop,t2)
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
  push word L301
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L302
  mov ax, g346
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L304: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  mov ax, [bp+4]
  mov [Temps+2], ax
  push word [Temps+2]
  push word L303
  mov [Temps+4], sp
  push word 4 ;; scanned
  mov ax, 1
  mov [di], ax
  mov bp, [Temps+4]
  mov ax, 1
  jmp [bp]

L305: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [si]
  push word L299
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [si]
  push word [CurrentCont]
  push word L304
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, 1
  mov [di], ax
  mov bp, [Temps+2]
  mov ax, 1
  jmp [bp]

L306: ; Function: (lamN,g348)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L305
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, 1025
  mov [di], ax
  mov ax, 1
  jmp AllocBare_make_bytes

L307: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L308: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L307
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L309: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L308
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g45
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L310: ; Arm: 154'45
  push word [CurrentCont]
  push word L309
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, g44
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L311: ; Function: (_trace,t2)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  mov bx, [bp+2]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L310
  mov ax, g46
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L312: ; Continuation
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

L313: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  mov ax, [bp+6]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [CurrentCont]
  push word L312
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

L314: ; Continuation
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
  push word L313
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

L315: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L314
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

L316: ; Arm: 593'11
  mov ax, [bp+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L317: ; Continuation
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

L318: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(20)
  push word [si]
  push word [bp+6]
  push word [CurrentCont]
  push word L315
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [bp+8]
  cmp word [bx], 1
  jz L316
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
  push word L317
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g99
  mov [di], ax
  mov ax, [Temps+6]
  mov [di+2], ax
  mov bp, g2
  mov ax, 2
  jmp [bp]

L319: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L318
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

L320: ; Continuation
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
  push word L319
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, g84
  mov ax, 1
  jmp [bp]

L321: ; Function: (storeI,t1)
  xchg si, di
  Bare_arg_check(3)
  Bare_heap_check(12)
  push word [si+4]
  push word [si+2]
  push word [bp+2]
  push word [CurrentCont]
  push word L320
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

L322: ; Arm: 890'10
  mov ax, g174
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L323: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov bx, [bp+10]
  cmp word [bx], 3
  jz L322
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

L324: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L325: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L324
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
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
  mov ax, g148
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L327: ; Arm: 665'9
  push word [CurrentCont]
  push word L326
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g147
  mov [di], ax
  mov ax, g146
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L328: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L329: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L328
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L330: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L329
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g151
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L331: ; Arm: 669'12
  push word [CurrentCont]
  push word L330
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g150
  mov [di], ax
  mov ax, g149
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L332: ; Continuation
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

L333: ; Continuation
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
  push word L332
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

L334: ; Continuation
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
  push word L333
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov ax, [bp+16]
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g20
  mov ax, 2
  jmp [bp]

L335: ; Continuation
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
  push word L334
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov ax, g153
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g20
  mov ax, 2
  jmp [bp]

L336: ; Arm: 678'15
  push word [si+4]
  push word [si]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L335
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov ax, g152
  mov [di], ax
  mov ax, [si+2]
  mov [di+2], ax
  mov bp, g20
  mov ax, 2
  jmp [bp]

L337: ; Continuation
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

L338: ; Arm: 684'22
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
  push word L337
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

L339: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L340: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L339
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
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
  mov ax, g157
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L342: ; Arm: 689'22
  push word [CurrentCont]
  push word L341
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g156
  mov [di], ax
  mov ax, g155
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L343: ; Continuation
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
  mov ax, g158
  mov [di+4], ax
  mov ax, 1
  mov [di+6], ax
  mov ax, [bp+8]
  mov [di+8], ax
  mov bp, [bp+4]
  mov ax, 5
  jmp [bp]

L344: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(16)
  mov bx, [si]
  cmp word [bx], 1
  jz L342
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
  push word L343
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

L345: ; Arm: 569'10
  mov ax, g154
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L346: ; Function: (loop,t1)
  xchg si, di
  Bare_arg_check(5)
  Bare_heap_check(40)
  mov bx, [si+8]
  cmp word [bx], 1
  jz L336
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov bx, [si+4]
  cmp word [bx], 3
  jz L338
  push word [Temps+4]
  push word [Temps+2]
  push word [si+6]
  push word [si+2]
  push word bp
  push word [CurrentCont]
  push word L344
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
  jz L345
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

L347: ; Arm: 704'10
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

L348: ; Arm: 707'22
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

L349: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L350: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L349
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
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
  mov ax, g168
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L352: ; Arm: 710'22
  push word [CurrentCont]
  push word L351
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g167
  mov [di], ax
  mov ax, g166
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L353: ; Arm: 198'14
  mov ax, g171
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L354: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov bx, [si]
  cmp word [bx], 3
  jz L353
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

L355: ; Arm: 10'9
  mov ax, g169
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L356: ; Function: (loop,t1)
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
  push word L354
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L355
  mov ax, g170
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L357: ; Continuation
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
  mov ax, g172
  mov [di+6], ax
  mov bp, [bp+6]
  mov ax, 4
  jmp [bp]

L358: ; Continuation
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
  push word L357
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov ax, [bp+12]
  mov [di], ax
  mov ax, [Temps+4]
  mov [di+2], ax
  mov bp, g83
  mov ax, 2
  jmp [bp]

L359: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(24)
  push word [si]
  push word L356
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [si]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L358
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov ax, 1
  mov [di], ax
  mov bp, [Temps+2]
  mov ax, 1
  jmp [bp]

L360: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(16)
  mov bx, [si]
  cmp word [bx], 1
  jz L352
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
  push word L359
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov ax, 257
  mov [di], ax
  mov ax, 1
  jmp AllocBare_make_bytes

L361: ; Arm: 569'10
  mov ax, g165
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L362: ; Function: (skip_loop,t1)
  xchg si, di
  Bare_arg_check(4)
  Bare_heap_check(36)
  mov ax, [si]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L347
  mov bx, [si+6]
  cmp word [bx], 3
  jz L348
  push word [si+4]
  push word bp
  push word [si]
  push word [CurrentCont]
  push word L360
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
  jz L361
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

L363: ; Continuation
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
  mov ax, g173
  mov [di+4], ax
  mov ax, [si]
  mov [di+6], ax
  mov bp, [bp+8]
  mov ax, 4
  jmp [bp]

L364: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(22)
  push word [si]
  push word [bp+10]
  push word [bp+4]
  push word L362
  mov [Temps+2], sp
  push word 8 ;; scanned
  push word [Temps+2]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L363
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

L365: ; Arm: 698'40
  mov ax, g159
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L366: ; Continuation
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

L367: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L366
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g164
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g161
  mov ax, 2
  jmp [bp]

L368: ; Arm: 254'21
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

L369: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  mov ax, [bp+6]
  cmp word ax, [bp+8]
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [si]
  push word [CurrentCont]
  push word L367
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L368
  mov ax, g160
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L370: ; Arm: 253'21
  mov ax, [bp+12]
  mov [di], ax
  mov ax, 1
  mov [di+2], ax
  mov ax, [Temps+6]
  mov [di+4], ax
  mov bp, g68
  mov ax, 3
  jmp [bp]

L371: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(40)
  push word [si]
  push word [bp+16]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word L346
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
  push word L364
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov bx, [Temps+10]
  cmp word [bx], 3
  jz L365
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
  push word L369
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+14]
  cmp word [bx], 3
  jz L370
  mov ax, [bp+12]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L372: ; Arm: 100'23
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L373: ; Continuation
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
  push word L371
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L372
  mov ax, [si]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L374: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(22)
  mov bx, [si]
  cmp word [bx], 1
  jz L331
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
  push word L373
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

L375: ; Continuation
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
  push word L374
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, [bp+8]
  mov [di+2], ax
  mov bp, g97
  mov ax, 2
  jmp [bp]

L376: ; Continuation
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
  push word L323
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L327
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [si]
  push word [bp+12]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L375
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

L377: ; Arm: 888'21
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

L378: ; Continuation
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
  push word L376
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bx, [si]
  cmp word [bx], 3
  jz L377
  mov ax, [bp+14]
  mov [di], ax
  mov ax, g145
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L379: ; Arm: 887'22
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

L380: ; Continuation
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
  push word L378
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L379
  mov ax, g144
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L381: ; Function: (write_to_file,t3)
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(16)
  push word [si+2]
  push word bp
  push word [si]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L380
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov ax, g143
  mov [di], ax
  mov bp, g79
  mov ax, 1
  jmp [bp]

L382: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L383: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L382
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L384: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L383
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g227
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L385: ; Arm: 820'11
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L384
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g226
  mov [di], ax
  mov ax, g225
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L386: ; Function: (lamN,t1)
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
  mov ax, g230
  mov [di+4], ax
  mov bp, [bp+2]
  mov ax, 3
  jmp [bp]

L387: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [bp+4]
  push word L386
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g7
  mov ax, 2
  jmp [bp]

L388: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L387
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, 1
  mov [di], ax
  mov ax, 159
  mov [di+2], ax
  mov bp, g9
  mov ax, 2
  jmp [bp]

L389: ; Continuation
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
  push word L388
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov bp, g83
  mov ax, 2
  jmp [bp]

L390: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L389
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g229
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L391: ; Function: (lamN,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(32)
  mov bx, [bp+4]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L385
  push word g228
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
  push word L390
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+8]
  mov [di], ax
  mov bp, g24
  mov ax, 1
  jmp [bp]

L392: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L393: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L392
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L394: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L393
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g234
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L395: ; Arm: 831'11
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [CurrentCont]
  push word L394
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g233
  mov [di], ax
  mov ax, g232
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
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
  mov ax, g248
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L399: ; Arm: 834'12
  push word [CurrentCont]
  push word L398
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g247
  mov [di], ax
  mov ax, g246
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L400: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  mov bx, [si]
  cmp word [bx], 1
  jz L399
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

L401: ; Arm: 537'9
  mov ax, g239
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L402: ; Continuation
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

L403: ; Arm: 543'10
  push word [si]
  push word [bp+2]
  push word [CurrentCont]
  push word L402
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g240
  mov [di], ax
  mov ax, [si+2]
  mov [di+2], ax
  mov bp, g20
  mov ax, 2
  jmp [bp]

L404: ; Arm: 547'19
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

L405: ; Continuation
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

L406: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  mov bx, [si]
  cmp word [bx], 1
  jz L404
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
  push word L405
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g243
  mov [di], ax
  mov ax, [bp+4]
  mov [di+2], ax
  mov ax, [Temps+6]
  mov [di+4], ax
  mov bp, g6
  mov ax, 3
  jmp [bp]

L407: ; Function: (loop,t5)
  xchg si, di
  Bare_arg_check(3)
  Bare_heap_check(20)
  mov ax, [si+4]
  cmp word ax, [bp+4]
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L403
  push word [si+4]
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [si+4]
  push word [si+2]
  push word bp
  push word [si]
  push word [CurrentCont]
  push word L406
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [bp+2]
  mov [di], ax
  mov ax, [Temps+4]
  mov [di+2], ax
  mov bp, g97
  mov ax, 2
  jmp [bp]

L408: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov ax, g245
  mov [di+2], ax
  mov ax, 1
  mov [di+4], ax
  mov bp, [bp+4]
  mov ax, 3
  jmp [bp]

L409: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L408
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g244
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g2
  mov ax, 2
  jmp [bp]

L410: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(24)
  push word [bp+4]
  push word [CurrentCont]
  push word L400
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [si]
  cmp word [bx], 1
  jz L401
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
  push word L407
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
  push word L409
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+12]
  mov [di], ax
  mov ax, [Temps+14]
  mov [di+2], ax
  mov bp, g9
  mov ax, 2
  jmp [bp]

L411: ; Arm: 489'49
  mov ax, g238
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L412: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(24)
  push word [bp+4]
  push word [CurrentCont]
  push word L410
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [si]
  cmp word [bx], 3
  jz L411
  mov ax, [bp+6]
  mov bx, 9
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+2], ax
  mov ax, [bp+6]
  mov bx, 11
  sar bx, 1
  call Bare_get_bytes
  mov [Temps+4], ax
  mov ax, [bp+6]
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

L413: ; Arm: 10'9
  mov ax, g236
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L414: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L412
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [si]
  cmp word [bx], 3
  jz L413
  mov ax, g237
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L415: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L414
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, g235
  mov [di+2], ax
  mov bp, g56
  mov ax, 2
  jmp [bp]

L416: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L415
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, 1
  mov [di+2], ax
  mov ax, 9
  mov [di+4], ax
  mov bp, g68
  mov ax, 3
  jmp [bp]

L417: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L416
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

L418: ; Function: (lamN,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  mov bx, [bp+2]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L395
  push word 1
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [bp+2]
  push word [CurrentCont]
  push word L417
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g84
  mov ax, 1
  jmp [bp]

L419: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L420: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L419
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L421: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L420
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g252
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L422: ; Arm: 841'9
  push word [CurrentCont]
  push word L421
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g251
  mov [di], ax
  mov ax, g250
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L423: ; Function: (lamN,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  mov bx, [bp+2]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L422
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov bx, [bp+2]
  mov ax, g253
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

L424: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L425: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L424
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L426: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L425
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g257
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L427: ; Arm: 847'9
  push word [CurrentCont]
  push word L426
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g256
  mov [di], ax
  mov ax, g255
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L428: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L429: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L428
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
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
  mov ax, g267
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L431: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L430
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, g266
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L432: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L431
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g31
  mov ax, 1
  jmp [bp]

L433: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L432
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g1
  mov ax, 1
  jmp [bp]

L434: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L433
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
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
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L436: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L435
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g265
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
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
  mov ax, [si]
  mov [di], ax
  mov ax, g264
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L438: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L437
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g31
  mov ax, 1
  jmp [bp]

L439: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L438
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, g1
  mov ax, 1
  jmp [bp]

L440: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L439
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L441: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L440
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L442: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L441
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g263
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L443: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L442
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, g259
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L444: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, g262
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
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
  mov ax, [bp+4]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L446: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L445
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g31
  mov ax, 1
  jmp [bp]

L447: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L446
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g261
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L448: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L447
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, [bp+4]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L449: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+4]
  push word [si]
  push word [CurrentCont]
  push word L448
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, g31
  mov ax, 1
  jmp [bp]

L450: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L449
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g260
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L451: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(20)
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L443
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
  push word L450
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov bp, g31
  mov ax, 1
  jmp [bp]

L452: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L451
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L453: ; Function: (lamN,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  mov bx, [bp+2]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L427
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
  push word L452
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g258
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L454: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L455: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L454
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L456: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L455
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g271
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L457: ; Arm: 869'9
  push word [CurrentCont]
  push word L456
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g270
  mov [di], ax
  mov ax, g269
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L458: ; Arm: 878'17
  mov ax, g272
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L459: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L460: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L459
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L461: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L460
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g275
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L462: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L461
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, [bp+4]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L463: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L462
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g31
  mov ax, 1
  jmp [bp]

L464: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L463
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g274
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L465: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L464
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, g273
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L466: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L465
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g31
  mov ax, 1
  jmp [bp]

L467: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  mov bx, [si]
  cmp word [bx], 1
  jz L458
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [bp+4]
  push word [CurrentCont]
  push word L466
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

L468: ; Function: (lamN,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [si]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [si]
  push word [CurrentCont]
  push word L467
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+2]
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov bp, g97
  mov ax, 2
  jmp [bp]

L469: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [bp+4]
  push word L468
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g7
  mov ax, 2
  jmp [bp]

L470: ; Continuation
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
  push word L469
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, 1
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov bp, g9
  mov ax, 2
  jmp [bp]

L471: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L470
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

L472: ; Function: (lamN,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  mov bx, [bp+2]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L457
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
  push word L471
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

L473: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L474: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L473
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
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
  mov ax, g279
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L476: ; Arm: 859'9
  push word [CurrentCont]
  push word L475
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g278
  mov [di], ax
  mov ax, g277
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L477: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L478: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L477
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
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
  mov ax, [bp+4]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L480: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L479
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g289
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L481: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L480
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g31
  mov ax, 1
  jmp [bp]

L482: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L481
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g288
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
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
  mov ax, [si]
  mov [di], ax
  mov ax, g280
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L484: ; Arm: 426'9
  mov ax, g281
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L485: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, g287
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L486: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L485
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, [bp+4]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L487: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L486
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g31
  mov ax, 1
  jmp [bp]

L488: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L487
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g286
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
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
  mov ax, [si]
  mov [di], ax
  mov ax, g282
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
  mov ax, g285
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g61
  mov ax, 2
  jmp [bp]

L491: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(16)
  push word [bp+4]
  push word [CurrentCont]
  push word L483
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [si]
  cmp word [bx], 1
  jz L484
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  mov ax, [bx+2]
  mov [Temps+4], ax
  mov ax, [bx+4]
  mov [Temps+6], ax
  push word [Temps+4]
  push word [CurrentCont]
  push word L490
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g284
  mov [di], ax
  mov ax, [Temps+6]
  mov [di+2], ax
  mov bp, g2
  mov ax, 2
  jmp [bp]

L492: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+4]
  push word [CurrentCont]
  push word L491
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov bp, g97
  mov ax, 2
  jmp [bp]

L493: ; Function: (lamN,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  mov bx, [bp+2]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L476
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [si]
  push word [CurrentCont]
  push word L492
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

L494: ; Arm: 939'18
  mov ax, g301
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L495: ; Continuation
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

L496: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L497: ; Arm: 942'6
  push word [CurrentCont]
  push word L496
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L498: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L499: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L498
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L500: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(18)
  mov ax, [si]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L494
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
  push word L495
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L497
  push word [CurrentCont]
  push word L499
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

L501: ; Continuation
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

L502: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L501
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
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
  mov bp, g22
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
  mov ax, g293
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L505: ; Arm: 634'9
  push word [CurrentCont]
  push word L504
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g292
  mov [di], ax
  mov ax, g291
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L506: ; Continuation
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

L507: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L506
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
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
  mov bp, g22
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
  mov ax, g296
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L510: ; Arm: 638'12
  push word [CurrentCont]
  push word L509
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g295
  mov [di], ax
  mov ax, g294
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L511: ; Arm: 642'33
  mov ax, 1
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L512: ; Arm: 644'17
  mov ax, 1
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L513: ; Arm: 647'15
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

L514: ; Continuation
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

L515: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+6]
  push word [CurrentCont]
  push word L514
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

L516: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L515
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

L517: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L516
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

L518: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L517
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+8]
  mov [di], ax
  mov bp, g84
  mov ax, 1
  jmp [bp]

L519: ; Arm: 99'23
  mov ax, 257
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L520: ; Continuation
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
  push word L518
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L519
  mov ax, [si]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L521: ; Arm: 99'23
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L522: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  mov bx, [si]
  cmp word [bx], 3
  jz L513
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
  push word L520
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+4]
  cmp word [bx], 3
  jz L521
  mov ax, [bp+8]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L523: ; Arm: 10'9
  mov ax, g299
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L524: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(18)
  mov bx, [si]
  cmp word [bx], 3
  jz L511
  mov bx, [bp+6]
  cmp word [bx], 1
  jz L512
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
  push word L522
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L523
  mov ax, g300
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L525: ; Arm: 10'9
  mov ax, g297
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L526: ; Function: (loop,t2)
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
  push word L524
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L525
  mov ax, g298
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L527: ; Continuation
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

L528: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [si]
  push word [bp+8]
  push word [bp+4]
  push word [CurrentCont]
  push word L527
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

L529: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(18)
  mov bx, [si]
  cmp word [bx], 1
  jz L510
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [bp+4]
  push word L526
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+6]
  push word [CurrentCont]
  push word L528
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

L530: ; Continuation
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
  push word L529
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov bp, g97
  mov ax, 2
  jmp [bp]

L531: ; Function: (loop,t1)
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
  push word L500
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L505
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L530
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

L532: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [si]
  push word [bp+6]
  push word [bp+4]
  push word L531
  mov [Temps+2], sp
  push word 8 ;; scanned
  mov ax, 1
  mov [di], ax
  mov bp, [Temps+2]
  mov ax, 1
  jmp [bp]

L533: ; Function: (lamN,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [si]
  push word [bp+2]
  push word [CurrentCont]
  push word L532
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, 257
  mov [di], ax
  mov ax, 1
  jmp AllocBare_make_bytes

L534: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L535: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L534
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
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
  mov ax, g305
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L537: ; Arm: 918'9
  push word [CurrentCont]
  push word L536
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g304
  mov [di], ax
  mov ax, g303
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L538: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L539: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L538
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
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
  mov ax, g308
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L541: ; Arm: 922'12
  push word [CurrentCont]
  push word L540
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g307
  mov [di], ax
  mov ax, g306
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L542: ; Continuation
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
  mov ax, g310
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L543: ; Continuation
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
  push word L542
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [bp+10]
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov ax, g309
  mov [di+4], ax
  mov bp, [bp+4]
  mov ax, 3
  jmp [bp]

L544: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L543
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, [bp+12]
  mov [di+2], ax
  mov bp, g98
  mov ax, 2
  jmp [bp]

L545: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(40)
  mov bx, [si]
  cmp word [bx], 1
  jz L541
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
  push word L544
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

L546: ; Continuation
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
  push word L545
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov bp, g97
  mov ax, 2
  jmp [bp]

L547: ; Function: (lamN,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  mov bx, [bp+4]
  mov ax, [bx]
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L537
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [si]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L546
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

L548: ; Arm: 895'9
  mov ax, g322
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L549: ; Continuation
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

L550: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L549
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
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
  mov bp, g22
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
  mov ax, g324
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
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
  mov ax, [si]
  mov [di], ax
  mov ax, g323
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
  mov bp, g31
  mov ax, 1
  jmp [bp]

L555: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  mov bx, [si]
  cmp word [bx], 1
  jz L548
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [Temps+2]
  push word [bp+4]
  push word [CurrentCont]
  push word L554
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

L556: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, g315
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L557: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L556
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
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
  mov bp, g22
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
  mov ax, g314
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L560: ; Arm: 607'9
  push word [CurrentCont]
  push word L559
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g313
  mov [di], ax
  mov ax, g312
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L561: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, g320
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L562: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L561
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
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
  mov bp, g22
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
  mov ax, g319
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L565: ; Arm: 610'12
  push word [CurrentCont]
  push word L564
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g318
  mov [di], ax
  mov ax, g317
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L566: ; Continuation
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

L567: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(26)
  push word g321
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
  push word L566
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

L568: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  mov bx, [si]
  cmp word [bx], 1
  jz L565
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
  push word L567
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

L569: ; Arm: 561'10
  mov ax, g316
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L570: ; Function: (lamN,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(42)
  mov bx, [bp+4]
  mov ax, [bx]
  mov [Temps+2], ax
  push word [bp+6]
  push word [CurrentCont]
  push word L555
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L560
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L568
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
  jz L569
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

L571: ; Arm: 905'9
  mov ax, g336
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L572: ; Continuation
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

L573: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  mov bx, [si]
  cmp word [bx], 1
  jz L571
  mov ax, [bx+2]
  mov [Temps+2], ax
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L572
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

L574: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, g331
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L575: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L574
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
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
  mov bp, g22
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
  mov ax, g330
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L578: ; Arm: 623'9
  push word [CurrentCont]
  push word L577
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g329
  mov [di], ax
  mov ax, g328
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L579: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, g335
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L580: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L579
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
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
  mov bp, g22
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
  mov ax, g334
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L583: ; Arm: 627'12
  push word [CurrentCont]
  push word L582
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g333
  mov [di], ax
  mov ax, g332
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L584: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  mov bx, [si]
  cmp word [bx], 1
  jz L583
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

L585: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [bp+4]
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [CurrentCont]
  push word L584
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov bp, g97
  mov ax, 2
  jmp [bp]

L586: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(18)
  mov bx, [bp+4]
  mov ax, [bx]
  mov [Temps+2], ax
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L573
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L578
  mov ax, [bx+2]
  mov [Temps+4], ax
  push word [bp+8]
  push word [CurrentCont]
  push word L585
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

L587: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L586
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
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
  mov bp, g22
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
  mov ax, g327
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
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
  mov ax, [si]
  mov [di], ax
  mov ax, g326
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L591: ; Function: (lamN,t1)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [si]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L590
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g31
  mov ax, 1
  jmp [bp]

L592: ; Continuation
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

L593: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L592
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
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
  mov bp, g22
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
  mov ax, g340
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
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
  mov ax, [si]
  mov [di], ax
  mov ax, [bp+10]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L597: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [si]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L596
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [bp+6]
  mov [di], ax
  mov bp, g31
  mov ax, 1
  jmp [bp]

L598: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L597
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g339
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
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
  mov ax, [si]
  mov [di], ax
  mov ax, g338
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L600: ; Function: (lamN,t1)
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(12)
  push word [si+2]
  push word [si]
  push word [bp+2]
  push word [CurrentCont]
  push word L599
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [si+2]
  mov [di], ax
  mov bp, g31
  mov ax, 1
  jmp [bp]

L601: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L602: ; Arm: 1006'36
  push word [CurrentCont]
  push word L601
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, g353
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L603: ; Continuation
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

L604: ; Arm: 990'7
  mov ax, g356
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L605: ; Arm: 743'9
  mov ax, g357
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L606: ; Arm: 747'35
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

L607: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  mov bx, [si]
  cmp word [bx], 3
  jz L606
  mov ax, [bp+6]
  mov [di], ax
  mov bp, [bp+4]
  mov ax, 1
  jmp [bp]

L608: ; Function: (loop,t3)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  mov bx, [si]
  cmp word [bx], 1
  jz L605
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
  push word L607
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [Temps+6]
  mov [di], ax
  mov ax, [bp+2]
  mov [di+2], ax
  mov bp, g56
  mov ax, 2
  jmp [bp]

L609: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L610: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L609
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
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
  mov ax, g360
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L612: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  push word [CurrentCont]
  push word L611
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, g359
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L613: ; Arm: 993'12
  push word [CurrentCont]
  push word L612
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov ax, g358
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L614: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(6)
  mov bx, [si]
  cmp word [bx], 1
  jz L613
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

L615: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L614
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, [bp+8]
  mov ax, 1
  jmp [bp]

L616: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(28)
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L603
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov bx, [si]
  cmp word [bx], 1
  jz L604
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+2]
  push word L608
  mov [Temps+6], sp
  push word 4 ;; scanned
  push word [Temps+6]
  push word [Temps+4]
  push word [Temps+2]
  push word [CurrentCont]
  push word L615
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

L617: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L616
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, g355
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g20
  mov ax, 2
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
  mov ax, g354
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g62
  mov ax, 2
  jmp [bp]

L619: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(12)
  mov bx, [si]
  cmp word [bx], 3
  jz L602
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L618
  mov [CurrentCont], sp
  push word 10 ;; scanned
  mov ax, [bp+10]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L620: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [si]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [CurrentCont]
  push word L619
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, [bp+4]
  mov [di+2], ax
  mov bp, g56
  mov ax, 2
  jmp [bp]

L621: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L620
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, g352
  mov [di], ax
  mov bp, g79
  mov ax, 1
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
  mov ax, [si]
  mov [di], ax
  mov bp, g41
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
  mov bp, g22
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
  mov ax, g351
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L625: ; Function: (repl,t17)
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  push word bp
  push word [si]
  push word [bp+4]
  push word [bp+2]
  push word [CurrentCont]
  push word L624
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g31
  mov ax, 1
  jmp [bp]

L626: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, 3
  mov [di], ax
  mov bp, [bp+4]
  mov ax, 1
  jmp [bp]

L627: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L626
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L628: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L627
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L629: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L628
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g371
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L630: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L629
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov ax, g369
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L631: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  push word [bp+4]
  push word [CurrentCont]
  push word L630
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g370
  mov [di], ax
  mov ax, [bp+6]
  mov [di+2], ax
  mov bp, g61
  mov ax, 2
  jmp [bp]

L632: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L631
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L633: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L632
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L634: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L633
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g368
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L635: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L634
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, 1537
  mov [di], ax
  mov bp, g31
  mov ax, 1
  jmp [bp]

L636: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L635
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L637: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L636
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L638: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L637
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g367
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L639: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L638
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, 81
  mov [di], ax
  mov bp, g31
  mov ax, 1
  jmp [bp]

L640: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L639
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L641: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L640
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L642: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L641
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g366
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L643: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L642
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, 257
  mov [di], ax
  mov bp, g31
  mov ax, 1
  jmp [bp]

L644: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L643
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L645: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L644
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L646: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L645
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g365
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L647: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L646
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, 10241
  mov [di], ax
  mov bp, g31
  mov ax, 1
  jmp [bp]

L648: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L647
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L649: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L648
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L650: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L649
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g364
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L651: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L650
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, 21
  mov [di], ax
  mov bp, g31
  mov ax, 1
  jmp [bp]

L652: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L651
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L653: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L652
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L654: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L653
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g363
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g26
  mov ax, 2
  jmp [bp]

L655: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L654
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, 1025
  mov [di], ax
  mov bp, g31
  mov ax, 1
  jmp [bp]

L656: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L655
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, [si]
  mov [di], ax
  mov bp, g41
  mov ax, 1
  jmp [bp]

L657: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(10)
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L656
  mov [CurrentCont], sp
  push word 8 ;; scanned
  mov ax, g362
  mov [di], ax
  mov bp, g22
  mov ax, 1
  jmp [bp]

L658: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [bp+4]
  push word [CurrentCont]
  push word L657
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, g361
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g101
  mov ax, 2
  jmp [bp]

L659: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(142)
  push word g350
  push word [si]
  push word 3
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [Temps+2]
  push word [bp+32]
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  push word [Temps+4]
  push word [bp+30]
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word [bp+28]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word [Temps+8]
  push word [bp+26]
  push word 3
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word [Temps+10]
  push word [bp+24]
  push word 3
  mov [Temps+12], sp
  push word 6 ;; scanned
  push word [Temps+12]
  push word [bp+22]
  push word 3
  mov [Temps+14], sp
  push word 6 ;; scanned
  push word [Temps+14]
  push word [bp+20]
  push word 3
  mov [Temps+16], sp
  push word 6 ;; scanned
  push word [Temps+16]
  push word [bp+18]
  push word 3
  mov [Temps+18], sp
  push word 6 ;; scanned
  push word [Temps+18]
  push word [bp+16]
  push word 3
  mov [Temps+20], sp
  push word 6 ;; scanned
  push word [Temps+20]
  push word [bp+14]
  push word 3
  mov [Temps+22], sp
  push word 6 ;; scanned
  push word [Temps+22]
  push word [bp+12]
  push word 3
  mov [Temps+24], sp
  push word 6 ;; scanned
  push word [Temps+24]
  push word [bp+10]
  push word 3
  mov [Temps+26], sp
  push word 6 ;; scanned
  push word [Temps+26]
  push word [bp+8]
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
  push word L625
  mov [Temps+34], sp
  push word 6 ;; scanned
  push word [Temps+34]
  push word [CurrentCont]
  push word L658
  mov [CurrentCont], sp
  push word 6 ;; scanned
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

L660: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(36)
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
  push word L659
  mov [CurrentCont], sp
  push word 34 ;; scanned
  mov ax, g349
  mov [di], ax
  mov ax, g348
  mov [di+2], ax
  mov bp, g108
  mov ax, 2
  jmp [bp]

L661: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(40)
  push word [bp+16]
  push word L600
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
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L660
  mov [CurrentCont], sp
  push word 32 ;; scanned
  mov ax, g341
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov bp, g142
  mov ax, 2
  jmp [bp]

L662: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(42)
  push word [bp+18]
  push word [bp+8]
  push word L591
  mov [Temps+2], sp
  push word 6 ;; scanned
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
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L661
  mov [CurrentCont], sp
  push word 32 ;; scanned
  mov ax, g337
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov bp, g121
  mov ax, 2
  jmp [bp]

L663: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(44)
  push word [bp+20]
  push word [bp+10]
  push word [bp+8]
  push word L570
  mov [Temps+2], sp
  push word 8 ;; scanned
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
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L662
  mov [CurrentCont], sp
  push word 32 ;; scanned
  mov ax, g325
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov bp, g108
  mov ax, 2
  jmp [bp]

L664: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(42)
  push word [bp+10]
  push word [bp+8]
  push word L547
  mov [Temps+2], sp
  push word 6 ;; scanned
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
  push word L663
  mov [CurrentCont], sp
  push word 32 ;; scanned
  mov ax, g311
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov bp, g121
  mov ax, 2
  jmp [bp]

L665: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(38)
  push word [bp+10]
  push word L533
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [si]
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
  push word L664
  mov [CurrentCont], sp
  push word 30 ;; scanned
  mov ax, g302
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov bp, g121
  mov ax, 2
  jmp [bp]

L666: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(36)
  push word [bp+10]
  push word L493
  mov [Temps+2], sp
  push word 4 ;; scanned
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
  push word L665
  mov [CurrentCont], sp
  push word 28 ;; scanned
  mov ax, g290
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov bp, g121
  mov ax, 2
  jmp [bp]

L667: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(34)
  push word [bp+10]
  push word L472
  mov [Temps+2], sp
  push word 4 ;; scanned
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
  push word L666
  mov [CurrentCont], sp
  push word 26 ;; scanned
  mov ax, g276
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov bp, g108
  mov ax, 2
  jmp [bp]

L668: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(32)
  push word [bp+10]
  push word L453
  mov [Temps+2], sp
  push word 4 ;; scanned
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
  push word L667
  mov [CurrentCont], sp
  push word 24 ;; scanned
  mov ax, g268
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov bp, g108
  mov ax, 2
  jmp [bp]

L669: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(30)
  push word [bp+10]
  push word L423
  mov [Temps+2], sp
  push word 4 ;; scanned
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
  push word L668
  mov [CurrentCont], sp
  push word 22 ;; scanned
  mov ax, g254
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov bp, g108
  mov ax, 2
  jmp [bp]

L670: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(28)
  push word [bp+10]
  push word L418
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word [bp+16]
  push word [si]
  push word [bp+14]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L669
  mov [CurrentCont], sp
  push word 20 ;; scanned
  mov ax, g249
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov bp, g108
  mov ax, 2
  jmp [bp]

L671: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(28)
  push word [bp+10]
  push word [bp+8]
  push word L391
  mov [Temps+2], sp
  push word 6 ;; scanned
  push word [bp+14]
  push word [si]
  push word [bp+12]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L670
  mov [CurrentCont], sp
  push word 18 ;; scanned
  mov ax, g231
  mov [di], ax
  mov ax, [Temps+2]
  mov [di+2], ax
  mov bp, g108
  mov ax, 2
  jmp [bp]

L672: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(18)
  push word [bp+12]
  push word [si]
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word [CurrentCont]
  push word L671
  mov [CurrentCont], sp
  push word 16 ;; scanned
  mov ax, g224
  mov [di], ax
  mov ax, g223
  mov [di+2], ax
  mov bp, g121
  mov ax, 2
  jmp [bp]

L673: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(16)
  push word [bp+10]
  push word [bp+8]
  push word [bp+6]
  push word [si]
  push word [bp+4]
  push word [CurrentCont]
  push word L672
  mov [CurrentCont], sp
  push word 14 ;; scanned
  mov ax, g217
  mov [di], ax
  mov ax, g216
  mov [di+2], ax
  mov bp, g108
  mov ax, 2
  jmp [bp]

L674: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(32)
  push word [si]
  push word L321
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word g100
  mov [Temps+4], sp
  push word 2 ;; scanned
  push word [Temps+4]
  push word [Temps+2]
  push word L381
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [Temps+6]
  push word [Temps+4]
  push word [Temps+2]
  push word [bp+4]
  push word [CurrentCont]
  push word L673
  mov [CurrentCont], sp
  push word 12 ;; scanned
  mov ax, g206
  mov [di], ax
  mov ax, g205
  mov [di+2], ax
  mov bp, g108
  mov ax, 2
  jmp [bp]

L675: ; Continuation
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
  push word L674
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+4]
  mov [di], ax
  mov bp, g24
  mov ax, 1
  jmp [bp]

L676: ; Start
  xchg si, di
  Bare_arg_check(0)
  Bare_heap_check(24)
  push word g43
  mov [Temps+2], sp
  push word 2 ;; scanned
  push word [Temps+2]
  push word L311
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word g73
  push word `\x04`
  push word 3
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L675
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
  dw L176
g99:
  dw L178
g100:
  dw 1
g101:
  dw L180
g102:
  dw 1
g103:
  dw 21
  db ` [no args]`
g104:
  dw 15
  db `usage: `
g105:
  dw 3
  db `\n`
g106:
  dw 15
  db `Error: `
g107:
  dw 1
g108:
  dw L188
g109:
  dw 13
  db ` [int]`
g110:
  dw 15
  db `usage: `
g111:
  dw 3
  db `\n`
g112:
  dw 15
  db `Error: `
g113:
  dw 13
  db ` [int]`
g114:
  dw 15
  db `usage: `
g115:
  dw 3
  db `\n`
g116:
  dw 15
  db `Error: `
g117:
  dw 13
  db ` [int]`
g118:
  dw 15
  db `usage: `
g119:
  dw 3
  db `\n`
g120:
  dw 15
  db `Error: `
g121:
  dw L209
g122:
  dw 25
  db ` [int] [int]`
g123:
  dw 15
  db `usage: `
g124:
  dw 3
  db `\n`
g125:
  dw 15
  db `Error: `
g126:
  dw 25
  db ` [int] [int]`
g127:
  dw 15
  db `usage: `
g128:
  dw 3
  db `\n`
g129:
  dw 15
  db `Error: `
g130:
  dw 25
  db ` [int] [int]`
g131:
  dw 15
  db `usage: `
g132:
  dw 3
  db `\n`
g133:
  dw 15
  db `Error: `
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
  dw L243
g143:
  dw 1
g144:
  dw 1
g145:
  dw 3
  db `\n`
g146:
  dw 3
  db `\n`
g147:
  dw 65
  db `no filesystem mounted; try mount`
g148:
  dw 15
  db `Error: `
g149:
  dw 3
  db `\n`
g150:
  dw 75
  db `inode is not allocated (no such file)`
g151:
  dw 15
  db `Error: `
g152:
  dw 1
g153:
  dw 1
g154:
  dw 1
g155:
  dw 3
  db `\n`
g156:
  dw 69
  db `no blocks available (disk is full)`
g157:
  dw 15
  db `Error: `
g158:
  dw 1
g159:
  dw 1
g160:
  dw 1
  db ``
g161:
  dw L249
g162:
  dw 1
g163:
  dw 1
  db ``
g164:
  dw 1
g165:
  dw 1
g166:
  dw 3
  db `\n`
g167:
  dw 69
  db `no blocks available (disk is full)`
g168:
  dw 15
  db `Error: `
g169:
  dw 1
g170:
  dw 3
g171:
  dw 1
g172:
  dw 1
g173:
  dw 1
g174:
  dw 1
g175:
  dw 83
  db `dump      : Display the raw data on disk.`
g176:
  dw 101
  db `sector I  : Display the raw data in disk sector I.`
g177:
  dw 157
  db `format    : Prepare disk with an empty filesystem; trashing existing contents.`
g178:
  dw 145
  db `mount     : Discover an existing filesystem; allow files to be accessed.`
g179:
  dw 137
  db `unmount   : Unmount the existing filesystem; required before format.`
g180:
  dw 137
  db `debug     : Display internal information about a mounted filesystem.`
g181:
  dw 107
  db `ls        : List all files together with their sizes.`
g182:
  dw 123
  db `stat I    : Display internal information about inode(file) I.`
g183:
  dw 87
  db `cat I     : Display the contents of file I.`
g184:
  dw 115
  db `rm I      : Remove file F; returning resources for reuse.`
g185:
  dw 103
  db `create    : Create new file; lines read from input.`
g186:
  dw 123
  db `append I  : Append to existing file I; lines read from input.`
g187:
  dw 151
  db `splat I N : Overwrite existing file I from offset N; lines read from input.`
g188:
  dw 87
  db `wipe      : Wipe disk; fill it with commas.`
g189:
  dw 1
g190:
  dw 3, g188, g189
g191:
  dw 3, g187, g190
g192:
  dw 3, g186, g191
g193:
  dw 3, g185, g192
g194:
  dw 3, g184, g193
g195:
  dw 3, g183, g194
g196:
  dw 3, g182, g195
g197:
  dw 3, g181, g196
g198:
  dw 3, g180, g197
g199:
  dw 3, g179, g198
g200:
  dw 3, g178, g199
g201:
  dw 3, g177, g200
g202:
  dw 3, g176, g201
g203:
  dw 3, g175, g202
g204:
  dw L252
g205:
  dw L253
g206:
  dw 9
  db `help`
g207:
  dw L271
g208:
  dw 1
g209:
  dw 3
g210:
  dw 1
g211:
  dw 1
g212:
  dw 3
g213:
  dw 1
g214:
  dw 5
  db `\\n`
g215:
  dw 1
g216:
  dw L272
g217:
  dw 9
  db `dump`
g218:
  dw 1
g219:
  dw 3
g220:
  dw 1
g221:
  dw 5
  db `\\n`
g222:
  dw 1
g223:
  dw L286
g224:
  dw 13
  db `sector`
g225:
  dw 3
  db `\n`
g226:
  dw 95
  db `cannot format a mounted filesystem; try unmount`
g227:
  dw 15
  db `Error: `
g228:
  dw 1
g229:
  dw 9
  db `BARE`
g230:
  dw 1
g231:
  dw 13
  db `format`
g232:
  dw 3
  db `\n`
g233:
  dw 53
  db `filesystem already mounted`
g234:
  dw 15
  db `Error: `
g235:
  dw 9
  db `BARE`
g236:
  dw 1
g237:
  dw 3
g238:
  dw 1
g239:
  dw 1
g240:
  dw 1
g241:
  dw 1
g242:
  dw 3
g243:
  dw L291
g244:
  dw L292
g245:
  dw 1
g246:
  dw 3
  db `\n`
g247:
  dw 63
  db `no filesystem found; try format`
g248:
  dw 15
  db `Error: `
g249:
  dw 11
  db `mount`
g250:
  dw 3
  db `\n`
g251:
  dw 65
  db `no filesystem mounted; try mount`
g252:
  dw 15
  db `Error: `
g253:
  dw 1
g254:
  dw 15
  db `unmount`
g255:
  dw 3
  db `\n`
g256:
  dw 65
  db `no filesystem mounted; try mount`
g257:
  dw 15
  db `Error: `
g258:
  dw 37
  db `Filesystem found:\n`
g259:
  dw 3
  db `\n`
g260:
  dw 21
  db `, #inodes=`
g261:
  dw 37
  db `, #admin-blocks=1+`
g262:
  dw 17
  db `#blocks=`
g263:
  dw 29
  db `- superblock: `
g264:
  dw 3
  db `\n`
g265:
  dw 35
  db `- #free-blocks = `
g266:
  dw 3
  db `\n`
g267:
  dw 35
  db `- #free-inodes = `
g268:
  dw 11
  db `debug`
g269:
  dw 3
  db `\n`
g270:
  dw 65
  db `no filesystem mounted; try mount`
g271:
  dw 15
  db `Error: `
g272:
  dw 1
g273:
  dw 3
  db `\n`
g274:
  dw 7
  db ` : `
g275:
  dw 11
  db `file `
g276:
  dw 5
  db `ls`
g277:
  dw 3
  db `\n`
g278:
  dw 65
  db `no filesystem mounted; try mount`
g279:
  dw 15
  db `Error: `
g280:
  dw 3
  db `\n`
g281:
  dw 23
  db `unallocated`
g282:
  dw 3
  db `]`
g283:
  dw 3
  db `B`
g284:
  dw L295
g285:
  dw 3
  db `,`
g286:
  dw 21
  db `, blocks=[`
g287:
  dw 25
  db `Inode: size=`
g288:
  dw 7
  db ` : `
g289:
  dw 3
  db `I`
g290:
  dw 9
  db `stat`
g291:
  dw 3
  db `\n`
g292:
  dw 65
  db `no filesystem mounted; try mount`
g293:
  dw 15
  db `Error: `
g294:
  dw 3
  db `\n`
g295:
  dw 75
  db `inode is not allocated (no such file)`
g296:
  dw 15
  db `Error: `
g297:
  dw 1
g298:
  dw 3
g299:
  dw 1
g300:
  dw 3
g301:
  dw 1
g302:
  dw 7
  db `cat`
g303:
  dw 3
  db `\n`
g304:
  dw 65
  db `no filesystem mounted; try mount`
g305:
  dw 15
  db `Error: `
g306:
  dw 3
  db `\n`
g307:
  dw 75
  db `inode is not allocated (no such file)`
g308:
  dw 15
  db `Error: `
g309:
  dw 1
g310:
  dw 1
g311:
  dw 5
  db `rm`
g312:
  dw 3
  db `\n`
g313:
  dw 65
  db `no filesystem mounted; try mount`
g314:
  dw 15
  db `Error: `
g315:
  dw 1
g316:
  dw 1
g317:
  dw 3
  db `\n`
g318:
  dw 73
  db `no inodes available (too many files)`
g319:
  dw 15
  db `Error: `
g320:
  dw 1
g321:
  dw 1
g322:
  dw 1
g323:
  dw 45
  db `; (to finish type ^D)\n`
g324:
  dw 29
  db `Creating file `
g325:
  dw 13
  db `create`
g326:
  dw 45
  db `; (to finish type ^D)\n`
g327:
  dw 37
  db `Appending to file `
g328:
  dw 3
  db `\n`
g329:
  dw 65
  db `no filesystem mounted; try mount`
g330:
  dw 15
  db `Error: `
g331:
  dw 1
g332:
  dw 3
  db `\n`
g333:
  dw 75
  db `inode is not allocated (no such file)`
g334:
  dw 15
  db `Error: `
g335:
  dw 1
g336:
  dw 1
g337:
  dw 13
  db `append`
g338:
  dw 45
  db `; (to finish type ^D)\n`
g339:
  dw 27
  db ` from offset `
g340:
  dw 35
  db `Overwriting file `
g341:
  dw 11
  db `splat`
g342:
  dw 1
g343:
  dw 3
g344:
  dw 1
g345:
  dw 1
g346:
  dw 3
g347:
  dw 1
g348:
  dw L306
g349:
  dw 9
  db `wipe`
g350:
  dw 1
g351:
  dw 5
  db `> `
g352:
  dw 1
g353:
  dw 17
  db `exiting\n`
g354:
  dw 1
g355:
  dw 1
g356:
  dw 1
g357:
  dw 1
g358:
  dw 41
  db ` : command not found`
g359:
  dw 3
  db `\n`
g360:
  dw 15
  db `Error: `
g361:
  dw 1
g362:
  dw 39
  db `Filesystem explorer`
g363:
  dw 31
  db `- sector_size: `
g364:
  dw 41
  db `- #sectors_on_disk: `
g365:
  dw 41
  db `- addressable disk: `
g366:
  dw 29
  db `- block_size: `
g367:
  dw 39
  db `- #blocks_on_disk: `
g368:
  dw 57
  db `- max_file_size (6 blocks): `
g369:
  dw 3
  db `\n`
g370:
  dw 3
  db ` `
g371:
  dw 11
  db `Try: `

bare_start: jmp L676
