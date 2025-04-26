L1: ; Function: t1
  mov bp, [bp+2]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L2: ; Function: g1
  push word dx
  push word L1
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L3: ; Arm: 7'7
  mov dx, 0
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L4: ; Continuation
  mov ax, 1
  add ax, dx
  mov [2], ax
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L5: ; Function: g2
  mov bx, dx
  cmp word [bx], 0
  jz L3
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  push word cx
  push word L4
  mov cx, sp
  mov bp, g2
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L6: ; Arm: 14'9
  mov dx, g3
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L7: ; Continuation
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L8: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L6
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov ax, [bp+2]
  mov bx, [bp+4]
  mov si, [2]
  call Bare_set_bytes
  mov [6], ax
  mov ax, [bp+4]
  add ax, 1
  mov [8], ax
  push word [4]
  push word cx
  push word L7
  mov cx, sp
  mov bp, [bp+6]
  mov dx, [8]
  mov ax, [bp]
  jmp ax

L9: ; Function: t2
  push word bp
  push word dx
  push word [bp+2]
  push word L8
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L10: ; Continuation
  mov ax, [bp+4]
  mov [2], ax
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L11: ; Continuation
  push word [bp+6]
  push word cx
  push word L10
  mov cx, sp
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L12: ; Continuation
  mov ax, dx
  call Bare_make_bytes
  mov [2], ax
  push word [2]
  push word L9
  mov [4], sp
  push word [2]
  push word [bp+4]
  push word cx
  push word L11
  mov cx, sp
  mov bp, [4]
  mov dx, 0
  mov ax, [bp]
  jmp ax

L13: ; Function: g4
  push word dx
  push word cx
  push word L12
  mov cx, sp
  mov bp, g2
  mov dx, dx
  mov ax, [bp]
  jmp ax

L14: ; Arm: 24'13
  mov dx, [bp+4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L15: ; Continuation
  mov ax, [bp+4]
  sub ax, 1
  mov [2], ax
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L16: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L14
  mov ax, [bp+2]
  mov bx, dx
  call Bare_get_bytes
  mov [4], ax
  push word [bp+4]
  push word [4]
  push word 1
  mov [6], sp
  push word dx
  push word cx
  push word L15
  mov cx, sp
  mov bp, [bp+6]
  mov dx, [6]
  mov ax, [bp]
  jmp ax

L17: ; Function: t1
  push word bp
  push word dx
  push word [bp+2]
  push word L16
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L18: ; Continuation
  mov ax, [bp+4]
  sub ax, 1
  mov [2], ax
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L19: ; Function: g6
  push word dx
  push word L17
  mov [2], sp
  mov ax, dx
  call Bare_string_length
  mov [4], ax
  push word [4]
  push word cx
  push word L18
  mov cx, sp
  mov bp, [2]
  mov dx, g5
  mov ax, [bp]
  jmp ax

L20: ; Arm: 33'7
  mov dx, g8
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L21: ; Function: g7
  mov bx, dx
  cmp word [bx], 0
  jz L20
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov ax, [2]
  call Bare_put_char
  mov [6], ax
  mov bp, g7
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L22: ; Continuation
  mov bp, g7
  mov dx, dx
  mov ax, [bp]
  jmp ax

L23: ; Continuation
  push word cx
  push word L22
  mov cx, sp
  mov bp, [bp+4]
  mov dx, dx
  mov ax, [bp]
  jmp ax

L24: ; Continuation
  push word g10
  push word `\n`
  push word 1
  mov [2], sp
  push word [2]
  push word 'o'
  push word 1
  mov [4], sp
  push word [4]
  push word 'w'
  push word 1
  mov [6], sp
  push word [6]
  push word 'T'
  push word 1
  mov [8], sp
  push word [bp+6]
  push word cx
  push word L23
  mov cx, sp
  mov bp, [bp+4]
  mov dx, [8]
  mov ax, [bp]
  jmp ax

L25: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L24
  mov cx, sp
  mov bp, g7
  mov dx, dx
  mov ax, [bp]
  jmp ax

L26: ; Continuation
  mov ax, 5
  call Bare_make_bytes
  mov [2], ax
  mov ax, [2]
  mov [4], ax
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L25
  mov cx, sp
  mov bp, [bp+6]
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L27: ; Continuation
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L26
  mov cx, sp
  mov bp, g7
  mov dx, dx
  mov ax, [bp]
  jmp ax

L28: ; Continuation
  push word dx
  push word [bp+4]
  push word cx
  push word L27
  mov cx, sp
  mov bp, dx
  mov dx, g9
  mov ax, [bp]
  jmp ax

L29: ; Continuation
  push word dx
  push word cx
  push word L28
  mov cx, sp
  mov bp, g1
  mov dx, g6
  mov ax, [bp]
  jmp ax

L30: ; Start
  push word cx
  push word L29
  mov cx, sp
  mov bp, g1
  mov dx, g4
  mov ax, [bp]
  jmp ax

g1: dw L2
g2: dw L5
g3: dw 0
g4: dw L13
g5: dw 0
g6: dw L19
g7: dw L21
g8: dw 0
g9: dw 4, 'O', 'n', 'e', `\n`
g10: dw 0

bare_start: jmp L30
