
# Compile and run `sham.fun`, a pretend file-system and shell.
sham:
	dune exec haskell/main.exe -- examples/sham.fun

# WIP block/inode-based filesystem.
fs:
	dune exec haskell/main.exe -- examples/filesystem.fun
