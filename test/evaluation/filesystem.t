
  $ cat ../inputs/filesystem.input | ../../ocaml/main.exe Filesystem
  Filesystem explorer
  Commands: wipe dump format mount unmount debug ls create append splat rm cat
  Trying to mount existing filesystem
  1> unmount
  2> format
  3> mount
  4> ls
  5> create
  Creating file#0; (to finish type ^D)
  Hello world!
  ^D
  6> 
  7> create
  Creating file#1; (to finish type ^D)
  z^D
  8> 
  9> create
  Creating file#2; (to finish type ^D)
  ^D
  10> 
  11> create
  Creating file#3; (to finish type ^D)
  Goodbye.
  ^D
  12> 
  13> ls
  file#0 : 13
  file#1 : 1
  file#2 : 0
  file#3 : 9
  14> cat 0
  Hello world!
  15> cat 1
  z16> cat 2
  17> cat 3
  Goodbye.
  18> append 1
  Appending to file#1; (to finish type ^D)
  ero one
  two
  ^D
  19> 
  20> cat 1
  zero one
  two
  21> splat 1 8
  Overwriting file#1 from offset 8; (to finish type ^D)
   two three four
  ^D
  22> 
  23> cat 1
  zero one two three four
  24> append 1
  Appending to file#1; (to finish type ^D)
  five six seven eight nine ten eleven twelve thirteen
  ^D
  25> 
  26> cat 1
  zero one two three four
  five six seven eight nine ten eleven twelve thirteen
  27> ls
  file#0 : 13
  file#1 : 77
  file#2 : 0
  file#3 : 9
  28> debug
  Filesystem found:
  - super: 24/3/24
  - free blocks = B8,B9,B10,B11,B12,B13,B14,B15,B16,B17,B18,B19,B20,B21,B22,B23
  - free inodes = I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15,I16,I17,I18,I19,I20,I21,I22,I23
  - inodes:
  - I0 : Inode: size=13, blocks=[B4]
  - I1 : Inode: size=77, blocks=[B5,B7]
  - I2 : Inode: size=0, blocks=[]
  - I3 : Inode: size=9, blocks=[B6]
  29> cat 0
  Hello world!
  30> rm 0
  31> append 1
  Appending to file#1; (to finish type ^D)
  fourteen fifteen sixteen seventeen eighteen nineteen twenty
  ^D
  32> 
  33> cat 1
  zero one two three four
  five six seven eight nine ten eleven twelve thirteen
  fourteen fifteen sixteen seventeen eighteen nineteen twenty
  34> ls
  file#1 : 137
  file#2 : 0
  file#3 : 9
  35> debug
  Filesystem found:
  - super: 24/3/24
  - free blocks = B8,B9,B10,B11,B12,B13,B14,B15,B16,B17,B18,B19,B20,B21,B22,B23
  - free inodes = I0,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15,I16,I17,I18,I19,I20,I21,I22,I23
  - inodes:
  - I1 : Inode: size=137, blocks=[B5,B7,B4]
  - I2 : Inode: size=0, blocks=[]
  - I3 : Inode: size=9, blocks=[B6]
  36> rm 2
  37> rm 1
  38> rm 3
  39> ls
  40> debug
  Filesystem found:
  - super: 24/3/24
  - free blocks = B6,B4,B7,B5,B8,B9,B10,B11,B12,B13,B14,B15,B16,B17,B18,B19,B20,B21,B22,B23
  - free inodes = I3,I1,I2,I0,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15,I16,I17,I18,I19,I20,I21,I22,I23
  - inodes:
  41> [EOF]
