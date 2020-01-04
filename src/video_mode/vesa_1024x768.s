# https://github.com/rust-osdev/bootloader/pull/60

.section .boot, "awx"
.intel_syntax noprefix
.code16

# This code is responsible for enabling VESA graphics while in
# real mode.
config_video_mode:
    # Try VESA
    mov ax, 0x9000
    mov es, ax
    mov di, 0
    mov ax, 0x4f00
    int 0x10
    cmp ax, 0x004f
    jne vesa_out
    # Check VESA version 2 or 3
    mov ax, es:[di+4]
    cmp ax, 0x0300
    je init_vesa
    cmp ax, 0x0200
    jne vesa_out
    # Hard coded 1024x768x24bit mode; this gets us the PHY-addr of the FB
init_vesa:
    mov ax, 0x4f01
    mov cx, 0x118
    mov di, vesa_info
    int 0x10
    mov eax, es:[di+0x28]
    mov vesa_fb, eax

    mov ax, 0x4f02
    mov bx, 0x4118
    int 0x10

vesa_out:
    ret

vga_println:
    ret

.code32

vga_map_frame_buffer:
    ret

vesa_fb:
    .word 0
    .word 0

vesa_info:
    .space 256, 0