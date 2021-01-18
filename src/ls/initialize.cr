module Mint
  module LS
    class Initialize < LSP::RequestMessage
      property params : LSP::InitializeParams

      def execute(server)
        completion_provider =
          LSP::CompletionOptions.new(
            resolve_provider: true,
            trigger_characters: [] of String)

        text_document_sync =
          LSP::TextDocumentSyncOptions.new(
            save: LSP::SaveOptions.new(include_text: false),
            change: LSP::TextDocumentSyncKind::Full,
            will_save_wait_until: true,
            open_close: true,
            will_save: false)

        signature_help_provider =
          LSP::SignatureHelpOptions.new(trigger_characters: [":"] of String)

        code_lens_provider =
          LSP::CodeLensOptions.new(resolve_provider: false)

        document_on_type_formatting_provider =
          LSP::DocumentOnTypeFormattingOptions.new(
            more_trigger_character: [] of String,
            first_trigger_character: "")

        document_link_provider =
          LSP::DocumentLinkOptions.new(resolve_provider: false)

        execute_command_provider =
          LSP::ExecuteCommandOptions.new(commands: [] of String)

        workspace =
          LSP::Workspace.new(
            workspace_folders: LSP::WorkspaceFolders.new(
              change_notifications: false,
              supported: false))

        capabilities =
          LSP::ServerCapabilities.new(
            document_on_type_formatting_provider: document_on_type_formatting_provider,
            execute_command_provider: execute_command_provider,
            signature_help_provider: signature_help_provider,
            document_link_provider: document_link_provider,
            completion_provider: completion_provider,
            text_document_sync: text_document_sync,
            code_lens_provider: code_lens_provider,
            workspace: workspace,
            document_range_formatting_provider: false,
            document_formatting_provider: true,
            document_highlight_provider: false,
            workspace_symbol_provider: false,
            document_symbol_provider: false,
            type_definition_provider: false,
            implementation_provider: false,
            folding_range_provider: false,
            code_action_provider: false,
            declaration_provider: false,
            definition_provider: false,
            references_provider: false,
            rename_provider: false,
            color_provider: false,
            hover_provider: true)

        LSP::InitializeResult.new(capabilities: capabilities)
      end
    end
  end
end
