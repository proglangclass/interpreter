## Our humble bytecode format
#
#                                       Stack
# Opcode           Operands     before         after
CALL,            # index, argc  [rcv, arg...]  [returned]
PUSH_NUMBER,     # index        []             [number]
PUSH_STRING,     # index        []             [string]
PUSH_SELF,       #              []             [self]
PUSH_NIL,        #              []             [nil]
PUSH_BOOL,       # 1=t, 0=f     []             [true or false]
GET_LOCAL,       # index        []             [value]
SET_LOCAL,       # index        [value]        []
JUMP_UNLESS,     # offset       [test]         []
JUMP,            # offset       []             []
ADD,             #              [a, b]         [result]
RETURN = *       #              []             []
(0..11)

# CALL = 0
# PUSH_NUMBER = 1

class BytecodeGenerator
  def initialize
    @literals = []
    @locals = []
    @instructions = []
  end
  
  def compile_all(nodes)
    nodes.each do |node|
      node.compile(self)
    end
  end
  
  def number_literal(value)
    # literal_index(1000) => 0
    # literal_index(1001) => 1
    # literal_index(1000) => 0
    emit PUSH_NUMBER, literal_index(value)
  end
  
  def string_literal(value)
    # literal_index("hi") => 0
    # literal_index("bye") => 1
    # literal_index("hi") => 0
    emit PUSH_STRING, literal_index(value)
  end
  
  def true_literal
    emit PUSH_BOOL, 1
  end
  
  def false_literal
    emit PUSH_BOOL, 0
  end
  
  def nil_literal
    emit PUSH_NIL
  end
  
  def set_local(name, value)
    value.compile(self)
    emit SET_LOCAL, local_index(name)
  end
  
  def get_local(name)
    
  end
  
  def call(receiver, method, arguments)
    if receiver
      receiver.compile(self)
    else # print("hi")
      emit PUSH_SELF
    end

    arguments.each do |arg|
      arg.compile(self)
    end

    # Static Typing: int a;
    if method == "+"
      emit ADD
      return
    end

    emit CALL, literal_index(method), arguments.size
  end
  
  def if(condition, body, else_body)
    condition.compile(self)
    emit JUMP_UNLESS, 0
    offset_index = @instructions.size - 1
    body.compile(self)
    @instructions[offset_index] = @instructions.size - 1 - offset_index
  end
  
  # Returns the index of the local in the local table
  def local_index(name)
    @locals << name unless @locals.include?(name)
    @locals.index(name)
  end
  
  # Returns the index of the literal in the literal table
  def literal_index(literal)
    @literals << literal unless @literals.include?(literal)
    @literals.index(literal)
  end
  
  # Emit the instruction
  # Eg.:
  #  emit CALL, 1, 10
  # will generate the bytecode
  # 0, 1, 10
  def emit(opcode, *operands)
    @instructions << opcode
    @instructions.concat operands
  end
  
  def assemble
    emit RETURN
    
    {
      :literals => @literals,
      :locals => @locals,
      :instructions => @instructions
    }
  end
end
