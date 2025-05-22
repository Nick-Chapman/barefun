Use the haskell emulator for a smaller filesystem test

  $ cat ../inputs/fs.short-input | ../../haskell/main.exe ../../examples/filesystem.fun
  Filesystem explorer
  Try: help dump sector format mount unmount debug ls stat cat rm create append splat wipe
  1> format
  2> mount
  3> ls
  4> create
  Creating file 0; (to finish type ^D)
  Just a small amount of text.
  ^D
  5> 
  6> ls
  file 0 : 29
  7> cat 0
  Just a small amount of text.
  8> append 0
  Appending to file 0; (to finish type ^D)
  Another line.
  ^D
  9> 
  10> cat 0
  Just a small amount of text.
  Another line.
  11> [EOF]
