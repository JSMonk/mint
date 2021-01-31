module Mint
  class Ast
    module Directives
      class Svg < Node
        getter path
        getter options

        def initialize(path : String,
                       input : Data,
                       from : Int32,
                       to : Int32)
          self.initialize(path, nil, input, from, to)
        end

        def initialize(@path : String,
                       @options : Ast::Node::Record,
                       @input : Data,
                       @from : Int32,
                       @to : Int32)
        end
      end
    end
  end
end
