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
    # The last value evaluated in a method is the return value.
    nodes.map { |node| node.eval(context) }.last
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


class CallNode
  def eval(context)
    # If there's no receiver and the method name is the name of a local variable, then 
    # it's a local variable access. This trick allows us to skip the () when calling a 
    # method.
    if receiver.nil? && context.locals[method] && arguments.empty?
      context.locals[method]
    
    # Method call
    else
      # In case there's no receiver we default to self, calling "print" is like
      # "self.print".
      if receiver
        value = receiver.eval(context)
      else
        value = context.current_self
      end
      evaluated_arguments = arguments.map { |arg| arg.eval(context) }
      value.call(method, evaluated_arguments)
    end
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

class DefNode
  def eval(context)
    # Defining a method is adding a method to the current class.
    context.current_class.runtime_methods[name] = RMethod.new(params, body)
  end
end

class ClassNode
  def eval(context)
    # Lookup if the class already exists
    rclass = context[name]
    
    unless rclass
      # Create the class and put it's value in a constant.
      rclass = RClass.new
      context[name] = rclass
    end
    
    # Evaluate the body of the class in its context. Providing a custom context allows 
    # to control where methods are added when defined with the def keywork. In this 
    # case, we add them to the newly created class.
    body.eval(Context.new(rclass, rclass))
    
    rclass
  end
end

class IfNode
  def eval(context)
    ###### Exercise ######
    # We turn the condition node into a Ruby value to use Ruby's "if" control 
    # structure.
    if condition.eval(context).ruby_value
      body.eval(context)
    end
    #######################
  end
end
