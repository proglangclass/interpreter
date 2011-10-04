require "runtime/object"
require "runtime/class"
require "runtime/method"
require "runtime/context"

# Bootstrap the runtime. This is where we assemble all the classes and objects together
# to form the runtime.
rclass = RClass.new                 # Class is a class
rclass.runtime_class = rclass       # Class.class == Class
object_class = RClass.new           # Object = Class.new
object_class.runtime_class = rclass # Object.class == Class

# Create the Runtime object (the root context) on which all code will start its evaluation.
Runtime = Context.new(object_class.new)

# Register the core classes in the runtime so we can access them from within a program.
Runtime["Class"] = rclass
Runtime["Object"] = object_class
Runtime["Number"] = RClass.new
Runtime["String"] = RClass.new
Runtime["TrueClass"] = RClass.new
Runtime["FalseClass"] = RClass.new
Runtime["NilClass"] = RClass.new

# Register primitives that map to Ruby values
Runtime["true"] = Runtime["TrueClass"].new_with_value(true)
Runtime["false"] = Runtime["FalseClass"].new_with_value(false)
Runtime["nil"] = Runtime["NilClass"].new_with_value(nil)

# Define some Awesome methods in Ruby. We can use a proc since they respond to "call".
Runtime["Class"].runtime_methods["new"] = proc do |receiver, arguments|
  # Creates a new instance of the class
  receiver.new
end

Runtime["Object"].runtime_methods["print"] = proc do |receiver, arguments|
  puts arguments.first.ruby_value
  Runtime["nil"] # Return value
end

Runtime["Number"].runtime_methods["+"] = proc do |receiver, arguments|
  Runtime["Number"].new_with_value(receiver.ruby_value + arguments.first.ruby_value)
end