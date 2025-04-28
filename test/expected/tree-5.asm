L1: ; Arm: 6'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L2: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L3: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L1
  mov ax, dx
  mov bx, 10
  call Bare_mod
  mov [Temps+4], ax
  mov ax, 48
  add ax, [Temps+4]
  mov [Temps+6], ax
  mov ax, [Temps+6]
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 1
  mov [Temps+10], sp
  push word dx
  push word cx
  push word L2
  mov cx, sp
  mov bp, g1
  mov dx, [Temps+10]
  jmp [bp]

L4: ; Function: g1
  push word dx
  push word L3
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L5: ; Arm: 13'7
  mov dx, g3
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L6: ; Function: g2
  mov bx, dx
  cmp word [bx], 0
  jz L5
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [Temps+2]
  call Bare_put_char
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
  call Bare_enter_check
  mov ax, [bp+4]
  add ax, dx
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L9: ; Continuation
  call Bare_enter_check
  push word dx
  push word cx
  push word L8
  mov cx, sp
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
  mov bp, g4
  mov dx, [Temps+2]
  jmp [bp]

L11: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  sub ax, dx
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L12: ; Continuation
  call Bare_enter_check
  push word dx
  push word cx
  push word L11
  mov cx, sp
  mov dx, [bp+4]
  mov bp, g4
  jmp [bp]

L13: ; Function: g4
  mov bx, dx
  cmp word [bx], 0
  jz L7
  cmp word [bx], 1
  jz L10
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word [Temps+4]
  push word cx
  push word L12
  mov cx, sp
  mov bp, g4
  mov dx, [Temps+2]
  jmp [bp]

L14: ; Continuation
  call Bare_enter_check
  mov bp, g2
  mov dx, dx
  jmp [bp]

L15: ; Arm: 9'20
  push word g5
  push word '0'
  push word 1
  mov [Temps+4], sp
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L16: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L17: ; Continuation
  call Bare_enter_check
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  push word cx
  push word L14
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L15
  push word dx
  push word cx
  push word L16
  mov cx, sp
  mov bp, g1
  mov dx, g6
  jmp [bp]

L18: ; Start
  push word 1000
  push word 0
  mov [Temps+2], sp
  push word 42
  push word 0
  mov [Temps+4], sp
  push word 3
  push word 0
  mov [Temps+6], sp
  push word [Temps+6]
  push word [Temps+4]
  push word 1
  mov [Temps+8], sp
  push word [Temps+8]
  push word [Temps+2]
  push word 2
  mov [Temps+10], sp
  push word cx
  push word L17
  mov cx, sp
  mov bp, g4
  mov dx, [Temps+10]
  jmp [bp]

g1:
  dw L4
g2:
  dw L6
g3:
  dw 0
g4:
  dw L13
g5:
  dw 0
g6:
  dw 0

bare_start: jmp L18
