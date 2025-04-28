L1: ; Arm: 13'14
  mov dx, g5
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L2: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L1
  mov ax, g6
  mov bx, [bp+4]
  call Bare_get_bytes
  mov [Temps+2], ax
  mov ax, [Temps+2]
  call Bare_put_char
  mov [Temps+4], ax
  mov ax, [bp+4]
  add ax, 1
  mov [Temps+6], ax
  mov bp, g2
  mov dx, [Temps+6]
  jmp [bp]

L3: ; Arm: 5'9
  mov dx, g3
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L4: ; Function: g2
  mov ax, dx
  cmp word ax, 7
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word dx
  push word cx
  push word L2
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L3
  mov dx, g4
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L5: ; Arm: 23'13
  mov dx, g8
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L6: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 10
  call Bare_mod
  mov [Temps+2], ax
  mov ax, 48
  add ax, [Temps+2]
  mov [Temps+4], ax
  mov ax, [Temps+4]
  call Bare_num_to_char
  mov [Temps+6], ax
  mov ax, [Temps+6]
  call Bare_put_char
  mov [Temps+8], ax
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L7: ; Function: g7
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L5
  mov ax, dx
  mov bx, 10
  call Bare_div
  mov [Temps+4], ax
  push word dx
  push word cx
  push word L6
  mov cx, sp
  mov bp, g7
  mov dx, [Temps+4]
  jmp [bp]

L8: ; Arm: 13'14
  mov dx, g17
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L9: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L8
  mov ax, g18
  mov bx, [bp+4]
  call Bare_get_bytes
  mov [Temps+2], ax
  mov ax, [Temps+2]
  call Bare_put_char
  mov [Temps+4], ax
  mov ax, [bp+4]
  add ax, 1
  mov [Temps+6], ax
  mov bp, g14
  mov dx, [Temps+6]
  jmp [bp]

L10: ; Arm: 5'9
  mov dx, g15
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L11: ; Function: g14
  mov ax, dx
  cmp word ax, 7
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word dx
  push word cx
  push word L9
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L10
  mov dx, g16
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L12: ; Arm: 23'13
  mov dx, g21
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L13: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 10
  call Bare_mod
  mov [Temps+2], ax
  mov ax, 48
  add ax, [Temps+2]
  mov [Temps+4], ax
  mov ax, [Temps+4]
  call Bare_num_to_char
  mov [Temps+6], ax
  mov ax, [Temps+6]
  call Bare_put_char
  mov [Temps+8], ax
  mov dx, [Temps+8]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L14: ; Function: g20
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L12
  mov ax, dx
  mov bx, 10
  call Bare_div
  mov [Temps+4], ax
  push word dx
  push word cx
  push word L13
  mov cx, sp
  mov bp, g20
  mov dx, [Temps+4]
  jmp [bp]

L15: ; Arm: 13'14
  mov dx, g25
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L16: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L15
  mov ax, g26
  mov bx, [bp+4]
  call Bare_get_bytes
  mov [Temps+2], ax
  mov ax, [Temps+2]
  call Bare_put_char
  mov [Temps+4], ax
  mov ax, [bp+4]
  add ax, 1
  mov [Temps+6], ax
  mov bp, g22
  mov dx, [Temps+6]
  jmp [bp]

L17: ; Arm: 5'9
  mov dx, g23
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L18: ; Function: g22
  mov ax, dx
  cmp word ax, 1
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  push word dx
  push word cx
  push word L16
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L17
  mov dx, g24
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L19: ; Arm: 43'16
  mov dx, g12
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

L21: ; Arm: 45'32
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
  mov bx, dx
  cmp word [bx], 1
  jz L21
  mov dx, `.`
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L23: ; Arm: 38'12
  mov dx, g13
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

L25: ; Arm: 5'9
  mov dx, g10
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
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L25
  mov dx, g11
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L27: ; Arm: 42'19
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
  mov bx, [Temps+4]
  cmp word [bx], 1
  jz L27
  mov dx, g9
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L29: ; Continuation
  call Bare_enter_check
  mov ax, `\n`
  call Bare_put_char
  mov [Temps+2], ax
  call Bare_get_char
  mov [Temps+4], ax
  mov ax, [bp+4]
  add ax, 1
  mov [Temps+6], ax
  mov bp, g1
  mov dx, [Temps+6]
  jmp [bp]

L30: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L29
  mov cx, sp
  mov bp, g22
  mov dx, 0
  jmp [bp]

L31: ; Arm: 27'11
  mov ax, `0`
  call Bare_put_char
  mov [Temps+6], ax
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L32: ; Continuation
  call Bare_enter_check
  mov ax, sp
  call Bare_addr_to_num
  mov [Temps+2], ax
  mov ax, [Temps+2]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+4], ax
  push word [bp+4]
  push word cx
  push word L30
  mov cx, sp
  mov bx, [Temps+4]
  cmp word [bx], 1
  jz L31
  mov bp, g20
  mov dx, [Temps+2]
  jmp [bp]

L33: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L32
  mov cx, sp
  mov bp, g14
  mov dx, 0
  jmp [bp]

L34: ; Continuation
  call Bare_enter_check
  mov ax, 512
  call Bare_make_bytes
  mov [Temps+2], ax
  mov ax, [bp+4]
  mov bx, [Temps+2]
  call Bare_load_sector
  mov [Temps+4], ax
  mov ax, [Temps+2]
  mov [Temps+6], ax
  push word [Temps+6]
  push word L28
  mov [Temps+8], sp
  push word [bp+4]
  push word cx
  push word L33
  mov cx, sp
  mov bp, [Temps+8]
  mov dx, 0
  jmp [bp]

L35: ; Arm: 27'11
  mov ax, `0`
  call Bare_put_char
  mov [Temps+4], ax
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L36: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  push word [bp+4]
  push word cx
  push word L34
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L35
  mov dx, [bp+4]
  mov bp, g7
  jmp [bp]

L37: ; Function: g1
  push word dx
  push word cx
  push word L36
  mov cx, sp
  mov bp, g2
  mov dx, 0
  jmp [bp]

L38: ; Start
  mov bp, g1
  mov dx, 1
  jmp [bp]

g1:
  dw L37
g2:
  dw L4
g3:
  dw 0
g4:
  dw 1
g5:
  dw 0
g6:
  dw 7
  db `sector:`
g7:
  dw L7
g8:
  dw 0
g9:
  dw 0
g10:
  dw 0
g11:
  dw 1
g12:
  dw 0
g13:
  dw 0
g14:
  dw L11
g15:
  dw 0
g16:
  dw 1
g17:
  dw 0
g18:
  dw 7
  db `(space=`
g19:
  dw 0
g20:
  dw L14
g21:
  dw 0
g22:
  dw L18
g23:
  dw 0
g24:
  dw 1
g25:
  dw 0
g26:
  dw 1
  db `)`
g27:
  dw 0

bare_start: jmp L38
