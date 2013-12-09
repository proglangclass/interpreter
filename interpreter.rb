require "parser"
require "runtime"

class Interpreter
  def initialize
    @parser = Parser.new
  end
  
  def eval(code)
    @parser.parse(code).eval(RootContext)
  end
end

class Nodes
  # This method is the "interpreter" part of our language. All nodes know how to eval 
  # itself and returns the result of its evaluation by implementing the "eval" method.
  # The "context" variable is the environment in which the node is evaluated (local
  # variables, current class, etc.).
  def eval(context)
    
  end
end

class NumberNode
  def eval(context)
    
  end
end

class StringNode
  def eval(context)
    
  end
end

class TrueNode
  def eval(context)
    
  end
end

class FalseNode
  def eval(context)
    
  end
end

class NilNode
  def eval(context)
    
  end
end

class SetLocalNode
  def eval(context)
    
  end
end

class GetLocalNode
  def eval(context)
    
  end
end

class GetConstantNode
  def eval(context)
    
  end
end

class CallNode
  def eval(context)
    
  end
end

class DefNode
  def eval(context)
    
  end
end

class ClassNode
  def eval(context)
    
  end
end

class IfNode
  def eval(context)
    ### Exercise
    # Here you have access to:
    #  condition_node: condition node that will determine if the body should be executed
    #       body_node: node to be executed if the condition is true
    #  else_body_node: node to be executed if the condition is false
  end
end
