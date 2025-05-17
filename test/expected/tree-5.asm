L1: ; Arm: 6'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L2: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  sar ax, 1
  mov bx, 21
  sar bx, 1
  push word dx ;; save
  mov dx, 0
  Div bx
  pop word dx ;; restore
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L3: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L1
  mov ax, dx
  sar ax, 1
  mov bx, 21
  sar bx, 1
  push word dx ;; save
  mov dx, 0
  Div bx
  shl dx, 1
  add dx, 1
  mov [Temps+4], dx
  pop word dx ;; restore
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
  push word dx
  push word cx
  push word L2
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g1
  mov dx, [Temps+10]
  jmp [bp]

L4: ; Function: (loop,g1)
  Bare_enter_check(6)
  push word dx
  push word L3
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L5: ; Arm: 13'7
  mov dx, g3
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L6: ; Function: (put_chars,g2)
  Bare_enter_check(0)
  mov bx, dx
  cmp word [bx], 1
  jz L5
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [Temps+2]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov bp, g2
  mov dx, [Temps+4]
  jmp [bp]

L7: ; Arm: 22'10
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L8: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  sar ax, 1
  mov bx, dx
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L9: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word cx
  push word L8
  mov cx, sp
  push word 6 ;; scanned
  mov dx, [bp+4]
  mov bp, g4
  jmp [bp]

L10: ; Arm: 23'15
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word cx
  push word L9
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g4
  mov dx, [Temps+2]
  jmp [bp]

L11: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  sar ax, 1
  mov bx, dx
  sar bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L12: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word cx
  push word L11
  mov cx, sp
  push word 6 ;; scanned
  mov dx, [bp+4]
  mov bp, g4
  jmp [bp]

L13: ; Arm: 24'15
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word cx
  push word L12
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g4
  mov dx, [Temps+2]
  jmp [bp]

L14: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  sar ax, 1
  sar dx, 1
  mul dx
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L15: ; Continuation
  Bare_enter_check(8)
  push word dx
  push word cx
  push word L14
  mov cx, sp
  push word 6 ;; scanned
  mov dx, [bp+4]
  mov bp, g4
  jmp [bp]

L16: ; Function: (eval,g4)
  Bare_enter_check(8)
  mov bx, dx
  cmp word [bx], 1
  jz L7
  cmp word [bx], 3
  jz L10
  cmp word [bx], 5
  jz L13
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word cx
  push word L15
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g4
  mov dx, [Temps+2]
  jmp [bp]

L17: ; Continuation
  Bare_enter_check(0)
  mov bp, g2
  mov dx, dx
  jmp [bp]

L18: ; Arm: 9'20
  push word g5
  push word `0`
  push word 3
  mov [Temps+4], sp
  push word 6 ;; scanned
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L19: ; Continuation
  Bare_enter_check(0)
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L20: ; Continuation
  Bare_enter_check(14)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  push word cx
  push word L17
  mov cx, sp
  push word 4 ;; scanned
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L18
  push word dx
  push word cx
  push word L19
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g1
  mov dx, g6
  jmp [bp]

L21: ; Start
  Bare_enter_check(54)
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
  push word cx
  push word L20
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g4
  mov dx, [Temps+14]
  jmp [bp]

g1:
  dw L4
g2:
  dw L6
g3:
  dw 1
g4:
  dw L16
g5:
  dw 1
g6:
  dw 1

bare_start: jmp L21
