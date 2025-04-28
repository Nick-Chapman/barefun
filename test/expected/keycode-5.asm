L1: ; Function: g1
  call Bare_get_char
  mov [Temps+2], ax
  mov ax, [Temps+2]
  call Bare_put_char
  mov [Temps+4], ax
  mov bp, g1
  mov dx, g3
  jmp [bp]

L2: ; Start
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
