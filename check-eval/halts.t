
Ocaml REPL

  $ cat halts.input | ../ocaml/bin/halts.exe
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
  XhYeZ[HALT:#apps=8]

  $ cat halts.input | ../haskell/main.exe ../examples/halts.fun -3u
  [stage3; un-normalized]
  XhYeZ[HALT:#apps=8]


  $ cat halts.input | ../haskell/main.exe ../examples/halts.fun -1
  [stage1]
  XhYeZ[HALT:#apps=0]

  $ cat halts.input | ../haskell/main.exe ../examples/halts.fun -2
  [stage2]
  XhYeZ[HALT:#apps=0]

  $ cat halts.input | ../haskell/main.exe ../examples/halts.fun -3
  [stage3]
  XhYeZ[HALT:#apps=0]

  $ cat halts.input | ../haskell/main.exe ../examples/halts.fun
  [stage3]
  XhYeZ[HALT:#apps=0]
