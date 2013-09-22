#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.8
# from Racc grammer file "".
#

require 'racc/parser.rb'

  require "lexer"
  require "nodes"

class Parser < Racc::Parser

module_eval(<<'...end grammar.y/module_eval...', 'grammar.y', 174)
  def parse(code, show_tokens=false)
    @tokens = Lexer.new.run(code)
    p @tokens if show_tokens
    do_parse
  end
  
  def next_token
    @tokens.shift
  end
...end grammar.y/module_eval...
##### State transition tables begin ###

racc_action_table = [
    26,    47,    23,    48,    21,    22,    28,    14,    15,    16,
    17,    18,    19,    24,    51,    25,    23,    20,    21,    22,
    53,    14,    15,    16,    17,    18,    19,    24,    95,    25,
    75,    20,    29,    13,    30,    23,    30,    21,    22,    28,
    14,    15,    16,    17,    18,    19,    24,    13,    25,    23,
    20,    21,    22,    30,    14,    15,    16,    17,    18,    19,
    24,    79,    25,   nil,    20,    29,    13,   nil,    23,   nil,
    21,    22,    28,    14,    15,    16,    17,    18,    19,    24,
    13,    25,    23,    20,    21,    22,   nil,    14,    15,    16,
    17,    18,    19,    24,   nil,    25,   nil,    20,    29,    13,
   nil,    23,   nil,    21,    22,    28,    14,    15,    16,    17,
    18,    19,    24,    13,    25,    23,    20,    21,    22,   nil,
    14,    15,    16,    17,    18,    19,    24,   nil,    25,   nil,
    20,    29,    13,   nil,    23,    77,    21,    22,    93,    14,
    15,    16,    17,    18,    19,    24,    13,    25,    23,    20,
    21,    22,   nil,    14,    15,    16,    17,    18,    19,    24,
   nil,    25,   nil,    20,   nil,    13,   nil,    23,    77,    21,
    22,    76,    14,    15,    16,    17,    18,    19,    24,    13,
    25,    23,    20,    21,    22,   nil,    14,    15,    16,    17,
    18,    19,    24,   nil,    25,   nil,    20,   nil,    13,   nil,
    23,    87,    21,    22,    86,    14,    15,    16,    17,    18,
    19,    24,    13,    25,    23,    20,    21,    22,   nil,    14,
    15,    16,    17,    18,    19,    24,   nil,    25,   nil,    20,
   nil,    13,   nil,    23,    45,    21,    22,    44,    14,    15,
    16,    17,    18,    19,    24,    13,    25,    23,    20,    21,
    22,   nil,    14,    15,    16,    17,    18,    19,    24,   nil,
    25,   nil,    20,   nil,    13,   nil,    23,   nil,    21,    22,
   nil,    14,    15,    16,    17,    18,    19,    24,    13,    25,
    23,    20,    21,    22,   nil,    14,    15,    16,    17,    18,
    19,    24,   nil,    25,   nil,    20,   nil,    13,   nil,    23,
   nil,    21,    22,   nil,    14,    15,    16,    17,    18,    19,
    24,    13,    25,    23,    20,    21,    22,   nil,    14,    15,
    16,    17,    18,    19,    24,   nil,    25,   nil,    20,   nil,
    13,   nil,    23,   nil,    21,    22,   nil,    14,    15,    16,
    17,    18,    19,    24,    13,    25,    23,    20,    21,    22,
   nil,    14,    15,    16,    17,    18,    19,    24,   nil,    25,
   nil,    20,   nil,    13,   nil,    23,   nil,    21,    22,   nil,
    14,    15,    16,    17,    18,    19,    24,    13,    25,    23,
    20,    21,    22,   nil,    14,    15,    16,    17,    18,    19,
    24,   nil,    25,   nil,    20,   nil,    13,   nil,    23,   nil,
    21,    22,   nil,    14,    15,    16,    17,    18,    19,    24,
    13,    25,    23,    20,    21,    22,   nil,    14,    15,    16,
    17,    18,    19,    24,   nil,    25,   nil,    20,   nil,    13,
   nil,    23,   nil,    21,    22,   nil,    14,    15,    16,    17,
    18,    19,    24,    13,    25,    23,    20,    21,    22,   nil,
    14,    15,    16,    17,    18,    19,    24,    28,    25,    28,
    20,    91,    13,   nil,    28,   nil,    30,    99,    41,    42,
    39,    40,    90,   nil,   nil,   nil,    13,   nil,    28,    28,
    28,   nil,   nil,    29,    70,    29,    92,   nil,    89,    30,
    29,    41,    42,    39,    40,    35,    36,    37,    38,    33,
    34,    32,    31,    28,    29,    29,    29,    30,   nil,    41,
    42,    39,    40,    30,   nil,    41,    42,    39,    40,    35,
    36,    37,    38,    33,    34,    32,    31,    28,    28,    29,
    30,   nil,    41,    42,   nil,    88,   100,    30,   nil,    41,
    42,    39,    40,    35,    36,    37,    38,    33,    34,    32,
    31,   nil,   nil,    29,    29,    66,    30,   nil,    41,    42,
    39,    40,    35,    36,    37,    38,    33,    34,    32,    31,
    30,   nil,    41,    42,    39,    40,    35,    36,    37,    38,
    33,    34,    32,    31,    30,   nil,    41,    42,    39,    40,
    35,    36,    37,    38,    33,    34,    32,    31,    30,   nil,
    41,    42,    39,    40,    35,    36,    37,    38,    33,    34,
    32,    31,    30,   nil,    41,    42,    39,    40,    35,    36,
    37,    38,    33,    34,    32,    31,    30,   nil,    41,    42,
    39,    40,    35,    36,    37,    38,    33,    34,    32,    30,
   nil,    41,    42,    39,    40,    35,    36,    37,    38,    33,
    34,    30,   nil,    41,    42,    39,    40,    35,    36,    37,
    38,    30,   nil,    41,    42,    39,    40,    35,    36,    37,
    38,    30,   nil,    41,    42,    39,    40,    30,   nil,    41,
    42,    39,    40,    30,   nil,    41,    42 ]

racc_action_check = [
     1,    21,    32,    22,    32,    32,     1,    32,    32,    32,
    32,    32,    32,    32,    26,    32,    96,    32,    96,    96,
    30,    96,    96,    96,    96,    96,    96,    96,    87,    96,
    53,    96,     1,    32,    46,    13,    65,    13,    13,    91,
    13,    13,    13,    13,    13,    13,    13,    96,    13,    94,
    13,    94,    94,    64,    94,    94,    94,    94,    94,    94,
    94,    70,    94,   nil,    94,    91,    13,   nil,    20,   nil,
    20,    20,    86,    20,    20,    20,    20,    20,    20,    20,
    94,    20,    77,    20,    77,    77,   nil,    77,    77,    77,
    77,    77,    77,    77,   nil,    77,   nil,    77,    86,    20,
   nil,    75,   nil,    75,    75,    48,    75,    75,    75,    75,
    75,    75,    75,    77,    75,    23,    75,    23,    23,   nil,
    23,    23,    23,    23,    23,    23,    23,   nil,    23,   nil,
    23,    48,    75,   nil,    25,    84,    25,    25,    84,    25,
    25,    25,    25,    25,    25,    25,    23,    25,    74,    25,
    74,    74,   nil,    74,    74,    74,    74,    74,    74,    74,
   nil,    74,   nil,    74,   nil,    25,   nil,    27,    67,    27,
    27,    67,    27,    27,    27,    27,    27,    27,    27,    74,
    27,    73,    27,    73,    73,   nil,    73,    73,    73,    73,
    73,    73,    73,   nil,    73,   nil,    73,   nil,    27,   nil,
    31,    78,    31,    31,    78,    31,    31,    31,    31,    31,
    31,    31,    73,    31,     0,    31,     0,     0,   nil,     0,
     0,     0,     0,     0,     0,     0,   nil,     0,   nil,     0,
   nil,    31,   nil,    33,    19,    33,    33,    19,    33,    33,
    33,    33,    33,    33,    33,     0,    33,    34,    33,    34,
    34,   nil,    34,    34,    34,    34,    34,    34,    34,   nil,
    34,   nil,    34,   nil,    33,   nil,    71,   nil,    71,    71,
   nil,    71,    71,    71,    71,    71,    71,    71,    34,    71,
    36,    71,    36,    36,   nil,    36,    36,    36,    36,    36,
    36,    36,   nil,    36,   nil,    36,   nil,    71,   nil,    37,
   nil,    37,    37,   nil,    37,    37,    37,    37,    37,    37,
    37,    36,    37,    38,    37,    38,    38,   nil,    38,    38,
    38,    38,    38,    38,    38,   nil,    38,   nil,    38,   nil,
    37,   nil,    39,   nil,    39,    39,   nil,    39,    39,    39,
    39,    39,    39,    39,    38,    39,    40,    39,    40,    40,
   nil,    40,    40,    40,    40,    40,    40,    40,   nil,    40,
   nil,    40,   nil,    39,   nil,    41,   nil,    41,    41,   nil,
    41,    41,    41,    41,    41,    41,    41,    40,    41,    42,
    41,    42,    42,   nil,    42,    42,    42,    42,    42,    42,
    42,   nil,    42,   nil,    42,   nil,    41,   nil,    72,   nil,
    72,    72,   nil,    72,    72,    72,    72,    72,    72,    72,
    42,    72,    44,    72,    44,    44,   nil,    44,    44,    44,
    44,    44,    44,    44,   nil,    44,   nil,    44,   nil,    72,
   nil,    45,   nil,    45,    45,   nil,    45,    45,    45,    45,
    45,    45,    45,    44,    45,    35,    45,    35,    35,   nil,
    35,    35,    35,    35,    35,    35,    35,    47,    35,    97,
    35,    82,    45,   nil,    82,   nil,    59,    97,    59,    59,
    59,    59,    82,   nil,   nil,   nil,    35,   nil,    83,    50,
    81,   nil,   nil,    47,    47,    97,    83,   nil,    81,    50,
    82,    50,    50,    50,    50,    50,    50,    50,    50,    50,
    50,    50,    50,    49,    83,    50,    81,    61,   nil,    61,
    61,    61,    61,    49,   nil,    49,    49,    49,    49,    49,
    49,    49,    49,    49,    49,    49,    49,    80,    98,    49,
    63,   nil,    63,    63,   nil,    80,    98,    43,   nil,    43,
    43,    43,    43,    43,    43,    43,    43,    43,    43,    43,
    43,   nil,   nil,    80,    98,    43,    85,   nil,    85,    85,
    85,    85,    85,    85,    85,    85,    85,    85,    85,    85,
    68,   nil,    68,    68,    68,    68,    68,    68,    68,    68,
    68,    68,    68,    68,     2,   nil,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,    52,   nil,
    52,    52,    52,    52,    52,    52,    52,    52,    52,    52,
    52,    52,    69,   nil,    69,    69,    69,    69,    69,    69,
    69,    69,    69,    69,    69,    69,    54,   nil,    54,    54,
    54,    54,    54,    54,    54,    54,    54,    54,    54,    55,
   nil,    55,    55,    55,    55,    55,    55,    55,    55,    55,
    55,    56,   nil,    56,    56,    56,    56,    56,    56,    56,
    56,    57,   nil,    57,    57,    57,    57,    57,    57,    57,
    57,    58,   nil,    58,    58,    58,    58,    60,   nil,    60,
    60,    60,    60,    62,   nil,    62,    62 ]

racc_action_pointer = [
   212,     0,   568,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,    33,   nil,   nil,   nil,   nil,   nil,   204,
    66,   -11,   -10,   113,   nil,   132,    14,   165,   nil,   nil,
     8,   198,     0,   231,   245,   443,   278,   297,   311,   330,
   344,   363,   377,   521,   410,   429,    18,   451,    99,   497,
   473,   nil,   582,    -3,   610,   623,   635,   645,   655,   450,
   661,   491,   667,   514,    37,    20,   nil,   137,   554,   596,
    49,   264,   396,   179,   146,    99,   nil,    80,   170,   nil,
   521,   474,   458,   472,   104,   540,    66,    16,   nil,   nil,
   nil,    33,   nil,   nil,    47,   nil,    14,   453,   522,   nil,
   nil ]

racc_action_default = [
    -3,   -54,    -1,    -7,    -8,    -9,   -10,   -11,   -12,   -13,
   -14,   -15,   -16,   -54,   -18,   -19,   -20,   -21,   -22,   -42,
   -54,   -54,   -54,   -54,   -52,   -54,   -54,    -4,    -5,    -6,
   -54,   -54,   -54,   -54,   -54,   -54,   -54,   -54,   -54,   -54,
   -54,   -54,   -54,   -54,   -28,   -54,   -41,   -54,   -54,   -54,
   -54,   101,    -2,   -25,   -29,   -30,   -31,   -32,   -33,   -34,
   -35,   -36,   -37,   -38,   -39,   -40,   -17,   -54,   -26,   -43,
   -48,    -3,    -3,    -3,    -3,   -28,   -23,   -54,   -54,   -46,
   -54,   -54,   -54,   -54,   -54,   -27,   -54,   -54,   -45,   -49,
   -50,   -54,   -53,   -24,    -3,   -47,    -3,   -54,   -54,   -44,
   -51 ]

racc_goto_table = [
     1,    43,    71,    72,    73,    74,    67,    78,    46,   nil,
   nil,    49,   nil,    50,   nil,    52,   nil,   nil,   nil,    54,
    55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
    65,   nil,    68,    69,   nil,   nil,   nil,    84,   nil,   nil,
   nil,    94,   nil,   nil,   nil,   nil,    96,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,    68,   nil,    85,   nil,   nil,   nil,   nil,
   nil,    80,    81,    82,    83,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,    97,   nil,    98 ]

racc_goto_check = [
     1,     2,     3,     3,     3,     3,    14,    15,     2,   nil,
   nil,     2,   nil,     2,   nil,     2,   nil,   nil,   nil,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,   nil,     2,     2,   nil,   nil,   nil,    14,   nil,   nil,
   nil,     3,   nil,   nil,   nil,   nil,     3,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,     2,   nil,     2,   nil,   nil,   nil,   nil,
   nil,     1,     1,     1,     1,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,     1,   nil,     1 ]

racc_goto_pointer = [
   nil,     0,   -12,   -45,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   -38,   -63 ]

racc_goto_default = [
   nil,   nil,     2,    27,     3,     4,     5,     6,     7,     8,
     9,    10,    11,    12,   nil,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  1, 36, :_reduce_1,
  3, 36, :_reduce_2,
  0, 36, :_reduce_3,
  2, 36, :_reduce_4,
  1, 38, :_reduce_none,
  1, 38, :_reduce_none,
  1, 37, :_reduce_none,
  1, 37, :_reduce_none,
  1, 37, :_reduce_none,
  1, 37, :_reduce_none,
  1, 37, :_reduce_none,
  1, 37, :_reduce_none,
  1, 37, :_reduce_none,
  1, 37, :_reduce_none,
  1, 37, :_reduce_none,
  1, 37, :_reduce_none,
  3, 37, :_reduce_17,
  1, 39, :_reduce_18,
  1, 39, :_reduce_19,
  1, 39, :_reduce_20,
  1, 39, :_reduce_21,
  1, 39, :_reduce_22,
  4, 40, :_reduce_23,
  6, 40, :_reduce_24,
  3, 40, :_reduce_25,
  1, 49, :_reduce_26,
  3, 49, :_reduce_27,
  0, 49, :_reduce_28,
  3, 41, :_reduce_29,
  3, 41, :_reduce_30,
  3, 41, :_reduce_31,
  3, 41, :_reduce_32,
  3, 41, :_reduce_33,
  3, 41, :_reduce_34,
  3, 41, :_reduce_35,
  3, 41, :_reduce_36,
  3, 41, :_reduce_37,
  3, 41, :_reduce_38,
  3, 41, :_reduce_39,
  3, 41, :_reduce_40,
  2, 41, :_reduce_41,
  1, 43, :_reduce_42,
  3, 44, :_reduce_43,
  8, 45, :_reduce_44,
  5, 45, :_reduce_45,
  1, 50, :_reduce_46,
  3, 50, :_reduce_47,
  0, 50, :_reduce_48,
  5, 46, :_reduce_49,
  5, 47, :_reduce_50,
  8, 47, :_reduce_51,
  1, 42, :_reduce_52,
  5, 48, :_reduce_53 ]

racc_reduce_n = 54

racc_shift_n = 101

racc_token_table = {
  false => 0,
  :error => 1,
  :IF => 2,
  :ELSE => 3,
  :DEF => 4,
  :CLASS => 5,
  :NEWLINE => 6,
  :NUMBER => 7,
  :STRING => 8,
  :TRUE => 9,
  :FALSE => 10,
  :NIL => 11,
  :IDENTIFIER => 12,
  :CONSTANT => 13,
  :END => 14,
  :WHILE => 15,
  "." => 16,
  "!" => 17,
  "*" => 18,
  "/" => 19,
  "+" => 20,
  "-" => 21,
  ">" => 22,
  ">=" => 23,
  "<" => 24,
  "<=" => 25,
  "==" => 26,
  "!=" => 27,
  "&&" => 28,
  "||" => 29,
  "=" => 30,
  "," => 31,
  ";" => 32,
  "(" => 33,
  ")" => 34 }

racc_nt_base = 35

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "IF",
  "ELSE",
  "DEF",
  "CLASS",
  "NEWLINE",
  "NUMBER",
  "STRING",
  "TRUE",
  "FALSE",
  "NIL",
  "IDENTIFIER",
  "CONSTANT",
  "END",
  "WHILE",
  "\".\"",
  "\"!\"",
  "\"*\"",
  "\"/\"",
  "\"+\"",
  "\"-\"",
  "\">\"",
  "\">=\"",
  "\"<\"",
  "\"<=\"",
  "\"==\"",
  "\"!=\"",
  "\"&&\"",
  "\"||\"",
  "\"=\"",
  "\",\"",
  "\";\"",
  "\"(\"",
  "\")\"",
  "$start",
  "Expressions",
  "Expression",
  "Terminator",
  "Literal",
  "Call",
  "Operator",
  "GetConstant",
  "GetLocal",
  "SetLocal",
  "Def",
  "Class",
  "If",
  "While",
  "Arguments",
  "Parameters" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

module_eval(<<'.,.,', 'grammar.y', 46)
  def _reduce_1(val, _values, result)
     result = Nodes.new([ val[0] ]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 47)
  def _reduce_2(val, _values, result)
     result = val[0] << val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 48)
  def _reduce_3(val, _values, result)
     result = Nodes.new([]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 49)
  def _reduce_4(val, _values, result)
     result = val[0] 
    result
  end
.,.,

# reduce 5 omitted

# reduce 6 omitted

# reduce 7 omitted

# reduce 8 omitted

# reduce 9 omitted

# reduce 10 omitted

# reduce 11 omitted

# reduce 12 omitted

# reduce 13 omitted

# reduce 14 omitted

# reduce 15 omitted

# reduce 16 omitted

module_eval(<<'.,.,', 'grammar.y', 68)
  def _reduce_17(val, _values, result)
     result = val[1] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 72)
  def _reduce_18(val, _values, result)
     result = NumberNode.new(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 73)
  def _reduce_19(val, _values, result)
     result = StringNode.new(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 74)
  def _reduce_20(val, _values, result)
     result = TrueNode.new 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 75)
  def _reduce_21(val, _values, result)
     result = FalseNode.new 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 76)
  def _reduce_22(val, _values, result)
     result = NilNode.new 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 81)
  def _reduce_23(val, _values, result)
     result = CallNode.new(nil, val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 84)
  def _reduce_24(val, _values, result)
     result = CallNode.new(val[0], val[2], val[4]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 85)
  def _reduce_25(val, _values, result)
     result = CallNode.new(val[0], val[2], []) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 89)
  def _reduce_26(val, _values, result)
     result = [ val[0] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 90)
  def _reduce_27(val, _values, result)
     result = val[0] << val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 91)
  def _reduce_28(val, _values, result)
     result = [] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 96)
  def _reduce_29(val, _values, result)
     result = CallNode.new(val[0], val[1], [val[2]]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 97)
  def _reduce_30(val, _values, result)
     result = CallNode.new(val[0], val[1], [val[2]]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 98)
  def _reduce_31(val, _values, result)
     result = CallNode.new(val[0], val[1], [val[2]]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 99)
  def _reduce_32(val, _values, result)
     result = CallNode.new(val[0], val[1], [val[2]]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 100)
  def _reduce_33(val, _values, result)
     result = CallNode.new(val[0], val[1], [val[2]]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 101)
  def _reduce_34(val, _values, result)
     result = CallNode.new(val[0], val[1], [val[2]]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 102)
  def _reduce_35(val, _values, result)
     result = CallNode.new(val[0], val[1], [val[2]]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 103)
  def _reduce_36(val, _values, result)
     result = CallNode.new(val[0], val[1], [val[2]]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 106)
  def _reduce_37(val, _values, result)
     result = CallNode.new(val[0], val[1], [val[2]]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 107)
  def _reduce_38(val, _values, result)
     result = CallNode.new(val[0], val[1], [val[2]]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 108)
  def _reduce_39(val, _values, result)
     result = CallNode.new(val[0], val[1], [val[2]]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 109)
  def _reduce_40(val, _values, result)
     result = CallNode.new(val[0], val[1], [val[2]]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 111)
  def _reduce_41(val, _values, result)
     result = CallNode.new(val[1], val[0], []) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 116)
  def _reduce_42(val, _values, result)
     result = GetLocalNode.new(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 119)
  def _reduce_43(val, _values, result)
     result = SetLocalNode.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 126)
  def _reduce_44(val, _values, result)
     result = DefNode.new(val[1], val[3], val[6]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 129)
  def _reduce_45(val, _values, result)
     result = DefNode.new(val[1], [], val[3]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 133)
  def _reduce_46(val, _values, result)
     result = [ val[0] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 134)
  def _reduce_47(val, _values, result)
     result = val[0] << val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 135)
  def _reduce_48(val, _values, result)
     result = [] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 142)
  def _reduce_49(val, _values, result)
     result = ClassNode.new(val[1], val[3]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 148)
  def _reduce_50(val, _values, result)
     result = IfNode.new(val[1], val[3], nil) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 153)
  def _reduce_51(val, _values, result)
     result = IfNode.new(val[1], val[3], val[6]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 158)
  def _reduce_52(val, _values, result)
     result = GetConstantNode.new(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 164)
  def _reduce_53(val, _values, result)
     result = WhileNode.new(val[1], val[3]) 
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

end   # class Parser
