# Compile with: rex tokens.rex -o lexer.rb

class Lexer

macro
  BLANK         [\ \t]+

rule
  # Whitespace
  {BLANK}       # no action
  
  

inner
  def run(code)
    scan_setup(code)
    tokens = []
    while token = next_token
      tokens << token
    end
    tokens
  end
  
end