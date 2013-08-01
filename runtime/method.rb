# Represents a method defined in the runtime.
class RMethod
  def initialize(params, body)
    @params = params
    @body = body
  end
  
  def call(receiver, arguments)
    # Create a context of evaluation in which the method will execute.
    context = Context.new(receiver) # self = receiver
    
    # Assign arguments to local variables
    #   def method(a) .... method(1)
    #   a = 1
    @params.each_with_index do |param, index|
      context.locals[param] = arguments[index]
    end
    
    @body.eval(context)
  end
end
