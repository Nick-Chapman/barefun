
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
    jmp repl_start

repl_start:
    kcall output_prompt
    mov si, 0
    jmp repl_collect

repl_collect: ;(line)si->
    kcall read_char ;; ->ax
    cmp ax, 13
    jz got_newline
    ;; si := cons(al,si)
    push ax
    push si
    mov si, sp
    kcall emit ;_twice
    jmp repl_collect

got_newline:
    kcall output_newline
    kcall print_chars_from_si
    jmp repl_start

print_chars_from_si:
    cmp si, 0
    jz output_newline
    mov ax, [si+2]
    kcall output_char
    mov si, [si] ;;can we be sure that si is still valid?
    jmp print_chars_from_si

emit_twice: ;ax->
    push ax ;; save as free var...
    kcall emit
    mov ax, [bx+4] ;; ... for access here
    jmp emit

emit: ;al->
    jmp output_char

output_newline:
    mov al,  10
    kcall output_char
    mov al,  13
    jmp output_char

output_prompt:
    mov al, '>'
    jmp output_char

output_x:
    mov al, 'x'
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
