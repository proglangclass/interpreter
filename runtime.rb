require "runtime/object"
require "runtime/class"
require "runtime/method"
require "runtime/context"

# Bootstrap the runtime. This is where we assemble all the classes and objects together
# to bring the runtime to life!

Constants = {}

Constants["Class"] = RClass.new                        # Class
Constants["Class"].runtime_class = Constants["Class"]  # Class.class = Class
Constants["Object"] = RClass.new

RootContext = Context.new(Constants["Object"].new)

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