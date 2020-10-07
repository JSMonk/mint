module Mint
  class Ast
    class CssDefinition < Node
      getter name, value

      def initialize(@value : Array(String | Node),
                     @name : String,
                     @input : Data,
                     @from : Int32,
                     @to : Int32)
      end
    end
  end
end
