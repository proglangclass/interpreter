require "runtime/object"
require "runtime/class"
require "runtime/method"
require "runtime/context"

# Bootstrap the runtime. This is where we assemble all the classes and objects together
# to bring the runtime to life!

Constants = {} # "String" => RClass.new

Constants["Class"] = RClass.new      # Class
Constants["Class"].runtime_class = Constants["Class"] # Class.class = Class
Constants["Object"] = RClass.new     # Object = Class.new

# Constants["Object"].new same as ...
# o = RObject.new
# o.runtime_class = Constants["Object"]

RootContext = Context.new(Constants["Object"].new) # self = Object.new

Constants["Number"] = RClass.new   # Number = Class.new
Constants["String"] = RClass.new   # String = Class.new
Constants["TrueClass"] = RClass.new
Constants["FalseClass"] = RClass.new
Constants["NilClass"] = RClass.new

# `new_with_value` does ...
# true_object = RObject.new
# true_object.runtime_class = Constants["TrueClass"]
# true_object.ruby_value = true

Constants["true"] = Constants["TrueClass"].new_with_value(true)
Constants["false"] = Constants["FalseClass"].new_with_value(false)
Constants["nil"] = Constants["NilClass"].new_with_value(nil)

# Object.new, String.new, Number.new
Constants["Class"].def :new do |receiver, arguments|
  receiver.new
end

# print("hi")
Constants["Object"].def :print do |receiver, arguments|
  string = arguments.first
  # string == Constants["String"].new_with_value("hi")
  # string.ruby_value == "hi"
  puts string.ruby_value
  Constants["nil"]
end

# 1 + 2 => 1.+(2)
Constants["Number"].def :+ do |receiver, arguments|
  a = receiver.ruby_value
  b = arguments.first.ruby_value
  Constants["Number"].new_with_value(a + b)
end

# 1 < 2 => 1.<(2)
Constants["Number"].def :< do |receiver, arguments|
  a = receiver.ruby_value
  b = arguments.first.ruby_value
  if a < b
    Constants["true"]
  else
    Constants["false"]
  end
end

