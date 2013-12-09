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
    emit value
  end
  
  def string_literal(value)
    emit '"' + value + '"'
  end

  # in js
  # var a,b;
  # a = 1;
  
  def set_local(name, value_node)
    @locals << name unless @locals.include?(name)
    emit "#{name} = "
    value_node.compile(self)
  end
  
  def get_local(name)
    emit name
  end
  
  def if(condition_node, body_node, else_body_node)
    emit "if ("
    condition_node.compile(self)
    emit ") {\n"
    body_node.compile(self)
    emit "}"
  end

  # Emit a chunk of Javascript code.
  def emit(code)
    @code << code
  end
  
  # Called at the end of compilation to assemble all the code generated.
  def assemble
    # [a, b, c].join(", ") => "a, b, c"
    "var " + @locals.join(", ") + ";\n" + @code.join
  end
end
