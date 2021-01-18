module Mint
  module LS
    class Initialize < LSP::RequestMessage
      property params : LSP::InitializeParams

      def execute(server)
        capabilities =
          LSP::ServerCapabilities.new(
            text_document_sync: LSP::TextDocumentSyncOptions.new(
              change: LSP::TextDocumentSyncKind::Full,
              will_save_wait_until: true,
              open_close: true,
              will_save: false,
              save: LSP::SaveOptions.new(include_text: false)),
            hover_provider: true,
            completion_provider: LSP::CompletionOptions.new(
              resolve_provider: true,
              trigger_characters: ["<", "."]),
            signature_help_provider: LSP::SignatureHelpOptions.new(
              trigger_characters: [":"] of String),
            definition_provider: false,
            type_definition_provider: false,
            implementation_provider: false,
            references_provider: false,
            document_highlight_provider: false,
            document_symbol_provider: false,
            workspace_symbol_provider: false,
            code_action_provider: false,
            code_lens_provider: LSP::CodeLensOptions.new(
              resolve_provider: false),
            document_formatting_provider: true,
            document_range_formatting_provider: false,
            document_on_type_formatting_provider: LSP::DocumentOnTypeFormattingOptions.new(
              first_trigger_character: "",
              more_trigger_character: [] of String),
            rename_provider: false,
            document_link_provider: LSP::DocumentLinkOptions.new(
              resolve_provider: false),
            color_provider: false,
            folding_range_provider: false,
            declaration_provider: false,
            execute_command_provider: LSP::ExecuteCommandOptions.new(
              commands: [] of String),
            workspace: LSP::Workspace.new(
              workspace_folders: LSP::WorkspaceFolders.new(
                supported: false,
                change_notifications: false)))

        server.send({
          jsonrpc: "2.0",
          id:      id,
          result:  LSP::InitializeResult.new(capabilities: capabilities),
        })
      end
    end
  end
end
