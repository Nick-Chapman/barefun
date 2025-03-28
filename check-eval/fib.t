
Ocaml REPL

  $ ../ocaml/bin/fib.exe
  [ocaml]
  fib 20 --> 6765
  [HALT]

Haskell REPL

  $ ../haskell/main.exe ../examples/fib.fun -0
  [stage0]
  fib 20 --> 6765
  [HALT:#apps=131487]

  $ ../haskell/main.exe ../examples/fib.fun -1u
  [stage1; un-normalized]
  fib 20 --> 6765
  [HALT:#apps=131487]

  $ ../haskell/main.exe ../examples/fib.fun -2u
  [stage2; un-normalized]
  fib 20 --> 6765
  [HALT:#push-continuation=120505, #enter=131487, #return=120506]

  $ ../haskell/main.exe ../examples/fib.fun -3u
  [stage3; un-normalized]
  fib 20 --> 6765
  [HALT:#push-continuation=120505, #enter=131487, #return=120506]

  $ ../haskell/main.exe ../examples/fib.fun -1
  [stage1]
  fib 20 --> 6765
  [HALT:#apps=32877]

  $ ../haskell/main.exe ../examples/fib.fun -2
  [stage2]
  fib 20 --> 6765
  [HALT:#push-continuation=21911, #enter=32877, #return=21912]

  $ ../haskell/main.exe ../examples/fib.fun -3
  [stage3]
  fib 20 --> 6765
  [HALT:#push-continuation=21911, #enter=32877, #return=21912]

  $ ../haskell/main.exe ../examples/fib.fun
  [stage3]
  fib 20 --> 6765
  [HALT:#push-continuation=21911, #enter=32877, #return=21912]
