Using ocaml for the big filesystem test. Haskell emulators are too slow.
  $ cat ../inputs/filesystem.input | ../../haskell/main.exe ../../examples/filesystem.fun
  Filesystem explorer
  - sector_size: 512
  - #sectors_on_disk: 10
  - addressable disk: 5120
  - block_size: 128
  - #blocks_on_disk: 40
  - max_file_size (6 blocks): 768
  Try: help dump sector format mount unmount debug ls stat cat rm create append splat wipe
  1> wipe
  2> format
  3> mount
  4> ls
  5> create
  Creating file 0; (to finish type ^D)
  Hello world!
  ^D
  6> 
  7> create
  Creating file 1; (to finish type ^D)
  z^D
  8> 
  9> create
  Creating file 2; (to finish type ^D)
  ^D
  10> 
  11> create
  Creating file 3; (to finish type ^D)
  Goodbye.
  ^D
  12> 
  13> ls
  file 0 : 13
  file 1 : 1
  file 2 : 0
  file 3 : 9
  14> cat 0
  Hello world!
  15> cat 1
  z16> cat 2
  17> cat 3
  Goodbye.
  18> append 1
  Appending to file 1; (to finish type ^D)
  ero one
  two
  ^D
  19> 
  20> cat 1
  zero one
  two
  21> splat 1 8
  Overwriting file 1 from offset 8; (to finish type ^D)
   two three four
  ^D
  22> 
  23> cat 1
  zero one two three four
  24> append 1
  Appending to file 1; (to finish type ^D)
  five six seven eight nine ten eleven twelve thirteen
  ^D
  25> 
  26> cat 1
  zero one two three four
  five six seven eight nine ten eleven twelve thirteen
  27> ls
  file 0 : 13
  file 1 : 77
  file 2 : 0
  file 3 : 9
  28> debug
  Filesystem found:
  - superblock: #blocks=40, #admin-blocks=1+5, #inodes=80
  - #free-blocks = 31
  - #free-inodes = 76
  29> cat 0
  Hello world!
  30> rm 0
  31> append 1
  Appending to file 1; (to finish type ^D)
  fourteen fifteen sixteen seventeen eighteen nineteen twenty
  ^D
  32> 
  33> cat 1
  zero one two three four
  five six seven eight nine ten eleven twelve thirteen
  fourteen fifteen sixteen seventeen eighteen nineteen twenty
  34> ls
  file 1 : 137
  file 2 : 0
  file 3 : 9
  35> debug
  Filesystem found:
  - superblock: #blocks=40, #admin-blocks=1+5, #inodes=80
  - #free-blocks = 31
  - #free-inodes = 77
  36> [EOF]
