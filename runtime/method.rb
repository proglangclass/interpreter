# Represents a method defined in the runtime.
class RMethod
  def initialize(params, body)
    @params = params
    @body = body
  end
  
  def call(receiver, arguments)
    # Create a context of evaluation in which the method will execute.
    # one.call("+", [two])
    # class Number
    #   def +
    #     self == one
    #   end
    # end
    context = Context.new(receiver) # self = receiver
    
    # Assign arguments to local variables
    @params.each_with_index do |param, index|
      context.locals[param] = arguments[index]
    end
    
    @body.eval(context)
  end # no more context
end
