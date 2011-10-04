require File.dirname(__FILE__) + '/test_helper'
require "runtime"
require "nodes"

class RuntimeTest < Test::Unit::TestCase
  def test_each_class_has_a_runtime_class
    assert_equal Runtime["Class"], Runtime["Number"].runtime_class
  end
  
  def test_lookup_method_in_class
    assert_not_nil Runtime["Object"].lookup("print")
    assert_raise(RuntimeError) { Runtime["Object"].lookup("non-existant") }
  end
  
  def test_create_new_object_from_class
    assert_equal Runtime["Object"], Runtime["Object"].new.runtime_class
  end
  
  def test_call_runtime_method
    # Mimic Object.new in the language
    object = Runtime["Object"].call("new") # Call the method
    
    assert_equal Runtime["Object"], object.runtime_class # assert object is an Object
  end
  
  def test_number_add
    #### Exercise ####
    one = Runtime["Number"].new_with_value(1)
    two = Runtime["Number"].new_with_value(2)
    assert_equal 3, one.call("+", [two]).ruby_value
    ##################
  end
end