
Ocaml REPL

  $ ../ocaml/bin/main.exe Fib
  [ocaml]
  fib 20 --> 6765
  [HALT]

Haskell REPL

  $ ../haskell/main.exe ../examples/fib.fun -0
  [Stage0 (AST)]
  fib 20 --> 6765
  [HALT:#apps=131591, #prim=54811]

  $ ../haskell/main.exe ../examples/fib.fun -1
  [Stage1 (Exp)]
  fib 20 --> 6765
  [HALT:#apps=131591, #prim=54811]

  $ ../haskell/main.exe ../examples/fib.fun -2
  [Stage2 (NbE); normalization: 220 -> 167]
  fib 20 --> 6765
  [HALT:#apps=21948, #prim=54804]

  $ ../haskell/main.exe ../examples/fib.fun -3
  [Stage3 (ANF); normalization: 220 -> 167]
  fib 20 --> 6765
  [HALT:#push-continuation=21918, #enter=21948, #return=21919, #prim=54804]

  $ ../haskell/main.exe ../examples/fib.fun -4
  [Stage4 (CCF); normalization: 220 -> 167]
  fib 20 --> 6765
  [HALT:#push-continuation=21918, #enter=21948, #return=21919, #prim=54804]

  $ ../haskell/main.exe ../examples/fib.fun -5
  [Stage5 (ASM); normalization: 220 -> 167]
  fib 20 --> 6765
  [HALT:#op=537462]
