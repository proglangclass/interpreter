# Represents a class in the Ruby world. Classes are objects in runtime so they
# inherit from RObject.
class RClass < RObject
  attr_reader :runtime_methods

  # Creates a new class. Number is an instance of Class for example.
  def initialize
    @runtime_methods = {}
    @runtime_class = Constants["Class"]
  end

  # Lookup a method
  def lookup(method_name)
    @runtime_methods[method_name] || raise("Undefined method #{method_name}")
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