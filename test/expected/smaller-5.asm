L1: ; Arm: 6'7
  mov dx, g2
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L2: ; Function: g1
  mov bx, dx
  cmp word [bx], 0
  jz L1
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov ax, [2]
  call Bare_put_char
  mov [6], ax
  mov bp, g1
  mov dx, [4]
  jmp [bp]

L3: ; Arm: 12'9
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L4: ; Continuation
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L5: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L3
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  push word [bp+2]
  push word [2]
  push word 1
  mov [6], sp
  push word [4]
  push word cx
  push word L4
  mov cx, sp
  mov bp, g6
  mov dx, [6]
  jmp [bp]

L6: ; Function: g6
  push word dx
  push word L5
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L7: ; Continuation
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L8: ; Arm: 23'27
  mov ax, `\n`
  call Bare_put_char
  mov [6], ax
  push word dx
  push word cx
  push word L7
  mov cx, sp
  mov bp, g6
  mov dx, g7
  jmp [bp]

L9: ; Function: g4
  call Bare_get_char
  mov [2], ax
  mov ax, [2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [4], ax
  mov bx, [4]
  cmp word [bx], 1
  jz L8
  mov ax, [2]
  call Bare_put_char
  mov [6], ax
  push word dx
  push word [2]
  push word 1
  mov [8], sp
  mov bp, g4
  mov dx, [8]
  jmp [bp]

L10: ; Continuation
  mov ax, `\n`
  call Bare_put_char
  mov [2], ax
  mov bp, g3
  mov dx, g9
  jmp [bp]

L11: ; Continuation
  push word cx
  push word L10
  mov cx, sp
  mov bp, g1
  mov dx, dx
  jmp [bp]

L12: ; Function: g3
  mov ax, '%'
  call Bare_put_char
  mov [2], ax
  mov ax, ' '
  call Bare_put_char
  mov [4], ax
  push word cx
  push word L11
  mov cx, sp
  mov bp, g4
  mov dx, g8
  jmp [bp]

L13: ; Start
  mov bp, g3
  mov dx, g10
  jmp [bp]

g1: dw L2
g2: dw 0
g3: dw L12
g4: dw L9
g5: dw 0
g6: dw L6
g7: dw 0
g8: dw 0
g9: dw 0
g10: dw 0

bare_start: jmp L13
