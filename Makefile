
build: _build _build/disk.img
	@ echo -n

run: _build _build/disk.img
	@ echo 'Runing QEMU'
	@ bash -c 'qemu-system-i386 -hda _build/disk.img > /dev/null 2>& 1'

.PRECIOUS:_build/disk.img
_build/disk.img: _build/bootloader.img _build/kernel.img
	@ echo 'Concatenating $@'
	@ cat $^ > $@ || rm -f $@

NASM_FLAGS = -Werror

_build/bootloader.img: src/bootloader.asm src/layout.asm
	@ echo 'Assembling $@'
	@ nasm $(NASM_FLAGS) -o $@ $< || rm -f $@

.PRECIOUS:_build/kernel.img
_build/kernel.img: src/kernel.asm src/layout.asm
	@ echo 'Assembling $@'
	@ nasm $(NASM_FLAGS) -o $@ $< || rm -f $@


_build: ; @mkdir -p $@
