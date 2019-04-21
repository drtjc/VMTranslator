// push argument 1
// addr=ARG+1
// D=d
@ARG
D=M
// D=D+const
@1
D=D+A
// d=D
@addr
M=D
// *SP=*p
// D=*p
@addr
A=M
D=M
// *p=D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// pop pointer 1
// SP--
@SP
M=M-1
// d=*SP
// D=*p
@SP
A=M
D=M
// d=D
@THAT
M=D

// push constant 0
// *SP=i
// D=const
@0
D=A
// *p=D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// pop that 0
// addr=THAT+0
// D=d
@THAT
D=M
// D=D+const
@0
D=D+A
// d=D
@addr
M=D
// SP--
@SP
M=M-1
// *p=*SP
// D=*p
@SP
A=M
D=M
// *p=D
@addr
A=M
M=D

// push constant 1
// *SP=i
// D=const
@1
D=A
// *p=D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// pop that 1
// addr=THAT+1
// D=d
@THAT
D=M
// D=D+const
@1
D=D+A
// d=D
@addr
M=D
// SP--
@SP
M=M-1
// *p=*SP
// D=*p
@SP
A=M
D=M
// *p=D
@addr
A=M
M=D

// push argument 0
// addr=ARG+0
// D=d
@ARG
D=M
// D=D+const
@0
D=D+A
// d=D
@addr
M=D
// *SP=*p
// D=*p
@addr
A=M
D=M
// *p=D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// push constant 2
// *SP=i
// D=const
@2
D=A
// *p=D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// sub
// SP--
@SP
M=M-1
// D=*p
@SP
A=M
D=M
// SP--
@SP
M=M-1
@SP
A=M
D=M-D
// *p=D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// pop argument 0
// addr=ARG+0
// D=d
@ARG
D=M
// D=D+const
@0
D=D+A
// d=D
@addr
M=D
// SP--
@SP
M=M-1
// *p=*SP
// D=*p
@SP
A=M
D=M
// *p=D
@addr
A=M
M=D

(MAIN_LOOP_START)
// push argument 0
// addr=ARG+0
// D=d
@ARG
D=M
// D=D+const
@0
D=D+A
// d=D
@addr
M=D
// *SP=*p
// D=*p
@addr
A=M
D=M
// *p=D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// if-goto COMPUTE_ELEMENT
// SP--
@SP
M=M-1
// D=*p
@SP
A=M
D=M
@COMPUTE_ELEMENT
D;JNE

// goto END_PROGRAM
@END_PROGRAM
0;JMP

(COMPUTE_ELEMENT)
// push that 0
// addr=THAT+0
// D=d
@THAT
D=M
// D=D+const
@0
D=D+A
// d=D
@addr
M=D
// *SP=*p
// D=*p
@addr
A=M
D=M
// *p=D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// push that 1
// addr=THAT+1
// D=d
@THAT
D=M
// D=D+const
@1
D=D+A
// d=D
@addr
M=D
// *SP=*p
// D=*p
@addr
A=M
D=M
// *p=D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// add
// SP--
@SP
M=M-1
// D=*p
@SP
A=M
D=M
// SP--
@SP
M=M-1
@SP
A=M
D=D+M
// *p=D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// pop that 2
// addr=THAT+2
// D=d
@THAT
D=M
// D=D+const
@2
D=D+A
// d=D
@addr
M=D
// SP--
@SP
M=M-1
// *p=*SP
// D=*p
@SP
A=M
D=M
// *p=D
@addr
A=M
M=D

// push pointer 1
// *SP=d
// D=d
@THAT
D=M
// *p=D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// push constant 1
// *SP=i
// D=const
@1
D=A
// *p=D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// add
// SP--
@SP
M=M-1
// D=*p
@SP
A=M
D=M
// SP--
@SP
M=M-1
@SP
A=M
D=D+M
// *p=D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// pop pointer 1
// SP--
@SP
M=M-1
// d=*SP
// D=*p
@SP
A=M
D=M
// d=D
@THAT
M=D

// push argument 0
// addr=ARG+0
// D=d
@ARG
D=M
// D=D+const
@0
D=D+A
// d=D
@addr
M=D
// *SP=*p
// D=*p
@addr
A=M
D=M
// *p=D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// push constant 1
// *SP=i
// D=const
@1
D=A
// *p=D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// sub
// SP--
@SP
M=M-1
// D=*p
@SP
A=M
D=M
// SP--
@SP
M=M-1
@SP
A=M
D=M-D
// *p=D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// pop argument 0
// addr=ARG+0
// D=d
@ARG
D=M
// D=D+const
@0
D=D+A
// d=D
@addr
M=D
// SP--
@SP
M=M-1
// *p=*SP
// D=*p
@SP
A=M
D=M
// *p=D
@addr
A=M
M=D

// goto MAIN_LOOP_START
@MAIN_LOOP_START
0;JMP

(END_PROGRAM)
