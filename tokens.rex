# Compile with: rex tokens.rex -o lexer.rb

class Lexer

macro
  BLANK         [\ \t]+

rule
  # Whitespace
  {BLANK}       # no action
  
  # Literals
  \d+                                   { [:NUMBER, text.to_i] }
  \"[^"]*\"                             { [:STRING, text[1..-2]] }
  \n+                                   { [:NEWLINE, text] }
  
  # Keywords
  end                                   { [:END, text] }
  def                                   { [:DEF, text] }
  class                                 { [:CLASS, text] }
  if                                    { [:IF, text] }
  else                                  { [:ELSE, text] }
  true                                  { [:TRUE, text] }
  false                                 { [:FALSE, text] }
  nil                                   { [:NIL, text] }
  
  # Identifiers
  [a-z]\w*                              { [:IDENTIFIER, text] }
  [A-Z]\w*                              { [:CONSTANT, text] }
  
  # Special operators
  &&                                    { [text, text] }
  \|\|                                  { [text, text] }
  ==                                    { [text, text] }
  !=                                    { [text, text] }
  <=                                    { [text, text] }
  >=                                    { [text, text] }
  
  # Catch all
  .                                     { [text, text] }

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