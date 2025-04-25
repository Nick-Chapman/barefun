
Ocaml REPL

  $ cat small.input | ../ocaml/bin/main.exe Small
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
  > [EOF:#apps=549, #prim=172]

  $ cat small.input | ../haskell/main.exe ../examples/small.fun -1
  [Stage1 (Exp)]
  LOAD
  RUN
  > Hello, World!
  Hello, World!
  > Good bye.
  Good bye.
  > [EOF:#apps=549, #prim=172]

  $ cat small.input | ../haskell/main.exe ../examples/small.fun -2
  [Stage2 (NbE); post normalization size: 171]
  LOAD
  RUN
  > Hello, World!
  Hello, World!
  > Good bye.
  Good bye.
  > [EOF:#apps=160, #prim=162]

  $ cat small.input | ../haskell/main.exe ../examples/small.fun -3
  [Stage3 (ANF); post normalization size: 171]
  LOAD
  RUN
  > Hello, World!
  Hello, World!
  > Good bye.
  Good bye.
  > [EOF:#push-continuation=60, #enter=160, #return=58, #prim=162]

  $ cat small.input | ../haskell/main.exe ../examples/small.fun -4
  [Stage4 (CCF); post normalization size: 171]
  LOAD
  RUN
  > Hello, World!
  Hello, World!
  > Good bye.
  Good bye.
  > [EOF:#push-continuation=60, #enter=160, #return=58, #prim=162]

  $ cat small.input | ../haskell/main.exe ../examples/small.fun -5
  [Stage5 (ASM); post normalization size: 171]
  LOAD
  RUN
  > Hello, World!
  Hello, World!
  > Good bye.
  Good bye.
  > [EOF:#op=2632, #alloc=424]
