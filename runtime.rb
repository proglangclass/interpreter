require "runtime/object"
require "runtime/class"
require "runtime/method"
require "runtime/context"

# Bootstrap the runtime. This is where we assemble all the classes and objects together
# to bring the runtime to life!

Constants = {}

Constants["Class"] = RClass.new
Constants["Class"].runtime_class = Constants["Class"] # Class.class == Class
Constants["Object"] = RClass.new

Constants["Number"] = RClass.new
Constants["String"] = RClass.new

main = Constants["Object"].new
RootContext = Context.new(main) # self = main

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
