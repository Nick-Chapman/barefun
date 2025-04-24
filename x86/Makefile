
#top: run
top: buildall

default = small

build: build-$(default)
run: run-$(default)
burn: burn-$(default)

# build all examples
examples = $(patsubst ../examples/%.fun, %, $(wildcard ../examples/*.fun))
buildall: $(patsubst %, build-%, $(examples))

build-%: ,build ,build/%.img
	@ echo -n

run-%: ,build ,build/%.img
	@ echo 'Runing QEMU'
	bash -c 'qemu-system-i386 -hda ,build/$*.img > /dev/null 2>& 1'

NASM_FLAGS = -Werror

,build/%.img: ,build/%.asm
	@ echo 'Assembling $@'
	nasm $(NASM_FLAGS) -o $@ $< || rm -f $@

.PRECIOUS:,build/%.asm
,build/%.asm: bare.asm ../compile-examples/expected/%-5.asm epilog.asm
	@ echo 'Combining $@'
	cat $^ > $@

burn-%: ,build/%.img
	dd if=$< of=/dev/sda

,build: ; @mkdir -p $@
