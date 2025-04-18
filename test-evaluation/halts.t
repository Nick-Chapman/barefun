
Ocaml REPL

  $ cat halts.input | ../ocaml/bin/main.exe Halts
  [ocaml]
  XhYeZ[HALT]

Haskell REPL

  $ cat halts.input | ../haskell/main.exe ../examples/halts.fun -0
  [Stage0 (AST)]
  XhYeZ[HALT:#apps=8, #prim=7]

  $ cat halts.input | ../haskell/main.exe ../examples/halts.fun -1
  [Stage1 (Exp)]
  XhYeZ[HALT:#apps=8, #prim=7]

  $ cat halts.input | ../haskell/main.exe ../examples/halts.fun -2
  [Stage2 (NbE); post normalization size: 20]
  XhYeZ[HALT:#prim=7]

  $ cat halts.input | ../haskell/main.exe ../examples/halts.fun -3
  [Stage3 (ANF); post normalization size: 20]
  XhYeZ[HALT:#return=1, #prim=7]

  $ cat halts.input | ../haskell/main.exe ../examples/halts.fun -4
  [Stage4 (CCF); post normalization size: 20]
  XhYeZ[HALT:#return=1, #prim=7]

  $ cat halts.input | ../haskell/main.exe ../examples/halts.fun -5
  [Stage5 (ASM); post normalization size: 20]
  XhYeZ[HALT:#op=25]
