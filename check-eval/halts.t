
Ocaml REPL

  $ cat halts.input | ../ocaml/bin/main.exe Halts
  [ocaml]
  XhYeZ[HALT]

Haskell REPL

  $ cat halts.input | ../haskell/main.exe ../examples/halts.fun -0
  [stage0]
  XhYeZ[HALT:#apps=8, #prim=7]

  $ cat halts.input | ../haskell/main.exe ../examples/halts.fun -1u
  [stage1; un-normalized]
  XhYeZ[HALT:#apps=8, #prim=7]

  $ cat halts.input | ../haskell/main.exe ../examples/halts.fun -1
  [stage1; normalization: 94 -> 20]
  XhYeZ[HALT:#prim=7]

  $ cat halts.input | ../haskell/main.exe ../examples/halts.fun -2
  [stage2; normalization: 94 -> 20]
  XhYeZ[HALT:#return=1, #prim=7]

  $ cat halts.input | ../haskell/main.exe ../examples/halts.fun -3
  [stage3; normalization: 94 -> 20]
  XhYeZ[HALT:#return=1, #prim=7]
