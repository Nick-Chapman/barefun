
Ocaml REPL

  $ ../ocaml/bin/main.exe Fib
  [ocaml]
  fib 20 --> 6765
  [HALT]

Haskell REPL

  $ ../haskell/main.exe ../examples/fib.fun -0
  [Stage0 (AST)]
  fib 20 --> 6765
  [HALT:#apps=131487, #prim=54780]

  $ ../haskell/main.exe ../examples/fib.fun -1
  [Stage1 (Exp)]
  fib 20 --> 6765
  [HALT:#apps=131487, #prim=54780]

  $ ../haskell/main.exe ../examples/fib.fun -2
  [Stage2 (NbE); normalization: 187 -> 139]
  fib 20 --> 6765
  [HALT:#apps=21926, #prim=54775]

  $ ../haskell/main.exe ../examples/fib.fun -3
  [Stage3 (ANF); normalization: 187 -> 139]
  fib 20 --> 6765
  [HALT:#push-continuation=21905, #enter=21926, #return=21906, #prim=54775]

  $ ../haskell/main.exe ../examples/fib.fun -4
  [Stage4 (CCF); normalization: 187 -> 139]
  fib 20 --> 6765
  [HALT:#push-continuation=21905, #enter=21926, #return=21906, #prim=54775]

  $ ../haskell/main.exe ../examples/fib.fun -5
  [Stage5 (ASM); normalization: 187 -> 139]
  fib 20 --> 6765
  [HALT:#op=602870]
