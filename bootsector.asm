; syscalls are defined here : https://wiki.osdev.org/BIOS

[org 0x7c00]

mov bp, 0xffff
mov sp, bp

call set_video_mode
call boot

jmp $

set_video_mode:
  mov al, 0x03
  mov ah, 0x00
  int 0x10
  ret

boot:
  mov si, message
  mov ah, 0x0e

.loop:
  lodsb 
  cmp al, 0x00
  je get_char_input
  int 0x10
  jmp .loop

get_char_input:
  xor ah, ah
  int 0x16

  mov ah, 0x0e
  int 0x10

  jmp get_char_input

message:
  db "What's up 0xM4t !"

times 0x1fe-($-$$) db 0
dw 0xaa55
