require "runtime/object"
require "runtime/class"
require "runtime/method"
require "runtime/context"

# Bootstrap the runtime. This is where we assemble all the classes and objects together
# to form the runtime.

RuntimeClass = RClass.new                     # Class
RuntimeClass.runtime_class = RuntimeClass     # Class.class = Class
RuntimeObject = RClass.new                    # Object = Class.new
RuntimeObject.runtime_class = RuntimeClass    # Object.class = Class

Runtime = Context.new(RuntimeObject.new) # Object.new

Runtime["Class"] = RuntimeClass
Runtime["Object"] = RuntimeObject
Runtime["Number"] = RClass.new
Runtime["String"] = RClass.new
Runtime["TrueClass"] = RClass.new
Runtime["FalseClass"] = RClass.new
Runtime["NilClass"] = RClass.new

Runtime["true"] = Runtime["TrueClass"].new_with_value(true)
Runtime["false"] = Runtime["FalseClass"].new_with_value(false)
Runtime["nil"] = Runtime["NilClass"].new_with_value(nil)

# Object.new
Runtime["Class"].def :new do |receiver, arguments|
  receiver.new
end

# print("hi")
Runtime["Object"].def :print do |receiver, arguments|
  puts arguments.first.ruby_value
  Runtime["nil"]
end

# 1 + 2
# 1.+(2)
Runtime["Number"].def :+ do |receiver, arguments|
  a = receiver.ruby_value
  b = arguments.first.ruby_value
  Runtime["Number"].new_with_value a + b
end

# 1.<(2)
Runtime["Number"].def :< do |receiver, arguments|
  a = receiver.ruby_value
  b = arguments.first.ruby_value
  a < b ? Runtime["true"] : Runtime["false"]
end

