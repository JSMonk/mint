module Mint
  class Compiler
    def _compile(node : Ast::LabeledArgument) : String
      compile node.value
    end
  end
end

