
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
  % [EOF:#op=779]

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
  % This is line one.
  % Another
  % And one more!
  % [EOF:#op=785]
