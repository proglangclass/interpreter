# Compile with: racc grammar.y -o parser.rb

class Parser

# Declare tokens produced by the lexer
token IF
token DEF
token CLASS
token NEWLINE
token NUMBER
token STRING
token TRUE FALSE NIL
token IDENTIFIER
token CONSTANT
token END

rule
  Root:
    
  ;
  
end

---- header
  require "lexer"
  require "nodes"

---- inner
  def parse(code, show_tokens=false)
    @tokens = Lexer.new.run(code)
    p @tokens if show_tokens
    do_parse
  end
  
  def next_token
    @tokens.shift
  end