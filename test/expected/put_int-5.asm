L1: ; Arm: 13'7
  mov dx, g2
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

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
  mov ax, [bp]
  jmp ax

L3: ; Arm: 6'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L4: ; Continuation
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [2], ax
  mov bp, dx
  mov dx, [2]
  mov ax, [bp]
  jmp ax

L5: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L3
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
  push word L4
  mov cx, sp
  mov bp, g3
  mov dx, [10]
  mov ax, [bp]
  jmp ax

L6: ; Function: g3
  push word dx
  push word L5
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

L7: ; Continuation
  mov bp, g1
  mov dx, dx
  mov ax, [bp]
  jmp ax

L8: ; Continuation
  push word cx
  push word L7
  mov cx, sp
  mov bp, dx
  mov dx, 42
  mov ax, [bp]
  jmp ax

L9: ; Start
  push word cx
  push word L8
  mov cx, sp
  mov bp, g3
  mov dx, g4
  mov ax, [bp]
  jmp ax

g1: dw L2
g2: dw 0
g3: dw L6
g4: dw 0

bare_start: jmp L9
