# Compile with: rex tokens.rex -o lexer.rb

class Lexer

macro
  BLANK         [\ \t]+

rule
  # Whitespace
  {BLANK}       # no action
  \#.*$         # no action

  \d+           { [:NUMBER, text.to_i] }
  \"[^"]*\"     { [:STRING, text[1..-2]] } # 'hi'
  \n+           { [:NEWLINE, text] }
  
  # Keywords
  end           { [:END, text] }
  def           { [:DEF, text] }
  class         { [:CLASS, text] }
  if            { [:IF, text] }
  else          { [:ELSE, text] }
  while         { [:WHILE, text] }

  # Literals
  true          { [:TRUE, text] }
  false         { [:FALSE, text] }
  nil           { [:NIL, text] }

  # Identifiers
  [a-z]\w*      { [:IDENTIFIER, text] } # variable_name, method_name
  [A-Z]\w*      { [:CONSTANT, text] } # Constant

  # Long operators
  &&            { [text, text] }
  \|\|          { [text, text] }
  ==            { [text, text] }
  !=            { [text, text] }
  <=            { [text, text] }
  >=            { [text, text] }

  # Catch all
  .             { [text, text] }  # +, -, *, ., (, )
  

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