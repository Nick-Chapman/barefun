
Ocaml REPL

  $ cat halts.input | ../ocaml/bin/halts.exe
  [ocaml]
  XhYeZ[HALT]

Haskell REPL

  $ cat halts.input | ../haskell/main.exe ../examples/halts.fun -0
  [stage0]
  XhYeZ[HALT]

  $ cat halts.input | ../haskell/main.exe ../examples/halts.fun -1u
  [stage1; un-normalized]
  XhYeZ[HALT]

  $ cat halts.input | ../haskell/main.exe ../examples/halts.fun -2u
  [stage2; un-normalized]
  XhYeZ[HALT]

  $ cat halts.input | ../haskell/main.exe ../examples/halts.fun -3u
  [stage3; un-normalized]
  XhYeZ[HALT]
