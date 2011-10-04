# Represents the evaluation context, that tracks values that change depending on where 
# the code is evaluated.
# - "locals" holds local variables.
# - "current_self" is the object on which methods with no receivers are called,
#   eg.: print is like current_self.print
# - "current_class" is the class on which methods are defined with the "def" keyword.
class Context
  attr_reader :locals, :current_self, :current_class
  
  # We store constants as class variable (class variables start with @@ and instance
  # variables start with @ in Ruby) since they are globally accessible. If you want to
  # implement namespacing of constants, you could store it in the instance of this 
  # class.
  @@constants = {}
  
  def initialize(current_self, current_class=current_self.runtime_class)
    @locals = {}
    @current_self = current_self
    @current_class = current_class
  end
  
  # Shortcuts to access constants via Runtime["ConstantName"]
  def [](name)
    @@constants[name]
  end
  def []=(name, value)
    @@constants[name] = value
  end
end
