require File.dirname(__FILE__) + '/test_helper'
require "compiler"
require "bytecode_generator"

class BytecodeCompilerTest < Test::Unit::TestCase
  def setup
    @compiler = Compiler.new(BytecodeGenerator)
  end
  
  def test_literal
    assert_equal [10, "hi"], @compiler.compile(%Q{10;"hi"})[:literals]
  end
  
  def test_locals
    assert_equal ["a", "b"], @compiler.compile("a=1;b=2")[:locals]
  end
  
  def test_set_local
    assert_equal [
      PUSH_NUMBER,   0, # 1    stack = [1]
      SET_LOCAL,     0, # a
      RETURN
    ], @compiler.compile("a=1")[:instructions]
  end
  
  def test_get_local
    assert_equal [
      PUSH_NUMBER,   0, # 1    stack = [1]
      SET_LOCAL,     0, # a    stack = []
      GET_LOCAL,     0, # a    stack = [1]
      RETURN
    ], @compiler.compile("a=1; a")[:instructions]
  end
  
  def test_call
    assert_equal [
      PUSH_SELF,           #                 stack = [self]
      PUSH_NUMBER,   0,    # 1               stack = [self, 1]
      CALL,          1, 1, # "print", 1 arg  stack = []
      RETURN
    ], @compiler.compile("print(1)")[:instructions]
  end
  
  def test_jump_unless
    assert_equal [
      PUSH_BOOL,     1, # true   stack = [true]
      JUMP_UNLESS,   2, # jump 2 more bytes unless what is on the stack is true
      PUSH_STRING,   0, # "yeah!"
      RETURN
    ], @compiler.compile('if true; "yeah!" ;end')[:instructions]
  end
  
  ### Exercise: make this test pass
  def test_add
    assert_equal [
      PUSH_NUMBER,   0,      # 1               stack = [1]
      PUSH_NUMBER,   1,      # 2               stack = [1, 2]
      ADD,                   #                 stack = [3]
      RETURN
    ], @compiler.compile("1 + 2")[:instructions]
  end
end