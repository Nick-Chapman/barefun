(*Stage5 (ASM)*)
L1: ; Start
  mov ax, #'@'
  mov 101, ax
  mov ax, #'A'
  mov 102, ax
  mov ax, #'B'
  mov 103, ax
  mov ax, #'C'
  mov 104, ax
  mov ax, #'D'
  mov 105, ax
  mov ax, #'E'
  mov 106, ax
  mov ax, #'F'
  mov 107, ax
  mov ax, #'G'
  mov 108, ax
  mov ax, #'H'
  mov 109, ax
  mov ax, #'I'
  mov 110, ax
  mov ax, #'J'
  mov 111, ax
  mov ax, #'K'
  mov 112, ax
  mov ax, #'L'
  mov 113, ax
  mov ax, #'M'
  mov 114, ax
  mov ax, #'N'
  mov 115, ax
  mov ax, #'O'
  mov 116, ax
  mov ax, #'P'
  mov 117, ax
  mov ax, #'Q'
  mov 118, ax
  mov ax, #'R'
  mov 119, ax
  mov ax, #'S'
  mov 120, ax
  mov ax, #'T'
  mov 121, ax
  mov ax, #'U'
  mov 122, ax
  mov ax, #'V'
  mov 123, ax
  mov ax, #'W'
  mov 124, ax
  mov ax, #'X'
  mov 125, ax
  mov ax, #'Y'
  mov 126, ax
  mov ax, #'Z'
  mov 127, ax
  mov ax, #'['
  mov 128, ax
  mov ax, #'\n'
  mov 129, ax
  mov ax, 101
  call bios_put_char
  mov 1, ax
  mov ax, 102
  call bios_put_char
  mov 2, ax
  mov ax, 103
  call bios_put_char
  mov 3, ax
  mov ax, 104
  call bios_put_char
  mov 4, ax
  mov ax, 105
  call bios_put_char
  mov 5, ax
  mov ax, 106
  call bios_put_char
  mov 6, ax
  mov ax, 107
  call bios_put_char
  mov 7, ax
  mov ax, 108
  call bios_put_char
  mov 8, ax
  mov ax, 109
  call bios_put_char
  mov 9, ax
  mov ax, 110
  call bios_put_char
  mov 10, ax
  mov ax, 111
  call bios_put_char
  mov 11, ax
  mov ax, 112
  call bios_put_char
  mov 12, ax
  mov ax, 113
  call bios_put_char
  mov 13, ax
  mov ax, 114
  call bios_put_char
  mov 14, ax
  mov ax, 115
  call bios_put_char
  mov 15, ax
  mov ax, 116
  call bios_put_char
  mov 16, ax
  mov ax, 117
  call bios_put_char
  mov 17, ax
  mov ax, 118
  call bios_put_char
  mov 18, ax
  mov ax, 119
  call bios_put_char
  mov 19, ax
  mov ax, 120
  call bios_put_char
  mov 20, ax
  mov ax, 121
  call bios_put_char
  mov 21, ax
  mov ax, 122
  call bios_put_char
  mov 22, ax
  mov ax, 123
  call bios_put_char
  mov 23, ax
  mov ax, 124
  call bios_put_char
  mov 24, ax
  mov ax, 125
  call bios_put_char
  mov 25, ax
  mov ax, 126
  call bios_put_char
  mov 26, ax
  mov ax, 127
  call bios_put_char
  mov 27, ax
  mov ax, 128
  call bios_put_char
  mov 28, ax
  mov ax, 129
  call bios_put_char
  mov 29, ax
  ;; (0'0) Return: prim_0'0 (t29)
  mov dx, 29
  mov bp, cx
  mov cx, [bp+1]
  mov ax, [bp]
  jmp [ax]


