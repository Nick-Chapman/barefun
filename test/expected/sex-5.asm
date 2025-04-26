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
  call Bare_enter_check
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
  call Bare_enter_check
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

L11: ; Arm: 49'16
  mov dx, g13
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L12: ; Continuation
  call Bare_enter_check
  mov ax, dx
  call Bare_put_char
  mov [2], ax
  mov ax, [bp+4]
  add ax, 1
  mov [4], ax
  mov bp, [bp+6]
  mov dx, [4]
  jmp [bp]

L13: ; Arm: 51'32
  mov dx, [bp+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L14: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L12
  mov cx, sp
  mov bx, dx
  cmp word [bx], 1
  jz L13
  mov dx, '.'
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L15: ; Arm: 44'12
  mov dx, g14
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L16: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L11
  mov ax, [bp+4]
  mov bx, [bp+6]
  call Bare_get_bytes
  mov [2], ax
  mov ax, [2]
  call Bare_char_to_num
  mov [4], ax
  mov ax, [4]
  cmp word ax, 32
  call Bare_make_bool_from_n
  mov [6], ax
  push word [2]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L14
  mov cx, sp
  mov bx, [6]
  cmp word [bx], 1
  jz L15
  mov ax, [4]
  cmp word ax, 127
  call Bare_make_bool_from_n
  mov [8], ax
  mov dx, [8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L17: ; Arm: 32'9
  mov dx, g11
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L18: ; Continuation
  call Bare_enter_check
  mov ax, [bp+6]
  cmp word ax, 512
  call Bare_make_bool_from_n
  mov [2], ax
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L16
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L17
  mov dx, g12
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L19: ; Arm: 48'19
  mov ax, `\n`
  call Bare_put_char
  mov [6], ax
  mov dx, [6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L20: ; Function: t6
  mov ax, dx
  mov bx, 64
  call Bare_mod
  mov [2], ax
  mov ax, [2]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [4], ax
  push word bp
  push word dx
  push word [bp+2]
  push word cx
  push word L18
  mov cx, sp
  mov bx, [4]
  cmp word [bx], 1
  jz L19
  mov dx, g10
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L21: ; Continuation
  call Bare_enter_check
  mov ax, `\n`
  call Bare_put_char
  mov [2], ax
  call Bare_get_char
  mov [4], ax
  mov ax, [bp+4]
  add ax, 1
  mov [6], ax
  mov bp, g3
  mov dx, [6]
  jmp [bp]

L22: ; Continuation
  call Bare_enter_check
  mov ax, `\n`
  call Bare_put_char
  mov [2], ax
  mov ax, [bp+4]
  call Bare_dump_sector
  mov [4], ax
  mov ax, 512
  call Bare_make_bytes
  mov [6], ax
  mov ax, [bp+4]
  mov bx, [6]
  call Bare_load_sector
  mov [8], ax
  mov ax, [6]
  mov [10], ax
  push word [10]
  push word L20
  mov [12], sp
  push word [bp+4]
  push word cx
  push word L21
  mov cx, sp
  mov bp, [12]
  mov dx, 0
  jmp [bp]

L23: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L22
  mov cx, sp
  mov bp, g1
  mov dx, dx
  jmp [bp]

L24: ; Arm: 24'11
  push word g8
  push word '0'
  push word 1
  mov [4], sp
  mov dx, [4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L25: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L26: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [2], ax
  push word [bp+4]
  push word cx
  push word L23
  mov cx, sp
  mov bx, [2]
  cmp word [bx], 1
  jz L24
  push word [bp+4]
  push word cx
  push word L25
  mov cx, sp
  mov bp, g7
  mov dx, g9
  jmp [bp]

L27: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L26
  mov cx, sp
  mov bp, g1
  mov dx, dx
  jmp [bp]

L28: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L27
  mov cx, sp
  mov bp, dx
  mov dx, 6
  jmp [bp]

L29: ; Function: g3
  push word dx
  push word cx
  push word L28
  mov cx, sp
  mov bp, g4
  mov dx, g6
  jmp [bp]

L30: ; Start
  mov bp, g3
  mov dx, 0
  jmp [bp]

g1: dw L2
g2: dw 0
g3: dw L29
g4: dw L6
g5: dw 7, 's', 'e', 'c', 't', 'o', 'r', ':'
g6: dw 0
g7: dw L10
g8: dw 0
g9: dw 0
g10: dw 0
g11: dw 0
g12: dw 1
g13: dw 0
g14: dw 0
g15: dw 0

bare_start: jmp L30
