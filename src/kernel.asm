
    %include "src/layout.asm"

    bits 16
    org kernel_load_address

    jmp start

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; current continuation (register bp)

%macro kret 0
    jmp bp
%endmacro

%macro kcall 1
    push bp
    mov bp, %%after
    jmp %1
%%after:
    pop bp
%endmacro

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; start

top_of_memory equ 0

start:
    mov sp, top_of_memory
    kcall clear_screen
.loop:
    kcall read_char
    push ax
    kcall emit
    pop ax
    kcall emit
    jmp .loop

emit:
    cmp ax, 13
    jz output_newline
    cmp ax, 10
    jz output_newline
    jmp output_char

output_newline:
    mov al,  10
    kcall output_char
    mov al,  13
    jmp output_char

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; primitive BIOS ops

clear_screen:
    mov ax, 0x0003 ; AH=0 AL=3 video mode 80x25
    int 0x10
    kret

output_char: ; in: AL=char
    mov ah, 0x0e ; Function: Teletype output
    mov bh, 0
    int 0x10
    kret

read_char: ; out: AX=char
    mov ah, 0
    int 0x16
    mov ah, 0
    kret
