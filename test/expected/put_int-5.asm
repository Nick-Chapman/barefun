L1: ; Arm: 13'7
  mov si, g2
  mov bp, cx
  mov cx, [bp+2]
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
  mov bp, g1
  mov si, [Temps+4]
  jmp [bp]

L3: ; Arm: 6'13
  mov si, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L4: ; Continuation
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

L5: ; Function: (lam,t1)
  Bare_enter_check(16)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L3
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
  push word L4
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g3
  mov si, [Temps+10]
  jmp [bp]

L6: ; Function: (loop,g3)
  Bare_enter_check(6)
  push word si
  push word L5
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov si, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L7: ; Continuation
  Bare_enter_check(0)
  mov bp, g1
  mov si, si
  jmp [bp]

L8: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L7
  mov cx, sp
  push word 4 ;; scanned
  mov bp, si
  mov si, 85
  jmp [bp]

L9: ; Start
  Bare_enter_check(6)
  push word cx
  push word L8
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g3
  mov si, g4
  jmp [bp]

g1:
  dw L2
g2:
  dw 1
g3:
  dw L6
g4:
  dw 1

bare_start: jmp L9
