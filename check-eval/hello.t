
Ocaml REPL

  $ ../ocaml/bin/main.exe Hello
  [ocaml]
  Hello, world!
  [HALT]

Haskell REPL

  $ ../haskell/main.exe ../examples/hello.fun -0
  [Stage0 (AST)]
  Hello, world!
  [HALT:#apps=33, #prim=15]

  $ ../haskell/main.exe ../examples/hello.fun -4
  [Stage4 (CCF); normalization: 108 -> 24]
  Hello, world!
  [HALT:#push-continuation=1, #enter=16, #return=2, #prim=15]

  $ ../haskell/main.exe ../examples/hello.fun -5
  [Stage5 (ASM); normalization: 108 -> 24]
  Hello, world!
  [HALT:#op=374]
