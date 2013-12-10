require File.dirname(__FILE__) + '/test_helper'
require "runtime"

class RuntimeTest < Test::Unit::TestCase
  def test_get_constant
    assert_not_nil Constants["Object"]
  end
  
  def test_create_an_object
    assert_equal Constants["Object"], Constants["Object"].new.runtime_class
  end
  
  def test_create_an_object_mapped_to_ruby_value
    assert_equal 32, Constants["Number"].new_with_value(32).ruby_value
  end
  
  def test_lookup_method_in_class
    assert_not_nil Constants["Object"].lookup("print")
    assert_raise(RuntimeError) { Constants["Object"].lookup("non-existant") }
  end
  
  def test_call_method
    # Mimic Object.new in the language
    object = Constants["Object"].call("new")
    
    assert_equal Constants["Object"], object.runtime_class # assert object is an Object
  end
  
  def test_a_class_is_a_class
    assert_equal Constants["Class"], Constants["Number"].runtime_class
  end
  
  def test_number_add
    ### Exercise: Compute 1 + 2 using the Runtime API

    # 1 + 2 => 1.+(2)
    one = Constants["Number"].new_with_value(1)
    two = Constants["Number"].new_with_value(2)

    result = one.call("+", [two])

    assert_equal 3, result.ruby_value
  end
end