require File.dirname(__FILE__) + '/test_helper'
require "interpreter"

class InterpreterTest < Test::Unit::TestCase
  def test_number
    assert_equal 1, Interpreter.new.eval("1").ruby_value
  end
  
  def test_true
    assert_equal true, Interpreter.new.eval("true").ruby_value
  end
  
  def test_assign
    assert_equal 2, Interpreter.new.eval("a = 2; 3; a").ruby_value
  end
  
  def test_method
    code = <<-CODE
      def boo(a)
        a
      end
      
      boo("yah!")
    CODE
    
    assert_equal "yah!", Interpreter.new.eval(code).ruby_value
  end
  
  def test_reopen_class
    code = <<-CODE
      class Number
        def ten
          10
        end
      end
      
      1.ten
    CODE
    
    assert_equal 10, Interpreter.new.eval(code).ruby_value
  end
  
  def test_define_class
    code = <<-CODE
      class Pony
        def awesome
          true
        end
      end
      
      Pony.new.awesome
    CODE
    
    assert_equal true, Interpreter.new.eval(code).ruby_value
  end
  
  ### Exercise: make the following three test pass

  def test_if
    code = <<-CODE
      if true
        "works!"
      end
    CODE
    
    assert_equal "works!", Interpreter.new.eval(code).ruby_value
  end
  
  def test_if_false
    code = <<-CODE
      if false
        "works!"
      end
    CODE
    
    assert_equal nil, Interpreter.new.eval(code).ruby_value
  end
  
  def test_if_with_else
    code = <<-CODE
      if false
        "nope"
      else
        "works!"
      end
    CODE
    
    assert_equal "works!", Interpreter.new.eval(code).ruby_value
  end
  

  ### Exercise: implement everything missing to pass this test
  def test_while
    code = <<-CODE
      x = 0
      while x < 10
        x = x + 1
      end
      x
    CODE
    
    assert_equal 10, Interpreter.new.eval(code).ruby_value
  end

  def test_return
    code = <<-CODE
      def x
        return 1
        2
      end

      x()
    CODE
    
    assert_equal 2, Interpreter.new.eval(code).ruby_value
  end
end