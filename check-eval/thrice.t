
  $ cat thrice.input | ../ocaml/bin/main.exe Thrice
  [ocaml]
  @ABCDEFGHIJKLMNOPQRSTUVWXYZ[
  [HALT]

  $ cat thrice.input | ../haskell/main.exe ../examples/thrice.fun -0
  [Stage0 (AST)]
  @ABCDEFGHIJKLMNOPQRSTUVWXYZ[
  [HALT:#apps=158, #prim=85]

  $ cat thrice.input | ../haskell/main.exe ../examples/thrice.fun -1
  [Stage1 (Exp)]
  @ABCDEFGHIJKLMNOPQRSTUVWXYZ[
  [HALT:#apps=158, #prim=85]

  $ cat thrice.input | ../haskell/main.exe ../examples/thrice.fun -2
  [Stage2 (NbE); normalization: 106 -> 86]
  @ABCDEFGHIJKLMNOPQRSTUVWXYZ[
  [HALT:#prim=29]

  $ cat thrice.input | ../haskell/main.exe ../examples/thrice.fun -3
  [Stage3 (ANF); normalization: 106 -> 86]
  @ABCDEFGHIJKLMNOPQRSTUVWXYZ[
  [HALT:#return=1, #prim=29]

  $ cat thrice.input | ../haskell/main.exe ../examples/thrice.fun -4
  [Stage4 (CCF); normalization: 106 -> 86]
  @ABCDEFGHIJKLMNOPQRSTUVWXYZ[
  [HALT:#return=1, #prim=29]

  $ cat thrice.input | ../haskell/main.exe ../examples/thrice.fun -5
  [Stage5 (ASM); normalization: 106 -> 86]
  @ABCDEFGHIJKLMNOPQRSTUVWXYZ[
  [HALT:#op=151]
