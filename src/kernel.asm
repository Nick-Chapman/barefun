
    %include "src/layout.asm"

    bits 16
    org kernel_load_address

    jmp start

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; start

return_stack_base equ 0 ; top of memory
param_stack_base equ 0xfc00 ; allowing 1k for return stack (512 cells)

start:
    mov sp, return_stack_base
    mov bp, param_stack_base
    call clear_screen
.loop:
    call _key
    ;;call _dup
    ;;call _emit
    call _emit
    jmp .loop

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; print macro

%macro print 1
    push di
    jmp %%after
%%message: db %1, 0
%%after:
    mov di, %%message
    call print_string
    pop di
%endmacro

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Parameter stack (register: bp)

%macro pspush 1
    sub bp, 2
    mov [bp], %1
%endmacro

check_ps_underflow:
    cmp bp, param_stack_base
    jb .ok
    sub bp, 2
    mov word [bp], 0
    print "stack underflow."
    call output_newline
    call crash
.ok:
    ret

%macro pspop 1
    call check_ps_underflow
    mov %1, [bp]
    add bp, 2
%endmacro

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; underscore ops; use parameter stack

_key:
    call read_char
    mov ah, 0
    pspush ax
    ret

_dup:
    mov ax, [bp]
    mov [bp-2], ax
    sub bp, 2
    ret

_emit:
    pspop ax
    cmp ax, 13
    jz output_newline
    cmp ax, 10
    jz output_newline
    jmp output_char

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; non-underscore ops -- use specific regs

print_string: ; in: DI=string; print null-terminated string.
    push ax
    push di
.loop:
    mov al, [di]
    cmp al, 0 ; null?
    je .done
    call output_char
    inc di
    jmp .loop
.done:
    pop di
    pop ax
    ret

crash:
    print "We have crashed. (any key will quit)"
    call output_newline
    call read_char ; wait for a key to be pressed, then quit system
    jmp quit

output_newline:
    mov al,  10
    call output_char
    mov al,  13
    call output_char
    ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; primitive BIOS ops

quit:
    mov ax, 0x5307
    mov bx, 0x0001
    mov cx, 0x0003
    int 0x15
.loop:
    jmp .loop

clear_screen:
    mov ax, 0x0003 ; AH=0 AL=3 video mode 80x25
    int 0x10
    ret

output_char: ; in: AL=char
    mov ah, 0x0e ; Function: Teletype output
    mov bh, 0
    int 0x10
    ret

read_char: ; out: AL=char
    mov ah, 0
    int 0x16
    ret
