class JsGenerator
  def initialize
    @code = []
    @locals = []
  end
  
  def number_literal(value)
    emit value
  end
  
  def string_literal(value)
    emit "\"" + value + "\""
  end
  
  def has_local?(name)
    @locals.include?(name)
  end
  
  def set_local(name, value)
    @locals << name unless has_local?(name)
    emit "#{name} = "
    value.compile(self)
  end
  
  def get_local(name)
    emit name
  end
  
  def if(condition, body)
    ###### Exercise ######
    emit "if ("
    condition.compile(self)
    emit ") {\n"
    body.compile(self)
    emit "}"
    ######################
  end
  
  def compile_all(nodes)
    nodes.each do |node|
      node.compile(self)
      emit ";\n"
    end
  end
  
  def assemble
    # Declare local variables
    "var " + @locals.join(", ") + ";\n" +
    # Append code
    @code.join
  end
  
  def emit(code)
    @code << code
  end
end
