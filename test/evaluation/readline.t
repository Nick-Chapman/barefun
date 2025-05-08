
  $ cat ../inputs/readline.input | ../../haskell/main.exe -measure ../examples/readline.fun
  [Stage5 (ASM); post normalization size: 786]
  Readline: edit with backspace; exit with ^D.
  % Hello, world!
  Hello, world!
  % 123
  123
  % ^A^B
  ^A^B
  % Done
  Done
  % [EOF:#op=18748, #alloc=7860, #gc=2, #copied=220]
