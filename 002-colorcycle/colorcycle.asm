:BasicUpstart2(start)


.pc = $8010 "Main program"
start:
    jsr $e544 // clear the screen
    sei        // disable interupts

cycle:
   inc $d020
   inc $d021
   jmp cycle
   rts