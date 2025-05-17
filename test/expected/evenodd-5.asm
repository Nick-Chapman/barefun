L1: ; Arm: 5'27
  mov dx, g2
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L2: ; Arm: 4'26
  mov dx, g3
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L3: ; Function: (is_even,g1)
  Bare_enter_check(0)
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L1
  mov ax, dx
  sar ax, 1
  mov bx, 3
  sar bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+4], ax
  mov ax, [Temps+4]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L2
  mov ax, [Temps+4]
  sar ax, 1
  mov bx, 3
  sar bx, 1
  sub ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+8], ax
  mov bp, g1
  mov dx, [Temps+8]
  jmp [bp]

L4: ; Continuation
  Bare_enter_check(0)
  mov ax, dx
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L5: ; Arm: 9'25
  mov dx, `E`
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L6: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L4
  mov cx, sp
  push word 4 ;; scanned
  mov bx, dx
  cmp word [bx], 3
  jz L5
  mov dx, `O`
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L7: ; Continuation
  Bare_enter_check(6)
  mov ax, dx
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  push word cx
  push word L6
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g1
  mov dx, 27
  jmp [bp]

L8: ; Arm: 9'25
  mov dx, `E`
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L9: ; Continuation
  Bare_enter_check(6)
  push word cx
  push word L7
  mov cx, sp
  push word 4 ;; scanned
  mov bx, dx
  cmp word [bx], 3
  jz L8
  mov dx, `O`
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L10: ; Start
  Bare_enter_check(6)
  push word cx
  push word L9
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g1
  mov dx, 85
  jmp [bp]

g1:
  dw L3
g2:
  dw 3
g3:
  dw 1

bare_start: jmp L10
