    
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
 

import sys
import os
from enum import Enum, auto
from typing import Dict, List

import inspect

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

command_: Dict[str, CommandType] = {
    'push': CommandType.PUSH, 
    'pop': CommandType.POP
}    

pointers: Dict[str, str] = {
    'local': 'LCL',
    'argument': 'ARG',
    'this': 'THIS',
    'that': 'THAT',
    'temp': '5'
}

# Parser ###############################################################
class Parser():

    def __init__(self):
        self._empty()

    def _empty(self):
        self.line = ""
        self.instr = ""
        self.command_name = ""
        self.command_type = CommandType.NONE
        self.arg1 = ""
        self.arg2 = ""

    def parse(self, line: str):
        self.line = line

        # remove newline
        # remove leading and trailing spaces
        # remove comments
        self.instr = line.rstrip('\n').strip().split('//')[0].rstrip()
        
        if self.instr: # line contains an instruction
            c = self.instr.split() # get components
            self.command_name = c[0].lower()
            if len(c) == 1: # ARITHMETIC
                self.command_type = CommandType.ARITHMETIC
                self.arg1 = c[0].lower()
            else:
                self.command_type = command_[c[0].lower()]
                self.arg1 = c[1]
                if len(c) == 3:
                    self.arg2 = c[2]
        else:
            self._empty()
########################################################################


# CodeWriter ###########################################################
class CodeWriter():
    
    def __init__(self, file: str):
        self.file = file
        self.idx = 0

    def write(self, p: Parser) -> str:
        if p.command_type == CommandType.NONE:
            return ''
        
        elif p.command_type == CommandType.ARITHMETIC:
            return getattr(self, '_' + p.arg1)()
        
        elif p.command_type in [CommandType.PUSH, CommandType.POP]:
            # arg1 is memory segment, arg2 is offset
            if p.arg1 in pointers:
                # local, argument, this, that and temp memory segments
                d = False if p.arg1 == 'temp' else True
                return getattr(self, '_' + p.command_name + '_p')(p.arg1, int(p.arg2), d)
            else:
                return getattr(self, '_' + p.command_name + '_' + p.arg1)(int(p.arg2))

        else:
            pass

    def _inc_SP(self) -> List[str]: 
        return ['// SP++',
                '@SP', 
                'M=M+1']

    def _dec_SP(self) -> List[str]: 
        return ['// SP--',
                '@SP', 
                'M=M-1']    

    def _eq_const(self, i: int) -> List[str]: 
        return ['// D=const',
                '@' + str(i), 
                'D=A']    

    def _add_const(self, i: int) -> List[str]: 
        return ['// D=D+const',
                '@' + str(i), 
                'D=D+A']    

    def _eq_d(self, d: str) -> List[str]: 
        return ['// D=d',
                '@' + d, 
                'D=M']    

    def _d_eq(self, d: str) -> List[str]: 
        return ['// d=D',
                '@' + d, 
                'M=D']    

    def _eq_p(self, p: str) -> List[str]: 
        return ['// D=*p',
                '@' + p, 
                'A=M',
                'D=M']    

    def _p_eq(self, p: str) -> List[str]: 
        return ['// *p=D',
                '@' + p, 
                'A=M',
                'M=D']    

    def _pSP_eq_const(self, i: int) -> List[str]:
        return ['// *SP=i'] + self._eq_const(i) + self._p_eq('SP')

    def _d_eq_pSP(self, d: str) -> List[str]:
        return ['// d=*SP'] + self._eq_p('SP') + self._d_eq(d) 

    def _pSP_eq_d(self, d: str) -> List[str]:
        return ['// *SP=d'] + self._eq_d(d) + self._p_eq('SP')

    def _p_eq_pSP(self, p: str) -> List[str]:
        return ['// *p=*SP'] + self._eq_p('SP') + self._p_eq(p)
      
    def _pSP_eq_p(self, p: str) -> List[str]: 
        return ['// *SP=*p'] + self._eq_p(p) + self._p_eq('SP')

    def _ms_offset(self, ms: str, i: int, d: bool = True) -> List[str]: 
        # addr=ms+i
        pms = pointers[ms]
        instr0 = ['// addr=' + pms + '+' + str(i)]
        instr1 = self._eq_d(pms) if d else self._eq_const(pms) 
        return instr0 + instr1 + self._add_const(i) + self._d_eq('addr')    
       
    def _push_p(self, ms: str, i: int, d: bool = True) -> str:
        # applies to local, argument, this, that and temp (wih d = False) memory segments 
        # push ms i
        # addr=ms+i, *SP=*addr, SP++       
        instr0 = ['// push ' + ms + ' ' + str(i)]
        instr = instr0 + self._ms_offset(ms, i, d) + self._pSP_eq_p('addr') + self._inc_SP()
        return '\n'.join(instr) + '\n\n' 

    def _pop_p(self, ms: str, i: int, d: bool = True) -> str:
        # applies to local, argument, this, that and temp (with d = False) memory segments
        # pop ms i
        # addr=ms+i, SP--, *addr=*SP        
        instr0 = ['// pop ' + ms + ' ' + str(i)]
        instr = instr0 + self._ms_offset(ms, i, d) + self._dec_SP() + self._p_eq_pSP('addr')
        return '\n'.join(instr) + '\n\n' 

    def _push_constant(self, i: int) -> str:
        # applies to constant memory segment
        # push constant i
        # *SP=i, SP++ 
        instr0 = ['// push constant i']
        instr = instr0 + self._pSP_eq_const(i) + self._inc_SP()
        return '\n'.join(instr) + '\n\n'

    def _push_d(self, d: str) -> str:
        # applies to pointer and static memory segment
        # push d
        # *SP = d, SP++ 
        return self._pSP_eq_d(d) + self._inc_SP()
   
    def _pop_d(self, d: str) -> str:
        # applies to pointer and static memory segment
        # pop d i
        # SP--, d=*SP 
        return self._dec_SP() + self._d_eq_pSP(d)

    def _push_pointer(self, i: int) -> str:
        # applies to pointer memory segment
        # push pointer 0/1
        # *SP = THIS/THAT, SP++ 
        sym = 'THAT' if i else 'THIS'
        instr0 = ['// push pointer ' + str(i)]
        instr = instr0 + self._push_d(sym)
        return '\n'.join(instr) + '\n\n'
        
    def _pop_pointer(self, i: int) -> str:
        # applies to pointer memory segment
        # pop pointer 0/1
        # SP--, THIS/THAT = *SP 
        sym = 'THAT' if i else 'THIS'
        instr0 = ['// pop pointer ' + str(i)]
        instr = instr0 + self._pop_d(sym) 
        return '\n'.join(instr) + '\n\n'

    def _push_static(self, i: int) -> str:
        # applies to static memory segment
        # push static i
        # *SP = file.i, SP++ 
        sym = self.file + '.' + str(i)
        instr0 = ['// push static ' + str(i)]
        instr = instr0 + self._push_d(sym)
        return '\n'.join(instr) + '\n\n'

    def _pop_static(self, i: int) -> str:
        # applies to static memory segment
        # pop static i
        # SP--, file.i = *SP 
        sym = self.file + '.' + str(i)
        instr0 = ['// pop static ' + str(i)]
        instr = instr0 + self._pop_d(sym) 
        return '\n'.join(instr) + '\n\n'

    
    ## ARITHMETIC    

    
    
    # inspect.stack()[1][3]   // gets calling function name
    #import sys
    # print sys._getframe().f_back.f_code.co_name

    def _pSP(self) -> List[str]:
        return ['@SP', 
                'A=M']

    def _unary(self, command: str, code: List[str]) -> str: 
        instr0 = ['// ' + command]
        instr = instr0 + self._dec_SP() + self._pSP() + code + \
                         self._inc_SP()
        return '\n'.join(instr) + '\n\n'

    def _binary(self, command: str, code: List[str]) -> str:
        instr0 = ['// ' + command]
        instr = instr0 + self._dec_SP() + self._eq_p('SP') + \
                         self._dec_SP() + self._pSP() + code + \
                         self._p_eq('SP') + self._inc_SP()
        return '\n'.join(instr) + '\n\n'

    def _jmp(self, command: str, j_code: str) -> str:

        lbl = 'JMP_' + str(self.idx)
        code = ['D=M-D',
                '@' + lbl,
                'D=;' + j_code,
                'D=0',
                '(' + lbl + ')',
                'D=-1']

        self.idx += 1
        return self._binary(command, code)

    def _add(self) -> str:
        return self._binary('add', ['D=D+M'])

    def _sub(self) -> str:
        return self._binary('sub', ['D=M-D'])

    def _neg(self) -> str:
        return self._unary('neg', ['M=-M'])
  
    def _and(self) -> str:
        return self._binary('and', ['D=D&M'])

    def _or(self) -> str:
        return self._binary('or', ['D=D|M'])

    def _not(self) -> str:
        return self._unary('not', ['M=!M'])

    def _eq(self) -> str:
        return self._jmp('eq', 'JEQ')

    def _gt(self) -> str:
        return self._jmp('gt', 'JGT')

    def _lt(self) -> str:
        return self._jmp('lt', 'JLT')
########################################################################


# Main #################################################################
class Main():
    
    def __init__(self, file: str):
        self.parser = Parser()
        self.filename_in = file
        
        file_no_ext = os.path.splitext(file)[0]
        self.code_writer = CodeWriter(file_no_ext)
        self.filename_out = file_no_ext + ".asm"   

    def go(self):
        with open(self.filename_in, 'r') as f_in:    
            with open(self.filename_out, 'w') as f_out:
                for line in f_in:
                    self.parser.parse(line)
                    l_out = self.code_writer.write(self.parser)
                    f_out.write(l_out)
########################################################################
if __name__ == "__main__":
    Main(sys.argv[1]).go()
