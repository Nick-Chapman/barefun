L1: ; Arm: 6'13
  mov ax, [si]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L2: ; Function: (loop,g1)[arg0,arg1]
  xchg si, di
  Bare_arg_check(2)
  Bare_heap_check(8)
  mov ax, [si+2]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L1
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
  mov bp, g1
  mov ax, 2
  jmp [bp]

L3: ; Arm: 13'7
  mov ax, g3
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L4: ; Function: (put_chars,g2)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov bx, [si]
  cmp word [bx], 1
  jz L3
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
  mov bp, g2
  mov ax, 1
  jmp [bp]

L5: ; Arm: 22'10
  mov ax, [bx+2]
  mov [Temps+2], ax
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

L7: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L6
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g4
  mov ax, 1
  jmp [bp]

L8: ; Arm: 23'15
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [CurrentCont]
  push word L7
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g4
  mov ax, 1
  jmp [bp]

L9: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  mov bx, [si]
  sub ax, bx
  add ax, 1
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L10: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L9
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g4
  mov ax, 1
  jmp [bp]

L11: ; Arm: 24'15
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [CurrentCont]
  push word L10
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g4
  mov ax, 1
  jmp [bp]

L12: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [bp+4]
  sar ax, 1
  mov bx, [si]
  sar bx, 1
  mul bx
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  mov ax, 1
  jmp [bp]

L13: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  push word [si]
  push word [CurrentCont]
  push word L12
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [bp+4]
  mov [di], ax
  mov bp, g4
  mov ax, 1
  jmp [bp]

L14: ; Function: (eval,g4)[arg0]
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(8)
  mov bx, [si]
  cmp word [bx], 1
  jz L5
  cmp word [bx], 3
  jz L8
  cmp word [bx], 5
  jz L11
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word [CurrentCont]
  push word L13
  mov [CurrentCont], sp
  push word 6 ;; scanned
  mov ax, [Temps+2]
  mov [di], ax
  mov bp, g4
  mov ax, 1
  jmp [bp]

L15: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(0)
  mov ax, [si]
  mov [di], ax
  mov bp, g2
  mov ax, 1
  jmp [bp]

L16: ; Arm: 9'20
  push word g5
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

L17: ; Continuation
  xchg si, di
  Bare_arg_check(1)
  Bare_heap_check(14)
  mov ax, [si]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  push word [CurrentCont]
  push word L15
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L16
  mov ax, g6
  mov [di], ax
  mov ax, [si]
  mov [di+2], ax
  mov bp, g1
  mov ax, 2
  jmp [bp]

L18: ; Start
  xchg si, di
  Bare_arg_check(0)
  Bare_heap_check(54)
  push word 2001
  push word 1
  mov [Temps+2], sp
  push word 4 ;; scanned
  push word 21
  push word 1
  mov [Temps+4], sp
  push word 4 ;; scanned
  push word 7
  push word 1
  mov [Temps+6], sp
  push word 4 ;; scanned
  push word [Temps+6]
  push word [Temps+4]
  push word 3
  mov [Temps+8], sp
  push word 6 ;; scanned
  push word 35
  push word 1
  mov [Temps+10], sp
  push word 4 ;; scanned
  push word [Temps+10]
  push word [Temps+8]
  push word 7
  mov [Temps+12], sp
  push word 6 ;; scanned
  push word [Temps+12]
  push word [Temps+2]
  push word 5
  mov [Temps+14], sp
  push word 6 ;; scanned
  push word [CurrentCont]
  push word L17
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov ax, [Temps+14]
  mov [di], ax
  mov bp, g4
  mov ax, 1
  jmp [bp]

g1:
  dw L2
g2:
  dw L4
g3:
  dw 1
g4:
  dw L14
g5:
  dw 1
g6:
  dw 1

bare_start: jmp L18
