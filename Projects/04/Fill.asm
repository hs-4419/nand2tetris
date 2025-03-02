// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

//// Assembly code to change screen based on keyboard input

// Making screen black
//@SCREEN + 8192 has to be set as -1
//Imagine SCRREN to be at index 1

(MAIN)
    @KBD
    D=M

    @BLACK_SCREEN
    D;JGT

    @WHITE_SCREEN
    D;JEQ


(BLACK_SCREEN)
        @8191
        D=A
        @i
        M=D

    (BLACK_SCREEN_LOOP)
        @i
        D=M
        @MAIN
        D;JLT

        @SCREEN
        A=D+A
        M=-1

        @i
        M=M-1
        D=M

        @BLACK_SCREEN_LOOP
        D;JGE

        @MAIN
        D;JLT


(WHITE_SCREEN)
        @8191
        D=A
        @i
        M=D

    (WHITE_SCREEN_LOOP)
        @i
        D=M
        @MAIN
        D;JLT

        @SCREEN
        A=D+A
        M=0

        @i
        M=M-1
        D=M

        @WHITE_SCREEN_LOOP
        D;JGE

        @MAIN
        D;JLT


(END)
    @END
    0;JMP
