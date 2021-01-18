module Mint
  module LS
    class Completion < LSP::RequestMessage
      property params : LSP::CompletionParams

      def completions(node : Ast::Node, global : Bool = false)
        [] of LSP::CompletionItem
      end

      def workspace
        Mint::Workspace[params.path]
      end

      def execute(server)
        global_completions =
          (workspace.ast.stores +
            workspace.ast.modules +
            workspace.ast.components.select(&.global?))
            .map { |node| completions(node, global: true) }
            .flatten

        scope_completions =
          server
            .nodes_at_cursor(params)
            .map { |node| completions(node) }
            .flatten

        component_completions =
          workspace
            .ast
            .components
            .map { |node| completion_item(node) }

        (global_completions + component_completions + scope_completions)
          .compact
          .sort_by { |node| node.label }
      end
    end
  end
end
