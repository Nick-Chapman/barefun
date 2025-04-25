L1: ; Start
  mov ax, '@'
  call Bare_put_char
  mov [2], ax
  mov ax, 'A'
  call Bare_put_char
  mov [4], ax
  mov ax, 'B'
  call Bare_put_char
  mov [6], ax
  mov ax, 'C'
  call Bare_put_char
  mov [8], ax
  mov ax, 'D'
  call Bare_put_char
  mov [10], ax
  mov ax, 'E'
  call Bare_put_char
  mov [12], ax
  mov ax, 'F'
  call Bare_put_char
  mov [14], ax
  mov ax, 'G'
  call Bare_put_char
  mov [16], ax
  mov ax, 'H'
  call Bare_put_char
  mov [18], ax
  mov ax, 'I'
  call Bare_put_char
  mov [20], ax
  mov ax, 'J'
  call Bare_put_char
  mov [22], ax
  mov ax, 'K'
  call Bare_put_char
  mov [24], ax
  mov ax, 'L'
  call Bare_put_char
  mov [26], ax
  mov ax, 'M'
  call Bare_put_char
  mov [28], ax
  mov ax, 'N'
  call Bare_put_char
  mov [30], ax
  mov ax, 'O'
  call Bare_put_char
  mov [32], ax
  mov ax, 'P'
  call Bare_put_char
  mov [34], ax
  mov ax, 'Q'
  call Bare_put_char
  mov [36], ax
  mov ax, 'R'
  call Bare_put_char
  mov [38], ax
  mov ax, 'S'
  call Bare_put_char
  mov [40], ax
  mov ax, 'T'
  call Bare_put_char
  mov [42], ax
  mov ax, 'U'
  call Bare_put_char
  mov [44], ax
  mov ax, 'V'
  call Bare_put_char
  mov [46], ax
  mov ax, 'W'
  call Bare_put_char
  mov [48], ax
  mov ax, 'X'
  call Bare_put_char
  mov [50], ax
  mov ax, 'Y'
  call Bare_put_char
  mov [52], ax
  mov ax, 'Z'
  call Bare_put_char
  mov [54], ax
  mov ax, '['
  call Bare_put_char
  mov [56], ax
  mov ax, `\n`
  call Bare_put_char
  mov [58], ax
  ;; (0'0) Return: prim_0'0 (t29)
  mov dx, [58]
  mov bp, cx
  mov cx, [bp+2]
  mov ax, [bp]
  jmp ax


bare_start: jmp L1
