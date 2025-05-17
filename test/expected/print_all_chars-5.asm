L1: ; Arm: 9'15
  mov si, g2
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L2: ; Continuation
  Bare_enter_check(0)
  mov ax, [bp+4]
  sar ax, 1
  mov bx, 3
  sar bx, 1
  add ax, bx
  shl ax, 1
  add ax, 1
  mov [Temps+2], ax
  mov bp, g1
  mov si, [Temps+2]
  jmp [bp]

L3: ; Arm: 12'17
  mov ax, `[`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov ax, `D`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov ax, `E`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov ax, `L`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+14], ax
  mov ax, `]`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+16], ax
  mov si, [Temps+16]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L4: ; Arm: 13'20
  mov ax, `[`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov ax, `N`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov ax, `L`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+14], ax
  mov ax, `]`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+16], ax
  mov si, [Temps+16]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L5: ; Function: (loop,g1)
  Bare_enter_check(8)
  mov ax, 511
  cmp word ax, si
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L1
  mov ax, ` `
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+4], ax
  mov ax, si
  cmp word ax, 17
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word si
  push word cx
  push word L2
  mov cx, sp
  push word 6 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L3
  mov ax, si
  cmp word ax, 21
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 3
  jz L4
  mov ax, si
  sar ax, 1
  call Bare_num_to_char
  mov [Temps+10], ax
  mov ax, [Temps+10]
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov si, [Temps+12]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L6: ; Continuation
  Bare_enter_check(0)
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov si, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L7: ; Start
  Bare_enter_check(6)
  push word cx
  push word L6
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g1
  mov si, 1
  jmp [bp]

g1:
  dw L5
g2:
  dw 1

bare_start: jmp L7
