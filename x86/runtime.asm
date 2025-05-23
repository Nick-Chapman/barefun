;;; This file provides runtime support for a compiled barefun program.
;;; Assemble using nasm:
;;;   $ nasm -Werror -dCODE="'code.asm'" x86/runtime.asm -o image
;;;
;;; [code.asm] is the output file from the barefun compiler.
;;; It must provide a definition for the label "baree_start".
;;;
;;; The resulting image can be run using qemu:
;;;   $ qemu-system-i386 image
;;;
;;; Sections in This file:
;;; - (1) Layout
;;; - (2) Bootloader: entry
;;; - (3) Bootloader: relocated
;;; - (4) Kernel entry: "main"
;;; - (4) Macros: Out, Print*, and other debug helpers
;;; - (5) Miscellaneous defs: clear_screen; print_string; final_code; halt, etc
;;; - (6) Garbage Collection
;;; - (7) "Bare_" routines (called from embedded user code)
;;; - (8) Interrupt support (only for scancode based keyboard access)
;;; - (9) Embedded User code. Must provide "bare_start"
;;; - (10) Size checks
;;; - (11) Embedded disk image

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; (1) Layout

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
;;;; (2) Bootloader: entry

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
;;;; (3) Bootloader: relocated

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
;;;; (4) Kernel entry: "main"

    section KERNEL follows=BOOTSECTOR vstart=kernel_load_address

main:
    mov sp, topA
    mov bp, 0
    mov si, 0

    call clear_screen
    jmp bare_start

CurrentCont:
    dw final_continuation

final_continuation:
    dw final_code

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; (4) Macros: Out, Print*, and other debug helpers

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
    PrintCharLit '('
    push ax
    mov al, ah
    PrintHexAL
    pop ax
    PrintHexAL
    PrintCharLit ')'
%endmacro

%macro PrintString 1
    push di
    jmp %%after
%%message: db %1, 0
%%after:
    mov di, %%message
    call print_string
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

%macro Div 1
    idiv %1
%endmacro

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; (5) Miscellaneous defs: clear_screen; print_string; final_code; halt, etc

clear_screen:
    mov ax, 0x0003 ; AH=0 AL=3 video mode 80x25
    int 0x10
    ret

hex_data: db "0123456789abcdef"

print_string: ; in: DI=string; print null-terminated string.
    push ax
    push di
.loop:
    mov al, [di]
    cmp al, 0
    jz .done
    mov ah, 0
    call Bare_put_char
    inc di
    jmp .loop
.done:
    pop di
    pop ax
    ret

final_code:
    PrintString `[HALT]\n`
    jmp halt

halt:
    hlt ;; avoid spinning the fans
    jmp halt

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; (6) Garbage Collection

;; GC roots; must match stage5 calling conventions
%define ArgReg si
%define FrameReg bp

%macro Bare_enter_check 1
    mov word [need], %1
    jz %%no_need
    call Bare_enter_check_function
%%no_need:
%endmacro

need: dw 0

hemi_size equ 5000 ; match stage5 emulator
redzone_size equ 300 ; needed for save/restore & also for interrupts. how big should this be?

topA equ 0x0000
botA equ topA - hemi_size
topB equ botA - redzone_size
botB equ topB - hemi_size

which_hemi: db 0 ; flips every GC: 0,2,0,2,... indexes: top_of_hemi/bottom_of_hemi
top_of_hemi: dw topA, topB
bottom_of_hemi: dw botA, botB

gc_num: db 0

%macro Debug 1
    ;PrintCharLit %1 ; uncomment for GC debug
%endmacro

%macro DebugSeeReg 1
    ;SeeReg %1 ; uncomment for GC debug
%endmacro

Bare_enter_check_function:
    pop bx
    mov [tCALLER], bx

    ; space remaining before potential GC
    mov bl, [which_hemi]
    mov bh, 0
    mov ax, sp
    sub ax, [bottom_of_hemi + bx]

    sub ax, [need]
    cmp ax, 0
    jl .need_to_gc
    ;jmp .need_to_gc ; uncomment to GC every safe point; extreme testing!
    jmp .return_to_caller

.need_to_gc:
    inc byte [gc_num]
    Debug '['
    ;mov al, [gc_num]
    ;PrintHexAL
    ;Debug ':'
    call gc_start

    ; space remaining after GC
    mov bl, [which_hemi]
    mov bh, 0
    mov ax, sp
    sub ax, [bottom_of_hemi + bx]
    ;SeeReg ax
    Debug ']'
    sub ax, [need]
    cmp ax, 0
    jl .out_of_memory

.return_to_caller:
    jmp [tCALLER]

.out_of_memory:
    PrintString `[OOM]\n`
    jmp halt

bytesPerWord equ 2

tArg: dw 0
tFrame dw 0
tCALLER dw 0

gc_start:
    pop ax
    mov [.caller], ax
    mov [tFrame], FrameReg
    mov [tArg], ArgReg

    ;; switch heap spaces
    mov bl, [which_hemi]
    mov bh, 0
    inc bx
    inc bx
    and bx, 2
    mov [which_hemi], bx
    mov bx, [top_of_hemi + bx]
    mov sp, bx

    mov dx, sp ; set scavenge threshold
    ;; evacuate roots...
    ;; frame register
    mov si, [tFrame]
    call evacuate
    mov [tFrame], si
    ;; arg register
    mov si, [tArg]
    call evacuate
    mov [tArg], si
    ;; current continuation
    mov si, [CurrentCont]
    call evacuate
    mov [CurrentCont], si
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
    DebugSeeReg bx
    mov di, [bx] ; descriptor (size in bytes; maybe tagged as raw-data)
    DebugSeeReg di
    cmp di, 0
    jz .bad_zero_descriptor
    test di, 1
    jz .scav_payload ; even; payload words must be evacuated
    ;; skip over raw data objects
    inc di
    add bx, di
    jmp .done_object
.bad_zero_descriptor:
    PrintString `[bad_zero_descriptor!]\n`
    jmp halt
.scav_payload:
    Debug '-'
    add bx, bytesPerWord
    shr di, 1
.scav_word:
    Debug ','
    mov si, [bx]
    call evacuate
    mov [bx], si
    add bx, bytesPerWord
    dec di
    jne .scav_word
.done_object:
    cmp bx, dx
    jne .inner_loop
    mov dx, cx
    cmp sp, cx
    jne .outer_loop
.done_everything:
    mov ArgReg, [tArg]
    mov FrameReg, [tFrame]
    jmp [.caller]
.bad_inner_loop:
    PrintString `\n[Bad_inner_loop]\n`
    SeeReg bx
    SeeReg dx
    jmp halt
.caller:
    dw 0

toobig:
    Stop `[Bad descriptor]\n`

evacuate: ;; si --> si (uses: bp)
    Debug 'e'
    pop bp
    mov [.caller], bp
    cmp si, end_of_code
    jb .done ; jb for unsigned comparison!
    test si, 1
    jnz .done ; odd; tagged-number; so dont evacuate
    mov bp, si ; save base
    mov si, [bp - bytesPerWord] ; si has descriptor/size
    test si, 0xf000
    jnz toobig
    cmp si, 0
    jz .use_broken_heart
    Debug '('
    and si, 0xfffe ; align to even offset

    DebugSeeReg bp
    mov ax, [bp - bytesPerWord]
    DebugSeeReg ax
.loop:
    Debug 'c'
    push word [bp + si - bytesPerWord]
    sub si, bytesPerWord
    jnz .loop

    mov si, sp ; si is relocation address
    Debug 'd'

    DebugSeeReg bp
    mov ax, [bp - bytesPerWord]
    DebugSeeReg ax
    test ax, 0xf000
    jnz toobig

    push word [bp - bytesPerWord]
    mov word [bp - bytesPerWord], 0 ; set broken heart
    mov [bp], si ; and relocation address

    Debug ')'
    jmp [.caller]
.use_broken_heart:
    Debug 'h'
    mov si, [bp] ; access relocation address from broken heart
    jmp [.caller]
.done:
    jmp [.caller]
.caller:
    dw 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; (7) "Bare_" routines (called from embedded user code)

Bare_crash:
    mov di, bx
    add di, 2  ; +2 for the length
    mov bx, [bx]
    sar bx, 1 ; untag
    mov byte [di+bx], 0 ; splat with null; very hacky; but were going to stop anyway
    call print_string
    jmp final_code

BS equ 8
LF equ 10
CR equ 13
DEL equ 127

;;; Read a key press (Converting CR to LF; BS to DEL)
Bare_get_char: ; -> ax
    cmp byte [interrupt_mode], 1
    jz .err
    mov ah, 0
    int 0x16
    mov ah, 0
    cmp ax, BS
    jz .bs
    cmp ax, CR
    jz .cr
    ret
.cr:
    mov ax, LF
    ret
.bs:
    mov ax, DEL
    ret
.err:
    Stop `[Bare_get_char:does not work in interrupt_mode]\n`

;;; Print to the screen (Converting LF to CR/LF; showing unprintable chars as escaped hex)
Bare_put_char: ; al->
    cmp ax, BS
    jz .normal ; put the BS as normal to move cursor back one position
    cmp ax, LF
    jz .nl
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

%macro EnsureZeroAH 1
    cmp ah, 0
    jz %%ok
    Stop %1
%%ok:
%endmacro

Bare_num_to_char:
    mov ah, 0 ; mod 256
    EnsureZeroAH `[Bare_num_to_char]]\n`
    ret

Bare_char_to_num:
    EnsureZeroAH `[Bare_char_to_num]]\n`
    ret


;;; in: ax -- number of bytes (as tagged number) for user data
;;; out: ax -- new string/bytes object, allocated on the heap (at sp)
;;; trashes: bx (temp for return), dx (temp calculation)
Bare_make_bytes_jump:
    ;;Stop `[Bare_make_bytes_jump]\n` ;; TODO
    mov ArgReg, ax

    shr ax, 1 ; untag
    mov word [need], ax
    call Bare_enter_check_function

    mov ax, ArgReg
    mov dx, ArgReg

    shr dx, 1       ; untag, to get number of bytes to..
    inc dx          ; round up and..
    and dx, 0xfffe  ; .. align to even
    sub sp, dx      ; slide stack pointer (allocated space is not uninializaed)

    push ax         ; tagged length word; part of user data
    mov ax, sp      ; grab result (before pushing the descriptor)
    add dx, 3       ; add 2 bytes for the length word; +1 to tag as raw data
    push dx         ; descriptor/size word; part of GC data

    mov ArgReg, ax  ; TODO: just assign directly

    ;; return: (code copied from gen code) -- TODO: can we not do better?
    mov bp, [CurrentCont]
    mov ax, [bp+2]
    mov [CurrentCont], ax
    jmp [bp]

;;; in: ax -- number of bytes (as tagged number) for user data
;;; out: ax -- new string/bytes object, allocated on the heap (at sp)
;;; trashes: bx (temp for return), dx (temp calculation)
Bare_make_bytes: ;; TODO: kill
    pop bx          ; save return address.
    mov dx, ax

    shr dx, 1       ; untag, to get number of bytes to..
    inc dx          ; round up and..
    and dx, 0xfffe  ; .. align to even
    sub sp, dx      ; slide stack pointer (allocated space is not uninializaed)

    push ax         ; tagged length word; part of user data
    mov ax, sp      ; grab result (before pushing the descriptor)
    add dx, 3       ; add 2 bytes for the length word; +1 to tag as raw data
    push dx         ; descriptor/size word; part of GC data
    jmp bx          ; return

Bare_get_bytes:
    add bx, 2 ; length word
    add bx, ax
    mov al, [bx]
    mov ah, 0
    ret

;;; val set_bytes : bytes -> int -> char -> unit
;;; in: ax (bytes)
;;; in: bx (int)
;;; in: dl (char)
Bare_set_bytes:
    add bx, 2 ; length word
    add bx, ax
    mov byte [bx], dl
    ret

;;; ax: The sector number
;;; bx: The bytes buffer to load into
Bare_load_sector:
    mov dx, ax
    mov ah, 0x42
    jmp load_or_store_sector

;;; ax: The sector number
;;; bx: The bytes buffer to store from
Bare_store_sector:
    mov dx, ax
    mov ah, 0x43
    jmp load_or_store_sector

;;; ah: 0x42(load) or 0x43(store)
;;; dx: The sector number
;;; bx: The bytes buffer to store from
load_or_store_sector:
    add dx, embedded_sector_offset
    add bx, 2 ; dest buffer; skip length word
    mov [dap.LBA_start_lo], dx
    mov [dap.transfer_buffer], bx
    push si
    mov si, dap
    mov dl, [drive_number]
    int 0x13
    pop si
    ret
dap:
.packet_size db 16
.always_zero db 0
.number_of_sectors dw 1
.transfer_buffer dw 0,0
.LBA_start_lo dw 0,0
.LBA_start_hi dw 0,0
%assign DapSize ($ - dap)
%if DapSize != 16
%error Expected Dap size of 16, but got DapSize
%endif


Bare_unit:
    dw 1 ; doesn't matter what is here. nothing should look at this

;;; --> ax (Number of words available in Heap; as untagged number)
Bare_free_words:
    mov bl, [which_hemi]
    mov bh, 0
    mov ax, sp
    sub ax, [bottom_of_hemi + bx] ; compute difference between sp and heap base
    shr ax, 1                     ; shift for #words
    ret

Bare_get_ticks:
    mov word ax, [ticker]
    ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; (8) Interrupt support (only for scancode based keyboard access)

ticker_freq_htz equ 100

;;;pic offsets must be a multiple of 8
pic1_offset equ 32
pic2_offset equ 40

end_of_interrupt_command equ 0x20

timer_slot equ pic1_offset

setup_timer_interrupt:
    cli ; disable interrupts while we set things up.
    mov word [4*timer_slot+0], irq0
    mov word [4*timer_slot+2], 0
    call set_pit_freq
    call remap_pic
    call pic_mask_all_but_timer
    sti ; re-enable here
    ret

ticker: dw 0 ; 16 bits; at 1KHz this cycles in 65 seconds

irq0:
    ;;PrintCharLit '+' ; no print from here
    inc word [ticker]
    Out pic1_cmd, end_of_interrupt_command
    iret

keyboard_data_port equ 0x60
keyboard_status_port equ 0x64

interrupt_mode: db 0

;;; Examples which require access to keyboard scan-codes must call Bare_init_scancode_mode
;;; This enables:
;;; -- Bare_is_keyboard_ready
;;; -- Bare_get_keyboard_last_scancode
;;; And disables:
;;; -- Bare_get_char

Bare_init_interrupt_mode:
    mov byte [interrupt_mode], 1
    call setup_timer_interrupt
    ret

;;; sets Z when not ready
Bare_is_keyboard_ready: ; ripe for inlining
    cmp byte [interrupt_mode], 0
    jz .err
    in al, keyboard_status_port
    test al, 0x01 ; output buffer has something?
    ret
.err:
    Stop `[Bare_is_keyboard_ready: must be in interrupt_mode]\n`

Bare_get_keyboard_last_scancode: ; ripe for inlining
    cmp byte [interrupt_mode], 0
    jz .err
    in al, keyboard_data_port
    mov ah, 0
    ret
.err:
    Stop `[Bare_get_keyboard_last_scancode: must be in interrupt_mode]\n`

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

pic_mask_all_but_timer:
    Out pic1_data, 0xfe
    Out pic2_data, 0xff
    ret

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
;;;; (9) Embedded User code. Must provide "bare_start"

%include CODE

end_of_code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; (10) Size checks

;; Size allocated in layout.asm:
%assign As kernel_size_in_sectors       ; in sectors
%assign Ab (As * sector_size)           ; in bytes

;; Size we actually require:
%assign Rb ($ - $$)                     ; in bytes
%assign Rs (1 + ((Rb-1)/sector_size))   ; in sectors

%if Rb>Ab
%error Kernel sectors allocated: As, required: Rs
%endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; (11) Embedded disk image

embedded_sector_offset equ kernel_size_in_sectors + 1 ;;; 1 for bootloader

times (512 * kernel_size_in_sectors - ($ - $$)) db 0

incbin "disk.image"
