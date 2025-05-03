L1: ; Arm: 13'7
  mov dx, g2
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L2: ; Function: (put_chars,g1)
  Bare_enter_check(0)
  mov bx, dx
  cmp word [bx], 0
  jz L1
  mov si, [bx+2]
  mov di, [bx+4]
  mov ax, si
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov bp, g1
  mov dx, di
  jmp [bp]

L3: ; Arm: 6'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L4: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  mov bx, 10
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L5: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov si, ax
  mov bx, si
  cmp word [bx], 1
  jz L3
  mov ax, dx
  mov bx, 10
  push word dx ;; save
  mov dx, 0
  div bx
  mov di, dx
  pop word dx ;; restore
  mov ax, 48
  add ax, di
  mov [Temps+6], ax
  mov ax, [Temps+6]
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 1
  mov [Temps+10], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L4
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g3
  mov dx, [Temps+10]
  jmp [bp]

L6: ; Function: (loop,g3)
  Bare_enter_check(6)
  push word dx
  push word L5
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L7: ; Continuation
  Bare_enter_check(0)
  mov bp, g1
  mov dx, dx
  jmp [bp]

L8: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L7
  mov cx, sp
  push word 4 ;; scanned
  mov bp, dx
  mov dx, 42
  jmp [bp]

L9: ; Start
  Bare_enter_check(6)
  push word cx
  push word L8
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g3
  mov dx, g4
  jmp [bp]

g1:
  dw L2
g2:
  dw 0
g3:
  dw L6
g4:
  dw 0

bare_start: jmp L9
