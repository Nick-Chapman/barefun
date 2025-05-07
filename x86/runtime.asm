
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

%macro Out 2
    mov al, %2
    out %1, al
%endmacro

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

%macro Bare_enter_check 1 ;; TODO: pay attention to "need" argument
    call Bare_enter_check_function
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
    call setup_timer_interrupt
    jmp begin

;; updated on IRQ-0; watched in regular code
ticker: db 0

ticker_freq_htz equ 1000

first_irq_slot equ 32 ;must be a multiple of 8 (but 16 doesn't work)

slot equ first_irq_slot ; the single ISR slot I am playing with

end_of_interrupt_command equ 0x20

setup_timer_interrupt:
    cli ; disabled interrupts while we set things up.
    mov word [4*slot+0], irq0
    mov word [4*slot+2], 0
    call set_pit_freq
    call remap_pic ; also unmasks all
    sti ; re-enable here
    ret

;;; service timer IRQ-0: bump the ticker byte
irq0:
    push ax
    push bx
    ;;PrintChar '.' ; no print from here
    inc byte [ticker]
    Out pic1_cmd, end_of_interrupt_command
    ;Out pic2_cmd, end_of_interrupt_command
    pop bx
    pop ax
    iret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 8259 PIC (Programmable Interrupt Controller)

pic1_cmd equ 0x20
pic2_cmd equ 0xA0

pic1_data equ 0x21
pic2_data equ 0xA1

pic1_offset equ first_irq_slot
pic2_offset equ first_irq_slot+8

remap_pic:
    Out pic1_cmd, 0x11          ; initialization required; expect ICW4
    Out pic1_data, pic1_offset  ; ICW2: vector offset
    Out pic1_data, 4            ; ICW3: tell Master of Slave PIC at IRQ2 (0100)
    Out pic1_data, 1            ; ICW4: x86 mode
    Out pic2_cmd, 0x11          ; initialization required; expect ICW4
    Out pic2_data, pic2_offset  ; ICW2: vector offset
    Out pic2_data, 2            ; ICW3: tell Slave its cascade identity (0010)
    Out pic2_data, 1            ; ICW4: x86 mode
    ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; PIT (Programmable Interval Timer)
;;; Smallest frequency we can set is 19, or else pit_divisor exceeds a word.
;;; (we can get 18.2 by setting pit_divisor as 0)
base_freq_htz equ 1193182
pit_divisor equ base_freq_htz / ticker_freq_htz
pit_channel0 equ 0x40
pit_command equ 0x43
set_pit_freq:
    ;; 0x36 is 00_11_111_0
    mov al, 0x36
    out pit_command, al
    ;; - (00) select channel 0
    ;; - (11) access mode lo/hi
    ;; - (111) square wave
    ;; - (0) 16-bit-binary
    mov ax, pit_divisor
    out pit_channel0, al ;lo byte
    mov al, ah
    out pit_channel0, al ;hi byte
    ret

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
    hlt ;; avoid spinning the fans
    jmp halt


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Bare BIOS

Bare_clear_screen: ;; -- TODO expose this as user builtin
    mov ax, 0x0003 ; AH=0 AL=3 video mode 80x25
    int 0x10
    ret

Bare_crash:
    Print `[Crash]\n`
    jmp final_code

Bare_enter_check_function:
    mov ax, sp
    sub ax, bot_of_heap
    jb .out_of_memory
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
    jz yes
    jmp no

Bare_make_bool_from_nz:
    jnz yes
    jmp no

Bare_make_bool_from_n:
    jl yes
    jmp no

no:
    mov ax, False
    ret
yes:
    mov ax, True
    ret

;; tagged false & true
False: dw 1
True: dw 3

Bare_num_to_char: ;; TODO: zero out high byte. Make test to provoke the need.
    ;; this is meant to do nothing!
    ;;mov ah, 0
    ret

Bare_char_to_num: ;; TODO: fill in the zero high byte. Make test to provoke the need
    ;; this is meant to do nothing!
    ;;mov ah, 0
    ret

;;; This takes N-bytes to allocate in 2n+1 rep.
Bare_make_bytes:
    pop bx ;; heap allocation is at SP; so first we save return address.
    ;; Does not zero the allocated space. User caller code is expected to do this.

    ;; TODO: we should untag the value in ax, or else we slide sp twice as far as intended
    ;; But I cant see any evidence this bug is causing an issue.
    sub sp, ax
    ;; we need to keep the stack word aligned, so we must round-down sp to an even address
    and sp, 0xFFFE

    push ax ;; Pushing the tagged size is correct
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
    shr ax, 1
    mov cl, al ; start sector number (1 is boot; 2 is kernel)
    mov dl, [drive_number]
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

    shr ax, 1
    mov cl, al ; start sector number (1 is boot; 2 is kernel)
    mov dl, [drive_number]
    mov ah, 0x03 ; Function: Write Sectors To Drive
    mov ch, 0 ; cylinder
    mov dh, 0 ; head
    mov al, 1 ; sector count
    add bx, 2 ; src buffer; skip 2 for the length word
    int 0x13

    pop dx
    pop cx
    ret

Bare_unit:
    dw 1 ;; doesn't matter what is here. nothing should look at this

Bare_free_words:
    mov ax, sp
    sub ax, bot_of_heap
    shr ax, 1 ;; shift for #words
    ret

;;; this blocks for 1ms
Bare_wait_a_tick:
    mov al, [ticker]
.wait:
    hlt ; avoid the fans spinning in qemu
    mov bl, [ticker]
    sub bl, al
    cmp bl, 10
    jnz .wait
    ret

keyboard_data_port equ 0x60
keyboard_status_port equ 0x64

;;; sets Z when not ready
Bare_is_keyboard_ready: ;; TODO: ripe for inlining
    in al, keyboard_status_port
    test al, 0x01 ;; output buffer has something?
    ret

Bare_get_keyboard_last_scancode: ;; TODO: ripe for inlining
    in al, keyboard_data_port
    mov ah, 0
    ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; begin/end

top_of_heap equ 0
;bot_of_heap equ 0x8000 ; half of memory; 16k words
bot_of_heap equ end_of_code

begin:
    mov sp, top_of_heap
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
    times 512 db '6'
    times 512 db '7'
    times 512 db '8'
    times 512 db '9'

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
