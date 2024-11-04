org 100h     ; Set origin for a .COM file

start:
    mov cx, 10       ; Initialize loop counter for 10 characters (0 to 9)
    mov al, '0'      ; Start with ASCII value for '0'

print_loop:
    ; Print the current number
    mov ah, 0x0E     ; BIOS teletype service to display characters
    int 0x10         ; BIOS interrupt to print the character in AL

    ; Print a space after the number
    push ax          ; Save current value of AL on the stack
    mov al, ' '      ; Load ASCII value for a space
    int 0x10         ; Print the space character
    pop ax           ; Restore original value of AL from the stack

    ; Increment AL to get the next ASCII number
    inc al           ; Increment AL to go to the next number (1, 2, etc.)

    loop print_loop  ; Loop until CX = 0

    ; Terminate program execution
    mov ah, 0x4C     ; DOS service to exit program
    int 0x21         ; Call DOS interrupt
