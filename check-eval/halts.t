
Ocaml REPL

  $ cat halts.input | ../ocaml/bin/main.exe Halts
  [ocaml]
  XhYeZ[HALT]

Haskell REPL

  $ cat halts.input | ../haskell/main.exe ../examples/halts.fun -0
  [stage0]
  XhYeZ[HALT:#apps=8]

  $ cat halts.input | ../haskell/main.exe ../examples/halts.fun -1u
  [stage1; un-normalized]
  XhYeZ[HALT:#apps=8]

  $ cat halts.input | ../haskell/main.exe ../examples/halts.fun -2u
  [stage2; un-normalized]
  XhYeZ[HALT:#push-continuation=6, #enter=8, #return=7]

  $ cat halts.input | ../haskell/main.exe ../examples/halts.fun -3u
  [stage3; un-normalized]
  XhYeZ[HALT:#push-continuation=6, #enter=8, #return=7]


  $ cat halts.input | ../haskell/main.exe ../examples/halts.fun -1
  [stage1; normalization: 94 -> 32]
  XhYeZ[HALT:]

  $ cat halts.input | ../haskell/main.exe ../examples/halts.fun -2
  [stage2; normalization: 94 -> 32]
  XhYeZ[HALT:#return=1]

  $ cat halts.input | ../haskell/main.exe ../examples/halts.fun -3
  [stage3; normalization: 94 -> 32]
  XhYeZ[HALT:#return=1]

  $ cat halts.input | ../haskell/main.exe ../examples/halts.fun
  [stage3; normalization: 94 -> 32]
  XhYeZ[HALT:#return=1]
