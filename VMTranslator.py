#import sys
#import os
#from collections import UserDict
#from typing import Dict






# # symbol table #########################################################
# class SymbolTable(UserDict):

#     def __init__(self):
#         super().__init__()

#         for i in range(16):
#             self['R' + str(i)] = i

#         self['SCREEN'] = 16384
#         self['KBD'] = 24576

#         self['SP'] = 0
#         self['LCL'] = 1
#         self['ARG'] = 2
#         self['THIS'] = 3
#         self['THAT'] = 4

#         self.var_idx = 16

#     def add_label(self, label: str, value: int):
#         self[label] = value

#     def add_variable(self, var: str):
#         if var not in self:
#             self[var] = self.var_idx
#             self.var_idx += 1

# ########################################################################


# # parser ###############################################################
# class Parser():

#     def __init__(self, symbol_table: SymbolTable):
#         self.line = ""
#         self.line_no = -1
#         self.symbol_table = symbol_table
#         self._first_pass = True

#     @property
#     def first_pass(self) -> bool:
#         return self._first_pass

#     @first_pass.setter
#     def first_pass(self, fp: bool) -> None:
#         if fp != self._first_pass:
#             self.line_no = -1
#         self._first_pass = fp
        
#     def parse(self, line: str):

#         # remove newline
#         # remove leading and trailing spaces
#         # remove comments
#         self.line = line.rstrip('\n').strip().split('//')[0].rstrip()

#         if self.line and self.line[0] == "(" and self.line[-1] == ")":
#             # label symbol (which is not a line of code)
#             label = self.line[1:-1]
#             self.line = ""

#             # add symbol to symbol table
#             if self.first_pass:
#                 self.symbol_table.add_label(label, self.line_no + 1)
            
#         # if line is not empty then increment line_no
#         if self.line:
#             self.line_no += 1

#         if not self.first_pass:
#             if self.line and self.line[0] == "@":
#                 # variable symbol or goto (a label symbol) or integer
#                 var = self.line[1:]
#                 if not var.isdigit():            
#                     self.symbol_table.add_variable(var)
#                     self.line = "@" + str(self.symbol_table[var])

#         return self.line

# ########################################################################


# # code #################################################################
# class Code():

#     A_SIZE = 15

#     dest_table = {}
#     dest_table[''] = '000'
#     dest_table['M'] = '001'
#     dest_table['D'] = '010'
#     dest_table['MD'] = '011'
#     dest_table['A'] = '100'
#     dest_table['AM'] = '101'
#     dest_table['AD'] = '110'
#     dest_table['AMD'] = '111'
    
#     comp_table = {}
#     comp_table['0'] = ('0', '101010')
#     comp_table['1'] = ('0', '111111')
#     comp_table['-1'] = ('0', '111010')
#     comp_table['D'] = ('0', '001100')
#     comp_table['A'] = ('0', '110000')    
#     comp_table['!D'] = ('0', '001101')
#     comp_table['!A'] = ('0', '110001')
#     comp_table['-D'] = ('0', '001111')
#     comp_table['-A'] = ('0', '110011')
#     comp_table['D+1'] = ('0', '011111')
#     comp_table['A+1'] = ('0', '110111')
#     comp_table['D-1'] = ('0', '001110')
#     comp_table['A-1'] = ('0', '110010')
#     comp_table['D+A'] = ('0', '000010')
#     comp_table['D-A'] = ('0', '010011')
#     comp_table['A-D'] = ('0', '000111')
#     comp_table['D&A'] = ('0', '000000')
#     comp_table['D|A'] = ('0', '010101')
#     comp_table['M'] = ('1', '110000')
#     comp_table['!M'] = ('1', '110001')
#     comp_table['-M'] = ('1', '110011')
#     comp_table['M+1'] = ('1', '110111')
#     comp_table['M-1'] = ('1', '110010')
#     comp_table['D+M'] = ('1', '000010')
#     comp_table['D-M'] = ('1', '010011')
#     comp_table['M-D'] = ('1', '000111')
#     comp_table['D&M'] = ('1', '000000')
#     comp_table['D|M'] = ('1', '010101')

#     jump_table = {}
#     jump_table[''] = '000'
#     jump_table['JGT'] = '001'
#     jump_table['JEQ'] = '010'
#     jump_table['JGE'] = '011'
#     jump_table['JLT'] = '100'
#     jump_table['JNE'] = '101'
#     jump_table['JLE'] = '110'
#     jump_table['JMP'] = '111'
 
#     @classmethod
#     def dec_bin(cls, dec: int, digit: int) -> str:
#         if dec >= 0:
#             bin1 = bin(dec).split("0b")[1]
#             while len(bin1) < digit:
#                 bin1 = '0' + bin1
#             return bin1
#         else:
#             bin1 = str(-1 * dec)
#             return bin(dec - pow(2, digit)).split("0b")[1]

#     def code(self, instruction: str) -> str:
#         if instruction[0] == "@": # A-instruction
#             return self._a_instruction(instruction)
#         else: # C-instruction
#             return self._c_instruction(instruction)

#     def _a_instruction(self, instruction: str) -> str:
#             A_10 = int(instruction[1:])
#             A_2 = self.dec_bin(A_10, self.A_SIZE)
#             b = '0' + A_2
#             return b

#     def _c_instruction(self, instruction: str) -> str:
#         dest = ""
#         comp = ""
#         jump = ""

#         s1 = instruction.split('=')
#         if len(s1) != 1: # there is a = sign
#             dest = s1[0].strip()
#             s2 = s1[1].strip()
#         else:
#             s2 = s1[0]

#         s3 = s2.split(';')
#         comp = s3[0].strip()
#         if len(s3) != 1: # there is a ; sign
#             jump = s3[1]
  
#         b = "111" # C-instruction always starts with 111 
#         b = b + self.comp_table[comp][0] + self.comp_table[comp][1]
#         b = b + self.dest_table[dest]
#         b = b + self.jump_table[jump] 

#         return b

# ########################################################################

import sys
import os
from enum import Enum, auto
from typing import Dict, List

class CommandType(Enum):
    NONE = auto()
    ARITHMETIC = auto()
    PUSH = auto()
    POP = auto()
    LABEL = auto()
    GOTO = auto()
    IF = auto()
    FUNCTION = auto()
    RETURN = auto()
    CALL = auto()

command_name: Dict[CommandType, str] = {
    'push': CommandType.PUSH, 
    'pop': CommandType.POP
}    

base_addr: Dict[str, int] = {
    'local': 1015
}

pointers: Dict[str, str] = {
    'stack': 'SP',
    'local': 'LCL',
    'argument': 'ARG',
    'this': 'THIS',
    'that': 'THAT'
}

# Parser ###############################################################
class Parser():

    def __init__(self):
        self._empty()

    def _empty(self):
        self.line = ""
        self.command = ""
        self.command_type = CommandType.NONE
        self.arg1 = ""
        self.arg2 = ""

    def parse(self, line: str):
        self.line = line

        # remove newline
        # remove leading and trailing spaces
        # remove comments
        self.command = line.rstrip('\n').strip().split('//')[0].rstrip()
        
        if self.command: # line contains an instruction
            c = self.command.split() # get components
            if len(c) == 1: # ARITHMETIC
                self.command_type = CommandType.ARITHMETIC
                self.arg1 = c[0].lower()
            else:
                self.command_type = command_name[c[0].lower()]
                self.arg1 = c[1]
                if len(c) == 3:
                    self.arg2 = c[2]
        else:
            self._empty()
########################################################################


# CodeWriter ###########################################################
class CodeWriter():
    
    def write(self, command: CommandType, arg1: str, arg2: str):
        pass

    def _increment_SP(self) -> List[str]: 
        return ['// SP++',
                '@SP', 
                'M=M+1']

    def _decrement_SP(self) -> List[str]: 
        return ['// SP--',
                '@SP', 
                'M=M-1']    

    def _p_eq(self, p: str) -> List[str]: 
        return ['// *p=D',
                '@' + p, 
                'A=M',
                'M=D']    

    def _eq_p(self, p: str) -> List[str]: 
        return ['// D=*p',
                '@' + p, 
                'A=M',
                'D=M']    

    def _paddr_eq_pSP(self) -> List[str]:
        return ['// *addr=*SP'] + self._eq_p('SP') + self._p_eq('addr')
      
    def _pSP_eq_paddr(self) -> List[str]: 
        return ['// *SP=*addr'] + self._eq_p('addr') + self._p_eq('SP')

    def _ms_offset(self, ms: str, i: int) -> List[str]: 
        # addr=ms+i
        pms = pointers[ms]
        si = str(i)
        return ['// addr=' + pms + '+' + si,
                '@' + pms,
                'D=M',
                '@' + si,
                'D=D+A',
                '@addr',
                'M=D']

    def _pop(self, ms: str, i, int) -> List[str]:
        # applies to local, argument, this and that memory segments
        # addr=ms+i, SP--, *addr=*SP        
        instr0 = ['// pop ' + ms + ' ' + str(i)]
        instr = instr0 + self._ms_offset(ms, i) + self._decrement_SP() + self._paddr_eq_pSP()
        return '\n'.join(instr) + '\n\n' 

    def _push(self, ms: str, i: int) -> str:
        # applies to local, argument, this and that memory segments
        # addr=ms+i, *SP=*addr, SP++       
        instr0 = ['// push ' + ms + ' ' + str(i)]
        instr = instr0 + self._ms_offset(ms, i) + self._pSP_eq_paddr() + self._increment_SP()
        return '\n'.join(instr) + '\n\n' 




########################################################################


class temp():
    
    def _add(self):
        pass
        # SP--, arg2=*SP, SP--, arg1=*SP, ans=arg1+arg2, *SP=ans, SP++
        ## SP--
        # // arg2=*SP
        # @SP
        # A=M
        # D=M
        ## SP--
        # // arg1=*SP
        # @SP
        # A=M
        # D=D+M
        # // *SP = ans
        # @SP
        # A=M
        # M=D
        # SP++


    





#LCL = RAM[1]
#base addr local segment = 1015

# @SP, @LCL, @ARG, @THIS, @THAT


# push constant i
# *SP = i, SP++
# no pop constant operation

# STATIC
# static.i -> @file.i
# e.g if test.vm

# static 5 -> @test.5
# pop static 5
# D = stack.pop
# @test.5
# M=D

# hack assembler will map on RAM[16] .. RAM[255]


## pointer
## push pointer 0 - acceses THIS
## *SP = THIS, SP++

## push pointer 1 - acceses THAT
## *SP = THAT, SP++

## pop pointer 0 - acceses THIS
## SP--, THIS = *SP

## pop pointer 1 - acceses THAT
## SP--, THAT = *SP


#add
#sub
#neg
#eq
#gt
#lt
#and
#or
#not


## TEMP - base addr is hard coded as 5


## SP stored in RAM[0]
## stack base addr = 256


## push constant i
## *SP = i
## SP++





# Main #################################################################
class Main():
    
    def __init__(self, file: str):
        self.parser = Parser()
        self.code_writer = CodeWriter()
        self.filename_in = file
        self.filename_out = os.path.splitext(file)[0] + ".asm"   

    def go(self):
        with open(self.filename_in, 'r') as f_in:    
            with open(self.filename_out, 'w') as f_out:
                for line in f_in:
                    f_out.write(line)
                    #l = p.parse(line)
                    #if l:
                    #    f_out.write(c.code(l) + '\n')


########################################################################
if __name__ == "__main__":
    #Main(sys.argv[1]).go()
    p = Parser()

    s1 = 'pop local 2'
    s2 = '// commment'
    s3 = 'add // comment'

    p.parse(s1)
    print(p.line)
    print(p.command)
    print(p.command_type)
    print(p.arg1)
    print(p.arg2)
