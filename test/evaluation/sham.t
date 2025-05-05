
  $ cat ../inputs/sham.input | ../../haskell/main.exe -measure ../examples/sham.fun
  [Stage5 (ASM); post normalization size: 2268]
  Sham: In-memory file-system. Consider typing "ls".
  {1302}% ls
  readme cat cp create file ls man mv rm cat fib space
  {1302}% cat readme
  Welcome to sham; please try all the commands!
  Can you find the hidden Easter Egg?
  {1302}% fib 5
  fib 0 --> 0
  fib 1 --> 1
  fib 2 --> 1
  fib 3 --> 2
  fib 4 --> 3
  fib 5 --> 5
  {1302}% mv cat cat2
  {1294}% cat2 cat
  I have a little shadow that goes in and out with me,
  And what can be the use of him is more than I can see.
  He is very, very like me from the heels up to the head;
  And I see him jump before me, when I jump into my bed.
  {1294}% [EOF:#op=80867, #alloc=32542, #gc=17, #copied=12364]
