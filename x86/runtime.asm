
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

    Temps equ 0x500

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
    jmp halt
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

    mov [0], dl ; SAVE DRIVE NUMBER ; TODO better place to put this?
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
    jmp begin

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; misc

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


halt:
    call Bare_get_char ;; avoid really spinning the fans
    jmp halt


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Bare BIOS

Bare_clear_screen: ;; -- TODO expose this as user builtin
    mov ax, 0x0003 ; AH=0 AL=3 video mode 80x25
    int 0x10
    ret

Bare_crash:
    Print '[Crash]'
.spin:
    jmp .spin

Bare_enter_check:
    ;; how much space is left before we crash into the code?
    ;; when this reaches zero, examples crash.
    ;; however, sham example crashes much earlier
    ;; a different issue? maybe temps in page 0 ?? -- YES
    mov ax, sp
    sub ax, end_of_code
    jb .out_of_memory
    ;push ax
    ;mov al, ah
    ;PrintHexAX
    ;pop ax
    ;PrintHexAX
    ;Dot
    ret
.out_of_memory:
    Print `[OOM]\n`
    jmp halt


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

Bare_num_to_char: ;; TODO: zero out high byte. Make test to provoke the need.
    ;; this is meant to do nothing!
    ;;mov ah, 0
    ret

Bare_char_to_num: ;; TODO: fill in the zero high byte. Make test to provoke the need
    ;; this is meant to do nothing!
    ;;mov ah, 0
    ret

Bare_addr_to_num: ;; called when we see where the Sp is
    ;; when we have only 15bi nums, we ought to shift/tag this, so we gve answer in #words
    shr ax, 1
    ret

Bare_div:
    push dx
    mov dx, 0
    div bx
    pop dx
    ret

Bare_mod: ;; TODO: It would be nice to expose a combined div/mod builtin to user
    push dx
    mov dx, 0
    div bx ; dx:ax / bx. quotiant->ax, remainder->dx
    mov ax, dx
    pop dx
    ret


Bare_string_length:
    mov bx, ax
    mov ax, [bx]
    ret

Bare_make_bytes:
    pop bx ;; heap allocation is at SP; so first we save return address.
    ;; Does not zero the allocated space. User caller code is expected to do this.

    sub sp, ax
    ;; we need to keep the stack word aligned, so we must round-down sp to an even address
    and sp, 0xFFFE

    push ax
    mov ax, sp
    jmp bx

Bare_get_bytes:
    add bx, 2 ; +2 for the length
    add bx, ax
    mov ax, [bx]
    mov ah, 0
    ret

Bare_set_bytes:
    add si, 2 ; +2 for the length
    add si, ax
    mov byte [si], bl
    ret

Bare_load_sector: ;Ax (Num bytes), Bx (The bytes buffer to load into)
    push cx ; save continuation
    push dx ; save arg
    mov cl, al ; start sector number (1 is boot; 2 is kernel)
    mov dl, [0] ; RESTORE DRIVE NUMBER
    mov ah, 0x02 ; Function: Read Sectors From Drive
    mov ch, 0 ; cylinder
    mov dh, 0 ; head
    mov al, 1 ; sector count
    add bx, 2 ; dest buffer; skip 2 for the length word
    int 0x13
    pop dx
    pop cx
    ret

;;; YES, this really updates the image file when running in qemu
Bare_store_sector: ;Ax (Num bytes), Bx (The string to store)

    push cx ; save continuation
    push dx ; save arg

    mov cl, al ; start sector number (1 is boot; 2 is kernel)
    mov dl, [0] ; RESTORE DRIVE NUMBER
    mov ah, 0x03 ; Function: Write Sectors To Drive
    mov ch, 0 ; cylinder
    mov dh, 0 ; head
    mov al, 1 ; sector count
    add bx, 2 ; src buffer; skip 2 for the length word
    int 0x13

    pop dx
    pop cx
    ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; begin/end

top_of_memory equ 0

begin:
    mov sp, top_of_memory
    mov cx, final_continuation
    call Bare_clear_screen
    jmp bare_start

final_continuation:
    dw final_code

final_code:
    Print `[HALT]\n`
    jmp halt

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; User code

%include CODE

    align 512
    times 512 db '5'
    times 512 db '6'
    times 512 db '7'

end_of_code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Check Size

;; Size allocated in layout.asm:
%assign As kernel_size_in_sectors       ; in sectors
%assign Ab (As * sector_size)           ; in bytes

;; Size we actually require:
%assign Rb ($ - $$)                     ; in bytes
%assign Rs (1 + ((Rb-1)/sector_size))   ; in sectors

%if Rb>Ab
%error Kernel sectors allocated: As, required: Rs
%endif
