require "runtime/object"
require "runtime/method"
require "runtime/context"

# Bootstrap the runtime. This is where we assemble all the classes and objects together
# to bring the runtime to life!

Constants = {}

Constants["Object"] = RObject.new(nil)

RootContext = Context.new(Constants["Object"].new)

Constants["Number"] = Constants["Object"].new
Constants["String"] = Constants["Object"].new
Constants["TrueClass"] = Constants["Object"].new
Constants["FalseClass"] = Constants["Object"].new
Constants["NilClass"] = Constants["Object"].new

Constants["true"] = Constants["TrueClass"].new_with_value(true)
Constants["false"] = Constants["FalseClass"].new_with_value(false)
Constants["nil"] = Constants["NilClass"].new_with_value(nil)

# Object.new
Constants["Object"].def :new do |receiver, arguments|
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
  
  Constants["Number"].new_with_value(a + b)
end

