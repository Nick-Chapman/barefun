
default = gen1

top: run

build: build-$(default)
run: run-$(default)
burn: burn-$(default)

build-%: ,build ,build/%.img
	@ echo -n

run-%: ,build ,build/%.img
	@ echo 'Runing QEMU'
	bash -c 'qemu-system-i386 -hda ,build/$*.img > /dev/null 2>& 1'

NASM_FLAGS = -Werror

,build/%.img: src/%.asm
	@ echo 'Assembling $@'
	nasm $(NASM_FLAGS) -o $@ $< || rm -f $@

burn-%: ,build/%.img
	dd if=$< of=/dev/sda

,build: ; @mkdir -p $@
