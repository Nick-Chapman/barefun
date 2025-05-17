L1: ; Start
  Bare_enter_check(0)
  mov ax, `@`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+2], ax
  mov ax, `A`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+4], ax
  mov ax, `B`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+6], ax
  mov ax, `C`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+8], ax
  mov ax, `D`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+10], ax
  mov ax, `E`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+12], ax
  mov ax, `F`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+14], ax
  mov ax, `G`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+16], ax
  mov ax, `H`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+18], ax
  mov ax, `I`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+20], ax
  mov ax, `J`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+22], ax
  mov ax, `K`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+24], ax
  mov ax, `L`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+26], ax
  mov ax, `M`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+28], ax
  mov ax, `N`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+30], ax
  mov ax, `O`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+32], ax
  mov ax, `P`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+34], ax
  mov ax, `Q`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+36], ax
  mov ax, `R`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+38], ax
  mov ax, `S`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+40], ax
  mov ax, `T`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+42], ax
  mov ax, `U`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+44], ax
  mov ax, `V`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+46], ax
  mov ax, `W`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+48], ax
  mov ax, `X`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+50], ax
  mov ax, `Y`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+52], ax
  mov ax, `Z`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+54], ax
  mov ax, `[`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+56], ax
  mov ax, `\n`
  call Bare_put_char
  mov ax, Bare_unit
  mov [Temps+58], ax
  mov si, [Temps+58]
  mov bp, [CurrentCont]
  mov ax, [bp+2]
  mov [CurrentCont], ax
  jmp [bp]


bare_start: jmp L1
