;;; TODO: je == jz -- pick one or the other!

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

%macro PrintCharLit 1
    push ax
    push bx
    mov al, %1
    mov ah, 0x0e
    mov bh, 0
    int 0x10
    pop bx
    pop ax
%endmacro

%macro PrintCharAL 0
    push ax
    push bx
    mov ah, 0x0e
    mov bh, 0
    int 0x10
    pop bx
    pop ax
%endmacro

%macro PrintHexNibbleBX 0
    push ax
    mov al, [bx + hex_data]
    PrintCharAL
    pop ax
%endmacro

%macro PrintHexAL 0
    push bx
    push ax
    mov bx, ax
    shr bx, 4
    and bx, 0xF
    PrintHexNibbleBX
    pop bx
    and bx, 0xF
    PrintHexNibbleBX
    pop bx
%endmacro

%macro PrintHexAX 0
    PrintCharLit '<'
    push ax
    mov al, ah
    PrintHexAL
    pop ax
    PrintHexAL
    PrintCharLit '>'
%endmacro

%macro PrintString 1
    push di
    jmp %%after
%%message: db %1, 0
%%after:
    mov di, %%message
    call internal_print_string
    pop di
%endmacro

%macro Stop 1
    PrintString %1
    jmp halt
%endmacro

%macro SeeReg 1
    push ax
    mov ax, %1
    PrintHexAX
    pop ax
%endmacro

%macro SeeState 0
    PrintString `\nsp=`
    SeeReg sp
    PrintString " cx="
    SeeReg cx
    ;PrintString " bx="
    ;SeeReg bx
    PrintString " dx="
    SeeReg dx
    PrintString " bp="
    SeeReg bp
    PrintString `\n`
%endmacro

%macro SeeMemLine 0
    PrintString `fff0 :`
    push ax
    push bx
    mov bx, 0xfff0
%%loop:
    PrintCharLit ' '
    mov word ax, [bx]
    PrintHexAX
    inc bx
    inc bx
    cmp bx, 0x0000
    jnz %%loop
    PrintString `\n`
    pop bx
    pop ax
%endMacro

%macro Dump 0
    SeeState
    SeeMemLine
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

    ;; NOTE: we are currently in a half way house!
    ;; exiting examples (sham, readline) call Bare_get_char, and dont work with
    ;; the new timer/keyboard stuff, and so the following line needs to be commented out

    call setup_timer_interrupt ;; TODO re-enable!!!

    ;; The new WIP example (scan) does need the above line.

    jmp main

ticker_freq_htz equ 100

ticker: dw 0 ; 16 bits; at 1KHz this cycles in 65 seconds
;; but after 2n+1 tagging (the cycling happens in just 32 seconds)

;;;pic offsets must be a multiple of 8
;;; default real mode values: no reason to use these since I can't co-exist with BIOS
;;;pic1_offset equ 8
;;;pic2_offset equ 0x70

pic1_offset equ 32
pic2_offset equ 40

end_of_interrupt_command equ 0x20

timer_slot equ pic1_offset
keyboard_slot equ pic1_offset + 1

setup_timer_interrupt:
    cli ; disabled interrupts while we set things up.
    mov word [4*timer_slot+0], irq0
    mov word [4*timer_slot+2], 0
    mov word [4*keyboard_slot+0], irq1
    mov word [4*keyboard_slot+2], 0
    call set_pit_freq
    call remap_pic
    call pic_mask_all_but_timer_and_keyboard
    sti ; re-enable here
    ret

;;; service timer IRQ-0: bump the ticker byte
irq0:
    ;;PrintCharLit '+' ; no print from here
    inc word [ticker]
    Out pic1_cmd, end_of_interrupt_command
    ;Out pic2_cmd, end_of_interrupt_command
    iret

;;; service keyboard IRQ-1: just acknowledge
irq1:
    ;;PrintCharLit '*' ; no print from here
    Out pic1_cmd, end_of_interrupt_command
    ;Out pic2_cmd, end_of_interrupt_command
    iret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 8259 PIC (Programmable Interrupt Controller)

pic1_cmd equ 0x20
pic2_cmd equ 0xA0

pic1_data equ 0x21
pic2_data equ 0xA1

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

pic_mask_all_but_timer_and_keyboard:
    Out pic1_data, 0xfc
    Out pic2_data, 0xff
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
    PrintString `[Bare_crash]\n`
    jmp halt


BS equ 8
LF equ 10
CR equ 13
DEL equ 127

;;; Read a key press (Converting CR to LF; BS to DEL)
NO_Bare_get_char: ; -> ax ;; no longer used by any examples. TODO: remove it
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
    PrintHexAL
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

    ;; ax -- number of bytes (as tagged number) for user data

    mov [.si], si ; save si; (need to use as a temp)
    mov si, ax

    shr si, 1 ; untag, to get number of bytes to..
    inc si ; round up and..
    and si, 0xfffe ; .. align to even
    sub sp, si ; ..slide stack pointer (allocated space is not uninializaed)

    push ax ; tagged length word; part of user data

    mov ax, sp ; grab result (before pushing the descriptor)

    add si, 3 ; add 2 bytes for the length word; +1 to tag as raw data
    push si ; descriptor/size word; part of GC data

    mov si, [.si] ; restore si
    ;Stop "Bare_make_bytes"

    jmp bx
.si:
    dw 0 ; location to save/return si (cant use stack)

Bare_get_bytes:
    add bx, 2 ; +2 for the length
    add bx, ax
    mov al, [bx]
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
    ;sub ax, bot_of_heap
    shr ax, 1 ;; shift for #words
    ret

Bare_get_ticks:
    mov word ax, [ticker]
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
;;; GC

hemi_size equ 3000
redzone_size equ 100 ; needed for save/restore & also for interrupts. how big should thsi be?

topA equ 0x0000
botA equ topA - hemi_size
topB equ botA - redzone_size
botB equ topB - hemi_size

hemi: db 0 ; flips every GC: 0,2,0,2,...
tops: dw topA, topB ; used to index this
bots: dw botA, botB ; used to index this


userCaller equ Temps+2
evacuateCaller equ Temps+4
tCX equ Temps+6
tDX equ Temps+8
tBP equ Temps+10
tCALLER equ Temps+12

need: dw 0

%macro Bare_enter_check 1 ;; TODO: pay attention to "need" argument
    mov word [need], %1
    jz %%no_need
    call Bare_enter_check_function
%%no_need:
%endmacro


gc_num: db 0

%macro Debug 1
    ;PrintCharLit %1
%endmacro

Bare_enter_check_function:
    pop bx
    mov [tCALLER], bx

    ; remaining before potential GC
    mov bl, [hemi]
    mov bh, 0
    mov ax, sp
    sub ax, [bots + bx]
    ;SeeReg ax

    sub ax, [need]
    cmp ax, 0
    jl .need_to_gc
    jmp .return_to_caller

.need_to_gc:
    ;SeeReg ax
    inc byte [gc_num]
    Debug '['
    ;mov al, [gc_num]
    ;PrintHexAL
    ;Debug ':'
    call gc_start

    ; remaining after GC
    mov bl, [hemi]
    mov bh, 0
    mov ax, sp
    sub ax, [bots + bx]
    ;SeeReg ax
    Debug ']'

    sub ax, [need]
    ;SeeReg ax
    cmp ax, 0
    jl .out_of_memory

.return_to_caller:
    jmp [tCALLER]

.out_of_memory:
    PrintString `[OOM]\n`
    jmp halt


bytesPerWord equ 2

gc_start:
    ;SeeReg sp

    pop ax
    mov [userCaller], ax
    mov [tBP], bp
    mov [tDX], dx
    mov [tCX], cx

    ;; switch heap spaces
    mov bl, [hemi]
    mov bh, 0
    ;SeeReg bx
    inc bx
    inc bx
    and bx, 2
    mov [hemi], bx
    mov bx, [tops + bx]
    ;SeeReg bx
    mov sp, bx

    mov dx, sp ; set scavenge threshold
    ;; evacuate roots...
    ;; frame register
    mov si, [tBP]
    call evacuate
    mov [tBP], si
    ;; arg register
    mov si, [tDX]
    call evacuate
    mov [tDX], si
    ;; continuation register
    mov si, [tCX]
    call evacuate
    mov [tCX], si
    ;; Scavenge objects between sp and dx
    ;; Maybe none of the 3 roots are heap pointers, and there is nothing to do.
    cmp dx, sp
    jz .done_everything
.outer_loop:
    mov cx, sp
    mov bx, sp
    ;; scavenge objects between cx and dx, using bx as pointer
.inner_loop:
    cmp bx, dx
    jg .bad_inner_loop
    mov di, [bx] ; descriptor (size in bytes; maybe tagged as raw-data)
    cmp di, 0
    jz .bad_zero_descriptor
    test di, 1
    jz .scav_payload ; even; payload words must be evacuated
    ;Debug 'R'
    ;;Stop "[RawData]"
    inc di
    add bx, di
    jmp .done_object
.bad_zero_descriptor:
    PrintString `[bad_zero_descriptor!]\n`
    jmp halt
.scav_payload:
    ;Debug '-'
    add bx, bytesPerWord
    shr di, 1
.scav_word:
    mov si, [bx]
    call evacuate
    mov [bx], si
    add bx, bytesPerWord
    dec di
    jne .scav_word
.done_object:
    ;Debug 'd'
    cmp bx, dx
    jne .inner_loop
    mov dx, cx
    cmp sp, cx
    jne .outer_loop
.done_everything:
    mov cx, [tCX]
    mov dx, [tDX]
    mov bp, [tBP]
    jmp [userCaller]
.bad_inner_loop:
    PrintString `\n[Bad_inner_loop]\n`
    SeeReg bx
    SeeReg dx
    jmp halt


evacuate: ;; si --> si (uses: bp)
    ;Debug 'E'
    pop bp
    mov [evacuateCaller], bp
    cmp si, end_of_code
    jb .done ; jb for unsigned comparison!
    test si, 1
    jnz .done ; odd; tagged-number; so dont evacuate
    mov bp, si ; save base
    mov si, [bp - bytesPerWord] ; si has descriptor/size
    cmp si, 0
    jz .use_broken_heart
    ;Debug '('
    and si, 0xfffe ; align to even offset
.loop:
    ;Debug 'c'
    push word [bp + si - bytesPerWord] ;; NOTE: Early Sat buf fix here
    sub si, bytesPerWord
    jnz .loop
    mov si, sp ; si is relocation address
    ;Debug 'c'
    push word [bp - bytesPerWord]
    mov word [bp - bytesPerWord], 0 ; set broken heart
    mov [bp], si ; and relocation address
    ;Debug ')'
    jmp [evacuateCaller]
.use_broken_heart:
    ;Debug 'h'
    mov si, [bp] ; access relocation address from broken heart
    jmp [evacuateCaller]
.done:
    ;Debug 'x'
    jmp [evacuateCaller]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; begin/end

main:
    mov sp, topA
    mov cx, final_continuation
    mov bp, 0
    mov dx, 0

    call Bare_clear_screen
    ;Dump
    jmp bare_start

final_continuation:
    dw final_code

final_code:
    PrintString `[HALT]\n`
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
