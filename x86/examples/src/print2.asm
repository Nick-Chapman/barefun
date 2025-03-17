;;; running directly from the boot sector; still in real mode;
;;; print chars by writing direct to video memory

    bootloader_address equ 0x7c00

    bits 16
    org bootloader_address

    jmp start
    times 0x3e - ($ - $$) db 0x00 ; skip FAT headers

start:
    mov ax, 0
    mov es, ax
    mov ss, ax
    mov sp, 0

    ;; clear_screen
    ;mov ax, 0x0003 ; AH=0 AL=3 video mode 80x25
    ;int 0x10

    mov ax, 0xb800
    mov ds, ax
    mov byte[ds:0x0000], 'X'  ;; line 0 col 0
    mov byte[ds:0x0001], 0x20 ;; black on green

    mov ax, 0xb800
    mov ds, ax
    mov byte[ds:0x00a2], 'Y'  ;; line 1 col 1
    mov byte[ds:0x00a3], 0x30 ;; black on cyan

hang:
    jmp hang

    times 446 - ($ - $$) db 0xff
    ;; PMBR partition table, from byte 446
    db 0, 0, 2, 0, 0xee, 0xff, 0xff, 0xff, 1, 0, 0, 0, 1, 0, 0, 0
    times 510 - ($ - $$) db 0x00
    dw 0xaa55
