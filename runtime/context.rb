# Represents the evaluation context, that tracks values that change depending on where 
# the code is evaluated.
# - "locals" holds local variables.
# - "current_self" is the object on which methods with no receivers are called,
#   eg.: print is like current_self.print
# - "current_class" is the class on which methods are defined with the "def" keyword.
class Context
  attr_reader :locals, :current_self, :current_class
  
  def initialize(current_self, current_class=current_self.prototype)
    @locals = {} # { name_of_local_var => value_of_local_var }
    @current_self = current_self
    @current_class = current_class
  end
end
