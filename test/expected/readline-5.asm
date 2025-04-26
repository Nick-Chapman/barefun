L1: ; Arm: 14'7
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L2: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L3: ; Function: t1
  mov bx, dx
  cmp word [bx], 0
  jz L1
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
  push word L2
  mov cx, sp
  mov bp, g1
  mov dx, [6]
  jmp [bp]

L4: ; Function: g1
  push word dx
  push word L3
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L5: ; Arm: 37'7
  mov dx, g3
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L6: ; Continuation
  call Bare_enter_check
  mov dx, [bp+4]
  mov bp, g2
  jmp [bp]

L7: ; Arm: 30'19
  mov ax, [2]
  call Bare_put_char
  mov [10], ax
  mov dx, [10]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L8: ; Arm: 31'22
  mov ax, [2]
  call Bare_put_char
  mov [12], ax
  mov dx, [12]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L9: ; Arm: 32'16
  mov ax, [2]
  call Bare_put_char
  mov [14], ax
  mov dx, [14]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L10: ; Function: g2
  mov bx, dx
  cmp word [bx], 0
  jz L5
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov ax, [2]
  call Bare_char_to_num
  mov [6], ax
  mov ax, [6]
  cmp word ax, 8
  call Bare_make_bool_from_z
  mov [8], ax
  push word [4]
  push word cx
  push word L6
  mov cx, sp
  mov bx, [8]
  cmp word [bx], 1
  jz L7
  mov ax, [2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [10], ax
  mov bx, [10]
  cmp word [bx], 1
  jz L8
  mov ax, 26
  cmp word ax, [6]
  call Bare_make_bool_from_n
  mov [12], ax
  mov bx, [12]
  cmp word [bx], 1
  jz L9
  mov ax, '^'
  call Bare_put_char
  mov [14], ax
  mov ax, 65
  add ax, [6]
  mov [16], ax
  mov ax, [16]
  sub ax, 1
  mov [18], ax
  mov ax, [18]
  call Bare_num_to_char
  mov [20], ax
  mov ax, [20]
  call Bare_put_char
  mov [22], ax
  mov dx, [22]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L11: ; Arm: 21'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L12: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  sub ax, 1
  mov [2], ax
  mov bp, dx
  mov dx, [2]
  jmp [bp]

L13: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L11
  mov ax, g6
  mov bx, dx
  call Bare_get_bytes
  mov [4], ax
  push word [bp+2]
  push word [4]
  push word 1
  mov [6], sp
  push word dx
  push word cx
  push word L12
  mov cx, sp
  mov bp, g5
  mov dx, [6]
  jmp [bp]

L14: ; Function: g5
  push word dx
  push word L13
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L15: ; Continuation
  call Bare_enter_check
  mov di, bp
  mov bp, dx
  mov dx, [di+4]
  jmp [bp]

L16: ; Arm: 56'22
  mov ax, `\n`
  call Bare_put_char
  mov [8], ax
  push word dx
  push word cx
  push word L15
  mov cx, sp
  mov bp, g1
  mov dx, g10
  jmp [bp]

L17: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word 4
  push word 1
  mov [2], sp
  mov bp, dx
  mov dx, [2]
  jmp [bp]

L18: ; Arm: 57'28
  mov ax, '^'
  call Bare_put_char
  mov [10], ax
  mov ax, 'D'
  call Bare_put_char
  mov [12], ax
  mov ax, `\n`
  call Bare_put_char
  mov [14], ax
  push word dx
  push word cx
  push word L17
  mov cx, sp
  mov bp, g1
  mov dx, g11
  jmp [bp]

L19: ; Arm: 58'19
  mov bp, g8
  mov dx, dx
  jmp [bp]

L20: ; Arm: 61'17
  mov bp, g8
  mov dx, dx
  jmp [bp]

L21: ; Continuation
  call Bare_enter_check
  mov ax, 8
  call Bare_put_char
  mov [2], ax
  mov ax, ' '
  call Bare_put_char
  mov [4], ax
  mov ax, 8
  call Bare_put_char
  mov [6], ax
  mov dx, [bp+4]
  mov bp, g8
  jmp [bp]

L22: ; Arm: 63'31
  mov ax, 8
  call Bare_put_char
  mov [2], ax
  mov ax, ' '
  call Bare_put_char
  mov [4], ax
  mov ax, 8
  call Bare_put_char
  mov [6], ax
  mov dx, [6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L23: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word cx
  push word L21
  mov cx, sp
  mov bx, dx
  cmp word [bx], 1
  jz L22
  mov dx, g14
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L24: ; Arm: 6'9
  mov dx, g12
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L25: ; Arm: 59'21
  mov bx, dx
  cmp word [bx], 0
  jz L20
  mov ax, [bx+2]
  mov [14], ax
  mov ax, [bx+4]
  mov [16], ax
  mov ax, [14]
  call Bare_char_to_num
  mov [18], ax
  mov ax, 26
  cmp word ax, [18]
  call Bare_make_bool_from_n
  mov [20], ax
  push word [16]
  push word cx
  push word L23
  mov cx, sp
  mov bx, [20]
  cmp word [bx], 1
  jz L24
  mov dx, g13
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L26: ; Continuation
  call Bare_enter_check
  push word [bp+4]
  push word [bp+6]
  push word 1
  mov [2], sp
  mov bp, g8
  mov dx, [2]
  jmp [bp]

L27: ; Arm: 30'19
  mov ax, [2]
  call Bare_put_char
  mov [18], ax
  mov dx, [18]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L28: ; Arm: 31'22
  mov ax, [2]
  call Bare_put_char
  mov [20], ax
  mov dx, [20]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L29: ; Arm: 32'16
  mov ax, [2]
  call Bare_put_char
  mov [22], ax
  mov dx, [22]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L30: ; Function: g8
  call Bare_get_char
  mov [2], ax
  mov ax, [2]
  call Bare_char_to_num
  mov [4], ax
  mov ax, [2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [6], ax
  mov bx, [6]
  cmp word [bx], 1
  jz L16
  mov ax, [2]
  cmp word ax, 4
  call Bare_make_bool_from_z
  mov [8], ax
  mov bx, [8]
  cmp word [bx], 1
  jz L18
  mov ax, 127
  cmp word ax, [4]
  call Bare_make_bool_from_n
  mov [10], ax
  mov bx, [10]
  cmp word [bx], 1
  jz L19
  mov ax, [4]
  cmp word ax, 127
  call Bare_make_bool_from_z
  mov [12], ax
  mov bx, [12]
  cmp word [bx], 1
  jz L25
  mov ax, [2]
  call Bare_char_to_num
  mov [14], ax
  mov ax, [14]
  cmp word ax, 8
  call Bare_make_bool_from_z
  mov [16], ax
  push word [2]
  push word dx
  push word cx
  push word L26
  mov cx, sp
  mov bx, [16]
  cmp word [bx], 1
  jz L27
  mov ax, [2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [18], ax
  mov bx, [18]
  cmp word [bx], 1
  jz L28
  mov ax, 26
  cmp word ax, [14]
  call Bare_make_bool_from_n
  mov [20], ax
  mov bx, [20]
  cmp word [bx], 1
  jz L29
  mov ax, '^'
  call Bare_put_char
  mov [22], ax
  mov ax, 65
  add ax, [14]
  mov [24], ax
  mov ax, [24]
  sub ax, 1
  mov [26], ax
  mov ax, [26]
  call Bare_num_to_char
  mov [28], ax
  mov ax, [28]
  call Bare_put_char
  mov [30], ax
  mov dx, [30]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L31: ; Arm: 79'29
  mov dx, g17
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L32: ; Continuation
  call Bare_enter_check
  mov ax, `\n`
  call Bare_put_char
  mov [2], ax
  mov bp, g4
  mov dx, g18
  jmp [bp]

L33: ; Continuation
  call Bare_enter_check
  mov bx, dx
  cmp word [bx], 1
  jz L31
  push word cx
  push word L32
  mov cx, sp
  mov dx, [bp+4]
  mov bp, g2
  jmp [bp]

L34: ; Arm: 73'7
  mov dx, g16
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L35: ; Continuation
  call Bare_enter_check
  push word dx
  push word cx
  push word L33
  mov cx, sp
  mov bx, dx
  cmp word [bx], 0
  jz L34
  mov ax, [bx+2]
  mov [2], ax
  mov ax, [bx+4]
  mov [4], ax
  mov ax, [2]
  cmp word ax, 4
  call Bare_make_bool_from_z
  mov [6], ax
  mov dx, [6]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L36: ; Continuation
  call Bare_enter_check
  push word cx
  push word L35
  mov cx, sp
  mov bp, g8
  mov dx, g15
  jmp [bp]

L37: ; Continuation
  call Bare_enter_check
  push word cx
  push word L36
  mov cx, sp
  mov bp, g2
  mov dx, dx
  jmp [bp]

L38: ; Continuation
  call Bare_enter_check
  push word cx
  push word L37
  mov cx, sp
  mov bp, dx
  mov dx, 1
  jmp [bp]

L39: ; Function: g4
  push word cx
  push word L38
  mov cx, sp
  mov bp, g5
  mov dx, g7
  jmp [bp]

L40: ; Arm: 21'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L41: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  sub ax, 1
  mov [2], ax
  mov bp, dx
  mov dx, [2]
  jmp [bp]

L42: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_n
  mov [2], ax
  mov bx, [2]
  cmp word [bx], 1
  jz L40
  mov ax, g20
  mov bx, dx
  call Bare_get_bytes
  mov [4], ax
  push word [bp+2]
  push word [4]
  push word 1
  mov [6], sp
  push word dx
  push word cx
  push word L41
  mov cx, sp
  mov bp, g19
  mov dx, [6]
  jmp [bp]

L43: ; Function: g19
  push word dx
  push word L42
  mov [2], sp
  mov dx, [2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L44: ; Continuation
  call Bare_enter_check
  mov bp, g4
  mov dx, g22
  jmp [bp]

L45: ; Continuation
  call Bare_enter_check
  push word cx
  push word L44
  mov cx, sp
  mov bp, g2
  mov dx, dx
  jmp [bp]

L46: ; Continuation
  call Bare_enter_check
  push word cx
  push word L45
  mov cx, sp
  mov bp, dx
  mov dx, 44
  jmp [bp]

L47: ; Start
  push word cx
  push word L46
  mov cx, sp
  mov bp, g19
  mov dx, g21
  jmp [bp]

g1: dw L4
g2: dw L10
g3: dw 0
g4: dw L39
g5: dw L14
g6: dw 2, '%', ' '
g7: dw 0
g8: dw L30
g9: dw 0
g10: dw 0
g11: dw 0
g12: dw 0
g13: dw 1
g14: dw 0
g15: dw 0
g16: dw 0
g17: dw 0
g18: dw 0
g19: dw L43
g20: dw 45, 'R', 'e', 'a', 'd', 'l', 'i', 'n', 'e', ':', ' ', 'e', 'd', 'i', 't', ' ', 'w', 'i', 't', 'h', ' ', 'b', 'a', 'c', 'k', 's', 'p', 'a', 'c', 'e', ';', ' ', 'e', 'x', 'i', 't', ' ', 'w', 'i', 't', 'h', ' ', '^', 'D', '.', `\n`
g21: dw 0
g22: dw 0

bare_start: jmp L47
