
Ocaml REPL

  $ ../ocaml/bin/main.exe Bytes
  [ocaml]
  One
  \000\000\000\000\000Two
  [HALT]


Haskell REPL

  $ ../haskell/main.exe ../examples/bytes.fun -4
  [Stage4 (CCF); post normalization size: 130]
  One
  \NUL\NUL\NUL\NUL\NULTwo
  [HALT:#push-continuation=35, #enter=73, #return=36, #prim=77]

  $ ../haskell/main.exe ../examples/bytes.fun -5
  [Stage5 (ASM); post normalization size: 130]
  One
  \NUL\NUL\NUL\NUL\NULTwo
  [HALT:#op=1286]
