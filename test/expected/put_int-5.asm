L1: ; Arm: 13'7
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
  mov bp, g1
  mov dx, [Temps+4]
  jmp [bp]

L3: ; Arm: 6'13
  mov dx, [bp+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L4: ; Continuation
  call Bare_enter_check
  mov ax, [bp+4]
  mov bx, 10
  push word dx ;; save
  mov dx, 0
  div bx
  pop word dx ;; restore
  mov [Temps+2], ax
  mov bp, dx
  mov dx, [Temps+2]
  jmp [bp]

L5: ; Function: t1
  mov ax, dx
  cmp word ax, 0
  call Bare_make_bool_from_z
  mov [Temps+2], ax
  mov bx, [Temps+2]
  cmp word [bx], 1
  jz L3
  mov ax, dx
  mov bx, 10
  push word dx ;; save
  mov dx, 0
  div bx
  mov ax, dx
  pop word dx ;; restore
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
  push word 6 ;; scanned
  push word dx
  push word cx
  push word L4
  mov cx, sp
  push word 6 ;; scanned
  mov bp, g3
  mov dx, [Temps+10]
  jmp [bp]

L6: ; Function: g3
  push word dx
  push word L5
  mov [Temps+2], sp
  push word 4 ;; scanned
  mov dx, [Temps+2]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

L7: ; Continuation
  call Bare_enter_check
  mov bp, g1
  mov dx, dx
  jmp [bp]

L8: ; Continuation
  call Bare_enter_check
  push word cx
  push word L7
  mov cx, sp
  push word 4 ;; scanned
  mov bp, dx
  mov dx, 42
  jmp [bp]

L9: ; Start
  push word cx
  push word L8
  mov cx, sp
  push word 4 ;; scanned
  mov bp, g3
  mov dx, g4
  jmp [bp]

g1:
  dw L2
g2:
  dw 0
g3:
  dw L6
g4:
  dw 0

bare_start: jmp L9
