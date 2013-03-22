class JsGenerator
  def initialize
    @code = []
    @locals = []
  end
  
  # Emit the Javascript code
  def emit(code)
    @code << code
  end
  
  def compile_all(nodes)
    nodes.each do |node|
      node.compile(self)
      emit ";\n"
    end
  end
  
  def number_literal(value)
    emit value
  end
  
  def string_literal(value)
    emit "\"" + value + "\""
  end
  
  def set_local(name, value)
    @locals << name unless @locals.include?(name)
    emit "#{name} = "
    value.compile(self)
  end
  
  def get_local(name)
    emit name
  end
  
  def if(condition, body, else_body)
    emit "if ("
    condition.compile(self)
    emit ") {\n"
    body.compile(self)
    emit "}"
  end
  
  def assemble
    # var a, b;
    # a = 1;
    # b = 2;
    
    "var " + @locals.join(", ") + ";\n" +
    @code.join
  end
end
