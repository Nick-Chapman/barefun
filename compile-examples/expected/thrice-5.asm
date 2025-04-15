(*Stage5 (ASM)*)
L1: ; Start
  mov ax, #'@'
  call Bare_put_char
  mov 1, ax
  mov ax, #'A'
  call Bare_put_char
  mov 2, ax
  mov ax, #'B'
  call Bare_put_char
  mov 3, ax
  mov ax, #'C'
  call Bare_put_char
  mov 4, ax
  mov ax, #'D'
  call Bare_put_char
  mov 5, ax
  mov ax, #'E'
  call Bare_put_char
  mov 6, ax
  mov ax, #'F'
  call Bare_put_char
  mov 7, ax
  mov ax, #'G'
  call Bare_put_char
  mov 8, ax
  mov ax, #'H'
  call Bare_put_char
  mov 9, ax
  mov ax, #'I'
  call Bare_put_char
  mov 10, ax
  mov ax, #'J'
  call Bare_put_char
  mov 11, ax
  mov ax, #'K'
  call Bare_put_char
  mov 12, ax
  mov ax, #'L'
  call Bare_put_char
  mov 13, ax
  mov ax, #'M'
  call Bare_put_char
  mov 14, ax
  mov ax, #'N'
  call Bare_put_char
  mov 15, ax
  mov ax, #'O'
  call Bare_put_char
  mov 16, ax
  mov ax, #'P'
  call Bare_put_char
  mov 17, ax
  mov ax, #'Q'
  call Bare_put_char
  mov 18, ax
  mov ax, #'R'
  call Bare_put_char
  mov 19, ax
  mov ax, #'S'
  call Bare_put_char
  mov 20, ax
  mov ax, #'T'
  call Bare_put_char
  mov 21, ax
  mov ax, #'U'
  call Bare_put_char
  mov 22, ax
  mov ax, #'V'
  call Bare_put_char
  mov 23, ax
  mov ax, #'W'
  call Bare_put_char
  mov 24, ax
  mov ax, #'X'
  call Bare_put_char
  mov 25, ax
  mov ax, #'Y'
  call Bare_put_char
  mov 26, ax
  mov ax, #'Z'
  call Bare_put_char
  mov 27, ax
  mov ax, #'['
  call Bare_put_char
  mov 28, ax
  mov ax, #'\n'
  call Bare_put_char
  mov 29, ax
  ;; (0'0) Return: prim_0'0 (t29)
  mov dx, [29]
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]


