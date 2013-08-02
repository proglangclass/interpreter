class JsGenerator
  def initialize
    @code = []
    @locals = []
  end
  
  def compile_all(nodes)
    nodes.each do |node|
      node.compile(self)
      emit ";\n"
    end
  end
  
  def number_literal(value)
    emit value # 1 => 1
  end
  
  def string_literal(value)
    emit "\"" + value + "\"" # "value"
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
    
  end

  # Emit a chunk of Javascript code.
  def emit(code)
    @code << code
  end
  
  # Called at the end of compilation to assemble all the code generated.
  def assemble
    # var a, b, c; <= all @locals
    "var " + @locals.join(", ") + ";\n" + @code.join
  end
end
