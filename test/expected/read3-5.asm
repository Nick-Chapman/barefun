L1: ; Start
  mov ax, `3`
  call Bare_put_char
  mov ax, `>`
  call Bare_put_char
  mov ax, ` `
  call Bare_put_char
  call Bare_get_char
  mov [Temps+8], ax
  mov ax, [Temps+8]
  call Bare_put_char
  call Bare_get_char
  mov [Temps+12], ax
  mov ax, [Temps+12]
  call Bare_put_char
  call Bare_get_char
  mov [Temps+16], ax
  mov ax, [Temps+16]
  call Bare_put_char
  mov ax, `\n`
  call Bare_put_char
  mov ax, [Temps+8]
  call Bare_put_char
  mov ax, [Temps+12]
  call Bare_put_char
  mov ax, [Temps+16]
  call Bare_put_char
  mov ax, `\n`
  call Bare_put_char
  mov ax, [Temps+12]
  call Bare_put_char
  mov ax, [Temps+16]
  call Bare_put_char
  mov ax, [Temps+8]
  call Bare_put_char
  mov ax, `\n`
  call Bare_put_char
  mov ax, [Temps+16]
  call Bare_put_char
  mov ax, [Temps+8]
  call Bare_put_char
  mov ax, [Temps+12]
  call Bare_put_char
  mov ax, `\n`
  call Bare_put_char
  mov ax, [Temps+8]
  call Bare_put_char
  mov ax, [Temps+12]
  call Bare_put_char
  mov ax, [Temps+16]
  call Bare_put_char
  mov ax, `\n`
  call Bare_put_char
  mov dx, [Temps+52]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

g1:
  dw 0
g2:
  dw 0
g3:
  dw 0

bare_start: jmp L1
