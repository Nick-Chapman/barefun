
  $ cat ../inputs/sham.input | ../../haskell/main.exe -measure ../examples/sham.fun
  [Stage5 (ASM); post normalization size: 2163]
  Sham: In-memory file-system. Consider typing "ls".
  % ls
  readme cat cp create file ls man mv rm cat fib space
  % cat readme
  Welcome to sham; please try all the commands!
  Can you find the hidden Easter Egg?
  % fib 5
  fib 0 --> 0
  fib 1 --> 1
  fib 2 --> 1
  fib 3 --> 2
  fib 4 --> 3
  fib 5 --> 5
  % mv cat cat2
  % cat2 cat
  I have a little shadow that goes in and out with me,
  And what can be the use of him is more than I can see.
  He is very, very like me from the heels up to the head;
  And I see him jump before me, when I jump into my bed.
  % [EOF:#op=65691, #alloc=30406]
