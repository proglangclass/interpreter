class JsGenerator
  def initialize
    @code = []
    @locals = []
  end
  
  def emit(code)
    @code << code
  end
  
  def has_local?(name)
    @locals.include?(name)
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
  
  def if(condition, body)
    
  end
  
  def assemble
    
  end
end
