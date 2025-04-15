;;; print1 -- clear screen and print a single char using BIOS routines
;;; running directly from the boot sector

    bootloader_address equ 0x7c00

    bits 16
    org bootloader_address

    jmp start
    times 0x3e - ($ - $$) db 0x00 ; skip FAT headers

start:
    mov ax, 0
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0

    ;; clear_screen
    mov ax, 0x0003 ; AH=0 AL=3 video mode 80x25
    int 0x10

    ;; output char
    mov al, 'X'
    mov ah, 0x0e ; Function: Teletype output
    mov bh, 0
    int 0x10

hang:
    jmp hang

    times 446 - ($ - $$) db 0xff
    ;; PMBR partition table, from byte 446
    db 0, 0, 2, 0, 0xee, 0xff, 0xff, 0xff, 1, 0, 0, 0, 1, 0, 0, 0
    times 510 - ($ - $$) db 0x00
    dw 0xaa55
