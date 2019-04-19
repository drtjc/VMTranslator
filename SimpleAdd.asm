// push constant i
// *SP=i
// D=const
@7
D=A
// *p=D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// push constant i
// *SP=i
// D=const
@8
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

