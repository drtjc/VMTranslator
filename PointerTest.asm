// push constant i
// *SP=i
// D=const
@3030
D=A
// *p=D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// pop pointer 0
// SP--
@SP
M=M-1
// d=*SP
// D=*p
@SP
A=M
D=M
// d=D
@THIS
M=D

// push constant i
// *SP=i
// D=const
@3040
D=A
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

// push constant i
// *SP=i
// D=const
@32
D=A
// *p=D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// pop this 2
// addr=THIS+2
// D=d
@THIS
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

// push constant i
// *SP=i
// D=const
@46
D=A
// *p=D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// pop that 6
// addr=THAT+6
// D=d
@THAT
D=M
// D=D+const
@6
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

// push pointer 0
// *SP=d
// D=d
@THIS
D=M
// *p=D
@SP
A=M
M=D
// SP++
@SP
M=M+1

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

// push this 2
// addr=THIS+2
// D=d
@THIS
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

// push that 6
// addr=THAT+6
// D=d
@THAT
D=M
// D=D+const
@6
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

