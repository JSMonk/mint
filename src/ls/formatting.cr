module Mint
  module LS
    class Formatting < LSP::RequestMessage
      property params : LSP::DocumentFormattingParams

      def execute(server)
        uri =
          URI.parse(params.text_document.uri)

        workspace =
          Workspace[uri.path.to_s]

        formatted =
          workspace.format(uri.path.to_s)

        # Respond with the formatted document or an empty response message
        # because SublimeText LSP client freezes if an error response is
        # returns for this
        if !workspace.error && formatted
          server.send({
            jsonrpc: "2.0",
            id:      id,
            result:  [
              LSP::TextEdit.new(new_text: formatted, range: LSP::Range.new(
                start: LSP::Position.new(line: 0, character: 0),
                end: LSP::Position.new(line: 9999, character: 999)
              )),
            ],
          })
        else
          server.send({
            jsonrpc: "2.0",
            id:      id,
            result:  [] of String,
          })
        end

        # If there is an error show that
        server.show_message(1, "Could not format the file because it contains errors!") if workspace.error
      end
    end
  end
end
