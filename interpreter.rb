require "parser"
require "runtime"

class Interpreter
  def initialize
    @parser = Parser.new
  end
  
  def eval(code)
    node = @parser.parse(code)
    node.eval(RootContext)
  end
end

class Nodes
  # This method is the "interpreter" part of our language. All nodes know how to eval 
  # itself and returns the result of its evaluation by implementing the "eval" method.
  # The "context" variable is the environment in which the node is evaluated (local
  # variables, current class, etc.).
  def eval(context)
    return_value = Constants["nil"]
    nodes.each do |node|
      return_value = node.eval(context)
    end
    return_value
  end
end

class NumberNode
  def eval(context)
    Constants["Number"].new_with_value(value)
  end
end

class StringNode
  def eval(context)
    Constants["String"].new_with_value(value)
  end
end

class TrueNode
  def eval(context)
    Constants["true"]
  end
end

class FalseNode
  def eval(context)
    Constants["false"]
  end
end

class NilNode
  def eval(context)
    Constants["nil"]
  end
end

class SetLocalNode
  def eval(context)
    context.locals[name] = value.eval(context)
  end
end

class GetLocalNode
  def eval(context)
    context.locals[name]
  end
end

class GetConstantNode
  def eval(context)
    Constants[name]
  end
end

class CallNode
  def eval(context)
    # receiver.print
    if receiver
      evaluated_receiver = receiver.eval(context)
    # print => self.print
    else
      evaluated_receiver = context.current_self
    end

    evaled_arguments = arguments.map { |arg| arg.eval(context) }

    evaluated_receiver.call(method, evaled_arguments)
  end
end

class DefNode
  def eval(context)
    method = RMethod.new(params, body)
    context.current_class.runtime_methods[name] = method
  end
end

class ClassNode
  # <- this is the body
  def eval(context)
    rclass = Constants[name]

    unless rclass
      rclass = RClass.new
      Constants[name] = rclass
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
      Constants["nil"]
    end
  end
end
