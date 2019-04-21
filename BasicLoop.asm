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

// pop local 0
// addr=LCL+0
// D=d
@LCL
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

(LOOP_START)
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

// push local 0
// addr=LCL+0
// D=d
@LCL
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

// pop local 0
// addr=LCL+0
// D=d
@LCL
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

// if-goto LOOP_START
// SP--
@SP
M=M-1
// D=*p
@SP
A=M
D=M
@LOOP_START
D;JNE

// push local 0
// addr=LCL+0
// D=d
@LCL
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

