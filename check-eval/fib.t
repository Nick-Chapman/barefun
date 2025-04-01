
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

  $ ../haskell/main.exe ../examples/fib.fun -2u
  [stage2; un-normalized]
  fib 20 --> 6765
  [HALT:#push-continuation=120505, #enter=131487, #return=120506, #prim=54780]

  $ ../haskell/main.exe ../examples/fib.fun -3u
  [stage3; un-normalized]
  fib 20 --> 6765
  [HALT:#push-continuation=120505, #enter=131487, #return=120506, #prim=54780]

  $ ../haskell/main.exe ../examples/fib.fun -1
  [stage1; normalization: 187 -> 145]
  fib 20 --> 6765
  [HALT:#apps=32877, #prim=54780]

  $ ../haskell/main.exe ../examples/fib.fun -2
  [stage2; normalization: 187 -> 145]
  fib 20 --> 6765
  [HALT:#push-continuation=21911, #enter=32877, #return=21912, #prim=54780]

  $ ../haskell/main.exe ../examples/fib.fun -3
  [stage3; normalization: 187 -> 145]
  fib 20 --> 6765
  [HALT:#push-continuation=21911, #enter=32877, #return=21912, #prim=54775]

  $ ../haskell/main.exe ../examples/fib.fun
  [stage3; normalization: 187 -> 145]
  fib 20 --> 6765
  [HALT:#push-continuation=21911, #enter=32877, #return=21912, #prim=54775]
