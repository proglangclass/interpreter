# Compile with: racc grammar.y -o parser.rb

class Parser

# Declare tokens produced by the lexer
token IF
token WHILE
token ELSE
token DEF
token CLASS
token NEWLINE
token NUMBER
token STRING
token TRUE FALSE NIL
token IDENTIFIER
token CONSTANT
token END

# Precedence table
# Based on http://en.wikipedia.org/wiki/Operators_in_C_and_C%2B%2B#Operator_precedence
prechigh
  left  '.'
  right '!'
  left  '*' '/'
  left  '+' '-'
  left  '>' '>=' '<' '<='
  left  '==' '!='
  left  '&&'
  left  '||'
  right '='
  left  ','
preclow

rule
  # All rules are declared in this format:
  #
  #   RuleName:
  #     OtherRule TOKEN AnotherRule    { code to run when this matches }
  #   | OtherRule                      { ... }
  #   ;
  #
  # In the code section (inside the {...} on the right):
  # - Assign to "result" the value returned by the rule.
  # - Use val[index of expression] to reference expressions on the left.

  Expressions:
    Expression                          { result = Nodes.new([ val[0] ]) }
  | Expressions Terminator Expression   { result = val[0] << val[2] }
  |                                     { result = Nodes.new([]) }
  | Expressions Terminator              { result = val[0] }
  ;

  Terminator:
    NEWLINE
  | ";"
  ;

  Expression:
    Literal
  | Call
  | Operator
  | GetConstant
  | GetLocal
  | SetLocal
  | Def
  | Class
  | If
  | While
  | '(' Expression ')'            { result = val[1] }
  ;
  
  Literal:  
    NUMBER              { result = NumberNode.new(val[0]) }
  | STRING              { result = StringNode.new(val[0]) }
  | TRUE                { result = TrueNode.new }
  | FALSE               { result = FalseNode.new }
  | NIL                 { result = NilNode.new }
  ;

  Call:
    # method(1, 2, 3)
    IDENTIFIER "(" Arguments ")"      { result = CallNode.new(nil, val[0], val[2]) }
    # receiver.method(1, 2, 3)
  | Expression "."
    IDENTIFIER "(" Arguments ")"      { result = CallNode.new(val[0], val[2], val[4]) }
  | Expression "." IDENTIFIER         { result = CallNode.new(val[0], val[2], []) }
  ;

  Arguments:
    Expression                        { result = [ val[0] ] }
  | Arguments "," Expression          { result = val[0] << val[2] }
  |                                   { result = [] }
  ;

  Operator:
  # 1 + 2 => 1.+(2)
  # Binary operators
    Expression '||' Expression    { result = CallNode.new(val[0], val[1], [val[2]]) }
  | Expression '&&' Expression    { result = CallNode.new(val[0], val[1], [val[2]]) }
  | Expression '==' Expression    { result = CallNode.new(val[0], val[1], [val[2]]) }
  | Expression '!=' Expression    { result = CallNode.new(val[0], val[1], [val[2]]) }
  | Expression '>' Expression     { result = CallNode.new(val[0], val[1], [val[2]]) }
  | Expression '>=' Expression    { result = CallNode.new(val[0], val[1], [val[2]]) }
  | Expression '<' Expression     { result = CallNode.new(val[0], val[1], [val[2]]) }
  | Expression '<=' Expression    { result = CallNode.new(val[0], val[1], [val[2]]) }
    # 1 + 2 => 1.+(2)
    #   1       +       2                                   1       "+"      [2]
  | Expression '+' Expression     { result = CallNode.new(val[0], val[1], [val[2]]) }
  | Expression '-' Expression     { result = CallNode.new(val[0], val[1], [val[2]]) }
  | Expression '*' Expression     { result = CallNode.new(val[0], val[1], [val[2]]) }
  | Expression '/' Expression     { result = CallNode.new(val[0], val[1], [val[2]]) }
  # Unary operators
  | '!' Expression                { result = CallNode.new(val[1], val[0], []) }
  ;

  # Local variables
  GetLocal:
    IDENTIFIER                    { result = GetLocalNode.new(val[0]) }
  ;
  SetLocal:
    IDENTIFIER "=" Expression     { result = SetLocalNode.new(val[0], val[2]) }
  ;  

  # Method definition
  Def:
    DEF IDENTIFIER "(" Parameters ")" Terminator
      Expressions
    END                           { result = DefNode.new(val[1], val[3], val[6]) }
  | DEF IDENTIFIER Terminator
      Expressions
    END                           { result = DefNode.new(val[1], [], val[3]) }
  ;
  
  Parameters:
    IDENTIFIER                    { result = [ val[0] ] }
  | Parameters "," IDENTIFIER     { result = val[0] << val[2] }
  |                               { result = [] }
  ;
  
  # Class definition
  Class:
    CLASS CONSTANT Terminator
      Expressions
    END                           { result = ClassNode.new(val[1], val[3]) }
  ;
  
  # Retrieving the value of a constant
  GetConstant:
    CONSTANT                      { result = GetConstantNode.new(val[0]) }
  ;

  If:
    IF Expression Terminator
      Expressions
    END                           { result = IfNode.new(val[1], val[3], nil) }
  | IF Expression Terminator
      Expressions
    ELSE Terminator
      Expressions
    END                           { result = IfNode.new(val[1], val[3], val[6]) }
  ;

  While:
    WHILE Expression Terminator
      Expressions
    END                           { result = WhileNode.new(val[1], val[3]) }
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