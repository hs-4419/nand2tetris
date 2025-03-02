// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

//// Assembler program for multiplication


// Clearing R2 for storing op
    @R2
    M=0

(LOOP)
    @R0
    D=M
    @END
    D;JEQ

//I have to add R1 D times to R2
    @R1
    D=M
    @R2
    M=D+M

// R0-1
    @R0
    M=M-1
    D=M
    @LOOP
    D;JNE

(END)
    @END
    0;JMP
