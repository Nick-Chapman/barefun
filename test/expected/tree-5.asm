L1: ; Arm: 6'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L2: ; Continuation
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [2], ax
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L3: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L1
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
  push word L2
  mov cx, sp
  mov bp, g1
  mov dx, [10]
  mov ax, [bp]
  jmp ax

L4: ; Function: g1
  push word dx
  push word L3
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L5: ; Arm: 13'7
  mov dx, g3
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L6: ; Function: g2
  mov bx, dx
  cmp word [bx], 0
  jz L5
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov ax, [2]
  call Bare_put_char
  mov [6], ax
  mov bp, g2
  mov dx, [4]
  mov ax, [bp]
  jmp ax

L7: ; Arm: 22'10
  mov ax, [bx+2]
  mov [2], ax
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L8: ; Continuation
  mov ax, [bp+4]
  add ax, dx
  mov [2], ax
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L9: ; Continuation
  push word dx
  push word cx
  push word L8
  mov cx, sp
  mov dx, [bp+4]
  mov bp, g4
  mov ax, [bp]
  jmp ax

L10: ; Arm: 23'15
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  push word [4]
  push word cx
  push word L9
  mov cx, sp
  mov bp, g4
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L11: ; Continuation
  mov ax, [bp+4]
  sub ax, dx
  mov [2], ax
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L12: ; Continuation
  push word dx
  push word cx
  push word L11
  mov cx, sp
  mov dx, [bp+4]
  mov bp, g4
  mov ax, [bp]
  jmp ax

L13: ; Function: g4
  mov bx, dx
  cmp word [bx], 0
  jz L7
  cmp word [bx], 1
  jz L10
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  push word [4]
  push word cx
  push word L12
  mov cx, sp
  mov bp, g4
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L14: ; Continuation
  mov bp, g2
  mov dx, dx
  mov ax, [bp]
  jmp ax

L15: ; Arm: 9'20
  push word g5
  push word '0'
  push word 1
  mov [4], sp
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L16: ; Continuation
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  mov ax, [bp]
  jmp ax

L17: ; Continuation
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  push word cx
  push word L14
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L15
  push word dx
  push word cx
  push word L16
  mov cx, sp
  mov bp, g1
  mov dx, g6
  mov ax, [bp]
  jmp ax

L18: ; Start
  push word 1000
  push word 0
  mov [2], sp
  push word 42
  push word 0
  mov [4], sp
  push word 3
  push word 0
  mov [6], sp
  push word [6]
  push word [4]
  push word 1
  mov [8], sp
  push word [8]
  push word [2]
  push word 2
  mov [10], sp
  push word cx
  push word L17
  mov cx, sp
  mov bp, g4
  mov dx, [10]
  mov ax, [bp]
  jmp ax

g1: dw L4
g2: dw L6
g3: dw 0
g4: dw L13
g5: dw 0
g6: dw 0

bare_start: jmp L18
