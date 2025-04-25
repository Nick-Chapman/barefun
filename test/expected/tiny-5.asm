L1: ; Function: g1
  call Bare_get_char
  mov [2], ax
  mov ax, [2]
  call Bare_put_char
  mov [4], ax
  mov ax, [2]
  call Bare_put_char
  mov [6], ax
  ;; (7'13) Tail: mainloop (g1) @ con_7'13 (g3)
  mov bp, g1
  mov dx, g3
  mov ax, [bp]
  jmp ax

L2: ; Start
  ;; (0'0) Tail: mainloop (g1) @ con_0'0 (g4)
  mov bp, g1
  mov dx, g4
  mov ax, [bp]
  jmp ax

g1: dw L1
g2: dw 0
g3: dw 0
g4: dw 0

bare_start: jmp L2
