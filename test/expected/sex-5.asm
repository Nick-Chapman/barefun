L1: ; Arm: 12'7
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

L3: ; Arm: 5'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L4: ; Continuation
  mov ax, [bp+4]
  sub ax, 1
  mov [2], ax
  mov bp, dx
  mov dx, [2]
  jmp [bp]

L5: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L3
  mov ax, g5
  mov bx, dx
  call Bare_get_bytes
  mov [4], ax
  push word [bp+2]
  push word [4]
  push word 1
  mov [6], sp
  push word dx
  push word cx
  push word L4
  mov cx, sp
  mov bp, g4
  mov dx, [6]
  jmp [bp]

L6: ; Function: g4
  push word dx
  push word L5
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L7: ; Arm: 21'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L8: ; Continuation
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [2], ax
  mov bp, dx
  mov dx, [2]
  jmp [bp]

L9: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L7
  mov ax, dx
  mov bx, 10
  call Bare_mod
  mov [4], ax
  mov ax, 48
  add ax, [4]
  mov [6], ax
  mov ax, [6]
  call Bare_num_to_char
  mov [8], ax
  push word [bp+2]
  push word [8]
  push word 1
  mov [10], sp
  push word dx
  push word cx
  push word L8
  mov cx, sp
  mov bp, g7
  mov dx, [10]
  jmp [bp]

L10: ; Function: g7
  push word dx
  push word L9
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L11: ; Continuation
  mov ax, `\n`
  call Bare_put_char
  mov [2], ax
  mov ax, [bp+4]
  call Bare_dump_sector
  mov [4], ax
  mov ax, `\n`
  call Bare_put_char
  mov [6], ax
  call Bare_get_char
  mov [8], ax
  mov ax, [bp+4]
  add ax, 1
  mov [10], ax
  mov bp, g3
  mov dx, [10]
  jmp [bp]

L12: ; Continuation
  push word [bp+4]
  push word cx
  push word L11
  mov cx, sp
  mov bp, g1
  mov dx, dx
  jmp [bp]

L13: ; Arm: 24'11
  push word g8
  push word '0'
  push word 1
  mov [4], sp
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L14: ; Continuation
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L15: ; Continuation
  mov ax, [bp+4]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  push word [bp+4]
  push word cx
  push word L12
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L13
  push word [bp+4]
  push word cx
  push word L14
  mov cx, sp
  mov bp, g7
  mov dx, g9
  jmp [bp]

L16: ; Continuation
  push word [bp+4]
  push word cx
  push word L15
  mov cx, sp
  mov bp, g1
  mov dx, dx
  jmp [bp]

L17: ; Continuation
  push word [bp+4]
  push word cx
  push word L16
  mov cx, sp
  mov bp, dx
  mov dx, 6
  jmp [bp]

L18: ; Function: g3
  push word dx
  push word cx
  push word L17
  mov cx, sp
  mov bp, g4
  mov dx, g6
  jmp [bp]

L19: ; Start
  mov bp, g3
  mov dx, 0
  jmp [bp]

g1: dw L2
g2: dw 0
g3: dw L18
g4: dw L6
g5: dw 7, 's', 'e', 'c', 't', 'o', 'r', ':'
g6: dw 0
g7: dw L10
g8: dw 0
g9: dw 0
g10: dw 0

bare_start: jmp L19
