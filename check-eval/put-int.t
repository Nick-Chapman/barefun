
Ocaml REPL

  $ ../ocaml/bin/main.exe Put_int
  [ocaml]
  42[HALT]

Haskell REPL

  $ ../haskell/main.exe ../examples/put_int.fun -4
  [Stage4 (CCF); normalization: 141 -> 46]
  42[HALT:#push-continuation=4, #enter=9, #return=5, #prim=13]

  $ ../haskell/main.exe ../examples/put_int.fun -5
  [Stage5 (ASM); normalization: 141 -> 46]
  42[HALT:#op=179]
