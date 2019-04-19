// push constant i
// *SP=i
// D=const
@17
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
@17
D=A
// *p=D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// eq
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
@JMPt_0
D;JEQ
D=0
@JMPf_0
0;JMP
(JMPt_0)
D=-1
(JMPf_0)
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
@17
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
@16
D=A
// *p=D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// eq
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
@JMPt_1
D;JEQ
D=0
@JMPf_1
0;JMP
(JMPt_1)
D=-1
(JMPf_1)
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
@16
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
@17
D=A
// *p=D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// eq
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
@JMPt_2
D;JEQ
D=0
@JMPf_2
0;JMP
(JMPt_2)
D=-1
(JMPf_2)
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
@892
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
@891
D=A
// *p=D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// lt
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
@JMPt_3
D;JLT
D=0
@JMPf_3
0;JMP
(JMPt_3)
D=-1
(JMPf_3)
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
@891
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
@892
D=A
// *p=D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// lt
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
@JMPt_4
D;JLT
D=0
@JMPf_4
0;JMP
(JMPt_4)
D=-1
(JMPf_4)
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
@891
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
@891
D=A
// *p=D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// lt
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
@JMPt_5
D;JLT
D=0
@JMPf_5
0;JMP
(JMPt_5)
D=-1
(JMPf_5)
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
@32767
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
@32766
D=A
// *p=D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// gt
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
@JMPt_6
D;JGT
D=0
@JMPf_6
0;JMP
(JMPt_6)
D=-1
(JMPf_6)
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
@32766
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
@32767
D=A
// *p=D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// gt
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
@JMPt_7
D;JGT
D=0
@JMPf_7
0;JMP
(JMPt_7)
D=-1
(JMPf_7)
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
@32766
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
@32766
D=A
// *p=D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// gt
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
@JMPt_8
D;JGT
D=0
@JMPf_8
0;JMP
(JMPt_8)
D=-1
(JMPf_8)
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
@57
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
@31
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
@53
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

// push constant i
// *SP=i
// D=const
@112
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

// neg
// SP--
@SP
M=M-1
@SP
A=M
M=-M
// SP++
@SP
M=M+1

// and
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
D=D&M
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
@82
D=A
// *p=D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// or
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
D=D|M
// *p=D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// not
// SP--
@SP
M=M-1
@SP
A=M
M=!M
// SP++
@SP
M=M+1

