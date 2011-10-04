require File.dirname(__FILE__) + "/test_helper"
require "lexer"

class LexerTest < Test::Unit::TestCase
  def test_number
    assert_equal [[:NUMBER, 1]], Lexer.new.run("1")
  end
    
  def test_string
    assert_equal [[:STRING, "hi"]], Lexer.new.run('"hi"')
  end
    
  def test_identifier
    assert_equal [[:IDENTIFIER, "name"]], Lexer.new.run('name')
  end
  
  def test_constant
    assert_equal [[:CONSTANT, "Name"]], Lexer.new.run('Name')
  end
  
  def test_keyword
    assert_equal [[:END, "end"]], Lexer.new.run('end')
  end
  
  def test_operator
    assert_equal [["+", "+"]], Lexer.new.run('+')
    assert_equal [["&&", "&&"]], Lexer.new.run('&&')
  end
  
  # Exercise: make this pass
  def test_comment
    assert_equal [], Lexer.new.run('# hello')
  end
  
  def test_tokens
    code = <<-CODE
      def method
        "hi"
        1
      end
    CODE
    tokens = [
      [:DEF, "def"], [:IDENTIFIER, "method"], [:NEWLINE, "\n"],
        [:STRING, "hi"], [:NEWLINE, "\n"],
        [:NUMBER, 1], [:NEWLINE, "\n"],
      [:END, "end"], [:NEWLINE, "\n"]
    ]
    assert_equal tokens, Lexer.new.run(code)
  end
end