module Mint
  class Ast
    class LabeledArgument < Node
      getter name

      def initialize(@name : Variable,
                     @value : Expresion,
                     @input : Data,
                     @from : Int32,
                     @to : Int32)
      end
    end
  end
end

