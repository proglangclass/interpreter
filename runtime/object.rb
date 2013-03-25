# Represents an object instance in the Ruby world.
class RObject
  attr_accessor :prototype, :ruby_value
  attr_reader :runtime_methods

  # Each object have a class (named runtime_class to prevent errors with Ruby's class
  # method). Optionaly an object can hold a Ruby value (eg.: numbers and strings).
  def initialize(prototype, ruby_value=self)
    @prototype = prototype
    @ruby_value = ruby_value
    @runtime_methods = {}
  end

  # New objects are created by cloning the current object and setting itself as the prototype
  def new
    RObject.new(self)
  end

  def new_with_value(value)
    RObject.new(self, value)
  end

  # Call a method on the object.
  def call(method, arguments=[])
    # Like a typical Class-based runtime model, we store methods in the class of the
    # object.
    lookup(method).call(self, arguments)
  end

  # Method lookup is done on the current object first then by decending the prototype chain.
  def lookup(method)
    @runtime_methods[method] || (@prototype && @prototype.lookup(method)) || raise("Method not found #{method}")
  end

  def def(name, &block)
    @runtime_methods[name.to_s] = block
  end

  def ==(other)
    ruby_value == other.ruby_value
  end
end