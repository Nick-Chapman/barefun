
  $ cat ../inputs/sham.input | ../../haskell/main.exe -measure ../examples/sham.fun
  [Stage5 (ASM); post normalization size: 2004]
  Sham: In-memory file-system. Consider typing "ls".
  % xxx
  sham: xxx: command not found
  % ls
  readme cat cp create file ls man mv rm cat fib space
  % readme
  sham: readme: Permission denied
  % cat readme
  Welcome to sham; please try all the commands!
  Can you find the hidden Easter Egg?
  % man man
  man - an interface to the system reference manuals
  % cp ls xx
  % rm ls
  % ls
  sham: ls: command not found
  % xx
  xx readme cat cp create file man mv rm cat fib space
  % fib 15
  fib 0 --> 0
  fib 1 --> 1
  fib 2 --> 1
  fib 3 --> 2
  fib 4 --> 3
  fib 5 --> 5
  fib 6 --> 8
  fib 7 --> 13
  fib 8 --> 21
  fib 9 --> 34
  fib 10 --> 55
  fib 11 --> 89
  fib 12 --> 144
  fib 13 --> 233
  fib 14 --> 377
  fib 15 --> 610
  % mv cat cat2
  % cat2 cat
  I have a little shadow that goes in and out with me,
  And what can be the use of him is more than I can see.
  He is very, very like me from the heels up to the head;
  And I see him jump before me, when I jump into my bed.
  % [EOF:#op=274003, #alloc=91234]
