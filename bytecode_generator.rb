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
ADD,             #              [a, b]         [result]
RETURN = *       #              []             []
(0..10)

class BytecodeGenerator
  def initialize
    @literals = []
    @instructions = []
    @locals = []
  end
  
  def compile_all(nodes)
    nodes.each { |node| node.compile(self) }
  end
  
  def literal_index(literal)
    @literals << literal unless @literals.include?(literal)
    @literals.index(literal)
  end
  
  def number_literal(value)
    emit PUSH_NUMBER, literal_index(value)
  end
  
  def string_literal(value)
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
  
  def has_local?(name)
    @locals.include?(name)
  end
  
  def local_index(name)
    @locals << name unless @locals.include?(name)
    @locals.index(name)
  end
  
  def get_local(name)
    ###### Exercise ######
    emit GET_LOCAL, local_index(name)
    ######################
  end
  
  def set_local(name, value)
    value.compile(self)
    emit SET_LOCAL, local_index(name)
  end
  
  def call(receiver, method, arguments)
    if receiver
      receiver.compile(self)
    else
      emit PUSH_SELF
    end
    
    arguments.each { |arg| arg.compile(self) }
    
    # Sample optimization done by the compiler
    # We allow the VM to skip method lookup and implement some
    # addition specific optimizations.
    if method == "+"
      emit ADD
      return
    end
    
    emit CALL, literal_index(method), arguments.size
  end
  
  def if(condition, body)
    condition.compile(self)
    emit JUMP_UNLESS
    compute_and_emit_offset do
      body.compile(self)
    end
  end
  
  # Compute the number of instructions generated when yielding and
  # emit the offset from the current instruction position.
  def compute_and_emit_offset
    offset_index = @instructions.size
    emit 0 # placeholder
    yield
    @instructions[offset_index] = @instructions.size - offset_index - 1
  end
  
  def return
    emit RETURN
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
