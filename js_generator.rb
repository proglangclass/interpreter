class JsGenerator
  def initialize
    @code = []
    @locals = []
  end
  
  def compile_all(nodes)
    
  end
  
  def number_literal(value)
    
  end
  
  def string_literal(value)
    
  end
  
  def set_local(name, value_node)
    
  end
  
  def get_local(name)
    
  end
  
  def if(condition_node, body_node, else_body_node)
    
  end

  # Emit a chunk of Javascript code.
  def emit(code)
    @code << code
  end
  
  # Called at the end of compilation to assemble all the code generated.
  def assemble
    @code.join
  end
end
