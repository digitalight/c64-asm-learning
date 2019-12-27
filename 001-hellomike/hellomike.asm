:BasicUpstart2(start)

.pc = $8010 "Main program"

start:
    jsr $e544 // clear the screen
    sei        // disable interupts

Screencol:
    ldy #$02    // Red
    ldx #$00    // Black
    stx $d021   // Store x in background color
    sty $d020    // Store y in foreground color

    // Start of text part
    ldx #$000
    loop:
        lda message,x   // load message into a
        sta $0400,x     // print out character from x
        inx     // iterate each letter
        cpx #$0a    // compare x to #$0a
        bne loop    // break if not equal. ends printing out text.

    // Check for input
    lda $dc01   // Scan the keyboard
    cmp #$ef    // Spacebar pressed
    bne Screencol // Branch if not equal
    rts

message:
.text "hello mike"