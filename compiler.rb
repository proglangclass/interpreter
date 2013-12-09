require "parser"

class Compiler
  def initialize(generator_class)
    @parser = Parser.new
    @generator_class = generator_class
  end
  
  def compile(code)
    generator = @generator_class.new
    @parser.parse(code).compile(generator)
    generator.assemble
  end
end

class Nodes
  def compile(generator)
    generator.compile_all(nodes)
  end
end

class NumberNode
  def compile(generator)
    generator.number_literal(value)
  end
end

class StringNode
  def compile(generator)
    generator.string_literal(value)
  end
end

class TrueNode
  def compile(generator)
    generator.true_literal
  end
end

class FalseNode
  def compile(generator)
    generator.false_literal
  end
end

class NilNode
  def compile(generator)
    generator.nil_literal
  end
end

class CallNode
  def compile(generator)
    generator.call(receiver_node, method, argument_nodes)
  end
end

class GetLocalNode
  def compile(generator)
    generator.get_local(name)
  end
end

class SetLocalNode
  def compile(generator)
    generator.set_local(name, value_node)
  end
end

class IfNode
  def compile(generator)
    generator.if condition_node, body_node, else_body_node
  end
end
