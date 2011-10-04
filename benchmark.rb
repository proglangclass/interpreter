$:.unshift "."
require "interpreter"

code = <<-CODE
  print("the answer is:")
  a = 30 + 2
  if true
    print(a)
  end
CODE

nodes = Parser.new.parse(code)
1000000.times do
  nodes.eval(Runtime)
end
