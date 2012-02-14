# Represents a class in the Ruby world. Classes are objects in runtime so they
# inherit from RObject.
class RClass < RObject
  attr_reader :runtime_methods

  # Creates a new class. Number is an instance of Class for example.
  def initialize
    @runtime_methods = {}
  
    # Check if we're bootstrapping (launching the runtime). During this process the 
    # runtime is not fully initialized and core classes do not yet exists, so we defer 
    # using those once the language is bootstrapped.
    # This solves the chicken-or-the-egg problem with the Class class. We can 
    # initialize Class then set Class.class = Class.
    if defined?(Runtime)
      runtime_class = Runtime["Class"]
    else
      runtime_class = nil
    end
  
    super(runtime_class)
  end

  # Lookup a method
  def lookup(method_name)
    method = @runtime_methods[method_name]
    unless method
      raise "Method not found: #{method_name}"
    end
    method
  end
  
  # Helper method to define a method on this class
  def def(name, &block)
    @runtime_methods[name.to_s] = block
  end

  # Create a new instance of this class
  def new
    RObject.new(self)
  end
  
  # Create an instance of this class that holds a Ruby value. Like a String, 
  # Number or true.
  def new_with_value(value)
    RObject.new(self, value)
  end
end