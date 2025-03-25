
Ocaml REPL

  $ ../ocaml/bin/fib.exe
  [ocaml]
  fib 20 --> 6765
  [HALT]

Haskell REPL

  $ ../haskell/main.exe ../examples/fib.fun -0
  [stage0]
  fib 20 --> 6765
  [HALT]

  $ ../haskell/main.exe ../examples/fib.fun -1u
  [stage1; un-normalized]
  fib 20 --> 6765
  [HALT]

  $ ../haskell/main.exe ../examples/fib.fun -2u
  [stage2; un-normalized]
  fib 20 --> 6765
  [HALT]

  $ ../haskell/main.exe ../examples/fib.fun -3u
  [stage3; un-normalized]
  fib 20 --> 6765
  [HALT]
