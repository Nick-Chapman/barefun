
Testing two different versions (A,B)...

Ocaml (A and B)

  $ cat prompt.input | ../ocaml/bin/main.exe PromptA
  [ocaml]
  % This is line one.
  % Another
  % And one more!
  % [EOF]

  $ cat prompt.input | ../ocaml/bin/main.exe PromptB
  [ocaml]
  % This is line one.
  % Another
  % And one more!
  % [EOF]

Haskell (A)

  $ cat prompt.input | ../haskell/main.exe ../examples/promptA.fun -4
  [Stage4 (CCF); normalization: 113 -> 31]
  % This is line one.
  % Another
  % And one more!
  % [EOF:#enter=45, #prim=129]

  $ cat prompt.input | ../haskell/main.exe ../examples/promptA.fun -5
  [Stage5 (ASM); normalization: 113 -> 31]
  % This is line one.
  % Another
  % And one more!
  % [EOF:]

Haskell (B)

  $ cat prompt.input | ../haskell/main.exe ../examples/promptB.fun -4
  [Stage4 (CCF); normalization: 109 -> 31]
  % This is line one.
  % Another
  % And one more!
  % [EOF:#enter=45, #prim=129]

TODO: promptB/-5
  $ cat prompt.input | ../haskell/main.exe ../examples/promptB.fun -5
  [Stage5 (ASM); normalization: 109 -> 31]
  main.exe: ("deMemAddr",'%')
  CallStack (from HasCallStack):
    error, called at src/Stage5_ASM.hs:468:41 in barefun-0.1.0.0-6XcQLzyaMgy6j7vUcK2FKm:Stage5_ASM
  [1]
