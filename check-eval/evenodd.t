
Ocaml REPL

  $ ../ocaml/bin/main.exe Evenodd
  [ocaml]
  EO[HALT]

Haskell REPL

  $ ../haskell/main.exe ../examples/evenodd.fun -4
  [Stage4 (CCF); normalization: 121 -> 42]
  EO[HALT:#push-continuation=4, #enter=29, #return=5, #prim=114]

  $ ../haskell/main.exe ../examples/evenodd.fun -5
  [Stage5 (ASM); normalization: 121 -> 42]
  EO[HALT:#op=868]
