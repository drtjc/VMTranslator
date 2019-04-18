// push constant i
// *SP=i
// D=const
@15
D=A
// *p=D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// push local 2
// addr=LCL+2
// D=d
@LCL
D=M
// D=D+const
@2
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

// pop argument 100
// addr=ARG+100
// D=d
@ARG
D=M
// D=D+const
@100
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

