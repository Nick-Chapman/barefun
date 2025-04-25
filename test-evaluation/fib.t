
Ocaml REPL

  $ ../ocaml/bin/main.exe Fib
  fib 10 --> 55
  [HALT]

Haskell REPL

  $ ../haskell/main.exe ../examples/fib.fun -0
  [Stage0 (AST)]
  fib 10 --> 55
  [HALT:#apps=1275, #prim=514]

  $ ../haskell/main.exe ../examples/fib.fun -1
  [Stage1 (Exp)]
  fib 10 --> 55
  [HALT:#apps=1275, #prim=514]

  $ ../haskell/main.exe ../examples/fib.fun -2
  [Stage2 (NbE); post normalization size: 167]
  fib 10 --> 55
  [HALT:#apps=228, #prim=507]

  $ ../haskell/main.exe ../examples/fib.fun -3
  [Stage3 (ANF); post normalization size: 167]
  fib 10 --> 55
  [HALT:#push-continuation=202, #enter=228, #return=203, #prim=507]

  $ ../haskell/main.exe ../examples/fib.fun -4
  [Stage4 (CCF); post normalization size: 167]
  fib 10 --> 55
  [HALT:#push-continuation=202, #enter=228, #return=203, #prim=507]

  $ ../haskell/main.exe ../examples/fib.fun -5
  [Stage5 (ASM); post normalization size: 167]
  fib 10 --> 55
  [HALT:#op=5258, #alloc=676]
