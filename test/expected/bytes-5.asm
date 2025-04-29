L1: ; Function: t1
  mov bp, [bp+2]
  mov dx, dx
  jmp [bp]

L2: ; Function: g1
  push word dx
  push word L1
  mov [Temps+2], sp
  push word 999
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L3: ; Arm: 7'7
  mov dx, 0
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L4: ; Continuation
  call Bare_enter_check
  mov ax, 1
  add ax, dx
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L5: ; Function: g2
  mov bx, dx
  cmp word [bx], 0
  jz L3
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  push word cx
  push word L4
  mov cx, sp
  push word 999
  mov bp, g2
  mov dx, [Temps+4]
  jmp [bp]

L6: ; Arm: 14'9
  mov dx, g3
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L7: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L8: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L6
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [bp+2]
  mov si, [bp+4]
  mov bx, [Temps+2]
  call Bare_set_bytes
  mov [Temps+6], ax
  mov ax, [bp+4]
  add ax, 1
  mov [Temps+8], ax
  push word [Temps+4]
  push word cx
  push word L7
  mov cx, sp
  push word 999
  mov bp, [bp+6]
  mov dx, [Temps+8]
  jmp [bp]

L9: ; Function: t2
  push word bp
  push word dx
  push word [bp+2]
  push word L8
  mov [Temps+2], sp
  push word 999
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L10: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L11: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word cx
  push word L10
  mov cx, sp
  push word 999
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L12: ; Continuation
  call Bare_enter_check
  mov ax, dx
  call Bare_make_bytes
  mov [Temps+2], ax
  push word [Temps+2]
  push word L9
  mov [Temps+4], sp
  push word 999
  push word [Temps+2]
  push word [bp+4]
  push word cx
  push word L11
  mov cx, sp
  push word 999
  mov bp, [Temps+4]
  mov dx, 0
  jmp [bp]

L13: ; Function: g4
  push word dx
  push word cx
  push word L12
  mov cx, sp
  push word 999
  mov bp, g2
  mov dx, dx
  jmp [bp]

L14: ; Arm: 24'13
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L15: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  sub ax, 1
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L16: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L14
  mov ax, [bp+2]
  mov bx, dx
  call Bare_get_bytes
  mov [Temps+4], ax
  push word [bp+4]
  push word [Temps+4]
  push word 1
  mov [Temps+6], sp
  push word 999
  push word dx
  push word cx
  push word L15
  mov cx, sp
  push word 999
  mov bp, [bp+6]
  mov dx, [Temps+6]
  jmp [bp]

L17: ; Function: t1
  push word bp
  push word dx
  push word [bp+2]
  push word L16
  mov [Temps+2], sp
  push word 999
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L18: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  sub ax, 1
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L19: ; Function: g6
  push word dx
  push word L17
  mov [Temps+2], sp
  push word 999
  mov ax, dx
  call Bare_string_length
  mov [Temps+4], ax
  push word [Temps+4]
  push word cx
  push word L18
  mov cx, sp
  push word 999
  mov bp, [Temps+2]
  mov dx, g5
  jmp [bp]

L20: ; Arm: 33'7
  mov dx, g8
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L21: ; Function: g7
  mov bx, dx
  cmp word [bx], 0
  jz L20
  mov ax, [bx+2]
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [Temps+2]
  call Bare_put_char
  mov [Temps+6], ax
  mov bp, g7
  mov dx, [Temps+4]
  jmp [bp]

L22: ; Continuation
  call Bare_enter_check
  mov bp, g7
  mov dx, dx
  jmp [bp]

L23: ; Continuation
  call Bare_enter_check
  push word cx
  push word L22
  mov cx, sp
  push word 999
  mov bp, [bp+4]
  mov dx, dx
  jmp [bp]

L24: ; Continuation
  call Bare_enter_check
  push word g10
  push word `\n`
  push word 1
  mov [Temps+2], sp
  push word 999
  push word [Temps+2]
  push word `o`
  push word 1
  mov [Temps+4], sp
  push word 999
  push word [Temps+4]
  push word `w`
  push word 1
  mov [Temps+6], sp
  push word 999
  push word [Temps+6]
  push word `T`
  push word 1
  mov [Temps+8], sp
  push word 999
  push word [bp+6]
  push word cx
  push word L23
  mov cx, sp
  push word 999
  mov bp, [bp+4]
  mov dx, [Temps+8]
  jmp [bp]

L25: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L24
  mov cx, sp
  push word 999
  mov bp, g7
  mov dx, dx
  jmp [bp]

L26: ; Continuation
  call Bare_enter_check
  mov ax, 5
  call Bare_make_bytes
  mov [Temps+2], ax
  mov ax, [Temps+2]
  mov [Temps+4], ax
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L25
  mov cx, sp
  push word 999
  mov bp, [bp+6]
  mov dx, [Temps+4]
  jmp [bp]

L27: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L26
  mov cx, sp
  push word 999
  mov bp, g7
  mov dx, dx
  jmp [bp]

L28: ; Continuation
  call Bare_enter_check
  push word dx
  push word [bp+4]
  push word cx
  push word L27
  mov cx, sp
  push word 999
  mov bp, dx
  mov dx, g9
  jmp [bp]

L29: ; Continuation
  call Bare_enter_check
  push word dx
  push word cx
  push word L28
  mov cx, sp
  push word 999
  mov bp, g1
  mov dx, g6
  jmp [bp]

L30: ; Start
  push word cx
  push word L29
  mov cx, sp
  push word 999
  mov bp, g1
  mov dx, g4
  jmp [bp]

g1:
  dw L2
g2:
  dw L5
g3:
  dw 0
g4:
  dw L13
g5:
  dw 0
g6:
  dw L19
g7:
  dw L21
g8:
  dw 0
g9:
  dw 4
  db `One\n`
g10:
  dw 0

bare_start: jmp L30
