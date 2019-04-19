// push constant i
// *SP=i
// D=const
@10
D=A
// *p=D
@SP
A=M
M=D
// SP++
@SP
M=M+1

