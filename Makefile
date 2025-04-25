
# TODO: remove this when add nice dune alises to run. And a standalone script.

# Compile and run `sham.fun`, a pretend file-system and shell.
sham:
	dune exec haskell/main.exe -- test/examples/sham.fun

# Reduced version which is currently all I can run wth qemu
shammy:
	dune exec haskell/main.exe -- test/examples/shammy.fun

# WIP block/inode-based filesystem.
fs:
	dune exec haskell/main.exe -- test/examples/filesystem.fun
