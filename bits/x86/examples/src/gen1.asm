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

top_of_memory equ 0

begin:
    mov sp, top_of_memory
    mov cx, final_continuation
    call Bare_clear_screen
    jmp bare_start


final_continuation:
    dw final_code

final_code:
    ;; TODO: print halt here. better still. quit the emulator
    mov ax, 'F'
    call Bare_put_char
spin:
    jmp spin

;;; These could be macros...
Bare_clear_screen:
    mov ax, 0x0003 ; AH=0 AL=3 video mode 80x25
    int 0x10
    ret

CR equ 13
LF equ 10

;;; Read a key press (Converting CR to LF)
Bare_get_char: ; -> ax
    mov ah, 0
    int 0x16
    mov ah, 0
    cmp ax, CR
    jz .cr
    ret
.cr:
    mov ax, LF
    ret

;;; Print to the screen (Converting LF to CR/LF)

Bare_put_char: ; al->
    cmp ax, LF
    jnz .normal
    mov al, CR
    call .normal
    mov al, LF
.normal:
    mov ah, 0x0e ; Function: Teletype output
    mov bh, 0
    int 0x10
    mov ax, 0x77 ; splat so we can be sure we saved
    ret

Bare_make_bool_from_z:
    jz .yes
.no:
    mov ax, False
    ret
.yes:
    mov ax, True
    ret

False: dw 0
True: dw 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
L1: ; Arm: 10'29
  ;; (10'40) Tail: outer (g1) @ con_10'40 (g4)
  mov bp, g1
  mov dx, g4
  mov ax, [bp]
  jmp ax

L2: ; Function: g2
  call Bare_get_char
  mov [2], ax
  mov ax, [2]
  call Bare_put_char
  mov [4], ax
  mov ax, [2]
  cmp word ax, `\n`
  call Bare_make_bool_from_z
  mov [6], ax
  mov bx, [6]
  cmp word [bx], 1
  jz L1
  ;; (10'54) Tail: inner (g2) @ con_10'54 (g5)
  mov bp, g2
  mov dx, g5
  mov ax, [bp]
  jmp ax

L3: ; Function: g1
  mov ax, '%'
  call Bare_put_char
  mov [2], ax
  mov ax, ' '
  call Bare_put_char
  mov [4], ax
  ;; (12'9) Tail: inner (g2) @ con_12'9 (g6)
  mov bp, g2
  mov dx, g6
  mov ax, [bp]
  jmp ax

L4: ; Start
  ;; (13'11) Tail: outer (g1) @ con_13'11 (g7)
  mov bp, g1
  mov dx, g7
  mov ax, [bp]
  jmp ax

g1: dw L3
g2: dw L2
g3: dw 0
g4: dw 0
g5: dw 0
g6: dw 0
g7: dw 0

bare_start: jmp L4
