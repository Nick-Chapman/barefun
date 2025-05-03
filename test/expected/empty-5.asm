L1: ; Start
  Bare_enter_check(0)
  mov dx, g1
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]

g1:
  dw 0

bare_start: jmp L1
