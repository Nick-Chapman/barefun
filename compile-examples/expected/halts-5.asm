(*Stage5 (ASM)*)
L1: ; Start
  mov ax, #'X'
  call bios_put_char
  mov 1, ax
  call bios_get_char
  mov 2, ax
  mov ax, [2]
  call bios_put_char
  mov 3, ax
  mov ax, #'Y'
  call bios_put_char
  mov 4, ax
  call bios_get_char
  mov 5, ax
  mov ax, [5]
  call bios_put_char
  mov 6, ax
  mov ax, #'Z'
  call bios_put_char
  mov 7, ax
  ;; (0'0) Return: prim_0'0 (t7)
  mov dx, [7]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]

g1: dw 0
g2: dw 0

