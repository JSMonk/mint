module Mint
  class Parser
    def constant_access : Ast::ModuleAccess?
      start do |start_position|
        name = start do
          value = type_id
          skip unless char! ':'
          value
        end

        skip unless name

        variable =
          constant_variable

        skip unless variable

        Ast::ModuleAccess.new(
          from: start_position,
          variable: variable,
          constant: true,
          to: position,
          input: data,
          name: name)
      end
    end
  end
end
