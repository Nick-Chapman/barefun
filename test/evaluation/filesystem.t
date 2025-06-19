
Using ocaml for the reference evaluation since the stage5 haskell evaluator is quite slow.
We still test the haskell emulations in ../same-evaluation-from-all-stages/.

  $ cat ../inputs/filesystem.input | ../../ocaml/main.exe Filesystem
  Filesystem explorer
  - sector_size: 512
  - #sectors_on_disk: 10
  - addressable disk: 5120
  - block_size: 128
  - #blocks_on_disk: 40
  - max_file_size (6 blocks): 768
  Try: help dump sector format mount unmount debug ls stat cat rm create append splat wipe
  Error: no filesystem found; try format
  Error: no filesystem mounted; try mount
  1> wipe
  2> format
  3> mount
  4> create
  Creating file 0; (to finish type ^D)
  Hello world!
  ^D
  5> 
  6> create
  Creating file 1; (to finish type ^D)
  z^D
  7> 
  8> create
  Creating file 2; (to finish type ^D)
  ^D
  9> 
  10> create
  Creating file 3; (to finish type ^D)
  Goodbye.
  ^D
  11> 
  12> cat 0
  Hello world!
  13> cat 1
  z14> cat 2
  15> cat 3
  Goodbye.
  16> append 1
  Appending to file 1; (to finish type ^D)
  ero one
  two
  ^D
  17> 
  18> cat 1
  zero one
  two
  19> splat 1 8
  Overwriting file 1 from offset 8; (to finish type ^D)
   two three four
  ^D
  20> 
  21> cat 1
  zero one two three four
  22> append 1
  Appending to file 1; (to finish type ^D)
  five six seven eight nine ten eleven twelve thirteen
  ^D
  23> 
  24> cat 1
  zero one two three four
  five six seven eight nine ten eleven twelve thirteen
  25> ls
  file 0 : 13
  file 1 : 77
  file 2 : 0
  file 3 : 9
  26> debug
  Filesystem found:
  - superblock: #blocks=40, #admin-blocks=1+5, #inodes=80
  - #free-blocks = 31
  - #free-inodes = 76
  27> [EOF]
