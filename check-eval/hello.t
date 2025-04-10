
Ocaml REPL

  $ ../ocaml/bin/main.exe Hello
  [ocaml]
  Hello, world!
  [HALT]

Haskell REPL

  $ ../haskell/main.exe ../examples/hello.fun -0
  [Stage0 (AST)]
  Hello, world!
  [HALT:#apps=179, #prim=59]

  $ ../haskell/main.exe ../examples/hello.fun -4
  [Stage4 (CCF); normalization: 132 -> 39]
  Hello, world!
  [HALT:#push-continuation=16, #enter=45, #return=17, #prim=57]

  $ ../haskell/main.exe ../examples/hello.fun -5
  [Stage5 (ASM); normalization: 132 -> 39]
  Hello, world!
  [HALT:#op=834]
