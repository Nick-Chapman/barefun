
Ocaml REPL

  $ ../ocaml/bin/main.exe Fib
  [ocaml]
  fib 20 --> 6765
  [HALT]

Haskell REPL

  $ ../haskell/main.exe ../examples/fib.fun -0
  [stage0]
  fib 20 --> 6765
  [HALT:#apps=131487, #prim=54780]

  $ ../haskell/main.exe ../examples/fib.fun -1u
  [stage1; un-normalized]
  fib 20 --> 6765
  [HALT:#apps=131487, #prim=54780]

  $ ../haskell/main.exe ../examples/fib.fun -1
  [stage1; normalization: 187 -> 139]
  fib 20 --> 6765
  [HALT:#apps=21926, #prim=54775]

  $ ../haskell/main.exe ../examples/fib.fun -2
  [stage2; normalization: 187 -> 139]
  fib 20 --> 6765
  [HALT:#push-continuation=21905, #enter=21926, #return=21906, #prim=54775]

  $ ../haskell/main.exe ../examples/fib.fun -3
  [stage3; normalization: 187 -> 139]
  fib 20 --> 6765
  [HALT:#push-continuation=21905, #enter=21926, #return=21906, #prim=54775]
