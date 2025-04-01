
Ocaml REPL

  $ cat tiny.input | ../ocaml/bin/main.exe Tiny
  [ocaml]
  HHeelllloo,,
  
  WWoorrlldd!!
  
  [EOF]

Haskell REPL

  $ cat tiny.input | ../haskell/main.exe ../examples/tiny.fun -0
  [stage0]
  HHeelllloo,,
  
  WWoorrlldd!!
  
  [EOF:#apps=58, #prim=43]

  $ cat tiny.input | ../haskell/main.exe ../examples/tiny.fun -1u
  [stage1; un-normalized]
  HHeelllloo,,
  
  WWoorrlldd!!
  
  [EOF:#apps=58, #prim=43]

  $ cat tiny.input | ../haskell/main.exe ../examples/tiny.fun -2u
  [stage2; un-normalized]
  HHeelllloo,,
  
  WWoorrlldd!!
  
  [EOF:#push-continuation=43, #enter=58, #return=42, #prim=43]

  $ cat tiny.input | ../haskell/main.exe ../examples/tiny.fun -3u
  [stage3; un-normalized]
  HHeelllloo,,
  
  WWoorrlldd!!
  
  [EOF:#push-continuation=43, #enter=58, #return=42, #prim=43]

  $ cat tiny.input | ../haskell/main.exe ../examples/tiny.fun -1
  [stage1; normalization: 92 -> 16]
  HHeelllloo,,
  
  WWoorrlldd!!
  
  [EOF:#apps=15, #prim=43]

  $ cat tiny.input | ../haskell/main.exe ../examples/tiny.fun -2
  [stage2; normalization: 92 -> 16]
  HHeelllloo,,
  
  WWoorrlldd!!
  
  [EOF:#enter=15, #prim=43]

  $ cat tiny.input | ../haskell/main.exe ../examples/tiny.fun -3
  [stage3; normalization: 92 -> 16]
  HHeelllloo,,
  
  WWoorrlldd!!
  
  [EOF:#enter=15, #prim=43]

  $ cat tiny.input | ../haskell/main.exe ../examples/tiny.fun
  [stage3; normalization: 92 -> 16]
  HHeelllloo,,
  
  WWoorrlldd!!
  
  [EOF:#enter=15, #prim=43]
