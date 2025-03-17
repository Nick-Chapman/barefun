
top: run

build: ,build ,build/disk.img
	@ echo -n

run: ,build ,build/disk.img
	@ echo 'Runing QEMU'
	@ bash -c 'qemu-system-i386 -hda ,build/disk.img > /dev/null 2>& 1'

.PRECIOUS:,build/disk.img
,build/disk.img: ,build/bootloader.img ,build/kernel.img
	@ echo 'Concatenating $@'
	@ cat $^ > $@ || rm -f $@

NASM_FLAGS = -Werror

,build/bootloader.img: src/bootloader.asm src/layout.asm
	@ echo 'Assembling $@'
	@ nasm $(NASM_FLAGS) -o $@ $< || rm -f $@

.PRECIOUS:,build/kernel.img
,build/kernel.img: src/kernel.asm src/layout.asm
	@ echo 'Assembling $@'
	@ nasm $(NASM_FLAGS) -o $@ $< || rm -f $@

,build: ; @mkdir -p $@

burn: ,build/disk.img
	dd if=$< of=/dev/sda
