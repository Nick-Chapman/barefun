
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
  % DONE.[EOF:#op=98828, #alloc=43868, #gc=17, #copied=7664]
