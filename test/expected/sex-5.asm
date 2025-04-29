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

L3: ; Arm: 70'16
  mov dx, g4
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L4: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L3
  mov ax, [bp+6]
  mov si, [bp+8]
  mov bx, [bp+4]
  call Bare_set_bytes
  mov [Temps+2], ax
  mov ax, [bp+8]
  add ax, 1
  mov [Temps+4], ax
  mov bp, [bp+10]
  mov dx, [Temps+4]
  jmp [bp]

L5: ; Arm: 7'9
  mov dx, g2
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L6: ; Function: t2
  mov ax, dx
  cmp word ax, 512
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word bp
  push word dx
  push word [bp+4]
  push word [bp+2]
  push word cx
  push word L4
  mov cx, sp
  push word 999
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L5
  mov dx, g3
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L7: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov [Temps+2], ax
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L8: ; Function: g5
  mov ax, 512
  call Bare_make_bytes
  mov [Temps+2], ax
  push word [Temps+2]
  push word dx
  push word L6
  mov [Temps+4], sp
  push word 999
  push word [Temps+2]
  push word cx
  push word L7
  mov cx, sp
  push word 999
  mov bp, [Temps+4]
  mov dx, 0
  jmp [bp]

L9: ; Arm: 45'16
  mov dx, g9
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L10: ; Continuation
  call Bare_enter_check
  mov ax, dx
  call Bare_put_char
  mov [Temps+2], ax
  mov ax, [bp+4]
  add ax, 1
  mov [Temps+4], ax
  mov bp, [bp+6]
  mov dx, [Temps+4]
  jmp [bp]

L11: ; Arm: 47'32
  mov dx, [bp+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L12: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L10
  mov cx, sp
  push word 999
  mov bx, dx
  cmp word [bx], 1
  jz L11
  mov dx, `.`
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L13: ; Arm: 40'12
  mov dx, g10
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L14: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L9
  mov ax, [bp+4]
  mov bx, [bp+6]
  call Bare_get_bytes
  mov [Temps+2], ax
  mov ax, [Temps+2]
  call Bare_char_to_num
  mov [Temps+4], ax
  mov ax, [Temps+4]
  cmp word ax, 32
  call Bare_make_bool_from_n
  mov [Temps+6], ax
  push word [Temps+2]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L12
  mov cx, sp
  push word 999
  mov bx, [Temps+6]
  cmp word [bx], 1
  jz L13
  mov ax, [Temps+4]
  cmp word ax, 127
  call Bare_make_bool_from_n
  mov [Temps+8], ax
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L15: ; Arm: 7'9
  mov dx, g7
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L16: ; Continuation
  call Bare_enter_check
  mov ax, [bp+6]
  cmp word ax, 512
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L14
  mov cx, sp
  push word 999
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L15
  mov dx, g8
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L17: ; Arm: 44'19
  mov ax, `\n`
  call Bare_put_char
  mov [Temps+6], ax
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L18: ; Function: t4
  mov ax, dx
  mov bx, 64
  call Bare_mod
  mov [Temps+2], ax
  mov ax, [Temps+2]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  push word bp
  push word dx
  push word [bp+2]
  push word cx
  push word L16
  mov cx, sp
  push word 999
  mov bx, [Temps+4]
  cmp word [bx], 1
  jz L17
  mov dx, g6
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L19: ; Arm: 45'16
  mov dx, g14
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L20: ; Continuation
  call Bare_enter_check
  mov ax, dx
  call Bare_put_char
  mov [Temps+2], ax
  mov ax, [bp+4]
  add ax, 1
  mov [Temps+4], ax
  mov bp, [bp+6]
  mov dx, [Temps+4]
  jmp [bp]

L21: ; Arm: 47'32
  mov dx, [bp+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L22: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L20
  mov cx, sp
  push word 999
  mov bx, dx
  cmp word [bx], 1
  jz L21
  mov dx, `.`
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L23: ; Arm: 40'12
  mov dx, g15
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L24: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L19
  mov ax, [bp+4]
  mov bx, [bp+6]
  call Bare_get_bytes
  mov [Temps+2], ax
  mov ax, [Temps+2]
  call Bare_char_to_num
  mov [Temps+4], ax
  mov ax, [Temps+4]
  cmp word ax, 32
  call Bare_make_bool_from_n
  mov [Temps+6], ax
  push word [Temps+2]
  push word [bp+8]
  push word [bp+6]
  push word cx
  push word L22
  mov cx, sp
  push word 999
  mov bx, [Temps+6]
  cmp word [bx], 1
  jz L23
  mov ax, [Temps+4]
  cmp word ax, 127
  call Bare_make_bool_from_n
  mov [Temps+8], ax
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L25: ; Arm: 7'9
  mov dx, g12
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L26: ; Continuation
  call Bare_enter_check
  mov ax, [bp+6]
  cmp word ax, 512
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word [bp+8]
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L24
  mov cx, sp
  push word 999
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L25
  mov dx, g13
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L27: ; Arm: 44'19
  mov ax, `\n`
  call Bare_put_char
  mov [Temps+6], ax
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L28: ; Function: t4
  mov ax, dx
  mov bx, 64
  call Bare_mod
  mov [Temps+2], ax
  mov ax, [Temps+2]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  push word bp
  push word dx
  push word [bp+2]
  push word cx
  push word L26
  mov cx, sp
  push word 999
  mov bx, [Temps+4]
  cmp word [bx], 1
  jz L27
  mov dx, g11
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L29: ; Continuation
  call Bare_enter_check
  mov ax, 6
  mov bx, [bp+6]
  call Bare_store_sector
  mov [Temps+2], ax
  mov ax, 7
  mov bx, [bp+4]
  call Bare_store_sector
  mov [Temps+4], ax
  mov dx, g16
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L30: ; Continuation
  call Bare_enter_check
  mov ax, 512
  call Bare_make_bytes
  mov [Temps+2], ax
  mov ax, 7
  mov bx, [Temps+2]
  call Bare_load_sector
  mov [Temps+4], ax
  mov ax, [Temps+2]
  mov [Temps+6], ax
  push word [Temps+6]
  push word L28
  mov [Temps+8], sp
  push word 999
  push word [Temps+6]
  push word [bp+4]
  push word cx
  push word L29
  mov cx, sp
  push word 999
  mov bp, [Temps+8]
  mov dx, 0
  jmp [bp]

L31: ; Continuation
  call Bare_enter_check
  mov ax, 512
  call Bare_make_bytes
  mov [Temps+2], ax
  mov ax, 6
  mov bx, [Temps+2]
  call Bare_load_sector
  mov [Temps+4], ax
  mov ax, [Temps+2]
  mov [Temps+6], ax
  push word [Temps+6]
  push word L18
  mov [Temps+8], sp
  push word 999
  push word [Temps+6]
  push word cx
  push word L30
  mov cx, sp
  push word 999
  mov bp, [Temps+8]
  mov dx, 0
  jmp [bp]

L32: ; Start
  push word cx
  push word L31
  mov cx, sp
  push word 999
  mov bp, g1
  mov dx, g5
  jmp [bp]

g1:
  dw L2
g2:
  dw 0
g3:
  dw 1
g4:
  dw 0
g5:
  dw L8
g6:
  dw 0
g7:
  dw 0
g8:
  dw 1
g9:
  dw 0
g10:
  dw 0
g11:
  dw 0
g12:
  dw 0
g13:
  dw 1
g14:
  dw 0
g15:
  dw 0
g16:
  dw 0

bare_start: jmp L32
