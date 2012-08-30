require "parser"
require "runtime"

class Interpreter
  def initialize
    @parser = Parser.new
  end
  
  def eval(code)
    @parser.parse(code).eval(Runtime)
  end
end

class Nodes
  # This method is the "interpreter" part of our language. All nodes know how to eval 
  # itself and returns the result of its evaluation by implementing the "eval" method.
  # The "context" variable is the environment in which the node is evaluated (local
  # variables, current class, etc.).
  def eval(context)
    return_value = nil
    nodes.each do |node|
      return_value = node.eval(context)
    end
    return_value || Runtime["nil"]
  end
end

class NumberNode
  def eval(context)
    Runtime["Number"].new_with_value(value)
  end
end

class StringNode
  def eval(context)
    Runtime["String"].new_with_value(value)
  end
end

class TrueNode
  def eval(context)
    Runtime["true"]
  end
end

class FalseNode
  def eval(context)
    Runtime["false"]
  end
end

class NilNode
  def eval(context)
    Runtime["nil"]
  end
end

class AssignNode
  def eval(context)
    context.locals[name] = value.eval(context)
  end
end

class ConstantNode
  def eval(context)
    context[name] || raise("Constant not found #{name}")
  end
end

class CallNode
  def eval(context)
    # a, local var
    if receiver.nil? && arguments.empty? && context.locals[method]
      context.locals[method]
    
    # method call
    else
      # receiver.print
      if receiver
        value = receiver.eval(context)
      else
        # print(...)
        value = context.current_self
      end
      
      evaluated_arguments = arguments.map { |arg| arg.eval(context) }
      value.call(method, evaluated_arguments)
      
    end
  end
end

class DefNode
  def eval(context)
    method = RMethod.new(params, body)
    context.current_class.runtime_methods[name] = method
  end
end

class ClassNode
  def eval(context)
    rclass = context[name]
    
    unless rclass # class was not defined
      rclass = RClass.new
      context[name] = rclass
    end
    
    class_context = Context.new(rclass, rclass)
    
    body.eval(class_context)
    
    rclass
  end
end

class IfNode
  def eval(context)
    ### Exercise
    # Here you have access to:
    #  condition: condition node that will determine if the body should be executed
    #       body: node to be executed if the condition is true
    #  else_body: node to be executed if the condition is false
    if condition.eval(context).ruby_value
      body.eval(context)
    elsif else_body
      else_body.eval(context)
    else
      Runtime["nil"]
    end
  end
end
