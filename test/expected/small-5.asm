L1: ; Arm: 11'7
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

L3: ; Arm: 4'13
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
  mov ax, g4
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
  mov bp, g3
  mov dx, [6]
  jmp [bp]

L6: ; Function: g3
  push word dx
  push word L5
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L7: ; Arm: 4'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L8: ; Continuation
  mov ax, [bp+4]
  sub ax, 1
  mov [2], ax
  mov bp, dx
  mov dx, [2]
  jmp [bp]

L9: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L7
  mov ax, g8
  mov bx, dx
  call Bare_get_bytes
  mov [4], ax
  push word [bp+2]
  push word [4]
  push word 1
  mov [6], sp
  push word dx
  push word cx
  push word L8
  mov cx, sp
  mov bp, g7
  mov dx, [6]
  jmp [bp]

L10: ; Function: g7
  push word dx
  push word L9
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L11: ; Arm: 19'9
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L12: ; Continuation
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L13: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L11
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
  push word L12
  mov cx, sp
  mov bp, g12
  mov dx, [6]
  jmp [bp]

L14: ; Function: g12
  push word dx
  push word L13
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L15: ; Continuation
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L16: ; Arm: 30'27
  mov ax, `\n`
  call Bare_put_char
  mov [6], ax
  push word dx
  push word cx
  push word L15
  mov cx, sp
  mov bp, g12
  mov dx, g13
  jmp [bp]

L17: ; Function: g10
  call Bare_get_char
  mov [2], ax
  mov ax, [2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [4], ax
  mov bx, [4]
  cmp word [bx], 1
  jz L16
  mov ax, [2]
  call Bare_put_char
  mov [6], ax
  push word dx
  push word [2]
  push word 1
  mov [8], sp
  mov bp, g10
  mov dx, [8]
  jmp [bp]

L18: ; Continuation
  mov ax, `\n`
  call Bare_put_char
  mov [2], ax
  mov bp, g6
  mov dx, g15
  jmp [bp]

L19: ; Continuation
  push word cx
  push word L18
  mov cx, sp
  mov bp, g1
  mov dx, dx
  jmp [bp]

L20: ; Continuation
  push word cx
  push word L19
  mov cx, sp
  mov bp, g10
  mov dx, g14
  jmp [bp]

L21: ; Continuation
  push word cx
  push word L20
  mov cx, sp
  mov bp, g1
  mov dx, dx
  jmp [bp]

L22: ; Continuation
  push word cx
  push word L21
  mov cx, sp
  mov bp, dx
  mov dx, 1
  jmp [bp]

L23: ; Function: g6
  push word cx
  push word L22
  mov cx, sp
  mov bp, g7
  mov dx, g9
  jmp [bp]

L24: ; Arm: 4'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L25: ; Continuation
  mov ax, [bp+4]
  sub ax, 1
  mov [2], ax
  mov bp, dx
  mov dx, [2]
  jmp [bp]

L26: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L24
  mov ax, g17
  mov bx, dx
  call Bare_get_bytes
  mov [4], ax
  push word [bp+2]
  push word [4]
  push word 1
  mov [6], sp
  push word dx
  push word cx
  push word L25
  mov cx, sp
  mov bp, g16
  mov dx, [6]
  jmp [bp]

L27: ; Function: g16
  push word dx
  push word L26
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L28: ; Arm: 4'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L29: ; Continuation
  mov ax, [bp+4]
  sub ax, 1
  mov [2], ax
  mov bp, dx
  mov dx, [2]
  jmp [bp]

L30: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L28
  mov ax, g21
  mov bx, dx
  call Bare_get_bytes
  mov [4], ax
  push word [bp+2]
  push word [4]
  push word 1
  mov [6], sp
  push word dx
  push word cx
  push word L29
  mov cx, sp
  mov bp, g20
  mov dx, [6]
  jmp [bp]

L31: ; Function: g20
  push word dx
  push word L30
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L32: ; Continuation
  mov bp, g1
  mov dx, dx
  jmp [bp]

L33: ; Continuation
  push word cx
  push word L32
  mov cx, sp
  mov bp, dx
  mov dx, 5
  jmp [bp]

L34: ; Continuation
  push word cx
  push word L33
  mov cx, sp
  mov bp, g20
  mov dx, g22
  jmp [bp]

L35: ; Continuation
  push word cx
  push word L34
  mov cx, sp
  mov bp, g6
  mov dx, g19
  jmp [bp]

L36: ; Continuation
  push word cx
  push word L35
  mov cx, sp
  mov bp, g1
  mov dx, dx
  jmp [bp]

L37: ; Continuation
  push word cx
  push word L36
  mov cx, sp
  mov bp, dx
  mov dx, 34
  jmp [bp]

L38: ; Continuation
  push word cx
  push word L37
  mov cx, sp
  mov bp, g16
  mov dx, g18
  jmp [bp]

L39: ; Continuation
  push word cx
  push word L38
  mov cx, sp
  mov bp, g1
  mov dx, dx
  jmp [bp]

L40: ; Continuation
  push word cx
  push word L39
  mov cx, sp
  mov bp, dx
  mov dx, 4
  jmp [bp]

L41: ; Start
  push word cx
  push word L40
  mov cx, sp
  mov bp, g3
  mov dx, g5
  jmp [bp]

g1: dw L2
g2: dw 0
g3: dw L6
g4: dw 5, 'L', 'O', 'A', 'D', `\n`
g5: dw 0
g6: dw L23
g7: dw L10
g8: dw 2, '>', ' '
g9: dw 0
g10: dw L17
g11: dw 0
g12: dw L14
g13: dw 0
g14: dw 0
g15: dw 0
g16: dw L27
g17: dw 35, 'W', 'e', 'l', 'c', 'o', 'm', 'e', ' ', 't', 'o', ' ', 's', 'm', 'a', 'l', 'l', ':', ' ', 'a', ' ', 'p', 'r', 'o', 't', 'o', ' ', 'r', 'e', 'a', 'd', 'l', 'i', 'n', 'e', `\n`
g18: dw 0
g19: dw 0
g20: dw L31
g21: dw 6, 'N', 'E', 'V', 'E', 'R', `\n`
g22: dw 0

bare_start: jmp L41
