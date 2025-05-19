
  $ cat ../inputs/readline.input | ../../haskell/main.exe ../../examples/readline.fun
  Readline: edit with backspace; exit with ^D.
  % Readline testing. Send all chars 0..127...
  Readline testing. Send all chars 0..127...
  % ^@^A^B^C^D
  ^@^A^B^C^D
  % ^E^F^G^I
  ^E^F^G^I
  % ^K^L^M^N^O^P^Q^R^S^T^U^V^W^X^Y^Z\1b\1c\1d\1e\1f !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~ 
  ^K^L^M^N^O^P^Q^R^S^T^U^V^W^X^Y^Z\1b\1c\1d\1e\1f !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}
  % DONE.[EOF]
