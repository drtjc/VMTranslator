(LOOP_START)
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

// goto TEST
@TEST
0;JMP

// if-goto TOM
// SP--
@SP
M=M-1
// D=*p
@SP
A=M
D=M
@TOM
D;JNE

// push static 4
// *SP=d
// D=d
@test.4
D=M
// *p=D
@SP
A=M
M=D
// SP++
@SP
M=M+1

