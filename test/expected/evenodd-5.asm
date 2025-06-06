L1: ; Arm: 5'27
  mov di, g2
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L2: ; Arm: 4'26
  mov di, g3
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L3: ; Function: (is_even,g1)
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov ax, si
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 3
  jz L1
  mov ax, si
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+4], ax
  mov ax, [Temps+4]
  cmp word ax, 1
  call Bare_make_bool_from_z
  mov [Temps+6], ax
  mov bx, [Temps+6]
  cmp word [bx], 3
  jz L2
  mov ax, [Temps+4]
  mov bx, 3
  sub ax, bx
  add ax, 1
  mov [Temps+8], ax
  mov di, [Temps+8]
  mov bp, g1
  jmp [bp]

L4: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(0)
  mov ax, si
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov di, [Temps+2]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L5: ; Arm: 9'25
  mov di, `E`
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L6: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L4
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L5
  mov di, `O`
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L7: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  mov ax, si
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  push word [CurrentCont]
  push word L6
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, 27
  mov bp, g1
  jmp [bp]

L8: ; Arm: 9'25
  mov di, `E`
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L9: ; Continuation
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L7
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov bx, si
  cmp word [bx], 3
  jz L8
  mov di, `O`
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]

L10: ; Start
  mov ax, di
  mov di, si
  mov si, ax
  Bare_enter_check(6)
  push word [CurrentCont]
  push word L9
  mov [CurrentCont], sp
  push word 4 ;; scanned
  mov di, 85
  mov bp, g1
  jmp [bp]

g1:
  dw L3
g2:
  dw 3
g3:
  dw 1

bare_start: jmp L10
