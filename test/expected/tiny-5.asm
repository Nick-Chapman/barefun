L1: ; Function: (mainloop,g1)
  Bare_enter_check(0)
  call Bare_get_char
  mov si, ax
  mov ax, si
  call Bare_put_char
  mov di, Bare_unit
  mov ax, si
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov bp, g1
  mov dx, g3
  jmp [bp]

L2: ; Start
  Bare_enter_check(0)
  mov bp, g1
  mov dx, g4
  jmp [bp]

g1:
  dw L1
g2:
  dw 0
g3:
  dw 0
g4:
  dw 0

bare_start: jmp L2
