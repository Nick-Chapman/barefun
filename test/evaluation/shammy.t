
  $ cat ../inputs/shammy.input | ../../haskell/main.exe -measure ../examples/shammy.fun
  [Stage5 (ASM); post normalization size: 1148]
  Shammy: In-memory file-system. Consider typing "ls".
  % xxx
  sham: xxx: command not found
  % ls
  readme cat ls fib
  % readme
  sham: readme: Permission denied
  % cat
  cat: takes at least one argument
  % cat readme
  Welcome to sham; please try all the commands!
  % cat cat
  cat: cat : Not a data file
  % fib
  fib: missing argument
  % fib help
  fib: expected numeric argument
  % fib help me
  create: unexpected extra argument
  % fib 10
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
  % [EOF:#op=116969, #alloc=22957]
