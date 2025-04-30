L1: ; Start
  mov ax, `3`
  call Bare_put_char
  mov [Temps+2], ax
  mov ax, `>`
  call Bare_put_char
  mov [Temps+4], ax
  mov ax, ` `
  call Bare_put_char
  mov [Temps+6], ax
  call Bare_get_char
  mov [Temps+8], ax
  mov ax, [Temps+8]
  call Bare_put_char
  mov [Temps+10], ax
  call Bare_get_char
  mov [Temps+12], ax
  mov ax, [Temps+12]
  call Bare_put_char
  mov [Temps+14], ax
  call Bare_get_char
  mov [Temps+16], ax
  mov ax, [Temps+16]
  call Bare_put_char
  mov [Temps+18], ax
  mov ax, `\n`
  call Bare_put_char
  mov [Temps+20], ax
  mov ax, [Temps+8]
  call Bare_put_char
  mov [Temps+22], ax
  mov ax, [Temps+12]
  call Bare_put_char
  mov [Temps+24], ax
  mov ax, [Temps+16]
  call Bare_put_char
  mov [Temps+26], ax
  mov ax, `\n`
  call Bare_put_char
  mov [Temps+28], ax
  mov ax, [Temps+12]
  call Bare_put_char
  mov [Temps+30], ax
  mov ax, [Temps+16]
  call Bare_put_char
  mov [Temps+32], ax
  mov ax, [Temps+8]
  call Bare_put_char
  mov [Temps+34], ax
  mov ax, `\n`
  call Bare_put_char
  mov [Temps+36], ax
  mov ax, [Temps+16]
  call Bare_put_char
  mov [Temps+38], ax
  mov ax, [Temps+8]
  call Bare_put_char
  mov [Temps+40], ax
  mov ax, [Temps+12]
  call Bare_put_char
  mov [Temps+42], ax
  mov ax, `\n`
  call Bare_put_char
  mov [Temps+44], ax
  mov ax, [Temps+8]
  call Bare_put_char
  mov [Temps+46], ax
  mov ax, [Temps+12]
  call Bare_put_char
  mov [Temps+48], ax
  mov ax, [Temps+16]
  call Bare_put_char
  mov [Temps+50], ax
  mov ax, `\n`
  call Bare_put_char
  mov [Temps+52], ax
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
