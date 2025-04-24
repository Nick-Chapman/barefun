
# Compile and run `sham.fun`, a pretend file-system and shell.
sham:
	dune exec haskell/main.exe -- examples/sham.fun

# Reduced version which is currently all I can run wth qemu
shammy:
	dune exec haskell/main.exe -- examples/shammy.fun

# WIP block/inode-based filesystem.
fs:
	dune exec haskell/main.exe -- examples/filesystem.fun
