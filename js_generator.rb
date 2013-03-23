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
    
  end
  
  def number_literal(value)
    
  end
  
  def string_literal(value)
    
  end
  
  def set_local(name, value)
    
  end
  
  def get_local(name)
    
  end
  
  def if(condition, body, else_body)
    
  end
  
  def assemble
    @code.join
  end
end
