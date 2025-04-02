
Ocaml REPL

  $ cat tiny.input | ../ocaml/bin/main.exe Tiny
  [ocaml]
  HHeelllloo,,
  
  WWoorrlldd!!
  
  [EOF]

Haskell REPL

  $ cat tiny.input | ../haskell/main.exe ../examples/tiny.fun -0
  [Stage0 (AST)]
  HHeelllloo,,
  
  WWoorrlldd!!
  
  [EOF:#apps=58, #prim=43]

  $ cat tiny.input | ../haskell/main.exe ../examples/tiny.fun -1
  [Stage1 (Exp)]
  HHeelllloo,,
  
  WWoorrlldd!!
  
  [EOF:#apps=58, #prim=43]

  $ cat tiny.input | ../haskell/main.exe ../examples/tiny.fun -2
  [Stage2 (NbE); normalization: 92 -> 16]
  HHeelllloo,,
  
  WWoorrlldd!!
  
  [EOF:#apps=15, #prim=43]

  $ cat tiny.input | ../haskell/main.exe ../examples/tiny.fun -3
  [Stage3 (ANF); normalization: 92 -> 16]
  HHeelllloo,,
  
  WWoorrlldd!!
  
  [EOF:#enter=15, #prim=43]

  $ cat tiny.input | ../haskell/main.exe ../examples/tiny.fun -4
  [Stage4 (CCF); normalization: 92 -> 16]
  HHeelllloo,,
  
  WWoorrlldd!!
  
  [EOF:#enter=15, #prim=43]
