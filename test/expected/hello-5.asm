L1: ; Arm: 11'7
  mov dx, g2
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L2: ; Function: (put_chars,g1)
  mov bx, dx
  cmp word [bx], 0
  jz L1
  mov ax, [bx+2]
  mov si, ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, si
  call Bare_put_char
  mov bp, g1
  mov dx, [Temps+4]
  jmp [bp]

L3: ; Arm: 4'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L4: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  sub ax, 1
  mov si, ax
  mov bp, dx
  mov dx, si
  jmp [bp]

L5: ; Function: (lam,t1)
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov si, ax
  mov bx, si
  cmp word [bx], 1
  jz L3
  mov ax, g4
  mov bx, dx
  call Bare_get_bytes
  mov [Temps+4], ax
  push word [bp+2]
  push word [Temps+4]
  push word 1
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L4
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g3
  mov dx, [Temps+6]
  jmp [bp]

L6: ; Function: (explode_loop,g3)
  push word dx
  push word L5
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L7: ; Continuation
  call Bare_enter_check
  mov bp, g1
  mov dx, dx
  jmp [bp]

L8: ; Continuation
  call Bare_enter_check
  push word cx
  push word L7
  mov cx, sp
  push word 4 ;; scanned
  mov bp, dx
  mov dx, 13
  jmp [bp]

L9: ; Start
  push word cx
  push word L8
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g3
  mov dx, g5
  jmp [bp]

g1:
  dw L2
g2:
  dw 0
g3:
  dw L6
g4:
  dw 14
  db `Hello, world!\n`
g5:
  dw 0

bare_start: jmp L9
