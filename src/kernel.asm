
    %include "src/layout.asm"

    bits 16
    org kernel_load_address

    jmp start

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; current continuation (register bp)
;;; bx is the frane pointer, from which we an access free variables
%macro kret 0
    mov bx, bp
    mov bp, [bp+2]
    jmp [bx]
%endmacro

%macro kcall 1
    push bp
    push %%after
    mov bp, sp
    jmp %1
%%after:
%endmacro

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; start

top_of_memory equ 0

start:
    mov sp, top_of_memory
    kcall clear_screen
    jmp repl

repl:
    kcall read_char ;; ->ax
    kcall emit_twice
    jmp repl

emit_twice: ;ax->
    push ax ;; save as free var...
    kcall emit
    mov ax, [bx+4] ;; ... for access here
    jmp emit

emit: ;ax->
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

output_char: ; al->
    mov ah, 0x0e ; Function: Teletype output
    mov bh, 0
    int 0x10
    ;mov ax, 0x77 ; splat so we can be sure we saved
    kret

read_char: ; ->ax
    mov ah, 0
    int 0x16
    mov ah, 0
    kret
