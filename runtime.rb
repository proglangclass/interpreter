require "runtime/object"
require "runtime/class"
require "runtime/method"
require "runtime/context"

# Bootstrap the runtime. This is where we assemble all the classes and objects together
# to form the runtime.

Constants = {} # Hold all the constants in our Runtime

# Solving 'Chicken or the egg' problem when Class is a Class.
RuntimeClass = RClass.new                     # Class
RuntimeClass.runtime_class = RuntimeClass     # Class.class = Class
RuntimeObject = RClass.new                    # Object = Class.new
RuntimeObject.runtime_class = RuntimeClass    # Object.class = Class

RootContext = Context.new(RuntimeObject.new) # Object.new

Constants["Class"] = RuntimeClass
Constants["Object"] = RuntimeObject
Constants["Number"] = RClass.new
Constants["String"] = RClass.new
Constants["TrueClass"] = RClass.new
Constants["FalseClass"] = RClass.new
Constants["NilClass"] = RClass.new

Constants["true"] = Constants["TrueClass"].new_with_value(true)
Constants["false"] = Constants["FalseClass"].new_with_value(false)
Constants["nil"] = Constants["NilClass"].new_with_value(nil)

# Object.new
Constants["Class"].def :new do |receiver, arguments|
  receiver.new
end

# print("hi")
Constants["Object"].def :print do |receiver, arguments|
  puts arguments.first.ruby_value
  Constants["nil"]
end

# 1 + 2
# 1.+(2)
Constants["Number"].def :+ do |receiver, arguments|
  a = receiver.ruby_value
  b = arguments.first.ruby_value
  Constants["Number"].new_with_value a + b
end

# 1.<(2)
Constants["Number"].def :< do |receiver, arguments|
  a = receiver.ruby_value
  b = arguments.first.ruby_value
  a < b ? Constants["true"] : Constants["false"]
end

