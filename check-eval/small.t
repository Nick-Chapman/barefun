
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
  [stage0]
  LOAD
  RUN
  > Hello, World!
  Hello, World!
  > Good bye.
  Good bye.
  > [EOF:#apps=364, #prim=117]

  $ cat small.input | ../haskell/main.exe ../examples/small.fun -1u
  [stage1; un-normalized]
  LOAD
  RUN
  > Hello, World!
  Hello, World!
  > Good bye.
  Good bye.
  > [EOF:#apps=364, #prim=117]

  $ cat small.input | ../haskell/main.exe ../examples/small.fun -2u
  [stage2; un-normalized]
  LOAD
  RUN
  > Hello, World!
  Hello, World!
  > Good bye.
  Good bye.
  > [EOF:#push-continuation=264, #enter=364, #return=261, #prim=117]

  $ cat small.input | ../haskell/main.exe ../examples/small.fun -3u
  [stage3; un-normalized]
  LOAD
  RUN
  > Hello, World!
  Hello, World!
  > Good bye.
  Good bye.
  > [EOF:#push-continuation=264, #enter=364, #return=261, #prim=117]


  $ cat small.input | ../haskell/main.exe ../examples/small.fun -1
  [stage1; normalization: 176 -> 107]
  LOAD
  RUN
  > Hello, World!
  Hello, World!
  > Good bye.
  Good bye.
  > [EOF:#apps=120, #prim=117]

  $ cat small.input | ../haskell/main.exe ../examples/small.fun -2
  [stage2; normalization: 176 -> 107]
  LOAD
  RUN
  > Hello, World!
  Hello, World!
  > Good bye.
  Good bye.
  > [EOF:#push-continuation=35, #enter=120, #return=33, #prim=117]

  $ cat small.input | ../haskell/main.exe ../examples/small.fun -3
  [stage3; normalization: 176 -> 107]
  LOAD
  RUN
  > Hello, World!
  Hello, World!
  > Good bye.
  Good bye.
  > [EOF:#push-continuation=35, #enter=120, #return=33, #prim=112]

  $ cat small.input | ../haskell/main.exe ../examples/small.fun
  [stage3; normalization: 176 -> 107]
  LOAD
  RUN
  > Hello, World!
  Hello, World!
  > Good bye.
  Good bye.
  > [EOF:#push-continuation=35, #enter=120, #return=33, #prim=112]
