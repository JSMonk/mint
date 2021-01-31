module Mint
  class Ast
    class Call < Node
      getter arguments, expression
      getter? safe

      property? partially_applied
      property? labeled_call

      def initialize(@arguments : Array(Expression),
                     @partially_applied : Bool,
                     @expression : Expression,
                     @input : Data,
                     @from : Int32,
                     @safe : Bool,
                     @to : Int32)
        @labeled_call = false
      end

      def initialize(@arguments : Array(LabeledArgument),
                     @partially_applied : Bool,
                     @expression : Expression,
                     @input : Data,
                     @from : Int32,
                     @safe : Bool,
                     @to : Int32)
        @labeled_call = true
      end
    end
  end
end
