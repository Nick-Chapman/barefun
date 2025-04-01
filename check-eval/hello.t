
Ocaml REPL

  $ ../ocaml/bin/main.exe Hello
  [ocaml]
  Hello, world!
  [HALT]

Haskell REPL

  $ ../haskell/main.exe ../examples/hello.fun -0
  [stage0]
  Hello, world!
  [HALT:#apps=33, #prim=15]

  $ ../haskell/main.exe ../examples/hello.fun
  [stage3; normalization: 108 -> 24]
  Hello, world!
  [HALT:#push-continuation=1, #enter=16, #return=2, #prim=15]
