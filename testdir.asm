// push constant 10
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

// push static 88
// *SP=d
// D=d
@test2.88
D=M
// *p=D
@SP
A=M
M=D
// SP++
@SP
M=M+1

