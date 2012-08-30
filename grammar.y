# Compile with: racc grammar.y -o parser.rb

class Parser

# Declare tokens produced by the lexer
token IF ELSE
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
  
  # Any list of expressions, class or method body, separated by line breaks.
  # All parsing begins in this rule.
  Expressions:
    /* nothing */                      { result = Nodes.new([]) }
  | Terminator                         { result = Nodes.new([]) }
  | ExpressionList                     { result = Nodes.new(val[0]) }
  ;
  
  ExpressionList:
    Expression                            { result = [ val[0] ] }
  | ExpressionList Terminator Expression  { result = val[0] << val[2] }
    # To ignore trailing line breaks
  | ExpressionList Terminator             { result = val[0] }
  ;
  
  # All tokens that can terminate an expression
  Terminator:
    NEWLINE
  | ";"
  ;

  # All types of expression in our language
  Expression:
    Literal
  | Call
  | Operator
  | Constant
  | Assign
  | Def
  | Class
  | '(' Expression ')'            { result = val[1] }
  ;
  
  # All hard-coded values
  Literal:
    NUMBER                        { result = NumberNode.new(val[0]) }
  | STRING                        { result = StringNode.new(val[0]) }
  | TRUE                          { result = TrueNode.new }
  | FALSE                         { result = FalseNode.new }
  | NIL                           { result = NilNode.new }
  ;
  
  # Method call
  Call:
    # method(1, 2, 3)
    IDENTIFIER Arguments          { result = CallNode.new(nil, val[0], val[1]) }
    # receiver.method(1, 2, 3)
  | Expression '.' IDENTIFIER
      Arguments                   { result = CallNode.new(val[0], val[2], val[3]) }
  ;
  
  Arguments:
    /* nothing */                 { result = [] }
  | '(' ')'                       { result = [] }
  | '(' ArgList ')'               { result = val[1] }
  ;
  
  ArgList:
    Expression                    { result = val }
  | ArgList "," Expression        { result = val[0] << val[2] }
  ;
  
  Operator:
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
  
  # Assignment to a local variable
  Assign:
    IDENTIFIER "=" Expression     { result = AssignNode.new(val[0], val[2]) }
  ;
  
  # Method definition
  Def:
    DEF IDENTIFIER Parameters Terminator
      Expressions
    END                           { result = DefNode.new(val[1], val[2], val[4]) }
  ;
  
  Parameters:
    /* nothing */                 { result = [] }
  | '(' ')'                       { result = [] }
  | '(' ParamList ')'             { result = val[1] }
  ;

  ParamList:
    IDENTIFIER                    { result = val }
  | ParamList "," IDENTIFIER      { result = val[0] << val[2] }
  ;
  
  # Class definition
  Class:
    CLASS CONSTANT Terminator
      Expressions
    END                           { result = ClassNode.new(val[1], val[3]) }
  ;
  
  # Retrieving the value of a constant
  Constant:
    CONSTANT                      { result = ConstantNode.new(val[0]) }
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