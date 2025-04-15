;;; running directly from the boot sector; switching to protected mode;
;;; print chars by writing direct to video memory

    bootloader_address equ 0x7c00

    bits 16
    org bootloader_address

    jmp start
    times 0x3e - ($ - $$) db 0x00 ; skip FAT headers

start:
    ;; clear_screen
    mov ax, 0x0003 ; AH=0 AL=3 video mode 80x25
    int 0x10

    ;mov al, 'R'
    ;mov ah, 0x0e ; Function: Teletype output
    ;mov bh, 0
    ;int 0x10

    cli ;; need this to avoid continual restart (flicker)

    mov ax, 0
    mov ds, ax
    lgdt [gdt_desc]

    ;; Enter protected mode
    mov eax, cr0
    or eax, 1
    mov cr0, eax

    jmp code_segment:clear_pipe
    bits 32
clear_pipe:

    mov ax, data_segment
    mov ds, ax
    mov ss, ax

    mov esp, 0x90000 ; but not using the stack

    mov byte [0x0b8000], 'P'
    mov byte [0x0b8001], 0x20

    mov byte [0x0b80a2], 'Q'
    mov byte [0x0b80a3], 0x30

hang:
    jmp hang

gdt_desc:
    ;; Gregor Brunmar tuorial "The world of protected Mode", said db/dw
    ;; but we seem to need dw/dd
    ;; (I guess because we are using 32bit protected mode)
    dw gdt_end - gdt_start ;; 24 bytes. = 3* (2-double-words = 8 bytes)
    dd gdt_start

gdt_start:
    ;; null segment
    dd 0 ; double word = 4 bytes
    dd 0
gdt_code_segment_descriptor:
    dw 0xffff
    dw 0
    db 0
    db 0b10011010
    db 0b11001111
    db 0
gdt_data_segment_descriptor:
    dw 0xffff
    dw 0
    db 0
    db 0b10010010
    db 0b11001111
    db 0
gdt_end:
    code_segment equ (gdt_code_segment_descriptor - gdt_start)
    data_segment equ (gdt_data_segment_descriptor - gdt_start)

%if (gdt_end - gdt_start != 24)
%error unexpected gdt_table_size
%endif

%if (code_segment != 8)
%error unexpected code_segment
%endif

%if (data_segment != 16)
%error unexpected data_segment
%endif

    times 446 - ($ - $$) db 0xff
    ;; PMBR partition table, from byte 446
    db 0, 0, 2, 0, 0xee, 0xff, 0xff, 0xff, 1, 0, 0, 0, 1, 0, 0, 0
    times 510 - ($ - $$) db 0x00
    dw 0xaa55
