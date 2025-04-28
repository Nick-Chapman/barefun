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
  mov [Temps+2], ax
  mov ax, [bx+4]
  mov [Temps+4], ax
  mov ax, [Temps+2]
  call Bare_put_char
  mov [Temps+6], ax
  mov bp, g1
  mov dx, [Temps+4]
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
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L5: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L3
  mov ax, g5
  mov bx, dx
  call Bare_get_bytes_unpacked
  mov [Temps+4], ax
  push word [bp+2]
  push word [Temps+4]
  push word 1
  mov [Temps+6], sp
  push word dx
  push word cx
  push word L4
  mov cx, sp
  mov bp, g4
  mov dx, [Temps+6]
  jmp [bp]

L6: ; Function: g4
  push word dx
  push word L5
  mov [Temps+2], sp
  mov dx, [Temps+2]
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
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L9: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L7
  mov ax, dx
  mov bx, 10
  call Bare_mod
  mov [Temps+4], ax
  mov ax, 48
  add ax, [Temps+4]
  mov [Temps+6], ax
  mov ax, [Temps+6]
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 1
  mov [Temps+10], sp
  push word dx
  push word cx
  push word L8
  mov cx, sp
  mov bp, g7
  mov dx, [Temps+10]
  jmp [bp]

L10: ; Function: g7
  push word dx
  push word L9
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L11: ; Arm: 5'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L12: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  sub ax, 1
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L13: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L11
  mov ax, g11
  mov bx, dx
  call Bare_get_bytes_unpacked
  mov [Temps+4], ax
  push word [bp+2]
  push word [Temps+4]
  push word 1
  mov [Temps+6], sp
  push word dx
  push word cx
  push word L12
  mov cx, sp
  mov bp, g10
  mov dx, [Temps+6]
  jmp [bp]

L14: ; Function: g10
  push word dx
  push word L13
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L15: ; Arm: 21'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L16: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 10
  call Bare_div
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L17: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L15
  mov ax, dx
  mov bx, 10
  call Bare_mod
  mov [Temps+4], ax
  mov ax, 48
  add ax, [Temps+4]
  mov [Temps+6], ax
  mov ax, [Temps+6]
  call Bare_num_to_char
  mov [Temps+8], ax
  push word [bp+2]
  push word [Temps+8]
  push word 1
  mov [Temps+10], sp
  push word dx
  push word cx
  push word L16
  mov cx, sp
  mov bp, g13
  mov dx, [Temps+10]
  jmp [bp]

L18: ; Function: g13
  push word dx
  push word L17
  mov [Temps+2], sp
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L19: ; Arm: 49'16
  mov dx, g19
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

L21: ; Arm: 51'32
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
  mov dx, '.'
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L23: ; Arm: 44'12
  mov dx, g20
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
  call Bare_get_bytes_unpacked
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

L25: ; Arm: 32'9
  mov dx, g17
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
  mov dx, g18
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L27: ; Arm: 48'19
  mov ax, `\n`
  call Bare_put_char
  mov [Temps+6], ax
  mov dx, [Temps+6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L28: ; Function: t1
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
  mov dx, g16
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
  mov bp, g3
  mov dx, [Temps+6]
  jmp [bp]

L30: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word L28
  mov [Temps+2], sp
  push word [bp+4]
  push word cx
  push word L29
  mov cx, sp
  mov bp, [Temps+2]
  mov dx, 0
  jmp [bp]

L31: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L30
  mov cx, sp
  mov bp, g1
  mov dx, dx
  jmp [bp]

L32: ; Arm: 24'11
  push word g14
  push word '0'
  push word 1
  mov [Temps+4], sp
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L33: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L34: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L31
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L32
  push word [bp+4]
  push word cx
  push word L33
  mov cx, sp
  mov bp, g13
  mov dx, g15
  jmp [bp]

L35: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L34
  mov cx, sp
  mov bp, g1
  mov dx, dx
  jmp [bp]

L36: ; Continuation
  call Bare_enter_check
  push word [bp+6]
  push word [bp+4]
  push word cx
  push word L35
  mov cx, sp
  mov bp, dx
  mov dx, 9
  jmp [bp]

L37: ; Continuation
  call Bare_enter_check
  mov ax, `\n`
  call Bare_put_char
  mov [Temps+2], ax
  mov ax, [bp+4]
  call Bare_dump_sector
  mov [Temps+4], ax
  mov ax, 512
  call Bare_make_bytes_unpacked
  mov [Temps+6], ax
  mov ax, [bp+4]
  mov bx, [Temps+6]
  call Bare_load_sector_unpacked
  mov [Temps+8], ax
  mov ax, [Temps+6]
  mov [Temps+10], ax
  push word [Temps+10]
  push word [bp+4]
  push word cx
  push word L36
  mov cx, sp
  mov bp, g10
  mov dx, g12
  jmp [bp]

L38: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L37
  mov cx, sp
  mov bp, g1
  mov dx, dx
  jmp [bp]

L39: ; Arm: 24'11
  push word g8
  push word '0'
  push word 1
  mov [Temps+4], sp
  mov dx, [Temps+4]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L40: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L41: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  push word [bp+4]
  push word cx
  push word L38
  mov cx, sp
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L39
  push word [bp+4]
  push word cx
  push word L40
  mov cx, sp
  mov bp, g7
  mov dx, g9
  jmp [bp]

L42: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L41
  mov cx, sp
  mov bp, g1
  mov dx, dx
  jmp [bp]

L43: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L42
  mov cx, sp
  mov bp, dx
  mov dx, 8
  jmp [bp]

L44: ; Function: g3
  push word dx
  push word cx
  push word L43
  mov cx, sp
  mov bp, g4
  mov dx, g6
  jmp [bp]

L45: ; Start
  mov bp, g3
  mov dx, 1
  jmp [bp]

g1:
  dw L2
g2:
  dw 0
g3:
  dw L44
g4:
  dw L6
g5:
  dw 9
  dw 'i', 'n', 't', 'e', 'r', 'n', 'a', 'l', ':'
g6:
  dw 0
g7:
  dw L10
g8:
  dw 0
g9:
  dw 0
g10:
  dw L14
g11:
  dw 10
  dw 'u', 's', 'e', 'r', '-', 'c', 'o', 'd', 'e', ':'
g12:
  dw 0
g13:
  dw L18
g14:
  dw 0
g15:
  dw 0
g16:
  dw 0
g17:
  dw 0
g18:
  dw 1
g19:
  dw 0
g20:
  dw 0
g21:
  dw 0

bare_start: jmp L45
