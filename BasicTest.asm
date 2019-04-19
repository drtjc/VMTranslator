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

// push constant i
// *SP=i
// D=const
@21
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
@22
D=A
// *p=D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// pop argument 2
// addr=ARG+2
// D=d
@ARG
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

// pop argument 1
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
@36
D=A
// *p=D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// pop this 6
// addr=THIS+6
// D=d
@THIS
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

// push constant i
// *SP=i
// D=const
@42
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
@45
D=A
// *p=D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// pop that 5
// addr=THAT+5
// D=d
@THAT
D=M
// D=D+const
@5
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

// push constant i
// *SP=i
// D=const
@510
D=A
// *p=D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// pop temp 6
// addr=5+6
// D=const
@5
D=A
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

// push that 5
// addr=THAT+5
// D=d
@THAT
D=M
// D=D+const
@5
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

// push this 6
// addr=THIS+6
// D=d
@THIS
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

// push this 6
// addr=THIS+6
// D=d
@THIS
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

// push temp 6
// addr=5+6
// D=const
@5
D=A
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

