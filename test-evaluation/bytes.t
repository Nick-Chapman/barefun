
Ocaml REPL

  $ ../ocaml/bin/main.exe Bytes
  One
  \000\000\000\000\000Two
  [HALT]


Haskell REPL

  $ ../haskell/main.exe ../examples/bytes.fun -4
  [Stage4 (CCF); post normalization size: 130]
  One
  \000\000\000\000\000Two
  [HALT:#push-continuation=35, #enter=73, #return=36, #prim=77]

  $ ../haskell/main.exe ../examples/bytes.fun -5
  [Stage5 (ASM); post normalization size: 130]
  One
  \000\000\000\000\000Two
  [HALT:#op=1284, #alloc=262]
