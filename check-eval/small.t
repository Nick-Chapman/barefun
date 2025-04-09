
Ocaml REPL

  $ cat small.input | ../ocaml/bin/main.exe Small
  [ocaml]
  LOAD
  RUN
  > Hello, World!
  Hello, World!
  > Good bye.
  Good bye.
  > [EOF]

Haskell REPL

  $ cat small.input | ../haskell/main.exe ../examples/small.fun -0
  [Stage0 (AST)]
  LOAD
  RUN
  > Hello, World!
  Hello, World!
  > Good bye.
  Good bye.
  > [EOF:#apps=364, #prim=117]

  $ cat small.input | ../haskell/main.exe ../examples/small.fun -1
  [Stage1 (Exp)]
  LOAD
  RUN
  > Hello, World!
  Hello, World!
  > Good bye.
  Good bye.
  > [EOF:#apps=364, #prim=117]

  $ cat small.input | ../haskell/main.exe ../examples/small.fun -2
  [Stage2 (NbE); normalization: 176 -> 113]
  LOAD
  RUN
  > Hello, World!
  Hello, World!
  > Good bye.
  Good bye.
  > [EOF:#apps=120, #prim=112]

  $ cat small.input | ../haskell/main.exe ../examples/small.fun -3
  [Stage3 (ANF); normalization: 176 -> 113]
  LOAD
  RUN
  > Hello, World!
  Hello, World!
  > Good bye.
  Good bye.
  > [EOF:#push-continuation=35, #enter=120, #return=33, #prim=112]

  $ cat small.input | ../haskell/main.exe ../examples/small.fun -4
  [Stage4 (CCF); normalization: 176 -> 113]
  LOAD
  RUN
  > Hello, World!
  Hello, World!
  > Good bye.
  Good bye.
  > [EOF:#push-continuation=35, #enter=120, #return=33, #prim=112]

  $ cat small.input | ../haskell/main.exe ../examples/small.fun -5
  [Stage5 (ASM); normalization: 176 -> 113]
  LOAD
  RUN
  > Hello, World!
  Hello, World!
  > Good bye.
  Good bye.
  > [EOF:#op=2028]
