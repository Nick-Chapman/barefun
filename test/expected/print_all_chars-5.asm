L1: ; Arm: 9'15
  mov dx, g2
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L2: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  add ax, 1
  mov [Temps+2], ax
  mov bp, g1
  mov dx, [Temps+2]
  jmp [bp]

L3: ; Arm: 12'17
  mov ax, `[`
  call Bare_put_char
  mov ax, `D`
  call Bare_put_char
  mov ax, `E`
  call Bare_put_char
  mov ax, `L`
  call Bare_put_char
  mov ax, `]`
  call Bare_put_char
  mov dx, [Temps+16]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L4: ; Arm: 13'20
  mov ax, `[`
  call Bare_put_char
  mov ax, `N`
  call Bare_put_char
  mov ax, `L`
  call Bare_put_char
  mov ax, `]`
  call Bare_put_char
  mov dx, [Temps+16]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L5: ; Function: (loop,g1)
  mov ax, 255
  cmp word ax, dx
  call Bare_make_bool_from_n
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L1
  mov ax, ` `
  call Bare_put_char
  mov ax, dx
  cmp word ax, 8
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  push word dx
  push word cx
  push word L2
  mov cx, sp
  push word 6 ;; scanned
  mov bx, [Temps+6]
  cmp word [bx], 1
  jz L3
  mov ax, dx
  cmp word ax, 10
  call Bare_make_bool_from_z
  mov [Temps+8], ax
  mov bx, [Temps+8]
  cmp word [bx], 1
  jz L4
  mov ax, dx
  call Bare_num_to_char
  mov [Temps+10], ax
  mov ax, [Temps+10]
  call Bare_put_char
  mov dx, [Temps+12]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L6: ; Continuation
  call Bare_enter_check
  mov ax, `\n`
  call Bare_put_char
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L7: ; Start
  push word cx
  push word L6
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g1
  mov dx, 0
  jmp [bp]

g1:
  dw L5
g2:
  dw 0

bare_start: jmp L7
