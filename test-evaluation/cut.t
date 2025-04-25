
Ocaml REPL

  $ ../ocaml/bin/main.exe Cut
  4[HALT]

Haskell REPL

  $ ../haskell/main.exe ../examples/cut.fun -4
  [Stage4 (CCF); post normalization size: 20]
  4[HALT:#push-continuation=3, #enter=4, #return=4, #prim=4]


  $ ../haskell/main.exe ../examples/cut.fun -5
  [Stage5 (ASM); post normalization size: 20]
  4[HALT:#op=72, #alloc=10]
