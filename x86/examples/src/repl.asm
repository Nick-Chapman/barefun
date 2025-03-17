;; This example is constructed by merging the 3 files ../../repl/src/{layout,bootloader,kernel}.asm
;;; sector.asm...

;;; Note: page = 256 bytes; 16 bit address space is 64k or 256 pages

;;; The bootloader will be resident from page 124 (0x7c00)
;;; The lowest the kernel can be loaded is 0x500 (leaving 5 pages for the BIOS)

;;; A disk sector is 512 bytes

    sector_size equ 512

;;; The maximum space available for a contiguously loaded kernel is therfore 119 pages. (124-5)
;;; i.e. the space between the 5 pages reserved for the BIOS and the start of the bootloader
;;; That is 59.5 sector.

;;; We also load in embedded string data at 0x8000. So we have 128 pages here.

    bootloader_address equ 0x7c00

    kernel_load_address equ 0x500
    kernel_size_in_sectors equ 6

    bootloader_relocation_address equ \
       kernel_load_address + kernel_size_in_sectors * sector_size ; 0x1100

    embedded_load_address equ \
       bootloader_relocation_address + sector_size ; 0x1300

    ;; 124 because we leave 1k each for the param + return stack
    embedded_size_in_sectors equ \
        124 - (embedded_load_address / sector_size + 1)


;;; bootloader.asm...

    bits 16
    org bootloader_relocation_address
    section BOOTSECTOR start=bootloader_relocation_address

    jmp start
    times 0x3e - ($ - $$) db 0x00 ; skip FAT headers

start:
    mov ax, 0
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0

    mov cx, 0x100
    mov si, bootloader_address
    mov di, bootloader_relocation_address
    rep movsw
    jmp 0:part2

part2:
    ;; Note. Sectors are numbered from 1. The bootloader (this file!) is in the 1st sector.
    ;; So the kernel starts at sector 2
    first_non_boot_sector equ 2

    mov ah, 0x02 ; Function: Read Sectors From Drive
    mov ch, 0 ; cylinder
    mov dh, 0 ; head
    mov al, kernel_size_in_sectors ; sector count
    mov cl, first_non_boot_sector ; start sector
    mov bx, kernel_load_address ; dest
    int 0x13

    mov ah, 0x02 ; Function: Read Sectors From Drive
    mov ch, 0 ; cylinder
    mov dh, 0 ; head
    mov al, embedded_size_in_sectors ; sector count
    mov cl, first_non_boot_sector + kernel_size_in_sectors ; start sector
    mov bx, embedded_load_address
    int 0x13

    jmp 0: kernel_load_address

    times 446 - ($ - $$) db 0xff
    ;; PMBR partition table, from byte 446
    db 0, 0, 2, 0, 0xee, 0xff, 0xff, 0xff, 1, 0, 0, 0, 1, 0, 0, 0
    times 510 - ($ - $$) db 0x00
    dw 0xaa55

;;; kernel.asm

    section KERNEL follows=BOOTSECTOR vstart=kernel_load_address
    jmp begin

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; current continuation (register bp)
;;; bx is the frane pointer, from which we an access free variables
%macro kret 0
    mov bx, bp
    mov bp, [bp+2]
    jmp [bx]
%endmacro

%macro kcall 1
    push bp
    push %%after
    mov bp, sp
    jmp %1
%%after:
%endmacro

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; start

top_of_memory equ 0

begin:
    mov sp, top_of_memory
    kcall clear_screen
    jmp repl_start

repl_start:
    kcall output_prompt
    mov si, 0
    jmp repl_collect

repl_collect: ;(line)si->
    kcall read_char ;; ->ax
    cmp ax, 13
    jz got_newline
    ;; si := cons(al,si)
    push ax
    push si
    mov si, sp
    kcall emit ;_twice
    jmp repl_collect

got_newline:
    kcall output_newline
    kcall print_chars_from_si
    jmp repl_start

print_chars_from_si:
    cmp si, 0
    jz output_newline
    mov ax, [si+2]
    kcall output_char
    mov si, [si] ;;can we be sure that si is still valid?
    jmp print_chars_from_si

emit_twice: ;ax->
    push ax ;; save as free var...
    kcall emit
    mov ax, [bx+4] ;; ... for access here
    jmp emit

emit: ;al->
    jmp output_char

output_newline:
    mov al,  10
    kcall output_char
    mov al,  13
    jmp output_char

output_prompt:
    mov al, '>'
    jmp output_char

output_x:
    mov al, 'x'
    jmp output_char

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; primitive BIOS ops

clear_screen:
    mov ax, 0x0003 ; AH=0 AL=3 video mode 80x25
    int 0x10
    kret

output_char: ; al->
    mov ah, 0x0e ; Function: Teletype output
    mov bh, 0
    int 0x10
    ;mov ax, 0x77 ; splat so we can be sure we saved
    kret

read_char: ; ->ax
    mov ah, 0
    int 0x16
    mov ah, 0
    kret
