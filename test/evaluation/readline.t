
  $ cat ../inputs/readline.input | ../../haskell/main.exe -measure ../examples/readline.fun
  [Stage5 (ASM); post normalization size: 786]
  Readline: edit with backspace; exit with ^D.
  % Readline testing. Send all chars 0..127...
  Readline testing. Send all chars 0..127...
  % ^@^A^B^C^D
  ^@^A^B^C^D
  % ^E^F^G^I
  ^E^F^G^I
  % ^K^L^M^N^O^P^Q^R^S^T^U^V^W^X^Y^Z !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~ 
  ^K^L^M^N^O^P^Q^R^S^T^U^V^W^X^Y^Z !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}
  % DONE.[EOF:#op=121935, #alloc=56164, #gc=21, #copied=9486]
