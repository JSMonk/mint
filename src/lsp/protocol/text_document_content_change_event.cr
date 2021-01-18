module LSP
  struct TextDocumentContentChangeEvent
    include JSON::Serializable

    # The range of the document that changed.
    property range : Range | Nil

    # The length of the range that got replaced.
    @[JSON::Field(key: "rangeLength")]
    property range_length : Int32 | Nil

    # The new text of the range/document.
    property text : String
  end
end
