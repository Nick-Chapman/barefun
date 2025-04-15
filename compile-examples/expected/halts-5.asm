L1: ; Start
  mov ax, 'X'
  call Bare_put_char
  mov [2], ax
  call Bare_get_char
  mov [4], ax
  mov ax, [4]
  call Bare_put_char
  mov [6], ax
  mov ax, 'Y'
  call Bare_put_char
  mov [8], ax
  call Bare_get_char
  mov [10], ax
  mov ax, [10]
  call Bare_put_char
  mov [12], ax
  mov ax, 'Z'
  call Bare_put_char
  mov [14], ax
  ;; (0'0) Return: prim_0'0 (t7)
  mov dx, [14]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax

g1: dw 0
g2: dw 0

bare_start: jmp L1
