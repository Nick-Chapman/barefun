
;;; Note: page = 256 bytes; 16 bit address space is 64k or 256 pages

;;; The bootloader will be resident from page 124 (0x7c00)
;;; The lowest the kernel can be loaded is 0x500 (leaving 5 pages for the BIOS)

;;; A disk sector is 512 bytes

    sector_size equ 512

;;; The maximum space available for a contiguously loaded kernel is therfore 119 pages. (124-5)
;;; i.e. the space between the 5 pages reserved for the BIOS and the start of the bootloader
;;; That is 59.5 sector.

    bootloader_address equ 0x7c00

    kernel_load_address equ 0x500
    kernel_size_in_sectors equ 67

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

%macro print 1
    push di
    jmp %%after
%%message: db %1, 0
%%after:
    mov di, %%message
    call internal_print_string
    pop di
%endmacro

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

top_of_memory equ 0

begin:
    mov sp, top_of_memory
    mov cx, final_continuation
    call Bare_clear_screen
    jmp bare_start

final_continuation:
    dw final_code

final_code:
    print `[HALT]\n`
spin:
    call Bare_get_char ;; avoid really spinning the fans
    jmp spin


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
    mov ah, 0x0e ; Function: Teletype output
    mov bh, 0
    int 0x10
    ret
.nl:
    mov al, LF
    call .normal
    mov al, CR
    jmp .normal
.hex: db "0123456789abcdef"
.as_code:
    push ax
    push ax
    mov al, '\'
    call .normal
    ;; hi nibble
    pop bx
    shr bx, 4
    and bx, 0xF
    mov ax, [bx + .hex]
    call .normal
    ;; lo nibble
    pop bx
    and bx, 0xF
    mov ax, [bx + .hex]
    jmp .normal


Bare_make_bool_from_z:
    jz .yes
.no:
    mov ax, False
    ret
.yes:
    mov ax, True
    ret

Bare_make_bool_from_n:
    jl .yes
.no:
    mov ax, False
    ret
.yes:
    mov ax, True
    ret

False: dw 0
True: dw 1

Bare_num_to_char:
    ;; this is meant to do nothing!
    ret

Bare_char_to_num:
    ;; this is meant to do nothing!
    ret

;; must revisit when we have tighter, byte-packed rep for strings/bytes
Bare_get_bytes:
    add bx, 1 ; +1 for the length
    shl bx, 1 ; x2 to get from word-index to byte-index
    add bx, ax
    mov ax, [bx]
    ret

Bare_set_bytes:
    add bx, 1 ; +1 for the length
    shl bx, 1 ; x2 to get from word-index to byte-index
    add bx, ax
    mov [bx], si
    ret

Bare_string_length:
    mov bx, ax
    mov ax, [bx]
    ret

Bare_make_bytes:
    pop bx ;; we do heap allocation at stack pointer; so we must first save return address.
    ;; Does not zero the allocated space. User caller code is expected to do this.
    shl ax, 1
    sub sp, ax
    shr ax, 1
    push ax
    mov ax, sp
    jmp bx

Bare_mul:
    mul bx ; ax * bx -> ax
    ret

Bare_mod: ;; TODO: It would be nice to expose a combined div/mod builtin to user
    push dx
    mov dx, 0
    div bx ; dx:ax / bx. quotiant->ax, remainder->dx
    mov ax, dx
    pop dx
    ret

Bare_div:
    push dx
    mov dx, 0
    div bx
    pop dx
    ret

Bare_crash:
    print '[Crash]'
.spin:
    jmp .spin

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

%include CODE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Check Size

;; Size allocated in layout.asm:
%assign As kernel_size_in_sectors       ; in sectors
%assign Ab (As * sector_size)           ; in bytes

;; Size we actually require:
%assign Rb ($ - $$)                     ; in bytes
%assign Rs (1 + ((Rb-1)/sector_size))   ; in sectors

;%error sectors allocated: As (bytes = Ab)
;%error sectors required: Rs (bytes = Rb)

%if Rb>Ab
%error Kernel sectors allocated: As, required: Rs
%endif
