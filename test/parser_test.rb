require File.dirname(__FILE__) + '/test_helper'
require "parser"

class ParserTest < Test::Unit::TestCase
  def test_number
    assert_equal Nodes.new([NumberNode.new(1)]), Parser.new.parse("1")
  end
  
  def test_expression
    assert_equal Nodes.new([NumberNode.new(1), StringNode.new("hi")]), Parser.new.parse(%{1\n"hi"})
  end
  
  def test_call
    assert_equal Nodes.new([CallNode.new(NumberNode.new(1), "method", [])]), Parser.new.parse("1.method")
  end
  
  def test_call_with_arguments
    assert_equal Nodes.new([CallNode.new(nil, "method", [NumberNode.new(1), NumberNode.new(2)])]), Parser.new.parse("method(1, 2)")
  end
  
  def test_assign
    assert_equal Nodes.new([AssignNode.new("a", NumberNode.new(1))]), Parser.new.parse("a = 1")
  end
  
  def test_def
    code = <<-CODE
      def method
        # nothing
      end
    CODE
    
    nodes = Nodes.new([
      DefNode.new("method", [],
        Nodes.new([])
      )
    ])
    
    assert_equal nodes, Parser.new.parse(code)
  end
  
  def test_def_with_param
    code = <<-CODE
      def method(a, b)
        # nothing
      end
    CODE
    
    nodes = Nodes.new([
      DefNode.new("method", ["a", "b"],
        Nodes.new([])
      )
    ])
    
    assert_equal nodes, Parser.new.parse(code)
  end
  
  def test_class
    code = <<-CODE
      class Muffin
        # nothing
      end
    CODE
    
    nodes = Nodes.new([
      ClassNode.new("Muffin",
        Nodes.new([])
      )
    ])
    
    assert_equal nodes, Parser.new.parse(code)
  end
  
  def test_arithmetic
    nodes = Nodes.new([
      CallNode.new(NumberNode.new(1), "+", [
        CallNode.new(NumberNode.new(2), "*", [NumberNode.new(3)])
      ])
    ])
    assert_equal nodes, Parser.new.parse("1 + 2 * 3")
    assert_equal nodes, Parser.new.parse("1 + (2 * 3)")
  end
  
  def test_binary_operator
    assert_equal Nodes.new([
      CallNode.new(
        CallNode.new(NumberNode.new(1), "+", [NumberNode.new(2)]),
        "||",
        [NumberNode.new(3)]
      )
    ]), Parser.new.parse("1 + 2 || 3")
  end
  
  def test_unary_operator
    assert_equal Nodes.new([
      CallNode.new(NumberNode.new(2), "!", [])
    ]), Parser.new.parse("!2")
  end
  
  
  ## Exercise: make the next two tests pass
  
  def test_if
    code = <<-CODE
      if true
        # this
      end
    CODE
    
    nodes = Nodes.new([
      IfNode.new(TrueNode.new,
        Nodes.new([]),
        nil
      )
    ])
    
    assert_equal nodes, Parser.new.parse(code)
  end
  
  def test_if_with_else
    code = <<-CODE
      if true
        # this
      else
        # that
      end
    CODE
    
    nodes = Nodes.new([
      IfNode.new(TrueNode.new,
        Nodes.new([]),
        Nodes.new([])
      )
    ])
    
    assert_equal nodes, Parser.new.parse(code)
  end
end