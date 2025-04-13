
Ocaml REPL

  $ ../ocaml/bin/main.exe Tree
  [ocaml]
  955[HALT]

Haskell REPL

  $ ../haskell/main.exe ../examples/tree.fun -4
  [Stage4 (CCF); post normalization size: 95]
  955[HALT:#push-continuation=10, #enter=17, #return=11, #prim=22]

  $ ../haskell/main.exe ../examples/tree.fun -5
  [Stage5 (ASM); post normalization size: 95]
  955[HALT:#op=359]
