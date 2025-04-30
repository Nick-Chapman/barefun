L1: ; Start
  mov ax, `@`
  call Bare_put_char
  mov ax, `A`
  call Bare_put_char
  mov ax, `B`
  call Bare_put_char
  mov ax, `C`
  call Bare_put_char
  mov ax, `D`
  call Bare_put_char
  mov ax, `E`
  call Bare_put_char
  mov ax, `F`
  call Bare_put_char
  mov ax, `G`
  call Bare_put_char
  mov ax, `H`
  call Bare_put_char
  mov ax, `I`
  call Bare_put_char
  mov ax, `J`
  call Bare_put_char
  mov ax, `K`
  call Bare_put_char
  mov ax, `L`
  call Bare_put_char
  mov ax, `M`
  call Bare_put_char
  mov ax, `N`
  call Bare_put_char
  mov ax, `O`
  call Bare_put_char
  mov ax, `P`
  call Bare_put_char
  mov ax, `Q`
  call Bare_put_char
  mov ax, `R`
  call Bare_put_char
  mov ax, `S`
  call Bare_put_char
  mov ax, `T`
  call Bare_put_char
  mov ax, `U`
  call Bare_put_char
  mov ax, `V`
  call Bare_put_char
  mov ax, `W`
  call Bare_put_char
  mov ax, `X`
  call Bare_put_char
  mov ax, `Y`
  call Bare_put_char
  mov ax, `Z`
  call Bare_put_char
  mov ax, `[`
  call Bare_put_char
  mov ax, `\n`
  call Bare_put_char
  mov dx, [Temps+58]
  mov bp, cx
  mov cx, [bp+2]
  jmp [bp]


bare_start: jmp L1
