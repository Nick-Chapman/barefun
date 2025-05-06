;;; Testbed for exploring how to do stuff at the asm level.
;;; Formed by grabbing bits from ../runtime.asm

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Layout

;;; A page = 256 bytes; 16 bit address space is 64k or 256 pages
;;; A disk sector is 512 bytes
;;; The bootloader is initially be resident from page 124 (0x7c00)
;;; We relocate it to the top of memory: page 254/255 (0xfe00)

    sector_size equ 512

    bootloader_address equ 0x7c00
    bootloader_relocation_address equ 0xfe00

    kernel_load_address equ 0x600
    kernel_size_in_sectors equ 124 ;; max before relocated bootloader

    bits 16

    drive_number equ 0x500 ; Space is available here because
    Temps equ 0x500 ; temps are stored at Temps+2, Temps+4 etc.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Macros

%macro PrintCharAL 0
    mov ah, 0x0e
    mov bh, 0
    int 0x10
%endmacro

%macro PrintChar 1
    mov al, %1
    PrintCharAL
%endmacro

%macro Print 1
    push di
    jmp %%after
%%message: db %1, 0
%%after:
    mov di, %%message
    call internal_print_string
    pop di
%endmacro

%macro Newline 0
    PrintChar 10
    PrintChar 13
%endmacro

%macro Space 0
    PrintChar ' '
%endmacro

%macro Dot 0
    PrintChar '.'
%endmacro

%macro PrintHexNibbleBX 0
    mov ax, [bx + hex_data]
    PrintCharAL
%endmacro

%macro PrintHexAX 0
    push ax
    mov bx, ax
    shr bx, 4
    and bx, 0xF
    PrintHexNibbleBX
    pop bx
    and bx, 0xF
    PrintHexNibbleBX
%endmacro

%macro Crash 1
    Print %1
    jmp final_code
%endmacro

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Bootloader...

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

    ;; Relocate the bootloader sector (256 words = 512 bytes)
    mov cx, 0x100
    mov si, bootloader_address
    mov di, bootloader_relocation_address
    rep movsw
    jmp 0:part2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Relocated bootloader...

part2:
    ;; Sectors are numbered from 1. The bootloader is in the 1st sector.
    ;; Kernel starts at sector 2
    first_non_boot_sector equ 2

    mov [drive_number], dl
    mov ah, 0x02 ; Function: Read Sectors From Drive
    mov ch, 0 ; cylinder
    mov dh, 0 ; head
    mov al, kernel_size_in_sectors ; sector count
    mov cl, first_non_boot_sector ; start sector
    mov bx, kernel_load_address ; dest
    int 0x13

    jmp 0:kernel_load_address

    times 446 - ($ - $$) db 0xff
    ;; PMBR partition table, from byte 446
    db 0, 0, 2, 0, 0xee, 0xff, 0xff, 0xff, 1, 0, 0, 0, 1, 0, 0, 0
    times 510 - ($ - $$) db 0x00
    dw 0xaa55

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Kernel...

    section KERNEL follows=BOOTSECTOR vstart=kernel_load_address
    jmp main

hex_data: db "0123456789abcdef"

internal_print_string: ; in: DI=string; print null-terminated string.
    push ax
    push di
.loop:
    mov al, [di]
    cmp al, 0 ; null?
    je .done
    mov ah, 0
    call Bare_put_char
    inc di
    jmp .loop
.done:
    pop di
    pop ax
    ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Bare BIOS

Bare_clear_screen:
    mov ax, 0x0003 ; AH=0 AL=3 video mode 80x25
    int 0x10
    ret

BS equ 8
LF equ 10
CR equ 13
DEL equ 127

;;; Read a key press (Converting CR to LF; BS to DEL)
Bare_get_char: ; -> ax
    mov ah, 0
    int 0x16 ; Function
    mov ah, 0
    cmp ax, BS
    je .bs
    cmp ax, CR
    jz .cr
    ret
.cr:
    mov ax, LF
    ret
.bs:
    mov ax, DEL
    ret

;;; Print to the screen (Converting LF to CR/LF; showing unprintable chars as escaped hex)
Bare_put_char: ; al->
    cmp ax, BS
    je .normal ; put the BS as normal to move cursor back one position
    cmp ax, LF
    je .nl
    cmp ax, 32
    jl .as_code
    cmp ax, 126
    jg .as_code
    ;; fall though to normal
.normal:
    PrintCharAL
    ret
.nl:
    mov al, LF
    call .normal
    mov al, CR
    jmp .normal
.as_code:
    push ax
    mov al, `\\`
    PrintCharAL
    pop ax
    PrintHexAX
    ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Begin...

halt:
    Print `[HALT]\n`
.loop:
    call Bare_get_char ;; avoid spinning the fans
    jmp .loop

;;; TODO: non-blocking get_scancode; with try-again loop in main
;;; TODO: how to avoid spinning fans in qemu?
;;; TODO: use interrupts to access keyboard
;;; TODO: decode scancode

main:
    call Bare_clear_screen
    Print `[See make/break scancodes from keyboard]\n`
.loop:
    call get_scancode
    call Bare_put_char
    jmp .loop

keyboard_data_port equ 0x60
keyboard_status_port equ 0x64

;;; This implements blocking/polling keyboard access
get_scancode:
    ;; This wait loop spins my fans in qemu
.wait:
    in al, keyboard_status_port
    test al, 0x01 ;; output buffer has something?
    jz .wait
    in al, keyboard_data_port
    ret
