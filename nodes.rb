# Here we define all the different types of node produced by the parser.
# 
# Using `class Nodes < Struct.new(:nodes); end` in Ruby is the same as doing:
#
#   class Nodes
#     attr_accessor :nodes
#
#     def initialize(nodes)
#       @nodes = nodes
#     end
#
#     def ==(other)
#       self.class == other.class && @nodes == other.nodes
#     end
#   end
#

# Collection of nodes each one representing an expression.
class Nodes < Struct.new(:nodes)
  # Concatenate a node
  def <<(node)
    nodes << node
    self
  end
end

# Literals: static values that have a Ruby representation.
class LiteralNode < Struct.new(:value); end
class NumberNode < LiteralNode; end
class StringNode < LiteralNode; end
class TrueNode < LiteralNode
  def initialize
    super(true)
  end
end
class FalseNode < LiteralNode
  def initialize
    super(false)
  end
end
class NilNode < LiteralNode
  def initialize
    super(nil)
  end
end

# Node of a method call. Can take any of these forms:
# 
#   method(argument1, argument2)
#   receiver.method
#   receiver.method(argument1, argument2)
#
class CallNode < Struct.new(:receiver_node, :method, :argument_nodes); end

# Setting and getting the value of a local variable.
class SetLocalNode < Struct.new(:name, :value_node); end
class GetLocalNode < Struct.new(:name); end

# Getting the value of a constant
class GetConstantNode < Struct.new(:name); end

# Method definition.
class DefNode < Struct.new(:name, :params, :body_node); end

# Class definition.
class ClassNode < Struct.new(:name, :body_node); end

# `if` control structure. Look at this node if you want to implement other control
# structures like while, for, loop, etc.
class IfNode  < Struct.new(:condition_node, :body_node, :else_body_node); end

class WhileNode  < Struct.new(:condition_node, :body_node); end

