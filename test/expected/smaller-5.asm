L1: ; Arm: 6'7
  mov dx, g2
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L2: ; Function: (put_chars,g1)
  mov bx, dx
  cmp word [bx], 0
  jz L1
  mov si, [bx+2]
  mov di, [bx+4]
  mov ax, si
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov bp, g1
  mov dx, di
  jmp [bp]

L3: ; Arm: 12'9
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L4: ; Continuation
  call Bare_enter_check
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L5: ; Function: (lam,t1)
  mov bx, dx
  cmp word [bx], 0
  jz L3
  mov si, [bx+2]
  mov di, [bx+4]
  push word [bp+2]
  push word si
  push word 1
  mov [Temps+6], sp
  push word 6 ;; scanned
  push word di
  push word cx
  push word L4
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g6
  mov dx, [Temps+6]
  jmp [bp]

L6: ; Function: (revloop,g6)
  push word dx
  push word L5
  mov si, sp
  push word 4 ;; scanned
  mov dx, si
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L7: ; Continuation
  call Bare_enter_check
  mov bx, bp
  mov bp, dx
  mov dx, [bx+4]
  jmp [bp]

L8: ; Arm: 23'27
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  push word dx
  push word cx
  push word L7
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g6
  mov dx, g7
  jmp [bp]

L9: ; Function: (readloop,g4)
  call Bare_get_char
  mov si, ax
  mov ax, si
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov di, ax
  mov bx, di
  cmp word [bx], 1
  jz L8
  mov ax, si
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  push word dx
  push word si
  push word 1
  mov [Temps+8], sp
  push word 6 ;; scanned
  mov bp, g4
  mov dx, [Temps+8]
  jmp [bp]

L10: ; Continuation
  call Bare_enter_check
  mov ax, `\n`
  call Bare_put_char
  mov si, Bare_unit
  mov bp, g3
  mov dx, g9
  jmp [bp]

L11: ; Continuation
  call Bare_enter_check
  push word cx
  push word L10
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g1
  mov dx, dx
  jmp [bp]

L12: ; Function: (main,g3)
  mov ax, `%`
  call Bare_put_char
  mov si, Bare_unit
  mov ax, ` `
  call Bare_put_char
  mov di, Bare_unit
  push word cx
  push word L11
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g4
  mov dx, g8
  jmp [bp]

L13: ; Start
  mov bp, g3
  mov dx, g10
  jmp [bp]

g1:
  dw L2
g2:
  dw 0
g3:
  dw L12
g4:
  dw L9
g5:
  dw 0
g6:
  dw L6
g7:
  dw 0
g8:
  dw 0
g9:
  dw 0
g10:
  dw 0

bare_start: jmp L13
